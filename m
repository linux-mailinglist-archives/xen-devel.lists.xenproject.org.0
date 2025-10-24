Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E678CC06B57
	for <lists+xen-devel@lfdr.de>; Fri, 24 Oct 2025 16:33:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1150396.1481546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCIqg-0006lT-O9; Fri, 24 Oct 2025 14:32:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1150396.1481546; Fri, 24 Oct 2025 14:32:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCIqg-0006jS-LR; Fri, 24 Oct 2025 14:32:58 +0000
Received: by outflank-mailman (input) for mailman id 1150396;
 Fri, 24 Oct 2025 14:32:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rNzd=5B=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1vCIqf-0006jM-SA
 for xen-devel@lists.xenproject.org; Fri, 24 Oct 2025 14:32:57 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 5141bf03-b0e6-11f0-980a-7dc792cee155;
 Fri, 24 Oct 2025 16:32:50 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDD53175A;
 Fri, 24 Oct 2025 07:32:41 -0700 (PDT)
Received: from [10.44.160.74] (e126510-lin.lund.arm.com [10.44.160.74])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F9233F66E;
 Fri, 24 Oct 2025 07:32:42 -0700 (PDT)
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
X-Inumbo-ID: 5141bf03-b0e6-11f0-980a-7dc792cee155
Message-ID: <28bf77c0-3aa9-4c41-aa2b-368321355dbb@arm.com>
Date: Fri, 24 Oct 2025 16:32:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/13] mm: introduce generic lazy_mmu helpers
To: David Hildenbrand <david@redhat.com>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>, "H. Peter Anvin" <hpa@zytor.com>,
 Ingo Molnar <mingo@redhat.com>, Jann Horn <jannh@google.com>,
 Juergen Gross <jgross@suse.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251015082727.2395128-1-kevin.brodsky@arm.com>
 <20251015082727.2395128-7-kevin.brodsky@arm.com>
 <73b274b7-f419-4e2e-8620-d557bac30dc2@redhat.com>
 <390e41ae-4b66-40c1-935f-7a1794ba0b71@arm.com>
 <f8d22ae0-4e36-4537-903f-28164c850fdb@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <f8d22ae0-4e36-4537-903f-28164c850fdb@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/10/2025 15:27, David Hildenbrand wrote:
> On 24.10.25 14:13, Kevin Brodsky wrote:
>> On 23/10/2025 21:52, David Hildenbrand wrote:
>>> On 15.10.25 10:27, Kevin Brodsky wrote:
>>>> [...]
>>>>
>>>> * madvise_*_pte_range() call arch_leave() in multiple paths, some
>>>>     followed by an immediate exit/rescheduling and some followed by a
>>>>     conditional exit. These functions assume that they are called
>>>>     with lazy MMU disabled and we cannot simply use pause()/resume()
>>>>     to address that. This patch leaves the situation unchanged by
>>>>     calling enable()/disable() in all cases.
>>>
>>> I'm confused, the function simply does
>>>
>>> (a) enables lazy mmu
>>> (b) does something on the page table
>>> (c) disables lazy mmu
>>> (d) does something expensive (split folio -> take sleepable locks,
>>>      flushes tlb)
>>> (e) go to (a)
>>
>> That step is conditional: we exit right away if pte_offset_map_lock()
>> fails. The fundamental issue is that pause() must always be matched with
>> resume(), but as those functions look today there is no situation where
>> a pause() would always be matched with a resume().
>
> We have matches enable/disable, so my question is rather "why" you are
> even thinking about using pause/resume?
>
> What would be the benefit of that? If there is no benefit then just
> drop this from the patch description as it's more confusing than just
> ... doing what the existing code does :)

Ah sorry I misunderstood, I guess you originally meant: why would we use
pause()/resume()?

The issue is the one I mentioned in the commit message: using
enable()/disable(), we assume that the functions are called with lazy
MMU mode is disabled. Consider:

  lazy_mmu_mode_enable()
  madvise_cold_or_pageout_pte_range():
    lazy_mmu_mode_enable()
    ...
    if (need_resched()) {
      lazy_mmu_mode_disable()
      cond_resched() // lazy MMU still enabled
    }

This will explode on architectures that do not allow sleeping while in
lazy MMU mode. I'm not saying this is an actual problem - I don't see
why those functions would be called with lazy MMU mode enabled. But it
does go against the notion that nesting works everywhere.

>
>>>
>>> Why would we use enable/disable instead?
>>>
>>>>
>>>> * x86/Xen is currently the only case where explicit handling is
>>>>     required for lazy MMU when context-switching. This is purely an
>>>>     implementation detail and using the generic lazy_mmu_mode_*
>>>>     functions would cause trouble when nesting support is introduced,
>>>>     because the generic functions must be called from the current
>>>> task.
>>>>     For that reason we still use arch_leave() and arch_enter() there.
>>>
>>> How does this interact with patch #11?
>>
>> It is a requirement for patch 11, in fact. If we called disable() when
>> switching out a task, then lazy_mmu_state.enabled would (most likely) be
>> false when scheduling it again.
>>
>> By calling the arch_* helpers when context-switching, we ensure
>> lazy_mmu_state remains unchanged. This is consistent with what happens
>> on all other architectures (which don't do anything about lazy_mmu when
>> context-switching). lazy_mmu_state is the lazy MMU status *when the task
>> is scheduled*, and should be preserved on a context-switch.
>
> Okay, thanks for clarifying. That whole XEN stuff here is rather horrible.

Can't say I disagree... I tried to simplify it further, but the
Xen-specific "LAZY_CPU" mode makes it just too difficult.

>
>>
>>>
>>>>
>>>> Note: x86 calls arch_flush_lazy_mmu_mode() unconditionally in a few
>>>> places, but only defines it if PARAVIRT_XXL is selected, and we are
>>>> removing the fallback in <linux/pgtable.h>. Add a new fallback
>>>> definition to <asm/pgtable.h> to keep things building.
>>>
>>> I can see a call in __kernel_map_pages() and
>>> arch_kmap_local_post_map()/arch_kmap_local_post_unmap().
>>>
>>> I guess that is ... harmless/irrelevant in the context of this series?
>>
>> It should be. arch_flush_lazy_mmu_mode() was only used by x86 before
>> this series; we're adding new calls to it from the generic layer, but
>> existing x86 calls shouldn't be affected.
>
> Okay, I'd like to understand the rules when arch_flush_lazy_mmu_mode()
> would actually be required in such arch code, but that's outside of
> the scope of your patch series. 

Not too sure either. A little archaeology shows that the calls were
added by [1][2]. Chances are [1] is no longer relevant since lazy_mmu
isn't directly used in copy_page_range(). 

I think [2] is still required - __kernel_map_pages() can be called while
lazy MMU is already enabled, and AIUI the mapping changes should take
effect by the time __kernel_map_pages() returns. On arm64 we shouldn't
have this problem by virtue of __kernel_map_pages() using lazy_mmu
itself, meaning that the nested call to disable() will trigger a flush.
(This case is in fact the original motivation for supporting nesting.)

- Kevin

[1]
https://lore.kernel.org/all/1319573279-13867-2-git-send-email-konrad.wilk@oracle.com/
[2]
https://lore.kernel.org/all/1365703192-2089-1-git-send-email-boris.ostrovsky@oracle.com/


