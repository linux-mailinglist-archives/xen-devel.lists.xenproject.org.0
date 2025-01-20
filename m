Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C147A16F0E
	for <lists+xen-devel@lfdr.de>; Mon, 20 Jan 2025 16:14:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.874971.1285301 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tZtT4-0006Da-CL; Mon, 20 Jan 2025 15:13:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 874971.1285301; Mon, 20 Jan 2025 15:13:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tZtT4-0006BJ-90; Mon, 20 Jan 2025 15:13:34 +0000
Received: by outflank-mailman (input) for mailman id 874971;
 Mon, 20 Jan 2025 15:13:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BOU1=UM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tZtT2-0006BD-41
 for xen-devel@lists.xenproject.org; Mon, 20 Jan 2025 15:13:32 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 19c177c7-d741-11ef-99a4-01e77a169b0f;
 Mon, 20 Jan 2025 16:13:27 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43675b1155bso53042175e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Jan 2025 07:13:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4389041f7e9sm145903445e9.23.2025.01.20.07.13.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Jan 2025 07:13:26 -0800 (PST)
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
X-Inumbo-ID: 19c177c7-d741-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737386007; x=1737990807; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xwvcWJEM2r93MIueVaqX5Gcfo90Ld3KonSEJsz4HUPo=;
        b=ZKwKg9F0UD2z2QxtdewmTqyDP7BGyISh1393BdfozjIJoh3S0/xxiIzRRYzfYu554F
         LW+GizJmBbv1Ag0D23Mxxra0S54UcCvgb8E2EKzyqZ0RodbFdOF8XNLNQzV79FowgSYP
         cBCSvK68nchmE7/V9/N3iKWpHD0pIyk18QdaXA9dBMff5z62oMnmtb8JoaJRzHe54UGH
         G3LPcF3pH7FIGVrfSpui04IKu8SQqz8rjH9LazhaZndAnqJeWlYDY7qefgEgCxfG0AMi
         fsGH1uDt42D5xbAet/xF+oGqJ+R79doK+tGBM9j6dSQVerAsLvm4PO4gZa7WD17Lim5N
         Qi7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737386007; x=1737990807;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xwvcWJEM2r93MIueVaqX5Gcfo90Ld3KonSEJsz4HUPo=;
        b=WbGcng1zE3cqYz9BHxn0z4YngOwtL8PPDqUYrZBQdQjlNHpr8b9H0WeGvzwa1pDnM0
         zoNN/orbl80bm3Ku78CP67Aq9X4/7UTNE8OIa0LDCp1oe7l2pA44JxIwuztSUu3iXaFH
         vqlwJtBs6JqponY1DSA8Dfs803hw10H7uvMP/v6tub8QPYpI9sv+rSoGKVjcy66GvlFL
         Y+sq3tPOK8jxUZET94D8UC0SWw+sJ4Dg3RlBCxwRrsAVa/O4/Gi72Zfnkjfiwb9yfG+S
         1uVa2WGmbuhqtEz27x063oR4BsEKMcPIYI+yewBwb4zqin6yAj+CMiYV+QKxgxto2LSx
         AgnA==
X-Forwarded-Encrypted: i=1; AJvYcCUbrCmCqTibjvea1g/oJQA53c9zhlTkOTswj+njjNuxiAFQBKUU/6DpP3vIRISzWf5jFv7EGyIv4hA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxNli9Ds40WnhoOPnlIjF8g06pg9oq6KWHqIarGYqh1QCbeSkyd
	dxc1pzmc070bXOsNmtiT9mjXQGxQFfkkeSETBxvpUnsEaOtSoC1ykKOl+pPmiw==
X-Gm-Gg: ASbGnctxYvEk75KGk77hz/2qEPXOYjYmKy+lGF28eGYUjBOvGIpt1fzFFy12rJSRZkY
	aByNP7PXrQHMjLVXkYQv4kIvWhq5morKJ0IF3sCVWkuudC5iZQZoM6vpaNRXb6G9zKGbnfT2r7R
	bsGHgX7MAzocq+i/uOO0XaJ3NafLXs60Xz/Vbx+/A/cG3tGfgFF7wr00o4aifyHi4dEah5z2sEl
	N/7Is3SGNFrLfil0uvjIO31vuClbYpR1NzcdNKFhzV4X9iGPeg+htEBlmlwW4FySpls5zM6SkRy
	QpZ64O6SKlVfMlzUDUIV8rc3iB0qJ4RbTzVRGsSmgy1TseedScOL5cQ=
X-Google-Smtp-Source: AGHT+IFNNooqE/lUTeUnaQk5z1Hd+CDXjd7/gbFGlyaoq9sVP+jrz6LYzYKGq5RgZayAjS0aL1FkgA==
X-Received: by 2002:a05:600c:4fc1:b0:434:f218:e1a8 with SMTP id 5b1f17b1804b1-4389141c21cmr106100245e9.19.1737386007185;
        Mon, 20 Jan 2025 07:13:27 -0800 (PST)
