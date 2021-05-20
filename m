Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 540FF38A037
	for <lists+xen-devel@lfdr.de>; Thu, 20 May 2021 10:51:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130735.244725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljeOF-0006vJ-Lh; Thu, 20 May 2021 08:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130735.244725; Thu, 20 May 2021 08:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljeOF-0006sa-IM; Thu, 20 May 2021 08:50:47 +0000
Received: by outflank-mailman (input) for mailman id 130735;
 Thu, 20 May 2021 08:50:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ljeOE-0006sD-Nj
 for xen-devel@lists.xenproject.org; Thu, 20 May 2021 08:50:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ljeOE-0004Rg-Ew; Thu, 20 May 2021 08:50:46 +0000
Received: from [54.239.6.190] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ljeOD-0008Gt-Uy; Thu, 20 May 2021 08:50:46 +0000
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
	bh=DNNHWBCG7jeUgPjiDjxAy0k0ewwcPFxvtSBYjBKt9FE=; b=z4/JiHT2UQQgABz3K0Bj5wGHlf
	BMHhaaAcUEB9VGHHUMrMFeoes4jx44cJVZg3TqijxLW+5d+NQ1uFFgW7/dQq7MLJj9NlQse4ZRo/6
	H2w/iWS7SV4jfLrer5wdH08jdkVsMLHa1OcamKPrc/yV23ogtwKYCdh0fEu0sG68llnY=;
Subject: Re: [PATCH 01/10] xen/arm: introduce domain on Static Allocation
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 nd <nd@arm.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-2-penny.zheng@arm.com>
 <e1b90f06-92d2-11da-c556-4081907124b8@xen.org>
 <VE1PR08MB521519C6F09E92EDB9C9A1AEF72B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <66e32065-ea2d-d000-1a70-e5598a182b6a@xen.org>
 <VE1PR08MB5215C1F5041860102BBAD595F72A9@VE1PR08MB5215.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <14fb6fe4-c293-6994-8cbc-872d3bd8a3ac@xen.org>
Date: Thu, 20 May 2021 09:50:42 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <VE1PR08MB5215C1F5041860102BBAD595F72A9@VE1PR08MB5215.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 20/05/2021 07:07, Penny Zheng wrote:
>>> It will be consistent with the ones defined in the parent node, domUx.
>> Hmmm... To take the example you provided, the parent would be chosen.
>> However, from the example, I would expect the property #{address, size}-cells
>> in domU1 to be used. What did I miss?
>>
> 
> Yeah, the property #{address, size}-cells in domU1 will be used. And the parent
> node will be domU1.

You may have misunderstood what I meant. "domU1" is the node that 
contains the property "xen,static-mem". The parent node would be the one 
above (in our case "chosen").

> 
> The dtb property should look like as follows:
> 
>          chosen {
>              domU1 {
>                  compatible = "xen,domain";
>                  #address-cells = <0x2>;
>                  #size-cells = <0x2>;
>                  cpus = <2>;
>                  xen,static-mem = <0x0 0x30000000 0x0 0x20000000>;
> 
>                  ...
>              };
>          };
> 
>>> +DOMU1 on Static Allocation has reserved RAM bank at 0x30000000 of 512MB size
> 
>>>>> +Static Allocation is only supported on AArch64 for now.
>>>>
>>>> The code doesn't seem to be AArch64 specific. So why can't this be
>>>> used for 32-bit Arm?
>>>>
>>>
>>> True, we have plans to make it also workable in AArch32 in the future.
>>> Because we considered XEN on cortex-R52.
>>
>> All the code seems to be implemented in arm generic code. So isn't it already
>> working?
>>
>>>>>     static int __init early_scan_node(const void *fdt,
>>>>>                                       int node, const char *name, int depth,
>>>>>                                       u32 address_cells, u32
>>>>> size_cells, @@ -345,6 +394,9 @@ static int __init early_scan_node(const
>> void *fdt,
>>>>>             process_multiboot_node(fdt, node, name, address_cells, size_cells);
>>>>>         else if ( depth == 1 && device_tree_node_matches(fdt, node,
>> "chosen") )
>>>>>             process_chosen_node(fdt, node, name, address_cells,
>>>>> size_cells);
>>>>> +    else if ( depth == 2 && fdt_get_property(fdt, node,
>>>>> + "xen,static-mem",
>>>> NULL) )
>>>>> +        process_static_memory(fdt, node, "xen,static-mem", address_cells,
>>>>> +                              size_cells, &bootinfo.static_mem);
>>>>
>>>> I am a bit concerned to add yet another method to parse the DT and
>>>> all the extra code it will add like in patch #2.
>>>>
>>>>    From the host PoV, they are memory reserved for a specific purpose.
>>>> Would it be possible to consider the reserve-memory binding for that
>>>> purpose? This will happen outside of chosen, but we could use a
>>>> phandle to refer the region.
>>>>
>>>
>>> Correct me if I understand wrongly, do you mean what this device tree
>> snippet looks like:
>>
>> Yes, this is what I had in mind. Although I have one small remark below.
>>
>>
>>> reserved-memory {
>>>      #address-cells = <2>;
>>>      #size-cells = <2>;
>>>      ranges;
>>>
>>>      static-mem-domU1: static-mem@0x30000000{
>>
>> I think the node would need to contain a compatible (name to be defined).
>>
> 
> Ok, maybe, hmmm, how about "xen,static-memory"?

I would possibly add "domain" in the name to make clear this is domain 
memory. Stefano, what do you think?

Cheers,

-- 
Julien Grall

