Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F24B446C61A
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 22:05:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.241906.418500 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muheo-0006QC-Kt; Tue, 07 Dec 2021 21:05:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 241906.418500; Tue, 07 Dec 2021 21:05:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muheo-0006Nl-Hi; Tue, 07 Dec 2021 21:05:50 +0000
Received: by outflank-mailman (input) for mailman id 241906;
 Tue, 07 Dec 2021 21:05:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/XZh=QY=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1muhem-0005Sw-Kh
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 21:05:48 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 732a5ad8-57a1-11ec-a831-37629979565c;
 Tue, 07 Dec 2021 22:05:47 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 97655B81E8A;
 Tue,  7 Dec 2021 21:05:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E534FC341C1;
 Tue,  7 Dec 2021 21:05:45 +0000 (UTC)
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
X-Inumbo-ID: 732a5ad8-57a1-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638911146;
	bh=emmb3xsy+H3LBfwGrcgXTk/PL3JNw+p8ei444INyEeo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=tUHMVIuvSKD4KpV71T2u3HTnNeDdjH94nw6ue1OFelE7L1C2fPpkpG+VJS6EQ7RbL
	 DE4nTrcL4DzJJW3p9KkxJ90aY6WFOuJBcNOz8jNU3ACfHQRdCHhgymSV73nOEduwEV
	 6C7Yc+PJ57lEXe3kC7Fnk7gDayIipgMIIFTSVZY22xFXTXz0GcB0An+vkRX1XJHFeD
	 76cd+8jimETlvZcjXu7IptnZ7ZJ5TZKmn3H2yllAjGpq1LNMQk63AsB8yMhOvkaWG7
	 8Ad9xB75VRw/OAC03WjVlipOwF+92OCz7KOMco287/fqEZgDdhOY94sgRr2WDdSvK3
	 r75m+DCO8+wLg==
Date: Tue, 7 Dec 2021 15:05:44 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Marc Zygnier <maz@kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Megha Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
	linux-pci@vger.kernel.org, Cedric Le Goater <clg@kaod.org>,
	xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Will Deacon <will@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	iommu@lists.linux-foundation.org, dmaengine@vger.kernel.org,
	Stuart Yoder <stuyoder@gmail.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Robin Murphy <robin.murphy@arm.com>, Sinan Kaya <okaya@kernel.org>
Subject: Re: [patch V2 28/36] PCI/MSI: Use __msi_get_virq() in
 pci_get_vector()
Message-ID: <20211207210544.GA77966@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206210439.181331216@linutronix.de>

On Mon, Dec 06, 2021 at 11:39:41PM +0100, Thomas Gleixner wrote:
> Use msi_get_vector() and handle the return value to be compatible.
> 
> No functional change intended.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
> V2: Handle the INTx case directly instead of trying to be overly smart - Marc
> ---
>  drivers/pci/msi/msi.c |   25 +++++--------------------
>  1 file changed, 5 insertions(+), 20 deletions(-)
> 
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -1032,28 +1032,13 @@ EXPORT_SYMBOL(pci_free_irq_vectors);
>   */
>  int pci_irq_vector(struct pci_dev *dev, unsigned int nr)
>  {
> -	if (dev->msix_enabled) {
> -		struct msi_desc *entry;
> +	unsigned int irq;
>  
> -		for_each_pci_msi_entry(entry, dev) {
> -			if (entry->msi_index == nr)
> -				return entry->irq;
> -		}
> -		WARN_ON_ONCE(1);
> -		return -EINVAL;
> -	}
> +	if (!dev->msi_enabled && !dev->msix_enabled)
> +		return !nr ? dev->irq : -EINVAL;
>  
> -	if (dev->msi_enabled) {
> -		struct msi_desc *entry = first_pci_msi_entry(dev);
> -
> -		if (WARN_ON_ONCE(nr >= entry->nvec_used))
> -			return -EINVAL;
> -	} else {
> -		if (WARN_ON_ONCE(nr > 0))
> -			return -EINVAL;
> -	}
> -
> -	return dev->irq + nr;
> +	irq = msi_get_virq(&dev->dev, nr);
> +	return irq ? irq : -EINVAL;
>  }
>  EXPORT_SYMBOL(pci_irq_vector);
>  
> 

