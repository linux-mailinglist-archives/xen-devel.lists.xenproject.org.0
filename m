Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EEE3F75DA
	for <lists+xen-devel@lfdr.de>; Wed, 25 Aug 2021 15:27:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172311.314314 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIsvY-0008EF-Mc; Wed, 25 Aug 2021 13:26:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172311.314314; Wed, 25 Aug 2021 13:26:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIsvY-0008CU-JU; Wed, 25 Aug 2021 13:26:48 +0000
Received: by outflank-mailman (input) for mailman id 172311;
 Wed, 25 Aug 2021 13:26:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mIsvX-0008CO-Ae
 for xen-devel@lists.xenproject.org; Wed, 25 Aug 2021 13:26:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIsvX-0005lW-6w; Wed, 25 Aug 2021 13:26:47 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mIsvX-0002Ii-1d; Wed, 25 Aug 2021 13:26:47 +0000
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
	bh=a8ky96G2QUwuIv2T7FkIlpAzHRBVQsby+vW5SEXet7Q=; b=O+1OIrZ7+hY0yq4VdF/qtK8Rqp
	PDi5BFqlpN5y2IruGhShgEWtgweGTD9p+3aXeeuonwPzMswugksWQUAfDo3R5NNtzEnr8grUQm7c0
	utuu6OI5GhghvBx+yE8MVgv9jp7Ted5aBngvhuUIvqcHGlrvGo8c98RFlAqccqOVEaQo=;
Subject: Re: [XEN RFC PATCH 12/40] xen/x86: Move numa_initmem_init to common
To: Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-13-wei.chen@arm.com>
 <8c2daae2-df32-14ad-8f08-27fec30cf9b9@xen.org>
 <DB9PR08MB685735416FFC85344717DF2D9EC69@DB9PR08MB6857.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b5b32a29-0cfe-53fa-4f43-9c8455719acc@xen.org>
Date: Wed, 25 Aug 2021 14:26:45 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <DB9PR08MB685735416FFC85344717DF2D9EC69@DB9PR08MB6857.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 25/08/2021 12:15, Wei Chen wrote:
> Hi Julien,

Hi Wei,

