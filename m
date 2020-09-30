Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BD227E6E1
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 12:41:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.553.1918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNZYU-0001Uf-S3; Wed, 30 Sep 2020 10:41:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 553.1918; Wed, 30 Sep 2020 10:41:50 +0000
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
	id 1kNZYU-0001Tn-Le; Wed, 30 Sep 2020 10:41:50 +0000
Received: by outflank-mailman (input) for mailman id 553;
 Wed, 30 Sep 2020 10:41:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=153E=DH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kNZYS-0000jt-G2
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 10:41:48 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ce739a4e-8819-4411-a58e-cff60caf160b;
 Wed, 30 Sep 2020 10:41:35 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=153E=DH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kNZYS-0000jt-G2
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 10:41:48 +0000
X-Inumbo-ID: ce739a4e-8819-4411-a58e-cff60caf160b
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id ce739a4e-8819-4411-a58e-cff60caf160b;
	Wed, 30 Sep 2020 10:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601462495;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u0qlvgEoh18Z1ueoenyGkoQGiMXqtDDyv8+pdlc35lA=;
  b=QIjKsRqJGscvnj44aQ0PV2quTtavIxDW/bQP8+ivBuN9OZcXlaskGCH1
   s7BdGPFisUVmMOoTr/mzBD5SL0XfY5C+cLgcstFjkMsLjF8UEvQHPYI/Y
   mGvATAeMBG05NvkbZiXgIGpn/X6Y0ReyhOCqhGfeui0CqecLdl+FUnIWt
   4=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: j6atUa/G02FS5MgB9bqwixp2tW7+OKIdlsMD1t2B2gfoB3F0E8D0P0Nqxq8nFut5lA0vJnDCTG
 gRs47h4l0JBPeS2L0UdCA23qsMNnhhHJ25MwKKBMHewJs2jMlK4o76jcfxzVKCEXbqqO++ERD/
 5k7X78sK1fZmgfDuSBJoDX1GcQyz5Vj40sFg5DLot5BGx4yVjUHIxalPeYb4JWgAs5RJZ9aYfE
 xX/Lf8NpvnB6Z4tEnpCLM+hmBLjVLMjmv4Uoz7KkTrQuFqUYHDf/RGXFiezGNwlLgjEoxZ6Ruf
 PnU=
X-SBRS: None
X-MesageID: 28041988
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,322,1596513600"; 
   d="scan'208";a="28041988"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 10/11] x86/vpt: remove vPT timers per-vCPU lists
Date: Wed, 30 Sep 2020 12:41:07 +0200
Message-ID: <20200930104108.35969-11-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200930104108.35969-1-roger.pau@citrix.com>
References: <20200930104108.35969-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

No longer add vPT timers to lists on specific vCPUs, since there's no
need anymore to check if timer interrupts have been injected on return
to HVM guest.

Such change allows to get rid of virtual timers vCPU migration, and
also cleanup some of the virtual timers fields that are no longer
required.

The model is also slightly different now in that timers are not
stopped when a vCPU is de-scheduled. Such timers will continue
running, and when triggered the function will try to inject the
corresponding interrupt to the guest (which might be different than
the currently running one). Note that the timer triggering when the
guest is no longer running can only happen once, as the timer callback
will not reset the interrupt to fire again. Such resetting if required
will be done by the EOI callback.

Since virtual timers are no longer added to per-VCPU lists when active
a new 'masked' field is added to the structure, to signal whether a
timer has it's interrupt source currently masked.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version.
---
 xen/arch/x86/domain.c          |   2 +-
 xen/arch/x86/hvm/hvm.c         |   2 -
 xen/arch/x86/hvm/vlapic.c      |   1 -
 xen/arch/x86/hvm/vpt.c         | 153 ++++-----------------------------
 xen/include/asm-x86/hvm/vcpu.h |   3 +-
 xen/include/asm-x86/hvm/vpt.h  |   9 +-
 6 files changed, 23 insertions(+), 147 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index e8e91cf080..f373431105 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -1964,7 +1964,7 @@ void context_switch(struct vcpu *prev, struct vcpu *next)
     vpmu_switch_from(prev);
     np2m_schedule(NP2M_SCHEDLE_OUT);
 
