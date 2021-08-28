Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 457503FA500
	for <lists+xen-devel@lfdr.de>; Sat, 28 Aug 2021 12:34:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.174263.317879 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJvee-0004lj-18; Sat, 28 Aug 2021 10:33:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 174263.317879; Sat, 28 Aug 2021 10:33:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJved-0004jg-T7; Sat, 28 Aug 2021 10:33:39 +0000
Received: by outflank-mailman (input) for mailman id 174263;
 Sat, 28 Aug 2021 10:33:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mJvec-0004jZ-GM
 for xen-devel@lists.xenproject.org; Sat, 28 Aug 2021 10:33:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mJvec-0003k4-2r; Sat, 28 Aug 2021 10:33:38 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mJveb-00026H-Tf; Sat, 28 Aug 2021 10:33:38 +0000
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
	bh=OvnXD787QaqF5LWmlc3wy1WC+FC9EsJYDxD8ixB5Vj8=; b=YxiDO9154MsgNMhftcMREk8YcN
	pEUmrQcTdOTW8NMsddvbQdQEriOT7SO2AB6ECrP0aGAeEDAxZCp/D+OdsKEWjemuBqkgUNQ9WaKW9
	A0eeAJ7MkXtPwAKRa7qTyMDqOQXUlAmU7r51V7xkyxyj6Oc6rmaT6cmYmBAgDRPP1QxQ=;
Subject: Re: [XEN RFC PATCH 23/40] xen/arm: introduce a helper to parse device
 tree memory node
To: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Jan Beulich <jbeulich@suse.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-24-wei.chen@arm.com>
 <alpine.DEB.2.21.2108271757250.17851@sstabellini-ThinkPad-T480s>
 <DB9PR08MB6857618112DC045293A449699EC99@DB9PR08MB6857.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <5c9a196a-8ac3-1173-f402-01d99ccc23e4@xen.org>
Date: Sat, 28 Aug 2021 11:33:35 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <DB9PR08MB6857618112DC045293A449699EC99@DB9PR08MB6857.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Wei,

