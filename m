Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 794992F8932
	for <lists+xen-devel@lfdr.de>; Sat, 16 Jan 2021 00:11:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68829.123336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0YFL-0005wB-VT; Fri, 15 Jan 2021 23:11:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68829.123336; Fri, 15 Jan 2021 23:11:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0YFL-0005vm-Rs; Fri, 15 Jan 2021 23:11:11 +0000
Received: by outflank-mailman (input) for mailman id 68829;
 Fri, 15 Jan 2021 23:11:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+hG6=GS=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l0YFK-0005vh-Gk
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 23:11:10 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 45cce534-f808-470b-90a9-362a30d291b2;
 Fri, 15 Jan 2021 23:11:09 +0000 (UTC)
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
X-Inumbo-ID: 45cce534-f808-470b-90a9-362a30d291b2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1610752269;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dXS/3Rq9xVyxzLPRXvqV3AmMCV9sf33JIKkKChDLoGg=;
  b=blccXMiCyvHaDnAQHGK2DTidJzZEjaYtKx+YaMOrouHXMf64tntRSgN1
   Pj1J8pX4MVFGWuix2LQlm//8b7ZzBQiLcrIXJWxFAvjnOzIFONLfu5PNU
   EDnZwrsugVO0S1lsyWDuyMCHXGyvP3BVuWilcqAWvHoD8FY4Kivclg+Cu
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: uqeMXLqjdoNfVtZrUpv2fgraaZMjdZdyYMgYwj/wMu2Iw9OOwcdLIDBgPiwg9nesudjW+R8UR2
 iRm7pIBHkGQcB6CY7h+td6xlXiKVrPOZS2/c2c92rBNIMzrAMR0xPSvksUkLUKhx229BrYl3QU
 w3l1XJZybR7fJX/1ShELp6QMq/ohMW7VyVdPZaZVLXulGszGWz2lzUYZHxrgmnL9CR7F4W+IWI
 2uCKE4yy+yEWLVXpJ3E4opkYTvBmVwiZlRFQBJZOr/hBKFLVJsrZ4BHnFcWMfTZPAEtYidCWQh
 ZyE=
X-SBRS: 5.1
X-MesageID: 35207499
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,350,1602561600"; 
   d="scan'208";a="35207499"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>, Marek Kasiewicz
	<marek.kasiewicz@3mdeb.com>, =?UTF-8?q?Norbert=20Kami=C5=84ski?=
	<norbert.kaminski@3mdeb.com>, Michal Zygowski <michal.zygowski@3mdeb.com>,
	Piotr Krol <piotr.krol@3mdeb.co>, Krystian Hebel <krystian.hebel@3mdeb.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>, Rich Persaud
	<persaur@gmail.com>, Christopher Clark <christopher.w.clark@gmail.com>
Subject: [PATCH 2/3] x86/smpboot: Allow making an INIT IPI conditional
Date: Fri, 15 Jan 2021 23:10:45 +0000
Message-ID: <20210115231046.31785-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210115231046.31785-1-andrew.cooper3@citrix.com>
References: <20210115231046.31785-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

A subsequent change is going to introduce SKINIT support, wherein the APs will
be already be in the wait-for-SIPI state, and an INIT must not be sent.

Introduce a send_INIT boolean, so we can control sending an INIT IPI
separately from sending SIPIs.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Marek Kasiewicz <marek.kasiewicz@3mdeb.com>
CC: Norbert Kamiński <norbert.kaminski@3mdeb.com>
CC: Michal Zygowski <michal.zygowski@3mdeb.com>
CC: Piotr Krol <piotr.krol@3mdeb.co>
CC: Krystian Hebel <krystian.hebel@3mdeb.com>
CC: Daniel P. Smith <dpsmith@apertussolutions.com>
CC: Rich Persaud <persaur@gmail.com>
CC: Christopher Clark <christopher.w.clark@gmail.com>
---
 xen/arch/x86/smpboot.c | 78 ++++++++++++++++++++++++++------------------------
 1 file changed, 41 insertions(+), 37 deletions(-)

diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 9eca452ce1..195e3681b4 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -424,6 +424,7 @@ static int wakeup_secondary_cpu(int phys_apicid, unsigned long start_eip)
 {
     unsigned long send_status = 0, accept_status = 0;
     int maxlvt, timeout, i;
+    bool send_INIT = true;
 
     /*
      * Some versions of tboot might be able to handle the entire wake sequence
@@ -438,49 +439,52 @@ static int wakeup_secondary_cpu(int phys_apicid, unsigned long start_eip)
     apic_write(APIC_ESR, 0);
     apic_read(APIC_ESR);
 
-    Dprintk("Asserting INIT.\n");
+    if ( send_INIT )
+    {
+        Dprintk("Asserting INIT.\n");
 
-    /*
-     * Turn INIT on target chip via IPI
-     */
-    apic_icr_write(APIC_INT_LEVELTRIG | APIC_INT_ASSERT | APIC_DM_INIT,
-                   phys_apicid);
+        /*
+         * Turn INIT on target chip via IPI
+         */
+        apic_icr_write(APIC_INT_LEVELTRIG | APIC_INT_ASSERT | APIC_DM_INIT,
+                       phys_apicid);
 
-    if ( !x2apic_enabled )
-    {
-        Dprintk("Waiting for send to finish...\n");
-        timeout = 0;
-        do {
-            Dprintk("+");
-            udelay(100);
-            send_status = apic_read(APIC_ICR) & APIC_ICR_BUSY;
-        } while ( send_status && (timeout++ < 1000) );
+        if ( !x2apic_enabled )
+        {
+            Dprintk("Waiting for send to finish...\n");
+            timeout = 0;
+            do {
+                Dprintk("+");
+                udelay(100);
+                send_status = apic_read(APIC_ICR) & APIC_ICR_BUSY;
+            } while ( send_status && (timeout++ < 1000) );
 
-        mdelay(10);
+            mdelay(10);
 
-        Dprintk("Deasserting INIT.\n");
+            Dprintk("Deasserting INIT.\n");
 
-        apic_icr_write(APIC_INT_LEVELTRIG | APIC_DM_INIT, phys_apicid);
+            apic_icr_write(APIC_INT_LEVELTRIG | APIC_DM_INIT, phys_apicid);
 
-        Dprintk("Waiting for send to finish...\n");
-        timeout = 0;
-        do {
-            Dprintk("+");
-            udelay(100);
-            send_status = apic_read(APIC_ICR) & APIC_ICR_BUSY;
-        } while ( send_status && (timeout++ < 1000) );
-    }
-    else if ( tboot_in_measured_env() )
-    {
-        /*
-         * With tboot AP is actually spinning in a mini-guest before
-         * receiving INIT. Upon receiving INIT ipi, AP need time to VMExit,
-         * update VMCS to tracking SIPIs and VMResume.
-         *
-         * While AP is in root mode handling the INIT the CPU will drop
-         * any SIPIs
-         */
-        udelay(10);
+            Dprintk("Waiting for send to finish...\n");
+            timeout = 0;
+            do {
+                Dprintk("+");
+                udelay(100);
+                send_status = apic_read(APIC_ICR) & APIC_ICR_BUSY;
+            } while ( send_status && (timeout++ < 1000) );
+        }
+        else if ( tboot_in_measured_env() )
+        {
+            /*
+             * With tboot AP is actually spinning in a mini-guest before
+             * receiving INIT. Upon receiving INIT ipi, AP need time to VMExit,
+             * update VMCS to tracking SIPIs and VMResume.
+             *
+             * While AP is in root mode handling the INIT the CPU will drop
+             * any SIPIs
+             */
+            udelay(10);
+        }
     }
 
     maxlvt = get_maxlvt();
-- 
2.11.0


