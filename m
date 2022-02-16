Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F864B7D9D
	for <lists+xen-devel@lfdr.de>; Wed, 16 Feb 2022 03:46:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273636.468878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKAKa-0003W5-SD; Wed, 16 Feb 2022 02:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273636.468878; Wed, 16 Feb 2022 02:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nKAKa-0003T4-Oh; Wed, 16 Feb 2022 02:46:12 +0000
Received: by outflank-mailman (input) for mailman id 273636;
 Wed, 16 Feb 2022 02:46:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7gZM=S7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nKAKa-0003Sy-1R
 for xen-devel@lists.xenproject.org; Wed, 16 Feb 2022 02:46:12 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9387b3e3-8ed2-11ec-b215-9bbe72dcb22c;
 Wed, 16 Feb 2022 03:46:02 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9DB7D6183D;
 Wed, 16 Feb 2022 02:46:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 790C5C340EB;
 Wed, 16 Feb 2022 02:45:59 +0000 (UTC)
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
X-Inumbo-ID: 9387b3e3-8ed2-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644979560;
	bh=ggXUe6rKOUF5lPIf4uf2zcbkavucVhB0YDq8wqfS9rI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kBIztSH2o0TeWTdLEuWffJueBiV99d8LE3O7TxeHQz5VLZriifh1M1wYsiGYOtp34
	 a9mwVklUJfqqOm5//W9ywN7lVXrC6Ncw/6+2KYrp2gCUN4b4uZUO6BVUX4rOL6LNvz
	 WPDQ47c7pJHHzYQ/uYXeUpal9tFkex/u/HKdJ2638rm6hpBDzBCdRMoraod3WBMn87
	 XsH8tjSIefoJOXaDfPLMsonoN+wbeyD/k8t9szCXRwTjNiM5bNb8LZGE/YuPaMVzou
	 2iYCqHX3U9mJhBm3vDXZ3/MVFqRdZO6iK8gADNd/01+MZSNdk65KASk9eYACMOanF2
	 vbxXlliP01BtQ==
Date: Tue, 15 Feb 2022 18:45:59 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, wei.chen@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, 
    Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH 4/5] xen/cpupool: Create different cpupools at boot
 time
In-Reply-To: <20220215101551.23101-5-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.22.394.2202151827380.43738@ubuntu-linux-20-04-desktop>
References: <20220215101551.23101-1-luca.fancellu@arm.com> <20220215101551.23101-5-luca.fancellu@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 15 Feb 2022, Luca Fancellu wrote:
> Introduce an architecture specific way to create different cpupools
> at boot time, this is particularly useful on ARM big.LITTLE system
> where there might be the need to have different cpupools for each type
> of core, but also systems using NUMA can have different cpu pools for
> each node.
> 
> The feature on arm relies on a specification of the cpupools from the
> device tree to build pools and assign cpus to them.
> 
> Documentation is created to explain the feature.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  docs/misc/arm/device-tree/cpupools.txt | 118 +++++++++++++++++++++++++
>  xen/arch/arm/Kconfig                   |   9 ++
>  xen/arch/arm/Makefile                  |   1 +
>  xen/arch/arm/cpupool.c                 | 118 +++++++++++++++++++++++++
>  xen/common/sched/cpupool.c             |   4 +-
>  xen/include/xen/sched.h                |  11 +++
>  6 files changed, 260 insertions(+), 1 deletion(-)
>  create mode 100644 docs/misc/arm/device-tree/cpupools.txt
>  create mode 100644 xen/arch/arm/cpupool.c
> 
> diff --git a/docs/misc/arm/device-tree/cpupools.txt b/docs/misc/arm/device-tree/cpupools.txt
> new file mode 100644
> index 000000000000..7298b6394332
> --- /dev/null
> +++ b/docs/misc/arm/device-tree/cpupools.txt
> @@ -0,0 +1,118 @@
> +Boot time cpupools
> +==================
> +
> +On arm, when BOOT_TIME_CPUPOOLS is enabled in the Xen configuration, it is
> +possible to create cpupools during boot phase by specifying them in the device
> +tree.
> +
> +Cpupools specification nodes shall be direct childs of /chosen node.
> +Each cpupool node contains the following properties:
> +
> +- compatible (mandatory)
> +
> +    Must always include the compatiblity string: "xen,cpupool".
> +
> +- cpupool-id (mandatory)
> +
> +    Must be a positive integer number.

Why is cpupool-id mandatory? It looks like it could be generated by Xen.
Or is it actually better to have the user specify it anyway?


> +- cpupool-cpus (mandatory)
> +
> +    Must be a list of device tree phandle to nodes describing cpus (e.g. having
> +    device_type = "cpu"), it can't be empty.
> +
> +- cpupool-sched (optional)
> +
> +    Must be a string having the name of a Xen scheduler, it has no effect when
> +    used in conjunction of a cpupool-id equal to zero, in that case the
> +    default Xen scheduler is selected (sched=<...> boot argument).

I don't get why cpupool-id == 0 should trigger a special cpupool-sched
behavior.


