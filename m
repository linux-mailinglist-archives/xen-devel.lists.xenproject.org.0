Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1627E3F90E0
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 01:10:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173218.316079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJOVb-0003r2-Gx; Thu, 26 Aug 2021 23:10:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173218.316079; Thu, 26 Aug 2021 23:10:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJOVb-0003oL-DV; Thu, 26 Aug 2021 23:10:07 +0000
Received: by outflank-mailman (input) for mailman id 173218;
 Thu, 26 Aug 2021 23:10:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Zrd=NR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mJOVa-0003j7-1m
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 23:10:06 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bf4d1086-06c2-11ec-aa7a-12813bfff9fa;
 Thu, 26 Aug 2021 23:10:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E443460F5B;
 Thu, 26 Aug 2021 23:10:03 +0000 (UTC)
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
X-Inumbo-ID: bf4d1086-06c2-11ec-aa7a-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630019404;
	bh=sdVIJz8TEG8HHPQDUNyycpFPwg47slsstk7aSZm7V6E=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YFmzDbPN8qkf/gtkXvBSkAYoDOibjjZQqrVEUDxF3dpN0up1sB5u8bUtBCbqHZwc5
	 5oiHa15eGVVd5zU7DUvkgzhp52TUYlrMIg0yen01gle4fHyiDNjq7t4HIKO6/i02+t
	 BB/Jck6goMTbwrhC8p5bDaLm0jzTHnzNHcHLPF4/4wMjUld0EKo2lTxXGiyiWN3HX4
	 ex+NAnTkk1SVcjR+7byhR304dHlaJyRzhyxEGjdir40MhRqJdLAytFWPhz0Owt+7Me
	 u7fQ4E1nWfbNknLmtLYnMo/lO4Am2qmJqo5h9zjw9IdI50nkD6xySsClH9RLVqJJlH
	 Ip4dGEVcP01QA==
Date: Thu, 26 Aug 2021 16:10:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    jbeulich@suse.com, Bertrand.Marquis@arm.com
Subject: Re: [XEN RFC PATCH 16/40] xen/arm: Create a fake NUMA node to use
 common code
