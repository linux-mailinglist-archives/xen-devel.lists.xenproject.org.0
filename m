Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B9D24EC9C
	for <lists+xen-devel@lfdr.de>; Sun, 23 Aug 2020 11:46:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k9maT-0008QL-Qx; Sun, 23 Aug 2020 09:46:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kEn0=CB=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k9mQg-0004t9-U7
 for xen-devel@lists.xenproject.org; Sun, 23 Aug 2020 09:36:46 +0000
X-Inumbo-ID: 5bc1115a-a029-44ce-9d06-989ee2105bdc
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5bc1115a-a029-44ce-9d06-989ee2105bdc;
 Sun, 23 Aug 2020 09:35:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BD6A7ADC4;
 Sun, 23 Aug 2020 09:35:58 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Subject: [PATCH v3 37/38] tools: add support for library names other than
 libxen*
Date: Sun, 23 Aug 2020 11:35:18 +0200
Message-Id: <20200823093519.18386-38-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200823093519.18386-1-jgross@suse.com>
References: <20200823093519.18386-1-jgross@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

All Xen libraries but one (libxlutil) are named libxen...

Add support in the generic library build framework for that different
naming by adding another indirection layer. For a library
LIB_PREFIX_<lib> can be set in tools/libs/uselibs.mk. The default is
"xen", assuming that all libraries are starting with "lib".

For now don't expand this support to stubdoms, as it isn't needed
there yet.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/Rules.mk     | 12 ++++++-----
 tools/libs/libs.mk | 51 ++++++++++++++++++++++++----------------------
 2 files changed, 34 insertions(+), 29 deletions(-)

diff --git a/tools/Rules.mk b/tools/Rules.mk
index 8ecaf063b5..5537056d00 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -87,11 +87,13 @@ endif
 # $(SHLIB_libfoo)
 
 define LIB_defs =
- XEN_libxen$(1) = $$(XEN_ROOT)/tools/libs/$(1)
- CFLAGS_libxen$(1) = -I$$(XEN_libxen$(1))/include $$(CFLAGS_xeninclude)
- SHDEPS_libxen$(1) = $$(foreach use,$$(USELIBS_$(1)),$$(SHLIB_libxen$$(use)))
- LDLIBS_libxen$(1) = $$(SHDEPS_libxen$(1)) $$(XEN_libxen$(1))/libxen$(1)$$(libextension)
- SHLIB_libxen$(1) = $$(SHDEPS_libxen$(1)) -Wl,-rpath-link=$$(XEN_libxen$(1))
+ LIB_PREFIX_$(1) ?= xen
+ LIBREF_$(1) = lib$$(LIB_PREFIX_$(1))$(1)
+ XEN_$$(LIBREF_$(1)) = $$(XEN_ROOT)/tools/libs/$(1)
+ CFLAGS_$$(LIBREF_$(1)) = -I$$(XEN_$$(LIBREF_$(1)))/include $$(CFLAGS_xeninclude)
+ SHDEPS_$$(LIBREF_$(1)) = $$(foreach use,$$(USELIBS_$(1)),$$(SHLIB_$$(LIBREF_$$(use))))
+ LDLIBS_$$(LIBREF_$(1)) = $$(SHDEPS_$$(LIBREF_$(1))) $$(XEN_$$(LIBREF_$(1)))/$$(LIBREF_$(1))$$(libextension)
+ SHLIB_$$(LIBREF_$(1)) = $$(SHDEPS_$$(LIBREF_$(1))) -Wl,-rpath-link=$$(XEN_$$(LIBREF_$(1)))
 endef
 
 $(foreach lib,$(LIBS_LIBS),$(eval $(call LIB_defs,$(lib))))
diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index 8b1ca2aa62..fca8228d25 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -9,23 +9,26 @@ LIBNAME := $(notdir $(CURDIR))
 MAJOR ?= $(shell $(XEN_ROOT)/version.sh $(XEN_ROOT)/xen/Makefile)
 MINOR ?= 0
 
