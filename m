Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAA046A25B
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:08:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239506.415317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHTI-0007hh-4O; Mon, 06 Dec 2021 17:08:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239506.415317; Mon, 06 Dec 2021 17:08:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHTH-0007dA-UY; Mon, 06 Dec 2021 17:08:11 +0000
Received: by outflank-mailman (input) for mailman id 239506;
 Mon, 06 Dec 2021 17:08:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHPX-0005ti-7H
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:04:19 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b818dc7-56b6-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 18:04:18 +0100 (CET)
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
X-Inumbo-ID: 8b818dc7-56b6-11ec-8a4d-196798b21f7b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810257;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ytpv1GJ97QFgCSDKhxDlCpFXGIfYKNw5dkuyhzF8ZW0=;
  b=cB/FqGgNcRy3UFOOj1Di8R3FwJjzEUhS4FRLJwFf8pBmETMvmJC4KlsD
   cDBCDc2bbAqEIypGzI4+OATxOO2Hp2KgZ99uueF73PUGMQE7C7S+LuptL
   iBLlQcujT5BRLQtGjhUtALdmbI5vyxkhi8m7BgyLuxLOk09/GEm2LQIc5
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 2a7bXfnfX/hJI9VilSP3+m6XrAQHGhSghUBZDAmP73tecoD3mRLo4lwx/Ien1avZWKkk22q8RF
 tlUfJxOEtQwShxLmVFwRsqQ45NA0/U8QMTsE8HH02kv4U8hSo4kE2kjnUYM3jodzsUhKT0DpBy
 Srm3kNMQm1oFrE59ZVJHZ/h/SHscdZ4/+gpAyrAAi/IoKUuNmlDuC3M808BbuaQsUpUpiOpikn
 pKolnkVXPfUD+EgAsp2keHtkKBQiHXfoyG1t2/sKIOqmVub/HSh1LWYFJVRuiS1ACoi5OKssFD
 bNhxCCtvOBAtQHbI/Z5pLAoY
X-SBRS: 5.1
X-MesageID: 59387971
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:UuFQTK7yYcnk/Gh1Pia83wxRtMnAchMFZxGqfqrLsTDasY5as4F+v
 mYfWGuPbq2KNjCkKo0iPdi19UMB6JLXzNZmSwBkqHs1Hi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuV3zyIQUBUjclkfJKlYAL/En03FVAMpBsJ00o5wrdj2tAw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zm
 dhshY2WWxkSZfOSnt9HeglFUBNTIvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gTTK2OO
 JtGMFKDajzuWj5xNEY2EKsZo6Dyp1/jQSFmrlea8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u12b2GBYBL/SE1CGItHmrg4fnnDz5cJIfEqWi8fxni0HVwXYcYDUGWF3+rfSnh0qWX9NEN
 1dS6icotbI19kGgUp/6RRLQiHeCoh4bXcsWC+Ag4RuB4qXR6gedQGMDS1Z8hMcO7ZFsA2Zwj
 xnQwo2vVWcHXKCppWy1p7q1nSKUKzYudjFcYxReZBsYoOvOv9Rm5v7QdepLHKmwh9zzPDj/x
 TGWsSQz74kuYd43O7aTpg6e3W/1znTdZktsv1iMADr5hu9sTNf9P9TA1LTN0RpXwG91pHGlt
 WNMpcWR5ftm4XqlxH3UG7Vl8F1ECp+43NzgbbxHQsBJG9eFoSfLkWVsDNdWfh0B3iEsI2CBX
 aMrkVkNjKK/xVPzBUONX6q/Ct4x0Y/rHsn/W/bfY7JmO8YqJFDdrXw0PxDPjwgBdXTAd4llY
 /93lu72Uh4n5VlPlmLqF4/xL5d1rszB+Y8jbc+ilEn2uVZvTHWUVa0EIDOzghMRt8u5TPHu2
 48HbaOikkwHOMWnO3W/2dNDfDgicClgbbir+pM/SwJ2Clc/cI3XI6SKmu1Jlk0Mt/k9q9okC
 VnhABIFkwSm2iWcQehIA1g6AI7SsV9EhSpTFUQR0ZyAgRDPuK6js/UScYUZZ74i+LAxxPJ4V
 aBdKc6BHu5OWnLM/DFENcvxq4lrdRKKgwOSPnX6PGhjLsA4HwGZqMX5egbP9TUVCnblv8UJv
 LD9hBjQRoAORlo+AZ+OOu6v1V64oVMUhPl2AxnTOtBWdUi1qNpqJiX9g+UZOcYJLRmflDKW2
 xzPWUUTpPXXop9z+97M3PjWo4CsGup4P0xbA2iEsurmaXiEpjKumNYSXvyJcDbRUHLP1J+jP
 egFnevhNPAnnUpRt9YuGbhc0q9jtcDkoKVXz1o4ESyTPUirEL5pPlKPwdJL6v9W3rZctAa7B
 hCP991dNenbMc/pCgdMdg8sb+DF3vAIgDjCq/8yJRyitiNw+bOGV2RUPgWN13MBfOckbtt9z
 LdzotMS5iy+lgEuY4SPgS1j/miRKmANDvc8vZYADY630gcmxzmuu3AH5vMaNH1XV+hxDw==
