Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC3F3F289F
	for <lists+xen-devel@lfdr.de>; Fri, 20 Aug 2021 10:44:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.169333.309298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH08W-0007a0-5C; Fri, 20 Aug 2021 08:44:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 169333.309298; Fri, 20 Aug 2021 08:44:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mH08W-0007Wy-1N; Fri, 20 Aug 2021 08:44:24 +0000
Received: by outflank-mailman (input) for mailman id 169333;
 Fri, 20 Aug 2021 08:44:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mH08U-0007Ws-SE
 for xen-devel@lists.xenproject.org; Fri, 20 Aug 2021 08:44:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mH08T-0005qx-Tr; Fri, 20 Aug 2021 08:44:21 +0000
Received: from [54.239.6.184] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mH08T-0002oY-O7; Fri, 20 Aug 2021 08:44:21 +0000
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
	bh=DtPwRcEZ/aM5yJ/Y/W3ruWx1Xb7pA5ZdSgCqTjlA0xs=; b=AeyT1DMy0Qzk2lZCeQItkP0X5d
	3qcQSy4CVzdEesF7JmPQmth4webN3KY1Nf3iTIEVY05frjR8+qHrHYSBGvgNYynJE9mETpN7rsIvj
	DMHPeA7Z1t8JrDjhNHCDM4fj0GFplwLzbnHuHAP4cojB21OqnTfgB3RC9blrlqIHwb14=;
Subject: Re: [XEN RFC PATCH 22/40] xen/arm: introduce a helper to parse device
 tree processor node
To: Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "jbeulich@suse.com" <jbeulich@suse.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-23-wei.chen@arm.com>
 <b52884fd-da4b-f09c-8ed9-cefd7c5b6e97@xen.org>
 <DB9PR08MB6857105F17F529CCD54D83E89EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <317048b1-adfd-d537-aff4-4018e50f348a@xen.org>
Date: Fri, 20 Aug 2021 09:44:20 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <DB9PR08MB6857105F17F529CCD54D83E89EC19@DB9PR08MB6857.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 20/08/2021 03:23, Wei Chen wrote:
> Hi Julien,

Hi Wei,

>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: 2021年8月20日 2:13
>> To: Wei Chen <Wei.Chen@arm.com>; xen-devel@lists.xenproject.org;
>> sstabellini@kernel.org; jbeulich@suse.com
>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
>> Subject: Re: [XEN RFC PATCH 22/40] xen/arm: introduce a helper to parse
>> device tree processor node
>>
>> Hi Wei,
>>
>> On 11/08/2021 11:24, Wei Chen wrote:
>>> Processor NUMA ID information is stored in device tree's processor
>>> node as "numa-node-id". We need a new helper to parse this ID from
>>> processor node. If we get this ID from processor node, this ID's
>>> validity still need to be checked. Once we got a invalid NUMA ID
>>> from any processor node, the device tree will be marked as NUMA
>>> information invalid.
>>>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>> ---
>>>    xen/arch/arm/numa_device_tree.c | 41 +++++++++++++++++++++++++++++++--
>>>    1 file changed, 39 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/numa_device_tree.c
>> b/xen/arch/arm/numa_device_tree.c
>>> index 1c74ad135d..37cc56acf3 100644
>>> --- a/xen/arch/arm/numa_device_tree.c
>>> +++ b/xen/arch/arm/numa_device_tree.c
>>> @@ -20,16 +20,53 @@
>>>    #include <xen/init.h>
>>>    #include <xen/nodemask.h>
>>>    #include <xen/numa.h>
>>> +#include <xen/device_tree.h>
>>
>> Nothing in this file seems to depend on xen/device_tree.h. So why do you
>> need to include it?
>>
> 
> I remember that without this header file, device_tree_get_u32 in this patch
> will cause compiling failed.

I looked at the prototype of device_tree_get_u32() and I can't find how 
it depends on bits from device_tree.h. Can you paste the compilation error?

> 
>>> +#include <asm/setup.h>
>>>
>>>    s8 device_tree_numa = 0;
>>> +static nodemask_t processor_nodes_parsed __initdata;
>>>
>>> -int srat_disabled(void)
>>> +static int srat_disabled(void)
>>>    {
>>>        return numa_off || device_tree_numa < 0;
>>>    }
>>>
>>> -void __init bad_srat(void)
>>> +static __init void bad_srat(void)
>>>    {
>>>        printk(KERN_ERR "DT: NUMA information is not used.\n");
>>>        device_tree_numa = -1;
>>>    }
>>> +
>>> +/* Callback for device tree processor affinity */
>>> +static int __init dtb_numa_processor_affinity_init(nodeid_t node)
>>> +{
>>> +    if ( srat_disabled() )
>>> +        return -EINVAL;
>>> +    else if ( node == NUMA_NO_NODE || node >= MAX_NUMNODES ) {
>>> +		bad_srat();
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +    node_set(node, processor_nodes_parsed);
>>> +
>>> +    device_tree_numa = 1;
>>> +    printk(KERN_INFO "DT: NUMA node %u processor parsed\n", node);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +/* Parse CPU NUMA node info */
>>> +int __init device_tree_parse_numa_cpu_node(const void *fdt, int node)
>>> +{
>>> +    uint32_t nid;
>>> +
>>> +    nid = device_tree_get_u32(fdt, node, "numa-node-id", MAX_NUMNODES);
>>> +    printk(XENLOG_WARNING "CPU on NUMA node:%u\n", nid);
>>> +    if ( nid >= MAX_NUMNODES )
>>> +    {
>>> +        printk(XENLOG_WARNING "Node id %u exceeds maximum value\n",
>> nid);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    return dtb_numa_processor_affinity_init(nid);
>>> +}
>>>
>>
>> --
>> Julien Grall

Cheers,

-- 
Julien Grall

