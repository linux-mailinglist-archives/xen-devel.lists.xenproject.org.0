Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE37255ECB
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 18:32:13 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBhHg-0000Q5-JC; Fri, 28 Aug 2020 16:31:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nNC1=CG=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1kBhHe-0000Q0-PN
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 16:31:22 +0000
X-Inumbo-ID: aa0cdf2a-5b43-41e1-a660-00f4fb207ddf
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa0cdf2a-5b43-41e1-a660-00f4fb207ddf;
 Fri, 28 Aug 2020 16:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598632281;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZeNwB/GNxCAPJWxgBeCrYu3wqvB2YTdUnxddi/VKhN8=;
 b=Aa3j9cXUNk+y3Fs/tYt3u1RSqJduFWG4tP3i5OeR/KniDCtz88LHrUV2
 ahPqovMBNrtpobQfr4xOzGo4pP7OrjIC0uK3cItPEtL55CwuYGSr/nX9P
 JyJDjaI9MbXyAOR/DE9Q7rOMUSV95wd4El4Lq/z08IU+GG2BF0iVaTm90 I=;
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: +VVTrZJwixAb7E8RudTZAejXVlYjg0eh4O2OBneSEh1fMD1xVIuvJn3NiwfJOkzZggqfOOAps7
 Z+LrRlzzn5v+rGuHb9WpgrZ52BT81I2/cpTSPV3Bfxg16s2Nq2jtUEVeEMNS990zTkoZFeP6Yz
 zi5/t2l8Orh5qk9MlqQDARkrG0p8p/Tc0dfTm+V8WtKwRNbhNK5vN8/U7glNaq1negZXVNJg48
 sZTVXM7+AlJGPqaQrUjsODjtKz2U3hE5hi/QbKg/9ROkWdw1lJT+5m6i9hesH8F3uJSMgBu/Cq
 erw=
X-SBRS: 2.7
X-MesageID: 25867060
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,364,1592884800"; d="scan'208";a="25867060"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
 Nick Rosbrook <rosbrookn@ainfosec.com>,
 Ian Jackson <ian.jackson@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2] Revert "libxl: Generate golang bindings in libxl Makefile"
Date: Fri, 28 Aug 2020 17:30:54 +0100
Message-ID: <20200828163054.1981275-1-george.dunlap@citrix.com>
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
v2: Don't remove GOXL_GEN_FILES, which is still being used

This is a candidate to backport for 4.14.

I was doing prep for writing the infrastructure to create or update an
external repo, and figured I might as well send this out now.

CC: Jan Beulich <jbeulich@suse.com>
CC: Nick Rosbrook <rosbrookn@ainfosec.com>
CC: Ian Jackson <ian.jackson@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 tools/golang/xenlight/Makefile |  7 -------
 tools/libxl/Makefile           | 17 +----------------
 2 files changed, 1 insertion(+), 23 deletions(-)

diff --git a/tools/golang/xenlight/Makefile b/tools/golang/xenlight/Makefile
index eac9dbf12a..89d224fef5 100644
--- a/tools/golang/xenlight/Makefile
+++ b/tools/golang/xenlight/Makefile
@@ -15,13 +15,6 @@ all: build
 
 GOXL_GEN_FILES = types.gen.go helpers.gen.go
 
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


