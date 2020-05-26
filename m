Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3DA1E3233
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 00:17:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdhsX-00081x-VY; Tue, 26 May 2020 22:16:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=52a6=7I=citrix.com=george.dunlap@srs-us1.protection.inumbo.net>)
 id 1jdhsW-00081S-Ie
 for xen-devel@lists.xenproject.org; Tue, 26 May 2020 22:16:56 +0000
X-Inumbo-ID: 929bb0da-9f9e-11ea-a6c3-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 929bb0da-9f9e-11ea-a6c3-12813bfff9fa;
 Tue, 26 May 2020 22:16:42 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: yW0inEishecCLkrpueYmCQX7SwgD6cEnEpRYPwL4Ph6EZXjjCl2Z7efPQFhiaJZjYHQxkbcTgK
 Ckpo8xSFETBl72pDg7BjZtr5+lGfHQ7HfOoDgHFvuJFyhQ82xEutpxtW+QEuDUhGDEUaowQaRo
 sJt/n3LXVYKMmYCrms7Xe2rKT8HOi6ToR1e5qUK97kJ1xE3HZJIoYKsp4x5WwI+iSPK8F3FDU/
 Xw9GaXBfqcQ7UKIVVhCyDcYbaIs7cFSR+ZrAKG0p9oxrmMkxkDaItTgIf8mpD0B+8kUD9eEPzF
 I+Q=
X-SBRS: 2.7
X-MesageID: 19238412
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,439,1583211600"; d="scan'208";a="19238412"
From: George Dunlap <george.dunlap@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 2/5] golang/xenlight: Get rid of GOPATH-based build
 artefacts
Date: Tue, 26 May 2020 23:16:09 +0100
Message-ID: <20200526221612.900922-3-george.dunlap@citrix.com>
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
Cc: Nick Rosbrook <rosbrookn@ainfosec.com>,
 Ian Jackson <ian.jackson@citrix.com>, George Dunlap <george.dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The original build setup used a "fake GOPATH" in tools/golang to test
the mechanism of building from go package files installed on a
filesystem.  With the move to modules, this isn't necessary, and leads
to potentially confusing directories being created.  (I.e., it might
not be obvious that files under tools/golang/src shouldn't be edited.)

Get rid of the code that creates this (now unused) intermediate
directory.  Add direct dependencies from 'build' onto the source
files.

Signed-off-by: George Dunlap <george.dunlap@citrix.com>
---
v2:
- New

CC: Ian Jackson <ian.jackson@citrix.com>
CC: Nick Rosbrook <rosbrookn@ainfosec.com>
---
 tools/Rules.mk                 |  1 -
 tools/golang/Makefile          | 10 ----------
 tools/golang/xenlight/Makefile | 19 ++++---------------
 3 files changed, 4 insertions(+), 26 deletions(-)

diff --git a/tools/Rules.mk b/tools/Rules.mk
index 59c72e7a88..76acaef988 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -35,7 +35,6 @@ XENSTORE_XENSTORED ?= y
 debug ?= y
 debug_symbols ?= $(debug)
 
-XEN_GOPATH        = $(XEN_ROOT)/tools/golang
 XEN_GOCODE_URL    = golang.xenproject.org
 
 ifeq ($(debug_symbols),y)
diff --git a/tools/golang/Makefile b/tools/golang/Makefile
index aba11ebc39..b022e2c5a3 100644
--- a/tools/golang/Makefile
+++ b/tools/golang/Makefile
@@ -1,16 +1,6 @@
 XEN_ROOT=$(CURDIR)/../..
 include $(XEN_ROOT)/tools/Rules.mk
 
-# In order to link against a package in Go, the package must live in a
-# directory tree in the way that Go expects.  To make this possible,
-# there must be a directory such that we can set GOPATH=${dir}, and
-# the package will be under $GOPATH/src/${full-package-path}.
-
-# So we set XEN_GOPATH to $XEN_ROOT/tools/golang.  The xenlight
-# "package build" directory ($PWD/xenlight) will create the "package
-# source" directory in the proper place.  Go programs can use this
-# package by setting GOPATH=$(XEN_GOPATH).
-
 SUBDIRS-y = xenlight
 
 .PHONY: build all
diff --git a/tools/golang/xenlight/Makefile b/tools/golang/xenlight/Makefile
index 8ab4cb5665..f8d8047524 100644
--- a/tools/golang/xenlight/Makefile
+++ b/tools/golang/xenlight/Makefile
@@ -14,17 +14,8 @@ LIBXL_SRC_DIR = ../../libxl
 .PHONY: all
 all: build
 
-.PHONY: package
-package: $(XEN_GOPATH)$(GOXL_PKG_DIR)
-
 GOXL_GEN_FILES = types.gen.go helpers.gen.go
 
-$(XEN_GOPATH)/src/$(XEN_GOCODE_URL)/xenlight/: xenlight.go $(GOXL_GEN_FILES)
-	$(INSTALL_DIR) $(XEN_GOPATH)$(GOXL_PKG_DIR)
-	$(INSTALL_DATA) xenlight.go $(XEN_GOPATH)$(GOXL_PKG_DIR)
-	$(INSTALL_DATA) types.gen.go $(XEN_GOPATH)$(GOXL_PKG_DIR)
-	$(INSTALL_DATA) helpers.gen.go $(XEN_GOPATH)$(GOXL_PKG_DIR)
-
 # NOTE: This target is called from libxl/Makefile:all.  Since that
 # target must finish before golang/Makefile is called, this is
 # currently safe.  It must not be called from anywhere else in the
@@ -43,23 +34,21 @@ idl-gen: $(GOXL_GEN_FILES)
 # in the LDFLAGS; and thus we need to add -L$(XEN_XENLIGHT) here
 # so that it can find the actual library.
 .PHONY: build
-build: package
+build: xenlight.go $(GOXL_GEN_FILES)
 	CGO_CFLAGS="$(CFLAGS_libxenlight) $(CFLAGS_libxentoollog)" CGO_LDFLAGS="$(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) -L$(XEN_XENLIGHT) -L$(XEN_LIBXENTOOLLOG)" $(GO) build -x
 
 .PHONY: install
 install: build
 	$(INSTALL_DIR) $(DESTDIR)$(GOXL_INSTALL_DIR)
-	$(INSTALL_DATA) $(XEN_GOPATH)$(GOXL_PKG_DIR)xenlight.go $(DESTDIR)$(GOXL_INSTALL_DIR)
-	$(INSTALL_DATA) $(XEN_GOPATH)$(GOXL_PKG_DIR)types.gen.go $(DESTDIR)$(GOXL_INSTALL_DIR)
-	$(INSTALL_DATA) $(XEN_GOPATH)$(GOXL_PKG_DIR)helpers.gen.go $(DESTDIR)$(GOXL_INSTALL_DIR)
+	$(INSTALL_DATA) xenlight.go $(DESTDIR)$(GOXL_INSTALL_DIR)
+	$(INSTALL_DATA) types.gen.go $(DESTDIR)$(GOXL_INSTALL_DIR)
+	$(INSTALL_DATA) helpers.gen.go $(DESTDIR)$(GOXL_INSTALL_DIR)
 
 .PHONY: uninstall
 	rm -rf $(DESTDIR)$(GOXL_INSTALL_DIR)
 
 .PHONY: clean
 clean:
-	$(RM) -r $(XEN_GOPATH)$(GOXL_PKG_DIR)
-	$(RM) $(XEN_GOPATH)/pkg/*/$(XEN_GOCODE_URL)/xenlight.a
 
 .PHONY: distclean
 distclean: clean
-- 
2.25.1


