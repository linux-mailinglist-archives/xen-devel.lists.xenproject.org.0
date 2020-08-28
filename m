Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99557255DB6
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 17:22:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBgCT-0008HD-99; Fri, 28 Aug 2020 15:21:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pjxq=CG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kBfzz-0004eG-6x
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 15:09:03 +0000
X-Inumbo-ID: 6fe39159-02f4-4e94-96c6-efb230cff06f
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6fe39159-02f4-4e94-96c6-efb230cff06f;
 Fri, 28 Aug 2020 15:07:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5D9D1B01D;
 Fri, 28 Aug 2020 15:08:28 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Subject: [PATCH v4 30/31] tools/libs: add option for library names not
 starting with libxen
Date: Fri, 28 Aug 2020 17:07:46 +0200
Message-Id: <20200828150747.25305-31-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200828150747.25305-1-jgross@suse.com>
References: <20200828150747.25305-1-jgross@suse.com>
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

libxlutil doesn't follow the standard name pattern of all other Xen
libraries, so add another make variable which can be used to allow
other names.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/Rules.mk     |  3 ++-
 tools/libs/libs.mk | 41 +++++++++++++++++++++--------------------
 2 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/tools/Rules.mk b/tools/Rules.mk
index 9b9db62fe5..5ad17b313b 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -87,10 +87,11 @@ endif
 # $(SHLIB_libfoo)
 
 define LIB_defs =
+ FILENAME_$(1) ?= xen$(1)
  XEN_libxen$(1) = $$(XEN_ROOT)/tools/libs/$(1)
  CFLAGS_libxen$(1) = -I$$(XEN_libxen$(1))/include $$(CFLAGS_xeninclude)
  SHDEPS_libxen$(1) = $$(foreach use,$$(USELIBS_$(1)),$$(SHLIB_libxen$$(use)))
- LDLIBS_libxen$(1) = $$(SHDEPS_libxen$(1)) $$(XEN_libxen$(1))/libxen$(1)$$(libextension)
+ LDLIBS_libxen$(1) = $$(SHDEPS_libxen$(1)) $$(XEN_libxen$(1))/lib$$(FILENAME_$(1))$$(libextension)
  SHLIB_libxen$(1) = $$(SHDEPS_libxen$(1)) -Wl,-rpath-link=$$(XEN_libxen$(1))
 endef
 
diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index 9d0ed08846..325b7b7cea 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -20,20 +20,21 @@ LDUSELIBS = $(foreach lib, $(USELIBS_$(LIBNAME)), $(LDLIBS_libxen$(lib)))
 LIB_OBJS := $(SRCS-y:.c=.o)
 PIC_OBJS := $(SRCS-y:.c=.opic)
 
-LIB := libxen$(LIBNAME).a
+LIB_FILE_NAME = $(FILENAME_$(LIBNAME))
+LIB := lib$(LIB_FILE_NAME).a
 ifneq ($(nosharedlibs),y)
-LIB += libxen$(LIBNAME).so
+LIB += lib$(LIB_FILE_NAME).so
 endif
 
 comma:= ,
 empty:=
 space:= $(empty) $(empty)
-PKG_CONFIG ?= xen$(LIBNAME).pc
+PKG_CONFIG ?= $(LIB_FILE_NAME).pc
 PKG_CONFIG_NAME ?= Xen$(LIBNAME)
 PKG_CONFIG_DESC ?= The $(PKG_CONFIG_NAME) library for Xen hypervisor
 PKG_CONFIG_VERSION := $(MAJOR).$(MINOR)
 PKG_CONFIG_USELIBS := $(SHLIB_libxen$(LIBNAME))
-PKG_CONFIG_LIB := xen$(LIBNAME)
+PKG_CONFIG_LIB := $(LIB_FILE_NAME)
 PKG_CONFIG_REQPRIV := $(subst $(space),$(comma),$(strip $(foreach lib,$(patsubst ctrl,control,$(USELIBS_$(LIBNAME))),xen$(lib))))
 
 ifneq ($(CONFIG_LIBXC_MINIOS),y)
@@ -45,7 +46,7 @@ endif
 
 PKG_CONFIG_LOCAL := $(PKG_CONFIG_DIR)/$(PKG_CONFIG)
 
-LIBHEADER ?= xen$(LIBNAME).h
+LIBHEADER ?= $(LIB_FILE_NAME).h
 LIBHEADERS = $(foreach h, $(LIBHEADER), include/$(h))
 LIBHEADERSGLOB = $(foreach h, $(LIBHEADER), $(XEN_ROOT)/tools/include/$(h))
 
@@ -81,36 +82,36 @@ libxen$(LIBNAME).map:
 $(LIBHEADERSGLOB): $(LIBHEADERS)
 	for i in $(realpath $(LIBHEADERS)); do ln -sf $$i $(XEN_ROOT)/tools/include; done
 
