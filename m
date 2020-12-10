Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 230072D676D
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 20:51:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.49822.88207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knRyL-0002rQ-Dl; Thu, 10 Dec 2020 19:51:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 49822.88207; Thu, 10 Dec 2020 19:51:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knRyL-0002qN-5W; Thu, 10 Dec 2020 19:51:29 +0000
Received: by outflank-mailman (input) for mailman id 49822;
 Thu, 10 Dec 2020 19:51:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hbU1=FO=linutronix.de=tglx@srs-us1.protection.inumbo.net>)
 id 1knRqO-0007OY-EG
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 19:43:16 +0000
Received: from galois.linutronix.de (unknown [193.142.43.55])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bc48ef13-6c2c-4973-826d-9ac63d48cf28;
 Thu, 10 Dec 2020 19:42:39 +0000 (UTC)
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
X-Inumbo-ID: bc48ef13-6c2c-4973-826d-9ac63d48cf28
Message-Id: <20201210194044.473308721@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1607629358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=hb66G/YKxZssYUpIlaqnSR4ZW1k+vqs7JSWYZ8olni4=;
	b=JDGcEIf6xGhVDkvwWeMQLx9FUu/IsKss78ihAlKadMjAIf3dHANCzucDD5C2rHnEBhKkDC
	fs0LpWbG65iC+gn0dqp5B//hOUr0DzpNnSBFKb88Vue5ngozd1tGLn7CtzLKEI29imO25z
	joiUdDjr1d2lfyigu/UfV0ehuoSmHFo9AhA/FqDn1vazpBLlgf2ND1DS3dxniHAdDnilk3
	1qIkGuqztzebcid1bBRJTHx9CoWTI1/9XLZXX10DwpIeYbsmtua3l8q5FWiIGABqtq0mdG
	+jGGNyapUz+w2HLUzMDsdOexP4c9y0H7CnIR6EVRiH9/1y/HRKjopWTfNI7hPQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1607629358;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:  references:references;
	bh=hb66G/YKxZssYUpIlaqnSR4ZW1k+vqs7JSWYZ8olni4=;
	b=Fyn3b5Uer8Bt9xBrcUD7/wbs4Zq09nDfu7V/W/qeQGG6ZMTLCbkszqx6GueqYSkgtweAWi
	EEbLWcn1hOF4e1Aw==
Date: Thu, 10 Dec 2020 20:25:55 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Marc Zyngier <maz@kernel.org>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>,
 Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 linux-pci@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>,
 afzal mohammed <afzal.mohd.ma@gmail.com>,
 linux-parisc@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Wambui Karuga <wambui.karugax@gmail.com>,
 intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 linux-gpio@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>,
 Jon Mason <jdmason@kudzu.us>,
 Dave Jiang <dave.jiang@intel.com>,
 Allen Hubbe <allenbh@gmail.com>,
 linux-ntb@googlegroups.com,
 Michal Simek <michal.simek@xilinx.com>,
 Tariq Toukan <tariqt@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>,
 netdev@vger.kernel.org,
 linux-rdma@vger.kernel.org,
 Saeed Mahameed <saeedm@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Subject: [patch 19/30] PCI: mobiveil: Use irq_data_get_irq_chip_data()
References: <20201210192536.118432146@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit

Going through a full irq descriptor lookup instead of just using the proper
helper function which provides direct access is suboptimal.

In fact it _is_ wrong because the chip callback needs to get the chip data
which is relevant for the chip while using the irq descriptor variant
returns the irq chip data of the top level chip of a hierarchy. It does not
matter in this case because the chip is the top level chip, but that
doesn't make it more correct.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>
Cc: Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org
---
 drivers/pci/controller/mobiveil/pcie-mobiveil-host.c |    8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

--- a/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
+++ b/drivers/pci/controller/mobiveil/pcie-mobiveil-host.c
@@ -306,13 +306,11 @@ int mobiveil_host_init(struct mobiveil_p
 
 static void mobiveil_mask_intx_irq(struct irq_data *data)
 {
-	struct irq_desc *desc = irq_to_desc(data->irq);
-	struct mobiveil_pcie *pcie;
+	struct mobiveil_pcie *pcie = irq_data_get_irq_chip_data(data);
 	struct mobiveil_root_port *rp;
 	unsigned long flags;
 	u32 mask, shifted_val;
 
-	pcie = irq_desc_get_chip_data(desc);
 	rp = &pcie->rp;
 	mask = 1 << ((data->hwirq + PAB_INTX_START) - 1);
 	raw_spin_lock_irqsave(&rp->intx_mask_lock, flags);
@@ -324,13 +322,11 @@ static void mobiveil_mask_intx_irq(struc
 
 static void mobiveil_unmask_intx_irq(struct irq_data *data)
 {
-	struct irq_desc *desc = irq_to_desc(data->irq);
-	struct mobiveil_pcie *pcie;
+	struct mobiveil_pcie *pcie = irq_data_get_irq_chip_data(data);
 	struct mobiveil_root_port *rp;
 	unsigned long flags;
 	u32 shifted_val, mask;
 
-	pcie = irq_desc_get_chip_data(desc);
 	rp = &pcie->rp;
 	mask = 1 << ((data->hwirq + PAB_INTX_START) - 1);
 	raw_spin_lock_irqsave(&rp->intx_mask_lock, flags);


