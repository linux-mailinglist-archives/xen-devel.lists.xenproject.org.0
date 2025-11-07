Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A0E3C407F0
	for <lists+xen-devel@lfdr.de>; Fri, 07 Nov 2025 16:01:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157649.1486351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHNwf-0006yY-29; Fri, 07 Nov 2025 15:00:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157649.1486351; Fri, 07 Nov 2025 15:00:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHNwe-0006x1-Ur; Fri, 07 Nov 2025 15:00:08 +0000
Received: by outflank-mailman (input) for mailman id 1157649;
 Fri, 07 Nov 2025 15:00:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Yjs=5P=arm.com=ryan.roberts@srs-se1.protection.inumbo.net>)
 id 1vHNwd-0006wv-MT
 for xen-devel@lists.xenproject.org; Fri, 07 Nov 2025 15:00:07 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 6ee8d330-bbea-11f0-980a-7dc792cee155;
 Fri, 07 Nov 2025 16:00:01 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35D311515;
 Fri,  7 Nov 2025 06:59:52 -0800 (PST)
Received: from [10.57.86.134] (unknown [10.57.86.134])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 611CD3F694;
 Fri,  7 Nov 2025 06:59:55 -0800 (PST)
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
X-Inumbo-ID: 6ee8d330-bbea-11f0-980a-7dc792cee155
Message-ID: <999feffa-5d1d-42e3-bd3a-d949f2a9de9d@arm.com>
Date: Fri, 7 Nov 2025 14:59:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/12] mm: enable lazy_mmu sections to nest
Content-Language: en-GB
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
 Peter Zijlstra <peterz@infradead.org>, Suren Baghdasaryan
 <surenb@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 xen-devel@lists.xenproject.org, x86@kernel.org
References: <20251029100909.3381140-1-kevin.brodsky@arm.com>
 <20251029100909.3381140-8-kevin.brodsky@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20251029100909.3381140-8-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 29/10/2025 10:09, Kevin Brodsky wrote:
