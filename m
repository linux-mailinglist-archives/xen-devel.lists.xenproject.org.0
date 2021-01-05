Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B88DA2EAB03
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 13:41:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61890.109144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwleK-0005JV-9h; Tue, 05 Jan 2021 12:41:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61890.109144; Tue, 05 Jan 2021 12:41:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwleK-0005J5-6F; Tue, 05 Jan 2021 12:41:20 +0000
Received: by outflank-mailman (input) for mailman id 61890;
 Tue, 05 Jan 2021 12:41:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kwleI-0005Iz-Va
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 12:41:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kwleH-0000SV-NS; Tue, 05 Jan 2021 12:41:17 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kwleH-0006bR-CX; Tue, 05 Jan 2021 12:41:17 +0000
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
	bh=FRvx0OQKuotE2e/ScwltSojkBGQ0EHiNQ0rCuSGPtkM=; b=fVvBfSs9vnhoW8QK3UYs9bAyKI
	uaXlp2iVKNUg6jkIt0wqTltaqzf469vlQqstc4lkFU4JrlYjhgRmIBM2ysqFXNqhF0MsX8mnB+zmf
	KVmj4pIxKAJgoVht/PeTxMBi2DYD1x0OIzGvaVCwg9b6Yhq0ZJj0g19/tedBUELumvGs=;
Subject: Re: [RFC] design: design doc for 1:1 direct-map
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Kaly Xin <Kaly.Xin@arm.com>,
 Wei Chen <Wei.Chen@arm.com>, nd <nd@arm.com>, Paul Durrant <paul@xen.org>,
 "famzheng@amazon.com" <famzheng@amazon.com>
References: <20201208052113.1641514-1-penny.zheng@arm.com>
 <6731d0c1-37df-ade8-7b77-d1032c326111@xen.org>
 <VE1PR08MB52154F42074B1DB4F3BBFDADF7CB0@VE1PR08MB5215.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <038d4e0f-5854-5448-411a-17b053409d50@xen.org>
Date: Tue, 5 Jan 2021 12:41:15 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <VE1PR08MB52154F42074B1DB4F3BBFDADF7CB0@VE1PR08MB5215.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 10/12/2020 07:02, Penny Zheng wrote:
> Hi Julien

Hi Penny,

Apologies for the late answer.

> 
> Thanks for the nice and detailed comments. (*^▽^*)
> Here are the replies:
> 
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: Tuesday, December 8, 2020 5:07 PM
>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org;
>> sstabellini@kernel.org
>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>; Kaly Xin
>> <Kaly.Xin@arm.com>; Wei Chen <Wei.Chen@arm.com>; nd <nd@arm.com>;
>> Paul Durrant <paul@xen.org>; famzheng@amazon.com
>> Subject: Re: [RFC] design: design doc for 1:1 direct-map
>>
>> Hi Penny,
>>
>> I am adding Paul and Zheng in the thread as there are similar interest for the
>> x86 side.
>>
>> On 08/12/2020 05:21, Penny Zheng wrote:
>>> This is one draft design about the infrastructure for now, not ready
>>> for upstream yet (hence the RFC tag), thought it'd be useful to
>>> firstly start a discussion with the community.
>>>
>>> Create one design doc for 1:1 direct-map.
>>> It aims to describe why and how we allocate 1:1 direct-map(guest
>>> physical == physical) domains.
>>>
>>> This document is partly based on Stefano Stabellini's patch serie v1:
>>> [direct-map DomUs](
>>> https://lists.xenproject.org/archives/html/xen-devel/2020-
>> 04/msg00707.html).
>>
>> May I ask why a different approach?
> 
> In Stefano original design, he'd like to allocate 1:1 direct-map with user-defined
> memory regions and he prefers allocating it from sub-domain allocator.

I am not entirely sure what you are referring to with "sub-domain 
allocator".

> 
> And it brings quite a discussion there and in the last, everyone kinds of all
> agrees that it is not workable. Since if requested memory ever goes into any
> allocators, no matter boot, or sub-domain allocator, we could not ensure that
> before actually allocating it for one 1:1 direct-map domain, it will not be into
> any other use.

Yes, you cannot give the memory to the heap allocator and expect the 
region to always be free. However, you can mark them as reserve so the 
allocator doesn't touch it.

We (AWS) also needs to reserve memory for later use in the case of 
LiveUpdate. In our case, the memory already contain guest data, so it is 
not possible to give them to any allocator.

We solved it by excluding the page from any allocator and then marking 
then page as allocated/used when giving to the domain.

