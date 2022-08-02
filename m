Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7B1587AA8
	for <lists+xen-devel@lfdr.de>; Tue,  2 Aug 2022 12:27:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.379236.612538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIp6S-0003gX-Uu; Tue, 02 Aug 2022 10:26:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 379236.612538; Tue, 02 Aug 2022 10:26:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oIp6S-0003ZS-Q3; Tue, 02 Aug 2022 10:26:20 +0000
Received: by outflank-mailman (input) for mailman id 379236;
 Tue, 02 Aug 2022 10:26:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gPpP=YG=citrix.com=prvs=206784369=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oIp6Q-0003I9-W2
 for xen-devel@lists.xenproject.org; Tue, 02 Aug 2022 10:26:19 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 890a169d-124d-11ed-924f-1f966e50362f;
 Tue, 02 Aug 2022 12:26:16 +0200 (CEST)
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
X-Inumbo-ID: 890a169d-124d-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1659435975;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RqOnTnRfNefeCWQNoTAkEW+3/TCxNE8vkYa6ugEuZYo=;
  b=O8PiqLNE7abhnTMNbRR3szqjJE9Q+HWHYcbgWoaaNRUu8xfB3SuDRkJA
   1XMF953XVIlxOb6iDBDeKtkoUwCVlTl539gVilixX6Qes0xgb9rSY7Lgr
   e2oPqioDXxC2LJVyQl29u1S+zSkpccQzkeCRk+n8PybM89VSb9QpUDFd9
   g=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 76424230
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:N4oXtaKTpytA+5mlFE+RtZUlxSXFcZb7ZxGr2PjKsXjdYENS3mMEy
 jNJXWvSPf7eMzGjL9t+b47gp0JS68SBztAxQFZlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraP65xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOd8iYNz6TSDK1rlV
 eja/ouOYzdJ5xYuajhOs/Lb8ks21BjPkGhwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 44vG5ngows1Vz90Yj+Uuu6Tnn8iG9Y+DiDX4pZiYICwgwAqm8AH+v1T2Mzwy6tgo27hc9hZk
 L2hvHErIOsjFvWkdO81C3G0H8ziVEHvFXCuzXWX6KSuI0P6n3TExtx2EWA4P90hqvt0JzENr
 vNGEh0zYUXW7w626OrTpuhEg80iKI/gPZ8Fu2EmxjbcZRokacmdGeOQv4YehWpuwJAVdRrdT
 5NxhT5HZRLcYxpJKxEPBYg3huuAjXjjaTxI7lmSoMLb5kCMklArjOK2aLI5fPSbTp16mVq8j
 1if1F/rBz4WCIPHkz6apyfEaujnwnqgBdN6+KeD3v91gnWDy2oLEhoUWFCn5/6jhSaWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe9DW8ynUlPCSuVzAQDFZEHgRM7TKqfPaWxQv/
 0eUvt3rVQU/rb6zGTHG+emugA29bH19wXA5WcMUcecUy4C9/dBv1k+WE4wL/L2d1YOsR2ypq
 9yehG1n3uhI05ZWv0mu1Qqf6w9AsKQlWeLcCu//emu+pj10a4e+D2BDwQiKtK0QRGp1o7Tog
 ZTlpyR9xLpXZX11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8jdRw2Y55dIm64O
 Sc/XD+9A7cKZROXgVJfOdrtW6zGM4C6fTgaahwkRoUXOcUgHON21CpveVSRzwjQraTYqolmY
 M/zWZv9Uh4n5VFPlmXeqxE1jeB2nUjTBAr7GfjG8vhQ+eHGOi7LGedcYQHmgyJQxPrsnTg5O
 u13b6OioyizmsWkCsUL2eb/9Ww3EEU=
IronPort-HdrOrdr: A9a23:0ZkUh6CgYJd0UW7lHemq55DYdb4zR+YMi2TC1yhKJiC9Ffbo8P
 xG/c5rrCMc5wxxZJhNo7290ey7MBHhHP1OkO0s1NWZPDUO0VHAROoJ0WKh+UyEJ8SXzJ866U
 4KScZD4bPLYWSS9fyKgzWFLw==
X-IronPort-AV: E=Sophos;i="5.93,210,1654574400"; 
   d="scan'208";a="76424230"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [OSSTEST PATCH 2/2] ts-libvirt-build: Rework to build with meson
Date: Tue, 2 Aug 2022 11:26:02 +0100
Message-ID: <20220802102602.131992-3-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220802102602.131992-1-anthony.perard@citrix.com>
References: <20220802102602.131992-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

libvirt have switch build system to Meson + Ninja, there is no more
autogen.sh script.

Add missing dependency "libtirpc-dev" and "meson".

libvirt needs at least meson 0.54, the version avaiable in Debian
Buster is too old, but we can install it from backports.

In order to find out if Meson is used or not, we'll check if the
"autogen.sh" script is missing. And in the build dir, we will look for
a "Makefile".

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 ts-libvirt-build  | 70 +++++++++++++++++++++++++++++++++--------------
 ts-xen-build-prep |  8 +++++-
 2 files changed, 56 insertions(+), 22 deletions(-)

diff --git a/ts-libvirt-build b/ts-libvirt-build
index e799f00375f7..16b45cfd02bf 100755
--- a/ts-libvirt-build
+++ b/ts-libvirt-build
@@ -50,32 +50,56 @@ sub config() {
     }
     die "no xen prefix" unless $xenprefix;
 
