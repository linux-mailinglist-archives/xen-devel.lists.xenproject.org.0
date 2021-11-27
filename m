Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F73645FA4C
	for <lists+xen-devel@lfdr.de>; Sat, 27 Nov 2021 02:27:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233703.405820 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmV9-00048m-CI; Sat, 27 Nov 2021 01:27:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233703.405820; Sat, 27 Nov 2021 01:27:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmV8-0003xl-VD; Sat, 27 Nov 2021 01:27:38 +0000
Received: by outflank-mailman (input) for mailman id 233703;
 Sat, 27 Nov 2021 01:27:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Erow=QO=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mqmNg-00020H-9y
 for xen-devel@lists.xenproject.org; Sat, 27 Nov 2021 01:19:56 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 20688db0-4f20-11ec-9787-a32c541c8605;
 Sat, 27 Nov 2021 02:19:54 +0100 (CET)
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
X-Inumbo-ID: 20688db0-4f20-11ec-9787-a32c541c8605
Message-ID: <20211126223825.320724006@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1637975994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=kh2ZB8gumt7yFa2wjaDhpeN9tXzUfJvLkALkOS94EFA=;
	b=D9US/8tVMwlRfaqgiDmj8ly+USrLZ+QbU+koi5BF+9g0Iguix1/4W7JOvM77Fxvfxk0Pk4
	i3Alyb5QMZHm2M3doE0zc03SvL1G/N+bW29B5GT+JiK+vvoAlbXFGOqr1+ineD8/JbZxLU
	VefISwNxY93Qm1ylUIwl0+ZfwQytaWS63YV3kQ7UyjTBMGq2GViLeHOw0UV4yJZV5wEQAD
	BOCN8t3XNrraZIreQz7DQgTEE6WK/0Rw8FSfygM1uVbA31f7wm0TvILCaHzAcara9sqOXE
	zsr873tLkNtGYtX/TI5l1mJFeYDe+L1wjO8kk9uwsSbh+uyxfw/ICDIhVgWFVw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1637975994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=kh2ZB8gumt7yFa2wjaDhpeN9tXzUfJvLkALkOS94EFA=;
	b=8Uh+QoxZaq46tV5s75Y6r3qCvSsAdyGP5v255GrAqW6V5bDTByErDycUXzyT6e32TmhIUx
	k69MGZ3JHevpO4BQ==
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
 Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 sparclinux@vger.kernel.org,
 x86@kernel.org,
 xen-devel@lists.xenproject.org,
 ath11k@lists.infradead.org,
 Wei Liu <wei.liu@kernel.org>,
 linux-hyperv@vger.kernel.org,
 Juergen Gross <jgross@suse.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>
Subject: [patch 21/22] genirq/msi: Handle PCI/MSI allocation fail in core code
References: <20211126222700.862407977@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Nov 2021 02:19:53 +0100 (CET)

Get rid of yet another irqdomain callback and let the core code return the
already available information of how many descriptors could be allocated.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/pci/msi/irqdomain.c |   13 -------------
 include/linux/msi.h         |    5 +----
 kernel/irq/msi.c            |   29 +++++++++++++++++++++++++----
 3 files changed, 26 insertions(+), 21 deletions(-)

--- a/drivers/pci/msi/irqdomain.c
+++ b/drivers/pci/msi/irqdomain.c
@@ -95,16 +95,6 @@ static int pci_msi_domain_check_cap(stru
 	return 0;
 }
 
