Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B68255DB9
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 17:22:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBgCb-0008L6-Oj; Fri, 28 Aug 2020 15:22:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pjxq=CG=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1kBfzu-0004eG-6m
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 15:08:58 +0000
X-Inumbo-ID: ef04c828-9a48-4e66-9eaf-41e8ffd3ad27
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ef04c828-9a48-4e66-9eaf-41e8ffd3ad27;
 Fri, 28 Aug 2020 15:07:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3F562B01E;
 Fri, 28 Aug 2020 15:08:28 +0000 (UTC)
From: Juergen Gross <jgross@suse.com>
To: xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH v4 29/31] tools: rename global libxlutil make variables
Date: Fri, 28 Aug 2020 17:07:45 +0200
Message-Id: <20200828150747.25305-30-jgross@suse.com>
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

Rename *_libxlutil make variables to *_libxenutil in order to avoid
nasty indirections when moving libxlutil under the tools/libs
infrastructure.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 tools/Rules.mk       | 10 +++++-----
 tools/libxl/Makefile |  4 ++--
 tools/xl/Makefile    |  4 ++--
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/tools/Rules.mk b/tools/Rules.mk
index a80a633190..9b9db62fe5 100644
--- a/tools/Rules.mk
+++ b/tools/Rules.mk
@@ -15,7 +15,7 @@ XEN_INCLUDE        = $(XEN_ROOT)/tools/include
 
 include $(XEN_ROOT)/tools/libs/uselibs.mk
 
-XEN_libxlutil      = $(XEN_ROOT)/tools/libxl
+XEN_libxenutil     = $(XEN_ROOT)/tools/libxl
 
 CFLAGS_xeninclude = -I$(XEN_INCLUDE)
 
@@ -116,10 +116,10 @@ else
 CFLAGS += -O2 -fomit-frame-pointer
 endif
 
-CFLAGS_libxlutil = -I$(XEN_libxlutil)
-SHDEPS_libxlutil = $(SHLIB_libxenlight)
-LDLIBS_libxlutil = $(SHDEPS_libxlutil) $(XEN_libxlutil)/libxlutil$(libextension)
-SHLIB_libxlutil  = $(SHDEPS_libxlutil) -Wl,-rpath-link=$(XEN_libxlutil)
+CFLAGS_libxenutil = -I$(XEN_libxenutil)
+SHDEPS_libxenutil = $(SHLIB_libxenlight)
+LDLIBS_libxenutil = $(SHDEPS_libxenutil) $(XEN_libxenutil)/libxlutil$(libextension)
+SHLIB_libxenutil  = $(SHDEPS_libxenutil) -Wl,-rpath-link=$(XEN_libxenutil)
 
 CFLAGS += -D__XEN_INTERFACE_VERSION__=__XEN_LATEST_INTERFACE_VERSION__
 
diff --git a/tools/libxl/Makefile b/tools/libxl/Makefile
index 8ab7c9d3f0..51da1d5be4 100644
--- a/tools/libxl/Makefile
+++ b/tools/libxl/Makefile
@@ -42,7 +42,7 @@ PKG_CONFIG_INST := $(PKG_CONFIG)
 xlutil.pc: PKG_CONFIG_NAME = Xlutil
 xlutil.pc: PKG_CONFIG_DESC = The xl utility library for Xen hypervisor
 xlutil.pc: PKG_CONFIG_VERSION = $(XLUMAJOR).$(XLUMINOR)
-xlutil.pc: PKG_CONFIG_USELIBS = $(SHLIB_libxlutil)
+xlutil.pc: PKG_CONFIG_USELIBS = $(SHLIB_libxenutil)
 xlutil.pc: PKG_CONFIG_LIB = xlutil
 xlutil.pc: PKG_CONFIG_REQPRIV = xenlight
 $(PKG_CONFIG_INST): PKG_CONFIG_PREFIX = $(prefix)
@@ -55,7 +55,7 @@ PKG_CONFIG_LOCAL := $(foreach pc,$(PKG_CONFIG),$(PKG_CONFIG_DIR)/$(pc))
 $(PKG_CONFIG_DIR)/xlutil.pc: PKG_CONFIG_NAME = Xlutil
 $(PKG_CONFIG_DIR)/xlutil.pc: PKG_CONFIG_DESC = The xl utility library for Xen hypervisor
 $(PKG_CONFIG_DIR)/xlutil.pc: PKG_CONFIG_VERSION = $(XLUMAJOR).$(XLUMINOR)
-$(PKG_CONFIG_DIR)/xlutil.pc: PKG_CONFIG_USELIBS = $(SHLIB_libxlutil)
+$(PKG_CONFIG_DIR)/xlutil.pc: PKG_CONFIG_USELIBS = $(SHLIB_libxenutil)
 $(PKG_CONFIG_DIR)/xlutil.pc: PKG_CONFIG_LIB = xlutil
 $(PKG_CONFIG_DIR)/xlutil.pc: PKG_CONFIG_REQPRIV = xenlight
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_PREFIX = $(XEN_ROOT)
diff --git a/tools/xl/Makefile b/tools/xl/Makefile
index 407dd7554c..bdf67c8464 100644
--- a/tools/xl/Makefile
+++ b/tools/xl/Makefile
@@ -13,7 +13,7 @@ CFLAGS += $(PTHREAD_CFLAGS)
 LDFLAGS += $(PTHREAD_LDFLAGS)
 
 CFLAGS_XL += $(CFLAGS_libxenlight)
-CFLAGS_XL += $(CFLAGS_libxlutil)
+CFLAGS_XL += $(CFLAGS_libxenutil)
 CFLAGS_XL += -Wshadow
 
 XL_OBJS-$(CONFIG_X86) = xl_psr.o
@@ -38,7 +38,7 @@ $(XL_OBJS): _paths.h
 all: xl
 
 xl: $(XL_OBJS)
-	$(CC) $(LDFLAGS) -o $@ $(XL_OBJS) $(LDLIBS_libxlutil) $(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) -lyajl $(APPEND_LDFLAGS)
+	$(CC) $(LDFLAGS) -o $@ $(XL_OBJS) $(LDLIBS_libxenutil) $(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) -lyajl $(APPEND_LDFLAGS)
 
 .PHONY: install
 install: all
-- 
2.26.2


