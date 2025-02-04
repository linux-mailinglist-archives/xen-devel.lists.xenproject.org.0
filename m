Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F887A2709D
	for <lists+xen-devel@lfdr.de>; Tue,  4 Feb 2025 12:47:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.881371.1291508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfHOl-0000hd-0p; Tue, 04 Feb 2025 11:47:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 881371.1291508; Tue, 04 Feb 2025 11:47:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfHOk-0000fD-Tv; Tue, 04 Feb 2025 11:47:22 +0000
Received: by outflank-mailman (input) for mailman id 881371;
 Tue, 04 Feb 2025 11:47:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yELw=U3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tfHOj-0000f7-81
 for xen-devel@lists.xenproject.org; Tue, 04 Feb 2025 11:47:21 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9bd0bc0-e2ed-11ef-99a4-01e77a169b0f;
 Tue, 04 Feb 2025 12:47:19 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-aaf3c3c104fso1062303766b.1
 for <xen-devel@lists.xenproject.org>; Tue, 04 Feb 2025 03:47:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e4a3233csm912752066b.148.2025.02.04.03.47.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Feb 2025 03:47:18 -0800 (PST)
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
X-Inumbo-ID: c9bd0bc0-e2ed-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738669638; x=1739274438; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tE5AqYBbVaUKaH9VR1aHjz9GTiPuycfy/zQHCXUD7jo=;
        b=bGIq4dsT5va5q2E4RNBx9J62bdt32CcBJR0JjQvwhirqLakGyNminIV7lmTG7FC/TX
         W1FLP1MWMDhAY/2kndjxqFEKgYy1pxV4yE9EmSXjTIddZTjwAQFTK7bswnqgKlC37w1I
         8YXD1fAaEeurq0KqKfTIkCaRid6Q49I+P24dSE+B6PQm6CSgH/oudat4PEU8JzTIrqyh
         6rH1Kz9hGSjXp2Og0UGzWhN13tVyOQoc/CKeqZ31Dfmy/bVNZk12ApfrPUvItcQ7K8Vn
         VL0wZHx08DPDwGkwnYqrndABZFIXoYZ+xjA0T/oCi1pMlI3szdCNvokUUb0y7JRg38vi
         6mbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738669638; x=1739274438;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tE5AqYBbVaUKaH9VR1aHjz9GTiPuycfy/zQHCXUD7jo=;
        b=BC/C5+YBjkRsFY0hDzOnbYICco/dP7pbWN27Evwbqr4DTG51cnm7C+0gL+AFWyysyA
         SQvVe7OoVELPKEgxAy1uWIqXGWpcv5uZnNUa5TVTZfCo4bqxJ5TD0h5ezD7Py1gwdI/s
         2mZtW2wHJ987XUs5pN9RGk2zjWY1BDYliF1jBOij7fN2jg3VNe086JQP1MXbYz9RKlYZ
         tVl1NnwLkIwo1KmF7zqlUCt63PT1OQprLgrYKEf6woIBPFVq2+xrw+4mfwx8xJm0F0xV
         VldcuYB4MlsX8Ww0SOKA/U14AhhWlr91jHJXUrklR1Ee9taIgmlqa8S4GsGeYgfSsr+5
         u87g==
X-Forwarded-Encrypted: i=1; AJvYcCVhhMGgN9qReYgq6S15kpZahs8/sMmrw3xJ4IzXubo90JC5KyBdOAFlOT+Id8mtzytU1H9pVqmklQU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwpK4rjfSLWAjgD7UE/BVBVisZqROL2CoSoDUTQ9kz726Y7BSRq
	WzvX0kkNvklIx4fbTybwWo/yndlCmEdgigdd/r15EzkQlwShOeJqspsUM0Z1iA==
X-Gm-Gg: ASbGncspDfR5vTZEA8boNNxPlBbxzcOW6EedmSNrVF5semabO7yuuei6E3Pwhn8Kytr
	2kTRU/R90Mw2WGunVCV5t5B0+3Ts2tSakorZd4O1nFXJqCfNzc9+qa+QKMmqSRS1TZHG8zHOYQG
	rdl5JvxuDnGvMDryJA1posvxhR2IJtZP3fvXUFmCW3NUEmwZpIV0miNSYlHRXcr2jkBXv/SA+KO
	hmCUQqGWdzsiqbXOZupPEwgg8eOUmBzc5X4Wyu92MWTJEQr9bLTiTSKJLVIET4Dzr/yKmZXiixe
	Ohn17N3QdLv+H2u8qglyIONC1ShWyh9g1KsqRu71qy+ZVjCAJnO5zrmInM1dB1sMK8ySHtlRV01
	x
