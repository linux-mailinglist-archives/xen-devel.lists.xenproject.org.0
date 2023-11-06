Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4056A7E2821
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 16:06:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.628137.979298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r01AH-0000zw-4K; Mon, 06 Nov 2023 15:05:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 628137.979298; Mon, 06 Nov 2023 15:05:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r01AH-0000vz-0F; Mon, 06 Nov 2023 15:05:21 +0000
Received: by outflank-mailman (input) for mailman id 628137;
 Mon, 06 Nov 2023 15:05:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9eGT=GT=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1r01AF-000892-Sy
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 15:05:20 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e571f82d-7cb5-11ee-9b0e-b553b5be7939;
 Mon, 06 Nov 2023 16:05:17 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40838915cecso33861875e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 06 Nov 2023 07:05:17 -0800 (PST)
Received: from EMEAENGAAD19049.citrite.net ([2.223.46.215])
 by smtp.gmail.com with ESMTPSA id
 q8-20020a05600c46c800b0040776008abdsm12507392wmo.40.2023.11.06.07.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 07:05:15 -0800 (PST)
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
X-Inumbo-ID: e571f82d-7cb5-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1699283117; x=1699887917; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yowsapQA+Hk3t7pzlY0dGZgRSDLtI+G/ZK19XU66m/8=;
        b=TGgk+CMOf9kZwnz5k96Jk3ZwvCMd4VreUA0K1BwF6pVYBisELmB+e98AMRMYxOHPaf
         sdq+dHPUs47hrLi0es5d8vyPq3+c0Dy1um8GIrQIhcQdctgpRNnnGehXDAF3lXcN1NR0
         UB6D56zOAKvnWoN6YsjNV7ByqzHgPWhWifiC0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699283117; x=1699887917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yowsapQA+Hk3t7pzlY0dGZgRSDLtI+G/ZK19XU66m/8=;
        b=wWC9zdpXV2DKO9VAJmDdb/yeZ4hMypckRaRajpOpTaX6KB5sCKy4dSHcOMzrR0WM5M
         Pdx+I1XyAhk6zufEg/zZYekFaSpVUEpwpiXGRqebtfENLAZpqwNCPGecL8ZOW/+VoX4K
         /Dl9TLiNLaXDHnaizEJJBAOpU8DbM/ICHOuuPTa9OMaYz3voxk4jbR9nHRusjavrvil9
         JtDP7yL74e+cIAu8s+PuM0nCSVFMdWnaQNUCI468Fy9ZXr2sy/bIBhimo3PrIPmCtd6e
         QfveQU2qZZKYKRjKHeDjm42T5PRB4lWqyKfovmOhsGERbPOvckd1aUEew2Cv9nsOVRMW
         /lsQ==
X-Gm-Message-State: AOJu0Yw3MnIOIKeF/JhiFiSVC4G/MwXCCgCi0SUd9zEh1yatTXkKqfhb
	lt4tOh3z/uIJu9D1u8PJTRppwn4QvI7oQiZK6jA=
X-Google-Smtp-Source: AGHT+IGnVq4XQdzv37lduWCcsMnjRT/Dj0YkahdBsVtH52O+w5UUdeRpX50hKpxt9wyKM61zcglBcw==
X-Received: by 2002:a05:600c:4fcb:b0:401:b204:3b97 with SMTP id o11-20020a05600c4fcb00b00401b2043b97mr24125222wmq.4.1699283116697;
        Mon, 06 Nov 2023 07:05:16 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 6/6] tools/pygrub: Hook libfsimage's fdopen() to pygrub
Date: Mon,  6 Nov 2023 15:05:08 +0000
Message-Id: <20231106150508.22665-7-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231106150508.22665-1-alejandro.vallejo@cloud.com>
References: <20231106150508.22665-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch increases the security posture by removing the need to grant
filesystem access to the depriv pygrub. Using libfsimage's fdopen(), the
parent thread in the depriv procedure can simply ensure all the appropriate
file descriptors are present before revoking permissions to the filesystem.

