Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC777F3730
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 21:16:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638180.994511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5XA6-0007F1-KV; Tue, 21 Nov 2023 20:15:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638180.994511; Tue, 21 Nov 2023 20:15:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5XA6-0007CC-HP; Tue, 21 Nov 2023 20:15:58 +0000
Received: by outflank-mailman (input) for mailman id 638180;
 Tue, 21 Nov 2023 20:15:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T8a9=HC=citrix.com=prvs=682c61bdb=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1r5XA5-0007Bx-BF
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 20:15:57 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5e7804c-88aa-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 21:15:55 +0100 (CET)
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
X-Inumbo-ID: c5e7804c-88aa-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1700597755;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SMthb4NtkNO2RAGaFUKKyekiWRpIMs0yeackPSSJ3Nc=;
  b=VfD5t2hsDMSClkAICzWKTQf08hWf3LOSUF/vVy0p7chzOJTqhf3iZ9RO
   41yZWjkIkJ9MYsgj6Ns3bQQ9iLcvmjJuxlgkCDJnmsri4j/6VCxnbEY5l
   y6kZ3h026+VzlvetAG25Gl5430LIgHaIrOTEdOx9vScq7GPMcrxKSKkDV
   w=;
X-CSE-ConnectionGUID: +GZ+UsK9SGatMSUbv7Cxvg==
X-CSE-MsgGUID: eEvee9pQQCazgXO2Vt1ohA==
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 127464600
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.159.70
X-Policy: $RELAYED
X-ThreatScanner-Verdict: Negative
IronPort-Data: A9a23:IFo2MKN8Rs/+wvfvrR1Dl8FynXyQoLVcMsEvi/4bfWQNrUpw0jxSm
 mMXXmiPO/beYGX8KthzOo2x/UoOsJ7RndYxTwto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CQ6jefQAOOkVIYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGjxSs/7rRC9H5qyo42pB5AVmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0qVYMyJz7
 t9JEx8EcjW4uuion5mrVOY506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEOHwwNHwsYDUWUrsTILs4kP2lmT/UdDpApUjOjaE2/3LS3Ep6172F3N/9I4bVGZsJwB7Az
 o7A12nUHBwXZcSm8BGM4H2cobXxgXr8WKtHQdVU8dY12QbOlwT/EiY+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yFamlBMBX9tbE8Uh9RqAjKHT5m6xHXMYRzRMbNgnss4eRjEw0
 FKN2dTzClRHr7m9WX+bsLCOoluaOzURLGIETT8JS00C+daLiL80ihXDX9NyCpmfh9f+GSzz6
 z2SpS14jLIW5eYB2r+n51nBj3Spr4LQUw8uzgzNWySu6QYRTJSibYGy9V+d5/9PKo+DR3GLo
 Xcfls6RqusJCPmlki2GR+EEWq+k++yENjz0i0NgBJQn+HKm/HvLQGxLyGggfgEzaJ9CIGK4J
 hCL0e9M2HNNFDiFX+xKeKHgMOsj0Y3bKN77CdvEcNUbN/CdazS7EDFSiV+4hj+1yBV8y/xga
 f+mndCQ4WH24JmLLQZapM9HiNfHPghkmQvuqWnTlnxLK4a2an+PUqsiO1CTdO0/567siFyKq
 44CZpLUlkUGCbGWjszrHWg7dwhiwZ8TXMCeliCqXrTbfloO9J8JV5c9Po/Ni6Q6xv8Ix48kD
 1m2W1NCyUqXuJE0AVziV5yXU5u2BcwXhStibUQR0aOAhyBLjXCHsP1OKPPavNAPqIRe8BKDZ
 6BcIJ3ZWqQWF2ivFvZ0RcCVkbGOvS+D3WqmVxdJqhBmF3K8b2QlIuPZQzY=
IronPort-HdrOrdr: A9a23:toMCjK4pDH3eDlY4FwPXwf+BI+orL9Y04lQ7vn2ZHyYlPfBw8P
 re6sjztCWE/wr5PUtQ4+xoV5PwP080y6QFmLX5UY3SLTUPlgOTXeZfBKHZsl/d8xSXzJ846U
 +LG5IObuEYdGIK6PoSgjPIYerIseP3hJxA3t2ut0uFJDsCA8oMg2gWa2am+ytNNXl77LUCZe
 WhD6F81k+dkBosH7eG71A+Lqb+TxyiruOEXTc2QzAm9SyHhneQ6Kf3Fhie0lM/Xlp0sP0f2F
 mAvQzlw62p98i60xPY12jeq69bl7Lau5Z+Lf3JpMgJDz3mzj+pfYhlW7qP+AopqPyy8j8R4Z
 XxiiZlEcRvznvbOlivpxjg0RSI6kdm11bSjXGZnF7qqojBXzQ4B8BdwaJVGyGpo3YIjZVT0L
 9v12ncjoFQDh/LgWDF78XIPisa3XackD4DlvIWhHoacaZ2Us4rkWRWlHklbavpVkrBmfwaOd
 grKt3A6/NfdlHfS3jYu21mx7WXNEgOIg==
