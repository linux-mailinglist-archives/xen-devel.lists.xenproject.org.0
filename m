Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE763F7649
	for <lists+xen-devel@lfdr.de>; Wed, 25 Aug 2021 15:49:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172378.314495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mItGy-0006wy-Dh; Wed, 25 Aug 2021 13:48:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172378.314495; Wed, 25 Aug 2021 13:48:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mItGy-0006u0-A0; Wed, 25 Aug 2021 13:48:56 +0000
Received: by outflank-mailman (input) for mailman id 172378;
 Wed, 25 Aug 2021 13:48:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mItGw-0006tu-Ix
 for xen-devel@lists.xenproject.org; Wed, 25 Aug 2021 13:48:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mItGv-0006GC-Jm; Wed, 25 Aug 2021 13:48:53 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mItGv-0005In-Dw; Wed, 25 Aug 2021 13:48:53 +0000
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
	bh=77iUZna4wPDFawTGtlZ/fhLEqr8IHs5zjHoT0YsqbTM=; b=67WaLOQn9zmvvd9JeYm9mpFzSb
	Bec9vO1B/MXwUDsmBrK0wqcwJjMk2prjzMJB+YBbEf7NNl6qbObcVzkhfSSnaI4HLTzGLoaUpyYhL
	dB9wqLrShhS+J6BnhZtGchsh+KqOtsiUaZwKyxFijxcqH22Te9wnXXKGODN6ajqRtZfQ=;
Subject: Re: [XEN RFC PATCH 23/40] xen/arm: introduce a helper to parse device
 tree memory node
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, jbeulich@suse.com
Cc: Bertrand.Marquis@arm.com
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-24-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4bd56df9-f95b-eb19-dbbc-d12b4f7b0668@xen.org>
Date: Wed, 25 Aug 2021 14:48:51 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210811102423.28908-24-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Wei,

