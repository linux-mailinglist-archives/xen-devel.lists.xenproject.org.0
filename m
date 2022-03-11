Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4D74D595B
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 04:59:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288667.489579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSWPt-0008AR-8R; Fri, 11 Mar 2022 03:58:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288667.489579; Fri, 11 Mar 2022 03:58:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSWPt-00087S-5H; Fri, 11 Mar 2022 03:58:13 +0000
Received: by outflank-mailman (input) for mailman id 288667;
 Fri, 11 Mar 2022 03:58:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8RDm=TW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nSWPr-00087M-CC
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 03:58:11 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 746bafec-a0ef-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 04:58:08 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6B62AB82856;
 Fri, 11 Mar 2022 03:58:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 777B8C340EE;
 Fri, 11 Mar 2022 03:58:02 +0000 (UTC)
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
X-Inumbo-ID: 746bafec-a0ef-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646971083;
	bh=Bk3RZTgTHcZjpg+cqrU2aAsjDMmaJEACzHS2mwJaEIY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZetPW6dnKQCF7XYn08OsufLzzBDABrnn7qNPXg69ijskJLV7ZVGuEWcT4sJ1nhoVf
	 7v4aZdp2TI1bDlhWgTDP7j98ec5TOp0oW4v5KuoAHHb1iXBoeoAIKzIjx3HSTYDG40
	 zChYbvKxI9mjd9FiVCaMvs5lxpfWdq17KJyK7UZgnrNE1gmZ2dl1BRUsPOIJGQXLKR
	 Dm5GCQQkRTFWkKdzT9C5ehbipqSMs3WDewOd19sQ/dOO8e3RzBC34g3iWzXW1TJxr5
	 RAnAFIC5/ShRgn3KcjJ1b7bb1o3aWwR9pt+tv/5h5LamNUGMTOzpJ8MeAOXp8XgYb3
	 RkwlTTx2a5eLQ==
Date: Thu, 10 Mar 2022 19:57:55 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, wei.chen@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>, 
    Dario Faggioli <dfaggioli@suse.com>
Subject: Re: [PATCH v2 4/6] xen/cpupool: Create different cpupools at boot
 time
In-Reply-To: <20220310171019.6170-5-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.22.394.2203101957370.3497@ubuntu-linux-20-04-desktop>
References: <20220310171019.6170-1-luca.fancellu@arm.com> <20220310171019.6170-5-luca.fancellu@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 10 Mar 2022, Luca Fancellu wrote:
> Introduce a way to create different cpupools at boot time, this is
> particularly useful on ARM big.LITTLE system where there might be the
> need to have different cpupools for each type of core, but also
> systems using NUMA can have different cpu pools for each node.
> 
> The feature on arm relies on a specification of the cpupools from the
> device tree to build pools and assign cpus to them.
> 
> Documentation is created to explain the feature.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
> Changes in v2:
> - Move feature to common code (Juergen)
> - Try to decouple dtb parse and cpupool creation to allow
>   more way to specify cpupools (for example command line)
> - Created standalone dt node for the scheduler so it can
>   be used in future work to set scheduler specific
>   parameters
> - Use only auto generated ids for cpupools
> ---
>  docs/misc/arm/device-tree/cpupools.txt | 156 ++++++++++++++++++
>  xen/common/Kconfig                     |   8 +
>  xen/common/Makefile                    |   1 +
>  xen/common/boot_cpupools.c             | 212 +++++++++++++++++++++++++
>  xen/common/sched/cpupool.c             |   6 +-
>  xen/include/xen/sched.h                |  19 +++
>  6 files changed, 401 insertions(+), 1 deletion(-)
>  create mode 100644 docs/misc/arm/device-tree/cpupools.txt
>  create mode 100644 xen/common/boot_cpupools.c
> 
> diff --git a/docs/misc/arm/device-tree/cpupools.txt b/docs/misc/arm/device-tree/cpupools.txt
> new file mode 100644
> index 000000000000..d5a82ed0d45a
> --- /dev/null
> +++ b/docs/misc/arm/device-tree/cpupools.txt
> @@ -0,0 +1,156 @@
> +Boot time cpupools
> +==================
> +
> +When BOOT_TIME_CPUPOOLS is enabled in the Xen configuration, it is possible to
> +create cpupools during boot phase by specifying them in the device tree.
> +
> +Cpupools specification nodes shall be direct childs of /chosen node.
> +Each cpupool node contains the following properties:
> +
> +- compatible (mandatory)
> +
> +    Must always include the compatiblity string: "xen,cpupool".
> +
> +- cpupool-cpus (mandatory)
> +
> +    Must be a list of device tree phandle to nodes describing cpus (e.g. having
> +    device_type = "cpu"), it can't be empty.
> +
> +- cpupool-sched (optional)
> +
> +    Must be a device tree phandle to a node having "xen,scheduler" compatible
> +    (description below), it has no effect when the cpupool refers to the cpupool
> +    number zero, in that case the default Xen scheduler is selected (sched=<...>
> +    boot argument).

