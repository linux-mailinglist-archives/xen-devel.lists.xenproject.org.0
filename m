Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9514246C627
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 22:07:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.241918.418511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muhfs-0007M1-VM; Tue, 07 Dec 2021 21:06:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 241918.418511; Tue, 07 Dec 2021 21:06:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muhfs-0007Jg-S0; Tue, 07 Dec 2021 21:06:56 +0000
Received: by outflank-mailman (input) for mailman id 241918;
 Tue, 07 Dec 2021 21:06:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/XZh=QY=kernel.org=helgaas@srs-se1.protection.inumbo.net>)
 id 1muhbW-00014s-R7
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 21:02:26 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa150cf8-57a0-11ec-9d12-4777fae47e2b;
 Tue, 07 Dec 2021 22:02:25 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id CC27DCE1E21;
 Tue,  7 Dec 2021 21:02:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C4C5C341C3;
 Tue,  7 Dec 2021 21:02:21 +0000 (UTC)
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
X-Inumbo-ID: fa150cf8-57a0-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1638910942;
	bh=izWXm95l+uZGERB30ZN7LtrcycoRGE73PbT8Z0h/qQw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=XufeyuxA4HkM8C1emNf201uZTgp+dVqYnNX9ceYmkxirOcGK1GaoHMbJIhyz3E3+D
	 cblky2T1a1/xUWCxvj7lXEc5xpM/dggclpp5CX7k6YatZZnXrjghPJwp9SiEWV/q8O
	 VHUPzss9MvVyzoAJaMBsVgQVwIQWM4SF/FV26sZrL5XAcC2xU1v6GOa1BhFJPeHS5T
	 wvm6bhOMRM9UNs8NKfy77ac0jMKUcnEUjJMGKEcxsgJrKNuqoW7tZRxDuYb0xt7/s7
	 4sSISKBZ3qSg8+5KsVWmnqztHkST9BbG9ZkniYgH9dpNrFmiv0QYea1HSrPMTJm/hB
	 pRBsYEeNdamow==
Date: Tue, 7 Dec 2021 15:02:19 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Marc Zygnier <maz@kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Megha Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
	linux-pci@vger.kernel.org, Cedric Le Goater <clg@kaod.org>,
	Juergen Gross <jgross@suse.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Paul Mackerras <paulus@samba.org>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	linuxppc-dev@lists.ozlabs.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	sparclinux@vger.kernel.org, x86@kernel.org,
	xen-devel@lists.xenproject.org, ath11k@lists.infradead.org,
	Wei Liu <wei.liu@kernel.org>, linux-hyperv@vger.kernel.org,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>
Subject: Re: [patch V2 22/23] genirq/msi: Handle PCI/MSI allocation fail in
 core code
Message-ID: <20211207210219.GA77501@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206210225.046615302@linutronix.de>

On Mon, Dec 06, 2021 at 11:27:59PM +0100, Thomas Gleixner wrote:
> Get rid of yet another irqdomain callback and let the core code return the
> already available information of how many descriptors could be allocated.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>	# PCI

