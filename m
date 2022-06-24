Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 539DB559E2F
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 18:08:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355662.583553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lr2-0007FV-SU; Fri, 24 Jun 2022 16:08:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355662.583553; Fri, 24 Jun 2022 16:08:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lr2-0007CA-LE; Fri, 24 Jun 2022 16:08:20 +0000
Received: by outflank-mailman (input) for mailman id 355662;
 Fri, 24 Jun 2022 16:08:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7mLY=W7=citrix.com=prvs=16756bcf7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o4lnv-0004qc-W5
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 16:05:08 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68d89563-f3d7-11ec-b725-ed86ccbb4733;
 Fri, 24 Jun 2022 18:05:05 +0200 (CEST)
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
X-Inumbo-ID: 68d89563-f3d7-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656086706;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tyXg2EhFGm7DWQjDWYVLoXwH1ePwX2W5U//FqRQR1+A=;
  b=XQaczMrdsZsx5bP5lEnnKI9U/XMvImfvjCr0/Rjm1e9SInZGwlkKfNx3
   7bP4n+W6f9b3e6DgZ1e6istOZDO7k34WYiwj/YQZ1kzKxTPJiEkYgua1a
   1GEMoH+/MPNFO4vOZWqX9UWUmjFf5QTRhcq5L2YbeY0CByYJSfAO+mPqU
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 74208140
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:CNulR6nu2NgbS3LUXnvdqdro5gzZJkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXX27SOPmCZDf9KYp1a43k8E1T6MOBndRgSwM/pH80FCMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BCpC48T8kk/vgqoPUUIYoAAgoLeNfYHpn2EgLd9IR2NYy24DnWV/V4
 7senuWEULOb828sWo4rw/rrRCNH5JwebxtB4zTSzdgS1LPvvyF94KA3fMldHFOhKmVgJcaoR
 v6r8V2M1jixEyHBqD+Suu2TnkUiGtY+NOUV45Zcc/DKbhNq/kTe3kunXRa1hIg+ZzihxrhMJ
 NtxWZOYbCgnGrbR38okDUdfHBtUZL188+/VPi3q2SCT5xWun3rExvxvCAc9PJEC+/YxCmZLn
 RAaAGlTNFbZ3bvwme/lDLk37iggBJCD0Ic3s3d8zTbfHLA+TIrKWani7t5ExjYgwMtJGJ4yY
 uJGNWA3PE2cO3WjPH9NIsIRm9yunUDkLSRhhXy+v/QSz1PqmVkZPL/Fb4OOJ43iqd9utkSXv
 GXd5EziHwoXcteYzFKt7XaEluLJ2yThV+o6BLC+s/JnnlCX7mgSEwENE0u2p+GjjUyzUM4ZL
 FYbkhfCtoBrqhbtFIOkGUTl/jjU5XbwRua8DcUfxw+p0beTzT/HWG8LdBQYeOYt5N0pEGlCO
 kCyoz/5OdB+mOTLFCzFrerM8mPa1Ts9djFbO3JdJecRy5y6+dxo0EqSJjp2OPTt5uAZDw0c1
 NxjQMIWo7wIxfAG2Kyglbwsq2L9/8OZJuLZC+i+Y45E0u+aTNT8D2BQwQKHhcus1a7AJrV7g
 FAKmtKF8McFBoyXmSqGTY0lRe/0ua7dYWSD3QY3QPHNEghBHVb5Jei8BxkuTHqFz+5eIWO5C
 KMtkVk5CGBv0IuCMvYsPtPZ5zUCxqn8D9X1Ps3pgi51SsEpLmevpXg2DWbJhjyFuBV8wMkXZ
 MbAGe7xXClyNEiS5GfvLwvr+eRwnX5WKKK6bc2T8ilLJpLENSDMF+taYQDQBg37hYvdyDjoH
 x9kH5Pi431ivCfWOEE7LaZ7wYg2EEUG
IronPort-HdrOrdr: A9a23:Hc1K86lMkwF9Eu8TzpxlfpyZgoXpDfIU3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE7gr5OUtQ4exoV5PhfZqxz/JICMwqTNKftWrdyQyVxeNZnOjfKlTbckWUnINgPO
 VbAsxD4bXLfCFHZK3BgTVQfexO/DD+ytHLudvj
X-IronPort-AV: E=Sophos;i="5.92,218,1650945600"; 
   d="scan'208";a="74208140"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>
Subject: [XEN PATCH v3 18/25] tools: Introduce $(xenlibs-rpath,..) to replace $(SHDEPS_lib*)
Date: Fri, 24 Jun 2022 17:04:15 +0100
Message-ID: <20220624160422.53457-19-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624160422.53457-1-anthony.perard@citrix.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This patch introduce a new macro $(xenlibs-dependencies,) to generate
a list of all the xen library that a library is list against, and they
are listed only once. We use the side effect of $(sort ) which remove
duplicates.

