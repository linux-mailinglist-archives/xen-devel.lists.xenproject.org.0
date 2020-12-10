Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EF42D6767
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 20:51:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49789.88135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knRy6-0002BF-27; Thu, 10 Dec 2020 19:51:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49789.88135; Thu, 10 Dec 2020 19:51:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knRy5-00029z-Px; Thu, 10 Dec 2020 19:51:13 +0000
Received: by outflank-mailman (input) for mailman id 49789;
 Thu, 10 Dec 2020 19:51:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hbU1=FO=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1knRqn-0007OY-FR
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 19:43:41 +0000
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d1858590-d800-406f-bab2-abd0c9b2f6ca;
 Thu, 10 Dec 2020 19:42:48 +0000 (UTC)
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
X-Inumbo-ID: d1858590-d800-406f-bab2-abd0c9b2f6ca
Message-Id: <20201210194045.157601122@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1607629367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=RU1bu/2cEIaQZD4XBTa1ORm36AT2+9xoAT9okJ4RH1c=;
	b=AhYGZMH5Lll3k86M+Mw+u/CMXrFP+z5OweedDSPLrQC7zMl71ejfF6LXNXRZTGD8kmOuJe
	qS19XHZYRwS6BqhVuvnoRC1T4ttKWNuaoSyT3BgYYN1BzFtZlPcOz+YQKy/43th5Y90u/R
	X6B6cmkRFkndNRXwbx2PLjfkgaDXN0K9HLJvSEGYF2Mwu+bniCBmPPPJ7kblKM0absRSol
	Xu6RJgcDTReN71V4H+Nn1MY4+vbA65bMSFOyl/jldJBTen7poJfNR1wRX6XEMJPR917pl1
	k5XFjcYwY2tULG78ylPnHOTKCe4dKJGK7v6roca6SRSYcgOrtkVCsvBrRQWZhw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1607629367;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=RU1bu/2cEIaQZD4XBTa1ORm36AT2+9xoAT9okJ4RH1c=;
	b=XdjqOHU/CtrxmjSRt3J35g254e3xJTlyAPxkG/hnQfineDJae9yPVorBnqLmfzdojIT+AV
	RtH7kedwWF+OweDQ==
Date: Thu, 10 Dec 2020 20:26:02 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Marc Zyngier <maz@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>,
 afzal mohammed <afzal.mohd.ma@gmail.com>,
 linux-parisc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Wambui Karuga <wambui.karugax@gmail.com>,
 intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-gpio@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>,
 Jon Mason <jdmason@kudzu.us>,
 Dave Jiang <dave.jiang@intel.com>,
 Allen Hubbe <allenbh@gmail.com>,
 linux-ntb@googlegroups.com,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Michal Simek <michal.simek@xilinx.com>,
 linux-pci@vger.kernel.org,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
 Tariq Toukan <tariqt@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org,
 linux-rdma@vger.kernel.org,
 Saeed Mahameed <saeedm@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>
Subject: [patch 26/30] xen/events: Use immediate affinity setting
References: <20201210192536.118432146@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit

There is absolutely no reason to mimic the x86 deferred affinity
setting. This mechanism is required to handle the hardware induced issues
of IO/APIC and MSI and is not in use when the interrupts are remapped.

XEN does not need this and can simply change the affinity from the calling
context. The core code invokes this with the interrupt descriptor lock held
so it is fully serialized against any other operation.

Mark the interrupts with IRQ_MOVE_PCNTXT to disable the deferred affinity
setting. The conditional mask/unmask operation is already handled in
xen_rebind_evtchn_to_cpu().

This makes XEN on x86 use the same mechanics as on e.g. ARM64 where
deferred affinity setting is not required and not implemented and the code
path in the ack functions is compiled out.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org
---
 drivers/xen/events/events_base.c |   35 +++++++++--------------------------
 1 file changed, 9 insertions(+), 26 deletions(-)

--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -628,6 +628,11 @@ static void xen_irq_init(unsigned irq)
 	info->refcnt = -1;
 
 	set_info_for_irq(irq, info);
+	/*
+	 * Interrupt affinity setting can be immediate. No point
+	 * in delaying it until an interrupt is handled.
+	 */
+	irq_set_status_flags(irq, IRQ_MOVE_PCNTXT);
 
 	INIT_LIST_HEAD(&info->eoi_list);
 	list_add_tail(&info->list, &xen_irq_list_head);
@@ -739,18 +744,7 @@ static void eoi_pirq(struct irq_data *da
 	if (!VALID_EVTCHN(evtchn))
 		return;
 
-	if (unlikely(irqd_is_setaffinity_pending(data)) &&
-	    likely(!irqd_irq_disabled(data))) {
-		int masked = test_and_set_mask(evtchn);
-
-		clear_evtchn(evtchn);
-
-		irq_move_masked_irq(data);
-
-		if (!masked)
-			unmask_evtchn(evtchn);
-	} else
-		clear_evtchn(evtchn);
+	clear_evtchn(evtchn);
 
 	if (pirq_needs_eoi(data->irq)) {
 		rc = HYPERVISOR_physdev_op(PHYSDEVOP_eoi, &eoi);
@@ -1641,7 +1635,6 @@ void rebind_evtchn_irq(evtchn_port_t evt
 	mutex_unlock(&irq_mapping_update_lock);
 
         bind_evtchn_to_cpu(evtchn, info->cpu);
-	/* This will be deferred until interrupt is processed */
 	irq_set_affinity(irq, cpumask_of(info->cpu));
 
 	/* Unmask the event channel. */
@@ -1688,8 +1681,9 @@ static int set_affinity_irq(struct irq_d
 			    bool force)
 {
 	unsigned tcpu = cpumask_first_and(dest, cpu_online_mask);
-	int ret = xen_rebind_evtchn_to_cpu(evtchn_from_irq(data->irq), tcpu);
+	int ret;
 
+	ret = xen_rebind_evtchn_to_cpu(evtchn_from_irq(data->irq), tcpu);
 	if (!ret)
 		irq_data_update_effective_affinity(data, cpumask_of(tcpu));
 
@@ -1719,18 +1713,7 @@ static void ack_dynirq(struct irq_data *
 	if (!VALID_EVTCHN(evtchn))
 		return;
 
-	if (unlikely(irqd_is_setaffinity_pending(data)) &&
-	    likely(!irqd_irq_disabled(data))) {
-		int masked = test_and_set_mask(evtchn);
-
-		clear_evtchn(evtchn);
-
-		irq_move_masked_irq(data);
-
-		if (!masked)
-			unmask_evtchn(evtchn);
-	} else
-		clear_evtchn(evtchn);
+	clear_evtchn(evtchn);
 }
 
 static void mask_ack_dynirq(struct irq_data *data)


