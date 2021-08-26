Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD8E3F83B1
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 10:22:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172797.315311 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJAe7-0006c1-C2; Thu, 26 Aug 2021 08:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172797.315311; Thu, 26 Aug 2021 08:21:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJAe7-0006ZG-8r; Thu, 26 Aug 2021 08:21:59 +0000
Received: by outflank-mailman (input) for mailman id 172797;
 Thu, 26 Aug 2021 08:21:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mJAe5-0006ZA-4z
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 08:21:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mJAe5-0000hb-12; Thu, 26 Aug 2021 08:21:57 +0000
Received: from [54.239.6.184] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mJAe4-00074y-Qv; Thu, 26 Aug 2021 08:21:56 +0000
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
	bh=YzTXhZn3+L2X4zBxVXePhmnsRG0PIh7iJBF5AU9SlMk=; b=ts44RbItZd4z56n0x4me2tSLf+
	tOoJSE2B7HmGhT7yyBvyWnmQMS81+nZP9q81duwJ+jrD5rGOcsHjOHi6XGMWV+BMhAqBsesPhLjpw
	FIQhFKbQbQZnLPNZ2PAggr5OoOnAVLAmoyR/oWZsJ6g92s+Imoten189X2vRZQTMeZtc=;
Subject: Re: [XEN RFC PATCH 23/40] xen/arm: introduce a helper to parse device
 tree memory node
To: Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-24-wei.chen@arm.com>
 <4bd56df9-f95b-eb19-dbbc-d12b4f7b0668@xen.org>
 <DB9PR08MB6857604B3D4B690F2B8832BD9EC79@DB9PR08MB6857.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <61189a13-31a5-b75d-f9b5-97f379dfcd99@xen.org>
Date: Thu, 26 Aug 2021 09:21:54 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <DB9PR08MB6857604B3D4B690F2B8832BD9EC79@DB9PR08MB6857.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 26/08/2021 07:35, Wei Chen wrote:
> Hi Julien,

Hi Wei,

>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: 2021年8月25日 21:49
>> To: Wei Chen <Wei.Chen@arm.com>; xen-devel@lists.xenproject.org;
>> sstabellini@kernel.org; jbeulich@suse.com
>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
>> Subject: Re: [XEN RFC PATCH 23/40] xen/arm: introduce a helper to parse
>> device tree memory node
>>
>> Hi Wei,
>>
>> On 11/08/2021 11:24, Wei Chen wrote:
>>> Memory blocks' NUMA ID information is stored in device tree's
>>> memory nodes as "numa-node-id". We need a new helper to parse
>>> and verify this ID from memory nodes.
>>>
>>> In order to support memory affinity in later use, the valid
>>> memory ranges and NUMA ID will be saved to tables.
>>>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>> ---
>>>    xen/arch/arm/numa_device_tree.c | 130 ++++++++++++++++++++++++++++++++
>>>    1 file changed, 130 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/numa_device_tree.c
>> b/xen/arch/arm/numa_device_tree.c
>>> index 37cc56acf3..bbe081dcd1 100644
>>> --- a/xen/arch/arm/numa_device_tree.c
>>> +++ b/xen/arch/arm/numa_device_tree.c
>>> @@ -20,11 +20,13 @@
>>>    #include <xen/init.h>
>>>    #include <xen/nodemask.h>
>>>    #include <xen/numa.h>
>>> +#include <xen/libfdt/libfdt.h>
>>>    #include <xen/device_tree.h>
>>>    #include <asm/setup.h>
>>>
>>>    s8 device_tree_numa = 0;
>>>    static nodemask_t processor_nodes_parsed __initdata;
>>> +static nodemask_t memory_nodes_parsed __initdata;
>>>
>>>    static int srat_disabled(void)
>>>    {
>>> @@ -55,6 +57,79 @@ static int __init
>> dtb_numa_processor_affinity_init(nodeid_t node)
>>>        return 0;
>>>    }
>>>
>>> +/* Callback for parsing of the memory regions affinity */
>>> +static int __init dtb_numa_memory_affinity_init(nodeid_t node,
>>> +                                paddr_t start, paddr_t size)
>>> +{
>>
>> The implementation of this function is quite similar ot the ACPI
>> version. Can this be abstracted?
> 
> In my draft, I had tried to merge ACPI and DTB versions in one
> function. I introduced a number of "if else" to distinguish ACPI
> from DTB, especially ACPI hotplug. The function seems very messy.
> Not enough benefits to make up for the mess, so I gave up.

It think you can get away from distinguishing between ACPI and DT in 
that helper:
   * ma->flags & ACPI_SRAT_MEM_HOTPLUGGABLE could be replace by an 
argument indicating whether the region is hotpluggable (this would 
always be false for DT)
   * Access to memblk_hotplug can be stubbed (in the future we may want 
to consider memory hotplug even on Arm).

Do you still have the "if else" version? If so can you post it?

Cheers,

-- 
Julien Grall

