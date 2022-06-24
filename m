Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AB2559E02
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 18:05:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355616.583476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lnt-0000q1-W5; Fri, 24 Jun 2022 16:05:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355616.583476; Fri, 24 Jun 2022 16:05:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lnt-0000kn-B9; Fri, 24 Jun 2022 16:05:05 +0000
Received: by outflank-mailman (input) for mailman id 355616;
 Fri, 24 Jun 2022 16:05:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7mLY=W7=citrix.com=prvs=16756bcf7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o4lnq-0004qc-VI
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 16:05:02 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 656edef2-f3d7-11ec-b725-ed86ccbb4733;
 Fri, 24 Jun 2022 18:05:00 +0200 (CEST)
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
X-Inumbo-ID: 656edef2-f3d7-11ec-b725-ed86ccbb4733
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656086700;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AvHTHvehrcxwVAzIH4QeC8DG622elqZioP/rCdCMY4Q=;
  b=NEjOe9I9L8eU4Aajhgy25p0mgG6XXIIeGkqV8Ym5XoO7J1gCg41E/YEB
   kv1AchNILcmquAdiG1GW7pQtZizv/4nbBOhlb3cDg1wBVh2giy8vY+TMC
   0qkjJBeVbrVm/eAUhKNDdCIViW0CKVIOygCHXRjBncAa8NHWY7PDvYh0G
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 74384212
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:7qkL9q6EJxPxb1XyrvgjrQxRtGDHchMFZxGqfqrLsTDasY5as4F+v
 jNMWGnXOanZa2bweYt0ady29R9VvZ7Qy9BnT1NvrSpjHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw03qPp8Zj2tQy2YbjX1vX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurSzZCZ5Hrf1l94YCTZVF39cBfx5w4budC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsWvG1gyjfIS+4rW5nZT43B5MNC3Sd2jcdLdRrbT
 5VFMmozNk2aC/FJEltPOr8Bt8C0vX68WSV1p3Kb+ulvxHeGmWSd15CyaYGIK7RmX/59nEmCo
 Xnd13/kGRxcP9uaoRKa9lq8i+mJmjn0MKoCGbv9+vN0jVm7wm0IFAZQRVa9ueO+iEO1R5RYM
 UN8x8Y1hfFsrgrxFIC7BkDm5i7f1vIBZzZOO+4XyVGt0JPb2QPDKWUAEBx5OeMdjeZjEFTGy
 WS1c8PV6S1H6ePIFyrGq+/L/VteKgBOczZcOHZsoR8tpoC6/dpt1k+nosNLSvbdszHjJd3nL
 9lmRgAajq5bs8ME3r7TEbvv02P1/cihouLYC2zqsoOZAuBRPtfNi3SAswSz0Bq5BN/xoqO9l
 HYFgdOCy+sFEIuAkieAKM1UQuz3v67UaWKA2QYwd3XEy9hL0yT7FWy3yGEWGauUGpxcJW+Bj
 LH742u9G6O/zFP1NPQqMupd+uwhzLT6FMSNa804muFmO8ArHCfepXkGTRfJgwjFzRh9+Ylia
 MzzWZv9Uh4n5VFPkWPeqxE1iuRwmEjTBAr7GPjG8vhQ+eDPOifLFehUawXmgyJQxPrsnTg5O
 u13b6OioyizmsWnCsUL2eb/9Ww3EEU=
IronPort-HdrOrdr: A9a23:4t1VPqoJaMCqR9ovrIH8W0EaV5oTeYIsimQD101hICG8cqSj+f
 xG+85rsyMc6QxhIE3I9urhBEDtex/hHNtOkOws1NSZLW7bUQmTXeJfBOLZqlWKcUDDH6xmpM
 NdmsBFeaTN5DNB7PoSjjPWLz9Z+qjkzJyV
X-IronPort-AV: E=Sophos;i="5.92,218,1650945600"; 
   d="scan'208";a="74384212"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wl@xen.org>, "Juergen
 Gross" <jgross@suse.com>
Subject: [XEN PATCH v3 15/25] libs/libs.mk: Rename $(LIB) to $(TARGETS)
Date: Fri, 24 Jun 2022 17:04:12 +0100
Message-ID: <20220624160422.53457-16-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624160422.53457-1-anthony.perard@citrix.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/libs.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index 58d8166b09..e02f91f95e 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -23,9 +23,9 @@ LDLIBS += $(foreach lib, $(USELIBS_$(LIBNAME)), $(LDLIBS_libxen$(lib)))
 PIC_OBJS := $(OBJS-y:.o=.opic)
 
 LIB_FILE_NAME = $(FILENAME_$(LIBNAME))
-LIB := lib$(LIB_FILE_NAME).a
+TARGETS := lib$(LIB_FILE_NAME).a
 ifneq ($(nosharedlibs),y)
-LIB += lib$(LIB_FILE_NAME).so
+TARGETS += lib$(LIB_FILE_NAME).so
 endif
 
 PKG_CONFIG ?= $(LIB_FILE_NAME).pc
@@ -55,7 +55,7 @@ $(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_INCLUDE)
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_LIBDIR = $(CURDIR)
 
 .PHONY: all
-all: headers.chk $(LIB) $(PKG_CONFIG_INST) $(PKG_CONFIG_LOCAL) libxen$(LIBNAME).map $(LIBHEADERS)
+all: headers.chk $(TARGETS) $(PKG_CONFIG_INST) $(PKG_CONFIG_LOCAL) libxen$(LIBNAME).map $(LIBHEADERS)
 
 ifneq ($(NO_HEADERS_CHK),y)
 headers.chk:
@@ -124,7 +124,7 @@ TAGS:
 
 .PHONY: clean
 clean::
-	rm -rf $(LIB) *~ $(DEPS_RM) $(OBJS-y) $(PIC_OBJS)
+	rm -rf $(TARGETS) *~ $(DEPS_RM) $(OBJS-y) $(PIC_OBJS)
 	rm -f lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR) lib$(LIB_FILE_NAME).so.$(MAJOR)
 	rm -f headers.chk headers.lst
 	rm -f $(PKG_CONFIG)
-- 
Anthony PERARD


