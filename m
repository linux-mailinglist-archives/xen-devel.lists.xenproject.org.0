Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 856C41F7B36
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 17:57:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjm3Z-0006O6-QV; Fri, 12 Jun 2020 15:57:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5h37=7Z=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jjm3Y-0006Lr-Ea
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 15:57:24 +0000
X-Inumbo-ID: 677d62be-acc5-11ea-bca7-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 677d62be-acc5-11ea-bca7-bc764e2007e4;
 Fri, 12 Jun 2020 15:57:23 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: TVD0ttfOnIiXGEtsNobNcfdCmiF8/oXhdeOHH8SAseli8/+/JIfIRE4czWVeWo0K2B3KqhvRSo
 f6gs7CY0ghaN+EPFqfJSpQm1t8OU5V9/eseebNUQUKH+jGKUsm8H59xaX4Wn7T/PXub7KCWClY
 XGCyFgzWysjFbkfGj8zG+GZiC8XnUl1rX5omH4G86iYV7MVzw5B4Qd4f/oKo/Xg1iYnXslYzt9
 BIBRtMeZN3jbT5j8GFW/C/luI3bYbhy4pZ2BAfTfy9OOA7tVP+DVV4PwjDNOp48ZENHtepvKJm
 ODw=
X-SBRS: 2.7
X-MesageID: 20157334
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,503,1583211600"; d="scan'208";a="20157334"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14 6/8] x86/vpt: fix injection to remote vCPU
Date: Fri, 12 Jun 2020 17:56:38 +0200
Message-ID: <20200612155640.4101-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200612155640.4101-1-roger.pau@citrix.com>
References: <20200612155640.4101-1-roger.pau@citrix.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

vpt timers are usually added to the per-vCPU list of the vCPU where
they get setup, but depending on the timer source type that vCPU might
be different than the one where the interrupt vector gets injected.

For example the PIT timer use a PIC or IO-APIC pin in order to select
the destination vCPU and vector, which might not match the vCPU they
are configured from.

If such a situation happens pt_intr_post won't be called, and thus the
vpt will be left in a limbo where the next interrupt won't be
scheduled. Fix this by generalizing the special handling done to
IO-APIC level interrupts to be applied always when the destination
vCPU of the injected vector is different from the vCPU where the vpt
belongs to (ie: usually the one it's been configured from).

A further improvement as noted in a comment added to the code might be
to move the vpt so it's handled by the same vCPU where the vector gets
injected.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/vpt.c | 80 +++++++++++++++++++++---------------------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/xen/arch/x86/hvm/vpt.c b/xen/arch/x86/hvm/vpt.c
index 6a975fc668..52ad5b90a7 100644
--- a/xen/arch/x86/hvm/vpt.c
+++ b/xen/arch/x86/hvm/vpt.c
@@ -358,59 +358,59 @@ int pt_update_irq(struct vcpu *v)
          * interrupt delivery case. Otherwise return -1 to do nothing.
          */
         vlapic_set_irq(vcpu_vlapic(v), irq, 0);
-        pt_vector = irq;
-        break;
+        return irq;
 
     case PTSRC_isa:
         hvm_isa_irq_deassert(v->domain, irq);
         if ( platform_legacy_irq(irq) && vlapic_accept_pic_intr(v) &&
              v->domain->arch.hvm.vpic[irq >> 3].int_output )
-            hvm_isa_irq_assert(v->domain, irq, NULL);
+            pt_vector = hvm_isa_irq_assert(v->domain, irq, NULL);
         else
-        {
             pt_vector = hvm_isa_irq_assert(v->domain, irq, vioapic_get_vector);
-            /*
-             * hvm_isa_irq_assert may not set the corresponding bit in vIRR
-             * when mask field of IOAPIC RTE is set. Check it again.
-             */
-            if ( pt_vector < 0 || !vlapic_test_irq(vcpu_vlapic(v), pt_vector) )
-                pt_vector = -1;
-        }
+
+        if ( pt_vector < 0 )
+            return pt_vector;
+
         break;
 
     case PTSRC_ioapic:
         pt_vector = hvm_ioapic_assert(v->domain, irq, level);
-        if ( pt_vector < 0 || !vlapic_test_irq(vcpu_vlapic(v), pt_vector) )
-        {
-            pt_vector = -1;
-            if ( level )
+        if ( pt_vector < 0 )
+            return pt_vector;
+
+        break;
+    }
+
+    ASSERT(pt_vector >= 0);
+    if ( !vlapic_test_irq(vcpu_vlapic(v), pt_vector) )
+    {
+        time_cb *cb = NULL;
+        void *cb_priv;
+
+        /*
+         * Vector has been injected to a different vCPU, call pt_irq_fired and
+         * execute the callback, since the destination vCPU(s) won't call
+         * pt_intr_post for it.
+         *
+         * TODO: move this vpt to one of the vCPUs where the vector gets
+         * injected.
+         */
+        spin_lock(&v->arch.hvm.tm_lock);
+        /* Make sure the timer is still on the list. */
+        list_for_each_entry ( pt, &v->arch.hvm.tm_list, list )
+            if ( pt == earliest_pt )
             {
-                /*
-                 * Level interrupts are always asserted because the pin assert
-                 * count is incremented regardless of whether the pin is masked
-                 * or the vector latched in IRR, so also execute the callback
-                 * associated with the timer.
-                 */
-                time_cb *cb = NULL;
-                void *cb_priv;
-
-                spin_lock(&v->arch.hvm.tm_lock);
-                /* Make sure the timer is still on the list. */
-                list_for_each_entry ( pt, &v->arch.hvm.tm_list, list )
-                    if ( pt == earliest_pt )
-                    {
-                        pt_irq_fired(v, pt);
-                        cb = pt->cb;
-                        cb_priv = pt->priv;
-                        break;
-                    }
-                spin_unlock(&v->arch.hvm.tm_lock);
-
-                if ( cb != NULL )
-                    cb(v, cb_priv);
+                pt_irq_fired(v, pt);
+                cb = pt->cb;
+                cb_priv = pt->priv;
+                break;
             }
-        }
-        break;
+        spin_unlock(&v->arch.hvm.tm_lock);
+
+        if ( cb != NULL )
+            cb(v, cb_priv);
+
+        pt_vector = -1;
     }
 
     return pt_vector;
-- 
2.26.2


