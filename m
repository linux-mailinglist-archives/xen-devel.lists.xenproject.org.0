Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5425027E6E0
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 12:41:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552.1906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNZYP-0001La-EC; Wed, 30 Sep 2020 10:41:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552.1906; Wed, 30 Sep 2020 10:41:45 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNZYP-0001KJ-9m; Wed, 30 Sep 2020 10:41:45 +0000
Received: by outflank-mailman (input) for mailman id 552;
 Wed, 30 Sep 2020 10:41:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=153E=DH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kNZYN-0000jt-Fx
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 10:41:43 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 41e04a71-5dea-448a-b732-af8db5c019d0;
 Wed, 30 Sep 2020 10:41:30 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=153E=DH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kNZYN-0000jt-Fx
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 10:41:43 +0000
X-Inumbo-ID: 41e04a71-5dea-448a-b732-af8db5c019d0
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 41e04a71-5dea-448a-b732-af8db5c019d0;
	Wed, 30 Sep 2020 10:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601462491;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JIoT3R0CK2KnQJuWyOhX8m7nC6Gtx138LXoxJJO92Vk=;
  b=WJkHvc/eBSt4+LCyoZAavBYdPhhxWm11Y9KC5U05WQgl9It4g6n8yZ/c
   3IQTTroog/QzX01weYHvU90yxh1uC+KT/Z3A3K0ypzz/7JCZ/MVGQsu/L
   nXP7GiwzaWaWtM9ngqi0X3K2bNWSmWJr5wpDZD1W6v8Sr/YOBRtW6wNol
   w=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: OGzsdGGit/gwXLAzmOo0k5+XX7s+vLXu3Ct4cqCVMywXmwlq9MUCan27KHP3gFnoNau46WkQGb
 kKwffjuHXyrnAe5oFu9VXTWc6v65tVzeIZll5N++DEJbOsVbMzk5lRJ4xrTexhD34phDzoACW2
 Suju+EkrvgIw00apUC+otwYDkE1y9mr1q4qoPlPsLzIVx2oVpIli/+/2RKA45DF47mH4n9dAV8
 rp8xDAKN+r7OrvBHuBl8XXhMexlib2aOq3qZTZbshwQ/ILJhJWF89Gs0sh/cfT1VazM38pwRKD
 A90=
X-SBRS: None
X-MesageID: 27927013
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,322,1596513600"; 
   d="scan'208";a="27927013"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>
Subject: [PATCH v2 08/11] x86/dpci: switch to use a GSI EOI callback
Date: Wed, 30 Sep 2020 12:41:05 +0200
Message-ID: <20200930104108.35969-9-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200930104108.35969-1-roger.pau@citrix.com>
References: <20200930104108.35969-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Switch the dpci GSI EOI callback hooks to use the newly introduced
generic callback functionality, and remove the custom dpci calls found
on the vPIC and vIO-APIC implementations.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version.
---
 xen/arch/x86/hvm/vioapic.c    |  7 ------
 xen/arch/x86/hvm/vpic.c       |  2 --
 xen/drivers/passthrough/io.c  | 41 ++++++++++++++++++++++++++++++++---
 xen/include/asm-x86/hvm/io.h  |  1 -
 xen/include/asm-x86/hvm/irq.h |  1 +
 5 files changed, 39 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 03b1350c04..ea4d60d33e 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -400,13 +400,6 @@ static void eoi_callback(unsigned int vector, void *data)
 
             ent->fields.remote_irr = 0;
 
-            if ( is_iommu_enabled(d) )
-            {
-                spin_unlock(&d->arch.hvm.irq_lock);
-                hvm_dpci_eoi(gsi, ent);
-                spin_lock(&d->arch.hvm.irq_lock);
-            }
-
             spin_unlock(&d->arch.hvm.irq_lock);
             hvm_gsi_execute_callbacks(gsi, ent);
             spin_lock(&d->arch.hvm.irq_lock);
diff --git a/xen/arch/x86/hvm/vpic.c b/xen/arch/x86/hvm/vpic.c
index 09c937c322..3c01c638fa 100644
--- a/xen/arch/x86/hvm/vpic.c
+++ b/xen/arch/x86/hvm/vpic.c
@@ -266,8 +266,6 @@ static void vpic_ioport_write(
                 hvm_gsi_execute_callbacks(
                         hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin),
                         NULL);
-                hvm_dpci_eoi(hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin),
-                             NULL);
                 return; /* bail immediately */
 
             case 6: /* Set Priority                */
diff --git a/xen/drivers/passthrough/io.c b/xen/drivers/passthrough/io.c
index 770a5cce6b..6908438a94 100644
--- a/xen/drivers/passthrough/io.c
+++ b/xen/drivers/passthrough/io.c
@@ -327,9 +327,10 @@ static void hvm_gsi_eoi(struct domain *d, unsigned int gsi,
     hvm_pirq_eoi(pirq, ent);
 }
 
