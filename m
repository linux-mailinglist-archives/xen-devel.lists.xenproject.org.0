Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A063F9123
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 01:53:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173236.316111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJPAd-0001l9-7K; Thu, 26 Aug 2021 23:52:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173236.316111; Thu, 26 Aug 2021 23:52:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJPAd-0001i5-3z; Thu, 26 Aug 2021 23:52:31 +0000
Received: by outflank-mailman (input) for mailman id 173236;
 Thu, 26 Aug 2021 23:52:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0Zrd=NR=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mJPAc-0001hz-45
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 23:52:30 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b7a49a8b-aa57-4529-a81c-2b9f70cc8021;
 Thu, 26 Aug 2021 23:52:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C965D60E75;
 Thu, 26 Aug 2021 23:52:27 +0000 (UTC)
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
X-Inumbo-ID: b7a49a8b-aa57-4529-a81c-2b9f70cc8021
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1630021948;
	bh=Js2fqyHZX1Lp35NP+J4pC8KOyAuDM5eka8pvYqiw19Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=sy9fPnRXTRIQZ/g5At6TrTBTY+ok87VZQ9W3lR8zXjCZ6C0g+VdWQAzK2iEGujykr
	 ZrvU+tk8/Mp/X/IcVy3NNzLnRB9OLZyBzmoO9LiV4EmiW93Ly6tjyVkVu6bnE7p+Vv
	 kM6NRvFcTJXnnM6BSg+RXJ/VpJPBCjxN7dDlSv+levz5lSHlveeqk1Gl8Bj6SozKrV
	 x9Dxhw1iP0W2CRiqS6F4cKcJKjJ0bH5coXNIfejxKlNIKg4t/9Yt+TIR4Oroeadydh
	 vSotfNyEtYnHzlCxCaNKMYK8ZmVgxphMXGrqBx7Q9uCS5++3TT5Hv/69VZ3XPS0lOW
	 FIiDmHGERz/CA==
Date: Thu, 26 Aug 2021 16:52:26 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    jbeulich@suse.com, Bertrand.Marquis@arm.com
Subject: Re: [XEN RFC PATCH 20/40] xen/arm: implement node distance helpers
 for Arm64