There are some corner cases unsolved when using NUMA. Aside that this 
work because the heap allocator don't keep a list of in-use pages.

> 
> So I'd prefer to split original design into two parts: one is here, that user only
> wants to allocate one 1:1 direct-map domain, not caring about where the ram
> will be located into. 

While I understand that a user may not care where the direct-map memory 
is allocated. However, I question the usefulness because:

1) This doesn't work with MPU
2) You may end up with provide the guest with many small regions if the 
guest is not created right after boot or rebooting.

Can you outline what would be your use case here?


> 
>>> +architecture.
>>> +
>>> +It aims to describe why and how the guest would be created as direct-map
>> domain.
>>> +
>>> +This document is partly based on Stefano Stabellini's patch serie v1:
>>> +[direct-map DomUs](
>>> +https://lists.xenproject.org/archives/html/xen-devel/2020-
>> 04/msg00707.html).
>>> +
>>> +This is a first draft and some questions are still unanswered. When
>>> +this is the case, the text shall contain XXX.
>>> +
>>> +# Introduction
>>> +
>>> +## Background
>>> +
>>> +Cases where domU needs direct-map memory map:
>>> +
>>> +  * IOMMU not present in the system.
>>> +  * IOMMU disabled, since it doesn't cover a specific device.
>>
>> If the device is not covered by the IOMMU, then why would you want to
>> disable the IOMMUs for the rest of the system?
>>
> 
> This is a mixed scenario. We pass some devices to VM with SMMU, and we
> pass other devices to VM without SMMU. We could not guarantee guest
> DMA security.

Not really, you can guarantee DMA security if devices not protected by 
an IOMMU are assigned to *trusted* domains.

> 
> So users may want to disable the SMMU, at least, they can gain some
> performance improvement from SMMU disabled.

That's an understandable argument. Yet, I think this only works if you 
trust *all* your domains. So a user may still want to keep IOMMU on when 
assigning devices (as long as they are protected by an IOMMU) to a 
non-trusted domain.

So I would suggest to rephrase your second bullet point with:

"IOMMU disabled if all the guests are trusted"

>>> +  * IOMMU disabled, since it doesn't have enough bandwidth.
>>
>> I am not sure to understand this one.
>>
> 
> In some SoC, there would be multiple devices connected to one SMMU.
> 
> In some extreme situation, multiple devices do DMA concurrency, The
> translation requests can exceed SMMU's translation capacity. This will
> cause DMA latency.

Ok. So either the SoC doesn't fit your use-case or the SoC was not 
correctly designed. Therefore, I would call that a workaround :). I 
would suggest to update the design doc with more information.

OOI, is it really necessary to turn off the IOMMU? Would it be possible 
to instead have a few devices by-passing the IOMMU when they are 
assigned to a trusted domain?

> 
>>> +  * IOMMU disabled, since it adds too much latency.
>>
>> The list above sounds like direct-map memory would be necessary even
>> without device-passthrough. Can you clarify it?
>>
> 
> Okay.
> 
> SMMU on different SoCs can be implemented differently. For example, some
> SoC vendor may remove the TLB inside SMMU.
> 
> In this case, the SMMU will add latency in DMA progress. Users may want to
> disable the SMMU for some Realtime scenarios.

Thanks for the explanation, however this wasn't my question. I was 
pointed out that your example gave the impression that domaion with not 
devices assigned would also need to be direct-mapped.

Could you confirm whether this is the intended purpose?

> 
>>> +
>>> +*WARNING:
>>> +Users should be careful that it is not always secure to assign a
>>> +device without
>>
>> s/careful/aware/ I think. Also, it is never secure to assign a device without
>> IOMMU/SMMU unless you have a replacement.
>>
>> I would suggest to reword it something like:
>>
>> "When the device is not protected by the IOMMU, the administrator should
>> make sure that:
>>      - The device is assigned to a trusted guest
>>      - You have an additional security mechanism on the platform (e.g
>> MPU) to protect the memory."
>>
> 
> Thanks for the rephrase. (*^▽^*)
> 
>>> +IOMMU/SMMU protection.
>>> +Users must be aware of this risk, that guests having access to
>>> +hardware with DMA capacity must be trusted, or it could use the DMA
>>> +engine to access any other memory area.
>>> +Guests could use additional security hardware component like NOC,
>>> +System MPU to protect the memory.
>>
>> What's the NOC?
>>
> 
> Network on Chip.
> 
> Some kind of SoC level firewall that limits the devices' DMA access range
> or CPU memory access range.

I would suggest to use the longer term or introduce an accronym section.

