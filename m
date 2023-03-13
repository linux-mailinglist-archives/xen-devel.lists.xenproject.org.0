Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E61076B75D3
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 12:20:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509234.784609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbgE0-0001sy-ON; Mon, 13 Mar 2023 11:20:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509234.784609; Mon, 13 Mar 2023 11:20:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbgE0-0001qY-Lc; Mon, 13 Mar 2023 11:20:20 +0000
Received: by outflank-mailman (input) for mailman id 509234;
 Mon, 13 Mar 2023 11:20:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=koCJ=7F=citrix.com=prvs=42903c55b=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pbgDz-0001qR-Ee
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 11:20:19 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab8446dc-c18f-11ed-b43a-930f4c7d94ae;
 Mon, 13 Mar 2023 12:10:40 +0100 (CET)
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
X-Inumbo-ID: ab8446dc-c18f-11ed-b43a-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1678706410;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=67OWnwS34MgfQt83HCGPgJaLKWxRyvppj6BXjQn6ki8=;
  b=KlNKrdZ5ePXJsxLE3AHWcQDzi0Csv2cUubdR3FTNpqmPY+RTZEbZLGU9
   fJCi5FdBjEN/vLeAkoUHLnvSYVZ4wYZFflceVuD5kxkRrNC5g6TEtw1TO
   7Uy+iq/idi2fnIJxpJ0/jpnZgHZ+EfvjuohYVxaFlzXRWt0N7fvYgQDy/
   U=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 100592826
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:jQWqGqPQqfQZRS/vrR2ul8FynXyQoLVcMsEvi/4bfWQNrUon3jwPz
 GAYDTjQafqKYGf2L4twaIuz9xhX6J6Az9I3GQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvLrRC9H5qyo42tD5wdmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0t5OLEF35
 cwbEgwudx+cuu+J65yabuY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLoXmuuyi2a5WDpfsF+P/oI84nTJzRw327/oWDbQUoXSHZgExBbC+
 Aoq+UzlHxU1DfXCxgGf91C0jfXghy7aQYM7QejQGvlC3wTImz175ActfUu2p7y1h1CzX/pbK
 lcI4Ww+oK4q7kupQ9LhGRqirxasvBQRRt5RGO0S8xyWx+zf5APxLncAZi5MbpohrsBeeNAx/
 gbXxZWzX2Up6eDLDyvHrd94sA9eJwAtFEIiXD80TjE5wMDsv7w+sTnhb/JsRfvdYsLOJRn8x
 DWDrS4bjroVjNIW26jTwW0rkw5AtbCSEFdru1y/snaNq1ogOdX7P9DABU3zt64oEWqPcrWWU
 JHoceC65ftGM5yCnTflrA4lTODwvKbt3NExbDdS83gdG9aFoSHLkWN4umsWyKJV3iEsKFfUj
 Lf741852XOqFCLCgVVLS4ywEd826qPrCM7oUPvZBvIXPMchKlPZpX8+PxbPt4wIrKTLuftjU
 ap3jO72VSpKYUiZ5GPeqxghPU8DmXllmDK7qWHTxBW7y7uODEOopUM+GALWNIgRtfrUyDg5B
 v4Db6NmPT0DCryhCsQWmKZPRW03wY8TXMCr9JMMKb7dfGKL2ggJUpfs/F/oQKQ994w9qwsC1
 ijVtpNwoLYnuUD6FA==
IronPort-HdrOrdr: A9a23:MTEUL6mnLIjdqYgOKQsw6zh7qh7pDfL73DAbv31ZSRFFG/FwWf
 re+8jz8SWE9Qr5OUtQ4+xoXZPuL080mqQFg7X5UY3SOTUO/VHYUL2KrrGSswEIeBeOjdK1t5
 0QCpSWU+eAfGSS5PySiGLTfrpAoKjlzEnrv5an854Hd3ANV0gP1XYcNi+rVml/RAxHApR8MZ
 qH+6N81kmdkGwsH7qG72c+Lpf+m+E=