-    if ( is_hvm_domain(prevd) && !list_empty(&prev->arch.hvm.tm_list) )
+    if ( is_hvm_domain(prevd) )
         pt_save_timer(prev);
 
     local_irq_disable();
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 9636ac6bf1..5a0448aa13 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -489,7 +489,6 @@ void hvm_set_info_guest(struct vcpu *v)
 void hvm_migrate_timers(struct vcpu *v)
 {
     rtc_migrate_timers(v);
-    pt_migrate(v);
 }
 
 void hvm_migrate_pirq(struct hvm_pirq_dpci *pirq_dpci, const struct vcpu *v)
@@ -1558,7 +1557,6 @@ int hvm_vcpu_initialise(struct vcpu *v)
     hvm_asid_flush_vcpu(v);
 
     spin_lock_init(&v->arch.hvm.tm_lock);
-    INIT_LIST_HEAD(&v->arch.hvm.tm_list);
 
     rc = hvm_vcpu_cacheattr_init(v); /* teardown: vcpu_cacheattr_destroy */
     if ( rc != 0 )
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 35f12e0909..9afcb239af 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1330,7 +1330,6 @@ void vlapic_adjust_i8259_target(struct domain *d)
     if ( d->arch.hvm.i8259_target == v )
         return;
     d->arch.hvm.i8259_target = v;
-    pt_adjust_global_vcpu_target(v);
 }
 
 int vlapic_has_pending_irq(struct vcpu *v)
diff --git a/xen/arch/x86/hvm/vpt.c b/xen/arch/x86/hvm/vpt.c
index 787931d7bb..76ace8da80 100644
--- a/xen/arch/x86/hvm/vpt.c
+++ b/xen/arch/x86/hvm/vpt.c
@@ -126,18 +126,6 @@ static int pt_irq_masked(struct periodic_time *pt)
     return 1;
 }
 
-static void pt_vcpu_lock(struct vcpu *v)
-{
-    read_lock(&v->domain->arch.hvm.pl_time->pt_migrate);
-    spin_lock(&v->arch.hvm.tm_lock);
-}
-
-static void pt_vcpu_unlock(struct vcpu *v)
-{
-    spin_unlock(&v->arch.hvm.tm_lock);
-    read_unlock(&v->domain->arch.hvm.pl_time->pt_migrate);
-}
-
 static void pt_lock(struct periodic_time *pt)
 {
     /*
@@ -151,7 +139,8 @@ static void pt_lock(struct periodic_time *pt)
 
 static void pt_unlock(struct periodic_time *pt)
 {
-    pt_vcpu_unlock(pt->vcpu);
+    spin_unlock(&pt->vcpu->arch.hvm.tm_lock);
+    read_unlock(&pt->vcpu->domain->arch.hvm.pl_time->pt_migrate);
 }
 
 static void pt_process_missed_ticks(struct periodic_time *pt)
@@ -166,9 +155,7 @@ static void pt_process_missed_ticks(struct periodic_time *pt)
         return;
 
     missed_ticks = missed_ticks / (s_time_t) pt->period + 1;
-    if ( mode_is(pt->vcpu->domain, no_missed_ticks_pending) )
-        pt->do_not_freeze = !pt->pending_intr_nr;
-    else
+    if ( !mode_is(pt->vcpu->domain, no_missed_ticks_pending) )
         pt->pending_intr_nr += missed_ticks;
     pt->scheduled += missed_ticks * pt->period;
 }
@@ -195,50 +182,20 @@ static void pt_thaw_time(struct vcpu *v)
 
 void pt_save_timer(struct vcpu *v)
 {
-    struct list_head *head = &v->arch.hvm.tm_list;
-    struct periodic_time *pt;
-
-    if ( v->pause_flags & VPF_blocked )
-        return;
-
-    pt_vcpu_lock(v);
-
-    list_for_each_entry ( pt, head, list )
-        if ( !pt->do_not_freeze )
-            stop_timer(&pt->timer);
 
     pt_freeze_time(v);
-
-    pt_vcpu_unlock(v);
 }
 
 void pt_restore_timer(struct vcpu *v)
 {
-    struct list_head *head = &v->arch.hvm.tm_list;
-    struct periodic_time *pt;
-
-    pt_vcpu_lock(v);
-
-    list_for_each_entry ( pt, head, list )
-        if ( pt->pending_intr_nr == 0 )
-            set_timer(&pt->timer, pt->scheduled);
-
     pt_thaw_time(v);
-
-    pt_vcpu_unlock(v);
 }
 
 static void pt_irq_fired(struct vcpu *v, struct periodic_time *pt)
 {
-    pt->irq_issued = false;
-
     if ( pt->one_shot )
     {
-        if ( pt->on_list )
-            list_del(&pt->list);
-        pt->on_list = false;
         pt->pending_intr_nr = 0;
-
         return;
     }
 
@@ -252,7 +209,11 @@ static void pt_irq_fired(struct vcpu *v, struct periodic_time *pt)
         pt_process_missed_ticks(pt);
 
     if ( !pt->pending_intr_nr )
+    {
+        /* Make sure timer follows vCPU. */
+        migrate_timer(&pt->timer, current->processor);
         set_timer(&pt->timer, pt->scheduled);
+    }
 }
 
 static void pt_timer_fn(void *data)