A convenient usability side-effect is that it's no longer required for the
restricted user to have access to the disk, because the depriv thread
already has the file descriptor open by its parent.

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 docs/man/xl.cfg.5.pod.in         |  6 +-
 tools/pygrub/src/ExtLinuxConf.py | 20 ++++---
 tools/pygrub/src/GrubConf.py     | 29 ++++++----
 tools/pygrub/src/LiloConf.py     | 20 ++++---
 tools/pygrub/src/pygrub          | 95 ++++++++------------------------
 5 files changed, 68 insertions(+), 102 deletions(-)

diff --git a/docs/man/xl.cfg.5.pod.in b/docs/man/xl.cfg.5.pod.in
index 2e234b450e..e3fd2e37eb 100644
--- a/docs/man/xl.cfg.5.pod.in
+++ b/docs/man/xl.cfg.5.pod.in
@@ -1704,8 +1704,7 @@ See docs/features/qemu-deprivilege.pandoc for more information
 on how to setup the unprivileged users.
 
 Note that running the bootloader in restricted mode also implies using
-non-interactive mode, and the disk image must be readable by the
-restricted user.
+non-interactive mode.
 
 =item B<bootloader_user=USERNAME>
 
@@ -2768,8 +2767,7 @@ See docs/features/qemu-deprivilege.pandoc for more information
 on how to setup the unprivileged users.
 
 Note that running the bootloader in restricted mode also implies using
-non-interactive mode, and the disk image must be readable by the
-restricted user.
+non-interactive mode.
 
 =item B<bootloader_user=USERNAME>
 
diff --git a/tools/pygrub/src/ExtLinuxConf.py b/tools/pygrub/src/ExtLinuxConf.py
index 4e990a9304..f2e9a81013 100644
--- a/tools/pygrub/src/ExtLinuxConf.py
+++ b/tools/pygrub/src/ExtLinuxConf.py
@@ -123,6 +123,7 @@ class ExtLinuxImage(object):
 class ExtLinuxConfigFile(object):
     def __init__(self, fn = None):
         self.filename = fn
+        self.file = None
         self.images = []
         self.timeout = -1
         self._default = 0
@@ -138,16 +139,21 @@ class ExtLinuxConfigFile(object):
 
     def parse(self, buf = None):
         if buf is None:
-            if self.filename is None:
+            if not self.filename and not self.file:
                 raise ValueError("No config file defined to parse!")
 
-            f = open(self.filename, 'r')
-            lines = f.readlines()
-            f.close()
-        else:
-            lines = buf.split("\n")
+            if self.file:
+                buf = file.read()
+                path = self.file.name
+            else:
+                f = open(self.filename, 'r')
+                buf = f.read()
+                f.close()
+        lines = buf.split("\n")
+
+        if not path:
+            path = os.path.dirname(self.filename)
 
-        path = os.path.dirname(self.filename)
         img = []
         for l in lines:
             l = l.strip()
diff --git a/tools/pygrub/src/GrubConf.py b/tools/pygrub/src/GrubConf.py
index 580c9628ca..96b79b89a7 100644
--- a/tools/pygrub/src/GrubConf.py
+++ b/tools/pygrub/src/GrubConf.py
@@ -170,6 +170,7 @@ class GrubImage(_GrubImage):
 class _GrubConfigFile(object):
     def __init__(self, fn = None):
         self.filename = fn
+        self.file = None
         self.images = []
         self.timeout = -1
         self._default = 0
@@ -271,14 +272,16 @@ class GrubConfigFile(_GrubConfigFile):
 
     def parse(self, buf = None):
         if buf is None:
-            if self.filename is None:
+            if not self.filename and not self.file:
                 raise ValueError("No config file defined to parse!")
 
-            f = open(self.filename, 'r')
-            lines = f.readlines()
-            f.close()
-        else:
-            lines = buf.split("\n")
+            if self.file:
+                buf = file.read()
+            else:
+                f = open(self.filename, 'r')
+                buf = f.read()
+                f.close()
+        lines = buf.split("\n")
 
         img = None
         title = ""
@@ -370,14 +373,16 @@ class Grub2ConfigFile(_GrubConfigFile):
 
     def parse(self, buf = None):
         if buf is None:
-            if self.filename is None:
+            if not self.filename and not self.file:
                 raise ValueError("No config file defined to parse!")
 