-SHLIB_LDFLAGS += -Wl,--version-script=libxen$(LIBNAME).map
+my_lib := $(LIBREF_$(LIBNAME))
+my_name := $(LIB_PREFIX_$(LIBNAME))$(LIBNAME)
+
+SHLIB_LDFLAGS += -Wl,--version-script=$(my_lib).map
 
 CFLAGS   += -Werror -Wmissing-prototypes
 CFLAGS   += -I./include $(CFLAGS_xeninclude)
-CFLAGS   += $(foreach lib, $(USELIBS_$(LIBNAME)), $(CFLAGS_libxen$(lib)))
+CFLAGS   += $(foreach lib, $(USELIBS_$(LIBNAME)), $(CFLAGS_$(LIBREF_$(lib))))
 
-LDUSELIBS = $(foreach lib, $(USELIBS_$(LIBNAME)), $(LDLIBS_libxen$(lib)))
+LDUSELIBS = $(foreach lib, $(USELIBS_$(LIBNAME)), $(LDLIBS_$(LIBREF_$(lib))))
 
 LIB_OBJS := $(SRCS-y:.c=.o)
 PIC_OBJS := $(SRCS-y:.c=.opic)
 
-LIB := libxen$(LIBNAME).a
+LIB := $(my_lib).a
 ifneq ($(nosharedlibs),y)
-LIB += libxen$(LIBNAME).so
+LIB += $(my_lib).so
 endif
 
-PKG_CONFIG ?= xen$(LIBNAME).pc
+PKG_CONFIG ?= $(my_name).pc
 PKG_CONFIG_VERSION := $(MAJOR).$(MINOR)
 
 ifneq ($(CONFIG_LIBXC_MINIOS),y)
@@ -37,7 +40,7 @@ endif
 
 PKG_CONFIG_LOCAL := $(PKG_CONFIG_DIR)/$(PKG_CONFIG)
 
-LIBHEADER ?= xen$(LIBNAME).h
+LIBHEADER ?= $(my_name).h
 LIBHEADERS = $(foreach h, $(LIBHEADER), include/$(h))
 LIBHEADERSGLOB = $(foreach h, $(LIBHEADER), $(XEN_ROOT)/tools/include/$(h))
 
@@ -48,7 +51,7 @@ $(PKG_CONFIG_LOCAL): PKG_CONFIG_LIBDIR = $(CURDIR)
 all: build
 
 .PHONY: build
-build: libs libxen$(LIBNAME).map
+build: libs $(my_lib).map
 
 .PHONY: libs
 libs: headers.chk $(LIB) $(PKG_CONFIG_INST) $(PKG_CONFIG_LOCAL)
@@ -67,42 +70,42 @@ endif
 
 headers.chk: $(LIBHEADERSGLOB) $(AUTOINCS)
 
-libxen$(LIBNAME).map:
+$(my_lib).map:
 	echo 'VERS_$(MAJOR).$(MINOR) { global: *; };' >$@
 
 $(LIBHEADERSGLOB): $(LIBHEADERS)
 	for i in $(realpath $(LIBHEADERS)); do ln -sf $$i $(XEN_ROOT)/tools/include; done
 
-libxen$(LIBNAME).a: $(LIB_OBJS)
+$(my_lib).a: $(LIB_OBJS)
 	$(AR) rc $@ $^
 
-libxen$(LIBNAME).so: libxen$(LIBNAME).so.$(MAJOR)
+$(my_lib).so: $(my_lib).so.$(MAJOR)
 	$(SYMLINK_SHLIB) $< $@
-libxen$(LIBNAME).so.$(MAJOR): libxen$(LIBNAME).so.$(MAJOR).$(MINOR)
+$(my_lib).so.$(MAJOR): $(my_lib).so.$(MAJOR).$(MINOR)
 	$(SYMLINK_SHLIB) $< $@
 
