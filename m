Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4A5479C44
	for <lists+xen-devel@lfdr.de>; Sat, 18 Dec 2021 20:06:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249187.429664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myf19-0003j1-Lz; Sat, 18 Dec 2021 19:05:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249187.429664; Sat, 18 Dec 2021 19:05:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myf19-0003gy-In; Sat, 18 Dec 2021 19:05:15 +0000
Received: by outflank-mailman (input) for mailman id 249187;
 Sat, 18 Dec 2021 19:05:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WtF6=RD=kernel.org=nathan@srs-se1.protection.inumbo.net>)
 id 1myf18-0003gs-43
 for xen-devel@lists.xenproject.org; Sat, 18 Dec 2021 19:05:14 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c68c27a-6035-11ec-9e60-abaf8a552007;
 Sat, 18 Dec 2021 20:05:12 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5D7DCB80781;
 Sat, 18 Dec 2021 19:05:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1B24C36AE1;
 Sat, 18 Dec 2021 19:05:02 +0000 (UTC)
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
X-Inumbo-ID: 6c68c27a-6035-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639854309;
	bh=I6eVKACPJvnI+llvjluP6wdaS6TfkgpPNWmOCTJo2Tw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UMWo6BEBXL2vg9tHjb81KQokUbnD5ds+HV7ckML33awGfTpej3ik5Kh3h6cfpyyqb
	 iFD4s+bZZ21aukh38a1Cdxv3Q680qbPDCrFRz4IUjxJcGtElf80NOxI08WBU35o5KO
	 DNmZrv9Ka1wwC0RRN+bNzFNGCbR++Trade1JV0IXvYj4pEQ88pbWel1kl4y4dka9Vy
	 v30sM76UJThM+xQ2PiEuVOz+Jtb0pMSsUUbW+ySVU2WJmK0RZD3dGbXyS/PYo1GOwF
	 IJYYSA0Plrin3iwRee9bWx/w6bJtImnOGvLxXhdQqwr2xAa+xaDpfppDhnDsxbFplJ
	 vGcX7+wVGtViQ==
Date: Sat, 18 Dec 2021 12:04:59 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Bjorn Helgaas <helgaas@kernel.org>,
	Marc Zygnier <maz@kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Megha Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
	linux-pci@vger.kernel.org, Cedric Le Goater <clg@kaod.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	Arnd Bergmann <arnd@arndb.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>,
	Stuart Yoder <stuyoder@gmail.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	dmaengine@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Joerg Roedel <joro@8bytes.org>, iommu@lists.linux-foundation.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Sinan Kaya <okaya@kernel.org>
Subject: Re: [patch V3 28/35] PCI/MSI: Simplify pci_irq_get_affinity()
Message-ID: <Yb4w2wVvIwN7qaNy@archlinux-ax161>
References: <20211210221642.869015045@linutronix.de>
 <20211210221814.900929381@linutronix.de>
 <Yb0PaCyo/6z3XOlf@archlinux-ax161>
 <87v8zm9pmd.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v8zm9pmd.ffs@tglx>

On Sat, Dec 18, 2021 at 11:25:14AM +0100, Thomas Gleixner wrote:
> On Fri, Dec 17 2021 at 15:30, Nathan Chancellor wrote:
> > On Fri, Dec 10, 2021 at 11:19:26PM +0100, Thomas Gleixner wrote:
> > I just bisected a boot failure on my AMD test desktop to this patch as
> > commit f48235900182 ("PCI/MSI: Simplify pci_irq_get_affinity()") in
> > -next. It looks like there is a problem with the NVMe drive after this
> > change according to the logs. Given that the hard drive is not getting
> > mounted for journald to write logs to, I am not really sure how to get
> > them from the machine so I have at least taken a picture of what I see
> > on my screen; open to ideas on that front!
> 
> Bah. Fix below.

Tested-by: Nathan Chancellor <nathan@kernel.org>

> Thanks,
> 
>         tglx
> ---
> diff --git a/drivers/pci/msi/msi.c b/drivers/pci/msi/msi.c
> index 71802410e2ab..9b4910befeda 100644
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -1100,7 +1100,7 @@ EXPORT_SYMBOL(pci_irq_vector);
>   */
>  const struct cpumask *pci_irq_get_affinity(struct pci_dev *dev, int nr)
>  {
> -	int irq = pci_irq_vector(dev, nr);
> +	int idx, irq = pci_irq_vector(dev, nr);
>  	struct msi_desc *desc;
>  
>  	if (WARN_ON_ONCE(irq <= 0))
> @@ -1113,7 +1113,10 @@ const struct cpumask *pci_irq_get_affinity(struct pci_dev *dev, int nr)
>  
>  	if (WARN_ON_ONCE(!desc->affinity))
>  		return NULL;
> -	return &desc->affinity[nr].mask;
> +
> +	/* MSI has a mask array in the descriptor. */
> +	idx = dev->msi_enabled ? nr : 0;
> +	return &desc->affinity[idx].mask;
>  }
>  EXPORT_SYMBOL(pci_irq_get_affinity);
>  
> 

