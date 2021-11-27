Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B337545F7E6
	for <lists+xen-devel@lfdr.de>; Sat, 27 Nov 2021 02:19:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233589.405354 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmMc-0003sD-2N; Sat, 27 Nov 2021 01:18:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233589.405354; Sat, 27 Nov 2021 01:18:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmMb-0003nE-LK; Sat, 27 Nov 2021 01:18:49 +0000
Received: by outflank-mailman (input) for mailman id 233589;
 Sat, 27 Nov 2021 01:18:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Erow=QO=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mqmMa-00020H-1Y
 for xen-devel@lists.xenproject.org; Sat, 27 Nov 2021 01:18:48 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f7d083cc-4f1f-11ec-9787-a32c541c8605;
 Sat, 27 Nov 2021 02:18:46 +0100 (CET)
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
X-Inumbo-ID: f7d083cc-4f1f-11ec-9787-a32c541c8605
Message-ID: <20211126223824.499448912@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1637975926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=+rP3SiVoHOK5Hyn2EAGrDg54y7+IEHUse42w3xFRuo4=;
	b=en2BVqplFMhJlJ/67iu0Edu2NrGl2YoL7tfUkBXuWGzeU2hxeKRsBezk52+o99rxhr3938
	TRs0SQYeEY0XTWyetTmz5VEY4LyU/pCwOfsvgmIpv0evVB0njacCp5HZd95Lk6yEtPp2qC
	d1p1yOFMjNpOmU2EZz/humF1AL+c2gchzbmiK8fKoyFQFRNZr0ge/HjuNEWf7dAqZ3u/dl
	ZGfz8C379X5x+ikPMgYdarUXfu9tN65dbvfK9I1hJFDQrDXnn2iLf1UCuWBh5HtK4Sw7VS
	fwKOlxrXeck+pJ2IkumMPe/8tucPvP0pUZ/lUZw7GXQSElER8i5i2Fkh/6Q4mA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1637975926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=+rP3SiVoHOK5Hyn2EAGrDg54y7+IEHUse42w3xFRuo4=;
	b=4hUVGqAr7Jj3KAwcapzMWVWkLocnYS1dwMuxMKLswtqj7uo9lVzO01+ZZON8j5/GAbX8Ix
	yWVdyyLvdQ59eaCw==
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
 Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 linux-mips@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 sparclinux@vger.kernel.org,
 x86@kernel.org,
 xen-devel@lists.xenproject.org,
 ath11k@lists.infradead.org,
 Wei Liu <wei.liu@kernel.org>,
 linux-hyperv@vger.kernel.org,
 Juergen Gross <jgross@suse.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>
Subject: [patch 07/22] PCI/MSI: Remove msi_desc_to_pci_sysdata()
References: <20211126222700.862407977@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Sat, 27 Nov 2021 02:18:45 +0100 (CET)

Last user is gone long ago.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/pci/msi.c   |    8 --------
 include/linux/msi.h |    5 -----
 2 files changed, 13 deletions(-)

--- a/drivers/pci/msi.c
+++ b/drivers/pci/msi.c
@@ -1253,14 +1253,6 @@ struct pci_dev *msi_desc_to_pci_dev(stru
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
@@ -217,13 +217,8 @@ static inline void msi_desc_set_iommu_co
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


