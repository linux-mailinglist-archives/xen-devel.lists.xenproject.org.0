Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41245A05FED
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 16:21:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867582.1279167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXsD-00022r-Me; Wed, 08 Jan 2025 15:21:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867582.1279167; Wed, 08 Jan 2025 15:21:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVXsD-00021H-JY; Wed, 08 Jan 2025 15:21:33 +0000
Received: by outflank-mailman (input) for mailman id 867582;
 Wed, 08 Jan 2025 15:21:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=svEr=UA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVXsC-0001vg-AJ
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 15:21:32 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c4b312e-cdd4-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 16:21:30 +0100 (CET)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3862d16b4f5so720079f8f.0
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 07:21:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2dc2310sm23911335e9.13.2025.01.08.07.21.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jan 2025 07:21:29 -0800 (PST)
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
X-Inumbo-ID: 3c4b312e-cdd4-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736349689; x=1736954489; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4zfBxvXy2dpxaQBoNlsiIE0F+TpUBBbW2t8DHbIKtlU=;
        b=OKJ+kmRT+hm8+BgbA+sjXUMtV9Lq1xAZRZqLheDyXB2CdTXMfkmOzMOXmZH6t6+bcE
         m9nq63Vvq71+QZVKJkQcxLwZAAD04NFp2eziq40+hy94QwE3FWqLeebxfNAfZI0dTkPf
         FyZ5066Or24VE6OIwWA0eF5k39iPHewbv6ALYdy8407Zx3ww74GCuALoJpVuGkUrZiXq
         FHUIeRxepZJFafXtGoWzHhUWIPtNpVda1Bh1xWKpocCDh4cDKOk57NY1cmMxOhoshQ7e
         i99CkibJr3AfAYpesPW8B2FYoHtxVNZQCK9XGPsahSPaQmIC+bd+yOrjOw+Dm4cTC5fQ
         GwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736349689; x=1736954489;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4zfBxvXy2dpxaQBoNlsiIE0F+TpUBBbW2t8DHbIKtlU=;
        b=bFltPjF6iBf0O2hikul+lY63Z03Jg+tRkkrejUOkyPa3siNtqZme5LGtIDPXS41h/7
         kKZ3eSmqloEJPTum/JNwkewgIyM3A3ZvJxxvDtfbOXcGkMCO/RObsDqm4cGArNY5f216
         cS/RfP8IjvZEBjUxllATpSm1vEJ1stNsMrJOUXFhfc5jQf2Bgf086VQfRAOjJrBFFafS
         yW7CJnCecFQ4AHyqH7RAn7G6RLK/muiH7idzjN2KLFU3sl5ZjrHUD1o134DPc9s1uLCF
         l4IZZ12uoQbTzSB2szktkGJ42wH0wA42QXVzP0mSCI3Ekh4/wVja1ZVUPNnwAUQlpSCB
         c9xg==
X-Forwarded-Encrypted: i=1; AJvYcCXp2ljYbLqwIrpA8YYNVyNnjgBr2kl4fbekrpKHWaW9IiKmrZdCR9/8GtaBj+cVi2a40VTz+fFlt8A=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz3F0R9l886AobdbBpNKBPV1b6spZZdFGM5WCtOdfKWQUgb3SXX
	0m7PcW24jsoFpWFDvoGaZq7eryEXUDZZqAJgZ7uyYJY5i8/kassHkC7eCT01wA==
X-Gm-Gg: ASbGncsSViJ8ojSMD8fi3rH+lLaKy7W9lQR57JosD5iRCKYXuc0c8fPmZB5KR1G1eUg
	MmtVA2hl7m36V6va73Le1YN4S3VsTwYWixHcBY5GequSjdpoerCIdC3D41+CKdgQSaCJ7zY5ayv
	SPth3RNQ/9JXre5HKY6GWQBj2KGZ20LPy4j16PYE8n85MZIh0yYQ/BHPzgdNIZuRGnE6izevDwA
	lKEiiMc6rBWJx7HpHNJJVokqwcD8IVQ63eery8QyyCVityCTG9gWPxQLP8LQ9AtUYapbqhExJWE
	R9j4pEKl8jj0p1CbIirBWZbF2Ja5a5V02AJcKCQYWg==
X-Google-Smtp-Source: AGHT+IE998HtHxkrozL+jYB3zX+QrUEmogr9pRIdsTMw/sGrFWR1H9TY+DyiNEqiz4tV+JMIRQpplQ==
X-Received: by 2002:a5d:59ac:0:b0:386:3958:2ec5 with SMTP id ffacd0b85a97d-38a792449a2mr5211615f8f.28.1736349689345;
        Wed, 08 Jan 2025 07:21:29 -0800 (PST)
