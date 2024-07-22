Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BDA938E14
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2024 13:33:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.761739.1171757 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVrHa-0003Uj-EN; Mon, 22 Jul 2024 11:32:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 761739.1171757; Mon, 22 Jul 2024 11:32:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sVrHa-0003T3-BG; Mon, 22 Jul 2024 11:32:46 +0000
Received: by outflank-mailman (input) for mailman id 761739;
 Mon, 22 Jul 2024 11:32:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=79tL=OW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sVrHY-0003Sh-LR
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2024 11:32:44 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c4c0402-481e-11ef-bbfe-fd08da9f4363;
 Mon, 22 Jul 2024 13:32:43 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5a3458bf7cfso3098383a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jul 2024 04:32:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a30a4d7127sm6035970a12.3.2024.07.22.04.32.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jul 2024 04:32:42 -0700 (PDT)
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
X-Inumbo-ID: 1c4c0402-481e-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721647963; x=1722252763; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Vcz0HU9cQX11mjByUwT1ZGipDFaqZDDyUilfPThVEog=;
        b=cOa53ychAe3PjTYCKPiidl/INWXRDbgD/qWdoUxaXaAuGFgiItlpWwSi9pTcLK0PVv
         LmtgqL9AQO7l05A3TPfGAdFYo+zFaUEuN2JS/1x/vxKcvL3sQega9YR539nmUiqQSuYO
         rpR3iB7CyPJVcZ4283V99aZDZUn07GnSBn5e6BoaFM4oaxU3q0mTOunAFQxPRUsK8S9U
         J8Idq5zr0dHq0ZRMtscF6fb+AfYmRiEa1AmdUV9EciqNuFh3F0ltcQfM+dPqLDtXtsW9
         eXObnG0BifEG194oxgm0oKwXQ5QJU6H/oSlitQLurkWpXjGXurYFd4bu2ED1I2VqT4RD
         OpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721647963; x=1722252763;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vcz0HU9cQX11mjByUwT1ZGipDFaqZDDyUilfPThVEog=;
        b=vSn75QuKoKWL9/XEyg6VeRkDnNKcsEcQpdj9oJu2uPfbnr9gm+pHLx+7RGGshPXEd3
         llAo+VVQMCllYINLqSZcsjCTAMSMsXtaG/0tNqVedYZLluSI9t3VdsOuQV0EXp14BRhY
         ieLAcTaWIuHk6VYBblZU/12g4rao4ZXlp5Z5qTPV/mq1Oc83S2hTwYB3x3JQI2v2yGwT
         DHvMpojsAm7W3XQH1rURgJnYHHohZ6zZYLdKwY4+6ywR1xA0C+/jQcYiZGvq505cAm01
         B2BeyUiPHAuK4Vsvn8me2+avW6h7QJocS99uNb4aFFPH+ggfRIWNgulsvZdG/cwlZnBJ
         nqPg==
X-Forwarded-Encrypted: i=1; AJvYcCVlIUC6s9vl66jWGXXsAW/wVtm7PAWY7iYUrTm3krRImfw38Sm4LQbWtyp06TlG2bHBK/2jHJMo1n7nMz1bzKa90CoibobxKdVq+f6nq28=
X-Gm-Message-State: AOJu0YyqpGN7T6CTsGp+TGYL7VE+320e6NSg3qdwe6xTe0KFHAU+gLc/
	X2tPkLRhAmDaMQ1ITAirp1eCK8NO6Twj82pj0oR41WI20FqrHACpGgSUbZNb2w==
X-Google-Smtp-Source: AGHT+IHgeCNr1x3U1wbeLTY3HiAs5/Fd9pNTlAGKAPV1MvJQqzmV7YqpzdehYYww9c0s5B0Sz86fOw==
X-Received: by 2002:a05:6402:5305:b0:5a2:1f7b:e017 with SMTP id 4fb4d7f45d1cf-5a479879f59mr4287562a12.4.1721647962697;
        Mon, 22 Jul 2024 04:32:42 -0700 (PDT)
