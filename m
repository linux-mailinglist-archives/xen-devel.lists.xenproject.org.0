Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C14926557
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2024 17:57:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753250.1161506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP2Ks-0003gR-PD; Wed, 03 Jul 2024 15:55:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753250.1161506; Wed, 03 Jul 2024 15:55:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sP2Ks-0003eE-MB; Wed, 03 Jul 2024 15:55:58 +0000
Received: by outflank-mailman (input) for mailman id 753250;
 Wed, 03 Jul 2024 15:55:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NzTd=OD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sP2Kr-0003e8-G5
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2024 15:55:57 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id baa99186-3954-11ef-8776-851b0ebba9a2;
 Wed, 03 Jul 2024 17:55:54 +0200 (CEST)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2ebeefb9a7fso62151891fa.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 08:55:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-72c6afb9042sm8389229a12.41.2024.07.03.08.55.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 08:55:52 -0700 (PDT)
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
X-Inumbo-ID: baa99186-3954-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720022154; x=1720626954; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9jRKi/7D5k0UycUtsttL79RUViaaP6QUxMZOrxjXXx8=;
        b=FEMRlDnxHaDBPtbvoaJOibO7D86sMgmrmK7gXeqGnmlhKpgP5iJ7uj6wMsDtIRGt/c
         b1yLCOZHV1iqCDVsEdhCG/jOP7F5G/wijnSxuxxcxFxCl4u7FXMNqLfvAUSl39t+Sct3
         5A7SRipGAfzse7T5EI4ufnID6kEHAoUTundYuRIC1kUqxzc0Xsu/nxFiN5BvaXhayUWX
         PPsoI5tlydBAYC3rt2JP9E+C20U/Cb4dSN9WnP0lyXk7Fw9LIZNly8si6mpyVqacjd/x
         iekaQRnaUGhpg9cyIoKU7w+hd5loL4aRO63AlR6Q+c5hHbqwtEjv/m8sI3iFBkX9nHo9
         GCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720022154; x=1720626954;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9jRKi/7D5k0UycUtsttL79RUViaaP6QUxMZOrxjXXx8=;
        b=hoCTjyRGgDZVhixeHiu72fnUmeRvXjSloHtlYxZnvItrvrO4gKVkI+oTudZdkBqToi
         zUN8jeEKvUNKmHGp54w1dxYZ8zUtaMrhhw9wIpkQFKjeX8Esv8fpHUzi/Tu2hqKCt7Zr
         0AaAKzXGrOwSerk5l4/8bwMsGhaHmCbkJod19wBjFkizeooNb+hsgxlOwLe6gyo8cwBK
         FRP+fCK842zHvS7VTnhdpCk+C4Q/rEaC3i7KVmm5pdkybOeaAofLDQXwEGcF+RGUl0P4
         26RzyNFv9M4+3utSK9bt4228bpgt39vcyX9Hy9aCgexK+8SlQZT8AJIbxkRwlMiBbsvO
         2TbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVT2tLbJNzulykWc3RFnvte+ujhmc9XfegF35weq4dsO+O54ZPEnqNcbYI9w3IiQh62HMjnZnMmhsv+SwmBpIDCTjNicmbBmv7oy7Vbjc=
X-Gm-Message-State: AOJu0YzAyQGGgk0+cWlvOVDwp8dA0Y1YFbgbnjZXZ0l2GQoq5wc2tmmT
	8h8C7kPRHVaFGujY1D67P2K2MP1nPxY9WM5jeYEsobdGv07vFaYbg7v6Gezx9Q==
X-Google-Smtp-Source: AGHT+IHw/U/NmqxumJFzHOhF2AIQCC74UKmma89mbyb1qi6sjsqH2CCoqrVkO1dRwL9Lub927GYlVA==
X-Received: by 2002:a2e:be95:0:b0:2eb:e634:fee6 with SMTP id 38308e7fff4ca-2ee5e39e57cmr93401381fa.18.1720022153700;
        Wed, 03 Jul 2024 08:55:53 -0700 (PDT)
Message-ID: <0481c78f-ccad-4c65-b104-6b787b79f1d8@suse.com>
Date: Wed, 3 Jul 2024 17:55:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/riscv: PE/COFF image header for RISC-V target
To: Milan Djokic <milandjokic1995@gmail.com>
Cc: milan.djokic@rt-rk.com, Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Nikola Jelic <nikola.jelic@rt-rk.com>,
 xen-devel@lists.xenproject.org, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <2bbb65fcda57f2609f0967f9050a91415059026c.1719942341.git.milan.djokic@rt-rk.com>
 <21a1bbe9308b72eac6d218235f5211c7a1c90454.1719964980.git.milan.djokic@rt-rk.com>
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
In-Reply-To: <21a1bbe9308b72eac6d218235f5211c7a1c90454.1719964980.git.milan.djokic@rt-rk.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.07.2024 02:04, Milan Djokic wrote:
> Added riscv image header to enable boot from second stage bootloaders (e.g. uboot. Image header defined in riscv-image-header.h)
> Additionally, RISC-V xen image is extended with PE/COFF headers, introducing EFI application format.
> PE/COFF header is optionally included (with CONFIG_RISCV_EFI) so
> both plain ELF and image with PE/COFF header can now be generated as build artifacts.
> Note that this patch represents initial EFI application format support (image
> contains EFI application header embeded into binary when CONFIG_RISCV_EFI
> is enabled). For full EFI application Xen support, boot/runtime services
> and system table handling are yet to be implemented.