On 11/08/2021 11:24, Wei Chen wrote:
> Memory blocks' NUMA ID information is stored in device tree's
> memory nodes as "numa-node-id". We need a new helper to parse
> and verify this ID from memory nodes.
> 
> In order to support memory affinity in later use, the valid
> memory ranges and NUMA ID will be saved to tables.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/arch/arm/numa_device_tree.c | 130 ++++++++++++++++++++++++++++++++
>   1 file changed, 130 insertions(+)
> 
> diff --git a/xen/arch/arm/numa_device_tree.c b/xen/arch/arm/numa_device_tree.c
> index 37cc56acf3..bbe081dcd1 100644
> --- a/xen/arch/arm/numa_device_tree.c
> +++ b/xen/arch/arm/numa_device_tree.c
> @@ -20,11 +20,13 @@
>   #include <xen/init.h>
>   #include <xen/nodemask.h>
>   #include <xen/numa.h>
> +#include <xen/libfdt/libfdt.h>
>   #include <xen/device_tree.h>
>   #include <asm/setup.h>
>   
>   s8 device_tree_numa = 0;
>   static nodemask_t processor_nodes_parsed __initdata;
> +static nodemask_t memory_nodes_parsed __initdata;
>   
>   static int srat_disabled(void)
>   {
> @@ -55,6 +57,79 @@ static int __init dtb_numa_processor_affinity_init(nodeid_t node)
>       return 0;
>   }
>   
> +/* Callback for parsing of the memory regions affinity */
> +static int __init dtb_numa_memory_affinity_init(nodeid_t node,
> +                                paddr_t start, paddr_t size)
> +{

The implementation of this function is quite similar ot the ACPI 
version. Can this be abstracted?

> +    struct node *nd;
> +    paddr_t end;
> +    int i;
> +
> +    if ( srat_disabled() )
> +        return -EINVAL;
> +
> +    end = start + size;
> +    if ( num_node_memblks >= NR_NODE_MEMBLKS )
> +    {
> +        dprintk(XENLOG_WARNING,
> +                "Too many numa entry, try bigger NR_NODE_MEMBLKS \n");
> +        bad_srat();
> +        return -EINVAL;
> +    }
> +
> +    /* It is fine to add this area to the nodes data it will be used later */
> +    i = conflicting_memblks(start, end);
> +    /* No conflicting memory block, we can save it for later usage */;
> +    if ( i < 0 )
> +        goto save_memblk;
> +
> +    if ( memblk_nodeid[i] == node ) {

Xen coding style is using:

if ( ... )
{

Note that I may not comment on all the occurents, so please check the 
other places.

> +        /*
> +         * Overlaps with other memblk in the same node, warning here.
> +         * This memblk will be merged with conflicted memblk later.
> +         */
> +        printk(XENLOG_WARNING
> +               "DT: NUMA NODE %u (%"PRIx64
> +               "-%"PRIx64") overlaps with itself (%"PRIx64"-%"PRIx64")\n",
> +               node, start, end,
> +               node_memblk_range[i].start, node_memblk_range[i].end);
> +    } else {
> +        /*
> +         * Conflict with memblk in other node, this is an error.
> +         * The NUMA information is invalid, NUMA will be turn off.
> +         */
> +        printk(XENLOG_ERR
> +               "DT: NUMA NODE %u (%"PRIx64"-%"
> +               PRIx64") overlaps with NODE %u (%"PRIx64"-%"PRIx64")\n",
> +               node, start, end, memblk_nodeid[i],
> +               node_memblk_range[i].start, node_memblk_range[i].end);
> +        bad_srat();
> +        return -EINVAL;
> +    }
> +
> +save_memblk:
> +    nd = &nodes[node];
> +    if ( !node_test_and_set(node, memory_nodes_parsed) ) {
> +        nd->start = start;
> +        nd->end = end;
> +    } else {
> +        if ( start < nd->start )
> +            nd->start = start;
> +        if ( nd->end < end )
> +            nd->end = end;
> +    }
> +
> +    printk(XENLOG_INFO "DT: NUMA node %u %"PRIx64"-%"PRIx64"\n",
> +           node, start, end);
> +
> +    node_memblk_range[num_node_memblks].start = start;
> +    node_memblk_range[num_node_memblks].end = end;
> +    memblk_nodeid[num_node_memblks] = node;
> +    num_node_memblks++;
> +
> +    return 0;
> +}
> +
>   /* Parse CPU NUMA node info */
>   int __init device_tree_parse_numa_cpu_node(const void *fdt, int node)
>   {
> @@ -70,3 +145,58 @@ int __init device_tree_parse_numa_cpu_node(const void *fdt, int node)
>   
>       return dtb_numa_processor_affinity_init(nid);
>   }
> +
> +/* Parse memory node NUMA info */
> +int __init
> +device_tree_parse_numa_memory_node(const void *fdt, int node,
> +    const char *name, uint32_t addr_cells, uint32_t size_cells)

This is pretty much a copy of process_memory_node(). Can we consider to 
collect the NUMA ID from there? If not, can we at least abstract the code?

> +{
> +    uint32_t nid;
> +    int ret = 0, len;
> +    paddr_t addr, size;
> +    const struct fdt_property *prop;
> +    uint32_t idx, ranges;
> +    const __be32 *addresses;
> +
> +    nid = device_tree_get_u32(fdt, node, "numa-node-id", MAX_NUMNODES);
> +    if ( nid >= MAX_NUMNODES )
> +    {
> +        printk(XENLOG_WARNING "Node id %u exceeds maximum value\n", nid);
> +        return -EINVAL;
> +    }
> +
> +    prop = fdt_get_property(fdt, node, "reg", &len);
> +    if ( !prop )
> +    {
> +        printk(XENLOG_WARNING
> +               "fdt: node `%s': missing `reg' property\n", name);
> +        return -EINVAL;
> +    }
> +
> +    addresses = (const __be32 *)prop->data;
> +    ranges = len / (sizeof(__be32)* (addr_cells + size_cells));
> +    for ( idx = 0; idx < ranges; idx++ )
> +    {
> +        device_tree_get_reg(&addresses, addr_cells, size_cells, &addr, &size);
> +        /* Skip zero size ranges */
> +        if ( !size )
> +            continue;
> +
> +        ret = dtb_numa_memory_affinity_init(nid, addr, size);
> +        if ( ret ) {
> +            printk(XENLOG_WARNING
> +                   "NUMA: process range#%d addr = %lx size=%lx failed!\n",

s/%d/%u/ as idx is an unsigned int
s/%lx/%"PRI_paddr"/ as addr and size are paddr_t.

> +                   idx, addr, size);
> +            return -EINVAL;
> +        }
> +    }
> +
> +    if ( idx == 0 )
> +    {
> +        printk(XENLOG_ERR
> +               "bad property in memory node, idx=%d ret=%d\n", idx, ret);
> +        return -EINVAL;
> +    }
> +
> +    return 0;
> +}
> 

Cheers,

-- 
Julien Grall

