Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C41D9AF70E8
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 12:51:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031970.1405721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXHWm-00021T-T9; Thu, 03 Jul 2025 10:50:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031970.1405721; Thu, 03 Jul 2025 10:50:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXHWm-0001yM-QO; Thu, 03 Jul 2025 10:50:52 +0000
Received: by outflank-mailman (input) for mailman id 1031970;
 Thu, 03 Jul 2025 10:50:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lE7m=ZQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uXHWl-0001yG-Cc
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 10:50:51 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 951eabe0-57fb-11f0-a314-13f23c93f187;
 Thu, 03 Jul 2025 12:50:50 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a50956e5d3so6509622f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 03 Jul 2025 03:50:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74af541d9a5sm17184363b3a.62.2025.07.03.03.50.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 03:50:48 -0700 (PDT)
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
X-Inumbo-ID: 951eabe0-57fb-11f0-a314-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751539849; x=1752144649; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bR7Nf2NHF+ry1DMtCtsJsGwd0EY5IjLB5QbiMspfN2s=;
        b=C3Bjady1p5bW17RF7fbgyZbr4t5sZ77X/1Tv2jBXvsfPb89blLHBjBDm/Ucn3qnFEf
         K+xjGfhPe58R7FPqNTMtvIPGgw6evAVDcHH0XAmsTr9aIOwR5RljsajpFW8Sf5SfRmEl
         BoN6+YTEIncQLATpfFQ6A6v6WJxSNIUKS0q4TPmhoMXPwXVtrbJ89nKndsyh/RfgB5Hg
         jP12kk+k+DqiA3y/9ZY41FvWHOxBtXh5s9HrcsbgrZxLTlAFz5EHefUDN3xs9vwjHi2B
         qFOTGQwdykMVBUa4RbMLQcJRW7Wg/2PWJYB9GIfrNnoCLrLy8ombU0EqJPPZPwsni9vS
         vxYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751539849; x=1752144649;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bR7Nf2NHF+ry1DMtCtsJsGwd0EY5IjLB5QbiMspfN2s=;
        b=sADFyYzNL8f2J8ZaGvM/HTtR/BV6WOphm9O1RPCXH8Q6ddBzjWdrC4Zq2zF26sSyNc
         vsB3DrRmJtFpCAu4pgPDsiEBjiJn+SUHBpAe31S6F3CruuXioL7gUZ+zUZl08YMVFm5n
         L9qn+7kXbMG/0o1FGDxzL0MTJ7lZguntQB/VZI2yEyzXk99B0Om39njVxqhf7AbZuA/p
         PR4HHOtFy2OM5/XimFm4jm5N2xsmYQFydGb83wtfo7A7Rdzv8Ok5NVZE1BWSAJprAL0B
         A/GD5TUHhHbk4rLJNTNcxoCONnI+JWaTKi/raN59gZOXycFubOUi3K8ymcX2CqkoxRq3
         0GMg==
X-Forwarded-Encrypted: i=1; AJvYcCXtoMCapVkYxfKMDEd0ogOxHiVNx0IzZlqk4skDQE1QUYs+VxNNXcj4dH6bONvwgRM8/hhAM14NwRI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YypKDw2FvD2DYoCmg9Sj4/QrMWV764qV+PiNOE46+JSpdgHO4jU
	7bB4qs0IiGCToeaHPLBKFdGYbfbhQmUO3mN74KVZnkucojd2tjKE0iddDpn3JJqiIw==
X-Gm-Gg: ASbGncs85sA02yHOOzD4ufy82H634YF5fYFeJMLpQc9VuB4pGfMCWC1/gwFSiiUcC47
	dK6UcK7Fp83A4UM2Nz+qfHmelU0nkRKSSzD6FFT+fvicCvZDhjRbL3ZUO2HkNmdqnsDtIrYvWBz
	0CBVV1mP96faTNIRP5HFqMx5kueamz1u3dcwqx6D6IjuMu5a7TtRbqKkf7LEvzf3E5K3KLqp6U7
	XCpqK+wVNhkC+ckFFARUiig9z6wF+z9rDT9EgGa2ayNzQFS8oizhzHP36K/6npGK8wS6NJjtRKa
	JOKJMrCcbCSYmVkdVEvSUb5MA0y/7IbvvIp1IpeZ5ucTqLiJoOxAruu267z2qdjbguDUPaRd0zj
	JZ6Umiovyvx/or7DVIKXwFqHEp/0eY2S9SyGewHEhhpJw4vs=
