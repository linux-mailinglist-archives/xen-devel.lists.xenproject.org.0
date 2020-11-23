Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E65952C0A6D
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 14:29:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34293.65236 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khBu5-0007rs-J5; Mon, 23 Nov 2020 13:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34293.65236; Mon, 23 Nov 2020 13:29:13 +0000
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
	id 1khBu5-0007rU-Fn; Mon, 23 Nov 2020 13:29:13 +0000
Received: by outflank-mailman (input) for mailman id 34293;
 Mon, 23 Nov 2020 13:29:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khBu3-0007rB-J7
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:29:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 21a62d6e-6f53-4610-ab6f-f624c3a00f84;
 Mon, 23 Nov 2020 13:29:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 53929ACC6;
 Mon, 23 Nov 2020 13:29:08 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khBu3-0007rB-J7
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 13:29:11 +0000
X-Inumbo-ID: 21a62d6e-6f53-4610-ab6f-f624c3a00f84
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 21a62d6e-6f53-4610-ab6f-f624c3a00f84;
	Mon, 23 Nov 2020 13:29:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606138148; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zYGWGZcvIzB6bNUNFtqGuAY55PoIprvcCYGCok4/knU=;
	b=LLiVfDZn/mJAL9+XMS8xT1a12vtyga7qtUil+/B5bvVJd2yDK2ik02gomF/qPYU3NWiKKU
	QJ9tCCH9ejw7rPCuHA08NZ/e/XMMzX4bjlUxR5z321usgemvqHtFa61kQSwzq01pdnjLQb
	r5zQmn6Zeu+Q3AeYH3N0f6dLboZoc5U=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 53929ACC6;
	Mon, 23 Nov 2020 13:29:08 +0000 (UTC)
Subject: [PATCH v3 4/5] evtchn: convert domain event lock to an r/w one
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <9d7a052a-6222-80ff-cbf1-612d4ca50c2a@suse.com>
Message-ID: <a333387e-f9e5-7051-569a-1a9a37da53ca@suse.com>
Date: Mon, 23 Nov 2020 14:29:07 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <9d7a052a-6222-80ff-cbf1-612d4ca50c2a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Especially for the use in evtchn_move_pirqs() (called when moving a vCPU
across pCPU-s) and the ones in EOI handling in PCI pass-through code,
serializing perhaps an entire domain isn't helpful when no state (which
isn't e.g. further protected by the per-channel lock) changes.

Unfortunately this implies dropping of lock profiling for this lock,
until r/w locks may get enabled for such functionality.

While ->notify_vcpu_id is now meant to be consistently updated with the
per-channel lock held, an extension applies to ECS_PIRQ: The field is
also guaranteed to not change with the per-domain event lock held for
writing. Therefore the link_pirq_port() call from evtchn_bind_pirq()
could in principle be moved out of the per-channel locked regions, but
this further code churn didn't seem worth it.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Re-base.
v2: Consistently lock for writing in evtchn_reset(). Fix error path in
    pci_clean_dpci_irqs(). Lock for writing in pt_irq_time_out(),
    hvm_dirq_assist(), hvm_dpci_eoi(), and hvm_dpci_isairq_eoi(). Move
    rw_barrier() introduction here. Re-base over changes earlier in the
    series.
---
RFC: Wouldn't flask_get_peer_sid() better use the per-channel lock?

--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -917,7 +917,7 @@ int arch_domain_soft_reset(struct domain
     if ( !is_hvm_domain(d) )
         return -EINVAL;
 
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
     for ( i = 0; i < d->nr_pirqs ; i++ )
     {
         if ( domain_pirq_to_emuirq(d, i) != IRQ_UNBOUND )
@@ -927,7 +927,7 @@ int arch_domain_soft_reset(struct domain
                 break;
         }
     }
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
 
     if ( ret )
         return ret;
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -528,9 +528,9 @@ void hvm_migrate_pirqs(struct vcpu *v)
     if ( !is_iommu_enabled(d) || !hvm_domain_irq(d)->dpci )
        return;
 
-    spin_lock(&d->event_lock);
+    read_lock(&d->event_lock);
     pt_pirq_iterate(d, migrate_pirq, v);
-    spin_unlock(&d->event_lock);
+    read_unlock(&d->event_lock);
 }
 
 static bool hvm_get_pending_event(struct vcpu *v, struct x86_event *info)
