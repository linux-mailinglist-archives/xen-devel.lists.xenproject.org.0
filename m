Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC62E27E6DF
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 12:41:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551.1894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNZYL-0001Db-TZ; Wed, 30 Sep 2020 10:41:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551.1894; Wed, 30 Sep 2020 10:41:41 +0000
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
	id 1kNZYL-0001Bf-GM; Wed, 30 Sep 2020 10:41:41 +0000
Received: by outflank-mailman (input) for mailman id 551;
 Wed, 30 Sep 2020 10:41:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=153E=DH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kNZYI-0000iF-Tb
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 10:41:38 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 41ba6611-f026-4934-bde1-b8631de6b9b7;
 Wed, 30 Sep 2020 10:41:33 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=153E=DH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kNZYI-0000iF-Tb
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 10:41:38 +0000
X-Inumbo-ID: 41ba6611-f026-4934-bde1-b8631de6b9b7
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 41ba6611-f026-4934-bde1-b8631de6b9b7;
	Wed, 30 Sep 2020 10:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601462493;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AXRusoM/eH/cMUYE2cWE9twKM1F6iziT2wUzM4YQ1XM=;
  b=XH8XTJL0rS/H1KXtJASQRy1XOwefHW/IP0RDpV6acM8ocWp0cLURxWiK
   xQLtRLAijYpx/AnXC/H75Yj+r6UeFLpvYJ8hDky7WXDmFChuINaYhfZg8
   ifwLxjhnujNIUBU9JTCBNty4jfkfetCOgDCdgPKVKjeAR3HuIENdEQxzn
   A=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: NjV7scSq3YsOUudpATyOV3iABqMLAICASCxGpBBrHImuyOzsZuGn7Fc4RgAPm9TV+j83A15tnD
 YlTDWolI1nVT6RmtPj6U4Or0srhig5B4ZpmfxUJ1WnoCspWA1Gi9H8vE+v2SyC1lN/S9JotGv4
 ToOyEBL9LfTZWZqVLrGX9y5y4vhkt7oMpRCMymiqSw8a2P0MmPGSY92lKjzK4f+6IiJksxWti9
 jT3kNT+ZlM4mzTbM824k6lc41L/4zplF3jxjnw5zpdKMmqyhVpakomT4ogbUjUQx+iDDxaJNF4
 zmM=
X-SBRS: None
X-MesageID: 28960245
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,322,1596513600"; 
   d="scan'208";a="28960245"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Jun Nakajima
	<jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v2 09/11] x86/vpt: switch interrupt injection model
Date: Wed, 30 Sep 2020 12:41:06 +0200
Message-ID: <20200930104108.35969-10-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200930104108.35969-1-roger.pau@citrix.com>
References: <20200930104108.35969-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Currently vPT relies on timers being assigned to a vCPU and performing
checks on every return to HVM guest in order to check if an interrupt
from a vPT timer assigned to the vCPU is currently being injected.

This model doesn't work properly since the interrupt destination vCPU
of a vPT timer can be different from the vCPU where the timer is
currently assigned, in which case the timer would get stuck because it
never sees the interrupt as being injected.

Knowing when a vPT interrupt is injected is relevant for the guest
timer modes where missed vPT interrupts are not discarded and instead
are accumulated and injected when possible.

This change aims to modify the logic described above, so that vPT
doesn't need to check on every return to HVM guest if a vPT interrupt
is being injected. In order to achieve this the vPT code is modified
to make use of the new EOI callbacks, so that virtual timers can
detect when a interrupt has been serviced by the guest by waiting for
the EOI callback to execute.

This model also simplifies some of the logic, as when executing the
timer EOI callback Xen can try to inject another interrupt if the
timer has interrupts pending for delivery.

Note that timers are still bound to a vCPU for the time being, this
relation however doesn't limit the interrupt destination anymore, and
will be removed by further patches.

This model has been tested with Windows 7 guests without showing any
timer delay, even when the guest was limited to have very little CPU
capacity and pending virtual timer interrupts accumulate.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version.
---
Sorry, this is a big change, but I'm having issues splitting it into
smaller pieces as the functionality needs to be changed in one go, or
else timers would be broken.

