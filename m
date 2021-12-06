Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9734F46AD01
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 23:47:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240020.416157 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMl8-0002zF-SX; Mon, 06 Dec 2021 22:46:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240020.416157; Mon, 06 Dec 2021 22:46:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMl8-0002of-Io; Mon, 06 Dec 2021 22:46:58 +0000
Received: by outflank-mailman (input) for mailman id 240020;
 Mon, 06 Dec 2021 22:46:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMeB-0004dp-BD
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:39:47 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69ef761d-56e5-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 23:39:46 +0100 (CET)
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
X-Inumbo-ID: 69ef761d-56e5-11ec-a5e1-b9374ead2679
Message-ID: <20211206210439.343885841@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638830386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=b+nZ88WC2vD5W5n7RNFx/r8UkB+MFzrqoW9QgVGfhmI=;
	b=iwrgnjkZBMa2IKJv9GR2TqvukXqu2pkFrxVjyoHHECtn4Rc9LgNQQNExFqlLTV68Uz6Uft
	rYPKPMZf2YrALowU0yX92pDkp2jtIINx3wHfcb8bZ+UojtO69Zdu/Im3WAsWvXwGD+ZHu4
	qDASgqvtA67NHfTjtLEz1g6pO7eTFk7owK2I9iBDKOOGOcssFBcvzRkjgZzmyXb5qMTBPv
	/9hacvluJ9Ktt0ExrIUqTyL9ldBv8dy6d9aSw7RMxr+mObk5LqYd35pCb8fqtIxmAz38sL
	HU6D7envfFV+DRskiNV0bGxVZeWLt8SRFz6J6jjRDSR96CoViUYZ64Erl8yMpw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638830386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=b+nZ88WC2vD5W5n7RNFx/r8UkB+MFzrqoW9QgVGfhmI=;
	b=/cbCkUOyxJbsNJMXB3K5nPxHxtl6ty6WuSd175VsB9cZHdXcERW1MvVY/sZjbqrcAZYPTG
	4Qpef42t/or8mfAg==
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
 Mark Rutland <mark.rutland@arm.com>,
 Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Santosh Shilimkar <ssantosh@kernel.org>,
 iommu@lists.linux-foundation.org,
 dmaengine@vger.kernel.org,
 Stuart Yoder <stuyoder@gmail.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>,
 Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>,
 Vinod Koul <vkoul@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Sinan Kaya <okaya@kernel.org>
Subject: [patch V2 31/36] perf/smmuv3: Use msi_get_virq()
References: <20211206210307.625116253@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:39:45 +0100 (CET)

Let the core code fiddle with the MSI descriptor retrieval.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/perf/arm_smmuv3_pmu.c |    5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

--- a/drivers/perf/arm_smmuv3_pmu.c
+++ b/drivers/perf/arm_smmuv3_pmu.c
@@ -684,7 +684,6 @@ static void smmu_pmu_write_msi_msg(struc
 
 static void smmu_pmu_setup_msi(struct smmu_pmu *pmu)
 {
-	struct msi_desc *desc;
 	struct device *dev = pmu->dev;
 	int ret;
 
@@ -701,9 +700,7 @@ static void smmu_pmu_setup_msi(struct sm
 		return;
 	}
 
-	desc = first_msi_entry(dev);
-	if (desc)
-		pmu->irq = desc->irq;
+	pmu->irq = msi_get_virq(dev, 0);
 
 	/* Add callback to free MSIs on teardown */
 	devm_add_action(dev, smmu_pmu_free_msis, dev);