Message-ID: <89aab1e5-c2c5-4ff2-b423-c35a316f001e@suse.com>
Date: Mon, 22 Jul 2024 13:32:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen: PE/COFF image header
To: Milan Djokic <milandjokic1995@gmail.com>
Cc: oleksii.kurochko@gmail.com, Nikola Jelic <nikola.jelic@rt-rk.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Milan Djokic <milan.djokic@rt-rk.com>,
 xen-devel@lists.xenproject.org
References: <2b747d672eeadc1150d3b84f0303e1d288311133.1721391876.git.milan.djokic@rt-rk.com>
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
In-Reply-To: <2b747d672eeadc1150d3b84f0303e1d288311133.1721391876.git.milan.djokic@rt-rk.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.07.2024 14:31, Milan Djokic wrote:
> --- /dev/null
> +++ b/xen/include/efi/pe.h
> @@ -0,0 +1,485 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright 2011 Red Hat, Inc.
> + * All rights reserved.
> + *
> + * Author(s): Peter Jones <pjones@redhat.com>
> + */
> +#ifndef __LINUX_PE_H
> +#define __LINUX_PE_H

LINUX? It'll want to be EFI__PE_H according to our new naming scheme, if I'm
not mistaken. (The commit describing the the new scheme is yet to appear,
unfortunately.)

> +#include <xen/types.h>
> +
> +/*
> + * Starting from version v3.0, the major version field should be interpreted as
> + * a bit mask of features supported by the kernel's EFI stub:
> + * - 0x1: initrd loading from the LINUX_EFI_INITRD_MEDIA_GUID device path,
> + * - 0x2: initrd loading using the initrd= command line option, where the file
> + *        may be specified using device path notation, and is not required to
> + *        reside on the same volume as the loaded kernel image.
> + *
> + * The recommended way of loading and starting v1.0 or later kernels is to use
> + * the LoadImage() and StartImage() EFI boot services, and expose the initrd
> + * via the LINUX_EFI_INITRD_MEDIA_GUID device path.
> + *
> + * Versions older than v1.0 may support initrd loading via the image load
> + * options (using initrd=, limited to the volume from which the kernel itself
> + * was loaded), or only via arch specific means (bootparams, DT, etc).
> + *
> + * The minor version field must remain 0x0.
> + * (https://lore.kernel.org/all/efd6f2d4-547c-1378-1faa-53c044dbd297@gmail.com/)
> + */
> +#define LINUX_EFISTUB_MAJOR_VERSION 0x3
> +#define LINUX_EFISTUB_MINOR_VERSION 0x0

What does this describe? Do we need this at all?

> +/*
> + * LINUX_PE_MAGIC appears at offset 0x38 into the MS-DOS header of EFI bootable
> + * Linux kernel images that target the architecture as specified by the PE/COFF
> + * header machine type field.
> + */
> +#define LINUX_PE_MAGIC 0x818223cd

Here at least it is largely clear what's being described; the question whether
we actually need it applies here too, though.

> +#define MZ_MAGIC 0x5a4d /* "MZ" */
> +
> +#define PE_MAGIC              0x00004550 /* "PE\0\0" */
> +#define PE_OPT_MAGIC_PE32     0x010b
> +#define PE_OPT_MAGIC_PE32_ROM 0x0107
> +#define PE_OPT_MAGIC_PE32PLUS 0x020b
> +
> +#define PECOFF_SECTION_ALIGNMENT 0x1000
> +#define PECOFF_FILE_ALIGNMENT    0x200

I can't spot anything like that in the Linux header, and these two values
are also dynamic (values live in header fields), not build-time constant.

