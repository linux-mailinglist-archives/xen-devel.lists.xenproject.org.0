Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8529D958800
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 15:33:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780434.1190050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgOyF-0002em-Tm; Tue, 20 Aug 2024 13:32:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780434.1190050; Tue, 20 Aug 2024 13:32:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgOyF-0002ca-RC; Tue, 20 Aug 2024 13:32:23 +0000
Received: by outflank-mailman (input) for mailman id 780434;
 Tue, 20 Aug 2024 13:32:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yfvp=PT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sgOyE-0002cU-Fc
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 13:32:22 +0000
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [2a00:1450:4864:20::230])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a0029009-5ef8-11ef-8776-851b0ebba9a2;
 Tue, 20 Aug 2024 15:32:20 +0200 (CEST)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2f16767830dso58531091fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 20 Aug 2024 06:32:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bebbe7f92dsm6728908a12.60.2024.08.20.06.32.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Aug 2024 06:32:18 -0700 (PDT)
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
X-Inumbo-ID: a0029009-5ef8-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724160740; x=1724765540; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0y76zkYnLJmw+MYeZNFktaU+23N9dfOL3NRluxSrdz4=;
        b=Uk5G+CN31sjDuZu46yOm39GcHr5Chmot0tkkKpuV35/IHrOyFEiIWJsH2AWcIoQ1JG
         M2PmDbYacjUMwT81kDtOtPV3vuaG2zMgjI/57Tm2/MG8y2P07wynSv9DloJFMfUf+ejv
         r8kQ+fi1EdVQ2wqGLpmRteRMAJJRmTtLylrC8PTNLO3KR8zKmXLMfCSSRRmBcpoIr/pw
         nKperTdeRtM9QSDD+y821hK/vxLW4aAUSPxuc1zcO4kC5v5hBKO/+cFSPKlLsWQwbTpF
         aHb1Plb4KqsZuJpcG+CiGVpBb9arauN0ts4uiLysIkEWcJZImaKbAACK2FL4xJWMe3YN
         Qn+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724160740; x=1724765540;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0y76zkYnLJmw+MYeZNFktaU+23N9dfOL3NRluxSrdz4=;
        b=GT28DQUHsWWbdud6ai9ItGB4nbEM1mhumbTjwKQJPQZB9uq/lddHfYwYo6JVuwRSP3
         9KnnirU5Ip07lLZx7S7ibKyTYpjDXdXmcknDyWMjUqDaRRgxdBFmq/DjDDgow759YBh8
         bMCqqUgMGzcQ/00v/AHp9G2wPZ9Tbh+2CDtbqJLCobn5wb2XzpI5x2mKPQvtE+O8/Nzv
         jWKuCUBmLcFan7KNSNoalUNAeX7Bm5EBVWVzHfUprTzbI8LP5/tugI9icLgkYVaEwBhY
         zTfmrbHr7SgqWQAApldsGsPx1uYTu9NuIeLC01MTGKTWPCo6x+sCevabpKvH8Md7Yp/P
         TvHw==
X-Forwarded-Encrypted: i=1; AJvYcCWwRQ4dRCyoCdFRKK4h4t+TUUjDjJyV9eVkDGdzaMZxjljQTp/DzjlsSHOogDwmNhkF1Fd8ROvsHUM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxoXkGlHl0HiWO3DRW8aVEuUGvXeyx+T308Vd9htN8UGYFWhZ0h
	z87LSWVRyeLyIrLT2tEuOtAuP2llrmJXWBy+t9E8M+kISDFAqOsNApYDL1pkTA==
X-Google-Smtp-Source: AGHT+IESaEYjHpCbYVetllFhLLBIgmFdi7HzzA0Cf5Wyz4UNZo7lEKlUr8h4IC6UWKrJp+Gi8XMbHA==
X-Received: by 2002:a2e:a990:0:b0:2ee:7a3a:9969 with SMTP id 38308e7fff4ca-2f3be57219cmr107152171fa.5.1724160739002;
        Tue, 20 Aug 2024 06:32:19 -0700 (PDT)
