Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF84AD85D4
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jun 2025 10:41:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013917.1392108 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPzyE-00077E-EQ; Fri, 13 Jun 2025 08:41:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013917.1392108; Fri, 13 Jun 2025 08:41:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPzyE-00074x-Aa; Fri, 13 Jun 2025 08:41:06 +0000
Received: by outflank-mailman (input) for mailman id 1013917;
 Fri, 13 Jun 2025 08:41:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SxNF=Y4=arm.com=ryan.roberts@srs-se1.protection.inumbo.net>)
 id 1uPzyD-00074r-AJ
 for xen-devel@lists.xenproject.org; Fri, 13 Jun 2025 08:41:05 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 1cc88b9e-4832-11f0-b894-0df219b8e170;
 Fri, 13 Jun 2025 10:40:51 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5C1C41CDD;
 Fri, 13 Jun 2025 01:40:42 -0700 (PDT)
Received: from [10.57.84.117] (unknown [10.57.84.117])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6DA213F66E;
 Fri, 13 Jun 2025 01:41:00 -0700 (PDT)
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
X-Inumbo-ID: 1cc88b9e-4832-11f0-b894-0df219b8e170
Message-ID: <0ba9820d-f498-42b0-a663-6f4dca5374b4@arm.com>
Date: Fri, 13 Jun 2025 09:40:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] sparc/mm: Do not disable preemption in lazy MMU mode
Content-Language: en-GB
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 Hugh Dickins <hughd@google.com>, Nicholas Piggin <npiggin@gmail.com>,
 Guenter Roeck <linux@roeck-us.net>, Juergen Gross <jgross@suse.com>,
 Jeremy Fitzhardinge <jeremy@goop.org>
References: <cover.1749747752.git.agordeev@linux.ibm.com>
 <db1559396c38c1dfe97a6d929412d7d6244f64b8.1749747752.git.agordeev@linux.ibm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <db1559396c38c1dfe97a6d929412d7d6244f64b8.1749747752.git.agordeev@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/06/2025 18:36, Alexander Gordeev wrote:
> Commit a1d416bf9faf ("sparc/mm: disable preemption in lazy mmu mode")
> is not necessary anymore, since the lazy MMU mode is entered with a
> spinlock held and sparc does not support Real-Time. Thus, upon entering
> the lazy mode the preemption is already disabled.

Surely given Sparc knows that it doesn't support PREEMPT_RT, it is better for
it's implementation to explicitly disable preemption rather than rely on the
spinlock to do it, since the spinlock penalizes other arches unnecessarily? It
also prevents multiple CPUs from updating (different areas of) kernel pgtables
in parallel. The property Sparc needs is for the task to stay on the same CPU
without interruption, right? Same goes for powerpc.

> 
> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
> ---
>  arch/sparc/include/asm/tlbflush_64.h |  2 +-
>  arch/sparc/mm/tlb.c                  | 12 ++++++++----
>  2 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/sparc/include/asm/tlbflush_64.h b/arch/sparc/include/asm/tlbflush_64.h
> index 8b8cdaa69272..a6d8068fb211 100644
> --- a/arch/sparc/include/asm/tlbflush_64.h
> +++ b/arch/sparc/include/asm/tlbflush_64.h
> @@ -44,7 +44,7 @@ void flush_tlb_kernel_range(unsigned long start, unsigned long end);
>  void flush_tlb_pending(void);
>  void arch_enter_lazy_mmu_mode(void);
>  void arch_leave_lazy_mmu_mode(void);
> -#define arch_flush_lazy_mmu_mode()      do {} while (0)
> +void arch_flush_lazy_mmu_mode(void);
>  
>  /* Local cpu only.  */
>  void __flush_tlb_all(void);
> diff --git a/arch/sparc/mm/tlb.c b/arch/sparc/mm/tlb.c
> index a35ddcca5e76..e46dfd5f2583 100644
> --- a/arch/sparc/mm/tlb.c
> +++ b/arch/sparc/mm/tlb.c
> @@ -52,10 +52,9 @@ void flush_tlb_pending(void)
>  
>  void arch_enter_lazy_mmu_mode(void)
>  {
> -	struct tlb_batch *tb;
> +	struct tlb_batch *tb = this_cpu_ptr(&tlb_batch);
>  
> -	preempt_disable();
> -	tb = this_cpu_ptr(&tlb_batch);
> +	VM_WARN_ON_ONCE(preemptible());
>  	tb->active = 1;
>  }
>  
> @@ -63,10 +62,15 @@ void arch_leave_lazy_mmu_mode(void)
>  {
>  	struct tlb_batch *tb = this_cpu_ptr(&tlb_batch);
>  
> +	VM_WARN_ON_ONCE(preemptible());
>  	if (tb->tlb_nr)
>  		flush_tlb_pending();
>  	tb->active = 0;
> -	preempt_enable();
> +}
> +
> +void arch_flush_lazy_mmu_mode(void)
> +{
> +	VM_WARN_ON_ONCE(preemptible());
>  }
>  
>  static void tlb_batch_add_one(struct mm_struct *mm, unsigned long vaddr,


