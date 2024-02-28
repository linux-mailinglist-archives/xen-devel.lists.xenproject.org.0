Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 004D186AF24
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 13:27:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686565.1068757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfJ1h-0003LN-39; Wed, 28 Feb 2024 12:27:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686565.1068757; Wed, 28 Feb 2024 12:27:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfJ1g-0003Io-W0; Wed, 28 Feb 2024 12:27:08 +0000
Received: by outflank-mailman (input) for mailman id 686565;
 Wed, 28 Feb 2024 12:27:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rfJ1f-0003IO-3y
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 12:27:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rfJ1e-0001ox-Fy; Wed, 28 Feb 2024 12:27:06 +0000
Received: from [15.248.2.225] (helo=[10.45.19.69])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rfJ1e-0001F1-7r; Wed, 28 Feb 2024 12:27:06 +0000
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
	bh=JJthXOk0MMslCQCxJJh8RnkNyO9qWm5ioQIP1MDFZdk=; b=qex29y0Uezi09O5zsyFn+4Ytzb
	XvKePckSIDQgEiDcuxzFhKNUuRYpHLJp2kECyJ51gAOeXx4px0bwV4oMv32+8U/M1amRYWEoT3mCF
	d6BvgOnLdDlfQZ3TbS0+ni9kx1QHCCjnnWfXJDfNuUej7Pfs622TasqVbG8aHsaC4JCg=;
Message-ID: <98739f8d-dc00-4db8-a0b2-07f054107acf@xen.org>
Date: Wed, 28 Feb 2024 12:27:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/common: Do not allocate magic pages 1:1 for direct
 mapped domains
Content-Language: en-GB
To: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alec Kwapis <alec.kwapis@medtronic.com>
References: <20240226011935.169462-1-xin.wang2@amd.com>
 <d1518124-483c-4409-9b36-6a3392378911@xen.org>
 <a84aeb87-17e8-4195-90cb-7b0123064106@amd.com>
 <3982ba47-6709-47e3-a9c2-e2d3b4a2d8e3@xen.org>
 <8e56b75d-10a2-4764-8244-3e596f9fc695@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <8e56b75d-10a2-4764-8244-3e596f9fc695@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 28/02/2024 11:53, Henry Wang wrote:
> On 2/28/2024 6:35 PM, Julien Grall wrote:
>> Hi Henry,
>>>>>
>>>>> Force populate_physmap to take the "normal" memory allocation route 
>>>>> for
>>>>> the magic pages even for 1:1 Dom0less DomUs. This should work as long
>>>>> as the 1:1 Dom0less DomU doesn't have anything else mapped at the same
>>>>> guest address as the magic pages:
>>>>> - gfn 0x39000 address 0x39000000
>>>>> - gfn 0x39001 address 0x39001000
>>>>> - gfn 0x39002 address 0x39002000
>>>>> - gfn 0x39003 address 0x39003000
>>>>
>>>> This is very fragile. You are making the assumption that the magic 
>>>> pages are not clashing with any RAM region. The layout defined in 
>>>> arch-arm.h has been designed for guest where Xen is in full control 
>>>> of the layout. This is not the case for directmapped domain. I don't 
>>>> think it is correct to try to re-use part of the layout.
>>>
>>> Apologies for the (a bit) late reply, it took a bit longer for me to 
>>> understand the story about directmap stuff, and yes, now I agree with 
>>> you, for those directmapped domains we should not reuse the guest 
>>> layout directly.
>>>
>>>> If you want to use 1:1 dom0less with xenstore & co, then you should 
>>>> find a different place in memory for the magic pages (TDB how to 
>>>> find that area). 
>>>
>>> Yes, and maybe we can use similar strategy in 
>>> find_unallocated_memory() or find_domU_holes() to do that.
>>>
>>>> You will still have the problem of the 1:1 allocation, but I think 
>>>> this could be solved bty adding a flag to force a non-1:1 allocation.
>>>
>>> After checking the code flow, below rough plan came to my mind, I 
>>> think what we need to do is:
>>>
>>> (1) Find a range of un-used memory using similar method in 
>>> find_unallocated_memory()/find_domU_holes()
>>
>> AFAIK, the toolstack doesn't have any knowledge of the memeory layout 
>> for dom0less domUs today. We would need to expose it first.
> 
> If I understand correctly, I think the issue you mentioned here and ...
> 
>> Then the region could either be statically allocated (i.e. the admin 
>> provides it in the DTB) or dynamically.
>>
>>> (2) Change the base address, i.e. GUEST_MAGIC_BASE in alloc_xs_page() 
>>> in init-dom0less.c to point to the address in (1) if static mem or 11 
>>> directmap. (I think this is a bit tricky though, do you have any 
>>> method that in your mind?)
>>
>> AFAIK, the toolstack doesn't know whether a domain is direct mapped or 
>> using static mem.
> 
> ...here basically means we want to do the finding of the unused region 
> in toolstack. Since currently what we care about is only a couple of 
> pages instead of the whole memory map, could it be possible that we do 
> the opposite: in alloc_xs_page(), we issue a domctl hypercall to Xen and 
> do the finding work in Xen and return with the found gfn? Then the page 
> can be mapped by populate_physmap() from alloc_xs_page() and used for 
> XenStore.

I know that DOMCTL hypercalls are not stable. But I am not overly happy 
with creating an hypercall which is just "fetch the magic regions". I 
think it need to be a more general one that would expose all the regions.

Also, you can't really find the magic regions when the hypercall is done 
as we don't have the guest memory layout. This will need to be done in 
advance.

Overall, I think it would be better if we provide an hypercall listing 
the regions currently occupied (similar to e820). One will have the type 
"magic pages".

> 
> If above approach makes sense to you, I have a further question: Since I 
> understand that the extended region is basically for safely foreign 
> mapping pages

This is not about safety. The extended region is optional. It was 
introduced so it is easy for Linux to find an unallocated region to map 
external pages (e.g. vCPU shared info) so it doesn't waste RAM pages.

, and init_dom0less.c uses foreign memory map for this
> XenStore page, 
> should we find the wanted page in the extended region? or 
> even extended region should be excluded?

How is the extended region found for dom0less domUs today? It would be 
fine to steal some part of the extended regions for the magic pages. But 
they would need to be reserved *before* the guest is first unpaused.

>> I think this ties with what I just wrote above. For dom0less domUs, we 
>> probably want Xen to prepare a memory layout (similar to the e820) 
>> that will then be retrieved by the toolstack.
>>
>>>
>>> (3) Use a flag or combination of existing flags (CDF_staticmem + 
>>> CDF_directmap) in populate_physmap() to force the allocation of these 
>>> magic pages using alloc_domheap_pages() - i.e. the "else" condition 
>>> in the bottom
>>
>> If I am not mistaken, CDF_* are per-domain. So we would want to use 
>> MEMF_*.
> 
> Ah yes you are correct, I indeed missed MEMF_*
> 
>>>> Also, why are you only checking the first GFN? What if the caller 
>>>> pass an overlapped region?
>>>
>>> I am a bit confused. My understanding is at this point we are 
>>> handling one page at a time.
>>
>> We are handling one "extent" at the time. This could be one or 
>> multiple pages (see extent_order).
> 
> I agree, sorry I didn't express myself well. For this specific XenStore 
> page, I think the extent_order is
> fixed as 0 so there is only 1 page.

Correct. But you should not rely on this :).

Cheers,

-- 
Julien Grall

