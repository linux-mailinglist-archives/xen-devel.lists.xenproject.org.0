Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47160470D20
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 23:19:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.244357.422700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvoEC-000710-7U; Fri, 10 Dec 2021 22:18:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 244357.422700; Fri, 10 Dec 2021 22:18:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvoEB-0006wY-SU; Fri, 10 Dec 2021 22:18:55 +0000
Received: by outflank-mailman (input) for mailman id 244357;
 Fri, 10 Dec 2021 22:18:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nm8/=Q3=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mvoE9-0005LR-Ui
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 22:18:53 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2884b7df-5a07-11ec-ad7a-b7ef48004f0a;
 Fri, 10 Dec 2021 23:18:53 +0100 (CET)
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
X-Inumbo-ID: 2884b7df-5a07-11ec-ad7a-b7ef48004f0a
Message-ID: <20211210221813.556202506@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1639174733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=4RBIpMLSx9fo7S3MVLgbPP6cYR3euRHVRt1vIjvLV4U=;
	b=eFwbxZ19sBwXOtZfaU9b68cRvDQr8Sc+5tFM8f+F85TqivDCre0VEP725UcXl+uCQNVwKg
	th5/P6pSHGU17/a07xZLVPs/inK96YGN0P8AVWusIBfugZ1VzOQwzILhbCMtpONvc2WXfS
	7tC0gKf8ggCcvGX0cZsFURAzOnX4SWiSiWBvq0yugB0Urkr1RzoMtfW4UBhLOolAcHMWEq
	8H9bNQmYEImVfPDpv7nBqpZqvmsgnsh02b/+ZEunwO9Rs+JWgiGZd954VBu+PM2tDQZVj6
	8gav38VhnHP0iMod6jbXLJ3KUM93DcPae/bJJ76Y8Igr1sJLMglnyFtpTjhkSQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1639174733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=4RBIpMLSx9fo7S3MVLgbPP6cYR3euRHVRt1vIjvLV4U=;
	b=WYa+NdWlWzJ03zg9xAtS1+YMoE5TJHwS2b+RN+noddeR78xU6q7+ZPKxIZRkWf4y7NHAji
	EqHm91dbXa6KWXAg==
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
 linuxppc-dev@lists.ozlabs.org,
 Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org,
 Arnd Bergmann <arnd@arndb.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Stuart Yoder <stuyoder@gmail.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>,
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
Subject: [patch V3 06/35] powerpc/pseries/msi: Use PCI device properties
References: <20211210221642.869015045@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Dec 2021 23:18:52 +0100 (CET)

From: Thomas Gleixner <tglx@linutronix.de>

instead of fiddling with MSI descriptors.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
---
V3: Use pci_dev->msix_enabled - Jason
---
 arch/powerpc/platforms/pseries/msi.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- a/arch/powerpc/platforms/pseries/msi.c
+++ b/arch/powerpc/platforms/pseries/msi.c
@@ -448,8 +448,7 @@ static int pseries_msi_ops_prepare(struc
 				   int nvec, msi_alloc_info_t *arg)
 {
 	struct pci_dev *pdev = to_pci_dev(dev);
-	struct msi_desc *desc = first_pci_msi_entry(pdev);
-	int type = desc->pci.msi_attrib.is_msix ? PCI_CAP_ID_MSIX : PCI_CAP_ID_MSI;
+	int type = pdev->msix_enabled ? PCI_CAP_ID_MSIX : PCI_CAP_ID_MSI;
 
 	return rtas_prepare_msi_irqs(pdev, nvec, type, arg);
 }