X-Google-Smtp-Source: AGHT+IGQjNqlCatEsYIjqJ5IqqxQaHs72qD1jBp3zdZkbndAyvo1Kx8tbhiBRvy88W0YSk40yUGY6Q==
X-Received: by 2002:a5d:64e7:0:b0:3a4:eeb5:58c0 with SMTP id ffacd0b85a97d-3b1fe5bef1bmr5500954f8f.20.1751539849258;
        Thu, 03 Jul 2025 03:50:49 -0700 (PDT)
Message-ID: <180e1641-9968-479a-8ca0-7573d688c854@suse.com>
Date: Thu, 3 Jul 2025 12:50:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/22] x86/boot/slaunch-early: implement early
 initialization
To: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ross Philipson <ross.philipson@oracle.com>,
 trenchboot-devel@googlegroups.com, xen-devel@lists.xenproject.org
References: <cover.1748611041.git.sergii.dmytruk@3mdeb.com>
 <16a544876163afece619d50f80869aaacc9c797c.1748611041.git.sergii.dmytruk@3mdeb.com>
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
In-Reply-To: <16a544876163afece619d50f80869aaacc9c797c.1748611041.git.sergii.dmytruk@3mdeb.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.05.2025 15:17, Sergii Dmytruk wrote:
> Make head.S invoke a C function to retrieve MBI and SLRT addresses in a
> platform-specific way.  This is also the place to perform sanity checks
> of DRTM.
> 
> Signed-off-by: Krystian Hebel <krystian.hebel@3mdeb.com>
> Signed-off-by: Sergii Dmytruk <sergii.dmytruk@3mdeb.com>
> ---
>  xen/arch/x86/Makefile                |  1 +
>  xen/arch/x86/boot/Makefile           |  5 +++-
>  xen/arch/x86/boot/head.S             | 43 ++++++++++++++++++++++++++++
>  xen/arch/x86/boot/slaunch-early.c    | 41 ++++++++++++++++++++++++++
>  xen/arch/x86/include/asm/intel-txt.h | 16 +++++++++++
>  xen/arch/x86/include/asm/slaunch.h   | 26 +++++++++++++++++
>  xen/arch/x86/slaunch.c               | 27 +++++++++++++++++
>  7 files changed, 158 insertions(+), 1 deletion(-)
>  create mode 100644 xen/arch/x86/boot/slaunch-early.c
>  create mode 100644 xen/arch/x86/include/asm/slaunch.h
>  create mode 100644 xen/arch/x86/slaunch.c

As indicated in reply to patch 3 - imo all code additions here want to be
under some CONFIG_xyz. I repeat this here, but I don't think I'll repeat it
any further.

> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -472,6 +472,10 @@ __start:
>          /* Bootloaders may set multiboot{1,2}.mem_lower to a nonzero value. */
>          xor     %edx,%edx
>  
> +        /* Check for TrenchBoot slaunch bootloader. */
> +        cmp     $SLAUNCH_BOOTLOADER_MAGIC, %eax
> +        je      .Lslaunch_proto
> +
>          /* Check for Multiboot2 bootloader. */
>          cmp     $MULTIBOOT2_BOOTLOADER_MAGIC,%eax
>          je      .Lmultiboot2_proto
> @@ -487,6 +491,45 @@ __start:
>          cmovnz  MB_mem_lower(%ebx),%edx
>          jmp     trampoline_bios_setup
>  
> +.Lslaunch_proto:
> +        /*
> +         * Upon reaching here, CPU state mostly matches the one setup by the
> +         * bootloader with ESP, ESI and EDX being clobbered above.
> +         */
> +
> +        /* Save information that TrenchBoot slaunch was used. */
> +        movb    $1, sym_esi(slaunch_active)
> +
> +        /*
> +         * Prepare space for output parameter of slaunch_early_init(), which is
> +         * a structure of two uint32_t fields.
> +         */
> +        sub     $8, %esp

At the very least a textual reference to the struct type is needed here,
to be able to find it. Better would be to have the size calculated into
asm-offsets.h, to use a proper symbolic name here.

> +        push    %esp                             /* pointer to output structure */
> +        lea     sym_offs(__2M_rwdata_end), %ecx  /* end of target image */
> +        lea     sym_offs(_start), %edx           /* target base address */

Why LEA when this can be expressed with (shorter) MOV?

> +        mov     %esi, %eax                       /* load base address */
> +        /*
> +         * slaunch_early_init(load/eax, tgt/edx, tgt_end/ecx, ret/stk) using
> +         * fastcall calling convention.
> +         */
> +        call    slaunch_early_init
> +        add     $4, %esp                         /* pop the fourth parameter */
> +
> +        /* Move outputs of slaunch_early_init() from stack into registers. */
> +        pop     %eax  /* physical MBI address */
> +        pop     %edx  /* physical SLRT address */
> +
> +        /* Save physical address of SLRT for C code. */
> +        mov     %edx, sym_esi(slaunch_slrt)

