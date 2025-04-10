Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E537CA84101
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 12:43:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945248.1343475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2pN5-0002FR-Se; Thu, 10 Apr 2025 10:42:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945248.1343475; Thu, 10 Apr 2025 10:42:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2pN5-0002DM-Pm; Thu, 10 Apr 2025 10:42:59 +0000
Received: by outflank-mailman (input) for mailman id 945248;
 Thu, 10 Apr 2025 10:42:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w6Mj=W4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2pN4-0002DD-9D
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 10:42:58 +0000
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [2a00:1450:4864:20::330])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8e211cb4-15f8-11f0-9ffb-bf95429c2676;
 Thu, 10 Apr 2025 12:42:53 +0200 (CEST)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so6907645e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 03:42:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f233c8219sm46624245e9.21.2025.04.10.03.42.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 03:42:52 -0700 (PDT)
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
X-Inumbo-ID: 8e211cb4-15f8-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744281772; x=1744886572; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pwN3NRlofV9TEP81zvMob1Lz0Y0xeEzZ2hGpl8QaMyg=;
        b=Sjr5LmeBLEPVqHcNgWYb8EXNhu/GNhbRq59TJIuykzJSHrsxtptBeutHL7gc5qfzeC
         zRmQFyuXHQ0oaQ5i+GAr3xhapyZ82pKQqlUaFgIJ+gxOyNUjYllJ+VAU5zS/wu0By91n
         7bQBaQF7OrhAMAt4iWiooHp7cNBGpTQn/gAqIQg5VdCXXxoQFSb1xO59yW1Rn23g8Pp0
         KuQYo5GaAlwyfUPuAXL0Zn3NRyaSl9S7SIVYxk4scatpfiDFFCHCzzoFjBlInOPp+6Hu
         C0rA793XqeRfysIs1U3E9zZIojsmBApCKqFZC0KqTn1hE6s3lomhqgjwN21I8H7Yqhde
         osHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744281772; x=1744886572;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pwN3NRlofV9TEP81zvMob1Lz0Y0xeEzZ2hGpl8QaMyg=;
        b=nw5Kyc5ITuj+tD32DUHCiHkps5dXu91LGCgIfTXhndZGg1Kij0/KqOIPGN4pmKjUll
         TrznOYm6sT9lLH1xvWlcdGaYF7uTIKh+OwgYmXcu98YWLJQtkoCuCYF1gDNzANjvV490
         kYMe8WXGK6OQOBHH8VAJgHGV/zGKuFpllehcKgcuUvcVfsiIjXPZA4lsl0hWX9AHFrVb
         2tXIYzo3EsR0y4Yh3E/dMTkSt4MNH/ZB8vPHgtF8b8moeJLE81XVMHtfRcnyvEuw3xBQ
         OmDDWSprLTYasrRPRACJtOk1zjOwq40cyRE21O0cwyxXj7upVKvUulKyv3hPkQr/v5S9
         dxqg==
X-Forwarded-Encrypted: i=1; AJvYcCUX8VqimD8xtQRslegJJcbEwWerrnpOS+hfF1CS9pTOuBxdR87gHWIEAXAIAfsSwHyWWsxoJz+ptKQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyRFwKrt0X+KD0PHI1jT44ue5kx3SeqLaeHfw7TUx42ktPdWhC1
	7rwLLASyGEhcSz4LRa5Nmz/uaJnscy3kSKui6pSjV6kXI0F6LapKGZqBVkMo/Q==
X-Gm-Gg: ASbGncurRY9qKQ9sE3UtX2EmiLrZXIAHbYcuobpLK2u3goVYvdT71CW8432bce3AZp8
	7hHqDtCInqmNeJoWFQXYoJVeHnekpq+pzEmLo2Jxktrk3IZcDNiY35DWaAKH3jacYpnOmsu21fw
	4EqO3fXQlwRKeqgo8GU2zPuquIbvgHIaJpTFtuCMFYUnj35Q4bOf1KKIUycch7IVFdRxRGMu0Qy
	kQKR+Xqur9WDdpT1CepvfYo1j+gZiBklHUax8Gkhn5AgIz+EJMzqsvIr9QXN8sDUlLWNANaHbIh
	lJ3+k59jvjpXN/UhG5MPk/5LyTvRLqmz1BHjBqAz6UtExa4blsmgG5BCqVBksNVsP6FqymPCsnN
	Rlm4KPLcQfLrXV/qWrf4Kcwfo2g==