Message-ID: <bc636259-5586-428c-8a57-f97ba16a14b8@suse.com>
Date: Wed, 8 Jan 2025 16:21:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4.21 v1 1/1] xen/riscv: identify specific ISA
 supported by cpu
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1734957957.git.oleksii.kurochko@gmail.com>
 <ee14c485c6c6402a2d1706278b21bf3fcf821af9.1734957957.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <ee14c485c6c6402a2d1706278b21bf3fcf821af9.1734957957.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.12.2024 13:55, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/cpufeature.c
> @@ -0,0 +1,466 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Taken for Linux kernel v6.12-rc3 and modified by
> + * Oleksii Kurochko <oleksii.kurochko@gmail.com>:
> + *
> + * - Drop unconditional setting of {RISCV_ISA_EXT_ZICSR,
> + *   RISCV_ISA_EXT_ZIFENCEI, RISCV_ISA_EXT_ZICNTR, RISCV_ISA_EXT_ZIHPM} as they
> + *   are now part of the riscv,isa string.
> + * - Remove saving of the ISA for each CPU, only the common available ISA is
> + *   saved.
> + * - Remove ACPI-related code as ACPI is not supported by Xen.
> + * - Drop handling of elf_hwcap, since Xen does not provide hwcap to
> + *   userspace.
> + * - Replace of_cpu_device_node_get() API, which is not available in Xen,
> + *   with a combination of dt_for_each_child_node(), dt_device_type_is_equal(),
> + *   and dt_get_cpuid_from_node() to retrieve cpuid and riscv,isa in
> + *   riscv_fill_hwcap_from_isa_string().
> + * - Rename arguments of __RISCV_ISA_EXT_DATA() from _name to ext_name, and
> + *   _id to ext_id for clarity.
> + * - Replace instances of __RISCV_ISA_EXT_DATA with RISCV_ISA_EXT_DATA.
> + * - Replace instances of __riscv_isa_extension_available with
> + *   riscv_isa_extension_available for consistency.
> + * - Redefine RISCV_ISA_EXT_DATA() to work only with ext_name and ext_id,
> + *   as other fields are not used in Xen currently.
> + * - Add check of first 4 letters of riscv,isa string to
> + *   riscv_isa_parse_string() as Xen doesn't do this check before so it is
> + *   necessary to check correctness of riscv,isa string. ( it should start with
> + *   rv{32,64} with taking into account upper and lower case of "rv").
> + * - Drop an argument of riscv_fill_hwcap() and riscv_fill_hwcap_from_isa_string()
> + *   as it isn't used, at the moment.
> + * - s/pr_info/printk.
> + * - Apply Xen coding style.

Having this in the patch description is sufficient imo.

> + * Copyright (C) 2015 ARM Ltd.
> + * Copyright (C) 2017 SiFive
> + * Copyright (C) 2024 Vates
> + */
> +
> +#include <xen/acpi.h>

Didn't you say you dropped the ACPI pieces?

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
> +struct riscv_isa_ext_data {
> +    const unsigned int id;
> +    const char *name;
> +};

This is odd - why would the id be const, but not the name? Thus you
require all instances of the struct to have an initializer. The more
conventional approach is to apply the const on the instances of the
structure (e.g. as you already have it for riscv_isa_ext[]). 

> +#define RISCV_ISA_EXT_DATA(ext_name, ext_id)    \
> +{                                               \
> +    .id = ext_id,                               \
> +    .name = #ext_name,                          \
> +}
> +
> +/* Host ISA bitmap */
> +static __read_mostly DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX);

Not __ro_after_init?

