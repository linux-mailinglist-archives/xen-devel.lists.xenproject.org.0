Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0311B3E01E
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 12:27:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104354.1455421 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut1kZ-0002Xh-Tv; Mon, 01 Sep 2025 10:26:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104354.1455421; Mon, 01 Sep 2025 10:26:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut1kZ-0002VI-RB; Mon, 01 Sep 2025 10:26:59 +0000
Received: by outflank-mailman (input) for mailman id 1104354;
 Mon, 01 Sep 2025 10:26:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UGQU=3M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ut1kX-0002V7-SX
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 10:26:57 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f1a14b4-871e-11f0-8dd7-1b34d833f44b;
 Mon, 01 Sep 2025 12:26:56 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-61e8fdfd9b4so1889428a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 03:26:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc52ade4sm6828255a12.45.2025.09.01.03.26.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 03:26:54 -0700 (PDT)
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
X-Inumbo-ID: 2f1a14b4-871e-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756722415; x=1757327215; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=dS1NCKWWtcvvZHGl5IR+vSVQ2+EnVmtty+0c30l9Cgg=;
        b=Lo1PU8yLenMCCMa6vuH/sJptntDSdeQrc6Klnxg3zl3vgD+772goQ4i0HF1bhq9wgz
         8an8eQO4EHfJAd2oYaKfmjTPtGQtfic41DqHrf5uzlkSBGJGlZ+LVtOf4lXdxZg1AxNU
         BAC+0Z3q3krb3YphlvN/HlBybONnjQQLyys64QPhJX5Jmf5m0qxVUdn7cldV2G9D3snd
         LHkU/YDuj1Qll5WRtxoXznK2ftH8TFFdPSCPbdiXwwFofaxgMTg8nb3XocfZj5bSZ90J
         XClniP263pAX2yCqlqxib5oWb8b0RipLZkKZZez6eTIQRlyTDsGprXjrwrr7OhfKJ4vc
         7vnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756722415; x=1757327215;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dS1NCKWWtcvvZHGl5IR+vSVQ2+EnVmtty+0c30l9Cgg=;
        b=oSy/pkywy7I4Zo2Wh+mgp9BY6v5JjSV16h6uWG29i5oFacQ4MAY58OeEmvwEgRif9c
         tNFW9SVjv4hX4XQLGOWSftHm3lITmSp99NVkmO5Dtl0OGI8eQVdVtdO3Bmk2RERzUvax
         m/NJarrH1ubBjgjMLzR0emSsxeMxaujFNfdHa46mGcfmLn9htbsox9bK2jCNSXwzZIj5
         y2RbqVbl91IjQjtLRALH8P9vDyHJo+u1hZPwKzN853UoBN5n8uX7mZTd/1ti571YUIID
         166wXxHL3wqM+pq9WdDIi3ALzkjjN8AdUlQHi2zzSty7Qtr6WXhlm6TkID5A2kbJPuAW
         rxZg==
X-Forwarded-Encrypted: i=1; AJvYcCXEdeSpMd7Cr4vS9r4r9BaRZHHdMVzandOduig+uhXG7Wv0cot8jHAAdQJN7Mt3ayl6qf6vO0ciPyw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzlBCDYGFD9BcsPYxaC4C2FSB7cuF5S9O5ucviu6V7FkQ1eTYFN
	CvfgdcH2Xx6+3afaQAtADJI7zpD17+r7smRvOqfJU9rQTECnIXfxqHHILoSVSjAeD+fgBNKQdIi
	hLM0=
X-Gm-Gg: ASbGncvXd/IZYzGjaTSPvNQIM+kWlDB8uPBkEdsZ62mWESUGUWVVeZwhCE9PxqDR3Ar
	g+6xEhZdZ8CIbOF6XfB+t68qvbfMbuUrAiX6eeyPiXx/kq1WAXovuvZeICAb46xNyjbHo6ha14t
	+6tzMiTn/Ljux5xopvo7WUILU+r3LlUQj+SXwuk3dpgdaXsPnHoudeb7Ld64nY9Lv9v50O5dklc
	ylf9EAcfyt1YjeEjJndrQmQnreNZJtNvYJZfnYpCvQy6dRLs2qAEsjVtZN7LzYRWDXnKTh3Uzor
	tzZYtwmCvj49x1o9ebm/P9XAr3AMELhRISkII21vOUnA2/aaBEyITDM8f+23+JRYuCEBD4qM7BM
	6CzeVeG2oBWloAka0tu34gxaEE5+E609fkOia6+NTNcQm2fTRQXOGzbtOO92yC7Ojxh4t7R6BYv
	QHaMgvtl5Zl9PJJtoJ6g==
X-Google-Smtp-Source: AGHT+IFGdLcKcOZbOrvQRX/+x15X7GNdCt8kzppE6eEBhyatVDokfCm83RELqL67XUWLH+XhaYm9wA==
X-Received: by 2002:a05:6402:848:b0:61c:e28a:aa9b with SMTP id 4fb4d7f45d1cf-61d2699a122mr6896754a12.7.1756722415176;
        Mon, 01 Sep 2025 03:26:55 -0700 (PDT)
Message-ID: <2482792a-f4c6-47d4-87ee-d400549a1f1c@suse.com>
Date: Mon, 1 Sep 2025 12:26:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/23] x86/traps: Introduce FRED entrypoints
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250828150409.901315-1-andrew.cooper3@citrix.com>
 <20250828150409.901315-14-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250828150409.901315-14-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28.08.2025 17:03, Andrew Cooper wrote:
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

This last sentence looks to be stale now.

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

