Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3993FC07A
	for <lists+xen-devel@lfdr.de>; Tue, 31 Aug 2021 03:27:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.175411.319590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKsYE-0006J7-UH; Tue, 31 Aug 2021 01:26:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 175411.319590; Tue, 31 Aug 2021 01:26:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mKsYE-0006GJ-QH; Tue, 31 Aug 2021 01:26:58 +0000
Received: by outflank-mailman (input) for mailman id 175411;
 Tue, 31 Aug 2021 01:26:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QH02=NW=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mKsYD-0006GD-AW
 for xen-devel@lists.xenproject.org; Tue, 31 Aug 2021 01:26:57 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cd9e16a5-b63e-471c-a7fa-802b143fbfbb;
 Tue, 31 Aug 2021 01:26:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5984760F6C;
 Tue, 31 Aug 2021 01:26:55 +0000 (UTC)
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
X-Inumbo-ID: cd9e16a5-b63e-471c-a7fa-802b143fbfbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630373215;
	bh=zBk4MwTfyJ0COOTIT4pyCMnEC13YJPUf2VKMtsbILOU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=EUwhS0C3NJUud9iA3ZCQkJZabZDa3caf70HQ4erh2alo7H+a5cn3n9iPMt+eF8M5n
	 Qq+d2xL1qBtl39UwAUSVBCwhoxNV3+VB+SLvFWY834I+rRiHpGuOmdj6iXF7WE2vf4
	 sx8TBsQluu46k0oN1WzCTtA0MDe0SGVAZguR8QFgaa6/R53AdFti6sVaBqBg187Ast
	 WeYRZuodbiL4ld1b0enyyP4y2KShm2S2mFsjsxRqL3F6WvZWKKTCYQRpklxuZiFWb/
	 JDw6aje/T5a/lmIBjLuGoD+wjpJ9GOZrJA2e1cTRvfU+gRyvDcWvSp/eWkbimtsfQh
	 PfE6SwcmP0eoA==
Date: Mon, 30 Aug 2021 18:26:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    jbeulich@suse.com, Bertrand.Marquis@arm.com
Subject: Re: [XEN RFC PATCH 34/40] xen: move numa_scan_nodes from x86 to
 common
