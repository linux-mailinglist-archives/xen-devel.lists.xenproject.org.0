Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF97A6BC0A
	for <lists+xen-devel@lfdr.de>; Fri, 21 Mar 2025 14:52:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.924018.1327372 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvcn2-00079E-H9; Fri, 21 Mar 2025 13:52:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 924018.1327372; Fri, 21 Mar 2025 13:52:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvcn2-00077l-Dq; Fri, 21 Mar 2025 13:52:00 +0000
Received: by outflank-mailman (input) for mailman id 924018;
 Fri, 21 Mar 2025 13:51:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z6G0=WI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tvcn0-00077a-GL
 for xen-devel@lists.xenproject.org; Fri, 21 Mar 2025 13:51:58 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7634917-065b-11f0-9ea1-5ba50f476ded;
 Fri, 21 Mar 2025 14:51:57 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-43d0c18e84eso9614935e9.3
 for <xen-devel@lists.xenproject.org>; Fri, 21 Mar 2025 06:51:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4fdbd348sm27340395e9.39.2025.03.21.06.51.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Mar 2025 06:51:55 -0700 (PDT)
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
X-Inumbo-ID: a7634917-065b-11f0-9ea1-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742565116; x=1743169916; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qv0VQ+NUrVd0gQgaN8Z4ekYOSShVij+HdMBj/Qw1Kz0=;
        b=XjRpNiukUqZsV+Q2yiGN3Z1ViqjDQ2hAv32gwE934C6hO2AWoiw1zDYo0mmPURA2AZ
         oz7iCxMB54MuyNBtsiTDavpazYMzH+m1i+Yj/YqJDE93X09PaD0jjK5In84EbuzMkj6z
         XFXNEo4sbvmyoiiXfZksExcUWJOUMkmfL4I0gBH4Js92SDNrJkY7EUFR09vbMXXnaGaz
         x/3YRwyW6xck/32NKQzyvTSZihtTYkP8Ris8aj3mwY0pX3zJKZgpdiFYTwnPgq69Lu3Y
         gpKPwzk/SMypOTlTaZJudtnuAhCUiVBy1RIJAyP6zOyuT61McPdRlyRli4bkGnUD8ZKD
         EfKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742565116; x=1743169916;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qv0VQ+NUrVd0gQgaN8Z4ekYOSShVij+HdMBj/Qw1Kz0=;
        b=ZWym3hUs3baTXgIV4ajSDpIjJCi5FGmBHW0I7etSApHmvLQHtFQCBOg3dDruVS12yl
         XyrUP1/9t6tu0rumXVDG5KhFDs/rs/7Iek8jG9nz0nP2P6ysdrZMvuNRFP+tCi5vj2P2
         NG9db2q3e3w8j8gF/hi5D6jFN74j32/LZh1S5KeJgjd/REoVohSt8NsDED988znZJGkS
         7rzrAiC81ijFUhxVzVDpZmeXm+zAkN+Jk4BCHi7t9BVCMw7oenNkGhzdyVhX33gfdL/m
         TqhELpWHDMQaAw05/hTJbCUE2hwyPTVzrP/dj0b3VUN1AaaveOkxUOxYFd51Pd3PiuTT
         epGg==
X-Forwarded-Encrypted: i=1; AJvYcCVrUVxgGdbDy6zzOEDjff2ac6HNgx5luOmG6fL5Q71jAZKIxSO6Kcy9n6a1CqWkYJ9KYtR/llJD1i8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxXb5Sj+B+9iseKXn271JlSkvYBPkSl8N2ehEcISY2LxP8D7o5z
	sdA6XgXCu/DgXi0vOiya2VxAwrmpY6NTlBDpyZSYM0dAG0qDSZgGAGGeYmsFM0RvdE8gGnYxaLI
	=
