Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6783927E6DC
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 12:41:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548.1857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNZYF-00010c-Bg; Wed, 30 Sep 2020 10:41:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548.1857; Wed, 30 Sep 2020 10:41:35 +0000
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
	id 1kNZYF-0000zd-51; Wed, 30 Sep 2020 10:41:35 +0000
Received: by outflank-mailman (input) for mailman id 548;
 Wed, 30 Sep 2020 10:41:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=153E=DH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kNZYD-0000jt-Fn
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 10:41:33 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c2550543-9849-4375-88dd-bf3b74cbb88d;
 Wed, 30 Sep 2020 10:41:25 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=153E=DH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kNZYD-0000jt-Fn
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 10:41:33 +0000
X-Inumbo-ID: c2550543-9849-4375-88dd-bf3b74cbb88d
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id c2550543-9849-4375-88dd-bf3b74cbb88d;
	Wed, 30 Sep 2020 10:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601462486;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9kBBlKUOnFSovScUXA31eNkc28ns/2tqeO6kHQVGijE=;
  b=GaV+V2faWRXBdmwit/4/WQpOzUHomVdkNicdqivHrs7P2fTyECrXBmFW
   Yq0QBKTf8A7xQfdbb+WrwIOSjNFHEohVI4uri91Zu0PXc3P5SmMtgnV0H
   HJnhycwHixIweyV+DuCl7Pjq1tP3UdVXjaBQm7lz4Tswxsi+Dq40mlhdM
   k=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: vtRqDyWjDSJ3VkIBlJVb+KLRdjJb9Ayqc49eCg1d6odZAYLTiSsUVf31yDC25L5f+wCepjKssY
 J9eHNcdgZkXTlEGPotHY6MkCLv81n8MeHF4bCm70+JfJjgmfDEyyZX9Jg/AV+0cm1C+W75/obI
 phaulJACStAaG1GX5qDf1xEJRcq7NlquS8ryfjmlMRWaOQvIvgKgJ34JcMxZsG/E5sdlVqU6/P
 ZBCmXE6iw7/J3JxAexnK+YdDY4xa7o6qbOG/YYb+QNGZ5IqUgiAA9XeETuHOiIhodoG1HkfkV8
 5ys=
X-SBRS: None
X-MesageID: 28283487
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,322,1596513600"; 
   d="scan'208";a="28283487"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 05/11] x86/vioapic: switch to use the EOI callback mechanism
Date: Wed, 30 Sep 2020 12:41:02 +0200
Message-ID: <20200930104108.35969-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200930104108.35969-1-roger.pau@citrix.com>
References: <20200930104108.35969-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Switch the emulated IO-APIC code to use the local APIC EOI callback
mechanism. This allows to remove the last hardcoded callback from
vlapic_handle_EOI. Removing the hardcoded vIO-APIC callback also
allows to getting rid of setting the EOI exit bitmap based on the
triggering mode, as now all users that require an EOI action use the
newly introduced callback mechanism.

Move and rename the vioapic_update_EOI now that it can be made static.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Remove the triggering check in the update_eoi_exit_bitmap call.
 - Register the vlapic callbacks when loading the vIO-APIC state.
 - Reduce scope of ent.
---
 xen/arch/x86/hvm/vioapic.c | 131 ++++++++++++++++++++++++-------------
 xen/arch/x86/hvm/vlapic.c  |   5 +-
 2 files changed, 86 insertions(+), 50 deletions(-)

diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 752fc410db..dce98b1479 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -375,6 +375,50 @@ static const struct hvm_mmio_ops vioapic_mmio_ops = {
     .write = vioapic_write
 };
 
+static void eoi_callback(unsigned int vector, void *data)
+{
+    struct domain *d = current->domain;
+    struct hvm_irq *hvm_irq = hvm_domain_irq(d);
+    unsigned int i;
+
+    ASSERT(has_vioapic(d));
+
+    spin_lock(&d->arch.hvm.irq_lock);
+
+    for ( i = 0; i < d->arch.hvm.nr_vioapics; i++ )
+    {
+        struct hvm_vioapic *vioapic = domain_vioapic(d, i);
+        unsigned int pin;
+
+        for ( pin = 0; pin < vioapic->nr_pins; pin++ )
+        {
+            union vioapic_redir_entry *ent = &vioapic->redirtbl[pin];
+
+            if ( ent->fields.vector != vector )
+                continue;
+
+            ent->fields.remote_irr = 0;
+
+            if ( is_iommu_enabled(d) )
+            {
+                spin_unlock(&d->arch.hvm.irq_lock);
+                hvm_dpci_eoi(vioapic->base_gsi + pin, ent);
+                spin_lock(&d->arch.hvm.irq_lock);
+            }
+
+            if ( (ent->fields.trig_mode == VIOAPIC_LEVEL_TRIG) &&
+                 !ent->fields.mask &&
+                 hvm_irq->gsi_assert_count[vioapic->base_gsi + pin] )
+            {
+                ent->fields.remote_irr = 1;
+                vioapic_deliver(vioapic, pin);
+            }
+        }
+    }
+
+    spin_unlock(&d->arch.hvm.irq_lock);
+}
+
 static void ioapic_inj_irq(
     struct hvm_vioapic *vioapic,
     struct vlapic *target,
@@ -388,7 +432,8 @@ static void ioapic_inj_irq(
     ASSERT((delivery_mode == dest_Fixed) ||
            (delivery_mode == dest_LowestPrio));
 
-    vlapic_set_irq(target, vector, trig_mode);
+    vlapic_set_irq_callback(target, vector, trig_mode,
+                            trig_mode ? eoi_callback : NULL, NULL);
 }
 
 static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
@@ -495,50 +540,6 @@ void vioapic_irq_positive_edge(struct domain *d, unsigned int irq)
     }
 }
 