-            f = open(self.filename, 'r')
-            lines = f.readlines()
-            f.close()
-        else:
-            lines = buf.split("\n")
+            if self.file:
+                buf = file.read()
+            else:
+                f = open(self.filename, 'r')
+                buf = f.read()
+                f.close()
+        lines = buf.split("\n")
 
         in_function = False
         img = None
diff --git a/tools/pygrub/src/LiloConf.py b/tools/pygrub/src/LiloConf.py
index e3bfcb5244..73f8fcb214 100644
--- a/tools/pygrub/src/LiloConf.py
+++ b/tools/pygrub/src/LiloConf.py
@@ -90,6 +90,7 @@ class LiloImage(object):
 class LiloConfigFile(object):
     def __init__(self, fn = None):
         self.filename = fn
+        self.file = None
         self.images = []
         self.timeout = -1
         self._default = 0
@@ -99,16 +100,21 @@ class LiloConfigFile(object):
 
     def parse(self, buf = None):
         if buf is None:
-            if self.filename is None:
+            if not self.filename and not self.file:
                 raise ValueError("No config file defined to parse!")
 
-            f = open(self.filename, 'r')
-            lines = f.readlines()
-            f.close()
-        else:
-            lines = buf.split("\n")
+            if self.file:
+                buf = file.read()
+                path = self.file.name
+            else:
+                f = open(self.filename, 'r')
+                buf = f.read()
+                f.close()
+        lines = buf.split("\n")
+
+        if not path:
+            path = os.path.dirname(self.filename)
 
-        path = os.path.dirname(self.filename)
         img = []
         for l in lines:
             l = l.strip()
diff --git a/tools/pygrub/src/pygrub b/tools/pygrub/src/pygrub
index b96bdfd849..123e9c40ad 100755
--- a/tools/pygrub/src/pygrub
+++ b/tools/pygrub/src/pygrub
@@ -66,14 +66,6 @@ def unshare(flags):
     # Undo it so that every mount done in the NS stay confined within it.
     subprocess.check_output(["mount", "--make-rprivate", "/"])
 
-def bind_mount(src, dst, options):
-    open(dst, "a").close() # touch
-
-    rc = subprocess.call(["mount", "--bind", "-o", options, src, dst])
-    if rc != 0:
-        raise RuntimeError("bad_mount: src=%s dst=%s opts=%s" %
-                           (src, dst, options))
-
 def downgrade_rlimits():
     # Wipe the authority to use unrequired resources
     resource.setrlimit(resource.RLIMIT_NPROC,    (0, 0))
@@ -103,7 +95,7 @@ def downgrade_rlimits():
 
     resource.setrlimit(resource.RLIMIT_FSIZE, (fsize, fsize))
 
-def depriv(output_directory, output, device, uid, path_kernel, path_ramdisk):
+def depriv(output_directory, uid, path_kernel, path_ramdisk):
     # The only point of this call is to force the loading of libfsimage.
     # That way, we don't need to bind-mount it into the chroot
     rc = xenfsimage.init()
@@ -114,7 +106,7 @@ def depriv(output_directory, output, device, uid, path_kernel, path_ramdisk):
 
     # Create a temporary directory for the chroot
     chroot = tempfile.mkdtemp(prefix=str(uid)+'-', dir=output_directory) + '/'
-    device_path = '/device'
+    os.chmod(chroot, 0o700)
 
     pid = os.fork()
     if pid:
@@ -129,16 +121,7 @@ def depriv(output_directory, output, device, uid, path_kernel, path_ramdisk):
             if rc != 0 or os.path.getsize(path) == 0:
                 os.unlink(path)
 
-        # Unshare(CLONE_NEWNS) ensures this is not required, but that's not
-        # present on *BSD, so recursively unmount everything if needed.
-        # Quietly.
-        with open('/dev/null', 'w') as devnull:
-            subprocess.call(["umount", "-f", chroot + device_path],
-                            stdout=devnull, stderr=devnull)
-            subprocess.call(["umount", "-f", chroot],
-                            stdout=devnull, stderr=devnull)
         os.rmdir(chroot)
-
         sys.exit(rc)
 
     # By unsharing the namespace we're making sure it's all bulk-released