> 
>>> +
>>> +## Design
>>> +
>>> +The implementation may cover following aspects:
>>> +
>>> +### Native Address and IRQ numbers for GIC and UART(vPL011)
>>> +
>>> +Today, fixed addresses and IRQ numbers are used to map GIC and
>>> +UART(vPL011) in DomUs. And it may cause potential clash on direct-map
>> domains.
>>> +So, Using native addresses and irq numbers for GIC, UART(vPL011), in
>>> +direct-map domains is necessary.
>>> +e.g.
>>
>> To me e.g. means example. But below this is not an example, this is a
>> requirement in order to use the vpl011 on system without pl011 UART.
>>
> 
> Yes, right.
> I'll delete e.g. here
>   
>>> +For the virtual interrupt of vPL011: instead of always using
>>> +`GUEST_VPL011_SPI`, try to reuse the physical SPI number if possible.
>>
>> How would you find the following region for guest using PV drivers;
>>      - Event channel interrupt
>>      - Grant table area
>>
> Good catch! thousand thx. 😉
>   
> We've done some investigation on this part. Correct me if I am wrong.
> 
> Pages like shared_info, grant table, etc, shared between guests and
> xen, are mapped by ARM guests using the hypercall HYPERVISOR_memory_op
> and always would not be directly mapped, even in dom0.

Any memory shared with Xen (e.g grant table, shared info) should never 
be used for DMA. So I don't think you need to directly mapped them.

In the case of shared memory between guest, I would suggest to look at 
what we do in dom0 for dealing with DMA on "foreign" pages.

> 
> So, here, we suggest that maybe we could do some modification in the hypercall
> to let it not only pass gfn to xen, but also receive already allocated mfns(e.g. grant
> tables) from xen in direct map situation.

Regardless the modification required in Linux, all the memory hypercalls 
are part of the stable ABI. So any change should be carefully though to 
avoid breaking backward compatibility.

However, I don't think you any to modify any of the hypercalls today 
(see above).

> But If so, it involves modification in linux, o(╥﹏╥)o.
> 
> And also we incline to keep all guest related pages(including ram,  grant tables,
> etc) in one whole piece.

Do you mean physically contiguous in the host memory? If so, I am not 
sure this can be achieved when letting the Xen chosing the placement and 
having a good success rate.

> 
> Right now, pages like grant tables are allocated separately in Xen heap, so don't
> stand much chance to be consistent with the guest ram.

I don't quite understand why you need that consistency. In fact, Dom0 is 
direct mapped and we are able to have multiple memory ranges and all the 
shared memory not direct mapped.

[...]

> 
>>> +following:
>>> +
>>> +    fdt set /chosen/domU1 direct-map
>>> +
>>> +Users could also use `xl` to create direct-map domains, just use the
>>> +following config option: `direct-map=true`
>>> +
>>> +### direct-map guest memory allocation
>>> +
>>> +Func `allocate_memory_direct_map` is based on `allocate_memory_11`,
>>> +and shall be refined to allocate memory for all direct-map domains,
>> including DOM0.
>>> +Roughly speaking, firstly, it tries to allocate arbitrary memory
>>> +chunk of requested size from domain
>>> +sub-allocator(`alloc_domheap_pages`). If fail, split the chunk into
>>> +halves, and re-try, until it succeed or bail out with the smallest chunk size.
>>
>> If you have a mix of domain with direct-mapped and normal domain, you
>> may end up to have the memory so small that your direct-mapped domain
>> will have many small banks. This is going to be a major problem if you are
>> creating the domain at runtime (you suggest xl can be used).
>>
>> In addition, some users may want to be able to control the location of the
>> memory as this reduced the amount of work in the guest (e.g you don't have
>> to dynamically discover the memory).
>>
>> I think it would be best to always require the admin to select the RAM bank
>> used by a direct mapped domain. Alternatively, we could have a pool of
>> memory that can only be used for direct mapped domain. This should limit
>> the fragmentation of the memory.
>>
> 
> Yep, in some cases, if we have mix of domains with direct-mapped with
> user- defined memory regions (scattering loosely)and normal domains at
> the beginning, it may fail when we later creating the domain at runtime (use
> xl), no matter direct-map domain or not.

It is not only about creating a new domain. It is also rebooting a 
running domain.

In the reboot case, you may be able to re-allocate the memory but this 
will more by luck than anything else.

> 
> But, users should be free to allocate where they want, we may not limit a
> pool of memory to use.

Right, the memory pool is to try to limit the risk when the user decides 
to let Xen chosing where the memory is allocated.

Cheers,

-- 
Julien Grall

