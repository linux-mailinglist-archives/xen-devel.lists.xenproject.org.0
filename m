Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA9724CAC1
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 04:26:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8wlA-0004s5-Ij; Fri, 21 Aug 2020 02:26:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z7lF=B7=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1k8wd4-0002BQ-Vl
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 02:18:07 +0000
X-Inumbo-ID: 091d8fa7-eee1-47a5-bac1-986b8ad5fbe7
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 091d8fa7-eee1-47a5-bac1-986b8ad5fbe7;
 Fri, 21 Aug 2020 02:17:11 +0000 (UTC)
Message-Id: <20200821002947.868727656@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1597976230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=TtSCch4Pl9idW7lZ/MfqjUP9Aer+OWMrbEhYjWyctzk=;
 b=ajI2pJdEYzOm/NA7mpsVnmmYpP8BChSbOklVsS1Clri/O+HTySypMyq7V9Aw/6oWO1KmUT
 DxKpuJLMRwQ0KE3iVhSMBKYHFDiHrvGC7RE6UmzR14YefId9dgx5pU0BBUz4EPNu9EKsub
 e1HrJdYrH+nKV762GYpTzhxjnjNa3+TTxl6Qh9dbQCrhltTygTZebPaudPK1tsCadByiUp
 OhqKB1ZySsgRfQWYfMY91XPjiowAtQJE4zIRTMtpE7//eE4b7p9H69mUH8dVKxAZ08m/1N
 95TY2NPmPXmzOiPUd0jhPkGPYbcghDXRR+H7jdLv/Ddyc481pN2Axj0dNhkMmQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1597976230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=TtSCch4Pl9idW7lZ/MfqjUP9Aer+OWMrbEhYjWyctzk=;
 b=mU3SPMbQsB++v6eyvlflbVy+D6aYL3jGw0t+vLRnS/VfAKbRJOsLYlNIUdAfx3WAYLh4wO
 XJc9lvDYLRoiMOCw==
Date: Fri, 21 Aug 2020 02:24:50 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 linux-hyperv@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>,
 Jon Derrick <jonathan.derrick@intel.com>,
 Lu Baolu <baolu.lu@linux.intel.com>, Wei Liu <wei.liu@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Steve Wahl <steve.wahl@hpe.com>, Dimitri Sivanich <sivanich@hpe.com>,
 Russ Anderson <rja@hpe.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Jonathan Derrick <jonathan.derrick@intel.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Megha Dey <megha.dey@intel.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Dave Jiang <dave.jiang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jacob Pan <jacob.jun.pan@intel.com>, Baolu Lu <baolu.lu@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Dan Williams <dan.j.williams@intel.com>
Subject: [patch RFC 26/38] x86/xen: Wrap XEN MSI management into irqdomain
References: <20200821002424.119492231@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline;
 filename="x86-xen--Wrap-XEN-MSI-management-into-irqdomain.patch"
Content-transfer-encoding: 8-bit
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

To allow utilizing the irq domain pointer in struct device it is necessary
to make XEN/MSI irq domain compatible.

While the right solution would be to truly convert XEN to irq domains, this
is an exercise which is not possible for mere mortals with limited XENology.

Provide a plain irqdomain wrapper around XEN. While this is blatant
violation of the irqdomain design, it's the only solution for a XEN igorant
person to make progress on the issue which triggered this change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: linux-pci@vger.kernel.org
Cc: xen-devel@lists.xenproject.org
---
Note: This is completely untested, but it compiles so it must be perfect.
---
 arch/x86/pci/xen.c |   63 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

--- a/arch/x86/pci/xen.c
+++ b/arch/x86/pci/xen.c
@@ -406,6 +406,63 @@ static void xen_teardown_msi_irq(unsigne
 	WARN_ON_ONCE(1);
 }
 
+static int xen_msi_domain_alloc_irqs(struct irq_domain *domain,
+				     struct device *dev,  int nvec)
+{
+	int type;
+
+	if (WARN_ON_ONCE(!dev_is_pci(dev)))
+		return -EINVAL;
+
+	if (first_msi_entry(dev)->msi_attrib.is_msix)
+		type = PCI_CAP_ID_MSIX;
+	else
+		type = PCI_CAP_ID_MSI;
+
+	return x86_msi.setup_msi_irqs(to_pci_dev(dev), nvec, type);
+}
+
+static void xen_msi_domain_free_irqs(struct irq_domain *domain,
+				     struct device *dev)
+{
+	if (WARN_ON_ONCE(!dev_is_pci(dev)))
+		return;
+
+	x86_msi.teardown_msi_irqs(to_pci_dev(dev));
+}
+
+static struct msi_domain_ops xen_pci_msi_domain_ops = {
+	.domain_alloc_irqs	= xen_msi_domain_alloc_irqs,
+	.domain_free_irqs	= xen_msi_domain_free_irqs,
+};
+
+static struct msi_domain_info xen_pci_msi_domain_info = {
+	.ops			= &xen_pci_msi_domain_ops,
+};
+
+/*
+ * This irq domain is a blatant violation of the irq domain design, but
+ * distangling XEN into real irq domains is not a job for mere mortals with
+ * limited XENology. But it's the least dangerous way for a mere mortal to
+ * get rid of the arch_*_msi_irqs() hackery in order to store the irq
+ * domain pointer in struct device. This irq domain wrappery allows to do
+ * that without breaking XEN terminally.
+ */
+static __init struct irq_domain *xen_create_pci_msi_domain(void)
+{
+	struct irq_domain *d = NULL;
+	struct fwnode_handle *fn;
+
+	fn = irq_domain_alloc_named_fwnode("XEN-MSI");
+	if (fn)
+		d = msi_create_irq_domain(fn, &xen_pci_msi_domain_info, NULL);
+
+	/* FIXME: No idea how to survive if this fails */
+	BUG_ON(!d);
+
+	return d;
+}
+
 static __init void xen_setup_pci_msi(void)
 {
 	if (xen_initial_domain()) {
@@ -426,6 +483,12 @@ static __init void xen_setup_pci_msi(voi
 	}
 
 	x86_msi.teardown_msi_irq = xen_teardown_msi_irq;
+
+	/*
+	 * Override the PCI/MSI irq domain init function. No point
+	 * in allocating the native domain and never use it.
+	 */
+	x86_init.irqs.create_pci_msi_domain = xen_create_pci_msi_domain;
 }
 
 #else /* CONFIG_PCI_MSI */


