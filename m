Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B819416A03
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 04:26:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194756.347020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTauj-000441-0f; Fri, 24 Sep 2021 02:26:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194756.347020; Fri, 24 Sep 2021 02:26:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTaui-00040Y-TJ; Fri, 24 Sep 2021 02:26:12 +0000
Received: by outflank-mailman (input) for mailman id 194756;
 Fri, 24 Sep 2021 02:26:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhVx=OO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTaug-00040S-T6
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 02:26:10 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df9f45c2-5f75-49a3-87ff-da5a14eefe23;
 Fri, 24 Sep 2021 02:26:07 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AF881611B0;
 Fri, 24 Sep 2021 02:26:06 +0000 (UTC)
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
X-Inumbo-ID: df9f45c2-5f75-49a3-87ff-da5a14eefe23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632450366;
	bh=KWC+WCTnZuSzJ6ckG9uzgvOq4MOCfQ78yz2ehPfHGWU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JxxJEXGBCaVkkFa6NyI25wB0QnZGocgD4FmOOpwgC/yNEUccj/UpF+FJ8IXG7QIbS
	 or3FaJX3MxMogmIMYgGcFcc/BcWJN6mifTRsi9o91yYIrG1uhIDgcEzDXzR46xkHro
	 citbT6l03unDA7GSKwadFszl64Lbqy/gF/04Gd7HIjs0af66bkTxmBML2+uINUh/Tx
	 gsnCivsW1yN6Y5mTGqzUwGnDyNHjj6LbPK3zSUN3Bf+MCNnRYe8l6dihJzLb0fV/BG
	 QMsMG3XbLh3qKPYzXER3pCiUYFW97z9SflRqeipJusz6KCMUG+VfXpvSRJO1hXK3bK
	 y4Pwl9efDO/gA==
Date: Thu, 23 Sep 2021 19:26:06 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com
Subject: Re: [PATCH 26/37] xen/arm: build NUMA cpu_to_node map in
 dt_smp_init_cpus
In-Reply-To: <20210923120236.3692135-27-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.21.2109231919070.17979@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-27-wei.chen@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Sep 2021, Wei Chen wrote:
> NUMA implementation has a cpu_to_node array to store CPU to NODE
> map. Xen is using CPU logical ID in runtime components, so we
> use CPU logical ID as CPU index in cpu_to_node.
> 
> In device tree case, cpu_logical_map is created in dt_smp_init_cpus.
> So, when NUMA is enabled, dt_smp_init_cpus will fetch CPU NUMA id
> at the same time for cpu_to_node.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>  xen/arch/arm/smpboot.c     | 37 ++++++++++++++++++++++++++++++++++++-
>  xen/include/asm-arm/numa.h |  5 +++++
>  2 files changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index 60c0e82fc5..6e3cc8d3cc 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -121,7 +121,12 @@ static void __init dt_smp_init_cpus(void)
>      {
>          [0 ... NR_CPUS - 1] = MPIDR_INVALID
>      };
> +    static nodeid_t node_map[NR_CPUS] __initdata =
> +    {
> +        [0 ... NR_CPUS - 1] = NUMA_NO_NODE
> +    };
>      bool bootcpu_valid = false;
> +    uint32_t nid = 0;
>      int rc;
>  
>      mpidr = system_cpuinfo.mpidr.bits & MPIDR_HWID_MASK;
> @@ -172,6 +177,28 @@ static void __init dt_smp_init_cpus(void)
>              continue;
>          }
>  
> +        if ( IS_ENABLED(CONFIG_NUMA) )
> +        {
> +            /*
> +             * When CONFIG_NUMA is set, try to fetch numa infomation
> +             * from CPU dts node, otherwise the nid is always 0.
> +             */
> +            if ( !dt_property_read_u32(cpu, "numa-node-id", &nid) )
> +            {
> +                printk(XENLOG_WARNING
> +                       "cpu[%d] dts path: %s: doesn't have numa information!\n",
                               ^ %u


> +                       cpuidx, dt_node_full_name(cpu));

I think that this message shouldn't be a warning: CONFIG_NUMA is a
compile time option. Anybody that enables CONFIG_NUMA in the Xen build
will get this warning printed out at boot time if Xen is booting on a
regular non-NUMA machine, right?

The warning should only be printed if NUMA is actively enabled, e.g.
there is a distance-map but the cpus don't have numa-node-id.



> +                /*
> +                 * During the early stage of NUMA initialization, when Xen
> +                 * found any CPU dts node doesn't have numa-node-id info, the
> +                 * NUMA will be treated as off, all CPU will be set to a FAKE
> +                 * node 0. So if we get numa-node-id failed here, we should
> +                 * set nid to 0.
> +                 */
> +                nid = 0;
> +            }
> +        }
> +
>          /*
>           * 8 MSBs must be set to 0 in the DT since the reg property
>           * defines the MPIDR[23:0]
> @@ -231,9 +258,12 @@ static void __init dt_smp_init_cpus(void)
>          {
>              printk("cpu%d init failed (hwid %"PRIregister"): %d\n", i, hwid, rc);
>              tmp_map[i] = MPIDR_INVALID;
> +            node_map[i] = NUMA_NO_NODE;
>          }
> -        else
> +        else {
>              tmp_map[i] = hwid;
> +            node_map[i] = nid;
> +        }
>      }
>  
>      if ( !bootcpu_valid )
> @@ -249,6 +279,11 @@ static void __init dt_smp_init_cpus(void)
>              continue;
>          cpumask_set_cpu(i, &cpu_possible_map);
>          cpu_logical_map(i) = tmp_map[i];
> +
> +        nid = node_map[i];
> +        if ( nid >= MAX_NUMNODES )
> +            nid = 0;
> +        numa_set_node(i, nid);
>      }
>  }
>  
> diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-arm/numa.h
> index 758eafeb05..8a4ad379e0 100644
> --- a/xen/include/asm-arm/numa.h
> +++ b/xen/include/asm-arm/numa.h
> @@ -46,6 +46,11 @@ extern mfn_t first_valid_mfn;
>  #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
>  #define __node_distance(a, b) (20)
>  
> +static inline void numa_set_node(int cpu, nodeid_t node)
> +{
> +
> +}
> +
>  #endif
>  
>  static inline unsigned int arch_have_default_dmazone(void)
> -- 
> 2.25.1
> 

