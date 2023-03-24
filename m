Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA1AA6C8697
	for <lists+xen-devel@lfdr.de>; Fri, 24 Mar 2023 21:15:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.514411.796607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfnoF-0002yH-6A; Fri, 24 Mar 2023 20:14:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 514411.796607; Fri, 24 Mar 2023 20:14:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfnoF-0002v6-21; Fri, 24 Mar 2023 20:14:47 +0000
Received: by outflank-mailman (input) for mailman id 514411;
 Fri, 24 Mar 2023 20:14:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GJ5Y=7Q=citrix.com=prvs=4404309fd=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pfnoD-0002v0-3t
 for xen-devel@lists.xenproject.org; Fri, 24 Mar 2023 20:14:45 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8089ebc8-ca80-11ed-b464-930f4c7d94ae;
 Fri, 24 Mar 2023 21:14:39 +0100 (CET)
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
X-Inumbo-ID: 8089ebc8-ca80-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1679688879;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6+X5iWEq4/xfHK18TenmEa1/hd5O+w32aYVsdrJSDGQ=;
  b=DeoTjrhbwj7d9zvcQQqNEWsHHdMpA4TSwhqAd89hwWqAi4mGxfr0QiJb
   RoViHGWSMoN+F2nQXLS7aRgIetzNzHza8HAuMXyhxgOd8uf0Suthq9/n9
   EUKumgVryKhlHAakDA8nVaco/P4TXcR9rX4esaPvUwXj5sEdJbxcpOg0G
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 104684418
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:776MNajaPYBG7WmjQWu4yn5QX161WxAKZh0ujC45NGQN5FlHY01je
 htvDWGFPK2DYTfwLtF3PYjj9hkB75GAnNBiT1Bk+C09Q3wb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWi0N8klgZmP6sT5wWCzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQoLzkIVBa9mtir2bGmbrI1nvkfKu3CadZ3VnFIlVk1DN4jSJHHBa7L+cVZzHE7gcUm8fT2P
 pRDL2A1NVKZPkMJYw1MYH49tL7Aan3XWjtUsl+K44Ew5HDe1ldZ27nxKtvFPNeNQK25m27B/
 j6YrzilW0Fy2Nq35WqiwmP9psv0sQilUtNMKrKU/OFyuQjGroAUIEJPDgbqyRWjsWauVtQaJ
 0EK9y4Gqakp6FftXtT7Rwe/onOPolgbQdU4O+E37QCly6zK4h2YDGwJUj5AbtM9sMY8Azct0
 zehvfnkGDhuu729Um+G+/GfqjbaETMOMWYIaCsATA0Ey9ruuoc+ilTIVNkLOLGxps34H3f32
 T/ihCojg7Qei+Yb2qP9+krI6w9AvbCQEFRzvF+OGDv4sEUgPtXNi5GUBUbz3fFJKbyfcES7o
 WEHhuzFtfgzMZepvXnYKAkSJ41F98ppIRWF3wE+Qcd8rW/1k5KwVdsOuW8jfS+FJu5BIGa0O
 xGL5Gu98bcJZBOXgblLj5Vd4ijA5YzpDpzbW//ddbKiibAhJVbcrEmCiaN9tl0BcXTAcollY
 /93ie72UR4n5V1PlVJavds1374x3TwZzmjOX539xBnP+ePAOy/LGexdaQrVN71RAEa4TOL9r
 b5i2zaikU0DAIUSnAGOmWLsEbz6BSdiXs2nwyCmXuWCPhBnCAkcNhMl+pt4I9YNt/0Mxo/1E
 oSVBhcwJKzX2SeWdm1nqxlLNNvSYHqIhS1lZnN2bQ7xgRDOo++Htc8iSnf+RpF/nMQL8BK+Z
 6JaEylcKpyjkgj6xgk=
IronPort-HdrOrdr: A9a23:TxsXhKh1KVItDjIE/hnteY+KanBQXtYji2hC6mlwRA09TySZ//
 rBoB19726RtN9xYgBHpTnuAsm9qB/nmaKdgrNhWItKPjOW21dARbsKheCJrgEIcxeOkdK1vp
 0AT0ERMrLN5CBB/KTH3DU=
