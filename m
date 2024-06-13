Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BB490730A
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2024 15:00:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739965.1146959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHk3W-0004aL-Rt; Thu, 13 Jun 2024 12:59:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739965.1146959; Thu, 13 Jun 2024 12:59:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHk3W-0004YU-Oa; Thu, 13 Jun 2024 12:59:54 +0000
Received: by outflank-mailman (input) for mailman id 739965;
 Thu, 13 Jun 2024 12:59:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sHk3U-0004YO-PX
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2024 12:59:52 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d192ebf7-2984-11ef-b4bb-af5377834399;
 Thu, 13 Jun 2024 14:59:50 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a6ef8e62935so136072466b.3
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jun 2024 05:59:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f427a5sm69333066b.180.2024.06.13.05.59.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jun 2024 05:59:49 -0700 (PDT)
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
X-Inumbo-ID: d192ebf7-2984-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718283589; x=1718888389; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FSr56EEEylLogCWY43+qhZuZ5O2+BF64BoIdv2hiHDs=;
        b=cq8C2km0P7+MYH60QV8pSg+iUO4TivAkkRPKLCjwXpEgG6fVrM4afhQcX2n6q/tVPK
         TYwCqfAfP9o5Ew4J5ZfBz4azf2LN/lRdXknKW8QSOTeotFcrL2bxozCXwlYtk2A2yqnS
         Uckzvb8fM73sfpAdRFWEDYp4BtDsHaVd3z4tzw/P4ooT7DPYY/7iuXJobheQesHLMMIy
         rOfkpw8bFi7DwbZMFrhggo/EXrOHCSMkBlmip7up9MYjHyYA7rLzlfyBiu12PGlQoDE4
         4oCW2fB3b3DJpPCvoQyUf/eLJyo2xRY61m2VNiu4kae2te231A4KEDBjPPR5zD+YX8Vc
         UfiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718283589; x=1718888389;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FSr56EEEylLogCWY43+qhZuZ5O2+BF64BoIdv2hiHDs=;
        b=ia2r0nWO0tYrIZdSWAsooYyrNe2S4D6+QEF9J7B+0fGzypc7fIenz+R1tQEaWVv8lg
         CqUQbsKAIUDy1LTYvITB7I0wfs0F9C9Uiap9qyngsieyZkbBvJBbgOzGBQ0fsxvyAIHN
         8djOvHlvXOao2Wr2CmrtJ2W5VM2rZdEV9WGLOMUeHm6OYl82AR/uxSP6uEBWdncsvC2N
         9ne/HEPn4RbcpsMER4crXWC8aBqyZ96WFBVr6VVJm4o9y72blLDAZb+X6S4zwClTcs8n
         yuYgWVcMhyw2Cp/zRP6F1Ps1TBfZ8Z8F14KCMlEFsSvU9jcK8zm/NfGoBMfB1lBkwzTC
         lwkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYB6LLBc9Hf0vuRTLrXRwZgjWqTrNa/QDAdB+bgIWHMuOvL2tOeOvMmsZYzBkpR2ysQk51y56zntBouH4cwC/M+xwah9zPy3DPkKbeeeg=
X-Gm-Message-State: AOJu0YzDy/fCwGkkOvIJM5IMmwin77Sv87h3xQZFCu6yV3eBPwxGz3na
	MMLKsUfs1jMAcimFrwZhsCgenAjUDyzF/OhdNimJOSv8mrUQbOMspXD0FLQuWw==
X-Google-Smtp-Source: AGHT+IFjr9ScWq1dPebIOQ22jfP440qluXFBC3Uu0sjHC9u3yoKdb32x/gNXNlbtTpRf85YdJCPkFQ==
X-Received: by 2002:a17:906:1791:b0:a6f:4c32:3fb6 with SMTP id a640c23a62f3a-a6f4c32430bmr289865466b.45.1718283589499;
        Thu, 13 Jun 2024 05:59:49 -0700 (PDT)
