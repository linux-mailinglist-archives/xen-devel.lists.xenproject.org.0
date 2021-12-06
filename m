Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBA046ABAA
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 23:28:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239880.415855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMSI-0001ol-FS; Mon, 06 Dec 2021 22:27:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239880.415855; Mon, 06 Dec 2021 22:27:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMSI-0001m6-A0; Mon, 06 Dec 2021 22:27:30 +0000
Received: by outflank-mailman (input) for mailman id 239880;
 Mon, 06 Dec 2021 22:27:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMSG-0001Vt-6s
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:27:28 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0657015-56e3-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 23:27:26 +0100 (CET)
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
X-Inumbo-ID: b0657015-56e3-11ec-a5e1-b9374ead2679
Message-ID: <20211206210223.872249537@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638829645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=gqz42Pofka0siw8CcddaQz8SUgWLIxuaB16oER6dwV4=;
	b=pe+GcvL6ODtEZD4skWxk/PvzK4F2OW++iXRqeyGbhc0IlKAUIUscA/0YJ8LK43n/sn9oot
	4a+8++vMkE5sKGwHy/ADtrtQAUoXJY48gJoE/AR9bBgX/KzNPqc/113f8bs1q76ETUz7iH
	eM7jScACOqG3CV6StNnqqhuKbbL/SYxHEzsSSIvdjcOOf1HiAyfStD7FbIzX6vU4tqBGEF
	FhRme1JpynfK8Szyi6xWoQlc7HPLO1yvWoEkbxTTZ2KgqRBsLuUmoOuff/xWezXF1i/sBB
	eXgIQTCvaTyUQLeZ8NwlR8UrvXbQAbU/jOQHxFJiOUeSAc+QA2QUEsqYIB8hLg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638829645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=gqz42Pofka0siw8CcddaQz8SUgWLIxuaB16oER6dwV4=;
	b=ZkE5ZE9yfufGy0hPQxtaVpW4nh5o7qTk0egIVSjesPqKuGg4dq5nuUEI42HrRuv5UjaXT9
	yqKgJ4nKA8OI9YDw==
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
 Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org,
 Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org,
 Kalle Valo <kvalo@codeaurora.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 sparclinux@vger.kernel.org,
 x86@kernel.org,
 xen-devel@lists.xenproject.org,
 ath11k@lists.infradead.org,
 Wei Liu <wei.liu@kernel.org>,
 linux-hyperv@vger.kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>
Subject: [patch V2 01/23] powerpc/4xx: Remove MSI support which never worked
References: <20211206210147.872865823@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:27:25 +0100 (CET)

This code is broken since day one. ppc4xx_setup_msi_irqs() has the
following gems:

 1) The handling of the result of msi_bitmap_alloc_hwirqs() is completely
    broken:
    
    When the result is greater than or equal 0 (bitmap allocation
    successful) then the loop terminates and the function returns 0
    (success) despite not having installed an interrupt.

    When the result is less than 0 (bitmap allocation fails), it prints an
    error message and continues to "work" with that error code which would
    eventually end up in the MSI message data.

 2) On every invocation the file global pp4xx_msi::msi_virqs bitmap is
    allocated thereby leaking the previous one.

IOW, this has never worked and for more than 10 years nobody cared. Remove
the gunk.

Fixes: 3fb7933850fa ("powerpc/4xx: Adding PCIe MSI support")
Fixes: 247540b03bfc ("powerpc/44x: Fix PCI MSI support for Maui APM821xx SoC and Bluestone board")
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/platforms/4xx/Makefile |    1 
 arch/powerpc/platforms/4xx/msi.c    |  281 ------------------------------------
 arch/powerpc/sysdev/Kconfig         |    6 
 3 files changed, 288 deletions(-)

--- a/arch/powerpc/platforms/4xx/Makefile
+++ b/arch/powerpc/platforms/4xx/Makefile
@@ -3,6 +3,5 @@ obj-y				+= uic.o machine_check.o
 obj-$(CONFIG_4xx_SOC)		+= soc.o
 obj-$(CONFIG_PCI)		+= pci.o
 obj-$(CONFIG_PPC4xx_HSTA_MSI)	+= hsta_msi.o