X-Gm-Gg: ASbGncsXNJvLeTa1xvNz9wmm9gLfnjVBwNsmGG1a2m02Agm/O5r0IpcNV0UykFdvnpJ
	T9g5akrYoYm5jQFr8Yxz25+J26yy/A0CxV27svglUILsI586PL5gmKBZZoYuqdhi4E6Nl9bt/Jx
	Iv1V6QPDfr4QWCCGCEJABtf/w929iXH+sJyCJ3RDSGKffqTnn5OvKkXQnKz04OLG0htU6VKhN93
	pHzzIy7Rr+KkY3RPJFLA4jJnkJ1EWByiwqB3AsarqLyUCR/1KfymXSHK9wS7D76KuMMrZXbGhqR
	i33HfAkMV7+w4MFtAS1ML4NmhAmq/xKlN055aPVdavBF9rdAEN9bMqH28hnUEVtrBbnYaPCOvW1
	lLm0NgYiHog4j3z8mkQWsphRZJy3lTw==
X-Google-Smtp-Source: AGHT+IGwJffDMk+z7JvUdeRZoNZ59XP81EO+sdu/u5/S5aDDUPhtnVThTTbOkHKxcDKxzEDF2b0Gew==
X-Received: by 2002:a05:600c:1989:b0:43c:fc04:6d34 with SMTP id 5b1f17b1804b1-43d50a318aamr28553245e9.20.1742565116109;
        Fri, 21 Mar 2025 06:51:56 -0700 (PDT)
Message-ID: <e616cf59-bcb6-478d-87b5-f35a51ce1dda@suse.com>
Date: Fri, 21 Mar 2025 14:51:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [MINI-OS PATCH 03/12] add elf.h
To: Juergen Gross <jgross@suse.com>
Cc: samuel.thibault@ens-lyon.org, minios-devel@lists.xenproject.org,
 xen-devel@lists.xenproject.org
References: <20250321092451.17309-1-jgross@suse.com>
 <20250321092451.17309-4-jgross@suse.com>
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
In-Reply-To: <20250321092451.17309-4-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.03.2025 10:24, Juergen Gross wrote:
> Add some definitions for accessing an ELF file. Only the file header
> and the program header are needed.
> 
> The main source for those are elfstructs.h and libelf.h from the Xen
> tree. The license boiler plate of those files is being kept in the
> resulting header file.

Maybe the copying was a bit too literal.

