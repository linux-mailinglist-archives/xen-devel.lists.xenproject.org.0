Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E9B2C6681
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 14:13:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39280.72121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kidZB-0006a7-Fj; Fri, 27 Nov 2020 13:13:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39280.72121; Fri, 27 Nov 2020 13:13:37 +0000
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
	id 1kidZB-0006Zi-CH; Fri, 27 Nov 2020 13:13:37 +0000
Received: by outflank-mailman (input) for mailman id 39280;
 Fri, 27 Nov 2020 13:13:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N/b8=FB=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
 id 1kidZ9-0006Zc-WC
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 13:13:36 +0000
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c07cea4a-6c41-4386-94b8-96cb46dddb46;
 Fri, 27 Nov 2020 13:13:34 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
 by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id
 0ARDDTrD023694
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
 Fri, 27 Nov 2020 14:13:30 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
 id 487CE2E9CAC; Fri, 27 Nov 2020 14:13:24 +0100 (MET)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=N/b8=FB=antioche.eu.org=bouyer@srs-us1.protection.inumbo.net>)
	id 1kidZ9-0006Zc-WC
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 13:13:36 +0000
X-Inumbo-ID: c07cea4a-6c41-4386-94b8-96cb46dddb46
Received: from chassiron.antioche.eu.org (unknown [2001:41d0:fe9d:1101::1])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id c07cea4a-6c41-4386-94b8-96cb46dddb46;
	Fri, 27 Nov 2020 13:13:34 +0000 (UTC)
Received: from sandettie.soc.lip6.fr (82-64-3-41.subs.proxad.net [82.64.3.41])
	by chassiron.antioche.eu.org (8.15.2/8.15.2) with ESMTPS id 0ARDDTrD023694
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Fri, 27 Nov 2020 14:13:30 +0100 (MET)
Received: by sandettie.soc.lip6.fr (Postfix, from userid 373)
	id 487CE2E9CAC; Fri, 27 Nov 2020 14:13:24 +0100 (MET)
Date: Fri, 27 Nov 2020 14:13:24 +0100
From: Manuel Bouyer <bouyer@antioche.eu.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        xen-devel@lists.xenproject.org
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
Message-ID: <20201127131324.GJ1717@antioche.eu.org>
References: <20201124150842.GN2020@antioche.eu.org>
 <20201124154917.l3jwa6w4ejumjuqw@Air-de-Roger>
 <20201124160914.GQ2020@antioche.eu.org>
 <20201126133444.r2oi24i3umh7shb3@Air-de-Roger>
 <20201126141608.GA4123@antioche.eu.org>
 <20201126142635.uzi643co3mxp5h42@Air-de-Roger>
 <20201126150937.jhbfp7iefkmtedx7@Air-de-Roger>
 <20201126172034.GA7642@antioche.eu.org>
 <20201127105948.ji5gxv4e7axrvgpo@Air-de-Roger>
 <e9610278-84e5-dc32-b568-8867011de4e4@suse.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="dTy3Mrz/UPE2dbVg"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e9610278-84e5-dc32-b568-8867011de4e4@suse.com>
X-Greylist: Sender succeeded STARTTLS authentication, not delayed by milter-greylist-4.4.3 (chassiron.antioche.eu.org [151.127.5.145]); Fri, 27 Nov 2020 14:13:30 +0100 (MET)


--dTy3Mrz/UPE2dbVg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Nov 27, 2020 at 12:29:35PM +0100, Jan Beulich wrote:
> On 27.11.2020 11:59, Roger Pau Monné wrote:
> > --- a/xen/arch/x86/hvm/irq.c
> > +++ b/xen/arch/x86/hvm/irq.c
> > @@ -187,6 +187,10 @@ void hvm_gsi_assert(struct domain *d, unsigned int gsi)
> >       * to know if the GSI is pending or not.
> >       */
> >      spin_lock(&d->arch.hvm.irq_lock);
> > +    if ( gsi == TRACK_IRQ )
> > +        debugtrace_printk("hvm_gsi_assert irq %u trig %u assert count %u\n",
> > +                          gsi, trig, hvm_irq->gsi_assert_count[gsi]);
> 
> This produces
> 
> 81961 hvm_gsi_assert irq 34 trig 1 assert count 1
> 
> Since the logging occurs ahead of the call to assert_gsi(), it
> means we don't signal anything to Dom0, because according to our
> records there's still an IRQ in flight. Unfortunately we only
> see the tail of the trace, so it's not possible to tell how / when
> we got into this state.
> 
> Manuel - is this the only patch you have in place? Or did you keep
> any prior ones? Iirc there once was one where Roger also suppressed
> some de-assert call.

