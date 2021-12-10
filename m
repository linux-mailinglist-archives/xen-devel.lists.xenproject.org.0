Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56448470DB4
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 23:27:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.244389.422800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvoLw-0006lN-1C; Fri, 10 Dec 2021 22:26:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 244389.422800; Fri, 10 Dec 2021 22:26:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mvoLv-0006iQ-RT; Fri, 10 Dec 2021 22:26:55 +0000
Received: by outflank-mailman (input) for mailman id 244389;
 Fri, 10 Dec 2021 22:26:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nm8/=Q3=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1mvoEP-0005LR-22
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 22:19:09 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 30e6d20e-5a07-11ec-ad7a-b7ef48004f0a;
 Fri, 10 Dec 2021 23:19:07 +0100 (CET)
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
X-Inumbo-ID: 30e6d20e-5a07-11ec-ad7a-b7ef48004f0a
Message-ID: <20211210221814.109408832@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1639174747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=/T/lIugtjOnyOk0TOzZkPoZByXefF1LfjuDkNv8axwo=;
	b=2rQSESBNbhKDe4DIdH7ra10NH5N/JvzQQX+r3nrmLIoKqrr9kZeroIW0ldFyNTmeGJFloC
	ISsswuI9KpOlM49GqMXH1uDQDqjLlmAlQoCaIdP7ARZeSM4ju5lyK7EP81ugww1ZARaI0U
	gs8iQLYx9ZSJzL1t8RYEPf2MxfBf9s3ISeJpYwzJfbY1LP66IiQlEYyWZX7TWUuOhSSd+j
	QHxdKtWvMywJW5kM8KxC3ozfxn1n0BTwgqRspa0SYdoFjxiNskgkH3+l7apaPtovsFTCir
	/eDE+8+FyfScKQW4ZXlPNkEBA8QbEEVsBNZpySv69uV9FsqHgFVMgDuCMRqbdQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1639174747;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=/T/lIugtjOnyOk0TOzZkPoZByXefF1LfjuDkNv8axwo=;
	b=LGRIOOkKk9uMR58nBNuiyz1GmYXNgyyKXlS10xIQmOgbQ/Jkk7kTacYFZo0PvPLyf49QPl
	HjCMGi+rlPtSyrDA==
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Juergen Gross <jgross@suse.com>,
 xen-devel@lists.xenproject.org,
 Arnd Bergmann <arnd@arndb.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 linuxppc-dev@lists.ozlabs.org,
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
Subject: [patch V3 15/35] platform-msi: Let the core code handle sysfs groups
References: <20211210221642.869015045@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Fri, 10 Dec 2021 23:19:06 +0100 (CET)

From: Thomas Gleixner <tglx@linutronix.de>

Set the domain info flag and remove the local sysfs code.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/base/platform-msi.c |   11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

--- a/drivers/base/platform-msi.c
+++ b/drivers/base/platform-msi.c
@@ -23,7 +23,6 @@
 struct platform_msi_priv_data {
 	struct device			*dev;
 	void				*host_data;
-	const struct attribute_group    **msi_irq_groups;
 	msi_alloc_info_t		arg;
 	irq_write_msi_msg_t		write_msg;
 	int				devid;
@@ -191,6 +190,7 @@ struct irq_domain *platform_msi_create_i
 		platform_msi_update_dom_ops(info);
 	if (info->flags & MSI_FLAG_USE_DEF_CHIP_OPS)
 		platform_msi_update_chip_ops(info);
+	info->flags |= MSI_FLAG_DEV_SYSFS;
 
 	domain = msi_create_irq_domain(fwnode, info, parent);
 	if (domain)
@@ -279,16 +279,8 @@ int platform_msi_domain_alloc_irqs(struc
 	if (err)
 		goto out_free_desc;
 
-	priv_data->msi_irq_groups = msi_populate_sysfs(dev);
-	if (IS_ERR(priv_data->msi_irq_groups)) {
-		err = PTR_ERR(priv_data->msi_irq_groups);
-		goto out_free_irqs;
-	}
-
 	return 0;
 
-out_free_irqs:
-	msi_domain_free_irqs(dev->msi.domain, dev);
 out_free_desc:
 	platform_msi_free_descs(dev, 0, nvec);
 out_free_priv_data:
@@ -308,7 +300,6 @@ void platform_msi_domain_free_irqs(struc
 		struct msi_desc *desc;
 
 		desc = first_msi_entry(dev);
-		msi_destroy_sysfs(dev, desc->platform.msi_priv_data->msi_irq_groups);
 		platform_msi_free_priv_data(desc->platform.msi_priv_data);
 	}
 


