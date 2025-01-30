Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DD5A2311E
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2025 16:43:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879663.1289878 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdWh3-0007Vb-8s; Thu, 30 Jan 2025 15:43:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879663.1289878; Thu, 30 Jan 2025 15:43:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdWh3-0007TH-6H; Thu, 30 Jan 2025 15:43:01 +0000
Received: by outflank-mailman (input) for mailman id 879663;
 Thu, 30 Jan 2025 15:42:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zr8Z=UW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tdWh1-0007TB-Ny
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2025 15:42:59 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e090115f-df20-11ef-99a4-01e77a169b0f;
 Thu, 30 Jan 2025 16:42:57 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ab39f84cbf1so174782566b.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2025 07:42:57 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47a7df0sm138691366b.2.2025.01.30.07.42.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 07:42:56 -0800 (PST)
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
X-Inumbo-ID: e090115f-df20-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738251777; x=1738856577; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mDEsX/r4PjaofjZR6OM6P7CS3MJ+XACOGaPvZN+UEjY=;
        b=M0ZNrSWUA5Cs8zek192ReAlDEZifsDre7J6zFZkW4lW5Szeze9najwkwr4QSRX4WHV
         pqBQS/JZeaSQOaEm7wOmo1lvGxSB68YF5SaqULQJjdOzp461De+zwFxEqJyhiIDwikya
         abKYK9XG5f+fgyLQ0RlZA3dyCelGhvR76KtZ5lPu9tfo3Ee4fwPr3ltVkJ+Ur2L9NGLZ
         Xl5fUYwIrfQkjZl8IwStXDWkq1gOcALRuuV4/ot6OnfHv/1/OVlwpmM5VrRRLiNAijGS
         NcEbBc3ZX5PppV/h2cpQmiVZ5ie9XuG1oyZeSO1Y5HJI104WBDOogMMAbVf/U0zFbrfl
         i0gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738251777; x=1738856577;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mDEsX/r4PjaofjZR6OM6P7CS3MJ+XACOGaPvZN+UEjY=;
        b=okOox+ElCWyBeKzdaTHGr9jOX7VUR/RuFsDgYYJAaSNP2cZbLf4EzmKZ8KirDUElLk
         /78y35a4ObIQzkHGHBg4p57gqdAmQe46uiv0WwnRf3K85UIR09IJQq/UVlFlqu7Tqxy2
         Jlg49xf3fY4sgeqBALRGpwpXnm5FU1OWIUK9mWAPVcVC+lVfRJaPhOmHq458KeFq99R3
         foUEF5rCInVXpPV+emzVV7xKooPOYeieYhM+Esa0LaHiLGTnpw2y0fgtamIsVGdv8QeN
         BvoCKFLHo/rOVLgfCuNH5/X9tcmDZrtKOyyBk0bRNkBRyxp5AnpI5I4YIH7UQ9zAN873
         UCqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVP48qAzDVD5IiGsYInuiYSixKeivAW47uvNQlomHhLCQTZKeoDLbnEjd0kUW0mp1pvuId2f7jj5nU=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywud3jTsilXQfvPE/8Mz0st21AV1RLZFJqxrmlgy8g/Ukt/e/RB
	dB1qkJ4mTMT1e3mFALatAii3A1v8rPpG5VOk8VrkduB9ZTo6HQ+d+3Zrfp6Pew==
X-Gm-Gg: ASbGnctTVcGYlcwpPNXE4FJe83tuB6lHwihJOEDnNm5i/CUtvJqDfmHBzgY+Vfptvph
	OtnXXp7tzxFxLjC+a8IOPPa42hgNpFu/b7YSQP0Ju4u+UHnJNLQy8VXlnODhAYhURFEw/bT5fo/
	0Q7qQJQ3Yrurj9pkFe0kR5sOU4wC3S345yadwNO85iId1s8Hw59ZdTrB73fUlIFbOsEdPGZfQp+
	IeSDHn8FMSAFTW+6dphDP9Lp5jHOM+3/2uDPuh1vaK9X0MLsrGIJ1/gi0DmcRxld1hrxHeN4eku
	QqayP7+ABH7TiZ671yLtejiqGea3+uWyrRXsE291FY2+aQOL9EsK1c/lkD6J4MOAbU5L9oi6WWe
	h
