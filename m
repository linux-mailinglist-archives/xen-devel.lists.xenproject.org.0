Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D7245FA4F
	for <lists+xen-devel@lfdr.de>; Sat, 27 Nov 2021 02:27:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.233711.405843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmVF-0005WB-3t; Sat, 27 Nov 2021 01:27:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 233711.405843; Sat, 27 Nov 2021 01:27:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqmVE-0005Qz-R2; Sat, 27 Nov 2021 01:27:44 +0000
Received: by outflank-mailman (input) for mailman id 233711;
 Sat, 27 Nov 2021 01:27:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Erow=QO=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mqmNJ-0002cc-1z
 for xen-devel@lists.xenproject.org; Sat, 27 Nov 2021 01:19:33 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 134f63c5-4f20-11ec-b941-1df2895da90e;
 Sat, 27 Nov 2021 02:19:32 +0100 (CET)
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
X-Inumbo-ID: 134f63c5-4f20-11ec-b941-1df2895da90e
Message-ID: <20211126223824.499448912@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1637975972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=+rP3SiVoHOK5Hyn2EAGrDg54y7+IEHUse42w3xFRuo4=;
	b=GZtNRyLlH/e5OpTSND8bF970MJ3fY7FdRfj38E/r7ng2p45KWkHgceg0icdFzPLgigpytE
	Fym4baUdy07DdDIOiZrpNxxF++OCBY7W8j1lEVZULJLifakW6LTg7ijAAoGZxbG8XQdhbz
	VCrepKXpYyJqAikJNbdrnWREwoaNCp2+XxA3nYx2haGIusHDn2lh1fxH5hP2L4o5jnZRqC
	jeF8Sj+ixZNdquUFrUfT/U1WNOZxyjieeFTKxIRFoaZK0fcR3nhRE/5uXoRGIXozQ1Gh07
	L3hpfVi+jBbigVTbuJXxNd944CCq/zvAdZ8Aebuq5TBGq06NoA8cmAqFsS1dNA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1637975972;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=+rP3SiVoHOK5Hyn2EAGrDg54y7+IEHUse42w3xFRuo4=;
	b=X5sjWWkhuqv/3zYkRcRE3edfZTIPgaV55WlsS4t3lgLnAlxdopVc0evkJrDtSxZnMxBMsJ
	LRlkDSzBSKFgBRBw==
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
Date: Sat, 27 Nov 2021 02:19:31 +0100 (CET)

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


