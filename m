Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7665927E6E2
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 12:42:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554.1931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNZYZ-0001c1-CE; Wed, 30 Sep 2020 10:41:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554.1931; Wed, 30 Sep 2020 10:41:55 +0000
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
	id 1kNZYZ-0001ai-3l; Wed, 30 Sep 2020 10:41:55 +0000
Received: by outflank-mailman (input) for mailman id 554;
 Wed, 30 Sep 2020 10:41:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=153E=DH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kNZYX-0000jt-GJ
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 10:41:53 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 92d92120-ad95-43a9-8df3-5bdbda8f0752;
 Wed, 30 Sep 2020 10:41:37 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=153E=DH=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
	id 1kNZYX-0000jt-GJ
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 10:41:53 +0000
X-Inumbo-ID: 92d92120-ad95-43a9-8df3-5bdbda8f0752
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 92d92120-ad95-43a9-8df3-5bdbda8f0752;
	Wed, 30 Sep 2020 10:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1601462497;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YvWR66vXENt4dXadQOccItvi0fqHZ4YQsWtAm6/3iIg=;
  b=KZQw4UrBQmTYOJoKjb4ukHNyGvLoDqxfsQogIRf1ZIGR7zQLBjLTyh9s
   g6MWg+mSeeehUjyq1RszWRDAvzKbWz2jDPRoAxF24fNuY0YnjZctAzpnU
   PG/gVfXDE4YEDFsMixzKxjXUea8hWWd/pmJpYNu7Lq2/7U40wPT96/b/s
   M=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: w3aRJGMM9yGW2qZvpt0FrU58tBPV9LHmi9f125yKBzdiS+pnF7e44ulXUWi7TGfdxUKzKSlCA+
 uWPLFIu2rtT3OyxqHgEtlmLO15ahH9czwqhMY6CytIj6ZYeVVkRbPB2QCxG2E86/aQSHm1iqmw
 ZKc05mHX28Jfa71VcEHfkyRA5K/CLSk9pKeDHZROtRZTeuzHaFtL1X5tOxDPRJzzSraNJhsQbn
 1t66EFleVZA516O9PaeeRnPYwGHLqLKSdSMz+fgxD/uT8yAhDgBElIxSf41NJEsMNE+bTpqgXI
 1xg=
X-SBRS: None
X-MesageID: 28223127
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,322,1596513600"; 
   d="scan'208";a="28223127"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 11/11] x86/vpt: introduce a per-vPT lock
Date: Wed, 30 Sep 2020 12:41:08 +0200
Message-ID: <20200930104108.35969-12-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200930104108.35969-1-roger.pau@citrix.com>
References: <20200930104108.35969-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Introduce a per virtual timer lock that replaces the existing per-vCPU
and per-domain vPT locks. Since virtual timers are no longer assigned
or migrated between vCPUs the locking can be simplified to a
in-structure spinlock that protects all the fields.

This requires introducing a helper to initialize the spinlock, and
that could be used to initialize other virtual timer fields in the
future.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in his version.
---
 xen/arch/x86/emul-i8254.c     |  1 +
 xen/arch/x86/hvm/hpet.c       |  8 +++++-
 xen/arch/x86/hvm/hvm.c        |  2 --
 xen/arch/x86/hvm/rtc.c        |  1 +
 xen/arch/x86/hvm/vlapic.c     |  1 +
 xen/arch/x86/hvm/vpt.c        | 48 +++++++++++++++--------------------
 xen/include/asm-x86/hvm/vpt.h |  9 ++-----
 7 files changed, 33 insertions(+), 37 deletions(-)

diff --git a/xen/arch/x86/emul-i8254.c b/xen/arch/x86/emul-i8254.c
index 73be4188ad..a47138cbab 100644
--- a/xen/arch/x86/emul-i8254.c
+++ b/xen/arch/x86/emul-i8254.c
@@ -484,6 +484,7 @@ void pit_init(struct domain *d, unsigned long cpu_khz)
     {
         register_portio_handler(d, PIT_BASE, 4, handle_pit_io);
         register_portio_handler(d, 0x61, 1, handle_speaker_io);
+        init_periodic_timer(&pit->pt0);
     }
 
     pit_reset(d);
