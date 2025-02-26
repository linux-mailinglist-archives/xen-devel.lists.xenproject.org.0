Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCA9A45F78
	for <lists+xen-devel@lfdr.de>; Wed, 26 Feb 2025 13:39:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.896493.1305225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnGhE-0007OV-Tc; Wed, 26 Feb 2025 12:39:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 896493.1305225; Wed, 26 Feb 2025 12:39:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnGhE-0007Lq-Qw; Wed, 26 Feb 2025 12:39:28 +0000
Received: by outflank-mailman (input) for mailman id 896493;
 Wed, 26 Feb 2025 12:39:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J4Ti=VR=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tnGhC-0007Lk-To
 for xen-devel@lists.xenproject.org; Wed, 26 Feb 2025 12:39:26 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5a11dad-f43e-11ef-9897-31a8f345e629;
 Wed, 26 Feb 2025 13:39:24 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4399deda38cso41867475e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Feb 2025 04:39:24 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba532ba6sm20172515e9.12.2025.02.26.04.39.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Feb 2025 04:39:22 -0800 (PST)
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
X-Inumbo-ID: b5a11dad-f43e-11ef-9897-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740573564; x=1741178364; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cEdPhd7lEZoE7mHGRPmQrAslTWH7xzqvFVQ6ANdkICw=;
        b=fzfHAWM5dEdy6xs7f4G/SrDsgySbQ+4BFFCFYAzVBa8daztRp2iUfk+X7x3W1lMNBm
         9iWUnZ085y1pfJRbSI9M3VMWGueuKWqZNYuzhWK1BmXGkF19p4LRENpiDF7ZbIjY3wFh
         waZwaGq0SfGCwfpSQXLziuVo1QUSWExyObkCrWWxWdWbN8Sl3QaxGnPmu2oHpFkWr6N9
         nF9N5EB/agsE4tYqjPMpg9VUkj0grclO+1ioC83BEEMwLNYIpCaSoJGQRS3j3QFACPu5
         BTlSLmrkqgx5KHFqnr2hbqHDyNYfEjmgvwFxlDweZ/OURRterXBnFSf4DXyLRvRmudYG
         Mtqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740573564; x=1741178364;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cEdPhd7lEZoE7mHGRPmQrAslTWH7xzqvFVQ6ANdkICw=;
        b=eUejob1Z2umQBxJO1iVfv8nVZ5SThaeO+cRC3Kz1nWao1nLQXvMiPpjOZ+YElwu269
         aOc8CZFXpS4Nj3F7L1q/7/Zxp2Nb2v8MJIECEs64www1qEucKdJjUWt8xkCj38V6gxJx
         iMtRi533aGrbD+bT90lMRC1+IQT7DcN7/BrAxurFkBkSECu2XD2pKdvRjMHesf6DcGNg
         XmJjjReXijjLVt0iObntO0Xq/EDx/OL/sJbQzg7rES9KYOlqewl2xni91C1oUpRkx5Ws
         SyJMSoYowew7oXdFzDP2JboRMasJQL36/GSiH7LUNPNURervWYgtAC9NkcnH58rNj6SB
         lTgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWK7W5Bvn5ImDW2gC75z9elm3GGa4jOd/HRWYUg78R1f8aTBMPV0eNYXM+A0G62rmB0CSnMgsJ0cbE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwkgXlBSgd9gKEerBO2sgzCn3pW/I3kjhbeUSQ+dFD47mM34+xi
	G6pOlEmW6IUioD7ULukXxqVoM0GG6WQgURkabnaBVwq9l0jw07pFmSaS2vNiWV0kfvMPBWUBnTg
	=
X-Gm-Gg: ASbGnctFU/cNFDkEv4YTVqvqRNZ2uP7qXt8+BBr+/c5xhO39IBZzwmoxSIA6yo/Mxhd
	LfH6s3xH9XHSQCGGDCd0E4OUB3mHQkKMGJK7HnXVzZHP1tZQS1oDHZymhmOMp4dYT6vidzzVh7o
	mBx0kMp7zRyDLy8631U9xl9QnBBmbU40GWJ1MvV1lVjvGPCbP7NDzAsroaaq4r14vOoSCpR9hJM
	OrUlzRt+cTZ5TUNg/o+3HEM+J4fc2dyzLgBA1k8t9ofarqd3YOQbKUJGnBjMIdMmZoBpeu4Hl1S
	oYJY5Ncfx4BSlok2V0JJUXNLopuFZ5AbWO4GLnp1kgLssVNWif6x+NVe+NQLZUvdTR1dcNR4aZL
	rjOcj6J2msc4=
