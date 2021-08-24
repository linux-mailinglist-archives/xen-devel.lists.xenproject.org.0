Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2888C3F6843
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 19:41:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.171669.313237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIaPl-00032e-7E; Tue, 24 Aug 2021 17:40:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 171669.313237; Tue, 24 Aug 2021 17:40:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIaPl-00030Y-3n; Tue, 24 Aug 2021 17:40:45 +0000
Received: by outflank-mailman (input) for mailman id 171669;
 Tue, 24 Aug 2021 17:40:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mIaPj-00030S-Mq
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 17:40:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIaPi-0000mW-Ly; Tue, 24 Aug 2021 17:40:42 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIaPi-0003Wx-Fl; Tue, 24 Aug 2021 17:40:42 +0000
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
	bh=UieXnK/RMlUOH4hp0iz6/cGxgxz3q7PQ2tkdV8IBDE8=; b=CcsAtEy4rbSg7Lj99gSvH4guRS
	R/k5Y6NdN9+vx0z2VDYH9CSQ5PukQTJcLzx+/TrdNhLo9Xnlaxj2bXEVC8HDRPkySxvnc3UOiBVDG
	1AMesJbCF3UcvzPGLp9/5+SEcj/14YHdUMRA9rMhdD4oBZIS1Qhbpz0tcGhNU8M+OIBE=;
Subject: Re: [XEN RFC PATCH 11/40] xen/x86: Move NUMA nodes and memory block
 ranges to common
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, jbeulich@suse.com
Cc: Bertrand.Marquis@arm.com
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-12-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c16632f9-2610-f266-8581-32b5a4bb7603@xen.org>
Date: Tue, 24 Aug 2021 18:40:40 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210811102423.28908-12-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Wei,

