Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FD51E322E
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 00:16:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdhsI-0007wY-Mu; Tue, 26 May 2020 22:16:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=52a6=7I=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jdhsH-0007wT-KB
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 22:16:41 +0000
X-Inumbo-ID: 929bb0d8-9f9e-11ea-a6c3-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 929bb0d8-9f9e-11ea-a6c3-12813bfff9fa;
 Tue, 26 May 2020 22:16:40 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: tPOJu4PQ63FYA20aQt6/WSEoTQZcS9T1BmehDgtkkbZDhK+XKyX/nX9GYBhvHr1EAbSdVXbxHR
 TYUoqgAuUOLxWX2uPTNLiL3yUTsNACjHESTxduH3LSHxi4hXY4NofWud4lNUn1XxYGxJqtYaLT
 vQqcsF61mtY7q1oNc/g7gONSHlh+NQhrvUI7qSBdd7xAjxqZBZPxFBM5Z3EugiqWwFI/tHlGkB
 +gH7tFIhiZHFA9cJr7XnDijJ9Jku3qap/j/5fQFe0PWJvghN7Vz7xMut2d6iPdbYjcvuO77jtW
 RXs=
X-SBRS: 2.7
X-MesageID: 19238409
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,439,1583211600"; d="scan'208";a="19238409"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 1/5] libxl: Generate golang bindings in libxl Makefile
Date: Tue, 26 May 2020 23:16:08 +0100
Message-ID: <20200526221612.900922-2-george.dunlap@citrix.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200526221612.900922-1-george.dunlap@citrix.com>
References: <20200526221612.900922-1-george.dunlap@citrix.com>
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>, Ian
 Jackson <ian.jackson@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
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
Reviewed-by: Nick Rosbrook <rosbrookn@ainfosec.com>
Acked-by: Ian Jackson <ian.jackson@eu.citrix.com>
---
v2:
- Add comments explaining parallel make safety

CC: Ian Jackson <ian.jackson@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 tools/golang/xenlight/Makefile | 11 ++++++++++-
 tools/libxl/Makefile           | 17 ++++++++++++++++-
 2 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/tools/golang/xenlight/Makefile b/tools/golang/xenlight/Makefile
index cd0a62505f..8ab4cb5665 100644
--- a/tools/golang/xenlight/Makefile
+++ b/tools/golang/xenlight/Makefile
@@ -17,12 +17,21 @@ all: build
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
 
+# NOTE: This target is called from libxl/Makefile:all.  Since that
+# target must finish before golang/Makefile is called, this is
+# currently safe.  It must not be called from anywhere else in the
+# Makefile system without careful thought about races with
+# xenlight/Makefile:all
+idl-gen: $(GOXL_GEN_FILES)
+
 %.gen.go: gengotypes.py $(LIBXL_SRC_DIR)/libxl_types.idl $(LIBXL_SRC_DIR)/idl.py
 	XEN_ROOT=$(XEN_ROOT) $(PYTHON) gengotypes.py $(LIBXL_SRC_DIR)/libxl_types.idl
 
diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile
index 69fcf21577..947eb6036e 100644
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
@@ -274,6 +274,21 @@ _libxl_type%.h _libxl_type%_json.h _libxl_type%_private.h _libxl_type%.c: libxl_
 	$(call move-if-changed,__libxl_type$(stem)_json.h,_libxl_type$(stem)_json.h)
 	$(call move-if-changed,__libxl_type$(stem).c,_libxl_type$(stem).c)
 
+# NOTE: This is safe to do at the moment because idl-external and
+# idl-gen are only called from libxl/Makefile:all, which must return
+# before golang/Makefile is callid.  idl-external and idl-gen must
+# never be called from another part of the make system without careful thought
+# about races with tools/golang/xenlight/Makefile:all
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


