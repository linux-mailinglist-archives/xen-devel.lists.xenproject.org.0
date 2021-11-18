Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45512455301
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 04:00:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227074.392628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnXea-0003Cv-9J; Thu, 18 Nov 2021 03:00:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227074.392628; Thu, 18 Nov 2021 03:00:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mnXea-00039d-61; Thu, 18 Nov 2021 03:00:00 +0000
Received: by outflank-mailman (input) for mailman id 227074;
 Thu, 18 Nov 2021 02:59:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vl7d=QF=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mnXeY-00039X-No
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 02:59:58 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9bb699a9-481b-11ec-a9d2-d9f7a1cc8784;
 Thu, 18 Nov 2021 03:59:56 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9A79D61078;
 Thu, 18 Nov 2021 02:59:54 +0000 (UTC)
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
X-Inumbo-ID: 9bb699a9-481b-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1637204395;
	bh=227Kim8Epr57A67ppbaKw+6u1E9HBwUOh5FxSr6Cn14=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XpTmPt+fHWVVNN/Ylt0eFjIkkaBDCaeE2eq9H9m63LhoPMmauihZge7y16ITBJyha
	 LwntF+e9/CBis2btp5gifLobTce4McesWba1csDJxjhGM+P0nsd6BNdFVCh1lhBeot
	 /sDL2hY+hXifFN1pNGR6y8souny60jkoY0QRRhXOXTTDMbv/BgGOnjSJJJsJijUm9y
	 3WXnwF3P0qVYj9wRMqcJE3uRImS85+768wQQszbPf9qaL9PKuflgHTaG0cNVhNNUb3
	 6E6CRro9k8K+e9xw9M68VgWeJWcCKKJe+LU0nvvT39WoHv+CZNzcBIsqE6JdJ2g30n
	 XdkHhwhkbFERA==
Date: Wed, 17 Nov 2021 18:59:53 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, wei.chen@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>, 
    Juergen Gross <jgross@suse.com>, Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [RFC PATCH 1/2] xen/cpupool: Create different cpupools at boot
 time
In-Reply-To: <20211117095711.26596-2-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.22.394.2111171854240.1412361@ubuntu-linux-20-04-desktop>
References: <20211117095711.26596-1-luca.fancellu@arm.com> <20211117095711.26596-2-luca.fancellu@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 17 Nov 2021, Luca Fancellu wrote:
> Introduce an architecture specific way to create different
> cpupool at boot time, this is particularly useful on ARM
> biglittle system where there might be the need to have
> different cpupools for each type of core, but also systems
> using NUMA can have different cpu pool for each node.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  xen/arch/arm/Kconfig       | 15 +++++++
>  xen/arch/arm/Makefile      |  1 +
>  xen/arch/arm/cpupool.c     | 84 ++++++++++++++++++++++++++++++++++++++
>  xen/common/sched/cpupool.c |  5 ++-
>  xen/include/xen/cpupool.h  | 30 ++++++++++++++
>  5 files changed, 134 insertions(+), 1 deletion(-)
>  create mode 100644 xen/arch/arm/cpupool.c
>  create mode 100644 xen/include/xen/cpupool.h
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index ecfa6822e4..4d7cc9f3bc 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -33,6 +33,21 @@ config ACPI
>  	  Advanced Configuration and Power Interface (ACPI) support for Xen is
>  	  an alternative to device tree on ARM64.
>  
> +config BOOT_TIME_CPUPOOLS
> +	bool "Create cpupools per cpu type at boot time."
> +	depends on ARM
> +	default n
> +	help
> +
> +	  Creates, during boot, a cpu pool for each type of CPU found on
> +	  the system. This option is useful on system with heterogeneous
> +	  types of core.

Let's use a command line option instead (or in addition?). The code is
so small that I would probably not bother with the kconfig option.


> +config MAX_BOOT_TIME_CPUPOOLS
> +	depends on BOOT_TIME_CPUPOOLS
> +	int "Maximum number of cpupools that can be created at boot time."
> +	default 16

Maybe it could be just a #define


