Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D65C40912
	for <lists+xen-devel@lfdr.de>; Fri, 07 Nov 2025 16:23:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157727.1486411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHOIp-0004HE-Ax; Fri, 07 Nov 2025 15:23:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157727.1486411; Fri, 07 Nov 2025 15:23:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHOIp-0004Fd-7T; Fri, 07 Nov 2025 15:23:03 +0000
Received: by outflank-mailman (input) for mailman id 1157727;
 Fri, 07 Nov 2025 15:23:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Yjs=5P=arm.com=ryan.roberts@srs-se1.protection.inumbo.net>)
 id 1vHOIo-0004FX-BO
 for xen-devel@lists.xenproject.org; Fri, 07 Nov 2025 15:23:02 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id a5b3da9d-bbed-11f0-9d17-b5c5bf9af7f9;
 Fri, 07 Nov 2025 16:23:01 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9C58F1515;
 Fri,  7 Nov 2025 07:22:52 -0800 (PST)
Received: from [10.57.86.134] (unknown [10.57.86.134])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C0C093F694;
 Fri,  7 Nov 2025 07:22:55 -0800 (PST)
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
X-Inumbo-ID: a5b3da9d-bbed-11f0-9d17-b5c5bf9af7f9
Message-ID: <645178fd-df4e-42fe-b55e-97d9506499be@arm.com>
Date: Fri, 7 Nov 2025 15:22:54 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/12] mm: introduce generic lazy_mmu helpers
Content-Language: en-GB
To: "David Hildenbrand (Red Hat)" <davidhildenbrandkernel@gmail.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
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
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <c764489e-0626-4a50-87b5-39e15d9db733@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/11/2025 14:34, David Hildenbrand (Red Hat) wrote:
>>>   #ifndef pte_batch_hint
>>> diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
>>> index 5d2a876035d6..c49b029d3593 100644
>>> --- a/mm/kasan/shadow.c
>>> +++ b/mm/kasan/shadow.c
>>> @@ -305,7 +305,7 @@ static int kasan_populate_vmalloc_pte(pte_t *ptep,
>>> unsigned long addr,
>>>       pte_t pte;
>>>       int index;
>>>   -    arch_leave_lazy_mmu_mode();
>>> +    lazy_mmu_mode_pause();
>>
>> I wonder if there really are use cases that *require* pause/resume? I think
>> these kasan cases could be correctly implemented using a new nest level instead?
>> Are there cases where the effects really need to be immediate or do the effects
>> just need to be visible when you get to where the resume is?
>>
>> If the latter, that could just be turned into a nested disable (e.g. a flush).
>> In this case, there is only 1 PTE write so no benefit, but I wonder if other
>> cases may have more PTE writes that could then still be batched. It would be
>> nice to simplify the API by removing pause/resume if we can?
> 
> It has clear semantics, clearer than some nest-disable IMHO.
> 
> Maybe you can elaborate how you would change ("simplify") the API in that
> regard? What would the API look like?

By simplify, I just meant can we remove lazy_mmu_mode_pause() and
lazy_mmu_mode_resume() ?


We currently have:

apply_to_page_range
  lazy_mmu_mode_enable()
    kasan_populate_vmalloc_pte()
      lazy_mmu_mode_pause()
      <code>
      lazy_mmu_mode_resume()
  lazy_mmu_mode_disable()

Where <code> is setting ptes. But if <code> doesn't need the effects to be
visible until lazy_mmu_mode_resume(), then you could replace the block with:

apply_to_page_range
  lazy_mmu_mode_enable()
    kasan_populate_vmalloc_pte()
      lazy_mmu_mode_enable()
      <code>
      lazy_mmu_mode_disable()
  lazy_mmu_mode_disable()

However, looking at this more closely, I'm not really clear on why we need *any*
special attention to lazy mmu inside of kasan_populate_vmalloc_pte() and
kasan_depopulate_vmalloc_pte().

I *think* that the original concern was that we were doing ptep_get(ptep) inside
of a lazy_mmu block? So we need to flush so that the getter returns the most
recent value? But given we have never written to that particular ptep while in
the lazy mmu block, there is surely no hazard in the first place?

apply_to_existing_page_range() will only call kasan_depopulate_vmalloc_pte()
once per pte, right? So given we read the ptep before writing it, there should
be no hazard? If so we can remove pause/resume.

Thanks,
Ryan