> --- /dev/null
> +++ b/include/elf.h
> @@ -0,0 +1,340 @@
> +#ifndef __ELF_H__
> +#define __ELF_H__
> +/*
> + * Copyright (c) 1995, 1996 Erik Theisen.  All rights reserved.
> + *
> + * Redistribution and use in source and binary forms, with or without
> + * modification, are permitted provided that the following conditions
> + * are met:
> + * 1. Redistributions of source code must retain the above copyright
> + *    notice, this list of conditions and the following disclaimer.
> + * 2. Redistributions in binary form must reproduce the above copyright
> + *    notice, this list of conditions and the following disclaimer in the
> + *    documentation and/or other materials provided with the distribution.
> + * 3. The name of the author may not be used to endorse or promote products
> + *    derived from this software without specific prior written permission
> + *
> + * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR
> + * IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
> + * OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
> + * IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT,
> + * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
> + * NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
> + * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
> + * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
> + * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
> + * THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
> + */
> +
> +#include <stdbool.h>
> +#include <mini-os/types.h>
> +
> +typedef uint32_t    Elf32_Addr;  /* Unsigned program address */
> +typedef uint32_t    Elf32_Off;   /* Unsigned file offset */
> +typedef uint16_t    Elf32_Half;  /* Unsigned medium integer */
> +typedef uint32_t    Elf32_Word;  /* Unsigned large integer */
> +
> +typedef uint64_t    Elf64_Addr;
> +typedef uint64_t    Elf64_Off;
> +typedef uint16_t    Elf64_Half;
> +typedef uint32_t    Elf64_Word;
> +typedef uint64_t    Elf64_Xword;
> +
> +/* Unique build id string format when using --build-id. */
> +#define NT_GNU_BUILD_ID 3
> +
> +/*
> + * e_ident[] identification indexes
> + * See http://www.caldera.com/developers/gabi/2000-07-17/ch4.eheader.html
> + */
> +#define EI_MAG0        0         /* file ID */
> +#define EI_MAG1        1         /* file ID */
> +#define EI_MAG2        2         /* file ID */
> +#define EI_MAG3        3         /* file ID */
> +#define EI_CLASS       4         /* file class */
> +#define EI_DATA        5         /* data encoding */
> +#define EI_VERSION     6         /* ELF header version */
> +#define EI_OSABI       7         /* OS/ABI ID */
> +#define EI_ABIVERSION  8         /* ABI version */
> +#define EI_PAD         9         /* start of pad bytes */
> +#define EI_NIDENT     16         /* Size of e_ident[] */
> +
> +/* e_ident[] magic number */
> +#define ELFMAG0        0x7f      /* e_ident[EI_MAG0] */
> +#define ELFMAG1        'E'       /* e_ident[EI_MAG1] */
> +#define ELFMAG2        'L'       /* e_ident[EI_MAG2] */
> +#define ELFMAG3        'F'       /* e_ident[EI_MAG3] */
> +#define ELFMAG         "\177ELF" /* magic */
> +#define SELFMAG        4         /* size of magic */
> +
> +/* e_ident[] file class */
> +#define ELFCLASSNONE   0         /* invalid */
> +#define ELFCLASS32     1         /* 32-bit objs */
> +#define ELFCLASS64     2         /* 64-bit objs */
> +#define ELFCLASSNUM    3         /* number of classes */
> +
> +/* e_ident[] data encoding */
> +#define ELFDATANONE    0         /* invalid */
> +#define ELFDATA2LSB    1         /* Little-Endian */
> +#define ELFDATA2MSB    2         /* Big-Endian */
> +#define ELFDATANUM     3         /* number of data encode defines */
> +
> +/* e_ident[] Operating System/ABI */
> +#define ELFOSABI_SYSV         0  /* UNIX System V ABI */
> +#define ELFOSABI_NONE         0  /* Same as ELFOSABI_SYSV */
> +#define ELFOSABI_HPUX         1  /* HP-UX operating system */
> +#define ELFOSABI_NETBSD       2  /* NetBSD */
> +#define ELFOSABI_LINUX        3  /* GNU/Linux */
> +#define ELFOSABI_HURD         4  /* GNU/Hurd */
> +#define ELFOSABI_86OPEN       5  /* 86Open common IA32 ABI */
> +#define ELFOSABI_SOLARIS      6  /* Solaris */
> +#define ELFOSABI_MONTEREY     7  /* Monterey */
> +#define ELFOSABI_IRIX         8  /* IRIX */
> +#define ELFOSABI_FREEBSD      9  /* FreeBSD */
> +#define ELFOSABI_TRU64       10  /* TRU64 UNIX */
> +#define ELFOSABI_MODESTO     11  /* Novell Modesto */
> +#define ELFOSABI_OPENBSD     12  /* OpenBSD */
> +#define ELFOSABI_ARM         97  /* ARM */
> +#define ELFOSABI_STANDALONE 255  /* Standalone (embedded) application */

While I'm happy to see Modesto mentioned in yet another places, I don't
think you need the majority of these?