So, first: Please Cc all applicable maintainers. It would probably be prudent
to also Cc Oleksii, who's doing most of the RISC-V work now (but Oleksii,
please correct me if you don't want to be Cc-ed).

With Oleksii in the audience, second: I tink I've seen that in binutils work
is being done to actually allow to create EFI applications "properly" for
RISC-V. Was it firmly determined that you/we do not want to go that route?

> --- a/xen/arch/riscv/Kconfig
> +++ b/xen/arch/riscv/Kconfig
> @@ -9,6 +9,16 @@ config ARCH_DEFCONFIG
>  	string
>  	default "arch/riscv/configs/tiny64_defconfig"
>  
> +config RISCV_EFI
> +	bool "UEFI boot service support"
> +	depends on RISCV_64 && RISCV_ISA_C
> +	help
> +	  This option provides support for boot services through
> +	  UEFI firmware. A UEFI stub is provided to allow Xen to
> +	  be booted as an EFI application. Currently, only EFI PE/COFF application
> +	  header is included into RISC-V image. Boot/Runtime services as part
> +	  of EFI application stub are yet to be implemented.

The first sentence in particular worries me. What it says is basically all
taken back by what follows. I think this help text wants reducing to a
minimum, andthen wants replacing once proper EFI support is in place.

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/riscv-image-header.h
> @@ -0,0 +1,57 @@
> +#ifndef _ASM_RISCV_IMAGE_H
> +#define _ASM_RISCV_IMAGE_H
> +
> +#define RISCV_IMAGE_MAGIC  "RISCV\0\0\0"
> +#define RISCV_IMAGE_MAGIC2 "RSC\x05"
> +
> +#define RISCV_IMAGE_FLAG_BE_SHIFT 0
> +
> +#define RISCV_IMAGE_FLAG_LE 0
> +#define RISCV_IMAGE_FLAG_BE 1
> +
> +#define __HEAD_FLAG_BE RISCV_IMAGE_FLAG_LE
> +
> +#define __HEAD_FLAG(field)                                                     \
> +    (__HEAD_FLAG_##field << RISCV_IMAGE_FLAG_##field##_SHIFT)

Nit: Generally we treat ## as a binary operator, too. Which means it also
wants to be surrounded by blanks.

> +#define __HEAD_FLAGS (__HEAD_FLAG(BE))

Nit: The outer pair of parentheses isn't needed here, is it?

> +#define RISCV_HEADER_VERSION_MAJOR 0
> +#define RISCV_HEADER_VERSION_MINOR 2
> +
> +#define RISCV_HEADER_VERSION                                                   \
> +    (RISCV_HEADER_VERSION_MAJOR << 16 | RISCV_HEADER_VERSION_MINOR)

Nit: Please parenthesize the << against the |.

> --- /dev/null
> +++ b/xen/arch/riscv/riscv64/efi-header.S
> @@ -0,0 +1,99 @@
> +#include <efi/pe.h>
> +#include <xen/sizes.h>
> +
> +        .macro __EFI_PE_HEADER
> +        .long PE_MAGIC
> +coff_header:
> +#ifdef CONFIG_RISCV_64
> +        .short  IMAGE_FILE_MACHINE_RISCV64              /* Machine */
> +#else
> +        .short  IMAGE_FILE_MACHINE_RISCV32              /* Machine */
> +#endif
> +        .short  section_count                           /* NumberOfSections */
> +        .long   0                                       /* TimeDateStamp */
> +        .long   0                                       /* PointerToSymbolTable */
> +        .long   0                                       /* NumberOfSymbols */
> +        .short  section_table - optional_header         /* SizeOfOptionalHeader */
> +        .short  IMAGE_FILE_DEBUG_STRIPPED | \
> +                IMAGE_FILE_EXECUTABLE_IMAGE | \
> +                IMAGE_FILE_LINE_NUMS_STRIPPED           /* Characteristics */
> +
> +optional_header:
> +#ifdef CONFIG_RISCV_64
> +        .short  PE_OPT_MAGIC_PE32PLUS                   /* PE32+ format */
> +#else
> +        .short  PE_OPT_MAGIC_PE32                       /* PE32 format */
> +#endif
> +        .byte   0x02                                    /* MajorLinkerVersion */
> +        .byte   0x14                                    /* MinorLinkerVersion */
> +        .long   _end - xen_start                        /* SizeOfCode */
> +        .long   0                                       /* SizeOfInitializedData */
> +        .long   0                                       /* SizeOfUninitializedData */
> +        .long   0                                       /* AddressOfEntryPoint */
> +        .long   xen_start - _start                      /* BaseOfCode */
> +#ifdef CONFIG_RISCV_32
> +        .long  _end - _start                            /* BaseOfData */
> +#endif

As requested before, the decision to represent all of .text/.data/.bss
as code (with no data at all) wants explaining in a (possibly brief)
comment.

> +extra_header_fields:
> +        .quad   0                                       /* ImageBase */
> +        .long   PECOFF_SECTION_ALIGNMENT                /* SectionAlignment */
> +        .long   PECOFF_FILE_ALIGNMENT                   /* FileAlignment */
> +        .short  0                                       /* MajorOperatingSystemVersion */
> +        .short  0                                       /* MinorOperatingSystemVersion */
> +        .short  LINUX_EFISTUB_MAJOR_VERSION             /* MajorImageVersion */
> +        .short  LINUX_EFISTUB_MINOR_VERSION             /* MinorImageVersion */
> +        .short  0                                       /* MajorSubsystemVersion */
> +        .short  0                                       /* MinorSubsystemVersion */
> +        .long   0                                       /* Win32VersionValue */
> +        .long   _end - _start                           /* SizeOfImage */
> +
> +        /* Everything before the xen image is considered part of the header */
> +        .long   xen_start - _start                      /* SizeOfHeaders */
> +        .long   0                                       /* CheckSum */
> +        .short  IMAGE_SUBSYSTEM_EFI_APPLICATION         /* Subsystem */
> +        .short  0                                       /* DllCharacteristics */
> +        .quad   0                                       /* SizeOfStackReserve */
> +        .quad   0                                       /* SizeOfStackCommit */
> +        .quad   0                                       /* SizeOfHeapReserve */
> +        .quad   0                                       /* SizeOfHeapCommit */
> +        .long   0                                       /* LoaderFlags */
> +        .long   (section_table - .) / 8                 /* NumberOfRvaAndSizes */
> +        /*
> +         * Data directories are not used in this case, therefore not defined to reduce header size.
> +         */
> +
> +        /* Section table */
> +section_table:
> +        /* Currently code/data sections are not used since EFI stub implementation is not yet finalized */
> +        .ascii  ".text\0\0\0"
> +        .long   0                                       /* VirtualSize */
> +        .long   0                                       /* VirtualAddress */
> +        .long   0                                       /* SizeOfRawData */
> +        .long   0                                       /* PointerToRawData */
> +        .long   0                                       /* PointerToRelocations */
> +        .long   0                                       /* PointerToLineNumbers */
> +        .short  0                                       /* NumberOfRelocations */
> +        .short  0                                       /* NumberOfLineNumbers */
> +        .long   IMAGE_SCN_CNT_CODE | \
> +                IMAGE_SCN_MEM_READ | \
> +                IMAGE_SCN_MEM_EXECUTE                   /* Characteristics */
> +
> +        .ascii  ".data\0\0\0"
> +        .long   0                                       /* VirtualSize */
> +        .long   0                                       /* VirtualAddress */
> +        .long   0                                       /* SizeOfRawData */
> +        .long   0                                       /* PointerToRawData */
> +        .long   0                                       /* PointerToRelocations */
> +        .long   0                                       /* PointerToLineNumbers */
> +        .short  0                                       /* NumberOfRelocations */
> +        .short  0                                       /* NumberOfLineNumbers */
> +        .long   IMAGE_SCN_CNT_INITIALIZED_DATA | \
> +                IMAGE_SCN_MEM_READ | \
> +                IMAGE_SCN_MEM_WRITE                    /* Characteristics */
> +
> +        .set    section_count, (. - section_table) / 40
> +
> +        .balign  0x1000
> +efi_header_end:
> +        .endm
> \ No newline at end of file

Please take care of this.

> --- a/xen/arch/riscv/riscv64/head.S
> +++ b/xen/arch/riscv/riscv64/head.S
> @@ -1,14 +1,54 @@
>  #include <asm/asm.h>
>  #include <asm/riscv_encoding.h>
> +#include <asm/riscv-image-header.h>
> +#ifdef CONFIG_RISCV_EFI
> +#include "efi-header.S"
> +#endif
>  
>          .section .text.header, "ax", %progbits
> -
>          /*

I see no reason for removing this blank line.

>           * OpenSBI pass to start():
>           *   a0 -> hart_id ( bootcpu_id )
> -         *   a1 -> dtb_base 
> +         *   a1 -> dtb_base
>           */
>  FUNC(start)
> +/* Image header expected by second stage bootloaders (format defined in asm/riscv-image-header.h) */

Nit: Overlong line (and not the only one).

> +#ifdef CONFIG_RISCV_EFI
> +        /*
> +         * This instruction decodes to "MZ" ASCII required by UEFI.
> +         */
> +        c.li s4,-13
> +        c.j xen_start
> +#else
> +        /* jump to start kernel */
> +        jal xen_start

JAL, not J? Why?

> +#endif
> +        .balign 8

This won't do what you want unless "start" itself is also suitably aligned.
It'll be as long as it's first in the section, but better make such explicit.

> +#ifdef CONFIG_RISCV_64
> +        /* Image load offset(2MB) from start of RAM */
> +        .quad 0x200000
> +#else
> +        /* Image load offset(4MB) from start of RAM */
> +        .quad 0x400000
> +#endif

What these constants derive from? I expect they aren't really "magic".

> +        .quad _end - _start              /* Effective Image size */
> +        .quad __HEAD_FLAGS
> +        .long RISCV_HEADER_VERSION

In the C struct this is a 64-bit field. Why .long here? Or perhaps the C
struct is wrong, actually also leaving unspecified padding there after
...

> +        .long 0                          /* reserved */

... this field then.

> +        .quad 0                          /* reserved */
> +        .ascii RISCV_IMAGE_MAGIC         /* Magic number (RISC-V specific; deprecated) */
> +        .balign 4

RISCV_IMAGE_MAGIC is already nul-padded to 8 bytes. I therefore find
the .balign here somewhat confusing.

> +        .ascii RISCV_IMAGE_MAGIC2        /* Magic number 2 (to match the ARM64 'magic' field pos) */
> +#ifdef CONFIG_RISCV_EFI
> +        .long pe_head_start - _start     /* reserved (PE COFF offset) */
> +pe_head_start:
> +
> +        __EFI_PE_HEADER

Using a macro for a single, simple purpose is somewhat unexpected.
Can't you simply

#include "efi-header.S"

here? That would also make it more straightforward to find the use /
purpose of that file.

> +#else
> +        .long 0                          /* 0 means no PE header. */
> +#endif
> +
> +xen_start:
>          /* Mask all interrupts */
>          csrw    CSR_SIE, zero
>  
> @@ -60,6 +100,7 @@ FUNC(start)
>          mv      a1, s1
>  
>          tail    start_xen
> +
>  END(start)
>  
>          .section .text, "ax", %progbits

What is this hunk about?

> --- a/xen/arch/riscv/xen.lds.S
> +++ b/xen/arch/riscv/xen.lds.S
> @@ -12,6 +12,9 @@ PHDRS
>  #endif
>  }
>  
> +PECOFF_SECTION_ALIGNMENT = 0x1000;
> +PECOFF_FILE_ALIGNMENT = 0x200;