Message-ID: <0ceaa04e-36ac-4099-8a84-977a08ba16a2@suse.com>
Date: Mon, 20 Jan 2025 16:13:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/riscv: identify specific ISA supported by cpu
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <0a6562ae1e22e3fe607054b33df3467c12d0b276.1736956861.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <0a6562ae1e22e3fe607054b33df3467c12d0b276.1736956861.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.01.2025 17:36, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/cpufeature.c
> @@ -0,0 +1,506 @@
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
> + *   riscv_isa_extension_available for consistency. Also, update the type of
> + *   `bit` argument of riscv_isa_extension_available().
> + * - Redefine RISCV_ISA_EXT_DATA() to work only with ext_name and ext_id,
> + *   as other fields are not used in Xen currently.
> + * - Add check of first 4 letters of riscv,isa string to
> + *   riscv_isa_parse_string() as Xen doesn't do this check before so it is
> + *   necessary to check correctness of riscv,isa string. ( it should start with
> + *   rv{32,64} with taking into account lower case of "rv").
> + * - Drop an argument of riscv_fill_hwcap() and riscv_fill_hwcap_from_isa_string()
> + *   as it isn't used, at the moment.
> + * - Update the comment message about QEMU workaround.
> + * - s/pr_info/printk.

As said before - having this in the commit message is likely enough. Putting
it here as well is only risking for this to go stale (perhaps rather sooner
than later).

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
> +static int __init dt_get_cpuid_from_node(const struct dt_device_node *cpu)
> +{
> +    const __be32 *prop;
> +    unsigned int reg_len;
> +
> +    if ( dt_n_size_cells(cpu) != 0 )
> +        printk("cpu node `%s`: #size-cells %d\n",
> +               dt_node_full_name(cpu), dt_n_size_cells(cpu));

The call to dt_n_size_cells() is here really just for the printk()?

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

How come it is okay to (silently) truncate here from paddr_t to int?

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
> + * Extension name must be all lowercase ( according to device-tree binding )
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
> +    RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
> +    RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
> +};

No Zicsr here?

