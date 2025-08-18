Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91241B29EC2
	for <lists+xen-devel@lfdr.de>; Mon, 18 Aug 2025 12:03:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1085852.1444126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unwiP-0001GQ-QK; Mon, 18 Aug 2025 10:03:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1085852.1444126; Mon, 18 Aug 2025 10:03:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1unwiP-0001EA-Mn; Mon, 18 Aug 2025 10:03:45 +0000
Received: by outflank-mailman (input) for mailman id 1085852;
 Mon, 18 Aug 2025 10:03:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q+DX=26=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1unwiN-0001E2-TQ
 for xen-devel@lists.xenproject.org; Mon, 18 Aug 2025 10:03:44 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9dbf67e6-7c1a-11f0-b898-0df219b8e170;
 Mon, 18 Aug 2025 12:03:41 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-6188b6f501cso4709991a12.2
 for <xen-devel@lists.xenproject.org>; Mon, 18 Aug 2025 03:03:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61a34c16863sm2681626a12.14.2025.08.18.03.03.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Aug 2025 03:03:39 -0700 (PDT)
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
X-Inumbo-ID: 9dbf67e6-7c1a-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755511420; x=1756116220; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=42zY278QVcPb+qNkr0GGutF0LGSMm4/8s0SWBnkcqew=;
        b=Fz7JuR+14S+V2AKgGzvijzbxMtHqLpRicI2CRkaVV4ct6mE6gL/4b+bXesQuRXRFmm
         8n3BWEarQOeKtZBPhFO/8EmysfdRL7B7Z2Yjb7C2f6oKsyLhkHGRGGrj0rRheo0011rH
         kb9Zysh7hP5H5RP3u9un0774hji7+xzgRJ765VaZUg6RNaGoiuPYgnb4GtW9yhe88Fkd
         uW05VOKyiPD3QeZx4n70TKRCF6oB7o5ZH8xxmzoPTRihykhQFXXLYiof5/4hd4Osxdx3
         11RtQyjwWvbC9sKygggs/moxYHH3TBF1lZbaV6uZJ6BsTkKWCGDG4hYvjiV9x4PL4h/R
         x6CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755511420; x=1756116220;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=42zY278QVcPb+qNkr0GGutF0LGSMm4/8s0SWBnkcqew=;
        b=QOrLrGJ8u6IzSJm+RC9/5pK2nyIacRsq5iFhFjpJDMoHKMilKqDo1wGrd3tJi3cNfn
         OGD/JoY6x/HJw2/7QoU3XtXD0iN1mRAr3jzuhEl41spScGLWGnLLj9hajBM4p7aoE2Pb
         FfRrEY8EAQP0hjeqq0vtNk4ESqME27GXTIwiNUwSI3KDJpysDz7apE6aTZjRU1FDcfgN
         Oy5GwFOow8X4sKkZlpO4nwkV8nT7sEBJtsVR2m5uuYf7HEnYElwdLpZ4+++7kgOfLtm1
         Gnu46rjBqXWYUFLXLz+GEY+hJV5afjj0MKbMeQwqS/AZpv82uFexCAWcwRclOynENEXe
         HBaw==
X-Forwarded-Encrypted: i=1; AJvYcCXXiEidC37BmwZToK4HzQvPqyNX6Dp1LTf32GcPVRcdYgIOwY2YGXIeKgKHYA8Tkcvk0zRrwiS60aw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwLEanRdV1rZ4R4+7a6Bmlq41acJrh4WwObGnGZkRz8x/m/bxNG
	OQuL8C7ataQ4+N/en2Rji1H1zMETO0fwehjm3iPFLV/PDuAf1oWi5W6z+NNlpKGeHDbkCzLcMrX
	lKBs=
