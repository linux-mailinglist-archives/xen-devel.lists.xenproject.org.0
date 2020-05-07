Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF631C90DF
	for <lists+xen-devel@lfdr.de>; Thu,  7 May 2020 16:54:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jWhup-0002cP-OJ; Thu, 07 May 2020 14:54:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0ibL=6V=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jWhuo-0002cK-Gs
 for xen-devel@lists.xenproject.org; Thu, 07 May 2020 14:54:22 +0000
X-Inumbo-ID: a1dced18-9072-11ea-9f32-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a1dced18-9072-11ea-9f32-12813bfff9fa;
 Thu, 07 May 2020 14:54:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 5A892AD12;
 Thu,  7 May 2020 14:54:22 +0000 (UTC)
Subject: Re: [PATCH 16/16] x86/shstk: Activate Supervisor Shadow Stacks
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-17-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <eacafb0a-a049-5bca-7a43-c9c3deb26054@suse.com>
Date: Thu, 7 May 2020 16:54:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200501225838.9866-17-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 02.05.2020 00:58, Andrew Cooper wrote:
> --- a/xen/arch/x86/acpi/wakeup_prot.S
> +++ b/xen/arch/x86/acpi/wakeup_prot.S
> @@ -1,3 +1,8 @@
> +#include <asm/config.h>

Why is this needed? Afaics assembly files, just like C ones, get
xen/config.h included from the compiler command line.

> @@ -48,6 +59,48 @@ ENTRY(s3_resume)
>          pushq   %rax
>          lretq
>  1:
> +#ifdef CONFIG_XEN_SHSTK
> +	/*
> +         * Restoring SSP is a little convoluted, because we are intercepting
> +         * the middle of an in-use shadow stack.  Write a temporary supervisor
> +         * token under the stack, so SETSSBSY takes us where we want, then
> +         * reset MSR_PL0_SSP to its usual value and pop the temporary token.

What do you mean by "takes us where we want"? I take it "us" is really
SSP here?

> +         */
> +        mov     saved_rsp(%rip), %rdi
> +        cmpq    $1, %rdi
> +        je      .L_shstk_done
> +
> +        /* Write a supervisor token under SSP. */
> +        sub     $8, %rdi
> +        mov     %rdi, (%rdi)
> +
> +        /* Load it into MSR_PL0_SSP. */
> +        mov     $MSR_PL0_SSP, %ecx
> +        mov     %rdi, %rdx
> +        shr     $32, %rdx
> +        mov     %edi, %eax
> +
> +        /* Enable CET. */
> +        mov     $MSR_S_CET, %ecx
> +        xor     %edx, %edx
> +        mov     $CET_SHSTK_EN | CET_WRSS_EN, %eax
> +        wrmsr
> +
> +        /* Activate our temporary token. */
> +        mov     $XEN_MINIMAL_CR4 | X86_CR4_CET, %ebx
> +        mov     %rbx, %cr4
> +        setssbsy
> +
> +        /* Reset MSR_PL0_SSP back to its expected value. */
> +        and     $~(STACK_SIZE - 1), %eax
> +        or      $0x5ff8, %eax
> +        wrmsr

Ahead of this WRMSR neither %ecx nor %edx look to have their intended
values anymore. Also there is a again a magic 0x5ff8 here (and at
least one more further down).

> --- a/xen/arch/x86/boot/x86_64.S
> +++ b/xen/arch/x86/boot/x86_64.S
> @@ -28,8 +28,36 @@ ENTRY(__high_start)
>          lretq
>  1:
>          test    %ebx,%ebx
> -        jnz     start_secondary
> +        jz      .L_bsp
>  
> +        /* APs.  Set up shadow stacks before entering C. */
> +
> +        testl   $cpufeat_mask(X86_FEATURE_XEN_SHSTK), \
> +                CPUINFO_FEATURE_OFFSET(X86_FEATURE_XEN_SHSTK) + boot_cpu_data(%rip)
> +        je      .L_ap_shstk_done
> +
> +        mov     $MSR_S_CET, %ecx
> +        xor     %edx, %edx
> +        mov     $CET_SHSTK_EN | CET_WRSS_EN, %eax
> +        wrmsr
> +
> +        mov     $MSR_PL0_SSP, %ecx
> +        mov     %rsp, %rdx
> +        shr     $32, %rdx
> +        mov     %esp, %eax
> +        and     $~(STACK_SIZE - 1), %eax
> +        or      $0x5ff8, %eax
> +        wrmsr
> +
> +        mov     $XEN_MINIMAL_CR4 | X86_CR4_CET, %ecx
> +        mov     %rcx, %cr4
> +        setssbsy

Since the token doesn't get written here, could you make the comment
say where this happens? I have to admit that I had to go through
earlier patches to find it again.

> +.L_ap_shstk_done:
> +        call    start_secondary
> +        BUG     /* start_secondary() shouldn't return. */

This conversion from a jump to CALL is unrelated and hence would
better be mentioned in the description imo.

> --- a/xen/arch/x86/cpu/common.c
> +++ b/xen/arch/x86/cpu/common.c
> @@ -323,6 +323,11 @@ void __init early_cpu_init(void)
>  	       x86_cpuid_vendor_to_str(c->x86_vendor), c->x86, c->x86,
>  	       c->x86_model, c->x86_model, c->x86_mask, eax);
>  
> +	if (c->cpuid_level >= 7) {
> +		cpuid_count(7, 0, &eax, &ebx, &ecx, &edx);
> +		c->x86_capability[cpufeat_word(X86_FEATURE_CET_SS)] = ecx;
> +	}

How about moving the leaf 7 code from generic_identify() here as
a whole?

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -664,6 +664,13 @@ static void __init noreturn reinit_bsp_stack(void)
>      stack_base[0] = stack;
>      memguard_guard_stack(stack);
>  
> +    if ( cpu_has_xen_shstk )
> +    {
> +        wrmsrl(MSR_PL0_SSP, (unsigned long)stack + 0x5ff8);
> +        wrmsrl(MSR_S_CET, CET_SHSTK_EN | CET_WRSS_EN);
> +        asm volatile ("setssbsy" ::: "memory");
> +    }

Same as for APs - a brief comment pointing at where the token was
written would seem helpful.

Could you also have the patch description say a word on the choice
of enabling CET_WRSS_EN uniformly and globally?

> @@ -985,6 +992,21 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>      /* This must come before e820 code because it sets paddr_bits. */
>      early_cpu_init();
>  
> +    /* Choose shadow stack early, to set infrastructure up appropriately. */
> +    if ( opt_xen_shstk && boot_cpu_has(X86_FEATURE_CET_SS) )
> +    {
> +        printk("Enabling Supervisor Shadow Stacks\n");
> +
> +        setup_force_cpu_cap(X86_FEATURE_XEN_SHSTK);
> +#ifdef CONFIG_PV32
> +        if ( opt_pv32 )
> +        {
> +            opt_pv32 = 0;
> +            printk("  - Disabling PV32 due to Shadow Stacks\n");
> +        }
> +#endif

I think this deserves an explanation, either in a comment or in
the patch description.

> @@ -1721,6 +1743,10 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>  
>      alternative_branches();
>  
> +    /* Defer CR4.CET until alternatives have finished playing with CR4.WP */
> +    if ( cpu_has_xen_shstk )
> +        set_in_cr4(X86_CR4_CET);

Nit: CR0.WP (in the comment)

Jan