>  config GICV3
>  	bool "GICv3 driver"
>  	depends on ARM_64 && !NEW_VGIC
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 07f634508e..0bb8b84750 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -13,6 +13,7 @@ obj-$(CONFIG_HAS_ALTERNATIVE) += alternative.o
>  obj-y += bootfdt.init.o
>  obj-y += cpuerrata.o
>  obj-y += cpufeature.o
> +obj-$(CONFIG_BOOT_TIME_CPUPOOLS) += cpupool.o
>  obj-y += decode.o
>  obj-y += device.o
>  obj-$(CONFIG_IOREQ_SERVER) += dm.o
> diff --git a/xen/arch/arm/cpupool.c b/xen/arch/arm/cpupool.c
> new file mode 100644
> index 0000000000..550521e352
> --- /dev/null
> +++ b/xen/arch/arm/cpupool.c
> @@ -0,0 +1,84 @@
> +/******************************************************************************
> + * cpupool.c
> + *
> + * (C) 2021, arm
> + */
> +
> +#include <xen/cpumask.h>
> +#include <xen/cpupool.h>
> +#include <xen/err.h>
> +#include <xen/sched.h>
> +#include <asm/cpufeature.h>
> +#include <asm/processor.h>
> +#include "../../common/sched/private.h"
> +
> +typedef struct {
> +    register_t     midr;
> +    struct cpupool *pool;
> +} pool_t;
> +
> +static pool_t __initdata pool_cpu_map[CONFIG_MAX_BOOT_TIME_CPUPOOLS];
> +
> +void __init arch_allocate_cpupools(const cpumask_t *cpu_online_map,
> +                                   cpupool_create_t cpupool_create)
> +{
> +    unsigned int cpu, i;
> +
> +    /* First pool is the default pool0 associated with midr of the boot core */
> +    pool_cpu_map[0].midr = system_cpuinfo.midr.bits;
> +    pool_cpu_map[0].pool = cpupool0;
> +
> +    for_each_cpu ( cpu, cpu_online_map )
> +    {
> +        for ( i = 0; i < CONFIG_MAX_BOOT_TIME_CPUPOOLS; i++ )
> +            if ( !pool_cpu_map[i].pool ||
> +                 (cpu_data[cpu].midr.bits == pool_cpu_map[i].midr) )
> +                break;

Please use { } for readability


> +        if ( i < CONFIG_MAX_BOOT_TIME_CPUPOOLS )
> +        {
> +            if ( !pool_cpu_map[i].pool )
> +            {
> +                /* There is no pool for this cpu midr, create it */
> +                pool_cpu_map[i].midr = cpu_data[cpu].midr.bits;
> +                debugtrace_printk("Create pool %u for cpu MIDR: 0x%"
> +                                  PRIregister"\n", i, pool_cpu_map[i].midr);
> +                pool_cpu_map[i].pool =
> +                    cpupool_create(i, scheduler_get_default()->sched_id);
> +                BUG_ON(IS_ERR(pool_cpu_map[i].pool));
> +                cpupool_put(pool_cpu_map[i].pool);
> +            }
> +        }
> +        else
> +            panic("Could not create cpupool, maximum number reached (%u)",
> +                  (unsigned int)(CONFIG_MAX_BOOT_TIME_CPUPOOLS));
> +    }
> +
> +    /* Print useful information about the pools */
> +    for ( i = 0; i < CONFIG_MAX_BOOT_TIME_CPUPOOLS; i++ )
> +        if ( pool_cpu_map[i].pool )
> +            printk(XENLOG_INFO "Pool-%u contains cpu with MIDR: 0x%"
> +                   PRIregister"\n", i, pool_cpu_map[i].midr);

Please use { } for readability


> +}
> +
> +struct cpupool *__init arch_get_cpupool(unsigned int cpu)
> +{
> +    unsigned int i;
> +
> +    for ( i = 0; i < CONFIG_MAX_BOOT_TIME_CPUPOOLS; i++ )
> +        if ( pool_cpu_map[i].pool &&
> +             (cpu_data[cpu].midr.bits == pool_cpu_map[i].midr) )
> +            return pool_cpu_map[i].pool;
> +
> +    return cpupool0;
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
> index 8c6e6eb9cc..7389f04e28 100644
> --- a/xen/common/sched/cpupool.c
> +++ b/xen/common/sched/cpupool.c
> @@ -13,6 +13,7 @@
>  
>  #include <xen/cpu.h>
>  #include <xen/cpumask.h>
> +#include <xen/cpupool.h>
>  #include <xen/guest_access.h>
>  #include <xen/hypfs.h>
>  #include <xen/init.h>
> @@ -1231,12 +1232,14 @@ static int __init cpupool_init(void)
>      cpupool_put(cpupool0);
>      register_cpu_notifier(&cpu_nfb);
>  
> +    arch_allocate_cpupools(&cpu_online_map, cpupool_create);
> +
>      spin_lock(&cpupool_lock);
>  
>      cpumask_copy(&cpupool_free_cpus, &cpu_online_map);
>  
>      for_each_cpu ( cpu, &cpupool_free_cpus )
> -        cpupool_assign_cpu_locked(cpupool0, cpu);
> +        cpupool_assign_cpu_locked(arch_get_cpupool(cpu), cpu);
>  
>      spin_unlock(&cpupool_lock);
>  
> diff --git a/xen/include/xen/cpupool.h b/xen/include/xen/cpupool.h
> new file mode 100644
> index 0000000000..4b50af9e3d
> --- /dev/null
> +++ b/xen/include/xen/cpupool.h
> @@ -0,0 +1,30 @@
> +#ifndef __XEN_CPUPOOL_H
> +#define __XEN_CPUPOOL_H
> +
> +#include <xen/sched.h>
> +
> +typedef struct cpupool* (*cpupool_create_t)(unsigned int, unsigned int);
> +
> +#ifdef CONFIG_BOOT_TIME_CPUPOOLS
> +
> +void arch_allocate_cpupools(const cpumask_t *cpu_online_map,
> +                            cpupool_create_t cpupool_create);
> +
> +struct cpupool *arch_get_cpupool(unsigned int cpu);
> +
> +#else
> +
> +static inline __init
> +void arch_allocate_cpupools(const cpumask_t *cpu_online_map,
> +                            cpupool_create_t cpupool_create)
> +{
> +}
> +
> +static inline struct cpupool *__init arch_get_cpupool(unsigned int cpu)
> +{
> +    return cpupool0;
> +}
> +
> +#endif
> +
> +#endif /* __XEN_CPUPOOL_H */
> -- 
> 2.17.1
> 

