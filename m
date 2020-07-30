Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 930452333BF
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jul 2020 16:04:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k199a-0003bq-4Z; Thu, 30 Jul 2020 14:03:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mqfy=BJ=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k199Y-0003be-5f
 for xen-devel@lists.xenproject.org; Thu, 30 Jul 2020 14:03:24 +0000
X-Inumbo-ID: 6c56ba25-d26d-11ea-8d64-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6c56ba25-d26d-11ea-8d64-bc764e2007e4;
 Thu, 30 Jul 2020 14:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596117802;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4TMVIVMpX1FCyLw1mlF83kaGSqx+wZpyRfgFknW/4SM=;
 b=ifC2DomTsBdWu9wR10c1Q1WE8a/f78S4oyoojQdZBjIT/dVeBMHP2xpL
 lEftT6fnPecJPMbdTcds88MA6B9MQ+DZ/Vkpf5cb+sw+DIJSo7SCAMVqA
 eb3WR8TFn6LN3TewS+vO+c5/3/iIswOfGyV86bJY6AuapUnaLY1MShg1h w=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: tc0tkk4xUGO1z45vHMcikuX5ISOT9Bg2FOwespuxsEmUb5qMMGbkLqm4aGJA0SqSDJocDSjw7s
 xgIACT1pDgKQfDy8Og/2n/nQc0KfYKwbVDd+XCcEHMID/zTHf52IYbAeztd2rd78+PZfQzCsGi
 oGIbAW8ZFNJ68dsiP+JLAmZrhupzjaeE8SmAOrl+kMuyvI3417vS/SDGGiY/Q9+u9XH3v/xSrV
 M2IGcBSFnzi+1odhcnZB1kjD+nq56RUt1+ITYhaLvbaxBVp7igt4NhBBMFkw4VhOKRpXZg01b8
 qX4=
X-SBRS: 2.7
X-MesageID: 23557320
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,414,1589256000"; d="scan'208";a="23557320"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/vmx: reorder code in vmx_deliver_posted_intr
Date: Thu, 30 Jul 2020 16:03:09 +0200
Message-ID: <20200730140309.59916-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jun Nakajima <jun.nakajima@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Remove the unneeded else branch, which allows to reduce the
indentation of a larger block of code, while making the flow of the
function more obvious.

No functional change intended.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/vmx/vmx.c | 55 ++++++++++++++++++--------------------
 1 file changed, 26 insertions(+), 29 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index eb54aadfba..7773dcae1b 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2003,6 +2003,8 @@ static void __vmx_deliver_posted_interrupt(struct vcpu *v)
 
 static void vmx_deliver_posted_intr(struct vcpu *v, u8 vector)
 {
+    struct pi_desc old, new, prev;
+
     if ( pi_test_and_set_pir(vector, &v->arch.hvm.vmx.pi_desc) )
         return;
 
@@ -2014,41 +2016,36 @@ static void vmx_deliver_posted_intr(struct vcpu *v, u8 vector)
          * VMEntry as it used to be.
          */
         pi_set_on(&v->arch.hvm.vmx.pi_desc);
+        vcpu_kick(v);
+        return;
     }
-    else
-    {
-        struct pi_desc old, new, prev;
 
-        prev.control = v->arch.hvm.vmx.pi_desc.control;
+    prev.control = v->arch.hvm.vmx.pi_desc.control;
 
-        do {
-            /*
-             * Currently, we don't support urgent interrupt, all
-             * interrupts are recognized as non-urgent interrupt,
-             * Besides that, if 'ON' is already set, no need to
-             * sent posted-interrupts notification event as well,
-             * according to hardware behavior.
-             */
-            if ( pi_test_sn(&prev) || pi_test_on(&prev) )
-            {
-                vcpu_kick(v);
-                return;
-            }
-
-            old.control = v->arch.hvm.vmx.pi_desc.control &
-                          ~((1 << POSTED_INTR_ON) | (1 << POSTED_INTR_SN));
-            new.control = v->arch.hvm.vmx.pi_desc.control |
-                          (1 << POSTED_INTR_ON);
+    do {
+        /*
+         * Currently, we don't support urgent interrupt, all
+         * interrupts are recognized as non-urgent interrupt,
+         * Besides that, if 'ON' is already set, no need to
+         * sent posted-interrupts notification event as well,
+         * according to hardware behavior.
+         */
+        if ( pi_test_sn(&prev) || pi_test_on(&prev) )
+        {
+            vcpu_kick(v);
+            return;
+        }
 
-            prev.control = cmpxchg(&v->arch.hvm.vmx.pi_desc.control,
-                                   old.control, new.control);
-        } while ( prev.control != old.control );
+        old.control = v->arch.hvm.vmx.pi_desc.control &
+                      ~((1 << POSTED_INTR_ON) | (1 << POSTED_INTR_SN));
+        new.control = v->arch.hvm.vmx.pi_desc.control |
+                      (1 << POSTED_INTR_ON);
 
-        __vmx_deliver_posted_interrupt(v);
-        return;
-    }
+        prev.control = cmpxchg(&v->arch.hvm.vmx.pi_desc.control,
+                               old.control, new.control);
+    } while ( prev.control != old.control );
 
-    vcpu_kick(v);
+    __vmx_deliver_posted_interrupt(v);
 }
 
 static void vmx_sync_pir_to_irr(struct vcpu *v)
-- 
2.28.0