Message-ID: <d13903d5-d79e-4af2-9449-1a97aeaf03e2@suse.com>
Date: Tue, 20 Aug 2024 15:32:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] x86: Rollback relocation in case of EFI multiboot
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org
References: <20240814083428.3012-1-frediano.ziglio@cloud.com>
 <20240814083428.3012-6-frediano.ziglio@cloud.com>
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
In-Reply-To: <20240814083428.3012-6-frediano.ziglio@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.08.2024 10:34, Frediano Ziglio wrote:
> In case EFI not multiboot rolling back relocation is done in
> efi_arch_post_exit_boot, called by efi_start however this is
> not done in multiboot code path.
> Do it also for this path to make it work correctly.
> 
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
>  xen/arch/x86/boot/Makefile          |  2 +-
>  xen/arch/x86/boot/efi-reloc-image.c | 40 ++++++++++++++
>  xen/arch/x86/boot/efi-reloc-image.h | 85 +++++++++++++++++++++++++++++
>  xen/arch/x86/boot/head.S            | 44 ++++++++++++---
>  xen/arch/x86/efi/efi-boot.h         | 64 ++--------------------
>  5 files changed, 168 insertions(+), 67 deletions(-)
>  create mode 100644 xen/arch/x86/boot/efi-reloc-image.c
>  create mode 100644 xen/arch/x86/boot/efi-reloc-image.h

Would there be anything wrong with using just efi-reloc.[ch]? I'm sorry, but
I'm a little averse to long names when shorter ones are as unambiguous.

> --- /dev/null
> +++ b/xen/arch/x86/boot/efi-reloc-image.c
> @@ -0,0 +1,40 @@
> +/*
> + * efi-reloc-image.c
> + *
> + * 32-bit flat memory-map routines for relocating back PE executable.
> + * This is done with paging disabled to avoid permission issues.
> + *
> + * Copyright (c) 2024, Citrix Systems, Inc.
> + */

Just curious: Is "Citrix" still the right name to use in places like this one?

> +/*
> + * This entry point is entered from xen/arch/x86/boot/head.S with:
> + *   - 0x04(%esp) = __XEN_VIRT_START - xen_phys_start

This could to with adding "(two slots)" or "(64 bits)".

> + *   - 0x0c(%esp) = xen_phys_start
> + *   - 0x10(%esp) = __base_relocs_start
> + *   - 0x14(%esp) = __base_relocs_end
> + */
> +asm (
> +    "    .text                         \n"
> +    "    .globl _start                 \n"
> +    "_start:                           \n"
> +    "    jmp    reloc_pe_back          \n"
> +    );
> +
> +#include "defs.h"
> +
> +/* Do not patch page tables. */
> +#define in_page_tables(v) false

If you want what the comment says, this can't yield "false" for every
possible input. Didn't you even have page table related logic in v1?

> --- /dev/null
> +++ b/xen/arch/x86/boot/efi-reloc-image.h
> @@ -0,0 +1,85 @@
> +/*
> + * efi-reloc-image.h
> + *
> + * Code for relocating back PE executable.
> + * This code is common between 64 bit and 32 bit.
> + *
> + * Copyright (c) 2024, Citrix Systems, Inc.
> + */
> +
> +#if EFI_RELOC_IMAGE_EARLY != 0 && EFI_RELOC_IMAGE_EARLY != 1
> +#error EFI_RELOC_IMAGE_EARLY must be defined either 0 or 1
> +#endif

Depending on compiler type and version, EFI_RELOC_IMAGE_EARLY simply not
being defined may or may not raise a warning, but would otherwise satisfy
EFI_RELOC_IMAGE_EARLY == 0. I think you want to also guard against
un-defined-ness.

> +typedef struct pe_base_relocs {
> +    uint32_t rva;
> +    uint32_t size;
> +    uint16_t entries[];
> +} pe_base_relocs;
> +
> +#define PE_BASE_RELOC_ABS      0
> +#define PE_BASE_RELOC_HIGHLOW  3
> +#define PE_BASE_RELOC_DIR64   10
> +
> +#if EFI_RELOC_IMAGE_EARLY
> +bool __stdcall
> +#else
> +static bool
> +#endif
> +reloc_pe_back(long long delta,
> +              unsigned long xen_phys_start,
> +              const pe_base_relocs *__base_relocs_start,
> +              const pe_base_relocs *__base_relocs_end)
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
> +                {
> +                    *(uint32_t *)addr += delta;
> +                    if ( in_page_tables(addr) )
> +                        *(uint32_t *)addr += xen_phys_start;
> +                }
> +                break;
> +            case PE_BASE_RELOC_DIR64:
> +                if ( delta )
> +                {
> +                    *(uint64_t *)addr += delta;
> +                    if ( in_page_tables(addr) )
> +                        *(uint64_t *)addr += xen_phys_start;
> +                }
> +                break;
> +            default:
> +                return false;
> +            }

As you're moving this code, please put blank lines between case blocks.