X-Gm-Gg: ASbGncuN6AOtoEh8jeAUxs0EA/EVkqXcBz4CCsnUdq5+f5N0jeIFls9PPSPgW8/jmD/
	j6dQxUGq0Z01viT3mTQFVufhLTJF7XfFctYOg/YS+OoX7cu2B9N165LLKBl7yMJUgTCy60L4iOm
	+e8zOgnevNejovwfEdCP2EeRynmQOzQokawXf3OGyrLdVGF+r2iJBlHze8xF5NCMmbTOb9eEFw7
	+cy9UaRSkLEz7nwUBGulr5MvsiNit1hH6IPWd6QXF87valYn9ZgaTjLCwYfbUwfEaJ7fIrVI2fo
	dsmmQuin/ehhjMQKPrcQWazYQfSFCyQ2vwt/dFJQB+72bF5an2lPnXOvM37M/GUkIZU0PWYAWbK
	w6voh6r1ouHqS+RNWxnGZcuSXB7waBqwDGZi8KJwHGTRAiMbbs1LwxbZ8urt1wSclYG3lR3fEZv
	MPDr5rs4w=
X-Google-Smtp-Source: AGHT+IE0UAeJHrJEYqTCYeBkgf+obnA0Z8ORTQjJnd9Kj0/GxEyAssW1+4la8N8DK3OLmiKcIJ+Emg==
X-Received: by 2002:a05:6402:2809:b0:618:6c87:c5f6 with SMTP id 4fb4d7f45d1cf-619bf059ee7mr6822252a12.15.1755511419813;
        Mon, 18 Aug 2025 03:03:39 -0700 (PDT)
