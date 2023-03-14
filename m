Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1566B9789
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 15:16:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509639.785815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5Rb-0007Ds-Up; Tue, 14 Mar 2023 14:16:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509639.785815; Tue, 14 Mar 2023 14:16:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5Rb-0007A0-Q4; Tue, 14 Mar 2023 14:16:03 +0000
Received: by outflank-mailman (input) for mailman id 509639;
 Tue, 14 Mar 2023 14:16:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQyL=7G=citrix.com=prvs=430d4338b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pc5RZ-0004aK-MN
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 14:16:02 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bd795609-c272-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 15:15:58 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: bd795609-c272-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678803358;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DJSzXqkcYWpvV0c3oOG1hdU17ww0JumRTjIT/Z/grms=;
  b=fqYVpw/sOejUaL/Oz/nkw/Q015Xz38k1Kw0XL6cK7L8DZBzh3/pGL1x8
   Ed5X2+mp9MHj3fxm6CS2V3G9Fvncdizz3Piw6jyPeYAuciiDj8smRKyx9
   zBnFSsVvZD/YeKrd5x9Q++zyjnG/91K6Sfv2VU9Q26CVimWbNV+oXUu/9
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 100156185
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:7hxAza1iBCzSqEZHdfbD5ctxkn2cJEfYwER7XKvMYLTBsI5bpzQDn
 TMXDGCDPvbYYDf1fY8iOd/loRsB65aHx95gSgtspC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS+HuDgNyo4GlD5gdnOagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfWkgN5
 NpAFwE2TEq7h8SL7ZS8eu5tv5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tM6uimPybHtzr1WNqLBsy2PS0BZwwP7mN9+9ltmiHJ0NxxvG/
 zKbl4j/Kg40EfGa0z6Py2+DluqewAbLe6QwKqLto5aGh3XMnzdOWXX6T2CTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYDX/JAHut87xuCooLR6hycD3IJTRZAbsInr848QTE21
 l6PkMjtDDYpu7qQIU9x7Z/N82n0Y3JMazZfO2ldF1BtD8TfTJ8b1TuMX/A7L5+OrIfNGRfN7
 haNnC8/vuBG5SIU7JmT8VfCijOqg5HGSA8p+wnaNl6YAhNFiJ2NPNLxtwWChRpUBMPAFwTa4
 iBY8ySLxLpWZaxhghBhVwnk8FuBw/+eeAPRjld0d3XK32T8oiXzFWy8DdwXGauIDirmUWW0C
 KMwkVkLjHO2AJdNRf4fXm5JI552pZUM7Py8PhwuUvJAY4JqaCiM9zx0aEib0gjFyRZzwf5kY
 8jBK5v1VB727JiLKxLnL9rxLJdxnnxurY8tbcmTI+ubPUq2OyfOFOZt3KqmZeEl9qKUyDjoH
 yJkH5LSkX13CbSuChQ7BKZPdTjm21BnX8GpwyGWH8bfSjdb9JYJUK+JkOpxJtI4z8y4VI7gp
 xmAZ6OR83Kn7VWvFOlAQik7M9sDgb4XQaoHABER
IronPort-HdrOrdr: A9a23:cLYCVK5HhzV+GS33UgPXwM3XdLJyesId70hD6qkRc20yTiX2rb
 HLoB1273/JYU8qOU3I+urwX5VoI0m3yXcd2+B4VotKOjOW21dAR7sSiLcKrQeQeREWwdQx6U
 6wScZD4IyZNzdHZZiT2mWFL+o=
X-IronPort-AV: E=Sophos;i="5.98,260,1673931600"; 
   d="scan'208";a="100156185"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Bernhard Kaindl
	<bernhard.kaindl@citrix.com>
Subject: [PATCH 3/7] tools: Delete trailing whitespace in python scripts
Date: Tue, 14 Mar 2023 14:15:16 +0000
Message-ID: <20230314141520.3652451-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230314141520.3652451-1-andrew.cooper3@citrix.com>
References: <20230314141520.3652451-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 tools/misc/xencov_split            |   1 -
 tools/pygrub/src/ExtLinuxConf.py   |   2 +-
 tools/pygrub/src/GrubConf.py       |  30 ++---
 tools/pygrub/src/fsimage/fsimage.c |   8 +-
 tools/pygrub/src/pygrub            |  44 +++----
 tools/python/xen/lowlevel/xc/xc.c  | 200 ++++++++++++++---------------
 tools/python/xen/lowlevel/xs/xs.c  |   4 +-
 tools/xenmon/xenmon.py             |  44 +++----
 8 files changed, 166 insertions(+), 167 deletions(-)

diff --git a/tools/misc/xencov_split b/tools/misc/xencov_split
index 5771f6cfc285..e4f68ebb6eda 100755
--- a/tools/misc/xencov_split
+++ b/tools/misc/xencov_split
@@ -94,4 +94,3 @@ if __name__ == "__main__":
         sys.exit(1)
     except KeyboardInterrupt:
         sys.exit(1)
-
diff --git a/tools/pygrub/src/ExtLinuxConf.py b/tools/pygrub/src/ExtLinuxConf.py
index 9fd635b9cf7a..4e990a9304b6 100644
--- a/tools/pygrub/src/ExtLinuxConf.py
+++ b/tools/pygrub/src/ExtLinuxConf.py
@@ -207,7 +207,7 @@ class ExtLinuxConfigFile(object):
                  "f1": None,
                  "f2": None,
                  }
-        
+
 if __name__ == "__main__":
     if len(sys.argv) < 2:
         raise RuntimeError("Need a configuration file to read")
diff --git a/tools/pygrub/src/GrubConf.py b/tools/pygrub/src/GrubConf.py
index 73f1bbed2f54..580c9628ca64 100644
--- a/tools/pygrub/src/GrubConf.py
+++ b/tools/pygrub/src/GrubConf.py
@@ -95,7 +95,7 @@ class _GrubImage(object):
         self.title = title.strip()
 
     def __repr__(self):
