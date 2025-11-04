Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF89DC30BC3
	for <lists+xen-devel@lfdr.de>; Tue, 04 Nov 2025 12:29:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155700.1485141 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGFDg-0006XV-Me; Tue, 04 Nov 2025 11:29:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155700.1485141; Tue, 04 Nov 2025 11:29:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGFDg-0006Vn-K2; Tue, 04 Nov 2025 11:29:00 +0000
Received: by outflank-mailman (input) for mailman id 1155700;
 Tue, 04 Nov 2025 11:28:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pTF1=5M=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1vGFDf-0006Vh-PM
 for xen-devel@lists.xenproject.org; Tue, 04 Nov 2025 11:28:59 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 71490ee1-b971-11f0-980a-7dc792cee155;
 Tue, 04 Nov 2025 12:28:53 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D54651C2B;
 Tue,  4 Nov 2025 03:28:44 -0800 (PST)
Received: from [10.1.38.100] (e126510-lin.cambridge.arm.com [10.1.38.100])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 15B213F63F;
 Tue,  4 Nov 2025 03:28:44 -0800 (PST)
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
X-Inumbo-ID: 71490ee1-b971-11f0-980a-7dc792cee155
Message-ID: <216d54f1-334f-4600-9ecb-f7788b1abd7d@arm.com>
Date: Tue, 4 Nov 2025 11:28:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/12] x86/xen: use lazy_mmu_state when
 context-switching
To: "David Hildenbrand (Red Hat)" <david@kernel.org>, linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Borislav Petkov
 <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, "David S. Miller"
 <davem@davemloft.net>, David Woodhouse <dwmw2@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Suren Baghdasaryan <surenb@google.com>, Thomas Gleixner
 <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-12-kevin.brodsky@arm.com>
 <c7c8a233-2103-4b48-b65e-ec81666d20e4@kernel.org>
 <285faae4-dab6-4819-847a-889bdf87d5d7@arm.com>
 <a326d1eb-62f1-4add-8dc9-cea7d7e4ed3c@kernel.org>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <a326d1eb-62f1-4add-8dc9-cea7d7e4ed3c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/11/2025 19:23, David Hildenbrand (Red Hat) wrote:
> On 03.11.25 19:29, Kevin Brodsky wrote:
>> On 03/11/2025 16:15, David Hildenbrand (Red Hat) wrote:
>>> On 29.10.25 11:09, Kevin Brodsky wrote:
>>>> [...]
>>>>
>>>> @@ -437,7 +436,7 @@ static void xen_end_context_switch(struct
>>>> task_struct *next)
>>>>          xen_mc_flush();
>>>>        leave_lazy(XEN_LAZY_CPU);
>>>> -    if (test_and_clear_ti_thread_flag(task_thread_info(next),
>>>> TIF_LAZY_MMU_UPDATES))
>>>> +    if (next->lazy_mmu_state.active)
>>>
>>> This is nasty. If in_lazy_mmu_mode() is not sufficient, we will want
>>> to have a separate helper that makes it clear what the difference
>>> between both variants is.
>>
>> in_lazy_mmu_mode() operates on current, but here we're operating on a
>> different task. The difference is more fundamental than just passing a
>> task_struct * or not: in_lazy_mmu_mode() is about whether we're
>> currently in lazy MMU mode, i.e. not paused and not in interrupt
>> context. A task that isn't scheduled is never in lazy MMU mode -
>> lazy_mmu_state.active is just the saved state to be restored when
>> scheduled again.
>>
>> My point here is that we could have a helper for this use-case, but it
>> should not be used in other situations (at least not on current). Maybe
>> __task_lazy_mmu_active(task)? I do wonder if accessing lazy_mmu_state
>> directly isn't expressing the intention well enough though (checking the
>> saved state).
>
>
> Likely there should be a
>
> /**
>  * task_lazy_mmu_active - test whether the lazy-mmu mode is active for a
>  *              task
>  * @task: ...
>  *
>  * The lazy-mmu mode is active if a task has lazy-mmu mode enabled and
>  * currently not paused.
>  */
> static inline bool task_lazy_mmu_active(struct task_struct *task)
> {
>     return task->lazy_mmu_state.active;
> }
>
> /**
>  * in_lazy_mmu_mode() - test whether current is in lazy-mmu mode
>  *
>  * Test whether the current task is in lazy-mmu mode: whether the
>  * interrupts are enabled and the lazy-mmu mode is active for the
>  * current task.
>  */
>  static inline bool in_lazy_mmu_mode(void)
>  {
> +    if (in_interrupt())
> +        return false;
> +
>      return task_lazy_mmu_active(current);
>  }
>
>
> Something like that. Maybe we can find better terminology.

That's probably the clearest yes, will make the change. I can't think of
more self-documenting names, spelling out the difference in the comments
is likely the best we can do.

- Kevin

