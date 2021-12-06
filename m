Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9CE46A26D
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:09:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239526.415460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHTs-0005xj-LO; Mon, 06 Dec 2021 17:08:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239526.415460; Mon, 06 Dec 2021 17:08:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHTr-0005jP-SD; Mon, 06 Dec 2021 17:08:47 +0000
Received: by outflank-mailman (input) for mailman id 239526;
 Mon, 06 Dec 2021 17:08:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHPR-0005ti-UY
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:04:14 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89180612-56b6-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 18:04:12 +0100 (CET)
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
X-Inumbo-ID: 89180612-56b6-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810252;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=PaRpznZsW3QhyTgpNv/aUOxfOv+4R+mSSEyH1lNtJQI=;
  b=SBZBSIKGVRDPx6CFF3/ef9ANDdOGrVSmsAXDxOwcfJqUeuEmhGn8CUw7
   OeRX0AQgNewZMuWdeGb60ikOoXokholMfVLtznyQnohegyM7yMXNVoQcy
   RcYYi1epG6Ao+MHISWoY5/1k0EySeDc6A8SKZT79X0bnfFY7m/55PCvDI
   w=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: d9acAcAOzi3U71V7z8h/8EuIXSErJ2b8x8dW0cCN7EUtusQeiXA6t/bTKIrDD55MOoVxAJN3CF
 Ml0gjjQWsWFHpRFYv4F3gc+5nBhO+UHulabfemub3AFf1XnVyx1hAJfi4c2fZ+e6Jphwts/tj1
 /U1ldUSuYUvKegC9AnW6OCFv3FY4fId5ftFG5tVIJx+qCQqZRkz/vBQoPVBrYD47eVMUaLQMrb
 8Irf8fhrnXBPlBu92NkltPNLof+32pcMFhL7VNZZ+FN3LojrWfeaqUaSiPlnDIjLISWxOJf+Ll
 csJl/p8j/chk4exi5uXC5LrM
X-SBRS: 5.1
X-MesageID: 61420800
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:XyWYf658CpoDonqek1zseQxRtMnAchMFZxGqfqrLsTDasY5as4F+v
 jZOCGHXOqzYZWL0f41wPY/g/EMB65eGxtdjHlRs+H0yHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdj2tAw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zl
 IgchaWJaQATGqjnl74aAxhkHgx6IvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gQRKqEP
 5pBMVKDajzmOxx3GgoeMKlno7i4j3LzSWBZtGia8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u12b2GBYBL/SE1CGItHmrg4fnnDz5cJIfEqWi8fxni0HVwXYcYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiHeCoh4bXcsWC+Ag4RuB4qXR6gedQGMDS1Z8hMcO7ZFsA2Zwj
 xnQwo2vVWcHXKCppWy1qurFnQqLGS8vCWopanUDHQo57vTnv9Rm5v7QdepLHKmwh9zzPDj/x
 TGWsSQz74kuYd43O7aTpg6e3W/1znTdZktsv1iMADr5hu9sTNf9P9TA1LTN0RpXwG91pHGlt
 WNMpcWR5ftm4XqlxH3UG7Vl8F1ECp+43NzgbbxHQsBJG9eFoSfLkWVsDNdWfh0B3iEsI2CBX
 aMrkVkNjKK/xVPzBUONX6q/Ct4x0Y/rHsn/W/bfY7JmO8YqJFDdrXw0PxDPjwgBdXTAd4llY
 /93lu72Uh4n5VlPlmLqF4/xL5d1rszB+Y8jbc+ilEn2uVZvTHWUVa0EIDOzghMRt8u5TPHu2
 48HbaOikkwHOMWnO3W/2dNDfDgicClgbbir+pM/SwJ2Clc/cI3XI6SKmu1Jlk0Mt/k9q9okC
 VnhABIFkwSm2iWcQehIA1g6AI7SsV9EhSpTFUQR0ZyAghDPuK6js/UScYUZZ74i+LAxxPJ4V
 aBdKc6BHu5OWnLM/DFENcvxq4lrdRKKgwOSPnX6PGhjLsA4HwGZqMX5egbP9TUVCnblv8UJv
 LD9hBjQRoAORlo+AZ+OOu6v1V64oVMUhPl2AxnTOtBWdUi1qNpqJiX9g+UZOcYJLRmflDKW2
 xzPWUUTpPXXop9z+97M3PjWo4CsGup4P0xbA2iEsurmaXiEpjKumNYSXvyJcDbRUHLP1J+jP
 egFnevhNPAnnUpRt9YuGbhc0q9jtcDkoKVXz1o4ESyTPUirEL5pPlKPwdJL6v9W3rZctAa7B
 hCP991dNenbMc/pCgdMdg8sb+DF3vAIgDjCq/8yJRyitiNw+bOGV2RUPgWN13MBfOckbtt9z
 LdzotMS5iy+lgEuY4SPgS1j/miRKmANDvc8vZYADY630gcmxzmuu3AH5vMaNH1XV+hxDw==
