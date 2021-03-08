Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F57A331088
	for <lists+xen-devel@lfdr.de>; Mon,  8 Mar 2021 15:13:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.94964.179041 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJGcj-0000qu-SV; Mon, 08 Mar 2021 14:12:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 94964.179041; Mon, 08 Mar 2021 14:12:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJGcj-0000qV-P8; Mon, 08 Mar 2021 14:12:41 +0000
Received: by outflank-mailman (input) for mailman id 94964;
 Mon, 08 Mar 2021 14:12:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lJGci-0000qQ-Rz
 for xen-devel@lists.xenproject.org; Mon, 08 Mar 2021 14:12:40 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lJGch-0005kP-P0; Mon, 08 Mar 2021 14:12:39 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lJGch-0005tD-CW; Mon, 08 Mar 2021 14:12:39 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=Vx1g6QNUtDJ9YsyQJ1DdnYdb/4TlAu9VHbLiBVF/bzk=; b=nIavXu/ynJduC1vwfhCHrHNqbS
	8sbuQ8RtItHRYFn8ua+MCkmSpO/6sl75oQ69ctVt5C7zNBCTXw7wWkR8RRtQwPz0S5zPoDgypAt0z
	hCI6EhCBdlhOUmMvjO5/zRUzNO9Lk+wNLyk8ut3ZiA4HcL5vrbSCt6z2hdTrQ07uiv9Q=;
Subject: Re: [PATCH] xen/arm: Prevent Dom0 to be loaded when using dom0less
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210308115610.48203-1-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <1921ff88-7637-6454-74a7-1cbab8dafc61@xen.org>
Date: Mon, 8 Mar 2021 14:12:37 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210308115610.48203-1-luca.fancellu@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Luca,

On 08/03/2021 11:56, Luca Fancellu wrote:
> This patch prevents the dom0 to be loaded skipping its
> building and going forward to build domUs when the dom0
> kernel is not found and at least one domU is present.

As you are skipping dom0, the domid 0 will not be usable for another 
domain. I can see a few issues:
    1) The first domU created will now be considered as the hardware 
domain (see domain_create()).
    2)  There are still a few hardcoded use of d->domain_id == 0 in the 
codebase (I could spot at least on in the RTDS code).
    3) Not all the code seems to be able to cope with hardware_domain is 
NULL (although most of it looks to be only reachable by x86)?
    4) is_hardware_domain() will return true when passing NULL. It is 
not clear whether one may pass NULL here.

For 2), ideally this needs to be fixed. But we may also want to reserve 
domid 0 just for sanity.

For 3) and 4), you will need to go through the code and check the usage.

> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>   xen/arch/arm/setup.c | 83 +++++++++++++++++++++++++++++++-------------
>   1 file changed, 59 insertions(+), 24 deletions(-)
> 
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 2532ec9739..6d169ff6ce 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -794,6 +794,35 @@ static void __init setup_mm(void)
>   }
>   #endif
>   
> +static bool __init is_dom0less_mode(void)
> +{
> +    struct bootmodules *mods = &bootinfo.modules;
> +    struct bootmodule *mod;
> +    unsigned int i;
> +    bool dom0found = false;
> +    bool domUfound = false;
> +
> +    /* Look into the bootmodules */
> +    for ( i = 0 ; i < mods->nr_mods ; i++ )
> +    {
> +        mod = &mods->module[i];
> +        /* Find if dom0 and domU kernels are present */
> +        if ( mod->kind == BOOTMOD_KERNEL )
> +        {
> +            if ( mod->domU == false )
> +                dom0found = true;
> +            else
> +                domUfound = true;
> +        }
> +    }
> +
> +    /*
> +     * If there is no dom0 kernel but at least one domU, then we are in
> +     * dom0less mode
> +     */
> +    return ( !dom0found && domUfound );
> +}
Should the documentation be updated to reflect this change?

> +
>   size_t __read_mostly dcache_line_bytes;
>   
>   /* C entry point for boot CPU */
> @@ -804,7 +833,7 @@ void __init start_xen(unsigned long boot_phys_offset,
>       int cpus, i;
>       const char *cmdline;
>       struct bootmodule *xen_bootmodule;
> -    struct domain *dom0;
> +    struct domain *dom0 = NULL;
>       struct xen_domctl_createdomain dom0_cfg = {
>           .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
>           .max_evtchn_port = -1,
> @@ -964,28 +993,33 @@ void __init start_xen(unsigned long boot_phys_offset,
>       apply_alternatives_all();
>       enable_errata_workarounds();
>   
> -    /* Create initial domain 0. */
> -    /* The vGIC for DOM0 is exactly emulating the hardware GIC */
> -    dom0_cfg.arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
> -    /*
> -     * Xen vGIC supports a maximum of 992 interrupt lines.
> -     * 32 are substracted to cover local IRQs.
> -     */
> -    dom0_cfg.arch.nr_spis = min(gic_number_lines(), (unsigned int) 992) - 32;
> -    if ( gic_number_lines() > 992 )
> -        printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\n");
> -    dom0_cfg.arch.tee_type = tee_get_type();
> -    dom0_cfg.max_vcpus = dom0_max_vcpus();
> -
> -    if ( iommu_enabled )
> -        dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
> -
> -    dom0 = domain_create(0, &dom0_cfg, true);
> -    if ( IS_ERR(dom0) || (alloc_dom0_vcpu0(dom0) == NULL) )
> -        panic("Error creating domain 0\n");
> -
> -    if ( construct_dom0(dom0) != 0)
> -        panic("Could not set up DOM0 guest OS\n");
> +    if ( !is_dom0less_mode() )
> +    {
> +        /* Create initial domain 0. */
> +        /* The vGIC for DOM0 is exactly emulating the hardware GIC */
> +        dom0_cfg.arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
> +        /*
> +        * Xen vGIC supports a maximum of 992 interrupt lines.
> +        * 32 are substracted to cover local IRQs.
> +        */
> +        dom0_cfg.arch.nr_spis = min(gic_number_lines(), (unsigned int) 992) - 32;
> +        if ( gic_number_lines() > 992 )
> +            printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\n");
> +        dom0_cfg.arch.tee_type = tee_get_type();
> +        dom0_cfg.max_vcpus = dom0_max_vcpus();
> +
> +        if ( iommu_enabled )
> +            dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
> +
> +        dom0 = domain_create(0, &dom0_cfg, true);
> +        if ( IS_ERR(dom0) || (alloc_dom0_vcpu0(dom0) == NULL) )
> +            panic("Error creating domain 0\n");
> +
> +        if ( construct_dom0(dom0) != 0)
> +            panic("Could not set up DOM0 guest OS\n");
> +    }

It always felt a bit strange the dom0 creation is partly happening in 
setup.c when for domU everythink will happen in domain_build.c.

Woule you be able to create a patch that will first move the code in a 
new function (maybe create_dom0())? The function would return NULL in 
case of an error or the domain.

> +    else
> +        printk(XENLOG_INFO "Xen dom0less mode detected\n");
>   
>       heap_init_late();
>   
> @@ -1003,7 +1037,8 @@ void __init start_xen(unsigned long boot_phys_offset,
>       if ( acpi_disabled )
>           create_domUs();
>   
> -    domain_unpause_by_systemcontroller(dom0);
> +    if ( dom0 )
> +        domain_unpause_by_systemcontroller(dom0);
>   
>       /* Switch on to the dynamically allocated stack for the idle vcpu
>        * since the static one we're running on is about to be freed. */
> 

Cheers,

-- 
Julien Grall

