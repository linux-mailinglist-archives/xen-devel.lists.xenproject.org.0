Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FDD5FD9DA
	for <lists+xen-devel@lfdr.de>; Thu, 13 Oct 2022 15:05:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422032.667924 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixuF-0005Sw-Fa; Thu, 13 Oct 2022 13:05:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422032.667924; Thu, 13 Oct 2022 13:05:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oixuF-0005K5-6B; Thu, 13 Oct 2022 13:05:47 +0000
Received: by outflank-mailman (input) for mailman id 422032;
 Thu, 13 Oct 2022 13:05:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d8dk=2O=citrix.com=prvs=278749026=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oixuD-0001tl-Fc
 for xen-devel@lists.xenproject.org; Thu, 13 Oct 2022 13:05:45 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1636fcd-4af7-11ed-8fd0-01056ac49cbb;
 Thu, 13 Oct 2022 15:05:22 +0200 (CEST)
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
X-Inumbo-ID: b1636fcd-4af7-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1665666344;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6Ciqslkc0BK3uoE16/zRFo3axUefMUHAjqrqHVfnJXw=;
  b=MTvL7uj/wFBa+386lbsujouHQzSdDt+Wm4DJ0WPvix6VdNHGDSgxbS5G
   WamdMXjn0KBO3esfgYYime52EgbrIOmLzaIevM2b04nEpz7bcUfvLZ2xB
   eIdb9YK/zpFNjp8fJDiA1dX3vcUHCa0r1xje9Q+WIq7yrXbwq3WHER5sZ
   w=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 81760248
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:uZqzra9OpmoW5If2WxCVDrUD6n6TJUtcMsCJ2f8bNWPcYEJGY0x3z
 jQeDG+PMvfbMzekft9+Po2x8E4Cusfdy4NkSAprpH08E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOC6UIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv/rRC9H5qyo4mpA5wdmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0tdOW3B/x
 NgYExAMSg2Ri9Kdzo+De+Y506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w/N3wsYDUWUrsTIJs4gOevgGi5azBCoUiZjaE2/3LS3Ep6172F3N/9KoXVG50PwhbwS
 mTu8mv5MkgTJOejzmCJrlSz2ObyzBOiR9dHfFG/3qEz2wDCroAJMzUJUXOrrP//jVSxM/pPJ
 kpR9icwoKwa8E2wUsK7TxC+uGSDvBMXR5xXCeJS1e2W4vOKuUDDXDFCF2MfLox93CMredA0/
 m6wxcLYNBhvi52UbW+P+oe/ow6KCCdAeAfuehQ4ZQcC5tDipqQ6gRTOUstvHcaJszHlJd3j6
 2vU9XZj3t3/meZOjvzmpg6f31pAs7CTFmYIChPrsnVJB++TTKqsfMSW5FfS9p6sx67JHwDa7
 BDodyVzhd3i7K1hdgTXHY3h/5nzvZ5p1QEwZnY+d6TNDxz3pxaekXl4uVmS3ntBPMceYiPOa
 0TOow5X75I7FCL0M/IpO9rpU5p1lPKI+THZuhf8N4MmX3SMXFXfoHEGibC4hQgBb3TAYYlgY
 MzGIK5A/F4RCLh9zSreetrxJYQDn3lmrV4/sLihkHxLJ5LCOyPOIVrEWXPSBt0EAFSs+VmFr
 okOaZXQln2ykoTWO0HqzGLaFnhSRVBTOHw8g5c/mjKrSua+JFwcNg==
IronPort-HdrOrdr: A9a23:D/M2zaDHodxA2pflHemU55DYdb4zR+YMi2TC1yhKJyC9Ffbo8f
 xG/c5rrSMc5wxwZJhNo7y90ey7MBbhHP1OkO4s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpN
 5dmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.95,180,1661832000"; 
   d="scan'208";a="81760248"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH for-4.17 v5 11/17] tools/include: Rework Makefile
Date: Thu, 13 Oct 2022 14:05:07 +0100
Message-ID: <20221013130513.52440-12-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221013130513.52440-1-anthony.perard@citrix.com>
References: <20221013130513.52440-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Rework "xen-xsm" rules to not have to change directory to run
mkflask.sh, and store mkflask.sh path in a var, and use a full path
for FLASK_H_DEPEND, and output directory is made relative.

Rename "all-y" target to a more descriptive "xen/lib/x86/all".

Removed the "dist" target which was the only one existing in tools/.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v4:
    - new patch

 tools/include/Makefile | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/tools/include/Makefile b/tools/include/Makefile
index b488f7ca9f..81c3d09039 100644
--- a/tools/include/Makefile
+++ b/tools/include/Makefile
@@ -7,17 +7,20 @@ include $(XEN_ROOT)/tools/Rules.mk
 # taken into account, i.e. there should be no rules added here for generating
 # any tools/include/*.h files.
 
-# Relative to $(XEN_ROOT)/xen/xsm/flask
-FLASK_H_DEPEND := policy/initial_sids
+.PHONY: all
+all: xen-foreign xen-dir xen-xsm/.dir
+ifeq ($(CONFIG_X86),y)
+all: xen/lib/x86/all
+endif
 
-.PHONY: all all-y build xen-dir
-all build: all-y xen-foreign xen-dir xen-xsm/.dir
-all-y:
+.PHONY: build
+build: all
 
 .PHONY: xen-foreign
 xen-foreign:
 	$(MAKE) -C xen-foreign
 
+.PHONY: xen-dir
 xen-dir:
 	mkdir -p xen/libelf acpi
 	find xen/ acpi/ -type l -exec rm '{}' +
@@ -36,16 +39,18 @@ ifeq ($(CONFIG_X86),y)
 	ln -s $(XEN_ROOT)/xen/include/xen/lib/x86/Makefile xen/lib/x86/
 endif
 
-all-$(CONFIG_X86): xen-dir
+.PHONY: xen/lib/x86/all
+xen/lib/x86/all: xen-dir
 	$(MAKE) -C xen/lib/x86 all XEN_ROOT=$(XEN_ROOT) PYTHON=$(PYTHON)
 
+MKFLASK := $(XEN_ROOT)/xen/xsm/flask/policy/mkflask.sh
+FLASK_H_DEPEND := $(XEN_ROOT)/xen/xsm/flask/policy/initial_sids
+
 # Not xen/xsm as that clashes with link to
 # $(XEN_ROOT)/xen/include/public/xsm above.
-xen-xsm/.dir: $(XEN_ROOT)/xen/xsm/flask/policy/mkflask.sh \
-	      $(patsubst %,$(XEN_ROOT)/xen/xsm/flask/%,$(FLASK_H_DEPEND))
+xen-xsm/.dir: $(MKFLASK) $(FLASK_H_DEPEND)
 	mkdir -p xen-xsm/flask
-	cd $(XEN_ROOT)/xen/xsm/flask/ && \
-		$(SHELL) policy/mkflask.sh $(AWK) $(CURDIR)/xen-xsm/flask $(FLASK_H_DEPEND)
+	$(SHELL) $(MKFLASK) $(AWK) xen-xsm/flask $(FLASK_H_DEPEND)
 	touch $@
 
 .PHONY: install
@@ -84,8 +89,5 @@ clean:
 	$(MAKE) -C xen-foreign clean
 	rm -f _*.h
 
-.PHONY: dist
-dist: install
-
 .PHONY: distclean
 distclean: clean
-- 
Anthony PERARD


