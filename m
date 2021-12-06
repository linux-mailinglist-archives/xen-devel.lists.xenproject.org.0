Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8550646AD1F
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 23:48:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240070.416418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMmU-0007bZ-Lx; Mon, 06 Dec 2021 22:48:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240070.416418; Mon, 06 Dec 2021 22:48:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMmU-0007XL-Dr; Mon, 06 Dec 2021 22:48:22 +0000
Received: by outflank-mailman (input) for mailman id 240070;
 Mon, 06 Dec 2021 22:48:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMdy-0004dp-En
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:39:34 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 623c8baa-56e5-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 23:39:33 +0100 (CET)
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
X-Inumbo-ID: 623c8baa-56e5-11ec-a5e1-b9374ead2679
Message-ID: <20211206210438.913603962@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638830373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=Ep5zFYMr2dpuKFMI1pf/izOHx/wmIORxQk2vil3OoJI=;
	b=nfZZ3sBOutSvGHqk1sS290DDgjFJGXEhzG9mKo8h3KNUTS21yvque0kvoe6kdy44X6ihqJ
	rlecPnSuBE8kWWqzbTh8ZfS2t/6i87b9mxuCdiQdAWfWgv/FXfDMxOB4hPcENaQevz8X1t
	sfoi2d3W+glPX+uizuVT258ABJFrCCoKMbU990PZvSPJbq47uN//h7RBBdikCbG4VbXTMa
	uzPGLlJ6oqG4Ba1T/Qi10UeHj0+DdaJ0BuryMFaEruZB4DB4ufEmaO0gHVQmA6rDjulOYP
	4odcYLKYN6S0ZLHgH8AU1siZXSl2RCWz6Zdbj85yUeDpTNP4mcveuhP4LXFExg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638830373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=Ep5zFYMr2dpuKFMI1pf/izOHx/wmIORxQk2vil3OoJI=;
	b=zIv8vjiKX+sZKy9gbTJ2X4+XfGOmD/O04fsKImX/MjjZGQEs9MDTD7XhFu7ricmc2LeLAj
	jEryKJg6XslL1KCw==
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
Subject: [patch V2 23/36] powerpc/cell/axon_msi: Use MSI device properties
References: <20211206210307.625116253@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:39:33 +0100 (CET)

instead of fiddling with MSI descriptors.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
V2: Invoke the function with the correct number of arguments - Andy
---
 arch/powerpc/platforms/cell/axon_msi.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

--- a/arch/powerpc/platforms/cell/axon_msi.c
+++ b/arch/powerpc/platforms/cell/axon_msi.c
@@ -199,7 +199,7 @@ static struct axon_msic *find_msi_transl
 static int setup_msi_msg_address(struct pci_dev *dev, struct msi_msg *msg)
 {
 	struct device_node *dn;
-	struct msi_desc *entry;
+	bool is_64bit;
 	int len;
 	const u32 *prop;
 
@@ -209,10 +209,10 @@ static int setup_msi_msg_address(struct
 		return -ENODEV;
 	}
 
-	entry = first_pci_msi_entry(dev);
+	is_64bit = msi_device_has_property(&dev->dev, MSI_PROP_64BIT);
 
 	for (; dn; dn = of_get_next_parent(dn)) {
-		if (entry->pci.msi_attrib.is_64) {
+		if (is_64bit) {
 			prop = of_get_property(dn, "msi-address-64", &len);
 			if (prop)
 				break;


