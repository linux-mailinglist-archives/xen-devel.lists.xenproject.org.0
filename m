Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2048C59054D
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 19:00:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384959.620560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBXO-00026e-8l; Thu, 11 Aug 2022 17:00:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384959.620560; Thu, 11 Aug 2022 17:00:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBXN-0001qf-Cy; Thu, 11 Aug 2022 17:00:01 +0000
Received: by outflank-mailman (input) for mailman id 384959;
 Thu, 11 Aug 2022 16:59:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jhQd=YP=citrix.com=prvs=21531f474=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oMBN8-0003Aq-1i
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 16:49:26 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8e3751cf-1995-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 18:49:24 +0200 (CEST)
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
X-Inumbo-ID: 8e3751cf-1995-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660236564;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Cj3s7yDvAwdl+LH39Fhy7fBMjMaaqIg2Y2xcVMdDEwk=;
  b=O8na1xt/KDB20tzbE75aGDUGv0n69HGJMmUck1QfbLPeOqhKd4+GFAUB
   9K8bo7crr0CdpBs0W/fKkhfDztEdPHm/mNWZPZSH/YanpJUiopFKhTEvy
   07aHaquZEwFW86c4Wlkd89bUwO5JEXU75vPkAq9O2TdCoQZi/q1uIkoYv
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 80449025
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:sh0As6o9z6XTXhWa2mGTO8Sc+pNeBmJ0ZRIvgKrLsJaIsI4StFCzt
 garIBmHbP7fYzP9etByPoq3/UoD6sXXnYRgTAc9/no0FnwQ9ZuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNPg06/gEk35q6q6GpB5gZWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqVFo9YnBk1w8
 cUaKW4tMDeln73tnKmSH7wEasQLdKEHPasas3BkizrYEewnUdbIRKCiCd1whWlqwJoURLCHO
 pRfOWEHgBfoOnWjPn8eDo4+m+G5wGHyaTRCpHqepLYt4niVxwt0uFToGIqNJoDbHZ8I9qqej
 lnl4XTBGlJDDoOO6Bmc/yyoo7bPhzyuDer+E5Xnr6U30TV/3Fc7Fxk+RVa95/6jhSaWWd1FL
 FcP0jEztqV0/0uuJvHtUhv9rHOasxo0X9tLD/Z8+AyL0rDT4QuSGi4DVDEpVTA9nJZoH3pwj
 AbPxo63Q2w02FGIdZ6D3urNnWO1FRYRFG0DOw9aai0dvIK/u6hm23ojUe1f/L6JYszdQG+um
 2jb83Fn2d3/nuZQifzloAmvbyaE48GQE1Vrvli/sneNtFsRWWKzW2C/BbE3B95kJZ3RcFSOt
 WNsdyO2vLFXVsHleMBgrYww8FCVCxWtamS0baZHRcVJythU0yfLkXpsyD9/Plx1Fc0PZCXkZ
 kTe0SsIusELZCTyNP4nPtjrYyjP8UQHPYqNaxwpRoAWPsgZmPGvpUmCmnJ8L0iyyRNxwMnTy
 L+QcNq2DGZyNJmLOAGeHr5FuZd2l39W+I8mbcqkp/hR+ebBOSX9pHZsGAfmU93VG4vY+VmJr
 4sEZ5fTo/idOcWnChTqHUcoBQhiBRAG6Vre96S7qsbrztJaJVwc
IronPort-HdrOrdr: A9a23:y5ReQq2ypPjKrpqgSQk5KwqjBIokLtp133Aq2lEZdPRUGvb3qy
 nIpoV86faUskdoZJhOo7C90cW7LU80sKQFhLX5Xo3SOzUO2lHYT72KhLGKq1aLdhEWtNQtsZ
 uIG5IOceEYZmIasS+V2maF+q4bsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="80449025"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v4 16/32] tools: Introduce $(xenlibs-ldlibs, ) macro
Date: Thu, 11 Aug 2022 17:48:29 +0100
Message-ID: <20220811164845.38083-17-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811164845.38083-1-anthony.perard@citrix.com>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
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
Reviewed-by: Juergen Gross <jgross@suse.com>
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


