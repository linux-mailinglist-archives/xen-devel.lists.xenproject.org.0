Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C88BC4598E
	for <lists+xen-devel@lfdr.de>; Mon, 10 Nov 2025 10:20:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158169.1486551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIO42-0006un-I0; Mon, 10 Nov 2025 09:19:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158169.1486551; Mon, 10 Nov 2025 09:19:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIO42-0006sC-Ek; Mon, 10 Nov 2025 09:19:54 +0000
Received: by outflank-mailman (input) for mailman id 1158169;
 Mon, 10 Nov 2025 09:19:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YXtN=5S=arm.com=ryan.roberts@srs-se1.protection.inumbo.net>)
 id 1vIO40-0006s6-TB
 for xen-devel@lists.xenproject.org; Mon, 10 Nov 2025 09:19:52 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 68511ab8-be16-11f0-9d18-b5c5bf9af7f9;
 Mon, 10 Nov 2025 10:19:50 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91A6F2B;
 Mon, 10 Nov 2025 01:19:41 -0800 (PST)
Received: from [10.57.85.123] (unknown [10.57.85.123])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CED693F63F;
 Mon, 10 Nov 2025 01:19:42 -0800 (PST)
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
X-Inumbo-ID: 68511ab8-be16-11f0-9d18-b5c5bf9af7f9
Message-ID: <e428b1d5-65a8-49bc-92dc-ec4a4d933dec@arm.com>
Date: Mon, 10 Nov 2025 09:19:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/12] mm: introduce generic lazy_mmu helpers
Content-Language: en-GB
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: "David Hildenbrand (Red Hat)" <davidhildenbrandkernel@gmail.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Suren Baghdasaryan
 <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-7-kevin.brodsky@arm.com>
 <71418b31-aedb-4600-9558-842515dd6c44@arm.com>
 <c764489e-0626-4a50-87b5-39e15d9db733@gmail.com>
 <645178fd-df4e-42fe-b55e-97d9506499be@arm.com>
 <413b2c49-f124-4cda-8fea-a6cc165f6326-agordeev@linux.ibm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <413b2c49-f124-4cda-8fea-a6cc165f6326-agordeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10/11/2025 08:11, Alexander Gordeev wrote:
> On Fri, Nov 07, 2025 at 03:22:54PM +0000, Ryan Roberts wrote:
> 
> Hi Ryan,
> 
>> On 07/11/2025 14:34, David Hildenbrand (Red Hat) wrote:
>>>>>   #ifndef pte_batch_hint
>>>>> diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
>>>>> index 5d2a876035d6..c49b029d3593 100644
>>>>> --- a/mm/kasan/shadow.c
>>>>> +++ b/mm/kasan/shadow.c
>>>>> @@ -305,7 +305,7 @@ static int kasan_populate_vmalloc_pte(pte_t *ptep,
>>>>> unsigned long addr,
>>>>>       pte_t pte;
>>>>>       int index;
>>>>>   -    arch_leave_lazy_mmu_mode();
>>>>> +    lazy_mmu_mode_pause();
>>>>
>>>> I wonder if there really are use cases that *require* pause/resume? I think
>>>> these kasan cases could be correctly implemented using a new nest level instead?
>>>> Are there cases where the effects really need to be immediate or do the effects
>>>> just need to be visible when you get to where the resume is?
>>>>
>>>> If the latter, that could just be turned into a nested disable (e.g. a flush).
>>>> In this case, there is only 1 PTE write so no benefit, but I wonder if other
>>>> cases may have more PTE writes that could then still be batched. It would be
>>>> nice to simplify the API by removing pause/resume if we can?
>>>
>>> It has clear semantics, clearer than some nest-disable IMHO.
>>>
>>> Maybe you can elaborate how you would change ("simplify") the API in that
>>> regard? What would the API look like?
>>
>> By simplify, I just meant can we remove lazy_mmu_mode_pause() and
>> lazy_mmu_mode_resume() ?
>>
>>
>> We currently have:
>>
>> apply_to_page_range
>>   lazy_mmu_mode_enable()
>>     kasan_populate_vmalloc_pte()
>>       lazy_mmu_mode_pause()
>>       <code>
>>       lazy_mmu_mode_resume()
>>   lazy_mmu_mode_disable()
>>
>> Where <code> is setting ptes. But if <code> doesn't need the effects to be
>> visible until lazy_mmu_mode_resume(), then you could replace the block with:
>>
>> apply_to_page_range
>>   lazy_mmu_mode_enable()
>>     kasan_populate_vmalloc_pte()
>>       lazy_mmu_mode_enable()
>>       <code>
>>       lazy_mmu_mode_disable()
>>   lazy_mmu_mode_disable()
>>
>> However, looking at this more closely, I'm not really clear on why we need *any*
>> special attention to lazy mmu inside of kasan_populate_vmalloc_pte() and
>> kasan_depopulate_vmalloc_pte().
>>
>> I *think* that the original concern was that we were doing ptep_get(ptep) inside
>> of a lazy_mmu block? So we need to flush so that the getter returns the most
>> recent value? But given we have never written to that particular ptep while in
>> the lazy mmu block, there is surely no hazard in the first place?
> 
> There is, please see:
> https://lore.kernel.org/linux-mm/cover.1755528662.git.agordeev@linux.ibm.com/

I've stared at this for a while, but I'm afraid I still don't see the problem.
This all looks safe to me. Could you explain exactly what this issue is?

If I've understood correctly, kasan_populate_vmalloc() is called during virtual
range allocation by vmalloc. This is not in a nested lazy mmu block (but it
wouldn't matter if it was once we have Kevin's nested changes to ensure flush
when exiting the nested scope). kasan_populate_vmalloc() calls
apply_to_page_range(), which will walk the set of ptes, calling
kasan_populate_vmalloc_pte() for each one. kasan_populate_vmalloc_pte() does a
ptep_get() then, if none, calls set_pte_at().

That's not a hazard since you're calling get before the set and you only visit
each pte once for the apply_to_page_range() lazy mmu block.

> 
>> apply_to_existing_page_range() will only call kasan_depopulate_vmalloc_pte()
>> once per pte, right? So given we read the ptep before writing it, there should
>> be no hazard? If so we can remove pause/resume.
> 
> Unfortunately, we rather not, please see:
> https://lore.kernel.org/linux-mm/d407a381-099b-4ec6-a20e-aeff4f3d750f@arm.com/

Sorry but I don't see anything relavent to my point in this mail. Perhaps there
is some s390-specific detail that I'm failing to understand?

Thanks,
Ryan

> 
> The problem is kasan code invokes apply_to_page_range(), which enters lazy_mmu
> mode unconditionally. I would claim that is rather an obstacle for the kasan
> code, not a benefit. But it needs to be tackled.
> > Should apply_to_page_range() had an option not to enter the lazy_mmu mode
> (e.g. an extra "bool skip_lazy" parameter) - the pause/resume could have
> been avoided.
> 
>> Thanks,
>> Ryan
> 
> Thanks!


