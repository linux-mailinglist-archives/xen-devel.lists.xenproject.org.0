Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E54255CDE
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 16:43:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBfax-0002cl-AK; Fri, 28 Aug 2020 14:43:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nNC1=CG=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kBfav-0002cg-HZ
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 14:43:09 +0000
X-Inumbo-ID: e9fc755e-7835-4378-8096-c2ec00ac4210
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e9fc755e-7835-4378-8096-c2ec00ac4210;
 Fri, 28 Aug 2020 14:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598625788;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CCLi1KTUQzEF3qpuBt9E0PI+AbeoVpgz3djLWjHxz0E=;
 b=V7h78gMqBK01O3F6yOUAxH4/1ANp1u6dUIZWG+quoC1t30DWUiGTFMFW
 kgdnq42kVdnwXTTymI2Fg9KjVjNhFwHPudWABzGDEZVu2evYZtV1pZAdS
 +alPdXjDpPRelaH2iG2gcX/yDIowufP2q099iB337nVVr5iHcp8QBhVlP A=;
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: 7g7xRbChn2+NLijsR3lEDw6iz8QSXtw27oGVVBowrB4Kaz0t0WTlJO84GaYqxhqL42LygsfHmN
 /sXpubPLhbrJSaiJMGxirl1w99Bix4uKtCOz8BoiVJatxuioCINY6kWhBc/8j9OtQ/aBhWBSMD
 3LeUr+DqUwXDF8qnN+OyVrPXFdP7O3ainBLvgDrsYwC4JmhkOiBK1mCOGfcw57xwt265JNfunF
 54mku5mBf1LH+K5gDRygPN6GFD628bEBsQBe9cQ8+ef9fvTVzMZ8MehvkK3fXwS4Qa9bJBIVvK
 8lQ=
X-SBRS: 2.7
X-MesageID: 25513471
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,364,1592884800"; d="scan'208";a="25513471"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
 Nick Rosbrook <rosbrookn@ainfosec.com>,
 Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] Revert "libxl: Generate golang bindings in libxl Makefile"
Date: Fri, 28 Aug 2020 15:42:48 +0100
Message-ID: <20200828144248.1970259-1-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This reverts commit 60db5da62ac051aab0b217fa2d96acca1cd3ca3e.

This is in preparation for the planned move to hosting the xenlight
package in a separate repo.

This also fixes a regression when building with a read-only source and
an out-of-tree build.

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
This is a candidate to backport for 4.14.

I was doing prep for writing the infrastructure to create or update an
external repo, and figured I might as well send this out now.

CC: Jan Beulich <jbeulich@suse.com>
CC: Nick Rosbrook <rosbrookn@ainfosec.com>
CC: Ian Jackson <ian.jackson@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 tools/golang/xenlight/Makefile |  9 ---------
 tools/libxl/Makefile           | 17 +----------------
 2 files changed, 1 insertion(+), 25 deletions(-)

diff --git a/tools/golang/xenlight/Makefile b/tools/golang/xenlight/Makefile
index eac9dbf12a..8d4d1e97ac 100644
--- a/tools/golang/xenlight/Makefile
+++ b/tools/golang/xenlight/Makefile
@@ -13,15 +13,6 @@ LIBXL_SRC_DIR = ../../libxl
 .PHONY: all
 all: build
 
-GOXL_GEN_FILES = types.gen.go helpers.gen.go
-
-# NOTE: This target is called from libxl/Makefile:all.  Since that
-# target must finish before golang/Makefile is called, this is
-# currently safe.  It must not be called from anywhere else in the
-# Makefile system without careful thought about races with
-# xenlight/Makefile:all
-idl-gen: $(GOXL_GEN_FILES)
-
 %.gen.go: gengotypes.py $(LIBXL_SRC_DIR)/libxl_types.idl $(LIBXL_SRC_DIR)/idl.py
 	XEN_ROOT=$(XEN_ROOT) $(PYTHON) gengotypes.py $(LIBXL_SRC_DIR)/libxl_types.idl
 
diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile
index 0e8dfc6193..c26b3a8093 100644
--- a/tools/libxl/Makefile
+++ b/tools/libxl/Makefile
@@ -219,7 +219,7 @@ testidl.c: libxl_types.idl gentest.py libxl.h $(AUTOINCS)
 .PHONY: all
 all: $(CLIENTS) $(TEST_PROGS) $(PKG_CONFIG) $(PKG_CONFIG_LOCAL) \
 		libxenlight.so libxenlight.a libxlutil.so libxlutil.a \
-	$(AUTOSRCS) $(AUTOINCS) idl-external
+	$(AUTOSRCS) $(AUTOINCS)
 
 $(LIBXL_OBJS) $(LIBXLU_OBJS) $(SAVE_HELPER_OBJS) \
 		$(LIBXL_TEST_OBJS) $(TEST_PROG_OBJS): \
@@ -275,21 +275,6 @@ _libxl_type%.h _libxl_type%_json.h _libxl_type%_private.h _libxl_type%.c: libxl_
 	$(call move-if-changed,__libxl_type$(stem)_json.h,_libxl_type$(stem)_json.h)
 	$(call move-if-changed,__libxl_type$(stem).c,_libxl_type$(stem).c)
 
-# NOTE: This is safe to do at the moment because idl-external and
-# idl-gen are only called from libxl/Makefile:all, which must return
-# before golang/Makefile is callid.  idl-external and idl-gen must
-# never be called from another part of the make system without careful thought
-# about races with tools/golang/xenlight/Makefile:all
-.PHONY: idl-external
-idl-external:
-	$(MAKE) -C $(XEN_ROOT)/tools/golang/xenlight idl-gen
-
-LIBXL_IDLGEN_FILES = _libxl_types.h _libxl_types_json.h _libxl_types_private.h _libxl_types.c \
-	_libxl_types_internal.h _libxl_types_internal_json.h _libxl_types_internal_private.h _libxl_types_internal.c
-
-
-idl-gen: $(LIBXL_GEN_FILES) idl-external
-
 libxenlight.so: libxenlight.so.$(MAJOR)
 	$(SYMLINK_SHLIB) $< $@
 
-- 
2.25.1


