Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A97662551E7
	for <lists+xen-devel@lfdr.de>; Fri, 28 Aug 2020 02:25:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kBSCO-00019U-NI; Fri, 28 Aug 2020 00:24:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cgpo=CG=intel.com=megha.dey@srs-us1.protection.inumbo.net>)
 id 1kBSCN-00019P-G9
 for xen-devel@lists.xenproject.org; Fri, 28 Aug 2020 00:24:55 +0000
X-Inumbo-ID: 44068b05-6e80-44f7-b6cd-7afb65b8beb2
Received: from mga07.intel.com (unknown [134.134.136.100])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 44068b05-6e80-44f7-b6cd-7afb65b8beb2;
 Fri, 28 Aug 2020 00:24:51 +0000 (UTC)
IronPort-SDR: SR2EhUhmXH4h0L/vADkAE8dDeJuoJxDw2IkSdKxTICJCqK6ghoHGLBZArCOMnETUkGRwUnvQwQ
 QxVH5phwLeWw==
X-IronPort-AV: E=McAfee;i="6000,8403,9726"; a="220833631"
X-IronPort-AV: E=Sophos;i="5.76,361,1592895600"; d="scan'208";a="220833631"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2020 17:24:48 -0700
IronPort-SDR: oURbbna2B9VUd5BCCxZKFvbYptrnLbPIKvW4skTq9oRtYGTT8iK7DZoIfbSEAcz0iNrD44Fxcq
 IHw5AcLs5++A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,361,1592895600"; d="scan'208";a="373897073"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
 by orsmga001.jf.intel.com with ESMTP; 27 Aug 2020 17:24:48 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 27 Aug 2020 17:24:44 -0700
Received: from orsmsx101.amr.corp.intel.com (10.22.225.128) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Thu, 27 Aug 2020 17:24:44 -0700
Received: from [10.254.177.214] (10.254.177.214) by
 ORSMSX101.amr.corp.intel.com (10.22.225.128) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 27 Aug 2020 17:24:44 -0700
Subject: Re: [patch V2 29/46] irqdomain/msi: Allow to override
 msi_domain_alloc/free_irqs()
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
CC: <x86@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 <iommu@lists.linux-foundation.org>, <linux-hyperv@vger.kernel.org>, "Haiyang
 Zhang" <haiyangz@microsoft.com>, Jon Derrick <jonathan.derrick@intel.com>, Lu
 Baolu <baolu.lu@linux.intel.com>, Wei Liu <wei.liu@kernel.org>, "K. Y.
 Srinivasan" <kys@microsoft.com>, Stephen Hemminger <sthemmin@microsoft.com>,
 Steve Wahl <steve.wahl@hpe.com>, Dimitri Sivanich <sivanich@hpe.com>, "Russ
 Anderson" <rja@hpe.com>, <linux-pci@vger.kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Konrad
 Rzeszutek Wilk <konrad.wilk@oracle.com>, <xen-devel@lists.xenproject.org>,
 Juergen Gross <jgross@suse.com>, "Boris Ostrovsky"
 <boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Jason
 Gunthorpe <jgg@mellanox.com>, Dave Jiang <dave.jiang@intel.com>, Alex
 Williamson <alex.williamson@redhat.com>, Jacob Pan <jacob.jun.pan@intel.com>, 
 Baolu Lu <baolu.lu@intel.com>, Kevin Tian <kevin.tian@intel.com>, Dan
 Williams <dan.j.williams@intel.com>
References: <20200826111628.794979401@linutronix.de>
 <20200826112333.526797548@linutronix.de>
From: "Dey, Megha" <megha.dey@intel.com>
Message-ID: <ebccacdd-9ece-2831-fc22-9868dd1c4ea6@intel.com>
Date: Thu, 27 Aug 2020 17:24:42 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200826112333.526797548@linutronix.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.254.177.214]
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Thomas,

