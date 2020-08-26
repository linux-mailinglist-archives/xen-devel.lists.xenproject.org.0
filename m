Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2405E252D4D
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 14:01:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAu73-00085d-HQ; Wed, 26 Aug 2020 12:01:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LG6r=CE=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1kAu72-000821-5l
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 12:01:08 +0000
X-Inumbo-ID: 2ee3c551-0e80-4adb-a44c-a6da1df135ac
Received: from galois.linutronix.de (unknown [2a0a:51c0:0:12e:550::1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ee3c551-0e80-4adb-a44c-a6da1df135ac;
 Wed, 26 Aug 2020 12:00:59 +0000 (UTC)
Message-Id: <20200826112330.928952181@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1598443258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=GJq1CEkWcaKs7Em2GYlhCtoVPP5Bukhfi2C/MO87oqU=;
 b=dUiCUdbmQOpMkybm8iOwgllxN+rbWKXHIOv8xVx9P0CYcEvTrFfH+U510MWl4oVPJ0gtga
 ahqCxi9ahMWxjIEsaydAa/rKy2pLoS0XfR5K4IDb4uihwE2PQKBjV4F9A8pFZYgGN7PuxQ
 EOB1SaNvp8dPe4VJ46qh1GtqJBzaIwyAez52Agf9f+0VgyaCndFq+l56XNDg+v6HO0uzx9
 KwoWueh6GMvJjAnouk8aSNrY7sJJRDuvX4Ynt2UCn35woH/JnJXgQKrYdLfLlaCEBkFk9c
 Y7WVHB/k+RUE/B1QV9Xa55mz4IiFTHSC1D8o3oA/1GFewMJzkzQ+YqY5c8skRQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1598443258;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:  references:references;
 bh=GJq1CEkWcaKs7Em2GYlhCtoVPP5Bukhfi2C/MO87oqU=;
 b=HQTmvGI7KkXeaCWVTYGHuxhaaAjsX1BJNwh3dDUbNFgWHKVDFEbHlgJXRMU0uVeDi8WgHM
 cnjckdDSNiedpnBg==
Date: Wed, 26 Aug 2020 13:16:31 +0200
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
Subject: [patch V2 03/46] PCI: vmd: Dont abuse vector irqomain as parent
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

VMD has it's own PCI/MSI interrupt domain which is not in any way depending
on the x86 vector domain. PCI devices behind VMD share the VMD MSIX vector
entries via a VMD specific message translation to the actual VMD MSIX
vector. The VMD device interrupt handler for the VMD MSIX vectors invokes
all interrupt handlers of the devices which share a vector.

Making the x86 vector domain the actual parent of the VMD irq domain is
pointless and actually counterproductive. When a device interrupt is
requested then it will activate the interrupt which traverses down the
hierarchy and consumes an interrupt vector in the vector domain which is
never used.

The domain is self contained and has no parent dependencies, so just hand
in NULL for the parent and be done with it.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Jonathan Derrick <jonathan.derrick@intel.com>
Cc: linux-pci@vger.kernel.org
---
V2: New patch.
---
 drivers/pci/controller/vmd.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- a/drivers/pci/controller/vmd.c
+++ b/drivers/pci/controller/vmd.c
@@ -573,7 +573,8 @@ static int vmd_enable_domain(struct vmd_
 		return -ENODEV;
 
 	vmd->irq_domain = pci_msi_create_irq_domain(fn, &vmd_msi_domain_info,
-						    x86_vector_domain);
+						    NULL);
+
 	if (!vmd->irq_domain) {
 		irq_domain_free_fwnode(fn);
 		return -ENODEV;


