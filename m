Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9ABA1D8A8
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 15:47:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877983.1288155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcQOT-0004KM-F5; Mon, 27 Jan 2025 14:47:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877983.1288155; Mon, 27 Jan 2025 14:47:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcQOT-0004Ib-CD; Mon, 27 Jan 2025 14:47:17 +0000
Received: by outflank-mailman (input) for mailman id 877983;
 Mon, 27 Jan 2025 14:47:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O4xJ=UT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tcQOS-0004IV-2T
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 14:47:16 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 990a370f-dcbd-11ef-a0e6-8be0dac302b0;
 Mon, 27 Jan 2025 15:47:14 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5d3d14336f0so7777323a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Jan 2025 06:47:14 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6760fc485sm593270566b.160.2025.01.27.06.47.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Jan 2025 06:47:12 -0800 (PST)
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
X-Inumbo-ID: 990a370f-dcbd-11ef-a0e6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737989234; x=1738594034; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4dN2Jf2QxKafFsTiL+n5u/HmojnBqzxm8u2EAGTVhJM=;
        b=TZCR1OX78m9WITzyi7hhcrO0Ji85UrDxavhWXHnLEFTWRlza2q+WC9MgP4GQ0z234b
         tkDklmKfeRsowqxir0qw1xm8s0g1D2scjPpGxs5L0FENTOxXnNzVqYuReigoZDW+SODe
         l5iPC2B04B71a7nDTwSBigvNRPY8ptujTWuGH15uyBDz2zU34jLn7ac78FWV+UeEb8E0
         YJhN85OGdWvCTywlYVjzBAyivhbQqzsNvAGmKqOEvu3xDOQy2Yd8kx7smWajG9BsFbcF
         vC9UkuTulngtDByYLNATiqKOllnMBJmBv4eOCQlUKd4FbocKCbHjY68dcRQf9Lwr5b8P
         HdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737989234; x=1738594034;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4dN2Jf2QxKafFsTiL+n5u/HmojnBqzxm8u2EAGTVhJM=;
        b=A53dFdLRp+fqrsMVHoyp827rbijOwwUIMote7t/rNwPOCb0lVfVKuL5x/R7RuepXgh
         D5Oa8b97ImMiL3bYpCBRNp3yoLGybgT4VYRIfHMRTGh3toRN/3birXQHjJ0qbasZdGvn
         2AQ1ltQ7Ftl9CMWk99nN2lOY2jIxuM2NuOcnsVbPOrklIH+ifwCdkPOrfFcXBhUzZFaz
         8YupgygrcvZX6DDm5OylhV4SmACpnvsGiSArkLGeXM4Igc/fjM9EeHv/dNj0ckadL5k2
         +iTBA9s0b0fhk0pjFgk/yvLQ8nTQCEOxbQKMFYO+U7NsYsjXYy94gZP1IPnFNgU7rDrL
         qehg==
X-Forwarded-Encrypted: i=1; AJvYcCXfhdt4ZuIN7RDxDomruqZkelEu91Y+mle8sE+G7U8agNY5el0ZAOW3U9fbjgz7Sq3Q7oK+4e+uN6A=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzjI2WxLCTWYoxNto8ziNqOev/5CJukJyYmsjUGGbt9PZ1WpmhQ
	BxhNCOcWoTy6ctF1k3TdfA3pZ3tE1bFixQwejW7l1oV6X8AXdSVCsd9P0hQzxg==
X-Gm-Gg: ASbGnct6c0SWkf5wxpuQC7t0l6LhJHTPusbMbQjItQtYN/CFo85vLjyrc5bjHCNO5WV
	oJRLqWp8mMNKS+9798yBzhEkEBtYz+vj/UUaB2dJNE7FvvkZcqdeRtGWUcV7quHsbIBknxooYQW
	ts4qL519zexogMb7KlUiiXVDfd8pN66wlyEE+mQihensGrvMfygHV3ozYDcyDHIbnmZQRY9wPyR
	BraaZ3jLkldU3Raf35uO8l5XDpSUGdSljozhtrV/9QFt5+FvoU5noAweu8PoQvtZ5e/nG3Vn4F6
	QTmQA7Lbp4/7CEpNo8VM2dJlJnUDqh4N3y0BxAa+/gU5EI7XDi+mpihFWDhK3liBpw==
X-Google-Smtp-Source: AGHT+IGMOeBjqaG+v1rdsY09FQzSkHWHO/l379dsRQ34yaHqbGqhayqzi+WhV6ZqE84b37Wmyw7CCw==
X-Received: by 2002:a17:906:eb18:b0:ab6:9d53:13be with SMTP id a640c23a62f3a-ab69d531682mr486298866b.29.1737989232588;
        Mon, 27 Jan 2025 06:47:12 -0800 (PST)
