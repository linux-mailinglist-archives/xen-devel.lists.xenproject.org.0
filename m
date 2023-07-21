Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E00775D0F0
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 19:52:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567690.887071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMuIK-0003Ww-JG; Fri, 21 Jul 2023 17:52:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567690.887071; Fri, 21 Jul 2023 17:52:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMuIK-0003Up-GA; Fri, 21 Jul 2023 17:52:00 +0000
Received: by outflank-mailman (input) for mailman id 567690;
 Fri, 21 Jul 2023 17:51:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qMuII-0003Ui-OW
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 17:51:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qMuII-0004bo-3b; Fri, 21 Jul 2023 17:51:58 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.21.208]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qMuIH-0000OO-Sv; Fri, 21 Jul 2023 17:51:58 +0000
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
	bh=LbccA50Lk8y09gyB+P5mO7OcxQiFFgZAoZDoVsizGqk=; b=KvdGSPPPpfalf49lzCrUFeRSuT
	TG3j/SRMfb2C7X0yPFyHX2vqesIoOS1sqABuWOzJn0+Z3eTvk8HPQrHFn99lK8QsZkuLPjpQbjs3A
	v0py2TerY6D1NzRXM7uD7dZDkt5szxtz2a/wooSdBy0Wz+5/V2USZZwYJLkFF5JFrBqs=;
Message-ID: <45dd3176-6354-dfbb-a072-c2b9aaa3d0b8@xen.org>
Date: Fri, 21 Jul 2023 18:51:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [PATCH 2/8] arm/mm: Document the differences between arm32 and
 arm64 directmaps
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230717160318.2113-1-alejandro.vallejo@cloud.com>
 <20230717160318.2113-3-alejandro.vallejo@cloud.com>
 <437849e6-08a3-8fac-a594-2003d5b94b41@xen.org>
 <64ba9f91.170a0220.bad4d.8728@mx.google.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <64ba9f91.170a0220.bad4d.8728@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alejandro,

On 21/07/2023 16:09, Alejandro Vallejo wrote:
> On Thu, Jul 20, 2023 at 09:05:55PM +0100, Julien Grall wrote:
>> Hi Alejandro,
>>
>> On 17/07/2023 17:03, Alejandro Vallejo wrote:
>>> arm32 merely covers the XENHEAP, whereas arm64 currently covers anything in
>>> the frame table. These comments highlight why arm32 doesn't need to account for PDX
>>> compression in its __va() implementation while arm64 does.
>>>
>>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>>> ---
>>>    xen/arch/arm/include/asm/mm.h | 27 +++++++++++++++++++++++++++
>>>    1 file changed, 27 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
>>> index 4262165ce2..1a83f41879 100644
>>> --- a/xen/arch/arm/include/asm/mm.h
>>> +++ b/xen/arch/arm/include/asm/mm.h
>>> @@ -280,6 +280,19 @@ static inline paddr_t __virt_to_maddr(vaddr_t va)
>>>    #define virt_to_maddr(va)   __virt_to_maddr((vaddr_t)(va))
>>>    #ifdef CONFIG_ARM_32
>>> +/**
>>> + * Find the virtual address corresponding to a machine address
>>> + *
>>> + * Only memory backing the XENHEAP has a corresponding virtual address to
>>> + * be found. This is so we can save precious virtual space, as it's in
>>> + * short supply on arm32. This mapping is not subject to PDX compression
>>> + * because XENHEAP is known to be physically contiguous and can't hence
>>> + * jump over the PDX hole. This means we can avoid the roundtrips
>>> + * converting to/from pdx.
>>> + *
>>> + * @param ma Machine address
>>> + * @return Virtual address mapped to `ma`
>>> + */
>>>    static inline void *maddr_to_virt(paddr_t ma)
>>>    {
>>>        ASSERT(is_xen_heap_mfn(maddr_to_mfn(ma)));
>>> @@ -287,6 +300,20 @@ static inline void *maddr_to_virt(paddr_t ma)
>>>        return (void *)(unsigned long) ma + XENHEAP_VIRT_START;
>>>    }
>>>    #else
>>> +/**
>>> + * Find the virtual address corresponding to a machine address
>>> + *
>>> + * The directmap covers all conventional memory accesible by the
>>> + * hypervisor. This means it's subject to PDX compression.
>>> + *
>>> + * More specifically to arm64, the directmap mappings start at the first
>>> + * GiB boundary containing valid RAM. This means there's an extra offset
>>> + * applied (directmap_base_pdx) on top of the regular PDX compression
>>> + * logic.
>>
>> I find this paragraph a bit confusing to read because it leads to think that
>> pdx_to_maddr(directmap_base_pdx) will return a GiB aligned address.
>>
>> The base PDX corresponds to the start of the first region and the only
>> requirement is it should be page-aligned. However, when mapping in the
>> virtual address space we also offset the start to ensure that superpage can
>> be used (this is where the GiB alignment is used).
>>
>> That's why XENHEAP_VIRT_START points to directmap_virt_start rather than
>> DIRECTMAP_VIRT_START. I think it would make sense to have the logic
>> following what you suggest as it would remove a memory read. But I would
>> understand if you don't want to take that extra work. :)
>>
>> So for now, I would suggest to remove "GiB boundary containing".
>>
>> Cheers,
>>
>> -- 
>> Julien Grall
> Just to make sure it's the wording and not my understanding at fault
> (definitely having DIRECTMAP_VIRT_START != directmap_virt_start doesn't do
> any favours cognitive load).

I take your point. This was recently renamed from xenheap_virt_start to 
directmap_virt_start after the static heap work.

Looking through the code, I think we probably can remove 
directmap_virt_start as, for arm64, it is only used indirectly (via 
XEN_HEAP_VIRT_START) in the virt_to_page() and maddr_to_virt().

This would remove one memory load in the two functions.

>  > /GiB boundary
> |
> |   /offset=address of 1st region of RAM % 1GiB
> |   |
> |---------|
> V         V
> --------------------------------------------------------------------------
> | padding |                           directmap                | padding |
> --------------------------------------------------------------------------
> ^         ^
> |         |
> |         \directmap_virt_start=pdx[directmap_base_pdx]
> |
> \DIRECTMAP_VIRT_START

The drawing is correct.

> 
> In actual words, I considered DIRECTMAP_VIRT_START the beginning of the
> directmap, not directmap_virt_start.

This is where we disagreed on the definition :). Definitely something 
that needs to be documented or removed (see below).

> 
> If this is it, you probably want to document somewhere what's what. In
> particular, you want a big scary message in DIRECTMAP_VIRT_START stating
> that it merely delimits the virtual range where the directmap can be, not
> where the directmap is, with a "See directmap_virt_start for the address
> where the directmap actually starts" message attached.

The uppercase only difference would probably still be confusing. I am 
thinking to remove directmap_virt_start completely because the directmap 
has already hole and we should consider the initial padding as  a hole.

Let me have a look.

> 
> With that considered I'm happy to amend as you suggested on v2.
> 
> IMO, the ARM port should not keep that base pdx variable around, but
> integrate it in the pdx logic, so the first valid address always
> corresponds to pdx[0]. Then given a pdx it's immediate to find frame table
> entries and directmap frames. It would also greatly simplify the definition
> of a pdx.

That's a good idea. However, I don't think I will have the bandwidth to 
look at hacking the PDX code in the near future. Although, I would be 
happy to review patches if someone want to tackle the problem.

Cheers,

-- 
Julien Grall