> +        }
> +        base_relocs = (const void *)(base_relocs->entries + i + (i & 1));
> +    }
> +    return true;
> +}

Nit: Blank line please ahead of a function's main "return".

> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -332,7 +332,8 @@ __efi64_mb2_start:
>           */
>          and     $~15,%rsp
>  
> -        /* Save Multiboot2 magic on the stack. */
> +        /* Save Multiboot2 magic on the stack for a later 32bit call */
> +        shl     $32, %rax
>          push    %rax

I see you're now extending the comment here. However, ...

> @@ -363,11 +364,25 @@ __efi64_mb2_start:
>          /* Just pop an item from the stack. */
>          pop     %rax
>  
> -        /* Restore Multiboot2 magic. */

... this comment shouldn't be lost (wants to move down), and ...

> -        pop     %rax
> +        /*
> +         * Prepare stack for relocation call.
> +         * Note that we are in 64bit mode but we are going to call a
> +         * function in 32bit mode so the stack is not written with
> +         * push instructions.
> +         */
> +        sub     $16, %rsp
> +        lea     __base_relocs_end(%rip), %ecx
> +        mov     %ecx, 16(%rsp)

... the re-using of half a 64-bit slot here still isn't present in
commentary (in fact the comment is slightly wrong as is, because that
re-used half slot _is_ written by a PUSH, just higher up).

> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -36,69 +36,15 @@ extern const intpte_t __page_tables_start[], __page_tables_end[];
>  #define in_page_tables(v) ((intpte_t *)(v) >= __page_tables_start && \
>                             (intpte_t *)(v) < __page_tables_end)
>  
> -#define PE_BASE_RELOC_ABS      0
> -#define PE_BASE_RELOC_HIGHLOW  3
> -#define PE_BASE_RELOC_DIR64   10
> +#define EFI_RELOC_IMAGE_EARLY 0
> +#include "../boot/efi-reloc-image.h"
>  
> -extern const struct pe_base_relocs {
> -    u32 rva;
> -    u32 size;
> -    u16 entries[];
> -} __base_relocs_start[], __base_relocs_end[];
> +extern pe_base_relocs __base_relocs_start[], __base_relocs_end[];

You've lost the const.

>  static void __init efi_arch_relocate_image(unsigned long delta)
>  {
> -    const struct pe_base_relocs *base_relocs;
> -
> -    for ( base_relocs = __base_relocs_start; base_relocs < __base_relocs_end; )
> -    {
> -        unsigned int i = 0, n;
> -
> -        n = (base_relocs->size - sizeof(*base_relocs)) /
> -            sizeof(*base_relocs->entries);
> -
> -        /*
> -         * Relevant l{2,3}_bootmap entries get initialized explicitly in
> -         * efi_arch_memory_setup(), so we must not apply relocations there.
> -         * l2_directmap's first slot, otoh, should be handled normally, as
> -         * efi_arch_memory_setup() won't touch it (xen_phys_start should
> -         * never be zero).
> -         */
> -        if ( xen_phys_start + base_relocs->rva == (unsigned long)l3_bootmap ||
> -             xen_phys_start + base_relocs->rva == (unsigned long)l2_bootmap )
> -            i = n;

I can't spot the replacement for this code.

> -        for ( ; i < n; ++i )
> -        {
> -            unsigned long addr = xen_phys_start + base_relocs->rva +
> -                                 (base_relocs->entries[i] & 0xfff);
> -
> -            switch ( base_relocs->entries[i] >> 12 )
> -            {
> -            case PE_BASE_RELOC_ABS:
> -                break;
> -            case PE_BASE_RELOC_HIGHLOW:
> -                if ( delta )
> -                {
> -                    *(u32 *)addr += delta;
> -                    if ( in_page_tables(addr) )
> -                        *(u32 *)addr += xen_phys_start;
> -                }
> -                break;
> -            case PE_BASE_RELOC_DIR64:
> -                if ( delta )
> -                {
> -                    *(u64 *)addr += delta;
> -                    if ( in_page_tables(addr) )
> -                        *(u64 *)addr += xen_phys_start;
> -                }
> -                break;
> -            default:
> -                blexit(L"Unsupported relocation type");
> -            }
> -        }
> -        base_relocs = (const void *)(base_relocs->entries + i + (i & 1));
> -    }
> +    if (!reloc_pe_back(delta, xen_phys_start, __base_relocs_start, __base_relocs_end))

Nit: Style.

> +        blexit(L"Unsupported relocation type");
>  }
>  
>  extern const s32 __trampoline_rel_start[], __trampoline_rel_stop[];