Yes, I have some of the previous patches (otherwise Xen panics).
Attached is the diffs I currently have 

-- 
Manuel Bouyer <bouyer@antioche.eu.org>
     NetBSD: 26 ans d'experience feront toujours la difference
--

--dTy3Mrz/UPE2dbVg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="xen.diff"

diff --git a/xen/arch/x86/hvm/irq.c b/xen/arch/x86/hvm/irq.c
index 38ac5fb6c7..9db3dcc957 100644
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -187,6 +187,10 @@ void hvm_gsi_assert(struct domain *d, unsigned int gsi)
      * to know if the GSI is pending or not.
      */
     spin_lock(&d->arch.hvm.irq_lock);
+    if ( gsi == TRACK_IRQ )
+        debugtrace_printk("hvm_gsi_assert irq %u trig %u assert count %u\n",
+                          gsi, trig, hvm_irq->gsi_assert_count[gsi]);
+
     if ( trig == VIOAPIC_EDGE_TRIG || !hvm_irq->gsi_assert_count[gsi] )
     {
         if ( trig == VIOAPIC_LEVEL_TRIG )
diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 67d4a6237f..e6748e0649 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -257,7 +257,11 @@ static void vioapic_write_redirent(
         vlapic_adjust_i8259_target(d);
     }
     else if ( ent.fields.trig_mode == VIOAPIC_EDGE_TRIG )
+    {
+        if ( gsi == TRACK_IRQ )
+            debugtrace_printk("vIO-APIC set edge trigger irq %u\n", gsi);
         pent->fields.remote_irr = 0;
+    }
     else if ( !ent.fields.mask &&
               !ent.fields.remote_irr &&
               hvm_irq->gsi_assert_count[idx] )
@@ -278,6 +282,10 @@ static void vioapic_write_redirent(
          */
         int ret = vioapic_hwdom_map_gsi(gsi, ent.fields.trig_mode,
                                         ent.fields.polarity);
+
+        if ( gsi == TRACK_IRQ )
+            debugtrace_printk("vIO-APIC UNMASK irq %u\n", gsi);
+
         if ( ret )
         {
             gprintk(XENLOG_ERR,
@@ -285,6 +293,9 @@ static void vioapic_write_redirent(
             unmasked = 0;
         }
     }
+    else if ( is_hardware_domain(d) && gsi == TRACK_IRQ )
+        debugtrace_printk("vIO-APIC MASK irq %u\n", gsi);
+
 
     if ( gsi == 0 || unmasked )
         pt_may_unmask_irq(d, NULL);
@@ -405,6 +416,10 @@ static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
 
     ASSERT(spin_is_locked(&d->arch.hvm.irq_lock));
 
+    if ( irq == TRACK_IRQ )
+            debugtrace_printk("vIO-APIC deliver irq %u vector %u\n",
+                              irq, vector);
+
     HVM_DBG_LOG(DBG_LEVEL_IOAPIC,
                 "dest=%x dest_mode=%x delivery_mode=%x "
                 "vector=%x trig_mode=%x",
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index e66fa99ec7..c28025657d 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -1641,6 +1641,9 @@ static void mask_and_ack_level_ioapic_irq(struct irq_desc *desc)
     unsigned long v;
     int i;
 
+    if ( desc->irq == TRACK_IRQ )
+        debugtrace_printk("ACK irq %u\n", desc->irq);
+
     irq_complete_move(desc);
 
     if ( !directed_eoi_enabled )
@@ -1688,6 +1691,9 @@ static void mask_and_ack_level_ioapic_irq(struct irq_desc *desc)
 
 static void end_level_ioapic_irq_old(struct irq_desc *desc, u8 vector)
 {
+    if ( desc->irq == TRACK_IRQ )
+        debugtrace_printk("END irq %u\n", desc->irq);
+
     if ( directed_eoi_enabled )
     {
         if ( !(desc->status & (IRQ_DISABLED|IRQ_MOVE_PENDING)) )
diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index 93c4fb9a79..c3a75d98a7 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -1109,6 +1109,10 @@ static void irq_guest_eoi_timer_fn(void *data)
     unsigned int i, irq = desc - irq_desc;
     irq_guest_action_t *action;
 
+    if ( desc->irq == TRACK_IRQ )
+        debugtrace_printk("irq_guest_eoi_timer_fn irq %u status %x\n",
+                          desc->irq, desc->status);
+
     spin_lock_irq(&desc->lock);
     
     if ( !(desc->status & IRQ_GUEST) )
@@ -1118,6 +1122,10 @@ static void irq_guest_eoi_timer_fn(void *data)
 
     ASSERT(action->ack_type != ACKTYPE_NONE);
 
+    if ( desc->irq == TRACK_IRQ )
+        debugtrace_printk("ack_type %u in_flight %u\n",
+                          action->ack_type, action->in_flight);
+
     /*
      * Is no IRQ in flight at all, or another instance of this timer already
      * running? Skip everything to avoid forcing an EOI early.
@@ -1837,6 +1845,12 @@ static void do_IRQ_guest(struct irq_desc *desc, unsigned int vector)
     unsigned int        i;
     struct pending_eoi *peoi = this_cpu(pending_eoi);
 
+    if ( desc->irq == TRACK_IRQ )
+        debugtrace_printk("do_IRQ_guest irq %u nr_guests %u ack_type %u in_flight %u\n",
+                          desc->irq, action->nr_guests, action->ack_type,
+                          action->in_flight);
+
+
     if ( unlikely(!action->nr_guests) )
     {
         /* An interrupt may slip through while freeing an ACKTYPE_EOI irq. */
diff --git a/xen/drivers/passthrough/io.c b/xen/drivers/passthrough/io.c
index 6b1305a3e5..86c2db9da0 100644
--- a/xen/drivers/passthrough/io.c
+++ b/xen/drivers/passthrough/io.c
@@ -174,7 +174,6 @@ static void pt_irq_time_out(void *data)
          * In the identity mapped case the EOI can also be done now, this way
          * the iteration over the list of domain pirqs is avoided.
          */
-        hvm_gsi_deassert(irq_map->dom, dpci_pirq(irq_map)->pirq);
         irq_map->flags |= HVM_IRQ_DPCI_EOI_LATCH;
         pt_irq_guest_eoi(irq_map->dom, irq_map, NULL);
         spin_unlock(&irq_map->dom->event_lock);
@@ -828,6 +827,9 @@ int hvm_do_IRQ_dpci(struct domain *d, struct pirq *pirq)
          !pirq_dpci || !(pirq_dpci->flags & HVM_IRQ_DPCI_MAPPED) )
         return 0;
 
+    if ( pirq->pirq == TRACK_IRQ )
+        debugtrace_printk("hvm_do_IRQ_dpci irq %u\n", pirq->pirq);
+
     pirq_dpci->masked = 1;
     raise_softirq_for(pirq_dpci);
     return 1;
@@ -1010,6 +1012,9 @@ void hvm_dpci_eoi(struct domain *d, unsigned int guest_gsi,
     if ( !is_iommu_enabled(d) )
         return;
 
+    if ( guest_gsi == TRACK_IRQ )
+        debugtrace_printk("hvm_dpci_eoi irq %u\n", guest_gsi);
+
     if ( is_hardware_domain(d) )
     {
         spin_lock(&d->event_lock);
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 64dd0a929c..3eb6102a61 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -370,7 +370,7 @@ static int msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
 
             entry->updated = false;
         }
-        else
+        else if ( msix->enabled )
             vpci_msix_arch_mask_entry(entry, pdev, entry->masked);
 
         break;
diff --git a/xen/include/xen/irq.h b/xen/include/xen/irq.h
index 43d567fe44..871810134f 100644
--- a/xen/include/xen/irq.h
+++ b/xen/include/xen/irq.h
@@ -174,4 +174,6 @@ unsigned int arch_hwdom_irqs(domid_t);
 void arch_evtchn_bind_pirq(struct domain *, int pirq);
 #endif
 
+#define TRACK_IRQ 34
+
 #endif /* __XEN_IRQ_H__ */

--dTy3Mrz/UPE2dbVg--

