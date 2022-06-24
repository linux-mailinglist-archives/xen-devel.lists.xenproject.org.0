Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCC4559E30
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 18:08:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355646.583521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lqx-0006Kg-OQ; Fri, 24 Jun 2022 16:08:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355646.583521; Fri, 24 Jun 2022 16:08:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4lqx-0006Jh-ER; Fri, 24 Jun 2022 16:08:15 +0000
Received: by outflank-mailman (input) for mailman id 355646;
 Fri, 24 Jun 2022 16:08:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7mLY=W7=citrix.com=prvs=16756bcf7=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1o4lnl-0004qb-SO
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 16:04:57 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6362446f-f3d7-11ec-bd2d-47488cf2e6aa;
 Fri, 24 Jun 2022 18:04:56 +0200 (CEST)
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
X-Inumbo-ID: 6362446f-f3d7-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656086696;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UgBJmLW71oTGL7rE/nyRfmo9v19OgU/6PqXrnkS62aw=;
  b=FnlATABxyLu0/K1Qn4PuBXCjH5Ted+500K5KXo1FJWvvRD8uNviOHaeb
   mMsF1VxRoM1yqpnXMeIVAv+bPk3R+LyCTwy0Pq87JP7FlPJFfZipC6iAM
   vsFv0oD/+DYVj2YcNbHsposWmQNr+eNk4FX3RV8BSTx1H6rw1rk5NhuKa
   s=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 76935332
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:q8tK2K2q6N2S/JHIoPbD5ddxkn2cJEfYwER7XKvMYLTBsI5bpzYGn
 DAeDW3Ua/6JZ2Wged4iO4W/o0IO65HQzdVhGQc6pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkjk7xdOCn9xGQ7InQLlbGILes1htZGEk1Ek/NtTo5w7Rj2tAy3YDja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1AhbivRTcsGpb2p+gjCUF5DzAjbJJJreqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHiOp8fvXdxiynUF/88TbjIQrnQ5M8e1zA17ixLNamAN
 pFEMmE1BPjGSwQXN20JLLc+oPeXrULcfCN0hF6Ip6VitgA/yyQuieOwYbI5YOeiSd1Om0eEp
 krP52njHgwBL9ub1CaE9XS3wOTImEvTR4Y6BLC+sPlwjzW71mEVTREbS1a/if24kVKlHcJSL
 VQO/SgjprR081akJvHxUBG1r2SNlgINUNpXVesh4UeCzbS83uqCLjFaFHgbMoVg7ZJoA2xxv
 rOUoz/3LTFflKKZeXe5zY2roQ3oYQkJPDJTWiBRGGPp/OLfTJEPYgPnF4g+Tvbu04WqSVkc0
 BjR8nFg2ux7YdojkvzioAuZ22/ESo3hFFZd2+nBYo6yAuqVjqaBbpfg11XU5O0owG2xHgjY5
 yhsdyRzAYkz4XCxeM+lGrxl8EmBvartDdElqQcH82Md3zqs4WW/Wotb/StzIkxkWu5dJ2K3O
 BeC4FwNvMcMVJdPUUORS9jpYyjN5fiIKDgYfqqMMoomjmZZLmdrAx2ClWbPhjuwwSDAYIk0O
 IuBcNbEMEv2/Z9PlWLsL89EiOdD7nlnmQv7GMCqpzz6gOH2TCPEFt843K6mM7lRAFWs+16Or
 b6y9qKiln1ibQEJSnOGr9dNcQ9bdiZT6FKfg5U/S9Nv6zFOQAkJY8I9C5t+E2C5t8y5Ttv1w
 0w=
IronPort-HdrOrdr: A9a23:4N5mOqjyY5S2aKl1zz0ybWr4EHBQXtwji2hC6mlwRA09TySZ//
 rAoB19726StN9xYgBYpTnuAsi9qB/nmKKdpLNhX4tKPzOW3FdATrsD0WKK+VSJcEfDH6xmpM
 JdmsBFebvN5DNB4/oSjjPVLz9Z+qjlzJyV
X-IronPort-AV: E=Sophos;i="5.92,218,1650945600"; 
   d="scan'208";a="76935332"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Daniel De Graaf
	<dgdegra@tycho.nsa.gov>, "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH v3 14/25] tools/flask/utils: list build targets in $(TARGETS)
Date: Fri, 24 Jun 2022 17:04:11 +0100
Message-ID: <20220624160422.53457-15-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220624160422.53457-1-anthony.perard@citrix.com>
References: <20220624160422.53457-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/flask/utils/Makefile | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/flask/utils/Makefile b/tools/flask/utils/Makefile
index db567b13dc..6be134142a 100644
--- a/tools/flask/utils/Makefile
+++ b/tools/flask/utils/Makefile
@@ -4,10 +4,10 @@ include $(XEN_ROOT)/tools/Rules.mk
 CFLAGS += -Werror
 CFLAGS += $(CFLAGS_libxenctrl)
 
-CLIENTS := flask-loadpolicy flask-setenforce flask-getenforce flask-label-pci flask-get-bool flask-set-bool
+TARGETS := flask-loadpolicy flask-setenforce flask-getenforce flask-label-pci flask-get-bool flask-set-bool
 
 .PHONY: all
-all: $(CLIENTS)
+all: $(TARGETS)
 
 flask-loadpolicy: loadpolicy.o
 	$(CC) $(LDFLAGS) $< $(LDLIBS) $(LDLIBS_libxenctrl) -o $@
@@ -29,7 +29,7 @@ flask-set-bool: set-bool.o
 
 .PHONY: clean
 clean:
-	$(RM) *.o $(CLIENTS) $(DEPS_RM)
+	$(RM) *.o $(TARGETS) $(DEPS_RM)
 
 .PHONY: distclean
 distclean: clean
@@ -37,10 +37,10 @@ distclean: clean
 .PHONY: install
 install: all
 	$(INSTALL_DIR) $(DESTDIR)$(sbindir)
-	$(INSTALL_PROG) $(CLIENTS) $(DESTDIR)$(sbindir)
+	$(INSTALL_PROG) $(TARGETS) $(DESTDIR)$(sbindir)
 
 .PHONY: uninstall
 uninstall:
-	rm -f $(addprefix $(DESTDIR)$(sbindir)/, $(CLIENTS))
+	rm -f $(addprefix $(DESTDIR)$(sbindir)/, $(TARGETS))
 
 -include $(DEPS_INCLUDE)
-- 
Anthony PERARD