What are these about? I see you use them in efi-header.S, but why do
they need supplying from the linker script?

> --- /dev/null
> +++ b/xen/include/efi/pe.h
> @@ -0,0 +1,458 @@
> +#ifndef __PE_H

This probably wants (needs?) to gain an SPDX line.

> +#define __PE_H
> +
> +/*
> + * Linux EFI stub v1.0 adds the following functionality:
> + * - Loading initrd from the LINUX_EFI_INITRD_MEDIA_GUID device path,
> + * - Loading/starting the kernel from firmware that targets a different
> + *   machine type, via the entrypoint exposed in the .compat PE/COFF section.
> + *
> + * The recommended way of loading and starting v1.0 or later kernels is to use
> + * the LoadImage() and StartImage() EFI boot services, and expose the initrd
> + * via the LINUX_EFI_INITRD_MEDIA_GUID device path.
> + *
> + * Versions older than v1.0 support initrd loading via the image load options
> + * (using initrd=, limited to the volume from which the kernel itself was
> + * loaded), or via arch specific means (bootparams, DT, etc).
> + *
> + * On x86, LoadImage() and StartImage() can be omitted if the EFI handover
> + * protocol is implemented, which can be inferred from the version,
> + * handover_offset and xloadflags fields in the bootparams structure.
> + */
> +#define LINUX_EFISTUB_MAJOR_VERSION 0x1
> +#define LINUX_EFISTUB_MINOR_VERSION 0x0
> +
> +#define MZ_MAGIC 0x5a4d /* "MZ" */
> +
> +#define PE_MAGIC              0x00004550 /* "PE\0\0" */
> +#define PE_OPT_MAGIC_PE32     0x010b
> +#define PE_OPT_MAGIC_PE32_ROM 0x0107
> +#define PE_OPT_MAGIC_PE32PLUS 0x020b
> +
> +/* machine type */
> +#define IMAGE_FILE_MACHINE_UNKNOWN   0x0000
> +#define IMAGE_FILE_MACHINE_AM33      0x01d3
> +#define IMAGE_FILE_MACHINE_AMD64     0x8664
> +#define IMAGE_FILE_MACHINE_ARM       0x01c0
> +#define IMAGE_FILE_MACHINE_ARMV7     0x01c4
> +#define IMAGE_FILE_MACHINE_ARM64     0xaa64
> +#define IMAGE_FILE_MACHINE_EBC       0x0ebc
> +#define IMAGE_FILE_MACHINE_I386      0x014c
> +#define IMAGE_FILE_MACHINE_IA64      0x0200
> +#define IMAGE_FILE_MACHINE_M32R      0x9041
> +#define IMAGE_FILE_MACHINE_MIPS16    0x0266
> +#define IMAGE_FILE_MACHINE_MIPSFPU   0x0366
> +#define IMAGE_FILE_MACHINE_MIPSFPU16 0x0466
> +#define IMAGE_FILE_MACHINE_POWERPC   0x01f0
> +#define IMAGE_FILE_MACHINE_POWERPCFP 0x01f1
> +#define IMAGE_FILE_MACHINE_R4000     0x0166
> +#define IMAGE_FILE_MACHINE_RISCV32   0x5032
> +#define IMAGE_FILE_MACHINE_RISCV64   0x5064
> +#define IMAGE_FILE_MACHINE_RISCV128  0x5128
> +#define IMAGE_FILE_MACHINE_SH3       0x01a2
> +#define IMAGE_FILE_MACHINE_SH3DSP    0x01a3
> +#define IMAGE_FILE_MACHINE_SH3E      0x01a4
> +#define IMAGE_FILE_MACHINE_SH4       0x01a6
> +#define IMAGE_FILE_MACHINE_SH5       0x01a8
> +#define IMAGE_FILE_MACHINE_THUMB     0x01c2
> +#define IMAGE_FILE_MACHINE_WCEMIPSV2 0x0169
> +
> +/* flags */
> +#define IMAGE_FILE_RELOCS_STRIPPED         0x0001
> +#define IMAGE_FILE_EXECUTABLE_IMAGE        0x0002
> +#define IMAGE_FILE_LINE_NUMS_STRIPPED      0x0004
> +#define IMAGE_FILE_LOCAL_SYMS_STRIPPED     0x0008
> +#define IMAGE_FILE_AGGRESSIVE_WS_TRIM      0x0010
> +#define IMAGE_FILE_LARGE_ADDRESS_AWARE     0x0020
> +#define IMAGE_FILE_16BIT_MACHINE           0x0040
> +#define IMAGE_FILE_BYTES_REVERSED_LO       0x0080
> +#define IMAGE_FILE_32BIT_MACHINE           0x0100
> +#define IMAGE_FILE_DEBUG_STRIPPED          0x0200
> +#define IMAGE_FILE_REMOVABLE_RUN_FROM_SWAP 0x0400
> +#define IMAGE_FILE_NET_RUN_FROM_SWAP       0x0800
> +#define IMAGE_FILE_SYSTEM                  0x1000
> +#define IMAGE_FILE_DLL                     0x2000
> +#define IMAGE_FILE_UP_SYSTEM_ONLY          0x4000
> +#define IMAGE_FILE_BYTES_REVERSED_HI       0x8000
> +
> +#define IMAGE_FILE_OPT_ROM_MAGIC       0x107
> +#define IMAGE_FILE_OPT_PE32_MAGIC      0x10b
> +#define IMAGE_FILE_OPT_PE32_PLUS_MAGIC 0x20b
> +
> +#define IMAGE_SUBSYSTEM_UNKNOWN                 0
> +#define IMAGE_SUBSYSTEM_NATIVE                  1
> +#define IMAGE_SUBSYSTEM_WINDOWS_GUI             2
> +#define IMAGE_SUBSYSTEM_WINDOWS_CUI             3
> +#define IMAGE_SUBSYSTEM_POSIX_CUI               7
> +#define IMAGE_SUBSYSTEM_WINDOWS_CE_GUI          9
> +#define IMAGE_SUBSYSTEM_EFI_APPLICATION         10
> +#define IMAGE_SUBSYSTEM_EFI_BOOT_SERVICE_DRIVER 11
> +#define IMAGE_SUBSYSTEM_EFI_RUNTIME_DRIVER      12
> +#define IMAGE_SUBSYSTEM_EFI_ROM_IMAGE           13
> +#define IMAGE_SUBSYSTEM_XBOX                    14
> +
> +#define IMAGE_DLL_CHARACTERISTICS_DYNAMIC_BASE         0x0040
> +#define IMAGE_DLL_CHARACTERISTICS_FORCE_INTEGRITY      0x0080
> +#define IMAGE_DLL_CHARACTERISTICS_NX_COMPAT            0x0100
> +#define IMAGE_DLLCHARACTERISTICS_NO_ISOLATION          0x0200
> +#define IMAGE_DLLCHARACTERISTICS_NO_SEH                0x0400
> +#define IMAGE_DLLCHARACTERISTICS_NO_BIND               0x0800
> +#define IMAGE_DLLCHARACTERISTICS_WDM_DRIVER            0x2000
> +#define IMAGE_DLLCHARACTERISTICS_TERMINAL_SERVER_AWARE 0x8000
> +
> +/* they actually defined 0x00000000 as well, but I think we'll skip that one. */
> +#define IMAGE_SCN_RESERVED_0             0x00000001
> +#define IMAGE_SCN_RESERVED_1             0x00000002
> +#define IMAGE_SCN_RESERVED_2             0x00000004
> +#define IMAGE_SCN_TYPE_NO_PAD            0x00000008 /* don't pad - obsolete */
> +#define IMAGE_SCN_RESERVED_3             0x00000010
> +#define IMAGE_SCN_CNT_CODE               0x00000020 /* .text */
> +#define IMAGE_SCN_CNT_INITIALIZED_DATA   0x00000040 /* .data */
> +#define IMAGE_SCN_CNT_UNINITIALIZED_DATA 0x00000080 /* .bss */
> +#define IMAGE_SCN_LNK_OTHER              0x00000100 /* reserved */
> +#define IMAGE_SCN_LNK_INFO               0x00000200 /* .drectve comments */
> +#define IMAGE_SCN_RESERVED_4             0x00000400
> +#define IMAGE_SCN_LNK_REMOVE             0x00000800 /* .o only - scn to be rm'd*/
> +#define IMAGE_SCN_LNK_COMDAT             0x00001000 /* .o only - COMDAT data */
> +#define IMAGE_SCN_RESERVED_5             0x00002000 /* spec omits this */
> +#define IMAGE_SCN_RESERVED_6             0x00004000 /* spec omits this */
> +#define IMAGE_SCN_GPREL                  0x00008000 /* global pointer referenced data */
> +/* spec lists 0x20000 twice, I suspect they meant 0x10000 for one of them */
> +#define IMAGE_SCN_MEM_PURGEABLE 0x00010000 /* reserved for "future" use */
> +#define IMAGE_SCN_16BIT         0x00020000 /* reserved for "future" use */
> +#define IMAGE_SCN_LOCKED        0x00040000 /* reserved for "future" use */
> +#define IMAGE_SCN_PRELOAD       0x00080000 /* reserved for "future" use */
> +/* and here they just stuck a 1-byte integer in the middle of a bitfield */
> +#define IMAGE_SCN_ALIGN_1BYTES    0x00100000 /* it does what it says on the box */
> +#define IMAGE_SCN_ALIGN_2BYTES    0x00200000
> +#define IMAGE_SCN_ALIGN_4BYTES    0x00300000
> +#define IMAGE_SCN_ALIGN_8BYTES    0x00400000
> +#define IMAGE_SCN_ALIGN_16BYTES   0x00500000
> +#define IMAGE_SCN_ALIGN_32BYTES   0x00600000
> +#define IMAGE_SCN_ALIGN_64BYTES   0x00700000
> +#define IMAGE_SCN_ALIGN_128BYTES  0x00800000
> +#define IMAGE_SCN_ALIGN_256BYTES  0x00900000
> +#define IMAGE_SCN_ALIGN_512BYTES  0x00a00000
> +#define IMAGE_SCN_ALIGN_1024BYTES 0x00b00000
> +#define IMAGE_SCN_ALIGN_2048BYTES 0x00c00000
> +#define IMAGE_SCN_ALIGN_4096BYTES 0x00d00000
> +#define IMAGE_SCN_ALIGN_8192BYTES 0x00e00000
> +#define IMAGE_SCN_LNK_NRELOC_OVFL 0x01000000 /* extended relocations */
> +#define IMAGE_SCN_MEM_DISCARDABLE 0x02000000 /* scn can be discarded */
> +#define IMAGE_SCN_MEM_NOT_CACHED  0x04000000 /* cannot be cached */
> +#define IMAGE_SCN_MEM_NOT_PAGED   0x08000000 /* not pageable */
> +#define IMAGE_SCN_MEM_SHARED      0x10000000 /* can be shared */
> +#define IMAGE_SCN_MEM_EXECUTE     0x20000000 /* can be executed as code */
> +#define IMAGE_SCN_MEM_READ        0x40000000 /* readable */
> +#define IMAGE_SCN_MEM_WRITE       0x80000000 /* writeable */
> +
> +#define IMAGE_DEBUG_TYPE_CODEVIEW 2
> +
> +#ifndef __ASSEMBLY__
> +
> +struct mz_hdr {
> +    uint16_t magic;              /* MZ_MAGIC */
> +    uint16_t lbsize;             /* size of last used block */
> +    uint16_t blocks;             /* pages in file, 0x3 */
> +    uint16_t relocs;             /* relocations */
> +    uint16_t hdrsize;            /* header size in "paragraphs" */
> +    uint16_t min_extra_pps;      /* .bss */
> +    uint16_t max_extra_pps;      /* runtime limit for the arena size */
> +    uint16_t ss;                 /* relative stack segment */
> +    uint16_t sp;                 /* initial %sp register */
> +    uint16_t checksum;           /* word checksum */
> +    uint16_t ip;                 /* initial %ip register */
> +    uint16_t cs;                 /* initial %cs relative to load segment */
> +    uint16_t reloc_table_offset; /* offset of the first relocation */
> +    uint16_t overlay_num;        /* overlay number.  set to 0. */
> +    uint16_t reserved0[4];       /* reserved */
> +    uint16_t oem_id;             /* oem identifier */
> +    uint16_t oem_info;           /* oem specific */
> +    uint16_t reserved1[10];      /* reserved */
> +    uint32_t peaddr;             /* address of pe header */
> +    char     message[];          /* message to print */
> +};

