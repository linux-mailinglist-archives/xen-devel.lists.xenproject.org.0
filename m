Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A46C125356F
	for <lists+xen-devel@lfdr.de>; Wed, 26 Aug 2020 18:51:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAydB-0004bj-Pb; Wed, 26 Aug 2020 16:50:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Duu=CE=intel.com=megha.dey@srs-us1.protection.inumbo.net>)
 id 1kAydA-0004be-IM
 for xen-devel@lists.xenproject.org; Wed, 26 Aug 2020 16:50:36 +0000
X-Inumbo-ID: 531790cd-003d-479c-98f0-aeb7832db3a1
Received: from mga07.intel.com (unknown [134.134.136.100])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 531790cd-003d-479c-98f0-aeb7832db3a1;
 Wed, 26 Aug 2020 16:50:33 +0000 (UTC)
IronPort-SDR: /ywILiqfUvzifvA2+pG47sHtPNLuLwm3fd4Rxe5ucwqZc/tzCvfwqoFo5pQjKyNICtcYSQh+E+
 iXokmCkxKyIg==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="220590400"
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="220590400"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2020 09:50:30 -0700
IronPort-SDR: O+tRoc/59eCGpVLJON72igRMmtjnFMq9wo28apgxlygz1/37A+zdeFZDDyibhT3bW+C7JSBdFz
 MbToSWPlnzpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; d="scan'208";a="444115517"
Received: from orsmsx606-2.jf.intel.com (HELO ORSMSX606.amr.corp.intel.com)
 ([10.22.229.86])
 by orsmga004.jf.intel.com with ESMTP; 26 Aug 2020 09:50:30 -0700
Received: from orsmsx606.amr.corp.intel.com (10.22.229.19) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 26 Aug 2020 09:50:30 -0700
Received: from orsmsx101.amr.corp.intel.com (10.22.225.128) by
 orsmsx606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 26 Aug 2020 09:50:30 -0700
Received: from [10.212.160.45] (10.212.160.45) by ORSMSX101.amr.corp.intel.com
 (10.22.225.128) with Microsoft SMTP Server (TLS) id 14.3.439.0;
 Wed, 26 Aug 2020 09:50:29 -0700
Subject: Re: [patch V2 15/46] x86/irq: Consolidate DMAR irq allocation
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
 <20200826112332.163462706@linutronix.de>
From: "Dey, Megha" <megha.dey@intel.com>
Message-ID: <812d9647-ad2e-95e9-aa99-b54ff7ebc52d@intel.com>
Date: Wed, 26 Aug 2020 09:50:27 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200826112332.163462706@linutronix.de>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.212.160.45]
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
> None of the DMAR specific fields are required.
>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>
> ---
>   arch/x86/include/asm/hw_irq.h |    6 ------
>   arch/x86/kernel/apic/msi.c    |   10 +++++-----
>   2 files changed, 5 insertions(+), 11 deletions(-)
>
> --- a/arch/x86/include/asm/hw_irq.h
> +++ b/arch/x86/include/asm/hw_irq.h
> @@ -83,12 +83,6 @@ struct irq_alloc_info {
>   			irq_hw_number_t	msi_hwirq;
>   		};
>   #endif
> -#ifdef	CONFIG_DMAR_TABLE
> -		struct {
> -			int		dmar_id;
> -			void		*dmar_data;
> -		};
> -#endif
>   #ifdef	CONFIG_X86_UV
>   		struct {
>   			int		uv_limit;
> --- a/arch/x86/kernel/apic/msi.c
> +++ b/arch/x86/kernel/apic/msi.c
> @@ -329,15 +329,15 @@ static struct irq_chip dmar_msi_controll
>   static irq_hw_number_t dmar_msi_get_hwirq(struct msi_domain_info *info,
>   					  msi_alloc_info_t *arg)
>   {
> -	return arg->dmar_id;
> +	return arg->hwirq;

Shouldn't this return the arg->devid which gets set in dmar_alloc_hwirq?

-Megha

>   }
>   
>   static int dmar_msi_init(struct irq_domain *domain,
>   			 struct msi_domain_info *info, unsigned int virq,
>   			 irq_hw_number_t hwirq, msi_alloc_info_t *arg)
>   {
> -	irq_domain_set_info(domain, virq, arg->dmar_id, info->chip, NULL,
> -			    handle_edge_irq, arg->dmar_data, "edge");
> +	irq_domain_set_info(domain, virq, arg->devid, info->chip, NULL,
> +			    handle_edge_irq, arg->data, "edge");
>   
>   	return 0;
>   }
> @@ -384,8 +384,8 @@ int dmar_alloc_hwirq(int id, int node, v
>   
>   	init_irq_alloc_info(&info, NULL);
>   	info.type = X86_IRQ_ALLOC_TYPE_DMAR;
> -	info.dmar_id = id;
> -	info.dmar_data = arg;
> +	info.devid = id;
> +	info.data = arg;
>   
>   	return irq_domain_alloc_irqs(domain, 1, node, &info);
>   }
>
>