-libxen$(LIBNAME).so.$(MAJOR).$(MINOR): $(PIC_OBJS) libxen$(LIBNAME).map
-	$(CC) $(LDFLAGS) $(PTHREAD_LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,libxen$(LIBNAME).so.$(MAJOR) $(SHLIB_LDFLAGS) -o $@ $(PIC_OBJS) $(LDUSELIBS) $(APPEND_LDFLAGS)
+$(my_lib).so.$(MAJOR).$(MINOR): $(PIC_OBJS) $(my_lib).map
+	$(CC) $(LDFLAGS) $(PTHREAD_LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,$(my_lib).so.$(MAJOR) $(SHLIB_LDFLAGS) -o $@ $(PIC_OBJS) $(LDUSELIBS) $(APPEND_LDFLAGS)
 
 .PHONY: install
 install: build
 	$(INSTALL_DIR) $(DESTDIR)$(libdir)
 	$(INSTALL_DIR) $(DESTDIR)$(includedir)
-	$(INSTALL_SHLIB) libxen$(LIBNAME).so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)
-	$(INSTALL_DATA) libxen$(LIBNAME).a $(DESTDIR)$(libdir)
-	$(SYMLINK_SHLIB) libxen$(LIBNAME).so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)/libxen$(LIBNAME).so.$(MAJOR)
-	$(SYMLINK_SHLIB) libxen$(LIBNAME).so.$(MAJOR) $(DESTDIR)$(libdir)/libxen$(LIBNAME).so
+	$(INSTALL_SHLIB) $(my_lib).so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)
+	$(INSTALL_DATA) $(my_lib).a $(DESTDIR)$(libdir)
+	$(SYMLINK_SHLIB) $(my_lib).so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)/$(my_lib).so.$(MAJOR)
+	$(SYMLINK_SHLIB) $(my_lib).so.$(MAJOR) $(DESTDIR)$(libdir)/$(my_lib).so
 	for i in $(LIBHEADERS); do $(INSTALL_DATA) $$i $(DESTDIR)$(includedir); done
 	$(INSTALL_DATA) $(PKG_CONFIG) $(DESTDIR)$(PKG_INSTALLDIR)
 
 .PHONY: uninstall
 uninstall:
-	rm -f $(DESTDIR)$(PKG_INSTALLDIR)/xen$(LIBNAME).pc
+	rm -f $(DESTDIR)$(PKG_INSTALLDIR)/$(my_name).pc
 	for i in $(LIBHEADER); do rm -f $(DESTDIR)$(includedir)/$(LIBHEADER); done
-	rm -f $(DESTDIR)$(libdir)/libxen$(LIBNAME).so
-	rm -f $(DESTDIR)$(libdir)/libxen$(LIBNAME).so.$(MAJOR)
-	rm -f $(DESTDIR)$(libdir)/libxen$(LIBNAME).so.$(MAJOR).$(MINOR)
-	rm -f $(DESTDIR)$(libdir)/libxen$(LIBNAME).a
+	rm -f $(DESTDIR)$(libdir)/$(my_lib).so
+	rm -f $(DESTDIR)$(libdir)/$(my_lib).so.$(MAJOR)
+	rm -f $(DESTDIR)$(libdir)/$(my_lib).so.$(MAJOR).$(MINOR)
+	rm -f $(DESTDIR)$(libdir)/$(my_lib).a
 
 .PHONY: TAGS
 TAGS:
@@ -111,7 +114,7 @@ TAGS:
 .PHONY: clean
 clean:
 	rm -rf *.rpm $(LIB) *~ $(DEPS_RM) $(LIB_OBJS) $(PIC_OBJS)
-	rm -f libxen$(LIBNAME).so.$(MAJOR).$(MINOR) libxen$(LIBNAME).so.$(MAJOR)
+	rm -f $(my_lib).so.$(MAJOR).$(MINOR) $(my_lib).so.$(MAJOR)
 	rm -f headers.chk
 	rm -f $(PKG_CONFIG)
 	rm -f $(LIBHEADERSGLOB)
-- 
2.26.2


