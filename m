Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AF6B545E6
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 10:49:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1121632.1465811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwzSW-0002tc-MG; Fri, 12 Sep 2025 08:48:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1121632.1465811; Fri, 12 Sep 2025 08:48:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwzSW-0002s8-J7; Fri, 12 Sep 2025 08:48:44 +0000
Received: by outflank-mailman (input) for mailman id 1121632;
 Fri, 12 Sep 2025 08:48:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=66U7=3X=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1uwzSV-0002s2-09
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 08:48:43 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 45ac883a-8fb5-11f0-9809-7dc792cee155;
 Fri, 12 Sep 2025 10:48:37 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4134416A3;
 Fri, 12 Sep 2025 01:48:28 -0700 (PDT)
Received: from [10.57.66.147] (unknown [10.57.66.147])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 63FC83F66E;
 Fri, 12 Sep 2025 01:48:29 -0700 (PDT)
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
X-Inumbo-ID: 45ac883a-8fb5-11f0-9809-7dc792cee155
Message-ID: <781a6450-1c0b-4603-91cf-49f16cd78c28@arm.com>
Date: Fri, 12 Sep 2025 10:48:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] mm: introduce local state for lazy_mmu sections
To: David Hildenbrand <david@redhat.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
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
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
 Mark Rutland <Mark.Rutland@arm.com>
References: <20250908073931.4159362-1-kevin.brodsky@arm.com>
 <20250908073931.4159362-3-kevin.brodsky@arm.com>
 <d23ea683-cca4-4973-88b1-4f6fd9b22314@redhat.com>
 <ca2054ad-b163-4e61-8ec4-6f2e36461628-agordeev@linux.ibm.com>
 <e7acb889-1fe9-4db3-acf4-39f4960e8ccd@redhat.com>
 <2fecfae7-1140-4a23-a352-9fd339fcbae5-agordeev@linux.ibm.com>
 <e521b1f4-3f2b-48cd-9568-b9a4cf4c4830@redhat.com>
 <47ee1df7-1602-4200-af94-475f84ca8d80@arm.com>
 <29383ee2-d6d6-4435-9052-d75a263a5c45@redhat.com>
 <9de08024-adfc-421b-8799-62653468cf63@arm.com>
 <ef343405-c394-4763-a79f-21381f217b6c@redhat.com>
 <4b4971fd-0445-4d86-8f3a-6ba3d68d15b7@arm.com>
 <4aa28016-5678-4c66-8104-8dcc3fa2f5ce@redhat.com>
 <15d01c8b-5475-442e-9df5-ca37b0d5dc04@arm.com>
 <7953a735-6129-4d22-be65-ce736630d539@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <7953a735-6129-4d22-be65-ce736630d539@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/09/2025 10:04, David Hildenbrand wrote:
>>>
>>> struct lazy_mmu_state {
>>>      uint8_t enabled_count;
>>>      bool paused;
>>
>> Looking at the arm64 implementation, I'm thinking: instead of the paused
>> member, how about a PF_LAZY_MMU task flag? It would be set when lazy_mmu
>> is actually enabled (i.e. inside an enter()/leave() section, and not
>> inside a pause()/resume() section). This way, architectures could use
>> that flag directly to tell if lazy_mmu is enabled instead of reinventing
>> the wheel, all in slightly different ways. Namely:
>>
>> * arm64 uses a thread flag (TIF_LAZY_MMU) - this is trivially replaced
>> with PF_LAZY_MMU
>> * powerpc and sparc use batch->active where batch is a per-CPU variable;
>> I expect this can also be replaced with PF_LAZY_MMU
>> * x86/xen is more complex as it has xen_lazy_mode which tracks both
>> LAZY_MMU and LAZY_CPU modes. I'd probably leave that one alone, unless a
>> Xen expert is motivated to refactor it.
>>
>> With that approach, the implementation of arch_enter() and arch_leave()
>> becomes very simple (no tracking of lazy_mmu status) on arm64, powerpc
>> and sparc.
>>
>> (Of course we could also have an "enabled" member in lazy_mmu_state
>> instead of PF_LAZY_MMU, there is no functional difference.)
>>
>
> No strong opinion, but to me it feels like PF_LAZY_MMU is rather "the
> effective state when combining nested+paused", and might complicate
> the code + sanity checks?
>
> So we could maintain that in addition fairly easily of course from the
> core instead of letting archs do that manually.
>
> I would probably have to see the end result to judge whether removing
> the "paused" bool makes things look more complicated or not.

Agreed, it is a little difficult to consider all the cases ahead of
time. What is clear to me though is that [paused] can be inferred from
[count + enabled], and conversely [enabled] from [count + paused]. As a
result I really wouldn't store both paused and enabled in task_struct -
duplicating information is how you create inconsistent states.

We can very easily introduce helpers to get the enabled/paused status
regardless of how they're stored. Since "enabled" is what we need to
know in most cases (arch checking the status), I would rather store
"enabled" than "paused". But indeed, let's see how it turns out in practice.

>
>>> }
>>>
>>> c) With that config, common-code lazy_mmu_*() functions implement the
>>> updating of the lazy_mmu_state in task_struct and call into arch code
>>> on the transition from 0->1, 1->0 etc.
>>
>> Indeed, this is how I thought about it. There is actually quite a lot
>> that can be moved to the generic functions:
>> * Updating lazy_mmu_state
>> * Sanity checks on lazy_mmu_state (e.g. underflow/overflow)
>> * Bailing out if in_interrupt() (not done consistently across arch's at
>> the moment)
>>
>>>
>>> Maybe that can be done through exiting
>>> arch_enter_lazy_mmu_mode()/arch_leave_lazy_mmu_mode() callbacks, maybe
>>> we need more. I feel like
>>> we might be able to implement that through the existing helpers.
>>
>> We might want to rename them to align with the new generic helpers, but
>> yes otherwise the principle should remain unchanged.
>>
>> In fact, we will also need to revive arch_flush_lazy_mmu_mode().
>
> That's okay if it's all hidden behaind a sane core API.
>
>> Indeed,
>> in the nested situation, we need the following arch calls:
>>
>> enter() -> arch_enter()
>>      enter() -> [nothing]
>>      leave() -> arch_flush()
>> leave() -> arch_leave()
>>
>> leave() must always flush whatever arch state was batched, as may be
>> expected by the caller.
>>
>> How does all that sound?
>
> I am no expert on the "always flush when leaving", but it sounds
> reasonable to me.

This is a core expectation for lazy_mmu: when leave() is called, any
batched state is flushed. The fact it currently happens unconditionally
when calling leave() is in fact what stops nesting from exploding on
arm64 with DEBUG_PAGEALLOC [1].

[1] https://lore.kernel.org/all/aEhKSq0zVaUJkomX@arm.com/

>
> Which arch operations would you call from
>
> pause()
> continue()

I also wondered about that. I think the safest is to make them
respectively arch_leave() and arch_enter() - the flushing entailed by
arch_leave() might not be required, but it is safer. Additionally,
powerpc/sparc disable preemption while in lazy_mmu, so it seems like a
good idea to re-enable it while paused (by calling arch_leave()).

- Kevin