X-Google-Smtp-Source: AGHT+IErACVG7aGX1AMY5fQ9Z2IhJW4EPg/SVOFLqMHcPNWzr3e9zDEhQqWmsmzmpKmJHUqUU/ueMw==
X-Received: by 2002:a17:907:6ea3:b0:ab6:f4e0:c06 with SMTP id a640c23a62f3a-ab6f4e00fe4mr51521066b.21.1738251776509;
        Thu, 30 Jan 2025 07:42:56 -0800 (PST)
Message-ID: <efc352d6-e686-435c-98b3-2333b6dee6a3@suse.com>
Date: Thu, 30 Jan 2025 16:42:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/15] x86/hyperlaunch: locate dom0 kernel with
 hyperlaunch
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
 <20241226165740.29812-9-dpsmith@apertussolutions.com>
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
In-Reply-To: <20241226165740.29812-9-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.12.2024 17:57, Daniel P. Smith wrote:
> Look for a subnode of type `multiboot,kernel` within a domain node. If found,
> process the reg property for the MB1 module index. If the bootargs property is
> present and there was not an MB1 string, then use the command line from the
> device tree definition.

While multiboot is apparently the first x86-specific part (as far as Xen goes)
to be put under domain-builder/, I wonder:
- Wouldn't looking for "multiboot,kernel" simply yield nothing on non-x86,
  so having the code under common/ would still be okay?
- What's "multiboot" describing here? The origin of the module? (What other
  origins would then be possible? How would MB1 and MB2 be distinguished?
  What about a native xen.efi boot?) A property of the kernel (when Linux
  doesn't use MB)?

> --- a/xen/arch/x86/domain-builder/core.c
> +++ b/xen/arch/x86/domain-builder/core.c
> @@ -59,6 +59,17 @@ void __init builder_init(struct boot_info *bi)
>  
>          printk(XENLOG_INFO "  Number of domains: %d\n", bi->nr_domains);
>      }
> +    else
> +    {
> +        unsigned int i;
> +
> +        /* Find first unknown boot module to use as Dom0 kernel */
> +        printk("Falling back to using first boot module as dom0\n");

Nit (personal taste?): Why Dom0 in the comment and dom0 in the log
message. I think the former is to be preferred, but at the very least
I see no reason to spell it differently on two adjacent lines.

> +        i = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
> +        bi->mods[i].type = BOOTMOD_KERNEL;
> +        bi->domains[0].kernel = &bi->mods[i];
> +        bi->nr_domains = 1;
> +    }

Relating to a question on an earlier patch: The assumption here is
that nothing could have marked another module as BOOTMOD_KERNEL?

> --- a/xen/arch/x86/domain-builder/fdt.c
> +++ b/xen/arch/x86/domain-builder/fdt.c
> @@ -13,6 +13,114 @@
>  
>  #include "fdt.h"
>  
> +static int __init hl_module_index(void *fdt, int node, uint32_t *idx)

const void *?