X-Google-Smtp-Source: AGHT+IG+w64I9j+89Y021K2ye2X0tvCAyPUsRODEHaBysBGJ28gnwM6k1bDKA9ULM0vOryiGfcLI9w==
X-Received: by 2002:a05:600c:1914:b0:439:98ef:5d6 with SMTP id 5b1f17b1804b1-43ab0f6de5bmr55925085e9.22.1740573562399;
        Wed, 26 Feb 2025 04:39:22 -0800 (PST)
Message-ID: <9524c92f-cc5c-480a-935c-f3b51618c03e@suse.com>
Date: Wed, 26 Feb 2025 13:39:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] x86/IDT: Generate bsp_idt[] at build time
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250224160509.1117847-1-andrew.cooper3@citrix.com>
 <20250224160509.1117847-7-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250224160509.1117847-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.02.2025 17:05, Andrew Cooper wrote:
> --- /dev/null
> +++ b/xen/arch/x86/include/asm/gen-idt.h
> @@ -0,0 +1,121 @@
> +/*
> + * Generator for IDT entries.
> + *
> + * Caller to provide GEN(vector, symbol, dpl, autogen) macro
> + *
> + * Symbols are 'entry_0xYY' if there is no better name available.  Regular
> + * handlers set autogen=1, while manual (autogen=0) require the symbol to be
> + * implemented somewhere else.
> + */

Doesn't this need something for Eclair to spot the deliberate absence of a
header guard?