> +Constraints
> +===========
> +
> +The cpupool with id zero is implicitly created even if not specified, that pool
> +must have at least one cpu assigned, otherwise Xen will stop.
> +
> +Every cpu brought up by Xen will be assigned to the cpupool with id zero if it's
> +not assigned to any other cpupool.
> +
> +If a cpu is assigned to a cpupool, but it's not brought up correctly, Xen will
> +stop.

Thank you for documenting the constraints, but why do we have them?
Imagine a user specifying 3 cpu pools and imagine the cpupool-id is
optional and missing. We could take care of the cpupool-id generation in
Xen and we could also assign the default scheduler everywhere
cpupool-sched is not specified. Maybe I am missing something?

Does cpupool0 has to exist? I guess the answer could be yes, but if it
is specified as id of one of the pools we are fine, otherwise it could
be automatically generated by Xen.

In any case, I don't think that cpupool0 has to have the default
scheduler?

My suggestion would be:

- make cpupool-id optional
- assign automatically cpupool-ids starting from 0
    - respect cpupool-ids chosen by the user
- if some CPUs are left out (not specified in any pool) add an extra cpupool
    - the extra cpupool doesn't have to be cpupool-id == 0, it could be
      cpupool-id == n
    - the extra cpupool uses the default scheduler

If the user created cpupools in device tree covering all CPUs and also
specified all cpupool-ids everywhere, and none of them are 0 (no cpupool
in the system is cpupool0) then panic. (Assuming that cpupool0 is
required.)


