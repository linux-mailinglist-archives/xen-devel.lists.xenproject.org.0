Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F353259054E
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 19:00:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384964.620568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBXQ-0002Xh-2F; Thu, 11 Aug 2022 17:00:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384964.620568; Thu, 11 Aug 2022 17:00:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBXP-0002KO-GX; Thu, 11 Aug 2022 17:00:03 +0000
Received: by outflank-mailman (input) for mailman id 384964;
 Thu, 11 Aug 2022 17:00:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jhQd=YP=citrix.com=prvs=21531f474=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oMBNG-0003Aq-S4
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 16:49:35 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93328ea4-1995-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 18:49:33 +0200 (CEST)
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
X-Inumbo-ID: 93328ea4-1995-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660236573;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uMtbT9OvCCyn0S146BCICiBUUfTxeCiBwu/GDB4z7hw=;
  b=FOFga99893KBBx+W9cGQRyYl/0RF7LyBfhadKIMo74J93ZE0sZXg5ftM
   IFtXjjmZmQ+ZYh6tgkS5hlYmM4bbXAKeJOYjICxVDXIG1AAdiszmV08wY
   Ma2pEdr+RqUZvGElS1U6WygVbjVCEZSIKJWZZFU2D5R+iS4OsoxM403rv
   o=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77650151
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:STpru6NeRopNBTTvrR3Pl8FynXyQoLVcMsEvi/4bfWQNrUp0hTABn
 2AWWT2BaayDNmumKIx+YNni9h5UvJSGmIVmHgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH3dOCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kqsyj5UAbeKRWmthg
 vuv5ZyEULOZ82QsaDhMu/va8EkHUMna41v0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 woU5Ojklo9x105F5uKNyt4XQGVTKlLhFVHmZk5tc7qjmnB/Shkaic7XAha+hXB/0F1ll/gpo
 DlEWAfZpQ0BZsUgk8xFO/VU/r0X0QSrN9YrLFDm2fF/wXEqfFPlwa1jIGwWerRB2c1ODzBnq
 7s3C2wCO0Xra+KemNpXS8Fpj8UnasLqIJkeqjdryjSx4fQOGM6ZBf+QvJkBgWl21psm8fX2P
 qL1bRJmagjAZBtefE8aEpskkM+jh2Xlci0eo1WQzUYyyzeMklEpieW0WDbTUoKNW+QIjli6n
 Umc+mXUHDEAOoTEzBPQpxpAgceQxHimCer+DoaQ6fpCkFCVgGsJB3U+UUawqL+3g0i1VtZbN
 mQd4C9opq83nGS7Q9+4UxCmrXqsuh8HR8EWA+A88BuKyKff/0CeHGdsc9JaQIV47olsH2Vsj
 wLX2YOybdByjFGLYXufrrq4gBP1AHE2BlYMNAZaCiQmv9a29enfkSnzosZf/L+d14OrQWmhn
 GnT8kDSlJ1I05dVivzTEUTvxmv1+8OXFlNdChD/BDrN0+9vWGKyi2VEA3D/5O0IEouWR0LpU
 JMsy5nHt7Bm4X1geUWwrAQx8FKBva/t3MX02wIHInXY323FF4SfVY5R+ipiA0xiL9wJfzTkC
 GeK510JvMALZSr6MPUtC25UNyjN5faIKDgYfqqMMoomjmZZLWdrAx2ClWbPhjuwwSDAYIk0O
 IuBcNbEMEv2/Z9PlWPuL89AgOBD+8zL7TmMLXwN50j4jOH2ib/8YettDWZimchltf/Y/FiOo
 4oGXyZIoj0GONDDjuDs2dZ7BTg3wbITXvgad+Q/mja/Hzdb
IronPort-HdrOrdr: A9a23:1uBn5KzFQd+EeIWxeoFRKrPwFL1zdoMgy1knxilNoRw8SKKlfq
 eV7ZImPH7P+U4ssR4b+exoVJPtfZqYz+8R3WBzB8bEYOCFghrKEGgK1+KLqFeMJ8S9zJ846U
 4JSdkGNDSaNzlHZKjBjzVQa+xQouW6zA==
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="77650151"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Luca Fancellu
	<luca.fancellu@arm.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v4 20/32] tools: Add -Werror by default to all tools/
