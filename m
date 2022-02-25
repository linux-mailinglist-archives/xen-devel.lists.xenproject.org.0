Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3A04C488D
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 16:17:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.279304.477065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcL0-0003sX-DI; Fri, 25 Feb 2022 15:16:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 279304.477065; Fri, 25 Feb 2022 15:16:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNcKz-0003er-JK; Fri, 25 Feb 2022 15:16:53 +0000
Received: by outflank-mailman (input) for mailman id 279304;
 Fri, 25 Feb 2022 15:16:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E0Ll=TI=citrix.com=prvs=04808661d=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1nNcI9-0007Bf-TA
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 15:13:58 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8cf1125a-964d-11ec-8eb9-a37418f5ba1a;
 Fri, 25 Feb 2022 16:13:56 +0100 (CET)
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
X-Inumbo-ID: 8cf1125a-964d-11ec-8eb9-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1645802036;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DRUZBzwipLHVi3LrT/VXUcevANDycChtXk37Vv5NYiY=;
  b=N1/SCWTsIS83qYO6zuT4boiHmdXlCLJ4oqRlBFDVj8gCQqHqNf3OHkss
   6F6f//40Xiwsqek4hQC1plEPJ4/h7KCPxHOuq+hEJN/qI8lcyHckQTS2Q
   hfqS9i5x2pPswd9mxspzmRcaolCiwt5T4XjU8tiPND4ENfOkgsZhKlRRp
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 64890255
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:gHA4S6NzNahL3zPvrR3Ol8FynXyQoLVcMsEvi/4bfWQNrUp20jJSn
 WsbUTiGO6mIMGP3KttzPY609kIEvJPUm4UxGQto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZj2NMw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zw
 fZNnIC3WVYSF4r8setMbBZkTS9RMvgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALJc/3PIQZqzd4wCvQF/oOSpHfWaTao9Rf2V/cg+gQQaaPP
 5BENFKDajz9PSNkeWUbKa4Fu7+qqCTWKWMFpV6a8P9fD2/7k1UqjemF3MDuUsOObdVYmACfv
 G2u13T0BFQWOcKSzRKB82mwnanfkCXjQoUQGbaksPlwjzWuKnc7UUNMEwHh+L/g1xD4C4k3x
 1EoFjQGpIsy3VCsXojGdjqIiXHVgREgBdR/HLhvgO2S8Zb87wGcD2kCazdObt06qcM7LQAXO
 k+1c8DBXmI27uDMIZ6J3vLN9G7pZ3BJRYMXTXJcFWM4D8/fTJbfZ/4lZvJqC+aLg9L8AlkcK
 Bja/XFl193/YSPmvphXHGwrYRrw9/AlrSZvv207u15JCCsjNeZJgKTytDDmAQ5odtrxc7V4l
 CFsdzKixO4PF4qRsyeGXf8AGrqkj97cbmGB3gI2Q8R5r2z1k5JGQWy2yGsvTKuOGpxZEQIFn
 WeJ4V8BjHOtFCHCgVBLj3KZVJ1xkPmI+SXNXfHIdNteCqWdhyfclByCkXW4hji3+GB1yPlXE
 c7CLa6EUCZLYYw6nWHeb7pMjtcWKtUWmDq7qWbTlE/8j9JzpRe9FN84Dbd5RrthvfPc/V6Mq
 I432gnj40w3bdASqxL/qeY7RW3m51BibXwqg6S7rtK+Hzc=
IronPort-HdrOrdr: A9a23:+qM2u6BQamjKN2TlHemU55DYdb4zR+YMi2TC1yhKJyC9Ffbo8f
 xG/c5rrSMc5wxwZJhNo7y90ey7MBbhHP1OkO4s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpN
 5dmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.90,136,1643691600"; 
   d="scan'208";a="64890255"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v2 13/29] tools/xentrace: rework Makefile
Date: Fri, 25 Feb 2022 15:13:05 +0000
Message-ID: <20220225151321.44126-14-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225151321.44126-1-anthony.perard@citrix.com>
References: <20220225151321.44126-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Remove "build" targets.

Use "$(TARGETS)" to list binary to be built.

Cleanup "clean" rule.

Also drop conditional install of $(BIN) and $(LIBBIN) as those two
variables are now always populated.

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---

Notes:
    v2:
    - fix typo in title
    - drop conditional install of $(BIN) and $(LIBBIN)

 tools/xentrace/Makefile | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/tools/xentrace/Makefile b/tools/xentrace/Makefile
index 9fb7fc96e7..0995fa9203 100644
--- a/tools/xentrace/Makefile
+++ b/tools/xentrace/Makefile
@@ -14,36 +14,31 @@ SBIN     = xentrace xentrace_setsize
 LIBBIN   = xenctx
 SCRIPTS  = xentrace_format
 
-.PHONY: all
-all: build
+TARGETS := $(BIN) $(SBIN) $(LIBBIN)
 
-.PHONY: build
-build: $(BIN) $(SBIN) $(LIBBIN)
+.PHONY: all
+all: $(TARGETS)
 
 .PHONY: install
-install: build
+install: all
 	$(INSTALL_DIR) $(DESTDIR)$(bindir)
 	$(INSTALL_DIR) $(DESTDIR)$(sbindir)
-	[ -z "$(LIBBIN)" ] || $(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
-ifneq ($(BIN),)
+	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
 	$(INSTALL_PROG) $(BIN) $(DESTDIR)$(bindir)
-endif
 	$(INSTALL_PROG) $(SBIN) $(DESTDIR)$(sbindir)
 	$(INSTALL_PYTHON_PROG) $(SCRIPTS) $(DESTDIR)$(bindir)
-	[ -z "$(LIBBIN)" ] || $(INSTALL_PROG) $(LIBBIN) $(DESTDIR)$(LIBEXEC_BIN)
+	$(INSTALL_PROG) $(LIBBIN) $(DESTDIR)$(LIBEXEC_BIN)
 
 .PHONY: uninstall
 uninstall:
 	rm -f $(addprefix $(DESTDIR)$(LIBEXEC_BIN)/, $(LIBBIN))
 	rm -f $(addprefix $(DESTDIR)$(bindir)/, $(SCRIPTS))
 	rm -f $(addprefix $(DESTDIR)$(sbindir)/, $(SBIN))
-ifneq ($(BIN),)
 	rm -f $(addprefix $(DESTDIR)$(bindir)/, $(BIN))
-endif
 
 .PHONY: clean
 clean:
-	$(RM) *.a *.so *.o *.rpm $(BIN) $(SBIN) $(LIBBIN) $(DEPS_RM)
+	$(RM) *.o $(TARGETS) $(DEPS_RM)
 
 .PHONY: distclean
 distclean: clean
-- 
Anthony PERARD