> +static bool is_lowercase_extension_name(const char *str)
> +{
> +    if ( !str )
> +        return false;

This path doesn't look like it can actually be taken. Imo such checks
may make sense in non-static functions, but in static ones it is usually
clear enough that all callers pass in good pointers.

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
> +         * `name` ( according to device tree binding ) and
> +         * `ext->name` ( according to initialization of riscv_isa_ext[]

Nit: There appears to be a missing closing parenthesis here. Plus in text
may I advise to omit blanks after the opening and before the closing
parenthesis? Imo this just makes it harder to read, even if only slightly.

> +         * elements must be all in lowercase.
> +         *
> +         * Just to be sure that it is true, ASSERT() are added.
> +         */
> +        ASSERT(is_lowercase_extension_name(name) &&
> +               is_lowercase_extension_name(ext->name));
> +
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
> +    /*
> +     * According to RISC-V device tree binding isa string must be all
> +     * lowercase.
> +     * To be sure that this is true, ASSERT below is added.
> +     */
> +    ASSERT(islower(isa[0]) && islower(isa[1]));

This looks a little odd to me when you have ...

> +    if ( (isa[0] != 'r') && (isa[1] != 'v') )
> +        return -EINVAL;

... this anyway.

> +#if defined(CONFIG_RISCV_32)
> +    if ( isa[2] != '3' && isa[3] != '2' )
> +        return -EINVAL;
> +#elif defined(CONFIG_RISCV_64)
> +    if ( isa[2] != '6' && isa[3] != '4' )
> +        return -EINVAL;
> +#else
> +    #error "unsupported RISC-V bitness"
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
> +            printk_once("Vendor extensions are ignored in riscv,isa."
> +                        "Use riscv,isa-extensions instead\n");

Interesting suggestion considering that doing so will end in a panic().

> +static int __init riscv_fill_hwcap_from_ext_list(void)
> +{
> +    const struct dt_device_node *cpus = dt_find_node_by_path("/cpus");
> +    const struct dt_device_node *cpu;
> +    int res = -EINVAL;
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
> +        int cpuid;
> +
> +        if ( !dt_device_type_is_equal(cpu, "cpu") )
> +            continue;
> +
> +        cpuid = dt_get_cpuid_from_node(cpu);
> +        if ( cpuid < 0 )
> +            continue;
> +
> +        if ( dt_property_read_string(cpu, "riscv,isa-extensions", &isa) )
> +        {
> +            printk("Unable to find \"riscv,isa-extensions\" devicetree entry "
> +                   "for cpu%d\n", cpuid);

This is DT's number space for CPUs, isn't it? Any use of cpu%d (or CPU%d) or
alike generally suggests the number is Xen's. This may want disambiguating
here.

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
> +        int cpuid;
> +
> +        if ( !dt_device_type_is_equal(cpu, "cpu") )
> +            continue;
> +
> +        cpuid = dt_get_cpuid_from_node(cpu);
> +        if ( cpuid < 0 )
> +            continue;
> +
> +        if ( dt_property_read_string(cpu, "riscv,isa", &isa) )
> +        {
> +            printk("Unable to find \"riscv,isa\" devicetree entry\n");
> +            continue;
> +        }

Interestingly you don't log the CPU number here. What's the deal?

> +bool riscv_isa_extension_available(const unsigned long *isa_bitmap,
> +                                   enum riscv_isa_ext_id bit)
> +{
> +    const unsigned long *bmap = (isa_bitmap) ? isa_bitmap : riscv_isa;

Since it helps readability, may I suggest

    const unsigned long *bmap = isa_bitmap ?: riscv_isa;

or even getting away without the local var altogether:

    if ( !isa_bitmap )
        isa_bitmap = riscv_isa;

?

> +void __init riscv_fill_hwcap(void)
> +{
> +    unsigned int i;
> +    size_t req_extns_amount = ARRAY_SIZE(required_extensions);
> +    bool all_extns_available = true;
> +
> +    int ret = riscv_fill_hwcap_from_ext_list();

I don't think there's a reason here to have a blank line in the middle
of declarations.

> +    if ( ret )
> +    {
> +        printk("Falling back to deprecated \"riscv,isa\"\n");
> +        riscv_fill_hwcap_from_isa_string();
> +    }

I continue to find it irritating that you first try a function you
know won't succeed (and will panic() if the DT item is actually there),
in order to the log yet another message about using something that's
deprecated. If this is deprecated, why don't we prefer (and hence
support) the mor modern approach?

> +    for ( i = 0; i < req_extns_amount; i++ )
> +    {
> +        const struct riscv_isa_ext_data ext = required_extensions[i];
> +
> +        if ( !riscv_isa_extension_available(NULL, ext.id) )
> +        {
> +            printk("Xen requires extension: %s\n", ext.name);
> +            all_extns_available = false;
> +        }
> +    }
> +
> +    if ( !all_extns_available )
> +        panic("Look why the extensions above are needed in booting.txt\n");

Where's this booting.txt? I don't think people should be made hunt it
down ...

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/cpufeature.h
> @@ -0,0 +1,57 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef ASM__RISCV__CPUFEATURE_H
> +#define ASM__RISCV__CPUFEATURE_H
> +
> +#ifndef __ASSEMBLY__
> +
> +#include <xen/stdbool.h>
> +
> +/*
> + * These macros represent the logical IDs of each multi-letter RISC-V ISA
> + * extension and are used in the ISA bitmap. The logical IDs start from
> + * RISCV_ISA_EXT_BASE, which allows the 0-25 range to be reserved for single
> + * letter extensions and are used in enum riscv_isa_ext_id.
> + *
> + * New extensions should just be added to the bottom, rather than added
> + * alphabetically, in order to avoid unnecessary shuffling.
> + */
> +#define RISCV_ISA_EXT_BASE  26
> +
> +enum riscv_isa_ext_id {
> +    RISCV_ISA_EXT_a,
> +    RISCV_ISA_EXT_c,
> +    RISCV_ISA_EXT_d,
> +    RISCV_ISA_EXT_f,
> +    RISCV_ISA_EXT_h,
> +    RISCV_ISA_EXT_i,
> +    RISCV_ISA_EXT_m,
> +    RISCV_ISA_EXT_q,
> +    RISCV_ISA_EXT_v,
> +    RISCV_ISA_EXT_ZICNTR = RISCV_ISA_EXT_BASE,
> +    RISCV_ISA_EXT_ZICSR,
> +    RISCV_ISA_EXT_ZIFENCEI,
> +    RISCV_ISA_EXT_ZIHINTPAUSE,
> +    RISCV_ISA_EXT_ZIHPM,
> +    RISCV_ISA_EXT_ZBB,
> +    RISCV_ISA_EXT_SMAIA,
> +    RISCV_ISA_EXT_SSAIA,
> +    RISCV_ISA_EXT_MAX
> +};
> +
> +void riscv_fill_hwcap(void);
> +
> +bool riscv_isa_extension_available(const unsigned long *isa_bitmap,
> +                                   enum riscv_isa_ext_id bit);

Nit: "bit" is an implementation detail. Imo "id" would be more natural
to use for people considering whether to call this function in a given
situation.

Jan

