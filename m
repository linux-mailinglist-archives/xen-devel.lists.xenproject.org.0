Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD8972867B
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jun 2023 19:41:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.545400.851805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7Jcc-0006ml-HY; Thu, 08 Jun 2023 17:40:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 545400.851805; Thu, 08 Jun 2023 17:40:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q7Jcc-0006lC-Eh; Thu, 08 Jun 2023 17:40:30 +0000
Received: by outflank-mailman (input) for mailman id 545400;
 Thu, 08 Jun 2023 17:40:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ydti=B4=citrix.com=prvs=5162bf623=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q7Jca-0006l6-D8
 for xen-devel@lists.xenproject.org; Thu, 08 Jun 2023 17:40:28 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8bdf1db7-0623-11ee-b232-6b7b168915f2;
 Thu, 08 Jun 2023 19:40:25 +0200 (CEST)
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
X-Inumbo-ID: 8bdf1db7-0623-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1686246025;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wfkq+LBBsnzmQtNZri50TTkQkuzfMTjeadDBsGMpKlA=;
  b=dxWwbdMdEZaSyqCblWgkarzM9BsBpeYJqzMi7v88tptJX3+ot09TSpSX
   bCqrK18zfVIRoDgbjHY+Sfc7Liz+l94Ae1V7cEa1yw87xdT5tlZOmLZ1q
   4ZPTKJkvpgs1e3lWbDw+Q/9DyGQTsHn+9tifZAFyyisWAQu0W9RYE3mu8
   0=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 112119566
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:2B2sd6MunL5hV23vrR27l8FynXyQoLVcMsEvi/4bfWQNrUog0jUBn
 GdNXGrTaf6PZTb3L9F+a4ri9hsA78SHzNA2Ggto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/rrRC9H5qyo42tG5gxmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0sJ7UGBz/
 8YXEzQqUAq5hMKE0Yy2ePY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLoXmuuyi2a5WDpfsF+P/oI84nTJzRw327/oWDbQUoXTH5wMzxvG+
 Aoq+UypDR0lOIzOkAOi9yu8rNDjvzPgSJAdQejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasvBEGXMFLO/Yn8wzLwa3Riy6dG2MNCDBIbtcrsMsrbTUw0
 xmCmNaBONB0mOTLEzTHrO7S9G7sf3FPdgfueBPoUyMh74jinYsJgSnLaeh5Kq2VvMzLFAPvl
 mXiQDcFu50fissC1qOe9F/Bgi6xqpWhcjPZ9jk7TUr+sFonOdfNi5iArAGCsK0edNrxokyp5
 iBspiSI0AwZ4XhhfgSpSf5FIrym7u3t3Nb00Q82RMlJG9hAFheekWFsDNNWfh8B3iUsI2WBj
 KrvVeR5uvdu0IOCN/MfXm5II51CIVLcPdrkTOvISdFFf4J8cgSKlAk3Ox7Ohj63wBN2zvFmU
 Xt+TSpLJSxDYZmLMRLsH7tNuVPV7n5WKZzvqWDTkE38jOv2iI+9QrYZKlqeBt3VH4vdyDg5B
 +13bpPQoz0GCb2WX8Ui2dJLRbz8BSRhVM+eRg0+XrLrHzeK70l/U6GLm+lwJtANcmY8vr6gw
 0xRk3RwkDLX7UAr4y3QApy/QNsDhapCkE8=
IronPort-HdrOrdr: A9a23:R2EyEKloR/XVvQYy73gSG3kaIfTpDfIN3DAbv31ZSRFFG/FwWf
 re5cjztCWE8Ar5PUtLpTnuAtjkfZqxz+8X3WBzB9eftWvdyQ+VxehZhOOIogEIcBeOkdK1u5
 0QFZSWy+edMbG5t6vHCcWDfOrICePozImYwd3C1HtkT0VRZ7l94wByBkK3GlB/LTM2Z6YEKA
 ==
X-Talos-CUID: =?us-ascii?q?9a23=3AYh2pTGhl+5W/hJ5vF1h8pYXGfDJuVnGMzUraGUC?=
 =?us-ascii?q?DDUFXUoeWaW2Bxq5WjJ87?=
X-Talos-MUID: 9a23:fRDXcAXoUvzMcz7q/G/jiA5uZJYx2oOrUVAnrrkkq9KUJyMlbg==
X-IronPort-AV: E=Sophos;i="6.00,227,1681185600"; 
   d="scan'208";a="112119566"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Luca Fancellu
	<luca.fancellu@arm.com>
Subject: [PATCH] tools: Move MASK_INSR to common-macros.h
Date: Thu, 8 Jun 2023 18:40:14 +0100
Message-ID: <20230608174014.2500954-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

MASK_EXTR() and MASK_INSR() are a matching pair.  Keep them together.

Fixes: 56a7aaa16bfe ("tools: add physinfo arch_capabilities handling for Arm")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Anthony PERARD <anthony.perard@citrix.com>
CC: Juergen Gross <jgross@suse.com>
CC: Luca Fancellu <luca.fancellu@arm.com>
---
 tools/include/xen-tools/common-macros.h | 1 +
 tools/libs/light/libxl_internal.h       | 2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/include/xen-tools/common-macros.h b/tools/include/xen-tools/common-macros.h
index d53b88182560..168691be0e93 100644
--- a/tools/include/xen-tools/common-macros.h
+++ b/tools/include/xen-tools/common-macros.h
@@ -73,6 +73,7 @@
 #endif
 
 #define MASK_EXTR(v, m) (((v) & (m)) / ((m) & -(m)))
+#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
 
 #ifndef __must_check
 #define __must_check __attribute__((__warn_unused_result__))
diff --git a/tools/libs/light/libxl_internal.h b/tools/libs/light/libxl_internal.h
index 8aba3e138909..61f4fe1dec55 100644
--- a/tools/libs/light/libxl_internal.h
+++ b/tools/libs/light/libxl_internal.h
@@ -132,8 +132,6 @@
 
 #define DIV_ROUNDUP(n, d) (((n) + (d) - 1) / (d))
 
-#define MASK_INSR(v, m) (((v) * ((m) & -(m))) & (m))
-
 #define LIBXL__LOGGING_ENABLED
 
 #ifdef LIBXL__LOGGING_ENABLED
-- 
2.30.2


