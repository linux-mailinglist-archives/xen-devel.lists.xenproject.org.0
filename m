Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A3F59D935
	for <lists+xen-devel@lfdr.de>; Tue, 23 Aug 2022 12:05:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.391857.629856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQQmh-0005M3-9Z; Tue, 23 Aug 2022 10:05:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 391857.629856; Tue, 23 Aug 2022 10:05:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQQmh-0005J8-6C; Tue, 23 Aug 2022 10:05:23 +0000
Received: by outflank-mailman (input) for mailman id 391857;
 Tue, 23 Aug 2022 10:05:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oQQmf-0005J2-ES
 for xen-devel@lists.xenproject.org; Tue, 23 Aug 2022 10:05:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oQQmf-0000DC-5j; Tue, 23 Aug 2022 10:05:21 +0000
Received: from [54.239.6.189] (helo=[192.168.28.231])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oQQme-0000df-UZ; Tue, 23 Aug 2022 10:05:21 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=dCFqI9fzB8tUcERRc6YgZZuD03fZHkFd1leE9//sFyQ=; b=p99W/Y3y6bvDyjRX1/YdDMeKtL
	gVrYoVtLup2OZtX409gddaU8Lxk6WufXgPvN/yhWHARykp5CwRMee/PTzX/pkIC904EeK91U6ATqj
	+bB8IUb2OIBhYfdiK3MMMBr3+R5IJWtX6dL3vIE4e0cO9BWGfN9NBsVYaq8VM/x78aQw=;
Message-ID: <d5ed6097-8a08-eb4d-35a0-ab28f82b881f@xen.org>
Date: Tue, 23 Aug 2022 11:05:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH v2 7/7] xen/arm: introduce new xen,enhanced property value
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1660902588.git.rahul.singh@arm.com>
 <2fb69ff7cf9a36dd1294da4f9f4b968ff7076d42.1660902588.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2fb69ff7cf9a36dd1294da4f9f4b968ff7076d42.1660902588.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 19/08/2022 11:02, Rahul Singh wrote:
> Introduce a new "xen,enhanced" dom0less property value "evtchn" to
> enable/disable event-channel interfaces for dom0less guests.

The documentation in docs/misc/arm/device-tree/booting.txt is missing. 
Also, you probably wants to update docs/feature/dom0less.pandoc because 
the section "PV drivers" suggests that if the property "xen,enhanced" is 
specified, then we would end up to allocate information for PV drivers.

AFAIU, this is not the case when "evtchn" is specified.

> 
> The configurable option is for domUs only. For dom0 we always set the
> corresponding property in the Xen code to true.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
> Changes in v2:
>   - no change
> ---
> ---
>   xen/arch/arm/domain_build.c       | 149 ++++++++++++++++--------------
>   xen/arch/arm/include/asm/kernel.h |   3 +
>   2 files changed, 82 insertions(+), 70 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 5101bca979..bd8b8475b7 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1396,85 +1396,92 @@ static int __init make_hypervisor_node(struct domain *d,
>       if ( res )
>           return res;
>   


The diff below is quite difficult to read. I have applied to have a 
look. You seem to have simply indented the code and now some of the
lines are over the 80 characters mark.

Ideally, I would like to avoid large 'if'. So I would suggest to either
re-ordering the code or split in multiple functions.

However, reading the binding of "xen,xen", the property "reg" and 
"interrupts" are not optional.

I also don't think can make them optional because some OSes may not boot 
if it can't find one of the property.

In any case, at minimum you should explain why this is fine to make them 
optional.

[...]


> -    /*
> -     * Interrupt event channel upcall:
> -     *  - Active-low level-sensitive
> -     *  - All CPUs
> -     *  TODO: Handle properly the cpumask;
> -     */
> -    set_interrupt(intr, d->arch.evtchn_irq, 0xf, DT_IRQ_TYPE_LEVEL_LOW);
> -    res = fdt_property_interrupts(kinfo, &intr, 1);
> -    if ( res )
> -        return res;
> +    if ( kinfo->dom0less_evtchn )

So I understand why you want to make the first part optional. But this 
is not clear why this one become conditional to "dom0less_evtchn". Do 
you have any plan to only present the node "xen,xen" where neither event 
channels nor PV interfaces would be used?

> +    {
> +        BUG_ON(d->arch.evtchn_irq == 0);
> +
> +        /*
> +         * Interrupt event channel upcall:
> +         *  - Active-low level-sensitive
> +         *  - All CPUs
> +         *  TODO: Handle properly the cpumask;
> +        */
> +        set_interrupt(intr, d->arch.evtchn_irq, 0xf, DT_IRQ_TYPE_LEVEL_LOW);
> +        res = fdt_property_interrupts(kinfo, &intr, 1);
> +        if ( res )
> +            return res;
> +    }
>   
>       res = fdt_end_node(fdt);
>   
> @@ -2891,7 +2898,7 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>               goto err;
>       }
>   
> -    if ( kinfo->dom0less_enhanced )
> +    if ( kinfo->dom0less_enhanced || kinfo->dom0less_evtchn )

I think the first part of the if can be removed because you can't do 
without event channel.

>       {
>           ret = make_hypervisor_node(d, kinfo, addrcells, sizecells);
>           if ( ret )
> @@ -3343,11 +3350,11 @@ static int __init construct_domU(struct domain *d,
>            rc == -ENODATA ||
>            (rc == 0 && !strcmp(dom0less_enhanced, "enabled")) )
>       {
> -        if ( hardware_domain )
> -            kinfo.dom0less_enhanced = true;
> -        else
> -            panic("Tried to use xen,enhanced without dom0\n");
> +        kinfo.dom0less_enhanced = true;
> +        kinfo.dom0less_evtchn = true;
>       }
> +    else if ( rc == 0 && !strcmp(dom0less_enhanced, "evtchn") )
> +        kinfo.dom0less_evtchn = true;
>   
>       if ( vcpu_create(d, 0) == NULL )
>           return -ENOMEM;
> @@ -3526,6 +3533,8 @@ static int __init construct_dom0(struct domain *d)
>   
>       kinfo.unassigned_mem = dom0_mem;
>       kinfo.d = d;
> +    kinfo.dom0less_enhanced = true;
> +    kinfo.dom0less_evtchn = true;
>   
>       rc = kernel_probe(&kinfo, NULL);
>       if ( rc < 0 )
> diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
> index c4dc039b54..7cff19b997 100644
> --- a/xen/arch/arm/include/asm/kernel.h
> +++ b/xen/arch/arm/include/asm/kernel.h
> @@ -39,6 +39,9 @@ struct kernel_info {
>       /* Enable PV drivers */
>       bool dom0less_enhanced;
>   
> +    /* Enable event-channel interface */
> +    bool dom0less_evtchn;

So technically, the event channel interface is still exposed even if 
this is false. This is because we are still allocate the PPI and set the 
number of events to a non-zero value.

IMHO, if dom0less_evtchn is false, then we should properly disable the 
event channels interface not just hide it.

Cheers,


-- 
Julien Grall