@@ -268,21 +229,16 @@ static void pt_timer_fn(void *data)
     v = pt->vcpu;
     irq = pt->irq;
 
-    if ( inject_interrupt(pt) )
+    pt->masked = !inject_interrupt(pt);
+    pt->scheduled += pt->period;
+
+    if ( pt->masked )
+        pt->pending_intr_nr++;
+    else
     {
-        pt->scheduled += pt->period;
-        pt->do_not_freeze = 0;
         cb = pt->cb;
         cb_priv = pt->priv;
     }
-    else
-    {
-        /* Masked. */
-        if ( pt->on_list )
-            list_del(&pt->list);
-        pt->on_list = false;
-        pt->pending_intr_nr++;
-    }
 
     pt_unlock(pt);
 
@@ -306,20 +262,14 @@ static void eoi_callback(unsigned int unused, void *data)
     pt_irq_fired(pt->vcpu, pt);
     if ( pt->pending_intr_nr )
     {
-        if ( inject_interrupt(pt) )
+        pt->masked = !inject_interrupt(pt);
+        if ( !pt->masked )
         {
             pt->pending_intr_nr--;
             cb = pt->cb;
             cb_priv = pt->priv;
             v = pt->vcpu;
         }
-        else
-        {
-            /* Masked. */
-            if ( pt->on_list )
-                list_del(&pt->list);
-            pt->on_list = false;
-        }
     }
 
     pt_unlock(pt);
@@ -370,19 +320,6 @@ static bool inject_interrupt(struct periodic_time *pt)
     return true;
 }
 
-void pt_migrate(struct vcpu *v)
-{
-    struct list_head *head = &v->arch.hvm.tm_list;
-    struct periodic_time *pt;
-
-    pt_vcpu_lock(v);
-
-    list_for_each_entry ( pt, head, list )
-        migrate_timer(&pt->timer, v->processor);
-
-    pt_vcpu_unlock(v);
-}
-
 void create_periodic_time(
     struct vcpu *v, struct periodic_time *pt, uint64_t delta,
     uint64_t period, uint8_t irq, time_cb *cb, void *data, bool level)
@@ -402,8 +339,7 @@ void create_periodic_time(
     write_lock(&v->domain->arch.hvm.pl_time->pt_migrate);
 
     pt->pending_intr_nr = 0;
-    pt->do_not_freeze = 0;
-    pt->irq_issued = 0;
+    pt->masked = false;
 
     /* Periodic timer must be at least 0.1ms. */
     if ( (period < 100000) && period )
@@ -461,9 +397,6 @@ void create_periodic_time(
         break;
     }
 
-    pt->on_list = 1;
-    list_add(&pt->list, &v->arch.hvm.tm_list);
-
     init_timer(&pt->timer, pt_timer_fn, pt, v->processor);
     set_timer(&pt->timer, pt->scheduled);
 
@@ -479,10 +412,8 @@ void destroy_periodic_time(struct periodic_time *pt)
         return;
 
     pt_lock(pt);
-    if ( pt->on_list )
-        list_del(&pt->list);
-    pt->on_list = 0;
     pt->pending_intr_nr = 0;
+    pt->masked = false;
 
     gsi = pt->irq;
     switch ( pt->source )
@@ -503,51 +434,6 @@ void destroy_periodic_time(struct periodic_time *pt)
     kill_timer(&pt->timer);
 }
 
