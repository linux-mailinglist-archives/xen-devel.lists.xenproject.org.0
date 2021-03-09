Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AABA331C50
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 02:34:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95188.179599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJRFo-00011F-I9; Tue, 09 Mar 2021 01:33:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95188.179599; Tue, 09 Mar 2021 01:33:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJRFo-00010u-ED; Tue, 09 Mar 2021 01:33:44 +0000
Received: by outflank-mailman (input) for mailman id 95188;
 Tue, 09 Mar 2021 01:33:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4vHL=IH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lJRFn-00010W-3o
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 01:33:43 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3e858ef6-6f9c-4a10-9b58-1b16c6faf887;
 Tue, 09 Mar 2021 01:33:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8CD8464E02;
 Tue,  9 Mar 2021 01:33:40 +0000 (UTC)
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
X-Inumbo-ID: 3e858ef6-6f9c-4a10-9b58-1b16c6faf887
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1615253620;
	bh=rTPfbtvDKBr1Vhc99NQjoiWbIVIJQa4a18/RwbbvcMk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=i00KA4EiptaiXoR0Zap6t31rmO2SA669bj8iKT/BhNe/Qd2Dyxc6CsGYRnJH64KuU
	 airOkHncFwxndxgx/xnB/IFI9hNKMlJAbn0Tv/QiyHSmLDb5F6R0VZ4NUUlas8CzcU
	 fdAbcqueqcWBAvX28CcZbaPBgoJYYywNU3eZXdos+UafSg25zyu9J57JmmqpxaJJkn
	 X+fO9Dr+RsV0iM84hQAfQgjVN8lKH4Liyt1BgAWHhJikSI83dG8WHPY/uHalJnDe5j
	 CjY6oRTgTlqNiaTVsc/1XEXd7g6XNgy2VZSwYaMe62yE/36st2ibkEZHVcad3V5tqS
	 dC/FyMJTyxrjA==
Date: Mon, 8 Mar 2021 17:33:39 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: Prevent Dom0 to be loaded when using dom0less
In-Reply-To: <20210308115610.48203-1-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.21.2103081730360.16374@sstabellini-ThinkPad-T480s>
References: <20210308115610.48203-1-luca.fancellu@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 8 Mar 2021, Luca Fancellu wrote:
> This patch prevents the dom0 to be loaded skipping its
> building and going forward to build domUs when the dom0
> kernel is not found and at least one domU is present.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  xen/arch/arm/setup.c | 83 +++++++++++++++++++++++++++++++-------------
>  1 file changed, 59 insertions(+), 24 deletions(-)
> 
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 2532ec9739..6d169ff6ce 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -794,6 +794,35 @@ static void __init setup_mm(void)
>  }
>  #endif
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

This code looks correct to me.

Julien's suggestion of updating the docs and moving dom0 creation to
domain_build.c are good ones. And also I think reserving domain_id 0 is
really important to avoid errors and should be done as part of this
patch too.



>  size_t __read_mostly dcache_line_bytes;
>  
>  /* C entry point for boot CPU */
> @@ -804,7 +833,7 @@ void __init start_xen(unsigned long boot_phys_offset,
>      int cpus, i;
>      const char *cmdline;
>      struct bootmodule *xen_bootmodule;
> -    struct domain *dom0;
> +    struct domain *dom0 = NULL;
>      struct xen_domctl_createdomain dom0_cfg = {
>          .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
>          .max_evtchn_port = -1,
> @@ -964,28 +993,33 @@ void __init start_xen(unsigned long boot_phys_offset,
>      apply_alternatives_all();
>      enable_errata_workarounds();
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
> +    else
> +        printk(XENLOG_INFO "Xen dom0less mode detected\n");
>  
>      heap_init_late();
>  
> @@ -1003,7 +1037,8 @@ void __init start_xen(unsigned long boot_phys_offset,
>      if ( acpi_disabled )
>          create_domUs();
>  
> -    domain_unpause_by_systemcontroller(dom0);
> +    if ( dom0 )
> +        domain_unpause_by_systemcontroller(dom0);
>  
>      /* Switch on to the dynamically allocated stack for the idle vcpu
>       * since the static one we're running on is about to be freed. */
> -- 
> 2.17.1
> 