diff --git a/xen/arch/x86/hvm/hpet.c b/xen/arch/x86/hvm/hpet.c
index ca94e8b453..20593c3862 100644
--- a/xen/arch/x86/hvm/hpet.c
+++ b/xen/arch/x86/hvm/hpet.c
@@ -739,12 +739,18 @@ static void hpet_set(HPETState *h)
 
 void hpet_init(struct domain *d)
 {
+    HPETState *h = domain_vhpet(d);
+    unsigned int i;
+
     if ( !has_vhpet(d) )
         return;
 
-    hpet_set(domain_vhpet(d));
+    hpet_set(h);
     register_mmio_handler(d, &hpet_mmio_ops);
     d->arch.hvm.params[HVM_PARAM_HPET_ENABLED] = 1;
+
+    for ( i = 0; i < HPET_TIMER_NUM; i++ )
+        init_periodic_timer(&h->pt[i]);
 }
 
 void hpet_deinit(struct domain *d)
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index 5a0448aa13..7cb4511b60 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -665,8 +665,6 @@ int hvm_domain_initialise(struct domain *d)
     /* need link to containing domain */
     d->arch.hvm.pl_time->domain = d;
 
-    rwlock_init(&d->arch.hvm.pl_time->pt_migrate);
-
     /* Set the default IO Bitmap. */
     if ( is_hardware_domain(d) )
     {
diff --git a/xen/arch/x86/hvm/rtc.c b/xen/arch/x86/hvm/rtc.c
index 3150f5f147..2d540b16ac 100644
--- a/xen/arch/x86/hvm/rtc.c
+++ b/xen/arch/x86/hvm/rtc.c
@@ -846,6 +846,7 @@ void rtc_init(struct domain *d)
     init_timer(&s->update_timer, rtc_update_timer, s, smp_processor_id());
     init_timer(&s->update_timer2, rtc_update_timer2, s, smp_processor_id());
     init_timer(&s->alarm_timer, rtc_alarm_cb, s, smp_processor_id());
+    init_periodic_timer(&s->pt);
 
     register_portio_handler(d, RTC_PORT(0), 2, handle_rtc_io);
 
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 9afcb239af..fa40fca6c9 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1642,6 +1642,7 @@ int vlapic_init(struct vcpu *v)
         return 0;
     }
 
+    init_periodic_timer(&vlapic->pt);
     vlapic->pt.source = PTSRC_lapic;
 
     if (vlapic->regs_page == NULL)
diff --git a/xen/arch/x86/hvm/vpt.c b/xen/arch/x86/hvm/vpt.c
index 76ace8da80..47bd3285e1 100644
--- a/xen/arch/x86/hvm/vpt.c
+++ b/xen/arch/x86/hvm/vpt.c
@@ -126,23 +126,6 @@ static int pt_irq_masked(struct periodic_time *pt)
     return 1;
 }
 
-static void pt_lock(struct periodic_time *pt)
-{
-    /*
-     * We cannot use pt_vcpu_lock here, because we need to acquire the
-     * per-domain lock first and then (re-)fetch the value of pt->vcpu, or
-     * else we might be using a stale value of pt->vcpu.
-     */
-    read_lock(&pt->vcpu->domain->arch.hvm.pl_time->pt_migrate);
-    spin_lock(&pt->vcpu->arch.hvm.tm_lock);
-}
-
-static void pt_unlock(struct periodic_time *pt)
-{
-    spin_unlock(&pt->vcpu->arch.hvm.tm_lock);
-    read_unlock(&pt->vcpu->domain->arch.hvm.pl_time->pt_migrate);
-}
-
 static void pt_process_missed_ticks(struct periodic_time *pt)
 {
     s_time_t missed_ticks, now = NOW();
@@ -224,7 +207,7 @@ static void pt_timer_fn(void *data)
     void *cb_priv;
     unsigned int irq;
 
-    pt_lock(pt);
+    spin_lock(&pt->lock);
 
     v = pt->vcpu;
     irq = pt->irq;
@@ -240,7 +223,7 @@ static void pt_timer_fn(void *data)
         cb_priv = pt->priv;
     }
 
-    pt_unlock(pt);
+    spin_unlock(&pt->lock);
 
     if ( cb )
         cb(v, cb_priv);
@@ -257,7 +240,7 @@ static void eoi_callback(unsigned int unused, void *data)
     time_cb *cb = NULL;
     void *cb_priv;
 
-    pt_lock(pt);
+    spin_lock(&pt->lock);
 
     pt_irq_fired(pt->vcpu, pt);
     if ( pt->pending_intr_nr )
@@ -272,7 +255,7 @@ static void eoi_callback(unsigned int unused, void *data)
         }
     }
 
