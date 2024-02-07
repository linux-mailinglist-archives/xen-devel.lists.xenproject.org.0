Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAF084CEAD
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 17:12:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677807.1054666 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXkWM-0005N0-HR; Wed, 07 Feb 2024 16:11:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677807.1054666; Wed, 07 Feb 2024 16:11:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXkWM-0005Ku-El; Wed, 07 Feb 2024 16:11:34 +0000
Received: by outflank-mailman (input) for mailman id 677807;
 Wed, 07 Feb 2024 16:11:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXkWL-0005Ko-Fx
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 16:11:33 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8eedaa58-c5d3-11ee-8a4a-1f161083a0e0;
 Wed, 07 Feb 2024 17:11:32 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-41028900b83so961555e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 08:11:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 bh9-20020a05600c3d0900b0041027934b19sm313220wmb.7.2024.02.07.08.11.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 08:11:31 -0800 (PST)
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
X-Inumbo-ID: 8eedaa58-c5d3-11ee-8a4a-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707322292; x=1707927092; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nKE+UH5CLXyTzi6UmjufGHKXNy858Aqo/bh0dbKyexo=;
        b=aWoiiDcBCEWyYBwKWHewpOYaYF5C/GEfGY2IDi0iUlA/qQtHjEKSxkzyI5J6b471U9
         dFkvGx/CAMbueirL0PN377mGeLP++gxs8bnRiVwZ8aKJm+qCoh/yz9M2U5L96cWV4BKp
         QIgXOn7VeJhygeujG2M2Jete39I7gzadrxJ7LoSVFA4pjlHRpRBQZU9v8D9wDA+fQbZi
         oHfbpuKJ7ldUEBYvGeCRber1iK9RHOD/p5/qSrEbDw7uzbEBJ1Y+MdqD25nmmcuQRfEl
         he4qV7rR0tIFjSBkiirZfKXudLcq+jKjg/nUlxeIpwocfS2IbtVYDIn5F75Wvj5any8N
         KlxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707322292; x=1707927092;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nKE+UH5CLXyTzi6UmjufGHKXNy858Aqo/bh0dbKyexo=;
        b=vuyXe3t/mzeMVblYeOp2MJzkErYbkr5mjMz2R2vJxo02HBieCHwPyVZrFmmPrLkh3L
         I5zxAvjldqZqYG1PMpCoRYFdodAkTpgaLDzcRCv8Wkhh1yy1Ix3dTkcxOoplMGuUUmAJ
         hDpsJUHX/hc+Ry4I+qm/Z9Q7c+ET7JW/auACPVL+GJd0us+XpxACyAzBASs00hc/WFDJ
         9bjQN+okBWc+RmCLJkwqn2inO9y07ZobhBBRnceJd6EbuvNVRZi1nIQdrTyEyOxXfQMj
         8fnv3eOgMJ+Ced11eVXYUZ/zHyBhXDCMn0n8/JJ3RBM+GBY0zbekwA+BmTxOjCcay6F2
         wPwA==
X-Gm-Message-State: AOJu0YycTDFKTF5+aD15QzxxYzdoWQPLiLQhfthaqbJP4NTfa+9zdIMU
	ZaCWVT+ZTtzYcwZ6ga+velcr1QYhXzZo88y8JrJW3sqRQ3zwXWI76pu8/wYXWA==
X-Google-Smtp-Source: AGHT+IH4EoKc/UEYyEeLUGG8Omg1WDat1nGttqddfySYnVLAOZeKI6Yv45e/ncIOeiOq7FHs8Tz1Ug==
X-Received: by 2002:a05:600c:1d99:b0:410:2058:c478 with SMTP id p25-20020a05600c1d9900b004102058c478mr762793wms.5.1707322291741;
        Wed, 07 Feb 2024 08:11:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXlEijOBTKL7mYoLAfPz68fujlStIzstAPPmpW512v9iylUy0Rn7g8FXA/P8oLkcSXaCeHs4fO9ZKUXiEkmI1S6km6UcQQ1IOdYhsAaP/+5l/q7HBjY7CFkFjNyo62HcukLwoq4R1DERSOT+nISlZKK