>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: 2021年8月25日 18:22
>> To: Wei Chen <Wei.Chen@arm.com>; xen-devel@lists.xenproject.org;
>> sstabellini@kernel.org; jbeulich@suse.com
>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
>> Subject: Re: [XEN RFC PATCH 12/40] xen/x86: Move numa_initmem_init to
>> common
>>
>> Hi Wei,
>>
>> On 11/08/2021 11:23, Wei Chen wrote:
>>> This function can be reused by Arm device tree based
>>> NUMA support. So we move it from x86 to common, as well
>>> as its related variables and functions:
>>> setup_node_bootmem, numa_init_array and numa_emulation.
>>>
>>> As numa_initmem_init has been moved to common, _memnodemap
>>> is not used cross files. We can restore _memnodemap to
>>> static.
>>
>> As we discussed on a previous patch, we should try to avoid this kind of
>> dance. I can help to find a split that would achieve that.
>>
> 
> Yes, thanks!
> 
>>>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>> ---
>>>    xen/arch/x86/numa.c         | 118 ----------------------------------
>>>    xen/common/numa.c           | 122 +++++++++++++++++++++++++++++++++++-
>>>    xen/include/asm-x86/numa.h  |   5 --
>>>    xen/include/asm-x86/setup.h |   1 -
>>>    xen/include/xen/numa.h      |   8 ++-
>>>    5 files changed, 128 insertions(+), 126 deletions(-)
>>>
>>> diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
>>> index f2626b3968..6908738305 100644
>>> --- a/xen/arch/x86/numa.c
>>> +++ b/xen/arch/x86/numa.c
>>> @@ -38,7 +38,6 @@ nodeid_t apicid_to_node[MAX_LOCAL_APIC] = {
>>>
>>>    nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
>>>
>>> -bool numa_off;
>>>    s8 acpi_numa = 0;
>>>
>>>    int srat_disabled(void)
>>> @@ -46,123 +45,6 @@ int srat_disabled(void)
>>>        return numa_off || acpi_numa < 0;
>>>    }
>>>
>>> -/* initialize NODE_DATA given nodeid and start/end */
>>> -void __init setup_node_bootmem(nodeid_t nodeid, u64 start, u64 end)
>>> -{
>>> -    unsigned long start_pfn, end_pfn;
>>> -
>>> -    start_pfn = start >> PAGE_SHIFT;
>>> -    end_pfn = end >> PAGE_SHIFT;
>>> -
>>> -    NODE_DATA(nodeid)->node_start_pfn = start_pfn;
>>> -    NODE_DATA(nodeid)->node_spanned_pages = end_pfn - start_pfn;
>>> -
>>> -    node_set_online(nodeid);
>>> -}
>>> -
>>> -void __init numa_init_array(void)
>>> -{
>>> -    int rr, i;
>>> -
>>> -    /* There are unfortunately some poorly designed mainboards around
>>> -       that only connect memory to a single CPU. This breaks the 1:1
>> cpu->node
>>> -       mapping. To avoid this fill in the mapping for all possible
>>> -       CPUs, as the number of CPUs is not known yet.
>>> -       We round robin the existing nodes. */
>>> -    rr = first_node(node_online_map);
>>> -    for ( i = 0; i < nr_cpu_ids; i++ )
>>> -    {
>>> -        if ( cpu_to_node[i] != NUMA_NO_NODE )
>>> -            continue;
>>> -        numa_set_node(i, rr);
>>> -        rr = cycle_node(rr, node_online_map);
>>> -    }
>>> -}
>>> -
>>> -#ifdef CONFIG_NUMA_EMU
>>> -static int numa_fake __initdata = 0;
>>> -
>>> -/* Numa emulation */
>>> -static int __init numa_emulation(u64 start_pfn, u64 end_pfn)
>>> -{
>>> -    int i;
>>> -    struct node nodes[MAX_NUMNODES];
>>> -    u64 sz = ((end_pfn - start_pfn)<<PAGE_SHIFT) / numa_fake;
>>> -
>>> -    /* Kludge needed for the hash function */
>>> -    if ( hweight64(sz) > 1 )
>>> -    {
>>> -        u64 x = 1;
>>> -        while ( (x << 1) < sz )
>>> -            x <<= 1;
>>> -        if ( x < sz/2 )
>>> -            printk(KERN_ERR "Numa emulation unbalanced. Complain to
>> maintainer\n");
>>> -        sz = x;
>>> -    }
>>> -
>>> -    memset(&nodes,0,sizeof(nodes));
>>> -    for ( i = 0; i < numa_fake; i++ )
>>> -    {
>>> -        nodes[i].start = (start_pfn<<PAGE_SHIFT) + i*sz;
>>> -        if ( i == numa_fake - 1 )
>>> -            sz = (end_pfn<<PAGE_SHIFT) - nodes[i].start;
>>> -        nodes[i].end = nodes[i].start + sz;
>>> -        printk(KERN_INFO "Faking node %d at %"PRIx64"-%"PRIx64"
>> (%"PRIu64"MB)\n",
>>> -               i,
>>> -               nodes[i].start, nodes[i].end,
>>> -               (nodes[i].end - nodes[i].start) >> 20);
>>> -        node_set_online(i);
>>> -    }
>>> -    memnode_shift = compute_hash_shift(nodes, numa_fake, NULL);
>>> -    if ( memnode_shift < 0 )
>>> -    {
>>> -        memnode_shift = 0;
>>> -        printk(KERN_ERR "No NUMA hash function found. Emulation
>> disabled.\n");
>>> -        return -1;
>>> -    }
>>> -    for_each_online_node ( i )
>>> -        setup_node_bootmem(i, nodes[i].start, nodes[i].end);
>>> -    numa_init_array();
>>> -
>>> -    return 0;
>>> -}
>>> -#endif
>>> -
>>> -void __init numa_initmem_init(unsigned long start_pfn, unsigned long
>> end_pfn)
>>> -{
>>> -    int i;
>>> -
>>> -#ifdef CONFIG_NUMA_EMU
>>> -    if ( numa_fake && !numa_emulation(start_pfn, end_pfn) )
>>> -        return;
>>> -#endif
>>> -
>>> -#ifdef CONFIG_ACPI_NUMA
>>> -    if ( !numa_off && !acpi_scan_nodes((u64)start_pfn << PAGE_SHIFT,
>>> -         (u64)end_pfn << PAGE_SHIFT) )
>>> -        return;
>>> -#endif
>>> -
>>> -    printk(KERN_INFO "%s\n",
>>> -           numa_off ? "NUMA turned off" : "No NUMA configuration
>> found");
>>> -
>>> -    printk(KERN_INFO "Faking a node at %016"PRIx64"-%016"PRIx64"\n",
>>> -           (u64)start_pfn << PAGE_SHIFT,
>>> -           (u64)end_pfn << PAGE_SHIFT);
>>> -    /* setup dummy node covering all memory */
>>> -    memnode_shift = BITS_PER_LONG - 1;
>>> -    memnodemap = _memnodemap;
>>> -    memnodemapsize = ARRAY_SIZE(_memnodemap);
>>> -
>>> -    nodes_clear(node_online_map);
>>> -    node_set_online(0);
>>> -    for ( i = 0; i < nr_cpu_ids; i++ )
>>> -        numa_set_node(i, 0);
>>> -    cpumask_copy(&node_to_cpumask[0], cpumask_of(0));
>>> -    setup_node_bootmem(0, (u64)start_pfn << PAGE_SHIFT,
>>> -                    (u64)end_pfn << PAGE_SHIFT);
>>> -}
>>> -
>>>    void numa_set_node(int cpu, nodeid_t node)
>>>    {
>>>        cpu_to_node[cpu] = node;
>>> diff --git a/xen/common/numa.c b/xen/common/numa.c
>>> index 1facc8fe2b..26c0006d04 100644
>>> --- a/xen/common/numa.c
>>> +++ b/xen/common/numa.c
>>> @@ -14,12 +14,13 @@
>>>    #include <xen/smp.h>
>>>    #include <xen/pfn.h>
>>>    #include <xen/sched.h>
>>
>> NIT: We tend to add a newline betwen <xen/...> headers and <asm/...>
>> headers.
>>
> 
> got it
> 
>>> +#include <asm/acpi.h>
>>>
>>>    struct node_data node_data[MAX_NUMNODES];
>>>
>>>    /* Mapping from pdx to node id */
>>>    int memnode_shift;
>>> -typeof(*memnodemap) _memnodemap[64];
>>> +static typeof(*memnodemap) _memnodemap[64];
>>>    unsigned long memnodemapsize;
>>>    u8 *memnodemap;
>>>
>>> @@ -34,6 +35,8 @@ int num_node_memblks;
>>>    struct node node_memblk_range[NR_NODE_MEMBLKS];
>>>    nodeid_t memblk_nodeid[NR_NODE_MEMBLKS];
>>>
>>> +bool numa_off;
>>> +
>>>    /*
>>>     * Given a shift value, try to populate memnodemap[]
>>>     * Returns :
>>> @@ -191,3 +194,120 @@ void numa_add_cpu(int cpu)
>>>    {
>>>        cpumask_set_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
>>>    }
>>> +
>>> +/* initialize NODE_DATA given nodeid and start/end */
>>> +void __init setup_node_bootmem(nodeid_t nodeid, u64 start, u64 end)
>>
>>   From an abstract PoV, start and end should be paddr_t. This should be
>> done on a separate patch though.
>>
> 
> Ok.
> 
>>> +{
>>> +    unsigned long start_pfn, end_pfn;
>>> +
>>> +    start_pfn = start >> PAGE_SHIFT;
>>> +    end_pfn = end >> PAGE_SHIFT;
>>> +
>>> +    NODE_DATA(nodeid)->node_start_pfn = start_pfn;
>>> +    NODE_DATA(nodeid)->node_spanned_pages = end_pfn - start_pfn;
>>> +
>>> +    node_set_online(nodeid);
>>> +}
>>> +
>>> +void __init numa_init_array(void)
>>> +{
>>> +    int rr, i;
>>> +
>>> +    /* There are unfortunately some poorly designed mainboards around
>>> +       that only connect memory to a single CPU. This breaks the 1:1
>> cpu->node
>>> +       mapping. To avoid this fill in the mapping for all possible
>>> +       CPUs, as the number of CPUs is not known yet.
>>> +       We round robin the existing nodes. */
>>> +    rr = first_node(node_online_map);
>>> +    for ( i = 0; i < nr_cpu_ids; i++ )
>>> +    {
>>> +        if ( cpu_to_node[i] != NUMA_NO_NODE )
>>> +            continue;
>>> +        numa_set_node(i, rr);
>>> +        rr = cycle_node(rr, node_online_map);
>>> +    }
>>> +}
>>> +
>>> +#ifdef CONFIG_NUMA_EMU
>>> +int numa_fake __initdata = 0;
>>> +
>>> +/* Numa emulation */
>>> +static int __init numa_emulation(u64 start_pfn, u64 end_pfn)
>>
>> Here, this should be either "unsigned long" or ideally "mfn_t".
>> Although, if you use "unsigned long", you will need to...
>>
> 
> Do we need a separate patch to do it?

I would prefer if the cleanups are done separately as this makes easier 
to review code movement.

> 
>>> +{
>>> +    int i;
>>> +    struct node nodes[MAX_NUMNODES];
>>> +    u64 sz = ((end_pfn - start_pfn)<<PAGE_SHIFT) / numa_fake;
>>
>> ... cast "(end_pfn - start_pfn)" to uin64_t or use pfn_to_paddr().
>>
> 
> Ok
> 
>>> +
>>> +    /* Kludge needed for the hash function */
>>> +    if ( hweight64(sz) > 1 )
>>> +    {
>>> +        u64 x = 1;
>>> +        while ( (x << 1) < sz )
>>> +            x <<= 1;
>>> +        if ( x < sz/2 )
>>> +            printk(KERN_ERR "Numa emulation unbalanced. Complain to
>> maintainer\n");
>>> +        sz = x;
>>> +    }
>>> +
>>> +    memset(&nodes,0,sizeof(nodes));
>>> +    for ( i = 0; i < numa_fake; i++ )
>>> +    {
>>> +        nodes[i].start = (start_pfn<<PAGE_SHIFT) + i*sz;
>>> +        if ( i == numa_fake - 1 )
>>> +            sz = (end_pfn<<PAGE_SHIFT) - nodes[i].start;
>>> +        nodes[i].end = nodes[i].start + sz;
>>> +        printk(KERN_INFO "Faking node %d at %"PRIx64"-%"PRIx64"
>> (%"PRIu64"MB)\n",
>>> +               i,
>>> +               nodes[i].start, nodes[i].end,
>>> +               (nodes[i].end - nodes[i].start) >> 20);
>>> +        node_set_online(i);
>>> +    }
>>> +    memnode_shift = compute_hash_shift(nodes, numa_fake, NULL);
>>> +    if ( memnode_shift < 0 )
>>> +    {
>>> +        memnode_shift = 0;
>>> +        printk(KERN_ERR "No NUMA hash function found. Emulation
>> disabled.\n");
>>> +        return -1;
>>> +    }
>>> +    for_each_online_node ( i )
>>> +        setup_node_bootmem(i, nodes[i].start, nodes[i].end);
>>> +    numa_init_array();
>>> +
>>> +    return 0;
>>> +}
>>> +#endif
>>> +
>>> +void __init numa_initmem_init(unsigned long start_pfn, unsigned long
>> end_pfn)
>>> +{
>>> +    int i;
>>> +
>>> +#ifdef CONFIG_NUMA_EMU
>>> +    if ( numa_fake && !numa_emulation(start_pfn, end_pfn) )
>>> +        return;
>>> +#endif
>>> +
>>> +#ifdef CONFIG_ACPI_NUMA
>>> +    if ( !numa_off && !acpi_scan_nodes((u64)start_pfn << PAGE_SHIFT,
>>> +         (u64)end_pfn << PAGE_SHIFT) )
>>
>> (u64)v << PAGE_SHIFT should be switched to use pfn_to_paddr() or
>> mfn_to_paddr() if you decide to make start_pfn and end_pfn typesafe.
>>
> 
> Still need a separate patch to change it before move?

Yes.

Cheers,

-- 
Julien Grall

