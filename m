Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F3CB1F53D6
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 13:51:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jizGg-0008BO-J8; Wed, 10 Jun 2020 11:51:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VUV0=7X=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jizGf-000894-5e
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 11:51:41 +0000
X-Inumbo-ID: bc778184-ab10-11ea-bb8b-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc778184-ab10-11ea-bb8b-bc764e2007e4;
 Wed, 10 Jun 2020 11:51:36 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: c+5iYyULtN6MmJAxB9TxPcrmkNfHgal4+8BuiEm2tC/wgr23aYplq31C8WJQeoJGHLZ79omQiN
 4c93Rc4dAIIFaFZI5z033JpEuZYVvJqTPBCWCpqo3Y8LLdAdnIfHNo8raGIH3UP37MyHfgMsyP
 /W1Qxzl7m2NDU+4OWCLrKacObIhQzktx3CP5RoPZObW3YMNftQXuDQqmpIVoZMH+ZCl0++NLgF
 gdgm048dekes7sP8cnvKn9Q3AKo6PPVjSZ+LZDgYc36gWERsfy87X/EAIqa1CCBdB+8vntcn/c
 rjI=
X-SBRS: 2.7
X-MesageID: 19690637
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,495,1583211600"; d="scan'208";a="19690637"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
Subject: [PATCH for-4.14 2/2] x86/passthrough: introduce a flag for GSIs not
 requiring an EOI or unmask
Date: Wed, 10 Jun 2020 13:51:03 +0200
Message-ID: <20200610115103.7592-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200610115103.7592-1-roger.pau@citrix.com>
References: <20200610115103.7592-1-roger.pau@citrix.com>
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

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/passthrough/io.c  | 14 +++++++++++++-
 xen/include/asm-x86/hvm/irq.h |  2 ++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/io.c b/xen/drivers/passthrough/io.c
index b292e79382..be1d5b1434 100644
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
+                    if ( !trigger_mode )
+                        /*
+                         * Edge IO-APIC interrupt, no EOI or unmask to perform
+                         * and hence no timer needed.
+                         */
+                        pirq_dpci->flags |= HVM_IRQ_DPCI_NO_EOI;
                 }
             }
 
@@ -920,6 +927,11 @@ static void hvm_dirq_assist(struct domain *d, struct hvm_pirq_dpci *pirq_dpci)
         if ( pirq_dpci->flags & HVM_IRQ_DPCI_IDENTITY_GSI )
         {
             hvm_gsi_assert(d, pirq->pirq);
+            if ( pirq_dpci->flags & HVM_IRQ_DPCI_NO_EOI )
+            {
+                spin_unlock(&d->event_lock);
+                return;
+            }
             pirq_dpci->pending++;
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


