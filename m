Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E178C3F5FF
	for <lists+xen-devel@lfdr.de>; Fri, 07 Nov 2025 11:17:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157449.1486218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHJWE-0001h0-TK; Fri, 07 Nov 2025 10:16:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157449.1486218; Fri, 07 Nov 2025 10:16:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHJWE-0001ej-QW; Fri, 07 Nov 2025 10:16:34 +0000
Received: by outflank-mailman (input) for mailman id 1157449;
 Fri, 07 Nov 2025 10:16:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DTK6=5P=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1vHJWD-0001ed-MQ
 for xen-devel@lists.xenproject.org; Fri, 07 Nov 2025 10:16:33 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id d4715197-bbc2-11f0-9d17-b5c5bf9af7f9;
 Fri, 07 Nov 2025 11:16:31 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B30531515;
 Fri,  7 Nov 2025 02:16:22 -0800 (PST)
Received: from [10.57.40.58] (unknown [10.57.40.58])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C9F5E3F66E;
 Fri,  7 Nov 2025 02:16:17 -0800 (PST)
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
X-Inumbo-ID: d4715197-bbc2-11f0-9d17-b5c5bf9af7f9
Message-ID: <9f749c3e-4f93-40c1-b5c6-74d2ead92d00@arm.com>
Date: Fri, 7 Nov 2025 10:16:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/12] mm: enable lazy_mmu sections to nest
To: Alexander Gordeev <agordeev@linux.ibm.com>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Andreas Larsson <andreas@gaisler.com>,
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
 <48a4ecb5-3412-4d3f-9e43-535f8bee505f@arm.com>
 <d5435e75-036b-44a5-a989-722e13f94b3e-agordeev@linux.ibm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <d5435e75-036b-44a5-a989-722e13f94b3e-agordeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/11/2025 15:33, Alexander Gordeev wrote:
>> [...]
>>>>   static inline void lazy_mmu_mode_enable(void)
>>>>   {
>>>>  -	arch_enter_lazy_mmu_mode();
>>>>  +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
>>>>  +
>>>>  +	VM_WARN_ON_ONCE(state->nesting_level == U8_MAX);
>>>>  +	/* enable() must not be called while paused */
>>>>  +	VM_WARN_ON(state->nesting_level > 0 && !state->active);
>>>>  +
>>>>  +	if (state->nesting_level++ == 0) {
>>>>  +		arch_enter_lazy_mmu_mode();
>>>>  +		state->active = true;
>>>>  +	}
>>>>   }
>>>>
>>>> ... I think it make more sense to enable the state after the arch_**
>>>> call right.
>>> But then in_lazy_mmu_mode() would return false if called from
>>> arch_enter_lazy_mmu_mode(). Not big problem, but still..
>> The ordering of nesting_level/active was the way you expected in v3, but
>> the conclusion of the discussion with David H [1] is that it doesn't
>> really matter so I simplified the ordering in v4 - the arch hooks
>> shouldn't call in_lazy_mmu_mode() or inspect lazy_mmu_state.
>> arch_enter()/arch_leave() shouldn't need it anyway since they're called
>> once per outer section (not in nested sections). arch_flush() could
>> potentially do something different when nested, but that seems unlikely.
>>
>> - Kevin
>>
>> [1]
>> https://lore.kernel.org/all/af4414b6-617c-4dc8-bddc-3ea00d1f6f3b@redhat.com/
> I might be misunderstand this conversation, but it looked to me as a discussion
> about lazy_mmu_state::nesting_level value, not lazy_mmu_state::active.
>
> I do use in_lazy_mmu_mode() (lazy_mmu_state::active) check from the arch-
> callbacks. Here is the example (and likely the only case so far) where it hits:

Sorry I didn't mean arch callbacks in general, I meant the ones called
from lazy_mmu_mode_*, that is arch_*_lazy_mmu_mode.

Patch 8 also makes use of in_lazy_mmu_mode() in set_pte() et al. on arm64.

- Kevin

> static int kasan_populate_vmalloc_pte(pte_t *ptep, unsigned long addr,
> 				      void *_data)
> {
> 	lazy_mmu_mode_pause();
> 	...
> 	if (likely(pte_none(ptep_get(ptep)))) {
>
> 		/* Here set_pte() checks whether we are in lazy_mmu mode */
> 		set_pte_at(&init_mm, addr, ptep, pte);	<--- calls set_pte()
> 		data->pages[index] = NULL;
> 	}
> 	...
> 	lazy_mmu_mode_resume();
> 	...
> }
>
> So without in_lazy_mmu_mode() check above the arch-specific set_pte()
> implementation enters a wrong branch, which ends up in:
>
> [  394.503134] Call Trace:
> [  394.503137]  [<00007fffe01333f4>] dump_stack_lvl+0xbc/0xf0 FWIW 
> [  394.503143]  [<00007fffe010298c>] vpanic+0x1cc/0x418 
> [  394.503149]  [<00007fffe0102c7a>] panic+0xa2/0xa8 
> [  394.503154]  [<00007fffe01e7a8a>] check_panic_on_warn+0x8a/0xb0 
> [  394.503160]  [<00007fffe082d122>] end_report+0x72/0x110 
> [  394.503166]  [<00007fffe082d3e6>] kasan_report+0xc6/0x100 
> [  394.503171]  [<00007fffe01b9556>] ipte_batch_ptep_get+0x146/0x150 
> [  394.503176]  [<00007fffe0830096>] kasan_populate_vmalloc_pte+0xe6/0x1e0 
> [  394.503183]  [<00007fffe0718050>] apply_to_pte_range+0x1a0/0x570 
> [  394.503189]  [<00007fffe07260fa>] __apply_to_page_range+0x3ca/0x8f0 
> [  394.503195]  [<00007fffe0726648>] apply_to_page_range+0x28/0x40 
> [  394.503201]  [<00007fffe082fe34>] __kasan_populate_vmalloc+0x324/0x340 
> [  394.503207]  [<00007fffe076954e>] alloc_vmap_area+0x31e/0xbf0 
> [  394.503213]  [<00007fffe0770106>] __get_vm_area_node+0x1a6/0x2d0 
> [  394.503218]  [<00007fffe07716fa>] __vmalloc_node_range_noprof+0xba/0x260 
> [  394.503224]  [<00007fffe0771970>] __vmalloc_node_noprof+0xd0/0x110 
> [  394.503229]  [<00007fffe0771a22>] vmalloc_noprof+0x32/0x40 
> [  394.503234]  [<00007fff604eaa42>] full_fit_alloc_test+0xb2/0x3e0 [test_vmalloc] 
> [  394.503241]  [<00007fff604eb478>] test_func+0x488/0x760 [test_vmalloc] 
> [  394.503247]  [<00007fffe025ad68>] kthread+0x368/0x630 
> [  394.503253]  [<00007fffe01391e0>] __ret_from_fork+0xd0/0x490 
> [  394.503259]  [<00007fffe24e468a>] ret_from_fork+0xa/0x30 
>
> I could have cached lazy_mmu_state::active as arch-specific data
> and check it, but then what is the point to have it generalized?
>
> Thanks!

