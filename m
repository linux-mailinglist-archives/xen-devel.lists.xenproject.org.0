Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81CBF94BB47
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2024 12:37:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.773892.1184326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc0Vf-0007xY-AQ; Thu, 08 Aug 2024 10:36:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 773892.1184326; Thu, 08 Aug 2024 10:36:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sc0Vf-0007w3-7R; Thu, 08 Aug 2024 10:36:43 +0000
Received: by outflank-mailman (input) for mailman id 773892;
 Thu, 08 Aug 2024 10:36:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gzZp=PH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sc0Vd-0007uh-6u
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2024 10:36:41 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 18841c8a-5572-11ef-bc04-fd08da9f4363;
 Thu, 08 Aug 2024 12:36:39 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a7aa4bf4d1eso108034766b.0
 for <xen-devel@lists.xenproject.org>; Thu, 08 Aug 2024 03:36:39 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9ec8884sm725231766b.193.2024.08.08.03.36.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Aug 2024 03:36:38 -0700 (PDT)
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
X-Inumbo-ID: 18841c8a-5572-11ef-bc04-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723113399; x=1723718199; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PzDA/usYkved4BZbdw6J/ufK5oGICJQfOYw2WjQpl8A=;
        b=eKyRSsGVw21zOaGDeo+SGLhjWlQKwCQGazm4mx+blsCo7acg9XUfa8PKVpGvquSM1Q
         dwenQ7wBxmo0dCOdJvA6EGeAoTfVy2jIkqX3hpgUJxG8qEBCXyMftilD/EC1CHVhuXpk
         wEyJ+cabHTpABZlyINNC5YzRNzyaqz8+NSd3tsgQRvaNqbjeCn0faozhbFF+fPpXvKD1
         pLeJhaqtHIxn4/b/00KtAzzGVP+JaQ0dCnfPjwbW3HSE4kpxPPZM2a+GkNnN7l/vyPZh
         uqHf+82SuoRq7xAPsVrz6QLM1KHhS6c8O4Bva51n0PKoiDB+PUzlhZKhsavR4M/Sw0A+
         MLYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723113399; x=1723718199;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PzDA/usYkved4BZbdw6J/ufK5oGICJQfOYw2WjQpl8A=;
        b=o4HHs/XEpHtX3kru91YAJOpgqUNcbsfhjN4PNNDvyleOhnyjmquCL21jBa/leoapaP
         OyKxGHMTabjjj1Qq6K8QpeTTeNOnFJV6/Evy7yNiySPgmNYGQQh1XU0Kiq4clccCa28O
         U7hO5k+kBg7eeHty618Q8uil2l86ZHrswQ69qf8atTCDpRwqUwxPg8NbdQ4NJjvI90Ya
         KGJajtOkJYFQls7bNzG/ZWMHawU9WH6zwZv0hxjEirD0orBW7FJNyAGFajSJpMzlRBL2
         HDErHjajHyxPJC2pU1v/n5/6n2uDKosvmmX895H/rTeHl+jdwsaXyrK7/r1jiOfRxl7N
         FsXA==
X-Forwarded-Encrypted: i=1; AJvYcCVTXwDVreXNNIZr6YTPMDMyBAqDIMPUoff6+HUKBOfzxmVvHSg1DzwjKwD02Lyp1rwMF/Felyr+Krsphe4wAG/MbCMTt6+8TwfGGidWpY0=
X-Gm-Message-State: AOJu0YxP80tJ/K7+htzwsMHPMq/ca6lllVeJQd/FoA9VqaO6GWZubE3q
	0t4aU6s4VdFw5NQuxuWWFZcuiQ/vhevYhB5Mv7IOnpfkYG5UTBiHak65L1pa1xF2xGT+osoJ4BM
	=
X-Google-Smtp-Source: AGHT+IEMTnYrws1JouxtNS0vn5DA4Doi61pLKO9PCaIXmrdlRv8i6zKbQv8n3mDxueDKMefy0pl9Jw==
X-Received: by 2002:a17:907:944c:b0:a7a:c083:8575 with SMTP id a640c23a62f3a-a80907c97e5mr94279066b.0.1723113399146;
        Thu, 08 Aug 2024 03:36:39 -0700 (PDT)
Message-ID: <68a1b0cf-24a4-49a2-a398-6fa56a6bcdc3@suse.com>
Date: Thu, 8 Aug 2024 12:36:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] x86: Rollback relocation in case of EFI multiboot
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240807134819.8987-1-alejandro.vallejo@cloud.com>
 <20240807134819.8987-6-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20240807134819.8987-6-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.08.2024 15:48, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -352,6 +352,7 @@ __efi64_mb2_start:
>          and     $~15,%rsp
>  
>          /* Save Multiboot2 magic on the stack. */
> +        shlq    $32, %rax

As indicated for the earlier patch: No insn suffixes please when they're
not actually needed to clarify operand size. (Or else at the very least
be consistent and have suffixes everywhere. Comment applies throughout
the patch.)

Additionally there's some trickery going on here which absolutely needs
commenting, at least lightly. Aiui ...

>          push    %rax
>  
>          /* Save EFI ImageHandle on the stack. */
> @@ -382,11 +383,24 @@ __efi64_mb2_start:
>          /* Just pop an item from the stack. */
>          pop     %rax
>  
> -        /* Restore Multiboot2 magic. */
> -        pop     %rax