IronPort-HdrOrdr: A9a23:JdkTsawH3TvmnH+QEREMKrPwKr1zdoMgy1knxilNoRw8SKOlfq
 eV7ZMmPH7P+U8ssR4b+OxoVJPsfZqYz+8W3WBzB8bHYOCFgguVxehZhOOIqQEIWReOk9K1vZ
 0QFZSWY+efMbEVt6rHCXGDYrUd/OU=
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="59387971"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH 41/57] libs: Remove need for *installlocal targets
Date: Mon, 6 Dec 2021 17:02:24 +0000
Message-ID: <20211206170241.13165-42-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

There is no need for an extra "installlocal" target, we can use
double-colon rules instead.

"install-headers" in "libs/store" was introduced for the same reason
that "installlocal" exist, so it is replaced as well.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/libs.mk        |  4 ++--
 tools/libs/light/Makefile | 10 ++--------
 tools/libs/store/Makefile | 10 ++--------
 3 files changed, 6 insertions(+), 18 deletions(-)

diff --git a/tools/libs/libs.mk b/tools/libs/libs.mk
index 91d4efeaed..7f2c676be4 100644
--- a/tools/libs/libs.mk
+++ b/tools/libs/libs.mk
@@ -97,7 +97,7 @@ endif
 endif
 
 .PHONY: install
-install: all
+install:: all
 	$(INSTALL_DIR) $(DESTDIR)$(libdir)
 	$(INSTALL_DIR) $(DESTDIR)$(includedir)
 	$(INSTALL_SHLIB) lib$(LIB_FILE_NAME).so.$(MAJOR).$(MINOR) $(DESTDIR)$(libdir)
@@ -108,7 +108,7 @@ install: all
 	$(INSTALL_DATA) $(PKG_CONFIG) $(DESTDIR)$(PKG_INSTALLDIR)
 
 .PHONY: uninstall
-uninstall:
+uninstall::
 	rm -f $(DESTDIR)$(PKG_INSTALLDIR)/$(LIB_FILE_NAME).pc
 	for i in $(LIBHEADER); do rm -f $(DESTDIR)$(includedir)/$$i; done
 	rm -f $(DESTDIR)$(libdir)/lib$(LIB_FILE_NAME).so
diff --git a/tools/libs/light/Makefile b/tools/libs/light/Makefile
index 622fa04470..5e52db9b30 100644
--- a/tools/libs/light/Makefile
+++ b/tools/libs/light/Makefile
@@ -243,17 +243,11 @@ libxl-save-helper: $(SAVE_HELPER_OBJS) libxenlight.so
 testidl: testidl.o libxenlight.so
 	$(CC) $(LDFLAGS) -o $@ testidl.o $(LDLIBS_libxenlight) $(LDLIBS_libxentoollog) $(LDLIBS_libxentoolcore) $(APPEND_LDFLAGS)
 
-install: installlocal $(LIBHEADERS)
-
-.PHONY: installlocal
-installlocal: libxl-save-helper
+install:: $(LIBHEADERS) libxl-save-helper
 	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
 	$(INSTALL_PROG) libxl-save-helper $(DESTDIR)$(LIBEXEC_BIN)
 
-uninstall: uninstalllocal
-
-.PHONY: uninstalllocal
-uninstalllocal:
+uninstall::
 	rm -f $(DESTDIR)$(LIBEXEC_BIN)/libxl-save-helper
 
 clean: cleanlocal
diff --git a/tools/libs/store/Makefile b/tools/libs/store/Makefile
index 457122a041..1bacee6cf1 100644
--- a/tools/libs/store/Makefile
+++ b/tools/libs/store/Makefile
@@ -32,10 +32,7 @@ endif
 -include $(DEPS_INCLUDE)
 
 .PHONY: install
-install: install-headers
-
-.PHONY: install-headers
-install-headers:
+install::
 	$(INSTALL_DIR) $(DESTDIR)$(includedir)
 	$(INSTALL_DIR) $(DESTDIR)$(includedir)/xenstore-compat
 	$(INSTALL_DATA) $(XEN_INCLUDE)/xenstore-compat/xs.h $(DESTDIR)$(includedir)/xenstore-compat/xs.h
@@ -44,10 +41,7 @@ install-headers:
 	ln -sf xenstore-compat/xs_lib.h $(DESTDIR)$(includedir)/xs_lib.h
 
 .PHONY: uninstall
-uninstall: uninstall-headers
-
-.PHONY: uninstall-headers
-uninstall-headers:
+uninstall::
 	rm -f $(DESTDIR)$(includedir)/xs_lib.h
 	rm -f $(DESTDIR)$(includedir)/xs.h
 	rm -f $(DESTDIR)$(includedir)/xenstore-compat/xs_lib.h
-- 
Anthony PERARD


