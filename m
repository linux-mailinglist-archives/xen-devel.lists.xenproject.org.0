Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8873C46ABAC
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 23:28:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239887.415931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMSU-000433-8H; Mon, 06 Dec 2021 22:27:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239887.415931; Mon, 06 Dec 2021 22:27:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMST-0003zf-VH; Mon, 06 Dec 2021 22:27:41 +0000
Received: by outflank-mailman (input) for mailman id 239887;
 Mon, 06 Dec 2021 22:27:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMSR-0001m5-Ez
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:27:39 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b621d662-56e3-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 23:27:37 +0100 (CET)
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
X-Inumbo-ID: b621d662-56e3-11ec-8a4d-196798b21f7b
Message-ID: <20211206210224.210768199@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638829655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=BDAIfQQJ/HYBQlNRSL+3v2qiAdmkDsDIsSFt3VNvN68=;
	b=GUOH6mWh41yMRUMKAp98aOVCT8hYo1MhFqsH8cMnArd7Joaq5tWDId+1tzWGfmFp4MhkDK
	fHIyaV3g98EAAJDH4thajAxgYu0m3cKfigGCoPT2xKRUJOay1yoB6gVJaZ4KQr73+lJIhF
	217Vew7bGgy7Rg6jJWbryS3guIp3T2avsXNZqL5l2fzu6eAEZf94hGHdwrc0sDuVqRRr8F
	YOFSttwR9zQl+lUR33+FUHV/lA4yrN4ussU95RvZHyirqbrl8Swdecf1BIQxTJKV9akSLD
	72+bCTmvb3yxzwtxXQKS+Dp9IUTPEzYeXHcPBKvJp67pMRTXdzTjCaz75gvKWw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638829655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=BDAIfQQJ/HYBQlNRSL+3v2qiAdmkDsDIsSFt3VNvN68=;
	b=HGDrJvU5isVeAMd5DGIpUPfL17YjFqAjIDf/BKb6AVkDejEhNeX5X92R0PYs3gYuQD20lS
	ukq3hUeso9wqpYBQ==
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
 Juergen Gross <jgross@suse.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org,
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
Subject: [patch V2 07/23] PCI/MSI: Remove msi_desc_to_pci_sysdata()
References: <20211206210147.872865823@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:27:34 +0100 (CET)

Last user is gone long ago.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/pci/msi.c   |    8 --------
 include/linux/msi.h |    5 -----
 2 files changed, 13 deletions(-)

--- a/drivers/pci/msi.c
+++ b/drivers/pci/msi.c
@@ -1267,14 +1267,6 @@ struct pci_dev *msi_desc_to_pci_dev(stru
 }
 EXPORT_SYMBOL(msi_desc_to_pci_dev);
 
-void *msi_desc_to_pci_sysdata(struct msi_desc *desc)
-{
-	struct pci_dev *dev = msi_desc_to_pci_dev(desc);
-
-	return dev->bus->sysdata;
-}
-EXPORT_SYMBOL_GPL(msi_desc_to_pci_sysdata);
-
 #ifdef CONFIG_PCI_MSI_IRQ_DOMAIN
 /**
  * pci_msi_domain_write_msg - Helper to write MSI message to PCI config space
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -218,13 +218,8 @@ static inline void msi_desc_set_iommu_co
 	for_each_msi_entry((desc), &(pdev)->dev)
 
 struct pci_dev *msi_desc_to_pci_dev(struct msi_desc *desc);
-void *msi_desc_to_pci_sysdata(struct msi_desc *desc);
 void pci_write_msi_msg(unsigned int irq, struct msi_msg *msg);
 #else /* CONFIG_PCI_MSI */
-static inline void *msi_desc_to_pci_sysdata(struct msi_desc *desc)
-{
-	return NULL;
-}
 static inline void pci_write_msi_msg(unsigned int irq, struct msi_msg *msg)
 {
 }