> +/* e_ident */
> +#define IS_ELF(ehdr) ((ehdr).e_ident[EI_MAG0] == ELFMAG0 && \
> +                      (ehdr).e_ident[EI_MAG1] == ELFMAG1 && \
> +                      (ehdr).e_ident[EI_MAG2] == ELFMAG2 && \
> +                      (ehdr).e_ident[EI_MAG3] == ELFMAG3)
> +
> +/* e_flags */
> +#define EF_ARM_EABI_MASK    0xff000000
> +#define EF_ARM_EABI_UNKNOWN 0x00000000
> +#define EF_ARM_EABI_VER1    0x01000000
> +#define EF_ARM_EABI_VER2    0x02000000
> +#define EF_ARM_EABI_VER3    0x03000000
> +#define EF_ARM_EABI_VER4    0x04000000
> +#define EF_ARM_EABI_VER5    0x05000000
> +
> +/* ELF Header */
> +typedef struct {
> +    unsigned char e_ident[EI_NIDENT]; /* ELF Identification */
> +    Elf32_Half    e_type;        /* object file type */
> +    Elf32_Half    e_machine;     /* machine */
> +    Elf32_Word    e_version;     /* object file version */
> +    Elf32_Addr    e_entry;       /* virtual entry point */
> +    Elf32_Off     e_phoff;       /* program header table offset */
> +    Elf32_Off     e_shoff;       /* section header table offset */
> +    Elf32_Word    e_flags;       /* processor-specific flags */
> +    Elf32_Half    e_ehsize;      /* ELF header size */
> +    Elf32_Half    e_phentsize;   /* program header entry size */
> +    Elf32_Half    e_phnum;       /* number of program header entries */
> +    Elf32_Half    e_shentsize;   /* section header entry size */
> +    Elf32_Half    e_shnum;       /* number of section header entries */
> +    Elf32_Half    e_shstrndx;    /* section header table's "section
> +                                    header string table" entry offset */
> +} Elf32_Ehdr;
> +
> +typedef struct {
> +    unsigned char e_ident[EI_NIDENT]; /* Id bytes */
> +    Elf64_Half    e_type;        /* file type */
> +    Elf64_Half    e_machine;     /* machine type */
> +    Elf64_Word    e_version;     /* version number */
> +    Elf64_Addr    e_entry;       /* entry point */
> +    Elf64_Off     e_phoff;       /* Program hdr offset */
> +    Elf64_Off     e_shoff;       /* Section hdr offset */
> +    Elf64_Word    e_flags;       /* Processor flags */
> +    Elf64_Half    e_ehsize;      /* sizeof ehdr */
> +    Elf64_Half    e_phentsize;   /* Program header entry size */
> +    Elf64_Half    e_phnum;       /* Number of program headers */
> +    Elf64_Half    e_shentsize;   /* Section header entry size */
> +    Elf64_Half    e_shnum;       /* Number of section headers */
> +    Elf64_Half    e_shstrndx;    /* String table index */
> +} Elf64_Ehdr;
> +
> +/* e_type */
> +#define ET_NONE      0           /* No file type */
> +#define ET_REL       1           /* relocatable file */
> +#define ET_EXEC      2           /* executable file */
> +#define ET_DYN       3           /* shared object file */
> +#define ET_CORE      4           /* core file */
> +#define ET_NUM       5           /* number of types */
> +#define ET_LOPROC    0xff00      /* reserved range for processor */
> +#define ET_HIPROC    0xffff      /*   specific e_type */
> +
> +/* e_machine */
> +#define EM_NONE      0           /* No Machine */
> +#define EM_M32       1           /* AT&T WE 32100 */
> +#define EM_SPARC     2           /* SPARC */
> +#define EM_386       3           /* Intel 80386 */
> +#define EM_68K       4           /* Motorola 68000 */
> +#define EM_88K       5           /* Motorola 88000 */
> +#define EM_486       6           /* Intel 80486 - unused? */
> +#define EM_860       7           /* Intel 80860 */
> +#define EM_MIPS      8           /* MIPS R3000 Big-Endian only */
> +/*
> + * Don't know if EM_MIPS_RS4_BE,
> + * EM_SPARC64, EM_PARISC,
> + * or EM_PPC are ABI compliant
> + */
> +#define EM_MIPS_RS4_BE 10        /* MIPS R4000 Big-Endian */
> +#define EM_SPARC64     11        /* SPARC v9 64-bit unoffical */
> +#define EM_PARISC      15        /* HPPA */
> +#define EM_SPARC32PLUS 18        /* Enhanced instruction set SPARC */
> +#define EM_PPC         20        /* PowerPC */
> +#define EM_PPC64       21        /* PowerPC 64-bit */
> +#define EM_ARM         40        /* Advanced RISC Machines ARM */
> +#define EM_ALPHA       41        /* DEC ALPHA */
> +#define EM_SPARCV9     43        /* SPARC version 9 */
> +#define EM_ALPHA_EXP   0x9026    /* DEC ALPHA */
> +#define EM_IA_64       50        /* Intel Merced */
> +#define EM_X86_64      62        /* AMD x86-64 architecture */
> +#define EM_VAX         75        /* DEC VAX */
> +#define EM_AARCH64    183        /* ARM 64-bit */

