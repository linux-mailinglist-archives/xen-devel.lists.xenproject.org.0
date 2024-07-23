Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2056693A75B
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 20:45:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763497.1173763 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWKUs-0003Gz-8t; Tue, 23 Jul 2024 18:44:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763497.1173763; Tue, 23 Jul 2024 18:44:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWKUs-0003FT-5x; Tue, 23 Jul 2024 18:44:26 +0000
Received: by outflank-mailman (input) for mailman id 763497;
 Tue, 23 Jul 2024 18:44:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sWKUq-0003FN-6s
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 18:44:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sWKUn-000595-LQ; Tue, 23 Jul 2024 18:44:21 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sWKUn-0007tP-Ae; Tue, 23 Jul 2024 18:44:21 +0000
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
	bh=BXZ3YblqffrrkRkXgpBfetobeWGI6CKRopZIjzbFiCY=; b=wTltopu8CnJZ9NVOIXt0lDgzID
	mIi7pQ76ndG1xaeFrPUJGmbNh9RQMTesL5GcvtNx8k4hwcw4mt50ca8HeOObZWKvpf7KYLgc1EKQu
	uk8NpgPcAMTbsH9J7o/vUpuPmzPMzKQSizSgab3gEI0WI8P7MeBiMuywBuvQUho74/DY=;
Message-ID: <4e0a8cb0-2190-4434-902b-6a8745935341@xen.org>
Date: Tue, 23 Jul 2024 19:44:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] xen/riscv: introduce asm/pmap.h header
To: oleksii.kurochko@gmail.com
Cc: Jan Beulich <jbeulich@suse.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1720799925.git.oleksii.kurochko@gmail.com>
 <c7331e4c2f481f069571976a708c4aba04d2c0e4.1720799926.git.oleksii.kurochko@gmail.com>
 <6458c61d-5974-41c2-a1e6-76e4a15a487a@suse.com>
 <54af6fb751da1103054de2d79a2057bec658f399.camel@gmail.com>
 <623da862-8e76-4d40-9aa9-b02c8fd9944d@xen.org>
 <a53ef38e044db149bb37b70f1e56a33c6a3e7c83.camel@gmail.com>
 <26ae01e2-d085-48d7-8b1f-da1e44b01e53@xen.org>
 <CAMacjJwWLjGcFbYEhCPyNEW_+sfb51+XtKqyBcc2JGm=D5bf0w@mail.gmail.com>
 <97c82aca-0b8a-4b78-980b-0857dbdae80a@suse.com>
 <4c9eb7a79c33c7cd2f6bde05b1fbc7770e662026.camel@gmail.com>
 <14ffb00d-d6ba-4c18-88c1-2601a2df8a8b@suse.com>
 <b7e248ae79aaded532d86453520fcb4cb7a7fb3b.camel@gmail.com>
 <9baa3203-b8d0-4774-a2a5-7ba61b213f1c@xen.org>
 <29c8b24ecd240268caa64ddcc590188ec3e80cd1.camel@gmail.com>
 <f3cf8cbfd02f5889e498a8046ca24141a8ceb010.camel@gmail.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <f3cf8cbfd02f5889e498a8046ca24141a8ceb010.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 23/07/2024 18:28, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-07-23 at 19:25 +0200, oleksii.kurochko@gmail.com wrote:
>> On Tue, 2024-07-23 at 16:49 +0100, Julien Grall wrote:
>>> Hi Oleksii,
>>>
>>> On 23/07/2024 16:36, oleksii.kurochko@gmail.com wrote:
>>>> On Tue, 2024-07-23 at 12:02 +0200, Jan Beulich wrote:
>>>>> On 23.07.2024 10:55, oleksii.kurochko@gmail.com wrote:
>>>>>> On Tue, 2024-07-23 at 10:36 +0200, Jan Beulich wrote:
>>>>>>> On 23.07.2024 10:02, Oleksii Kurochko wrote:
>>>>>>>> On Mon, Jul 22, 2024 at 7:27 PM Julien Grall
>>>>>>>> <julien@xen.org>
>>>>>>>> wrote:
>>>>>>>>>>> On 22/07/2024 15:44, Oleksii Kurochko wrote:
>>>>>>>>>>       /* Map a 4k page in a fixmap entry */
>>>>>>>>>>       void set_fixmap(unsigned map, mfn_t mfn,
>>>>>>>>>> unsigned
>>>>>>>>>> int
>>>>>>>>>> flags)
>>>>>>>>>>       {
>>>>>>>>>>           pte_t pte;
>>>>>>>>>>
>>>>>>>>>>           pte = mfn_to_xen_entry(mfn, flags);
>>>>>>>>>>           pte.pte |= PTE_LEAF_DEFAULT;
>>>>>>>>>>           write_pte(&xen_fixmap[pt_index(0,
>>>>>>>>>> FIXMAP_ADDR(map))],
>>>>>>>>>> pte);
>>>>>>>>>
>>>>>>>>> It would be saner to check if you are not overwriting
>>>>>>>>> any
>>>>>>>>> existing
>>>>>>>>> mapping as otherwise you will probably need a TLB
>>>>>>>>> flush.
>>>>>>>>>
>>>>>>>>>>       }
>>>>>>>>>>
>>>>>>>>>>       /* Remove a mapping from a fixmap entry */
>>>>>>>>>>       void clear_fixmap(unsigned map)
>>>>>>>>>>       {
>>>>>>>>>>           pte_t pte = {0};
>>>>>>>>>>           write_pte(&xen_fixmap[pt_index(0,
>>>>>>>>>> FIXMAP_ADDR(map))],
>>>>>>>>>> pte);
>>>>>>>>>
>>>>>>>>> Don't you need a TLB flush?
>>>>>>>>>
>>>>>>>> Inside write_pte() there is "sfence.vma".
>>>>>>>
>>>>>>> That's just a fence though, not a TLB flush.
>>>>>>   From the privileged doc:
>>>>>>      ```
>>>>>>      SFENCE.VMA is also used to invalidate entries in the
>>>>>>      address-translation cache associated with a hart (see
>>>>>> Section
>>>>>> 4.3.2).
>>>>>>      ...
>>>>>>      The SFENCE.VMA is used to flush any local hardware caches
>>>>>> related to
>>>>>>      address translation.
>>>>>>      It is specified as a fence rather than a TLB flush to
>>>>>> provide
>>>>>> cleaner
>>>>>>      semantics with respect to
>>>>>>      which instructions are affected by the flush operation
>>>>>> and
>>>>>> to
>>>>>> support a
>>>>>>      wider variety of dynamic
>>>>>>      caching structures and memory-management schemes.
>>>>>> SFENCE.VMA is
>>>>>> also
>>>>>>      used by higher
>>>>>>      privilege levels to synchronize page table writes and the
>>>>>> address
>>>>>>      translation hardware.
>>>>>>      ...
>>>>>>      ```
>>>>>> I read this as SFENCE.VMA is used not only for ordering of
>>>>>> load/stores,
>>>>>> but also to flush TLB ( which is a type of more general term
>>>>>> as
>>>>>> address-translation cache, IIUIC ).
>>> I have to admit, I am a little because concerned with calling
>>> sfence.vma
>>> in write_pte() (this may only be because I am not very familiar
>>> with
>>> RISC-V).
>>>
>>> We have cases where multiple entry will be written in a single
>>> map_pages_to_xen() call. So wouldn't this means that the local TLBs
>>> would be nuked for every write rather than once?
>> Yes, it will be nuked. It is bad from perfomance point of view.
>> I just wanted to be sure that I won't miss to put sfence.vma when it
>> is
>> necessary and then reworked that a little bit after. But it seems it
>> would be better not to call sfence.vma in write_pte() just from the
>> start.
>>
>>
>>>
>>>
>>>>>
>>>>> Oh, I see. Kind of unexpected for an instruction of that name.
>>>>> Yet
>>>>> note
>>>>> how they talk about the local hart only. You need a wider scope
>>>>> TLB
>>>>> flush here.
>>>> Could you please clarify why it is needed wider?
>>>>
>>>> Arm Xen flushed only local TLB.
>>>
>>> Which code are you looking at? set_fixmap() will propagate the TLB
>>> flush
>>> to all innershareable CPUs.
>> Yes, here I agree that set_fixmap() uses map_pages_to_xen which
>> somewhere inside uses flush_xen_tlb_range_va() ( not
>> flush_xen_tlb_range_va() ) so TLB flush will happen for all
>> innershareable CPUs.
>>>
>>> The PMAP interface will do a local TLB flush because the interface
>>> can
>>> only be used during early boot where there is a single CPU running.
>>
>> Yes, I am looking at PMAP:
>>     static inline void arch_pmap_unmap(unsigned int slot)
>>     {
>>         lpae_t pte = {};
>>     
>>         write_pte(&xen_fixmap[slot], pte);
>>     
>>         flush_xen_tlb_range_va(FIXMAP_ADDR(slot), PAGE_SIZE);
>>     }
>> IIUC, originaly Jan told about arch_pmap_unmap() case so that is why
>> I
>> decided to clarify additionaly.
> 
> Julien,
> I have a questation related to Arm's version of arch_pmap_map():
> 
>     static inline void arch_pmap_map(unsigned int slot, mfn_t mfn)
>     {
>         lpae_t *entry = &xen_fixmap[slot];
>         lpae_t pte;
>     
>         ASSERT(!lpae_is_valid(*entry));
>     
>         pte = mfn_to_xen_entry(mfn, PAGE_HYPERVISOR_RW);
>         pte.pt.table = 1;
>         write_pte(entry, pte);
>         /*
>          * The new entry will be used very soon after arch_pmap_map()
>     returns.
>          * So ensure the DSB in write_pte() has completed before
>     continuing.
>          */
>         isb();
>     }
>     
> Is the code above isb() is correct? is it insure the DSB not ISB?

I guess you mean comment. If so, yes it is correct. write_pte() has a 
dsb() just after the PTE. This is to guarantee that implicit memory 
access (instruction fetch or from the Hardware translation table access) 
will only happen *after* the dsb() has completed.

I am not 100% sure whether the isb() is required for arch_pmap_map(). 
But I took the safest approach when implementing it.

> And isn't need to do TLB flush here?

It is not. On Arm, we have a strict policy that every unmap will be 
followed by a TLB flush and you can't modify an existing entry (see 
ASSERT a few lines above). So the TLBs will not contain an entry for 
mapping.

This policy was mainly dictacted by the Arm Arm because when modifying 
the output address you need to follow the break-before-make sequence 
which means you have to transition to an invalid mapping and flush the 
TLBs before the new entry is added. For simplicity, we decided to just 
not bother with trying to implement break-before-make for the hypervisor 
page-tables. But we do for the P2M.

Note that newer revision of the Armv8 spec relaxed the requirement (see 
FEAT_BBM).

Cheers,

-- 
Julien Grall