Message-ID: <d1635022-c386-4665-be07-e66afc8f3330@suse.com>
Date: Mon, 18 Aug 2025 12:03:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/22] x86/traps: Introduce FRED entrypoints
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-22-andrew.cooper3@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20250808202314.1045968-22-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.08.2025 22:23, Andrew Cooper wrote:
> Under FRED, there's one entrypoint from Ring 3, and one from Ring 0.
> 
> FRED gives us a good stack (even for SYSCALL/SYSENTER), and a unified event
> frame on the stack, meaing that all software needs to do is spill the GPRs
> with a line of PUSHes.  Introduce PUSH_AND_CLEAR_GPRS and POP_GPRS for this
> purpose.
> 
> Introduce entry_FRED_R0() which to a first appoximation is complete for all
> event handling within Xen.
> 
> entry_FRED_R0() needs deriving from entry_FRED_R3(), so introduce a basic
> handler.  There is more work required to make the return-to-guest path work
> under FRED, so leave a BUG clearly in place.
> 
> Also introduce entry_from_{xen,pv}() to be the C level handlers.  By simply
> copying regs->fred_ss.vector into regs->entry_vector, we can reuse all the
> existing fault handlers.
> 
> Extend fatal_trap() to render the event type, including by name, when FRED is
> active.  This is slightly complicated, because X86_ET_OTHER must not use
> vector_name() or SYSCALL and SYSENTER get rendered as #BP and #DB.  Also,
> {read,write}_gs_shadow() needs modifying to avoid the SWAPGS instruction,
> which is disallowed in FRED mode.
> 
> This is sufficient to handle all interrupts and exceptions encountered during
> development, including plenty of Double Faults.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> SIMICS hasn't been updated to the FRED v9, and still wants ENDBR instructions
> at the entrypoints.
> ---
>  xen/arch/x86/include/asm/asm_defns.h |  65 ++++++++++++
>  xen/arch/x86/include/asm/msr.h       |   8 +-
>  xen/arch/x86/traps.c                 | 153 ++++++++++++++++++++++++++-
>  xen/arch/x86/x86_64/Makefile         |   1 +
>  xen/arch/x86/x86_64/entry-fred.S     |  35 ++++++
>  5 files changed, 256 insertions(+), 6 deletions(-)
>  create mode 100644 xen/arch/x86/x86_64/entry-fred.S
> 
> diff --git a/xen/arch/x86/include/asm/asm_defns.h b/xen/arch/x86/include/asm/asm_defns.h
> index 72a0082d319d..a81a4043d0f1 100644
> --- a/xen/arch/x86/include/asm/asm_defns.h
> +++ b/xen/arch/x86/include/asm/asm_defns.h
> @@ -315,6 +315,71 @@ static always_inline void stac(void)
>          subq  $-(UREGS_error_code-UREGS_r15+\adj), %rsp
>  .endm
>  
> +/*
> + * Push and clear GPRs
> + */
> +.macro PUSH_AND_CLEAR_GPRS
> +        push  %rdi
> +        xor   %edi, %edi
> +        push  %rsi
> +        xor   %esi, %esi
> +        push  %rdx
> +        xor   %edx, %edx
> +        push  %rcx
> +        xor   %ecx, %ecx
> +        push  %rax
> +        xor   %eax, %eax
> +        push  %r8
> +        xor   %r8d, %r8d
> +        push  %r9
> +        xor   %r9d, %r9d
> +        push  %r10
> +        xor   %r10d, %r10d
> +        push  %r11
> +        xor   %r11d, %r11d
> +        push  %rbx
> +        xor   %ebx, %ebx
> +        push  %rbp
> +#ifdef CONFIG_FRAME_POINTER
> +/* Indicate special exception stack frame by inverting the frame pointer. */
> +        mov   %rsp, %rbp
> +        notq  %rbp
> +#else
> +        xor   %ebp, %ebp
> +#endif
> +        push  %r12
> +        xor   %r12d, %r12d
> +        push  %r13
> +        xor   %r13d, %r13d
> +        push  %r14
> +        xor   %r14d, %r14d
> +        push  %r15
> +        xor   %r15d, %r15d
> +.endm
> +
> +/*
> + * POP GPRs from a UREGS_* frame on the stack.  Does not modify flags.
> + *
> + * @rax: Alternative destination for the %rax value on the stack.
> + */
> +.macro POP_GPRS rax=%rax
> +        pop   %r15
> +        pop   %r14
> +        pop   %r13
> +        pop   %r12
> +        pop   %rbp
> +        pop   %rbx
> +        pop   %r11
> +        pop   %r10
> +        pop   %r9
> +        pop   %r8
> +        pop   \rax
> +        pop   %rcx
> +        pop   %rdx
> +        pop   %rsi
> +        pop   %rdi
> +.endm
> +
>  #ifdef CONFIG_PV32
>  #define CR4_PV32_RESTORE                               \
>      ALTERNATIVE_2 "",                                  \
> diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
> index b6b85b04c3fd..01f510315ffe 100644
> --- a/xen/arch/x86/include/asm/msr.h
> +++ b/xen/arch/x86/include/asm/msr.h
> @@ -202,9 +202,9 @@ static inline unsigned long read_gs_base(void)
>  
>  static inline unsigned long read_gs_shadow(void)
>  {
> -    unsigned long base;
> +    unsigned long base, cr4 = read_cr4();
>  
> -    if ( read_cr4() & X86_CR4_FSGSBASE )
> +    if ( !(cr4 & X86_CR4_FRED) && (cr4 & X86_CR4_FSGSBASE) )
>      {
>          asm volatile ( "swapgs" );
>          base = __rdgsbase();
> @@ -234,7 +234,9 @@ static inline void write_gs_base(unsigned long base)
>  
>  static inline void write_gs_shadow(unsigned long base)
>  {
> -    if ( read_cr4() & X86_CR4_FSGSBASE )
> +    unsigned long cr4 = read_cr4();
> +
> +    if ( !(cr4 & X86_CR4_FRED) && (cr4 & X86_CR4_FSGSBASE) )
>      {
>          asm volatile ( "swapgs\n\t"
>                         "wrgsbase %0\n\t"
> diff --git a/xen/arch/x86/traps.c b/xen/arch/x86/traps.c
> index 270b93ed623e..e67a428e4362 100644
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -1013,6 +1013,32 @@ void show_execution_state_nmi(const cpumask_t *mask, bool show_all)
>          printk("Non-responding CPUs: {%*pbl}\n", CPUMASK_PR(&show_state_mask));
>  }
>  
> +static const char *x86_et_name(unsigned int type)
> +{
> +    static const char *const names[] = {
> +        [X86_ET_EXT_INTR]    = "EXT_INTR",
> +        [X86_ET_NMI]         = "NMI",
> +        [X86_ET_HW_EXC]      = "HW_EXC",
> +        [X86_ET_SW_INT]      = "SW_INT",
> +        [X86_ET_PRIV_SW_EXC] = "PRIV_SW_EXEC",
> +        [X86_ET_SW_EXC]      = "SW_EXEC",
> +        [X86_ET_OTHER]       = "OTHER",
> +    };
> +
> +    return (type < ARRAY_SIZE(names) && names[type]) ? names[type] : "???";
> +}
> +
> +static const char *x86_et_other_name(unsigned int vec)
> +{
> +    static const char *const names[] = {
> +        [0] = "MTF",
> +        [1] = "SYSCALL",
> +        [2] = "SYSENTER",
> +    };
> +
> +    return (vec < ARRAY_SIZE(names) && names[vec][0]) ? names[vec] : "???";
> +}
> +
>  const char *vector_name(unsigned int vec)
>  {
>      static const char names[][4] = {
> @@ -1091,9 +1117,42 @@ void fatal_trap(const struct cpu_user_regs *regs, bool show_remote)
>          }
>      }
>  
> -    panic("FATAL TRAP: vec %u, %s[%04x]%s\n",
> -          trapnr, vector_name(trapnr), regs->error_code,
> -          (regs->eflags & X86_EFLAGS_IF) ? "" : " IN INTERRUPT CONTEXT");
> +    if ( read_cr4() & X86_CR4_FRED )
> +    {
> +        bool render_ec = false;
> +        const char *vec_name = NULL;
> +
> +        switch ( regs->fred_ss.type )
> +        {
> +        case X86_ET_HW_EXC:
> +        case X86_ET_SW_INT:
> +        case X86_ET_PRIV_SW_EXC:
> +        case X86_ET_SW_EXC:
> +            render_ec = true;
> +            vec_name = vector_name(regs->fred_ss.vector);
> +            break;
> +
> +        case X86_ET_OTHER:
> +            vec_name = x86_et_other_name(regs->fred_ss.vector);
> +            break;
> +        }
> +
> +        if ( render_ec )
> +            panic("Fatal TRAP: type %u, %s, vec %u, %s[%04x]%s\n",
> +                  regs->fred_ss.type, x86_et_name(regs->fred_ss.type),
> +                  regs->fred_ss.vector, vec_name ?: "",
> +                  regs->error_code,
> +                  (regs->eflags & X86_EFLAGS_IF) ? "" : " IN INTERRUPT CONTEXT");
> +        else
> +            panic("Fatal TRAP: type %u, %s, vec %u, %s%s\n",
> +                  regs->fred_ss.type, x86_et_name(regs->fred_ss.type),
> +                  regs->fred_ss.vector, vec_name ?: "",
> +                  (regs->eflags & X86_EFLAGS_IF) ? "" : " IN INTERRUPT CONTEXT");
> +    }
> +    else
> +        panic("FATAL TRAP: vec %u, %s[%04x]%s\n",
> +              trapnr, vector_name(trapnr), regs->error_code,
> +              (regs->eflags & X86_EFLAGS_IF) ? "" : " IN INTERRUPT CONTEXT");
>  }
>  
>  void asmlinkage noreturn do_unhandled_trap(struct cpu_user_regs *regs)
> @@ -2181,6 +2240,94 @@ void asmlinkage check_ist_exit(const struct cpu_user_regs *regs, bool ist_exit)
>  }
>  #endif
>  
> +void asmlinkage entry_from_pv(struct cpu_user_regs *regs)
> +{
> +    /* Copy fred_ss.vector into entry_vector as IDT delivery would have done. */
> +    regs->entry_vector = regs->fred_ss.vector;
> +
> +    switch ( regs->fred_ss.type )
> +    {
> +    case X86_ET_EXT_INTR:
> +        do_IRQ(regs);
> +        break;
> +
> +    case X86_ET_NMI:
> +        do_nmi(regs);
> +        break;
> +
> +    case X86_ET_HW_EXC:
> +    case X86_ET_SW_INT:
> +    case X86_ET_PRIV_SW_EXC:
> +    case X86_ET_SW_EXC:
> +        goto fatal;
> +
> +    default:
> +        goto fatal;
> +    }
> +
> +    return;
> +
> + fatal:
> +    fatal_trap(regs, false);
> +}

Noticed only now: Shouldn't this be surrounded with #ifdef CONFIG_PV (with
knock-on effects elsewhere)?

Jan

