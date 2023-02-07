Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEE468E2AF
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 22:10:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.491454.760546 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPVDV-0004Ec-9J; Tue, 07 Feb 2023 21:09:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 491454.760546; Tue, 07 Feb 2023 21:09:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPVDV-0004CD-6F; Tue, 07 Feb 2023 21:09:29 +0000
Received: by outflank-mailman (input) for mailman id 491454;
 Tue, 07 Feb 2023 21:09:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6URs=6D=csail.mit.edu=srivatsa@srs-se1.protection.inumbo.net>)
 id 1pPVDT-0004C7-Ng
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 21:09:27 +0000
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu
 [128.30.2.78]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2ac5836-a72b-11ed-933c-83870f6b2ba8;
 Tue, 07 Feb 2023 22:09:25 +0100 (CET)
Received: from vmware-inc.ear2.seattle1.level3.net ([4.30.137.154]
 helo=srivatsab3MD6R.vmware.com)
 by outgoing2021.csail.mit.edu with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.95)
 (envelope-from <srivatsa@csail.mit.edu>) id 1pPVDJ-005MHi-J6;
 Tue, 07 Feb 2023 16:09:17 -0500
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
X-Inumbo-ID: b2ac5836-a72b-11ed-933c-83870f6b2ba8
Subject: Re: [PATCH v2] x86/paravirt: merge activate_mm and dup_mmap callbacks
To: Juergen Gross <jgross@suse.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org, virtualization@lists.linux-foundation.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Alexey Makhalov <amakhalov@vmware.com>,
 VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org
References: <20230207075902.7539-1-jgross@suse.com>
From: "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>
Message-ID: <dc5fbb2e-6a23-15e5-a451-e069e90a0656@csail.mit.edu>
Date: Tue, 7 Feb 2023 13:09:15 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20230207075902.7539-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2/6/23 11:59 PM, Juergen Gross wrote:
> The two paravirt callbacks .mmu.activate_mm and .mmu.dup_mmap are
> sharing the same implementations in all cases: for Xen PV guests they
> are pinning the PGD of the new mm_struct, and for all other cases
> they are a NOP.
> 
> In the end both callbacks are meant to register an address space with
> the underlying hypervisor, so there needs to be only a single callback
> for that purpose.
> 
> So merge them to a common callback .mmu.enter_mmap (in contrast to the
> corresponding already existing .mmu.exit_mmap).
> 
> As the first parameter of the old callbacks isn't used, drop it from
> the replacement one.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>


Reviewed-by: Srivatsa S. Bhat (VMware) <srivatsa@csail.mit.edu>

Regards,
Srivatsa
VMware Photon OS

> ---
> V2:
> - expand commit message (Srivatsa S. Bhat)
> ---
>  arch/x86/include/asm/mmu_context.h    |  4 ++--
>  arch/x86/include/asm/paravirt.h       | 14 +++-----------
>  arch/x86/include/asm/paravirt_types.h |  7 ++-----
>  arch/x86/kernel/paravirt.c            |  3 +--
>  arch/x86/mm/init.c                    |  2 +-
>  arch/x86/xen/mmu_pv.c                 | 12 ++----------
>  6 files changed, 11 insertions(+), 31 deletions(-)
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
> diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
> index cb258f58fdc8..cbc53da4c1b4 100644
> --- a/arch/x86/mm/init.c
> +++ b/arch/x86/mm/init.c
> @@ -806,7 +806,7 @@ void __init poking_init(void)
>  	BUG_ON(!poking_mm);
>  
>  	/* Xen PV guests need the PGD to be pinned. */
> -	paravirt_arch_dup_mmap(NULL, poking_mm);
> +	paravirt_enter_mmap(poking_mm);
>  
>  	/*
>  	 * Randomize the poking address, but make sure that the following page
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


