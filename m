Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD1859050D
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 18:49:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384798.620353 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBN4-0006ko-01; Thu, 11 Aug 2022 16:49:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384798.620353; Thu, 11 Aug 2022 16:49:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBN3-0006cO-LD; Thu, 11 Aug 2022 16:49:21 +0000
Received: by outflank-mailman (input) for mailman id 384798;
 Thu, 11 Aug 2022 16:49:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jhQd=YP=citrix.com=prvs=21531f474=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oMBN1-0003Aq-Ep
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 16:49:19 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8991fb32-1995-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 18:49:18 +0200 (CEST)
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
X-Inumbo-ID: 8991fb32-1995-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660236558;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bUOi3WNc8oZFZzCNM4EoNrFdmqodDZX34IS+jodiKpU=;
  b=dN/QJmGl+E1J8AFUSvoBbfrhpgGmGsE4Cb0KLvREZ9zFUjsseW/YoNqQ
   r8mfAH8EPG67qn2rq4hz4RIatUaJ/GJyy9IcgTxfMU9/4xpIrkWbgCyK4
   /0NzafJhMtjBKGyU0+0tOfuL/fFMNB5F0EZ3IWxQF2fIleDl0bZcokIyC
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 80449000
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:BgLCHKJ4Z7WBzAExFE+R15UlxSXFcZb7ZxGr2PjKsXjdYENShDwPm
 GoZCzrTO/fbZmrwLYt2Ot7ipkkBv5/Sm4BhHgdlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vraP65xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOd8iYNz6TSDK1rlV
 eja/ouOYzdJ5xYuajhOs/La8Us11BjPkGhwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 44vG5ngows1Vz90Yj+Uuu6Tnn8iG9Y+DiDX4pZiYICwgwAqm8AH+v1T2Mzwy6tgo27hc9hZk
 L2hvHErIOsjFvWkdO81C3G0H8ziVEHvFXCuzXWX6KSuI0P6n3TE298/FkQ5L6gjo8FzInFHy
 uIaETAnV0XW7w626OrTpuhEg80iKI/gPZ8Fu2EmxjbcZRokacmdGeOQv4YehWpuwJAVdRrdT
 5NxhT5HZRLcYxpJKxEPBYg3huuAjXjjaTxI7lmSoMLb5kCDlFAtgeC1aLI5fPSGH9lEgRjEm
 ljm2Fn5IC4EL5uj1QSspyfEaujnwnqgBdN6+KeD3vRnmkGJz2ofThgfT0KmoOKRg1S7HdlYL
 iQ85S4GvaU0skuxQbHVTxC+5XKJoBMYc95RCPEhrhGAzLLO5ASUDXRCSSROAPQku9UxXicCz
 UKSkpXiAjkHjVGOYSvDrPHO92r0YHVLaz9ZDcMZcecby8HJ8Zs2gQDqdY9EFI2lh+LrGwjw6
 Qnf+UDSmI4vYd43O7STpA6Z22r9+cGQEGbZ9S2MADv7s1oRiJqNItXxtAOFtasowJOxFAHpg
 ZQSpySJAAni57mpnTfFfugCFarBCx2tYGyF2g4H83XMGl2QF5+fkWN4umgWyL9BaJpsRNMQS
 Ba7VfltzJFSJmC2SqR8fpi8Dc8npYC5S4q9Dq+MN4seP8IrHONiwM2JTRD44owQuBJ0zfFX1
 WmzKK5A8kr2+Yw4lWHrFo/xIJcgxzwkxHO7eK0XOy+PiOPGDFbIGOhtDbd7RrpmhE9yiFmKr
 o032grj40k3bdASlQGLqNJPcQ1RfSRibX00wuQOHtO+zsNdMDlJI5fsLXkJJ+SJQ4w9ej/0w
 0yA
IronPort-HdrOrdr: A9a23:+r1HwKCOkpHHAgPlHemU55DYdb4zR+YMi2TC1yhKJyC9Ffbo8f
 xG/c5rrSMc5wxwZJhNo7y90ey7MBbhHP1OkO4s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpN
 5dmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="80449000"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>, Bertrand Marquis <bertrand.marquis@arm.com>, Wei Liu
	<wl@xen.org>
Subject: [XEN PATCH v4 12/32] libs/libs.mk: Rename $(LIB) to $(TARGETS)
Date: Thu, 11 Aug 2022 17:48:25 +0100
Message-ID: <20220811164845.38083-13-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811164845.38083-1-anthony.perard@citrix.com>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
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


