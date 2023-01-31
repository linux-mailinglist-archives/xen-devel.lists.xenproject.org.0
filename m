Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B596831F6
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 16:58:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487725.755406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMt0o-00036C-0T; Tue, 31 Jan 2023 15:57:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487725.755406; Tue, 31 Jan 2023 15:57:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMt0n-00032x-U0; Tue, 31 Jan 2023 15:57:33 +0000
Received: by outflank-mailman (input) for mailman id 487725;
 Tue, 31 Jan 2023 15:57:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pMt0m-00032r-No
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 15:57:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMt0m-0006cZ-E7; Tue, 31 Jan 2023 15:57:32 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[192.168.16.209]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMt0m-0002l5-8P; Tue, 31 Jan 2023 15:57:32 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=rPEg+q1CImV6M5e08dmVDYPpY7sP9dueIu/fKJCnZ2g=; b=YmUoXHJG23UKtB2naQ8TKFlO7e
	VyIjI5mx2bIlmhXsfTg/PSLNCZUWgotzTkm9Uwsk/CCBkXi9L6qUK89nXHvIqSGKKiH/9PLPAtT9c
	y4XU6c6Cw1WAbUU+5ujRMt0nyiFs2N0xWEJx351t7/pgLEBeSl9cia4E6whK7FFNoNG4=;
Message-ID: <d2185e4f-bf00-95a2-1c39-f91b9eddde99@xen.org>
Date: Tue, 31 Jan 2023 15:57:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [XEN v2 04/11] xen/arm: Typecast the DT values into paddr_t
Content-Language: en-US
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com>
 <20230117174358.15344-5-ayan.kumar.halder@amd.com>
 <alpine.DEB.2.22.394.2301191514240.731018@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2301191532370.731018@ubuntu-linux-20-04-desktop>
 <1a227f76-005d-0307-5161-2e8432171eb7@xen.org>
 <82e2a6ae-b941-6fa6-dd00-c2c36bd5e079@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <82e2a6ae-b941-6fa6-dd00-c2c36bd5e079@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ayan,

On 31/01/2023 10:51, Ayan Kumar Halder wrote:
> On 20/01/2023 10:16, Julien Grall wrote:
>>>> Last comment, maybe we could add fdt_get_mem_rsv_paddr to setup.h
>>>> instead of introducing xen/arch/arm/include/asm/device_tree.h, given
>>>> that we already have device tree definitions there
>>>> (device_tree_get_reg). I am OK either way.
>>>   Actually I noticed you also add dt_device_get_paddr to
>>> xen/arch/arm/include/asm/device_tree.h. So it sounds like it is a good
>>> idea to introduce xen/arch/arm/include/asm/device_tree.h, and we could
>>> also move the declarations of device_tree_get_reg, device_tree_get_u32
>>> there.
>>
>> None of the helpers you mention sounds arm specific. So why should the 
>> be move an arch specific headers?
> 
> The functions (fdt_get_mem_rsv_paddr(), device_tree_get_reg(), 
> device_tree_get_u32()) are currently used by Arm specific code only.
> 
> So, I thought of implementing fdt_get_mem_rsv_paddr() in 
> xen/arch/arm/include/asm/device_tree.h.
> 
> However, I see your point as well. So the alternative approach would be :-
> 
> Approach 1) Implement fdt_get_mem_rsv_paddr() in 
> ./xen/include/xen/libfdt/libfdt.h.
> 
> However libfdt is imported from external sources, so I am not sure if 
> this is the  best approach.

One way would be to introduce "libfdt_xen.h" which would contain all the 
implementation specific to Xen.

> 
> Approach 2) Rename fdt_get_mem_rsv_paddr() to dt_get_mem_rsv_paddr() and 
> implement it in ./xen/include/xen/device_tree.h.
> 
> However, this will be an odd one as it invokes fdt_get_mem_rsv() for 
> which we will have to include libfdt.h in device_tree.h.

You could implement the functions in the device_tree.c but see below.

> 
> 
> So, I am biased towards having xen/arch/arm/include/asm/device_tree.h in 
> which we can implement all the non-static fdt and dt functions (which 
> are required by xen/arch/arm/*).
> 
> And then (as Stefano suggested), we can move the definitions of the 
> following to xen/arch/arm/include/asm/device_tree.h.
> 
> device_tree_get_reg()
> 
> device_tree_get_u32()
> 
> device_tree_for_each_node()

Well none of them are truly arch specific as well. I could imagine 
RISC-v to use it in the future if they also care about checking the 
truncation.

I have a slight preference to introduce libfdt_xen.h over adding the 
implementation in device_tree.h so we can keep the unflatten API 
(device_tree.h) separated from the flatten API (libfdt.h).

But this is not a strong preference between the two. That said, I would 
strongly argue against adding the helper in asm/*.h because there is 
nothing Arm specific in them.

>>
>> [...]
>>
>>>>> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
>>>>> index 0085c28d74..f536a3f3ab 100644
>>>>> --- a/xen/arch/arm/bootfdt.c
>>>>> +++ b/xen/arch/arm/bootfdt.c
>>>>> @@ -11,9 +11,9 @@
>>>>>   #include <xen/efi.h>
>>>>>   #include <xen/device_tree.h>
>>>>>   #include <xen/lib.h>
>>>>> -#include <xen/libfdt/libfdt.h>
>>>>>   #include <xen/sort.h>
>>>>>   #include <xsm/xsm.h>
>>>>> +#include <asm/device_tree.h>
>>>>>   #include <asm/setup.h>
>>>>>     static bool __init device_tree_node_matches(const void *fdt, 
>>>>> int node,
>>>>> @@ -53,10 +53,15 @@ static bool __init 
>>>>> device_tree_node_compatible(const void *fdt, int node,
>>>>>   }
>>>>>     void __init device_tree_get_reg(const __be32 **cell, u32 
>>>>> address_cells,
>>>>> -                                u32 size_cells, u64 *start, u64 
>>>>> *size)
>>>>> +                                u32 size_cells, paddr_t *start, 
>>>>> paddr_t *size)
>>>>>   {
>>>>> -    *start = dt_next_cell(address_cells, cell);
>>>>> -    *size = dt_next_cell(size_cells, cell);
>>>>> +    /*
>>>>> +     * dt_next_cell will return u64 whereas paddr_t may be u64 or 
>>>>> u32. Thus, one
>>>>> +     * needs to cast paddr_t to u32. Note that we do not check for 
>>>>> truncation as
>>>>> +     * it is user's responsibility to provide the correct values 
>>>>> in the DT.
>>>>> +     */
>>>>> +    *start = (paddr_t) dt_next_cell(address_cells, cell);
>>>>> +    *size = (paddr_t) dt_next_cell(size_cells, cell);
>>
>> There is no need for explicit cast here.
> 
> Should we have it for the sake of documentation (that it casts u64 to 
> paddr_t) ?

You already have a comment on top of dt_next_cell() to explain the 
typecast. So I would rather not add the explicit casts.

Cheers,

-- 
Julien Grall