The parameter isn't really needed, at least not just yet. Do you have firm
plans for using it (presumably in the SVM code ahead of VMRUN)? Else I'd
suggest to omit it, as it's fragile anyway: One can't use an arbitrary
register for it; only ...

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

... the ones POPed later are candidates. Their order isn't really visible
at use sites of the macro, though. (A possibility would be to indicate
via argument only _that_ the %rax slot wants discarding, without indicating
by use of which register.)

> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -89,6 +89,13 @@ const unsigned int nmi_cpu;
>  #define stack_words_per_line 4
>  #define ESP_BEFORE_EXCEPTION(regs) ((unsigned long *)(regs)->rsp)
>  
> +/* Only valid to use when FRED is active. */
> +static inline struct fred_info *cpu_regs_fred_info(struct cpu_user_regs *regs)
> +{
> +    ASSERT(read_cr4() & X86_CR4_FRED);
> +    return (void *)(regs + 1);

Maybe better

    &container_of(regs, struct cpu_info, guest_cpu_user_regs)->_fred;

?

> @@ -1101,9 +1134,41 @@ void fatal_trap(const struct cpu_user_regs *regs, bool show_remote)
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

Is it deliberate that here and ...

> +                  regs->fred_ss.type, x86_et_name(regs->fred_ss.type),
> +                  regs->fred_ss.vector, vec_name ?: "",
> +                  regs->error_code,
> +                  (regs->eflags & X86_EFLAGS_IF) ? "" : " IN INTERRUPT CONTEXT");
> +        else
> +            panic("Fatal TRAP: type %u, %s, vec %u, %s%s\n",

.. here it's "Fatal", when ....

> +                  regs->fred_ss.type, x86_et_name(regs->fred_ss.type),
> +                  regs->fred_ss.vector, vec_name ?: "",
> +                  (regs->eflags & X86_EFLAGS_IF) ? "" : " IN INTERRUPT CONTEXT");
> +    }
> +    else
> +        panic("FATAL TRAP: vec %u, %s[%04x]%s\n",

... here it's "FATAL"? (Personally I prefer the all capitals form.)

> +              trapnr, vector_name(trapnr), regs->error_code,
> +              (regs->eflags & X86_EFLAGS_IF) ? "" : " IN INTERRUPT CONTEXT");

Just as a remark (the "else" thing still needs sorting) - without "else"
this would be a smaller diff.

> @@ -2198,6 +2263,94 @@ void asmlinkage check_ist_exit(const struct cpu_user_regs *regs, bool ist_exit)
>  }
>  #endif
>  
> +void asmlinkage entry_from_pv(struct cpu_user_regs *regs)
> +{
> +    /* Copy fred_ss.vector into entry_vector as IDT delivery would have done. */
> +    regs->entry_vector = regs->fred_ss.vector;
> +
> +    fatal_trap(regs, false);
> +}
> +
> +void asmlinkage entry_from_xen(struct cpu_user_regs *regs)
> +{
> +    struct fred_info *fi = cpu_regs_fred_info(regs);
> +    uint8_t type = regs->fred_ss.type;
> +
> +    /* Copy fred_ss.vector into entry_vector as IDT delivery would have done. */
> +    regs->entry_vector = regs->fred_ss.vector;
> +
> +    /*
> +     * First, handle the asynchronous or fatal events.  These are either
> +     * unrelated to the interrupted context, or may not have valid context
> +     * recorded, and all have special rules on how/whether to re-enable IRQs.
> +     */
> +    switch ( type )
> +    {
> +    case X86_ET_EXT_INTR:
> +        return do_IRQ(regs);
> +
> +    case X86_ET_NMI:
> +        return do_nmi(regs);
> +
> +    case X86_ET_HW_EXC:
> +        switch ( regs->fred_ss.vector )
> +        {
> +        case X86_EXC_DF: return do_double_fault(regs);
> +        case X86_EXC_MC: return do_machine_check(regs);
> +        }
> +        break;
> +    }
> +
> +    /*
> +     * With the asynchronous events handled, what remains are the synchronous
> +     * ones.  If we interrupted an IRQs-on region, we should re-enable IRQs
> +     * now; for #PF and #DB, %cr2 and %dr6 are on the stack in edata.
> +     */
> +    if ( regs->eflags & X86_EFLAGS_IF )
> +        local_irq_enable();

Ah yes, here we go (as to my question on an earlier patch).

> +    switch ( type )
> +    {
> +    case X86_ET_HW_EXC:
> +    case X86_ET_PRIV_SW_EXC:
> +    case X86_ET_SW_EXC:
> +        switch ( regs->fred_ss.vector )
> +        {
> +        case X86_EXC_PF:  handle_PF(regs, fi->edata); break;
> +        case X86_EXC_GP:  do_general_protection(regs); break;
> +        case X86_EXC_UD:  do_invalid_op(regs); break;
> +        case X86_EXC_NM:  do_device_not_available(regs); break;
> +        case X86_EXC_BP:  do_int3(regs); break;
> +        case X86_EXC_DB:  handle_DB(regs, fi->edata); break;
> +
> +        case X86_EXC_DE:
> +        case X86_EXC_OF:
> +        case X86_EXC_BR:
> +        case X86_EXC_NP:
> +        case X86_EXC_SS:
> +        case X86_EXC_MF:
> +        case X86_EXC_AC:
> +        case X86_EXC_XM:
> +            do_trap(regs);
> +            break;
> +
> +        case X86_EXC_CP:  do_entry_CP(regs); break;

Any reason this isn't grouped with the other single-line cases?

Jan

