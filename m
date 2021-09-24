Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F704168FF
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 02:38:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194675.346844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTZEV-0008Hv-Qh; Fri, 24 Sep 2021 00:38:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194675.346844; Fri, 24 Sep 2021 00:38:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTZEV-0008G8-Na; Fri, 24 Sep 2021 00:38:31 +0000
Received: by outflank-mailman (input) for mailman id 194675;
 Fri, 24 Sep 2021 00:38:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhVx=OO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTZEU-0008G2-9f
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 00:38:30 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bc5f1b80-1ccf-11ec-ba94-12813bfff9fa;
 Fri, 24 Sep 2021 00:38:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E555261211;
 Fri, 24 Sep 2021 00:38:27 +0000 (UTC)
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
X-Inumbo-ID: bc5f1b80-1ccf-11ec-ba94-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632443908;
	bh=n9vFEGEt55OzmkCdWiV+es2O9vy67O1ekPUxnH4h1WA=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=m85knBa+igHsH9WbFTNmLtWtAITrSxMROpmx4urQPFOQAy3qSVkyGoBB9ENJijnY7
	 7zwBO5UQngGk3TU6zFSEO3+oKycAPyGZsziGtbP8TZiuP9Oe2giTJo5zWQ3M0ixry4
	 tLh/XoZbc0724wb1BGdAjsbgkN3ANfGz/8WnvWGER4xJC8w8+8J5d3Wnaauvm5ueXo
	 2HhbJxF7vjz17qOYNQVj/sfvibF/loUTe51Ci+i4PXy86th+z+cEBq4FPxnWo0Vqzh
	 RstIXz4FZzFTtW2lZk64AOWLWHJxA1AXPO1qSwEr9lYXmLu1mc7uhh50StZRnuL5qu
	 Z6qyvIBQcRIUw==
Date: Thu, 23 Sep 2021 17:38:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, wl@xen.org
Subject: Re: [PATCH 11/37] xen/x86: abstract neutral code from
 acpi_numa_memory_affinity_init
In-Reply-To: <20210923120236.3692135-12-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.21.2109231732150.17979@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-12-wei.chen@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

+x86 maintainers


