Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A828D46AE21
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 00:01:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240311.416804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMz9-0007kQ-5u; Mon, 06 Dec 2021 23:01:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240311.416804; Mon, 06 Dec 2021 23:01:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMz9-0007hw-1Z; Mon, 06 Dec 2021 23:01:27 +0000
Received: by outflank-mailman (input) for mailman id 240311;
 Mon, 06 Dec 2021 23:01:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMpm-0000Tb-3r
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:51:46 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 161aa009-56e7-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 23:51:45 +0100 (CET)
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
X-Inumbo-ID: 161aa009-56e7-11ec-8a4d-196798b21f7b
Message-ID: <20211206210749.010234767@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638831104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=ipuCExogsDYfjcIoTIggPfIeuQ7+Ly8nlNeTuzuXIek=;
	b=bZGnWImJMvj7ivrlJ6U2hMxWKZXlmQQ7bpp4PAifkCJo4YeWOJcjVmw95OHOwHrSyA/ptz
	PVZTvnmOilLRrugy/Cyu7Lkb9pmeulbH276306Gzm46ESh6MhwASAZMd/JINrLP7DX/EcW
	9EtGDiFwSHKFW9I+8QUKb/qCHPAzcsyNC3HOBmULNYx/RmHh1M5XJIhWDAad+yzUYg+FaO
	HTJbfsOmSMf6Q4+eMwGo6ht9HqvsjICWXRo4cR5li+x8+cddrtyFL0ouwQXfVbuLym0tr9
	AZwOSgXnfWeYO/S65WVTomLXlNwBELylbogFz1eugsNigDz/FOTaVxrH4stPBw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638831104;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=ipuCExogsDYfjcIoTIggPfIeuQ7+Ly8nlNeTuzuXIek=;
	b=ipve1PswDehRBnj60SViTpnvl/P3f6xRVDd/TBi4hIisW20v+M18tZGVXDf9uZI25Xz/xk
	FPfjxtxj7Rs+xJDQ==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
 Marc Zygnier <maz@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 Megha Dey <megha.dey@intel.com>,
 Ashok Raj <ashok.raj@intel.com>,
 linux-pci@vger.kernel.org,
 Cedric Le Goater <clg@kaod.org>,
 xen-devel@lists.xenproject.org,
 Juergen Gross <jgross@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Niklas Schnelle <schnelle@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Logan Gunthorpe <logang@deltatee.com>,
 Jon Mason <jdmason@kudzu.us>,
 Dave Jiang <dave.jiang@intel.com>,
 Allen Hubbe <allenbh@gmail.com>,
 linux-ntb@googlegroups.com
Subject:
 [patch V2 26/31] genirq/msi: Make interrupt allocation less convoluted
References: <20211206210600.123171746@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:51:44 +0100 (CET)

There is no real reason to do several loops over the MSI descriptors
instead of just doing one loop. In case of an error everything is undone
anyway so it does not matter whether it's a partial or a full rollback.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 .clang-format       |    1 
 include/linux/msi.h |    6 --
 kernel/irq/msi.c    |  129 +++++++++++++++++++++++++++-------------------------
 3 files changed, 69 insertions(+), 67 deletions(-)

--- a/.clang-format
+++ b/.clang-format
@@ -216,7 +216,6 @@ ExperimentalAutoDetectBinPacking: false
   - 'for_each_migratetype_order'
   - 'for_each_msi_entry'
   - 'for_each_msi_entry_safe'