Message-ID: <e51b0425-568a-4a4b-b240-a5276a017a70@suse.com>
Date: Mon, 27 Jan 2025 15:47:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] xen/riscv: identify specific ISA supported by cpu
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <ddf678bb829003b2c4a0a85166a29b61e75bcea9.1737643226.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <ddf678bb829003b2c4a0a85166a29b61e75bcea9.1737643226.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.01.2025 15:46, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/cpufeature.c
> @@ -0,0 +1,482 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Taken for Linux kernel v6.12-rc3.

Nit: s/for/from/ ? Perhaps also add "Originally ...", as it'll otherwise
also go stale as changes are being made.

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
> +#error "cpufeature.c functions should be updated to support ACPI"
> +#endif
> +
> +struct riscv_isa_ext_data {
> +    unsigned int id;
> +    const char *name;
> +};
> +
> +#define RISCV_ISA_EXT_DATA(ext_name, ext_id)    \
> +{                                               \
> +    .id = ext_id,                               \
> +    .name = #ext_name,                          \
> +}
> +
> +/* Host ISA bitmap */
> +static __ro_after_init DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX);
> +
> +static int __init dt_get_cpuid_from_node(const struct dt_device_node *cpu,
> +                                         unsigned long *dt_cpuid)
> +{
> +    const __be32 *prop;
> +    unsigned int reg_len;
> +
> +    /*
> +     * For debug purpose check dt_n_size_cells(cpu) value.
> +     *
> +     * Based on DT's bindings [1] and RISC-V's DTS files in kernel #size-cells
> +     * for cpu node is expected to be 0.
> +     *
> +     * [1] https://www.kernel.org/doc/Documentation/devicetree/bindings/riscv/cpus.txt
> +     */
> +    if ( dt_n_size_cells(cpu) != 0 )
> +        printk("DT's cpu node `%s`: #size-cells %d\n",
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
> +    /*
> +     * It is safe to convert `paddr_t` to `unsigned long` as dt_read_paddr()
> +     * in the context of this function returns cpuid which according to RISC-V
> +     * specification could be from 0 to ((1ULL << (MXLEN)) - 1), where
> +     * MXLEN=32 for RV32 and MXLEN=64 for RV64.
> +    */

Nit: Indentation.

> +    *dt_cpuid = dt_read_paddr(prop, dt_n_addr_cells(cpu));
> +
> +    return 0;
> +}
> +
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

Just to clarify: There's no particular sorting intended for this table,
while ...

> +static const struct riscv_isa_ext_data __initconst required_extensions[] = {
> +    RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
> +    RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
> +    RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> +};

... this one looks to mean to be alphabetically sorted?

> +static bool is_lowercase_extension_name(const char *str)
> +{
> +    /*
> +     * `str` could contain full riscv,isa string from device tree so one
> +     * of the stop condionitions is checking for '_' as extensions are
> +     * separated by '_'.
> +     */
> +    for ( unsigned int i = 0; (str[i] != '\0') && (str[i] != '_'); i++ )
> +        if ( !islower(str[i]) )
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
> +         * `name` (according to device tree binding) and
> +         * `ext->name` (according to initialization of riscv_isa_ext[]
> +         * elements) must be all in lowercase.
> +         *
> +         * Just to be sure that it is true, ASSERT() is added.
> +         */
> +        ASSERT(is_lowercase_extension_name(name) &&
> +               is_lowercase_extension_name(ext->name));

More general remark: While asserting on ext->name is okay, for it being
our own data, asserting on data coming from the outside is generally not
correct. For now I'm not going to insist on this being changed, but
sooner or later it will want revisiting.

> +        if ( (name_end - name == strlen(ext->name)) &&
> +             !strncmp(name, ext->name, name_end - name) )
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
> +    #error "unsupported RISC-V bitness"

Nit: We generally like to have the # in the first column, and - if
so desired - blank padding afterwards.

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
> +        case 'X':
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
> +                ext_err = true;
> +                break;
> +            }
> +            fallthrough;
> +        case 'S':
> +        case 'z':
> +        case 'Z':

With match_isa_ext() insisting on ISA strings being all lowercase, what's
the point of permitting 'S' and 'Z' here?

> +void __init riscv_fill_hwcap(void)
> +{
> +    unsigned int i;
> +    size_t req_extns_amount = ARRAY_SIZE(required_extensions);
> +    bool all_extns_available = true;
> +
> +    riscv_fill_hwcap_from_isa_string();
> +
> +    if ( bitmap_empty(riscv_isa, RISCV_ISA_EXT_MAX) )
> +    {
> +        const char *failure_msg = has_isa_extensions_property() ?
> +                                    "\"riscv,isa-extension\" isn't supported" :
> +                                    "\"riscv,isa\" parsing failed";

Nit: Indentation (the opening double quotes on the continuation lines
want to line up with the 'h' in has_isa_extensions_property).

Jan