-    pt_unlock(pt);
+    spin_unlock(&pt->lock);
 
     if ( cb != NULL )
         cb(v, cb_priv);
@@ -320,6 +303,11 @@ static bool inject_interrupt(struct periodic_time *pt)
     return true;
 }
 
+void init_periodic_timer(struct periodic_time *pt)
+{
+    spin_lock_init(&pt->lock);
+}
+
 void create_periodic_time(
     struct vcpu *v, struct periodic_time *pt, uint64_t delta,
     uint64_t period, uint8_t irq, time_cb *cb, void *data, bool level)
@@ -336,7 +324,7 @@ void create_periodic_time(
 
     destroy_periodic_time(pt);
 
-    write_lock(&v->domain->arch.hvm.pl_time->pt_migrate);
+    spin_lock(&pt->lock);
 
     pt->pending_intr_nr = 0;
     pt->masked = false;
@@ -400,18 +388,21 @@ void create_periodic_time(
     init_timer(&pt->timer, pt_timer_fn, pt, v->processor);
     set_timer(&pt->timer, pt->scheduled);
 
-    write_unlock(&v->domain->arch.hvm.pl_time->pt_migrate);
+    spin_unlock(&pt->lock);
 }
 
 void destroy_periodic_time(struct periodic_time *pt)
 {
     unsigned int gsi;
 
+    spin_lock(&pt->lock);
     /* Was this structure previously initialised by create_periodic_time()? */
     if ( pt->vcpu == NULL )
+    {
+        spin_unlock(&pt->lock);
         return;
+    }
 
-    pt_lock(pt);
     pt->pending_intr_nr = 0;
     pt->masked = false;
 
@@ -425,7 +416,7 @@ void destroy_periodic_time(struct periodic_time *pt)
         hvm_gsi_unregister_callback(pt->vcpu->domain, gsi, &pt->eoi_cb);
         break;
     }
-    pt_unlock(pt);
+    spin_unlock(&pt->lock);
 
     /*
      * pt_timer_fn() can run until this kill_timer() returns. We must do this
@@ -440,10 +431,13 @@ static void pt_resume(struct periodic_time *pt)
     time_cb *cb = NULL;
     void *cb_priv;
 
+    spin_lock(&pt->lock);
     if ( pt->vcpu == NULL )
+    {
+        spin_unlock(&pt->lock);
         return;
+    }
 
-    pt_lock(pt);
     if ( pt->pending_intr_nr && pt->masked && inject_interrupt(pt) )
     {
         pt->pending_intr_nr--;
@@ -452,7 +446,7 @@ static void pt_resume(struct periodic_time *pt)
         v = pt->vcpu;
         pt->masked = false;
     }
-    pt_unlock(pt);
+    spin_unlock(&pt->lock);
 
     if ( cb )
         cb(v, cb_priv);
diff --git a/xen/include/asm-x86/hvm/vpt.h b/xen/include/asm-x86/hvm/vpt.h
index 7c0322727b..75e0526b17 100644
--- a/xen/include/asm-x86/hvm/vpt.h
+++ b/xen/include/asm-x86/hvm/vpt.h
@@ -49,6 +49,7 @@ struct periodic_time {
     time_cb *cb;
     void *priv;                 /* point back to platform time source */
     struct hvm_gsi_eoi_callback eoi_cb; /* EOI callback registration data */
+    spinlock_t lock;
 };
 
 
@@ -127,13 +128,6 @@ struct pl_time {    /* platform time */
     struct RTCState  vrtc;
     struct HPETState vhpet;
     struct PMTState  vpmt;
-    /*
-     * rwlock to prevent periodic_time vCPU migration. Take the lock in read
-     * mode in order to prevent the vcpu field of periodic_time from changing.
-     * Lock must be taken in write mode when changes to the vcpu field are
-     * performed, as it allows exclusive access to all the timers of a domain.
-     */
-    rwlock_t pt_migrate;
     /* guest_time = Xen sys time + stime_offset */
     int64_t stime_offset;
     /* Ensures monotonicity in appropriate timer modes. */
@@ -168,6 +162,7 @@ void create_periodic_time(
     struct vcpu *v, struct periodic_time *pt, uint64_t delta,
     uint64_t period, uint8_t irq, time_cb *cb, void *data, bool level);
 void destroy_periodic_time(struct periodic_time *pt);
+void init_periodic_timer(struct periodic_time *pt);
 
 int pv_pit_handler(int port, int data, int write);
 void pit_reset(struct domain *d);
-- 
2.28.0