> +{
> +    int ret = 0;
> +    const struct fdt_property *prop =
> +        fdt_get_property(fdt, node, "module-index", &ret);
> +
> +    /* FDT error or bad idx pointer, translate to -EINVAL */
> +    if ( ret < 0 || idx == NULL )

This is a static helper - why check the parameter for being NULL?

> +        return -EINVAL;
> +
> +    fdt_cell_as_u32((fdt32_t *)prop->data, idx);

While I'm aware libfdt has quite a few of such casts, they're problematic.
First and foremost this is a Misra violation, for casting away const-ness.
And then how do you know there are 4 bytes of data to legitimately access?
Hence why such casts would better be avoided altogether (or at least be
suitably abstracted away).

(There's at least one other instance further down.)

> +    if ( *idx > MAX_NR_BOOTMODS )

>= ?

> +        return -ERANGE;
> +
> +    return 0;
> +}
> +
> +static int __init dom0less_module_index(
> +    void *fdt, int node, int size_size, int address_size, uint32_t *idx)
> +{
> +    uint64_t size = ~0UL, addr = ~0UL;
> +    int ret =
> +        fdt_get_reg_prop(fdt, node, address_size, size_size, &addr, &size, 1);

    int ret = fdt_get_reg_prop(
                  fdt, node, address_size, size_size, &addr, &size, 1);

> +    /* FDT error or bad idx pointer, translate to -EINVAL */
> +    if ( ret < 0 || idx == NULL )

See above as to the NULL check.

> +        return -EINVAL;
> +
> +    /* Convention is that zero size indicates address is an index */
> +    if ( size != 0 )
> +        return -EOPNOTSUPP;
> +
> +    if ( addr > MAX_NR_BOOTMODS )

>= again?

> +        return -ERANGE;
> +
> +    /*
> +     * MAX_NR_BOOTMODS cannot exceed the max for MB1, represented by a u32,
> +     * thus the cast down to a u32 will be safe due to the prior check.
> +     */

Instead of (or in addition to) the comment, put in a BUILD_BUG_ON()?

Also please can you avoid using u32 even in comments? It'll only yield
needless grep matches once we go about fully purging it.

> +    *idx = (uint32_t)addr;
> +
> +    return 0;
> +}
> +
> +static int __init process_domain_node(
> +    struct boot_info *bi, void *fdt, int dom_node)

const twice? (I guess I won't mention such any further. I think I
previously asked that you make things as const-correct as possible.)

> +{
> +    int node;
> +    struct boot_domain *bd = &bi->domains[bi->nr_domains];
> +    const char *name = fdt_get_name(fdt, dom_node, NULL) ?: "unknown";
> +
> +    fdt_for_each_subnode(node, fdt, dom_node)
> +    {
> +        if ( fdt_node_check_compatible(fdt, node, "multiboot,kernel") == 0 )
> +        {
> +            unsigned int idx;
> +            int ret = 0;
> +
> +            if ( bd->kernel )
> +            {
> +                printk(XENLOG_ERR "Duplicate kernel module for domain %s)\n",
> +                       name);

It's XENLOG_ERR here (but a seemingly stray closing parenthesis at the end),
yet ...

> +                continue;
> +            }
> +
> +            /* Try hyperlaunch property, fall back to dom0less property. */
> +            if ( hl_module_index(fdt, node, &idx) < 0 )
> +            {
> +                int address_size = fdt_address_cells(fdt, dom_node);
> +                int size_size = fdt_size_cells(fdt, dom_node);
> +
> +                if ( address_size < 0 || size_size < 0 )
> +                    ret = -EINVAL;
> +                else
> +                    ret = dom0less_module_index(
> +                            fdt, node, size_size, address_size, &idx);
> +            }
> +
> +            if ( ret < 0 )
> +            {
> +                printk("  failed processing kernel module for domain %s)\n",

... two blanks (and the same odd parenthesis) here and ...

> +                       name);
> +                return ret;
> +            }
> +
> +            if ( idx > bi->nr_modules )

>= again?

> +            {
> +                printk("  invalid kernel module index for domain node (%d)\n",

... again two blanks here. What's the deal?

> +                       bi->nr_domains);
> +                return -EINVAL;
> +            }
> +
> +            printk("  kernel: boot module %d\n", idx);

This I expect has two leading blanks to somehow align (normal) output.

> +            bi->mods[idx].type = BOOTMOD_KERNEL;
> +            bd->kernel = &bi->mods[idx];
> +        }
> +    }
> +
> +    if ( !bd->kernel )
> +    {
> +        printk(XENLOG_ERR "ERR: no kernel assigned to domain\n");
> +        return -EFAULT;

EFAULT? Maybe ENODATA or some such?

> +    }
> +
> +    return 0;
> +}
> +
>  static int __init find_hyperlaunch_node(const void *fdt)
>  {
>      int hv_node = fdt_path_offset(fdt, "/chosen/hypervisor");
> @@ -74,9 +182,19 @@ int __init walk_hyperlaunch_fdt(struct boot_info *bi)
>  
>      fdt_for_each_subnode(node, fdt, hv_node)
>      {
> +        if ( bi->nr_domains >= MAX_NR_BOOTDOMS )
> +        {
> +            printk(XENLOG_WARNING "WARN: more domains defined than max allowed");

Missing \n. Also would all HL-related diagnostics perhaps better have a
respective prefix (for disambiguation and grep-ability)?

> --- a/xen/arch/x86/domain-builder/fdt.h
> +++ b/xen/arch/x86/domain-builder/fdt.h
> @@ -3,6 +3,8 @@
>  #define __XEN_X86_FDT_H__
>  
>  #include <xen/init.h>
> +#include <xen/libfdt/libfdt.h>
> +#include <xen/libfdt/libfdt-xen.h>
>  
>  #include <asm/bootinfo.h>
>  
> @@ -10,6 +12,7 @@
>  #define HYPERLAUNCH_MODULE_IDX 0
>  
>  #ifdef CONFIG_DOMAIN_BUILDER
> +
>  int has_hyperlaunch_fdt(struct boot_info *bi);
>  int walk_hyperlaunch_fdt(struct boot_info *bi);
>  #else

I can't explain the need for either of these two hunks.

> --- a/xen/include/xen/libfdt/libfdt-xen.h
> +++ b/xen/include/xen/libfdt/libfdt-xen.h
> @@ -13,6 +13,82 @@
>  
>  #include <xen/libfdt/libfdt.h>
>  
> +static inline int __init fdt_cell_as_u32(const fdt32_t *cell, uint32_t *val)
> +{
> +    *val = fdt32_to_cpu(*cell);
> +
> +    return 0;
> +}
> +
> +static inline int __init fdt_cell_as_u64(const fdt32_t *cell, uint64_t *val)
> +{
> +    *val = ((uint64_t)fdt32_to_cpu(cell[0]) << 32) |
> +           (uint64_t)fdt32_to_cpu(cell[1]);

As we try to conserve on the number of casts: There's no need for the
latter one, is there?

I'll leave it to DT folks to confirm (or otherwise) that the cell indexes
are invariant no matter what the endian-ness.

> +    return 0;

What's the point of this return value for both of the functions? Wouldn't
they better return the value if no error can occur anyway? Afaics none of
the callers checks the return value right now.

> +}
> +
> +/*
> + * Property: reg
> + *
> + * Defined in Section 2.3.6 of the Device Tree Specification is the "reg"
> + * standard property. The property is a prop-encoded-array that is encoded as
> + * an arbitrary number of (address, length) pairs.
> + */
> +static inline int __init fdt_get_reg_prop(
> +    const void *fdt, int node, unsigned int asize, unsigned int ssize,
> +    uint64_t *addr, uint64_t *size, unsigned int pairs)
> +{
> +    int ret;
> +    unsigned int i, count;
> +    const struct fdt_property *prop;
> +    fdt32_t *cell;
> +
> +    /* FDT spec max size is 4 (128bit int), but largest arch int size is 64 */
> +    if ( ssize > 2 || asize > 2 )
> +        return -EINVAL;

Hmm, so asize and ssize are already 32-bit granular. Slightly odd.

> +    prop = fdt_get_property(fdt, node, "reg", &ret);
> +    if ( !prop || ret < sizeof(u32) )
> +        return ret < 0 ? ret : -EINVAL;
> +
> +    /* Get the number of (addr, size) pairs and clamp down. */
> +    count = fdt32_to_cpu(prop->len) / (ssize + asize);

What if there's a remainder?

> +    count = count < pairs ? count : pairs;

Use min()?

Jan

