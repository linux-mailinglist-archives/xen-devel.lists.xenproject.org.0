Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1941F46A267
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 18:08:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239522.415424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHTj-00049b-8I; Mon, 06 Dec 2021 17:08:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239522.415424; Mon, 06 Dec 2021 17:08:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muHTi-00042d-U8; Mon, 06 Dec 2021 17:08:38 +0000
Received: by outflank-mailman (input) for mailman id 239522;
 Mon, 06 Dec 2021 17:08:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+yl1=QX=citrix.com=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1muHQ3-0005ta-1G
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 17:04:51 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9dfbc2af-56b6-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 18:04:49 +0100 (CET)
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
X-Inumbo-ID: 9dfbc2af-56b6-11ec-a5e1-b9374ead2679
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1638810288;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gMyekfXDcNGsX/CAW1bRg9GKSv3KBjGtY1LOz0Cm4h8=;
  b=XZDnVTNGfvU0yHyLfSFnHg3kJhwyBz0/FrVDHR0671U7CSBF0P6F8al1
   SVWXh3Jk9LjDAJ9DqGrWDLwNtQ8QeWgfM43UGXqyL7dqZMCICNtyKAMvH
   NVAPQT8rxJhm8xVTGjniswl9VypA/wCxKdJ0IYHHXyGjFZhhcoAQWm9hC
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: ugtc2Lghlgyvw+rhhLlTfiB9+xuEkNj3nNyDf6h/3r+8Jt0zdMzq0hqm5gt+q9edMT8tzqeOKc
 xKbZo3AteLb6eQae8rcjZhLjOJPJ/v1OvLYRP+vy5kL2eOYuO22FB/y23Kw5YfkSvyCTl8uiJz
 q+Lo55CZaY4uRHDNyy4cCPfAsh05eVPXkDtfVtBuYTWPPwymD4t3M1whOpYsF8E52CVybJJlN1
 keynlX72wBfcdUMStaZF/x659LKdtEjXFgjSszAA+Lm+jAmGHwWR9bTyLz5E/N4UGbnWEPMgIf
 T8z8YN0xqZFzkyvtIlQvJEvt
X-SBRS: 5.1
X-MesageID: 59388058
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:9vOAfK3CqD9bG5ysQPbD5Vd2kn2cJEfYwER7XKvMYLTBsI5bp2APn
 GQWWmyDb/3eYzb0L4ojPdyx/B5XuZaHyoBnTgFrpC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCan8ZqTNMEn970Es5w7Bh2OaEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhoN1j2
 N8X6ZOJeTwyEoOVwsgZSyRFHHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Ej8I/LM7tLcUHt2tp1z3xBvc6W5HTBa7N4Le02R9t15seTa6DN
 6L1bxJmN0XkUxxkeWwqAYkOpMijwUCgUCZh/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 nnP+nn0BlcGNN2VwCeB7lqhgPSKmTL8XsQVDrLQ3v91gnWDy2oLEhoUWFCn5/6jhSaWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8Uz7h2NzazFpR6UHGEeQhZObdUnsIk9QjlC6
 7OSt4q3X3o16uTTEC/DsOfPxd+vBcQLBVAPdz8OF1cK2unYu60d10jjSs5eDaHg27UZBgrM6
 zyNqSE/gZAagsgKy7i38Dj7vt68mnTaZlVrv1uKBwpJ+is8Pdf4PNLwtTA3+N4ZdN7BJmRtq
 kTojCR3AAomKZiW3BKAT+wWdF1Cz6bUaWaM6bKD8nRIythMx5JBVd0JiN2dDB0wWirhRdMPS
 BWJ0e+2zMUMVEZGlYctP+qM5z0ClMAM7+jNWPHOdcZpaZNsbgKB9ywGTRfOhDCyyhlxy/thZ
 sfznSOQ4ZAyU/4PIN2eHbh17FPW7npmmTO7qW7TkXxLLoZylFbKEOxYYTNin8gy7b+eoRW9z
 jqsH5Di9vmra8WnOnO/2ddKdTgidCFnbbir+50/XrPSeWJORTB+Y8I9NJt8IuSJaYwOzbyWl
 px8M2cFoGfCaYrvdV/XNys9Mey3Bv6SbxsTZEQRALph4FB7Ca7H0UvVX8FfkWAP+LMxwPhqY
 eMCfsncUP1DRi6eo2YWbIXnrZwkfxOu3FrcMy2gaTk5XphhWw2WpYO0IlqxrHEDXnitqM8zg
 7y8zQeHE5ANcBtvUZTNY/W1wlLv4XVEwLBuX1HFK8V4cVn39NQ4MDT4i/I6epleKRjKyjaA+
 RyRBBMU+bvEr4MvqYGbjqGYtYa5VeB5GxMCTWXc6L+3Mwjc/3aintAcALrZI2iFWTqtqqu4Z
 OhTw/XtC9E9nQ5H49hmDrJm7aMi/N+z9bVU+RtpQSfQZFOxB7I+fnTfhZtTtrdAz6NysBetX
 h7d4cFTPLiENZ+3EFMVIwZ5PO2P2etNx2vX5PUxZk77+DV27PyMVkALZ0uAjylULb1UNoI5w
 Lh+5J5KulLn0hd6YMybii109niXKi1SWqoqgZgWHYv3h1d50VpFe5HdVnf77Zznhw+g6aX2z
 ut4XJb/uok=
