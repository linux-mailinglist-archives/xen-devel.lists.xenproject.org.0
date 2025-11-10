Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB31C46067
	for <lists+xen-devel@lfdr.de>; Mon, 10 Nov 2025 11:45:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158221.1486591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIPOc-0008Ux-6M; Mon, 10 Nov 2025 10:45:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158221.1486591; Mon, 10 Nov 2025 10:45:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vIPOc-0008TT-3e; Mon, 10 Nov 2025 10:45:14 +0000
Received: by outflank-mailman (input) for mailman id 1158221;
 Mon, 10 Nov 2025 10:45:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bLcL=5S=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1vIPOa-0008TK-UQ
 for xen-devel@lists.xenproject.org; Mon, 10 Nov 2025 10:45:12 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 5512a26f-be22-11f0-9d18-b5c5bf9af7f9;
 Mon, 10 Nov 2025 11:45:11 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3DC26497;
 Mon, 10 Nov 2025 02:45:03 -0800 (PST)
Received: from [10.57.39.147] (unknown [10.57.39.147])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78B2F3F66E;
 Mon, 10 Nov 2025 02:45:03 -0800 (PST)
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
X-Inumbo-ID: 5512a26f-be22-11f0-9d18-b5c5bf9af7f9
Message-ID: <b44825dd-aef9-4d3e-91fd-a44122264c23@arm.com>
Date: Mon, 10 Nov 2025 11:45:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/12] mm: introduce generic lazy_mmu helpers
To: Ryan Roberts <ryan.roberts@arm.com>, linux-mm@kvack.org
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
 Peter Zijlstra <peterz@infradead.org>, Suren Baghdasaryan
 <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-7-kevin.brodsky@arm.com>
 <71418b31-aedb-4600-9558-842515dd6c44@arm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <71418b31-aedb-4600-9558-842515dd6c44@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07/11/2025 14:26, Ryan Roberts wrote:
> On 29/10/2025 10:09, Kevin Brodsky wrote:
>> [...]
>>
>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>> index b8d37eb037fc..d9c8e94f140f 100644
>> --- a/arch/arm64/mm/mmu.c
>> +++ b/arch/arm64/mm/mmu.c
>> @@ -731,7 +731,7 @@ int split_kernel_leaf_mapping(unsigned long start, unsigned long end)
>>  		return -EINVAL;
>>  
>>  	mutex_lock(&pgtable_split_lock);
>> -	arch_enter_lazy_mmu_mode();
>> +	lazy_mmu_mode_enable();
>>  
>>  	/*
>>  	 * The split_kernel_leaf_mapping_locked() may sleep, it is not a
> This is a bit unfortunate, IMHO. The rest of this comment explains that although
> you're not supposed to sleep inside lazy mmu mode, it's fine for arm64's
> implementation. But we are no longer calling arm64's implementation; we are
> calling a generic function, which does who knows what.
>
> I think it all still works, but we are no longer containing our assumptions in
> arm64 code. We are relying on implementation details of generic code.

I see your point. The change itself is still correct (and required
considering patch 8), but maybe the documentation of the generic
interface should be clarified to guarantee that the generic layer can
itself cope with sleeping - without any guarantee regarding the
behaviour of arch_*_lazy_mmu_mode.

>> [...]
>>
>> diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
>> index e33df3da6980..14fd672bc9b2 100644
>> --- a/arch/x86/include/asm/pgtable.h
>> +++ b/arch/x86/include/asm/pgtable.h
>> @@ -117,7 +117,8 @@ extern pmdval_t early_pmd_flags;
>>  #define pte_val(x)	native_pte_val(x)
>>  #define __pte(x)	native_make_pte(x)
>>  
>> -#define arch_end_context_switch(prev)	do {} while(0)
>> +#define arch_end_context_switch(prev)	do {} while (0)
>> +#define arch_flush_lazy_mmu_mode()	do {} while (0)
> Andrew converted over the default version of this (which you have removed with
> this commit) to be static inline instead of the do/while guff. Perhaps you
> should try to preserve that improvement here?
>
> See Commit d02ac836e4d6 ("include/linux/pgtable.h: convert
> arch_enter_lazy_mmu_mode() and friends to static inlines")

Good point, I suppose I could also convert arch_end_context_switch()
while at it.

>>  #endif	/* CONFIG_PARAVIRT_XXL */
>>  
>>  static inline pmd_t pmd_set_flags(pmd_t pmd, pmdval_t set)
>> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
>> index fc35a0543f01..d16ba1d32169 100644
>> --- a/fs/proc/task_mmu.c
>> +++ b/fs/proc/task_mmu.c
>> @@ -2703,7 +2703,7 @@ static int pagemap_scan_pmd_entry(pmd_t *pmd, unsigned long start,
>>  		return 0;
>>  	}
>>  
>> -	arch_enter_lazy_mmu_mode();
>> +	lazy_mmu_mode_enable();
>>  
>>  	if ((p->arg.flags & PM_SCAN_WP_MATCHING) && !p->vec_out) {
>>  		/* Fast path for performing exclusive WP */
>> @@ -2773,7 +2773,7 @@ static int pagemap_scan_pmd_entry(pmd_t *pmd, unsigned long start,
>>  	if (flush_end)
>>  		flush_tlb_range(vma, start, addr);
>>  
>> -	arch_leave_lazy_mmu_mode();
>> +	lazy_mmu_mode_disable();
>>  	pte_unmap_unlock(start_pte, ptl);
>>  
>>  	cond_resched();
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index 9894366e768b..b5fdf32c437f 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -231,10 +231,31 @@ static inline int pmd_dirty(pmd_t pmd)
>>   * held, but for kernel PTE updates, no lock is held). Nesting is not permitted
>>   * and the mode cannot be used in interrupt context.
>>   */
>> -#ifndef CONFIG_ARCH_HAS_LAZY_MMU_MODE
>> -static inline void arch_enter_lazy_mmu_mode(void) {}
>> -static inline void arch_leave_lazy_mmu_mode(void) {}
>> -static inline void arch_flush_lazy_mmu_mode(void) {}
>> +#ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
>> +static inline void lazy_mmu_mode_enable(void)
>> +{
>> +	arch_enter_lazy_mmu_mode();
>> +}
>> +
>> +static inline void lazy_mmu_mode_disable(void)
>> +{
>> +	arch_leave_lazy_mmu_mode();
>> +}
>> +
>> +static inline void lazy_mmu_mode_pause(void)
>> +{
>> +	arch_leave_lazy_mmu_mode();
>> +}
>> +
>> +static inline void lazy_mmu_mode_resume(void)
>> +{
>> +	arch_enter_lazy_mmu_mode();
>> +}
> It would be good to add documentation blocks for each of these.

I considered it, but then realised that these functions are much better
explained together (see comment added above in patch 7). Maybe a short
description for each that refers to the big comment above? That wouldn't
work well for the generated kernel-doc though...

- Kevin 