> +static int __init dt_get_cpuid_from_node(const struct dt_device_node *cpu)
> +{
> +    const __be32 *prop;
> +    unsigned int reg_len;
> +
> +    if ( dt_n_size_cells(cpu) != 0 )
> +        printk("cpu node `%s`: #size-cells %d\n",
> +               dt_node_full_name(cpu), dt_n_size_cells(cpu));
> +
> +    prop = dt_get_property(cpu, "reg", &reg_len);
> +    if ( !prop )
> +    {
> +        printk("cpu node `%s`: has no reg property\n", dt_node_full_name(cpu));
> +        return -EINVAL;
> +    }
> +
> +    if ( reg_len < dt_cells_to_size(dt_n_addr_cells(cpu)) )
> +    {
> +        printk("cpu node `%s`: reg property too short\n",
> +               dt_node_full_name(cpu));
> +        return -EINVAL;
> +    }
> +
> +    return dt_read_paddr(prop, dt_n_addr_cells(cpu));
> +}
> +
> +/*
> + * The canonical order of ISA extension names in the ISA string is defined in
> + * chapter 27 of the unprivileged specification.
> + *
> + * Ordinarily, for in-kernel data structures, this order is unimportant but
> + * isa_ext_arr defines the order of the ISA string in /proc/cpuinfo.

Inapplicable Linux detail? (If you want to keep it, you'll want to add
"Linux'es" and avoid mentioning something that looks like a variable
but then doesn't exist anywhere.)

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
> + * 3. Standard supervisor-level extensions (starting with 'S') must be listed
> + *    after standard unprivileged extensions.  If multiple supervisor-level
> + *    extensions are listed, they must be ordered alphabetically.

Two times "3."?

> + * 4. Standard machine-level extensions (starting with 'Zxm') must be listed
> + *    after any lower-privileged, standard extensions.  If multiple
> + *    machine-level extensions are listed, they must be ordered
> + *    alphabetically.
> + *
> + * 5. Non-standard extensions (starting with 'X') must be listed after all
> + *    standard extensions. If multiple non-standard extensions are listed, they
> + *    must be ordered alphabetically.
> + *
> + * An example string following the order is:
> + *    rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
> + *
> + * New entries to this struct should follow the ordering rules described above.
> + */
> +const struct riscv_isa_ext_data riscv_isa_ext[] = {

__initconst?

> +    RISCV_ISA_EXT_DATA(i, RISCV_ISA_EXT_i),
> +    RISCV_ISA_EXT_DATA(m, RISCV_ISA_EXT_m),
> +    RISCV_ISA_EXT_DATA(a, RISCV_ISA_EXT_a),
> +    RISCV_ISA_EXT_DATA(f, RISCV_ISA_EXT_f),
> +    RISCV_ISA_EXT_DATA(d, RISCV_ISA_EXT_d),
> +    RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
> +    RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
> +    RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
> +    RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
> +    RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
> +    RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> +    RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
> +    RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),

Isn't it kind of implied that with the presence of Zbb, B should also be
present?

> +    RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
> +    RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
> +};

Wouldn't the Z and S prefixes better be recorded in upper case here?

> +static const struct riscv_isa_ext_data required_extensions[] = {

__initconst again?

> +    RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
> +    RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> +};
> +
> +static const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);

Is this variable really useful to have?

> +static void __init match_isa_ext(const char *name, const char *name_end, unsigned long *bitmap)

Overly long line.