-  - 'for_each_msi_vector'
   - 'for_each_net'
   - 'for_each_net_continue_reverse'
   - 'for_each_netdev'
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -223,12 +223,6 @@ struct msi_desc *msi_next_desc(struct de
 	list_for_each_entry((desc), dev_to_msi_list((dev)), list)
 #define for_each_msi_entry_safe(desc, tmp, dev)	\
 	list_for_each_entry_safe((desc), (tmp), dev_to_msi_list((dev)), list)
-#define for_each_msi_vector(desc, __irq, dev)				\
-	for_each_msi_entry((desc), (dev))				\
-		if ((desc)->irq)					\
-			for (__irq = (desc)->irq;			\
-			     __irq < ((desc)->irq + (desc)->nvec_used);	\
-			     __irq++)
 
 #ifdef CONFIG_IRQ_MSI_IOMMU
 static inline const void *msi_desc_get_iommu_cookie(struct msi_desc *desc)
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -856,23 +856,74 @@ static int msi_handle_pci_fail(struct ir
 	return allocated ? allocated : -ENOSPC;
 }
 
+#define VIRQ_CAN_RESERVE	0x01
+#define VIRQ_ACTIVATE		0x02
+#define VIRQ_NOMASK_QUIRK	0x04
+
+static int msi_init_virq(struct irq_domain *domain, int virq, unsigned int vflags)
+{
+	struct irq_data *irqd = irq_domain_get_irq_data(domain, virq);
+	int ret;
+
+	if (!(vflags & VIRQ_CAN_RESERVE)) {
+		irqd_clr_can_reserve(irqd);
+		if (vflags & VIRQ_NOMASK_QUIRK)
+			irqd_set_msi_nomask_quirk(irqd);
+	}
+
+	if (!(vflags & VIRQ_ACTIVATE))
+		return 0;
+
+	ret = irq_domain_activate_irq(irqd, vflags & VIRQ_CAN_RESERVE);
+	if (ret)
+		return ret;
+	/*
+	 * If the interrupt uses reservation mode, clear the activated bit
+	 * so request_irq() will assign the final vector.
+	 */
+	if (vflags & VIRQ_CAN_RESERVE)
+		irqd_clr_activated(irqd);
+	return 0;
+}
+
 int __msi_domain_alloc_irqs(struct irq_domain *domain, struct device *dev,
 			    int nvec)
 {
 	struct msi_domain_info *info = domain->host_data;
 	struct msi_domain_ops *ops = info->ops;
-	struct irq_data *irq_data;
-	struct msi_desc *desc;
 	msi_alloc_info_t arg = { };
+	unsigned int vflags = 0;
+	struct msi_desc *desc;
 	int allocated = 0;
 	int i, ret, virq;
-	bool can_reserve;
 
 	ret = msi_domain_prepare_irqs(domain, dev, nvec, &arg);
 	if (ret)
 		return ret;
 
-	for_each_msi_entry(desc, dev) {
+	/*
+	 * This flag is set by the PCI layer as we need to activate
+	 * the MSI entries before the PCI layer enables MSI in the
+	 * card. Otherwise the card latches a random msi message.
+	 */
+	if (info->flags & MSI_FLAG_ACTIVATE_EARLY)
+		vflags |= VIRQ_ACTIVATE;
+
+	/*
+	 * Interrupt can use a reserved vector and will not occupy
+	 * a real device vector until the interrupt is requested.
+	 */
+	if (msi_check_reservation_mode(domain, info, dev)) {
+		vflags |= VIRQ_CAN_RESERVE;
+		/*
+		 * MSI affinity setting requires a special quirk (X86) when
+		 * reservation mode is active.
+		 */
+		if (domain->flags & IRQ_DOMAIN_MSI_NOMASK_QUIRK)
+			vflags |= VIRQ_NOMASK_QUIRK;
+	}
+
+	msi_for_each_desc(desc, dev, MSI_DESC_NOTASSOCIATED) {
 		ops->set_desc(&arg, desc);
 
 		virq = __irq_domain_alloc_irqs(domain, -1, desc->nvec_used,
@@ -884,49 +935,12 @@ int __msi_domain_alloc_irqs(struct irq_d
 		for (i = 0; i < desc->nvec_used; i++) {
 			irq_set_msi_desc_off(virq, i, desc);
 			irq_debugfs_copy_devname(virq + i, dev);
+			ret = msi_init_virq(domain, virq + i, vflags);
+			if (ret)
+				return ret;
 		}
 		allocated++;
 	}
-
-	can_reserve = msi_check_reservation_mode(domain, info, dev);
-
-	/*
-	 * This flag is set by the PCI layer as we need to activate
-	 * the MSI entries before the PCI layer enables MSI in the
-	 * card. Otherwise the card latches a random msi message.
-	 */
-	if (!(info->flags & MSI_FLAG_ACTIVATE_EARLY))
-		goto skip_activate;
-
-	for_each_msi_vector(desc, i, dev) {
-		if (desc->irq == i) {
-			virq = desc->irq;
-			dev_dbg(dev, "irq [%d-%d] for MSI\n",
-				virq, virq + desc->nvec_used - 1);
-		}
-
-		irq_data = irq_domain_get_irq_data(domain, i);
-		if (!can_reserve) {
-			irqd_clr_can_reserve(irq_data);
-			if (domain->flags & IRQ_DOMAIN_MSI_NOMASK_QUIRK)
-				irqd_set_msi_nomask_quirk(irq_data);
-		}
-		ret = irq_domain_activate_irq(irq_data, can_reserve);
-		if (ret)
-			return ret;
-	}
-
-skip_activate:
-	/*
-	 * If these interrupts use reservation mode, clear the activated bit
-	 * so request_irq() will assign the final vector.
-	 */
-	if (can_reserve) {
-		for_each_msi_vector(desc, i, dev) {
-			irq_data = irq_domain_get_irq_data(domain, i);
-			irqd_clr_activated(irq_data);
-		}
-	}
 	return 0;
 }
 
@@ -1004,26 +1018,21 @@ int msi_domain_alloc_irqs(struct irq_dom
 
 void __msi_domain_free_irqs(struct irq_domain *domain, struct device *dev)
 {
-	struct irq_data *irq_data;
+	struct irq_data *irqd;
 	struct msi_desc *desc;
 	int i;
 
-	for_each_msi_vector(desc, i, dev) {
-		irq_data = irq_domain_get_irq_data(domain, i);
-		if (irqd_is_activated(irq_data))
-			irq_domain_deactivate_irq(irq_data);
-	}
-
-	for_each_msi_entry(desc, dev) {
-		/*
-		 * We might have failed to allocate an MSI early
-		 * enough that there is no IRQ associated to this
-		 * entry. If that's the case, don't do anything.
-		 */
-		if (desc->irq) {
-			irq_domain_free_irqs(desc->irq, desc->nvec_used);
-			desc->irq = 0;
+	/* Only handle MSI entries which have an interrupt associated */
+	msi_for_each_desc(desc, dev, MSI_DESC_ASSOCIATED) {
+		/* Make sure all interrupts are deactivated */
+		for (i = 0; i < desc->nvec_used; i++) {
+			irqd = irq_domain_get_irq_data(domain, desc->irq + i);
+			if (irqd && irqd_is_activated(irqd))
+				irq_domain_deactivate_irq(irqd);
 		}
+
+		irq_domain_free_irqs(desc->irq, desc->nvec_used);
+		desc->irq = 0;
 	}
 }
 