-void vioapic_update_EOI(unsigned int vector)
-{
-    struct domain *d = current->domain;
-    struct hvm_irq *hvm_irq = hvm_domain_irq(d);
-    union vioapic_redir_entry *ent;
-    unsigned int i;
-
-    ASSERT(has_vioapic(d));
-
-    spin_lock(&d->arch.hvm.irq_lock);
-
-    for ( i = 0; i < d->arch.hvm.nr_vioapics; i++ )
-    {
-        struct hvm_vioapic *vioapic = domain_vioapic(d, i);
-        unsigned int pin;
-
-        for ( pin = 0; pin < vioapic->nr_pins; pin++ )
-        {
-            ent = &vioapic->redirtbl[pin];
-            if ( ent->fields.vector != vector )
-                continue;
-
-            ent->fields.remote_irr = 0;
-
-            if ( is_iommu_enabled(d) )
-            {
-                spin_unlock(&d->arch.hvm.irq_lock);
-                hvm_dpci_eoi(vioapic->base_gsi + pin, ent);
-                spin_lock(&d->arch.hvm.irq_lock);
-            }
-
-            if ( (ent->fields.trig_mode == VIOAPIC_LEVEL_TRIG) &&
-                 !ent->fields.mask &&
-                 hvm_irq->gsi_assert_count[vioapic->base_gsi + pin] )
-            {
-                ent->fields.remote_irr = 1;
-                vioapic_deliver(vioapic, pin);
-            }
-        }
-    }
-
-    spin_unlock(&d->arch.hvm.irq_lock);
-}
-
 int vioapic_get_mask(const struct domain *d, unsigned int gsi)
 {
     unsigned int pin = 0; /* See gsi_vioapic */
@@ -592,6 +593,8 @@ static int ioapic_save(struct vcpu *v, hvm_domain_context_t *h)
 static int ioapic_load(struct domain *d, hvm_domain_context_t *h)
 {
     struct hvm_vioapic *s;
+    unsigned int i;
+    int rc;
 
     if ( !has_vioapic(d) )
         return -ENODEV;
@@ -602,7 +605,43 @@ static int ioapic_load(struct domain *d, hvm_domain_context_t *h)
          d->arch.hvm.nr_vioapics != 1 )
         return -EOPNOTSUPP;
 
-    return hvm_load_entry(IOAPIC, h, &s->domU);
+    rc = hvm_load_entry(IOAPIC, h, &s->domU);
+    if ( rc )
+        return rc;
+
+    for ( i = 0; i < ARRAY_SIZE(s->domU.redirtbl); i++ )
+    {
+        const union vioapic_redir_entry *ent = &s->domU.redirtbl[i];
+        unsigned int vector = ent->fields.vector;
+        unsigned int delivery_mode = ent->fields.delivery_mode;
+        struct vcpu *v;
+
+        /*
+         * Add a callback for each possible vector injected by a redirection
+         * entry.
+         */
+        if ( vector < 16 || !ent->fields.remote_irr ||
+             (delivery_mode != dest_LowestPrio && delivery_mode != dest_Fixed) )
+            continue;
+
+        for_each_vcpu ( d, v )
+        {
+            struct vlapic *vlapic = vcpu_vlapic(v);
+
+            /*
+             * NB: if the vlapic registers where restored before the vio-apic
+             * ones we could test whether the vector is set in the vlapic IRR
+             * or ISR registers before unconditionally setting the callback.
+             * This is harmless as eoi_callback is capable of dealing with
+             * spurious callbacks.
+             */
+            if ( vlapic_match_dest(vlapic, NULL, 0, ent->fields.dest_id,
+                                   ent->fields.dest_mode) )
+                vlapic_set_callback(vlapic, vector, eoi_callback, NULL);
+        }
+    }
+
+    return 0;
 }
 
 HVM_REGISTER_SAVE_RESTORE(IOAPIC, ioapic_save, ioapic_load, 1, HVMSR_PER_DOM);
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 8a18b33428..35f12e0909 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -189,7 +189,7 @@ void vlapic_set_irq_callback(struct vlapic *vlapic, uint8_t vec, uint8_t trig,
 
     if ( hvm_funcs.update_eoi_exit_bitmap )
         alternative_vcall(hvm_funcs.update_eoi_exit_bitmap, target, vec,
-                          trig || callback);
+                          callback);
 
     if ( hvm_funcs.deliver_posted_intr )
         alternative_vcall(hvm_funcs.deliver_posted_intr, target, vec);
@@ -493,9 +493,6 @@ void vlapic_handle_EOI(struct vlapic *vlapic, u8 vector)
     unsigned long flags;
     unsigned int index = vector - 16;
 
-    if ( vlapic_test_vector(vector, &vlapic->regs->data[APIC_TMR]) )
-        vioapic_update_EOI(vector);
-
     spin_lock_irqsave(&vlapic->callback_lock, flags);
     callback = vlapic->callbacks[index].callback;
     vlapic->callbacks[index].callback = NULL;
-- 
2.28.0