> ---
>  drivers/pci/msi/irqdomain.c |   13 -------------
>  include/linux/msi.h         |    5 +----
>  kernel/irq/msi.c            |   29 +++++++++++++++++++++++++----
>  3 files changed, 26 insertions(+), 21 deletions(-)
> 
> --- a/drivers/pci/msi/irqdomain.c
> +++ b/drivers/pci/msi/irqdomain.c
> @@ -95,16 +95,6 @@ static int pci_msi_domain_check_cap(stru
>  	return 0;
>  }
>  
> -static int pci_msi_domain_handle_error(struct irq_domain *domain,
> -				       struct msi_desc *desc, int error)
> -{
> -	/* Special handling to support __pci_enable_msi_range() */
> -	if (pci_msi_desc_is_multi_msi(desc) && error == -ENOSPC)
> -		return 1;
> -
> -	return error;
> -}
> -
>  static void pci_msi_domain_set_desc(msi_alloc_info_t *arg,
>  				    struct msi_desc *desc)
>  {
> @@ -115,7 +105,6 @@ static void pci_msi_domain_set_desc(msi_
>  static struct msi_domain_ops pci_msi_domain_ops_default = {
>  	.set_desc	= pci_msi_domain_set_desc,
>  	.msi_check	= pci_msi_domain_check_cap,
> -	.handle_error	= pci_msi_domain_handle_error,
>  };
>  
>  static void pci_msi_domain_update_dom_ops(struct msi_domain_info *info)
> @@ -129,8 +118,6 @@ static void pci_msi_domain_update_dom_op
>  			ops->set_desc = pci_msi_domain_set_desc;
>  		if (ops->msi_check == NULL)
>  			ops->msi_check = pci_msi_domain_check_cap;
> -		if (ops->handle_error == NULL)
> -			ops->handle_error = pci_msi_domain_handle_error;
>  	}
>  }
>  
> --- a/include/linux/msi.h
> +++ b/include/linux/msi.h
> @@ -286,7 +286,6 @@ struct msi_domain_info;
>   * @msi_check:		Callback for verification of the domain/info/dev data
>   * @msi_prepare:	Prepare the allocation of the interrupts in the domain
>   * @set_desc:		Set the msi descriptor for an interrupt
> - * @handle_error:	Optional error handler if the allocation fails
>   * @domain_alloc_irqs:	Optional function to override the default allocation
>   *			function.
>   * @domain_free_irqs:	Optional function to override the default free
> @@ -295,7 +294,7 @@ struct msi_domain_info;
>   * @get_hwirq, @msi_init and @msi_free are callbacks used by the underlying
>   * irqdomain.
>   *
> - * @msi_check, @msi_prepare, @handle_error and @set_desc are callbacks used by
> + * @msi_check, @msi_prepare and @set_desc are callbacks used by
>   * msi_domain_alloc/free_irqs().
>   *
>   * @domain_alloc_irqs, @domain_free_irqs can be used to override the
> @@ -332,8 +331,6 @@ struct msi_domain_ops {
>  				       msi_alloc_info_t *arg);
>  	void		(*set_desc)(msi_alloc_info_t *arg,
>  				    struct msi_desc *desc);
> -	int		(*handle_error)(struct irq_domain *domain,
> -					struct msi_desc *desc, int error);
>  	int		(*domain_alloc_irqs)(struct irq_domain *domain,
>  					     struct device *dev, int nvec);
>  	void		(*domain_free_irqs)(struct irq_domain *domain,
> --- a/kernel/irq/msi.c
> +++ b/kernel/irq/msi.c
> @@ -538,6 +538,27 @@ static bool msi_check_reservation_mode(s
>  	return desc->pci.msi_attrib.is_msix || desc->pci.msi_attrib.can_mask;
>  }
>  
> +static int msi_handle_pci_fail(struct irq_domain *domain, struct msi_desc *desc,
> +			       int allocated)
> +{
> +	switch(domain->bus_token) {
> +	case DOMAIN_BUS_PCI_MSI:
> +	case DOMAIN_BUS_VMD_MSI:
> +		if (IS_ENABLED(CONFIG_PCI_MSI))
> +			break;
> +		fallthrough;
> +	default:
> +		return -ENOSPC;
> +	}
> +
> +	/* Let a failed PCI multi MSI allocation retry */
> +	if (desc->nvec_used > 1)
> +		return 1;
> +
> +	/* If there was a successful allocation let the caller know */
> +	return allocated ? allocated : -ENOSPC;
> +}
> +
>  int __msi_domain_alloc_irqs(struct irq_domain *domain, struct device *dev,
>  			    int nvec)
>  {
> @@ -546,6 +567,7 @@ int __msi_domain_alloc_irqs(struct irq_d
>  	struct irq_data *irq_data;
>  	struct msi_desc *desc;
>  	msi_alloc_info_t arg = { };
> +	int allocated = 0;
>  	int i, ret, virq;
>  	bool can_reserve;
>  
> @@ -560,16 +582,15 @@ int __msi_domain_alloc_irqs(struct irq_d
>  					       dev_to_node(dev), &arg, false,
>  					       desc->affinity);
>  		if (virq < 0) {
> -			ret = -ENOSPC;
> -			if (ops->handle_error)
> -				ret = ops->handle_error(domain, desc, ret);
> -			return ret;
> +			ret = msi_handle_pci_fail(domain, desc, allocated);
> +			goto cleanup;
>  		}
>  
>  		for (i = 0; i < desc->nvec_used; i++) {
>  			irq_set_msi_desc_off(virq, i, desc);
>  			irq_debugfs_copy_devname(virq + i, dev);
>  		}
> +		allocated++;
>  	}
>  
>  	can_reserve = msi_check_reservation_mode(domain, info, dev);
> 

