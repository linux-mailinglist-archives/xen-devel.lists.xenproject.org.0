Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8D8B22396
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 11:44:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078472.1439473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ullXg-00020I-Nk; Tue, 12 Aug 2025 09:43:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078472.1439473; Tue, 12 Aug 2025 09:43:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ullXg-0001ya-Ja; Tue, 12 Aug 2025 09:43:40 +0000
Received: by outflank-mailman (input) for mailman id 1078472;
 Tue, 12 Aug 2025 09:43:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WPHn=2Y=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1ullXf-0001yU-21
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 09:43:39 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1d483c9-7760-11f0-a327-13f23c93f187;
 Tue, 12 Aug 2025 11:43:37 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id D9F344EE0744;
 Tue, 12 Aug 2025 11:43:35 +0200 (CEST)
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
X-Inumbo-ID: d1d483c9-7760-11f0-a327-13f23c93f187
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1754991815;
	b=g3veDz5Xx02AH6Mnpa5P56ruZyoCD86VG7k7fq0XmNk06Jf18xi5ivuNHbwL0nBG5WAv
	 e/UaAfn3BQOF4TUNLy7qoZ361r9JD9GHT+JLZCNHXYvbHpVoamihj0yI7khezVs/vrCGn
	 xTjvXxhlw1BQ86ltWBfW70dNX8kaJeY0bYAdJNEjk1DQ0mVShhgxOY+gSD5j9/R8tkDsU
	 O3NDpYTtWAckaNzr5p+X/dAKnIhxC7Gg2MSNU6smELzdW5zpDf3oeb+JorbOiUfYYaPFJ
	 k1a1mbRprW+Dc/haPP6A1giwCQxKyGHTA0Y1bFRAwsfrC4jZjmvEKUhDw9SUcWbF3knFe
	 k7gNOlbtR9b7d0f+oUqe5GI6ffKBkPprCd8l/7ap8jm3FQztkXH0youfYENkSrA0SEwbx
	 rRKAHj228SPDOIqKEV3xSrlBHQa0mHgk9PYbjfidqoOP/u95YTT/euUDjoaIhHgTwZhd3
	 EzOhlrYjbDr8fmqohWIBSAZk6RiIJ6OkO3GjUIYISSd0/+ney9BWDMx3NC6eT4dsykK0P
	 BxqcPgJ5/MaXGVlbFfyYqATe5mJcweA2i/cvzXvnHBEZ6YPCch6KkBlB2BkRttaXOeEfB
	 5W9lWoRe7XrGOTh2hDICskvKvHd3Haj5hipuoCtEpClzFsU1LR7UMewkh6pz1rY=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1754991815;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=yqIqyRkdmnYRJBkV6gTxEZnNXJGTMACbU/ex1cYdODQ=;
	b=OvbK1FOnUlIu2GgZXpFrLC1dYgk0DK8diVnI9q/KhRWuhAxBQxCpe2P6VVrhOSOBncNz
	 Brq03bp4nTBqbwvokESxWsTfrflBBGMSJuvylQc6/XoGZgW1GKX1IWWDSbnLVcOBePvvn
	 5BaJcBrx5qUhAW9KU6Xidb5LKmmak/pQzI4Ohf1lSUJ4SfyYIFv08TQ9rSMtwI8ACSQ61
	 CijK4SwUMSyyw1G9xc/9sSGRxLNE60n3sDmTxvxeiOqFjDsxYlxD8yEPO/IWxB/dJRFB9
	 2wda1ssAAazmpzEpZQQ/vwbg5PcZJfsg7KtpnEskgZ/P4Zd6tNpQvWGcTxO9KnKNF/69q
	 M1fAaMmSa/mLkr4Rf5MmMItFRjsIveoA0faKhaIfAk44GFDssEtXRK14YF8J5csNhOrc8
	 uEnLcm2Bp/cHqIZwySgd2aw/MUgwVQENKMqzISRa+MiLBH/t5vM2yAiUEZThAgcRM0vFx
	 Cl2DyHthRjPWHZKygaZAZvXtpFW8VABYh8zKLopfTI+E1lOCt6g4Y4ku8V0sKT3QMFqe0
	 cCltmBSqtJpkbdskc0Xk6IHTSHPGDbZfdFXsCve0d33U6CJJw3Cj0plOuDiMsN0UDLdTM
	 9Lmklm3UAyAyd/Go2ZhrIC7HakzFr67GowuWUjgYkkXvkOuPnFrgNonFW7YQJ1w=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1754991815; bh=Jz/pIfzp16kJOuaWMrVE+1aiapcBqdnyYV0mbCg23ZM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mWGw2m1qlEI7y5Dtr5iGaJwA++wUXXQwzYa5Od7ivHngOnkSU3QEKaceB7a4YIf+Y
	 kulHzFU+dOzA6pAfSdnthh6a0Y6xa1vZ6bHxa0Duq/pv/ZeRVaWovUCKEOOE1y8Ouj
	 dqlfqLJRuN8nvOPPPQ2lrQkvcP7V/gatoap13NZNYewmvTucgin01jp8iEK5G/boyb
	 0sfkoVfKcLdZV+WT4i8gJ7jXRyle+OObv1Laxwbg5lMdcUqJdcRFlxbSVZPZh+6Rd0
	 AZTR4OxvOC4jA60u/ZO5gW7zYGxc+E5/C/FvnLi7fyLkpM7m5YyozkfMwpv2R6VnoO
	 Jn2bSC93MbOLw==