In-Reply-To: <20210811102423.28908-35-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.21.2108301825200.17851@sstabellini-ThinkPad-T480s>
References: <20210811102423.28908-1-wei.chen@arm.com> <20210811102423.28908-35-wei.chen@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 11 Aug 2021, Wei Chen wrote:
> After the previous patches preparations, numa_scan_nodes can be
> used by Arm and x86. So we move this function from x86 to common.
> As node_cover_memory will not be used cross files, we restore its
> static attribute in this patch.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>  xen/arch/x86/srat.c        | 52 ------------------------------------
>  xen/common/numa.c          | 54 +++++++++++++++++++++++++++++++++++++-
>  xen/include/asm-x86/acpi.h |  3 ---
>  xen/include/xen/numa.h     |  3 ++-
>  4 files changed, 55 insertions(+), 57 deletions(-)
> 
> diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
> index c979939fdd..c9f019c307 100644
> --- a/xen/arch/x86/srat.c
> +++ b/xen/arch/x86/srat.c
> @@ -361,58 +361,6 @@ void __init srat_parse_regions(u64 addr)
>  	pfn_pdx_hole_setup(mask >> PAGE_SHIFT);
>  }
>  
> -/* Use the information discovered above to actually set up the nodes. */
> -int __init numa_scan_nodes(u64 start, u64 end)
> -{
> -	int i;
> -	nodemask_t all_nodes_parsed;
> -
> -	/* First clean up the node list */
> -	for (i = 0; i < MAX_NUMNODES; i++)
> -		cutoff_node(i, start, end);
> -
> -#ifdef CONFIG_ACPI_NUMA
> -	if (acpi_numa <= 0)
> -		return -1;
> -#endif
> -
> -	if (!nodes_cover_memory()) {
> -		bad_srat();
> -		return -1;
> -	}
> -
> -	memnode_shift = compute_hash_shift(node_memblk_range, num_node_memblks,
> -				memblk_nodeid);
> -
> -	if (memnode_shift < 0) {
> -		printk(KERN_ERR
> -		     "SRAT: No NUMA node hash function found. Contact maintainer\n");
> -		bad_srat();
> -		return -1;
> -	}
> -
> -	nodes_or(all_nodes_parsed, memory_nodes_parsed, processor_nodes_parsed);
> -
> -	/* Finally register nodes */
> -	for_each_node_mask(i, all_nodes_parsed)
> -	{
> -		u64 size = nodes[i].end - nodes[i].start;
> -		if ( size == 0 )
> -			printk(KERN_WARNING "SRAT: Node %u has no memory. "
> -			       "BIOS Bug or mis-configured hardware?\n", i);
> -
> -		setup_node_bootmem(i, nodes[i].start, nodes[i].end);
> -	}
> -	for (i = 0; i < nr_cpu_ids; i++) {
> -		if (cpu_to_node[i] == NUMA_NO_NODE)
> -			continue;
> -		if (!nodemask_test(cpu_to_node[i], &processor_nodes_parsed))
> -			numa_set_node(i, NUMA_NO_NODE);
> -	}
> -	numa_init_array();
> -	return 0;
> -}
> -
>  static unsigned node_to_pxm(nodeid_t n)
>  {
>  	unsigned i;
> diff --git a/xen/common/numa.c b/xen/common/numa.c
> index 4152bbe83b..8ca13e27d1 100644
> --- a/xen/common/numa.c
> +++ b/xen/common/numa.c
> @@ -195,7 +195,7 @@ void __init cutoff_node(int i, u64 start, u64 end)
>  
>  /* Sanity check to catch more bad SRATs (they are amazingly common).
>     Make sure the PXMs cover all memory. */
> -int __init nodes_cover_memory(void)
> +static int __init nodes_cover_memory(void)
>  {
>  	int i;
>  	uint32_t nr_banks = arch_meminfo_get_nr_bank();
> @@ -271,6 +271,58 @@ void __init numa_init_array(void)
>      }
>  }
>  
> +/* Use the information discovered above to actually set up the nodes. */
> +int __init numa_scan_nodes(u64 start, u64 end)
> +{
> +	int i;
> +	nodemask_t all_nodes_parsed;
> +
> +	/* First clean up the node list */
> +	for (i = 0; i < MAX_NUMNODES; i++)
> +		cutoff_node(i, start, end);
> +
> +#ifdef CONFIG_ACPI_NUMA
> +	if (acpi_numa <= 0)
> +		return -1;
> +#endif
> +
> +	if (!nodes_cover_memory()) {
> +		bad_srat();
> +		return -1;
> +	}
> +
> +	memnode_shift = compute_hash_shift(node_memblk_range, num_node_memblks,
> +				memblk_nodeid);
> +
> +	if (memnode_shift < 0) {
> +		printk(KERN_ERR
> +		     "SRAT: No NUMA node hash function found. Contact maintainer\n");
> +		bad_srat();
> +		return -1;
> +	}
> +
> +	nodes_or(all_nodes_parsed, memory_nodes_parsed, processor_nodes_parsed);
> +
> +	/* Finally register nodes */
> +	for_each_node_mask(i, all_nodes_parsed)
> +	{
> +		u64 size = nodes[i].end - nodes[i].start;
> +		if ( size == 0 )
> +			printk(KERN_WARNING "SRAT: Node %u has no memory. "
> +			       "BIOS Bug or mis-configured hardware?\n", i);

Not all archs have a BIOS so I'd say "firmware bug". Like last time, we
usually don't do code changes together with code movement, but in this
case it might be OK. I am also happy with a separate patch to adjust the
two comments (this one and the one in the previous patch).