@@ -150,20 +133,6 @@ def depriv(output_directory, output, device, uid, path_kernel, path_ramdisk):
     # Set sensible limits using the setrlimit interface
     downgrade_rlimits()
 
-    # We'll mount tmpfs on the chroot to ensure the deprivileged child
-    # cannot affect the persistent state. It's RW now in order to
-    # bind-mount the device, but note it's remounted RO after that.
-    rc = subprocess.call(["mount", "-t", "tmpfs", "none", chroot])
-    if rc != 0:
-        raise RuntimeError("mount_tmpfs rc=%d dst=\"%s\"" % (rc, chroot))
-
-    # Bind the untrusted device RO
-    bind_mount(device, chroot + device_path, "ro,nosuid,noexec")
-
-    rc = subprocess.call(["mount", "-t", "tmpfs", "-o", "remount,ro,nosuid,noexec,nodev", "none", chroot])
-    if rc != 0:
-        raise RuntimeError("remount_tmpfs rc=%d dst=\"%s\"" % (rc, chroot))
-
     # Drop superpowers!
     os.chroot(chroot)
     os.chdir('/')
@@ -171,15 +140,7 @@ def depriv(output_directory, output, device, uid, path_kernel, path_ramdisk):
     os.setgroups([uid])
     os.setuid(uid)
 
-    return device_path
-
-def read_size_roundup(fd, size):
-    if platform.system() != 'FreeBSD':
-        return size
-    st = os.fstat(fd)
-    if (not stat.S_ISCHR(st.st_mode)):
-        return size
-    # Round up to sector size if it's a raw character device
+def round_up_to_sectorsize(size):
     return (((size)+((SECTOR_SIZE)-1))&(~((SECTOR_SIZE)-1)))
 
 def enable_cursor(ison):
@@ -196,9 +157,8 @@ def enable_cursor(ison):
 DISK_TYPE_RAW, DISK_TYPE_HYBRIDISO, DISK_TYPE_DOS = range(3)
 def identify_disk_image(file):
     """Detect DOS partition table or HybridISO format."""
-    fd = os.open(file, os.O_RDONLY)
-    buf = os.read(fd, read_size_roundup(fd, 0x8006))
-    os.close(fd)
+    file.seek(0, 0)
+    buf = file.read(0x8200)
 
     if len(buf) >= 512 and \
            struct.unpack("H", buf[0x1fe: 0x200]) == (0xaa55,):
@@ -215,10 +175,8 @@ V_ROOT=0x2
 def get_solaris_slice(file, offset):
     """Find the root slice in a Solaris VTOC."""
 
-    fd = os.open(file, os.O_RDONLY)
-    os.lseek(fd, offset + (DK_LABEL_LOC * SECTOR_SIZE), 0)
-    buf = os.read(fd, 512)
-    os.close(fd)
+    file.seek(offset + (DK_LABEL_LOC * SECTOR_SIZE), 0)
+    buf = file.read(512)
     if struct.unpack("<H", buf[508:510])[0] != DKL_MAGIC:
         raise RuntimeError("Invalid disklabel magic")
 
@@ -234,9 +192,8 @@ def get_solaris_slice(file, offset):
     raise RuntimeError("No root slice found")
 
 def get_fs_offset_gpt(file):
-    fd = os.open(file, os.O_RDONLY)
-    os.lseek(fd, SECTOR_SIZE, 0)
-    buf = os.read(fd, 512)
+    file.seek(512, 0)
+    buf = file.read(512)
     partcount = struct.unpack("<L", buf[80:84])[0]
     partsize = struct.unpack("<L", buf[84:88])[0]
     i = partcount
@@ -267,9 +224,8 @@ def get_partition_offsets(file):
     else:
         raise ValueError('Unhandled image type returnd by identify_disk_image(): %d' % (image_type,))
 
-    fd = os.open(file, os.O_RDONLY)
-    buf = os.read(fd, 512)
-    os.close(fd)
+    file.seek(0, 0)
+    buf = file.read(512)
     for poff in (446, 462, 478, 494): # partition offsets
 
         # MBR contains a 16 byte descriptor per partition
@@ -565,9 +521,6 @@ class Grub:
         """Read the given file to parse the config.  If fs = None, then
         we're being given a raw config file rather than a disk image."""
 