Message-ID: <8112bee8-efdc-4db9-b0d4-58b160b4e923@suse.com>
Date: Thu, 13 Jun 2024 14:59:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/riscv: PE/COFF image header for RISC-V target
To: milandjokic1995@gmail.com
Cc: milan.djokic@rt-rk.com, Nikola Jelic <nikola.jelic@rt-rk.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <87b5e458498bbff2e54ac011a50ff1f9555c3613.1717354932.git.milan.djokic@rt-rk.com>
 <0e10ee9c215269b577321ba44f5d038a5eb299a7.1718193326.git.milan.djokic@rt-rk.com>
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
In-Reply-To: <0e10ee9c215269b577321ba44f5d038a5eb299a7.1718193326.git.milan.djokic@rt-rk.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.06.2024 14:15, milandjokic1995@gmail.com wrote:
> From: Nikola Jelic <nikola.jelic@rt-rk.com>
> 
> Extended RISC-V xen image with PE/COFF headers,
> in order to support xen boot from popular bootloaders like U-boot.
> Image header is optionally included (with CONFIG_RISCV_EFI) so
> both plain ELF and image with PE/COFF header can now be generated as build artifacts.
> Note that this patch also represents initial EFI application format support (image
> contains EFI application header embeded into binary when CONFIG_RISCV_EFI
> is enabled). For full EFI application Xen support, boot/runtime services
> and system table handling are yet to be implemented.
> 
> Tested on both QEMU and StarFive VisionFive 2 with OpenSBI->U-Boot->xen->dom0 boot chain.
> 
> Signed-off-by: Nikola Jelic <nikola.jelic@rt-rk.com>

This isn't you, is it? Your S-o-b is going to be needed, too.

> --- a/xen/arch/riscv/Kconfig
> +++ b/xen/arch/riscv/Kconfig
> @@ -9,6 +9,15 @@ config ARCH_DEFCONFIG
>  	string
>  	default "arch/riscv/configs/tiny64_defconfig"
>  
> +config RISCV_EFI
> +	bool "UEFI boot service support"
> +	depends on RISCV_64
> +	default n

Nit: This line can be omitted (and if I'm not mistaken we generally do omit
such).

> +	help
> +	  This option provides support for boot services through
> +	  UEFI firmware. A UEFI stub is provided to allow Xen to
> +	  be booted as an EFI application.

I don't think my v1 comment on this was addressed.

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/pe.h
> @@ -0,0 +1,148 @@
> +#ifndef _ASM_RISCV_PE_H
> +#define _ASM_RISCV_PE_H
> +
> +#define LINUX_EFISTUB_MAJOR_VERSION     0x1
> +#define LINUX_EFISTUB_MINOR_VERSION     0x0
> +
> +#define MZ_MAGIC                    0x5a4d          /* "MZ" */
> +
> +#define PE_MAGIC                    0x00004550      /* "PE\0\0" */
> +#define PE_OPT_MAGIC_PE32           0x010b
> +#define PE_OPT_MAGIC_PE32PLUS       0x020b
> +
> +/* machine type */
> +#define IMAGE_FILE_MACHINE_RISCV32  0x5032
> +#define IMAGE_FILE_MACHINE_RISCV64  0x5064

Apart from this, hardly anything in this header is RISC-V specific.
Please consider moving to xen/include/xen/.