Here I similarly think some stripping down might help. Doing so would then
also permit to leave out the comment in the middle.

> +/* Version */
> +#define EV_NONE      0           /* Invalid */
> +#define EV_CURRENT   1           /* Current */
> +#define EV_NUM       2           /* number of versions */
> +
> +/* Program Header */
> +typedef struct {
> +    Elf32_Word    p_type;        /* segment type */
> +    Elf32_Off     p_offset;      /* segment offset */
> +    Elf32_Addr    p_vaddr;       /* virtual address of segment */
> +    Elf32_Addr    p_paddr;       /* physical address - ignored? */
> +    Elf32_Word    p_filesz;      /* number of bytes in file for seg. */
> +    Elf32_Word    p_memsz;       /* number of bytes in mem. for seg. */
> +    Elf32_Word    p_flags;       /* flags */
> +    Elf32_Word    p_align;       /* memory alignment */
> +} Elf32_Phdr;
> +
> +typedef struct {
> +    Elf64_Word    p_type;        /* entry type */
> +    Elf64_Word    p_flags;       /* flags */
> +    Elf64_Off     p_offset;      /* offset */
> +    Elf64_Addr    p_vaddr;       /* virtual address */
> +    Elf64_Addr    p_paddr;       /* physical address */
> +    Elf64_Xword   p_filesz;      /* file size */
> +    Elf64_Xword   p_memsz;       /* memory size */
> +    Elf64_Xword   p_align;       /* memory & file alignment */
> +} Elf64_Phdr;
> +
> +/* Segment types - p_type */
> +#define PT_NULL      0           /* unused */
> +#define PT_LOAD      1           /* loadable segment */
> +#define PT_DYNAMIC   2           /* dynamic linking section */
> +#define PT_INTERP    3           /* the RTLD */
> +#define PT_NOTE      4           /* auxiliary information */
> +#define PT_SHLIB     5           /* reserved - purpose undefined */
> +#define PT_PHDR      6           /* program header */
> +#define PT_NUM       7           /* Number of segment types */
> +#define PT_LOPROC    0x70000000  /* reserved range for processor */
> +#define PT_HIPROC    0x7fffffff  /*  specific segment types */
> +
> +/* Segment flags - p_flags */
> +#define PF_X         0x1        /* Executable */
> +#define PF_W         0x2        /* Writable */
> +#define PF_R         0x4        /* Readable */
> +#define PF_MASKPROC  0xf0000000 /* reserved bits for processor */
> +                                /*  specific segment flags */
> +
> +/* Section Header */
> +typedef struct {
> +    Elf32_Word    sh_name;      /* name - index into section header
> +                                   string table section */
> +    Elf32_Word    sh_type;      /* type */
> +    Elf32_Word    sh_flags;     /* flags */
> +    Elf32_Addr    sh_addr;      /* address */
> +    Elf32_Off     sh_offset;    /* file offset */
> +    Elf32_Word    sh_size;      /* section size */
> +    Elf32_Word    sh_link;      /* section header table index link */
> +    Elf32_Word    sh_info;      /* extra information */
> +    Elf32_Word    sh_addralign; /* address alignment */
> +    Elf32_Word    sh_entsize;   /* section entry size */
> +} Elf32_Shdr;
> +
> +typedef struct {
> +    Elf64_Word    sh_name;      /* section name */
> +    Elf64_Word    sh_type;      /* section type */
> +    Elf64_Xword   sh_flags;     /* section flags */
> +    Elf64_Addr    sh_addr;      /* virtual address */
> +    Elf64_Off     sh_offset;    /* file offset */
> +    Elf64_Xword   sh_size;      /* section size */
> +    Elf64_Word    sh_link;      /* link to another */
> +    Elf64_Word    sh_info;      /* misc info */
> +    Elf64_Xword   sh_addralign; /* memory alignment */
> +    Elf64_Xword   sh_entsize;   /* table entry size */
> +} Elf64_Shdr;
> +
> +/* sh_type */
> +#define SHT_NULL        0       /* inactive */
> +#define SHT_PROGBITS    1       /* program defined information */
> +#define SHT_SYMTAB      2       /* symbol table section */
> +#define SHT_STRTAB      3       /* string table section */
> +#define SHT_RELA        4       /* relocation section with addends*/
> +#define SHT_HASH        5       /* symbol hash table section */
> +#define SHT_DYNAMIC     6       /* dynamic section */
> +#define SHT_NOTE        7       /* note section */
> +#define SHT_NOBITS      8       /* no space section */
> +#define SHT_REL         9       /* relation section without addends */
> +#define SHT_SHLIB      10       /* reserved - purpose unknown */
> +#define SHT_DYNSYM     11       /* dynamic symbol table section */
> +#define SHT_NUM        12       /* number of section types */
> +
> +/* Note definitions */
> +typedef struct {
> +    Elf32_Word namesz;
> +    Elf32_Word descsz;
> +    Elf32_Word type;
> +    char data[];
> +} Elf32_Note;
> +
> +typedef struct {
> +    Elf64_Word namesz;
> +    Elf64_Word descsz;
> +    Elf64_Word type;
> +    char data[];
> +} Elf64_Note;
> +
> +/* Abstraction layer for handling 32- and 64-bit ELF files. */
> +
> +typedef union {
> +    Elf32_Ehdr e32;
> +    Elf64_Ehdr e64;
> +} elf_ehdr;
> +
> +static inline bool elf_is_32bit(elf_ehdr *ehdr)
> +{
> +    return ehdr->e32.e_ident[EI_CLASS] == ELFCLASS32;
> +}
> +
> +static inline bool elf_is_64bit(elf_ehdr *ehdr)
> +{
> +    return ehdr->e32.e_ident[EI_CLASS] == ELFCLASS64;
> +}
> +
> +#define ehdr_val(ehdr, elem) (elf_is_32bit(ehdr) ? (ehdr)->e32.elem : (ehdr)->e64.elem)
> +
> +typedef union {
> +    Elf32_Phdr e32;
> +    Elf64_Phdr e64;
> +} elf_phdr;
> +
> +#define phdr_val(ehdr, phdr, elem) (elf_is_32bit(ehdr) ? (phdr)->e32.elem : (phdr)->e64.elem)
> +
> +typedef union {
> +    Elf32_Shdr e32;
> +    Elf64_Shdr e64;
> +} elf_shdr;
> +
> +#define shdr_val(ehdr, shdr, elem) (elf_is_32bit(ehdr) ? (shdr)->e32.elem : (shdr)->e64.elem)
> +
> +typedef union {
> +    Elf32_Note e32;
> +    Elf64_Note e64;
> +} elf_note;
> +
> +#define note_val(ehdr, note, elem) (elf_is_32bit(ehdr) ? (note)->e32.elem : (note)->e64.elem)
> +
> +static inline void *elf_ptr_add(void *ptr, unsigned long add)
> +{
> +    return (char *)ptr + add;

You can omit the cast here, can't you?

You're the maintainer, so you'll know how many of the comments you want to
address. Either way:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

