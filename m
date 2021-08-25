Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EF73F7B31
	for <lists+xen-devel@lfdr.de>; Wed, 25 Aug 2021 19:07:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172551.314863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIwMS-0007z4-Jw; Wed, 25 Aug 2021 17:06:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172551.314863; Wed, 25 Aug 2021 17:06:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIwMS-0007wh-G4; Wed, 25 Aug 2021 17:06:48 +0000
Received: by outflank-mailman (input) for mailman id 172551;
 Wed, 25 Aug 2021 17:06:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mIwMR-0007wb-8b
 for xen-devel@lists.xenproject.org; Wed, 25 Aug 2021 17:06:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIwMQ-000237-7C; Wed, 25 Aug 2021 17:06:46 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIwMQ-00033r-1A; Wed, 25 Aug 2021 17:06:46 +0000
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
	bh=Xu3amvgtgW3cB3G9oPU4+qJU+m+pt4IlpbqwUKBmeSc=; b=VL+A4dOuVVpq6d7hwW7z5deazC
	ZOxmoF3+dBPEG9NBMCjJ29vGMHcpDV4ltjaRBN17NgAA/4xC4cck0vAFUbgqqhganO/tHJq2RzI9L
	RiZ5wStp2ndrjvo2CfKNBeBrGZGvz5mTWlq2zBJHOZBCB4XdrytMwwQ4bDWya+YiiwSA=;
Subject: Re: [XEN RFC PATCH 27/40] xen/arm: build CPU NUMA node map while
 creating cpu_logical_map
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Jan Beulich <jbeulich@suse.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-28-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <59529fea-199d-09af-dbb3-a5067ec86550@xen.org>
Date: Wed, 25 Aug 2021 18:06:44 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210811102423.28908-28-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Wei,

On 11/08/2021 11:24, Wei Chen wrote:
> Sometimes, CPU logical ID maybe different with physical CPU ID.
> Xen is using CPU logial ID for runtime usage, so we should use
> CPU logical ID to create map between NUMA node and CPU.

This commit message gives the impression that you are trying to fix a 
bug. However, what you are explaining is the reason why the code will 
use the logical ID rather than physical ID.

I think the commit message should explain what the patch is doing. You 
can then add an explanation why you are using the CPU logical ID. 
Something like "Note we storing the CPU logical ID because...".


> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/arch/arm/smpboot.c | 31 ++++++++++++++++++++++++++++++-
>   1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
> index aa78958c07..dd5a45bffc 100644
> --- a/xen/arch/arm/smpboot.c
> +++ b/xen/arch/arm/smpboot.c
> @@ -121,7 +121,12 @@ static void __init dt_smp_init_cpus(void)
>       {
>           [0 ... NR_CPUS - 1] = MPIDR_INVALID
>       };
> +    static nodeid_t node_map[NR_CPUS] __initdata =
> +    {
> +        [0 ... NR_CPUS - 1] = NUMA_NO_NODE
> +    };
>       bool bootcpu_valid = false;
> +    uint32_t nid = 0;
>       int rc;
>   
>       mpidr = boot_cpu_data.mpidr.bits & MPIDR_HWID_MASK;
> @@ -172,6 +177,26 @@ static void __init dt_smp_init_cpus(void)
>               continue;
>           }
>   
> +#ifdef CONFIG_DEVICE_TREE_NUMA
> +        /*
> +         *  When CONFIG_DEVICE_TREE_NUMA is set, try to fetch numa infomation
> +         * from CPU dts node, otherwise the nid is always 0.
> +         */
> +        if ( !dt_property_read_u32(cpu, "numa-node-id", &nid) )

You can avoid the #ifdef by writing:

if ( IS_ENABLED(CONFIG_DEVICE_TREE_NUMA) && ... )

However, I would using CONFIG_NUMA because this code is already DT 
specific. So we can shorten the name a bit.

> +        {
> +            printk(XENLOG_WARNING
> +                "cpu[%d] dts path: %s: doesn't have numa infomation!\n",

s/information/information/

> +                cpuidx, dt_node_full_name(cpu));
> +            /*
> +             * The the early stage of NUMA initialization, when Xen found any

s/The/During/?

> +             * CPU dts node doesn't have numa-node-id info, the NUMA will be
> +             * treated as off, all CPU will be set to a FAKE node 0. So if we
> +             * get numa-node-id failed here, we should set nid to 0.
> +             */
> +            nid = 0;
> +        }
> +#endif
> +
>           /*
>            * 8 MSBs must be set to 0 in the DT since the reg property
>            * defines the MPIDR[23:0]
> @@ -231,9 +256,12 @@ static void __init dt_smp_init_cpus(void)
>           {
>               printk("cpu%d init failed (hwid %"PRIregister"): %d\n", i, hwid, rc);
>               tmp_map[i] = MPIDR_INVALID;
> +            node_map[i] = NUMA_NO_NODE;
>           }
> -        else
> +        else {
>               tmp_map[i] = hwid;
> +            node_map[i] = nid;
> +        }
>       }
>   
>       if ( !bootcpu_valid )
> @@ -249,6 +277,7 @@ static void __init dt_smp_init_cpus(void)
>               continue;
>           cpumask_set_cpu(i, &cpu_possible_map);
>           cpu_logical_map(i) = tmp_map[i];
> +        numa_set_node(i, node_map[i]);
>       }
>   }
>    >

Cheers,

-- 
Julien Grall