On 28/08/2021 04:56, Wei Chen wrote:
>> -----Original Message-----
>> From: Stefano Stabellini <sstabellini@kernel.org>
>> Sent: 2021Äê8ÔÂ28ÈÕ 9:06
>> To: Wei Chen <Wei.Chen@arm.com>
>> Cc: xen-devel@lists.xenproject.org; sstabellini@kernel.org; julien@xen.org;
>> jbeulich@suse.com; Bertrand Marquis <Bertrand.Marquis@arm.com>
>> Subject: Re: [XEN RFC PATCH 23/40] xen/arm: introduce a helper to parse
>> device tree memory node
>>
>> On Wed, 11 Aug 2021, Wei Chen wrote:
>>> Memory blocks' NUMA ID information is stored in device tree's
>>> memory nodes as "numa-node-id". We need a new helper to parse
>>> and verify this ID from memory nodes.
>>>
>>> In order to support memory affinity in later use, the valid
>>> memory ranges and NUMA ID will be saved to tables.
>>>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>> ---
>>>   xen/arch/arm/numa_device_tree.c | 130 ++++++++++++++++++++++++++++++++
>>>   1 file changed, 130 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/numa_device_tree.c
>> b/xen/arch/arm/numa_device_tree.c
>>> index 37cc56acf3..bbe081dcd1 100644
>>> --- a/xen/arch/arm/numa_device_tree.c
>>> +++ b/xen/arch/arm/numa_device_tree.c
>>> @@ -20,11 +20,13 @@
>>>   #include <xen/init.h>
>>>   #include <xen/nodemask.h>
>>>   #include <xen/numa.h>
>>> +#include <xen/libfdt/libfdt.h>
>>>   #include <xen/device_tree.h>
>>>   #include <asm/setup.h>
>>>
>>>   s8 device_tree_numa = 0;
>>>   static nodemask_t processor_nodes_parsed __initdata;
>>> +static nodemask_t memory_nodes_parsed __initdata;
>>>
>>>   static int srat_disabled(void)
>>>   {
>>> @@ -55,6 +57,79 @@ static int __init
>> dtb_numa_processor_affinity_init(nodeid_t node)
>>>       return 0;
>>>   }
>>>
>>> +/* Callback for parsing of the memory regions affinity */
>>> +static int __init dtb_numa_memory_affinity_init(nodeid_t node,
>>> +                                paddr_t start, paddr_t size)
>>> +{
>>> +    struct node *nd;
>>> +    paddr_t end;
>>> +    int i;
>>> +
>>> +    if ( srat_disabled() )
>>> +        return -EINVAL;
>>> +
>>> +    end = start + size;
>>> +    if ( num_node_memblks >= NR_NODE_MEMBLKS )
>>> +    {
>>> +        dprintk(XENLOG_WARNING,
>>> +                "Too many numa entry, try bigger NR_NODE_MEMBLKS \n");
>>> +        bad_srat();
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    /* It is fine to add this area to the nodes data it will be used
>> later */
>>> +    i = conflicting_memblks(start, end);
>>> +    /* No conflicting memory block, we can save it for later usage */;
>>> +    if ( i < 0 )
>>> +        goto save_memblk;
>>> +
>>> +    if ( memblk_nodeid[i] == node ) {
>>> +        /*
>>> +         * Overlaps with other memblk in the same node, warning here.
>>> +         * This memblk will be merged with conflicted memblk later.
>>> +         */
>>> +        printk(XENLOG_WARNING
>>> +               "DT: NUMA NODE %u (%"PRIx64
>>> +               "-%"PRIx64") overlaps with itself (%"PRIx64"-
>> %"PRIx64")\n",
>>> +               node, start, end,
>>> +               node_memblk_range[i].start, node_memblk_range[i].end);
>>> +    } else {
>>> +        /*
>>> +         * Conflict with memblk in other node, this is an error.
>>> +         * The NUMA information is invalid, NUMA will be turn off.
>>> +         */
>>> +        printk(XENLOG_ERR
>>> +               "DT: NUMA NODE %u (%"PRIx64"-%"
>>> +               PRIx64") overlaps with NODE %u (%"PRIx64"-%"PRIx64")\n",
>>> +               node, start, end, memblk_nodeid[i],
>>> +               node_memblk_range[i].start, node_memblk_range[i].end);
>>> +        bad_srat();
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +save_memblk:
>>> +    nd = &nodes[node];
>>> +    if ( !node_test_and_set(node, memory_nodes_parsed) ) {
>>> +        nd->start = start;
>>> +        nd->end = end;
>>> +    } else {
>>> +        if ( start < nd->start )
>>> +            nd->start = start;
>>> +        if ( nd->end < end )
>>> +            nd->end = end;
>>> +    }
>>> +
>>> +    printk(XENLOG_INFO "DT: NUMA node %u %"PRIx64"-%"PRIx64"\n",
>>> +           node, start, end);
>>> +
>>> +    node_memblk_range[num_node_memblks].start = start;
>>> +    node_memblk_range[num_node_memblks].end = end;
>>> +    memblk_nodeid[num_node_memblks] = node;
>>> +    num_node_memblks++;
>>
>>
>> Is it possible to have non-contigous ranges of memory for a single NUMA
>> node?
>>
>> Looking at the DT bindings and Linux implementation, it seems possible.
>> Here, it seems that node_memblk_range/memblk_nodeid could handle it,
>> but nodes couldn't.
> 
> Yes, you're right. I copied this code for x86 ACPI NUMA. Does ACPI allow
> non-contiguous ranges of memory for a single NUMA node too? 

I couldn't find any restriction for ACPI. Although, I only briefly 
looked at the spec.

> If yes, I think
> this will affect x86 ACPI NUMA too. In next version, we plan to merge
> dtb_numa_memory_affinity_init and acpi_numa_memory_affinity_init into a
> neutral function. So we can fix them at the same time.
> 
> If not, maybe we have to keep the diversity for dtb and ACPI here.

I am not entirely sure what you mean. Are you saying if ACPI doesn't 
allow non-contiguous ranges of memory, then we should keep the 
implementation separated?

If so, then I disagree with that. It is fine to have code that supports 
more than what a firmware table supports. The main benefit is less code 
and therefore less long term maintenance (with the current solution we 
would need to check both the ACPI and DT implementation if there is a 
bug in one).

Cheers,

-- 
Julien Grall