In-Reply-To: <20210811102423.28908-17-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.21.2108261605470.24433@sstabellini-ThinkPad-T480s>
References: <20210811102423.28908-1-wei.chen@arm.com> <20210811102423.28908-17-wei.chen@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 11 Aug 2021, Wei Chen wrote:
> When CONFIG_NUMA is enabled for Arm, Xen will switch to use common
> NUMA API instead of previous fake NUMA API. Before we parse NUMA
> information from device tree or ACPI SRAT table, we need to init
> the NUMA related variables, like cpu_to_node, as single node NUMA
> system.
> 
> So in this patch, we introduce a numa_init function for to
> initialize these data structures as all resources belongs to node#0.
> This will make the new API returns the same values as the fake API
> has done.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>  xen/arch/arm/numa.c        | 53 ++++++++++++++++++++++++++++++++++++++
>  xen/arch/arm/setup.c       |  8 ++++++
>  xen/include/asm-arm/numa.h | 11 ++++++++
>  3 files changed, 72 insertions(+)
> 
> diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
> index 1e30c5bb13..566ad1e52b 100644
> --- a/xen/arch/arm/numa.c
> +++ b/xen/arch/arm/numa.c
> @@ -20,6 +20,8 @@
>  #include <xen/init.h>
>  #include <xen/nodemask.h>
>  #include <xen/numa.h>
> +#include <xen/pfn.h>
> +#include <asm/setup.h>
>  
>  void numa_set_node(int cpu, nodeid_t nid)
>  {
> @@ -29,3 +31,54 @@ void numa_set_node(int cpu, nodeid_t nid)
>  
>      cpu_to_node[cpu] = nid;
>  }
> +
> +void __init numa_init(bool acpi_off)
> +{
> +    uint32_t idx;
> +    paddr_t ram_start = ~0;
> +    paddr_t ram_size = 0;
> +    paddr_t ram_end = 0;
> +
> +    printk(XENLOG_WARNING
> +        "NUMA has not been supported yet, NUMA off!\n");

NIT: please align


> +    /* Arm NUMA has not been implemented until this patch */

"Arm NUMA is not implemented yet"


> +    numa_off = true;
> +
> +    /*
> +     * Set all cpu_to_node mapping to 0, this will make cpu_to_node
> +     * function return 0 as previous fake cpu_to_node API.
> +     */
> +    for ( idx = 0; idx < NR_CPUS; idx++ )
> +        cpu_to_node[idx] = 0;
> +
> +    /*
> +     * Make node_to_cpumask, node_spanned_pages and node_start_pfn
> +     * return as previous fake APIs.
> +     */
> +    for ( idx = 0; idx < MAX_NUMNODES; idx++ ) {
> +        node_to_cpumask[idx] = cpu_online_map;
> +        node_spanned_pages(idx) = (max_page - mfn_x(first_valid_mfn));
> +        node_start_pfn(idx) = (mfn_x(first_valid_mfn));
> +    }

I just want to note that this works because MAX_NUMNODES is 1. If
MAX_NUMNODES was > 1 then it would be wrong to set node_to_cpumask,
node_spanned_pages and node_start_pfn for all nodes to the same values.

It might be worth writing something about it in the in-code comment.


> +    /*
> +     * Find the minimal and maximum address of RAM, NUMA will
> +     * build a memory to node mapping table for the whole range.
> +     */
> +    ram_start = bootinfo.mem.bank[0].start;
> +    ram_size  = bootinfo.mem.bank[0].size;
> +    ram_end   = ram_start + ram_size;
> +    for ( idx = 1 ; idx < bootinfo.mem.nr_banks; idx++ )
> +    {
> +        paddr_t bank_start = bootinfo.mem.bank[idx].start;
> +        paddr_t bank_size = bootinfo.mem.bank[idx].size;
> +        paddr_t bank_end = bank_start + bank_size;
> +
> +        ram_size  = ram_size + bank_size;

ram_size is updated but not utilized


> +        ram_start = min(ram_start, bank_start);
> +        ram_end   = max(ram_end, bank_end);
> +    }
> +
> +    numa_initmem_init(PFN_UP(ram_start), PFN_DOWN(ram_end));
> +    return;
> +}
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 63a908e325..3c58d2d441 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -30,6 +30,7 @@
>  #include <xen/init.h>
>  #include <xen/irq.h>
>  #include <xen/mm.h>
> +#include <xen/numa.h>
>  #include <xen/param.h>
>  #include <xen/softirq.h>
>  #include <xen/keyhandler.h>
> @@ -874,6 +875,13 @@ void __init start_xen(unsigned long boot_phys_offset,
>      /* Parse the ACPI tables for possible boot-time configuration */
>      acpi_boot_table_init();
>  
> +    /*
> +     * Try to initialize NUMA system, if failed, the system will
> +     * fallback to uniform system which means system has only 1
> +     * NUMA node.
> +     */
> +    numa_init(acpi_disabled);
> +
>      end_boot_allocator();
>  
>      /*
> diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-arm/numa.h
> index b2982f9053..bb495a24e1 100644
> --- a/xen/include/asm-arm/numa.h
> +++ b/xen/include/asm-arm/numa.h
> @@ -13,6 +13,16 @@ typedef u8 nodeid_t;
>   */
>  #define NODES_SHIFT      6
>  
> +extern void numa_init(bool acpi_off);
> +
> +/*
> + * Temporary for fake NUMA node, when CPU, memory and distance
> + * matrix will be read from DTB or ACPI SRAT. The following
> + * symbols will be removed.
> + */
> +extern mfn_t first_valid_mfn;
> +#define __node_distance(a, b) (20)
> +
>  #else
>  
>  /* Fake one node for now. See also node_online_map. */
> @@ -35,6 +45,7 @@ extern mfn_t first_valid_mfn;
>  #define node_start_pfn(nid) (mfn_x(first_valid_mfn))
>  #define __node_distance(a, b) (20)
>  
> +#define numa_init(x) do { } while (0)
>  #define numa_set_node(x, y) do { } while (0)
>  
>  #endif
> -- 
> 2.25.1
> 

