Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62A441F56D0
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 16:30:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jj1ji-0005oD-0l; Wed, 10 Jun 2020 14:29:50 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VUV0=7X=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jj1jh-0005mB-3K
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 14:29:49 +0000
X-Inumbo-ID: d394e594-ab26-11ea-b44c-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d394e594-ab26-11ea-b44c-12813bfff9fa;
 Wed, 10 Jun 2020 14:29:44 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: D4DDbPAQIkhAcN7IgbISu0+cSqAjP8J12kawIFw0UslmU2T6Hr2bFH4GfAn/AuDorrBMJkuqfP
 /UobpnxSz8qST9WKNbI17BIQ+66CEt7DAujFAHd1bDfU+t4ixyDItt12OPWL9aJCqsPkGi3Bvq
 w4EMNlJv0XFwoMsKgYEphIGL9oZn0gRTeUhdwFfSp7BJADP6Y/SlDsRyeKI0uRqA+X4UJjjMai
 vnvB2ymqUGFbhI8M+QY2Wi+nvdW1g28uJR9Yti/WMVRf4uNPfDDDXBTMJxLD1P9NzrN07koVBg
 vQo=
X-SBRS: 2.7
X-MesageID: 19690573
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,496,1583211600"; d="scan'208";a="19690573"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14 v2 2/2] x86/passthrough: introduce a flag for GSIs
 not requiring an EOI or unmask
Date: Wed, 10 Jun 2020 16:29:23 +0200
Message-ID: <20200610142923.9074-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200610142923.9074-1-roger.pau@citrix.com>
References: <20200610142923.9074-1-roger.pau@citrix.com>
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

There's no need to setup a timer for GSIs that are edge triggered,
since those don't require any EIO or unmask, and hence couldn't block
other interrupts.

Note this is only used by PVH dom0, that can setup the passthrough of
edge triggered interrupts from the vIO-APIC. One example of such kind
of interrupt that can be used by a PVH dom0 would be the RTC timer.

While there introduce an out label to do the unlock and reduce code
duplication.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Introduce an out label that does the unlock.
---
 xen/drivers/passthrough/io.c  | 24 +++++++++++++++---------
 xen/include/asm-x86/hvm/irq.h |  2 ++
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/xen/drivers/passthrough/io.c b/xen/drivers/passthrough/io.c
index b292e79382..6b1305a3e5 100644
--- a/xen/drivers/passthrough/io.c
+++ b/xen/drivers/passthrough/io.c
@@ -138,7 +138,8 @@ static void pt_pirq_softirq_reset(struct hvm_pirq_dpci *pirq_dpci)
 
 bool pt_irq_need_timer(uint32_t flags)
 {
-    return !(flags & (HVM_IRQ_DPCI_GUEST_MSI | HVM_IRQ_DPCI_TRANSLATE));
+    return !(flags & (HVM_IRQ_DPCI_GUEST_MSI | HVM_IRQ_DPCI_TRANSLATE |
+                      HVM_IRQ_DPCI_NO_EOI));
 }
 
 static int pt_irq_guest_eoi(struct domain *d, struct hvm_pirq_dpci *pirq_dpci,
@@ -558,6 +559,12 @@ int pt_irq_create_bind(
                      */
                     ASSERT(!mask);
                     share = trigger_mode;
+                    if ( trigger_mode == VIOAPIC_EDGE_TRIG )
+                        /*
+                         * Edge IO-APIC interrupt, no EOI or unmask to perform
+                         * and hence no timer needed.
+                         */
+                        pirq_dpci->flags |= HVM_IRQ_DPCI_NO_EOI;
                 }
             }
 
@@ -897,17 +904,13 @@ static void hvm_dirq_assist(struct domain *d, struct hvm_pirq_dpci *pirq_dpci)
             send_guest_pirq(d, pirq);
 
             if ( pirq_dpci->flags & HVM_IRQ_DPCI_GUEST_MSI )
-            {
-                spin_unlock(&d->event_lock);
-                return;
-            }
+                goto out;
         }
 
         if ( pirq_dpci->flags & HVM_IRQ_DPCI_GUEST_MSI )
         {
             vmsi_deliver_pirq(d, pirq_dpci);
-            spin_unlock(&d->event_lock);
-            return;
+            goto out;
         }
 
         list_for_each_entry ( digl, &pirq_dpci->digl_list, list )
@@ -920,6 +923,8 @@ static void hvm_dirq_assist(struct domain *d, struct hvm_pirq_dpci *pirq_dpci)
         if ( pirq_dpci->flags & HVM_IRQ_DPCI_IDENTITY_GSI )
         {
             hvm_gsi_assert(d, pirq->pirq);
+            if ( pirq_dpci->flags & HVM_IRQ_DPCI_NO_EOI )
+                goto out;
             pirq_dpci->pending++;
         }
 
@@ -927,8 +932,7 @@ static void hvm_dirq_assist(struct domain *d, struct hvm_pirq_dpci *pirq_dpci)
         {
             /* for translated MSI to INTx interrupt, eoi as early as possible */
             __msi_pirq_eoi(pirq_dpci);
-            spin_unlock(&d->event_lock);
-            return;
+            goto out;
         }
 
         /*
@@ -941,6 +945,8 @@ static void hvm_dirq_assist(struct domain *d, struct hvm_pirq_dpci *pirq_dpci)
         ASSERT(pt_irq_need_timer(pirq_dpci->flags));
         set_timer(&pirq_dpci->timer, NOW() + PT_IRQ_TIME_OUT);
     }
+
+ out:
     spin_unlock(&d->event_lock);
 }
 
diff --git a/xen/include/asm-x86/hvm/irq.h b/xen/include/asm-x86/hvm/irq.h
index d306cfeade..532880d497 100644
--- a/xen/include/asm-x86/hvm/irq.h
+++ b/xen/include/asm-x86/hvm/irq.h
@@ -121,6 +121,7 @@ struct dev_intx_gsi_link {
 #define _HVM_IRQ_DPCI_GUEST_PCI_SHIFT           4
 #define _HVM_IRQ_DPCI_GUEST_MSI_SHIFT           5
 #define _HVM_IRQ_DPCI_IDENTITY_GSI_SHIFT        6
+#define _HVM_IRQ_DPCI_NO_EOI_SHIFT              7
 #define _HVM_IRQ_DPCI_TRANSLATE_SHIFT          15
 #define HVM_IRQ_DPCI_MACH_PCI        (1u << _HVM_IRQ_DPCI_MACH_PCI_SHIFT)
 #define HVM_IRQ_DPCI_MACH_MSI        (1u << _HVM_IRQ_DPCI_MACH_MSI_SHIFT)
@@ -129,6 +130,7 @@ struct dev_intx_gsi_link {
 #define HVM_IRQ_DPCI_GUEST_PCI       (1u << _HVM_IRQ_DPCI_GUEST_PCI_SHIFT)
 #define HVM_IRQ_DPCI_GUEST_MSI       (1u << _HVM_IRQ_DPCI_GUEST_MSI_SHIFT)
 #define HVM_IRQ_DPCI_IDENTITY_GSI    (1u << _HVM_IRQ_DPCI_IDENTITY_GSI_SHIFT)
+#define HVM_IRQ_DPCI_NO_EOI          (1u << _HVM_IRQ_DPCI_NO_EOI_SHIFT)
 #define HVM_IRQ_DPCI_TRANSLATE       (1u << _HVM_IRQ_DPCI_TRANSLATE_SHIFT)
 
 struct hvm_gmsi_info {
-- 
2.26.2


