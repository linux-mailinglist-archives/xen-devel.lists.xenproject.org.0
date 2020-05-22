Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 632A31DECFF
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 18:13:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jcAIO-000657-96; Fri, 22 May 2020 16:13:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2cgu=7E=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jcAIL-00064Q-TR
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 16:13:13 +0000
X-Inumbo-ID: 216b5274-9c47-11ea-abf6-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 216b5274-9c47-11ea-abf6-12813bfff9fa;
 Fri, 22 May 2020 16:13:11 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: KxPNs5keHhc+fidn6/H1Nm9Y7zYU1beE8+bp8J+5ykM+OnhXTmM65r1mXRxUpW1JVCUCLJo1YO
 ZzROBGSVu/j+QAKZE9cXmewpX5ej+JVbvfL46Dj0hNEmTCY3igcdnTAoKd/IFIHb8LBhk8SjDR
 nS4dWO0Xl126vYI19Dk3cdoxyOLwNu0T9RSsqWEJRBFciI4IlzFKTUmHKIvgVYSri+kfYNhsCR
 rVHuDwIhUOSsZcj5050J6MwQ1xcGhsDlEunnaRSro97/0hawLlz5/THJpybteRzRt5XH1kBmhm
 jE0=
X-SBRS: 2.7
X-MesageID: 18189347
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,422,1583211600"; d="scan'208";a="18189347"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH 3/5] libxl: Generate golang bindings in libxl Makefile
Date: Fri, 22 May 2020 17:12:38 +0100
Message-ID: <20200522161240.3748320-4-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200522161240.3748320-1-george.dunlap@citrix.com>
References: <20200522161240.3748320-1-george.dunlap@citrix.com>
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Ian Jackson <ian.jackson@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The generated golang bindings (types.gen.go and helpers.gen.go) are
left checked in so that they can be fetched from xenbits using the
golang tooling.  This means that they must be updated whenever
libxl_types.idl (or other dependencies) are updated.  However, the
golang bindings are only built optionally; we can't assume that anyone
updating libxl_types.idl will also descend into the tools/golang tree
to re-generate the bindings.

Fix this by re-generating the golang bindings from the libxl Makefile
when the IDL dependencies are updated, so that anyone who updates
libxl_types.idl will also end up updating the golang generated files
as well.

 - Make a variable for the generated files, and a target in
   xenlight/Makefile which will only re-generate the files.

 - Add a target in libxl/Makefile to call external idl generation
   targets (currently only golang).

For ease of testing, also add a specific target in libxl/Makefile just
to check and update files generated from the IDL.

This does mean that there are two potential paths for generating the
files during a parallel build; but that shouldn't be an issue, since
tools/golang/xenlight should never be built until after tools/libxl
has completed building anyway.

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
CC: Ian Jackson <ian.jackson@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 tools/golang/xenlight/Makefile |  6 +++++-
 tools/libxl/Makefile           | 12 +++++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/tools/golang/xenlight/Makefile b/tools/golang/xenlight/Makefile
index cd0a62505f..751f916276 100644
--- a/tools/golang/xenlight/Makefile
+++ b/tools/golang/xenlight/Makefile
@@ -17,12 +17,16 @@ all: build
 .PHONY: package
 package: $(XEN_GOPATH)$(GOXL_PKG_DIR)
 
-$(XEN_GOPATH)/src/$(XEN_GOCODE_URL)/xenlight/: xenlight.go types.gen.go helpers.gen.go
+GOXL_GEN_FILES = types.gen.go helpers.gen.go
+
+$(XEN_GOPATH)/src/$(XEN_GOCODE_URL)/xenlight/: xenlight.go $(GOXL_GEN_FILES)
 	$(INSTALL_DIR) $(XEN_GOPATH)$(GOXL_PKG_DIR)
 	$(INSTALL_DATA) xenlight.go $(XEN_GOPATH)$(GOXL_PKG_DIR)
 	$(INSTALL_DATA) types.gen.go $(XEN_GOPATH)$(GOXL_PKG_DIR)
 	$(INSTALL_DATA) helpers.gen.go $(XEN_GOPATH)$(GOXL_PKG_DIR)
 
+idl-gen: $(GOXL_GEN_FILES)
+
 %.gen.go: gengotypes.py $(LIBXL_SRC_DIR)/libxl_types.idl $(LIBXL_SRC_DIR)/idl.py
 	XEN_ROOT=$(XEN_ROOT) $(PYTHON) gengotypes.py $(LIBXL_SRC_DIR)/libxl_types.idl
 
diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile
index 69fcf21577..2a06a7ebb8 100644
--- a/tools/libxl/Makefile
+++ b/tools/libxl/Makefile
@@ -218,7 +218,7 @@ testidl.c: libxl_types.idl gentest.py libxl.h $(AUTOINCS)
 .PHONY: all
 all: $(CLIENTS) $(TEST_PROGS) $(PKG_CONFIG) $(PKG_CONFIG_LOCAL) \
 		libxenlight.so libxenlight.a libxlutil.so libxlutil.a \
-	$(AUTOSRCS) $(AUTOINCS)
+	$(AUTOSRCS) $(AUTOINCS) idl-external
 
 $(LIBXL_OBJS) $(LIBXLU_OBJS) $(SAVE_HELPER_OBJS) \
 		$(LIBXL_TEST_OBJS) $(TEST_PROG_OBJS): \
@@ -274,6 +274,16 @@ _libxl_type%.h _libxl_type%_json.h _libxl_type%_private.h _libxl_type%.c: libxl_
 	$(call move-if-changed,__libxl_type$(stem)_json.h,_libxl_type$(stem)_json.h)
 	$(call move-if-changed,__libxl_type$(stem).c,_libxl_type$(stem).c)
 
+.PHONY: idl-external
+idl-external:
+	$(MAKE) -C $(XEN_ROOT)/tools/golang/xenlight idl-gen
+
+LIBXL_IDLGEN_FILES = _libxl_types.h _libxl_types_json.h _libxl_types_private.h _libxl_types.c \
+	_libxl_types_internal.h _libxl_types_internal_json.h _libxl_types_internal_private.h _libxl_types_internal.c
+
+
+idl-gen: $(LIBXL_GEN_FILES) idl-external
+
 libxenlight.so: libxenlight.so.$(MAJOR)
 	$(SYMLINK_SHLIB) $< $@
 
-- 
2.25.1