> +/* flags */
> +#define IMAGE_FILE_EXECUTABLE_IMAGE 0x0002
> +#define IMAGE_FILE_LINE_NUMS_STRIPPED 0x0004
> +#define IMAGE_FILE_DEBUG_STRIPPED   0x0200
> +#define IMAGE_SUBSYSTEM_EFI_APPLICATION 10
> +
> +#define IMAGE_SCN_CNT_CODE          0x00000020      /* .text */
> +#define IMAGE_SCN_CNT_INITIALIZED_DATA 0x00000040   /* .data */
> +#define IMAGE_SCN_MEM_EXECUTE       0x20000000
> +#define IMAGE_SCN_MEM_READ          0x40000000      /* readable */
> +#define IMAGE_SCN_MEM_WRITE         0x80000000      /* writeable */
> +
> +#ifndef __ASSEMBLY__
> +
> +struct mz_hdr {
> +    uint16_t magic;                  /* MZ_MAGIC */
> +    uint16_t lbsize;                 /* size of last used block */
> +    uint16_t blocks;                 /* pages in file, 0x3 */
> +    uint16_t relocs;                 /* relocations */
> +    uint16_t hdrsize;                /* header size in "paragraphs" */
> +    uint16_t min_extra_pps;          /* .bss */
> +    uint16_t max_extra_pps;          /* runtime limit for the arena size */
> +    uint16_t ss;                     /* relative stack segment */
> +    uint16_t sp;                     /* initial %sp register */
> +    uint16_t checksum;               /* word checksum */
> +    uint16_t ip;                     /* initial %ip register */
> +    uint16_t cs;                     /* initial %cs relative to load segment */
> +    uint16_t reloc_table_offset;     /* offset of the first relocation */
> +    uint16_t overlay_num;
> +    uint16_t reserved0[4];
> +    uint16_t oem_id;
> +    uint16_t oem_info;
> +    uint16_t reserved1[10];
> +    uint32_t peaddr;                 /* address of pe header */
> +    char     message[];              /* message to print */
> +};
> +
> +struct pe_hdr {
> +    uint32_t magic;                  /* PE magic */
> +    uint16_t machine;                /* machine type */
> +    uint16_t sections;               /* number of sections */
> +    uint32_t timestamp;
> +    uint32_t symbol_table;           /* symbol table offset */
> +    uint32_t symbols;                /* number of symbols */
> +    uint16_t opt_hdr_size;           /* size of optional header */
> +    uint16_t flags;                  /* flags */
> +};
> +
> +struct pe32_opt_hdr {
> +    /* "standard" header */
> +    uint16_t magic;                  /* file type */
> +    uint8_t  ld_major;               /* linker major version */
> +    uint8_t  ld_minor;               /* linker minor version */
> +    uint32_t text_size;
> +    uint32_t data_size;
> +    uint32_t bss_size;
> +    uint32_t entry_point;            /* file offset of entry point */
> +    uint32_t code_base;              /* relative code addr in ram */
> +    uint32_t data_base;              /* relative data addr in ram */
> +    /* "extra" header fields */
> +    uint32_t image_base;             /* preferred load address */
> +    uint32_t section_align;          /* alignment in bytes */
> +    uint32_t file_align;             /* file alignment in bytes */
> +    uint16_t os_major;
> +    uint16_t os_minor;
> +    uint16_t image_major;
> +    uint16_t image_minor;
> +    uint16_t subsys_major;
> +    uint16_t subsys_minor;
> +    uint32_t win32_version;          /* reserved, must be 0 */
> +    uint32_t image_size;
> +    uint32_t header_size;
> +    uint32_t csum;
> +    uint16_t subsys;
> +    uint16_t dll_flags;
> +    uint32_t stack_size_req;         /* amt of stack requested */
> +    uint32_t stack_size;             /* amt of stack required */
> +    uint32_t heap_size_req;          /* amt of heap requested */
> +    uint32_t heap_size;              /* amt of heap required */
> +    uint32_t loader_flags;           /* reserved, must be 0 */
> +    uint32_t data_dirs;              /* number of data dir entries */
> +};
> +
> +struct pe32plus_opt_hdr {
> +    uint16_t magic;                  /* file type */
> +    uint8_t  ld_major;               /* linker major version */
> +    uint8_t  ld_minor;               /* linker minor version */
> +    uint32_t text_size;
> +    uint32_t data_size;
> +    uint32_t bss_size;
> +    uint32_t entry_point;            /* file offset of entry point */
> +    uint32_t code_base;              /* relative code addr in ram */
> +    /* "extra" header fields */
> +    uint64_t image_base;             /* preferred load address */
> +    uint32_t section_align;          /* alignment in bytes */
> +    uint32_t file_align;             /* file alignment in bytes */
> +    uint16_t os_major;
> +    uint16_t os_minor;
> +    uint16_t image_major;
> +    uint16_t image_minor;
> +    uint16_t subsys_major;
> +    uint16_t subsys_minor;
> +    uint32_t win32_version;          /* reserved, must be 0 */
> +    uint32_t image_size;
> +    uint32_t header_size;
> +    uint32_t csum;
> +    uint16_t subsys;
> +    uint16_t dll_flags;
> +    uint64_t stack_size_req;         /* amt of stack requested */
> +    uint64_t stack_size;             /* amt of stack required */
> +    uint64_t heap_size_req;          /* amt of heap requested */
> +    uint64_t heap_size;              /* amt of heap required */
> +    uint32_t loader_flags;           /* reserved, must be 0 */
> +    uint32_t data_dirs;              /* number of data dir entries */
> +};
> +
> +struct section_header {
> +    char     name[8];                /* name or "/12\0" string tbl offset */

Why 12?

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/riscv_image_header.h

Is this file taken from somewhere else, kind of making it desirable to keep
its name in sync with the original? Otherwise: We prefer dashes over underscores
in new files' names.

> @@ -0,0 +1,54 @@
> +#ifndef _ASM_RISCV_IMAGE_H
> +#define _ASM_RISCV_IMAGE_H
> +
> +#define RISCV_IMAGE_MAGIC "RISCV\0\0\0"
> +#define RISCV_IMAGE_MAGIC2 "RSC\x05"
> +
> +#define RISCV_IMAGE_FLAG_BE_SHIFT 0
> +
> +#define RISCV_IMAGE_FLAG_LE 0
> +#define RISCV_IMAGE_FLAG_BE 1
> +
> +#define __HEAD_FLAG_BE RISCV_IMAGE_FLAG_LE
> +
> +#define __HEAD_FLAG(field) (__HEAD_FLAG_##field << RISCV_IMAGE_FLAG_##field##_SHIFT)
> +
> +#define __HEAD_FLAGS (__HEAD_FLAG(BE))
> +
> +#define RISCV_HEADER_VERSION_MAJOR 0
> +#define RISCV_HEADER_VERSION_MINOR 2
> +
> +#define RISCV_HEADER_VERSION (RISCV_HEADER_VERSION_MAJOR << 16 | \
> +                              RISCV_HEADER_VERSION_MINOR)
> +
> +#ifndef __ASSEMBLY__
> +/*
> + * struct riscv_image_header - riscv xen image header

You saying "xen": Is there anything Xen-specific in this struct?

> + * @code0:              Executable code
> + * @code1:              Executable code
> + * @text_offset:        Image load offset
> + * @image_size:         Effective Image size
> + * @reserved:           reserved
> + * @reserved:           reserved
> + * @reserved:           reserved
> + * @magic:              Magic number
> + * @reserved:           reserved
> + * @reserved:           reserved (will be used for PE COFF offset)
> + */
> +
> +struct riscv_image_header
> +{
> +    uint32_t code0;
> +    uint32_t code1;
> +    uint64_t text_offset;
> +    uint64_t image_size;
> +    uint64_t res1;
> +    uint64_t res2;
> +    uint64_t res3;
> +    uint64_t magic;
> +    uint32_t res4;
> +    uint32_t res5;
> +};
> +#endif /* __ASSEMBLY__ */
> +#endif /* _ASM_RISCV_IMAGE_H */
> --- a/xen/arch/riscv/riscv64/head.S
> +++ b/xen/arch/riscv/riscv64/head.S
> @@ -1,14 +1,150 @@
>  #include <asm/asm.h>
>  #include <asm/riscv_encoding.h>
> +#include <asm/riscv_image_header.h>
> +#ifdef CONFIG_RISCV_EFI
> +#include <asm/pe.h>
> +#endif
>  
>          .section .text.header, "ax", %progbits
>  
>          /*
>           * OpenSBI pass to start():
>           *   a0 -> hart_id ( bootcpu_id )
> -         *   a1 -> dtb_base 
> +         *   a1 -> dtb_base
>           */
>  FUNC(start)
> +
> +efi_head:

Why is this ...

> +#ifdef CONFIG_RISCV_EFI

... ahead of this?

> +        /*
> +         * This instruction decodes to "MZ" ASCII required by UEFI.
> +         */
> +        c.li s4,-13

IOW RISCV_EFI ought to be (made) dependent upon RISCV_ISA_C?

> +        j xen_start

Doesn't this then need to be c.j, to be sure it fits in 16 bits (and
raise an assembler error if not)?

> +#else
> +        /* jump to start kernel */
> +        j xen_start
> +        /* reserved */
> +        .word 0

What struct field does this correspond to? Or if not a struct field,
why is this needed?

Also I can't help the impression that the resulting layout will be
different depending on whether RISCV_ISA_C is enabled, as the "j"
may translate to a 16-bit or 32-bit insn.

I wonder anyway what use everything from here to ...

> +#endif
> +        .balign 8
> +#ifdef CONFIG_RISCV_64
> +        /* Image load offset(2MB) from start of RAM */
> +        .dword 0x200000
> +#else
> +        /* Image load offset(4MB) from start of RAM */
> +        .dword 0x400000
> +#endif
> +        /* Effective size of xen image */
> +        .dword _end - _start
> +        .dword __HEAD_FLAGS
> +        .word RISCV_HEADER_VERSION
> +        .word 0
> +        .dword 0
> +        .ascii RISCV_IMAGE_MAGIC
> +        .balign 4
> +        .ascii RISCV_IMAGE_MAGIC2
> +#ifndef CONFIG_RISCV_EFI
> +        .word 0

