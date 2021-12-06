Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E2746AD18
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 23:48:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.240054.416330 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMmB-0003FJ-IO; Mon, 06 Dec 2021 22:48:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 240054.416330; Mon, 06 Dec 2021 22:48:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muMmB-0003Bk-Bp; Mon, 06 Dec 2021 22:48:03 +0000
Received: by outflank-mailman (input) for mailman id 240054;
 Mon, 06 Dec 2021 22:48:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5qlu=QX=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1muMdU-0004dp-2i
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 22:39:04 +0000
Received: from galois.linutronix.de (galois.linutronix.de
 [2a0a:51c0:0:12e:550::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 501f4bbd-56e5-11ec-a5e1-b9374ead2679;
 Mon, 06 Dec 2021 23:39:03 +0100 (CET)
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
X-Inumbo-ID: 501f4bbd-56e5-11ec-a5e1-b9374ead2679
Message-ID: <20211206210437.875316747@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1638830343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=hFdKqxRH3cfzgioYGe6Wt7w61YxBjqbdkXo6merCrrA=;
	b=OMnExLFiyr2l3DaeHBZpbFl2M24cvNzxDNL/9aYSNE94q++59kEmfVGKa5ZlhAe07Fl3uU
	Za2x9mlRaEoMlFL5FR1Yt9/sqLPoYXCMPjqQw4WwMtRTKofDpynBiY6Jl0rxHJOkcMX9dw
	AKh+hNeiRoS63cA7VuiUq+1N62xSAWLbXP1hCjtAIoq1LsEYItH7wAY5tc4nfMbGGtYDuF
	fJU/wntmrOV0pnsKdqs0t3j9Fcc8XuBSCnFkFMGRffuHbe8KbWxBhE+GGbocWvfNjKYz6q
	jHzrIsyfG/fs3wIXw7Tss35KZPRoYyc8DlL6z8BcWhdY+ZDIBEv4mQdQig+Tog==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1638830343;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=hFdKqxRH3cfzgioYGe6Wt7w61YxBjqbdkXo6merCrrA=;
	b=Wmw1TW9VtGF7GmA2M1BkXP4IXVGQeS/AtXBgcY5867Qr3359clTNz15RIffmYLeD26efTT
	Tn7VoBQPW9R2PTDw==
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
Subject: [patch V2 04/36] platform-msi: Allocate MSI device data on first use
References: <20211206210307.625116253@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Date: Mon,  6 Dec 2021 23:39:02 +0100 (CET)

Allocate the MSI device data on first invocation of the allocation function
for platform MSI private data.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/base/platform-msi.c |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

--- a/drivers/base/platform-msi.c
+++ b/drivers/base/platform-msi.c
@@ -204,6 +204,8 @@ platform_msi_alloc_priv_data(struct devi
 			     irq_write_msi_msg_t write_msi_msg)
 {
 	struct platform_msi_priv_data *datap;
+	int err;
+
 	/*
 	 * Limit the number of interrupts to 2048 per device. Should we
 	 * need to bump this up, DEV_ID_SHIFT should be adjusted
@@ -218,6 +220,10 @@ platform_msi_alloc_priv_data(struct devi
 		return ERR_PTR(-EINVAL);
 	}
 
+	err = msi_setup_device_data(dev);
+	if (err)
+		return ERR_PTR(err);
+
 	/* Already had a helping of MSI? Greed... */
 	if (!list_empty(dev_to_msi_list(dev)))
 		return ERR_PTR(-EBUSY);
@@ -229,7 +235,7 @@ platform_msi_alloc_priv_data(struct devi
 	datap->devid = ida_simple_get(&platform_msi_devid_ida,
 				      0, 1 << DEV_ID_SHIFT, GFP_KERNEL);
 	if (datap->devid < 0) {
-		int err = datap->devid;
+		err = datap->devid;
 		kfree(datap);
 		return ERR_PTR(err);
 	}


