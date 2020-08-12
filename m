Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C892429A6
	for <lists+xen-devel@lfdr.de>; Wed, 12 Aug 2020 14:48:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5qAV-0006cd-Fp; Wed, 12 Aug 2020 12:47:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rOR4=BW=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1k5qAU-0006Z7-48
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2020 12:47:46 +0000
X-Inumbo-ID: 7de72e45-4428-4e23-921a-9cbfaa54810d
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7de72e45-4428-4e23-921a-9cbfaa54810d;
 Wed, 12 Aug 2020 12:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1597236462;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dRrun04ltOsR3Kur95ASzIsUrKz96b+1KdggwxKtE5U=;
 b=fqxQtOZQSYltAN4PGX5EeNGP1cAwMtrt+tDxhHrXg4ORmX0fs4rkqp7Z
 g3TrRCEhIvBPxQzOp3onrXqqTfQbNj8+trVWA1iQN6ZedAvfhZLPzrCSx
 zPIpb2/VcYndvXqEL9FNYJs23Raz32ATLzY8rjckK2AO0XiFSh/CcjS6d s=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: TfO4erpf8SzeMgcK6TRhMjdHaCjmFPBeLC3UsnNZILnzA3uUHzDaw1DlqzdBOL1TRfUS/X0Ekf
 1QPNl1YBGbKh/8r0QJUCUcExYk0cHw3ICzI8zBXUm7QXnO4clBtQDG+iIINhjQ4shatDESnz/X
 ozH/rfpmMNaUaSQxrQ8rXdpofdlDYhT5hulfaoC+8X/f8jhEhqsV/of3bLBUjy9EIcTXuz38Ng
 BthB61aW+a2AaF6eP6XNMEfTZgxYKfKq2rgRKAmtOY9IaqWt8FlssWTzKNrXdIM+m/AowRlryR
 vgw=
X-SBRS: 2.7
X-MesageID: 24374217
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,304,1592884800"; d="scan'208";a="24374217"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 5/5] x86/vioapic: switch to use the EOI callback mechanism
Date: Wed, 12 Aug 2020 14:47:09 +0200
Message-ID: <20200812124709.4165-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200812124709.4165-1-roger.pau@citrix.com>
References: <20200812124709.4165-1-roger.pau@citrix.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Switch the emulated IO-APIC code to use the local APIC EOI callback
mechanism. This allows to remove the last hardcoded callback from
vlapic_handle_EOI.

Move and rename the vioapic_update_EOI now that it can be made static.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/vioapic.c | 90 +++++++++++++++++++-------------------
 xen/arch/x86/hvm/vlapic.c  |  7 +--
 2 files changed, 47 insertions(+), 50 deletions(-)

diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 67d4a6237f..58a85cf9de 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -375,6 +375,50 @@ static const struct hvm_mmio_ops vioapic_mmio_ops = {
     .write = vioapic_write
 };
 
+static void eoi_callback(struct vcpu *v, unsigned int vector, void *data)
+{
+    struct domain *d = v->domain;
+    struct hvm_irq *hvm_irq = hvm_domain_irq(d);
+    union vioapic_redir_entry *ent;
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
+            ent = &vioapic->redirtbl[pin];
+            if ( ent->fields.vector != vector )
+                continue;
+
+            ent->fields.remote_irr = 0;
+
+            if ( is_iommu_enabled(d) )
+            {
+                spin_unlock(&d->arch.hvm.irq_lock);
+                hvm_dpci_eoi(d, vioapic->base_gsi + pin, ent);
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
@@ -495,49 +540,6 @@ void vioapic_irq_positive_edge(struct domain *d, unsigned int irq)
     }
 }
 
-void vioapic_update_EOI(struct domain *d, u8 vector)
-{
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
-                hvm_dpci_eoi(d, vioapic->base_gsi + pin, ent);
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
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 701ff942e6..129b20ff10 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -483,22 +483,17 @@ void vlapic_EOI_set(struct vlapic *vlapic)
 
 void vlapic_handle_EOI(struct vlapic *vlapic, u8 vector)
 {
-    struct vcpu *v = vlapic_vcpu(vlapic);
-    struct domain *d = v->domain;
     vlapic_eoi_callback_t *callback;
     void *data;
     unsigned long flags;
 
-    if ( vlapic_test_vector(vector, &vlapic->regs->data[APIC_TMR]) )
-        vioapic_update_EOI(d, vector);
-
     spin_lock_irqsave(&vlapic->callback_lock, flags);
     callback = vlapic->callbacks[vector].callback;
     data = vlapic->callbacks[vector].data;
     spin_unlock_irqrestore(&vlapic->callback_lock, flags);
 
     if ( callback )
-        callback(v, vector, data);
+        callback(vlapic_vcpu(vlapic), vector, data);
 }
 
 static bool_t is_multicast_dest(struct vlapic *vlapic, unsigned int short_hand,
-- 
2.28.0