> +/* machine type */
> +#define IMAGE_FILE_MACHINE_UNKNOWN     0x0000
> +#define IMAGE_FILE_MACHINE_AM33        0x01d3
> +#define IMAGE_FILE_MACHINE_AMD64       0x8664
> +#define IMAGE_FILE_MACHINE_ARM         0x01c0
> +#define IMAGE_FILE_MACHINE_ARMV7       0x01c4
> +#define IMAGE_FILE_MACHINE_ARM64       0xaa64
> +#define IMAGE_FILE_MACHINE_EBC         0x0ebc
> +#define IMAGE_FILE_MACHINE_I386        0x014c
> +#define IMAGE_FILE_MACHINE_IA64        0x0200
> +#define IMAGE_FILE_MACHINE_M32R        0x9041
> +#define IMAGE_FILE_MACHINE_MIPS16      0x0266
> +#define IMAGE_FILE_MACHINE_MIPSFPU     0x0366
> +#define IMAGE_FILE_MACHINE_MIPSFPU16   0x0466
> +#define IMAGE_FILE_MACHINE_POWERPC     0x01f0
> +#define IMAGE_FILE_MACHINE_POWERPCFP   0x01f1
> +#define IMAGE_FILE_MACHINE_R4000       0x0166
> +#define IMAGE_FILE_MACHINE_RISCV32     0x5032
> +#define IMAGE_FILE_MACHINE_RISCV64     0x5064
> +#define IMAGE_FILE_MACHINE_RISCV128    0x5128
> +#define IMAGE_FILE_MACHINE_SH3         0x01a2
> +#define IMAGE_FILE_MACHINE_SH3DSP      0x01a3
> +#define IMAGE_FILE_MACHINE_SH3E        0x01a4
> +#define IMAGE_FILE_MACHINE_SH4         0x01a6
> +#define IMAGE_FILE_MACHINE_SH5         0x01a8
> +#define IMAGE_FILE_MACHINE_THUMB       0x01c2
> +#define IMAGE_FILE_MACHINE_WCEMIPSV2   0x0169
> +#define IMAGE_FILE_MACHINE_LOONGARCH32 0x6232
> +#define IMAGE_FILE_MACHINE_LOONGARCH64 0x6264
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

These values exist further up already, under different names.

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
> +#define IMAGE_DLLCHARACTERISTICS_EX_CET_COMPAT         0x0001
> +#define IMAGE_DLLCHARACTERISTICS_EX_FORWARD_CFI_COMPAT 0x0040
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

Can this please be corrected to "1-nibble"?

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
> +#define IMAGE_DEBUG_TYPE_CODEVIEW              2
> +#define IMAGE_DEBUG_TYPE_EX_DLLCHARACTERISTICS 20
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

Preferably s/address/file offset/ here, no matter that Linux has "address"
there. I also think that it would be nice to have PE in upper case here.

> +    char     message[];          /* message to print */
> +};
> +
> +struct mz_reloc {
> +    uint16_t offset;
> +    uint16_t segment;
> +};
> +
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
> +
> +/* the fact that pe32 isn't padded where pe32+ is 64-bit means union won't
> + * work right. vomit.
> + */

Please adjust comment style and preferably omit the swear word.

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
> +    uint16_t dll_flags;      /* more flags! */
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
> +    uint16_t dll_flags;      /* more flags! */
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

There's the common term RVA for this, so instead of a misleading field
name with a comment I'd like to suggest simply "rva" here.

> +    uint32_t size;
> +};
> +
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
> +
> +struct section_header {
> +    char     name[8];         /* name or string tbl offset */
> +    uint32_t virtual_size;    /* size of loaded section in ram */
> +    uint32_t virtual_address; /* relative virtual address */
> +    uint32_t raw_data_size;   /* size of the section */
> +    uint32_t data_addr;       /* file pointer to first page of sec */
> +    uint32_t relocs;          /* file pointer to relocation entries */
> +    uint32_t line_numbers;    /* line numbers */
> +    uint16_t num_relocs;      /* number of relocations */
> +    uint16_t num_lin_numbers; /* COFF line count */
> +    uint32_t flags;
> +};
> +
> +enum x64_coff_reloc_type {

For everything down from here I already previously questioned whether we'd
ever use it. My suggestion would be to omit all of this, mentioning the
(intentional) omission in the description.

Jan