> +#define DPL0 0
> +#define DPL1 1
> +#define DPL3 3
> +
> +#define manual 0
> +#define autogen 1
> +
> +#define GEN16(i) \
> +    GEN(0x ## i ## 0, entry_0x ## i ## 0, DPL0, autogen) \
> +    GEN(0x ## i ## 1, entry_0x ## i ## 1, DPL0, autogen) \
> +    GEN(0x ## i ## 2, entry_0x ## i ## 2, DPL0, autogen) \
> +    GEN(0x ## i ## 3, entry_0x ## i ## 3, DPL0, autogen) \
> +    GEN(0x ## i ## 4, entry_0x ## i ## 4, DPL0, autogen) \
> +    GEN(0x ## i ## 5, entry_0x ## i ## 5, DPL0, autogen) \
> +    GEN(0x ## i ## 6, entry_0x ## i ## 6, DPL0, autogen) \
> +    GEN(0x ## i ## 7, entry_0x ## i ## 7, DPL0, autogen) \
> +    GEN(0x ## i ## 8, entry_0x ## i ## 8, DPL0, autogen) \
> +    GEN(0x ## i ## 9, entry_0x ## i ## 9, DPL0, autogen) \
> +    GEN(0x ## i ## a, entry_0x ## i ## a, DPL0, autogen) \
> +    GEN(0x ## i ## b, entry_0x ## i ## b, DPL0, autogen) \
> +    GEN(0x ## i ## c, entry_0x ## i ## c, DPL0, autogen) \
> +    GEN(0x ## i ## d, entry_0x ## i ## d, DPL0, autogen) \
> +    GEN(0x ## i ## e, entry_0x ## i ## e, DPL0, autogen) \
> +    GEN(0x ## i ## f, entry_0x ## i ## f, DPL0, autogen)
> +
> +
> +GEN(0x00, entry_DE,         DPL0, manual)
> +GEN(0x01, entry_DB,         DPL0, manual)
> +GEN(0x02, entry_NMI,        DPL0, manual)
> +GEN(0x03, entry_BP,         DPL3, manual)
> +GEN(0x04, entry_OF,         DPL3, manual)

Would this better be

#ifdef CONFIG_PV32
GEN(0x04, entry_OF,         DPL3, manual)
#else
GEN(0x04, entry_0x04,       DPL0, autogen)
#endif

? (Not necessarily in this patch, but in principle.)

> --- /dev/null
> +++ b/xen/arch/x86/include/asm/gen-idt.lds.h
> @@ -0,0 +1,27 @@
> +/*
> + * Linker file fragment to help format the IDT correctly
> + *
> + * The IDT, having grown compatibly since the 16 bit days, has the entrypoint
> + * address field split into 3.  x86 ELF lacks the @lo/@hi/etc relocation forms
> + * commonly found in other architectures for accessing a part of a resolved
> + * symbol address.
> + *
> + * However, the linker can perform the necessary calculations and provide them
> + * under new symbol names.  We use this to generate the low and next 16 bits
> + * of the address for each handler.
> + *
> + * The upper 32 bits are always a constant as Xen's .text/data/rodata sits in
> + * a single aligned 1G range, so do not need calculating in this manner.
> + */
> +#ifndef X86_IDT_GEN_LDS_H
> +#define X86_IDT_GEN_LDS_H
> +
> +#define GEN(vec, sym, dpl, auto)                                        \
> +    PROVIDE_HIDDEN(IDT_ ## sym ## _ADDR1 = ABSOLUTE(((sym) & 0xffff))); \
> +    PROVIDE_HIDDEN(IDT_ ## sym ## _ADDR2 = ABSOLUTE(((sym >> 16) & 0xffff)));

Not sure if Eclair gets to see this at all, but maybe better parenthesize
sym also in the latter instance?

As to the final semicolon - ideally this would be on the use sites of GEN(),
for things to look more C-ish. Yet I won't insist, as gen-idt.h ends up
looking sufficiently uniform for this to not be a major concern.

> --- a/xen/arch/x86/x86_64/entry.S
> +++ b/xen/arch/x86/x86_64/entry.S
> @@ -1229,6 +1229,82 @@ FUNC(trap_nop, 0)
>          iretq
>  END(trap_nop)
>  
> +/*
> + * Automatically generated entrypoints, and IDT
> + */
> +
> +        .pushsection .data.page_aligned, "aw", @progbits
> +DATA(bsp_idt, PAGE_SIZE)
> +        .popsection
> +
> +/*
> + * Write an IDT Entry.  The linker provides us new _ADDR1/2 symbols calculated
> + * from \sym.
> + */
> +.macro write_idte sym, dpl
> +        .pushsection .data.page_aligned, "aw", @progbits
> +        .word IDT_\sym\()_ADDR1
> +        .word __HYPERVISOR_CS
> +        .word 0x8e00 | (\dpl << 13) /* Present, DPL, Interrupt Gate */
> +        .word IDT_\sym\()_ADDR2

Just to mention it: I've come across a number of issues with the not-really-
standard relocation types needed to express the linker-generated-symbol
references here. For the purpose here I think we're okay.

> +        .long __XEN_VIRT_START >> 32
> +        .long 0
> +        .popsection
> +.endm
> +
> +/*
> + * Write an automatically generated stub.  Vectors in the exception range keep
> + * the stack properly aligned by judging whether the CPU pushed an error code
> + * or not.
> + *
> + * Alignment is forced to 16 because that's the size of the interrupt stub
> + * with CET active.

Yet only because we still don't put INT3 after the JMPs to guard against
SLS. (I keep carrying an ugly patch doing so.)

> + */
> +.macro gen_entry vec, sym
> +
> +FUNC(\sym, 16)
> +        ENDBR64
> +
> +        .if \vec < 0x20 /* Exception. */
> +
> +            test  $8, %spl       /* 64bit exception frames are 16 byte aligned, but the word */
> +            jz    1f             /* size is 8 bytes.  Check whether the processor gave us an */
> +            pushq $0             /* error code, and insert an empty one if not.              */
> +1:          movb  $\vec, EFRAME_entry_vector(%rsp)
> +            jmp   handle_exception
> +
> +        .else /* Interrupt. */
> +
> +            pushq $0
> +            movb  $\vec, EFRAME_entry_vector(%rsp)
> +            jmp   common_interrupt
> +
> +        .endif
> +END(\sym)
> +.endm
> +
> +/*
> + * Generator.  Write an entrypoint if necessary, and record an IDT entry.
> + */
> +.macro gen vec, sym, dpl, auto
> +
> +        .if \auto
> +            gen_entry \vec, \sym
> +        .endif
> +
> +        write_idte \sym, \dpl
> +.endm
> +#define GEN(v, s, d, a) gen vec=v, sym=s, dpl=d auto=a;
> +#include <asm/gen-idt.h>
> +#undef GEN
> +
> +        .pushsection .data.page_aligned, "aw", @progbits
> +END(bsp_idt)
> +        .if . - bsp_idt != PAGE_SIZE
> +            .error "Bad bsp_idt size, should be PAGE_SIZE"
> +        .endif
> +        .popsection

Again something certainly not for this patch, and probably also not for
this series: In principle, with the BSP IDT fully generated at build time,
it ought to be possible to move to .rodata.page_aligned.

Jan