IronPort-HdrOrdr: A9a23:hiF2la1wElSBYvc6naLsFwqjBIokLtp133Aq2lEZdPRUGvb3qy
 nIpoV86faUskdoZJhOo7C90cW7LU80sKQFhLX5Xo3SOzUO2lHYT72KhLGKq1aLdhEWtNQtsZ
 uIG5IOceEYZmIasS+V2maF+q4bsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.87,292,1631592000"; 
   d="scan'208";a="59388058"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@gmail.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [XEN PATCH 56/57] stubdom: build xenstore*-stubdom using new Makefile.common
Date: Mon, 6 Dec 2021 17:02:39 +0000
Message-ID: <20211206170241.13165-57-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211206170241.13165-1-anthony.perard@citrix.com>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Makefile.common have everything needed by stubdom, when used with
xenlibs.mk, so we don't need "Makefile" anymore.

Also, remove DESTDIR for "xenstore" related targets, "xenlibs.mk"
doesn't use DESTDIR so its value doesn't matter.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 stubdom/Makefile | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/stubdom/Makefile b/stubdom/Makefile
index 6b804824ba..1fa075b9ad 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -346,8 +346,7 @@ define do_links
   cd $(dir $@); \
   ln -sf $(dir $<)include/*.h include/; \
   ln -sf $(dir $<)*.[ch] .; \
-  [ -e $(dir $<)Makefile.common ] && ln -sf $(dir $<)Makefile.common . ||:; \
-  ln -sf $(dir $<)Makefile .
+  ln -sf $(dir $<)Makefile.common .
   touch $@
 endef
 
@@ -356,13 +355,11 @@ define BUILD_lib
  libxen$(1): libs-$$(XEN_TARGET_ARCH)/$(1)/libxen$(1).a
  libs-$$(XEN_TARGET_ARCH)/$(1)/libxen$(1).a: $$(LIBDEPS_$(1)) $$(LIBDEP_$(1))
  libs-$$(XEN_TARGET_ARCH)/$(1)/libxen$(1).a: mk-headers-$$(XEN_TARGET_ARCH) $$(NEWLIB_STAMPFILE) .phony
-	CPPFLAGS="$$(TARGET_CPPFLAGS)" CFLAGS="$$(TARGET_CFLAGS)" $$(MAKE) CONFIG_LIBXC_MINIOS=y $$(if $$(wildcard $$(@D)/Makefile.common),-f $(CURDIR)/xenlibs.mk) -C $$(@D) $$(@F)
+	CPPFLAGS="$$(TARGET_CPPFLAGS)" CFLAGS="$$(TARGET_CFLAGS)" $$(MAKE) CONFIG_LIBXC_MINIOS=y -f $(CURDIR)/xenlibs.mk -C $$(@D) $$(@F)
 
  clean-libxen$(1):
 	if [ -e libs-$$(XEN_TARGET_ARCH)/$(1)/Makefile.common ]; then \
 	    $$(MAKE) -f $(CURDIR)/xenlibs.mk -C libs-$$(XEN_TARGET_ARCH)/$(1) clean; \
-	elif [ -e libs-$$(XEN_TARGET_ARCH)/$(1)/Makefile ]; then \
-	    $$(MAKE) -C libs-$$(XEN_TARGET_ARCH)/$(1) clean; \
 	fi
 
  libs-$$(XEN_TARGET_ARCH)/$(1)/stamp: $$(XEN_ROOT)/tools/libs/$(1)/Makefile.common
@@ -494,7 +491,7 @@ xenstore-minios-config.mk: $(CURDIR)/xenstore-minios.cfg
 
 .PHONY: xenstore
 xenstore: $(CROSS_ROOT) xenstore-minios-config.mk
-	CPPFLAGS="$(TARGET_CPPFLAGS) $(shell cat xenstore-minios-config.mk)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= -C $@ xenstored.a CONFIG_STUBDOM=y
+	CPPFLAGS="$(TARGET_CPPFLAGS) $(shell cat xenstore-minios-config.mk)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) -f $(CURDIR)/xenlibs.mk -C $@ xenstored.a CONFIG_STUBDOM=y
 
 #############
 # xenstorepvh
@@ -505,7 +502,7 @@ xenstorepvh-minios-config.mk: $(CURDIR)/xenstorepvh-minios.cfg
 
 .PHONY: xenstorepvh
 xenstorepvh: $(CROSS_ROOT) xenstorepvh-minios-config.mk
-	CPPFLAGS="$(TARGET_CPPFLAGS) $(shell cat xenstorepvh-minios-config.mk)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= -C $@ xenstored.a CONFIG_STUBDOM=y
+	CPPFLAGS="$(TARGET_CPPFLAGS) $(shell cat xenstorepvh-minios-config.mk)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) -f $(CURDIR)/xenlibs.mk -C $@ xenstored.a CONFIG_STUBDOM=y
 
 ########
 # minios
@@ -657,8 +654,8 @@ clean:
 	rm -f *-minios-config.mk
 	rm -fr pkg-config
 	-[ ! -d ioemu ] || $(MAKE) DESTDIR= -C ioemu clean
-	-[ ! -d xenstore ] || $(MAKE) DESTDIR= -C xenstore clean
-	-[ ! -d xenstorepvh ] || $(MAKE) DESTDIR= -C xenstorepvh clean
+	-[ ! -d xenstore ] || $(MAKE) -f $(CURDIR)/xenlibs.mk -C xenstore clean
+	-[ ! -d xenstorepvh ] || $(MAKE) -f $(CURDIR)/xenlibs.mk -C xenstorepvh clean
 
 # clean the cross-compilation result
 .PHONY: crossclean
-- 
Anthony PERARD