X-Google-Smtp-Source: AGHT+IEsaEvhzS0wXu5IopURZnVfp8MFxqo3XHBCWp6S3Zo8oneSxE5N+4YGwlgvGxU8aNzhcrH2Og==
X-Received: by 2002:a17:907:3d8b:b0:ab7:d6c:5781 with SMTP id a640c23a62f3a-ab70d6c57b7mr1363490266b.24.1738669638496;
        Tue, 04 Feb 2025 03:47:18 -0800 (PST)
Message-ID: <ab7077b3-6bef-4025-9389-345a345a141c@suse.com>
Date: Tue, 4 Feb 2025 12:47:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for 4-21 v4] xen/riscv: identify specific ISA supported by
 cpu
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <a63c60c7a97a2b361e3a41f57bed61c0c9a0a89f.1738653407.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <a63c60c7a97a2b361e3a41f57bed61c0c9a0a89f.1738653407.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.02.2025 08:20, Oleksii Kurochko wrote:
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
> +    RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
> +    RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
> +};
> +
> +static const struct riscv_isa_ext_data __initconst required_extensions[] = {
> +    RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
> +    RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> +    RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
> +};

Coming back to my earlier question regarding the B (pseudo-)extension:
Since riscv_isa_ext[] only contains Zbb, is it precluded anywhere in
the spec that DT may mention just B when all of its constituents are
supported?

Which gets me on to G, which is somewhat similar in nature to B. We
require G when RISCV_ISA_RV64G=y, yet required_extensions[] doesn't
name it or its constituents. Much like we require C when RISCV_ISA_C=y,
yet it's not in the table.

> +static bool is_lowercase_extension_name(const char *str)
> +{
> +    /*
> +     * `str` could contain full riscv,isa string from device tree so one
> +     * of the stop condionitions is checking for '_' as extensions are

Nit: conditions

> +     * separated by '_'.
> +     */
> +    for ( unsigned int i = 0; (str[i] != '\0') && (str[i] != '_'); i++ )
> +        if ( !isdigit(str[i]) && !islower(str[i]) )
> +            return false;
> +
> +    return true;
> +}
> +
> +static void __init match_isa_ext(const char *name, const char *name_end,
> +                                 unsigned long *bitmap)
> +{
> +    const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
> +
> +    for ( unsigned int i = 0; i < riscv_isa_ext_count; i++ )
> +    {
> +        const struct riscv_isa_ext_data *ext = &riscv_isa_ext[i];
> +
> +        /*
> +         * `ext->name` (according to initialization of riscv_isa_ext[]
> +         * elements) must be all in lowercase.
> +         */
> +        ASSERT(is_lowercase_extension_name(ext->name));
> +
> +        if ( (name_end - name == strlen(ext->name)) &&
> +             !strncmp(name, ext->name, name_end - name) )

memcmp() is generally more efficient, as it doesn't need to check for
a nul terminator.

> +        {
> +            __set_bit(ext->id, bitmap);
> +            break;
> +        }
> +    }
> +}
> +
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
> +            printk_once("Vendor extensions are ignored in riscv,isa\n");
> +            /*
> +             * To skip an extension, we find its end.
> +             * As multi-letter extensions must be split from other multi-letter
> +             * extensions with an "_", the end of a multi-letter extension will
> +             * either be the null character or the "_" at the start of the next
> +             * multi-letter extension.
> +             */
> +            for ( ; *isa && *isa != '_'; ++isa )
> +                ;
> +            ext_err = true;
> +            break;

