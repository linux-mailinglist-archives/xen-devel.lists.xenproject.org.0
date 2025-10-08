Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48977BC4C74
	for <lists+xen-devel@lfdr.de>; Wed, 08 Oct 2025 14:29:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139596.1474875 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6THe-0005u9-75; Wed, 08 Oct 2025 12:28:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139596.1474875; Wed, 08 Oct 2025 12:28:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6THe-0005rZ-3e; Wed, 08 Oct 2025 12:28:42 +0000
Received: by outflank-mailman (input) for mailman id 1139596;
 Wed, 08 Oct 2025 12:28:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eGu8=4R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v6THc-0005rL-JR
 for xen-devel@lists.xenproject.org; Wed, 08 Oct 2025 12:28:40 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 51918c58-a442-11f0-9d15-b5c5bf9af7f9;
 Wed, 08 Oct 2025 14:28:39 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-631df7b2dffso2067778a12.1
 for <xen-devel@lists.xenproject.org>; Wed, 08 Oct 2025 05:28:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6376b3b74f1sm14767076a12.12.2025.10.08.05.28.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Oct 2025 05:28:38 -0700 (PDT)
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
X-Inumbo-ID: 51918c58-a442-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759926519; x=1760531319; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DyuxohSDEdGryirQA8VT3HQHz5aq5c7jJZEo8XS9Ic8=;
        b=AaDPTjhox2Qj101+dZjmXrpJcuozc0kkXg58Jhot1ulI6zgJKS6MSKigbiWwqpxSDm
         TI9Rex2qBpah4yku8QKEyiEI42KNpUr1JPwdsZfhujdUt4pHw08+J+ssW/ULp2Ldvt98
         aGXdFnSixCJxqJLApxpN0/WgPHQZ6p5EWV9GhcYfxqFiU2+p2lRUwexoai7PgsUd/L2m
         I5crUYEZnMTXL0xcZr0dJE1dw9JW2tSBvM1l1TYYPZm7EZTjo1heyUda5V8eBhY5EC64
         V8T9LzMz4jv6r/jreg5RHeS80seLvjpgiLsPTbA+hTgRyrddW3EEkfZrCNTfUPrP7CeH
         yXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759926519; x=1760531319;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DyuxohSDEdGryirQA8VT3HQHz5aq5c7jJZEo8XS9Ic8=;
        b=pjR8BJOTFaUL8UvYSMZRllEZX6jHpsO2oDZXOA/PXIH8E36Notmj+df04SaxJqLihe
         HuPLVCuAMkGq9B2y474I2fJx/rn0cpsCol7Pj/ZXF2mO8KHk8qGBRK+MJ+UVxwWb/jZX
         KWncAoNDwnEoadUWu5WBYSYso2jWpChBBT2ScSw4dLD6WykvVIbvs7FunkCReSbhv4B3
         vVqKlZHCeA6VuoL9nooVNTuvJI7SksQSsOUASJ5L6zcc9OPJymlzltqjdsz70dWeke/C
         i8ms8PODaEAKnTxibZdNwTjzJV5+3x/Cw4aIt/vwQRMB99nPqQXFqtf9bvZUc3AX2Ar9
         6gXw==
X-Forwarded-Encrypted: i=1; AJvYcCWSJrDkO65JrccSMfVic0uqafwn2zHBvsuvHehygQSN9Y1GLn8zRwONjMX4kl+eUt3TLRjTnRwpQyI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxkROehK/A4T3Qy33sgXFVCaM/qVp1A3O3/KlUCIWQuH2firgnp
	zwcSu2NJsNPZFpGKrxEE4dKH4/Gf1pZeqI/jEogfueergWeUKI94wreHk24VYkcCaSMiUi2VMam
	K+Qk=
X-Gm-Gg: ASbGnct8zDeHQFt1jmPPC1YjumJZAOKTlQyWjz0diaJXSs8HB0SuFXI4+Wrk7UU+KBX
	jIYxlKPg3B0nHeBICIMvNVBuGMAWBrh4Z/P4TvHrHRvs+/WF21CGYHwhHuJRM2qL9zbgCuDKIM1
	+8+VlKy3gu/gsOYmhtqD/DEWKIHNRvxs77UKwnVccQDocxmvGFFtN7MMgIR9ynnwIDNTt2oEhuM
	/+eY6fo59R8wHk37GShOtBxy/3KjMU/kT40+iPmX8X7ot/zjox2tEKwqJM858LZPPXcX4qe0utc
	9VvnAEIAZxKKAyOqAklKkF+pGLkjgkU8PcHrcWzg34PGVEifNwoo9JKXG/0KjEXTRFPqbWA6D4T
	pG+O/1jWi4mdbLTfoL9eoi13VAsqollRDCfTQ4fzZogx/piSts/K2P6zGcTWiJEF59lyyhTLnn+
	2hxE/CV9OjfZud7I5657chZDQm4qF3e+K4JJ7vB/1yjg==
