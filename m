Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 896FF3F492A
	for <lists+xen-devel@lfdr.de>; Mon, 23 Aug 2021 12:59:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170362.311168 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI7fV-0001eg-0s; Mon, 23 Aug 2021 10:59:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170362.311168; Mon, 23 Aug 2021 10:59:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mI7fU-0001bR-Sq; Mon, 23 Aug 2021 10:59:04 +0000
Received: by outflank-mailman (input) for mailman id 170362;
 Mon, 23 Aug 2021 10:59:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mI7fT-0001bJ-38
 for xen-devel@lists.xenproject.org; Mon, 23 Aug 2021 10:59:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mI7fS-0000oM-TF; Mon, 23 Aug 2021 10:59:02 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mI7fS-0003PU-NH; Mon, 23 Aug 2021 10:59:02 +0000
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
	bh=/KEcFdc5cvYV1UT1YfQWjlYzy1YOIhtMsmcJlVGUk9k=; b=FmUjrkmB9vsk13uOxAu/MI68wW
	M/cDM+vEUT14LDi5T8m5RAUnSctMfRLopuF9MSH1SzJS5uhb8cusx1jo/xXze73pq3Ed6KjX/E7DQ
	6Cse8PQpDtlMWgaUu7/6k1eQltnpY2GXXxejaLy87kA1KelC9f4pSJ7eUSZ7nnrTZIJM=;
Subject: Re: [XEN RFC PATCH 22/40] xen/arm: introduce a helper to parse device
 tree processor node
To: Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
 <20210811102423.28908-23-wei.chen@arm.com>
 <167bbcea-e797-c924-81d9-20e626e320cb@xen.org>
 <DB9PR08MB6857D1E22305A7878103EBC99EC49@DB9PR08MB6857.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3b5d47cf-95c1-cb56-9246-57a94a6f9b1e@xen.org>
Date: Mon, 23 Aug 2021 11:59:00 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <DB9PR08MB6857D1E22305A7878103EBC99EC49@DB9PR08MB6857.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 23/08/2021 09:47, Wei Chen wrote:
> Hi Julien,

Hi Wei,

>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: 2021年8月20日 2:11
>> To: Wei Chen <Wei.Chen@arm.com>; xen-devel@lists.xenproject.org;
>> sstabellini@kernel.org; jbeulich@suse.com
>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
>> Subject: Re: [XEN RFC PATCH 22/40] xen/arm: introduce a helper to parse
>> device tree processor node
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
>>
>> I forgot to answer. It seems odd that some of the function names start
>> with dtb_* while other starts device_tree_*. Any particular reason for
>> that difference of naming?
>>
> 
> yes, in the very beginning, I want to keep device_tree_ prefix for
> functions that will handle dtb file. And use dtb_ prefix to replace
> acpi, to indicate, this function is device tree version numa implementation.

Thanks for the clarification. The difference between "dtb" and 
"device_tree" is quite subttle: the former refers to the binary while 
the latter refers to the format. Most of the readers are likely to infer 
they mean the same. So I think this will bring more confusion.

> 
> If that's not the right reason, I will unify all prefix to device_tree_
> in next version. How do you think about it?

AFAICT, your parsing functions will always start with 
"device_tree_parse_". I would prefer if the set replacing the ACPI 
helpers start with "device_tree_".

If you are concern with the length of the function name, then I would 
suggest to prefix all the functions with "fdt" (We are dealing with the 
flattened DT after all) or "dt".

Cheers,

-- 
Julien Grall

