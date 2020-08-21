Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D0D24CABE
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 04:26:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8wlA-0004rt-A3; Fri, 21 Aug 2020 02:26:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z7lF=B7=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1k8wdE-0002BQ-WA
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 02:18:17 +0000
X-Inumbo-ID: aed8f2ce-605d-404c-9242-406868a68a0b
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aed8f2ce-605d-404c-9242-406868a68a0b;
 Fri, 21 Aug 2020 02:17:14 +0000 (UTC)
Message-Id: <20200821002948.088290046@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1597976233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=I+1xcnxpEKwhL/2w1Df+4sJP4BV3gtVsGmDq2fpteQU=;
 b=oIYWpA1mK705vLgr0Pi3yvIwVY/JzWY6Zt8eNLdc9jL4sFmxDIPaDT052QDL9CckTVPM90
 ZJFVX+4ngFjF7amPFN2+FS286alUpCex1etIdfZMLu3UkN838sMfFVP0p9U+LvWeLaFf4H
 c430ZjWUmX5nUQYzWohUSa6CuOGYMSjpRHgRts7syQ5WyxJsiaxhIEb+Eu7E/PNmrdbAMp
 3Ik2FRwKvXFNm3om2igSs17GeofXgRc9iO+IqgqsxsibgkiIu3rvoltPIw81/AdpfrI2z7
 3nVAGJCOveCRgWSFYxa1YH+plh0xnrK9Ay0dTd3vL9eLDlz7E/nTv3YxqgsSXQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1597976233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=I+1xcnxpEKwhL/2w1Df+4sJP4BV3gtVsGmDq2fpteQU=;
 b=y7HPmfdRFAGEjH7N5iAux5Kp3SKyHIxKVvhZ7t+Z4q47rqymbpcW2zB+eSXhv48NUWrhBJ
 vhIQMjF0CardtkBA==
Date: Fri, 21 Aug 2020 02:24:52 +0200
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
 Jonathan Derrick <jonathan.derrick@intel.com>,
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
Subject: [patch RFC 28/38] iommm/amd: Store irq domain in struct device
References: <20200821002424.119492231@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline;
 filename="iommm-amd--Store-irq-domain-in-struct-device.patch"
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

As the next step to make X86 utilize the direct MSI irq domain operations
store the irq domain pointer in the device struct when a device is probed.

It only overrides the irqdomain of devices which are handled by a regular
PCI/MSI irq domain which protects PCI devices behind special busses like
VMD which have their own irq domain.

No functional change.

It just avoids the redirection through arch_*_msi_irqs() and allows the
PCI/MSI core to directly invoke the irq domain alloc/free functions instead
of having to look up the irq domain for every single MSI interupt.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux-foundation.org
---
 drivers/iommu/amd/iommu.c |   17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

--- a/drivers/iommu/amd/iommu.c
+++ b/drivers/iommu/amd/iommu.c
@@ -729,7 +729,21 @@ static void iommu_poll_ga_log(struct amd
 		}
 	}
 }
-#endif /* CONFIG_IRQ_REMAP */
+
+static void
+amd_iommu_set_pci_msi_domain(struct device *dev, struct amd_iommu *iommu)
+{
+	if (!irq_remapping_enabled || !dev_is_pci(dev) ||
+	    pci_dev_has_special_msi_domain(to_pci_dev(dev)))
+		return;
+
+	dev_set_msi_domain(dev, iommu->msi_domain);
+}
+
+#else /* CONFIG_IRQ_REMAP */
+static inline void
+amd_iommu_set_pci_msi_domain(struct device *dev, struct amd_iommu *iommu) { }
+#endif /* !CONFIG_IRQ_REMAP */
 
 #define AMD_IOMMU_INT_MASK	\
 	(MMIO_STATUS_EVT_INT_MASK | \
@@ -2157,6 +2171,7 @@ static struct iommu_device *amd_iommu_pr
 		iommu_dev = ERR_PTR(ret);
 		iommu_ignore_device(dev);
 	} else {
+		amd_iommu_set_pci_msi_domain(dev, iommu);
 		iommu_dev = &iommu->iommu;
 	}
 


