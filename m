Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD2C86AC43
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 11:36:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686460.1068529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfHHr-000102-6a; Wed, 28 Feb 2024 10:35:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686460.1068529; Wed, 28 Feb 2024 10:35:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfHHr-0000wn-2t; Wed, 28 Feb 2024 10:35:43 +0000
Received: by outflank-mailman (input) for mailman id 686460;
 Wed, 28 Feb 2024 10:35:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rfHHp-0000wf-GG
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 10:35:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rfHHo-0008Co-Rr; Wed, 28 Feb 2024 10:35:40 +0000
Received: from [15.248.2.225] (helo=[10.45.19.69])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rfHHo-0003U9-JW; Wed, 28 Feb 2024 10:35:40 +0000
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
	bh=VblhwjmdAP0Edj1ztR7piXC5kmWcaYAOHgs0OAj9eVA=; b=f0o4rKtK1rZf+PBT9lWhR422v1
	vKR4w9J+HZd55IIkq8roGPY/MYIOTqSbGeIiGAcG5AVDEVfb5YYR+QEKEIWLBdarEb11PsWSpbzKF
	5IH+X9bKbFpwU/J++pI/OIumDUQ12oEBPm/iZTeY4LX/8pBKkjeZwe86XdE7AF64Ep+g=;
Message-ID: <3982ba47-6709-47e3-a9c2-e2d3b4a2d8e3@xen.org>
Date: Wed, 28 Feb 2024 10:35:37 +0000
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <a84aeb87-17e8-4195-90cb-7b0123064106@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Henry,

On 27/02/2024 13:17, Henry Wang wrote:
> (-RISC-V and PPC people to avoid spamming their inbox as this is quite 
> Arm specific)
> 
> Hi Julien,
> 
> On 2/26/2024 5:13 PM, Julien Grall wrote:
>> Hi Henry,
>>
>> Welcome back!
> 
> Thanks!
> 
>> On 26/02/2024 01:19, Henry Wang wrote:
>>> An error message can seen from the init-dom0less application on
>>> direct-mapped 1:1 domains:
>>> ```
>>> Allocating magic pages
>>> memory.c:238:d0v0 mfn 0x39000 doesn't belong to d1
>>> Error on alloc magic pages
>>> ```
>>>
>>> This is because populate_physmap() automatically assumes gfn == mfn
>>> for direct mapped domains. This cannot be true for the magic pages
>>> that are allocated later for Dom0less DomUs from the init-dom0less
>>> helper application executed in Dom0.
>>>
>>> Force populate_physmap to take the "normal" memory allocation route for
>>> the magic pages even for 1:1 Dom0less DomUs. This should work as long
>>> as the 1:1 Dom0less DomU doesn't have anything else mapped at the same
>>> guest address as the magic pages:
>>> - gfn 0x39000 address 0x39000000
>>> - gfn 0x39001 address 0x39001000
>>> - gfn 0x39002 address 0x39002000
>>> - gfn 0x39003 address 0x39003000
>>
>> This is very fragile. You are making the assumption that the magic 
>> pages are not clashing with any RAM region. The layout defined in 
>> arch-arm.h has been designed for guest where Xen is in full control of 
>> the layout. This is not the case for directmapped domain. I don't 
>> think it is correct to try to re-use part of the layout.
> 
> Apologies for the (a bit) late reply, it took a bit longer for me to 
> understand the story about directmap stuff, and yes, now I agree with 
> you, for those directmapped domains we should not reuse the guest layout 
> directly.
> 
>> If you want to use 1:1 dom0less with xenstore & co, then you should 
>> find a different place in memory for the magic pages (TDB how to find 
>> that area). 
> 
> Yes, and maybe we can use similar strategy in find_unallocated_memory() 
> or find_domU_holes() to do that.
> 
>> You will still have the problem of the 1:1 allocation, but I think 
>> this could be solved bty adding a flag to force a non-1:1 allocation.
> 
> After checking the code flow, below rough plan came to my mind, I think 
> what we need to do is:
> 
> (1) Find a range of un-used memory using similar method in 
> find_unallocated_memory()/find_domU_holes()

AFAIK, the toolstack doesn't have any knowledge of the memeory layout 
for dom0less domUs today. We would need to expose it first.

Then the region could either be statically allocated (i.e. the admin 
provides it in the DTB) or dynamically.

> 
> (2) Change the base address, i.e. GUEST_MAGIC_BASE in alloc_xs_page() in 
> init-dom0less.c to point to the address in (1) if static mem or 11 
> directmap. (I think this is a bit tricky though, do you have any method 
> that in your mind?)

AFAIK, the toolstack doesn't know whether a domain is direct mapped or 
using static mem.

I think this ties with what I just wrote above. For dom0less domUs, we 
probably want Xen to prepare a memory layout (similar to the e820) that 
will then be retrieved by the toolstack.

> 
> (3) Use a flag or combination of existing flags (CDF_staticmem + 
> CDF_directmap) in populate_physmap() to force the allocation of these 
> magic pages using alloc_domheap_pages() - i.e. the "else" condition in 
> the bottom

If I am not mistaken, CDF_* are per-domain. So we would want to use MEMF_*.

>>> +
>>>   #endif /* __ASM_X86_MM_H__ */
>>> diff --git a/xen/common/memory.c b/xen/common/memory.c
>>> index b3b05c2ec0..ab4bad79e2 100644
>>> --- a/xen/common/memory.c
>>> +++ b/xen/common/memory.c
>>> @@ -219,7 +219,7 @@ static void populate_physmap(struct memop_args *a)
>>>           }
>>>           else
>>>           {
>>> -            if ( is_domain_direct_mapped(d) )
>>> +            if ( is_domain_direct_mapped(d) && !is_magic_gpfn(gpfn) )
>>
>> This path will also be reached by dom0. Effectively, this will prevent 
>> dom0 to allocate the memory 1:1 for the magic GPFN (which is guest 
>> specific).
> 
> I think above proposal will solve this issue.
> 
>> Also, why are you only checking the first GFN? What if the caller pass 
>> an overlapped region?
> 
> I am a bit confused. My understanding is at this point we are handling 
> one page at a time.

We are handling one "extent" at the time. This could be one or multiple 
pages (see extent_order).

Cheers,

-- 
Julien Grall