X-IronPort-AV: E=Sophos;i="5.98,288,1673931600"; 
   d="scan'208";a="104684418"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Demi Marie Obenour
	<demi@invisiblethingslab.com>, George Dunlap <George.Dunlap@eu.citrix.com>,
	Jan Beulich <JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>, Julien Grall <julien@xen.org>
Subject: [PATCH] configure: Drop --enable-githttp
Date: Fri, 24 Mar 2023 20:14:04 +0000
Message-ID: <20230324201404.3247572-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Following Demi's work to use HTTPS everywhere, all users of GIT_HTTP have
been removed from the build system.  Drop the configure knob.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Demi Marie Obenour <demi@invisiblethingslab.com>
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
---
 INSTALL               |  5 -----
 config/Tools.mk.in    |  6 ------
 config/Toplevel.mk.in |  1 -
 configure             | 27 ---------------------------
 configure.ac          |  1 -
 tools/configure       | 27 ---------------------------
 tools/configure.ac    |  1 -
 7 files changed, 68 deletions(-)

diff --git a/INSTALL b/INSTALL
index 0d3eb89f0298..3816c17dcde8 100644
--- a/INSTALL
+++ b/INSTALL
@@ -89,11 +89,6 @@ from a wrong location. Compiling the tools with rpath will force the
 linker to look in the correct location.
   --enable-rpath
 
-During build in a git checkout the buildsystem needs to download
-additional tools such as qemu. This is done with either the native git
-protocol, or via http if this option is enabled.
-  --enable-githttp
-
 Disable xenstat and xentop monitoring tools.
   --disable-monitors
 
diff --git a/config/Tools.mk.in b/config/Tools.mk.in
index d0d460f922d8..6abb377564db 100644
--- a/config/Tools.mk.in
+++ b/config/Tools.mk.in
@@ -37,12 +37,6 @@ LIBNL3_LIBS         := @LIBNL3_LIBS@
 LIBNL3_CFLAGS       := @LIBNL3_CFLAGS@
 XEN_TOOLS_RPATH     := @rpath@
 
-# Download GIT repositories via HTTP or GIT's own protocol?
-# GIT's protocol is faster and more robust, when it works at all (firewalls
-# may block it). We make it the default, but if your GIT repository downloads
-# fail or hang, please pass --enable-githttp to configure.
-GIT_HTTP            ?= @githttp@
-
 # Optional components
 XENSTAT_XENTOP      := @monitors@
 OCAML_TOOLS         := @ocamltools@
diff --git a/config/Toplevel.mk.in b/config/Toplevel.mk.in
index 4ecacbb37d68..4db7eafcab5d 100644
--- a/config/Toplevel.mk.in
+++ b/config/Toplevel.mk.in
@@ -1,2 +1 @@
 SUBSYSTEMS               := @SUBSYSTEMS@
-GIT_HTTP                 ?= @githttp@
diff --git a/configure b/configure
index f5cd3c286b55..99f8434cbf64 100755
--- a/configure
+++ b/configure
@@ -594,7 +594,6 @@ stubdom
 tools
 xen
 subdirs
-githttp
 DEBUG_DIR
 XEN_DUMP_DIR
 XEN_PAGING_DIR
@@ -673,7 +672,6 @@ with_xen_scriptdir
 with_xen_dumpdir
 with_rundir
 with_debugdir
-enable_githttp
 enable_xen
 enable_tools
 enable_stubdom
@@ -1309,8 +1307,6 @@ Optional Features:
   --disable-option-checking  ignore unrecognized --enable/--with options
   --disable-FEATURE       do not include FEATURE (same as --enable-FEATURE=no)
   --enable-FEATURE[=ARG]  include FEATURE [ARG=yes]
-  --enable-githttp        Download GIT repositories via HTTP (default is
-                          DISABLED)
   --disable-xen           Disable build and install of xen
   --disable-tools         Disable build and install of tools
   --enable-stubdom        Enable build and install of stubdom
