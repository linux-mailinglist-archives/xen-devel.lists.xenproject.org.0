Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F43448BE1C
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jan 2022 06:21:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256194.439565 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7W4I-0004Nj-3d; Wed, 12 Jan 2022 05:21:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256194.439565; Wed, 12 Jan 2022 05:21:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7W4H-0004Km-Vf; Wed, 12 Jan 2022 05:21:05 +0000
Received: by outflank-mailman (input) for mailman id 256194;
 Wed, 12 Jan 2022 00:06:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=299D=R4=socionext.com=hayashi.kunihiko@srs-se1.protection.inumbo.net>)
 id 1n7R9V-00064p-CC
 for xen-devel@lists.xenproject.org; Wed, 12 Jan 2022 00:06:09 +0000
Received: from mx.socionext.com (mx.socionext.com [202.248.49.38])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 6c3a5e8c-733b-11ec-9ce5-af14b9085ebd;
 Wed, 12 Jan 2022 01:06:03 +0100 (CET)
Received: from unknown (HELO kinkan2-ex.css.socionext.com) ([172.31.9.52])
 by mx.socionext.com with ESMTP; 12 Jan 2022 09:05:58 +0900
Received: from mail.mfilter.local (m-filter-2 [10.213.24.62])
 by kinkan2-ex.css.socionext.com (Postfix) with ESMTP id 859602059054;
 Wed, 12 Jan 2022 09:05:58 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP;
 Wed, 12 Jan 2022 09:05:58 +0900
Received: from [10.212.180.44] (unknown [10.212.180.44])
 by kinkan2.css.socionext.com (Postfix) with ESMTP id 56BA9B62A1;
 Wed, 12 Jan 2022 09:05:56 +0900 (JST)
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
X-Inumbo-ID: 6c3a5e8c-733b-11ec-9ce5-af14b9085ebd
Subject: Re: [patch] genirq/msi: Populate sysfs entry only once
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Marc Zygnier <maz@kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Kevin Tian <kevin.tian@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Megha Dey <megha.dey@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 linux-pci@vger.kernel.org, Cedric Le Goater <clg@kaod.org>,
 xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Niklas Schnelle <schnelle@linux.ibm.com>, linux-s390@vger.kernel.org,
 Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Logan Gunthorpe <logang@deltatee.com>, Jon Mason <jdmason@kudzu.us>,
 Dave Jiang <dave.jiang@intel.com>, Allen Hubbe <allenbh@gmail.com>,
 linux-ntb@googlegroups.com
References: <20211206210600.123171746@linutronix.de>
 <20211206210749.224917330@linutronix.de> <87leznqx2a.ffs@tglx>
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Message-ID: <1d5711be-c26d-d57b-10db-1b45d279515d@socionext.com>
Date: Wed, 12 Jan 2022 09:05:55 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87leznqx2a.ffs@tglx>
Content-Type: text/plain; charset=iso-2022-jp; format=flowed; delsp=yes
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Thomas,

Is this fix the same as below?
https://marc.info/?l=linux-kernel&m=164061119923119&w=2

On 2022/01/11 3:12, Thomas Gleixner wrote:
> The MSI entries for multi-MSI are populated en bloc for the MSI
> descriptor,
> but the current code invokes the population inside the per interrupt loop
> which triggers a warning in the sysfs code and causes the interrupt
> allocation to fail.
> 
> Move it outside of the loop so it works correctly for single and
> multi-MSI.
> 
> Fixes: bf5e758f02fc ("genirq/msi: Simplify sysfs handling")
> Reported-by: Borislav Petkov <bp@alien8.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> ---
>   kernel/irq/msi.c |   11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
> 
> --- a/kernel/irq/msi.c
> +++ b/kernel/irq/msi.c
> @@ -887,12 +887,11 @@ int __msi_domain_alloc_irqs(struct irq_d
>   			ret = msi_init_virq(domain, virq + i, vflags);
>   			if (ret)
>   				return ret;
> -
> -			if (info->flags & MSI_FLAG_DEV_SYSFS) {
> -				ret = msi_sysfs_populate_desc(dev, desc);
> -				if (ret)
> -					return ret;
> -			}
> +		}
> +		if (info->flags & MSI_FLAG_DEV_SYSFS) {
> +			ret = msi_sysfs_populate_desc(dev, desc);
> +			if (ret)
> +				return ret;
>   		}
>   		allocated++;
>   	}
> 

---
Best Regards
Kunihiko Hayashi

