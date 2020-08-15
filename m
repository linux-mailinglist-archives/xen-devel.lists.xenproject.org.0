Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7D94245103
	for <lists+xen-devel@lfdr.de>; Sat, 15 Aug 2020 15:04:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k6vqp-0006Rc-A9; Sat, 15 Aug 2020 13:03:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ceF6=BZ=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1k6vqn-0006Qw-Ln
 for xen-devel@lists.xenproject.org; Sat, 15 Aug 2020 13:03:57 +0000
X-Inumbo-ID: b91349a9-bf38-429e-bd2a-927eb6923aca
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b91349a9-bf38-429e-bd2a-927eb6923aca;
 Sat, 15 Aug 2020 13:03:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1761BB57E;
 Sat, 15 Aug 2020 13:04:14 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>
Subject: [PATCH I v2 3/6] tools: add a copy of library headers in tools/include
Date: Sat, 15 Aug 2020 15:03:38 +0200
Message-Id: <20200815130341.27147-4-jgross@suse.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200815130341.27147-1-jgross@suse.com>
References: <20200815130341.27147-1-jgross@suse.com>
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

The headers.chk target in tools/Rules.mk tries to compile all headers
stand alone for testing them not to include any internal header.

Unfortunately the headers tested against are not complete, as any
header for a Xen library is not included in the include path of the
test compile run, resulting in a failure in case any of the tested
headers in including an official Xen library header.

Fix that by copying the official headers located in
tools/libs/*/include to tools/include.

In order to support libraries with header name other than xen<lib>.h
or with multiple headers add a LIBHEADER make variable a lib specific
Makefile can set in that case.

Move the headers.chk target from Rules.mk to libs.mk as it is used
for libraries in tools/libs only.

Add NO_HEADERS_CHK variable to skip checking headers as this will be
needed e.g. for libxenctrl.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 .gitignore         |  1 +
 tools/Rules.mk     |  8 --------
 tools/libs/libs.mk | 26 +++++++++++++++++++++++---
 3 files changed, 24 insertions(+), 11 deletions(-)

diff --git a/.gitignore b/.gitignore
index 36ce2ea104..5ea48af818 100644
--- a/.gitignore
+++ b/.gitignore
@@ -188,6 +188,7 @@ tools/hotplug/Linux/xendomains
 tools/hotplug/NetBSD/rc.d/xencommons
 tools/hotplug/NetBSD/rc.d/xendriverdomain
 tools/include/acpi
+tools/include/*.h
 tools/include/xen/*
 tools/include/xen-xsm/*
 tools/include/xen-foreign/*.(c|h|size)
diff --git a/tools/Rules.mk b/tools/Rules.mk
index b42e50ebf6..5d699cfd39 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -225,14 +225,6 @@ INSTALL_PYTHON_PROG = \
 %.opic: %.S
 	$(CC) $(CPPFLAGS) -DPIC $(CFLAGS) $(CFLAGS.opic) -fPIC -c -o $@ $< $(APPEND_CFLAGS)
 
-headers.chk:
-	for i in $(filter %.h,$^); do \
-	    $(CC) -x c -ansi -Wall -Werror $(CFLAGS_xeninclude) \
-	          -S -o /dev/null $$i || exit 1; \
-	    echo $$i; \
-	done >$@.new
-	mv $@.new $@
-
 subdirs-all subdirs-clean subdirs-install subdirs-distclean subdirs-uninstall: .phony
 	@set -e; for subdir in $(SUBDIRS) $(SUBDIRS-y); do \
 		$(MAKE) subdir-$(patsubst subdirs-%,%,$@)-$$subdir; \
diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index 8027ae7400..8045c00e9a 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -34,6 +34,10 @@ endif
 
 PKG_CONFIG_LOCAL := $(foreach pc,$(PKG_CONFIG),$(PKG_CONFIG_DIR)/$(pc))
 
+LIBHEADER ?= xen$(LIBNAME).h
+LIBHEADERS = $(foreach h, $(LIBHEADER), include/$(h))
+LIBHEADERSGLOB = $(foreach h, $(LIBHEADER), $(XEN_ROOT)/tools/include/$(h))
+
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_PREFIX = $(XEN_ROOT)
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_LIBDIR = $(CURDIR)
 
@@ -47,7 +51,22 @@ build:
 .PHONY: libs
 libs: headers.chk $(LIB) $(PKG_CONFIG_INST) $(PKG_CONFIG_LOCAL)
 
-headers.chk: $(wildcard include/*.h) $(AUTOINCS)
+ifneq ($(NO_HEADERS_CHK),y)
+headers.chk:
+	for i in $(filter %.h,$^); do \
+	    $(CC) -x c -ansi -Wall -Werror $(CFLAGS_xeninclude) \
+	          -S -o /dev/null $$i || exit 1; \
+	    echo $$i; \
+	done >$@.new
+	mv $@.new $@
+else
+.PHONY: headers.chk
+endif
+
+headers.chk: $(LIBHEADERSGLOB) $(AUTOINCS)
+
+$(LIBHEADERSGLOB): $(LIBHEADERS)
+	for i in $(realpath $(LIBHEADERS)); do ln -sf $$i $(XEN_ROOT)/tools/include; done
 
 libxen$(LIBNAME).a: $(LIB_OBJS)
 	$(AR) rc $@ $^
@@ -68,13 +87,13 @@ install: build
 	$(INSTALL_DATA) libxen$(LIBNAME).a $(DESTDIR)$(libdir)
 	$(SYMLINK_SHLIB) libxen$(LIBNAME).so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)/libxen$(LIBNAME).so.$(MAJOR)
 	$(SYMLINK_SHLIB) libxen$(LIBNAME).so.$(MAJOR) $(DESTDIR)$(libdir)/libxen$(LIBNAME).so
-	$(INSTALL_DATA) include/xen$(LIBNAME).h $(DESTDIR)$(includedir)
+	for i in $(LIBHEADERS); do $(INSTALL_DATA) $$i $(DESTDIR)$(includedir); done
 	$(INSTALL_DATA) xen$(LIBNAME).pc $(DESTDIR)$(PKG_INSTALLDIR)
 
 .PHONY: uninstall
 uninstall:
 	rm -f $(DESTDIR)$(PKG_INSTALLDIR)/xen$(LIBNAME).pc
-	rm -f $(DESTDIR)$(includedir)/xen$(LIBNAME).h
+	for i in $(LIBHEADER); do rm -f $(DESTDIR)$(includedir)/$(LIBHEADER); done
 	rm -f $(DESTDIR)$(libdir)/libxen$(LIBNAME).so
 	rm -f $(DESTDIR)$(libdir)/libxen$(LIBNAME).so.$(MAJOR)
 	rm -f $(DESTDIR)$(libdir)/libxen$(LIBNAME).so.$(MAJOR).$(MINOR)
@@ -90,6 +109,7 @@ clean:
 	rm -f libxen$(LIBNAME).so.$(MAJOR).$(MINOR) libxen$(LIBNAME).so.$(MAJOR)
 	rm -f headers.chk
 	rm -f xen$(LIBNAME).pc
+	rm -f $(LIBHEADERSGLOB)
 
 .PHONY: distclean
 distclean: clean
-- 
2.26.2


