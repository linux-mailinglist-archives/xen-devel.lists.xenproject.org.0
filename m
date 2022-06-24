Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1071559E31
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 18:08:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355682.583564 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lrG-0007wg-3o; Fri, 24 Jun 2022 16:08:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355682.583564; Fri, 24 Jun 2022 16:08:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lrF-0007uX-Uc; Fri, 24 Jun 2022 16:08:33 +0000
Received: by outflank-mailman (input) for mailman id 355682;
 Fri, 24 Jun 2022 16:08:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7mLY=W7=citrix.com=prvs=16756bcf7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o4lnz-0004qc-0I
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 16:05:11 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ad30624-f3d7-11ec-b725-ed86ccbb4733;
 Fri, 24 Jun 2022 18:05:09 +0200 (CEST)
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
X-Inumbo-ID: 6ad30624-f3d7-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656086709;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RMuLHf57LSFQbWtEVhf+qOkim9vFt3YxGp2RAYL9V7U=;
  b=VRRJ8BjhybhMdwGuj+Q+zknGXs1HssrvVUWjWCZvrShPV3zKMgEXl7Cs
   uebxJAiD/XM1XJB5RZWoga21ts7ADR6wHf5VXIOaslV6a7GNGyER7P1um
   ka5yKewmo3BC7c1pFjD6L7BhUpvOxQY43F8xEf4HQ/TMbzRdjR2WaURwH
   4=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 74384231
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:R54Z7KJvEaWBmuacFE+RtZUlxSXFcZb7ZxGr2PjKsXjdYENS3jRUz
 WZOXjyCOP/ZMWb0Kdokbdu19h4DvpTXy94wQAJlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA14+IMsdoUg7wbRh3NQ02YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 NVrmJruWB47Ap3rw+4DQjlHOGJAbYQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBMDtIIMYvGAm1TzDBOwqaZvCX7/L9ZlT2zJYasVmQqqFN
 5ZDMmMHgBLofwRIGlIWLbMEk/aBuHXQTmcbpgm+nP9ii4TU5FMoi+W8WDbPQfSQQt5fhEGfp
 WTu8GHwAxVcP9uaoRKa9lq8i+mJmjn0MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO+0cxQfT27PG3za+XWIaXx5eQ58Y5OZjEFTGy
 WS1c8PV6S1H6ePIFyrGq+/L/VteKgBOczZcOHZsoR8tpoC6/dpt1k+nosNLSvbdszHjJd3nL
 9lmRgAajq5bs8ME3r7TEbvv02P1/cihouLYC2zqsoOZAuBRPtfNi3SAswSz0Bq5BN/xoqO9l
 HYFgdOCy+sFEIuAkieAKM1UQuz3v67UaWKA2QYwd3XEy9hL0yT7FWy3yGEWGauUGpxcJW+Bj
 LH742u9G6O/zFP1NPQqMupd+uwhzLT6FMSNa804muFmO8ArHCfepXkGTRfJgwjFzRh9+Ylia
 MzzWZv9Uh4n5VFPkWPeqxE1iuRwmEjTBAr7GPjG8vhQ+eDPOifLFehUawXmgyJQxPrsnTg5O
 u13b6OioyizmsWlCsUL2eb/9Ww3EEU=
IronPort-HdrOrdr: A9a23:frGmRKyRAf/pcTCs/02fKrPwFL1zdoMgy1knxilNoRw8SKKlfq
 eV7ZImPH7P+U4ssR4b+exoVJPtfZqYz+8R3WBzB8bEYOCFghrKEGgK1+KLqFeMJ8S9zJ846U
 4JSdkGNDSaNzlHZKjBjzVQa+xQouW6zA==
X-IronPort-AV: E=Sophos;i="5.92,218,1650945600"; 
   d="scan'208";a="74384231"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>, "Nick
 Rosbrook" <rosbrookn@gmail.com>
Subject: [XEN PATCH v3 20/25] tools: Introduce $(xenlibs-ldflags, ) macro
Date: Fri, 24 Jun 2022 17:04:17 +0100
Message-ID: <20220624160422.53457-21-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624160422.53457-1-anthony.perard@citrix.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This avoid the need to open-coding the list of flags needed to link
with an in-tree Xen library when using -lxen*.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/golang/xenlight/Makefile | 2 +-
 tools/Rules.mk                 | 8 ++++++++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/tools/golang/xenlight/Makefile b/tools/golang/xenlight/Makefile
index 64671f246c..00e6d17f2b 100644
--- a/tools/golang/xenlight/Makefile
+++ b/tools/golang/xenlight/Makefile
@@ -27,7 +27,7 @@ GOXL_GEN_FILES = types.gen.go helpers.gen.go
 # so that it can find the actual library.
 .PHONY: build
 build: xenlight.go $(GOXL_GEN_FILES)
-	CGO_CFLAGS="$(CFLAGS_libxenlight) $(CFLAGS_libxentoollog) $(APPEND_CFLAGS)" CGO_LDFLAGS="$(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) -L$(XEN_libxenlight) -L$(XEN_libxentoollog) $(APPEND_LDFLAGS)" $(GO) build -x
+	CGO_CFLAGS="$(CFLAGS_libxenlight) $(CFLAGS_libxentoollog) $(APPEND_CFLAGS)" CGO_LDFLAGS="$(call xenlibs-ldflags,light toollog) $(APPEND_LDFLAGS)" $(GO) build -x
 
 .PHONY: install
 install: build
diff --git a/tools/Rules.mk b/tools/Rules.mk
index ce77dd2eb1..26958b2948 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -105,6 +105,14 @@ define xenlibs-ldlibs
     $(foreach lib,$(1),$(xenlibs-ldlibs-$(lib)))
 endef
 
+# Provide needed flags for linking an in-tree Xen library by an external
+# project (or when it is necessary to link with "-lxen$(1)" instead of using
+# the full path to the library).
+define xenlibs-ldflags
+    $(call xenlibs-rpath,$(1)) \
+    $(foreach lib,$(1),-L$(XEN_ROOT)/tools/libs/$(lib))
+endef
+
 define LIB_defs
  FILENAME_$(1) ?= xen$(1)
  XEN_libxen$(1) = $$(XEN_ROOT)/tools/libs/$(1)
-- 
Anthony PERARD


