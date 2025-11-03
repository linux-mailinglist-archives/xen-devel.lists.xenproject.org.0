Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B511FC2DE4B
	for <lists+xen-devel@lfdr.de>; Mon, 03 Nov 2025 20:24:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1155536.1485002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vG09a-0003ym-5Y; Mon, 03 Nov 2025 19:23:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1155536.1485002; Mon, 03 Nov 2025 19:23:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vG09a-0003wF-1u; Mon, 03 Nov 2025 19:23:46 +0000
Received: by outflank-mailman (input) for mailman id 1155536;
 Mon, 03 Nov 2025 19:23:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j3Hq=5L=kernel.org=david@srs-se1.protection.inumbo.net>)
 id 1vG09Y-0003w8-Ow
 for xen-devel@lists.xenproject.org; Mon, 03 Nov 2025 19:23:44 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9b8467d4-b8ea-11f0-9d16-b5c5bf9af7f9;
 Mon, 03 Nov 2025 20:23:43 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 31D2D40763;
 Mon,  3 Nov 2025 19:23:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BEBEC4CEE7;
 Mon,  3 Nov 2025 19:23:32 +0000 (UTC)
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
X-Inumbo-ID: 9b8467d4-b8ea-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762197821;
	bh=YF+Dh7k5RXyD8ZknLWrr6zckBVz5y8Jk5LVnJjqJxoY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c9UT0S1aE+oyoVDfFS4tVvZUGvWl9HiC7/F+Cp66KCVA7C4GhH0PqNtoBTarCw3iW
	 r2P630kamF4JSjUnf0EzY4gdgF4lREKNM2+yjmeoTw3nLHhjxYDny/gqAjP3iNUL7a
	 JzIyQ1aRH3QyNtDz4IpxtL5MX/fDHZSJh77cPeKd7LS92GluG1GXIy1BpAiLFwvlox
	 cRJrDCtLOcgMqEzgJxz44Oa9sLKyl40ixdJjaMo6LOW9qbHf4ryeTRFym1qVmpu9UH
	 uIilWOADkYHyRHPzn2EvdQ0ZptspxmBomG3l6lNVoh9BMoIycP2QxAs9MQX9p7Fs9q
	 9DzIobQXg5JOg==
Message-ID: <a326d1eb-62f1-4add-8dc9-cea7d7e4ed3c@kernel.org>
Date: Mon, 3 Nov 2025 20:23:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/12] x86/xen: use lazy_mmu_state when
 context-switching
To: Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org
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
From: "David Hildenbrand (Red Hat)" <david@kernel.org>
Content-Language: en-US
In-Reply-To: <285faae4-dab6-4819-847a-889bdf87d5d7@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03.11.25 19:29, Kevin Brodsky wrote:
> On 03/11/2025 16:15, David Hildenbrand (Red Hat) wrote:
>> On 29.10.25 11:09, Kevin Brodsky wrote:
>>> [...]
>>>
>>> @@ -437,7 +436,7 @@ static void xen_end_context_switch(struct
>>> task_struct *next)
>>>          xen_mc_flush();
>>>        leave_lazy(XEN_LAZY_CPU);
>>> -    if (test_and_clear_ti_thread_flag(task_thread_info(next),
>>> TIF_LAZY_MMU_UPDATES))
>>> +    if (next->lazy_mmu_state.active)
>>
>> This is nasty. If in_lazy_mmu_mode() is not sufficient, we will want
>> to have a separate helper that makes it clear what the difference
>> between both variants is.
> 
> in_lazy_mmu_mode() operates on current, but here we're operating on a
> different task. The difference is more fundamental than just passing a
> task_struct * or not: in_lazy_mmu_mode() is about whether we're
> currently in lazy MMU mode, i.e. not paused and not in interrupt
> context. A task that isn't scheduled is never in lazy MMU mode -
> lazy_mmu_state.active is just the saved state to be restored when
> scheduled again.
> 
> My point here is that we could have a helper for this use-case, but it
> should not be used in other situations (at least not on current). Maybe
> __task_lazy_mmu_active(task)? I do wonder if accessing lazy_mmu_state
> directly isn't expressing the intention well enough though (checking the
> saved state).


Likely there should be a

/**
  * task_lazy_mmu_active - test whether the lazy-mmu mode is active for a
  *			  task
  * @task: ...
  *
  * The lazy-mmu mode is active if a task has lazy-mmu mode enabled and
  * currently not paused.
  */
static inline bool task_lazy_mmu_active(struct task_struct *task)
{
	return task->lazy_mmu_state.active;
}

/**
  * in_lazy_mmu_mode() - test whether current is in lazy-mmu mode
  *
  * Test whether the current task is in lazy-mmu mode: whether the
  * interrupts are enabled and the lazy-mmu mode is active for the
  * current task.
  */
  static inline bool in_lazy_mmu_mode(void)
  {
+	if (in_interrupt())
+		return false;
+
  	return task_lazy_mmu_active(current);
  }


Something like that. Maybe we can find better terminology.

-- 
Cheers

David