-static void pt_adjust_vcpu(struct periodic_time *pt, struct vcpu *v)
-{
-    ASSERT(pt->source == PTSRC_isa || pt->source == PTSRC_ioapic);
-
-    if ( pt->vcpu == NULL )
-        return;
-
-    write_lock(&pt->vcpu->domain->arch.hvm.pl_time->pt_migrate);
-    pt->vcpu = v;
-    if ( pt->on_list )
-    {
-        list_del(&pt->list);
-        list_add(&pt->list, &v->arch.hvm.tm_list);
-        migrate_timer(&pt->timer, v->processor);
-    }
-    write_unlock(&pt->vcpu->domain->arch.hvm.pl_time->pt_migrate);
-}
-
-void pt_adjust_global_vcpu_target(struct vcpu *v)
-{
-    struct PITState *vpit;
-    struct pl_time *pl_time;
-    int i;
-
-    if ( !v || !has_vpit(v->domain) )
-        return;
-
-    vpit = &v->domain->arch.vpit;
-
-    spin_lock(&vpit->lock);
-    pt_adjust_vcpu(&vpit->pt0, v);
-    spin_unlock(&vpit->lock);
-
-    pl_time = v->domain->arch.hvm.pl_time;
-
-    spin_lock(&pl_time->vrtc.lock);
-    pt_adjust_vcpu(&pl_time->vrtc.pt, v);
-    spin_unlock(&pl_time->vrtc.lock);
-
-    write_lock(&pl_time->vhpet.lock);
-    for ( i = 0; i < HPET_TIMER_NUM; i++ )
-        pt_adjust_vcpu(&pl_time->vhpet.pt[i], v);
-    write_unlock(&pl_time->vhpet.lock);
-}
-
 static void pt_resume(struct periodic_time *pt)
 {
     struct vcpu *v;
@@ -558,14 +444,13 @@ static void pt_resume(struct periodic_time *pt)
         return;
 
     pt_lock(pt);
-    if ( pt->pending_intr_nr && !pt->on_list && inject_interrupt(pt) )
+    if ( pt->pending_intr_nr && pt->masked && inject_interrupt(pt) )
     {
         pt->pending_intr_nr--;
         cb = pt->cb;
         cb_priv = pt->priv;
         v = pt->vcpu;
-        pt->on_list = 1;
-        list_add(&pt->list, &pt->vcpu->arch.hvm.tm_list);
+        pt->masked = false;
     }
     pt_unlock(pt);
 
diff --git a/xen/include/asm-x86/hvm/vcpu.h b/xen/include/asm-x86/hvm/vcpu.h
index 5ccd075815..07a9890ed3 100644
--- a/xen/include/asm-x86/hvm/vcpu.h
+++ b/xen/include/asm-x86/hvm/vcpu.h
@@ -166,9 +166,8 @@ struct hvm_vcpu {
     s64                 cache_tsc_offset;
     u64                 guest_time;
 
-    /* Lock and list for virtual platform timers. */
+    /* Lock for virtual platform timers. */
     spinlock_t          tm_lock;
-    struct list_head    tm_list;
 
     bool                flag_dr_dirty;
     bool                debug_state_latch;
diff --git a/xen/include/asm-x86/hvm/vpt.h b/xen/include/asm-x86/hvm/vpt.h
index 9440fe4ac7..7c0322727b 100644
--- a/xen/include/asm-x86/hvm/vpt.h
+++ b/xen/include/asm-x86/hvm/vpt.h
@@ -31,13 +31,10 @@
 typedef void time_cb(struct vcpu *v, void *opaque);
 
 struct periodic_time {
-    struct list_head list;
-    bool on_list;
     bool one_shot;
-    bool do_not_freeze;
-    bool irq_issued;
     bool warned_timeout_too_short;
     bool level;
+    bool masked;
 #define PTSRC_isa    1 /* ISA time source */
 #define PTSRC_lapic  2 /* LAPIC time source */
 #define PTSRC_ioapic 3 /* IOAPIC time source */
@@ -147,9 +144,7 @@ struct pl_time {    /* platform time */
 
 void pt_save_timer(struct vcpu *v);
 void pt_restore_timer(struct vcpu *v);
-void pt_migrate(struct vcpu *v);
 
-void pt_adjust_global_vcpu_target(struct vcpu *v);
 #define pt_global_vcpu_target(d) \
     (is_hvm_domain(d) && (d)->arch.hvm.i8259_target ? \
      (d)->arch.hvm.i8259_target : \
@@ -158,7 +153,7 @@ void pt_adjust_global_vcpu_target(struct vcpu *v);
 void pt_may_unmask_irq(struct domain *d, struct periodic_time *vlapic_pt);
 
 /* Is given periodic timer active? */
-#define pt_active(pt) ((pt)->on_list || (pt)->pending_intr_nr)
+#define pt_active(pt) !(pt)->masked
 
 /*
  * Create/destroy a periodic (or one-shot!) timer.
-- 
2.28.0