MIME-Version: 1.0
Date: Tue, 12 Aug 2025 11:43:35 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich
 <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH 09/22] x86/traps: Move load_system_tables() into
 traps-setup.c
In-Reply-To: <20250808202314.1045968-10-andrew.cooper3@citrix.com>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-10-andrew.cooper3@citrix.com>
Message-ID: <80285a06f5d4fb3bd3e378317cca61ca@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-08-08 22:23, Andrew Cooper wrote:
> Switch it to Xen coding style and fix MISRA violations.  Make it static 
> as
> there are no external caller now.
> 
> Since commit a35816b5cae8 ("x86/traps: Introduce early_traps_init() and
> simplify setup"), load_system_tables() is called later on the BSP, so 
> the
> SYS_STATE_early_boot check can be dropped from the safety BUG_ON().
> 
> Move the BUILD_BUG_ON() into build_assertions(), and introduce an
> endof_field() helper to make the expression clearer.
> 
> Swap wrmsrl(MSR_ISST, ...) for wrmsrns().  No serialisation is needed 
> at this
> point.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> ---
>  xen/arch/x86/cpu/common.c         | 118 --------------------------
>  xen/arch/x86/include/asm/system.h |   1 -
>  xen/arch/x86/traps-setup.c        | 132 ++++++++++++++++++++++++++++++
>  xen/include/xen/macros.h          |   2 +
>  4 files changed, 134 insertions(+), 119 deletions(-)
> 
> diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
> index cdc41248d4e9..da05015578aa 100644
> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -843,124 +843,6 @@ void print_cpu_info(unsigned int cpu)
> 
>  static cpumask_t cpu_initialized;
> 
> -/*
> - * Sets up system tables and descriptors.
> - *
> - * - Sets up TSS with stack pointers, including ISTs
> - * - Inserts TSS selector into regular and compat GDTs
> - * - Loads GDT, IDT, TR then null LDT
> - * - Sets up IST references in the IDT
> - */
> -void load_system_tables(void)
> -{
> -	unsigned int i, cpu = smp_processor_id();
> -	unsigned long stack_bottom = get_stack_bottom(),
> -		stack_top = stack_bottom & ~(STACK_SIZE - 1);
> -	/*
> -	 * NB: define tss_page as a local variable because clang 3.5 doesn't
> -	 * support using ARRAY_SIZE against per-cpu variables.
> -	 */
> -	struct tss_page *tss_page = &this_cpu(tss_page);
> -	idt_entry_t *idt = this_cpu(idt);
> -
> -	/* The TSS may be live.	 Disuade any clever optimisations. */
> -	volatile struct tss64 *tss = &tss_page->tss;
> -	seg_desc_t *gdt =
> -		this_cpu(gdt) - FIRST_RESERVED_GDT_ENTRY;
> -
> -	const struct desc_ptr gdtr = {
> -		.base = (unsigned long)gdt,
> -		.limit = LAST_RESERVED_GDT_BYTE,
> -	};
> -	const struct desc_ptr idtr = {
> -		.base = (unsigned long)idt,
> -		.limit = sizeof(bsp_idt) - 1,
> -	};
> -
> -	/*
> -	 * Set up the TSS.  Warning - may be live, and the NMI/#MC must 
> remain
> -	 * valid on every instruction boundary.  (Note: these are all
> -	 * semantically ACCESS_ONCE() due to tss's volatile qualifier.)
> -	 *
> -	 * rsp0 refers to the primary stack.  #MC, NMI, #DB and #DF handlers
> -	 * each get their own stacks.  No IO Bitmap.
> -	 */
> -	tss->rsp0 = stack_bottom;
> -	tss->ist[IST_MCE - 1] = stack_top + (1 + IST_MCE) * PAGE_SIZE;
> -	tss->ist[IST_NMI - 1] = stack_top + (1 + IST_NMI) * PAGE_SIZE;
> -	tss->ist[IST_DB  - 1] = stack_top + (1 + IST_DB)  * PAGE_SIZE;
> -	tss->ist[IST_DF  - 1] = stack_top + (1 + IST_DF)  * PAGE_SIZE;
> -	tss->bitmap = IOBMP_INVALID_OFFSET;
> -
> -	/* All other stack pointers poisioned. */
> -	for ( i = IST_MAX; i < ARRAY_SIZE(tss->ist); ++i )
> -		tss->ist[i] = 0x8600111111111111ul;
> -	tss->rsp1 = 0x8600111111111111ul;
> -	tss->rsp2 = 0x8600111111111111ul;
> -
> -	/*
> -	 * Set up the shadow stack IST.  Used entries must point at the
> -	 * supervisor stack token.  Unused entries are poisoned.
> -	 *
> -	 * This IST Table may be live, and the NMI/#MC entries must
> -	 * remain valid on every instruction boundary, hence the
> -	 * volatile qualifier.
> -	 */
> -	if (cpu_has_xen_shstk) {
> -		volatile uint64_t *ist_ssp = tss_page->ist_ssp;
> -		unsigned long
> -			mce_ssp = stack_top + (IST_MCE * IST_SHSTK_SIZE) - 8,
> -			nmi_ssp = stack_top + (IST_NMI * IST_SHSTK_SIZE) - 8,
> -			db_ssp  = stack_top + (IST_DB  * IST_SHSTK_SIZE) - 8,
> -			df_ssp  = stack_top + (IST_DF  * IST_SHSTK_SIZE) - 8;
> -
> -		ist_ssp[0] = 0x8600111111111111ul;
> -		ist_ssp[IST_MCE] = mce_ssp;
> -		ist_ssp[IST_NMI] = nmi_ssp;
> -		ist_ssp[IST_DB]	 = db_ssp;
> -		ist_ssp[IST_DF]	 = df_ssp;
> -		for ( i = IST_DF + 1; i < ARRAY_SIZE(tss_page->ist_ssp); ++i )
> -			ist_ssp[i] = 0x8600111111111111ul;
> -
> -		if (IS_ENABLED(CONFIG_XEN_SHSTK) && rdssp() != SSP_NO_SHSTK) {
> -			/*
> -			 * Rewrite supervisor tokens when shadow stacks are
> -			 * active.  This resets any busy bits left across S3.
> -			 */
> -			wrss(mce_ssp, _p(mce_ssp));
> -			wrss(nmi_ssp, _p(nmi_ssp));
> -			wrss(db_ssp,  _p(db_ssp));
> -			wrss(df_ssp,  _p(df_ssp));
> -		}
> -
> -		wrmsrl(MSR_ISST, (unsigned long)ist_ssp);
> -	}
> -
> -	_set_tssldt_desc(gdt + TSS_ENTRY, (unsigned long)tss,
> -			 sizeof(*tss) - 1, SYS_DESC_tss_avail);
> -	if ( IS_ENABLED(CONFIG_PV32) )
> -		_set_tssldt_desc(
> -			this_cpu(compat_gdt) - FIRST_RESERVED_GDT_ENTRY + TSS_ENTRY,
> -			(unsigned long)tss, sizeof(*tss) - 1, SYS_DESC_tss_busy);
> -
> -	per_cpu(full_gdt_loaded, cpu) = false;
> -	lgdt(&gdtr);
> -	lidt(&idtr);
> -	ltr(TSS_SELECTOR);
> -	lldt(0);
> -
> -	enable_each_ist(idt);
> -
> -	/*
> -	 * Bottom-of-stack must be 16-byte aligned!
> -	 *
> -	 * Defer checks until exception support is sufficiently set up.
> -	 */
> -	BUILD_BUG_ON((sizeof(struct cpu_info) -
> -		      sizeof(struct cpu_user_regs)) & 0xf);
> -	BUG_ON(system_state != SYS_STATE_early_boot && (stack_bottom & 0xf));
> -}
> -
>  static void skinit_enable_intr(void)
>  {
>  	uint64_t val;
> diff --git a/xen/arch/x86/include/asm/system.h 
> b/xen/arch/x86/include/asm/system.h
> index 57446c5b465c..3cdc56e4ba6d 100644
> --- a/xen/arch/x86/include/asm/system.h
> +++ b/xen/arch/x86/include/asm/system.h
> @@ -256,7 +256,6 @@ static inline int local_irq_is_enabled(void)
>  #define BROKEN_ACPI_Sx          0x0001
>  #define BROKEN_INIT_AFTER_S1    0x0002
> 
> -void load_system_tables(void);
>  void subarch_percpu_traps_init(void);
> 
>  #endif
> diff --git a/xen/arch/x86/traps-setup.c b/xen/arch/x86/traps-setup.c
> index 8ca379c9e4cb..13b8fcf0ba51 100644
> --- a/xen/arch/x86/traps-setup.c
> +++ b/xen/arch/x86/traps-setup.c
> @@ -7,6 +7,7 @@
> 
>  #include <asm/idt.h>
>  #include <asm/msr.h>
> +#include <asm/shstk.h>
>  #include <asm/system.h>
>  #include <asm/traps.h>
> 
> @@ -19,6 +20,124 @@ boolean_param("ler", opt_ler);
> 
>  void nocall entry_PF(void);
> 
> +/*
> + * Sets up system tables and descriptors for IDT devliery.
> + *
> + * - Sets up TSS with stack pointers, including ISTs
> + * - Inserts TSS selector into regular and compat GDTs
> + * - Loads GDT, IDT, TR then null LDT
> + * - Sets up IST references in the IDT
> + */
> +static void load_system_tables(void)
> +{
> +    unsigned int i, cpu = smp_processor_id();
> +    unsigned long stack_bottom = get_stack_bottom(),
> +        stack_top = stack_bottom & ~(STACK_SIZE - 1);
> +    /*
> +     * NB: define tss_page as a local variable because clang 3.5 
> doesn't
> +     * support using ARRAY_SIZE against per-cpu variables.
> +     */
> +    struct tss_page *tss_page = &this_cpu(tss_page);
> +    idt_entry_t *idt = this_cpu(idt);
> +

Given the clang baseline this might not be needed anymore?

> +    /* The TSS may be live.  Disuade any clever optimisations. */
> +    volatile struct tss64 *tss = &tss_page->tss;
> +    seg_desc_t *gdt =
> +        this_cpu(gdt) - FIRST_RESERVED_GDT_ENTRY;
> +
> +    const struct desc_ptr gdtr = {
> +        .base = (unsigned long)gdt,
> +        .limit = LAST_RESERVED_GDT_BYTE,
> +    };
> +    const struct desc_ptr idtr = {
> +        .base = (unsigned long)idt,
> +        .limit = sizeof(bsp_idt) - 1,
> +    };
> +
> +    /*
> +     * Set up the TSS.  Warning - may be live, and the NMI/#MC must 
> remain
> +     * valid on every instruction boundary.  (Note: these are all
> +     * semantically ACCESS_ONCE() due to tss's volatile qualifier.)
> +     *
> +     * rsp0 refers to the primary stack.  #MC, NMI, #DB and #DF 
> handlers
> +     * each get their own stacks.  No IO Bitmap.
> +     */
> +    tss->rsp0 = stack_bottom;
> +    tss->ist[IST_MCE - 1] = stack_top + (1 + IST_MCE) * PAGE_SIZE;
> +    tss->ist[IST_NMI - 1] = stack_top + (1 + IST_NMI) * PAGE_SIZE;
> +    tss->ist[IST_DB  - 1] = stack_top + (1 + IST_DB)  * PAGE_SIZE;
> +    tss->ist[IST_DF  - 1] = stack_top + (1 + IST_DF)  * PAGE_SIZE;
> +    tss->bitmap = IOBMP_INVALID_OFFSET;
> +
> +    /* All other stack pointers poisioned. */
> +    for ( i = IST_MAX; i < ARRAY_SIZE(tss->ist); ++i )
> +        tss->ist[i] = 0x8600111111111111UL;
> +    tss->rsp1 = 0x8600111111111111UL;
> +    tss->rsp2 = 0x8600111111111111UL;
> +
> +    /*
> +     * Set up the shadow stack IST.  Used entries must point at the
> +     * supervisor stack token.  Unused entries are poisoned.
> +     *
> +     * This IST Table may be live, and the NMI/#MC entries must
> +     * remain valid on every instruction boundary, hence the
> +     * volatile qualifier.
> +     */
> +    if ( cpu_has_xen_shstk )
> +    {
> +        volatile uint64_t *ist_ssp = tss_page->ist_ssp;
> +        unsigned long
> +            mce_ssp = stack_top + (IST_MCE * IST_SHSTK_SIZE) - 8,
> +            nmi_ssp = stack_top + (IST_NMI * IST_SHSTK_SIZE) - 8,
> +            db_ssp  = stack_top + (IST_DB  * IST_SHSTK_SIZE) - 8,
> +            df_ssp  = stack_top + (IST_DF  * IST_SHSTK_SIZE) - 8;
> +
> +        ist_ssp[0] = 0x8600111111111111UL;
> +        ist_ssp[IST_MCE] = mce_ssp;
> +        ist_ssp[IST_NMI] = nmi_ssp;
> +        ist_ssp[IST_DB]  = db_ssp;
> +        ist_ssp[IST_DF]  = df_ssp;
> +        for ( i = IST_DF + 1; i < ARRAY_SIZE(tss_page->ist_ssp); ++i )
> +            ist_ssp[i] = 0x8600111111111111UL;
> +
> +        if ( IS_ENABLED(CONFIG_XEN_SHSTK) && rdssp() != SSP_NO_SHSTK )
> +        {
> +            /*
> +             * Rewrite supervisor tokens when shadow stacks are
> +             * active.  This resets any busy bits left across S3.
> +             */
> +            wrss(mce_ssp, _p(mce_ssp));
> +            wrss(nmi_ssp, _p(nmi_ssp));
> +            wrss(db_ssp,  _p(db_ssp));
> +            wrss(df_ssp,  _p(df_ssp));
> +        }
> +
> +        wrmsrns(MSR_ISST, (unsigned long)ist_ssp);
> +    }
> +
> +    _set_tssldt_desc(gdt + TSS_ENTRY, (unsigned long)tss,
> +                     sizeof(*tss) - 1, SYS_DESC_tss_avail);
> +    if ( IS_ENABLED(CONFIG_PV32) )
> +        _set_tssldt_desc(
> +            this_cpu(compat_gdt) - FIRST_RESERVED_GDT_ENTRY + 
> TSS_ENTRY,
> +            (unsigned long)tss, sizeof(*tss) - 1, SYS_DESC_tss_busy);
> +
> +    per_cpu(full_gdt_loaded, cpu) = false;
> +    lgdt(&gdtr);
> +    lidt(&idtr);
> +    ltr(TSS_SELECTOR);
> +    lldt(0);
> +
> +    enable_each_ist(idt);
> +
> +    /*
> +     * tss->rsp0 must be 16-byte aligned.
> +     *
> +     * Defer checks until exception support is sufficiently set up.
> +     */
> +    BUG_ON(stack_bottom & 15);
> +}
> +
>  static void __init init_ler(void)
>  {
>      unsigned int msr = 0;
> @@ -139,3 +258,16 @@ void asmlinkage ap_early_traps_init(void)
>  {
>      load_system_tables();
>  }
> +
> +static void __init __maybe_unused build_assertions(void)
> +{
> +    /*
> +     * This is best-effort (it doesn't cover some padding corner 
> cases), but
> +     * is preforable to hitting the check at boot time.
> +     *
> +     * tss->rsp0, pointing at the end of cpu_info.guest_cpu_user_regs, 
> must be
> +     * 16-byte aligned.
> +     */
> +    BUILD_BUG_ON((sizeof(struct cpu_info) -
> +                  endof_field(struct cpu_info, guest_cpu_user_regs)) & 
> 15);
> +}
> diff --git a/xen/include/xen/macros.h b/xen/include/xen/macros.h
> index cd528fbdb127..726ba221e0d8 100644
> --- a/xen/include/xen/macros.h
> +++ b/xen/include/xen/macros.h
> @@ -102,6 +102,8 @@
>   */
>  #define sizeof_field(type, member) sizeof(((type *)NULL)->member)
> 
> +#define endof_field(type, member) (offsetof(type, member) + 
> sizeof_field(type, member))
> +
>  /* Cast an arbitrary integer to a pointer. */
>  #define _p(x) ((void *)(unsigned long)(x))

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

