Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BB346AC45
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 23:38:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239979.416088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMcb-0007SK-Jr; Mon, 06 Dec 2021 22:38:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239979.416088; Mon, 06 Dec 2021 22:38:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMcb-0007QD-Gg; Mon, 06 Dec 2021 22:38:09 +0000
Received: by outflank-mailman (input) for mailman id 239979;
 Mon, 06 Dec 2021 22:38:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMSl-0001m5-4O
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:27:59 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3c3fa73-56e3-11ec-8a4d-196798b21f7b;
 Mon, 06 Dec 2021 23:27:58 +0100 (CET)
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
X-Inumbo-ID: c3c3fa73-56e3-11ec-8a4d-196798b21f7b
Message-ID: <20211206210224.980989243@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638829678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=YWBvF5zXcDfRUfEoyBk4Kk35zgLL7tyJ9PWeow343Hs=;
	b=jwThvHARsPXTlMHIlndJwa10LjHcshFU6NoML8SG2JGecBMWy4JPiHuWFnGcP7i4Q1Ibj9
	8/eowhkrx1wKGYm2Yxrw7xrDhLIewEAHBE8layal+21UsPmPoYAdbuy3jJUREs5PCuecye
	7m+VUQ/rPIgBX30eS2stYDrLVHUftcTe2LN/Q1eeUdPqRiMNfed020JM797KQYT7nPIA/z
	TmSwV/cB5rCcOQB4kL1Ge9QBNfhiTLnud2sKQVAEnQK9z3iC+nzZSzw4bFmLKQuIgKUo7a
	vIALLKQRlHw2SJH97tyJGigjR7KCwlJGJTEagLbQtpMSi36ZAkynmCJEolc1UQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638829678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=YWBvF5zXcDfRUfEoyBk4Kk35zgLL7tyJ9PWeow343Hs=;
	b=WWO0wDP12OPjmI9cLbgeixKjE+ylewjJ4EqqGA8strpjub+l5CYlIKtxJmN+Pp2T3jnqE9
	pSxUKy0jh2EVgdBQ==
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
Subject: [patch V2 21/23] PCI/MSI: Make pci_msi_domain_check_cap() static
References: <20211206210147.872865823@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:27:57 +0100 (CET)

No users outside of that file.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Tested-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/pci/msi/irqdomain.c |    5 +++--
 include/linux/msi.h         |    2 --
 2 files changed, 3 insertions(+), 4 deletions(-)

--- a/drivers/pci/msi/irqdomain.c
+++ b/drivers/pci/msi/irqdomain.c
@@ -79,8 +79,9 @@ static inline bool pci_msi_desc_is_multi
  *  1 if Multi MSI is requested, but the domain does not support it
  *  -ENOTSUPP otherwise
  */
-int pci_msi_domain_check_cap(struct irq_domain *domain,
-			     struct msi_domain_info *info, struct device *dev)
+static int pci_msi_domain_check_cap(struct irq_domain *domain,
+				    struct msi_domain_info *info,
+				    struct device *dev)
 {
 	struct msi_desc *desc = first_pci_msi_entry(to_pci_dev(dev));
 
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -439,8 +439,6 @@ void *platform_msi_get_host_data(struct
 struct irq_domain *pci_msi_create_irq_domain(struct fwnode_handle *fwnode,
 					     struct msi_domain_info *info,
 					     struct irq_domain *parent);
-int pci_msi_domain_check_cap(struct irq_domain *domain,
-			     struct msi_domain_info *info, struct device *dev);
 u32 pci_msi_domain_get_msi_rid(struct irq_domain *domain, struct pci_dev *pdev);
 struct irq_domain *pci_msi_get_device_domain(struct pci_dev *pdev);
 bool pci_dev_has_special_msi_domain(struct pci_dev *pdev);


