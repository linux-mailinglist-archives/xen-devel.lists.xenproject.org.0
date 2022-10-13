Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 957CB5FD9D2
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 15:05:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422020.667814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixtz-0002DQ-23; Thu, 13 Oct 2022 13:05:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422020.667814; Thu, 13 Oct 2022 13:05:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixty-0002Aj-VD; Thu, 13 Oct 2022 13:05:30 +0000
Received: by outflank-mailman (input) for mailman id 422020;
 Thu, 13 Oct 2022 13:05:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d8dk=2O=citrix.com=prvs=278749026=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oixtx-0001tl-1N
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 13:05:29 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7653bf6-4af7-11ed-8fd0-01056ac49cbb;
 Thu, 13 Oct 2022 15:05:06 +0200 (CEST)
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
X-Inumbo-ID: a7653bf6-4af7-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665666327;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uMtbT9OvCCyn0S146BCICiBUUfTxeCiBwu/GDB4z7hw=;
  b=Lssi63DSGjkrj0ROCCgtI1fB7YmXSPxdlFhArEI47GMJ9O3jgn9t02sb
   9sUTB2jAbJDhKtBxBFoD0/ineNElZk24qYITcOrLJbI8MWGSUa6ZYu0JE
   eicBxXlbB5G3OQ+QZTJdOHoqJkRmhvoIO9BAr3x7uFmuB00FXqDKwIrXm
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 82660695
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: =?us-ascii?q?A9a23=3ALkY9Va7I9QmVYQHL/35oAAxR2vbMJQZQLiYv2?=
 =?us-ascii?q?9bIXmNSXhzvzPLM5wBkF31ARqiwpsLxTDuk2K5y4Fltw4rHtUhMcdOLQjwCb?=
 =?us-ascii?q?f3UD1utrioGJcIt4OZ/tjYNCi4ujkJMXCU9cPX3Q4OgGBMQFJQAlSrNy4hwQ?=
 =?us-ascii?q?vVPWB7Uzo4IImWWayClEksCRdi/DUdPCvCpCfAc403pIYIdttpLONV2N3mmN?=
 =?us-ascii?q?8/cWy26ntknqBcy/B1vtszfsWR/SfRGHYyHBNlXrldqDpDzSPa/1cgcP4Pne?=
 =?us-ascii?q?fU7Ee3D4eyjPzdc/eGRDowRIxyVcl+Vn0nY+PzCBs/JEBnOLiJgfa2bjfEJf?=
 =?us-ascii?q?NaqRSj3eoX6ehEQntN1XeRD6YFsMOie1hj0KmOCh2YdEVM/5jcg+YMARNIzC?=
 =?us-ascii?q?5LTR0sv2AdYFYZuf7EdjfMoV7KJQPaXVGmO+ddxBIweSIl3KD2BvzSDa9g69?=
 =?us-ascii?q?ij9bHEvgRUWMR2F9jYXKOEhKVgj/rBDSIL5QicT5J5q9RUWm7THJHov8CUlx?=
 =?us-ascii?q?SVEzC5uKaLok41jrHS5gaye/MmG/I/pitUNOG55Lc03ZalB1xLEicoFCzjUh?=
 =?us-ascii?q?JSzc8GUIVAfDyyDQjpnggMXgk6BJSWc+DPA8vKsekCJZRy8Ib9Zx/WnY/MXW?=
 =?us-ascii?q?NycMFpeUNS2ToLWHW1rJwCOojs8VVZ2uY/odHDqtQgwheS/gRl0Vcs0uw+OJ?=
 =?us-ascii?q?6rhaCGae0mpnrXzuy/zEMT5ffmfSNsV1vWksE26Lc4TQ4+VPOFALwbG/4VCW?=
 =?us-ascii?q?UWiZz8gAXp9LHEp+v5S0UbeI0fkZZ4r9WT+5EMDH/KUk1P/YJb89lL/LIMlj?=
 =?us-ascii?q?nAlLof5lRxYJ1qEnfNGP813Z4hZGaYtsziWn8INK9pZ+Pj0d7P3jZBkCwQ9c?=
 =?us-ascii?q?KcW0TIIIkoymCB+bsgXyhSL1t/HNnEt9XkT5N1tNlg1w7DVPKtRGO/yG5mNX?=
 =?us-ascii?q?RwbPTjQrqw1uwRbKdPQ7ffc6Qo7V27qbxBzvkEzHC3eX4e4jbDrCvktxHm5G?=
 =?us-ascii?q?umHE7uQeWcp9pwLl6DMHbHX+LHeIo7kSJVIwr0kamxjxLksxv8EvyDl5sQBJ?=
 =?us-ascii?q?tMHMk1eE2e1GMZMhbnoNRym3yMy6bxzY2s1S10SVfpui7AcK61csq+g6kbVh?=
 =?us-ascii?q?n1miSnr6aByUpn6Wqtff0S/gQQwxPnWtImFJU6ep0cRI4Y7WqRzCpJJq2uXg?=
 =?us-ascii?q?oMav4zoQftC07x0U4iAO2Gg/QO614Z7dIowH92mhVaaYU2ROgCANKhp1xtaK?=
 =?us-ascii?q?s0BK4J3D+7JuuCsj70Son9rJWx/dyM8PPy5W+wVJEm3D6TUyeCaIRO0LttQ+?=
 =?us-ascii?q?jetpcSK5N1fzukUaKZ/B/8qSxyP9uypx8NlsNtkhn/KvpGPCHoKp54nngGDO?=
 =?us-ascii?q?JQ7bElCz2JH2XwsinHpePzeRGkvEeXsFUK4++lC6pRJChW4b+stcquIo1ZNk?=
 =?us-ascii?q?YLvYewPZE8f+YruiLvByL6k0i7NUKRi1DapsFRM013HgnEGrqdUylvHio8jh?=
 =?us-ascii?q?B4rrxybBldOFK2ik/klXnDF7d5+l9e4tC1KLSX7LNN2kP8rMkepUpO7TYEcQ?=
 =?us-ascii?q?9DcD23G994np4Eln0puX21fpUINVkv7CfPzezp3/ZaBpNrbve2Ih/zVcRusn?=
 =?us-ascii?q?GXet0fsa9j1hve9PIZo9fMLnLvhcbybeqknBVKBF+jIl7dfFgZVMPWkCPhCn?=
 =?us-ascii?q?ObC/wzF8gxzXoN7nsOJOQl+34ZVm2uoRHImN0MuWsbDUrJ+5CbGXM9eou/QZ?=
 =?us-ascii?q?voo8XKwWXhMavDHbZnSrbJiK+bnwKw9ADVKP12rHYLdqKLK6HSRJDXvckEJ+?=
 =?us-ascii?q?v+oK1YN2Mm61d1psy+UH3N3xqUwgFkkyJqC0Ie1Q/oo/UA07Riu5vkbiVBMX?=
 =?us-ascii?q?hoApP1/lCJkHEsENUVcF/9y50Jv3BrZzAI4mwwUVzoJX8ug4ysNZrL+mg7cK?=
 =?us-ascii?q?Y/z/CbT33556+7uUKySmpbTWD8P8qM381v/vJtolUGp0iFs0SiKqiVUneSY+?=
 =?us-ascii?q?xfRKNFt8+t5cr9W0Yg5kkpne92cAdSo9lbkDBwOfgTDoeQo1nPFn2f0RuDxs?=
 =?us-ascii?q?556c9xBzmxTX2fKo61+Fzbd9UcEa8zJcYGDT61bbokThd+iYUtiIWd8i8stA?=
 =?us-ascii?q?SwrY5zR6xYTbaRtl2GfN1Ml3C/Nr+0PYUPkntFf99Sv40X5/nlyEseIPpTJE?=
 =?us-ascii?q?tqBjPVcGPfr/KhCIXiwoffGbEXvfYb0YwvJTHxO++dguS+5ZyXKdRzv2ys30?=
 =?us-ascii?q?O5ernjLgpowYARSm7QGNgGtRIMVR7DjPHGjpLy+P18BJlT3DeJ7Ftjehd7bk?=
 =?us-ascii?q?HJREX/2bJz4PTYl1jj7ZiyvUOT1YorRBAKufACs5KHl2Z0iHuvFsAh0OvDQB?=
 =?us-ascii?q?c0vysTksHAzQDAxzZXKnOlzQIuZWVoNADkx/ZLiSKfTDcs1cYoFHB+qDJc/s?=
 =?us-ascii?q?uMDJd5WRGqf2s9SM7DhiJFeCijT23Hj1xmwTFEhrM6qufmkqxOg+Chi377o4?=
 =?us-ascii?q?AkZhLWNVPyQ30RP69y8rp7+iBU3o+pW0vS0wxz65ikgWcCEV/AdqHu2dKlh/?=
 =?us-ascii?q?/RCon8ctUwwQdAyWwD9QqluGFfhXQVNEzpcfnZYbd3rKqt9YCDPlt9kvfUJF?=
 =?us-ascii?q?1n3Y4/AOQox56pMw/oztc7s5PH6JYHEOMP2JdtdbHdDI3dAyYDWp0P/2AC6I?=
 =?us-ascii?q?TACnr4jyL0jGrEVGd1/R4afWietbBXED/VPUbRTrPDoRntDQ4lsTRL6BrWYD?=
 =?us-ascii?q?/Z+CnD0bZFoH5IBilnPMY+Q2mB9JKGznGY3?=
X-IronPort-AV: E=Sophos;i="5.95,180,1661832000"; 
   d="scan'208";a="82660695"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Luca Fancellu
	<luca.fancellu@arm.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH for-4.17 v5 04/17] tools: Add -Werror by default to all tools/
Date: Thu, 13 Oct 2022 14:05:00 +0100
Message-ID: <20221013130513.52440-5-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221013130513.52440-1-anthony.perard@citrix.com>
References: <20221013130513.52440-1-anthony.perard@citrix.com>
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


