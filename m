Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEEEC3A5F3
	for <lists+xen-devel@lfdr.de>; Thu, 06 Nov 2025 11:52:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1156790.1485785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGxau-0003e4-Uj; Thu, 06 Nov 2025 10:51:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1156790.1485785; Thu, 06 Nov 2025 10:51:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vGxau-0003bL-RJ; Thu, 06 Nov 2025 10:51:56 +0000
Received: by outflank-mailman (input) for mailman id 1156790;
 Thu, 06 Nov 2025 10:51:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eIRr=5O=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1vGxau-0003bF-50
 for xen-devel@lists.xenproject.org; Thu, 06 Nov 2025 10:51:56 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 9b259ac1-bafe-11f0-980a-7dc792cee155;
 Thu, 06 Nov 2025 11:51:53 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 20A081596;
 Thu,  6 Nov 2025 02:51:45 -0800 (PST)
Received: from [10.1.34.75] (unknown [10.1.34.75])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6866A3F63F;
 Thu,  6 Nov 2025 02:51:46 -0800 (PST)
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
X-Inumbo-ID: 9b259ac1-bafe-11f0-980a-7dc792cee155
Message-ID: <48a4ecb5-3412-4d3f-9e43-535f8bee505f@arm.com>
Date: Thu, 6 Nov 2025 10:51:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/12] mm: enable lazy_mmu sections to nest
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 Ritesh Harjani <ritesh.list@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
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
 <20251029100909.3381140-8-kevin.brodsky@arm.com>
 <87ms5050g0.ritesh.list@gmail.com>
 <50d1b63a-88d7-4484-82c0-3bde96e3207d-agordeev@linux.ibm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <50d1b63a-88d7-4484-82c0-3bde96e3207d-agordeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/11/2025 16:12, Alexander Gordeev wrote:
> On Wed, Nov 05, 2025 at 02:19:03PM +0530, Ritesh Harjani wrote:
>>> + * in_lazy_mmu_mode() can be used to check whether the lazy MMU mode is
>>> + * currently enabled.
>>>   */
>>>  #ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
>>>  static inline void lazy_mmu_mode_enable(void)
>>>  {
>>> -	arch_enter_lazy_mmu_mode();
>>> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
>>> +
>>> +	VM_WARN_ON_ONCE(state->nesting_level == U8_MAX);
>>> +	/* enable() must not be called while paused */
>>> +	VM_WARN_ON(state->nesting_level > 0 && !state->active);
>>> +
>>> +	if (state->nesting_level++ == 0) {
>>> +		state->active = true;
>>> +		arch_enter_lazy_mmu_mode();
>>> +	}
>>>  }
>> Some architectures disables preemption in their
>> arch_enter_lazy_mmu_mode(). So shouldn't the state->active = true should
>> happen after arch_enter_lazy_mmu_mode() has disabled preemption()? i.e.
> Do you have some scenario in mind that could cause an issue?
> IOW, what could go wrong if the process is scheduled to another
> CPU before preempt_disable() is called?

I'm not sure I understand the issue either.

>>   static inline void lazy_mmu_mode_enable(void)
>>   {
>>  -	arch_enter_lazy_mmu_mode();
>>  +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
>>  +
>>  +	VM_WARN_ON_ONCE(state->nesting_level == U8_MAX);
>>  +	/* enable() must not be called while paused */
>>  +	VM_WARN_ON(state->nesting_level > 0 && !state->active);
>>  +
>>  +	if (state->nesting_level++ == 0) {
>>  +		arch_enter_lazy_mmu_mode();
>>  +		state->active = true;
>>  +	}
>>   }
>>
>> ... I think it make more sense to enable the state after the arch_**
>> call right.
> But then in_lazy_mmu_mode() would return false if called from
> arch_enter_lazy_mmu_mode(). Not big problem, but still..

The ordering of nesting_level/active was the way you expected in v3, but
the conclusion of the discussion with David H [1] is that it doesn't
really matter so I simplified the ordering in v4 - the arch hooks
shouldn't call in_lazy_mmu_mode() or inspect lazy_mmu_state.
arch_enter()/arch_leave() shouldn't need it anyway since they're called
once per outer section (not in nested sections). arch_flush() could
potentially do something different when nested, but that seems unlikely.

- Kevin

[1]
https://lore.kernel.org/all/af4414b6-617c-4dc8-bddc-3ea00d1f6f3b@redhat.com/