> Despite recent efforts to prevent lazy_mmu sections from nesting, it
> remains difficult to ensure that it never occurs - and in fact it
> does occur on arm64 in certain situations (CONFIG_DEBUG_PAGEALLOC).
> Commit 1ef3095b1405 ("arm64/mm: Permit lazy_mmu_mode to be nested")
> made nesting tolerable on arm64, but without truly supporting it:
> the inner call to leave() disables the batching optimisation before
> the outer section ends.
> 
> This patch actually enables lazy_mmu sections to nest by tracking
> the nesting level in task_struct, in a similar fashion to e.g.
> pagefault_{enable,disable}(). This is fully handled by the generic
> lazy_mmu helpers that were recently introduced.
> 
> lazy_mmu sections were not initially intended to nest, so we need to
> clarify the semantics w.r.t. the arch_*_lazy_mmu_mode() callbacks.
> This patch takes the following approach:
> 
> * The outermost calls to lazy_mmu_mode_{enable,disable}() trigger
>   calls to arch_{enter,leave}_lazy_mmu_mode() - this is unchanged.
> 
> * Nested calls to lazy_mmu_mode_{enable,disable}() are not forwarded
>   to the arch via arch_{enter,leave} - lazy MMU remains enabled so
>   the assumption is that these callbacks are not relevant. However,
>   existing code may rely on a call to disable() to flush any batched
>   state, regardless of nesting. arch_flush_lazy_mmu_mode() is
>   therefore called in that situation.
> 
> A separate interface was recently introduced to temporarily pause
> the lazy MMU mode: lazy_mmu_mode_{pause,resume}(). pause() fully
> exits the mode *regardless of the nesting level*, and resume()
> restores the mode at the same nesting level.
> 
> Whether the mode is actually enabled or not at any point is tracked
> by a separate "active" field in task_struct; this makes it possible
> to check invariants in the generic API, and to expose a new
> in_lazy_mmu_mode() helper to replace the various ways arch's
> currently track whether the mode is enabled (this will be done in
> later patches).
> 
> In summary (nesting/active represent the values *after* the call):
> 
> lazy_mmu_mode_enable()		-> arch_enter()	    nesting=1 active=1
>     lazy_mmu_mode_enable()	-> ø		    nesting=2 active=1
> 	lazy_mmu_mode_pause()	-> arch_leave()     nesting=2 active=0
> 	lazy_mmu_mode_resume()	-> arch_enter()     nesting=2 active=1
>     lazy_mmu_mode_disable()	-> arch_flush()     nesting=1 active=1
> lazy_mmu_mode_disable()		-> arch_leave()     nesting=0 active=0
> 
> Note: in_lazy_mmu_mode() is added to <linux/sched.h> to allow arch
> headers included by <linux/pgtable.h> to use it.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  arch/arm64/include/asm/pgtable.h | 12 ------
>  include/linux/mm_types_task.h    |  5 +++
>  include/linux/pgtable.h          | 67 ++++++++++++++++++++++++++++++--
>  include/linux/sched.h            | 16 ++++++++
>  4 files changed, 84 insertions(+), 16 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 54f8d6bb6f22..535435248923 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -82,18 +82,6 @@ static inline void queue_pte_barriers(void)
>  
>  static inline void arch_enter_lazy_mmu_mode(void)
>  {
> -	/*
> -	 * lazy_mmu_mode is not supposed to permit nesting. But in practice this
> -	 * does happen with CONFIG_DEBUG_PAGEALLOC, where a page allocation
> -	 * inside a lazy_mmu_mode section (such as zap_pte_range()) will change
> -	 * permissions on the linear map with apply_to_page_range(), which
> -	 * re-enters lazy_mmu_mode. So we tolerate nesting in our
> -	 * implementation. The first call to arch_leave_lazy_mmu_mode() will
> -	 * flush and clear the flag such that the remainder of the work in the
> -	 * outer nest behaves as if outside of lazy mmu mode. This is safe and
> -	 * keeps tracking simple.
> -	 */
> -
>  	if (in_interrupt())
>  		return;
>  
> diff --git a/include/linux/mm_types_task.h b/include/linux/mm_types_task.h
> index a82aa80c0ba4..632d404f8191 100644
> --- a/include/linux/mm_types_task.h
> +++ b/include/linux/mm_types_task.h
> @@ -88,4 +88,9 @@ struct tlbflush_unmap_batch {
>  #endif
>  };
>  
> +struct lazy_mmu_state {
> +	u8 nesting_level;
> +	bool active;
> +};
> +
>  #endif /* _LINUX_MM_TYPES_TASK_H */
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index b5fdf32c437f..e6064e00b22d 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -228,27 +228,86 @@ static inline int pmd_dirty(pmd_t pmd)
>   * of the lazy mode. So the implementation must assume preemption may be enabled
>   * and cpu migration is possible; it must take steps to be robust against this.
>   * (In practice, for user PTE updates, the appropriate page table lock(s) are
> - * held, but for kernel PTE updates, no lock is held). Nesting is not permitted
> - * and the mode cannot be used in interrupt context.
> + * held, but for kernel PTE updates, no lock is held). The mode cannot be used
> + * in interrupt context.

"The mode cannot be used in interrupt context"; except it is for arm64. KFENCE
and/or DEBUG_PAGEALLOC will request the arch to change linear map permissions,
which will enter lazy mmu (now using the new generic API). This can happen in
softirq context.


> + *
> + * The lazy MMU mode is enabled for a given block of code using:
> + *
> + *   lazy_mmu_mode_enable();
> + *   <code>
> + *   lazy_mmu_mode_disable();
> + *
> + * Nesting is permitted: <code> may itself use an enable()/disable() pair.
> + * A nested call to enable() has no functional effect; however disable() causes
> + * any batched architectural state to be flushed regardless of nesting. After a
> + * call to disable(), the caller can therefore rely on all previous page table
> + * modifications to have taken effect, but the lazy MMU mode may still be
> + * enabled.
> + *
> + * In certain cases, it may be desirable to temporarily pause the lazy MMU mode.
> + * This can be done using:
> + *
> + *   lazy_mmu_mode_pause();
> + *   <code>
> + *   lazy_mmu_mode_resume();
> + *
> + * This sequence must only be used if the lazy MMU mode is already enabled.
> + * pause() ensures that the mode is exited regardless of the nesting level;
> + * resume() re-enters the mode at the same nesting level. <code> must not modify
> + * the lazy MMU state (i.e. it must not call any of the lazy_mmu_mode_*
> + * helpers).
> + *
> + * in_lazy_mmu_mode() can be used to check whether the lazy MMU mode is
> + * currently enabled.
>   */