This is *a lot* better.

The device tree part is nice. I have only one question left on it: why
do we need a separate scheduler node? Could the "cpupool-sched" property
be a simple string with the scheduler name?

E.g.:

    cpupool_a {
        compatible = "xen,cpupool";
        cpupool-cpus = <&a53_1 &a53_2>;
    };
    cpupool_b {
        compatible = "xen,cpupool";
        cpupool-cpus = <&a72_1 &a72_2>;
        cpupool-sched = "null";
    };


To me, it doesn't look like these new "scheduler specification nodes"
bring any benefits. I would just get rid of them.


> +A scheduler specification node is a device tree node that contains the following
> +properties:
> +
> +- compatible (mandatory)
> +
> +    Must always include the compatiblity string: "xen,scheduler".
> +
> +- sched-name (mandatory)
> +
> +    Must be a string having the name of a Xen scheduler, check the sched=<...>
> +    boot argument for allowed values.
> +
> +
> +Constraints
> +===========
> +
> +If no cpupools are specified, all cpus will be assigned to one cpupool
> +implicitly created (Pool-0).
> +
> +If cpupools node are specified, but not every cpu brought up by Xen is assigned,
> +all the not assigned cpu will be assigned to an additional cpupool.
> +
> +If a cpu is assigned to a cpupool, but it's not brought up correctly, Xen will
> +stop.
> +
> +
> +Examples
> +========
> +
> +A system having two types of core, the following device tree specification will
> +instruct Xen to have two cpupools:
> +
> +- The cpupool with id 0 will have 4 cpus assigned.
> +- The cpupool with id 1 will have 2 cpus assigned.
> +
> +The following example can work only if hmp-unsafe=1 is passed to Xen boot
> +arguments, otherwise not all cores will be brought up by Xen and the cpupool
> +creation process will stop Xen.
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
> +a53_3: cpu@102 {
> +        compatible = "arm,cortex-a53";
> +        reg = <0x0 0x102>;
> +        device_type = "cpu";
> +        [...]
> +};
> +
> +a53_4: cpu@103 {
> +        compatible = "arm,cortex-a53";
> +        reg = <0x0 0x103>;
> +        device_type = "cpu";
> +        [...]
> +};
> +
> +chosen {
> +
> +    sched: sched_a {
> +        compatible = "xen,scheduler";
> +        sched-name = "credit2";
> +    };
> +    cpupool_a {
> +        compatible = "xen,cpupool";
> +        cpupool-cpus = <&a53_1 &a53_2 &a53_3 &a53_4>;
> +    };
> +    cpupool_b {
> +        compatible = "xen,cpupool";
> +        cpupool-cpus = <&a72_1 &a72_2>;
> +        cpupool-sched = <&sched>;
> +    };
> +
> +    [...]
> +
> +};
> +
> +
> +A system having the cpupools specification below will instruct Xen to have three
> +cpupools:
> +
> +- The cpupool Pool-0 will have 2 cpus assigned.
> +- The cpupool Pool-1 will have 2 cpus assigned.
> +- The cpupool Pool-2 will have 2 cpus assigned (created by Xen with all the not
> +  assigned cpus a53_3 and a53_4).
> +
> +chosen {
> +
> +    sched: sched_a {
> +        compatible = "xen,scheduler";
> +        sched-name = "null";
> +    };
> +    cpupool_a {
> +        compatible = "xen,cpupool";
> +        cpupool-cpus = <&a53_1 &a53_2>;
> +    };
> +    cpupool_b {
> +        compatible = "xen,cpupool";
> +        cpupool-cpus = <&a72_1 &a72_2>;
> +        cpupool-sched = <&sched>;
> +    };
> +
> +    [...]
> +
> +};
> \ No newline at end of file
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index 64439438891c..dc9eed31682f 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -22,6 +22,14 @@ config GRANT_TABLE
>  
>  	  If unsure, say Y.
>  
> +config BOOT_TIME_CPUPOOLS
> +	bool "Create cpupools at boot time"
> +	depends on HAS_DEVICE_TREE
> +	default n
> +	help
> +	  Creates cpupools during boot time and assigns cpus to them. Cpupools
> +	  options can be specified in the device tree.
> +
>  config ALTERNATIVE_CALL
>  	bool
>  
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index dc8d3a13f5b8..c5949785ab28 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -1,5 +1,6 @@
>  obj-$(CONFIG_ARGO) += argo.o
>  obj-y += bitmap.o
> +obj-$(CONFIG_BOOT_TIME_CPUPOOLS) += boot_cpupools.o
>  obj-$(CONFIG_HYPFS_CONFIG) += config_data.o
>  obj-$(CONFIG_CORE_PARKING) += core_parking.o
>  obj-y += cpu.o
> diff --git a/xen/common/boot_cpupools.c b/xen/common/boot_cpupools.c
> new file mode 100644
> index 000000000000..e8529a902d21
> --- /dev/null
> +++ b/xen/common/boot_cpupools.c
> @@ -0,0 +1,212 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * xen/common/boot_cpupools.c
> + *
> + * Code to create cpupools at boot time for arm architecture.
> + *
> + * Copyright (C) 2022 Arm Ltd.
> + */
> +
> +#include <xen/sched.h>
> +
> +#define BTCPUPOOLS_DT_NODE_NO_REG     (-1)
> +#define BTCPUPOOLS_DT_NODE_NO_LOG_CPU (-2)
> +
> +struct pool_map {
> +    int pool_id;
> +    int sched_id;
> +    struct cpupool *pool;
> +};
> +
> +static struct pool_map __initdata pool_cpu_map[NR_CPUS] =
> +    { [0 ... NR_CPUS-1] = {.pool_id = -1, .sched_id = -1, .pool = NULL} };
> +static unsigned int __initdata next_pool_id;
> +
> +#ifdef CONFIG_ARM
> +static int __init get_logical_cpu_from_hw_id(unsigned int hwid)
> +{
> +    unsigned int i;
> +
> +    for ( i = 0; i < nr_cpu_ids; i++ )
> +        if ( cpu_logical_map(i) == hwid )
> +            return i;
> +
> +    return -1;
> +}
> +
> +static int __init
> +get_logical_cpu_from_cpu_node(const struct dt_device_node *cpu_node)
> +{
> +    unsigned int cpu_reg, cpu_num;
> +    const __be32 *prop;
> +
> +    prop = dt_get_property(cpu_node, "reg", NULL);
> +    if ( !prop )
> +        return BTCPUPOOLS_DT_NODE_NO_REG;
> +
> +    cpu_reg = dt_read_number(prop, dt_n_addr_cells(cpu_node));
> +
> +    cpu_num = get_logical_cpu_from_hw_id(cpu_reg);
> +    if ( cpu_num < 0 )
> +        return BTCPUPOOLS_DT_NODE_NO_LOG_CPU;
> +
> +    return cpu_num;
> +}
> +
> +static int __init check_and_get_sched_id(const char* scheduler_name)
> +{
> +    int sched_id = sched_get_id_by_name(scheduler_name);
> +
> +    if ( sched_id < 0 )
> +        panic("Scheduler %s does not exists!\n", scheduler_name);
> +
> +    return sched_id;
> +}
> +
> +void __init btcpupools_dtb_parse(void)
> +{
> +    const struct dt_device_node *chosen, *node;
> +
> +    chosen = dt_find_node_by_path("/chosen");
> +    if ( !chosen )
> +        return;
> +
> +    dt_for_each_child_node(chosen, node)
> +    {
> +        const struct dt_device_node *phandle_node;
> +        int sched_id = -1;
> +        const char* scheduler_name;
> +        unsigned int i = 0;
> +
> +        if ( !dt_device_is_compatible(node, "xen,cpupool") )
> +            continue;
> +
> +        phandle_node = dt_parse_phandle(node, "cpupool-sched", 0);
> +        if ( phandle_node )
> +        {
> +            if ( !dt_device_is_compatible(phandle_node, "xen,scheduler") )
> +                panic("cpupool-sched must be a xen,scheduler compatible"
> +                      "node!\n");
> +            if ( !dt_property_read_string(phandle_node, "sched-name",
> +                                          &scheduler_name) )
> +                sched_id = check_and_get_sched_id(scheduler_name);
> +            else
> +                panic("Error trying to read sched-name in %s!\n",
> +                      dt_node_name(phandle_node));
> +        }

it doesn't look like the "xen,scheduler" nodes are very useful from a dt
parsing perspective either


> +        phandle_node = dt_parse_phandle(node, "cpupool-cpus", i++);
> +        if ( !phandle_node )
> +            panic("Missing or empty cpupool-cpus property!\n");
> +
> +        while ( phandle_node )
> +        {
> +            int cpu_num;
> +
> +            cpu_num = get_logical_cpu_from_cpu_node(phandle_node);
> +
> +            if ( cpu_num < 0 )
> +                panic("Error retrieving logical cpu from node %s (%d)\n",
> +                      dt_node_name(node), cpu_num);
> +
> +            if ( pool_cpu_map[cpu_num].pool_id != -1 )
> +                panic("Logical cpu %d already added to a cpupool!\n", cpu_num);
> +
> +            pool_cpu_map[cpu_num].pool_id = next_pool_id;
> +            pool_cpu_map[cpu_num].sched_id = sched_id;
> +
> +            phandle_node = dt_parse_phandle(node, "cpupool-cpus", i++);
> +        }
> +
> +        /* Let Xen generate pool ids */
> +        next_pool_id++;
> +    }
> +}
> +#endif
> +
> +void __init btcpupools_allocate_pools(const cpumask_t *cpu_online_map)
> +{
> +    unsigned int cpu_num;
> +
> +    /*
> +     * If there are no cpupools, the value of next_pool_id is zero, so the code
> +     * below will assign every cpu to cpupool0 as the default behavior.
> +     * When there are cpupools, the code below is assigning all the not
> +     * assigned cpu to a new pool (next_pool_id value is the last id + 1).
> +     * In the same loop we check if there is any assigned cpu that is not
> +     * online.
> +     */
> +    for ( cpu_num = 0; cpu_num < nr_cpu_ids; cpu_num++ )
> +        if ( cpumask_test_cpu(cpu_num, cpu_online_map) )
> +        {
> +            if ( pool_cpu_map[cpu_num].pool_id < 0 )
> +                pool_cpu_map[cpu_num].pool_id = next_pool_id;
> +        }
> +        else

Please add { }


> +            if ( pool_cpu_map[cpu_num].pool_id >= 0 )
> +                panic("Pool-%d contains cpu%u that is not online!\n",
> +                      pool_cpu_map[cpu_num].pool_id, cpu_num);



> +#ifdef CONFIG_X86
> +    /* Cpu0 must be in cpupool0 for x86 */
> +    if ( pool_cpu_map[0].pool_id != 0 )

Is that even possible on x86 given that btcpupools_dtb_parse cannot even
run on x86?

If it is not possible, I would remove the code below and simply panic
instead.


> +    {
> +        /* The cpupool containing cpu0 will become cpupool0 */
> +        unsigned int swap_id = pool_cpu_map[0].pool_id;
> +        for_each_cpu ( cpu_num, cpu_online_map )
> +            if ( pool_cpu_map[cpu_num].pool_id == swap_id )
> +                pool_cpu_map[cpu_num].pool_id = 0;
> +            else if ( pool_cpu_map[cpu_num].pool_id == 0 )
> +                pool_cpu_map[cpu_num].pool_id = swap_id;
> +    }
> +#endif
> +
> +    for_each_cpu ( cpu_num, cpu_online_map )
> +    {
> +        struct cpupool *pool = NULL;
> +        int pool_id, sched_id;
> +
> +        pool_id = pool_cpu_map[cpu_num].pool_id;
> +        sched_id = pool_cpu_map[cpu_num].sched_id;
> +
> +        if ( pool_id )
> +        {
> +            unsigned int i;
> +
> +            /* Look for previously created pool with id pool_id */
> +            for ( i = 0; i < cpu_num; i++ )

Please add { }

But actually, the double loop seems a bit excessive for this. Could we
just have a single loop to cpupool_create_pool from 0 to next_pool_id?

We could get rid of pool_cpu_map[i].pool and just rely on
pool_cpu_map[i].pool_id. No need to update pool_cpu_map[i].pool if we
get rid of it: it doesn't look like it is very useful anyway?


> +                if ( (pool_cpu_map[i].pool_id == pool_id) &&
> +                     pool_cpu_map[i].pool )
> +                {
> +                    pool = pool_cpu_map[i].pool;
> +                    break;
> +                }
> +
> +            /* If no pool was created before, create it */
> +            if ( !pool )
> +                pool = cpupool_create_pool(pool_id, sched_id);
> +            if ( !pool )
> +                panic("Error creating pool id %u!\n", pool_id);
> +        }
> +        else
> +            pool = cpupool0;
> +
> +        pool_cpu_map[cpu_num].pool = pool;
> +        printk(XENLOG_INFO "Logical CPU %u in Pool-%u.\n", cpu_num, pool_id);
> +    }
> +}
> +
> +struct cpupool *__init btcpupools_get_cpupool(unsigned int cpu)
> +{
> +    return pool_cpu_map[cpu].pool;
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
> index 89a891af7076..b2495ad6d03e 100644
> --- a/xen/common/sched/cpupool.c
> +++ b/xen/common/sched/cpupool.c
> @@ -1247,12 +1247,16 @@ static int __init cf_check cpupool_init(void)
>      cpupool_put(cpupool0);
>      register_cpu_notifier(&cpu_nfb);
>  
> +    btcpupools_dtb_parse();
> +
> +    btcpupools_allocate_pools(&cpu_online_map);
> +
>      spin_lock(&cpupool_lock);
>  
>      cpumask_copy(&cpupool_free_cpus, &cpu_online_map);
>  
>      for_each_cpu ( cpu, &cpupool_free_cpus )
> -        cpupool_assign_cpu_locked(cpupool0, cpu);
> +        cpupool_assign_cpu_locked(btcpupools_get_cpupool(cpu), cpu);
>  
>      spin_unlock(&cpupool_lock);
>  
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 2c10303f0187..de4e8feea399 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -1176,6 +1176,25 @@ extern void cf_check dump_runq(unsigned char key);
>  
>  void arch_do_physinfo(struct xen_sysctl_physinfo *pi);
>  
> +#ifdef CONFIG_BOOT_TIME_CPUPOOLS
> +void btcpupools_allocate_pools(const cpumask_t *cpu_online_map);
> +struct cpupool *btcpupools_get_cpupool(unsigned int cpu);
> +
> +#ifdef CONFIG_ARM
> +void btcpupools_dtb_parse(void);
> +#else
> +static inline void btcpupools_dtb_parse(void) {}
> +#endif
> +
> +#else
> +static inline void btcpupools_allocate_pools(const cpumask_t *cpu_online_map) {}
> +static inline void btcpupools_dtb_parse(void) {}
> +static inline struct cpupool *btcpupools_get_cpupool(unsigned int cpu)
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