-        if not os.access(fn, os.R_OK):
-            raise RuntimeError("Unable to access %s" %(fn,))
-
         cfg_list = [(x,grub.GrubConf.Grub2ConfigFile) for x in ["/boot/grub/grub.cfg", "/grub/grub.cfg",
                         "/boot/grub2/grub.cfg", "/grub2/grub.cfg"]] + \
                    [(x,grub.ExtLinuxConf.ExtLinuxConfigFile) for x in ["/boot/isolinux/isolinux.cfg",
@@ -582,7 +535,8 @@ class Grub:
             # set the config file and parse it
             for f,parser in cfg_list:
                 self.cf = parser()
-                self.cf.filename = fn
+                self.cf.filename = None
+                self.cf.fd = file
                 self.cf.parse()
                 return
 
@@ -591,6 +545,7 @@ class Grub:
                 print("Using %s to parse %s" % (parser,f), file=sys.stderr)
                 self.cf = parser()
                 self.cf.filename = f
+                self.cf.fd = None
                 break
         if self.__dict__.get('cf', None) is None:
             raise RuntimeError("couldn't find bootloader config file in the image provided.")
@@ -880,7 +835,7 @@ if __name__ == "__main__":
     def usage():
         print("Usage: %s [-q|--quiet] [-i|--interactive] [-l|--list-entries] [-n|--not-really] [--output=] [--kernel=] [--ramdisk=] [--args=] [--entry=] [--output-directory=] [--output-format=sxp|simple|simple0] [--runas=] [--offset=] <image>" %(sys.argv[0],), file=sys.stderr)
 
-    def copy_from_image(fs, file_to_read, file_type, fd_dst, path_dst, not_really):
+    def copy_from_image(fs, file_to_read, file_type, fd_dst, not_really):
         if not_really:
             if fs.file_exists(file_to_read):
                 return "<%s:%s>" % (file_type, file_to_read)
@@ -898,14 +853,7 @@ if __name__ == "__main__":
                 os.close(fd_dst)
                 del datafile
                 return
-            try:
-                os.write(fd_dst, data)
-            except Exception as e:
-                print(e, file=sys.stderr)
-                if path_dst:
-                    os.unlink(path_dst)
-                del datafile
-                sys.exit("Error writing temporary copy of "+file_type)
+            os.write(fd_dst, data)
             dataoff += len(data)
 
     try:
@@ -1020,13 +968,15 @@ if __name__ == "__main__":
         (fd_ramdisk, path_ramdisk) = tempfile.mkstemp(prefix="boot_ramdisk.",
                                                       dir=output_directory)
 
+    file = open(file, 'rb')
+
     if output is None:
         fd = sys.stdout.fileno()
     else:
         fd = os.open(output, os.O_WRONLY)
 
     if uid:
-        file = depriv(output_directory, output, file, uid, path_kernel, path_ramdisk)
+        depriv(output_directory, uid, path_kernel, path_ramdisk)
 
     # debug
     if isconfig:
@@ -1049,9 +999,10 @@ if __name__ == "__main__":
     if part_offs is None:
         part_offs = get_partition_offsets(file)
 
+    file.seek(0, 0)
     for offset in part_offs:
         try:
-            fs = xenfsimage.open(file, offset, bootfsoptions)
+            fs = xenfsimage.fdopen(os.dup(file.fileno()), offset, bootfsoptions)
 
             chosencfg = sniff_solaris(fs, incfg)
 
@@ -1083,13 +1034,13 @@ if __name__ == "__main__":
         raise RuntimeError("Unable to find partition containing kernel")
 
     copy_from_image(fs, chosencfg["kernel"], "kernel",
-                    fd_kernel, None if uid else path_kernel, not_really)
+                    fd_kernel, not_really)
     bootcfg["kernel"] = path_kernel
 
     if chosencfg["ramdisk"]:
         try:
             copy_from_image(fs, chosencfg["ramdisk"], "ramdisk",
-                            fd_ramdisk, None if uid else path_ramdisk, not_really)
+                            fd_ramdisk, not_really)
         except:
             if not uid and not not_really:
                     os.unlink(path_kernel)
-- 
2.34.1