We already have an instance of this struct in common/efi/pe.c. I think
it wouldn't be very desirable to have two (different) instances.

> +struct mz_reloc {
> +    uint16_t offset;
> +    uint16_t segment;
> +};

We aren't going to need this anywhere, are we?

> +struct pe_hdr {
> +    uint32_t magic;        /* PE magic */
> +    uint16_t machine;      /* machine type */
> +    uint16_t sections;     /* number of sections */
> +    uint32_t timestamp;    /* time_t */
> +    uint32_t symbol_table; /* symbol table offset */
> +    uint32_t symbols;      /* number of symbols */
> +    uint16_t opt_hdr_size; /* size of optional header */
> +    uint16_t flags;        /* flags */
> +};

And again another (different) instance of this and further struct-s
already exists. Same for the section header further down.

> +/* the fact that pe32 isn't padded where pe32+ is 64-bit means union won't
> + * work right.  vomit. */

Noticing here in particular, but being an issue elsewhere as well:
Unless this file is to be a verbatim copy taken from somewhere (in
which case it should probably be introduced in a separate commit
with an Origin: tag), comments want to adhere of ./CODING_STYLE.

> +struct pe32_opt_hdr {
> +    /* "standard" header */
> +    uint16_t magic;       /* file type */
> +    uint8_t  ld_major;    /* linker major version */
> +    uint8_t  ld_minor;    /* linker minor version */
> +    uint32_t text_size;   /* size of text section(s) */
> +    uint32_t data_size;   /* size of data section(s) */
> +    uint32_t bss_size;    /* size of bss section(s) */
> +    uint32_t entry_point; /* file offset of entry point */
> +    uint32_t code_base;   /* relative code addr in ram */
> +    uint32_t data_base;   /* relative data addr in ram */
> +    /* "windows" header */
> +    uint32_t image_base;     /* preferred load address */
> +    uint32_t section_align;  /* alignment in bytes */
> +    uint32_t file_align;     /* file alignment in bytes */
> +    uint16_t os_major;       /* major OS version */
> +    uint16_t os_minor;       /* minor OS version */
> +    uint16_t image_major;    /* major image version */
> +    uint16_t image_minor;    /* minor image version */
> +    uint16_t subsys_major;   /* major subsystem version */
> +    uint16_t subsys_minor;   /* minor subsystem version */
> +    uint32_t win32_version;  /* reserved, must be 0 */
> +    uint32_t image_size;     /* image size */
> +    uint32_t header_size;    /* header size rounded up to file_align */
> +    uint32_t csum;           /* checksum */
> +    uint16_t subsys;         /* subsystem */
> +    uint16_t dll_flags;      /* executable characteristics */
> +    uint32_t stack_size_req; /* amt of stack requested */
> +    uint32_t stack_size;     /* amt of stack required */
> +    uint32_t heap_size_req;  /* amt of heap requested */
> +    uint32_t heap_size;      /* amt of heap required */
> +    uint32_t loader_flags;   /* reserved, must be 0 */
> +    uint32_t data_dirs;      /* number of data dir entries */
> +};
> +
> +struct pe32plus_opt_hdr {
> +    uint16_t magic;       /* file type */
> +    uint8_t  ld_major;    /* linker major version */
> +    uint8_t  ld_minor;    /* linker minor version */
> +    uint32_t text_size;   /* size of text section(s) */
> +    uint32_t data_size;   /* size of data section(s) */
> +    uint32_t bss_size;    /* size of bss section(s) */
> +    uint32_t entry_point; /* file offset of entry point */
> +    uint32_t code_base;   /* relative code addr in ram */
> +    /* "windows" header */
> +    uint64_t image_base;     /* preferred load address */
> +    uint32_t section_align;  /* alignment in bytes */
> +    uint32_t file_align;     /* file alignment in bytes */
> +    uint16_t os_major;       /* major OS version */
> +    uint16_t os_minor;       /* minor OS version */
> +    uint16_t image_major;    /* major image version */
> +    uint16_t image_minor;    /* minor image version */
> +    uint16_t subsys_major;   /* major subsystem version */
> +    uint16_t subsys_minor;   /* minor subsystem version */
> +    uint32_t win32_version;  /* reserved, must be 0 */
> +    uint32_t image_size;     /* image size */
> +    uint32_t header_size;    /* header size rounded up to file_align */
> +    uint32_t csum;           /* checksum */
> +    uint16_t subsys;         /* subsystem */
> +    uint16_t dll_flags;      /* executable characteristics */
> +    uint64_t stack_size_req; /* amt of stack requested */
> +    uint64_t stack_size;     /* amt of stack required */
> +    uint64_t heap_size_req;  /* amt of heap requested */
> +    uint64_t heap_size;      /* amt of heap required */
> +    uint32_t loader_flags;   /* reserved, must be 0 */
> +    uint32_t data_dirs;      /* number of data dir entries */
> +};
> +
> +struct data_dirent {
> +    uint32_t virtual_address; /* relative to load address */
> +    uint32_t size;
> +};