-    # Uses --no-git because otherwise autogen.sh will undo
-    # submodulefixup's attempts to honour
-    # revision_libvirt_gnulib. This in turn requires that we specify
-    # --gnulib-srcdir, but ./autogen.sh doesn't propagate
-    # --gnulib-srcdir to ./bootstap so we use GNULIB_SRCDIR directly.
-    my $gnulib = submodule_find($submodules, "gnulib");
-    target_cmd_build($ho, 3600, $builddir, <<END);
-        cd libvirt
-	mkdir build
-	cd build
-        CFLAGS="-g -I$xenprefix/include/" \\
-        LDFLAGS="-g -L$xenprefix/lib/ -Wl,-rpath-link=$xenprefix/lib/" \\
-        PKG_CONFIG_PATH="$xenprefix/lib/pkgconfig/" \\
-        GNULIB_SRCDIR=$builddir/libvirt/$gnulib->{Path} \\
-            ../autogen.sh --no-git \\
-                         --with-libxl --without-xen --without-xenapi --without-selinux \\
-                         --without-lxc --without-vbox --without-uml \\
-                         --without-qemu --without-openvz --without-vmware \\
-                         --sysconfdir=/etc --localstatedir=/var #/
+    my $cflags = "-g -I$xenprefix/include/";
+    my $ldflags = "-g -L$xenprefix/lib/ -Wl,-rpath-link=$xenprefix/lib/";
+    my $pkg_config_path = "$xenprefix/lib/pkgconfig/";
+
+    if (target_file_exists($ho, "$builddir/libvirt/autogen.sh")) {
+        # Uses --no-git because otherwise autogen.sh will undo
+        # submodulefixup's attempts to honour
+        # revision_libvirt_gnulib. This in turn requires that we specify
+        # --gnulib-srcdir, but ./autogen.sh doesn't propagate
+        # --gnulib-srcdir to ./bootstap so we use GNULIB_SRCDIR directly.
+        my $gnulib = submodule_find($submodules, "gnulib");
+        target_cmd_build($ho, 3600, $builddir, <<END);
+            cd libvirt
+            mkdir build
+            cd build
+            CFLAGS="$cflags" \\
+            LDFLAGS="$ldflags" \\
+            PKG_CONFIG_PATH="$pkg_config_path" \\
+            GNULIB_SRCDIR=$builddir/libvirt/$gnulib->{Path} \\
+                ../autogen.sh --no-git \\
+                             --with-libxl --without-xen --without-xenapi --without-selinux \\
+                             --without-lxc --without-vbox --without-uml \\
+                             --without-qemu --without-openvz --without-vmware \\
+                             --sysconfdir=/etc --localstatedir=/var #/
+END
+    } else {
+        target_cmd_build($ho, 3600, $builddir, <<END);
+            cd libvirt
+            meson setup \\
+                -Dc_args='$cflags' \\
+                -Dc_link_args='$ldflags' \\
+                --pkg-config-path='$pkg_config_path' \\
+                --auto-features=disabled \\
+                -Ddriver_libxl=enabled \\
+                -Ddriver_libvirtd=enabled \\
+                -Ddriver_remote=enabled \\
+                --sysconfdir=/etc --localstatedir=/var \\
+                build
 END
+    }
 }
 
 sub build() {
     target_cmd_build($ho, 3600, $builddir, <<END);
         cd libvirt/build
-        (make $makeflags 2>&1 && touch ../../build-ok-stamp) |tee ../log
+        if [ -e Makefile ]; then
+            (make $makeflags 2>&1 && touch ../../build-ok-stamp) |tee ../log
+        else
+            (ninja 2>&1 && touch ../../build-ok-stamp) |tee ../log
+        fi
         test -f ../../build-ok-stamp #/
         echo ok.
 END
@@ -85,7 +109,11 @@ sub install() {
     target_cmd_build($ho, 300, $builddir, <<END);
         mkdir -p dist
         cd libvirt/build
-        make $makeflags install DESTDIR=$builddir/dist
+        if [ -e Makefile ]; then
+            make $makeflags install DESTDIR=$builddir/dist
+        else
+            DESTDIR=$builddir/dist ninja install
+        fi
         mkdir -p $builddir/dist/etc/init.d
 END
     target_putfilecontents_stash($ho, 60,
diff --git a/ts-xen-build-prep b/ts-xen-build-prep
index e76c0254bfd0..3ae8f215440b 100755
--- a/ts-xen-build-prep
+++ b/ts-xen-build-prep
@@ -199,7 +199,7 @@ END
 sub prep () {
     my @packages = qw(mercurial rsync figlet
                       build-essential bin86 bcc iasl bc
-                      flex bison cmake ninja-build
+                      flex bison cmake ninja-build meson
                       libpci-dev libncurses5-dev libssl-dev python-dev
                       libx11-dev git-core uuid-dev gettext gawk
                       libsdl-dev libyajl-dev libaio-dev libpixman-1-dev
@@ -209,6 +209,7 @@ sub prep () {
                       libdevmapper-dev libxml-xpath-perl libelf-dev
                       ccache nasm checkpolicy ebtables
 		      python3-docutils python3-dev
+                      libtirpc-dev
                       libgnutls28-dev);
 
     if ($ho->{Suite} =~ m/squeeze|wheezy|jessie/) {
@@ -251,6 +252,11 @@ END
         target_install_packages($ho, 'libc6-dev-i386');
     }
 
+    if ($ho->{Suite} =~ m/buster/) {
+        # libvirt needs a newer version of "meson"
+        target_install_packages_backport($ho, 'meson');
+    }
+
     some_extradebs($ho, [ 'DebianExtraPackages', 'build', $ho->{Suite} ]);
 }
 
-- 
Anthony PERARD