Nice documentation!

>  #ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
>  static inline void lazy_mmu_mode_enable(void)
>  {
> -	arch_enter_lazy_mmu_mode();
> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
> +
> +	VM_WARN_ON_ONCE(state->nesting_level == U8_MAX);
> +	/* enable() must not be called while paused */
> +	VM_WARN_ON(state->nesting_level > 0 && !state->active);
> +
> +	if (state->nesting_level++ == 0) {

Hmm... for the arm64 case of calling this in an interrupt, Is it safe?

If a task is calling this function and gets interrupted here, nesting_level==1
but active==false. The interrupt then calls this function and increments from 1
to 2 but arch_enter_lazy_mmu_mode() hasn't been called.

More dangerously (I think), when the interrupt handler calls
lazy_mmu_mode_disable(), it will end up calling arch_flush_lazy_mmu_mode() which
could be an issue because as far as the arch is concerned, it's not in lazy mode.

The current arm64 implementation works because setting and clearing the thread
flags is atomic.

Perhaps you need to disable preemption around the if block?

> +		state->active = true;
> +		arch_enter_lazy_mmu_mode();
> +	}
>  }
>  
>  static inline void lazy_mmu_mode_disable(void)
>  {
> -	arch_leave_lazy_mmu_mode();
> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
> +
> +	VM_WARN_ON_ONCE(state->nesting_level == 0);
> +	VM_WARN_ON(!state->active);
> +
> +	if (--state->nesting_level == 0) {
> +		state->active = false;
> +		arch_leave_lazy_mmu_mode();
> +	} else {
> +		/* Exiting a nested section */
> +		arch_flush_lazy_mmu_mode();
> +	}
>  }
>  
>  static inline void lazy_mmu_mode_pause(void)
>  {
> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
> +
> +	VM_WARN_ON(state->nesting_level == 0 || !state->active);

nit: do you need the first condition? I think when nesting_level==0, we expect
to be !active?

> +
> +	state->active = false;
>  	arch_leave_lazy_mmu_mode();
>  }
>  
>  static inline void lazy_mmu_mode_resume(void)
>  {
> +	struct lazy_mmu_state *state = &current->lazy_mmu_state;
> +
> +	VM_WARN_ON(state->nesting_level == 0 || state->active);

Similar argument?

> +
> +	state->active = true;
>  	arch_enter_lazy_mmu_mode();
>  }
>  #else
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index cbb7340c5866..11566d973f42 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -1441,6 +1441,10 @@ struct task_struct {
>  
>  	struct page_frag		task_frag;
>  
> +#ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
> +	struct lazy_mmu_state		lazy_mmu_state;
> +#endif
> +
>  #ifdef CONFIG_TASK_DELAY_ACCT
>  	struct task_delay_info		*delays;
>  #endif
> @@ -1724,6 +1728,18 @@ static inline char task_state_to_char(struct task_struct *tsk)
>  	return task_index_to_char(task_state_index(tsk));
>  }
>  
> +#ifdef CONFIG_ARCH_HAS_LAZY_MMU_MODE
> +static inline bool in_lazy_mmu_mode(void)
> +{
> +	return current->lazy_mmu_state.active;
> +}
> +#else
> +static inline bool in_lazy_mmu_mode(void)
> +{
> +	return false;

Just pointing out that this isn't really a correct implementation:

lazy_mmu_mode_enable()
ASSERT(in_lazy_mmu_mode()) << triggers for arches without lazy mmu
lazy_mmu_mode_disable()

Although it probably doesn't matter in practice?

Thanks,
Ryan

> +}
> +#endif
> +
>  extern struct pid *cad_pid;
>  
>  /*