Will we need this and ...

> +struct data_directory {
> +    struct data_dirent exports;          /* .edata */
> +    struct data_dirent imports;          /* .idata */
> +    struct data_dirent resources;        /* .rsrc */
> +    struct data_dirent exceptions;       /* .pdata */
> +    struct data_dirent certs;            /* certs */
> +    struct data_dirent base_relocations; /* .reloc */
> +    struct data_dirent debug;            /* .debug */
> +    struct data_dirent arch;             /* reservered */
> +    struct data_dirent global_ptr;       /* global pointer reg. Size=0 */
> +    struct data_dirent tls;              /* .tls */
> +    struct data_dirent load_config;      /* load configuration structure */
> +    struct data_dirent bound_imports;    /* no idea */
> +    struct data_dirent import_addrs;     /* import address table */
> +    struct data_dirent delay_imports;    /* delay-load import table */
> +    struct data_dirent clr_runtime_hdr;  /* .cor (object only) */
> +    struct data_dirent reserved;
> +};

... this?

> +struct section_header {
> +    char     name[8];         /* name or string tbl offset */
> +    uint32_t virtual_size;    /* size of loaded section in ram */
> +    uint32_t virtual_address; /* relative virtual address */
> +    uint32_t raw_data_size;   /* size of the section */
> +    uint32_t data_addr;       /* file pointer to first page of sec */
> +    uint32_t relocs;          /* file pointer to relocation entries */
> +    uint32_t line_numbers;    /* line numbers */
> +    uint16_t num_relocs;      /* number of relocations */
> +    uint16_t num_lin_numbers; /* COFF line count. */
> +    uint32_t flags;
> +};
> +
> +enum x64_coff_reloc_type {
> +    IMAGE_REL_AMD64_ABSOLUTE = 0,
> +    IMAGE_REL_AMD64_ADDR64,
> +    IMAGE_REL_AMD64_ADDR32,
> +    IMAGE_REL_AMD64_ADDR32N,
> +    IMAGE_REL_AMD64_REL32,
> +    IMAGE_REL_AMD64_REL32_1,
> +    IMAGE_REL_AMD64_REL32_2,
> +    IMAGE_REL_AMD64_REL32_3,
> +    IMAGE_REL_AMD64_REL32_4,
> +    IMAGE_REL_AMD64_REL32_5,
> +    IMAGE_REL_AMD64_SECTION,
> +    IMAGE_REL_AMD64_SECREL,
> +    IMAGE_REL_AMD64_SECREL7,
> +    IMAGE_REL_AMD64_TOKEN,
> +    IMAGE_REL_AMD64_SREL32,
> +    IMAGE_REL_AMD64_PAIR,
> +    IMAGE_REL_AMD64_SSPAN32,
> +};
> +
> +enum arm_coff_reloc_type {
> +    IMAGE_REL_ARM_ABSOLUTE,
> +    IMAGE_REL_ARM_ADDR32,
> +    IMAGE_REL_ARM_ADDR32N,
> +    IMAGE_REL_ARM_BRANCH2,
> +    IMAGE_REL_ARM_BRANCH1,
> +    IMAGE_REL_ARM_SECTION,
> +    IMAGE_REL_ARM_SECREL,
> +};
> +
> +enum sh_coff_reloc_type {
> +    IMAGE_REL_SH3_ABSOLUTE,
> +    IMAGE_REL_SH3_DIRECT16,
> +    IMAGE_REL_SH3_DIRECT32,
> +    IMAGE_REL_SH3_DIRECT8,
> +    IMAGE_REL_SH3_DIRECT8_WORD,
> +    IMAGE_REL_SH3_DIRECT8_LONG,
> +    IMAGE_REL_SH3_DIRECT4,
> +    IMAGE_REL_SH3_DIRECT4_WORD,
> +    IMAGE_REL_SH3_DIRECT4_LONG,
> +    IMAGE_REL_SH3_PCREL8_WORD,
> +    IMAGE_REL_SH3_PCREL8_LONG,
> +    IMAGE_REL_SH3_PCREL12_WORD,
> +    IMAGE_REL_SH3_STARTOF_SECTION,
> +    IMAGE_REL_SH3_SIZEOF_SECTION,
> +    IMAGE_REL_SH3_SECTION,
> +    IMAGE_REL_SH3_SECREL,
> +    IMAGE_REL_SH3_DIRECT32_NB,
> +    IMAGE_REL_SH3_GPREL4_LONG,
> +    IMAGE_REL_SH3_TOKEN,
> +    IMAGE_REL_SHM_PCRELPT,
> +    IMAGE_REL_SHM_REFLO,
> +    IMAGE_REL_SHM_REFHALF,
> +    IMAGE_REL_SHM_RELLO,
> +    IMAGE_REL_SHM_RELHALF,
> +    IMAGE_REL_SHM_PAIR,
> +    IMAGE_REL_SHM_NOMODE,
> +};
> +
> +enum ppc_coff_reloc_type {
> +    IMAGE_REL_PPC_ABSOLUTE,
> +    IMAGE_REL_PPC_ADDR64,
> +    IMAGE_REL_PPC_ADDR32,
> +    IMAGE_REL_PPC_ADDR24,
> +    IMAGE_REL_PPC_ADDR16,
> +    IMAGE_REL_PPC_ADDR14,
> +    IMAGE_REL_PPC_REL24,
> +    IMAGE_REL_PPC_REL14,
> +    IMAGE_REL_PPC_ADDR32N,
> +    IMAGE_REL_PPC_SECREL,
> +    IMAGE_REL_PPC_SECTION,
> +    IMAGE_REL_PPC_SECREL16,
> +    IMAGE_REL_PPC_REFHI,
> +    IMAGE_REL_PPC_REFLO,
> +    IMAGE_REL_PPC_PAIR,
> +    IMAGE_REL_PPC_SECRELLO,
> +    IMAGE_REL_PPC_GPREL,
> +    IMAGE_REL_PPC_TOKEN,
> +};
> +
> +enum x86_coff_reloc_type {
> +    IMAGE_REL_I386_ABSOLUTE,
> +    IMAGE_REL_I386_DIR16,
> +    IMAGE_REL_I386_REL16,
> +    IMAGE_REL_I386_DIR32,
> +    IMAGE_REL_I386_DIR32NB,
> +    IMAGE_REL_I386_SEG12,
> +    IMAGE_REL_I386_SECTION,
> +    IMAGE_REL_I386_SECREL,
> +    IMAGE_REL_I386_TOKEN,
> +    IMAGE_REL_I386_SECREL7,
> +    IMAGE_REL_I386_REL32,
> +};
> +
> +enum ia64_coff_reloc_type {
> +    IMAGE_REL_IA64_ABSOLUTE,
> +    IMAGE_REL_IA64_IMM14,
> +    IMAGE_REL_IA64_IMM22,
> +    IMAGE_REL_IA64_IMM64,
> +    IMAGE_REL_IA64_DIR32,
> +    IMAGE_REL_IA64_DIR64,
> +    IMAGE_REL_IA64_PCREL21B,
> +    IMAGE_REL_IA64_PCREL21M,
> +    IMAGE_REL_IA64_PCREL21F,
> +    IMAGE_REL_IA64_GPREL22,
> +    IMAGE_REL_IA64_LTOFF22,
> +    IMAGE_REL_IA64_SECTION,
> +    IMAGE_REL_IA64_SECREL22,
> +    IMAGE_REL_IA64_SECREL64I,
> +    IMAGE_REL_IA64_SECREL32,
> +    IMAGE_REL_IA64_DIR32NB,
> +    IMAGE_REL_IA64_SREL14,
> +    IMAGE_REL_IA64_SREL22,
> +    IMAGE_REL_IA64_SREL32,
> +    IMAGE_REL_IA64_UREL32,
> +    IMAGE_REL_IA64_PCREL60X,
> +    IMAGE_REL_IA64_PCREL60B,
> +    IMAGE_REL_IA64_PCREL60F,
> +    IMAGE_REL_IA64_PCREL60I,
> +    IMAGE_REL_IA64_PCREL60M,
> +    IMAGE_REL_IA64_IMMGPREL6,
> +    IMAGE_REL_IA64_TOKEN,
> +    IMAGE_REL_IA64_GPREL32,
> +    IMAGE_REL_IA64_ADDEND,
> +};

All sorts of relocation types, but none for RISC-V? Are we going to need
any of this?

> +struct coff_reloc {
> +    uint32_t virtual_address;
> +    uint32_t symbol_table_index;
> +
> +    union {
> +        enum x64_coff_reloc_type  x64_type;
> +        enum arm_coff_reloc_type  arm_type;
> +        enum sh_coff_reloc_type   sh_type;
> +        enum ppc_coff_reloc_type  ppc_type;
> +        enum x86_coff_reloc_type  x86_type;
> +        enum ia64_coff_reloc_type ia64_type;
> +        uint16_t                  data;
> +    };
> +};
> +
> +/*
> + * Definitions for the contents of the certs data block
> + */
> +#define WIN_CERT_TYPE_PKCS_SIGNED_DATA 0x0002
> +#define WIN_CERT_TYPE_EFI_OKCS115      0x0EF0
> +#define WIN_CERT_TYPE_EFI_GUID         0x0EF1
> +
> +#define WIN_CERT_REVISION_1_0 0x0100
> +#define WIN_CERT_REVISION_2_0 0x0200
> +
> +struct win_certificate {
> +    uint32_t length;
> +    uint16_t revision;
> +    uint16_t cert_type;
> +};

Or any of this?

Jan