This is used by another macro $(xenlibs-rpath,) which is to replace
$(SHDEPS_libxen*).

In libs.mk, we don't need to $(sort ) SHLIB_lib* anymore as this was used
to remove duplicates and they are no more duplicates.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/Rules.mk     | 29 ++++++++++++++++-------------
 tools/libs/libs.mk |  2 +-
 2 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/tools/Rules.mk b/tools/Rules.mk
index 47424935ba..23979ed254 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -61,13 +61,8 @@ endif
 #           public headers. Users of libfoo are therefore transitively
 #           using libbaz's header but not linking against libbaz.
 #
-# SHDEPS_libfoo: Flags for linking recursive dependencies of
-#                libfoo. Must contain SHLIB for every library which
-#                libfoo links against. So must contain both
-#                $(SHLIB_libbar) and $(SHLIB_libbaz).
-#
 # SHLIB_libfoo: Flags for recursively linking against libfoo. Must
-#               contains SHDEPS_libfoo and:
+#               contains $(call xenlibs-rpath,foo) and:
 #                   -Wl,-rpath-link=<directory containing libfoo.so>
 #
 # CFLAGS_libfoo: Flags for compiling against libfoo. Must add the
@@ -79,23 +74,31 @@ endif
 #                libfoo.
 #
 # LDLIBS_libfoo: Flags for linking against libfoo. Must contain
-#                $(SHDEPS_libfoo) and the path to libfoo.so
+#                $(call xenlibs-rpath,foo) and the path to libfoo.so
 #
 # Consumers of libfoo should include $(CFLAGS_libfoo) and
 # $(LDLIBS_libfoo) in their appropriate directories. They should not
 # include any CFLAGS or LDLIBS relating to libbar or libbaz unless
 # they use those libraries directly (not via libfoo) too.
-#
-# Consumers of libfoo should not directly use $(SHDEPS_libfoo) or
-# $(SHLIB_libfoo)
+
+# Give the list of Xen library that the libraries in $(1) are linked against,
+# directly or indirectly.
+define xenlibs-dependencies
+    $(sort $(foreach lib,$(1), \
+        $(USELIBS_$(lib)) $(call xenlibs-dependencies,$(USELIBS_$(lib)))))
+endef
+
+# Flags for linking recursive dependencies of Xen libraries in $(1)
+define xenlibs-rpath
+    $(addprefix -Wl$(comma)-rpath-link=$(XEN_ROOT)/tools/libs/,$(call xenlibs-dependencies,$(1)))
+endef
 
 define LIB_defs
  FILENAME_$(1) ?= xen$(1)
  XEN_libxen$(1) = $$(XEN_ROOT)/tools/libs/$(1)
  CFLAGS_libxen$(1) = $$(CFLAGS_xeninclude)
- SHDEPS_libxen$(1) = $$(foreach use,$$(USELIBS_$(1)),$$(SHLIB_libxen$$(use)))
- LDLIBS_libxen$(1) = $$(SHDEPS_libxen$(1)) $$(XEN_libxen$(1))/lib$$(FILENAME_$(1))$$(libextension)
- SHLIB_libxen$(1) = $$(SHDEPS_libxen$(1)) -Wl,-rpath-link=$$(XEN_libxen$(1))
+ SHLIB_libxen$(1) = $$(call xenlibs-rpath,$(1)) -Wl,-rpath-link=$$(XEN_libxen$(1))
+ LDLIBS_libxen$(1) = $$(call xenlibs-rpath,$(1)) $$(XEN_libxen$(1))/lib$$(FILENAME_$(1))$$(libextension)
 endef
 
 $(foreach lib,$(LIBS_LIBS),$(eval $(call LIB_defs,$(lib))))
diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index f778a7df82..d7e1274249 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -32,7 +32,7 @@ PKG_CONFIG ?= $(LIB_FILE_NAME).pc
 PKG_CONFIG_NAME ?= Xen$(LIBNAME)
 PKG_CONFIG_DESC ?= The $(PKG_CONFIG_NAME) library for Xen hypervisor
 PKG_CONFIG_VERSION := $(MAJOR).$(MINOR)
-PKG_CONFIG_USELIBS := $(sort $(SHLIB_libxen$(LIBNAME)))
+PKG_CONFIG_USELIBS := $(SHLIB_libxen$(LIBNAME))
 PKG_CONFIG_LIB := $(LIB_FILE_NAME)
 PKG_CONFIG_REQPRIV := $(subst $(space),$(comma),$(strip $(foreach lib,$(patsubst ctrl,control,$(USELIBS_$(LIBNAME))),xen$(lib))))
 
-- 
Anthony PERARD


