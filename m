Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBBF470D2B
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 23:19:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.244362.422751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvoEM-0000bQ-DU; Fri, 10 Dec 2021 22:19:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 244362.422751; Fri, 10 Dec 2021 22:19:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvoEL-0000Dt-ON; Fri, 10 Dec 2021 22:19:05 +0000
Received: by outflank-mailman (input) for mailman id 244362;
 Fri, 10 Dec 2021 22:19:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nm8/=Q3=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mvoEH-0005LR-R2
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 22:19:01 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d2ba74f-5a07-11ec-ad7a-b7ef48004f0a;
 Fri, 10 Dec 2021 23:19:01 +0100 (CET)
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
X-Inumbo-ID: 2d2ba74f-5a07-11ec-ad7a-b7ef48004f0a
Message-ID: <20211210221813.867985931@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1639174740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=Y82OSyHV4tCeBzBC1rgQ8/N8FaTKISWwv/0ho8RVhuc=;
	b=2lSBrqL7tZdnQovckLcRFs+zUPITNEnJXtT+2t/rF3/6USo+oM3rVzWI5tmzBuF8v+fTql
	Y/WOe+crXeCISzmidHrjHzy1/dM/bLhEGF6X78s2KO5zgtoADPazF6hbJHmZc83RIDEZ+U
	S3NcKAlmaR7iXrlw0Wyt7MQ+5GzK/qAHQuSapmDPvqVfsc0Ygv0gok/KxyDWalxpEjwiij
	lOyBs1cQWG/UTyGJS+ODHvhGY9UGVMnlFBi1jRxRIBXX9aHbQyi5XmvGDAjr3NZ0MZ2nHe
	FZdyKYem/VTlhxHFL6icdY/Lr7wgeJS28HmRZY5DnE4kXSdKV/5/4F5fOjnGqw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1639174740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=Y82OSyHV4tCeBzBC1rgQ8/N8FaTKISWwv/0ho8RVhuc=;
	b=AmDRzUTHc7jg0q3On78/vfF7TTqillkRcjofWpZD4PcjdOpOL/P4qxmwngleQjhYBtmCNP
	dxdvwJMQPD35dMCw==
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stuart Yoder <stuyoder@gmail.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org,
 Arnd Bergmann <arnd@arndb.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org,
 Mark Rutland <mark.rutland@arm.com>,
 Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Sinan Kaya <okaya@kernel.org>
Subject:
 [patch V3 11/35] bus: fsl-mc-msi: Allocate MSI device data on first use
References: <20211210221642.869015045@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Dec 2021 23:19:00 +0100 (CET)

From: Thomas Gleixner <tglx@linutronix.de>

Allocate the MSI device data on first invocation of the allocation function.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Cc: Stuart Yoder <stuyoder@gmail.com>
Cc: Laurentiu Tudor <laurentiu.tudor@nxp.com>
---
 drivers/bus/fsl-mc/fsl-mc-msi.c |   14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

--- a/drivers/bus/fsl-mc/fsl-mc-msi.c
+++ b/drivers/bus/fsl-mc/fsl-mc-msi.c
@@ -253,6 +253,14 @@ int fsl_mc_msi_domain_alloc_irqs(struct
 	struct irq_domain *msi_domain;
 	int error;
 
+	msi_domain = dev_get_msi_domain(dev);
+	if (!msi_domain)
+		return -EINVAL;
+
+	error = msi_setup_device_data(dev);
+	if (error)
+		return error;
+
 	if (!list_empty(dev_to_msi_list(dev)))
 		return -EINVAL;
 
@@ -260,12 +268,6 @@ int fsl_mc_msi_domain_alloc_irqs(struct
 	if (error < 0)
 		return error;
 
-	msi_domain = dev_get_msi_domain(dev);
-	if (!msi_domain) {
-		error = -EINVAL;
-		goto cleanup_msi_descs;
-	}
-
 	/*
 	 * NOTE: Calling this function will trigger the invocation of the
 	 * its_fsl_mc_msi_prepare() callback