X-Google-Smtp-Source: AGHT+IHgDgpczHF9L6le5e1J4fjMuV58Imz9nrW4qizioLR9qClaGmF5qqWJ7Y1O+IrGcM0X1+uV3g==
X-Received: by 2002:a05:600c:5486:b0:439:9a40:aa0b with SMTP id 5b1f17b1804b1-43f2d961b12mr15623355e9.25.1744281772400;
        Thu, 10 Apr 2025 03:42:52 -0700 (PDT)
Message-ID: <fe282aa0-fe2d-49b8-a2aa-325c9825304b@suse.com>
Date: Thu, 10 Apr 2025 12:42:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/16] x86/hyperlaunch: Add helpers to locate multiboot
 modules
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-9-agarciav@amd.com>
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
In-Reply-To: <20250408160802.49870-9-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2025 18:07, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/domain-builder/fdt.c
> +++ b/xen/arch/x86/domain-builder/fdt.c
> @@ -13,6 +13,148 @@
>  
>  #include "fdt.h"
>  
> +/*
> + * Unpacks a "reg" property into its address and size constituents.
> + *
> + * @param prop          Pointer to an FDT "reg" property.
> + * @param address_cells Number of 4-octet cells that make up an "address".
> + * @param size_cells    Number of 4-octet cells that make up a "size".
> + * @param p_addr[out]   Address encoded in the property.
> + * @param p_size[out]   Size encoded in the property.
> + * @returns             -EINVAL on malformed property, 0 otherwise.
> + */
> +static int __init read_fdt_prop_as_reg(const struct fdt_property *prop,
> +                                       int address_cells, int size_cells,
> +                                       uint64_t *p_addr, uint64_t *p_size)
> +{
> +    const fdt32_t *cell = (const fdt32_t *)prop->data;
> +    uint64_t addr, size;
> +
> +    if ( fdt32_to_cpu(prop->len) !=
> +         (address_cells + size_cells) * sizeof(*cell) )
> +    {
> +        printk("  Cannot read reg %lu+%lu from prop len %u\n",
> +            address_cells * sizeof(*cell), size_cells * sizeof(*cell),
> +            fdt32_to_cpu(prop->len));
> +        return -EINVAL;
> +    }
> +
> +    switch ( address_cells ) {

Nit: Brace on its own line please.

> +    case 1:
> +        addr = fdt32_to_cpu(*cell);
> +        break;
> +    case 2:
> +        addr = fdt64_to_cpu(*(const fdt64_t *)cell);
> +        break;
> +    default:
> +        printk("  unsupported sized address_cells\n");

Depending on how likely this or ...

> +        return -EINVAL;
> +    }
> +
> +    cell += address_cells;
> +    switch ( size_cells ) {
> +    case 1:
> +        size = fdt32_to_cpu(*cell);
> +        break;
> +    case 2:
> +        size = fdt64_to_cpu(*(const fdt64_t *)cell);
> +        break;
> +    default:
> +        printk("  unsupported sized size_cells\n");

... this path is to be hit, perhaps also log the bogus size? Then again, this
being passed in, isn't it an internal error if the wrong size makes it here?
I.e. rather use ASSERT_UNREACHABLE()?

> +        return -EINVAL;
> +    }
> +
> +    *p_addr = addr;
> +    *p_size = size;
> +
> +    return 0;
> +}

The function as a whole looks somewhat similar to fdt_get_reg_prop(). What's
the deal?

> +/*
> + * Locate a multiboot module given its node offset in the FDT.
> + *
> + * The module location may be given via either FDT property:
> + *     * reg = <address, size>
> + *         * Mutates `bi` to append the module.
> + *     * module-index = <idx>
> + *         * Leaves `bi` unchanged.
> + *
> + * @param fdt           Pointer to the full FDT.
> + * @param node          Offset for the module node.
> + * @param address_cells Number of 4-octet cells that make up an "address".
> + * @param size_cells    Number of 4-octet cells that make up a "size".
> + * @param bi[inout]     Xen's representation of the boot parameters.
> + * @return              -EINVAL on malformed nodes, otherwise
> + *                      index inside `bi->mods`
> + */
> +int __init fdt_read_multiboot_module(const void *fdt, int node,
> +                                     int address_cells, int size_cells,
> +                                     struct boot_info *bi)

Functions without callers and non-static ones without declarations are
disliked by Misra.