On 8/26/2020 4:16 AM, Thomas Gleixner wrote:
> From: Thomas Gleixner <tglx@linutronix.de>
>
> To support MSI irq domains which do not fit at all into the regular MSI
> irqdomain scheme, like the XEN MSI interrupt management for PV/HVM/DOM0,
> it's necessary to allow to override the alloc/free implementation.
>
> This is a preperatory step to switch X86 away from arch_*_msi_irqs() and
> store the irq domain pointer right in struct device.
>
> No functional change for existing MSI irq domain users.
>
> Aside of the evil XEN wrapper this is also useful for special MSI domains
> which need to do extra alloc/free work before/after calling the generic
> core function. Work like allocating/freeing MSI descriptors, MSI storage
> space etc.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>
> ---
>   include/linux/msi.h |   27 ++++++++++++++++++++
>   kernel/irq/msi.c    |   70 +++++++++++++++++++++++++++++++++++-----------------
>   2 files changed, 75 insertions(+), 22 deletions(-)
>
> --- a/include/linux/msi.h
> +++ b/include/linux/msi.h
> @@ -241,6 +241,10 @@ struct msi_domain_info;
>    * @msi_finish:		Optional callback to finalize the allocation
>    * @set_desc:		Set the msi descriptor for an interrupt
>    * @handle_error:	Optional error handler if the allocation fails
> + * @domain_alloc_irqs:	Optional function to override the default allocation
> + *			function.
> + * @domain_free_irqs:	Optional function to override the default free
> + *			function.
>    *
>    * @get_hwirq, @msi_init and @msi_free are callbacks used by
>    * msi_create_irq_domain() and related interfaces
> @@ -248,6 +252,22 @@ struct msi_domain_info;
>    * @msi_check, @msi_prepare, @msi_finish, @set_desc and @handle_error
>    * are callbacks used by msi_domain_alloc_irqs() and related
>    * interfaces which are based on msi_desc.
> + *
> + * @domain_alloc_irqs, @domain_free_irqs can be used to override the
> + * default allocation/free functions (__msi_domain_alloc/free_irqs). This
> + * is initially for a wrapper around XENs seperate MSI universe which can't
> + * be wrapped into the regular irq domains concepts by mere mortals.  This
> + * allows to universally use msi_domain_alloc/free_irqs without having to
> + * special case XEN all over the place.
> + *
> + * Contrary to other operations @domain_alloc_irqs and @domain_free_irqs
> + * are set to the default implementation if NULL and even when
> + * MSI_FLAG_USE_DEF_DOM_OPS is not set to avoid breaking existing users and
> + * because these callbacks are obviously mandatory.
> + *
> + * This is NOT meant to be abused, but it can be useful to build wrappers
> + * for specialized MSI irq domains which need extra work before and after
> + * calling __msi_domain_alloc_irqs()/__msi_domain_free_irqs().
>    */
>   struct msi_domain_ops {
>   	irq_hw_number_t	(*get_hwirq)(struct msi_domain_info *info,
> @@ -270,6 +290,10 @@ struct msi_domain_ops {
>   				    struct msi_desc *desc);
>   	int		(*handle_error)(struct irq_domain *domain,
>   					struct msi_desc *desc, int error);
> +	int		(*domain_alloc_irqs)(struct irq_domain *domain,
> +					     struct device *dev, int nvec);
> +	void		(*domain_free_irqs)(struct irq_domain *domain,
> +					    struct device *dev);
>   };
>   
>   /**
> @@ -327,8 +351,11 @@ int msi_domain_set_affinity(struct irq_d
>   struct irq_domain *msi_create_irq_domain(struct fwnode_handle *fwnode,
>   					 struct msi_domain_info *info,
>   					 struct irq_domain *parent);
> +int __msi_domain_alloc_irqs(struct irq_domain *domain, struct device *dev,
> +			    int nvec);
>   int msi_domain_alloc_irqs(struct irq_domain *domain, struct device *dev,
>   			  int nvec);
> +void __msi_domain_free_irqs(struct irq_domain *domain, struct device *dev);
>   void msi_domain_free_irqs(struct irq_domain *domain, struct device *dev);
>   struct msi_domain_info *msi_get_domain_info(struct irq_domain *domain);
>   
> --- a/kernel/irq/msi.c
> +++ b/kernel/irq/msi.c
> @@ -229,11 +229,13 @@ static int msi_domain_ops_check(struct i
>   }
>   
>   static struct msi_domain_ops msi_domain_ops_default = {
> -	.get_hwirq	= msi_domain_ops_get_hwirq,
> -	.msi_init	= msi_domain_ops_init,
> -	.msi_check	= msi_domain_ops_check,
> -	.msi_prepare	= msi_domain_ops_prepare,
> -	.set_desc	= msi_domain_ops_set_desc,
> +	.get_hwirq		= msi_domain_ops_get_hwirq,
> +	.msi_init		= msi_domain_ops_init,
> +	.msi_check		= msi_domain_ops_check,
> +	.msi_prepare		= msi_domain_ops_prepare,
> +	.set_desc		= msi_domain_ops_set_desc,
> +	.domain_alloc_irqs	= __msi_domain_alloc_irqs,
> +	.domain_free_irqs	= __msi_domain_free_irqs,
>   };
>   
>   static void msi_domain_update_dom_ops(struct msi_domain_info *info)
> @@ -245,6 +247,14 @@ static void msi_domain_update_dom_ops(st
>   		return;
>   	}
>   
> +	if (ops->domain_alloc_irqs == NULL)
> +		ops->domain_alloc_irqs = msi_domain_ops_default.domain_alloc_irqs;
> +	if (ops->domain_free_irqs == NULL)
> +		ops->domain_free_irqs = msi_domain_ops_default.domain_free_irqs;
> +
> +	if (!(info->flags & MSI_FLAG_USE_DEF_DOM_OPS))
> +		return;
> +
>   	if (ops->get_hwirq == NULL)
>   		ops->get_hwirq = msi_domain_ops_default.get_hwirq;
>   	if (ops->msi_init == NULL)
> @@ -278,8 +288,7 @@ struct irq_domain *msi_create_irq_domain
>   {
>   	struct irq_domain *domain;
>   
> -	if (info->flags & MSI_FLAG_USE_DEF_DOM_OPS)
> -		msi_domain_update_dom_ops(info);
> +	msi_domain_update_dom_ops(info);
>   	if (info->flags & MSI_FLAG_USE_DEF_CHIP_OPS)
>   		msi_domain_update_chip_ops(info);
>   
> @@ -386,17 +395,8 @@ static bool msi_check_reservation_mode(s
>   	return desc->msi_attrib.is_msix || desc->msi_attrib.maskbit;
>   }
>   
> -/**
> - * msi_domain_alloc_irqs - Allocate interrupts from a MSI interrupt domain
> - * @domain:	The domain to allocate from
> - * @dev:	Pointer to device struct of the device for which the interrupts
> - *		are allocated
> - * @nvec:	The number of interrupts to allocate
> - *
> - * Returns 0 on success or an error code.
> - */
> -int msi_domain_alloc_irqs(struct irq_domain *domain, struct device *dev,
> -			  int nvec)
> +int __msi_domain_alloc_irqs(struct irq_domain *domain, struct device *dev,
> +			    int nvec)
>   {
>   	struct msi_domain_info *info = domain->host_data;
>   	struct msi_domain_ops *ops = info->ops;
> @@ -490,12 +490,24 @@ int msi_domain_alloc_irqs(struct irq_dom
>   }
>   
>   /**
> - * msi_domain_free_irqs - Free interrupts from a MSI interrupt @domain associated tp @dev
> - * @domain:	The domain to managing the interrupts
> + * msi_domain_alloc_irqs - Allocate interrupts from a MSI interrupt domain
> + * @domain:	The domain to allocate from
>    * @dev:	Pointer to device struct of the device for which the interrupts
> - *		are free
> + *		are allocated
> + * @nvec:	The number of interrupts to allocate
> + *
> + * Returns 0 on success or an error code.
>    */
> -void msi_domain_free_irqs(struct irq_domain *domain, struct device *dev)
> +int msi_domain_alloc_irqs(struct irq_domain *domain, struct device *dev,
> +			  int nvec)
> +{
> +	struct msi_domain_info *info = domain->host_data;
> +	struct msi_domain_ops *ops = info->ops;
> +
> +	return ops->domain_alloc_irqs(domain, dev, nvec);
> +}
> +

Since, our upcoming driver will directly call this API, an 
EXPORT_SYMBOL_GPL tag would be required.

Currently there is no use case. I was wondering if we should add this 
change while submitting the

idxd/ims patches or would you add this to this patch?

> +void __msi_domain_free_irqs(struct irq_domain *domain, struct device *dev)
>   {
>   	struct msi_desc *desc;
>   
> @@ -513,6 +525,20 @@ void msi_domain_free_irqs(struct irq_dom
>   }
>   
>   /**
> + * __msi_domain_free_irqs - Free interrupts from a MSI interrupt @domain associated tp @dev
> + * @domain:	The domain to managing the interrupts
> + * @dev:	Pointer to device struct of the device for which the interrupts
> + *		are free
> + */
> +void msi_domain_free_irqs(struct irq_domain *domain, struct device *dev)
> +{
> +	struct msi_domain_info *info = domain->host_data;
> +	struct msi_domain_ops *ops = info->ops;
> +
> +	return ops->domain_free_irqs(domain, dev);
> +}
> +
> +/**
>    * msi_get_domain_info - Get the MSI interrupt domain info for @domain
>    * @domain:	The interrupt domain to retrieve data from
>    *
>
>

