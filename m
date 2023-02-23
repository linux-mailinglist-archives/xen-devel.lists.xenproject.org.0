Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7A66A094F
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 14:04:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500346.771681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVBFt-0005Ys-2Z; Thu, 23 Feb 2023 13:03:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500346.771681; Thu, 23 Feb 2023 13:03:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVBFs-0005Wh-W0; Thu, 23 Feb 2023 13:03:24 +0000
Received: by outflank-mailman (input) for mailman id 500346;
 Thu, 23 Feb 2023 13:03:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ERnD=6T=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1pVBFr-0005Wb-PL
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 13:03:23 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 72f3f6a2-b37a-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 14:03:22 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02594C14;
 Thu, 23 Feb 2023 05:04:04 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B3B83F881;
 Thu, 23 Feb 2023 05:03:20 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 72f3f6a2-b37a-11ed-88bb-e56d68cac8db
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH] tools: Use PKG_CONFIG_FILE instead of PKG_CONFIG variable
Date: Thu, 23 Feb 2023 13:03:03 +0000
Message-Id: <b2638649e04e516e0aecabd928aa3f63ed50c409.1677150173.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace PKG_CONFIG variable name with PKG_CONFIG_FILE for the name of
the pkg-config file.
This is preventing a conflict in some build systems where PKG_CONFIG
actually contains the path to the pkg-config executable to use, as the
default assignment in libs.mk is using a weak assignment (?=).

This problem has been found when trying to build the latest version of
Xen tools using buildroot.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 tools/libs/ctrl/Makefile |  2 +-
 tools/libs/libs.mk       | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/tools/libs/ctrl/Makefile b/tools/libs/ctrl/Makefile
index 094e84b8d819..5fe0bfad0c7e 100644
--- a/tools/libs/ctrl/Makefile
+++ b/tools/libs/ctrl/Makefile
@@ -4,7 +4,7 @@ include $(XEN_ROOT)/tools/Rules.mk
 include Makefile.common
 
 LIBHEADER := xenctrl.h xenctrl_compat.h
-PKG_CONFIG := xencontrol.pc
+PKG_CONFIG_FILE := xencontrol.pc
 PKG_CONFIG_NAME := Xencontrol
 
 NO_HEADERS_CHK := y
diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index ffb6c9f064f1..8115aa58a671 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -1,7 +1,7 @@
 # Common Makefile for building a lib.
 #
 # Variables taken as input:
-#   PKG_CONFIG: name of pkg-config file (xen$(LIBNAME).pc if empty)
+#   PKG_CONFIG_FILE: name of pkg-config file (xen$(LIBNAME).pc if empty)
 #   MAJOR:   major version of lib (Xen version if empty)
 #   MINOR:   minor version of lib (0 if empty)
 #   version-script: Specify the name of a version script to the linker.
@@ -30,7 +30,7 @@ endif
 
 version-script ?= lib$(LIB_FILE_NAME).map.tmp
 
-PKG_CONFIG ?= $(LIB_FILE_NAME).pc
+PKG_CONFIG_FILE ?= $(LIB_FILE_NAME).pc
 PKG_CONFIG_NAME ?= Xen$(LIBNAME)
 PKG_CONFIG_DESC ?= The $(PKG_CONFIG_NAME) library for Xen hypervisor
 PKG_CONFIG_VERSION := $(MAJOR).$(MINOR)
@@ -39,13 +39,13 @@ PKG_CONFIG_LIB := $(LIB_FILE_NAME)
 PKG_CONFIG_REQPRIV := $(subst $(space),$(comma),$(strip $(foreach lib,$(patsubst ctrl,control,$(USELIBS_$(LIBNAME))),xen$(lib))))
 
 ifneq ($(CONFIG_LIBXC_MINIOS),y)
-TARGETS += $(PKG_CONFIG)
-$(PKG_CONFIG): PKG_CONFIG_PREFIX = $(prefix)
-$(PKG_CONFIG): PKG_CONFIG_INCDIR = $(includedir)
-$(PKG_CONFIG): PKG_CONFIG_LIBDIR = $(libdir)
+TARGETS += $(PKG_CONFIG_FILE)
+$(PKG_CONFIG_FILE): PKG_CONFIG_PREFIX = $(prefix)
+$(PKG_CONFIG_FILE): PKG_CONFIG_INCDIR = $(includedir)
+$(PKG_CONFIG_FILE): PKG_CONFIG_LIBDIR = $(libdir)
 endif
 
-PKG_CONFIG_LOCAL := $(PKG_CONFIG_DIR)/$(PKG_CONFIG)
+PKG_CONFIG_LOCAL := $(PKG_CONFIG_DIR)/$(PKG_CONFIG_FILE)
 
 LIBHEADER ?= $(LIB_FILE_NAME).h
 LIBHEADERS = $(foreach h, $(LIBHEADER), $(XEN_INCLUDE)/$(h))
@@ -108,7 +108,7 @@ install:: all
 	$(SYMLINK_SHLIB) lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)/lib$(LIB_FILE_NAME).so.$(MAJOR)
 	$(SYMLINK_SHLIB) lib$(LIB_FILE_NAME).so.$(MAJOR) $(DESTDIR)$(libdir)/lib$(LIB_FILE_NAME).so
 	for i in $(LIBHEADERS); do $(INSTALL_DATA) $$i $(DESTDIR)$(includedir); done
-	$(INSTALL_DATA) $(PKG_CONFIG) $(DESTDIR)$(PKG_INSTALLDIR)
+	$(INSTALL_DATA) $(PKG_CONFIG_FILE) $(DESTDIR)$(PKG_INSTALLDIR)
 
 .PHONY: uninstall
 uninstall::
-- 
2.25.1