-        return ("title: %s\n" 
+        return ("title: %s\n"
                 "  root: %s\n"
                 "  kernel: %s\n"
                 "  args: %s\n"
@@ -140,7 +140,7 @@ class _GrubImage(object):
 class GrubImage(_GrubImage):
     def __init__(self, title, lines):
         _GrubImage.__init__(self, title, lines)
-    
+
     def set_from_line(self, line, replace = None):
         (com, arg) = grub_exact_split(line, 2)
 
@@ -265,7 +265,7 @@ class _GrubConfigFile(object):
 class GrubConfigFile(_GrubConfigFile):
     def __init__(self, fn = None):
         _GrubConfigFile.__init__(self,fn)
-        
+
     def new_image(self, title, lines):
         return GrubImage(title, lines)
 
@@ -297,7 +297,7 @@ class GrubConfigFile(_GrubConfigFile):
                 img = []
                 title = l[6:]
                 continue
-                
+
             if img is not None:
                 img.append(l)
                 continue
@@ -310,7 +310,7 @@ class GrubConfigFile(_GrubConfigFile):
                     logging.info("Ignored directive %s" %(com,))
             else:
                 logging.warning("Unknown directive %s" %(com,))
-                
+
         if img:
             self.add_image(GrubImage(title, img))
 
@@ -322,7 +322,7 @@ def grub2_handle_set(arg):
     com="set:" + com
     m = re.match("([\"\'])(.*)\\1", arg)
     if m is not None:
-        arg=m.group(2) 
+        arg=m.group(2)
     return (com,arg)
 
 class Grub2Image(_GrubImage):
@@ -334,7 +334,7 @@ class Grub2Image(_GrubImage):
 
         if com == "set":
             (com,arg) = grub2_handle_set(arg)
-            
+
         if com in self.commands:
             if self.commands[com] is not None:
                 setattr(self, self.commands[com], arg.strip())
@@ -351,7 +351,7 @@ class Grub2Image(_GrubImage):
         else:
             self.lines.pop(replace)
             self.lines.insert(replace, line)
-                
+
     commands = {'set:root': 'root',
                 'linux': 'kernel',
                 'linux16': 'kernel',
@@ -360,14 +360,14 @@ class Grub2Image(_GrubImage):
                 'echo': None,
                 'insmod': None,
                 'search': None}
-    
+
 class Grub2ConfigFile(_GrubConfigFile):
     def __init__(self, fn = None):
         _GrubConfigFile.__init__(self, fn)
-       
+
     def new_image(self, title, lines):
         return Grub2Image(title, lines)
- 
+
     def parse(self, buf = None):
         if buf is None:
             if self.filename is None:
@@ -431,10 +431,10 @@ class Grub2ConfigFile(_GrubConfigFile):
                 continue
 
             (com, arg) = grub_exact_split(l, 2)
-        
+
             if com == "set":
                 (com,arg) = grub2_handle_set(arg)
-                
+
             if com in self.commands:
                 if self.commands[com] is not None:
                     arg_strip = arg.strip()
@@ -448,7 +448,7 @@ class Grub2ConfigFile(_GrubConfigFile):
                 pass
             else:
                 logging.warning("Unknown directive %s" %(com,))
-            
+
         if img is not None:
             raise RuntimeError("syntax error: end of file with open menuentry(%d %s)" % (len(img),img))
 
@@ -466,7 +466,7 @@ class Grub2ConfigFile(_GrubConfigFile):
                 'if': None,
                 'fi': None,
                 }
-        
+
 if __name__ == "__main__":
     if len(sys.argv) < 3:
         raise RuntimeError('Need a grub version ("grub" or "grub2") and a grub.conf or grub.cfg to read')
diff --git a/tools/pygrub/src/fsimage/fsimage.c b/tools/pygrub/src/fsimage/fsimage.c
index 2ebbbe35df92..fdcfa1a3c040 100644
--- a/tools/pygrub/src/fsimage/fsimage.c
+++ b/tools/pygrub/src/fsimage/fsimage.c
@@ -31,7 +31,7 @@ typedef struct fsimage_fs {
 	fsi_t *fs;
 } fsimage_fs_t;
 
-typedef struct fsimage_file { 
+typedef struct fsimage_file {
 	PyObject_HEAD
 	fsimage_fs_t *fs;
 	fsi_file_t *file;
@@ -47,7 +47,7 @@ fsimage_file_read(fsimage_file_t *file, PyObject *args, PyObject *kwargs)
 	ssize_t bytesread = 0;
 	PyObject * buffer;
 
-	if (!PyArg_ParseTupleAndKeywords(args, kwargs, "|iL", kwlist, 
+	if (!PyArg_ParseTupleAndKeywords(args, kwargs, "|iL", kwlist,
 	    &size, &offset))
 		return (NULL);
 
@@ -62,7 +62,7 @@ fsimage_file_read(fsimage_file_t *file, PyObject *args, PyObject *kwargs)
 
 	if (buffer == NULL)
 		return (NULL);
- 
+
 	while (1) {
 		int err;
 		void *buf =
@@ -255,7 +255,7 @@ fsimage_open(PyObject *o, PyObject *args, PyObject *kwargs)
 	uint64_t offset = 0;
 	fsimage_fs_t *fs;
 
-	if (!PyArg_ParseTupleAndKeywords(args, kwargs, "s|Ls", kwlist, 
+	if (!PyArg_ParseTupleAndKeywords(args, kwargs, "s|Ls", kwlist,
 	    &name, &offset, &options))
 		return (NULL);
 
diff --git a/tools/pygrub/src/pygrub b/tools/pygrub/src/pygrub
index ce7ab0eb8cf3..a759d90ade5e 100755
--- a/tools/pygrub/src/pygrub
+++ b/tools/pygrub/src/pygrub
@@ -46,7 +46,7 @@ def enable_cursor(ison):
         val = 2
     else:
         val = 0
-        
+
     try:
         curses.curs_set(val)
     except _curses.error:
@@ -114,7 +114,7 @@ FDISK_PART_GPT=0xee
 def get_partition_offsets(file):
     image_type = identify_disk_image(file)
     if image_type == DISK_TYPE_RAW:
-        # No MBR: assume whole disk filesystem, which is like a 
+        # No MBR: assume whole disk filesystem, which is like a
         # single partition starting at 0
         return [0]
     elif image_type == DISK_TYPE_HYBRIDISO:
@@ -135,7 +135,7 @@ def get_partition_offsets(file):
         partbuf = buf[poff:poff+16]
         offset  = struct.unpack("<L", partbuf[8:12])[0] * SECTOR_SIZE
         type    = struct.unpack("<B", partbuf[4:5])[0]
-        
+
         # offset == 0 implies this partition is not enabled
         if offset == 0:
             continue
@@ -171,7 +171,7 @@ class GrubLineEditor(curses.textpad.Textbox):
         screen.noutrefresh()
         win = curses.newwin(1, 74, startx, starty + 2)
         curses.textpad.Textbox.__init__(self, win)
-        
+
         self.line = list(line)
         self.pos = len(line)
         self.cancelled = False
@@ -237,7 +237,7 @@ class GrubLineEditor(curses.textpad.Textbox):
         if self.cancelled:
             return None
         return string.join(self.line, "")
-        
+
 
 class Grub:
     ENTRY_WIN_LINES = 8
@@ -261,7 +261,7 @@ class Grub:
             self.entry_win = curses.newwin(Grub.ENTRY_WIN_LINES + 2, 74, 2, 1)
             self.text_win = curses.newwin(10, 70, 12, 5)
             curses.def_prog_mode()
-        
+
         curses.reset_prog_mode()
         self.screen.erase()
 
@@ -279,7 +279,7 @@ class Grub:
             self.start_image = self.selected_image
         if self.selected_image < self.start_image:
             self.start_image = self.selected_image
-        
+
         for y in range(self.start_image, len(self.cf.images)):
             i = self.cf.images[y]
             if y > self.start_image + maxy:
@@ -329,7 +329,7 @@ class Grub:
                 l = img.lines[idx].expandtabs().ljust(70)
                 if len(l) > 70:
                     l = l[:69] + ">"
-                    
+
                 self.entry_win.addstr(idp, 2, l)
                 if idx == curline:
                     self.entry_win.attroff(curses.A_REVERSE)
@@ -367,7 +367,7 @@ class Grub:
                 self.command_line_mode()
                 if self.isdone:
                     return
-                
+
             # bound at the top and bottom
             if curline < 0:
                 curline = 0
@@ -400,7 +400,7 @@ class Grub:
         lines = []
         while 1:
             t = GrubLineEditor(self.screen, y, 2)
-            enable_cursor(True)            
+            enable_cursor(True)
             ret = t.edit()
             if ret:
                 if ret in ("quit", "return"):
@@ -410,7 +410,7 @@ class Grub:
                     lines.append(ret)
                     continue
 
-                # if we got boot, then we want to boot the entered image 
+                # if we got boot, then we want to boot the entered image
                 img = self.cf.new_image("entered", lines)
                 self.cf.add_image(img)
                 self.selected_image = len(self.cf.images) - 1
@@ -423,7 +423,7 @@ class Grub:
     def read_config(self, fn, fs = None):
         """Read the given file to parse the config.  If fs = None, then
         we're being given a raw config file rather than a disk image."""
-        
+
         if not os.access(fn, os.R_OK):
             raise RuntimeError("Unable to access %s" %(fn,))
 
@@ -499,7 +499,7 @@ class Grub:
         while not self.isdone:
             self.run_main(timeout)
             timeout = -1
-            
+
         return self.selected_image
 
     def run_main(self, timeout = -1):
@@ -529,7 +529,7 @@ class Grub:
         self.start_image = 0
         while (timeout == -1 or mytime < int(timeout)):
             draw()
-            if timeout != -1 and mytime != -1: 
+            if timeout != -1 and mytime != -1:
                 self.screen.addstr(20, 5, "Will boot selected entry in %2d seconds"
                                    %(int(timeout) - mytime))
             else:
@@ -600,7 +600,7 @@ class Grub:
                 self.selected_image = 0
             elif self.selected_image >= len(self.cf.images):
                 self.selected_image = len(self.cf.images) - 1
-        
+
 def get_entry_idx(cf, entry):
     # first, see if the given entry is numeric
     try:
@@ -697,10 +697,10 @@ def sniff_solaris(fs, cfg):
     # Unpleasant. Typically we'll have 'root=foo -k' or 'root=foo /kernel -k',
     # and we need to maintain Xen properties (root= and ip=) and the kernel
     # before any user args.
-    
+
     xenargs = ""
     userargs = ""
-    
+
     if not cfg["args"]:
         cfg["args"] = cfg["kernel"]
     else:
@@ -712,7 +712,7 @@ def sniff_solaris(fs, cfg):
         cfg["args"] = xenargs + " " + cfg["kernel"] + " " + userargs
 
     return cfg
- 
+
 def sniff_netware(fs, cfg):
     if not fs.file_exists("/nwserver/xnloader.sys"):
         return cfg
@@ -729,7 +729,7 @@ def format_sxp(kernel, ramdisk, args):
     if args:
         s += "(args %s)" % repr(args)
     return s
-                
+
 def format_simple(kernel, ramdisk, args, sep):
     for check in (kernel, ramdisk, args):
         if check is not None and sep in check:
@@ -744,7 +744,7 @@ def format_simple(kernel, ramdisk, args, sep):
 
 if __name__ == "__main__":
     sel = None
-    
+
     def usage():
         print("Usage: %s [-q|--quiet] [-i|--interactive] [-l|--list-entries] [-n|--not-really] [--output=] [--kernel=] [--ramdisk=] [--args=] [--entry=] [--output-directory=] [--output-format=sxp|simple|simple0] [--offset=] <image>" %(sys.argv[0],), file=sys.stderr)
 
@@ -783,7 +783,7 @@ if __name__ == "__main__":
         opts, args = getopt.gnu_getopt(sys.argv[1:], 'qilnh::',
                                    ["quiet", "interactive", "list-entries", "not-really", "help",
                                     "output=", "output-format=", "output-directory=", "offset=",
-                                    "entry=", "kernel=", 
+                                    "entry=", "kernel=",
                                     "ramdisk=", "args=", "isconfig", "debug"])
     except getopt.GetoptError:
         usage()
@@ -967,4 +967,4 @@ if __name__ == "__main__":
         os.write(fd, ostring)
     else:
         os.write(fd, ostring.encode())
-    
+
diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowlevel/xc/xc.c
index cfb2734a992b..e3a0c13bac31 100644
--- a/tools/python/xen/lowlevel/xc/xc.c
+++ b/tools/python/xen/lowlevel/xc/xc.c
@@ -1,6 +1,6 @@
 /******************************************************************************
  * Xc.c
- * 
+ *
  * Copyright (c) 2003-2004, K A Fraser (University of Cambridge)
  */
 
@@ -108,7 +108,7 @@ static PyObject *pyxc_domain_dumpcore(XcObject *self, PyObject *args)
 
     if ( xc_domain_dumpcore(self->xc_handle, dom, corefile) != 0 )
         return pyxc_error_to_exception(self->xc_handle);
-    
+
     Py_INCREF(zero);
     return zero;
 }
@@ -143,7 +143,7 @@ static PyObject *pyxc_domain_create(XcObject *self,
         return NULL;
     if ( pyhandle != NULL )
     {
-        if ( !PyList_Check(pyhandle) || 
+        if ( !PyList_Check(pyhandle) ||
              (PyList_Size(pyhandle) != sizeof(xen_domain_handle_t)) )
             goto out_exception;
 
@@ -191,7 +191,7 @@ static PyObject *pyxc_domain_max_vcpus(XcObject *self, PyObject *args)
 
     if (xc_domain_max_vcpus(self->xc_handle, dom, max) != 0)
         return pyxc_error_to_exception(self->xc_handle);
-    
+
     Py_INCREF(zero);
     return zero;
 }
@@ -226,7 +226,7 @@ static PyObject *pyxc_domain_shutdown(XcObject *self, PyObject *args)
 
     if ( xc_domain_shutdown(self->xc_handle, dom, reason) != 0 )
         return pyxc_error_to_exception(self->xc_handle);
-    
+
     Py_INCREF(zero);
     return zero;
 }
@@ -258,7 +258,7 @@ static PyObject *pyxc_vcpu_setaffinity(XcObject *self,
 
     static char *kwd_list[] = { "domid", "vcpu", "cpumap", NULL };
 
-    if ( !PyArg_ParseTupleAndKeywords(args, kwds, "i|iO", kwd_list, 
+    if ( !PyArg_ParseTupleAndKeywords(args, kwds, "i|iO", kwd_list,
                                       &dom, &vcpu, &cpulist) )
         return NULL;
 
@@ -272,7 +272,7 @@ static PyObject *pyxc_vcpu_setaffinity(XcObject *self,
 
     if ( (cpulist != NULL) && PyList_Check(cpulist) )
     {
-        for ( i = 0; i < PyList_Size(cpulist); i++ ) 
+        for ( i = 0; i < PyList_Size(cpulist); i++ )
         {
             long cpu = PyLongOrInt_AsLong(PyList_GetItem(cpulist, i));
             if ( cpu < 0 || cpu >= nr_cpus )
@@ -285,7 +285,7 @@ static PyObject *pyxc_vcpu_setaffinity(XcObject *self,
             cpumap[cpu / 8] |= 1 << (cpu % 8);
         }
     }
-  
+
     if ( xc_vcpu_setaffinity(self->xc_handle, dom, vcpu, cpumap,
                              NULL, XEN_VCPUAFFINITY_HARD) != 0 )
     {
@@ -293,7 +293,7 @@ static PyObject *pyxc_vcpu_setaffinity(XcObject *self,
         return pyxc_error_to_exception(self->xc_handle);
     }
     Py_INCREF(zero);
-    free(cpumap); 
+    free(cpumap);
     return zero;
 }
 
@@ -307,7 +307,7 @@ static PyObject *pyxc_domain_sethandle(XcObject *self, PyObject *args)
     if (!PyArg_ParseTuple(args, "iO", &dom, &pyhandle))
         return NULL;
 
-    if ( !PyList_Check(pyhandle) || 
+    if ( !PyList_Check(pyhandle) ||
          (PyList_Size(pyhandle) != sizeof(xen_domain_handle_t)) )
     {
         goto out_exception;
@@ -323,7 +323,7 @@ static PyObject *pyxc_domain_sethandle(XcObject *self, PyObject *args)
 
     if (xc_domain_sethandle(self->xc_handle, dom, handle) < 0)
         return pyxc_error_to_exception(self->xc_handle);
-    
+
     Py_INCREF(zero);
     return zero;
 
@@ -345,7 +345,7 @@ static PyObject *pyxc_domain_getinfo(XcObject *self,
     xc_dominfo_t *info;
 
     static char *kwd_list[] = { "first_dom", "max_doms", NULL };
-    
+
     if ( !PyArg_ParseTupleAndKeywords(args, kwds, "|ii", kwd_list,
                                       &first_dom, &max_doms) )
         return NULL;
@@ -418,7 +418,7 @@ static PyObject *pyxc_vcpu_getinfo(XcObject *self,
     int nr_cpus;
 
     static char *kwd_list[] = { "domid", "vcpu", NULL };
-    
+
     if ( !PyArg_ParseTupleAndKeywords(args, kwds, "i|i", kwd_list,
                                       &dom, &vcpu) )
         return NULL;
@@ -473,7 +473,7 @@ static PyObject *pyxc_hvm_param_get(XcObject *self,
     int param;
     uint64_t value;
 
-    static char *kwd_list[] = { "domid", "param", NULL }; 
+    static char *kwd_list[] = { "domid", "param", NULL };
     if ( !PyArg_ParseTupleAndKeywords(args, kwds, "ii", kwd_list,
                                       &dom, &param) )
         return NULL;
@@ -493,7 +493,7 @@ static PyObject *pyxc_hvm_param_set(XcObject *self,
     int param;
     uint64_t value;
 
-    static char *kwd_list[] = { "domid", "param", "value", NULL }; 
+    static char *kwd_list[] = { "domid", "param", "value", NULL };
     if ( !PyArg_ParseTupleAndKeywords(args, kwds, "iiL", kwd_list,
                                       &dom, &param, &value) )
         return NULL;
@@ -663,7 +663,7 @@ static PyObject *pyxc_get_device_group(XcObject *self,
 
     if ( rc < 0 )
     {
-        free(sdev_array); 
+        free(sdev_array);
         return pyxc_error_to_exception(self->xc_handle);
     }
 
@@ -786,7 +786,7 @@ static PyObject *pyxc_physdev_pci_access_modify(XcObject *self,
 
     static char *kwd_list[] = { "domid", "bus", "dev", "func", "enable", NULL };
 
-    if ( !PyArg_ParseTupleAndKeywords(args, kwds, "iiiii", kwd_list, 
+    if ( !PyArg_ParseTupleAndKeywords(args, kwds, "iiiii", kwd_list,
                                       &dom, &bus, &dev, &func, &enable) )
         return NULL;
 
@@ -901,7 +901,7 @@ static PyObject *pyxc_physinfo(XcObject *self)
                             "nr_nodes",         pinfo.nr_nodes,
                             "threads_per_core", pinfo.threads_per_core,
                             "cores_per_socket", pinfo.cores_per_socket,
-                            "nr_cpus",          pinfo.nr_cpus, 
+                            "nr_cpus",          pinfo.nr_cpus,
                             "total_memory",     pages_to_kib(pinfo.total_pages),
                             "free_memory",      pages_to_kib(pinfo.free_pages),
                             "scrub_memory",     pages_to_kib(pinfo.scrub_pages),
@@ -1191,13 +1191,13 @@ static PyObject *pyxc_shadow_control(PyObject *self,
 
     static char *kwd_list[] = { "dom", "op", NULL };
 
-    if ( !PyArg_ParseTupleAndKeywords(args, kwds, "i|i", kwd_list, 
+    if ( !PyArg_ParseTupleAndKeywords(args, kwds, "i|i", kwd_list,
                                       &dom, &op) )
         return NULL;
-    
+
     if ( xc_shadow_control(xc->xc_handle, dom, op, NULL, 0) < 0 )
         return pyxc_error_to_exception(xc->xc_handle);
-    
+
     Py_INCREF(zero);
     return zero;
 }
@@ -1214,26 +1214,26 @@ static PyObject *pyxc_shadow_mem_control(PyObject *self,
 
     static char *kwd_list[] = { "dom", "mb", NULL };
 
-    if ( !PyArg_ParseTupleAndKeywords(args, kwds, "i|i", kwd_list, 
+    if ( !PyArg_ParseTupleAndKeywords(args, kwds, "i|i", kwd_list,
                                       &dom, &mbarg) )
         return NULL;
-    
-    if ( mbarg < 0 ) 
+
+    if ( mbarg < 0 )
         op = XEN_DOMCTL_SHADOW_OP_GET_ALLOCATION;
-    else 
+    else
     {
         mb = mbarg;
         op = XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION;
     }
     if ( xc_shadow_control(xc->xc_handle, dom, op, &mb, 0) < 0 )
         return pyxc_error_to_exception(xc->xc_handle);
-    
+
     mbarg = mb;
     return Py_BuildValue("i", mbarg);
 }
 
 static PyObject *pyxc_sched_id_get(XcObject *self) {
-    
+
     int sched_id;
     if (xc_sched_id(self->xc_handle, &sched_id) != 0)
         return PyErr_SetFromErrno(xc_error_obj);
@@ -1251,10 +1251,10 @@ static PyObject *pyxc_sched_credit_domain_set(XcObject *self,
     static char *kwd_list[] = { "domid", "weight", "cap", NULL };
     static char kwd_type[] = "I|HH";
     struct xen_domctl_sched_credit sdom;
-    
+
     weight = 0;
     cap = (uint16_t)~0U;
-    if( !PyArg_ParseTupleAndKeywords(args, kwds, kwd_type, kwd_list, 
+    if( !PyArg_ParseTupleAndKeywords(args, kwds, kwd_type, kwd_list,
                                      &domid, &weight, &cap) )
         return NULL;
 
@@ -1272,10 +1272,10 @@ static PyObject *pyxc_sched_credit_domain_get(XcObject *self, PyObject *args)
 {
     uint32_t domid;
     struct xen_domctl_sched_credit sdom;
-    
+
     if( !PyArg_ParseTuple(args, "I", &domid) )
         return NULL;
-    
+
     if ( xc_sched_credit_domain_get(self->xc_handle, domid, &sdom) != 0 )
         return pyxc_error_to_exception(self->xc_handle);
 
@@ -1336,7 +1336,7 @@ static PyObject *pyxc_domain_setmaxmem(XcObject *self, PyObject *args)
 
     if (xc_domain_setmaxmem(self->xc_handle, dom, maxmem_kb) != 0)
         return pyxc_error_to_exception(self->xc_handle);
-    
+
     Py_INCREF(zero);
     return zero;
 }
@@ -1349,12 +1349,12 @@ static PyObject *pyxc_domain_set_target_mem(XcObject *self, PyObject *args)
     if (!PyArg_ParseTuple(args, "ii", &dom, &mem_kb))
         return NULL;
 
-    mem_pages = mem_kb / 4; 
+    mem_pages = mem_kb / 4;
 
     if (xc_domain_set_pod_target(self->xc_handle, dom, mem_pages,
 				 NULL, NULL, NULL) != 0)
         return pyxc_error_to_exception(self->xc_handle);
-    
+
     Py_INCREF(zero);
     return zero;
 }
@@ -1369,7 +1369,7 @@ static PyObject *pyxc_domain_set_memmap_limit(XcObject *self, PyObject *args)
 
     if ( xc_domain_set_memmap_limit(self->xc_handle, dom, maplimit_kb) != 0 )
         return pyxc_error_to_exception(self->xc_handle);
-    
+
     Py_INCREF(zero);
     return zero;
 }
@@ -1383,7 +1383,7 @@ static PyObject *pyxc_domain_ioport_permission(XcObject *self,
 
     static char *kwd_list[] = { "domid", "first_port", "nr_ports", "allow_access", NULL };
 
-    if ( !PyArg_ParseTupleAndKeywords(args, kwds, "iiii", kwd_list, 
+    if ( !PyArg_ParseTupleAndKeywords(args, kwds, "iiii", kwd_list,
                                       &dom, &first_port, &nr_ports, &allow_access) )
         return NULL;
 
@@ -1406,7 +1406,7 @@ static PyObject *pyxc_domain_irq_permission(PyObject *self,
 
     static char *kwd_list[] = { "domid", "pirq", "allow_access", NULL };
 
-    if ( !PyArg_ParseTupleAndKeywords(args, kwds, "iii", kwd_list, 
+    if ( !PyArg_ParseTupleAndKeywords(args, kwds, "iii", kwd_list,
                                       &dom, &pirq, &allow_access) )
         return NULL;
 
@@ -1429,7 +1429,7 @@ static PyObject *pyxc_domain_iomem_permission(PyObject *self,
 
     static char *kwd_list[] = { "domid", "first_pfn", "nr_pfns", "allow_access", NULL };
 
-    if ( !PyArg_ParseTupleAndKeywords(args, kwds, "illi", kwd_list, 
+    if ( !PyArg_ParseTupleAndKeywords(args, kwds, "illi", kwd_list,
                                       &dom, &first_pfn, &nr_pfns, &allow_access) )
         return NULL;
 
@@ -1480,7 +1480,7 @@ static PyObject *pyxc_domain_send_trigger(XcObject *self,
 
     static char *kwd_list[] = { "domid", "trigger", "vcpu", NULL };
 
-    if ( !PyArg_ParseTupleAndKeywords(args, kwds, "ii|i", kwd_list, 
+    if ( !PyArg_ParseTupleAndKeywords(args, kwds, "ii|i", kwd_list,
                                       &dom, &trigger, &vcpu) )
         return NULL;
 
@@ -1534,7 +1534,7 @@ static PyObject *pyxc_dom_set_memshr(XcObject *self, PyObject *args)
 
     if (xc_memshr_control(self->xc_handle, dom, enable) != 0)
         return pyxc_error_to_exception(self->xc_handle);
-    
+
     Py_INCREF(zero);
     return zero;
 }
@@ -1758,11 +1758,11 @@ static PyObject *pyflask_sid_to_context(PyObject *self, PyObject *args,
     if (!xc_handle) {
         return PyErr_SetFromErrno(xc_error_obj);
     }
-    
+
     ret = xc_flask_sid_to_context(xc_handle, sid, ctx, ctx_len);
-    
+
     xc_interface_close(xc_handle);
-    
+
     if ( ret != 0 ) {
         errno = -ret;
         return PyErr_SetFromErrno(xc_error_obj);
@@ -1779,7 +1779,7 @@ static PyObject *pyflask_load(PyObject *self, PyObject *args, PyObject *kwds)
     int ret;
 
     static char *kwd_list[] = { "policy", NULL };
-  
+
     if( !PyArg_ParseTupleAndKeywords(args, kwds, "s#", kwd_list, &policy, &len) )
         return NULL;
 
@@ -1809,11 +1809,11 @@ static PyObject *pyflask_getenforce(PyObject *self)
     if (!xc_handle) {
         return PyErr_SetFromErrno(xc_error_obj);
     }
-    
+
     ret = xc_flask_getenforce(xc_handle);
-    
+
     xc_interface_close(xc_handle);
-    
+
     if ( ret < 0 ) {
         errno = -ret;
         return PyErr_SetFromErrno(xc_error_obj);
@@ -1839,11 +1839,11 @@ static PyObject *pyflask_setenforce(PyObject *self, PyObject *args,
     if (!xc_handle) {
         return PyErr_SetFromErrno(xc_error_obj);
     }
-    
+
     ret = xc_flask_setenforce(xc_handle, mode);
-    
+
     xc_interface_close(xc_handle);
-    
+
     if ( ret != 0 ) {
         errno = -ret;
         return PyErr_SetFromErrno(xc_error_obj);
@@ -1861,7 +1861,7 @@ static PyObject *pyflask_access(PyObject *self, PyObject *args,
     uint32_t req, allowed, decided, auditallow, auditdeny, seqno;
     int ret;
 
-    static char *kwd_list[] = { "src_context", "tar_context", 
+    static char *kwd_list[] = { "src_context", "tar_context",
                                 "tar_class", "req_permissions",
                                 "decided", "auditallow","auditdeny",
                                 "seqno", NULL };
@@ -1875,10 +1875,10 @@ static PyObject *pyflask_access(PyObject *self, PyObject *args,
     if (!xc_handle) {
         return PyErr_SetFromErrno(xc_error_obj);
     }
-    
+
     ret = xc_flask_access(xc_handle, scon, tcon, tclass, req, &allowed, &decided,
                         &auditallow, &auditdeny, &seqno);
-        
+
     xc_interface_close(xc_handle);
 
     if ( ret != 0 ) {
@@ -1890,14 +1890,14 @@ static PyObject *pyflask_access(PyObject *self, PyObject *args,
 }
 
 static PyMethodDef pyxc_methods[] = {
-    { "domain_create", 
-      (PyCFunction)pyxc_domain_create, 
+    { "domain_create",
+      (PyCFunction)pyxc_domain_create,
       METH_VARARGS | METH_KEYWORDS, "\n"
       "Create a new domain.\n"
       " dom    [int, 0]:        Domain identifier to use (allocated if zero).\n"
       "Returns: [int] new domain identifier; -1 on error.\n" },
 
-    { "domain_max_vcpus", 
+    { "domain_max_vcpus",
       (PyCFunction)pyxc_domain_max_vcpus,
       METH_VARARGS, "\n"
       "Set the maximum number of VCPUs a domain may create.\n"
@@ -1905,43 +1905,43 @@ static PyMethodDef pyxc_methods[] = {
       " max     [int, 0]:      New maximum number of VCPUs in domain.\n"
       "Returns: [int] 0 on success; -1 on error.\n" },
 
-    { "domain_dumpcore", 
-      (PyCFunction)pyxc_domain_dumpcore, 
+    { "domain_dumpcore",
+      (PyCFunction)pyxc_domain_dumpcore,
       METH_VARARGS, "\n"
       "Dump core of a domain.\n"
       " dom [int]: Identifier of domain to dump core of.\n"
       " corefile [string]: Name of corefile to be created.\n\n"
       "Returns: [int] 0 on success; -1 on error.\n" },
 
-    { "domain_pause", 
-      (PyCFunction)pyxc_domain_pause, 
+    { "domain_pause",
+      (PyCFunction)pyxc_domain_pause,
       METH_VARARGS, "\n"
       "Temporarily pause execution of a domain.\n"
       " dom [int]: Identifier of domain to be paused.\n\n"
       "Returns: [int] 0 on success; -1 on error.\n" },
 
-    { "domain_unpause", 
-      (PyCFunction)pyxc_domain_unpause, 
+    { "domain_unpause",
+      (PyCFunction)pyxc_domain_unpause,
       METH_VARARGS, "\n"
       "(Re)start execution of a domain.\n"
       " dom [int]: Identifier of domain to be unpaused.\n\n"
       "Returns: [int] 0 on success; -1 on error.\n" },
 
-    { "domain_destroy", 
-      (PyCFunction)pyxc_domain_destroy, 
+    { "domain_destroy",
+      (PyCFunction)pyxc_domain_destroy,
       METH_VARARGS, "\n"
       "Destroy a domain.\n"
       " dom [int]:    Identifier of domain to be destroyed.\n\n"
       "Returns: [int] 0 on success; -1 on error.\n" },
 
-    { "domain_destroy_hook", 
-      (PyCFunction)pyxc_domain_destroy_hook, 
+    { "domain_destroy_hook",
+      (PyCFunction)pyxc_domain_destroy_hook,
       METH_VARARGS, "\n"
       "Add a hook for arch stuff before destroy a domain.\n"
       " dom [int]:    Identifier of domain to be destroyed.\n\n"
       "Returns: [int] 0 on success; -1 on error.\n" },
 
-    { "domain_resume", 
+    { "domain_resume",
       (PyCFunction)pyxc_domain_resume,
       METH_VARARGS, "\n"
       "Resume execution of a suspended domain.\n"
@@ -1949,7 +1949,7 @@ static PyMethodDef pyxc_methods[] = {
       " fast [int]: Use cooperative resume.\n\n"
       "Returns: [int] 0 on success; -1 on error.\n" },
 
-    { "domain_shutdown", 
+    { "domain_shutdown",
       (PyCFunction)pyxc_domain_shutdown,
       METH_VARARGS, "\n"
       "Shutdown a domain.\n"
@@ -1957,8 +1957,8 @@ static PyMethodDef pyxc_methods[] = {
       " reason     [int, 0]:      Reason for shutdown.\n"
       "Returns: [int] 0 on success; -1 on error.\n" },
 
-    { "vcpu_setaffinity", 
-      (PyCFunction)pyxc_vcpu_setaffinity, 
+    { "vcpu_setaffinity",
+      (PyCFunction)pyxc_vcpu_setaffinity,
       METH_VARARGS | METH_KEYWORDS, "\n"
       "Pin a VCPU to a specified set CPUs.\n"
       " dom [int]:     Identifier of domain to which VCPU belongs.\n"
@@ -1966,7 +1966,7 @@ static PyMethodDef pyxc_methods[] = {
       " cpumap [list, []]: list of usable CPUs.\n\n"
       "Returns: [int] 0 on success; -1 on error.\n" },
 
-    { "domain_sethandle", 
+    { "domain_sethandle",
       (PyCFunction)pyxc_domain_sethandle,
       METH_VARARGS, "\n"
       "Set domain's opaque handle.\n"
@@ -1974,8 +1974,8 @@ static PyMethodDef pyxc_methods[] = {
       " handle [list of 16 ints]: New opaque handle.\n"
       "Returns: [int] 0 on success; -1 on error.\n" },
 
-    { "domain_getinfo", 
-      (PyCFunction)pyxc_domain_getinfo, 
+    { "domain_getinfo",
+      (PyCFunction)pyxc_domain_getinfo,
       METH_VARARGS | METH_KEYWORDS, "\n"
       "Get information regarding a set of domains, in increasing id order.\n"
       " first_dom [int, 0]:    First domain to retrieve info about.\n"
@@ -2000,8 +2000,8 @@ static PyMethodDef pyxc_methods[] = {
       "reason why it shut itself down.\n"
       " cpupool  [int]   Id of cpupool domain is bound to.\n" },
 
-    { "vcpu_getinfo", 
-      (PyCFunction)pyxc_vcpu_getinfo, 
+    { "vcpu_getinfo",
+      (PyCFunction)pyxc_vcpu_getinfo,
       METH_VARARGS | METH_KEYWORDS, "\n"
       "Get information regarding a VCPU.\n"
       " dom  [int]:    Domain to retrieve info about.\n"
@@ -2025,7 +2025,7 @@ static PyMethodDef pyxc_methods[] = {
       " xenstore_domid [int]: \n"
       "Returns: None on success. Raises exception on error.\n" },
 
-    { "hvm_get_param", 
+    { "hvm_get_param",
       (PyCFunction)pyxc_hvm_param_get,
       METH_VARARGS | METH_KEYWORDS, "\n"
       "get a parameter of HVM guest OS.\n"
@@ -2033,7 +2033,7 @@ static PyMethodDef pyxc_methods[] = {
       " param   [int]:      No. of HVM param.\n"
       "Returns: [long] value of the param.\n" },
 
-    { "hvm_set_param", 
+    { "hvm_set_param",
       (PyCFunction)pyxc_hvm_param_set,
       METH_VARARGS | METH_KEYWORDS, "\n"
       "set a parameter of HVM guest OS.\n"
@@ -2076,12 +2076,12 @@ static PyMethodDef pyxc_methods[] = {
        " dom     [int]:      Domain to deassign device from.\n"
        " pci_str [str]:      PCI devices.\n"
        "Returns: [int] 0 on success, or device bdf that can't be deassigned.\n" },
-  
+
     { "sched_id_get",
       (PyCFunction)pyxc_sched_id_get,
       METH_NOARGS, "\n"
       "Get the current scheduler type in use.\n"
-      "Returns: [int] sched_id.\n" },    
+      "Returns: [int] sched_id.\n" },
 
     { "sched_credit_domain_set",
       (PyCFunction)pyxc_sched_credit_domain_set,
@@ -2119,7 +2119,7 @@ static PyMethodDef pyxc_methods[] = {
       "Returns:   [dict]\n"
       " weight    [short]: domain's scheduling weight\n"},
 
-    { "evtchn_alloc_unbound", 
+    { "evtchn_alloc_unbound",
       (PyCFunction)pyxc_evtchn_alloc_unbound,
       METH_VARARGS | METH_KEYWORDS, "\n"
       "Allocate an unbound port that will await a remote connection.\n"
@@ -2127,7 +2127,7 @@ static PyMethodDef pyxc_methods[] = {
       " remote_dom [int]: Remote domain to accept connections from.\n\n"
       "Returns: [int] Unbound event-channel port.\n" },
 
-    { "evtchn_reset", 
+    { "evtchn_reset",
       (PyCFunction)pyxc_evtchn_reset,
       METH_VARARGS | METH_KEYWORDS, "\n"
       "Reset all connections.\n"
@@ -2152,9 +2152,9 @@ static PyMethodDef pyxc_methods[] = {
       " func   [int]: PCI function\n"
       " enable [int]: Non-zero means enable access; else disable access\n\n"
       "Returns: [int] 0 on success; -1 on error.\n" },
- 
-    { "readconsolering", 
-      (PyCFunction)pyxc_readconsolering, 
+
+    { "readconsolering",
+      (PyCFunction)pyxc_readconsolering,
       METH_VARARGS | METH_KEYWORDS, "\n"
       "Read Xen's console ring.\n"
       " clear [int, 0]: Bool - clear the ring after reading from it?\n\n"
@@ -2202,40 +2202,40 @@ static PyMethodDef pyxc_methods[] = {
       "Returns [str]: Xen buildid"
       "        [None]: on failure.\n" },
 
-    { "shadow_control", 
-      (PyCFunction)pyxc_shadow_control, 
+    { "shadow_control",
+      (PyCFunction)pyxc_shadow_control,
       METH_VARARGS | METH_KEYWORDS, "\n"
       "Set parameter for shadow pagetable interface\n"
       " dom [int]:   Identifier of domain.\n"
       " op [int, 0]: operation\n\n"
       "Returns: [int] 0 on success; -1 on error.\n" },
 
-    { "shadow_mem_control", 
-      (PyCFunction)pyxc_shadow_mem_control, 
+    { "shadow_mem_control",
+      (PyCFunction)pyxc_shadow_mem_control,
       METH_VARARGS | METH_KEYWORDS, "\n"
       "Set or read shadow pagetable memory use\n"
       " dom [int]:   Identifier of domain.\n"
       " mb [int, -1]: MB of shadow memory this domain should have.\n\n"
       "Returns: [int] MB of shadow memory in use by this domain.\n" },
 
-    { "domain_setmaxmem", 
-      (PyCFunction)pyxc_domain_setmaxmem, 
+    { "domain_setmaxmem",
+      (PyCFunction)pyxc_domain_setmaxmem,
       METH_VARARGS, "\n"
       "Set a domain's memory limit\n"
       " dom [int]: Identifier of domain.\n"
       " maxmem_kb [int]: .\n"
       "Returns: [int] 0 on success; -1 on error.\n" },
 
-    { "domain_set_target_mem", 
-      (PyCFunction)pyxc_domain_set_target_mem, 
+    { "domain_set_target_mem",
+      (PyCFunction)pyxc_domain_set_target_mem,
       METH_VARARGS, "\n"
       "Set a domain's memory target\n"
       " dom [int]: Identifier of domain.\n"
       " mem_kb [int]: .\n"
       "Returns: [int] 0 on success; -1 on error.\n" },
 
-    { "domain_set_memmap_limit", 
-      (PyCFunction)pyxc_domain_set_memmap_limit, 
+    { "domain_set_memmap_limit",
+      (PyCFunction)pyxc_domain_set_memmap_limit,
       METH_VARARGS, "\n"
       "Set a domain's physical memory mapping limit\n"
       " dom [int]: Identifier of domain.\n"
@@ -2309,7 +2309,7 @@ static PyMethodDef pyxc_methods[] = {
       "Inject debug keys into Xen.\n"
       " keys    [str]: String of keys to inject.\n" },
 
-    { "dom_set_memshr", 
+    { "dom_set_memshr",
       (PyCFunction)pyxc_dom_set_memshr,
       METH_VARARGS, "\n"
       "Enable/disable memory sharing for the domain.\n"
@@ -2391,20 +2391,20 @@ static PyMethodDef pyxc_methods[] = {
       METH_VARARGS | METH_KEYWORDS, "\n"
       "Loads a policy into the hypervisor.\n"
       " policy [str]: policy to be load\n"
-      "Returns: [int]: 0 on success; -1 on failure.\n" }, 
-      
+      "Returns: [int]: 0 on success; -1 on failure.\n" },
+
     { "flask_getenforce",
       (PyCFunction)pyflask_getenforce,
       METH_NOARGS, "\n"
       "Returns the current mode of the Flask XSM module.\n"
-      "Returns: [int]: 0 for permissive; 1 for enforcing; -1 on failure.\n" }, 
+      "Returns: [int]: 0 for permissive; 1 for enforcing; -1 on failure.\n" },
 
     { "flask_setenforce",
       (PyCFunction)pyflask_setenforce,
       METH_VARARGS | METH_KEYWORDS, "\n"
       "Modifies the current mode for the Flask XSM module.\n"
       " mode [int]: mode to change to\n"
-      "Returns: [int]: 0 on success; -1 on failure.\n" }, 
+      "Returns: [int]: 0 on success; -1 on failure.\n" },
 
     { "flask_access",
       (PyCFunction)pyflask_access,
@@ -2423,7 +2423,7 @@ static PyMethodDef pyxc_methods[] = {
       " auditdeny [int] permissions set to audit on deny\n"
       " seqno [int] not used\n"
       "Returns: [int]: 0 on all permission granted; -1 if any permissions are \
-       denied\n" }, 
+       denied\n" },
 
     { NULL, NULL, 0, NULL }
 };
diff --git a/tools/python/xen/lowlevel/xs/xs.c b/tools/python/xen/lowlevel/xs/xs.c
index 3ba5a8b893d9..87f1187bb116 100644
--- a/tools/python/xen/lowlevel/xs/xs.c
+++ b/tools/python/xen/lowlevel/xs/xs.c
@@ -1,4 +1,4 @@
-/* 
+/*
  * Python interface to the Xen Store Daemon.
  *
  * This library is free software; you can redistribute it and/or
@@ -859,7 +859,7 @@ static void remove_watch(XsHandle *self, PyObject *token)
  * Parse transaction and path arguments from the given args and kwds,
  * convert the given self value to an xs_handle, and return all three by
  * reference.
- * 
+ *
  * @return 1 on success, in which case *xh, *th, and *path are valid, or 0 on
  * failure.
  */
diff --git a/tools/xenmon/xenmon.py b/tools/xenmon/xenmon.py
index 977ada688771..1b357aed5127 100644
--- a/tools/xenmon/xenmon.py
+++ b/tools/xenmon/xenmon.py
@@ -13,12 +13,12 @@
 #   This program is free software; you can redistribute it and/or modify
 #   it under the terms of the GNU General Public License as published by
 #   the Free Software Foundation; under version 2 of the License.
-# 
+#
 #   This program is distributed in the hope that it will be useful,
 #   but WITHOUT ANY WARRANTY; without even the implied warranty of
 #   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 #   GNU General Public License for more details.
-# 
+#
 #   You should have received a copy of the GNU General Public License
 #   along with this program; If not, see <http://www.gnu.org/licenses/>.
 #####################################################################
@@ -79,7 +79,7 @@ def setup_cmdline_parser():
     parser.add_option("-p", "--prefix", dest="prefix",
                       default = "log", help="prefix to use for output files")
     parser.add_option("-t", "--time", dest="duration",
-            action="store", type="int", default=10, 
+            action="store", type="int", default=10,
             help="stop logging to file after this much time has elapsed (in seconds). set to 0 to keep logging indefinitely")
     parser.add_option("-i", "--interval", dest="interval",
             action="store", type="int", default=1000,
@@ -179,7 +179,7 @@ class DomainInfo(object):
         return [total/(float(passed)/10**9), avg]
 
     def stats(self, passed):
-        return [self.gotten_stats(passed), self.allocated_stats(passed), self.blocked_stats(passed), 
+        return [self.gotten_stats(passed), self.allocated_stats(passed), self.blocked_stats(passed),
                 self.waited_stats(passed), self.ec_stats(passed), self.io_stats(passed)]
 
 # report values over desired interval
@@ -187,13 +187,13 @@ def summarize(startat, endat, duration, samples):
     dominfos = {}
     for i in range(0, NDOMAINS):
         dominfos[i] = DomainInfo()
-        
+
     passed = 1              # to prevent zero division
     curid = startat
     numbuckets = 0
     lost_samples = []
     ffp_samples = []
-    
+
     while passed < duration:
         for i in range(0, NDOMAINS):
             if dom_in_use[i]:
@@ -203,7 +203,7 @@ def summarize(startat, endat, duration, samples):
                 dominfos[i].blocked_sum += samples[curid][3*NDOMAINS + i]
                 dominfos[i].exec_count += samples[curid][4*NDOMAINS + i]
                 dominfos[i].iocount_sum += samples[curid][5*NDOMAINS + i]
-    
+
         passed += samples[curid][6*NDOMAINS]
         lost_samples.append(samples[curid][6*NDOMAINS + 2])
         ffp_samples.append(samples[curid][6*NDOMAINS + 3])
@@ -271,7 +271,7 @@ def show_livestats(cpu):
     cpu_10sec_usage = 0.0
     heartbeat = 1
     global dom_in_use, options
-    
+
     # mmap the (the first chunk of the) file
     shmf = open(SHM_FILE, "r+")
     shm = mmap.mmap(shmf.fileno(), QOS_DATA_SIZE)
@@ -284,7 +284,7 @@ def show_livestats(cpu):
     stdscr.keypad(1)
     stdscr.timeout(1000)
     [maxy, maxx] = stdscr.getmaxyx()
-    
+
     # display in a loop
     while True:
 
@@ -342,7 +342,7 @@ def show_livestats(cpu):
             cpuidx = cpuidx + 1
 
         # calculate starting and ending datapoints; never look at "next" since
-        # it represents live data that may be in transition. 
+        # it represents live data that may be in transition.
         startat = next - 1
         if next + 10 < NSAMPLES:
             endat = next + 10
@@ -374,7 +374,7 @@ def show_livestats(cpu):
 
             if h1[dom][0][1] > 0 or domain_id[dom] == IDLE_DOMAIN:
                 # display gotten
-                row += 1 
+                row += 1
                 col = 2
                 display_domain_id(stdscr, row, col, domain_id[dom])
                 col += 4
@@ -396,7 +396,7 @@ def show_livestats(cpu):
 
                 if dom != IDLE_DOMAIN:
                     cpu_1sec_usage = cpu_1sec_usage + h1[dom][0][1]
-    
+
                 # display allocated
                 if options.allocated:
                     row += 1
@@ -454,7 +454,7 @@ def show_livestats(cpu):
                     row += 1
                     col = 2
                     display_domain_id(stdscr, row, col, domain_id[dom])
-                    
+
                     col += 28
                     display(stdscr, row, col, "%d/s" % h2[dom][4])
                     col += 42
@@ -490,14 +490,14 @@ def show_livestats(cpu):
         display(stdscr, row, 1, star)
         display(stdscr, row, 2, TOTALS % (total_h2_cpu, total_h1_cpu))
         row += 1
-#        display(stdscr, row, 2, 
-#                "\tFFP: %d (Min: %d, Max: %d)\t\t\tFFP: %d (Min: %d, Max %d)" % 
+#        display(stdscr, row, 2,
+#                "\tFFP: %d (Min: %d, Max: %d)\t\t\tFFP: %d (Min: %d, Max %d)" %
 #                (math.ceil(f2[1]), f2[0], f2[2], math.ceil(f1[1]), f1[0], f1[2]), _c.A_BOLD)
 
         if l1[1] > 1 :
             row += 1
-            display(stdscr, row, 2, 
-                    "\tRecords lost: %d (Min: %d, Max: %d)\t\t\tRecords lost: %d (Min: %d, Max %d)" % 
+            display(stdscr, row, 2,
+                    "\tRecords lost: %d (Min: %d, Max: %d)\t\t\tRecords lost: %d (Min: %d, Max %d)" %
                     (math.ceil(l2[1]), l2[0], l2[2], math.ceil(l1[1]), l1[0], l1[2]), _c.A_BOLD)
 
         # grab a char from tty input; exit if interrupt hit
@@ -505,11 +505,11 @@ def show_livestats(cpu):
             c = stdscr.getch()
         except:
             break
-        
+
         # q = quit
         if c == ord('q'):
             break
-    
+
         # c = cycle to a new cpu of interest
         if c == ord('c'):
             cpu = (cpu + 1) % ncpu
@@ -560,7 +560,7 @@ class Delayed(object):
     def close(self):
         if  self.opened:
             self.file.close()
-            
+
 
 def writelog():
     global options
@@ -639,7 +639,7 @@ def writelog():
                                      h1[dom][1],
                                      h1[dom][2][0], h1[dom][2][1], h1[dom][2][2],
                                      h1[dom][3][0], h1[dom][3][1], h1[dom][3][2],
-                                     h1[dom][4], 
+                                     h1[dom][4],
                                      h1[dom][5][0], h1[dom][5][1]))
                     outfiles[dom].flush()
             curr = time.time()
@@ -698,7 +698,7 @@ def main():
        options.mspersample > options.duration * 1000:
         parser.error("option --ms_per_sample: too large (> %d ms)" %
                      (options.duration * 1000))
-    
+
     start_xenbaked()
     if options.live:
         show_livestats(options.cpu)
-- 
2.30.2


