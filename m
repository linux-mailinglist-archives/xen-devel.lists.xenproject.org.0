Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E97AE559E33
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 18:08:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355702.583585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lrP-0000ZL-0h; Fri, 24 Jun 2022 16:08:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355702.583585; Fri, 24 Jun 2022 16:08:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lrO-0000X2-Ry; Fri, 24 Jun 2022 16:08:42 +0000
Received: by outflank-mailman (input) for mailman id 355702;
 Fri, 24 Jun 2022 16:08:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7mLY=W7=citrix.com=prvs=16756bcf7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o4loB-0004qc-2N
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 16:05:23 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6f0614cd-f3d7-11ec-b725-ed86ccbb4733;
 Fri, 24 Jun 2022 18:05:15 +0200 (CEST)
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
X-Inumbo-ID: 6f0614cd-f3d7-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656086714;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=n/V1L71RdFQfMeSoM2sfB601hpOlEv718nuVnaqP+yY=;
  b=Mxz3IsSDUYEwGIqT8q2T7SLu60oSPbZO0/W90gmvaHxNuCH3E5EyY/Q4
   XcKPFJubZ15ILLAD0xR+iBqyrl7i1edYTL2HPgxvMr0aymcfLf6xKeeJz
   VT1LNCEDDu+UrX+xABzZ944XinAKl4OiBn06w3f6yJV0WhO8ZUE1PaTXK
   8=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 74384250
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:s0YkjaqdO65Bk1NcMNl7GikLILdeBmJRZRIvgKrLsJaIsI4StFCzt
 garIBnXP6yKY2D9ftB/bdi3p0hTupCAx9I3SAtpq39kFXsa8puZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrRRbrJA24DjWVvT4
 4+q+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBLpPjl90wcD1iEAZOG78Bx+ftGWa4iJnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVIxDfFDfEgUNbbTr/D/9Nw1zYsnMFeW/3ZY
 qL1bBIwME+QP0cSYj/7DroGrNiOm37BIgQI8l+W9Zor6WWKyQ9uhe2F3N39JYXRGJQ9clyjj
 n3C13T0BFcdLtP34SqI9Degi/HCmQv/WZkOD/uo+/hymlqRy2cPThoMWjOGTeKR0xDkHYgFc
 gpNp3Ro/fNaGFGXosfVTyOXr0epnTomWP1gNf9911mn8rTT2lPMboQbdQKteODKpedvG2F0j
 gTUx4y5bdB8mObLECzAr994uRv3YHFIdjFaOEfoWCNfu7HeTJcPYgUjpzqJOIq8lZXLFD752
 FhmRwBu1uxI3abnO0hWlG0rYg5ARbCTF2bZHi2NAgqYAvpRPeZJnbCA51nB9upnJ42EVFSHt
 3Vss5HAsb5WVcDUy3DVGLpl8FSVCxCtamW0bblHT/EcG8mFoSb/Lei8HhkkTKuWDir0UWCwO
 xKC0e+gzJRSIGGrfcdKXm5FMOxzlfKIPY28Dpj8N4MSCrAsJF7v1Hw/Pia4gjGy+HXAZIliY
 P93h+73Vi1EYUmmpRLrL9ogPUgDnHFgnD2PGsGgkXxKE9O2PRaodFvMC3PWBshR0U9OiFm9H
 wp3XydS9yhibQ==
IronPort-HdrOrdr: A9a23:6SU69KhbQzLtZFRWXCxw4w10+nBQXtwji2hC6mlwRA09TySZ//
 rAoB19726StN9xYgBYpTnuAsi9qB/nmKKdpLNhX4tKPzOW3FdATrsD0WKK+VSJcEfDH6xmpM
 JdmsBFebvN5DNB4/oSjjPVLz9Z+qjlzJyV
X-IronPort-AV: E=Sophos;i="5.92,218,1650945600"; 
   d="scan'208";a="74384250"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v3 24/25] tools: Add -Werror by default to all tools/
Date: Fri, 24 Jun 2022 17:04:21 +0100
Message-ID: <20220624160422.53457-25-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624160422.53457-1-anthony.perard@citrix.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

And provide an option to ./configure to disable it.

A follow-up patch will remove -Werror from every other Makefile in
tools/. ("tools: Remove -Werror everywhere else")

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/configure.ac |  1 +
 tools/Rules.mk     |  4 ++++
 config/Tools.mk.in |  1 +
 tools/configure    | 26 ++++++++++++++++++++++++++
 4 files changed, 32 insertions(+)

diff --git a/tools/configure.ac b/tools/configure.ac
index 1094d896fc..06311b99c2 100644
--- a/tools/configure.ac
+++ b/tools/configure.ac
@@ -79,6 +79,7 @@ m4_include([../m4/header.m4])
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
index a052c186a5..986cb1d933 100755
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