-void hvm_dpci_eoi(unsigned int guest_gsi, const union vioapic_redir_entry *ent)
+static void dpci_eoi(unsigned int guest_gsi, void *data)
 {
     struct domain *d = current->domain;
+    const union vioapic_redir_entry *ent = data;
     const struct hvm_irq_dpci *hvm_irq_dpci;
     const struct hvm_girq_dpci_mapping *girq;
 
@@ -565,7 +566,7 @@ int pt_irq_create_bind(
             unsigned int link;
 
             digl = xmalloc(struct dev_intx_gsi_link);
-            girq = xmalloc(struct hvm_girq_dpci_mapping);
+            girq = xzalloc(struct hvm_girq_dpci_mapping);
 
             if ( !digl || !girq )
             {
@@ -578,11 +579,22 @@ int pt_irq_create_bind(
             girq->bus = digl->bus = pt_irq_bind->u.pci.bus;
             girq->device = digl->device = pt_irq_bind->u.pci.device;
             girq->intx = digl->intx = pt_irq_bind->u.pci.intx;
-            list_add_tail(&digl->list, &pirq_dpci->digl_list);
+            girq->cb.callback = dpci_eoi;
 
             guest_gsi = hvm_pci_intx_gsi(digl->device, digl->intx);
             link = hvm_pci_intx_link(digl->device, digl->intx);
 
+            rc = hvm_gsi_register_callback(d, guest_gsi, &girq->cb);
+            if ( rc )
+            {
+                spin_unlock(&d->event_lock);
+                xfree(girq);
+                xfree(digl);
+                return rc;
+            }
+
+            list_add_tail(&digl->list, &pirq_dpci->digl_list);
+
             hvm_irq_dpci->link_cnt[link]++;
 
             girq->machine_gsi = pirq;
@@ -590,8 +602,17 @@ int pt_irq_create_bind(
         }
         else
         {
+            struct hvm_gsi_eoi_callback *cb =
+                xzalloc(struct hvm_gsi_eoi_callback);
+
             ASSERT(is_hardware_domain(d));
 
+            if ( !cb )
+            {
+                spin_unlock(&d->event_lock);
+                return -ENOMEM;
+            }
+
             /* MSI_TRANSLATE is not supported for the hardware domain. */
             if ( pt_irq_bind->irq_type != PT_IRQ_TYPE_PCI ||
                  pirq >= hvm_domain_irq(d)->nr_gsis )
@@ -601,6 +622,19 @@ int pt_irq_create_bind(
                 return -EINVAL;
             }
             guest_gsi = pirq;
+
+            cb->callback = dpci_eoi;
+            /*
+             * IRQ binds created for the hardware domain are never destroyed,
+             * so it's fine to not keep a reference to cb here.
+             */
+            rc = hvm_gsi_register_callback(d, guest_gsi, cb);
+            if ( rc )
+            {
+                spin_unlock(&d->event_lock);
+                xfree(cb);
+                return rc;
+            }
         }
 
         /* Bind the same mirq once in the same domain */
@@ -789,6 +823,7 @@ int pt_irq_destroy_bind(
                  girq->machine_gsi == machine_gsi )
             {
                 list_del(&girq->list);
+                hvm_gsi_unregister_callback(d, guest_gsi, &girq->cb);
                 xfree(girq);
                 girq = NULL;
                 break;
diff --git a/xen/include/asm-x86/hvm/io.h b/xen/include/asm-x86/hvm/io.h
index 759ee486af..e1bc556613 100644
--- a/xen/include/asm-x86/hvm/io.h
+++ b/xen/include/asm-x86/hvm/io.h
@@ -118,7 +118,6 @@ bool handle_mmio_with_translation(unsigned long gla, unsigned long gpfn,
                                   struct npfec);
 bool handle_pio(uint16_t port, unsigned int size, int dir);
 void hvm_interrupt_post(struct vcpu *v, int vector, int type);
-void hvm_dpci_eoi(unsigned int guest_irq, const union vioapic_redir_entry *ent);
 void msix_write_completion(struct vcpu *);
 
 #ifdef CONFIG_HVM
diff --git a/xen/include/asm-x86/hvm/irq.h b/xen/include/asm-x86/hvm/irq.h
index db38c3e119..2f01d8fe64 100644
--- a/xen/include/asm-x86/hvm/irq.h
+++ b/xen/include/asm-x86/hvm/irq.h
@@ -158,6 +158,7 @@ struct hvm_girq_dpci_mapping {
     uint8_t device;
     uint8_t intx;
     uint8_t machine_gsi;
+    struct hvm_gsi_eoi_callback cb;
 };
 
 #define NR_ISAIRQS  16
-- 
2.28.0