I was wondering why ext_end isn't updated here. Looks like that's because
ext_err is set to true, and the checking below the switch looks at ext_err
first. That's technically fine, but - to me at least - a little confusing.
Could setting ext_end to NULL take the role of ext_err? For the code here
this would then immediately clarify why ext_end isn't otherwise maintained.
(The "err" in the name is also somewhat odd: The log message above says
"ignored", and that's what the code below also does. There's nothing
error-ish in here; in fact there may be nothing wrong about the specific
vendor extension we're ignoring.)

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
> +                ext_err = true;
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
> +                    ext_err = true;
> +
> +            ext_end = isa;
> +            if ( unlikely(ext_err) )
> +                break;

This, otoh, is an error. Which probably shouldn't go silently.

Considering the earlier remark, ext_end would then perhaps also be more
logical to update after the above if().

> +            if ( !isdigit(ext_end[-1]) )
> +                break;
> +
> +            while ( isdigit(*--ext_end) )
> +                ;
> +
> +            if ( tolower(ext_end[0]) != 'p' || !isdigit(ext_end[-1]) )

Leftover tolower()?

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
> +        default:
> +            /*
> +             * Things are a little easier for single-letter extensions, as they
> +             * are parsed forwards.
> +             *
> +             * After checking that our starting position is valid, we need to
> +             * ensure that, when isa was incremented at the start of the loop,
> +             * that it arrived at the start of the next extension.
> +             *
> +             * If we are already on a non-digit, there is nothing to do. Either
> +             * we have a multi-letter extension's _, or the start of an
> +             * extension.
> +             *
> +             * Otherwise we have found the current extension's major version
> +             * number. Parse past it, and a subsequent p/minor version number
> +             * if present. The `p` extension must not appear immediately after
> +             * a number, so there is no fear of missing it.
> +             */
> +            if ( unlikely(!isalpha(*ext)) )
> +            {
> +                ext_err = true;
> +                break;
> +            }

Like above this also looks to be a situation that maybe better would be
left go entirely silently. I even wonder whether you can safely continue
the parsing in that case: How do you know whether what follows is indeed
the start of an extension name?

> +static void __init riscv_fill_hwcap_from_isa_string(void)
> +{
> +    const struct dt_device_node *cpus = dt_find_node_by_path("/cpus");
> +    const struct dt_device_node *cpu;
> +
> +    if ( !cpus )
> +    {
> +        printk("Missing /cpus node in the device tree?\n");
> +        return;
> +    }
> +
> +    dt_for_each_child_node(cpus, cpu)
> +    {
> +        DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
> +        const char *isa;
> +        unsigned long cpuid;
> +
> +        if ( !dt_device_type_is_equal(cpu, "cpu") )
> +            continue;
> +
> +        if ( dt_get_cpuid_from_node(cpu, &cpuid) < 0 )
> +            continue;
> +
> +        if ( dt_property_read_string(cpu, "riscv,isa", &isa) )
> +        {
> +            printk("Unable to find \"riscv,isa\" devicetree entry "
> +                   "for DT's cpu%ld node\n", cpuid);
> +            continue;
> +        }
> +
> +        for ( unsigned int i = 0; (isa[i] != '\0'); i++ )
> +            if ( !isdigit(isa[i]) && (isa[i] != '_') && !islower(isa[i]) )
> +                panic("According to DT binding riscv,isa must be lowercase\n");
> +
> +        riscv_isa_parse_string(isa, this_isa);
> +
> +        /*
> +         * In the unpriv. spec is mentioned:
> +         *   A RISC-V ISA is defined as a base integer ISA, which must be
> +         *   present in any implementation, plus optional extensions to
> +         *   the base ISA.
> +         * What means that isa should contain, at least, I or E thereby
> +         * this_isa can't be empty too.
> +         *
> +         * Ensure that this_isa is not empty, so riscv_isa won't be empty
> +         * during initialization. This prevents ending up with extensions
> +         * not supported by one of the CPUs.
> +         */
> +        ASSERT(!bitmap_empty(this_isa, RISCV_ISA_EXT_MAX));

This is again an assertion on input we consume. Afaict it would actually
trigger not only on all kinds of invalid inputs, but on something valid
like "rv32e".

> +void __init riscv_fill_hwcap(void)
> +{
> +    unsigned int i;
> +    size_t req_extns_amount = ARRAY_SIZE(required_extensions);

Imo if you really want such a local "variable", it would better be const.

Jan

