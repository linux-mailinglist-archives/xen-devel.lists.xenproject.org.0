Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8388C252D68
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 14:01:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAu7Z-000064-1S; Wed, 26 Aug 2020 12:01:41 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LG6r=CE=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kAu7X-00083C-B4
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 12:01:39 +0000
X-Inumbo-ID: 280cf3bb-d3be-4b21-9d9a-df48e07067d1
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 280cf3bb-d3be-4b21-9d9a-df48e07067d1;
 Wed, 26 Aug 2020 12:01:29 +0000 (UTC)
Message-Id: <20200826112333.326841410@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598443288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=pWFmsUcFsRa+ZQPUyY9l6i/Ptm0fiSvCYr5L6A2XYBA=;
 b=vXtAyApTtuCfG5BYP4assb/j+cBeP89Kxhh0WpAXDmqkrySzry9EIa81BCWbuqDPysiRV5
 UA51a1qFzXUk+l7k+IchM6cgliPwWolFtnvHqJpRCMiI/Pf8I2f0mx2Jqrff/VUJ9eRrzm
 Pabm2gZ9VGeFKdG0iu/j+meUNCfNr7eKEkvtx4381ivq71VWEtl9xwhZUrvCZbIVoXXDox
 FOZ2I6CULrb9dZhoS6jjHLPbLMljRV0z2c8ypaxHy6uhTuce0zQRnfSZ4kd08F5xBF9BV6
 P5hUlYT0IGGWYsQ7PZV3chaIHeG1KQ8im76GYiNuSdOeDFQPFe/OtzSDk4v9Og==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598443288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=pWFmsUcFsRa+ZQPUyY9l6i/Ptm0fiSvCYr5L6A2XYBA=;
 b=syOM68toRaTrOCmyKOY8xULsP7wEIpKhMMwbMTYSFnERZcypX7xwqt29P6SxCNcDtggCTB
 t5wSt9ZoiVKA9ABQ==
Date: Wed, 26 Aug 2020 13:16:55 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org, linux-hyperv@vger.kernel.org,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Jon Derrick <jonathan.derrick@intel.com>,
 Lu Baolu <baolu.lu@linux.intel.com>, Wei Liu <wei.liu@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Steve Wahl <steve.wahl@hpe.com>, Dimitri Sivanich <sivanich@hpe.com>,
 Russ Anderson <rja@hpe.com>, linux-pci@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Megha Dey <megha.dey@intel.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Dave Jiang <dave.jiang@intel.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Jacob Pan <jacob.jun.pan@intel.com>, Baolu Lu <baolu.lu@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Dan Williams <dan.j.williams@intel.com>
Subject: [patch V2 27/46] x86/xen: Rework MSI teardown
References: <20200826111628.794979401@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Thomas Gleixner <tglx@linutronix.de>

X86 cannot store the irq domain pointer in struct device without breaking
XEN because the irq domain pointer takes precedence over arch_*_msi_irqs()
fallbacks.

XENs MSI teardown relies on default_teardown_msi_irqs() which invokes
arch_teardown_msi_irq(). default_teardown_msi_irqs() is a trivial iterator
over the msi entries associated to a device.

Implement this loop in xen_teardown_msi_irqs() to prepare for removal of
the fallbacks for X86.

This is a preparatory step to wrap XEN MSI alloc/free into a irq domain
which in turn allows to store the irq domain pointer in struct device and
to use the irq domain functions directly.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V2: Use teardown_pv... for initial domain (Juergen)
---
 arch/x86/pci/xen.c |   23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

--- a/arch/x86/pci/xen.c
+++ b/arch/x86/pci/xen.c
@@ -377,20 +377,31 @@ static void xen_initdom_restore_msi_irqs
 static void xen_teardown_msi_irqs(struct pci_dev *dev)
 {
 	struct msi_desc *msidesc;
+	int i;
+
+	for_each_pci_msi_entry(msidesc, dev) {
+		if (msidesc->irq) {
+			for (i = 0; i < msidesc->nvec_used; i++)
+				xen_destroy_irq(msidesc->irq + i);
+		}
+	}
+}
+
+static void xen_pv_teardown_msi_irqs(struct pci_dev *dev)
+{
+	struct msi_desc *msidesc = first_pci_msi_entry(dev);
 
-	msidesc = first_pci_msi_entry(dev);
 	if (msidesc->msi_attrib.is_msix)
 		xen_pci_frontend_disable_msix(dev);
 	else
 		xen_pci_frontend_disable_msi(dev);
 
-	/* Free the IRQ's and the msidesc using the generic code. */
-	default_teardown_msi_irqs(dev);
+	xen_teardown_msi_irqs(dev);
 }
 
 static void xen_teardown_msi_irq(unsigned int irq)
 {
-	xen_destroy_irq(irq);
+	WARN_ON_ONCE(1);
 }
 
 #endif
@@ -413,7 +424,7 @@ int __init pci_xen_init(void)
 #ifdef CONFIG_PCI_MSI
 	x86_msi.setup_msi_irqs = xen_setup_msi_irqs;
 	x86_msi.teardown_msi_irq = xen_teardown_msi_irq;
-	x86_msi.teardown_msi_irqs = xen_teardown_msi_irqs;
+	x86_msi.teardown_msi_irqs = xen_pv_teardown_msi_irqs;
 	pci_msi_ignore_mask = 1;
 #endif
 	return 0;
@@ -437,6 +448,7 @@ static void __init xen_hvm_msi_init(void
 	}
 
 	x86_msi.setup_msi_irqs = xen_hvm_setup_msi_irqs;
+	x86_msi.teardown_msi_irqs = xen_teardown_msi_irqs;
 	x86_msi.teardown_msi_irq = xen_teardown_msi_irq;
 }
 #endif
@@ -473,6 +485,7 @@ int __init pci_xen_initial_domain(void)
 #ifdef CONFIG_PCI_MSI
 	x86_msi.setup_msi_irqs = xen_initdom_setup_msi_irqs;
 	x86_msi.teardown_msi_irq = xen_teardown_msi_irq;
+	x86_msi.teardown_msi_irqs = xen_teardown_pv_msi_irqs;
 	x86_msi.restore_msi_irqs = xen_initdom_restore_msi_irqs;
 	pci_msi_ignore_mask = 1;
 #endif


