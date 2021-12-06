Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2BF46AD0B
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 23:47:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240039.416231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMlp-000790-JD; Mon, 06 Dec 2021 22:47:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240039.416231; Mon, 06 Dec 2021 22:47:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMlp-00076N-FH; Mon, 06 Dec 2021 22:47:41 +0000
Received: by outflank-mailman (input) for mailman id 240039;
 Mon, 06 Dec 2021 22:47:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMe9-0004dp-QF
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:39:45 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68fbe46e-56e5-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 23:39:45 +0100 (CET)
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
X-Inumbo-ID: 68fbe46e-56e5-11ec-a5e1-b9374ead2679
Message-ID: <20211206210439.289194020@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638830384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=jjYpKlfviGkOs8GJ86qqUCf8iCclgx/MvIgVwsbGrI8=;
	b=CWfcJ/iBUYjrpon8kS2pojeizMcv7c60QxvaLAU5LI7KfIMvLSxmIM/m6bfUaFi/gGyxAb
	PdqO0v+VPjjzILOgrIY49OVkafA0iReKzvL8PY9tzXeT2OhfpAJ4GW6YLu65K/Ld7nLIG0
	dbzZwwZ742NgY9QLmrAZqlDg1SC6c+Vxj66hiQWNzv4d8TaTEE4oqgYxP5G8UX+MQMw73e
	+b6nz9F4GAlHfDc5dR9qnGxMEdL//gXdSMYdGOcVIGZyzLatX6atJs5gbWAUqCzw+Ld7RN
	hETb0rVdGgYiZNsPAYhQE+wSINXC0JxDMrNyubVTne/6jVvmGPHY/Mo/UsX8LQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638830384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=jjYpKlfviGkOs8GJ86qqUCf8iCclgx/MvIgVwsbGrI8=;
	b=wbBVA5z+1RlpKAaa5w62yohCfb98XisYXj6A57jf4CV6E6TSRwWAqsQRcXyzzVkM5x3Dtz
	DSeIPQrauDdTp2AA==
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
 dmaengine@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>,
 Will Deacon <will@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 iommu@lists.linux-foundation.org,
 Stuart Yoder <stuyoder@gmail.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Sinan Kaya <okaya@kernel.org>
Subject: [patch V2 30/36] dmaengine: mv_xor_v2: Get rid of msi_desc abuse
References: <20211206210307.625116253@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:39:44 +0100 (CET)

Storing a pointer to the MSI descriptor just to keep track of the Linux
interrupt number is daft. Use msi_get_virq() instead.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Cc: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>
---
 drivers/dma/mv_xor_v2.c |   16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

--- a/drivers/dma/mv_xor_v2.c
+++ b/drivers/dma/mv_xor_v2.c
@@ -149,7 +149,7 @@ struct mv_xor_v2_descriptor {
  * @desc_size: HW descriptor size
  * @npendings: number of pending descriptors (for which tx_submit has
  * @hw_queue_idx: HW queue index
- * @msi_desc: local interrupt descriptor information
+ * @irq: The Linux interrupt number
  * been called, but not yet issue_pending)
  */
 struct mv_xor_v2_device {
@@ -168,7 +168,7 @@ struct mv_xor_v2_device {
 	int desc_size;
 	unsigned int npendings;
 	unsigned int hw_queue_idx;
-	struct msi_desc *msi_desc;
+	unsigned int irq;
 };
 
 /**
@@ -718,7 +718,6 @@ static int mv_xor_v2_probe(struct platfo
 	int i, ret = 0;
 	struct dma_device *dma_dev;
 	struct mv_xor_v2_sw_desc *sw_desc;
-	struct msi_desc *msi_desc;
 
 	BUILD_BUG_ON(sizeof(struct mv_xor_v2_descriptor) !=
 		     MV_XOR_V2_EXT_DESC_SIZE);
@@ -770,14 +769,9 @@ static int mv_xor_v2_probe(struct platfo
 	if (ret)
 		goto disable_clk;
 
-	msi_desc = first_msi_entry(&pdev->dev);
-	if (!msi_desc) {
-		ret = -ENODEV;
-		goto free_msi_irqs;
-	}
-	xor_dev->msi_desc = msi_desc;
+	xor_dev->irq = msi_get_virq(&pdev->dev, 0);
 
-	ret = devm_request_irq(&pdev->dev, msi_desc->irq,
+	ret = devm_request_irq(&pdev->dev, xor_dev->irq,
 			       mv_xor_v2_interrupt_handler, 0,
 			       dev_name(&pdev->dev), xor_dev);
 	if (ret)
@@ -892,7 +886,7 @@ static int mv_xor_v2_remove(struct platf
 			  xor_dev->desc_size * MV_XOR_V2_DESC_NUM,
 			  xor_dev->hw_desq_virt, xor_dev->hw_desq);
 
-	devm_free_irq(&pdev->dev, xor_dev->msi_desc->irq, xor_dev);
+	devm_free_irq(&pdev->dev, xor_dev->irq, xor_dev);
 
 	platform_msi_domain_free_irqs(&pdev->dev);
 


