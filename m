Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F8324CACA
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 04:26:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8wlL-00056g-M3; Fri, 21 Aug 2020 02:26:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z7lF=B7=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1k8wcf-0002BQ-Up
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 02:17:41 +0000
X-Inumbo-ID: 9e6247f6-6707-459b-93ea-572b9db4c760
Received: from galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e6247f6-6707-459b-93ea-572b9db4c760;
 Fri, 21 Aug 2020 02:17:04 +0000 (UTC)
Message-Id: <20200821002947.263753263@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1597976223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=xhbFdhsCsQ5VSYCUiVy99pvX2yN4idfA0I7XlvTQakE=;
 b=ZHPMzYaPzfOECo836sQFsUmCX7TFv2uj13sv98D4bI8o6iI6WKZs1U7pYv9brD8a4az4fs
 NyW2wBNkPya+ae9bCFjp09So5OeSSAX52C6juW+HKgm4ymvYeCx/IfVgaDhjbZBDHJN2Y7
 N3Ga0P6rEMZqQTiiVOkR3j0KsFCD4vhJzcH9tjRPhCUvVfZb3FJIfpw8yH5bG9MqEf/Vfx
 HtYfBOCZj0F8653MC9JjGiUq1BCATOsRuRbgl0R92oj6nP6xijsr8QEAN3xNC7i6G9hIwj
 93+5AhgyK99DgKHmu6NAF2r5clFidEeEDceyitr+J6fyYTJp9z6GKMouFgvM/g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1597976223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=xhbFdhsCsQ5VSYCUiVy99pvX2yN4idfA0I7XlvTQakE=;
 b=JYv5Wl4UiPVl3hvzKT1TU9FbgMyvxpUxxeVQ/q1ta3fiBXM7WdZyhJVHsfCIDihr82ihZJ
 mZtv6aJHBV8/OEAQ==
Date: Fri, 21 Aug 2020 02:24:44 +0200
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: x86@kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Jonathan Derrick <jonathan.derrick@intel.com>, linux-pci@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
 linux-hyperv@vger.kernel.org, Haiyang Zhang <haiyangz@microsoft.com>,
 Jon Derrick <jonathan.derrick@intel.com>,
 Lu Baolu <baolu.lu@linux.intel.com>, Wei Liu <wei.liu@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Steve Wahl <steve.wahl@hpe.com>, Dimitri Sivanich <sivanich@hpe.com>,
 Russ Anderson <rja@hpe.com>,
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
Subject: [patch RFC 20/38] PCI: vmd: Mark VMD irqdomain with DOMAIN_BUS_VMD_MSI
References: <20200821002424.119492231@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline;
 filename="PCI--vmd--Mark-VMD-irqdomain-with-DOMAIN_BUS_VMD_PCI.patch"
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

Devices on the VMD bus use their own MSI irq domain, but it is not
distinguishable from regular PCI/MSI irq domains. This is required
to exclude VMD devices from getting the irq domain pointer set by
interrupt remapping.

Override the default bus token.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Jonathan Derrick <jonathan.derrick@intel.com>
Cc: linux-pci@vger.kernel.org
---
 drivers/pci/controller/vmd.c |    6 ++++++
 1 file changed, 6 insertions(+)

--- a/drivers/pci/controller/vmd.c
+++ b/drivers/pci/controller/vmd.c
@@ -579,6 +579,12 @@ static int vmd_enable_domain(struct vmd_
 		return -ENODEV;
 	}
 
+	/*
+	 * Override the irq domain bus token so the domain can be distinguished
+	 * from a regular PCI/MSI domain.
+	 */
+	irq_domain_update_bus_token(vmd->irq_domain, DOMAIN_BUS_VMD_MSI);
+
 	pci_add_resource(&resources, &vmd->resources[0]);
 	pci_add_resource_offset(&resources, &vmd->resources[1], offset[0]);
 	pci_add_resource_offset(&resources, &vmd->resources[2], offset[1]);


