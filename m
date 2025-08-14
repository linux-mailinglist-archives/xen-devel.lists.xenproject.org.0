Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E5FAB26BAC
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 17:58:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081962.1441929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umaKn-00071g-0s; Thu, 14 Aug 2025 15:57:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081962.1441929; Thu, 14 Aug 2025 15:57:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umaKm-0006zs-Tw; Thu, 14 Aug 2025 15:57:44 +0000
Received: by outflank-mailman (input) for mailman id 1081962;
 Thu, 14 Aug 2025 15:57:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umaKk-0006zm-VZ
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 15:57:42 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 682ee862-7927-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 17:57:40 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-afcb73621fcso154437266b.0
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 08:57:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6187d96a320sm2700385a12.4.2025.08.14.08.57.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 08:57:39 -0700 (PDT)
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
X-Inumbo-ID: 682ee862-7927-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755187060; x=1755791860; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uYptK7OXZhJa1CB6cMoPljnV6QPXkm1IiA50MbqGyzM=;
        b=T2uaL0DDu35iLX9yPGwnGQCP12JBSgu2ymOfYAfJWhfJtxkOBTQRTaVbjp9soZSL31
         WBbDyJl/QpW+ZSi9/2g8pdys3DA6hMx5IKi/inKnZz9seL3z05Ay032obx7QQYmCbiQq
         xwuoYaGcmbTO2MGYd82iHYnFdbT69gPpGlgxxRNe/0fuY/RFD/6q/30QjcWU5V1IiDEr
         dNdwu09KpWgQvd/EM7CnYkeorfb5jFQYFnBD9Yt3QaGxMI7Y3zoDiTAQgsdZtZngcCyh
         VUwWHt+E/RDGJba1kKW1zNKnQfg6V53LiIl3cBaSMUzGRC8bJRFemVRjtU1/PyHPKMBB
         b6UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755187060; x=1755791860;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uYptK7OXZhJa1CB6cMoPljnV6QPXkm1IiA50MbqGyzM=;
        b=Arj07CahgIXx+LilQXmzK/2vu7lHztT/rwPk+jcIXdiNxIvgYdqloL2ngCDRNmqgl7
         BJBcNqpoooLufeIFhNhIcNiF18ehcS8o1u00vrPy4kuC+o+d3woVBo+m251oS4JgTt3K
         v1MsmkIAJzZ98ZVYcXByrtngzixKrWTICu8+AbTBwOkiqK5qBzVCuVROH7QtMYoJrQUa
         DmzrUWzuM6AfG4eWRh3KM5Y5tKv8rCcbxRFs8VI5vahnKnCOapuVz5aoOn8u+VreoZ2C
         f3SUrJeQkzWJMcNMkg8hlANhh/o2/7FkaUb29V/pN+OLDB+f9+LfelxCppUl+4EsBATp
         LD/w==
X-Forwarded-Encrypted: i=1; AJvYcCX8xKIOtSCmvaBjECaANSoSRaQvjvcBPan4Pp2HvQTjh3Lpy3IDwyYsW2GkFNMRWieKTgdDhtXH7eM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzBcFkdN/3H1XrpZUimu6cntEY1LER2Wx3t+ajb8PnfIKA7/S1c
	TrrSzaH7EVUs526SevVfEJRYohAlR/xuNxpOL+FxEhaMTwQA5doq08ken6o/7Q6DB1SWz4IJNeN
	0/xk=
X-Gm-Gg: ASbGncth2xE/wkppU/aJBUFK6RG6Xf27/05r2y5EZaP26LmSDCSfRykw8pS2E103rmS
	81u6XiaSrn8qX3sV3F2KccjO6zrnnSvB0jS1QzEcL71VDJaGIaqCX80xInPUtQiuPrwcu6b0Zid
	bKPCXe0fSTDZRe6kW4vht6SfYrwCr/EGuXGv5T1Jyoo72tyxHkqxg7wBU0/dfuO9rUoZ3Z/rByq
	KZTMmn9QZN/2z2XPx5dAjKcMUkenhr90xJ4HxUEGfiN4dIuHt+sxf4BOY1/hb6DYEohxhiS1M6I
	1OPhQfmWIe74kuUYBumz7WDwZbsnLGA5xgsOEkg2eGheJPUO3xhbzVg5sFBzHgq0aJSFrqZwug6
	jRryPe9gZuhAJMrf70lW7On7Fcp+6A4ZSLEnUaLPF2C3ldfGZIqJY3ylaLhYJmegcrNV1LbYO/j
	2HQeIXhKOeoA8hdA7wfQ==
X-Google-Smtp-Source: AGHT+IFiIv+5ISK1dGdhn84iYocNr4OLQ9XgJF5/tNjF0f63YyzpKRzH/5Mf4VlZ4fwoX1GAAQGlHw==
X-Received: by 2002:a17:907:3f9a:b0:af9:6bfb:58b7 with SMTP id a640c23a62f3a-afcb981e496mr369361766b.5.1755187060210;
        Thu, 14 Aug 2025 08:57:40 -0700 (PDT)
Message-ID: <53028a31-e07d-43f1-b320-2775c5560a09@suse.com>
Date: Thu, 14 Aug 2025 17:57:38 +0200
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
Content-Transfer-Encoding: 7bit

On 08.08.2025 22:23, Andrew Cooper wrote:
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

Hmm, yes, differences are apparently large enough to warrant the redundancy
with SAVE_ALL / RESTORE_ALL.

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

I don't quite get how these changes fit into this patch.

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

This isn't really a vector, is it?

> +{
> +    static const char *const names[] = {
> +        [0] = "MTF",
> +        [1] = "SYSCALL",
> +        [2] = "SYSENTER",
> +    };
> +
> +    return (vec < ARRAY_SIZE(names) && names[vec][0]) ? names[vec] : "???";

Did you mean to check names[ves] for being NULL? Or is this a leftover
from the array being something like names[][10]?

> --- a/xen/arch/x86/x86_64/Makefile
> +++ b/xen/arch/x86/x86_64/Makefile
> @@ -1,6 +1,7 @@
>  obj-$(CONFIG_PV32) += compat/
>  
>  obj-bin-y += entry.o
> +obj-bin-y += entry-fred.o

For the ordering here, ...

> --- /dev/null
> +++ b/xen/arch/x86/x86_64/entry-fred.S
> @@ -0,0 +1,35 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +        .file "x86_64/entry-fred.S"
> +
> +#include <asm/asm_defns.h>
> +#include <asm/page.h>
> +
> +        .section .text.entry, "ax", @progbits
> +
> +        /* The Ring3 entry point is required to be 4k aligned. */
> +
> +FUNC(entry_FRED_R3, 4096)

... doesn't this 4k-alignment requirement suggest we want to put
entry-fred.o first? Also, might it be more natural to use PAGE_SIZE
here?

Jan

