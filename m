Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D04B45582
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 13:01:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111755.1460348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuUBu-0005GF-3g; Fri, 05 Sep 2025 11:01:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111755.1460348; Fri, 05 Sep 2025 11:01:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuUBt-0005Dy-Vq; Fri, 05 Sep 2025 11:01:13 +0000
Received: by outflank-mailman (input) for mailman id 1111755;
 Fri, 05 Sep 2025 11:01:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Tb/H=3Q=kernel.org=rppt@srs-se1.protection.inumbo.net>)
 id 1uuUBs-0005Dr-3P
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 11:01:12 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9e054c3f-8a47-11f0-9809-7dc792cee155;
 Fri, 05 Sep 2025 13:01:05 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CACB4442A6;
 Fri,  5 Sep 2025 11:01:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2257C4CEF1;
 Fri,  5 Sep 2025 11:00:53 +0000 (UTC)
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
X-Inumbo-ID: 9e054c3f-8a47-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757070063;
	bh=YZ1wTIYoB930tSA5MeqtdhO0LxdCLchTUQFtsum00QY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U7+DnpZ0s1JKbZszxSjLy0wzG4FuSPqezXeI+JVM+MWhXKMk7hbSMLMR/Ap70xViw
	 Grd6dhed7yIRR8Yu73fJN0N7pkSYFsDBBJo92L9gty0NMlP0j/ofYzR8Udwhhqz0oh
	 CUbTDNzSsrto9aiXPTcXZ/bGs5k+wjoB6qyCquH8g/JPTbP7OqDNsG+bte2OrVpi4n
	 zx6H4iTAqk8cmGshjWzK/jnlqFQq/hJysU/x9N1c9QnwDh2XIGq4oxaydCWq1cwWGV
	 2fRPyoqYacVZpZfy0SFEibM7KjqfNwOBpyIxsFAfubouuDw7Z5Ombt9MKgcN6WzQfQ
	 4CK8xb4S08BQg==
Date: Fri, 5 Sep 2025 14:00:50 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	"H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
	Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>, Nicholas Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/7] mm: remove arch_flush_lazy_mmu_mode()
Message-ID: <aLrC4reKPAz6YFn1@kernel.org>
References: <20250904125736.3918646-1-kevin.brodsky@arm.com>
 <20250904125736.3918646-2-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250904125736.3918646-2-kevin.brodsky@arm.com>

On Thu, Sep 04, 2025 at 01:57:30PM +0100, Kevin Brodsky wrote:
> This function has only ever been used in arch/x86, so there is no
> need for other architectures to implement it. Remove it from
> linux/pgtable.h and all architectures besides x86.
> 
> The arm64 implementation is not empty but it is only called from
> arch_leave_lazy_mmu_mode(), so we can simply fold it there.
> 
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

> ---
>  arch/arm64/include/asm/pgtable.h                   | 9 +--------
>  arch/powerpc/include/asm/book3s/64/tlbflush-hash.h | 2 --
>  arch/sparc/include/asm/tlbflush_64.h               | 1 -
>  arch/x86/include/asm/pgtable.h                     | 3 ++-
>  include/linux/pgtable.h                            | 1 -
>  5 files changed, 3 insertions(+), 13 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index abd2dee416b3..728d7b6ed20a 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -101,21 +101,14 @@ static inline void arch_enter_lazy_mmu_mode(void)
>  	set_thread_flag(TIF_LAZY_MMU);
>  }
>  
> -static inline void arch_flush_lazy_mmu_mode(void)
> +static inline void arch_leave_lazy_mmu_mode(void)
>  {
>  	if (in_interrupt())
>  		return;
>  
>  	if (test_and_clear_thread_flag(TIF_LAZY_MMU_PENDING))
>  		emit_pte_barriers();
> -}
> -
> -static inline void arch_leave_lazy_mmu_mode(void)
> -{
> -	if (in_interrupt())
> -		return;
>  
> -	arch_flush_lazy_mmu_mode();
>  	clear_thread_flag(TIF_LAZY_MMU);
>  }
>  
> diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> index 146287d9580f..176d7fd79eeb 100644
> --- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> +++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
> @@ -55,8 +55,6 @@ static inline void arch_leave_lazy_mmu_mode(void)
>  	preempt_enable();
>  }
>  
> -#define arch_flush_lazy_mmu_mode()      do {} while (0)
> -
>  extern void hash__tlbiel_all(unsigned int action);
>  
>  extern void flush_hash_page(unsigned long vpn, real_pte_t pte, int psize,
> diff --git a/arch/sparc/include/asm/tlbflush_64.h b/arch/sparc/include/asm/tlbflush_64.h
> index 8b8cdaa69272..cd144eb31bdd 100644
> --- a/arch/sparc/include/asm/tlbflush_64.h
> +++ b/arch/sparc/include/asm/tlbflush_64.h
> @@ -44,7 +44,6 @@ void flush_tlb_kernel_range(unsigned long start, unsigned long end);
>  void flush_tlb_pending(void);
>  void arch_enter_lazy_mmu_mode(void);
>  void arch_leave_lazy_mmu_mode(void);
> -#define arch_flush_lazy_mmu_mode()      do {} while (0)
>  
>  /* Local cpu only.  */
>  void __flush_tlb_all(void);
> diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
> index e33df3da6980..14fd672bc9b2 100644
> --- a/arch/x86/include/asm/pgtable.h
> +++ b/arch/x86/include/asm/pgtable.h
> @@ -117,7 +117,8 @@ extern pmdval_t early_pmd_flags;
>  #define pte_val(x)	native_pte_val(x)
>  #define __pte(x)	native_make_pte(x)
>  
> -#define arch_end_context_switch(prev)	do {} while(0)
> +#define arch_end_context_switch(prev)	do {} while (0)
> +#define arch_flush_lazy_mmu_mode()	do {} while (0)
>  #endif	/* CONFIG_PARAVIRT_XXL */
>  
>  static inline pmd_t pmd_set_flags(pmd_t pmd, pmdval_t set)
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 4c035637eeb7..8848e132a6be 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -234,7 +234,6 @@ static inline int pmd_dirty(pmd_t pmd)
>  #ifndef __HAVE_ARCH_ENTER_LAZY_MMU_MODE
>  #define arch_enter_lazy_mmu_mode()	do {} while (0)
>  #define arch_leave_lazy_mmu_mode()	do {} while (0)
> -#define arch_flush_lazy_mmu_mode()	do {} while (0)
>  #endif
>  
>  #ifndef pte_batch_hint
> -- 
> 2.47.0
> 

-- 
Sincerely yours,
Mike.