... here is when RISCV_EFI=n. You add data which wasn't needed so far,
and for which it also isn't explained why it would suddenly be needed.

I also can't bring several of the fields above in sync with the
struct riscv_image_header definition in the header. Please can you
annotate each field with a comment naming the corresponding C struct
field (like you do further down, at least in a way)?

> +#else
> +        .word pe_head_start - efi_head
> +pe_head_start:
> +        .long	PE_MAGIC
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
> +        .long   xen_start - efi_head                    /* BaseOfCode */
> +
> +extra_header_fields:
> +        .quad   0                                       /* ImageBase */

This is quad only for PE32+, iirc. In PE32 it's two separate 32-bit
fields instead. The overall result may be tolerable (a data RVA of 0
can't be quite right, but we may be able to get away with that), but
it will at least want commenting on.

Any anyway - further up in the RISC-V header struct you use .word and
.dword. Why .long and .quad here? That's at least somewhat confusing.

> +        .long   PECOFF_SECTION_ALIGNMENT                /* SectionAlignment */
> +        .long   PECOFF_FILE_ALIGNMENT                   /* FileAlignment */
> +        .short  0                                       /* MajorOperatingSystemVersion */
> +        .short  0                                       /* MinorOperatingSystemVersion */
> +        .short  LINUX_EFISTUB_MAJOR_VERSION             /* MajorImageVersion */
> +        .short  LINUX_EFISTUB_MINOR_VERSION             /* MinorImageVersion */
> +        .short  0                                       /* MajorSubsystemVersion */
> +        .short  0                                       /* MinorSubsystemVersion */
> +        .long   0                                       /* Win32VersionValue */
> +        .long   _end - efi_head                         /* SizeOfImage */
> +
> +        /* Everything before the xen image is considered part of the header */
> +        .long   xen_start - efi_head                    /* SizeOfHeaders */
> +        .long   0                                       /* CheckSum */
> +        .short  IMAGE_SUBSYSTEM_EFI_APPLICATION         /* Subsystem */
> +        .short  0                                       /* DllCharacteristics */
> +        .quad   0                                       /* SizeOfStackReserve */
> +        .quad   0                                       /* SizeOfStackCommit */
> +        .quad   0                                       /* SizeOfHeapReserve */
> +        .quad   0                                       /* SizeOfHeapCommit */

All of these are again 32 bits only in PE32, if I'm not mistaken.

> +        .long   0                                       /* LoaderFlags */
> +        .long   (section_table - .) / 8                 /* NumberOfRvaAndSizes */
> +        .quad   0                                       /* ExportTable */
> +        .quad   0                                       /* ImportTable */
> +        .quad   0                                       /* ResourceTable */
> +        .quad   0                                       /* ExceptionTable */
> +        .quad   0                                       /* CertificationTable */
> +        .quad   0                                       /* BaseRelocationTable */

Would you mind clarifying on what basis this set of 6 entries was
chosen?

> +/* Section table */
> +section_table:
> +        .ascii  ".text\0\0\0"
> +        .long   0
> +        .long   0
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
> +        .long   _end - xen_start                        /* VirtualSize */
> +        .long   xen_start - efi_head                    /* VirtualAddress */
> +        .long   __init_end_efi - xen_start              /* SizeOfRawData */
> +        .long   xen_start - efi_head                    /* PointerToRawData */
> +        .long   0                                       /* PointerToRelocations */
> +        .long   0                                       /* PointerToLineNumbers */
> +        .short  0                                       /* NumberOfRelocations */
> +        .short  0                                       /* NumberOfLineNumbers */
> +        .long   IMAGE_SCN_CNT_INITIALIZED_DATA | \
> +                IMAGE_SCN_MEM_READ | \
> +                IMAGE_SCN_MEM_WRITE                    /* Characteristics */

IOW no code and the entire image expressed as data. Interesting.
No matter whether that has a reason or is completely arbitrary, I
think it, too, wants commenting on.

> +        .set    section_count, (. - section_table) / 40
> +
> +        .balign  0x1000
> +#endif/* CONFIG_RISCV_EFI */
> +
> +FUNC(xen_start)
>          /* Mask all interrupts */
>          csrw    CSR_SIE, zero
>  
> @@ -60,6 +196,9 @@ FUNC(start)
>          mv      a1, s1
>  
>          tail    start_xen
> +
> +END(xen_start)
> +
>  END(start)

I don't think you addressed my function nesting comment here either.

> --- a/xen/arch/riscv/xen.lds.S
> +++ b/xen/arch/riscv/xen.lds.S
> @@ -12,6 +12,9 @@ PHDRS
>  #endif
>  }
>  
> +PECOFF_SECTION_ALIGNMENT = 0x1000;
> +PECOFF_FILE_ALIGNMENT = 0x200;
> +
>  SECTIONS
>  {
>      . = XEN_VIRT_START;
> @@ -144,7 +147,7 @@ SECTIONS
>      .got.plt : {
>          *(.got.plt)
>      } : text
> -
> +    __init_end_efi = .;

Why does the blank line disappear? And why is ...

>      . = ALIGN(POINTER_ALIGN);
>      __init_end = .;

... __init_end not good enough? (I think I can guess the answer, but
then I further think the name of the symbol is misleading. )

> @@ -165,6 +168,7 @@ SECTIONS
>          . = ALIGN(POINTER_ALIGN);
>          __bss_end = .;
>      } :text
> +
>      _end = . ;

Interestingly an unrelated blank line suddenly appears here.

Jan

