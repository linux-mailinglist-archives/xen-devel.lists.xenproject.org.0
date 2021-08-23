Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B45A3F4FC8
	for <lists+xen-devel@lfdr.de>; Mon, 23 Aug 2021 19:47:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170553.311375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIE2O-0000wa-Ii; Mon, 23 Aug 2021 17:47:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170553.311375; Mon, 23 Aug 2021 17:47:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIE2O-0000tp-FZ; Mon, 23 Aug 2021 17:47:08 +0000
Received: by outflank-mailman (input) for mailman id 170553;
 Mon, 23 Aug 2021 17:47:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mIE2M-0000te-So
 for xen-devel@lists.xenproject.org; Mon, 23 Aug 2021 17:47:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIE2L-0008OV-VR; Mon, 23 Aug 2021 17:47:05 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIE2L-0000Ge-L5; Mon, 23 Aug 2021 17:47:05 +0000
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
	bh=a2qmqJrGSnaiyThI2dszzxxbGjk28THCh159ETZOwZU=; b=ARd9g3NvtNaIH71ZBCi701isN9
	xv2P441kH8FKb+8BAQE8Hufab+swgjSpgAv/aS2Qi6t+RNMOOkvYiRXmpCiCUGhV4/lw7Acb+Kefv
	W0Y4Yis5kZn10Dyjx2MB/r5msVwtfKRfFUUAGoehPgyPT+vxXHKQMchHbTb2G2MZbIbs=;
Subject: Re: [XEN RFC PATCH 08/40] xen/x86: Move NUMA memory node map
 functions to common
To: Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, jbeulich@suse.com
Cc: Bertrand.Marquis@arm.com
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-9-wei.chen@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a12849ee-9549-f495-93b5-376f987177ad@xen.org>
Date: Mon, 23 Aug 2021 18:47:03 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210811102423.28908-9-wei.chen@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Wei,

On 11/08/2021 11:23, Wei Chen wrote:
> In the later patches we will add NUMA support to Arm. Arm
> NUMA support will follow current memory node map management
> as x86. So this part of code can be common, in this case,
> we move this part of code from arch/x86 to common.

I would add "No functional changes intended" to make clear this patch is 
only moving code.

> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/arch/x86/numa.c        | 114 --------------------------------
>   xen/common/Makefile        |   1 +
>   xen/common/numa.c          | 131 +++++++++++++++++++++++++++++++++++++
>   xen/include/asm-x86/numa.h |  29 --------
>   xen/include/xen/numa.h     |  35 ++++++++++
>   5 files changed, 167 insertions(+), 143 deletions(-)
>   create mode 100644 xen/common/numa.c
> 
> diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
> index d23f4f7919..a6211be121 100644
> --- a/xen/arch/x86/numa.c
> +++ b/xen/arch/x86/numa.c
> @@ -29,14 +29,6 @@ custom_param("numa", numa_setup);
>   /* from proto.h */
>   #define round_up(x,y) ((((x)+(y))-1) & (~((y)-1)))
>   
> -struct node_data node_data[MAX_NUMNODES];
> -
> -/* Mapping from pdx to node id */
> -int memnode_shift;
> -static typeof(*memnodemap) _memnodemap[64];
> -unsigned long memnodemapsize;
> -u8 *memnodemap;
> -
>   nodeid_t cpu_to_node[NR_CPUS] __read_mostly = {
>       [0 ... NR_CPUS-1] = NUMA_NO_NODE
>   };
> @@ -58,112 +50,6 @@ int srat_disabled(void)
>       return numa_off || acpi_numa < 0;
>   }
>   
> -/*
> - * Given a shift value, try to populate memnodemap[]
> - * Returns :
> - * 1 if OK
> - * 0 if memnodmap[] too small (of shift too small)
> - * -1 if node overlap or lost ram (shift too big)
> - */
> -static int __init populate_memnodemap(const struct node *nodes,
> -                                      int numnodes, int shift, nodeid_t *nodeids)
> -{
> -    unsigned long spdx, epdx;
> -    int i, res = -1;
> -
> -    memset(memnodemap, NUMA_NO_NODE, memnodemapsize * sizeof(*memnodemap));
> -    for ( i = 0; i < numnodes; i++ )
> -    {
> -        spdx = paddr_to_pdx(nodes[i].start);
> -        epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
> -        if ( spdx >= epdx )
> -            continue;
> -        if ( (epdx >> shift) >= memnodemapsize )
> -            return 0;
> -        do {
> -            if ( memnodemap[spdx >> shift] != NUMA_NO_NODE )
> -                return -1;
> -
> -            if ( !nodeids )
> -                memnodemap[spdx >> shift] = i;
> -            else
> -                memnodemap[spdx >> shift] = nodeids[i];
> -
> -            spdx += (1UL << shift);
> -        } while ( spdx < epdx );
> -        res = 1;
> -    }
> -
> -    return res;
> -}
> -
> -static int __init allocate_cachealigned_memnodemap(void)
> -{
> -    unsigned long size = PFN_UP(memnodemapsize * sizeof(*memnodemap));
> -    unsigned long mfn = mfn_x(alloc_boot_pages(size, 1));
> -
> -    memnodemap = mfn_to_virt(mfn);
> -    mfn <<= PAGE_SHIFT;
> -    size <<= PAGE_SHIFT;
> -    printk(KERN_DEBUG "NUMA: Allocated memnodemap from %lx - %lx\n",
> -           mfn, mfn + size);
> -    memnodemapsize = size / sizeof(*memnodemap);
> -
> -    return 0;
> -}
> -
> -/*
> - * The LSB of all start and end addresses in the node map is the value of the
> - * maximum possible shift.
> - */
> -static int __init extract_lsb_from_nodes(const struct node *nodes,
> -                                         int numnodes)
> -{
> -    int i, nodes_used = 0;
> -    unsigned long spdx, epdx;
> -    unsigned long bitfield = 0, memtop = 0;
> -
> -    for ( i = 0; i < numnodes; i++ )
> -    {
> -        spdx = paddr_to_pdx(nodes[i].start);
> -        epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
> -        if ( spdx >= epdx )
> -            continue;
> -        bitfield |= spdx;
> -        nodes_used++;
> -        if ( epdx > memtop )
> -            memtop = epdx;
> -    }
> -    if ( nodes_used <= 1 )
> -        i = BITS_PER_LONG - 1;
> -    else
> -        i = find_first_bit(&bitfield, sizeof(unsigned long)*8);
> -    memnodemapsize = (memtop >> i) + 1;
> -    return i;
> -}
> -
> -int __init compute_hash_shift(struct node *nodes, int numnodes,
> -                              nodeid_t *nodeids)
> -{
> -    int shift;
> -
> -    shift = extract_lsb_from_nodes(nodes, numnodes);
> -    if ( memnodemapsize <= ARRAY_SIZE(_memnodemap) )
> -        memnodemap = _memnodemap;
> -    else if ( allocate_cachealigned_memnodemap() )
> -        return -1;
> -    printk(KERN_DEBUG "NUMA: Using %d for the hash shift.\n", shift);
> -
> -    if ( populate_memnodemap(nodes, numnodes, shift, nodeids) != 1 )
> -    {
> -        printk(KERN_INFO "Your memory is not aligned you need to "
> -               "rebuild your hypervisor with a bigger NODEMAPSIZE "
> -               "shift=%d\n", shift);
> -        return -1;
> -    }
> -
> -    return shift;
> -}
>   /* initialize NODE_DATA given nodeid and start/end */
>   void __init setup_node_bootmem(nodeid_t nodeid, u64 start, u64 end)
>   {
> diff --git a/xen/common/Makefile b/xen/common/Makefile
> index 54de70d422..f8f667e90a 100644
> --- a/xen/common/Makefile
> +++ b/xen/common/Makefile
> @@ -54,6 +54,7 @@ obj-y += wait.o
>   obj-bin-y += warning.init.o
>   obj-$(CONFIG_XENOPROF) += xenoprof.o
>   obj-y += xmalloc_tlsf.o
> +obj-$(CONFIG_NUMA) += numa.o

AFAICT, the Makefile is listing the file in alphabetical order. So 
please add numa.o in the correct position.

>   
>   obj-bin-$(CONFIG_X86) += $(foreach n,decompress bunzip2 unxz unlzma lzo unlzo unlz4 unzstd earlycpio,$(n).init.o)
>   
> diff --git a/xen/common/numa.c b/xen/common/numa.c
> new file mode 100644
> index 0000000000..e65b6a6676
> --- /dev/null
> +++ b/xen/common/numa.c
> @@ -0,0 +1,131 @@
> +/*
> + * Generic VM initialization for x86-64 NUMA setups.
> + * Copyright 2002,2003 Andi Kleen, SuSE Labs.
> + * Adapted for Xen: Ryan Harper <ryanh@us.ibm.com>
> + */
> +
> +#include <xen/mm.h>
> +#include <xen/string.h>
> +#include <xen/init.h>
> +#include <xen/ctype.h>

You don't seem to use any helpers./types directly defined by at least 
this header...

> +#include <xen/nodemask.h>
> +#include <xen/numa.h>
> +#include <xen/time.h>

... this one and ...

> +#include <xen/smp.h>

... this one. Can you check the list of headers and introduce the 
minimum? If the dependency is required by another headers, then I think 
that dependency should be moved in the header requiring it.

> +#include <xen/pfn.h>
> +#include <xen/sched.h>

Please sort the includes in alphabetical order.

> +
> +struct node_data node_data[MAX_NUMNODES];
> +
> +/* Mapping from pdx to node id */
> +int memnode_shift;
> +typeof(*memnodemap) _memnodemap[64];
> +unsigned long memnodemapsize;
> +u8 *memnodemap;
> +
> +/*
> + * Given a shift value, try to populate memnodemap[]
> + * Returns :
> + * 1 if OK
> + * 0 if memnodmap[] too small (of shift too small)
> + * -1 if node overlap or lost ram (shift too big)
> + */
> +static int __init populate_memnodemap(const struct node *nodes,
> +                                      int numnodes, int shift, nodeid_t *nodeids)
> +{
> +    unsigned long spdx, epdx;
> +    int i, res = -1;
> +
> +    memset(memnodemap, NUMA_NO_NODE, memnodemapsize * sizeof(*memnodemap));
> +    for ( i = 0; i < numnodes; i++ )
> +    {
> +        spdx = paddr_to_pdx(nodes[i].start);
> +        epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
> +        if ( spdx >= epdx )
> +            continue;
> +        if ( (epdx >> shift) >= memnodemapsize )
> +            return 0;
> +        do {
> +            if ( memnodemap[spdx >> shift] != NUMA_NO_NODE )
> +                return -1;
> +
> +            if ( !nodeids )
> +                memnodemap[spdx >> shift] = i;
> +            else
> +                memnodemap[spdx >> shift] = nodeids[i];
> +
> +            spdx += (1UL << shift);
> +        } while ( spdx < epdx );
> +        res = 1;
> +    }
> +
> +    return res;
> +}
> +
> +static int __init allocate_cachealigned_memnodemap(void)
> +{
> +    unsigned long size = PFN_UP(memnodemapsize * sizeof(*memnodemap));
> +    unsigned long mfn = mfn_x(alloc_boot_pages(size, 1));
> +
> +    memnodemap = mfn_to_virt(mfn);
> +    mfn <<= PAGE_SHIFT;
> +    size <<= PAGE_SHIFT;
> +    printk(KERN_DEBUG "NUMA: Allocated memnodemap from %lx - %lx\n",
> +           mfn, mfn + size);
> +    memnodemapsize = size / sizeof(*memnodemap);
> +
> +    return 0;
> +}
> +
> +/*
> + * The LSB of all start and end addresses in the node map is the value of the
> + * maximum possible shift.
> + */
> +static int __init extract_lsb_from_nodes(const struct node *nodes,
> +                                         int numnodes)
> +{
> +    int i, nodes_used = 0;
> +    unsigned long spdx, epdx;
> +    unsigned long bitfield = 0, memtop = 0;
> +
> +    for ( i = 0; i < numnodes; i++ )
> +    {
> +        spdx = paddr_to_pdx(nodes[i].start);
> +        epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
> +        if ( spdx >= epdx )
> +            continue;
> +        bitfield |= spdx;
> +        nodes_used++;
> +        if ( epdx > memtop )
> +            memtop = epdx;
> +    }
> +    if ( nodes_used <= 1 )
> +        i = BITS_PER_LONG - 1;
> +    else
> +        i = find_first_bit(&bitfield, sizeof(unsigned long)*8);
> +    memnodemapsize = (memtop >> i) + 1;
> +    return i;
> +}
> +
> +int __init compute_hash_shift(struct node *nodes, int numnodes,
> +                              nodeid_t *nodeids)
> +{
> +    int shift;
> +
> +    shift = extract_lsb_from_nodes(nodes, numnodes);
> +    if ( memnodemapsize <= ARRAY_SIZE(_memnodemap) )
> +        memnodemap = _memnodemap;
> +    else if ( allocate_cachealigned_memnodemap() )
> +        return -1;
> +    printk(KERN_DEBUG "NUMA: Using %d for the hash shift.\n", shift);
> +
> +    if ( populate_memnodemap(nodes, numnodes, shift, nodeids) != 1 )
> +    {
> +        printk(KERN_INFO "Your memory is not aligned you need to "
> +               "rebuild your hypervisor with a bigger NODEMAPSIZE "
> +               "shift=%d\n", shift);
> +        return -1;
> +    }
> +
> +    return shift;
> +}
> diff --git a/xen/include/asm-x86/numa.h b/xen/include/asm-x86/numa.h
> index bada2c0bb9..abe5617d01 100644
> --- a/xen/include/asm-x86/numa.h
> +++ b/xen/include/asm-x86/numa.h
> @@ -26,7 +26,6 @@ extern int compute_hash_shift(struct node *nodes, int numnodes,
>   extern nodeid_t pxm_to_node(unsigned int pxm);
>   
>   #define ZONE_ALIGN (1UL << (MAX_ORDER+PAGE_SHIFT))
> -#define VIRTUAL_BUG_ON(x)
>   
>   extern void numa_add_cpu(int cpu);
>   extern void numa_init_array(void);
> @@ -47,34 +46,6 @@ static inline void clear_node_cpumask(int cpu)
>   	cpumask_clear_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
>   }
>   
> -/* Simple perfect hash to map pdx to node numbers */
> -extern int memnode_shift;
> -extern unsigned long memnodemapsize;
> -extern u8 *memnodemap;
> -
> -struct node_data {
> -    unsigned long node_start_pfn;
> -    unsigned long node_spanned_pages;
> -};
> -
> -extern struct node_data node_data[];
> -
> -static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
> -{
> -	nodeid_t nid;
> -	VIRTUAL_BUG_ON((paddr_to_pdx(addr) >> memnode_shift) >= memnodemapsize);
> -	nid = memnodemap[paddr_to_pdx(addr) >> memnode_shift];
> -	VIRTUAL_BUG_ON(nid >= MAX_NUMNODES || !node_data[nid]);
> -	return nid;
> -}
> -
> -#define NODE_DATA(nid)		(&(node_data[nid]))
> -
> -#define node_start_pfn(nid)	(NODE_DATA(nid)->node_start_pfn)
> -#define node_spanned_pages(nid)	(NODE_DATA(nid)->node_spanned_pages)
> -#define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
> -				 NODE_DATA(nid)->node_spanned_pages)
> -
>   extern int valid_numa_range(u64 start, u64 end, nodeid_t node);
>   
>   void srat_parse_regions(u64 addr);
> diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
> index 7aef1a88dc..39e8a4e00a 100644
> --- a/xen/include/xen/numa.h
> +++ b/xen/include/xen/numa.h
> @@ -18,4 +18,39 @@
>     (((d)->vcpu != NULL && (d)->vcpu[0] != NULL) \
>      ? vcpu_to_node((d)->vcpu[0]) : NUMA_NO_NODE)
>   
> +/* The following content can be used when NUMA feature is enabled */
> +#if defined(CONFIG_NUMA)