X-IronPort-AV: E=Sophos;i="5.98,256,1673931600"; 
   d="scan'208";a="100592826"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2 2/2] x86/spec-ctrl: Enumerations for DDP controls
Date: Mon, 13 Mar 2023 11:19:46 +0000
Message-ID: <20230313111946.1436477-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230310160238.1321765-3-andrew.cooper3@citrix.com>
References: <20230310160238.1321765-3-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

https://www.intel.com/content/www/us/en/developer/articles/technical/software-security-guidance/technical-documentation/data-dependent-prefetcher.html

We should offer DDP-CTRL to guests, but I'm not sure when it is appearing in
hardware, and it's not massively urgent - the DDP behaviour is mostly sane
(having been designed in a post-spectre world) and this is a just-in-case
control.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Use DDP_DIS_U for consistency with the other bit names.
 * Fix ordering/typos, expand commit message.
---
 tools/libs/light/libxl_cpuid.c              | 1 +
 tools/misc/xen-cpuid.c                      | 2 +-
 xen/arch/x86/include/asm/msr-index.h        | 1 +
 xen/include/public/arch-x86/cpufeatureset.h | 1 +
 4 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index 1d4e8a6b0067..968635981086 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -242,6 +242,7 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
         {"intel-psfd",   0x00000007,  2, CPUID_REG_EDX,  0,  1},
         {"ipred-ctrl",   0x00000007,  2, CPUID_REG_EDX,  1,  1},
         {"rrsba-ctrl",   0x00000007,  2, CPUID_REG_EDX,  2,  1},
+        {"ddp-ctrl",     0x00000007,  2, CPUID_REG_EDX,  3,  1},
         {"bhi-ctrl",     0x00000007,  2, CPUID_REG_EDX,  4,  1},
         {"mcdt-no",      0x00000007,  2, CPUID_REG_EDX,  5,  1},
 
diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 4f4261f4aa95..868054ab96a6 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -216,7 +216,7 @@ static const char *const str_7d1[32] =
 static const char *const str_7d2[32] =
 {
     [ 0] = "intel-psfd",    [ 1] = "ipred-ctrl",
-    [ 2] = "rrsba-ctrl",
+    [ 2] = "rrsba-ctrl",    [ 3] = "ddp-ctrl",
     [ 4] = "bhi-ctrl",      [ 5] = "mcdt-no",
 };
 
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 7615d8087f46..fa771ed0b50f 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -41,6 +41,7 @@
 #define  SPEC_CTRL_RRSBA_DIS_U              (_AC(1, ULL) <<  5)
 #define  SPEC_CTRL_RRSBA_DIS_S              (_AC(1, ULL) <<  6)
 #define  SPEC_CTRL_PSFD                     (_AC(1, ULL) <<  7)
+#define  SPEC_CTRL_DDP_DIS_U                (_AC(1, ULL) <<  8)
 #define  SPEC_CTRL_BHI_DIS_S                (_AC(1, ULL) << 10)
 
 #define MSR_PRED_CMD                        0x00000049
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 336744b47119..08885190876a 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -294,6 +294,7 @@ XEN_CPUFEATURE(INTEL_PPIN,         12*32+ 0) /*   Protected Processor Inventory
 XEN_CPUFEATURE(INTEL_PSFD,         13*32+ 0) /*A  MSR_SPEC_CTRL.PSFD */
 XEN_CPUFEATURE(IPRED_CTRL,         13*32+ 1) /*   MSR_SPEC_CTRL.IPRED_DIS_* */
 XEN_CPUFEATURE(RRSBA_CTRL,         13*32+ 2) /*   MSR_SPEC_CTRL.RRSBA_DIS_* */
+XEN_CPUFEATURE(DDP_CTRL,           13*32+ 3) /*   MSR_SPEC_CTRL.DDP_DIS_U */
 XEN_CPUFEATURE(BHI_CTRL,           13*32+ 4) /*   MSR_SPEC_CTRL.BHI_DIS_S */
 XEN_CPUFEATURE(MCDT_NO,            13*32+ 5) /*A  MCDT_NO */
 
-- 
2.30.2


