Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3014168E9
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 02:26:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194660.346810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTZ25-0004ve-3v; Fri, 24 Sep 2021 00:25:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194660.346810; Fri, 24 Sep 2021 00:25:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTZ25-0004tt-0X; Fri, 24 Sep 2021 00:25:41 +0000
Received: by outflank-mailman (input) for mailman id 194660;
 Fri, 24 Sep 2021 00:25:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhVx=OO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTZ23-0004tm-BZ
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 00:25:39 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ea2abf0c-4384-4dcc-abff-ea063efa0753;
 Fri, 24 Sep 2021 00:25:38 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 56D3361152;
 Fri, 24 Sep 2021 00:25:37 +0000 (UTC)
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
X-Inumbo-ID: ea2abf0c-4384-4dcc-abff-ea063efa0753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632443137;
	bh=n3TpWy2M3UYxLodJhEJsyb/cJ4+bpfaty6xukw3+XH4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tGwcMt+2tDymh1U1NFAoXpbNzyCJLzGukcC+7VMBKbKF/pYQdERZovd5/j0HYA1nk
	 780k63psgGRWgeXJOFC5gZF821KrUit10XyZlZHu0FhotpF3sZy2sDRMBvYQqqgQkW
	 9Q8Ou/kRpjKsUoHd8v0zh6ifwsM1OH7rXimDXKT/sVitORqoCLb2EwwWMoCiavapnq
	 oe8DtFC5AWdE93M1EfC4xXggbqPMOz8epzHMjmnqeyRvDMBj5HSvm1fUOblR7G8RsZ
	 IAKGSAmgDGDIDF0pc7EZCWDIKo6UJkLs5Hogu4b5F7HSNNON92jTY1fUzxdUaQWv3/
	 lDRzb2sTBjEVw==
Date: Thu, 23 Sep 2021 17:25:36 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, wl@xen.org
Subject: Re: [PATCH 08/37] xen/x86: add detection of discontinous node memory
 range
In-Reply-To: <20210923120236.3692135-9-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.21.2109231719410.17979@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-9-wei.chen@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

CC'ing x86 maintainers

On Thu, 23 Sep 2021, Wei Chen wrote:
> One NUMA node may contain several memory blocks. In current Xen
> code, Xen will maintain a node memory range for each node to cover
> all its memory blocks. But here comes the problem, in the gap of
> one node's two memory blocks, if there are some memory blocks don't
> belong to this node (remote memory blocks). This node's memory range
> will be expanded to cover these remote memory blocks.
> 
> One node's memory range contains othe nodes' memory, this is obviously
> not very reasonable. This means current NUMA code only can support
> node has continous memory blocks. However, on a physical machine, the
> addresses of multiple nodes can be interleaved.
> 
> So in this patch, we add code to detect discontinous memory blocks
> for one node. NUMA initializtion will be failed and error messages
> will be printed when Xen detect such hardware configuration.

At least on ARM, it is not just memory that can be interleaved, but also
MMIO regions. For instance:

node0 bank0 0-0x1000000
MMIO 0x1000000-0x1002000
Hole 0x1002000-0x2000000
node0 bank1 0x2000000-0x3000000

So I am not familiar with the SRAT format, but I think on ARM the check
would look different: we would just look for multiple memory ranges
under a device_type = "memory" node of a NUMA node in device tree.



> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>  xen/arch/x86/srat.c | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
> index 7d20d7f222..2f08fa4660 100644
> --- a/xen/arch/x86/srat.c
> +++ b/xen/arch/x86/srat.c
> @@ -271,6 +271,36 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
>  		       pxm, pa->apic_id, node);
>  }
>  
> +/*
> + * Check to see if there are other nodes within this node's range.
> + * We just need to check full contains situation. Because overlaps
> + * have been checked before by conflicting_memblks.
> + */
> +static bool __init is_node_memory_continuous(nodeid_t nid,
> +    paddr_t start, paddr_t end)
> +{
> +	nodeid_t i;
> +
> +	struct node *nd = &nodes[nid];
> +	for_each_node_mask(i, memory_nodes_parsed)
> +	{
> +		/* Skip itself */
> +		if (i == nid)
> +			continue;
> +
> +		nd = &nodes[i];
> +		if (start < nd->start && nd->end < end)
> +		{
> +			printk(KERN_ERR
> +			       "NODE %u: (%"PRIpaddr"-%"PRIpaddr") intertwine with NODE %u (%"PRIpaddr"-%"PRIpaddr")\n",
> +			       nid, start, end, i, nd->start, nd->end);
> +			return false;
> +		}
> +	}
> +
> +	return true;
> +}
> +
>  /* Callback for parsing of the Proximity Domain <-> Memory Area mappings */
>  void __init
>  acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
> @@ -344,6 +374,12 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
>  				nd->start = start;
>  			if (nd->end < end)
>  				nd->end = end;
> +
> +			/* Check whether this range contains memory for other nodes */
> +			if (!is_node_memory_continuous(node, nd->start, nd->end)) {
> +				bad_srat();
> +				return;
> +			}
>  		}
>  	}
>  	printk(KERN_INFO "SRAT: Node %u PXM %u %"PRIpaddr"-%"PRIpaddr"%s\n",
> -- 
> 2.25.1
> 

