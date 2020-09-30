Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0847E27E6D9
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 12:41:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544.1811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNZY4-0000kf-NI; Wed, 30 Sep 2020 10:41:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544.1811; Wed, 30 Sep 2020 10:41:24 +0000
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
	id 1kNZY4-0000kB-Jj; Wed, 30 Sep 2020 10:41:24 +0000
Received: by outflank-mailman (input) for mailman id 544;
 Wed, 30 Sep 2020 10:41:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=153E=DH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kNZY3-0000jt-I3
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 10:41:23 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 13a25e1f-195c-429f-bbd3-1758a77a7428;
 Wed, 30 Sep 2020 10:41:21 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=153E=DH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kNZY3-0000jt-I3
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 10:41:23 +0000
X-Inumbo-ID: 13a25e1f-195c-429f-bbd3-1758a77a7428
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 13a25e1f-195c-429f-bbd3-1758a77a7428;
	Wed, 30 Sep 2020 10:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601462481;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H93v5+W6I9NV1BORO9ZmkIbG80M9Qh7C0z46DFkAKa0=;
  b=FLezvlqy26w9xHBu0V93WTpZZ5a0Zg/17iocYV0S8/hdosAkXJbqNcMc
   Z5ElxomxtRkiqOIYPsNW33S6scmKV+NbPGadSEhgo0oweWTCrbla1hh1e
   OQgmu+r9aA3EeFJpk+bFUncpSREhJxmtT1y6wFsK9u10pfUNu4qgwy1fA
   0=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: joPNBrV9dk8Rx4MW40YH3ivXnpl4KduRRZkPjSL8QDX27Kxy7jtX0slRBLxZO68xzP+J80GJDd
 j+CstnA3Pt7R5o4ktEuE1wiyHt7n+GkW+nQFh1wHX46+5QKxiR0etcxYcxfDprjZMgAV2SkpGM
 n420wASsgyt0/R+AE+ete2mANQos/vXvYy2/m1oQ8SakymUn06ototzXZ4S92IcjTITJclWPTG
 F1bIhJUinbGjWAW9jbTvtt0G3TcFhxiXiK93L9r6k0I+WR1725lP6K/dfveVPtsXbTZPPH6qFq
 Zew=
X-SBRS: None
X-MesageID: 28960234
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,322,1596513600"; 
   d="scan'208";a="28960234"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 03/11] x86/vlapic: introduce an EOI callback mechanism
Date: Wed, 30 Sep 2020 12:41:00 +0200
Message-ID: <20200930104108.35969-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200930104108.35969-1-roger.pau@citrix.com>
References: <20200930104108.35969-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Add a new vlapic_set_irq_callback helper in order to inject a vector
and set a callback to be executed when the guest performs the end of
interrupt acknowledgment.

Such functionality will be used to migrate the current ad hoc handling
done in vlapic_handle_EOI for the vectors that require some logic to
be executed when the end of interrupt is performed.

No current users are migrated to use this new functionality yet, so
not functional change expected as a result.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Make vlapic_set_irq an inline function on the header.
 - Clear the callback hook in vlapic_handle_EOI.
 - Introduce a helper to set the callback without injecting a vector.
 - Remove unneeded parentheses.
 - Reduce callback table by 16.
 - Use %pv to print domain/vcpu ID.
---
RFC: should callbacks also be executed in vlapic_do_init (which is
called by vlapic_reset). We would need to make sure ISR and IRR
are cleared using some kind of test and clear atomic functionality to
make this race free.
---
 xen/arch/x86/hvm/vlapic.c        | 62 ++++++++++++++++++++++++++++++--
 xen/include/asm-x86/hvm/vlapic.h | 18 +++++++++-
 2 files changed, 77 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index ae737403f3..38c62a02e6 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -144,7 +144,32 @@ bool vlapic_test_irq(const struct vlapic *vlapic, uint8_t vec)
     return vlapic_test_vector(vec, &vlapic->regs->data[APIC_IRR]);
 }
 
-void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec, uint8_t trig)
+void vlapic_set_callback(struct vlapic *vlapic, unsigned int vec,
+                         vlapic_eoi_callback_t *callback, void *data)
+{
+    unsigned long flags;
+    unsigned int index = vec - 16;
+
+    if ( !callback || vec < 16 || vec >= X86_NR_VECTORS )
+    {
+        ASSERT_UNREACHABLE();
+        return;
+    }
+
+    spin_lock_irqsave(&vlapic->callback_lock, flags);
+    if ( vlapic->callbacks[index].callback &&
+         vlapic->callbacks[index].callback != callback )
+        printk(XENLOG_G_WARNING
+               "%pv overriding vector %#x callback %ps (%p) with %ps (%p)\n",
+               vlapic_vcpu(vlapic), vec, vlapic->callbacks[index].callback,
+               vlapic->callbacks[index].callback, callback, callback);
+    vlapic->callbacks[index].callback = callback;
+    vlapic->callbacks[index].data = data;
+    spin_unlock_irqrestore(&vlapic->callback_lock, flags);
+}
+
+void vlapic_set_irq_callback(struct vlapic *vlapic, uint8_t vec, uint8_t trig,
+                             vlapic_eoi_callback_t *callback, void *data)
 {
     struct vcpu *target = vlapic_vcpu(vlapic);
 
@@ -159,8 +184,12 @@ void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec, uint8_t trig)
     else
         vlapic_clear_vector(vec, &vlapic->regs->data[APIC_TMR]);
 