Please use #ifdef CONFIG_NUMA

> +
> +/* Simple perfect hash to map pdx to node numbers */
> +extern int memnode_shift;
> +extern unsigned long memnodemapsize;
> +extern u8 *memnodemap;
> +extern typeof(*memnodemap) _memnodemap[64];

AFAICT, this will be turned static against in a follow-up patch. Can 
this be avoided?

> +
> +struct node_data {
> +    unsigned long node_start_pfn;
> +    unsigned long node_spanned_pages;
> +};
> +
> +extern struct node_data node_data[];
> +#define VIRTUAL_BUG_ON(x)
> +
> +static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
> +{
> +	nodeid_t nid;
> +	VIRTUAL_BUG_ON((paddr_to_pdx(addr) >> memnode_shift) >= memnodemapsize);
> +	nid = memnodemap[paddr_to_pdx(addr) >> memnode_shift];
> +	VIRTUAL_BUG_ON(nid >= MAX_NUMNODES || !node_data[nid]);
> +	return nid;
> +}
> +
> +#define NODE_DATA(nid)		(&(node_data[nid]))
> +
> +#define node_start_pfn(nid)	(NODE_DATA(nid)->node_start_pfn)
> +#define node_spanned_pages(nid)	(NODE_DATA(nid)->node_spanned_pages)
> +#define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
> +				 NODE_DATA(nid)->node_spanned_pages)
> +
> +#endif /* CONFIG_NUMA */
> +
>   #endif /* _XEN_NUMA_H */
> 

Cheers,

-- 
Julien Grall