X-Talos-CUID: =?us-ascii?q?9a23=3A2riqdmjCpUro7ISMMsq7mXSuKjJuMVLvj0rLAB6?=
 =?us-ascii?q?DJm91bYaoQ0HP07N6nJ87?=
X-Talos-MUID: 9a23:vLR/9guwDWOE0LzpB82niRx8Oco5+52XI0kfnqUh4feYbCtwEmLI
X-IronPort-AV: E=Sophos;i="6.04,216,1695700800"; 
   d="scan'208";a="127464600"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Roberto Bagnara <roberto.bagnara@bugseng.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>
Subject: [PATCH v2 1/5] x86/setup: Clean up cmdline handling in create_dom0()
Date: Tue, 21 Nov 2023 20:15:36 +0000
Message-ID: <20231121201540.1528161-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231121201540.1528161-1-andrew.cooper3@citrix.com>
References: <20231121201540.1528161-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

There's a confusing mix of variables; a static dom0_cmdline[], and a cmdline
pointer which points to image->string before being pointed at the static
buffer in order to be passed into construct_dom0().  cmdline being a mutable
pointer falls over -Wwrite-strings builds.

Delete the cmdline pointer, and rename dom0_cmdline[] to cmdline extending it
to have full function scope.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
CC: Bertrand Marquis <bertrand.marquis@arm.com>
CC: Roberto Bagnara <roberto.bagnara@bugseng.com>
CC: Nicola Vetrini <nicola.vetrini@bugseng.com>

v2:
 * New.  This unravelled a bit, so I pulled it into a separate patch, but the
   end result is much clearer to follow IMO.
---
 xen/arch/x86/setup.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index c41dfdb2bdf8..c0302c6bdd62 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -873,6 +873,8 @@ static struct domain *__init create_dom0(const module_t *image,
                                          module_t *initrd, const char *kextra,
                                          const char *loader)
 {
+    static char __initdata cmdline[MAX_GUEST_CMDLINE];
+
     struct xen_domctl_createdomain dom0_cfg = {
         .flags = IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0,
         .max_evtchn_port = -1,
@@ -885,7 +887,6 @@ static struct domain *__init create_dom0(const module_t *image,
         },
     };
     struct domain *d;
-    char *cmdline;
     domid_t domid;
 
     if ( opt_dom0_pvh )
@@ -913,33 +914,30 @@ static struct domain *__init create_dom0(const module_t *image,
         panic("Error creating d%uv0\n", domid);
 
     /* Grab the DOM0 command line. */
-    cmdline = image->string ? __va(image->string) : NULL;
-    if ( cmdline || kextra )
+    if ( image->string || kextra )
     {
-        static char __initdata dom0_cmdline[MAX_GUEST_CMDLINE];
-
-        cmdline = cmdline_cook(cmdline, loader);
-        safe_strcpy(dom0_cmdline, cmdline);
+        if ( image->string )
+            safe_strcpy(cmdline, cmdline_cook(__va(image->string), loader));
 
         if ( kextra )
             /* kextra always includes exactly one leading space. */
-            safe_strcat(dom0_cmdline, kextra);
+            safe_strcat(cmdline, kextra);
 
         /* Append any extra parameters. */
-        if ( skip_ioapic_setup && !strstr(dom0_cmdline, "noapic") )
-            safe_strcat(dom0_cmdline, " noapic");
+        if ( skip_ioapic_setup && !strstr(cmdline, "noapic") )
+            safe_strcat(cmdline, " noapic");
+
         if ( (strlen(acpi_param) == 0) && acpi_disabled )
         {
             printk("ACPI is disabled, notifying Domain 0 (acpi=off)\n");
             safe_strcpy(acpi_param, "off");
         }
-        if ( (strlen(acpi_param) != 0) && !strstr(dom0_cmdline, "acpi=") )
+
+        if ( (strlen(acpi_param) != 0) && !strstr(cmdline, "acpi=") )
         {
-            safe_strcat(dom0_cmdline, " acpi=");
-            safe_strcat(dom0_cmdline, acpi_param);
+            safe_strcat(cmdline, " acpi=");
+            safe_strcat(cmdline, acpi_param);
         }
-
-        cmdline = dom0_cmdline;
     }
 
     /*
-- 
2.30.2


