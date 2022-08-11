Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F96590510
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 18:49:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384826.620381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBNB-000061-AO; Thu, 11 Aug 2022 16:49:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384826.620381; Thu, 11 Aug 2022 16:49:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBNB-0008Pm-3Z; Thu, 11 Aug 2022 16:49:29 +0000
Received: by outflank-mailman (input) for mailman id 384826;
 Thu, 11 Aug 2022 16:49:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jhQd=YP=citrix.com=prvs=21531f474=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oMBN9-0003s9-LG
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 16:49:27 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e4d9076-1995-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 18:49:26 +0200 (CEST)
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
X-Inumbo-ID: 8e4d9076-1995-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660236566;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=y0p9wecYa39WMmq/hIK8QCu/gWTJKL1bo3dIpGAizxw=;
  b=LXr7GhqkeV+/WVXnN+t7PyLC5lYakUZSW3m6VJjbsIK1qefuDsgz+iiu
   SRYJmAUdAuGBqG+W2i+GJQhAotMagWCGqfajhb0S2x8Wb+R+hK1nIMFbz
   5EE1oXNKO2y4bZewjobv/L67A+tnP8SWVX9wjcw1nqBv06+aXHA08D50Z
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 77134689
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:CzK5X6qfq+vdpDvHMWG4GGszpb9eBmJ0ZRIvgKrLsJaIsI4StFCzt
 garIBmOOf2NYWH9Kdxya4nl/U8Avp6GnYJiTFM6qiw0RSsU+JuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNPg06/gEk35q6q6GpB5gZWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqVIwORaGmFv0
 scSNTkXMz282+nn6ZSCH7wEasQLdKEHPasas3BkizrYEewnUdbIRKCiCd1whWlqwJoURLCHO
 pRfOWEHgBfoOnWjPn8eDo4+m+G5wGHyaTRCpHqepLYt4niVxwt0uFToGIWKI4fWG5UE9qqej
 kWF8GXgAR0aCNmC8Sue8Sye1t6U3hquDer+E5Xnr6U30TV/3Fc7Fxk+RVa95/6jhSaWWd1FL
 FcP0jEztqV0/0uuJvHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpVTA9nJZoH3pwj
 AbPxo63Q2w02FGIdZ6D3ueurx6pOQkyFmUfbDVZYDRZ6IjKhrhm23ojUe1f/L6JYszdQG+um
 2jb83Fn2d3/nuZQifzloAmvbyaE48GQE1Vrvli/sneNtFsRWWKzW2C/BbE3B95kJZ3RcFSOt
 WNsdyO2vLFXVsHleMBgrYww8FCVCxWtamS0baZHRcVJythU0yfLkXpsyD9/Plx1Fc0PZCXkZ
 kTe0SsIusELZCTyNP4nPtjrYyjP8UQHPYqNaxwpRoAWPsgZmPGvpUmCmnJ8L0iyyRNxwMnTy
 L+QcNq2DGZyNJmLOAGeHr5FuZd2l39W+I8mbcqkp/hR+ebBOSX9pHZsGAfmU93VG4vY+VmJr
 4sEZ5fTo/idOcWnChTqHUcoBQhiBRAG6Vre8aS7qsbrztJaJVwc
IronPort-HdrOrdr: A9a23:CUYRL6r7OfZU6IAwYn8MA50aV5oTeYIsimQD101hICG8cqSj+f
 xG+85rsyMc6QxhIE3I9urhBEDtex/hHNtOkOws1NSZLW7bUQmTXeJfBOLZqlWKcUDDH6xmpM
 NdmsBFeaTN5DNB7PoSjjPWLz9Z+qjkzJyV
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="77134689"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v4 15/32] tools: Introduce $(xenlibs-rpath,..) to replace $(SHDEPS_lib*)
Date: Thu, 11 Aug 2022 17:48:28 +0100
Message-ID: <20220811164845.38083-16-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811164845.38083-1-anthony.perard@citrix.com>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
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
Reviewed-by: Juergen Gross <jgross@suse.com>
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


