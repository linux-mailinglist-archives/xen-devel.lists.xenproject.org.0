Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A59A3BC65
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 12:06:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892675.1301636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkhtz-0005Rv-4g; Wed, 19 Feb 2025 11:06:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892675.1301636; Wed, 19 Feb 2025 11:06:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkhtz-0005QQ-1S; Wed, 19 Feb 2025 11:06:03 +0000
Received: by outflank-mailman (input) for mailman id 892675;
 Wed, 19 Feb 2025 11:06:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EceQ=VK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tkhty-0004p6-0G
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 11:06:02 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80d8f0d7-eeb1-11ef-9aa8-95dc52dad729;
 Wed, 19 Feb 2025 12:06:01 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-abb79af88afso742531566b.1
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 03:06:01 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb978e2c9dsm605615866b.65.2025.02.19.03.05.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Feb 2025 03:06:00 -0800 (PST)
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
X-Inumbo-ID: 80d8f0d7-eeb1-11ef-9aa8-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739963160; x=1740567960; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v2+1lCsmLlAghm4OPxcl1LkLd5EV5z/M5o3igrrNvx0=;
        b=QCqgIMEMHTuclwP4zA5xXa7e2Yr97G/wCfy/KWMEDMI1AH9gn9c7kwF8YPZC9KOwAU
         rxUmTz8XPTrMccfxkHq08dSB76eMSrAGHEfLCJjI+QzSaSXSf9IYCd62Fk1m6cfOetXP
         Lnsq8o149qf960ykV4EKxGE1idtwAgvnd6Tt8oAi54Ai+7sAuVGIUqCzu0MsDW8U7QYY
         /iYjbw+Q6rGbb1agL0zRQ6ntkJBLWl1D9g0DBgDEktFt/Hdhntd8t3Q0IrOXIqJc+w/k
         leKRPmyoDMgsclteo2dGHK2+IfBzxhTiN/7eik59seaI3etLfC0ACDqg3ruJZDp3LQJO
         nntw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739963160; x=1740567960;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v2+1lCsmLlAghm4OPxcl1LkLd5EV5z/M5o3igrrNvx0=;
        b=Uwc7+EMGf6H1gDqk2n357LfM8M5/M9sDeq7LMbWNvzCKDeFH0xezfJdJlbJnx9baj5
         QH5agtVamrxCseAuIDc9/Cb/7dtZZha8S9vDyQKsUq2XPBqpDcqpNXn9i982CHN1Bfig
         fCPMNOR9EP7CmCt3XwtuBay8giEaK14zm8PnU5Y8F9yAUJ208uqAdWetmr+ZzbY8x77M
         KpzM+g249/BPZv+ILugGBlOaffMPVWmDpU94e/Q9sZsoYDu18DJKsTXXF/zXGFoiiXhL
         N0L1zAjhmesNG9s+VQoGZnnwe2Pt2gTQOo0GCB8HheMN5oH8S3JULSPNRbWjFD+ZhjuZ
         urtA==
X-Forwarded-Encrypted: i=1; AJvYcCUZLxXkFFsAX/eFpqY4itJZWcamYDEqEqwKSPNQ4AJeaJa1lC0TYNtTMG+8M7jJs3eJxPHIuL+Js6g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyWP7ifWlfa/ZNZJzDDhFpJzGPVYhkmOPRunTe+Z61vUTaKZq6j
	01gZuGQAB/VACKlZJct+D4e2RTD5c2/tsOoTHR9pWnuLeM5OaMw5WGIIjLNT5g==
X-Gm-Gg: ASbGncus2Eztu2dfe77DIO+lTeUQpbtC4YpVXlpddc0jk+raGK4KosyDzlMY8+nA/Qn
	7dleeY0syaUggLcY9uk571rhxXPHi2qrZC6h+oOSb7ohKTgSmnjCGO8qpoI7GnPmIY0/TchYpyZ
	GNnqmQlzvjcv4cQeELU8zRuvkT/8dpmRanYmOS2hyAtPaZg+Q/l9oQKBzVTg1J6tSA3NfkkVryB
	616qyD2RNQAlofJNV3nAe9MSA5FSJiH+UPqKeOaF+ei8fN4JtmkcEUHRHh5yEx9aRGGxXrjLkEd
	X58bXhqsmVJnMvQdaTXoLBpyt71VElod+qiIL8Zp3DxdEeimEX2JE25Opwme0W7j5VEoNLODk+A
	Q
X-Google-Smtp-Source: AGHT+IG3LDOvS065Q/w6Yn70qCR/Hr3aRlxhrekRJQHoiQQXv1Ib4qtBloSc/1TgfRBhcXpwWdSn1w==
X-Received: by 2002:a17:906:dc8e:b0:ab7:aaf2:f7f9 with SMTP id a640c23a62f3a-abb70de28d4mr1901901566b.42.1739963160458;
        Wed, 19 Feb 2025 03:06:00 -0800 (PST)
