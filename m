Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC60A46AD0F
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 23:47:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240042.416257 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMlr-0007b2-JP; Mon, 06 Dec 2021 22:47:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240042.416257; Mon, 06 Dec 2021 22:47:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMlq-0007RE-W6; Mon, 06 Dec 2021 22:47:42 +0000
Received: by outflank-mailman (input) for mailman id 240042;
 Mon, 06 Dec 2021 22:47:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMe0-0004dp-2N
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:39:36 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63391f34-56e5-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 23:39:35 +0100 (CET)
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
X-Inumbo-ID: 63391f34-56e5-11ec-a5e1-b9374ead2679
Message-ID: <20211206210438.967630948@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638830375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=d9Kmjjh/l2UsbXBaFOpNStl1Xv+nLaUCFqLfxPXo1aU=;
	b=I////PKLH9o1EDmwZHCLir1VYzr7pMRrvKfwrj6/sS1RC/sdwMyhGsRmFNUzSjZKOgIMpc
	VuDsl2yS6Ws4hfoyOmeknB/JxMlXVeaa0NqZ95AAgghhBhdjN4FlW0c1g+csVgtA3fWrV2
	0z0AJ2MhOcSyN1lh/bEWW2f4/Fnzp7391CjPfdN7QKcJV8re5bwovln9v5A9x5IVqN9dZu
	+KxgCyciGG6WjKS91laJQv0xqwFi/Vzr/5mDWBV7Szozjeo04YI0ztWH5F/WSflOvd1MN5
	Qh8s2JiJi8LtYXIr6WLsuyGc4NOos6lvsJnEJd/u4laPT49BgQpCcWza6iNv+A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638830375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=d9Kmjjh/l2UsbXBaFOpNStl1Xv+nLaUCFqLfxPXo1aU=;
	b=ko5ujZLeGAKWmq36MQLxqwIEfx3oa0Eho33ca+wdmkjf4VHoT4ARnE0v9JtdIIR3XsdSb+
	xkZQTZQMwaNiZQCA==
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
 Will Deacon <will@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 iommu@lists.linux-foundation.org,
 dmaengine@vger.kernel.org,
 Stuart Yoder <stuyoder@gmail.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Vinod Koul <vkoul@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sinan Kaya <okaya@kernel.org>
Subject: [patch V2 24/36] powerpc/pseries/msi: Use MSI device properties
References: <20211206210307.625116253@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:39:34 +0100 (CET)

instead of fiddling with MSI descriptors.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 arch/powerpc/platforms/pseries/msi.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/arch/powerpc/platforms/pseries/msi.c
+++ b/arch/powerpc/platforms/pseries/msi.c
@@ -447,9 +447,9 @@ static int rtas_prepare_msi_irqs(struct
 static int pseries_msi_ops_prepare(struct irq_domain *domain, struct device *dev,
 				   int nvec, msi_alloc_info_t *arg)
 {
+	bool is_msix = msi_device_has_property(dev, MSI_PROP_PCI_MSIX);
+	int type = is_msix ? PCI_CAP_ID_MSIX : PCI_CAP_ID_MSI;
 	struct pci_dev *pdev = to_pci_dev(dev);
-	struct msi_desc *desc = first_pci_msi_entry(pdev);
-	int type = desc->pci.msi_attrib.is_msix ? PCI_CAP_ID_MSIX : PCI_CAP_ID_MSI;
 
 	return rtas_prepare_msi_irqs(pdev, nvec, type, arg);
 }