On 11/08/2021 11:23, Wei Chen wrote:
> These data structures and functions are used to create the
> mapping between node and memory blocks. In device tree based
> NUMA, we will reuse these data structures and functions, so
> we move this part of code from x86 to common.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/arch/x86/srat.c        | 50 -------------------------------------
>   xen/common/numa.c          | 51 ++++++++++++++++++++++++++++++++++++++
>   xen/include/asm-x86/numa.h |  8 ------
>   xen/include/xen/numa.h     | 15 +++++++++++
>   4 files changed, 66 insertions(+), 58 deletions(-)
> 
> diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
> index 6b77b98201..6d68b8a614 100644
> --- a/xen/arch/x86/srat.c
> +++ b/xen/arch/x86/srat.c
> @@ -26,7 +26,6 @@ static struct acpi_table_slit *__read_mostly acpi_slit;
>   
>   static nodemask_t memory_nodes_parsed __initdata;
>   static nodemask_t processor_nodes_parsed __initdata;
> -static struct node nodes[MAX_NUMNODES] __initdata;
>   
>   struct pxm2node {
>   	unsigned pxm;
> @@ -37,9 +36,6 @@ static struct pxm2node __read_mostly pxm2node[MAX_NUMNODES] =
>   
>   static unsigned node_to_pxm(nodeid_t n);
>   
> -static int num_node_memblks;
> -static struct node node_memblk_range[NR_NODE_MEMBLKS];
> -static nodeid_t memblk_nodeid[NR_NODE_MEMBLKS];
>   static __initdata DECLARE_BITMAP(memblk_hotplug, NR_NODE_MEMBLKS);
>   
>   static inline bool node_found(unsigned idx, unsigned pxm)
> @@ -104,52 +100,6 @@ nodeid_t setup_node(unsigned pxm)
>   	return node;
>   }
>   
> -int valid_numa_range(u64 start, u64 end, nodeid_t node)
> -{
> -	int i;
> -
> -	for (i = 0; i < num_node_memblks; i++) {
> -		struct node *nd = &node_memblk_range[i];
> -
> -		if (nd->start <= start && nd->end >= end &&
> -			memblk_nodeid[i] == node)
> -			return 1;
> -	}
> -
> -	return 0;
> -}
> -
> -static __init int conflicting_memblks(u64 start, u64 end)
> -{
> -	int i;
> -
> -	for (i = 0; i < num_node_memblks; i++) {
> -		struct node *nd = &node_memblk_range[i];
> -		if (nd->start == nd->end)
> -			continue;
> -		if (nd->end > start && nd->start < end)
> -			return i;
> -		if (nd->end == end && nd->start == start)
> -			return i;
> -	}
> -	return -1;
> -}
> -
> -static __init void cutoff_node(int i, u64 start, u64 end)
> -{
> -	struct node *nd = &nodes[i];
> -	if (nd->start < start) {
> -		nd->start = start;
> -		if (nd->end < nd->start)
> -			nd->start = nd->end;
> -	}
> -	if (nd->end > end) {
> -		nd->end = end;
> -		if (nd->start > nd->end)
> -			nd->start = nd->end;
> -	}
> -}
> -
>   static __init void bad_srat(void)
>   {
>   	int i;
> diff --git a/xen/common/numa.c b/xen/common/numa.c
> index 9b6f23dfc1..1facc8fe2b 100644
> --- a/xen/common/numa.c
> +++ b/xen/common/numa.c
> @@ -29,6 +29,11 @@ nodeid_t cpu_to_node[NR_CPUS] __read_mostly = {
>   
>   cpumask_t node_to_cpumask[MAX_NUMNODES] __read_mostly;
>   
> +struct node nodes[MAX_NUMNODES] __initdata;
> +int num_node_memblks;
> +struct node node_memblk_range[NR_NODE_MEMBLKS];
> +nodeid_t memblk_nodeid[NR_NODE_MEMBLKS];
> +
>   /*
>    * Given a shift value, try to populate memnodemap[]
>    * Returns :
> @@ -136,6 +141,52 @@ int __init compute_hash_shift(struct node *nodes, int numnodes,
>       return shift;
>   }
>   
> +int valid_numa_range(u64 start, u64 end, nodeid_t node)
> +{
> +	int i;
> +
> +	for (i = 0; i < num_node_memblks; i++) {
> +		struct node *nd = &node_memblk_range[i];
> +
> +		if (nd->start <= start && nd->end >= end &&
> +			memblk_nodeid[i] == node)
> +			return 1;
> +	}
> +
> +	return 0;
> +}
> +
> +int __init conflicting_memblks(u64 start, u64 end)
> +{
> +	int i;
> +
> +	for (i = 0; i < num_node_memblks; i++) {
> +		struct node *nd = &node_memblk_range[i];
> +		if (nd->start == nd->end)
> +			continue;
> +		if (nd->end > start && nd->start < end)
> +			return i;
> +		if (nd->end == end && nd->start == start)
> +			return i;
> +	}
> +	return -1;
> +}
> +
> +void __init cutoff_node(int i, u64 start, u64 end)
> +{
> +	struct node *nd = &nodes[i];
> +	if (nd->start < start) {
> +		nd->start = start;
> +		if (nd->end < nd->start)
> +			nd->start = nd->end;
> +	}
> +	if (nd->end > end) {
> +		nd->end = end;
> +		if (nd->start > nd->end)
> +			nd->start = nd->end;
> +	}
> +}
> +
>   void numa_add_cpu(int cpu)
>   {
>       cpumask_set_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
> diff --git a/xen/include/asm-x86/numa.h b/xen/include/asm-x86/numa.h
> index 07ff78ea1b..e8a92ad9df 100644
> --- a/xen/include/asm-x86/numa.h
> +++ b/xen/include/asm-x86/numa.h
> @@ -17,12 +17,6 @@ extern cpumask_t     node_to_cpumask[];
>   #define node_to_first_cpu(node)  (__ffs(node_to_cpumask[node]))
>   #define node_to_cpumask(node)    (node_to_cpumask[node])
>   
> -struct node {
> -	u64 start,end;
> -};
> -
> -extern int compute_hash_shift(struct node *nodes, int numnodes,
> -			      nodeid_t *nodeids);
>   extern nodeid_t pxm_to_node(unsigned int pxm);
>   
>   #define ZONE_ALIGN (1UL << (MAX_ORDER+PAGE_SHIFT))
> @@ -45,8 +39,6 @@ static inline void clear_node_cpumask(int cpu)
>   	cpumask_clear_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
>   }
>   
> -extern int valid_numa_range(u64 start, u64 end, nodeid_t node);
> -
>   void srat_parse_regions(u64 addr);
>   extern u8 __node_distance(nodeid_t a, nodeid_t b);
>   unsigned int arch_get_dma_bitsize(void);
> diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
> index 5af74b357f..67b79a73a3 100644
> --- a/xen/include/xen/numa.h
> +++ b/xen/include/xen/numa.h
> @@ -54,6 +54,21 @@ static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
>   
>   extern void numa_add_cpu(int cpu);
>   
> +struct node {
> +	u64 start,end;
> +};
> +
> +extern struct node nodes[MAX_NUMNODES];
> +extern int num_node_memblks;
> +extern struct node node_memblk_range[NR_NODE_MEMBLKS];
> +extern nodeid_t memblk_nodeid[NR_NODE_MEMBLKS];

I am not overly happy that the 4 ariables above are now exported. 
Looking at the code, they are (only?) used in arch specific code for 
acpi_numa_memory_affinity_init() and dtb_numa_memory_affinity_init().

There bits touching the variables looks quite similar between the two 
functions. The main differences seems to be the messages in printk() and 
the hotplug bits.

So I think we should attempt to abstract the code. IIRC, we discussed 
some of the way to abstract when Vijay Kilari attempted to add support 
for NUMA (see [1]). It might be worth to have a look and see if you can 
re-use some of the ideas.

> +
> +extern int compute_hash_shift(struct node *nodes, int numnodes,
> +			      nodeid_t *nodeids);
> +extern int conflicting_memblks(u64 start, u64 end);
> +extern void cutoff_node(int i, u64 start, u64 end);
> +extern int valid_numa_range(u64 start, u64 end, nodeid_t node);
> +
>   #endif /* CONFIG_NUMA */
>   
>   #endif /* _XEN_NUMA_H */
> 

[1] 
https://lore.kernel.org/xen-devel/1500378106-2620-1-git-send-email-vijay.kilari@gmail.com/

-- 
Julien Grall