If this approach seems sensible I can try to split it up.
---
 xen/arch/x86/hvm/svm/intr.c   |   3 -
 xen/arch/x86/hvm/vmx/intr.c   |  59 ------
 xen/arch/x86/hvm/vpt.c        | 326 ++++++++++++++--------------------
 xen/include/asm-x86/hvm/vpt.h |   5 +-
 4 files changed, 135 insertions(+), 258 deletions(-)

diff --git a/xen/arch/x86/hvm/svm/intr.c b/xen/arch/x86/hvm/svm/intr.c
index 7f815d2307..2ee2332253 100644
--- a/xen/arch/x86/hvm/svm/intr.c
+++ b/xen/arch/x86/hvm/svm/intr.c
@@ -146,8 +146,6 @@ void svm_intr_assist(void)
         return;
 
     /* Crank the handle on interrupt state. */
-    pt_update_irq(v);
-
     do {
         intack = hvm_vcpu_has_pending_irq(v);
         if ( likely(intack.source == hvm_intsrc_none) )
@@ -219,7 +217,6 @@ void svm_intr_assist(void)
     {
         HVMTRACE_2D(INJ_VIRQ, intack.vector, /*fake=*/ 0);
         svm_inject_extint(v, intack.vector);
-        pt_intr_post(v, intack);
     }
 
     /* Is there another IRQ to queue up behind this one? */
diff --git a/xen/arch/x86/hvm/vmx/intr.c b/xen/arch/x86/hvm/vmx/intr.c
index 80bfbb4787..3fcc7073db 100644
--- a/xen/arch/x86/hvm/vmx/intr.c
+++ b/xen/arch/x86/hvm/vmx/intr.c
@@ -203,7 +203,6 @@ static int nvmx_intr_intercept(struct vcpu *v, struct hvm_intack intack)
             {
                 /* for now, duplicate the ack path in vmx_intr_assist */
                 hvm_vcpu_ack_pending_irq(v, intack);
-                pt_intr_post(v, intack);
 
                 intack = hvm_vcpu_has_pending_irq(v);
                 if ( unlikely(intack.source != hvm_intsrc_none) )
@@ -242,7 +241,6 @@ void vmx_intr_assist(void)
     struct vcpu *v = current;
     unsigned int tpr_threshold = 0;
     enum hvm_intblk intblk;
-    int pt_vector;
 
     /* Block event injection when single step with MTF. */
     if ( unlikely(v->arch.hvm.single_step) )
@@ -263,8 +261,6 @@ void vmx_intr_assist(void)
 #endif
 
     /* Crank the handle on interrupt state. */
-    pt_vector = pt_update_irq(v);
-
     do {
         unsigned long intr_info;
 
@@ -337,58 +333,6 @@ void vmx_intr_assist(void)
     {
         unsigned long status;
 
-       /*
-        * intack.vector is the highest priority vector. So we set eoi_exit_bitmap
-        * for intack.vector - give a chance to post periodic time interrupts when
-        * periodic time interrupts become the highest one
-        */
-        if ( pt_vector != -1 )
-        {
-#ifndef NDEBUG
-            /*
-             * We assert that intack.vector is the highest priority vector for
-             * only an interrupt from vlapic can reach this point and the
-             * highest vector is chosen in hvm_vcpu_has_pending_irq().
-             * But, in fact, the assertion failed sometimes. It is suspected
-             * that PIR is not synced to vIRR which makes pt_vector is left in
-             * PIR. In order to verify this suspicion, dump some information
-             * when the assertion fails.
-             */
-            if ( unlikely(intack.vector < pt_vector) )
-            {
-                const struct vlapic *vlapic;
-                const struct pi_desc *pi_desc;
-                const uint32_t *word;
-                unsigned int i;
-
-                printk(XENLOG_ERR "%pv: intack: %u:%02x pt: %02x\n",
-                       current, intack.source, intack.vector, pt_vector);
-
-                vlapic = vcpu_vlapic(v);
-                if ( vlapic && vlapic->regs )
-                {
-                    word = (const void *)&vlapic->regs->data[APIC_IRR];
-                    printk(XENLOG_ERR "vIRR:");
-                    for ( i = X86_NR_VECTORS / 32; i-- ; )
-                        printk(" %08x", word[i*4]);
-                    printk("\n");
-                }
-
-                pi_desc = &v->arch.hvm.vmx.pi_desc;
-                if ( pi_desc )
-                {
-                    word = (const void *)&pi_desc->pir;
-                    printk(XENLOG_ERR " PIR:");
-                    for ( i = X86_NR_VECTORS / 32; i-- ; )
-                        printk(" %08x", word[i]);
-                    printk("\n");
-                }
-            }
-#endif
-            ASSERT(intack.vector >= pt_vector);
-            vmx_set_eoi_exit_bitmap(v, intack.vector);
-        }
-
         /* we need update the RVI field */
         __vmread(GUEST_INTR_STATUS, &status);
         status &= ~VMX_GUEST_INTR_STATUS_SUBFIELD_BITMASK;
@@ -397,14 +341,11 @@ void vmx_intr_assist(void)
         __vmwrite(GUEST_INTR_STATUS, status);
 
         vmx_sync_exit_bitmap(v);
-
-        pt_intr_post(v, intack);
     }
     else
     {
         HVMTRACE_2D(INJ_VIRQ, intack.vector, /*fake=*/ 0);
         vmx_inject_extint(intack.vector, intack.source);
-        pt_intr_post(v, intack);
     }
 
     /* Is there another IRQ to queue up behind this one? */
diff --git a/xen/arch/x86/hvm/vpt.c b/xen/arch/x86/hvm/vpt.c
index 867deb4da5..787931d7bb 100644
--- a/xen/arch/x86/hvm/vpt.c
+++ b/xen/arch/x86/hvm/vpt.c
@@ -27,6 +27,8 @@
 #define mode_is(d, name) \
     ((d)->arch.hvm.params[HVM_PARAM_TIMER_MODE] == HVMPTM_##name)
 
+static bool inject_interrupt(struct periodic_time *pt);
+
 void hvm_init_guest_time(struct domain *d)
 {
     struct pl_time *pl = d->arch.hvm.pl_time;
@@ -76,35 +78,6 @@ void hvm_set_guest_time(struct vcpu *v, u64 guest_time)
     }
 }
 
-static int pt_irq_vector(struct periodic_time *pt, enum hvm_intsrc src)
-{
-    struct vcpu *v = pt->vcpu;
-    unsigned int gsi, isa_irq;
-    int vector;
-
-    if ( pt->source == PTSRC_lapic )
-        return pt->irq;
-
-    isa_irq = pt->irq;
-
-    if ( src == hvm_intsrc_pic )
-        return (v->domain->arch.hvm.vpic[isa_irq >> 3].irq_base
-                + (isa_irq & 7));
-
-    ASSERT(src == hvm_intsrc_lapic);
-    gsi = pt->source == PTSRC_isa ? hvm_isa_irq_to_gsi(isa_irq) : pt->irq;
-    vector = vioapic_get_vector(v->domain, gsi);
-    if ( vector < 0 )
-    {
-        dprintk(XENLOG_WARNING, "d%u: invalid GSI (%u) for platform timer\n",
-                v->domain->domain_id, gsi);
-        domain_crash(v->domain);
-        return -1;
-    }
-
-    return vector;
-}
-
 static int pt_irq_masked(struct periodic_time *pt)
 {
     struct vcpu *v = pt->vcpu;
@@ -247,34 +220,14 @@ void pt_restore_timer(struct vcpu *v)
     pt_vcpu_lock(v);
 
     list_for_each_entry ( pt, head, list )
-    {
         if ( pt->pending_intr_nr == 0 )
-        {
-            pt_process_missed_ticks(pt);
             set_timer(&pt->timer, pt->scheduled);
-        }
-    }
 
     pt_thaw_time(v);
 
     pt_vcpu_unlock(v);
 }
 
-static void pt_timer_fn(void *data)
-{
-    struct periodic_time *pt = data;
-
-    pt_lock(pt);
-
-    pt->pending_intr_nr++;
-    pt->scheduled += pt->period;
-    pt->do_not_freeze = 0;
-
-    vcpu_kick(pt->vcpu);
-
-    pt_unlock(pt);
-}
-
 static void pt_irq_fired(struct vcpu *v, struct periodic_time *pt)
 {
     pt->irq_issued = false;
@@ -285,89 +238,108 @@ static void pt_irq_fired(struct vcpu *v, struct periodic_time *pt)
             list_del(&pt->list);
         pt->on_list = false;
         pt->pending_intr_nr = 0;
+
+        return;
     }
-    else if ( mode_is(v->domain, one_missed_tick_pending) ||
-              mode_is(v->domain, no_missed_ticks_pending) )
+
+    if ( mode_is(v->domain, one_missed_tick_pending) ||
+         mode_is(v->domain, no_missed_ticks_pending) )
     {
-        pt->last_plt_gtime = hvm_get_guest_time(v);
         pt_process_missed_ticks(pt);
         pt->pending_intr_nr = 0; /* 'collapse' all missed ticks */
+    }
+    else if ( !pt->pending_intr_nr )
+        pt_process_missed_ticks(pt);
+
+    if ( !pt->pending_intr_nr )
         set_timer(&pt->timer, pt->scheduled);
+}
+
+static void pt_timer_fn(void *data)
+{
+    struct periodic_time *pt = data;
+    struct vcpu *v;
+    time_cb *cb = NULL;
+    void *cb_priv;
+    unsigned int irq;
+
+    pt_lock(pt);
+
+    v = pt->vcpu;
+    irq = pt->irq;
+
+    if ( inject_interrupt(pt) )
+    {
+        pt->scheduled += pt->period;
+        pt->do_not_freeze = 0;
+        cb = pt->cb;
+        cb_priv = pt->priv;
     }
     else
     {
-        pt->last_plt_gtime += pt->period;
-        if ( --pt->pending_intr_nr == 0 )
-        {
-            pt_process_missed_ticks(pt);
-            if ( pt->pending_intr_nr == 0 )
-                set_timer(&pt->timer, pt->scheduled);
-        }
+        /* Masked. */
+        if ( pt->on_list )
+            list_del(&pt->list);
+        pt->on_list = false;
+        pt->pending_intr_nr++;
     }
 
-    if ( mode_is(v->domain, delay_for_missed_ticks) &&
-         (hvm_get_guest_time(v) < pt->last_plt_gtime) )
-        hvm_set_guest_time(v, pt->last_plt_gtime);
+    pt_unlock(pt);
+
+    if ( cb )
+        cb(v, cb_priv);
 }
 
-int pt_update_irq(struct vcpu *v)
+/*
+ * The same callback is shared between LAPIC and PIC/IO-APIC based timers, as
+ * we ignore the first parameter that's different between them.
+ */
+static void eoi_callback(unsigned int unused, void *data)
 {
-    struct list_head *head = &v->arch.hvm.tm_list;
-    struct periodic_time *pt, *temp, *earliest_pt;
-    uint64_t max_lag;
-    int irq, pt_vector = -1;
-    bool level;
+    struct periodic_time *pt = data;
+    struct vcpu *v;
+    time_cb *cb = NULL;
+    void *cb_priv;
 
-    pt_vcpu_lock(v);
+    pt_lock(pt);
 
-    earliest_pt = NULL;
-    max_lag = -1ULL;
-    list_for_each_entry_safe ( pt, temp, head, list )
+    pt_irq_fired(pt->vcpu, pt);
+    if ( pt->pending_intr_nr )
     {
-        if ( pt->pending_intr_nr )
+        if ( inject_interrupt(pt) )
+        {
+            pt->pending_intr_nr--;
+            cb = pt->cb;
+            cb_priv = pt->priv;
+            v = pt->vcpu;
+        }
+        else
         {
-            /* RTC code takes care of disabling the timer itself. */
-            if ( (pt->irq != RTC_IRQ || !pt->priv) && pt_irq_masked(pt) &&
-                 /* Level interrupts should be asserted even if masked. */
-                 !pt->level )
-            {
-                /* suspend timer emulation */
+            /* Masked. */
+            if ( pt->on_list )
                 list_del(&pt->list);
-                pt->on_list = 0;
-            }
-            else
-            {
-                if ( (pt->last_plt_gtime + pt->period) < max_lag )
-                {
-                    max_lag = pt->last_plt_gtime + pt->period;
-                    earliest_pt = pt;
-                }
-            }
+            pt->on_list = false;
         }
     }
 
-    if ( earliest_pt == NULL )
-    {
-        pt_vcpu_unlock(v);
-        return -1;
-    }
+    pt_unlock(pt);
 
-    earliest_pt->irq_issued = 1;
-    irq = earliest_pt->irq;
-    level = earliest_pt->level;
+    if ( cb != NULL )
+        cb(v, cb_priv);
+}
 
-    pt_vcpu_unlock(v);
+static bool inject_interrupt(struct periodic_time *pt)
+{
+    struct vcpu *v = pt->vcpu;
+    unsigned int irq = pt->irq;
 
-    switch ( earliest_pt->source )
+    if ( pt_irq_masked(pt) )
+        return false;
+
+    switch ( pt->source )
     {
     case PTSRC_lapic:
-        /*
-         * If periodic timer interrupt is handled by lapic, its vector in
-         * IRR is returned and used to set eoi_exit_bitmap for virtual
-         * interrupt delivery case. Otherwise return -1 to do nothing.
-         */
-        vlapic_set_irq(vcpu_vlapic(v), irq, 0);
-        pt_vector = irq;
+        vlapic_set_irq_callback(vcpu_vlapic(v), pt->irq, 0, eoi_callback, pt);
         break;
 
     case PTSRC_isa:
@@ -376,98 +348,26 @@ int pt_update_irq(struct vcpu *v)
              v->domain->arch.hvm.vpic[irq >> 3].int_output )
             hvm_isa_irq_assert(v->domain, irq, NULL);
         else
-        {
-            pt_vector = hvm_isa_irq_assert(v->domain, irq, vioapic_get_vector);
-            /*
-             * hvm_isa_irq_assert may not set the corresponding bit in vIRR
-             * when mask field of IOAPIC RTE is set. Check it again.
-             */
-            if ( pt_vector < 0 || !vlapic_test_irq(vcpu_vlapic(v), pt_vector) )
-                pt_vector = -1;
-        }
+            hvm_isa_irq_assert(v->domain, irq, vioapic_get_vector);
         break;
 
     case PTSRC_ioapic:
-        pt_vector = hvm_ioapic_assert(v->domain, irq, level);
-        if ( pt_vector < 0 || !vlapic_test_irq(vcpu_vlapic(v), pt_vector) )
-        {
-            pt_vector = -1;
-            if ( level )
-            {
-                /*
-                 * Level interrupts are always asserted because the pin assert
-                 * count is incremented regardless of whether the pin is masked
-                 * or the vector latched in IRR, so also execute the callback
-                 * associated with the timer.
-                 */
-                time_cb *cb = NULL;
-                void *cb_priv;
-
-                pt_vcpu_lock(v);
-                /* Make sure the timer is still on the list. */
-                list_for_each_entry ( pt, &v->arch.hvm.tm_list, list )
-                    if ( pt == earliest_pt )
-                    {
-                        pt_irq_fired(v, pt);
-                        cb = pt->cb;
-                        cb_priv = pt->priv;
-                        break;
-                    }
-                pt_vcpu_unlock(v);
-
-                if ( cb != NULL )
-                    cb(v, cb_priv);
-            }
-        }
+        hvm_ioapic_assert(v->domain, irq, pt->level);
         break;
     }
 
-    return pt_vector;
-}
-
-static struct periodic_time *is_pt_irq(
-    struct vcpu *v, struct hvm_intack intack)
-{
-    struct list_head *head = &v->arch.hvm.tm_list;
-    struct periodic_time *pt;
-
-    list_for_each_entry ( pt, head, list )
-    {
-        if ( pt->pending_intr_nr && pt->irq_issued &&
-             (intack.vector == pt_irq_vector(pt, intack.source)) )
-            return pt;
-    }
-
-    return NULL;
-}
-
-void pt_intr_post(struct vcpu *v, struct hvm_intack intack)
-{
-    struct periodic_time *pt;
-    time_cb *cb;
-    void *cb_priv;
-
-    if ( intack.source == hvm_intsrc_vector )
-        return;
-
-    pt_vcpu_lock(v);
-
-    pt = is_pt_irq(v, intack);
-    if ( pt == NULL )
-    {
-        pt_vcpu_unlock(v);
-        return;
-    }
-
-    pt_irq_fired(v, pt);
-
-    cb = pt->cb;
-    cb_priv = pt->priv;
+    /* Update time when an interrupt is injected. */
+    if ( mode_is(v->domain, one_missed_tick_pending) ||
+         mode_is(v->domain, no_missed_ticks_pending) )
+        pt->last_plt_gtime = hvm_get_guest_time(v);
+    else
+        pt->last_plt_gtime += pt->period;
 
-    pt_vcpu_unlock(v);
+    if ( mode_is(v->domain, delay_for_missed_ticks) &&
+         hvm_get_guest_time(v) < pt->last_plt_gtime )
+        hvm_set_guest_time(v, pt->last_plt_gtime);
 
-    if ( cb != NULL )
-        cb(v, cb_priv);
+    return true;
 }
 
 void pt_migrate(struct vcpu *v)
@@ -543,6 +443,24 @@ void create_periodic_time(
     pt->cb = cb;
     pt->priv = data;
 
+    switch ( pt->source )
+    {
+        int rc;
+
+    case PTSRC_isa:
+        irq = hvm_isa_irq_to_gsi(irq);
+        /* fallthrough */
+    case PTSRC_ioapic:
+        pt->eoi_cb.callback = eoi_callback;
+        pt->eoi_cb.data = pt;
+        rc = hvm_gsi_register_callback(v->domain, irq, &pt->eoi_cb);
+        if ( rc )
+            gdprintk(XENLOG_WARNING,
+                     "unable to register callback for timer GSI %u: %d\n",
+                     irq, rc);
+        break;
+    }
+
     pt->on_list = 1;
     list_add(&pt->list, &v->arch.hvm.tm_list);
 
@@ -554,6 +472,8 @@ void create_periodic_time(
 
 void destroy_periodic_time(struct periodic_time *pt)
 {
+    unsigned int gsi;
+
     /* Was this structure previously initialised by create_periodic_time()? */
     if ( pt->vcpu == NULL )
         return;
@@ -563,6 +483,17 @@ void destroy_periodic_time(struct periodic_time *pt)
         list_del(&pt->list);
     pt->on_list = 0;
     pt->pending_intr_nr = 0;
+
+    gsi = pt->irq;
+    switch ( pt->source )
+    {
+    case PTSRC_isa:
+        gsi = hvm_isa_irq_to_gsi(pt->irq);
+        /* fallthrough */
+    case PTSRC_ioapic:
+        hvm_gsi_unregister_callback(pt->vcpu->domain, gsi, &pt->eoi_cb);
+        break;
+    }
     pt_unlock(pt);
 
     /*
@@ -617,20 +548,29 @@ void pt_adjust_global_vcpu_target(struct vcpu *v)
     write_unlock(&pl_time->vhpet.lock);
 }
 
-
 static void pt_resume(struct periodic_time *pt)
 {
+    struct vcpu *v;
+    time_cb *cb = NULL;
+    void *cb_priv;
+
     if ( pt->vcpu == NULL )
         return;
 
     pt_lock(pt);
-    if ( pt->pending_intr_nr && !pt->on_list )
+    if ( pt->pending_intr_nr && !pt->on_list && inject_interrupt(pt) )
     {
+        pt->pending_intr_nr--;
+        cb = pt->cb;
+        cb_priv = pt->priv;
+        v = pt->vcpu;
         pt->on_list = 1;
         list_add(&pt->list, &pt->vcpu->arch.hvm.tm_list);
-        vcpu_kick(pt->vcpu);
     }
     pt_unlock(pt);
+
+    if ( cb )
+        cb(v, cb_priv);
 }
 
 void pt_may_unmask_irq(struct domain *d, struct periodic_time *vlapic_pt)
diff --git a/xen/include/asm-x86/hvm/vpt.h b/xen/include/asm-x86/hvm/vpt.h
index 39d26cbda4..9440fe4ac7 100644
--- a/xen/include/asm-x86/hvm/vpt.h
+++ b/xen/include/asm-x86/hvm/vpt.h
@@ -23,6 +23,7 @@
 #include <xen/list.h>
 #include <xen/rwlock.h>
 #include <asm/hvm/hvm.h>
+#include <asm/hvm/irq.h>
 
 /*
  * Abstract layer of periodic time, one short time.
@@ -50,6 +51,7 @@ struct periodic_time {
     struct timer timer;         /* ac_timer */
     time_cb *cb;
     void *priv;                 /* point back to platform time source */
+    struct hvm_gsi_eoi_callback eoi_cb; /* EOI callback registration data */
 };
 
 
@@ -145,9 +147,6 @@ struct pl_time {    /* platform time */
 
 void pt_save_timer(struct vcpu *v);
 void pt_restore_timer(struct vcpu *v);
-int pt_update_irq(struct vcpu *v);
-struct hvm_intack;
-void pt_intr_post(struct vcpu *v, struct hvm_intack intack);
 void pt_migrate(struct vcpu *v);
 
 void pt_adjust_global_vcpu_target(struct vcpu *v);
-- 
2.28.0