IronPort-HdrOrdr: A9a23:a2TtT6gOPfXwgsD7MfyFeYmVuXBQXuIji2hC6mlwRA09TySZ//
 rBoB19726TtN9xYgBZpTnuAsm9qB/nmaKdpLNhWItKPzOW31dATrsSjrcKqgeIc0aVm9K1l5
 0QF5SWYOeAdGSS5vya3ODXKbkdKaG8gcKVuds=
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="61420800"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH 39/57] libs: Remove both "libs" and "build" target
Date: Mon, 6 Dec 2021 17:02:22 +0000
Message-ID: <20211206170241.13165-40-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

"libs" is odd and has been introduced without a reason by c7d3afbb44.
Instead, only use "all".

Also remove "build" target as "all" is more appropriate and nothing is
using "build" in libs/ in the xen.git repo.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/libs.mk        | 12 +++---------
 tools/libs/light/Makefile |  2 +-
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index 996d467346..7c5ae26bbd 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -53,13 +53,7 @@ $(PKG_CONFIG_LOCAL): PKG_CONFIG_INCDIR = $(XEN_INCLUDE)
 $(PKG_CONFIG_LOCAL): PKG_CONFIG_LIBDIR = $(CURDIR)
 
 .PHONY: all
-all: build
-
-.PHONY: build
-build: libs libxen$(LIBNAME).map $(LIBHEADERS)
-
-.PHONY: libs
-libs: headers.chk $(LIB) $(PKG_CONFIG_INST) $(PKG_CONFIG_LOCAL)
+all: headers.chk $(LIB) $(PKG_CONFIG_INST) $(PKG_CONFIG_LOCAL) libxen$(LIBNAME).map $(LIBHEADERS)
 
 ifneq ($(NO_HEADERS_CHK),y)
 headers.chk:
@@ -96,14 +90,14 @@ lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR): $(PIC_OBJS) libxen$(LIBNAME).map
 # If abi-dumper is available, write out the ABI analysis
 ifneq ($(ABI_DUMPER),)
 ifneq ($(nosharedlibs),y)
-libs: $(PKG_ABI)
+all: $(PKG_ABI)
 $(PKG_ABI): lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR) headers.lst
 	$(ABI_DUMPER) $< -o $@ -public-headers headers.lst -lver $(MAJOR).$(MINOR)
 endif
 endif
 
 .PHONY: install
-install: build
+install: all
 	$(INSTALL_DIR) $(DESTDIR)$(libdir)
 	$(INSTALL_DIR) $(DESTDIR)$(includedir)
 	$(INSTALL_SHLIB) lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)
diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index fb5a9ca87e..be32d95d39 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -187,7 +187,7 @@ testidl.c: libxl_types.idl gentest.py $(XEN_INCLUDE)/libxl.h $(AUTOINCS)
 	$(PYTHON) gentest.py libxl_types.idl testidl.c.new
 	mv testidl.c.new testidl.c
 
-build: $(CLIENTS) $(TEST_PROGS) $(AUTOSRCS) $(AUTOINCS)
+all: $(CLIENTS) $(TEST_PROGS) $(AUTOSRCS) $(AUTOINCS)
 
 $(LIB_OBJS) $(PIC_OBJS) $(SAVE_HELPER_OBJS) $(LIBXL_TEST_OBJS) $(TEST_PROG_OBJS): $(AUTOINCS) libxl.api-ok
 
-- 
Anthony PERARD


