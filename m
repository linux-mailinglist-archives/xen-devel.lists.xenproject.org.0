Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E12B389548
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 20:28:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130296.244148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljQum-0004CS-OC; Wed, 19 May 2021 18:27:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130296.244148; Wed, 19 May 2021 18:27:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljQum-0004Ab-Kk; Wed, 19 May 2021 18:27:28 +0000
Received: by outflank-mailman (input) for mailman id 130296;
 Wed, 19 May 2021 18:27:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ljQul-0004AV-4X
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 18:27:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ljQuk-00083q-TW; Wed, 19 May 2021 18:27:26 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ljQuk-0003jx-No; Wed, 19 May 2021 18:27:26 +0000
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
	bh=KER7IdtF5PMSqwmGU0+kGoiqT5QVxY45ekVVsbNdjFg=; b=hVF9SPrGXSwlG94RVrR0JYMuIx
	HkOO7Ukl+hqMol4V8AwZVITnsmCAL2Il1TTc+92+kvm+J1+YTE75/mw4de/gLmLERao3py5h1JRWx
	f15p1jLlL0l7ul/12dLb6l8NHzxr+TkAEhaBA1tiyDqQQk4sSn4EgIuMt9f5aSd3okVY=;
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
From: Julien Grall <julien@xen.org>
Message-ID: <66e32065-ea2d-d000-1a70-e5598a182b6a@xen.org>
Date: Wed, 19 May 2021 19:27:24 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <VE1PR08MB521519C6F09E92EDB9C9A1AEF72B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 19/05/2021 03:22, Penny Zheng wrote:
> Hi Julien

Hi Penny,

>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: Tuesday, May 18, 2021 4:58 PM
>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org;
>> sstabellini@kernel.org
>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>; Wei Chen
>> <Wei.Chen@arm.com>; nd <nd@arm.com>
>> Subject: Re: [PATCH 01/10] xen/arm: introduce domain on Static Allocation
>>> +beginning, shall never go to heap allocator or boot allocator for any use.
>>> +
>>> +Domains on Static Allocation is supported through device tree
>>> +property `xen,static-mem` specifying reserved RAM banks as this domain's
>> guest RAM.
>>
>> I would suggest to use "physical RAM" when you refer to the host memory.
>>
>>> +By default, they shall be mapped to the fixed guest RAM address
>>> +`GUEST_RAM0_BASE`, `GUEST_RAM1_BASE`.
>>
>> There are a few bits that needs to clarified or part of the description:
>>     1) "By default" suggests there is an alternative possibility.
>> However, I don't see any.
>>     2) Will the first region of xen,static-mem be mapped to GUEST_RAM0_BASE
>> and the second to GUEST_RAM1_BASE? What if a third region is specificed?
>>     3) We don't guarantee the base address and the size of the banks.
>> Wouldn't it be better to let the admin select the region he/she wants?
>>     4) How do you determine the number of cells for the address and the size?
>>
> 
> The specific implementation on this part could be traced to the last commit
> https://patchew.org/Xen/20210518052113.725808-1-penny.zheng@arm.com/20210518052113.725808-11-penny.zheng@arm.com/

Right. My point is an admin should not have to read the code in order to 
figure out how the allocation works.

> 
> It will exhaust the GUEST_RAM0_SIZE, then seek to the GUEST_RAM1_BASE.
> GUEST_RAM0 may take up several regions.

Can this be clarified in the commit message.

> Yes, I may add the 1:1 direct-map scenario here to explain the alternative possibility

Ok. So I would suggest to remove "by default" until the implementation 
for direct-map is added.

> For the third point, are you suggesting that we could provide an option that let user
> also define guest memory base address/size?

When reading the document, I originally thought that the first region 
would be mapped to bank1, and then the second region mapped to bank2...

But from your reply, this is not the expected behavior. Therefore, 
please ignore my suggestion here.

> I'm confused on the fourth point, you mean the address cell and size cell for xen,static-mem = <...>?

Yes. This should be clarified in the document. See more below why?

> It will be consistent with the ones defined in the parent node, domUx.
Hmmm... To take the example you provided, the parent would be chosen. 
However, from the example, I would expect the property #{address, 
size}-cells in domU1 to be used. What did I miss?

>>> +Static Allocation is only supported on AArch64 for now.
>>
>> The code doesn't seem to be AArch64 specific. So why can't this be used for
>> 32-bit Arm?
>>
> 
> True, we have plans to make it also workable in AArch32 in the future.
> Because we considered XEN on cortex-R52.

All the code seems to be implemented in arm generic code. So isn't it 
already working?

>>>    static int __init early_scan_node(const void *fdt,
>>>                                      int node, const char *name, int depth,
>>>                                      u32 address_cells, u32 size_cells,
>>> @@ -345,6 +394,9 @@ static int __init early_scan_node(const void *fdt,
>>>            process_multiboot_node(fdt, node, name, address_cells, size_cells);
>>>        else if ( depth == 1 && device_tree_node_matches(fdt, node, "chosen") )
>>>            process_chosen_node(fdt, node, name, address_cells,
>>> size_cells);
>>> +    else if ( depth == 2 && fdt_get_property(fdt, node, "xen,static-mem",
>> NULL) )
>>> +        process_static_memory(fdt, node, "xen,static-mem", address_cells,
>>> +                              size_cells, &bootinfo.static_mem);
>>
>> I am a bit concerned to add yet another method to parse the DT and all the
>> extra code it will add like in patch #2.
>>
>>   From the host PoV, they are memory reserved for a specific purpose.
>> Would it be possible to consider the reserve-memory binding for that
>> purpose? This will happen outside of chosen, but we could use a phandle to
>> refer the region.
>>
> 
> Correct me if I understand wrongly, do you mean what this device tree snippet looks like:

Yes, this is what I had in mind. Although I have one small remark below.


> reserved-memory {
>     #address-cells = <2>;
>     #size-cells = <2>;
>     ranges;
>   
>     static-mem-domU1: static-mem@0x30000000{

I think the node would need to contain a compatible (name to be defined).

>        reg = <0x0 0x30000000 0x0 0x20000000>;
>     };
> };
> 
> Chosen {
>   ...
> domU1 {
>     xen,static-mem = <&static-mem-domU1>;
> };
> ...
> };
> 
>>>
>>>        if ( rc < 0 )
>>>            printk("fdt: node `%s': parsing failed\n", name); diff --git
>>> a/xen/include/asm-arm/setup.h b/xen/include/asm-arm/setup.h index
>>> 5283244015..5e9f296760 100644
>>> --- a/xen/include/asm-arm/setup.h
>>> +++ b/xen/include/asm-arm/setup.h
>>> @@ -74,6 +74,8 @@ struct bootinfo {
>>>    #ifdef CONFIG_ACPI
>>>        struct meminfo acpi;
>>>    #endif
>>> +    /* Static Memory */
>>> +    struct meminfo static_mem;
>>>    };
>>>
>>>    extern struct bootinfo bootinfo;
>>>
>>
>> Cheers,
>>
>> --
>> Julien Grall

Cheers,

-- 
Julien Grall

