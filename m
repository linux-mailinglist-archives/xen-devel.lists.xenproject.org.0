Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CCA2463B9
	for <lists+xen-devel@lfdr.de>; Mon, 17 Aug 2020 11:49:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7blj-00047K-Ek; Mon, 17 Aug 2020 09:49:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YVS9=B3=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k7bli-00046Z-Aq
 for xen-devel@lists.xenproject.org; Mon, 17 Aug 2020 09:49:30 +0000
X-Inumbo-ID: 429207ea-7ee0-4f56-8c83-37559f9c4f86
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 429207ea-7ee0-4f56-8c83-37559f9c4f86;
 Mon, 17 Aug 2020 09:49:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7B22DAE3A;
 Mon, 17 Aug 2020 09:49:50 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Wei Liu <wl@xen.org>
Subject: [PATCH II v2 03/17] tools: tweak tools/libs/libs.mk for being able to
 support libxenctrl
Date: Mon, 17 Aug 2020 11:49:08 +0200
Message-Id: <20200817094922.15768-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200817094922.15768-1-jgross@suse.com>
References: <20200817094922.15768-1-jgross@suse.com>
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

tools/libs/libs.mk needs to be modified for being able to support
building libxenctrl, as the pkg-config file of that library is not
following the same conventions as those of the other libraries.

So add support for specifying PKG_CONFIG before including libs.mk.

In order to make life easier for unstable libraries like libxenctrl
set MAJOR and MINOR automatically to the Xen-version and 0 when not
specified. This removes the need to bump the versions of unstable
libraries when switching to a new Xen version.

As all libraries built via libs.mk require a map file generate a dummy
one in case there is none existing. This again will help avoiding the
need to bump the libarary version in the map file of an unstable
library in case it is exporting all symbols.

The clean target is missing the removal of _paths.h.

Finally drop the foreach loop when setting PKG_CONFIG_LOCAL, as there
is always only one element in PKG_CONFIG.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/libs/libs.mk | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index 19efc5e743..8b1ca2aa62 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -1,10 +1,13 @@
 # Common Makefile for building a lib.
 #
 # Variables taken as input:
-#   MAJOR:   major version of lib
-#   MINOR:   minor version of lib
+#   PKG_CONFIG: name of pkg-config file (xen$(LIBNAME).pc if empty)
+#   MAJOR:   major version of lib (Xen version if empty)
+#   MINOR:   minor version of lib (0 if empty)
 
 LIBNAME := $(notdir $(CURDIR))
+MAJOR ?= $(shell $(XEN_ROOT)/version.sh $(XEN_ROOT)/xen/Makefile)
+MINOR ?= 0
 
 SHLIB_LDFLAGS += -Wl,--version-script=libxen$(LIBNAME).map
 
@@ -22,7 +25,7 @@ ifneq ($(nosharedlibs),y)
 LIB += libxen$(LIBNAME).so
 endif
 
-PKG_CONFIG := xen$(LIBNAME).pc
+PKG_CONFIG ?= xen$(LIBNAME).pc
 PKG_CONFIG_VERSION := $(MAJOR).$(MINOR)
 
 ifneq ($(CONFIG_LIBXC_MINIOS),y)
@@ -32,7 +35,7 @@ $(PKG_CONFIG_INST): PKG_CONFIG_INCDIR = $(includedir)
 $(PKG_CONFIG_INST): PKG_CONFIG_LIBDIR = $(libdir)
 endif
 
-PKG_CONFIG_LOCAL := $(foreach pc,$(PKG_CONFIG),$(PKG_CONFIG_DIR)/$(pc))
+PKG_CONFIG_LOCAL := $(PKG_CONFIG_DIR)/$(PKG_CONFIG)
 
 LIBHEADER ?= xen$(LIBNAME).h
 LIBHEADERS = $(foreach h, $(LIBHEADER), include/$(h))
@@ -45,7 +48,7 @@ $(PKG_CONFIG_LOCAL): PKG_CONFIG_LIBDIR = $(CURDIR)
 all: build
 
 .PHONY: build
-build: libs
+build: libs libxen$(LIBNAME).map
 
 .PHONY: libs
 libs: headers.chk $(LIB) $(PKG_CONFIG_INST) $(PKG_CONFIG_LOCAL)
@@ -64,6 +67,9 @@ endif
 
 headers.chk: $(LIBHEADERSGLOB) $(AUTOINCS)
 
+libxen$(LIBNAME).map:
+	echo 'VERS_$(MAJOR).$(MINOR) { global: *; };' >$@
+
 $(LIBHEADERSGLOB): $(LIBHEADERS)
 	for i in $(realpath $(LIBHEADERS)); do ln -sf $$i $(XEN_ROOT)/tools/include; done
 
@@ -87,7 +93,7 @@ install: build
 	$(SYMLINK_SHLIB) libxen$(LIBNAME).so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)/libxen$(LIBNAME).so.$(MAJOR)
 	$(SYMLINK_SHLIB) libxen$(LIBNAME).so.$(MAJOR) $(DESTDIR)$(libdir)/libxen$(LIBNAME).so
 	for i in $(LIBHEADERS); do $(INSTALL_DATA) $$i $(DESTDIR)$(includedir); done
-	$(INSTALL_DATA) xen$(LIBNAME).pc $(DESTDIR)$(PKG_INSTALLDIR)
+	$(INSTALL_DATA) $(PKG_CONFIG) $(DESTDIR)$(PKG_INSTALLDIR)
 
 .PHONY: uninstall
 uninstall:
@@ -107,8 +113,9 @@ clean:
 	rm -rf *.rpm $(LIB) *~ $(DEPS_RM) $(LIB_OBJS) $(PIC_OBJS)
 	rm -f libxen$(LIBNAME).so.$(MAJOR).$(MINOR) libxen$(LIBNAME).so.$(MAJOR)
 	rm -f headers.chk
-	rm -f xen$(LIBNAME).pc
+	rm -f $(PKG_CONFIG)
 	rm -f $(LIBHEADERSGLOB)
+	rm -f _paths.h
 
 .PHONY: distclean
 distclean: clean
-- 
2.26.2