Message-ID: <51a514cc-3247-4c0d-bc16-821c251c416d@suse.com>
Date: Wed, 19 Feb 2025 12:05:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.21 v6 2/2] xen/riscv: identify specific ISA
 supported by cpu
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1739355004.git.oleksii.kurochko@gmail.com>
 <8aa59f23aa5ef551344f75889b6cf3d871e35278.1739355004.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <8aa59f23aa5ef551344f75889b6cf3d871e35278.1739355004.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.02.2025 17:50, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/cpufeature.c
> @@ -0,0 +1,502 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Originally taken for Linux kernel v6.12-rc3.
> + *
> + * Copyright (C) 2015 ARM Ltd.
> + * Copyright (C) 2017 SiFive
> + * Copyright (C) 2024 Vates
> + */
> +
> +#include <xen/bitmap.h>
> +#include <xen/ctype.h>
> +#include <xen/device_tree.h>
> +#include <xen/errno.h>
> +#include <xen/init.h>
> +#include <xen/lib.h>
> +#include <xen/sections.h>
> +
> +#include <asm/cpufeature.h>
> +
> +#ifdef CONFIG_ACPI
> +# error "cpufeature.c functions should be updated to support ACPI"
> +#endif
> +
> +struct riscv_isa_ext_data {
> +    unsigned int id;
> +    const char *name;
> +};
> +
> +#define RISCV_ISA_EXT_DATA(ext_name)            \
> +{                                               \
> +    .id = RISCV_ISA_EXT_##ext_name,             \

Nit: ## being a binary operator (just for the pre-processor) we prefer
it, too, to be framed by blanks.

> +/*
> + * The canonical order of ISA extension names in the ISA string is defined in
> + * chapter 27 of the unprivileged specification.
> + *
> + * The specification uses vague wording, such as should, when it comes to
> + * ordering, so for our purposes the following rules apply:
> + *
> + * 1. All multi-letter extensions must be separated from other extensions by an
> + *    underscore.
> + *
> + * 2. Additional standard extensions (starting with 'Z') must be sorted after
> + *    single-letter extensions and before any higher-privileged extensions.
> + *
> + * 3. The first letter following the 'Z' conventionally indicates the most
> + *    closely related alphabetical extension category, IMAFDQLCBKJTPVH.
> + *    If multiple 'Z' extensions are named, they must be ordered first by
> + *    category, then alphabetically within a category.
> + *
> + * 4. Standard supervisor-level extensions (starting with 'S') must be listed
> + *    after standard unprivileged extensions.  If multiple supervisor-level
> + *    extensions are listed, they must be ordered alphabetically.
> + *
> + * 5. Standard machine-level extensions (starting with 'Zxm') must be listed
> + *    after any lower-privileged, standard extensions.  If multiple
> + *    machine-level extensions are listed, they must be ordered
> + *    alphabetically.
> + *
> + * 6. Non-standard extensions (starting with 'X') must be listed after all
> + *    standard extensions. If multiple non-standard extensions are listed, they
> + *    must be ordered alphabetically.
> + *
> + * An example string following the order is:
> + *    rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
> + *
> + * New entries to this struct should follow the ordering rules described above.
> + *
> + * Extension name must be all lowercase (according to device-tree binding)
> + * and strncmp() is used in match_isa_ext() to compare extension names instead
> + * of strncasecmp().
> + */
> +const struct riscv_isa_ext_data __initconst riscv_isa_ext[] = {
> +    RISCV_ISA_EXT_DATA(i),
> +    RISCV_ISA_EXT_DATA(m),
> +    RISCV_ISA_EXT_DATA(a),
> +    RISCV_ISA_EXT_DATA(f),
> +    RISCV_ISA_EXT_DATA(d),
> +    RISCV_ISA_EXT_DATA(q),
> +    RISCV_ISA_EXT_DATA(c),
> +    RISCV_ISA_EXT_DATA(h),
> +    RISCV_ISA_EXT_DATA(zicntr),
> +    RISCV_ISA_EXT_DATA(zicsr),
> +    RISCV_ISA_EXT_DATA(zifencei),
> +    RISCV_ISA_EXT_DATA(zihintpause),
> +    RISCV_ISA_EXT_DATA(zihpm),
> +    RISCV_ISA_EXT_DATA(zbb),

No Zba and Zbs here, despite there now being enumerators for them?

> +static int __init riscv_isa_parse_string(const char *isa,
> +                                         unsigned long *out_bitmap)
> +{
> +    if ( (isa[0] != 'r') && (isa[1] != 'v') )
> +        return -EINVAL;
> +
> +#if defined(CONFIG_RISCV_32)
> +    if ( isa[2] != '3' && isa[3] != '2' )
> +        return -EINVAL;
> +#elif defined(CONFIG_RISCV_64)
> +    if ( isa[2] != '6' && isa[3] != '4' )
> +        return -EINVAL;
> +#else
> +# error "unsupported RISC-V bitness"
> +#endif
> +
> +    /*
> +     * In unpriv. specification (*_20240411) is mentioned the following:
> +     * (1) A RISC-V ISA is defined as a base integer ISA, which must be
> +     *     present in any implementation, plus optional extensions to
> +     *     the base ISA.
> +     * (2) Chapter 6 describes the RV32E and RV64E subset variants of
> +     *     the RV32I or RV64I base instruction sets respectively, which
> +     *     have been added to support small microcontrollers, and which
> +     *     have half the number of integer registers.
> +     *
> +     * What means that isa should contain, at least, I or E.
> +     *
> +     * As Xen isn't expected to be run on microcontrollers and according
> +     * to device tree binding the first extension should be "i".
> +     */
> +    if ( isa[4] != 'i' )
> +        return -EINVAL;
> +
> +    isa += 4;
> +
> +    while ( *isa )
> +    {
> +        const char *ext = isa++;
> +        const char *ext_end = isa;
> +
> +        switch ( *ext )
> +        {
> +        case 'x':
> +            printk_once("Vendor extensions are ignored in riscv,isa\n");
> +            /*
> +             * To skip an extension, we find its end.
> +             * As multi-letter extensions must be split from other multi-letter
> +             * extensions with an "_", the end of a multi-letter extension will
> +             * either be the null character or the "_" at the start of the next
> +             * multi-letter extension.
> +             */
> +            for ( ; *isa && *isa != '_'; ++isa )
> +                if ( unlikely(!isalnum(*isa)) )
> +                    goto riscv_isa_parse_string_err;
> +
> +            ext_end = NULL;
> +            break;
> +
> +        case 's':
> +            /*
> +             * Workaround for invalid single-letter 's' & 'u' (QEMU):
> +             *   Before QEMU 7.1 it was an issue with misa to ISA string
> +             *   conversion:
> +             *     https://patchwork.kernel.org/project/qemu-devel/patch/dee09d708405075420b29115c1e9e87910b8da55.1648270894.git.research_trasio@irq.a4lg.com/#24792587
> +             *   Additional details of the workaround on Linux kernel side:
> +             *     https://lore.kernel.org/linux-riscv/ae93358e-e117-b43d-faad-772c529f846c@irq.a4lg.com/#t
> +             *
> +             * No need to set the bit in riscv_isa as 's' & 'u' are
> +             * not valid ISA extensions. It works unless the first
> +             * multi-letter extension in the ISA string begins with
> +             * "Su" and is not prefixed with an underscore.
> +             */
> +            if ( ext[-1] != '_' && ext[1] == 'u' )
> +            {
> +                ++isa;
> +                ext_end = NULL;
> +                break;
> +            }
> +            fallthrough;
> +        case 'z':
> +            /*
> +             * Before attempting to parse the extension itself, we find its end.
> +             * As multi-letter extensions must be split from other multi-letter
> +             * extensions with an "_", the end of a multi-letter extension will
> +             * either be the null character or the "_" at the start of the next
> +             * multi-letter extension.
> +             *
> +             * Next, as the extensions version is currently ignored, we
> +             * eliminate that portion. This is done by parsing backwards from
> +             * the end of the extension, removing any numbers. This may be a
> +             * major or minor number however, so the process is repeated if a
> +             * minor number was found.
> +             *
> +             * ext_end is intended to represent the first character *after* the
> +             * name portion of an extension, but will be decremented to the last
> +             * character itself while eliminating the extensions version number.
> +             * A simple re-increment solves this problem.
> +             */
> +            for ( ; *isa && *isa != '_'; ++isa )
> +                if ( unlikely(!isalnum(*isa)) )
> +                    goto riscv_isa_parse_string_err;
> +
> +            ext_end = isa;
> +
> +            if ( !isdigit(ext_end[-1]) )
> +                break;
> +
> +            while ( isdigit(*--ext_end) )
> +                ;
> +
> +            if ( ext_end[0] != 'p' || !isdigit(ext_end[-1]) )
> +            {
> +                ++ext_end;
> +                break;
> +            }
> +
> +            while ( isdigit(*--ext_end) )
> +                ;
> +
> +            ++ext_end;
> +            break;
> +
> +        /*
> +         * if someone mentioned `b` extension in riscv,isa instead of Zb{a,b,s}
> +         * explicitly then set bits exlicitly in out_bitmap to satisfy
> +         * requirement of Zbb (mentioned in required_extensions[]).
> +         */

Nit (style): Comments want to start with a captial letter.

With the two nits addressed and the Zba/Zbs question sorted (all
adjustments could be done while committing, albeit the disposition of
patch 1 isn't clear yet, so a v7 may be needed anyway):
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