... you eliminate this in favor of ...

> +        /* Prepare stack for relocation call */
> +        subq    $16, %rsp

... using the low half of that stack slot here for the last function
argument, then POPing %eax entirely elsewhere, in trampoline_efi_setup.

> +        lea     l2_bootmap(%rip), %ecx
> +        movl    %ecx, 16(%rsp)
> +        lea     l3_bootmap(%rip), %ecx
> +        movl    %ecx, 12(%rsp)
> +        lea     __base_relocs_end(%rip), %ecx
> +        movl    %ecx, 8(%rsp)
> +        lea     __base_relocs_start(%rip), %ecx
> +        movl    %ecx, 4(%rsp)
> +        lea     __image_base__(%rip),%rsi

Nit: Consistently blanks after commas please in new code.

> +        movl    %esi, (%rsp)

Since a 32-bit value suffices, why a 64-bit LEA above?

> +        movabsq $__XEN_VIRT_START, %rcx
> +        subq    %rsi, %rcx
> +        push    %rcx
>  
> -        /* Jump to trampoline_setup after switching CPU to x86_32 mode. */
> -        lea     trampoline_setup(%rip),%r15
> +        /* Jump to trampoline_efi_setup after switching CPU to x86_32 mode. */
> +        lea     trampoline_efi_setup(%rip),%r15
>  
>  x86_32_switch:
>          mov     %r15,%rdi

All of the changes here are benign to the existing MB2/EFI code path just
because __base_relocs_start[] is empty there, aiui. That could certainly
do with making explicit in the description. Initially I meant to indicate
that apparently you're breaking that path.

> --- a/xen/arch/x86/boot/reloc.c
> +++ b/xen/arch/x86/boot/reloc.c
> @@ -23,7 +23,9 @@ asm (
>      "    .text                         \n"
>      "    .globl _start                 \n"
>      "_start:                           \n"
> -    "    jmp  reloc                    \n"
> +    "    cmpb $0, %al                  \n"
> +    "    je   reloc                    \n"

While minor here, I think we should generally prefer TEST (and then JZ)
over CMP when checking for 0. I wonder though whether we really want to
go with this kind of multiplexing. A new reloc-pe.c may be a cleaner
approach. This may then (possibly later) also allow to (more easily)
exclude this code when linking xen-syms.

> @@ -375,6 +377,65 @@ void *__stdcall reloc(uint32_t magic, uint32_t in, uint32_t trampoline,
>      }
>  }
>  
> +struct pe_base_relocs {
> +    u32 rva;
> +    u32 size;
> +    u16 entries[];

uint<N>_t please in new code (but see also at the bottom).

> +};
> +
> +#define PE_BASE_RELOC_ABS      0
> +#define PE_BASE_RELOC_HIGHLOW  3
> +#define PE_BASE_RELOC_DIR64   10
> +
> +void __stdcall reloc_pe_back(long long delta,
> +                             uint32_t xen_phys_start,
> +                             const struct pe_base_relocs *__base_relocs_start,
> +                             const struct pe_base_relocs *__base_relocs_end,
> +                             char *l3_bootmap, char *l2_bootmap)

You only ever use the last two when cast to unsigned long. What's wrong
with declaring them as unsigned long right away? xen_phys_start may also
want to have unsigned long type.

> +{
> +    const struct pe_base_relocs *base_relocs;
> +
> +    for ( base_relocs = __base_relocs_start; base_relocs < __base_relocs_end; )
> +    {
> +        unsigned int i = 0, n;
> +
> +        n = (base_relocs->size - sizeof(*base_relocs)) /
> +            sizeof(*base_relocs->entries);
> +
> +        /*
> +         * Relevant l{2,3}_bootmap entries get initialized explicitly in
> +         * efi_arch_memory_setup(), so we must not apply relocations there.
> +         * l2_directmap's first slot, otoh, should be handled normally, as
> +         * efi_arch_memory_setup() won't touch it (xen_phys_start should
> +         * never be zero).
> +         */
> +        if ( xen_phys_start + base_relocs->rva == (unsigned long)l3_bootmap ||
> +             xen_phys_start + base_relocs->rva == (unsigned long)l2_bootmap )
> +            i = n;
> +
> +        for ( ; i < n; ++i )
> +        {
> +            unsigned long addr = xen_phys_start + base_relocs->rva +
> +                                 (base_relocs->entries[i] & 0xfff);
> +
> +            switch ( base_relocs->entries[i] >> 12 )
> +            {
> +            case PE_BASE_RELOC_ABS:
> +                break;
> +            case PE_BASE_RELOC_HIGHLOW:
> +                if ( delta )
> +                    *(u32 *)addr += delta;
> +                break;
> +            case PE_BASE_RELOC_DIR64:
> +                if ( delta )
> +                    *(u64 *)addr += delta;
> +                break;
> +            }

Except for the dropped default case (which imo needs to be there, just
that you can't use blexit() here), the body of the function looks like
a plain copy of efi_arch_relocate_image(). We want to avoid such
(source) duplication, and rather put the logic in e.g. a header
included by both parties.

Jan

