local title = function(...) print""; print(...) end
local result = function(...) print("result  :", ...) end
local doc = function(...) print("doc said:", ...) end
local function round(n, prec) return tonumber(("%."..(prec or 1).."f"):format(n)) end
local unpack = unpack or table.unpack

local colors = require("colors")

title"Creating a color in HSL space and converting it to RGB"
c = colors.new(130, .8, 0.3) -- green, pretty saturated, somewhat dark
result(tostring(c))
doc("#0f8923")


title"You can also create this color from it's RGB code:"
c = colors.new("#0f8923") -- green, pretty saturated, somewhat dark
result(tostring(c))
doc("#0f8923")


title"Accessing the HSL components:"
result(c.H, c.S, c.L)
result( round(c.H, 0), round(c.S), round(c.L), "(rounded result)")
doc("130", "0.8", "0.3")


title"Changing saturation:"
result(c:desaturate_by(.5) -- set saturation to saturation*.5
)
doc("#2d6b38")

result(c:desaturate_to(.5) -- set saturation to .5
)
doc("#267233")


title"Changing lightness:"
result(c:lighten_by(.5) -- set lightness to lightness*.5
)
doc("#14b72f")

result(c:lighten_to(.5) -- set lightness to .5
)
doc("#19e53b")


title"Changing hue:"
result(c:hue_offset(180) -- shift hue by 180
)
doc("#890f75")


title"Building Color Schemes"
title"For a monochromatic color scheme, we'll just use the color we started with and tints and shades from it:"

tints = c:tints(5) -- make five tints
--for i,t in ipairs(tints) do result(t) end
result(unpack(tints))
doc(
"#16c934",
"#3ee95a",
"#7ef091",
"#bef7c8",
"#ffffff")


title"(make five shades)"
shades = c:shades(5) -- make five shades
--for i,s in ipairs(shades) do print(s) end
result(unpack(shades))
doc(
"#0c6e1c",
"#095215",
"#06370e",
"#031b07",
"#000000")


title"For a complimentary scheme, we can use easily derive a complimentary color and its tints and shades:"
ctints = c:complementary():tints(5) -- make five tints of the complimentary color
--for i,t in ipairs(ctints) do print(t) end
result(unpack(ctints))
doc(
"#c916ac",
"#e93ecd",
"#f07edd",
"#f7beee",
"#ffffff")


title"For less contrast, though, we might want to stick with neighboring colors: e.g., +/- 60 degrees of the starting color:"

n1, n2 = c:neighbors(60)  -- get neiboring colors: 60 degees up and down
--for i,t in ipairs(n1:tints()) do print(t) end
result(unpack(n1:tints()))
doc(
"#16c98e",
"#3ee9b0",
"#7ef0ca",
"#bef7e4",
"#ffffff")

--for i,t in ipairs(n2:tints()) do print(t) end
result(unpack(n2:tints()))
doc(
"#52c916",
"#77e93e",
"#a4f07e",
"#d1f7be",
"#ffffff")


title"We could alternatively generate a split complementary color scheme:"
c1=n1
c2=n2
--for i,t in ipairs(c1:tints()) do print(t) end
result(unpack(c1:tints()))
doc(
"#8e16c9",
"#b03ee9",
"#ca7ef0",
"#e4bef7",
"#ffffff")

--for i,t in ipairs(c2:tints()) do print(t) end
result(unpack(c2:tints()))
doc(
"#c91652",
"#e93e77",
"#f07ea4",
"#f7bed1",
"#ffffff")


title"Or a triadic one:"

t1, t2 = c:triadic()
--for i,t in ipairs(t1:tints()) do print(t) end
result(unpack(t1:tints()))
doc(
"#3416c9",
"#5a3ee9",
"#917ef0",
"#c8bef7",
"#ffffff")

--for i,t in ipairs(t2:tints()) do print(t) end
result(unpack(t2:tints()))
doc(
"#c93416",
"#e95a3e",
"#f0917e",
"#f7c8be",
"#ffffff")