--- a/xen/arch/x86/hvm/irq.c
+++ b/xen/arch/x86/hvm/irq.c
@@ -404,9 +404,9 @@ int hvm_inject_msi(struct domain *d, uin
             {
                 int rc;
 
-                spin_lock(&d->event_lock);
+                write_lock(&d->event_lock);
                 rc = map_domain_emuirq_pirq(d, pirq, IRQ_MSI_EMU);
-                spin_unlock(&d->event_lock);
+                write_unlock(&d->event_lock);
                 if ( rc )
                     return rc;
                 info = pirq_info(d, pirq);
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -203,9 +203,9 @@ static int vioapic_hwdom_map_gsi(unsigne
     {
         gprintk(XENLOG_WARNING, "vioapic: error binding GSI %u: %d\n",
                 gsi, ret);
-        spin_lock(&currd->event_lock);
+        write_lock(&currd->event_lock);
         unmap_domain_pirq(currd, pirq);
-        spin_unlock(&currd->event_lock);
+        write_unlock(&currd->event_lock);
     }
     pcidevs_unlock();
 
--- a/xen/arch/x86/hvm/vmsi.c
+++ b/xen/arch/x86/hvm/vmsi.c
@@ -465,7 +465,7 @@ int msixtbl_pt_register(struct domain *d
     int r = -EINVAL;
 
     ASSERT(pcidevs_locked());
-    ASSERT(spin_is_locked(&d->event_lock));
+    ASSERT(rw_is_write_locked(&d->event_lock));
 
     if ( !msixtbl_initialised(d) )
         return -ENODEV;
@@ -535,7 +535,7 @@ void msixtbl_pt_unregister(struct domain
     struct msixtbl_entry *entry;
 
     ASSERT(pcidevs_locked());
-    ASSERT(spin_is_locked(&d->event_lock));
+    ASSERT(rw_is_write_locked(&d->event_lock));
 
     if ( !msixtbl_initialised(d) )
         return;
@@ -589,13 +589,13 @@ void msixtbl_pt_cleanup(struct domain *d
     if ( !msixtbl_initialised(d) )
         return;
 
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
 
     list_for_each_entry_safe( entry, temp,
                               &d->arch.hvm.msixtbl_list, list )
         del_msixtbl_entry(entry);
 
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
 }
 
 void msix_write_completion(struct vcpu *v)
@@ -719,9 +719,9 @@ int vpci_msi_arch_update(struct vpci_msi
                          msi->arch.pirq, msi->mask);
     if ( rc )
     {
-        spin_lock(&pdev->domain->event_lock);
+        write_lock(&pdev->domain->event_lock);
         unmap_domain_pirq(pdev->domain, msi->arch.pirq);
-        spin_unlock(&pdev->domain->event_lock);
+        write_unlock(&pdev->domain->event_lock);
         pcidevs_unlock();
         msi->arch.pirq = INVALID_PIRQ;
         return rc;
@@ -760,9 +760,9 @@ static int vpci_msi_enable(const struct
     rc = vpci_msi_update(pdev, data, address, vectors, pirq, mask);
     if ( rc )
     {
-        spin_lock(&pdev->domain->event_lock);
+        write_lock(&pdev->domain->event_lock);
         unmap_domain_pirq(pdev->domain, pirq);
-        spin_unlock(&pdev->domain->event_lock);
+        write_unlock(&pdev->domain->event_lock);
         pcidevs_unlock();
         return rc;
     }
@@ -807,9 +807,9 @@ static void vpci_msi_disable(const struc
         ASSERT(!rc);
     }
 
-    spin_lock(&pdev->domain->event_lock);
+    write_lock(&pdev->domain->event_lock);
     unmap_domain_pirq(pdev->domain, pirq);
-    spin_unlock(&pdev->domain->event_lock);
+    write_unlock(&pdev->domain->event_lock);
     pcidevs_unlock();
 }
 
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -2413,10 +2413,10 @@ int ioapic_guest_write(unsigned long phy
     }
     if ( pirq >= 0 )
     {
-        spin_lock(&hardware_domain->event_lock);
+        write_lock(&hardware_domain->event_lock);
         ret = map_domain_pirq(hardware_domain, pirq, irq,
                               MAP_PIRQ_TYPE_GSI, NULL);
-        spin_unlock(&hardware_domain->event_lock);
+        write_unlock(&hardware_domain->event_lock);
         if ( ret < 0 )
             return ret;
     }
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -1536,7 +1536,7 @@ int pirq_guest_bind(struct vcpu *v, stru
     irq_guest_action_t *action, *newaction = NULL;
     int                 rc = 0;
 
-    WARN_ON(!spin_is_locked(&v->domain->event_lock));
+    WARN_ON(!rw_is_write_locked(&v->domain->event_lock));
     BUG_ON(!local_irq_is_enabled());
 
  retry:
@@ -1756,7 +1756,7 @@ void pirq_guest_unbind(struct domain *d,
     struct irq_desc *desc;
     int irq = 0;
 
-    WARN_ON(!spin_is_locked(&d->event_lock));
+    WARN_ON(!rw_is_write_locked(&d->event_lock));
 
     BUG_ON(!local_irq_is_enabled());
     desc = pirq_spin_lock_irq_desc(pirq, NULL);
@@ -1793,7 +1793,7 @@ static bool pirq_guest_force_unbind(stru
     unsigned int i;
     bool bound = false;
 
-    WARN_ON(!spin_is_locked(&d->event_lock));
+    WARN_ON(!rw_is_write_locked(&d->event_lock));
 
     BUG_ON(!local_irq_is_enabled());
     desc = pirq_spin_lock_irq_desc(pirq, NULL);
@@ -2037,7 +2037,7 @@ int get_free_pirq(struct domain *d, int
 {
     int i;
 
-    ASSERT(spin_is_locked(&d->event_lock));
+    ASSERT(rw_is_write_locked(&d->event_lock));
 
     if ( type == MAP_PIRQ_TYPE_GSI )
     {
@@ -2062,7 +2062,7 @@ int get_free_pirqs(struct domain *d, uns
 {
     unsigned int i, found = 0;
 
-    ASSERT(spin_is_locked(&d->event_lock));
+    ASSERT(rw_is_write_locked(&d->event_lock));
 
     for ( i = d->nr_pirqs - 1; i >= nr_irqs_gsi; --i )
         if ( is_free_pirq(d, pirq_info(d, i)) )
@@ -2090,7 +2090,7 @@ int map_domain_pirq(
     DECLARE_BITMAP(prepared, MAX_MSI_IRQS) = {};
     DECLARE_BITMAP(granted, MAX_MSI_IRQS) = {};
 
-    ASSERT(spin_is_locked(&d->event_lock));
+    ASSERT(rw_is_write_locked(&d->event_lock));
 
     if ( !irq_access_permitted(current->domain, irq))
         return -EPERM;
@@ -2309,7 +2309,7 @@ int unmap_domain_pirq(struct domain *d,
         return -EINVAL;
 
     ASSERT(pcidevs_locked());
-    ASSERT(spin_is_locked(&d->event_lock));
+    ASSERT(rw_is_write_locked(&d->event_lock));
 
     info = pirq_info(d, pirq);
     if ( !info || (irq = info->arch.irq) <= 0 )
@@ -2436,13 +2436,13 @@ void free_domain_pirqs(struct domain *d)
     int i;
 
     pcidevs_lock();
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
 
     for ( i = 0; i < d->nr_pirqs; i++ )
         if ( domain_pirq_to_irq(d, i) > 0 )
             unmap_domain_pirq(d, i);
 
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
     pcidevs_unlock();
 }
 
@@ -2683,7 +2683,7 @@ int map_domain_emuirq_pirq(struct domain
     int old_emuirq = IRQ_UNBOUND, old_pirq = IRQ_UNBOUND;
     struct pirq *info;
 
-    ASSERT(spin_is_locked(&d->event_lock));
+    ASSERT(rw_is_write_locked(&d->event_lock));
 
     if ( !is_hvm_domain(d) )
         return -EINVAL;
@@ -2749,7 +2749,7 @@ int unmap_domain_pirq_emuirq(struct doma
     if ( (pirq < 0) || (pirq >= d->nr_pirqs) )
         return -EINVAL;
 
-    ASSERT(spin_is_locked(&d->event_lock));
+    ASSERT(rw_is_write_locked(&d->event_lock));
 
     emuirq = domain_pirq_to_emuirq(d, pirq);
     if ( emuirq == IRQ_UNBOUND )
@@ -2797,7 +2797,7 @@ static int allocate_pirq(struct domain *
 {
     int current_pirq;
 
-    ASSERT(spin_is_locked(&d->event_lock));
+    ASSERT(rw_is_write_locked(&d->event_lock));
     current_pirq = domain_irq_to_pirq(d, irq);
     if ( pirq < 0 )
     {
@@ -2869,7 +2869,7 @@ int allocate_and_map_gsi_pirq(struct dom
     }
 
     /* Verify or get pirq. */
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
     pirq = allocate_pirq(d, index, *pirq_p, irq, MAP_PIRQ_TYPE_GSI, NULL);
     if ( pirq < 0 )
     {
@@ -2882,7 +2882,7 @@ int allocate_and_map_gsi_pirq(struct dom
         *pirq_p = pirq;
 
  done:
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
 
     return ret;
 }
@@ -2923,7 +2923,7 @@ int allocate_and_map_msi_pirq(struct dom
 
     pcidevs_lock();
     /* Verify or get pirq. */
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
     pirq = allocate_pirq(d, index, *pirq_p, irq, type, &msi->entry_nr);
     if ( pirq < 0 )
     {
@@ -2936,7 +2936,7 @@ int allocate_and_map_msi_pirq(struct dom
         *pirq_p = pirq;
 
  done:
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
     pcidevs_unlock();
     if ( ret )
     {
--- a/xen/arch/x86/physdev.c
+++ b/xen/arch/x86/physdev.c
@@ -34,7 +34,7 @@ static int physdev_hvm_map_pirq(
 
     ASSERT(!is_hardware_domain(d));
 
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
     switch ( type )
     {
     case MAP_PIRQ_TYPE_GSI: {
@@ -84,7 +84,7 @@ static int physdev_hvm_map_pirq(
         break;
     }
 
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
     return ret;
 }
 
@@ -154,18 +154,18 @@ int physdev_unmap_pirq(domid_t domid, in
 
     if ( is_hvm_domain(d) && has_pirq(d) )
     {
-        spin_lock(&d->event_lock);
+        write_lock(&d->event_lock);
         if ( domain_pirq_to_emuirq(d, pirq) != IRQ_UNBOUND )
             ret = unmap_domain_pirq_emuirq(d, pirq);
-        spin_unlock(&d->event_lock);
+        write_unlock(&d->event_lock);
         if ( domid == DOMID_SELF || ret )
             goto free_domain;
     }
 
     pcidevs_lock();
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
     ret = unmap_domain_pirq(d, pirq);
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
     pcidevs_unlock();
 
  free_domain:
@@ -192,10 +192,10 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
         ret = -EINVAL;
         if ( eoi.irq >= currd->nr_pirqs )
             break;
-        spin_lock(&currd->event_lock);
+        read_lock(&currd->event_lock);
         pirq = pirq_info(currd, eoi.irq);
         if ( !pirq ) {
-            spin_unlock(&currd->event_lock);
+            read_unlock(&currd->event_lock);
             break;
         }
         if ( currd->arch.auto_unmask )
@@ -214,7 +214,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
                     && hvm_irq->gsi_assert_count[gsi] )
                 send_guest_pirq(currd, pirq);
         }
-        spin_unlock(&currd->event_lock);
+        read_unlock(&currd->event_lock);
         ret = 0;
         break;
     }
@@ -626,7 +626,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
         if ( copy_from_guest(&out, arg, 1) != 0 )
             break;
 
-        spin_lock(&currd->event_lock);
+        write_lock(&currd->event_lock);
 
         ret = get_free_pirq(currd, out.type);
         if ( ret >= 0 )
@@ -639,7 +639,7 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_H
                 ret = -ENOMEM;
         }
 
-        spin_unlock(&currd->event_lock);
+        write_unlock(&currd->event_lock);
 
         if ( ret >= 0 )
         {
--- a/xen/arch/x86/pv/shim.c
+++ b/xen/arch/x86/pv/shim.c
@@ -448,7 +448,7 @@ static long pv_shim_event_channel_op(int
         if ( rc )                                                           \
             break;                                                          \
                                                                             \
-        spin_lock(&d->event_lock);                                          \
+        write_lock(&d->event_lock);                                         \
         rc = evtchn_allocate_port(d, op.port_field);                        \
         if ( rc )                                                           \
         {                                                                   \
@@ -457,7 +457,7 @@ static long pv_shim_event_channel_op(int
         }                                                                   \
         else                                                                \
             evtchn_reserve(d, op.port_field);                               \
-        spin_unlock(&d->event_lock);                                        \
+        write_unlock(&d->event_lock);                                       \
                                                                             \
         if ( !rc && __copy_to_guest(arg, &op, 1) )                          \
             rc = -EFAULT;                                                   \
@@ -585,11 +585,11 @@ static long pv_shim_event_channel_op(int
         if ( rc )
             break;
 
-        spin_lock(&d->event_lock);
+        write_lock(&d->event_lock);
         rc = evtchn_allocate_port(d, ipi.port);
         if ( rc )
         {
-            spin_unlock(&d->event_lock);
+            write_unlock(&d->event_lock);
 
             close.port = ipi.port;
             BUG_ON(xen_hypercall_event_channel_op(EVTCHNOP_close, &close));
@@ -598,7 +598,7 @@ static long pv_shim_event_channel_op(int
 
         evtchn_assign_vcpu(d, ipi.port, ipi.vcpu);
         evtchn_reserve(d, ipi.port);
-        spin_unlock(&d->event_lock);
+        write_unlock(&d->event_lock);
 
         if ( __copy_to_guest(arg, &ipi, 1) )
             rc = -EFAULT;
--- a/xen/common/event_channel.c
+++ b/xen/common/event_channel.c
@@ -294,7 +294,7 @@ static long evtchn_alloc_unbound(evtchn_
     if ( d == NULL )
         return -ESRCH;
 
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
 
     if ( (port = get_free_port(d)) < 0 )
         ERROR_EXIT_DOM(port, d);
@@ -317,7 +317,7 @@ static long evtchn_alloc_unbound(evtchn_
 
  out:
     check_free_port(d, port);
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
     rcu_unlock_domain(d);
 
     return rc;
@@ -363,14 +363,14 @@ static long evtchn_bind_interdomain(evtc
     /* Avoid deadlock by first acquiring lock of domain with smaller id. */
     if ( ld < rd )
     {
-        spin_lock(&ld->event_lock);
-        spin_lock(&rd->event_lock);
+        write_lock(&ld->event_lock);
+        read_lock(&rd->event_lock);
     }
     else
     {
         if ( ld != rd )
-            spin_lock(&rd->event_lock);
-        spin_lock(&ld->event_lock);
+            read_lock(&rd->event_lock);
+        write_lock(&ld->event_lock);
     }
 
     if ( (lport = get_free_port(ld)) < 0 )
@@ -411,9 +411,9 @@ static long evtchn_bind_interdomain(evtc
 
  out:
     check_free_port(ld, lport);
-    spin_unlock(&ld->event_lock);
+    write_unlock(&ld->event_lock);
     if ( ld != rd )
-        spin_unlock(&rd->event_lock);
+        read_unlock(&rd->event_lock);
     
     rcu_unlock_domain(rd);
 
@@ -444,7 +444,7 @@ int evtchn_bind_virq(evtchn_bind_virq_t
     if ( (v = domain_vcpu(d, vcpu)) == NULL )
         return -ENOENT;
 
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
 
     if ( read_atomic(&v->virq_to_evtchn[virq]) )
         ERROR_EXIT(-EEXIST);
@@ -485,7 +485,7 @@ int evtchn_bind_virq(evtchn_bind_virq_t
     write_atomic(&v->virq_to_evtchn[virq], port);
 
  out:
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
 
     return rc;
 }
@@ -501,7 +501,7 @@ static long evtchn_bind_ipi(evtchn_bind_
     if ( domain_vcpu(d, vcpu) == NULL )
         return -ENOENT;
 
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
 
     if ( (port = get_free_port(d)) < 0 )
         ERROR_EXIT(port);
@@ -519,7 +519,7 @@ static long evtchn_bind_ipi(evtchn_bind_
     bind->port = port;
 
  out:
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
 
     return rc;
 }
@@ -565,7 +565,7 @@ static long evtchn_bind_pirq(evtchn_bind
     if ( !is_hvm_domain(d) && !pirq_access_permitted(d, pirq) )
         return -EPERM;
 
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
 
     if ( pirq_to_evtchn(d, pirq) != 0 )
         ERROR_EXIT(-EEXIST);
@@ -605,7 +605,7 @@ static long evtchn_bind_pirq(evtchn_bind
 
  out:
     check_free_port(d, port);
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
 
     return rc;
 }
@@ -620,7 +620,7 @@ int evtchn_close(struct domain *d1, int
     long           rc = 0;
 
  again:
-    spin_lock(&d1->event_lock);
+    write_lock(&d1->event_lock);
 
     if ( !port_is_valid(d1, port1) )
     {
@@ -690,13 +690,11 @@ int evtchn_close(struct domain *d1, int
                 BUG();
 
             if ( d1 < d2 )
-            {
-                spin_lock(&d2->event_lock);
-            }
+                read_lock(&d2->event_lock);
             else if ( d1 != d2 )
             {
-                spin_unlock(&d1->event_lock);
-                spin_lock(&d2->event_lock);
+                write_unlock(&d1->event_lock);
+                read_lock(&d2->event_lock);
                 goto again;
             }
         }
@@ -743,11 +741,11 @@ int evtchn_close(struct domain *d1, int
     if ( d2 != NULL )
     {
         if ( d1 != d2 )
-            spin_unlock(&d2->event_lock);
+            read_unlock(&d2->event_lock);
         put_domain(d2);
     }
 
-    spin_unlock(&d1->event_lock);
+    write_unlock(&d1->event_lock);
 
     return rc;
 }
@@ -963,7 +961,7 @@ int evtchn_status(evtchn_status_t *statu
     if ( d == NULL )
         return -ESRCH;
 
-    spin_lock(&d->event_lock);
+    read_lock(&d->event_lock);
 
     if ( !port_is_valid(d, port) )
     {
@@ -1016,7 +1014,7 @@ int evtchn_status(evtchn_status_t *statu
     status->vcpu = chn->notify_vcpu_id;
 
  out:
-    spin_unlock(&d->event_lock);
+    read_unlock(&d->event_lock);
     rcu_unlock_domain(d);
 
     return rc;
@@ -1034,7 +1032,7 @@ long evtchn_bind_vcpu(unsigned int port,
     if ( (v = domain_vcpu(d, vcpu_id)) == NULL )
         return -ENOENT;
 
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
 
     if ( !port_is_valid(d, port) )
     {
@@ -1078,7 +1076,7 @@ long evtchn_bind_vcpu(unsigned int port,
     }
 
  out:
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
 
     return rc;
 }
@@ -1124,7 +1122,7 @@ int evtchn_reset(struct domain *d, bool
     if ( d != current->domain && !d->controller_pause_count )
         return -EINVAL;
 
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
 
     /*
      * If we are resuming, then start where we stopped. Otherwise, check
@@ -1135,7 +1133,7 @@ int evtchn_reset(struct domain *d, bool
     if ( i > d->next_evtchn )
         d->next_evtchn = i;
 
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
 
     if ( !i )
         return -EBUSY;
@@ -1147,14 +1145,14 @@ int evtchn_reset(struct domain *d, bool
         /* NB: Choice of frequency is arbitrary. */
         if ( !(i & 0x3f) && hypercall_preempt_check() )
         {
-            spin_lock(&d->event_lock);
+            write_lock(&d->event_lock);
             d->next_evtchn = i;
-            spin_unlock(&d->event_lock);
+            write_unlock(&d->event_lock);
             return -ERESTART;
         }
     }
 
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
 
     d->next_evtchn = 0;
 
@@ -1167,7 +1165,7 @@ int evtchn_reset(struct domain *d, bool
         evtchn_2l_init(d);
     }
 
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
 
     return rc;
 }
@@ -1357,7 +1355,7 @@ int alloc_unbound_xen_event_channel(
     struct evtchn *chn;
     int            port, rc;
 
-    spin_lock(&ld->event_lock);
+    write_lock(&ld->event_lock);
 
     port = rc = get_free_port(ld);
     if ( rc < 0 )
@@ -1385,7 +1383,7 @@ int alloc_unbound_xen_event_channel(
 
  out:
     check_free_port(ld, port);
-    spin_unlock(&ld->event_lock);
+    write_unlock(&ld->event_lock);
 
     return rc < 0 ? rc : port;
 }
@@ -1473,7 +1471,8 @@ int evtchn_init(struct domain *d, unsign
         return -ENOMEM;
     d->valid_evtchns = EVTCHNS_PER_BUCKET;
 
-    spin_lock_init_prof(d, event_lock);
+    rwlock_init(&d->event_lock);
+
     if ( get_free_port(d) != 0 )
     {
         free_evtchn_bucket(d, d->evtchn);
@@ -1500,7 +1499,7 @@ int evtchn_destroy(struct domain *d)
 
     /* After this barrier no new event-channel allocations can occur. */
     BUG_ON(!d->is_dying);
-    spin_barrier(&d->event_lock);
+    rw_barrier(&d->event_lock);
 
     /* Close all existing event channels. */
     for ( i = d->valid_evtchns; --i; )
@@ -1558,13 +1557,13 @@ void evtchn_move_pirqs(struct vcpu *v)
     unsigned int port;
     struct evtchn *chn;
 
-    spin_lock(&d->event_lock);
+    read_lock(&d->event_lock);
     for ( port = v->pirq_evtchn_head; port; port = chn->u.pirq.next_port )
     {
         chn = evtchn_from_port(d, port);
         pirq_set_affinity(d, chn->u.pirq.irq, mask);
     }
-    spin_unlock(&d->event_lock);
+    read_unlock(&d->event_lock);
 }
 
 
@@ -1577,7 +1576,7 @@ static void domain_dump_evtchn_info(stru
            "Polling vCPUs: {%*pbl}\n"
            "    port [p/m/s]\n", d->domain_id, d->max_vcpus, d->poll_mask);
 
-    spin_lock(&d->event_lock);
+    read_lock(&d->event_lock);
 
     for ( port = 1; port_is_valid(d, port); ++port )
     {
@@ -1624,7 +1623,7 @@ static void domain_dump_evtchn_info(stru
         }
     }
 
-    spin_unlock(&d->event_lock);
+    read_unlock(&d->event_lock);
 }
 
 static void dump_evtchn_info(unsigned char key)
--- a/xen/common/event_fifo.c
+++ b/xen/common/event_fifo.c
@@ -561,7 +561,7 @@ int evtchn_fifo_init_control(struct evtc
     if ( offset & (8 - 1) )
         return -EINVAL;
 
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
 
     /*
      * If this is the first control block, setup an empty event array
@@ -593,13 +593,13 @@ int evtchn_fifo_init_control(struct evtc
     else
         rc = map_control_block(v, gfn, offset);
 
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
 
     return rc;
 
  error:
     evtchn_fifo_destroy(d);
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
     return rc;
 }
 
@@ -652,9 +652,9 @@ int evtchn_fifo_expand_array(const struc
     if ( !d->evtchn_fifo )
         return -EOPNOTSUPP;
 
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
     rc = add_page_to_event_array(d, expand_array->array_gfn);
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
 
     return rc;
 }
--- a/xen/drivers/passthrough/io.c
+++ b/xen/drivers/passthrough/io.c
@@ -105,7 +105,7 @@ static void pt_pirq_softirq_reset(struct
 {
     struct domain *d = pirq_dpci->dom;
 
-    ASSERT(spin_is_locked(&d->event_lock));
+    ASSERT(rw_is_write_locked(&d->event_lock));
 
     switch ( cmpxchg(&pirq_dpci->state, 1 << STATE_SCHED, 0) )
     {
@@ -162,7 +162,7 @@ static void pt_irq_time_out(void *data)
     const struct hvm_irq_dpci *dpci;
     const struct dev_intx_gsi_link *digl;
 
-    spin_lock(&irq_map->dom->event_lock);
+    write_lock(&irq_map->dom->event_lock);
 
     if ( irq_map->flags & HVM_IRQ_DPCI_IDENTITY_GSI )
     {
@@ -177,7 +177,7 @@ static void pt_irq_time_out(void *data)
         hvm_gsi_deassert(irq_map->dom, dpci_pirq(irq_map)->pirq);
         irq_map->flags |= HVM_IRQ_DPCI_EOI_LATCH;
         pt_irq_guest_eoi(irq_map->dom, irq_map, NULL);
-        spin_unlock(&irq_map->dom->event_lock);
+        write_unlock(&irq_map->dom->event_lock);
         return;
     }
 
@@ -185,7 +185,7 @@ static void pt_irq_time_out(void *data)
     if ( unlikely(!dpci) )
     {
         ASSERT_UNREACHABLE();
-        spin_unlock(&irq_map->dom->event_lock);
+        write_unlock(&irq_map->dom->event_lock);
         return;
     }
     list_for_each_entry ( digl, &irq_map->digl_list, list )
@@ -204,7 +204,7 @@ static void pt_irq_time_out(void *data)
 
     pt_pirq_iterate(irq_map->dom, pt_irq_guest_eoi, NULL);
 
-    spin_unlock(&irq_map->dom->event_lock);
+    write_unlock(&irq_map->dom->event_lock);
 }
 
 struct hvm_irq_dpci *domain_get_irq_dpci(const struct domain *d)
@@ -288,7 +288,7 @@ int pt_irq_create_bind(
         return -EINVAL;
 
  restart:
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
 
     hvm_irq_dpci = domain_get_irq_dpci(d);
     if ( !hvm_irq_dpci && !is_hardware_domain(d) )
@@ -304,7 +304,7 @@ int pt_irq_create_bind(
         hvm_irq_dpci = xzalloc(struct hvm_irq_dpci);
         if ( hvm_irq_dpci == NULL )
         {
-            spin_unlock(&d->event_lock);
+            write_unlock(&d->event_lock);
             return -ENOMEM;
         }
         for ( i = 0; i < NR_HVM_DOMU_IRQS; i++ )
@@ -316,7 +316,7 @@ int pt_irq_create_bind(
     info = pirq_get_info(d, pirq);
     if ( !info )
     {
-        spin_unlock(&d->event_lock);
+        write_unlock(&d->event_lock);
         return -ENOMEM;
     }
     pirq_dpci = pirq_dpci(info);
@@ -331,7 +331,7 @@ int pt_irq_create_bind(
      */
     if ( pt_pirq_softirq_active(pirq_dpci) )
     {
-        spin_unlock(&d->event_lock);
+        write_unlock(&d->event_lock);
         cpu_relax();
         goto restart;
     }
@@ -389,7 +389,7 @@ int pt_irq_create_bind(
                 pirq_dpci->dom = NULL;
                 pirq_dpci->flags = 0;
                 pirq_cleanup_check(info, d);
-                spin_unlock(&d->event_lock);
+                write_unlock(&d->event_lock);
                 return rc;
             }
         }
@@ -399,7 +399,7 @@ int pt_irq_create_bind(
 
             if ( (pirq_dpci->flags & mask) != mask )
             {
-                spin_unlock(&d->event_lock);
+                write_unlock(&d->event_lock);
                 return -EBUSY;
             }
 
@@ -423,7 +423,7 @@ int pt_irq_create_bind(
 
         dest_vcpu_id = hvm_girq_dest_2_vcpu_id(d, dest, dest_mode);
         pirq_dpci->gmsi.dest_vcpu_id = dest_vcpu_id;
-        spin_unlock(&d->event_lock);
+        write_unlock(&d->event_lock);
 
         pirq_dpci->gmsi.posted = false;
         vcpu = (dest_vcpu_id >= 0) ? d->vcpu[dest_vcpu_id] : NULL;
@@ -483,7 +483,7 @@ int pt_irq_create_bind(
 
             if ( !digl || !girq )
             {
-                spin_unlock(&d->event_lock);
+                write_unlock(&d->event_lock);
                 xfree(girq);
                 xfree(digl);
                 return -ENOMEM;
@@ -510,7 +510,7 @@ int pt_irq_create_bind(
             if ( pt_irq_bind->irq_type != PT_IRQ_TYPE_PCI ||
                  pirq >= hvm_domain_irq(d)->nr_gsis )
             {
-                spin_unlock(&d->event_lock);
+                write_unlock(&d->event_lock);
 
                 return -EINVAL;
             }
@@ -546,7 +546,7 @@ int pt_irq_create_bind(
 
                     if ( mask < 0 || trigger_mode < 0 )
                     {
-                        spin_unlock(&d->event_lock);
+                        write_unlock(&d->event_lock);
 
                         ASSERT_UNREACHABLE();
                         return -EINVAL;
@@ -594,14 +594,14 @@ int pt_irq_create_bind(
                 }
                 pirq_dpci->flags = 0;
                 pirq_cleanup_check(info, d);
-                spin_unlock(&d->event_lock);
+                write_unlock(&d->event_lock);
                 xfree(girq);
                 xfree(digl);
                 return rc;
             }
         }
 
-        spin_unlock(&d->event_lock);
+        write_unlock(&d->event_lock);
 
         if ( iommu_verbose )
         {
@@ -619,7 +619,7 @@ int pt_irq_create_bind(
     }
 
     default:
-        spin_unlock(&d->event_lock);
+        write_unlock(&d->event_lock);
         return -EOPNOTSUPP;
     }
 
@@ -672,13 +672,13 @@ int pt_irq_destroy_bind(
         return -EOPNOTSUPP;
     }
 
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
 
     hvm_irq_dpci = domain_get_irq_dpci(d);
 
     if ( !hvm_irq_dpci && !is_hardware_domain(d) )
     {
-        spin_unlock(&d->event_lock);
+        write_unlock(&d->event_lock);
         return -EINVAL;
     }
 
@@ -711,7 +711,7 @@ int pt_irq_destroy_bind(
 
         if ( girq )
         {
-            spin_unlock(&d->event_lock);
+            write_unlock(&d->event_lock);
             return -EINVAL;
         }
 
@@ -755,7 +755,7 @@ int pt_irq_destroy_bind(
         pirq_cleanup_check(pirq, d);
     }
 
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
 
     if ( what && iommu_verbose )
     {
@@ -799,7 +799,7 @@ int pt_pirq_iterate(struct domain *d,
     unsigned int pirq = 0, n, i;
     struct pirq *pirqs[8];
 
-    ASSERT(spin_is_locked(&d->event_lock));
+    ASSERT(rw_is_locked(&d->event_lock));
 
     do {
         n = radix_tree_gang_lookup(&d->pirq_tree, (void **)pirqs, pirq,
@@ -880,9 +880,9 @@ void hvm_dpci_msi_eoi(struct domain *d,
          (!hvm_domain_irq(d)->dpci && !is_hardware_domain(d)) )
        return;
 
-    spin_lock(&d->event_lock);
+    read_lock(&d->event_lock);
     pt_pirq_iterate(d, _hvm_dpci_msi_eoi, (void *)(long)vector);
-    spin_unlock(&d->event_lock);
+    read_unlock(&d->event_lock);
 }
 
 static void hvm_dirq_assist(struct domain *d, struct hvm_pirq_dpci *pirq_dpci)
@@ -893,7 +893,7 @@ static void hvm_dirq_assist(struct domai
         return;
     }
 
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
     if ( test_and_clear_bool(pirq_dpci->masked) )
     {
         struct pirq *pirq = dpci_pirq(pirq_dpci);
@@ -947,7 +947,7 @@ static void hvm_dirq_assist(struct domai
     }
 
  out:
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
 }
 
 static void hvm_pirq_eoi(struct pirq *pirq,
@@ -1012,7 +1012,7 @@ void hvm_dpci_eoi(struct domain *d, unsi
 
     if ( is_hardware_domain(d) )
     {
-        spin_lock(&d->event_lock);
+        write_lock(&d->event_lock);
         hvm_gsi_eoi(d, guest_gsi, ent);
         goto unlock;
     }
@@ -1023,7 +1023,7 @@ void hvm_dpci_eoi(struct domain *d, unsi
         return;
     }
 
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
     hvm_irq_dpci = domain_get_irq_dpci(d);
 
     if ( !hvm_irq_dpci )
@@ -1033,7 +1033,7 @@ void hvm_dpci_eoi(struct domain *d, unsi
         __hvm_dpci_eoi(d, girq, ent);
 
 unlock:
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
 }
 
 /*
--- a/xen/common/rwlock.c
+++ b/xen/common/rwlock.c
@@ -102,6 +102,14 @@ void queue_write_lock_slowpath(rwlock_t
     spin_unlock(&lock->lock);
 }
 
+void _rw_barrier(rwlock_t *lock)
+{
+    check_barrier(&lock->lock.debug);
+    smp_mb();
+    while ( _rw_is_locked(lock) )
+        arch_lock_relax();
+    smp_mb();
+}
 
 static DEFINE_PER_CPU(cpumask_t, percpu_rwlock_readers);
 
--- a/xen/common/spinlock.c
+++ b/xen/common/spinlock.c
@@ -65,7 +65,7 @@ void check_lock(union lock_debug *debug,
     }
 }
 
-static void check_barrier(union lock_debug *debug)
+void check_barrier(union lock_debug *debug)
 {
     if ( unlikely(atomic_read(&spin_debug) <= 0) )
         return;
@@ -108,7 +108,6 @@ void spin_debug_disable(void)
 
 #else /* CONFIG_DEBUG_LOCKS */
 
-#define check_barrier(l) ((void)0)
 #define got_lock(l) ((void)0)
 #define rel_lock(l) ((void)0)
 
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -878,7 +878,7 @@ static int pci_clean_dpci_irqs(struct do
     if ( !is_hvm_domain(d) )
         return 0;
 
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
     hvm_irq_dpci = domain_get_irq_dpci(d);
     if ( hvm_irq_dpci != NULL )
     {
@@ -896,14 +896,14 @@ static int pci_clean_dpci_irqs(struct do
             ret = pt_pirq_iterate(d, pci_clean_dpci_irq, NULL);
         if ( ret )
         {
-            spin_unlock(&d->event_lock);
+            write_unlock(&d->event_lock);
             return ret;
         }
 
         hvm_domain_irq(d)->dpci = NULL;
         free_hvm_irq_dpci(hvm_irq_dpci);
     }
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
     return 0;
 }
 
--- a/xen/drivers/passthrough/vtd/x86/hvm.c
+++ b/xen/drivers/passthrough/vtd/x86/hvm.c
@@ -54,7 +54,7 @@ void hvm_dpci_isairq_eoi(struct domain *
     if ( !is_iommu_enabled(d) )
         return;
 
-    spin_lock(&d->event_lock);
+    write_lock(&d->event_lock);
 
     dpci = domain_get_irq_dpci(d);
 
@@ -63,5 +63,5 @@ void hvm_dpci_isairq_eoi(struct domain *
         /* Multiple mirq may be mapped to one isa irq */
         pt_pirq_iterate(d, _hvm_dpci_isairq_eoi, (void *)(long)isairq);
     }
-    spin_unlock(&d->event_lock);
+    write_unlock(&d->event_lock);
 }
--- a/xen/include/xen/rwlock.h
+++ b/xen/include/xen/rwlock.h
@@ -247,6 +247,8 @@ static inline int _rw_is_write_locked(rw
     return (atomic_read(&lock->cnts) & _QW_WMASK) == _QW_LOCKED;
 }
 
+void _rw_barrier(rwlock_t *lock);
+
 #define read_lock(l)                  _read_lock(l)
 #define read_lock_irq(l)              _read_lock_irq(l)
 #define read_lock_irqsave(l, f)                                 \
@@ -276,6 +278,7 @@ static inline int _rw_is_write_locked(rw
 #define rw_is_locked(l)               _rw_is_locked(l)
 #define rw_is_write_locked(l)         _rw_is_write_locked(l)
 
+#define rw_barrier(l)                 _rw_barrier(l)
 
 typedef struct percpu_rwlock percpu_rwlock_t;
 
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -376,7 +376,7 @@ struct domain
     unsigned int     xen_evtchns;
     /* Port to resume from in evtchn_reset(), when in a continuation. */
     unsigned int     next_evtchn;
-    spinlock_t       event_lock;
+    rwlock_t         event_lock;
     const struct evtchn_port_ops *evtchn_port_ops;
     struct evtchn_fifo_domain *evtchn_fifo;
 
--- a/xen/include/xen/spinlock.h
+++ b/xen/include/xen/spinlock.h
@@ -22,12 +22,14 @@ union lock_debug {
 };
 #define _LOCK_DEBUG { LOCK_DEBUG_INITVAL }
 void check_lock(union lock_debug *debug, bool try);
+void check_barrier(union lock_debug *debug);
 void spin_debug_enable(void);
 void spin_debug_disable(void);
 #else
 union lock_debug { };
 #define _LOCK_DEBUG { }
 #define check_lock(l, t) ((void)0)
+#define check_barrier(l) ((void)0)
 #define spin_debug_enable() ((void)0)
 #define spin_debug_disable() ((void)0)
 #endif
--- a/xen/xsm/flask/flask_op.c
+++ b/xen/xsm/flask/flask_op.c
@@ -555,7 +555,7 @@ static int flask_get_peer_sid(struct xen
     struct evtchn *chn;
     struct domain_security_struct *dsec;
 
-    spin_lock(&d->event_lock);
+    read_lock(&d->event_lock);
 
     if ( !port_is_valid(d, arg->evtchn) )
         goto out;
@@ -573,7 +573,7 @@ static int flask_get_peer_sid(struct xen
     rv = 0;
 
  out:
-    spin_unlock(&d->event_lock);
+    read_unlock(&d->event_lock);
     return rv;
 }
 


