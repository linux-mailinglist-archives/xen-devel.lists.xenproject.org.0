Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A577F20AD
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 23:49:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637328.993081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5D5A-00064H-49; Mon, 20 Nov 2023 22:49:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637328.993081; Mon, 20 Nov 2023 22:49:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5D59-0005yU-Qo; Mon, 20 Nov 2023 22:49:31 +0000
Received: by outflank-mailman (input) for mailman id 637328;
 Mon, 20 Nov 2023 22:49:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Uh/B=HB=citrix.com=prvs=681f0548f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1r5D58-0005pp-0G
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 22:49:30 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d40d0f7-87f7-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 23:49:26 +0100 (CET)
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
X-Inumbo-ID: 0d40d0f7-87f7-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1700520566;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KkoH8o86oD3O0Ak+wVVUBX4N9gH8HsFtd6JZOUHqS1o=;
  b=c09Exnye5lku1hWOJRPzaKZfyY1Tmv9FR37eZjlRO8FgQVezXdQ+6TsH
   0+Od9eQCr93rJex1VUvxmyc9K4Z/7jJe2V4kYf1fK9BPU6pONsUQVqYUi
   0GmladJGPzG9M0Tq1B/WHFTBuEskn4w1tZsWc+Muvpo+kiWdQB44E/YDT
   E=;
X-CSE-ConnectionGUID: LtYo8xJLRvC+jqiF6E23hw==
X-CSE-MsgGUID: 6O6XcPceSZ2koK5f5Nn6tg==
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 127436305
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:3MPTDq+LoP2SHNuUIsiQDrUDX36TJUtcMsCJ2f8bNWPcYEJGY0x3m
 GJLWGuAbPiLN2qgf9wgboTg8U4D75aEm4NhTAJs+yA8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjVAOK6UKidYnwZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ksz1BjOkGlA5AdnPKoT5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDklq6
 c0feCAvSiqdrKG02bOVFMQ23cQ8eZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUWGPEUn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZwPwRrD+
 DmeogwVBDlEE4KvwgKO/0me3OzIvn71BaQUSqG3o6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0QMFMGuc37AWMzKv84AuDAGUACDlbZ7QOttIyRDEs/
 k+EmZXuHzMHmIOSTXWR57KFtwSYMCIeLXIBTSIcRA5D6N7myKk5gwjTVN9lHOiwh8fsBDDr6
 zmQqW41gLB7pcsK3KWy+RbAmSChorDASwJz7QLSNkq/6Ql0fpKiIYah5l7S9/9oJpuWVVSHs
 z4PnM32xOYPBpaJnWqTTfkXHbeoz/yYPybRh1EpFJ4knwlB4Fb6I9oWumsnYh40Y4BbIVcFf
 XM/pyt1+K5UbGuISZVpSMGzEsUEk4W6TtT6A6W8gsV1XnRhSOOW1HgxPRbMjj63yRZErE0pB
 XuMnS+R4Zcm5UdPlmPeqx81i+ND+8zH7Tq7qWrH5xqmy6GCQ3WeVK0INlCDBshgs/vc/V2Iq
 YoGbpTUo/m6bAEYSnOPmWL0BQpSRUXX+Lis85AHHgJ9ClYO9J4d5w/5nup6Jt0Nc1V9nebU5
 HCtMnK0O3Km7UAr3T6iMyg5AJu2BMYXkJ7OFXB0Vbpe8yR5MNnHAWZ2X8dfQITLA8Q6nKItE
 qFcI5rRahmNIxyekwkggVDGhNQKXHyWacimZkJJvBBXk0ZcejH0
IronPort-HdrOrdr: A9a23:rRuryKuMF6MG75yJeqwIG/u67skDTtV00zEX/kB9WHVpmszxra
 6TdZMgpHnJYVcqKQkdcL+7WJVoLUmxyXcx2/h1AV7AZniAhILLFvAA0WKK+VSJcEeSygce79
 YFT0EXMqyIMbEQt6fHCWeDfOrIuOP3kpyVuQ==
X-Talos-CUID: 9a23:gxaWTW7h4b5VFXWyf9ss0FIlHZA1UFnn0lyTIVa5JzhEEuaVVgrF
X-Talos-MUID: 9a23:Nr5UswmcUORqbrt/l8Sfdno8E5lY6JylBXs/y5YBmJSKaAp2ZSuS2WE=
X-IronPort-AV: E=Sophos;i="6.04,214,1695700800"; 
   d="scan'208";a="127436305"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Roberto Bagnara
	<roberto.bagnara@bugseng.com>, Nicola Vetrini <nicola.vetrini@bugseng.com>
Subject: [PATCH 4/6] arm/duart: make dt_uart_init() compile with -Wwrite-strings
Date: Mon, 20 Nov 2023 22:49:10 +0000
Message-ID: <20231120224912.1421916-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231120224912.1421916-1-andrew.cooper3@citrix.com>
References: <20231120224912.1421916-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

GCC complains:

  drivers/char/arm-uart.c: In function 'dt_uart_init':
  drivers/char/arm-uart.c:81:17: error: assignment discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
     81 |         options = "";
        |                 ^

The problem is using the options string for both splitting opt_duart, and to
hold a token "" for no options.

Use two variables; one mutable one one const.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Michal Orzel <michal.orzel@amd.com>
CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/drivers/char/arm-uart.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/char/arm-uart.c b/xen/drivers/char/arm-uart.c
index 8098a968c285..91f13a41368d 100644
--- a/xen/drivers/char/arm-uart.c
+++ b/xen/drivers/char/arm-uart.c
@@ -42,7 +42,8 @@ static void __init dt_uart_init(void)
     struct dt_device_node *dev;
     int ret;
     const char *devpath = opt_dtuart;
-    char *options;
+    const char *options;
+    char *split;
 
     if ( !console_has("dtuart") )
         return; /* Not for us */
@@ -74,9 +75,12 @@ static void __init dt_uart_init(void)
         return;
     }
 
-    options = strchr(opt_dtuart, ':');
-    if ( options != NULL )
-        *(options++) = '\0';
+    split = strchr(opt_dtuart, ':');
+    if ( split )
+    {
+        split[0] = '\0';
+        options = split + 1;
+    }
     else
         options = "";
 
-- 
2.30.2