> +Examples
> +========
> +
> +A system having two types of core, the following device tree specification will
> +instruct Xen to have two cpupools:
> +
> +- The cpupool with id 0 will have 4 cpus assigned.
> +- The cpupool with id 1 will have 2 cpus assigned.
> +
> +As can be seen from the example, cpupool_a has only two cpus assigned, but since
> +there are two cpus unassigned, they are automatically assigned to cpupool with
> +id zero. The following example can work only if hmp-unsafe=1 is passed to Xen
> +boot arguments, otherwise not all cores will be brought up by Xen and the
> +cpupool creation process will stop Xen.
> +
> +
> +a72_1: cpu@0 {
> +        compatible = "arm,cortex-a72";
> +        reg = <0x0 0x0>;
> +        device_type = "cpu";
> +        [...]
> +};
> +
> +a72_2: cpu@1 {
> +        compatible = "arm,cortex-a72";
> +        reg = <0x0 0x1>;
> +        device_type = "cpu";
> +        [...]
> +};
> +
> +a53_1: cpu@100 {
> +        compatible = "arm,cortex-a53";
> +        reg = <0x0 0x100>;
> +        device_type = "cpu";
> +        [...]
> +};
> +
> +a53_2: cpu@101 {
> +        compatible = "arm,cortex-a53";
> +        reg = <0x0 0x101>;
> +        device_type = "cpu";
> +        [...]
> +};
> +
> +cpu@102 {
> +        compatible = "arm,cortex-a53";
> +        reg = <0x0 0x102>;
> +        device_type = "cpu";
> +        [...]
> +};
> +
> +cpu@103 {
> +        compatible = "arm,cortex-a53";
> +        reg = <0x0 0x103>;
> +        device_type = "cpu";
> +        [...]
> +};
> +
> +chosen {
> +
> +    cpupool_a {
> +        compatible = "xen,cpupool";
> +        cpupool-id = <0>;
> +        cpupool-cpus = <&a53_1 &a53_2>;
> +    };
> +    cpupool_b {
> +        compatible = "xen,cpupool";
> +        cpupool-id = <1>;
> +        cpupool-cpus = <&a72_1 &a72_2>;
> +        cpupool-sched = "credit2";
> +    };

Question above notwithstanding, I like it!


> +    [...]
> +
> +};
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index ecfa6822e4d3..64c2879513b7 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -33,6 +33,15 @@ config ACPI
>  	  Advanced Configuration and Power Interface (ACPI) support for Xen is
>  	  an alternative to device tree on ARM64.
>  
> +config BOOT_TIME_CPUPOOLS
> +	bool "Create cpupools at boot time"
> +	depends on ARM
> +	default n
> +	help
> +
> +	  Creates cpupools during boot time and assigns cpus to them. Cpupools
> +	  options can be specified in the device tree.
> +
>  config GICV3
>  	bool "GICv3 driver"
>  	depends on ARM_64 && !NEW_VGIC
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index d0dee10102b6..6165da4e77b4 100644
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
> index 000000000000..a9d5b94635b9
> --- /dev/null
> +++ b/xen/arch/arm/cpupool.c
> @@ -0,0 +1,118 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * xen/arch/arm/cpupool.c
> + *
> + * Code to create cpupools at boot time for arm architecture.
> + *
> + * Copyright (C) 2022 Arm Ltd.
> + */
> +
> +#include <xen/sched.h>
> +
> +static struct cpupool *__initdata pool_cpu_map[NR_CPUS];
> +
> +void __init arch_allocate_cpupools(const cpumask_t *cpu_online_map)
> +{
> +    const struct dt_device_node *chosen, *node;
> +    unsigned int cpu_num, cpupool0_cpu_count = 0;
> +    cpumask_t cpus_to_assign;
> +
> +    chosen = dt_find_node_by_path("/chosen");
> +    if ( !chosen )
> +        return;
> +
> +    cpumask_copy(&cpus_to_assign, cpu_online_map);
> +
> +    dt_for_each_child_node(chosen, node)
> +    {
> +        const struct dt_device_node *cpu_node;
> +        unsigned int pool_id;
> +        int i = 0, sched_id = -1;
> +        const char* scheduler_name;
> +        struct cpupool *pool = cpupool0;
> +
> +        if ( !dt_device_is_compatible(node, "xen,cpupool") )
> +            continue;
> +
> +        if ( !dt_property_read_u32(node, "cpupool-id", &pool_id) )
> +            panic("Missing cpupool-id property!\n");
> +
> +        if ( !dt_property_read_string(node, "cpupool-sched", &scheduler_name) )
> +        {
> +            sched_id = sched_get_id_by_name(scheduler_name);
> +            if ( sched_id < 0 )
> +                panic("Scheduler %s does not exists!\n", scheduler_name);
> +        }
> +
> +        if ( pool_id )
> +        {
> +            pool = cpupool_create_pool(pool_id, sched_id);
> +            if ( !pool )
> +                panic("Error creating pool id %u!\n", pool_id);
> +        }
> +
> +        cpu_node = dt_parse_phandle(node, "cpupool-cpus", 0);
> +        if ( !cpu_node )
> +            panic("Missing or empty cpupool-cpus property!\n");
> +
> +        while ( cpu_node )
> +        {
> +            register_t cpu_reg;
> +            const __be32 *prop;
> +
> +            prop = dt_get_property(cpu_node, "reg", NULL);
> +            if ( !prop )
> +                panic("cpupool-cpus pointed node has no reg property!\n");
> +
> +            cpu_reg = dt_read_number(prop, dt_n_addr_cells(cpu_node));
> +
> +            /* Check if the cpu is online and in the set to be assigned */
> +            for_each_cpu ( cpu_num, &cpus_to_assign )
> +                if ( cpu_logical_map(cpu_num) == cpu_reg )
> +                    break;
> +
> +            if ( cpu_num >= nr_cpu_ids )
> +                panic("Cpu found in %s is not online or it's assigned twice!\n",
> +                      dt_node_name(node));
> +
> +            pool_cpu_map[cpu_num] = pool;
> +            cpumask_clear_cpu(cpu_num, &cpus_to_assign);
> +
> +            printk(XENLOG_INFO "CPU with MPIDR %"PRIregister" in Pool-%u.\n",
> +                   cpu_reg, pool_id);
> +
> +            /* Keep track of how many cpus are assigned to Pool-0 */
> +            if ( !pool_id )
> +                cpupool0_cpu_count++;
> +
> +            cpu_node = dt_parse_phandle(node, "cpupool-cpus", ++i);
> +        }
> +    }
> +
> +    /* Assign every non assigned cpu to Pool-0 */
> +    for_each_cpu ( cpu_num, &cpus_to_assign )
> +    {
> +        pool_cpu_map[cpu_num] = cpupool0;
> +        cpupool0_cpu_count++;
> +        printk(XENLOG_INFO "CPU with MPIDR %"PRIregister" in Pool-0.\n",
> +               cpu_logical_map(cpu_num));
> +    }
> +
> +    if ( !cpupool0_cpu_count )
> +        panic("No cpu assigned to cpupool0!\n");
> +}
> +
> +struct cpupool *__init arch_get_cpupool(unsigned int cpu)
> +{
> +    return pool_cpu_map[cpu];
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
> index 4da12528d6b9..6013d75e2edd 100644
> --- a/xen/common/sched/cpupool.c
> +++ b/xen/common/sched/cpupool.c
> @@ -1257,12 +1257,14 @@ static int __init cpupool_init(void)
>      cpupool_put(cpupool0);
>      register_cpu_notifier(&cpu_nfb);
>  
> +    arch_allocate_cpupools(&cpu_online_map);
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
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index a67a9eb2fe9d..dda7db2ba51f 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -1177,6 +1177,17 @@ extern void dump_runq(unsigned char key);
>  
>  void arch_do_physinfo(struct xen_sysctl_physinfo *pi);
>  
> +#ifdef CONFIG_BOOT_TIME_CPUPOOLS
> +void arch_allocate_cpupools(const cpumask_t *cpu_online_map);
> +struct cpupool *arch_get_cpupool(unsigned int cpu);
> +#else
> +static inline void arch_allocate_cpupools(const cpumask_t *cpu_online_map) {}
> +static inline struct cpupool *arch_get_cpupool(unsigned int cpu)
> +{
> +    return cpupool0;
> +}
> +#endif
> +
>  #endif /* __SCHED_H__ */
>  
>  /*
> -- 
> 2.17.1
> 

