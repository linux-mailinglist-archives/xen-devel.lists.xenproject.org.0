Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7838B24CACF
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 04:26:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8wlO-0005DY-T1; Fri, 21 Aug 2020 02:26:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z7lF=B7=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1k8wca-0002Bb-5Q
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 02:17:36 +0000
X-Inumbo-ID: 63f56983-db12-4138-b4e4-1a54478862a9
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 63f56983-db12-4138-b4e4-1a54478862a9;
 Fri, 21 Aug 2020 02:17:18 +0000 (UTC)
Message-Id: <20200821002948.472642859@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1597976238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=YM0Jb+0jacRYeAAEIXyvt7LyQs4eenP0P8zOev+VYEA=;
 b=XYwY5aZBZHc/cE8NoEwTRaXWx4kQ9d5LAVJKdZmLxtBDVRWBQIJ1CD55OOiD8/PaSIC/Qz
 86xyuToyG6fI0SYmZSPxwoPMnRKptHaFKEijx8ccnzdBv83L4NnYP/UaMCRLf1xPIu9QD6
 LnA+w+4x3Jkpbea1y5BQ1kxBaz1UJLA/aMDIsKy/If47+NLxbOJk4c2rnPclYU5gciOWt2
 q7yABVl1IeaRUY1SCLr5pnWVG3Lc67GbPkqqE2Np8EEdfhi2F/dQu1naD6Hi5jWT+CBefq
 9I1Ctkigd4ye/r+nFa9qaNWht25+BgwifwFgNJLDdwMDEhIbqsoywHttGKLZ8A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1597976238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=YM0Jb+0jacRYeAAEIXyvt7LyQs4eenP0P8zOev+VYEA=;
 b=SJFB1hWrc9NTcS6nWGalTM0SJUTy+5x03Z372SqiJn9+JXrx5GkSr1rUnc2/RHr+HRLf5m
 OPRQxTlNSr1y7xCA==
Date: Fri, 21 Aug 2020 02:24:56 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, xen-devel@lists.xenproject.org, linux-pci@vger.kernel.org,
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
Subject: [patch RFC 32/38] x86/irq: Make most MSI ops XEN private
References: <20200821002424.119492231@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline;
 filename="x86-irq--Make-most-MSI-ops-XEN-private.patch"
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

Nothing except XEN uses the setup/teardown ops. Hide them there.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: xen-devel@lists.xenproject.org
Cc: linux-pci@vger.kernel.org
---
 arch/x86/include/asm/x86_init.h |    2 --
 arch/x86/pci/xen.c              |   23 +++++++++++++++--------
 2 files changed, 15 insertions(+), 10 deletions(-)

--- a/arch/x86/include/asm/x86_init.h
+++ b/arch/x86/include/asm/x86_init.h
@@ -276,8 +276,6 @@ struct x86_platform_ops {
 struct pci_dev;
 
 struct x86_msi_ops {
-	int (*setup_msi_irqs)(struct pci_dev *dev, int nvec, int type);
-	void (*teardown_msi_irqs)(struct pci_dev *dev);
 	void (*restore_msi_irqs)(struct pci_dev *dev);
 };
 
--- a/arch/x86/pci/xen.c
+++ b/arch/x86/pci/xen.c
@@ -156,6 +156,13 @@ static int acpi_register_gsi_xen(struct
 struct xen_pci_frontend_ops *xen_pci_frontend;
 EXPORT_SYMBOL_GPL(xen_pci_frontend);
 
+struct xen_msi_ops {
+	int (*setup_msi_irqs)(struct pci_dev *dev, int nvec, int type);
+	void (*teardown_msi_irqs)(struct pci_dev *dev);
+};
+
+static struct xen_msi_ops xen_msi_ops __ro_after_init;
+
 static int xen_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
 {
 	int irq, ret, i;
@@ -414,7 +421,7 @@ static int xen_msi_domain_alloc_irqs(str
 	else
 		type = PCI_CAP_ID_MSI;
 
-	return x86_msi.setup_msi_irqs(to_pci_dev(dev), nvec, type);
+	return xen_msi_ops.setup_msi_irqs(to_pci_dev(dev), nvec, type);
 }
 
 static void xen_msi_domain_free_irqs(struct irq_domain *domain,
@@ -423,7 +430,7 @@ static void xen_msi_domain_free_irqs(str
 	if (WARN_ON_ONCE(!dev_is_pci(dev)))
 		return;
 
-	x86_msi.teardown_msi_irqs(to_pci_dev(dev));
+	xen_msi_ops.teardown_msi_irqs(to_pci_dev(dev));
 }
 
 static struct msi_domain_ops xen_pci_msi_domain_ops = {
@@ -461,17 +468,17 @@ static __init struct irq_domain *xen_cre
 static __init void xen_setup_pci_msi(void)
 {
 	if (xen_initial_domain()) {
-		x86_msi.setup_msi_irqs = xen_initdom_setup_msi_irqs;
-		x86_msi.teardown_msi_irqs = xen_teardown_msi_irqs;
+		xen_msi_ops.setup_msi_irqs = xen_initdom_setup_msi_irqs;
+		xen_msi_ops.teardown_msi_irqs = xen_teardown_msi_irqs;
 		x86_msi.restore_msi_irqs = xen_initdom_restore_msi_irqs;
 		pci_msi_ignore_mask = 1;
 	} else if (xen_pv_domain()) {
-		x86_msi.setup_msi_irqs = xen_setup_msi_irqs;
-		x86_msi.teardown_msi_irqs = xen_pv_teardown_msi_irqs;
+		xen_msi_ops.setup_msi_irqs = xen_setup_msi_irqs;
+		xen_msi_ops.teardown_msi_irqs = xen_pv_teardown_msi_irqs;
 		pci_msi_ignore_mask = 1;
 	} else if (xen_hvm_domain()) {
-		x86_msi.setup_msi_irqs = xen_hvm_setup_msi_irqs;
-		x86_msi.teardown_msi_irqs = xen_teardown_msi_irqs;
+		xen_msi_ops.setup_msi_irqs = xen_hvm_setup_msi_irqs;
+		xen_msi_ops.teardown_msi_irqs = xen_teardown_msi_irqs;
 	} else {
 		WARN_ON_ONCE(1);
 		return;