> +{
> +    const struct fdt_property *prop;
> +    uint64_t addr, size;
> +    int ret;
> +    int idx;
> +
> +    ASSERT(!fdt_node_check_compatible(fdt, node, "multiboot,module"));
> +
> +    /* Location given as a `module-index` property. */
> +    prop = fdt_get_property(fdt, node, "module-index", NULL);
> +
> +    if ( prop )
> +    {
> +        if ( fdt_get_property(fdt, node, "reg", NULL) )
> +        {
> +            printk("  Location of multiboot,module defined multiple times\n");
> +            return -EINVAL;
> +        }
> +        return fdt_cell_as_u32((const fdt32_t *)prop->data);

No concerns here of there being less than 4 bytes of data?

> +    }
> +
> +    /* Otherwise location given as a `reg` property. */
> +    prop = fdt_get_property(fdt, node, "reg", NULL);
> +
> +    if ( !prop )
> +    {
> +        printk("  No location for multiboot,module\n");
> +        return -EINVAL;
> +    }
> +    if ( fdt_get_property(fdt, node, "module-index", NULL) )
> +    {
> +        printk("  Location of multiboot,module defined multiple times\n");
> +        return -EINVAL;
> +    }
> +
> +    ret = read_fdt_prop_as_reg(prop, address_cells, size_cells, &addr, &size);
> +
> +    if ( ret < 0 )
> +    {
> +        printk("  Failed reading reg for multiboot,module\n");
> +        return -EINVAL;
> +    }
> +
> +    idx = bi->nr_modules + 1;

This at least looks like an off-by-one. If the addition of 1 is really
intended, I think it needs commenting on.

> +    if ( idx > MAX_NR_BOOTMODS )
> +    {
> +        /*
> +         * MAX_NR_BOOTMODS cannot exceed the max for MB1, represented by 32bits,
> +         * thus the cast down to a u32 will be safe due to the prior check.
> +         */
> +        BUILD_BUG_ON(MAX_NR_BOOTMODS >= (uint64_t)UINT32_MAX);

Because of idx being a signed quantity, isn't INT_MAX the required upper
bound? The latest then the somewhat odd cast should also be possible to
drop.

> +        printk("  idx %d exceeds maximum boot modules\n", idx);

Perhaps include STR(MAX_NR_BOOTMODS) as well?

> --- a/xen/include/xen/libfdt/libfdt-xen.h
> +++ b/xen/include/xen/libfdt/libfdt-xen.h
> @@ -13,6 +13,63 @@
>  
>  #include <xen/libfdt/libfdt.h>
>  
> +static inline int __init fdt_cell_as_u32(const fdt32_t *cell)

Why plain int here, but ...

> +{
> +    return fdt32_to_cpu(*cell);
> +}
> +
> +static inline uint64_t  __init fdt_cell_as_u64(const fdt32_t *cell)

... a fixed-width and unsigned type here? Question is whether the former
helper is really warranted.

Also nit: Stray double blank.

> +{
> +    return ((uint64_t)fdt32_to_cpu(cell[0]) << 32) | fdt32_to_cpu(cell[1]);

That is - uniformly big endian?

> +}

Marking such relatively generic inline functions __init is also somewhat
risky. 

> +/*
> + * Property: reg
> + *
> + * Defined in Section 2.3.6 of the Device Tree Specification is the "reg"
> + * standard property. The property is a prop-encoded-array that is encoded as
> + * an arbitrary number of (address, size) pairs.  We only extract a single
> + * pair since that is what is used in practice.
> + */
> +static inline int __init fdt_get_reg_prop(
> +    const void *fdt, int node, unsigned int addr_cells, unsigned int size_cells,
> +    uint64_t *addr, uint64_t *size)
> +{
> +    int ret;
> +    const struct fdt_property *prop;
> +    fdt32_t *cell;
> +
> +    /* FDT spec max size is 4 (128bit int), but largest arch int size is 64 */
> +    if ( size_cells > 2 || addr_cells > 2 )
> +        return -EINVAL;
> +
> +    prop = fdt_get_property(fdt, node, "reg", &ret);
> +    if ( !prop || ret < sizeof(u32) )

No uses of u32 et al in new code please. Question anyway is whether this isn't
meant to be sizeof(*cell) like you have it ...

> +        return ret < 0 ? ret : -EINVAL;
> +
> +    if ( fdt32_to_cpu(prop->len) !=
> +	 ((size_cells + addr_cells) * sizeof(*cell)) )

... here. Or maybe it's to be sizeof(prop->len)?

Also nit: Hard tab slipped in.

> +        return -EINVAL;
> +
> +    cell = (fdt32_t *)prop->data;
> +
> +    /* read address field */
> +    if ( addr_cells == 1 )
> +        *addr = fdt_cell_as_u32(cell);
> +    else
> +        *addr = fdt_cell_as_u64(cell);
> +
> +    cell += addr_cells;
> +
> +    /* read size field */
> +    if ( size_cells == 1 )
> +        *size = fdt_cell_as_u32(cell);
> +    else
> +        *size = fdt_cell_as_u64(cell);
> +
> +    return 0;
> +}

Does this really want/need to be an inline function?

Jan

