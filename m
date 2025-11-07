Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 254E0C3FE32
	for <lists+xen-devel@lfdr.de>; Fri, 07 Nov 2025 13:26:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1157523.1486270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHLWi-0001kM-Ku; Fri, 07 Nov 2025 12:25:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1157523.1486270; Fri, 07 Nov 2025 12:25:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vHLWi-0001i3-IC; Fri, 07 Nov 2025 12:25:12 +0000
Received: by outflank-mailman (input) for mailman id 1157523;
 Fri, 07 Nov 2025 12:25:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Yjs=5P=arm.com=ryan.roberts@srs-se1.protection.inumbo.net>)
 id 1vHLWh-0001hw-78
 for xen-devel@lists.xenproject.org; Fri, 07 Nov 2025 12:25:11 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id ccbf810f-bbd4-11f0-9d17-b5c5bf9af7f9;
 Fri, 07 Nov 2025 13:25:09 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6E851515;
 Fri,  7 Nov 2025 04:25:00 -0800 (PST)
Received: from [10.57.86.134] (unknown [10.57.86.134])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF63F3F66E;
 Fri,  7 Nov 2025 04:25:03 -0800 (PST)
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
X-Inumbo-ID: ccbf810f-bbd4-11f0-9d17-b5c5bf9af7f9
Message-ID: <daa2025c-43da-4c16-9393-a90574d74f64@arm.com>
Date: Fri, 7 Nov 2025 12:25:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/12] powerpc/64s: Do not re-activate batched TLB
 flush
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
 <20251029100909.3381140-2-kevin.brodsky@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20251029100909.3381140-2-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29/10/2025 10:08, Kevin Brodsky wrote:
> From: Alexander Gordeev <agordeev@linux.ibm.com>
> 
> Since commit b9ef323ea168 ("powerpc/64s: Disable preemption in hash
> lazy mmu mode") a task can not be preempted while in lazy MMU mode.
> Therefore, the batch re-activation code is never called, so remove it.
> 
> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
>  arch/powerpc/include/asm/thread_info.h |  2 --
>  arch/powerpc/kernel/process.c          | 25 -------------------------
>  2 files changed, 27 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
> index b0f200aba2b3..97f35f9b1a96 100644
> --- a/arch/powerpc/include/asm/thread_info.h
> +++ b/arch/powerpc/include/asm/thread_info.h
> @@ -154,12 +154,10 @@ void arch_setup_new_exec(void);
>  /* Don't move TLF_NAPPING without adjusting the code in entry_32.S */
>  #define TLF_NAPPING		0	/* idle thread enabled NAP mode */
>  #define TLF_SLEEPING		1	/* suspend code enabled SLEEP mode */
> -#define TLF_LAZY_MMU		3	/* tlb_batch is active */
>  #define TLF_RUNLATCH		4	/* Is the runlatch enabled? */
>  
>  #define _TLF_NAPPING		(1 << TLF_NAPPING)
>  #define _TLF_SLEEPING		(1 << TLF_SLEEPING)
> -#define _TLF_LAZY_MMU		(1 << TLF_LAZY_MMU)
>  #define _TLF_RUNLATCH		(1 << TLF_RUNLATCH)
>  
>  #ifndef __ASSEMBLER__
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index eb23966ac0a9..9237dcbeee4a 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -1281,9 +1281,6 @@ struct task_struct *__switch_to(struct task_struct *prev,
>  {
>  	struct thread_struct *new_thread, *old_thread;
>  	struct task_struct *last;
> -#ifdef CONFIG_PPC_64S_HASH_MMU
> -	struct ppc64_tlb_batch *batch;
> -#endif
>  
>  	new_thread = &new->thread;
>  	old_thread = &current->thread;
> @@ -1291,14 +1288,6 @@ struct task_struct *__switch_to(struct task_struct *prev,
>  	WARN_ON(!irqs_disabled());
>  
>  #ifdef CONFIG_PPC_64S_HASH_MMU
> -	batch = this_cpu_ptr(&ppc64_tlb_batch);
> -	if (batch->active) {
> -		current_thread_info()->local_flags |= _TLF_LAZY_MMU;
> -		if (batch->index)
> -			__flush_tlb_pending(batch);
> -		batch->active = 0;
> -	}
> -
>  	/*
>  	 * On POWER9 the copy-paste buffer can only paste into
>  	 * foreign real addresses, so unprivileged processes can not
> @@ -1369,20 +1358,6 @@ struct task_struct *__switch_to(struct task_struct *prev,
>  	 */
>  
>  #ifdef CONFIG_PPC_BOOK3S_64
> -#ifdef CONFIG_PPC_64S_HASH_MMU
> -	/*
> -	 * This applies to a process that was context switched while inside
> -	 * arch_enter_lazy_mmu_mode(), to re-activate the batch that was
> -	 * deactivated above, before _switch(). This will never be the case
> -	 * for new tasks.
> -	 */
> -	if (current_thread_info()->local_flags & _TLF_LAZY_MMU) {
> -		current_thread_info()->local_flags &= ~_TLF_LAZY_MMU;
> -		batch = this_cpu_ptr(&ppc64_tlb_batch);
> -		batch->active = 1;
> -	}
> -#endif
> -
>  	/*
>  	 * Math facilities are masked out of the child MSR in copy_thread.
>  	 * A new task does not need to restore_math because it will


