Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7608666B69B
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 05:28:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478309.741408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHH6J-00066V-Ah; Mon, 16 Jan 2023 04:28:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478309.741408; Mon, 16 Jan 2023 04:28:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHH6J-00063f-7d; Mon, 16 Jan 2023 04:28:03 +0000
Received: by outflank-mailman (input) for mailman id 478309;
 Mon, 16 Jan 2023 04:28:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KGc4=5N=csail.mit.edu=srivatsa@srs-se1.protection.inumbo.net>)
 id 1pHH6H-00063Z-Gw
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 04:28:01 +0000
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu
 [128.30.2.78]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 264d1602-9556-11ed-b8d0-410ff93cb8f0;
 Mon, 16 Jan 2023 05:27:57 +0100 (CET)
Received: from c-24-17-218-140.hsd1.wa.comcast.net ([24.17.218.140]
 helo=srivatsab3MD6R.vmware.com)
 by outgoing2021.csail.mit.edu with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.95)
 (envelope-from <srivatsa@csail.mit.edu>) id 1pHH69-00EU45-Mo;
 Sun, 15 Jan 2023 23:27:53 -0500
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
X-Inumbo-ID: 264d1602-9556-11ed-b8d0-410ff93cb8f0
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org, virtualization@lists.linux-foundation.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Alexey Makhalov <amakhalov@vmware.com>,
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org
References: <20230112152132.4399-1-jgross@suse.com>
From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Subject: Re: [PATCH] x86/paravirt: merge activate_mm and dup_mmap callbacks
Message-ID: <3fcb5078-852e-0886-c084-7fb0cfa5b757@csail.mit.edu>
Date: Sun, 15 Jan 2023 20:27:50 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20230112152132.4399-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit


Hi Juergen,

On 1/12/23 7:21 AM, Juergen Gross wrote:
> The two paravirt callbacks .mmu.activate_mm and .mmu.dup_mmap are
> sharing the same implementations in all cases: for Xen PV guests they
> are pinning the PGD of the new mm_struct, and for all other cases
> they are a NOP.
> 

I was expecting that the duplicated functions xen_activate_mm() and
xen_dup_mmap() would be merged into a common one, and that both
.mmu.activate_mm and .mmu.dup_mmap callbacks would be mapped to that
common implementation for Xen PV.

> So merge them to a common callback .mmu.enter_mmap (in contrast to the
> corresponding already existing .mmu.exit_mmap).
> 

Instead, this patch seems to be merging the callbacks themselves...

I see that's not an issue right now since there is no other actual
user for these callbacks. But are we sure that merging the callbacks
just because the current user (Xen PV) has the same implementation for
both is a good idea? The callbacks are invoked at distinct points from
fork/exec, so wouldn't it be valuable to retain that distinction in
semantics in the callbacks as well?

However, if you believe that two separate callbacks are not really
required here (because there is no significant difference in what they
mean, rather than because their callback implementations happen to be
the same right now), then could you please expand on this and call it
out in the commit message, please?

Thank you!

Regards,
Srivatsa
VMware Photon OS