-libxen$(LIBNAME).a: $(LIB_OBJS)
+lib$(LIB_FILE_NAME).a: $(LIB_OBJS)
 	$(AR) rc $@ $^
 
-libxen$(LIBNAME).so: libxen$(LIBNAME).so.$(MAJOR)
+lib$(LIB_FILE_NAME).so: lib$(LIB_FILE_NAME).so.$(MAJOR)
 	$(SYMLINK_SHLIB) $< $@
-libxen$(LIBNAME).so.$(MAJOR): libxen$(LIBNAME).so.$(MAJOR).$(MINOR)
+lib$(LIB_FILE_NAME).so.$(MAJOR): lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR)
 	$(SYMLINK_SHLIB) $< $@
 
-libxen$(LIBNAME).so.$(MAJOR).$(MINOR): $(PIC_OBJS) libxen$(LIBNAME).map
-	$(CC) $(LDFLAGS) $(PTHREAD_LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,libxen$(LIBNAME).so.$(MAJOR) $(SHLIB_LDFLAGS) -o $@ $(PIC_OBJS) $(LDUSELIBS) $(APPEND_LDFLAGS)
+lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR): $(PIC_OBJS) libxen$(LIBNAME).map
+	$(CC) $(LDFLAGS) $(PTHREAD_LDFLAGS) -Wl,$(SONAME_LDFLAG) -Wl,lib$(LIB_FILE_NAME).so.$(MAJOR) $(SHLIB_LDFLAGS) -o $@ $(PIC_OBJS) $(LDUSELIBS) $(APPEND_LDFLAGS)
 
 .PHONY: install
 install: build
 	$(INSTALL_DIR) $(DESTDIR)$(libdir)
 	$(INSTALL_DIR) $(DESTDIR)$(includedir)
-	$(INSTALL_SHLIB) libxen$(LIBNAME).so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)
-	$(INSTALL_DATA) libxen$(LIBNAME).a $(DESTDIR)$(libdir)
-	$(SYMLINK_SHLIB) libxen$(LIBNAME).so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)/libxen$(LIBNAME).so.$(MAJOR)
-	$(SYMLINK_SHLIB) libxen$(LIBNAME).so.$(MAJOR) $(DESTDIR)$(libdir)/libxen$(LIBNAME).so
+	$(INSTALL_SHLIB) lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)
+	$(INSTALL_DATA) lib$(LIB_FILE_NAME).a $(DESTDIR)$(libdir)
+	$(SYMLINK_SHLIB) lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)/lib$(LIB_FILE_NAME).so.$(MAJOR)
+	$(SYMLINK_SHLIB) lib$(LIB_FILE_NAME).so.$(MAJOR) $(DESTDIR)$(libdir)/lib$(LIB_FILE_NAME).so
 	for i in $(LIBHEADERS); do $(INSTALL_DATA) $$i $(DESTDIR)$(includedir); done
 	$(INSTALL_DATA) $(PKG_CONFIG) $(DESTDIR)$(PKG_INSTALLDIR)
 
 .PHONY: uninstall
 uninstall:
-	rm -f $(DESTDIR)$(PKG_INSTALLDIR)/xen$(LIBNAME).pc
+	rm -f $(DESTDIR)$(PKG_INSTALLDIR)/$(LIB_FILE_NAME).pc
 	for i in $(LIBHEADER); do rm -f $(DESTDIR)$(includedir)/$(LIBHEADER); done
-	rm -f $(DESTDIR)$(libdir)/libxen$(LIBNAME).so
-	rm -f $(DESTDIR)$(libdir)/libxen$(LIBNAME).so.$(MAJOR)
-	rm -f $(DESTDIR)$(libdir)/libxen$(LIBNAME).so.$(MAJOR).$(MINOR)
-	rm -f $(DESTDIR)$(libdir)/libxen$(LIBNAME).a
+	rm -f $(DESTDIR)$(libdir)/lib$(LIB_FILE_NAME).so
+	rm -f $(DESTDIR)$(libdir)/lib$(LIB_FILE_NAME).so.$(MAJOR)
+	rm -f $(DESTDIR)$(libdir)/lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR)
+	rm -f $(DESTDIR)$(libdir)/lib$(LIB_FILE_NAME).a
 
 .PHONY: TAGS
 TAGS:
@@ -119,7 +120,7 @@ TAGS:
 .PHONY: clean
 clean:
 	rm -rf *.rpm $(LIB) *~ $(DEPS_RM) $(LIB_OBJS) $(PIC_OBJS)
-	rm -f libxen$(LIBNAME).so.$(MAJOR).$(MINOR) libxen$(LIBNAME).so.$(MAJOR)
+	rm -f lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR) lib$(LIB_FILE_NAME).so.$(MAJOR)
 	rm -f headers.chk
 	rm -f $(PKG_CONFIG)
 	rm -f $(LIBHEADERSGLOB)
-- 
2.26.2