-static int pci_msi_domain_handle_error(struct irq_domain *domain,
-				       struct msi_desc *desc, int error)
-{
-	/* Special handling to support __pci_enable_msi_range() */
-	if (pci_msi_desc_is_multi_msi(desc) && error == -ENOSPC)
-		return 1;
-
-	return error;
-}
-
 static void pci_msi_domain_set_desc(msi_alloc_info_t *arg,
 				    struct msi_desc *desc)
 {
@@ -115,7 +105,6 @@ static void pci_msi_domain_set_desc(msi_
 static struct msi_domain_ops pci_msi_domain_ops_default = {
 	.set_desc	= pci_msi_domain_set_desc,
 	.msi_check	= pci_msi_domain_check_cap,
-	.handle_error	= pci_msi_domain_handle_error,
 };
 
 static void pci_msi_domain_update_dom_ops(struct msi_domain_info *info)
@@ -129,8 +118,6 @@ static void pci_msi_domain_update_dom_op
 			ops->set_desc = pci_msi_domain_set_desc;
 		if (ops->msi_check == NULL)
 			ops->msi_check = pci_msi_domain_check_cap;
-		if (ops->handle_error == NULL)
-			ops->handle_error = pci_msi_domain_handle_error;
 	}
 }
 
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -285,7 +285,6 @@ struct msi_domain_info;
  * @msi_check:		Callback for verification of the domain/info/dev data
  * @msi_prepare:	Prepare the allocation of the interrupts in the domain
  * @set_desc:		Set the msi descriptor for an interrupt
- * @handle_error:	Optional error handler if the allocation fails
  * @domain_alloc_irqs:	Optional function to override the default allocation
  *			function.
  * @domain_free_irqs:	Optional function to override the default free
@@ -294,7 +293,7 @@ struct msi_domain_info;
  * @get_hwirq, @msi_init and @msi_free are callbacks used by the underlying
  * irqdomain.
  *
- * @msi_check, @msi_prepare, @handle_error and @set_desc are callbacks used by
+ * @msi_check, @msi_prepare and @set_desc are callbacks used by
  * msi_domain_alloc/free_irqs().
  *
  * @domain_alloc_irqs, @domain_free_irqs can be used to override the
@@ -331,8 +330,6 @@ struct msi_domain_ops {
 				       msi_alloc_info_t *arg);
 	void		(*set_desc)(msi_alloc_info_t *arg,
 				    struct msi_desc *desc);
-	int		(*handle_error)(struct irq_domain *domain,
-					struct msi_desc *desc, int error);
 	int		(*domain_alloc_irqs)(struct irq_domain *domain,
 					     struct device *dev, int nvec);
 	void		(*domain_free_irqs)(struct irq_domain *domain,
--- a/kernel/irq/msi.c
+++ b/kernel/irq/msi.c
@@ -538,6 +538,27 @@ static bool msi_check_reservation_mode(s
 	return desc->pci.msi_attrib.is_msix || desc->pci.msi_attrib.can_mask;
 }
 
+static int msi_handle_pci_fail(struct irq_domain *domain, struct msi_desc *desc,
+			       int allocated)
+{
+	switch(domain->bus_token) {
+	case DOMAIN_BUS_PCI_MSI:
+	case DOMAIN_BUS_VMD_MSI:
+		if (IS_ENABLED(CONFIG_PCI_MSI))
+			break;
+		fallthrough;
+	default:
+		return -ENOSPC;
+	}
+
+	/* Let a failed PCI multi MSI allocation retry */
+	if (desc->nvec_used > 1)
+		return 1;
+
+	/* If there was a successful allocation let the caller know */
+	return allocated ? allocated : -ENOSPC;
+}
+
 int __msi_domain_alloc_irqs(struct irq_domain *domain, struct device *dev,
 			    int nvec)
 {
@@ -546,6 +567,7 @@ int __msi_domain_alloc_irqs(struct irq_d
 	struct irq_data *irq_data;
 	struct msi_desc *desc;
 	msi_alloc_info_t arg = { };
+	int allocated = 0;
 	int i, ret, virq;
 	bool can_reserve;
 
@@ -560,16 +582,15 @@ int __msi_domain_alloc_irqs(struct irq_d
 					       dev_to_node(dev), &arg, false,
 					       desc->affinity);
 		if (virq < 0) {
-			ret = -ENOSPC;
-			if (ops->handle_error)
-				ret = ops->handle_error(domain, desc, ret);
-			return ret;
+			ret = msi_handle_pci_fail(domain, desc, allocated);
+			goto cleanup;
 		}
 
 		for (i = 0; i < desc->nvec_used; i++) {
 			irq_set_msi_desc_off(virq, i, desc);
 			irq_debugfs_copy_devname(virq + i, dev);
 		}
+		allocated++;
 	}
 
 	can_reserve = msi_check_reservation_mode(domain, info, dev);