Why go through %edx?

> +        /* Store MBI address in EBX where MB2 code expects it. */
> +        mov     %eax, %ebx

Why go through %eax?

> --- /dev/null
> +++ b/xen/arch/x86/boot/slaunch-early.c
> @@ -0,0 +1,41 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * Copyright (c) 2022-2025 3mdeb Sp. z o.o. All rights reserved.
> + */
> +
> +#include <xen/slr-table.h>
> +#include <xen/types.h>
> +#include <asm/intel-txt.h>
> +
> +struct early_init_results
> +{
> +    uint32_t mbi_pa;
> +    uint32_t slrt_pa;
> +} __packed;

Why __packed?

> +void asmlinkage slaunch_early_init(uint32_t load_base_addr,

__init ?

> +                                   uint32_t tgt_base_addr,
> +                                   uint32_t tgt_end_addr,
> +                                   struct early_init_results *result)
> +{
> +    void *txt_heap;
> +    const struct txt_os_mle_data *os_mle;
> +    const struct slr_table *slrt;
> +    const struct slr_entry_intel_info *intel_info;
> +
> +    txt_heap = txt_init();
> +    os_mle = txt_os_mle_data_start(txt_heap);
> +
> +    result->slrt_pa = os_mle->slrt;
> +    result->mbi_pa = 0;
> +
> +    slrt = (const struct slr_table *)(uintptr_t)os_mle->slrt;

I think the cast to uintptr_t wants omitting here. This is 32-bit code, and
hence the conversion to a pointer ought to go fine without. Or else you're
silently discarding bits in the earlier assignment to ->slrt_pa.

> +    intel_info = (const struct slr_entry_intel_info *)
> +        slr_next_entry_by_tag(slrt, NULL, SLR_ENTRY_INTEL_INFO);
> +    if ( intel_info == NULL || intel_info->hdr.size != sizeof(*intel_info) )
> +        return;

This size check is best effort only, isn't it? Or else how do you know
->hdr.size is actually within bounds? Further in txt_init() you use less-
than checks; why more relaxed there and more strict here?

> --- a/xen/arch/x86/include/asm/intel-txt.h
> +++ b/xen/arch/x86/include/asm/intel-txt.h
> @@ -292,6 +292,22 @@ static inline void *txt_sinit_mle_data_start(const void *heap)
>             sizeof(uint64_t);
>  }
>  
> +static inline void *txt_init(void)

__init ?

> --- /dev/null
> +++ b/xen/arch/x86/include/asm/slaunch.h
> @@ -0,0 +1,26 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * Copyright (c) 2022-2025 3mdeb Sp. z o.o. All rights reserved.
> + */
> +
> +#ifndef X86_SLAUNCH_H
> +#define X86_SLAUNCH_H
> +
> +#include <xen/types.h>
> +
> +/* Indicates an active Secure Launch boot. */
> +extern bool slaunch_active;
> +
> +/*
> + * Holds physical address of SLRT.  Use slaunch_get_slrt() to access SLRT
> + * instead of mapping where this points to.
> + */
> +extern uint32_t slaunch_slrt;
> +
> +/*
> + * Retrieves pointer to SLRT.  Checks table's validity and maps it as necessary.
> + */
> +struct slr_table *slaunch_get_slrt(void);

There's no definition of this here, nor a use. Why is this living in this
patch? Misra objects to declarations without definitions, and you want to
be prepared that such a large series may go in piece by piece. Hence there
may not be new Misra violations at any patch boundary.

> --- /dev/null
> +++ b/xen/arch/x86/slaunch.c
> @@ -0,0 +1,27 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + *
> + * Copyright (c) 2022-2025 3mdeb Sp. z o.o. All rights reserved.
> + */
> +
> +#include <xen/compiler.h>
> +#include <xen/init.h>
> +#include <xen/macros.h>
> +#include <xen/types.h>

Looks like all you need here is xen/stdint.h?

> +#include <asm/slaunch.h>

We try to move to there being blanks lines between groups of #include-s,
e.g. all xen/ ones separated from all asm/ ones.

> +/*
> + * These variables are assigned to by the code near Xen's entry point.
> + *
> + * slaunch_active is not __initdata to allow checking for an active Secure
> + * Launch boot.
> + */
> +bool slaunch_active;

Not using __initdata is quite plausible, but why not __ro_after_init?

> +uint32_t __initdata slaunch_slrt; /* physical address */
> +
> +/* Using slaunch_active in head.S assumes it's a single byte in size, so enforce
> + * this assumption. */

Please follow comment style as per ./CODING_STYLE.

Jan

