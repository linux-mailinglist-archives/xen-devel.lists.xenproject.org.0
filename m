Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8489B46AD06
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 23:47:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240034.416209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMlb-0005oT-PR; Mon, 06 Dec 2021 22:47:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240034.416209; Mon, 06 Dec 2021 22:47:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMlb-0005mT-Ll; Mon, 06 Dec 2021 22:47:27 +0000
Received: by outflank-mailman (input) for mailman id 240034;
 Mon, 06 Dec 2021 22:47:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMe1-0004dp-UA
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:39:37 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64510e66-56e5-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 23:39:37 +0100 (CET)
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
X-Inumbo-ID: 64510e66-56e5-11ec-a5e1-b9374ead2679
Message-ID: <20211206210439.021277807@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638830376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=OQ0f5KjFgbSgmAVP4hnPtoqFO6q3+Ey9wT8c/Y+fgX8=;
	b=qT4xZpBBQ0W0WAPiWf1zJJDYqrWw+ae2Lg455lzO/6P3dumvTkmmO4OyNNpV7Ehjg/w2fl
	manHJleIsU6+wlUO34qbZ1k6P6+fjxe8BUkOz6OIEK3o0dKzrtvUgPypQwoUUUNIuZDXWM
	jnT7oY4poA/FbJovF4S/oz4eehalct4S0HCuDJJLpJBmvaR5HibVjBTc7GIHDoqZivOfX3
	iNd/9PdHT8ILfKUVyXiifKPtOz1VtZWGnO4Nr1SM+0tOgRkRXdJgokjEVSeB/BR9gvjNQB
	gsA5BgMNnlWPVbKtzFcSx9515yBP8sGdsrFziNqK9jyPrTDomPQd0ggxKPGeng==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638830376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=OQ0f5KjFgbSgmAVP4hnPtoqFO6q3+Ey9wT8c/Y+fgX8=;
	b=pP/dPC6PWwsNwzwAXjslgxnuRXxlApMSk05YyUr2uPuStX/4iB4GmcP+0fnXmnf907i7Do
	3vW65Ey/2ZjD8lDQ==
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
Subject: [patch V2 25/36] PCI/MSI: Provide MSI_FLAG_MSIX_CONTIGUOUS
References: <20211206210307.625116253@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:39:36 +0100 (CET)

Provide a domain info flag which makes the core code check for a contiguous
MSI-X index on allocation. That's simpler than checking it at some other
domain callback in architecture code.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/pci/msi/irqdomain.c |   16 ++++++++++++++--
 include/linux/msi.h         |    2 ++
 2 files changed, 16 insertions(+), 2 deletions(-)

--- a/drivers/pci/msi/irqdomain.c
+++ b/drivers/pci/msi/irqdomain.c
@@ -89,9 +89,21 @@ static int pci_msi_domain_check_cap(stru
 	if (pci_msi_desc_is_multi_msi(desc) &&
 	    !(info->flags & MSI_FLAG_MULTI_PCI_MSI))
 		return 1;
-	else if (desc->pci.msi_attrib.is_msix && !(info->flags & MSI_FLAG_PCI_MSIX))
-		return -ENOTSUPP;
 
+	if (desc->pci.msi_attrib.is_msix) {
+		if (!(info->flags & MSI_FLAG_PCI_MSIX))
+			return -ENOTSUPP;
+
+		if (info->flags & MSI_FLAG_MSIX_CONTIGUOUS) {
+			unsigned int idx = 0;
+
+			/* Check for gaps in the entry indices */
+			for_each_msi_entry(desc, dev) {
+				if (desc->msi_index != idx++)
+					return -ENOTSUPP;
+			}
+		}
+	}
 	return 0;
 }
 
--- a/include/linux/msi.h
+++ b/include/linux/msi.h
@@ -376,6 +376,8 @@ enum {
 	MSI_FLAG_LEVEL_CAPABLE		= (1 << 6),
 	/* Populate sysfs on alloc() and destroy it on free() */
 	MSI_FLAG_DEV_SYSFS		= (1 << 7),
+	/* MSI-X entries must be contiguous */
+	MSI_FLAG_MSIX_CONTIGUOUS	= (1 << 8),
 };
 
 int msi_domain_set_affinity(struct irq_data *data, const struct cpumask *mask,