> As the first parameter of the old callbacks isn't used, drop it from
> the replacement one.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>  arch/x86/include/asm/mmu_context.h    |  4 ++--
>  arch/x86/include/asm/paravirt.h       | 14 +++-----------
>  arch/x86/include/asm/paravirt_types.h |  7 ++-----
>  arch/x86/kernel/paravirt.c            |  3 +--
>  arch/x86/xen/mmu_pv.c                 | 12 ++----------
>  5 files changed, 10 insertions(+), 30 deletions(-)
> 
> diff --git a/arch/x86/include/asm/mmu_context.h b/arch/x86/include/asm/mmu_context.h
> index b8d40ddeab00..6a14b6c2165c 100644
> --- a/arch/x86/include/asm/mmu_context.h
> +++ b/arch/x86/include/asm/mmu_context.h
> @@ -134,7 +134,7 @@ extern void switch_mm_irqs_off(struct mm_struct *prev, struct mm_struct *next,
>  
>  #define activate_mm(prev, next)			\
>  do {						\
> -	paravirt_activate_mm((prev), (next));	\
> +	paravirt_enter_mmap(next);		\
>  	switch_mm((prev), (next), NULL);	\
>  } while (0);
>  
> @@ -167,7 +167,7 @@ static inline void arch_dup_pkeys(struct mm_struct *oldmm,
>  static inline int arch_dup_mmap(struct mm_struct *oldmm, struct mm_struct *mm)
>  {
>  	arch_dup_pkeys(oldmm, mm);
> -	paravirt_arch_dup_mmap(oldmm, mm);
> +	paravirt_enter_mmap(mm);
>  	return ldt_dup_context(oldmm, mm);
>  }
>  
> diff --git a/arch/x86/include/asm/paravirt.h b/arch/x86/include/asm/paravirt.h
> index 73e9522db7c1..07bbdceaf35a 100644
> --- a/arch/x86/include/asm/paravirt.h
> +++ b/arch/x86/include/asm/paravirt.h
> @@ -332,16 +332,9 @@ static inline void tss_update_io_bitmap(void)
>  }
>  #endif
>  
> -static inline void paravirt_activate_mm(struct mm_struct *prev,
> -					struct mm_struct *next)
> +static inline void paravirt_enter_mmap(struct mm_struct *next)
>  {
> -	PVOP_VCALL2(mmu.activate_mm, prev, next);
> -}
> -
> -static inline void paravirt_arch_dup_mmap(struct mm_struct *oldmm,
> -					  struct mm_struct *mm)
> -{
> -	PVOP_VCALL2(mmu.dup_mmap, oldmm, mm);
> +	PVOP_VCALL1(mmu.enter_mmap, next);
>  }
>  
>  static inline int paravirt_pgd_alloc(struct mm_struct *mm)
> @@ -787,8 +780,7 @@ extern void default_banner(void);
>  
>  #ifndef __ASSEMBLY__
>  #ifndef CONFIG_PARAVIRT_XXL
> -static inline void paravirt_arch_dup_mmap(struct mm_struct *oldmm,
> -					  struct mm_struct *mm)
> +static inline void paravirt_enter_mmap(struct mm_struct *mm)
>  {
>  }
>  #endif
> diff --git a/arch/x86/include/asm/paravirt_types.h b/arch/x86/include/asm/paravirt_types.h
> index 8c1da419260f..71bf64b963df 100644
> --- a/arch/x86/include/asm/paravirt_types.h
> +++ b/arch/x86/include/asm/paravirt_types.h
> @@ -164,11 +164,8 @@ struct pv_mmu_ops {
>  	unsigned long (*read_cr3)(void);
>  	void (*write_cr3)(unsigned long);
>  
> -	/* Hooks for intercepting the creation/use of an mm_struct. */
> -	void (*activate_mm)(struct mm_struct *prev,
> -			    struct mm_struct *next);
> -	void (*dup_mmap)(struct mm_struct *oldmm,
> -			 struct mm_struct *mm);
> +	/* Hook for intercepting the creation/use of an mm_struct. */
> +	void (*enter_mmap)(struct mm_struct *mm);
>  
>  	/* Hooks for allocating and freeing a pagetable top-level */
>  	int  (*pgd_alloc)(struct mm_struct *mm);
> diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
> index 327757afb027..ff1109b9c6cd 100644
> --- a/arch/x86/kernel/paravirt.c
> +++ b/arch/x86/kernel/paravirt.c
> @@ -352,8 +352,7 @@ struct paravirt_patch_template pv_ops = {
>  	.mmu.make_pte		= PTE_IDENT,
>  	.mmu.make_pgd		= PTE_IDENT,
>  
> -	.mmu.dup_mmap		= paravirt_nop,
> -	.mmu.activate_mm	= paravirt_nop,
> +	.mmu.enter_mmap		= paravirt_nop,
>  
>  	.mmu.lazy_mode = {
>  		.enter		= paravirt_nop,
> diff --git a/arch/x86/xen/mmu_pv.c b/arch/x86/xen/mmu_pv.c
> index ee29fb558f2e..b3b8d289b9ab 100644
> --- a/arch/x86/xen/mmu_pv.c
> +++ b/arch/x86/xen/mmu_pv.c
> @@ -885,14 +885,7 @@ void xen_mm_unpin_all(void)
>  	spin_unlock(&pgd_lock);
>  }
>  
> -static void xen_activate_mm(struct mm_struct *prev, struct mm_struct *next)
> -{
> -	spin_lock(&next->page_table_lock);
> -	xen_pgd_pin(next);
> -	spin_unlock(&next->page_table_lock);
> -}
> -
> -static void xen_dup_mmap(struct mm_struct *oldmm, struct mm_struct *mm)
> +static void xen_enter_mmap(struct mm_struct *mm)
>  {
>  	spin_lock(&mm->page_table_lock);
>  	xen_pgd_pin(mm);
> @@ -2153,8 +2146,7 @@ static const typeof(pv_ops) xen_mmu_ops __initconst = {
>  		.make_p4d = PV_CALLEE_SAVE(xen_make_p4d),
>  #endif
>  
> -		.activate_mm = xen_activate_mm,
> -		.dup_mmap = xen_dup_mmap,
> +		.enter_mmap = xen_enter_mmap,
>  		.exit_mmap = xen_exit_mmap,
>  
>  		.lazy_mode = {
> 


