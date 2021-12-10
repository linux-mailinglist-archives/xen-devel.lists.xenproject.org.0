Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E367C470DB6
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 23:27:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.244390.422804 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvoLw-0006pJ-85; Fri, 10 Dec 2021 22:26:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 244390.422804; Fri, 10 Dec 2021 22:26:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvoLw-0006lJ-4G; Fri, 10 Dec 2021 22:26:56 +0000
Received: by outflank-mailman (input) for mailman id 244390;
 Fri, 10 Dec 2021 22:26:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nm8/=Q3=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mvoEs-0005LR-VE
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 22:19:39 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4344e5c7-5a07-11ec-ad7a-b7ef48004f0a;
 Fri, 10 Dec 2021 23:19:38 +0100 (CET)
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
X-Inumbo-ID: 4344e5c7-5a07-11ec-ad7a-b7ef48004f0a
Message-ID: <20211210221815.329792721@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1639174778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=El+H3F4NXV3E+px9T1PJDDlrE0XW8D36UmPAiNafE8w=;
	b=Uy0NC+QniJEawZ4yuuEFtqIMzw9PFLBgpx0HDrRUo2md8XUl4SS73Nl7EfE819E5PtpbVc
	LAz+1cPwMJ/P73wMT+BU/i9qA4amhAWgAueMd0/fC606btT7duSv4NvM14w5Glhzh8MMt6
	Vf8SrpkxfuLKYwgK8ZgtU7FQjNQoMGjZqRjEQAW68HIHWKLNXxWyDiwhGs8MAwuo+Mw6+1
	gNzbkVQZh77bKcaEtUEDOtwWMdTwvsOeTeAuHpf0qQRNTFrf+/FLo1BbMBzYXFZsIbop/R
	ssapnQMEEzj69/QY+0rBqrGI4rNejNtgJBDAT+PK0tQBj3vgRF91DKkGdlcQHg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1639174778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=El+H3F4NXV3E+px9T1PJDDlrE0XW8D36UmPAiNafE8w=;
	b=rCtZG1LYH0eCoa6arIPeivQCBnZ/C7/60VDfvadqZFSQ6CFg6eVTEQvW1V/zkV59EqrcH/
	ZMdJiiA2xvl8beBw==
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
 Sinan Kaya <okaya@kernel.org>,
 dmaengine@vger.kernel.org,
 Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org,
 Arnd Bergmann <arnd@arndb.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org,
 Bjorn Helgaas <bhelgaas@google.com>,
 Stuart Yoder <stuyoder@gmail.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Vinod Koul <vkoul@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>,
 iommu@lists.linux-foundation.org,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>
Subject: [patch V3 35/35] dmaengine: qcom_hidma: Cleanup MSI handling
References: <20211210221642.869015045@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Dec 2021 23:19:37 +0100 (CET)

From: Thomas Gleixner <tglx@linutronix.de>

There is no reason to walk the MSI descriptors to retrieve the interrupt
number for a device. Use msi_get_virq() instead.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Acked-by: Sinan Kaya <okaya@kernel.org>
Cc: dmaengine@vger.kernel.org
---
 drivers/dma/qcom/hidma.c |   42 ++++++++++++++++++------------------------
 1 file changed, 18 insertions(+), 24 deletions(-)

--- a/drivers/dma/qcom/hidma.c
+++ b/drivers/dma/qcom/hidma.c
@@ -678,11 +678,13 @@ static void hidma_free_msis(struct hidma
 {
 #ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN
 	struct device *dev = dmadev->ddev.dev;
-	struct msi_desc *desc;
+	int i, virq;
 
-	/* free allocated MSI interrupts above */
-	for_each_msi_entry(desc, dev)
-		devm_free_irq(dev, desc->irq, &dmadev->lldev);
+	for (i = 0; i < HIDMA_MSI_INTS; i++) {
+		virq = msi_get_virq(dev, i);
+		if (virq)
+			devm_free_irq(dev, virq, &dmadev->lldev);
+	}
 
 	platform_msi_domain_free_irqs(dev);
 #endif
@@ -692,45 +694,37 @@ static int hidma_request_msi(struct hidm
 			     struct platform_device *pdev)
 {
 #ifdef CONFIG_GENERIC_MSI_IRQ_DOMAIN
-	int rc;
-	struct msi_desc *desc;
-	struct msi_desc *failed_desc = NULL;
+	int rc, i, virq;
 
 	rc = platform_msi_domain_alloc_irqs(&pdev->dev, HIDMA_MSI_INTS,
 					    hidma_write_msi_msg);
 	if (rc)
 		return rc;
 
-	for_each_msi_entry(desc, &pdev->dev) {
-		if (!desc->msi_index)
-			dmadev->msi_virqbase = desc->irq;
-
-		rc = devm_request_irq(&pdev->dev, desc->irq,
+	for (i = 0; i < HIDMA_MSI_INTS; i++) {
+		virq = msi_get_virq(&pdev->dev, i);
+		rc = devm_request_irq(&pdev->dev, virq,
 				       hidma_chirq_handler_msi,
 				       0, "qcom-hidma-msi",
 				       &dmadev->lldev);
-		if (rc) {
-			failed_desc = desc;
+		if (rc)
 			break;
-		}
+		if (!i)
+			dmadev->msi_virqbase = virq;
 	}
 
 	if (rc) {
 		/* free allocated MSI interrupts above */
-		for_each_msi_entry(desc, &pdev->dev) {
-			if (desc == failed_desc)
-				break;
-			devm_free_irq(&pdev->dev, desc->irq,
-				      &dmadev->lldev);
+		for (--i; i >= 0; i--) {
+			virq = msi_get_virq(&pdev->dev, i);
+			devm_free_irq(&pdev->dev, virq, &dmadev->lldev);
 		}
+		dev_warn(&pdev->dev,
+			 "failed to request MSI irq, falling back to wired IRQ\n");
 	} else {
 		/* Add callback to free MSIs on teardown */
 		hidma_ll_setup_irq(dmadev->lldev, true);
-
 	}
-	if (rc)
-		dev_warn(&pdev->dev,
-			 "failed to request MSI irq, falling back to wired IRQ\n");
 	return rc;
 #else
 	return -EINVAL;


