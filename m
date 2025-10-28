Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C93E9C141F5
	for <lists+xen-devel@lfdr.de>; Tue, 28 Oct 2025 11:35:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1152063.1482608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDh2U-0007w8-2o; Tue, 28 Oct 2025 10:34:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1152063.1482608; Tue, 28 Oct 2025 10:34:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDh2T-0007u6-VB; Tue, 28 Oct 2025 10:34:53 +0000
Received: by outflank-mailman (input) for mailman id 1152063;
 Tue, 28 Oct 2025 10:34:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zN4v=5F=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1vDh2T-0007Z4-24
 for xen-devel@lists.xenproject.org; Tue, 28 Oct 2025 10:34:53 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id b9b3d1c3-b3e9-11f0-980a-7dc792cee155;
 Tue, 28 Oct 2025 11:34:47 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07A50106F;
 Tue, 28 Oct 2025 03:34:39 -0700 (PDT)
Received: from [10.44.160.74] (unknown [10.44.160.74])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3597D3F63F;
 Tue, 28 Oct 2025 03:34:39 -0700 (PDT)
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
X-Inumbo-ID: b9b3d1c3-b3e9-11f0-980a-7dc792cee155
Message-ID: <f3b8a71c-7698-4918-99d1-36e97bded97c@arm.com>
Date: Tue, 28 Oct 2025 11:34:34 +0100
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
 <28bf77c0-3aa9-4c41-aa2b-368321355dbb@arm.com>
 <14030818-52e7-41eb-8ad7-602f3476d448@redhat.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <14030818-52e7-41eb-8ad7-602f3476d448@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/10/2025 17:24, David Hildenbrand wrote:
> On 24.10.25 16:32, Kevin Brodsky wrote:
>> On 24/10/2025 15:27, David Hildenbrand wrote:
>>> On 24.10.25 14:13, Kevin Brodsky wrote:
>>>> On 23/10/2025 21:52, David Hildenbrand wrote:
>>>>> On 15.10.25 10:27, Kevin Brodsky wrote:
>>>>>> [...]
>>>>>>
>>>>>> * madvise_*_pte_range() call arch_leave() in multiple paths, some
>>>>>>      followed by an immediate exit/rescheduling and some followed
>>>>>> by a
>>>>>>      conditional exit. These functions assume that they are called
>>>>>>      with lazy MMU disabled and we cannot simply use
>>>>>> pause()/resume()
>>>>>>      to address that. This patch leaves the situation unchanged by
>>>>>>      calling enable()/disable() in all cases.
>>>>>
>>>>> I'm confused, the function simply does
>>>>>
>>>>> (a) enables lazy mmu
>>>>> (b) does something on the page table
>>>>> (c) disables lazy mmu
>>>>> (d) does something expensive (split folio -> take sleepable locks,
>>>>>       flushes tlb)
>>>>> (e) go to (a)
>>>>
>>>> That step is conditional: we exit right away if pte_offset_map_lock()
>>>> fails. The fundamental issue is that pause() must always be matched
>>>> with
>>>> resume(), but as those functions look today there is no situation
>>>> where
>>>> a pause() would always be matched with a resume().
>>>
>>> We have matches enable/disable, so my question is rather "why" you are
>>> even thinking about using pause/resume?
>>>
>>> What would be the benefit of that? If there is no benefit then just
>>> drop this from the patch description as it's more confusing than just
>>> ... doing what the existing code does :)
>>
>> Ah sorry I misunderstood, I guess you originally meant: why would we use
>> pause()/resume()?
>>
>> The issue is the one I mentioned in the commit message: using
>> enable()/disable(), we assume that the functions are called with lazy
>> MMU mode is disabled. Consider:
>>
>>    lazy_mmu_mode_enable()
>>    madvise_cold_or_pageout_pte_range():
>>      lazy_mmu_mode_enable()
>>      ...
>>      if (need_resched()) {
>>        lazy_mmu_mode_disable()
>>        cond_resched() // lazy MMU still enabled
>>      }
>>
>> This will explode on architectures that do not allow sleeping while in
>> lazy MMU mode. I'm not saying this is an actual problem - I don't see
>> why those functions would be called with lazy MMU mode enabled. But it
>> does go against the notion that nesting works everywhere.
>
> I would tackle it from a different direction: if code calls with lazy
> MMU enabled into random other code that might sleep, that caller would
> be wrong.
>
> It's not about changing functions like this to use pause/resume.
>
> Maybe the rule is simple: if you enable the lazy MMU, don't call any
> functions that might sleep.

You're right, this is a requirement for lazy MMU. Calling enable() then
disable() means returning to the original state, and if the function
sleeps at that point then the caller must not itself enable lazy MMU.

I mixed up that case with the original motivation for pause()/resume(),
which is to temporarily pause any batching. This is considered an
implementation detail and the caller isn't expected to be aware of it,
hence the need for that use-case to work regardless of nesting.

> Maybe we could support that later by handling it before/after
> sleeping, if ever required?

Indeed, pause()/resume() could be used to allow functions that sleep to
be called with lazy MMU enabled. But that's only a hypothetical use-case
for now.

> Or am I missing something regarding your point on pause()/resume()?

Doesn't sound like it :) I'll remove that paragraph from the (already
long) commit message. Thanks!

- Kevin