> +{
> +    for ( int i = 0; i < riscv_isa_ext_count; i++ )

unsigned int

> +    {
> +        const struct riscv_isa_ext_data *ext = &riscv_isa_ext[i];
> +
> +        if ( (name_end - name == strlen(ext->name)) &&
> +             !strncasecmp(name, ext->name, name_end - name) )

Does this really need to be a case-insensitive comparison?

> +        {
> +            set_bit(ext->id, bitmap);

No need for atomicity, I suppose (i.e. __set_bit()).

> +            break;
> +        }
> +    }
> +}
> +
> +static int __init riscv_isa_parse_string(const char *isa, unsigned long *out_bitmap)
> +{
> +    if ( isa[0] != 'r' && isa[0] != 'R' )
> +        return -EINVAL;
> +
> +    if ( isa[1] != 'v' && isa[1] != 'V' )
> +        return -EINVAL;
> +
> +    if ( isa[2] != '3' && isa[3] != '2' &&
> +         isa[2] != '6' && isa[3] != '4' )
> +        return -EINVAL;

Any reason to accept the (respectively, depending on configuration) wrong
bitness? Or to accept e.g. RV34?

> +    isa += 4;
> +
> +    while ( *isa )
> +    {
> +        const char *ext = isa++;
> +        const char *ext_end = isa;
> +        bool ext_err = false;
> +
> +        switch ( *ext )
> +        {
> +        case 'x':
> +        case 'X':
> +            if ( acpi_disabled )
> +                printk_once("Vendor extensions are ignored in riscv,isa."
> +                            "Use riscv,isa-extensions instead\n");

How's this connected to ACPI? The more that you said there's nothing
ACPI-ish left.

> +            /*
> +             * To skip an extension, we find its end.
> +             * As multi-letter extensions must be split from other multi-letter
> +             * extensions with an "_", the end of a multi-letter extension will
> +             * either be the null character or the "_" at the start of the next
> +             * multi-letter extension.
> +             */
> +            for ( ; *isa && *isa != '_'; ++isa)
> +                ;
> +            ext_err = true;
> +            break;
> +        case 's':

Blank lines please between non-fall-through case blocks.

> +            /*
> +             * Workaround for invalid single-letter 's' & 'u' (QEMU).
> +             * No need to set the bit in riscv_isa as 's' & 'u' are
> +             * not valid ISA extensions. It works unless the first
> +             * multi-letter extension in the ISA string begins with
> +             * "Su" and is not prefixed with an underscore.
> +             */
> +            if ( ext[-1] != '_' && ext[1] == 'u' )
> +            {
> +                ++isa;
> +                ext_err = true;
> +                break;
> +            }

I'm afraid I don't understand this; the comment raises more questions
than it answers.

> +static int __init riscv_fill_hwcap_from_ext_list(void)
> +{
> +    const struct dt_device_node *cpus = dt_find_node_by_path("/cpus");
> +    const struct dt_device_node *cpu;
> +
> +    if ( !cpus )
> +    {
> +        printk("Missing /cpus node in the device tree?\n");
> +        return -EINVAL;
> +    }
> +
> +    dt_for_each_child_node(cpus, cpu)
> +    {
> +        const char *isa;
> +        int cpuid = 0;

Pointless initializer.

> +        if ( !dt_device_type_is_equal(cpu, "cpu") )
> +            continue;
> +
> +        cpuid = dt_get_cpuid_from_node(cpu);
> +        if ( cpuid < 0 )
> +            continue;
> +
> +        if ( cpuid >= NR_CPUS )
> +        {
> +            printk_once("%s: dts has more cpu than NR_CPUs\n", __func__);
> +            continue;
> +        }
> +
> +        if ( dt_property_read_string(cpu, "riscv,isa-extensions", &isa) )
> +        {
> +            printk("Unable to find \"riscv,isa-extensions\" devicetree entry "
> +                   "for cpu%d\n", cpuid);
> +            continue;
> +        }
> +        else
> +            printk("riscv,isa-extensions isnt supported\n");

IOW no matter what, a message will be logged. Odd.

Also: Preferably no "else" after an if() ending in "continue".

> +    }
> +
> +    return -EOPNOTSUPP;
> +}

Hmm, this function then has no way of succeeding? Certainly requires a
comment then.

> +static void __init riscv_fill_hwcap_from_isa_string(void)
> +{
> +    const char *isa;

Like in the earlier function better limit this and ...

> +    const struct dt_device_node *cpus = dt_find_node_by_path("/cpus");
> +    const struct dt_device_node *cpu;
> +    int cpuid = 0;

... this to ...

> +    if ( !acpi_disabled )
> +        panic("%s should be updated correspondingly to support ACPI\n", __func__);
> +
> +    if ( !cpus )
> +    {
> +        printk("Missing /cpus node in the device tree?\n");
> +        return;
> +    }
> +
> +    dt_for_each_child_node(cpus, cpu)
> +    {

... the scope of this loop.

> +        DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
> +
> +        if ( !dt_device_type_is_equal(cpu, "cpu") )
> +            continue;
> +
> +        cpuid = dt_get_cpuid_from_node(cpu);
> +        if ( cpuid < 0 )
> +            continue;
> +
> +        if ( cpuid >= NR_CPUS )
> +        {
> +            printk_once("%s: dts has more cpu than NR_CPUs\n", __func__);

What's "dts"? Did the 's' mean to be in "cpus" instead? Also NR_CPUS
to avoid confusion.

> +            continue;
> +        }
> +
> +        if ( acpi_disabled )
> +        {
> +            if ( dt_property_read_string(cpu, "riscv,isa", &isa) )
> +            {
> +                printk("Unable to find \"riscv,isa\" devicetree entry\n");
> +                continue;
> +            }
> +        } else

Nit: Stlye.

> +            panic("there is no support for ACPI\n");
> +
> +        riscv_isa_parse_string(isa, this_isa);
> +
> +        if ( bitmap_empty(riscv_isa, RISCV_ISA_EXT_MAX) )
> +            bitmap_copy(riscv_isa, this_isa, RISCV_ISA_EXT_MAX);
> +        else
> +            bitmap_and(riscv_isa, riscv_isa, this_isa, RISCV_ISA_EXT_MAX);

What if the first instance had no extensions at all? You'll then copy what
the second instance say, ending up with extensions not supported by one of
the CPUs.

> +bool riscv_isa_extension_available(const unsigned long *isa_bitmap, int bit)
> +{
> +    const unsigned long *bmap = (isa_bitmap) ? isa_bitmap : riscv_isa;
> +
> +    if (bit >= RISCV_ISA_EXT_MAX)

Nit: Style.

> +        return false;
> +
> +    return test_bit(bit, bmap) ? true : false;

No conditional operator like this is needed when the return type is bool
anyway.

> +void __init riscv_fill_hwcap(void)
> +{
> +    unsigned int i;
> +    size_t req_extns_amount = ARRAY_SIZE(required_extensions);
> +    bool all_extns_available = true;
> +
> +    if ( !acpi_disabled )
> +        riscv_fill_hwcap_from_isa_string();
> +    else {

Style again.

> +        int ret = riscv_fill_hwcap_from_ext_list();
> +
> +        if ( ret )
> +        {
> +            printk("Falling back to deprecated \"riscv,isa\"\n");
> +            riscv_fill_hwcap_from_isa_string();
> +        }
> +    }
> +
> +    for ( i = 0; i < req_extns_amount; i++ )
> +    {
> +        const struct riscv_isa_ext_data ext = required_extensions[i];
> +
> +        if ( !riscv_isa_extension_available(NULL, ext.id) )
> +        {
> +            printk("Xen requires extenstion: %s\n", ext.name);

extension

> +            all_extns_available = false;
> +        }
> +    }
> +
> +    if ( !all_extns_available )
> +        panic("Look why the extenstions above are needed in booting.txt\n");

extensions

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/cpufeature.h
> @@ -0,0 +1,63 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef ASM__RISCV__CPUFEATURE_H
> +#define ASM__RISCV__CPUFEATURE_H
> +
> +#ifndef __ASSEMBLY__
> +
> +#define RISCV_ISA_EXT_a     ('a' - 'a')
> +#define RISCV_ISA_EXT_c     ('c' - 'a')
> +#define RISCV_ISA_EXT_d     ('d' - 'a')
> +#define RISCV_ISA_EXT_f     ('f' - 'a')
> +#define RISCV_ISA_EXT_h     ('h' - 'a')
> +#define RISCV_ISA_EXT_i     ('i' - 'a')
> +#define RISCV_ISA_EXT_m     ('m' - 'a')
> +#define RISCV_ISA_EXT_q     ('q' - 'a')
> +#define RISCV_ISA_EXT_v     ('v' - 'a')
> +
> +/*
> + * Increse this to higher value as kernel support more ISA extensions.
> + */
> +#define RISCV_ISA_EXT_MAX   128

What's this about? Why can't the last element of the enum below go without
this, thus not needing manual bumping here?

> +#define RISCV_ISA_EXT_SxAIA     RISCV_ISA_EXT_SSAIA

Why does this expand to RISCV_ISA_EXT_SSAIA and not RISCV_ISA_EXT_SMAIA?
(Easiest way to address: remove the #define, as it's unused. Yet if it
is to be kept, the question needs addressing, perhaps by way of a code
comment.)

> +/*
> + * These macros represent the logical IDs of each multi-letter RISC-V ISA
> + * extension and are used in the ISA bitmap. The logical IDs start from
> + * RISCV_ISA_EXT_BASE, which allows the 0-25 range to be reserved for single
> + * letter extensions. The maximum, RISCV_ISA_EXT_MAX, is defined in order
> + * to allocate the bitmap and may be increased when necessary.
> + *
> + * New extensions should just be added to the bottom, rather than added
> + * alphabetically, in order to avoid unnecessary shuffling.
> + */
> +#define RISCV_ISA_EXT_BASE  26

The comment living above this #define, it also wants wording to match
this. Specifically the text starts with describing ...

> +enum riscv_isa_ext_id {

... this enum instead (which doesn't consist of any macros).

> +    RISCV_ISA_EXT_ZICNTR = RISCV_ISA_EXT_BASE,
> +    RISCV_ISA_EXT_ZICSR,
> +    RISCV_ISA_EXT_ZIFENCEI,
> +    RISCV_ISA_EXT_ZIHINTPAUSE,
> +    RISCV_ISA_EXT_ZIHPM,
> +    RISCV_ISA_EXT_ZBB,
> +    RISCV_ISA_EXT_SMAIA,
> +    RISCV_ISA_EXT_SSAIA,
> +    RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
> +};

Why can't the single-letter RISCV_ISA_EXT_? be part of this enum as well?

> +void riscv_fill_hwcap(void);
> +
> +bool riscv_isa_extension_available(const unsigned long *isa_bitmap, int bit);

A signed bit position? Can negative values be passed in? Actually - can't
this be enum riscv_isa_ext_id anyway?

Jan