In-Reply-To: <20210811102423.28908-21-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.21.2108261640590.24433@sstabellini-ThinkPad-T480s>
References: <20210811102423.28908-1-wei.chen@arm.com> <20210811102423.28908-21-wei.chen@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 11 Aug 2021, Wei Chen wrote:
> In current Xen code, __node_distance is a fake API, it always
> returns NUMA_REMOTE_DISTANCE(20). Now we use a matrix to record
> the distance between any two nodes. Accordingly, we provide a
> set_node_distance API to set the distance for any two nodes in
> this patch.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>  xen/arch/arm/numa.c        | 44 ++++++++++++++++++++++++++++++++++++++
>  xen/include/asm-arm/numa.h | 12 ++++++++++-
>  xen/include/asm-x86/numa.h |  1 -
>  xen/include/xen/numa.h     |  2 +-
>  4 files changed, 56 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
> index 566ad1e52b..f61a8df645 100644
> --- a/xen/arch/arm/numa.c
> +++ b/xen/arch/arm/numa.c
> @@ -23,6 +23,11 @@
>  #include <xen/pfn.h>
>  #include <asm/setup.h>
>  
> +static uint8_t __read_mostly
> +node_distance_map[MAX_NUMNODES][MAX_NUMNODES] = {
> +    { NUMA_REMOTE_DISTANCE }
> +};
> +
>  void numa_set_node(int cpu, nodeid_t nid)
>  {
>      if ( nid >= MAX_NUMNODES ||
> @@ -32,6 +37,45 @@ void numa_set_node(int cpu, nodeid_t nid)
>      cpu_to_node[cpu] = nid;
>  }
>  
> +void __init numa_set_distance(nodeid_t from, nodeid_t to, uint32_t distance)
> +{
> +    if ( from >= MAX_NUMNODES || to >= MAX_NUMNODES )
> +    {
> +        printk(KERN_WARNING
> +            "NUMA nodes are out of matrix, from=%u to=%u distance=%u\n",
> +            from, to, distance);

NIT: please align. Example:

printk(KERN_WARNING
       "NUMA nodes are out of matrix, from=%u to=%u distance=%u\n",

Also please use PRIu32 for uint32_t. Probably should use PRIu8 for
nodeids.


> +        return;
> +    }
> +
> +    /* NUMA defines 0xff as an unreachable node and 0-9 are undefined */
> +    if ( distance >= NUMA_NO_DISTANCE ||
> +        (distance >= NUMA_DISTANCE_UDF_MIN &&
> +         distance <= NUMA_DISTANCE_UDF_MAX) ||
> +        (from == to && distance != NUMA_LOCAL_DISTANCE) )
> +    {
> +        printk(KERN_WARNING
> +            "Invalid NUMA node distance, from:%d to:%d distance=%d\n",
> +            from, to, distance);

NIT: please align

Also you used %u before for nodeids, which is better because from and to
are unsigned. Distance should be uint32_t.


> +        return;
> +    }
> +
> +    node_distance_map[from][to] = distance;

Shouldn't we also be setting:

    node_distance_map[to][from] = distance;

?


> +}
> +
> +uint8_t __node_distance(nodeid_t from, nodeid_t to)
> +{
> +    /*
> +     * Check whether the nodes are in the matrix range.
> +     * When any node is out of range, except from and to nodes are the
> +     * same, we treat them as unreachable (return 0xFF)
> +     */
> +    if ( from >= MAX_NUMNODES || to >= MAX_NUMNODES )
> +        return from == to ? NUMA_LOCAL_DISTANCE : NUMA_NO_DISTANCE;
> +
> +    return node_distance_map[from][to];
> +}
> +EXPORT_SYMBOL(__node_distance);
> +
>  void __init numa_init(bool acpi_off)
>  {
>      uint32_t idx;
> diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-arm/numa.h
> index bb495a24e1..559b028a01 100644
> --- a/xen/include/asm-arm/numa.h
> +++ b/xen/include/asm-arm/numa.h
> @@ -12,8 +12,19 @@ typedef u8 nodeid_t;
>   * set the number of NUMA memory block number to 128.
>   */
>  #define NODES_SHIFT      6
> +/*
> + * In ACPI spec, 0-9 are the reserved values for node distance,
> + * 10 indicates local node distance, 20 indicates remote node
> + * distance. Set node distance map in device tree will follow
> + * the ACPI's definition.
> + */
> +#define NUMA_DISTANCE_UDF_MIN   0
> +#define NUMA_DISTANCE_UDF_MAX   9
> +#define NUMA_LOCAL_DISTANCE     10
> +#define NUMA_REMOTE_DISTANCE    20
>  
>  extern void numa_init(bool acpi_off);
> +extern void numa_set_distance(nodeid_t from, nodeid_t to, uint32_t distance);
>  
>  /*
>   * Temporary for fake NUMA node, when CPU, memory and distance
> @@ -21,7 +32,6 @@ extern void numa_init(bool acpi_off);
>   * symbols will be removed.
>   */
>  extern mfn_t first_valid_mfn;
> -#define __node_distance(a, b) (20)
>  
>  #else
>  
> diff --git a/xen/include/asm-x86/numa.h b/xen/include/asm-x86/numa.h
> index 5a57a51e26..e0253c20b7 100644
> --- a/xen/include/asm-x86/numa.h
> +++ b/xen/include/asm-x86/numa.h
> @@ -21,7 +21,6 @@ extern nodeid_t apicid_to_node[];
>  extern void init_cpu_to_node(void);
>  
>  void srat_parse_regions(u64 addr);
> -extern u8 __node_distance(nodeid_t a, nodeid_t b);
>  unsigned int arch_get_dma_bitsize(void);
>  
>  #endif
> diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
> index cb08d2eca9..0475823b13 100644
> --- a/xen/include/xen/numa.h
> +++ b/xen/include/xen/numa.h
> @@ -58,7 +58,7 @@ static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
>  #define node_spanned_pages(nid)	(NODE_DATA(nid)->node_spanned_pages)
>  #define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
>  				 NODE_DATA(nid)->node_spanned_pages)
> -
> +extern u8 __node_distance(nodeid_t a, nodeid_t b);
>  extern void numa_add_cpu(int cpu);
>  
>  struct node {
> -- 
> 2.25.1
> 