On Thu, 23 Sep 2021, Wei Chen wrote:
> There is some code in acpi_numa_memory_affinity_init to update node
> memory range and update node_memblk_range array. This code is not
> ACPI specific, it can be shared by other NUMA implementation, like
> device tree based NUMA implementation.
> 
> So in this patch, we abstract this memory range and blocks relative
> code to a new function. This will avoid exporting static variables
> like node_memblk_range. And the PXM in neutral code print messages
> have been replaced by NODE, as PXM is ACPI specific.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>  xen/arch/x86/srat.c        | 131 +++++++++++++++++++++----------------
>  xen/include/asm-x86/numa.h |   3 +
>  2 files changed, 77 insertions(+), 57 deletions(-)
> 
> diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
> index 3334ede7a5..18bc6b19bb 100644
> --- a/xen/arch/x86/srat.c
> +++ b/xen/arch/x86/srat.c
> @@ -104,6 +104,14 @@ nodeid_t setup_node(unsigned pxm)
>  	return node;
>  }
>  
> +bool __init numa_memblks_available(void)
> +{
> +	if (num_node_memblks < NR_NODE_MEMBLKS)
> +		return true;
> +
> +	return false;
> +}
> +
>  int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node)
>  {
>  	int i;
> @@ -301,69 +309,35 @@ static bool __init is_node_memory_continuous(nodeid_t nid,
>  	return true;
>  }
>  
> -/* Callback for parsing of the Proximity Domain <-> Memory Area mappings */
> -void __init
> -acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
> +/* Neutral NUMA memory affinity init function for ACPI and DT */
> +int __init numa_update_node_memblks(nodeid_t node,
> +		paddr_t start, paddr_t size, bool hotplug)
>  {
> -	paddr_t start, end;
> -	unsigned pxm;
> -	nodeid_t node;
> +	paddr_t end = start + size;
>  	int i;
>  
> -	if (srat_disabled())
> -		return;
> -	if (ma->header.length != sizeof(struct acpi_srat_mem_affinity)) {
> -		bad_srat();
> -		return;
> -	}
> -	if (!(ma->flags & ACPI_SRAT_MEM_ENABLED))
> -		return;
> -
> -	start = ma->base_address;
> -	end = start + ma->length;
> -	/* Supplement the heuristics in l1tf_calculations(). */
> -	l1tf_safe_maddr = max(l1tf_safe_maddr, ROUNDUP(end, PAGE_SIZE));
> -
> -	if (num_node_memblks >= NR_NODE_MEMBLKS)
> -	{
> -		dprintk(XENLOG_WARNING,
> -                "Too many numa entry, try bigger NR_NODE_MEMBLKS \n");
> -		bad_srat();
> -		return;
> -	}
> -
> -	pxm = ma->proximity_domain;
> -	if (srat_rev < 2)
> -		pxm &= 0xff;
> -	node = setup_node(pxm);
> -	if (node == NUMA_NO_NODE) {
> -		bad_srat();
> -		return;
> -	}
> -	/* It is fine to add this area to the nodes data it will be used later*/
> +	/* It is fine to add this area to the nodes data it will be used later */
>  	i = conflicting_memblks(start, end);
>  	if (i < 0)
>  		/* everything fine */;
>  	else if (memblk_nodeid[i] == node) {
> -		bool mismatch = !(ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE) !=
> -		                !test_bit(i, memblk_hotplug);
> +		bool mismatch = !hotplug != !test_bit(i, memblk_hotplug);
>  
> -		printk("%sSRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with itself (%"PRIpaddr"-%"PRIpaddr")\n",
> -		       mismatch ? KERN_ERR : KERN_WARNING, pxm, start, end,
> +		printk("%sSRAT: NODE %u (%"PRIpaddr"-%"PRIpaddr") overlaps with itself (%"PRIpaddr"-%"PRIpaddr")\n",
> +		       mismatch ? KERN_ERR : KERN_WARNING, node, start, end,
>  		       node_memblk_range[i].start, node_memblk_range[i].end);
>  		if (mismatch) {
> -			bad_srat();
> -			return;
> +			return -1;
>  		}
>  	} else {
>  		printk(KERN_ERR
> -		       "SRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with PXM %u (%"PRIpaddr"-%"PRIpaddr")\n",
> -		       pxm, start, end, node_to_pxm(memblk_nodeid[i]),
> +		       "SRAT: NODE %u (%"PRIpaddr"-%"PRIpaddr") overlaps with NODE %u (%"PRIpaddr"-%"PRIpaddr")\n",
> +		       node, start, end, memblk_nodeid[i],
>  		       node_memblk_range[i].start, node_memblk_range[i].end);
> -		bad_srat();
> -		return;
> +		return -1;
>  	}
> -	if (!(ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE)) {
> +
> +	if (!hotplug) {
>  		struct node *nd = &nodes[node];
>  
>  		if (!node_test_and_set(node, memory_nodes_parsed)) {
> @@ -375,26 +349,69 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
>  			if (nd->end < end)
>  				nd->end = end;
>  
> -			/* Check whether this range contains memory for other nodes */
> -			if (!is_node_memory_continuous(node, nd->start, nd->end)) {
> -				bad_srat();
> -				return;
> -			}
> +			if (!is_node_memory_continuous(node, nd->start, nd->end))
> +				return -1;
>  		}
>  	}
> -	printk(KERN_INFO "SRAT: Node %u PXM %u %"PRIpaddr"-%"PRIpaddr"%s\n",
> -	       node, pxm, start, end,
> -	       ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE ? " (hotplug)" : "");
> +
> +	printk(KERN_INFO "SRAT: Node %u %"PRIpaddr"-%"PRIpaddr"%s\n",
> +	       node, start, end, hotplug ? " (hotplug)" : "");
>  
>  	node_memblk_range[num_node_memblks].start = start;
>  	node_memblk_range[num_node_memblks].end = end;
>  	memblk_nodeid[num_node_memblks] = node;
> -	if (ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE) {
> +	if (hotplug) {
>  		__set_bit(num_node_memblks, memblk_hotplug);
>  		if (end > mem_hotplug_boundary())
>  			mem_hotplug_update_boundary(end);
>  	}
>  	num_node_memblks++;
> +
> +	return 0;
> +}
> +
> +/* Callback for parsing of the Proximity Domain <-> Memory Area mappings */
> +void __init
> +acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
> +{
> +	unsigned pxm;
> +	nodeid_t node;
> +	int ret;
> +
> +	if (srat_disabled())
> +		return;
> +	if (ma->header.length != sizeof(struct acpi_srat_mem_affinity)) {
> +		bad_srat();
> +		return;
> +	}
> +	if (!(ma->flags & ACPI_SRAT_MEM_ENABLED))
> +		return;
> +
> +	/* Supplement the heuristics in l1tf_calculations(). */
> +	l1tf_safe_maddr = max(l1tf_safe_maddr,
> +			ROUNDUP((ma->base_address + ma->length), PAGE_SIZE));
> +
> +	if (!numa_memblks_available())
> +	{
> +		dprintk(XENLOG_WARNING,
> +                "Too many numa entry, try bigger NR_NODE_MEMBLKS \n");
> +		bad_srat();
> +		return;
> +	}
> +
> +	pxm = ma->proximity_domain;
> +	if (srat_rev < 2)
> +		pxm &= 0xff;
> +	node = setup_node(pxm);
> +	if (node == NUMA_NO_NODE) {
> +		bad_srat();
> +		return;
> +	}
> +
> +	ret = numa_update_node_memblks(node, ma->base_address, ma->length,
> +					ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE);
> +	if (ret != 0)
> +		bad_srat();
>  }
>  
>  /* Sanity check to catch more bad SRATs (they are amazingly common).
> diff --git a/xen/include/asm-x86/numa.h b/xen/include/asm-x86/numa.h
> index 50cfd8e7ef..5772a70665 100644
> --- a/xen/include/asm-x86/numa.h
> +++ b/xen/include/asm-x86/numa.h
> @@ -74,6 +74,9 @@ static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
>  				 NODE_DATA(nid)->node_spanned_pages)
>  
>  extern int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node);
> +extern bool numa_memblks_available(void);
> +extern int numa_update_node_memblks(nodeid_t node,
> +		paddr_t start, paddr_t size, bool hotplug);
>  
>  void srat_parse_regions(paddr_t addr);
>  extern u8 __node_distance(nodeid_t a, nodeid_t b);
> -- 
> 2.25.1
> 

