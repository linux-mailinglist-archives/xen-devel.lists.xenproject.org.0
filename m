Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F374F3FA2B2
	for <lists+xen-devel@lfdr.de>; Sat, 28 Aug 2021 03:07:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174127.317669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJmni-0006bv-7m; Sat, 28 Aug 2021 01:06:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174127.317669; Sat, 28 Aug 2021 01:06:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJmni-0006ZI-3T; Sat, 28 Aug 2021 01:06:26 +0000
Received: by outflank-mailman (input) for mailman id 174127;
 Sat, 28 Aug 2021 01:06:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zhkl=NT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mJmng-0006ZC-Jp
 for xen-devel@lists.xenproject.org; Sat, 28 Aug 2021 01:06:24 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fdcfc6a1-319b-4f11-9334-ac3ca4ad6dbb;
 Sat, 28 Aug 2021 01:06:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B188060F25;
 Sat, 28 Aug 2021 01:06:22 +0000 (UTC)
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
X-Inumbo-ID: fdcfc6a1-319b-4f11-9334-ac3ca4ad6dbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630112782;
	bh=VfLWzJr4U8a6YV3VQ8lC/M8TkiR/nZFrFyB8KalkifE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=slH80XniZ7aNjJ6NAI7ikz8xNXoukSfNthHH11Br0dKINUulFgYPGH1ykdemoBx9z
	 F/VFIRIuIY13829rwC2v5kR59gI2NB/GPRS8UUIXXSnvOWI+c9RR/HcQLCL4bBNjJf
	 YsDFK0DMB6HBdFIa1wzYizK6jHzytfzxVY1orvoW/CCL5Sqsql5Rb6LK9AZLkuoeoS
	 HMYtf/LG54iTcUN4HzalJIxNpTs5WrNmtrzYX9vkd+QnJ5RMSFYTSKR2KqKL4I7t4U
	 MwD9ZyeYtf/WlXnf298qgtJzQoSf8QTe9ncMoi6UJ47YfcUeiQ2e1nVMumLKHAoZFJ
	 qdwgKRZahbCsQ==
Date: Fri, 27 Aug 2021 18:06:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    jbeulich@suse.com, Bertrand.Marquis@arm.com
Subject: Re: [XEN RFC PATCH 23/40] xen/arm: introduce a helper to parse device
 tree memory node
In-Reply-To: <20210811102423.28908-24-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.21.2108271757250.17851@sstabellini-ThinkPad-T480s>
References: <20210811102423.28908-1-wei.chen@arm.com> <20210811102423.28908-24-wei.chen@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 11 Aug 2021, Wei Chen wrote:
> Memory blocks' NUMA ID information is stored in device tree's
> memory nodes as "numa-node-id". We need a new helper to parse
> and verify this ID from memory nodes.
> 
> In order to support memory affinity in later use, the valid
> memory ranges and NUMA ID will be saved to tables.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>  xen/arch/arm/numa_device_tree.c | 130 ++++++++++++++++++++++++++++++++
>  1 file changed, 130 insertions(+)
> 
> diff --git a/xen/arch/arm/numa_device_tree.c b/xen/arch/arm/numa_device_tree.c
> index 37cc56acf3..bbe081dcd1 100644
> --- a/xen/arch/arm/numa_device_tree.c
> +++ b/xen/arch/arm/numa_device_tree.c
> @@ -20,11 +20,13 @@
>  #include <xen/init.h>
>  #include <xen/nodemask.h>
>  #include <xen/numa.h>
> +#include <xen/libfdt/libfdt.h>
>  #include <xen/device_tree.h>
>  #include <asm/setup.h>
>  
>  s8 device_tree_numa = 0;
>  static nodemask_t processor_nodes_parsed __initdata;
> +static nodemask_t memory_nodes_parsed __initdata;
>  
>  static int srat_disabled(void)
>  {
> @@ -55,6 +57,79 @@ static int __init dtb_numa_processor_affinity_init(nodeid_t node)
>      return 0;
>  }
>  
> +/* Callback for parsing of the memory regions affinity */
> +static int __init dtb_numa_memory_affinity_init(nodeid_t node,
> +                                paddr_t start, paddr_t size)
> +{
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


Is it possible to have non-contigous ranges of memory for a single NUMA
node?

Looking at the DT bindings and Linux implementation, it seems possible.
Here, it seems that node_memblk_range/memblk_nodeid could handle it,
but nodes couldn't.

