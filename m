Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE321F1E37
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 19:16:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiLNi-000609-Cn; Mon, 08 Jun 2020 17:16:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UmkZ=7V=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jiLNh-000603-II
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 17:16:17 +0000
X-Inumbo-ID: c2423e6c-a9ab-11ea-b29c-12813bfff9fa
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c2423e6c-a9ab-11ea-b29c-12813bfff9fa;
 Mon, 08 Jun 2020 17:16:15 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: DUjRROethOUfUUaLFxYbhoWQr5QhWOnF6kthTxsMOef7AYgEgTbtHAthcUePuDyo0cWtsQ1GVX
 7Jpb+fDG/YGSK829BhrRtgm6rdQv/IJNlEKqdX6AdvaRmntP5n5V652uJ8fKfWOcE24kyTh3R6
 G+5p02vAcFAoy8sze7Td0KwYgT3aR6Grlq7dPcZM7+rc+FPbna9PqiPAkHMqdPms75Y8xZ3ML9
 7MzKz6GdcZMrD5FWBW5GpQ3JsOI5seeYWPjW5gAYGRdynGNvG+iuFR1YjsHBKf8kEq4R8P2+Y6
 /Ac=
X-SBRS: 2.7
X-MesageID: 19519212
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,487,1583211600"; d="scan'208";a="19519212"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14] docs: Minor build improvements
Date: Mon, 8 Jun 2020 18:15:56 +0100
Message-ID: <20200608171556.27847-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan
 Beulich <JBeulich@suse.com>, Ian Jackson <ian.jackson@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Don't use "set -x" for the figs rule.  It doesn't take effect in the recursive
make environment.

Turn the HTML manpage comments into makefile comments, not shell comments.
This saves 3x shell invocations per manpage.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@eu.citrix.com>
CC: Ian Jackson <ian.jackson@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>

For 4.14.  Trivial, and docs related.
---
 docs/Makefile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/docs/Makefile b/docs/Makefile
index 3eae2dae60..8de1efb6f5 100644
--- a/docs/Makefile
+++ b/docs/Makefile
@@ -58,7 +58,7 @@ txt: $(DOC_TXT)
 .PHONY: figs
 figs:
 ifneq ($(FIG2DEV),)
-	set -x; $(MAKE) -C figs
+	$(MAKE) -C figs
 else
 	@echo "fig2dev (transfig) not installed; skipping figs."
 endif
@@ -105,12 +105,12 @@ else
 endif
 
 # HTML manpages
+# sed used to fix up links between man-pages
+# 1) L<xl(1)> -> L<xl(1)|relative:xl.1.html>
+# 2) <a href="relative:xl.1.html"> -> <a href="xl.1.html">
 html/man/%.$(1).html: man/%.$(1).pod Makefile
 ifneq ($(POD2HTML),)
 	@$(INSTALL_DIR) $$(@D)
-	# Fix up links between man-pages
-	# 1) L<xl(1)> -> L<xl(1)|relative:xl.1.html>
-	# 2) <a href="relative:xl.1.html"> -> <a href="xl.1.html">
 	sed -r -e 's%L<([^>]+)\(([1-9])\)>%L<\1(\2)|relative:\1.\2.html>%g' $$< | \
 		$(POD2HTML) | \
 		sed -r -e 's%( href=")relative:%\1%g' > $$@
-- 
2.11.0