-obj-$(CONFIG_PPC4xx_MSI)	+= msi.o
 obj-$(CONFIG_PPC4xx_CPM)	+= cpm.o
 obj-$(CONFIG_PPC4xx_GPIO)	+= gpio.o
--- a/arch/powerpc/platforms/4xx/msi.c
+++ /dev/null
@@ -1,281 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Adding PCI-E MSI support for PPC4XX SoCs.
- *
- * Copyright (c) 2010, Applied Micro Circuits Corporation
- * Authors:	Tirumala R Marri <tmarri@apm.com>
- *		Feng Kan <fkan@apm.com>
- */
-
-#include <linux/irq.h>
-#include <linux/pci.h>
-#include <linux/msi.h>
-#include <linux/of_platform.h>
-#include <linux/interrupt.h>
-#include <linux/export.h>
-#include <linux/kernel.h>
-#include <asm/prom.h>
-#include <asm/hw_irq.h>
-#include <asm/ppc-pci.h>
-#include <asm/dcr.h>
-#include <asm/dcr-regs.h>
-#include <asm/msi_bitmap.h>
-
-#define PEIH_TERMADH	0x00
-#define PEIH_TERMADL	0x08
-#define PEIH_MSIED	0x10
-#define PEIH_MSIMK	0x18
-#define PEIH_MSIASS	0x20
-#define PEIH_FLUSH0	0x30
-#define PEIH_FLUSH1	0x38
-#define PEIH_CNTRST	0x48
-
-static int msi_irqs;
-
-struct ppc4xx_msi {
-	u32 msi_addr_lo;
-	u32 msi_addr_hi;
-	void __iomem *msi_regs;
-	int *msi_virqs;
-	struct msi_bitmap bitmap;
-	struct device_node *msi_dev;
-};
-
-static struct ppc4xx_msi ppc4xx_msi;
-
-static int ppc4xx_msi_init_allocator(struct platform_device *dev,
-		struct ppc4xx_msi *msi_data)
-{
-	int err;
-
-	err = msi_bitmap_alloc(&msi_data->bitmap, msi_irqs,
-			      dev->dev.of_node);
-	if (err)
-		return err;
-
-	err = msi_bitmap_reserve_dt_hwirqs(&msi_data->bitmap);
-	if (err < 0) {
-		msi_bitmap_free(&msi_data->bitmap);
-		return err;
-	}
-
-	return 0;
-}
-
-static int ppc4xx_setup_msi_irqs(struct pci_dev *dev, int nvec, int type)
-{
-	int int_no = -ENOMEM;
-	unsigned int virq;
-	struct msi_msg msg;
-	struct msi_desc *entry;
-	struct ppc4xx_msi *msi_data = &ppc4xx_msi;
-
-	dev_dbg(&dev->dev, "PCIE-MSI:%s called. vec %x type %d\n",
-		__func__, nvec, type);
-	if (type == PCI_CAP_ID_MSIX)
-		pr_debug("ppc4xx msi: MSI-X untested, trying anyway.\n");
-
-	msi_data->msi_virqs = kmalloc_array(msi_irqs, sizeof(int), GFP_KERNEL);
-	if (!msi_data->msi_virqs)
-		return -ENOMEM;
-
-	for_each_pci_msi_entry(entry, dev) {
-		int_no = msi_bitmap_alloc_hwirqs(&msi_data->bitmap, 1);
-		if (int_no >= 0)
-			break;
-		if (int_no < 0) {
-			pr_debug("%s: fail allocating msi interrupt\n",
-					__func__);
-		}
-		virq = irq_of_parse_and_map(msi_data->msi_dev, int_no);
-		if (!virq) {
-			dev_err(&dev->dev, "%s: fail mapping irq\n", __func__);
-			msi_bitmap_free_hwirqs(&msi_data->bitmap, int_no, 1);
-			return -ENOSPC;
-		}
-		dev_dbg(&dev->dev, "%s: virq = %d\n", __func__, virq);
-
-		/* Setup msi address space */
-		msg.address_hi = msi_data->msi_addr_hi;
-		msg.address_lo = msi_data->msi_addr_lo;
-
-		irq_set_msi_desc(virq, entry);
-		msg.data = int_no;
-		pci_write_msi_msg(virq, &msg);
-	}
-	return 0;
-}
-
-void ppc4xx_teardown_msi_irqs(struct pci_dev *dev)
-{
-	struct msi_desc *entry;
-	struct ppc4xx_msi *msi_data = &ppc4xx_msi;
-	irq_hw_number_t hwirq;
-
-	dev_dbg(&dev->dev, "PCIE-MSI: tearing down msi irqs\n");
-
-	for_each_pci_msi_entry(entry, dev) {
-		if (!entry->irq)
-			continue;
-		hwirq = virq_to_hw(entry->irq);
-		irq_set_msi_desc(entry->irq, NULL);
-		irq_dispose_mapping(entry->irq);
-		msi_bitmap_free_hwirqs(&msi_data->bitmap, hwirq, 1);
-	}
-}
-
-static int ppc4xx_setup_pcieh_hw(struct platform_device *dev,
-				 struct resource res, struct ppc4xx_msi *msi)
-{
-	const u32 *msi_data;
-	const u32 *msi_mask;
-	const u32 *sdr_addr;
-	dma_addr_t msi_phys;
-	void *msi_virt;
-	int err;
-
-	sdr_addr = of_get_property(dev->dev.of_node, "sdr-base", NULL);
-	if (!sdr_addr)
-		return -EINVAL;
-
-	msi_data = of_get_property(dev->dev.of_node, "msi-data", NULL);
-	if (!msi_data)
-		return -EINVAL;
-
-	msi_mask = of_get_property(dev->dev.of_node, "msi-mask", NULL);
-	if (!msi_mask)
-		return -EINVAL;
-
-	msi->msi_dev = of_find_node_by_name(NULL, "ppc4xx-msi");
-	if (!msi->msi_dev)
-		return -ENODEV;
-
-	msi->msi_regs = of_iomap(msi->msi_dev, 0);
-	if (!msi->msi_regs) {
-		dev_err(&dev->dev, "of_iomap failed\n");
-		err = -ENOMEM;
-		goto node_put;
-	}
-	dev_dbg(&dev->dev, "PCIE-MSI: msi register mapped 0x%x 0x%x\n",
-		(u32) (msi->msi_regs + PEIH_TERMADH), (u32) (msi->msi_regs));
-
-	msi_virt = dma_alloc_coherent(&dev->dev, 64, &msi_phys, GFP_KERNEL);
-	if (!msi_virt) {
-		err = -ENOMEM;
-		goto iounmap;
-	}
-	msi->msi_addr_hi = upper_32_bits(msi_phys);
-	msi->msi_addr_lo = lower_32_bits(msi_phys & 0xffffffff);
-	dev_dbg(&dev->dev, "PCIE-MSI: msi address high 0x%x, low 0x%x\n",
-		msi->msi_addr_hi, msi->msi_addr_lo);
-
-	mtdcri(SDR0, *sdr_addr, upper_32_bits(res.start));	/*HIGH addr */
-	mtdcri(SDR0, *sdr_addr + 1, lower_32_bits(res.start));	/* Low addr */
-
-	/* Progam the Interrupt handler Termination addr registers */
-	out_be32(msi->msi_regs + PEIH_TERMADH, msi->msi_addr_hi);
-	out_be32(msi->msi_regs + PEIH_TERMADL, msi->msi_addr_lo);
-
-	/* Program MSI Expected data and Mask bits */
-	out_be32(msi->msi_regs + PEIH_MSIED, *msi_data);
-	out_be32(msi->msi_regs + PEIH_MSIMK, *msi_mask);
-
-	dma_free_coherent(&dev->dev, 64, msi_virt, msi_phys);
-
-	return 0;
-
-iounmap:
-	iounmap(msi->msi_regs);
-node_put:
-	of_node_put(msi->msi_dev);
-	return err;
-}
-
-static int ppc4xx_of_msi_remove(struct platform_device *dev)
-{
-	struct ppc4xx_msi *msi = dev->dev.platform_data;
-	int i;
-	int virq;
-
-	for (i = 0; i < msi_irqs; i++) {
-		virq = msi->msi_virqs[i];
-		if (virq)
-			irq_dispose_mapping(virq);
-	}
-
-	if (msi->bitmap.bitmap)
-		msi_bitmap_free(&msi->bitmap);
-	iounmap(msi->msi_regs);
-	of_node_put(msi->msi_dev);
-
-	return 0;
-}
-
-static int ppc4xx_msi_probe(struct platform_device *dev)
-{
-	struct ppc4xx_msi *msi;
-	struct resource res;
-	int err = 0;
-	struct pci_controller *phb;
-
-	dev_dbg(&dev->dev, "PCIE-MSI: Setting up MSI support...\n");
-
-	msi = devm_kzalloc(&dev->dev, sizeof(*msi), GFP_KERNEL);
-	if (!msi)
-		return -ENOMEM;
-	dev->dev.platform_data = msi;
-
-	/* Get MSI ranges */
-	err = of_address_to_resource(dev->dev.of_node, 0, &res);
-	if (err) {
-		dev_err(&dev->dev, "%pOF resource error!\n", dev->dev.of_node);
-		return err;
-	}
-
-	msi_irqs = of_irq_count(dev->dev.of_node);
-	if (!msi_irqs)
-		return -ENODEV;
-
-	err = ppc4xx_setup_pcieh_hw(dev, res, msi);
-	if (err)
-		return err;
-
-	err = ppc4xx_msi_init_allocator(dev, msi);
-	if (err) {
-		dev_err(&dev->dev, "Error allocating MSI bitmap\n");
-		goto error_out;
-	}
-	ppc4xx_msi = *msi;
-
-	list_for_each_entry(phb, &hose_list, list_node) {
-		phb->controller_ops.setup_msi_irqs = ppc4xx_setup_msi_irqs;
-		phb->controller_ops.teardown_msi_irqs = ppc4xx_teardown_msi_irqs;
-	}
-	return 0;
-
-error_out:
-	ppc4xx_of_msi_remove(dev);
-	return err;
-}
-static const struct of_device_id ppc4xx_msi_ids[] = {
-	{
-		.compatible = "amcc,ppc4xx-msi",
-	},
-	{}
-};
-static struct platform_driver ppc4xx_msi_driver = {
-	.probe = ppc4xx_msi_probe,
-	.remove = ppc4xx_of_msi_remove,
-	.driver = {
-		   .name = "ppc4xx-msi",
-		   .of_match_table = ppc4xx_msi_ids,
-		   },
-
-};
-
-static __init int ppc4xx_msi_init(void)
-{
-	return platform_driver_register(&ppc4xx_msi_driver);
-}
-
-subsys_initcall(ppc4xx_msi_init);
--- a/arch/powerpc/sysdev/Kconfig
+++ b/arch/powerpc/sysdev/Kconfig
@@ -12,17 +12,11 @@ config PPC4xx_HSTA_MSI
 	depends on PCI_MSI
 	depends on PCI && 4xx
 
-config PPC4xx_MSI
-	bool
-	depends on PCI_MSI
-	depends on PCI && 4xx
-
 config PPC_MSI_BITMAP
 	bool
 	depends on PCI_MSI
 	default y if MPIC
 	default y if FSL_PCI
-	default y if PPC4xx_MSI
 	default y if PPC_POWERNV
 
 source "arch/powerpc/sysdev/xics/Kconfig"


