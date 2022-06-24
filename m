Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7357C559E35
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 18:09:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355733.583615 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lrr-0002Qb-8X; Fri, 24 Jun 2022 16:09:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355733.583615; Fri, 24 Jun 2022 16:09:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lrr-0002JR-44; Fri, 24 Jun 2022 16:09:11 +0000
Received: by outflank-mailman (input) for mailman id 355733;
 Fri, 24 Jun 2022 16:09:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7mLY=W7=citrix.com=prvs=16756bcf7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o4lnx-0004qc-00
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 16:05:09 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 69dc418e-f3d7-11ec-b725-ed86ccbb4733;
 Fri, 24 Jun 2022 18:05:06 +0200 (CEST)
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
X-Inumbo-ID: 69dc418e-f3d7-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656086706;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oByBK99qnefbrQHrEHd3FvzvjmDsAemolWu+MnoHJUY=;
  b=KlenXAgY4asI04rH0XzRv/eSvW2hK8KHenlJGMHdZl4LEV7fhnSvsN/T
   8NJYTkVOtKRyX0ldOoWUvwr8MHm5eysTxmZwERs3hjESsCIXZPm0aRTjy
   0pP0UNVidgC0bus0yyXpGwFF5fNhye/tsLgvb05VC8A5NBsn892q8AmHX
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 74787734
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:4SRl5KKYYc2C+uY6FE+RiZUlxSXFcZb7ZxGr2PjKsXjdYENS3jEOx
 mdODT/VPK6JNmL3fohya4u/oU8E68SAmNIxGQRlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA14+IMsdoUg7wbRh3NQ02YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 I1AicHrUF53BZ/B28VDSBNSOXllYLITrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQqqBN
 5VGMmYHgBLofiN/axQrGawHnuKTo1jcdxdppWKIjP9ii4TU5FMoi+W8WDbPQfSISt9ShV2wv
 X/d8iLyBRRyHMOb4SqI9DSrnOCntTP2XsceGaO18tZugUaP3SoDBRsOT1y5rPKlzEmkVLpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0A9dsTrYjsV+2+KeXwliCDGIuFiUcd4lz3CMpfgDGx
 mNljvuwW2Ex6ObIES3NnluHhWjsYHZIdAfucQdBFFJYuIe7/enfmzqVFr5e/LiJYsoZ8N0a6
 xSDt2AAiroalqbnPI3rrAmc01pASnUkJzPZBzk7vUr/t2uVnKb/O+SVBaHztJ6s1rqxQFibp
 2QjkMOD9u0IBpzlvHXTHbtVRODwuKrdaGK0bbtT838JrWzFF5mLLehtDMxWfh81Yq7ohxezC
 KMshe+hzMAKZyb7BUOGS4mwF94r3cDdKDgRbdiNNoAmSsEoLGevpXgyDWbNjzGFuBV9yskXZ
 MbEGftA+F5HUMyLOhLtHLxDuVLqrwhjrV7uqWfTlUX5iOTCOy/OF9/o8jKmN4gE0U9Nmy2Nm
 /43CidA40w3vDHWCsUPzbMuEA==
IronPort-HdrOrdr: A9a23:Tumu16tlwYBGiZSir3qv+dzt7skDcNV00zEX/kB9WHVpmszxra
 +TdZMgpHjJYVcqKQgdcL+7WZVoLUmwyXcx2/hyAV7AZniDhILLFuFfBOLZqlWKcREWtNQtsJ
 uIG5IObuEYZmIVsS+V2mWF+q4bsbq6zJw=
X-IronPort-AV: E=Sophos;i="5.92,218,1650945600"; 
   d="scan'208";a="74787734"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>
Subject: [XEN PATCH v3 19/25] tools: Introduce $(xenlibs-ldlibs, ) macro
Date: Fri, 24 Jun 2022 17:04:16 +0100
Message-ID: <20220624160422.53457-20-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624160422.53457-1-anthony.perard@citrix.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This can be used when linking against multiple in-tree Xen libraries,
and avoid duplicated flags. It can be used instead of multiple
$(LDLIBS_libxen*).

For now, replace the open-coding in libs.mk.

The macro $(xenlibs-libs, ) will be useful later when only the path to
the libraries is wanted (e.g. for checking for dependencies).

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/Rules.mk     | 16 ++++++++++++++--
 tools/libs/libs.mk |  2 +-
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/tools/Rules.mk b/tools/Rules.mk
index 23979ed254..ce77dd2eb1 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -93,12 +93,24 @@ define xenlibs-rpath
     $(addprefix -Wl$(comma)-rpath-link=$(XEN_ROOT)/tools/libs/,$(call xenlibs-dependencies,$(1)))
 endef
 
+# Provide a path for each library in $(1)
+define xenlibs-libs
+    $(foreach lib,$(1), \
+        $(XEN_ROOT)/tools/libs/$(lib)/lib$(FILENAME_$(lib))$(libextension))
+endef
+
+# Flags for linking against all Xen libraries listed in $(1)
+define xenlibs-ldlibs
+    $(call xenlibs-rpath,$(1)) $(call xenlibs-libs,$(1)) \
+    $(foreach lib,$(1),$(xenlibs-ldlibs-$(lib)))
+endef
+
 define LIB_defs
  FILENAME_$(1) ?= xen$(1)
  XEN_libxen$(1) = $$(XEN_ROOT)/tools/libs/$(1)
  CFLAGS_libxen$(1) = $$(CFLAGS_xeninclude)
  SHLIB_libxen$(1) = $$(call xenlibs-rpath,$(1)) -Wl,-rpath-link=$$(XEN_libxen$(1))
- LDLIBS_libxen$(1) = $$(call xenlibs-rpath,$(1)) $$(XEN_libxen$(1))/lib$$(FILENAME_$(1))$$(libextension)
+ LDLIBS_libxen$(1) = $$(call xenlibs-ldlibs,$(1))
 endef
 
 $(foreach lib,$(LIBS_LIBS),$(eval $(call LIB_defs,$(lib))))
@@ -108,7 +120,7 @@ $(foreach lib,$(LIBS_LIBS),$(eval $(call LIB_defs,$(lib))))
 CFLAGS_libxenctrl += -D__XEN_TOOLS__
 
 ifeq ($(CONFIG_Linux),y)
-LDLIBS_libxenstore += -ldl
+xenlibs-ldlibs-store := -ldl
 endif
 
 CFLAGS_libxenlight += $(CFLAGS_libxenctrl)
diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index d7e1274249..2b8e7a6128 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -18,7 +18,7 @@ CFLAGS   += -Werror -Wmissing-prototypes
 CFLAGS   += $(CFLAGS_xeninclude)
 CFLAGS   += $(foreach lib, $(USELIBS_$(LIBNAME)), $(CFLAGS_libxen$(lib)))
 
-LDLIBS += $(foreach lib, $(USELIBS_$(LIBNAME)), $(LDLIBS_libxen$(lib)))
+LDLIBS += $(call xenlibs-ldlibs,$(USELIBS_$(LIBNAME)))
 
 PIC_OBJS := $(OBJS-y:.o=.opic)
 
-- 
Anthony PERARD