@@ -2124,29 +2120,6 @@ DEBUG_DIR=$debugdir_path
 
 
 
-# Check whether --enable-githttp was given.
-if test "${enable_githttp+set}" = set; then :
-  enableval=$enable_githttp;
-fi
-
-
-if test "x$enable_githttp" = "xno"; then :
-
-    ax_cv_githttp="n"
-
-elif test "x$enable_githttp" = "xyes"; then :
-
-    ax_cv_githttp="y"
-
-elif test -z $ax_cv_githttp; then :
-
-    ax_cv_githttp="n"
-
-fi
-githttp=$ax_cv_githttp
-
-
-
 case "$host_cpu" in
     i[3456]86|x86_64)
         arch_enable_stubdom=y
diff --git a/configure.ac b/configure.ac
index 3aea40715307..19d9311c2ae4 100644
--- a/configure.ac
+++ b/configure.ac
@@ -17,7 +17,6 @@ m4_include([m4/subsystem.m4])
 m4_include([m4/paths.m4])
 
 AX_XEN_EXPAND_CONFIG()
-AX_ARG_DEFAULT_DISABLE([githttp], [Download GIT repositories via HTTP])
 
 dnl mini-os is only ported to certain platforms
 case "$host_cpu" in
diff --git a/tools/configure b/tools/configure
index dae377c98252..bb5b1ae45067 100755
--- a/tools/configure
+++ b/tools/configure
@@ -714,7 +714,6 @@ ovmf
 xsmpolicy
 ocamltools
 monitors
-githttp
 rpath
 werror
 DEBUG_DIR
@@ -807,7 +806,6 @@ with_rundir
 with_debugdir
 enable_werror
 enable_rpath
-enable_githttp
 enable_monitors
 enable_ocamltools
 enable_xsmpolicy
@@ -1494,8 +1492,6 @@ Optional Features:
   --disable-werror        Build tools without -Werror (default is ENABLED)
   --enable-rpath          Build tools with -Wl,-rpath,LIBDIR (default is
                           DISABLED)
-  --enable-githttp        Download GIT repositories via HTTP (default is
-                          DISABLED)
   --disable-monitors      Disable xenstat and xentop monitoring tools (default
                           is ENABLED)
   --disable-ocamltools    Disable Ocaml tools (default is ENABLED)
@@ -4156,29 +4152,6 @@ rpath=$ax_cv_rpath
 
 
 
-# Check whether --enable-githttp was given.
-if test "${enable_githttp+set}" = set; then :
-  enableval=$enable_githttp;
-fi
-
-
-if test "x$enable_githttp" = "xno"; then :
-
-    ax_cv_githttp="n"
-
-elif test "x$enable_githttp" = "xyes"; then :
-
-    ax_cv_githttp="y"
-
-elif test -z $ax_cv_githttp; then :
-
-    ax_cv_githttp="n"
-
-fi
-githttp=$ax_cv_githttp
-
-
-
 # Check whether --enable-monitors was given.
 if test "${enable_monitors+set}" = set; then :
   enableval=$enable_monitors;
diff --git a/tools/configure.ac b/tools/configure.ac
index 3a2f6a2da9e0..9bcf42f233f1 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -84,7 +84,6 @@ AX_XEN_EXPAND_CONFIG()
 # Enable/disable options
 AX_ARG_DEFAULT_ENABLE([werror], [Build tools without -Werror])
 AX_ARG_DEFAULT_DISABLE([rpath], [Build tools with -Wl,-rpath,LIBDIR])
-AX_ARG_DEFAULT_DISABLE([githttp], [Download GIT repositories via HTTP])
 AX_ARG_DEFAULT_ENABLE([monitors], [Disable xenstat and xentop monitoring tools])
 AX_ARG_DEFAULT_ENABLE([ocamltools], [Disable Ocaml tools])
 AX_ARG_DEFAULT_ENABLE([xsmpolicy], [Disable XSM policy compilation])
-- 
2.30.2