Message-ID: <d0e03f9a-83b2-4809-9b76-5612f28f2464@suse.com>
Date: Wed, 7 Feb 2024 17:11:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 1/9] x86/boot: choose AP stack based on APIC ID
Content-Language: en-US
To: Krystian Hebel <krystian.hebel@3mdeb.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
References: <cover.1699982111.git.krystian.hebel@3mdeb.com>
 <0e7dd957b6f26fa7b752bdce1ef6ebe97c825903.1699982111.git.krystian.hebel@3mdeb.com>
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
In-Reply-To: <0e7dd957b6f26fa7b752bdce1ef6ebe97c825903.1699982111.git.krystian.hebel@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.11.2023 18:49, Krystian Hebel wrote:
> --- a/xen/arch/x86/boot/trampoline.S
> +++ b/xen/arch/x86/boot/trampoline.S
> @@ -72,6 +72,26 @@ trampoline_protmode_entry:
>          mov     $X86_CR4_PAE,%ecx
>          mov     %ecx,%cr4
>  
> +        /*
> +         * Get APIC ID while we're in non-paged mode. Start by checking if
> +         * x2APIC is enabled.
> +         */
> +        mov     $MSR_APIC_BASE, %ecx
> +        rdmsr
> +        and     $APIC_BASE_EXTD, %eax

You don't use the result, in which case "test" is to be preferred over
"and".

> +        jnz     .Lx2apic
> +
> +        /* Not x2APIC, read from MMIO */
> +        mov     0xfee00020, %esp

Please don't open-code existing constants (APIC_ID here and below,
APIC_DEFAULT_PHYS_BASE just here, and ...

> +        shr     $24, %esp

... a to-be-introduced constant here (for {G,S}ET_xAPIC_ID() to use as
well then). This is the only way of being able to easily identify all
pieces of code accessing the same piece of hardware.

> +        jmp     1f
> +
> +.Lx2apic:
> +        mov     $(MSR_X2APIC_FIRST + (0x20 >> 4)), %ecx
> +        rdmsr
> +        mov     %eax, %esp
> +1:

Overall I'm worried of the use of %esp throughout here.

> --- a/xen/arch/x86/boot/x86_64.S
> +++ b/xen/arch/x86/boot/x86_64.S
> @@ -15,7 +15,33 @@ ENTRY(__high_start)
>          mov     $XEN_MINIMAL_CR4,%rcx
>          mov     %rcx,%cr4
>  
> -        mov     stack_start(%rip),%rsp
> +        test    %ebx,%ebx

Nit (style): Elsewhere you have blanks after the commas, just here
(and once again near the end of the hunk) you don't.

> +        cmovz   stack_start(%rip), %rsp
> +        jz      .L_stack_set
> +
> +        /* APs only: get stack base from APIC ID saved in %esp. */
> +        mov     $-1, %rax

Why a 64-bit insn here and ...

> +        lea     x86_cpu_to_apicid(%rip), %rcx
> +1:
> +        add     $1, %rax

... here, when you only use (far less than) 32-bit values?

> +        cmp     $NR_CPUS, %eax
> +        jb      2f
> +        hlt
> +2:
> +        cmp     %esp, (%rcx, %rax, 4)
> +        jne     1b

Aren't you open-coding REPNE SCASD here?

> +        /* %eax is now Xen CPU index. */
> +        lea     stack_base(%rip), %rcx
> +        mov     (%rcx, %rax, 8), %rsp
> +
> +        test    %rsp,%rsp
> +        jnz     1f
> +        hlt
> +1:
> +        add     $(STACK_SIZE - CPUINFO_sizeof), %rsp

Even this post-adjustment is worrying me. Imo the stack pointer is
better set exactly once, to its final value. Keeping it at its init
value of 0 until then yields more predictable results in case it
ends up being used somewhere.

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1951,6 +1951,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>       */
>      if ( !pv_shim )
>      {
> +        /* Separate loop to make parallel AP bringup possible. */
>          for_each_present_cpu ( i )
>          {
>              /* Set up cpu_to_node[]. */
> @@ -1958,6 +1959,12 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>              /* Set up node_to_cpumask based on cpu_to_node[]. */
>              numa_add_cpu(i);
>  
> +            if ( stack_base[i] == NULL )
> +                stack_base[i] = cpu_alloc_stack(i);
> +        }

Imo this wants accompanying by removal of the allocation in
cpu_smpboot_alloc(). Which would then make more visible that there's
error checking there, but not here (I realize there effectively is
error checking in assembly code, but that'll end in HLT with no
useful indication of what the problem is). Provided, as Julien has
pointed out, that the change is necessary in the first place.

Jan

