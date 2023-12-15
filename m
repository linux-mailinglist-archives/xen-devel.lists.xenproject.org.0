Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CFD814F8A
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 19:15:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655294.1023014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rECi7-00047O-Fd; Fri, 15 Dec 2023 18:14:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655294.1023014; Fri, 15 Dec 2023 18:14:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rECi7-00042g-A7; Fri, 15 Dec 2023 18:14:55 +0000
Received: by outflank-mailman (input) for mailman id 655294;
 Fri, 15 Dec 2023 18:14:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xt8Y=H2=citrix.com=prvs=706e6129d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1rECi5-0003yp-Mf
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 18:14:53 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d6c21cca-9b75-11ee-9b0f-b553b5be7939;
 Fri, 15 Dec 2023 19:14:51 +0100 (CET)
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
X-Inumbo-ID: d6c21cca-9b75-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1702664091;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OnqPq6Hc/S5oBn22Ow8iaK4FcBK3XvOA2+OarJseW4c=;
  b=Q2+AZNxwViMxBsHM1rw5PxGnafEyCjndkQnigrCykWF8fTrX3Fsr7M+G
   jPSRXEy6JIcrnmE7tBkM3oRhonYJset4S2yqXylZcXu6gNjcr7zrr7aGh
   X7PWmhXPlKINsFdzE+vXPzPv4K0ZphQukre9Or2cakm7h0qig48BV/MMt
   Q=;
X-CSE-ConnectionGUID: 7ftEl9BGRgycC6H1/bDEmw==
X-CSE-MsgGUID: A2VzZa1FSpGJWEghRx/ITw==
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 131604187
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:NMkela+MS5SbEYxSjbWlDrUDiH6TJUtcMsCJ2f8bNWPcYEJGY0x3z
 mAcCzqPMqqMZDP1LdgibYqy/R8E68DQnIdqSwJsrSo8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjVAOK6UKidYnwZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ird7ksz1BjOkGlA5AdnP6kW5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkR+
 +A1LGEnQSqMlumdnpLiDeNAq8E8eZyD0IM34hmMzBncBPciB5vCX7/L9ZlT2zJYasJmRKiEI
 ZBDMHw2MUWGPEUn1lQ/UfrSmM+BgHXlfiIeg1WSvactuEDYzRBr0airO93QEjCPbZwOxxjA+
 juWoAwVBDkzbuKN+zPc3Em0qc3wsCz7YpJVNYGno6sCbFq7mTVIVUx+uUGAiem0jAuyVsxSL
 2QQ+zEytu4i+UqzVN7/Uhak5nmesXY0efBdDuk74wGl0bfP7kCSAW1sZiVadNUsucsyRDor/
 lyEhdXkAXpoqrL9YW2Z3qeZq3W1Iyd9BW0fYS4JSyMV7t+lp5s85jrBQ9puCq++iZvuFCv5z
 TGMrQA0mroIgMgEka68+Dj6bymE/8aTCFRvv0OOAzPjsVsRiJOZi5KAtlbHwPIRBqmjQUiKl
 yYkwo+UwM0LEsTY/MCSe9nhDI1F9t7cb2WG3A81RMVxnwlB7UJPamy53d2fGKuKGpxdEdMRS
 BWP0T69HbcKVJdQUYd5YpiqF+MhxrX6GNLuW5j8N4UWOMUuJVfZrXw+OiZ8OlwBd2B1wMkC1
 WqzK57wXR7294w+lFJauNvxIZd0n3tjlAs/tLjwzgi90Kr2WZJmYe5tDbd6VchgtPnsiFyMo
 75i2z6il003vBvWPnOGrub+7DkicRAGOHwBg5EHL7XbfFU5SAnMyZb5mNscRmCspIwN/s+gw
 513chYwJIbX7ZEfFTi3Vw==
IronPort-HdrOrdr: A9a23:Tmwu5anYTvBWccrEp7h0eBuzTY7pDfIU3DAbv31ZSRFFG/Fxl6
 iV8sjzsiWE7gr5OUtQ4exoV5PhfZqxz/JICMwqTNKftWrdyQyVxeNZnOjfKlTbckWUnINgPO
 VbAsxD4bXLfCFHZK3BgTVQfexO/DD+ytHLudvj
X-Talos-CUID: 9a23:XOOLkW/ItOZYOLgbS1CVvxEaBu0hI1fy9njBKGTmKT8uQpG4TEDFrQ==
X-Talos-MUID: 9a23:WWVmUAr9paSOsPad3ysezxg4CtVa6v2AM1gis6ortMm+JWtRByjI2Q==
X-IronPort-AV: E=Sophos;i="6.04,279,1695700800"; 
   d="scan'208";a="131604187"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<George.Dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Julien Grall
	<julien@xen.org>, Federico Serafini <federico.serafini@bugseng.com>
Subject: [PATCH 1/2] driver/char: Drop run_in_exception_handler() ifdefary
Date: Fri, 15 Dec 2023 18:14:32 +0000
Message-ID: <20231215181433.1588532-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231215181433.1588532-1-andrew.cooper3@citrix.com>
References: <20231215181433.1588532-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Since commit 60a9b0715055 ("xen: introduce CONFIG_GENERIC_BUG_FRAME"), the new
common bug.h provides an implementation of run_in_exception_handler() in all
cases, making the #else here dead.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: George Dunlap <George.Dunlap@citrix.com>
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Federico Serafini <federico.serafini@bugseng.com>
---
 xen/drivers/char/ehci-dbgp.c | 4 ----
 xen/drivers/char/ns16550.c   | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/xen/drivers/char/ehci-dbgp.c b/xen/drivers/char/ehci-dbgp.c
index 0f5b41899ef5..bbf4e51c0263 100644
--- a/xen/drivers/char/ehci-dbgp.c
+++ b/xen/drivers/char/ehci-dbgp.c
@@ -1293,11 +1293,7 @@ static void cf_check _ehci_dbgp_poll(struct cpu_user_regs *regs)
 static void cf_check ehci_dbgp_poll(void *data)
 {
     poll_port = data;
-#ifdef run_in_exception_handler
     run_in_exception_handler(_ehci_dbgp_poll);
-#else
-    _ehci_dbgp_poll(guest_cpu_user_regs());
-#endif
 }
 
 static bool ehci_dbgp_setup_preirq(struct ehci_dbgp *dbgp)
diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index c8a51ed66008..29691e8d3ae6 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -233,11 +233,7 @@ static void cf_check __ns16550_poll(struct cpu_user_regs *regs)
 static void cf_check ns16550_poll(void *data)
 {
     this_cpu(poll_port) = data;
-#ifdef run_in_exception_handler
     run_in_exception_handler(__ns16550_poll);
-#else
-    __ns16550_poll(guest_cpu_user_regs());
-#endif
 }
 
 static int cf_check ns16550_tx_ready(struct serial_port *port)
-- 
2.30.2


