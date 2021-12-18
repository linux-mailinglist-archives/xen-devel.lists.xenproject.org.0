Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E591479A4B
	for <lists+xen-devel@lfdr.de>; Sat, 18 Dec 2021 11:26:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249046.429492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myWtz-0003he-3z; Sat, 18 Dec 2021 10:25:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249046.429492; Sat, 18 Dec 2021 10:25:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myWty-0003fN-WA; Sat, 18 Dec 2021 10:25:19 +0000
Received: by outflank-mailman (input) for mailman id 249046;
 Sat, 18 Dec 2021 10:25:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v971=RD=linutronix.de=tglx@srs-se1.protection.inumbo.net>)
 id 1myWty-0003fH-2C
 for xen-devel@lists.xenproject.org; Sat, 18 Dec 2021 10:25:18 +0000
Received: from galois.linutronix.de (galois.linutronix.de [193.142.43.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cab50059-5fec-11ec-9e60-abaf8a552007;
 Sat, 18 Dec 2021 11:25:16 +0100 (CET)
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
X-Inumbo-ID: cab50059-5fec-11ec-9e60-abaf8a552007
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1639823115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nl4ddDnB1oKo0fcoNLd0K0Xuyht31044PvDVab+sRz0=;
	b=tn5AlMplZSyHPZ4eu4NMTH2tosi8XfO1/mNklSs+ImTlR8P5gfKJgKJLi6NJ4TFAklevD0
	1avFcMo8k3hGWDd1Iy/rc1ZPeM7eACV1BbuVnX4QY/eXDhd48j/Sh4CvcSDSL9IbisUp7z
	caDqaSpU9ud+i2NkshpSak1RSaSSAW8O+tSdpPZC1vhiTXp+kGqQePG8eL1c519ZMa10bj
	4A/PikhGc/SgM12CbM14omQUZtwMCPY58ymXGe2D8aFAWliD8DPNhbbTAoxPao+HsDqHhF
	X3Af3aTvpYn3Z94vxqiwZNOhBtC+RdSsTPCSCauo8T9TOXtM5vssh7kfd7kvGQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1639823115;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nl4ddDnB1oKo0fcoNLd0K0Xuyht31044PvDVab+sRz0=;
	b=rrfck+zS5tliLA0jRIoJ5g0PCCswYFJD7whCSlQHRXayW7rMo7mOMzACWAo8/AkVTaI5km
	I03oaHuan7mQiiAA==
To: Nathan Chancellor <nathan@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
 Marc Zygnier <maz@kernel.org>, Alex Williamson
 <alex.williamson@redhat.com>, Kevin Tian <kevin.tian@intel.com>, Jason
 Gunthorpe <jgg@nvidia.com>, Megha Dey <megha.dey@intel.com>, Ashok Raj
 <ashok.raj@intel.com>, linux-pci@vger.kernel.org, Cedric Le Goater
 <clg@kaod.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Juergen
 Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Arnd Bergmann
 <arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, linuxppc-dev@lists.ozlabs.org,
 Bjorn Helgaas <bhelgaas@google.com>, Stuart Yoder <stuyoder@gmail.com>,
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Nishanth Menon <nm@ti.com>,
 Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
 dmaengine@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Will
 Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Joerg
 Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org, Jassi Brar
 <jassisinghbrar@gmail.com>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Sinan Kaya <okaya@kernel.org>
Subject: Re: [patch V3 28/35] PCI/MSI: Simplify pci_irq_get_affinity()
In-Reply-To: <Yb0PaCyo/6z3XOlf@archlinux-ax161>
References: <20211210221642.869015045@linutronix.de>
 <20211210221814.900929381@linutronix.de>
 <Yb0PaCyo/6z3XOlf@archlinux-ax161>
Date: Sat, 18 Dec 2021 11:25:14 +0100
Message-ID: <87v8zm9pmd.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Dec 17 2021 at 15:30, Nathan Chancellor wrote:
> On Fri, Dec 10, 2021 at 11:19:26PM +0100, Thomas Gleixner wrote:
> I just bisected a boot failure on my AMD test desktop to this patch as
> commit f48235900182 ("PCI/MSI: Simplify pci_irq_get_affinity()") in
> -next. It looks like there is a problem with the NVMe drive after this
> change according to the logs. Given that the hard drive is not getting
> mounted for journald to write logs to, I am not really sure how to get
> them from the machine so I have at least taken a picture of what I see
> on my screen; open to ideas on that front!

Bah. Fix below.

Thanks,

        tglx
---
diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
index 71802410e2ab..9b4910befeda 100644
--- a/drivers/pci/msi/msi.c
+++ b/drivers/pci/msi/msi.c
@@ -1100,7 +1100,7 @@ EXPORT_SYMBOL(pci_irq_vector);
  */
 const struct cpumask *pci_irq_get_affinity(struct pci_dev *dev, int nr)
 {
-	int irq = pci_irq_vector(dev, nr);
+	int idx, irq = pci_irq_vector(dev, nr);
 	struct msi_desc *desc;
 
 	if (WARN_ON_ONCE(irq <= 0))
@@ -1113,7 +1113,10 @@ const struct cpumask *pci_irq_get_affinity(struct pci_dev *dev, int nr)
 
 	if (WARN_ON_ONCE(!desc->affinity))
 		return NULL;
-	return &desc->affinity[nr].mask;
+
+	/* MSI has a mask array in the descriptor. */
+	idx = dev->msi_enabled ? nr : 0;
+	return &desc->affinity[idx].mask;
 }
 EXPORT_SYMBOL(pci_irq_get_affinity);
 