X-Google-Smtp-Source: AGHT+IGrSerCxQqjfWUgM9klnco078v6pITKbU4h3nVh1wBrmVmgGF3e8FMOiycnNGgxnb/UxiCuaw==
X-Received: by 2002:aa7:c850:0:b0:61c:b23f:417e with SMTP id 4fb4d7f45d1cf-639ba74c4f0mr5778170a12.2.1759926518677;
        Wed, 08 Oct 2025 05:28:38 -0700 (PDT)
Message-ID: <008cb741-26e2-4f28-9dd9-c88f9fbba743@suse.com>
Date: Wed, 8 Oct 2025 14:28:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/22] x86/pv: Guest exception handling in FRED mode
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
 <20251003225334.2123667-20-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251003225334.2123667-20-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.10.2025 00:53, Andrew Cooper wrote:
> Under FRED, entry_from_pv() handles everything.  To start with, implement
> exception handling in the same manner as entry_from_xen(), although we can
> unconditionally enable interrupts after the async/fatal events.
> 
> After entry_from_pv() returns, test_all_events() needs to run to perform
> exception and interrupt injection.  Split entry_FRED_R3() into two and
> introduce eretu_exit_to_guest() as the latter half, coming unilaterally from
> restore_all_guest().
> 
> For all of this, there is a slightly complicated relationship with CONFIG_PV.
> entry_FRED_R3() must exist irrespective of CONFIG_PV, because it's the
> entrypoint registered with hardware.  For simplicity, entry_from_pv() is
> always called, but it collapses into fatal_trap() in the !PV case.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

Nevertheless ...

> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -2266,9 +2266,82 @@ void asmlinkage check_ist_exit(const struct cpu_user_regs *regs, bool ist_exit)
>  
>  void asmlinkage entry_from_pv(struct cpu_user_regs *regs)
>  {
> +    struct fred_info *fi = cpu_regs_fred_info(regs);
> +    uint8_t type = regs->fred_ss.type;
> +    uint8_t vec = regs->fred_ss.vector;
> +
>      /* Copy fred_ss.vector into entry_vector as IDT delivery would have done. */
> -    regs->entry_vector = regs->fred_ss.vector;
> +    regs->entry_vector = vec;
> +
> +    if ( !IS_ENABLED(CONFIG_PV) )
> +        goto fatal;
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
> +        switch ( vec )
> +        {
> +        case X86_EXC_DF: return do_double_fault(regs);
> +        case X86_EXC_MC: return do_machine_check(regs);
> +        }
> +        break;
> +    }
> +
> +    /*
> +     * With the asynchronous events handled, what remains are the synchronous
> +     * ones.  PV guest context always had interrupts enabled.
> +     */
> +    local_irq_enable();
> +
> +    switch ( type )
> +    {
> +    case X86_ET_HW_EXC:
> +    case X86_ET_PRIV_SW_EXC:
> +    case X86_ET_SW_EXC:
> +        switch ( vec )
> +        {
> +        case X86_EXC_PF:  handle_PF(regs, fi->edata); break;
> +        case X86_EXC_GP:  do_general_protection(regs); break;
> +        case X86_EXC_UD:  do_invalid_op(regs); break;
> +        case X86_EXC_NM:  do_device_not_available(regs); break;
> +        case X86_EXC_BP:  do_int3(regs); break;
> +        case X86_EXC_DB:  handle_DB(regs, fi->edata); break;
> +        case X86_EXC_CP:  do_entry_CP(regs); break;
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
>  
> +        default:
> +            goto fatal;
> +        }
> +        break;
> +
> +    default:
> +        goto fatal;
> +    }
> +
> +    return;
> +
> + fatal:
>      fatal_trap(regs, false);
>  }

... I'm still somewhat bothered by this almost entirely duplicating the
other entry function, i.e. I continue to wonder if we wouldn't be better
off by eliminating that duplication (say by way of an always_inline
helper with a suitable extra parameter).

> --- a/xen/arch/x86/x86_64/entry.S
> +++ b/xen/arch/x86/x86_64/entry.S
> @@ -63,7 +63,7 @@ UNLIKELY_END(syscall_no_callback)
>          /* Conditionally clear DF */
>          and   %esi, UREGS_eflags(%rsp)
>  /* %rbx: struct vcpu */
> -test_all_events:
> +LABEL(test_all_events, 0)
>          ASSERT_NOT_IN_ATOMIC
>          cli                             # tests must not race interrupts
>  /*test_softirqs:*/
> @@ -152,6 +152,8 @@ END(switch_to_kernel)
>  FUNC_LOCAL(restore_all_guest)
>          ASSERT_INTERRUPTS_DISABLED
>  
> +        ALTERNATIVE "", "jmp eretu_exit_to_guest", X86_FEATURE_XEN_FRED
> +
>          /* Stash guest SPEC_CTRL value while we can read struct vcpu. */
>          mov VCPU_arch_msrs(%rbx), %rdx

I also continue to wonder if we wouldn't do a tiny bit better by using

        ALTERNATIVE "mov VCPU_arch_msrs(%rbx), %rdx", \
                    "jmp eretu_exit_to_guest", \
                    X86_FEATURE_XEN_FRED

Or by converting the few jumps to restore_all_guest to alternatives
(duplicating the ASSERT_INTERRUPTS_DISABLED there).

Jan