+    if ( callback )
+        vlapic_set_callback(vlapic, vec, callback, data);
+
     if ( hvm_funcs.update_eoi_exit_bitmap )
-        alternative_vcall(hvm_funcs.update_eoi_exit_bitmap, target, vec, trig);
+        alternative_vcall(hvm_funcs.update_eoi_exit_bitmap, target, vec,
+                          trig || callback);
 
     if ( hvm_funcs.deliver_posted_intr )
         alternative_vcall(hvm_funcs.deliver_posted_intr, target, vec);
@@ -459,10 +488,24 @@ void vlapic_EOI_set(struct vlapic *vlapic)
 
 void vlapic_handle_EOI(struct vlapic *vlapic, u8 vector)
 {
+    vlapic_eoi_callback_t *callback;
+    void *data;
+    unsigned long flags;
+    unsigned int index = vector - 16;
+
     if ( vlapic_test_vector(vector, &vlapic->regs->data[APIC_TMR]) )
         vioapic_update_EOI(vector);
 
     hvm_dpci_msi_eoi(vector);
+
+    spin_lock_irqsave(&vlapic->callback_lock, flags);
+    callback = vlapic->callbacks[index].callback;
+    vlapic->callbacks[index].callback = NULL;
+    data = vlapic->callbacks[index].data;
+    spin_unlock_irqrestore(&vlapic->callback_lock, flags);
+
+    if ( callback )
+        callback(vector, data);
 }
 
 static bool_t is_multicast_dest(struct vlapic *vlapic, unsigned int short_hand,
@@ -1629,9 +1672,23 @@ int vlapic_init(struct vcpu *v)
     }
     clear_page(vlapic->regs);
 
+    if ( !vlapic->callbacks )
+    {
+        vlapic->callbacks = xmalloc_array(typeof(*vlapic->callbacks),
+                                          X86_NR_VECTORS - 16);
+        if ( !vlapic->callbacks )
+        {
+            dprintk(XENLOG_ERR, "%pv: alloc vlapic callbacks error\n", v);
+            return -ENOMEM;
+        }
+    }
+    memset(vlapic->callbacks, 0, sizeof(*vlapic->callbacks) *
+                                 (X86_NR_VECTORS - 16));
+
     vlapic_reset(vlapic);
 
     spin_lock_init(&vlapic->esr_lock);
+    spin_lock_init(&vlapic->callback_lock);
 
     tasklet_init(&vlapic->init_sipi.tasklet, vlapic_init_sipi_action, v);
 
@@ -1653,6 +1710,7 @@ void vlapic_destroy(struct vcpu *v)
     destroy_periodic_time(&vlapic->pt);
     unmap_domain_page_global(vlapic->regs);
     free_domheap_page(vlapic->regs_page);
+    XFREE(vlapic->callbacks);
 }
 
 /*
diff --git a/xen/include/asm-x86/hvm/vlapic.h b/xen/include/asm-x86/hvm/vlapic.h
index 8f908928c3..c380127a71 100644
--- a/xen/include/asm-x86/hvm/vlapic.h
+++ b/xen/include/asm-x86/hvm/vlapic.h
@@ -73,6 +73,8 @@
 #define vlapic_clear_vector(vec, bitmap)                                \
     clear_bit(VEC_POS(vec), (uint32_t *)((bitmap) + REG_POS(vec)))
 
+typedef void vlapic_eoi_callback_t(unsigned int vector, void *data);
+
 struct vlapic {
     struct hvm_hw_lapic      hw;
     struct hvm_hw_lapic_regs *regs;
@@ -89,6 +91,11 @@ struct vlapic {
         uint32_t             icr, dest;
         struct tasklet       tasklet;
     } init_sipi;
+    struct {
+        vlapic_eoi_callback_t *callback;
+        void                 *data;
+    } *callbacks;
+    spinlock_t               callback_lock;
 };
 
 /* vlapic's frequence is 100 MHz */
@@ -111,7 +118,16 @@ void vlapic_reg_write(struct vcpu *v, unsigned int reg, uint32_t val);
 bool_t is_vlapic_lvtpc_enabled(struct vlapic *vlapic);
 
 bool vlapic_test_irq(const struct vlapic *vlapic, uint8_t vec);
-void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec, uint8_t trig);
+void vlapic_set_callback(struct vlapic *vlapic, unsigned int vec,
+                         vlapic_eoi_callback_t *callback, void *data);
+void vlapic_set_irq_callback(struct vlapic *vlapic, uint8_t vec, uint8_t trig,
+                             vlapic_eoi_callback_t *callback, void *data);
+
+static inline void vlapic_set_irq(struct vlapic *vlapic, uint8_t vec,
+                                  uint8_t trig)
+{
+    vlapic_set_irq_callback(vlapic, vec, trig, NULL, NULL);
+}
 
 int vlapic_has_pending_irq(struct vcpu *v);
 int vlapic_ack_pending_irq(struct vcpu *v, int vector, bool_t force_ack);
-- 
2.28.0