Date: Thu, 11 Aug 2022 17:48:33 +0100
Message-ID: <20220811164845.38083-21-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811164845.38083-1-anthony.perard@citrix.com>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

And provide an option to ./configure to disable it.

A follow-up patch will remove -Werror from every other Makefile in
tools/. ("tools: Remove -Werror everywhere else")

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
 tools/configure.ac |  1 +
 tools/Rules.mk     |  4 ++++
 config/Tools.mk.in |  1 +
 tools/configure    | 26 ++++++++++++++++++++++++++
 4 files changed, 32 insertions(+)

diff --git a/tools/configure.ac b/tools/configure.ac
index 32cbe6bd3c..09059bc569 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -81,6 +81,7 @@ m4_include([../m4/header.m4])
 AX_XEN_EXPAND_CONFIG()
 
 # Enable/disable options
+AX_ARG_DEFAULT_ENABLE([werror], [Build tools without -Werror])
 AX_ARG_DEFAULT_DISABLE([rpath], [Build tools with -Wl,-rpath,LIBDIR])
 AX_ARG_DEFAULT_DISABLE([githttp], [Download GIT repositories via HTTP])
 AX_ARG_DEFAULT_ENABLE([monitors], [Disable xenstat and xentop monitoring tools])
diff --git a/tools/Rules.mk b/tools/Rules.mk
index 26958b2948..a165dc4bda 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -133,6 +133,10 @@ endif
 
 CFLAGS_libxenlight += $(CFLAGS_libxenctrl)
 
+ifeq ($(CONFIG_WERROR),y)
+CFLAGS += -Werror
+endif
+
 ifeq ($(debug),y)
 # Use -Og if available, -O0 otherwise
 dbg_opt_level := $(call cc-option,$(CC),-Og,-O0)
diff --git a/config/Tools.mk.in b/config/Tools.mk.in
index 6c1a0a676f..d0d460f922 100644
--- a/config/Tools.mk.in
+++ b/config/Tools.mk.in
@@ -1,5 +1,6 @@
 -include $(XEN_ROOT)/config/Paths.mk
 
+CONFIG_WERROR       := @werror@
 CONFIG_RUMP         := @CONFIG_RUMP@
 ifeq ($(CONFIG_RUMP),y)
 XEN_OS              := NetBSDRump
diff --git a/tools/configure b/tools/configure
index 41deb7fb96..acd9a04c3b 100755
--- a/tools/configure
+++ b/tools/configure
@@ -716,6 +716,7 @@ ocamltools
 monitors
 githttp
 rpath
+werror
 DEBUG_DIR
 XEN_DUMP_DIR
 XEN_PAGING_DIR
@@ -805,6 +806,7 @@ with_xen_scriptdir
 with_xen_dumpdir
 with_rundir
 with_debugdir
+enable_werror
 enable_rpath
 enable_githttp
 enable_monitors
@@ -1490,6 +1492,7 @@ Optional Features:
   --disable-FEATURE       do not include FEATURE (same as --enable-FEATURE=no)
   --enable-FEATURE[=ARG]  include FEATURE [ARG=yes]
   --disable-largefile     omit support for large files
+  --disable-werror        Build tools without -Werror (default is ENABLED)
   --enable-rpath          Build tools with -Wl,-rpath,LIBDIR (default is
                           DISABLED)
   --enable-githttp        Download GIT repositories via HTTP (default is
@@ -4111,6 +4114,29 @@ DEBUG_DIR=$debugdir_path
 
 # Enable/disable options
 
+# Check whether --enable-werror was given.
+if test "${enable_werror+set}" = set; then :
+  enableval=$enable_werror;
+fi
+
+
+if test "x$enable_werror" = "xno"; then :
+
+    ax_cv_werror="n"
+
+elif test "x$enable_werror" = "xyes"; then :
+
+    ax_cv_werror="y"
+
+elif test -z $ax_cv_werror; then :
+
+    ax_cv_werror="y"
+
+fi
+werror=$ax_cv_werror
+
+
+
 # Check whether --enable-rpath was given.
 if test "${enable_rpath+set}" = set; then :
   enableval=$enable_rpath;
-- 
Anthony PERARD


