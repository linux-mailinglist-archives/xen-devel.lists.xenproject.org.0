Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C366B9786
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 15:16:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509634.785784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5RU-0006B9-V5; Tue, 14 Mar 2023 14:15:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509634.785784; Tue, 14 Mar 2023 14:15:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5RU-00068F-S5; Tue, 14 Mar 2023 14:15:56 +0000
Received: by outflank-mailman (input) for mailman id 509634;
 Tue, 14 Mar 2023 14:15:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQyL=7G=citrix.com=prvs=430d4338b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pc5RT-0004aK-Dv
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 14:15:55 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b9d06bc2-c272-11ed-b464-930f4c7d94ae;
 Tue, 14 Mar 2023 15:15:53 +0100 (CET)
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
X-Inumbo-ID: b9d06bc2-c272-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678803353;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=D6P/0Ux22KKUfuQOSNSwL3QP/V9gYzj/MuXrDUsbGVw=;
  b=gvDKIhkkxXMXRYel7qDTFTIdzB2+qvovqEysmOdLlQp/lxQcOT44AlZY
   5v2DO1BaI7qz30FSsSaKIv7CpErr3DTlqrXWwGeB96eLllf7J/ienqHeg
   omkYEwUGeW3G5r9XAW6FzBy6gG4j5YddQ2oasYYN8i7SdJweyBSuqyAzI
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 100156184
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:PEw446PozVcs5IzvrR28l8FynXyQoLVcMsEvi/4bfWQNrUoi0jMHy
 WcWD22OOveIMTajeNx1PYi/8EpSuMPQxtBqGwto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvLrRC9H5qyo42tD5wBmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0r1eQnBor
 cMpExJXVhClus+Qx4K8S9A506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLoXmuuyi2a5WDpfsF+P/oI84nTJzRw327/oWDbQUoXSHZwIwB/I+
 goq+UzoPhAYbs2iwACD1S6dibbs2nr7XLodQejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasoRo0S9dWVeog52mlz6PO5g+DC2ssTzhfaccnvss7WTwr0
 FCSm9rjQzdotdWopWm1r+nO62noYG5McDFEPHVfJecY3zX9iNoazQPpFulSK4zvtt3TJBzWx
 ACNrRFr0t3/kvU3/6m8+FnGhRelqZ7IUhM5623rY4610u9qTNX7PtL1sDA3+d4Fdd/EFQfZ4
 BDojuDEtIgz4YexeDthqQnnNJWg/L67PTLVmjaD9LFxpm32qxZPkW29iQySxXuF0O5eJFcFg
 2eJ42u9AaO/21P7BZKbm6rrV6wXIVHITLwJrMz8YNtUeYRWfwSa5ixobkP49zmzzxhzyvtgY
 83GKJ/E4ZMm5UNPnVKLqxo1i+d3lkjSO0uKLXwE8/hX+eXHPyPEIVv0GFCPcvo4/Mu5nekhy
 P4Gb5Hi40wGAIXDjtz/rdZ7waYicSJqWvgbaqV/Koa+H+aRMDpxU66Ike5/JtwNcmY8vr6gw
 0xRk3RwkDLX7UAr4y3QMxiPtJuHsU5DkE8G
IronPort-HdrOrdr: A9a23:rBQX065y1YW9Mg6raAPXwPDXdLJyesId70hD6qhwISY6TiX+rb
 HWoB17726TtN9/YhEdcLy7VJVoBEmskKKdgrNhWotKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QC5SWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.98,260,1673931600"; 
   d="scan'208";a="100156184"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>,
	=?UTF-8?q?Marek=20Marczykowski-G=C3=B3recki?=
	<marmarek@invisiblethingslab.com>, Bernhard Kaindl
	<bernhard.kaindl@citrix.com>
Subject: [PATCH 4/7] tools/pygrub: Factor out common setup.py parts
Date: Tue, 14 Mar 2023 14:15:17 +0000
Message-ID: <20230314141520.3652451-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230314141520.3652451-1-andrew.cooper3@citrix.com>
References: <20230314141520.3652451-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

... to mirror the tools/python side in c/s 2b8314a3c354.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Wei Liu <wl@xen.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Marek Marczykowski-Górecki <marmarek@invisiblethingslab.com>
CC: Bernhard Kaindl <bernhard.kaindl@citrix.com>
---
 tools/pygrub/Makefile | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/tools/pygrub/Makefile b/tools/pygrub/Makefile
index 37b214621492..29ad0513212f 100644
--- a/tools/pygrub/Makefile
+++ b/tools/pygrub/Makefile
@@ -6,19 +6,20 @@ PY_CFLAGS = $(CFLAGS) $(PY_NOOPT_CFLAGS)
 PY_LDFLAGS = $(SHLIB_LDFLAGS) $(APPEND_LDFLAGS)
 INSTALL_LOG = build/installed_files.txt
 
+setup.py = CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDSHARED="$(CC)" LDFLAGS="$(PY_LDFLAGS)" \
+           $(PYTHON) setup.py
+
 .PHONY: all
 all: build
 .PHONY: build
 build:
-	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDSHARED="$(CC)" LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) setup.py build
+	$(setup.py) build
 
 .PHONY: install
 install: all
 	$(INSTALL_DIR) $(DESTDIR)/$(bindir)
-	CC="$(CC)" CFLAGS="$(PY_CFLAGS)" LDSHARED="$(CC)" \
-		LDFLAGS="$(PY_LDFLAGS)" $(PYTHON) setup.py install \
-		--record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
-		 --root="$(DESTDIR)" --install-scripts=$(LIBEXEC_BIN) --force
+	$(setup.py) install --record $(INSTALL_LOG) $(PYTHON_PREFIX_ARG) \
+		--root="$(DESTDIR)" --install-scripts=$(LIBEXEC_BIN) --force
 	set -e; if [ $(bindir) != $(LIBEXEC_BIN) -a \
 	             "`readlink -f $(DESTDIR)/$(bindir)`" != \
 	             "`readlink -f $(LIBEXEC_BIN)`" ]; then \
-- 
2.30.2


