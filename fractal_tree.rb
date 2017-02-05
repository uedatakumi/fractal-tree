require 'RMagick'
include Magick
include Math

def draw_tree(image, x1, y1, angle, depth)
  return if depth.zero?
  x2 = x1 + (cos(angle) * depth * 4).to_i
  y2 = y1 + (sin(angle) * depth * 4).to_i

  d = Draw.new
  d.stroke("green")
  d.line(x1, y1, x2, y2)
  d.draw(image)

  draw_tree(image, x2, y2, angle - 0.35, depth - 1)
  draw_tree(image, x2, y2, angle + 0.35, depth - 1)
end

def make_image
  image = Image.new(300, 300)
  draw_tree(image, 150, 250, PI / -2, 10)
  image.write("tree.gif")
end

make_image
