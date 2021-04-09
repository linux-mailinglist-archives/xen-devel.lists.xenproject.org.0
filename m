Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5293597DE
	for <lists+xen-devel@lfdr.de>; Fri,  9 Apr 2021 10:31:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107686.205826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUmWj-0000uR-SJ; Fri, 09 Apr 2021 08:30:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107686.205826; Fri, 09 Apr 2021 08:30:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUmWj-0000t9-Ol; Fri, 09 Apr 2021 08:30:05 +0000
Received: by outflank-mailman (input) for mailman id 107686;
 Fri, 09 Apr 2021 08:30:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lUmWh-0000e8-S9
 for xen-devel@lists.xenproject.org; Fri, 09 Apr 2021 08:30:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lUmWg-0005jj-NL; Fri, 09 Apr 2021 08:30:02 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lUmWg-0000Vk-3E; Fri, 09 Apr 2021 08:30:02 +0000
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
	bh=NEpvmm9Xgyw0Kv+rJJBTxki3KAJ7/R7T7bXjb5BZLXk=; b=xZLRsLOxJdvfmkpTkLybDuMY52
	V5xV8yBq854n2pSdPWZWpqoBREJzoo5hiF2WGSzS6PifRzTcxI0kZIH5zVrrwDndoyZVa65rNV1Hw
	xdYmF3txJW1DnuOHyyww7NUk8UJvSmUF5zJbrDgEYV3CuGnb1VDoAGjBiPfQOvFtkIMI=;
Subject: Re: [PATCH v2 1/4] xen/arm: Move dom0 creation in domain_build.c
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20210408094818.8173-1-luca.fancellu@arm.com>
 <20210408094818.8173-2-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f6bca491-afdb-df20-c50e-af1c294db91b@xen.org>
Date: Fri, 9 Apr 2021 09:30:00 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210408094818.8173-2-luca.fancellu@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Luca,

On 08/04/2021 10:48, Luca Fancellu wrote:
> Move dom0 creation and start from setup.c to domain_build.c
> on a dedicate function.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>   xen/arch/arm/domain_build.c | 36 ++++++++++++++++++++++++++++++++++++
>   xen/arch/arm/setup.c        | 29 +----------------------------
>   xen/include/asm-arm/setup.h |  1 +
>   3 files changed, 38 insertions(+), 28 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 374bf655ee..d7c9c7f4d1 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -21,6 +21,7 @@
>   #include <asm/device.h>
>   #include <asm/kernel.h>
>   #include <asm/setup.h>
> +#include <asm/tee/tee.h>
>   #include <asm/platform.h>
>   #include <asm/psci.h>
>   #include <asm/setup.h>
> @@ -2520,6 +2521,41 @@ void __init create_domUs(void)
>       }
>   }
>   
> +struct domain* __init create_dom0(void)
> +{
> +    struct domain *dom0;
> +    struct xen_domctl_createdomain dom0_cfg = {
> +        .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
> +        .max_evtchn_port = -1,
> +        .max_grant_frames = gnttab_dom0_frames(),
> +        .max_maptrack_frames = -1,
> +    };
> +
> +    /* The vGIC for DOM0 is exactly emulating the hardware GIC */
> +    dom0_cfg.arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
> +    /*
> +     * Xen vGIC supports a maximum of 992 interrupt lines.
> +     * 32 are substracted to cover local IRQs.
> +     */
> +    dom0_cfg.arch.nr_spis = min(gic_number_lines(), (unsigned int) 992) - 32;
> +    if ( gic_number_lines() > 992 )
> +        printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\n");
> +    dom0_cfg.arch.tee_type = tee_get_type();
> +    dom0_cfg.max_vcpus = dom0_max_vcpus();
> +
> +    if ( iommu_enabled )
> +        dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
> +
> +    dom0 = domain_create(0, &dom0_cfg, true);
> +    if ( IS_ERR(dom0) || (alloc_dom0_vcpu0(dom0) == NULL) )
> +        panic("Error creating domain 0\n");
> +
> +    if ( construct_dom0(dom0) != 0)
> +        panic("Could not set up DOM0 guest OS\n");
> +
> +    return dom0;
> +}
> +

I would move the function after...

>   int __init construct_dom0(struct domain *d)

... this function so we can mark construct_dom0() static as 
create_dom0() is the only caller.

>   {
>       struct kernel_info kinfo = {};
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 2532ec9739..b405f58996 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -51,7 +51,6 @@
>   #include <asm/platform.h>
>   #include <asm/procinfo.h>
>   #include <asm/setup.h>
> -#include <asm/tee/tee.h>
>   #include <xsm/xsm.h>
>   #include <asm/acpi.h>
>   
> @@ -805,12 +804,6 @@ void __init start_xen(unsigned long boot_phys_offset,
>       const char *cmdline;
>       struct bootmodule *xen_bootmodule;
>       struct domain *dom0;
> -    struct xen_domctl_createdomain dom0_cfg = {
> -        .flags = XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
> -        .max_evtchn_port = -1,
> -        .max_grant_frames = gnttab_dom0_frames(),
> -        .max_maptrack_frames = -1,
> -    };
>       int rc;
>   
>       dcache_line_bytes = read_dcache_line_bytes();
> @@ -965,27 +958,7 @@ void __init start_xen(unsigned long boot_phys_offset,
>       enable_errata_workarounds();
>   
>       /* Create initial domain 0. */
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
> +    dom0 = create_dom0();
>   
>       heap_init_late();
>   
> diff --git a/xen/include/asm-arm/setup.h b/xen/include/asm-arm/setup.h
> index 28bf622aa1..e5f5c7ebc6 100644
> --- a/xen/include/asm-arm/setup.h
> +++ b/xen/include/asm-arm/setup.h
> @@ -95,6 +95,7 @@ int acpi_make_efi_nodes(void *fdt, struct membank tbl_add[]);
>   
>   int construct_dom0(struct domain *d);
>   void create_domUs(void);
> +struct domain* create_dom0(void);
>   
>   void discard_initial_modules(void);
>   void fw_unreserved_regions(paddr_t s, paddr_t e,
> 

Cheers,

-- 
Julien Grall

