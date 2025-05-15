Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40EF0AB8116
	for <lists+xen-devel@lfdr.de>; Thu, 15 May 2025 10:43:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.984919.1370889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFUBD-0002g2-9W; Thu, 15 May 2025 08:43:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 984919.1370889; Thu, 15 May 2025 08:43:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFUBD-0002ct-5u; Thu, 15 May 2025 08:43:03 +0000
Received: by outflank-mailman (input) for mailman id 984919;
 Thu, 15 May 2025 08:43:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D/jC=X7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uFUBC-0002cl-1R
 for xen-devel@lists.xenproject.org; Thu, 15 May 2025 08:43:02 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b207458-3168-11f0-9ffb-bf95429c2676;
 Thu, 15 May 2025 10:42:59 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-acbb85ce788so136238166b.3
 for <xen-devel@lists.xenproject.org>; Thu, 15 May 2025 01:42:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad2197bd3a6sm1067101166b.131.2025.05.15.01.42.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 01:42:58 -0700 (PDT)
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
X-Inumbo-ID: 9b207458-3168-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747298579; x=1747903379; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=c54MK/hnu+A4PUQDWcJ32gWT8lwT2BxEF066k6TXkdE=;
        b=SBF+qnnN8bNqO0FUCoOIkSxKv40vHmwNIybUA6BdD0Sh9Jyp+2yIOCe3BhL3injLsE
         +ubtHGDvGKdBkVKhaiobBm2WDmPYb/7QD9SiOQmntcLknvzeQSfgU6/ZuGqB2GPnusFf
         kLMnWXqZhzWv7kPg5imFcZMteKQF2d6oCMl+1GjgISEQ4wqyOs07K35AlBrHNVa9xSeO
         d0eygF+0e7I94/NTDLJQ+y3JKwmPTuzz7KzvtWhIbJC9N6Nw6chQtJP7a5yjqWQFRDEe
         9GZ8nlV7l60yQZAJobs1/TThMlN7rG4kasqn/mKG5MEj6bT7qBWJGx4Cpsb+H5uR05gI
         ecLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747298579; x=1747903379;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c54MK/hnu+A4PUQDWcJ32gWT8lwT2BxEF066k6TXkdE=;
        b=mlrw8zlCTwfgxsOt/F9I/Jt//HSa5NnGOH+LrWdBnwZyrCy9g1CCtGG5MZ9L9PBbkL
         uvB1K3MG1m8Zr19fUQPondptuLw5PuZ6eTryXzyb1Y8D8cd5adCcaKv+vGKElcVf5EIH
         Zru18vAVEGpICcoZ4aL0iN+VhOsP3QLxEBxJo/gw7jkRRakrTRST0J6EXMGAL6jdknK4
         hb591LauNC8KlkF39lFhrLWzUemYDT1543KBxFWVo7jThGS5oEh1y/M00m3JkfuRl13l
         0Vu+QmEwq0DCvPzvPIQGOM+5ufBKGO/JO16HakE878cEwC2esow59/Wf72ifxdUGoBTI
         Kfrw==
X-Forwarded-Encrypted: i=1; AJvYcCVRz6EGAVUwSd7yUtc9XFnr+kgKND1pWTDN62Yzse+CbaaIiGxhvUITUMAYZe2Wj3aq8a1HjSiK6Tw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywa5wHA1ls9C7UGJknFslcVYFoy/qdMa6HgTmOlf+9aRNTHX62R
	BchYuXHZOIA9gTQr9/1Jkhw8umzYo5A1+xByTb9zmO7bL2AU+xjd51ybfuEwtQ==
X-Gm-Gg: ASbGncvC1Ib0oX2YEY9OMx6xav9moFQyU9BwYt2l1QjYcComEunpTqANWpSLOtp8w70
	59uK+wj2d+sFF0VYhX9wiMnFBy/RQbWdcglbiZUugIvU2Z+zAxTqGSK0vMooW13I40HC5F192Ua
	13PWlo3jmXrOezaUdMbViaazyaMP8Xft8Fu1XS9Y5NO5HhpPlLclRgJJl97M2DTIaNLmryP/8Dt
	Vx5yaG7gH7m4PoOgz4EyQwZDBqp4hlqN2Wq2LZhTNBypZmM2QnV/bXwjuLuuEs/TBsvfY0Fu3mO
	NLIOfOCaj4D9Z3YYloyQuHj68Rc94ktkgGgYQT2cZLkusdaZPT+DZz7PB6i93irIsqXJvKQdEMk
	xVka5ip6eYadT+qS9jlMNbpcFD6d7dZc/5yCl
X-Google-Smtp-Source: AGHT+IGOJTko5rOcHYaHvbtw7SSIbRdSXDiy4/b6lLdUVFtgRZbI0ZKFZ6aqe2yXFE6rlXE2HboKvQ==
X-Received: by 2002:a17:907:86a1:b0:ad2:4374:84a2 with SMTP id a640c23a62f3a-ad4f70f61eamr622003766b.6.1747298579162;
        Thu, 15 May 2025 01:42:59 -0700 (PDT)
Message-ID: <0d9a9a9e-3454-465f-ac1d-cd65ba4a5792@suse.com>
Date: Thu, 15 May 2025 10:42:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/16] xen/riscv: imsic_init() implementation
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Romain Caritey <Romain.Caritey@microchip.com>, xen-devel@lists.xenproject.org
References: <cover.1746530883.git.oleksii.kurochko@gmail.com>
 <f7588e93d0ddacc29ce5d89b2855624f82d6baa9.1746530883.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <f7588e93d0ddacc29ce5d89b2855624f82d6baa9.1746530883.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.05.2025 18:51, Oleksii Kurochko wrote:
> imsic_init() is introduced to parse device tree node, which has the following
> bindings [2], and based on the parsed information update IMSIC configuration
> which is stored in imsic_cfg.
> 
> The following helpers are introduces for imsic_init() usage:
>   - imsic_parse_node() parses IMSIC node from DTS
>   - imsic_get_parent_cpuid() returns the hart ( CPU ) ID of the given device
>     tree node.
> 
> This patch is based on the code from [1].
> 
> Since Microchip originally developed imsic.{c,h}, an internal discussion with
> them led to the decision to use the MIT license.
> 
> [1] https://gitlab.com/xen-project/people/olkur/xen/-/commit/0b1a94f2bc3bb1a81cd26bb75f0bf578f84cb4d4
> [2] https://elixir.bootlin.com/linux/v6.12/source/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
> 
> Co-developed-by: Romain Caritey <Romain.Caritey@microchip.com>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in V2:
>  - Drop years in copyrights.

Did you, really?

>  - s/riscv_of_processor_hartid/dt_processor_cpuid.
>  - s/imsic_get_parent_hartid/imsic_get_parent_cpuid.
>    Rename argument hartid to cpuid.
>    Make node argument const.
>    Return res instead of -EINVAL for the failure case of dt_processor_cpuid().
>    Drop local variable hart and use cpuid argument instead.
>    Drop useless return res;
>  - imsic_parse_node() changes:
>    - Make node argument const.
>    - Check the return value of dt_property_read_u32() directly instead of
>      saving it to rc variable.
>    - Update tmp usage, use short form "-=".
>    - Update a check (imsic_cfg.nr_ids >= IMSIC_MAX_ID) to (imsic_cfg.nr_ids > IMSIC_MAX_ID)
>      as IMSIC_MAX_ID is changed to maximum valid value, not just the firsr out-of-range.
>    - Use `rc` to return value instead of explicitly use -EINVAL.
>    - Use do {} while() to find number of MMIO register sets.
>  - Set IMSIC_MAX_ID to 2047 (maximum possible IRQ number).
>  - imsic_init() changes:
>    - Use unsigned int in for's expression1.
>    - s/xfree/XFEE.
>    - Allocate msi and cpus array dynamically.
>  - Drop forward declaration before declaration of imsic_get_config() in asm/imsic.h
>    as it is not used as parameter type.
>  - Align declaration of imisic_init with defintion.
>  - s/harts/cpus in imisic_mmios.
>    Also, change type from bool harts[NR_CPUS] to unsigned long *cpus.
>  - Allocate msi member of imsic_config dynamically to save some memory.
>  - Code style fixes.
>  - Update the commit message.
> ---
>  xen/arch/riscv/Makefile            |   1 +
>  xen/arch/riscv/imsic.c             | 286 +++++++++++++++++++++++++++++
>  xen/arch/riscv/include/asm/imsic.h |  65 +++++++
>  3 files changed, 352 insertions(+)
>  create mode 100644 xen/arch/riscv/imsic.c
>  create mode 100644 xen/arch/riscv/include/asm/imsic.h
> 
> diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> index a1c145c506..e2b8aa42c8 100644
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -2,6 +2,7 @@ obj-y += aplic.o
>  obj-y += cpufeature.o
>  obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
>  obj-y += entry.o
> +obj-y += imsic.o
>  obj-y += intc.o
>  obj-y += irq.o
>  obj-y += mm.o
> diff --git a/xen/arch/riscv/imsic.c b/xen/arch/riscv/imsic.c
> new file mode 100644
> index 0000000000..43d0c92cbd
> --- /dev/null
> +++ b/xen/arch/riscv/imsic.c
> @@ -0,0 +1,286 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +/*
> + * xen/arch/riscv/imsic.c
> + *
> + * RISC-V Incoming MSI Controller support
> + *
> + * (c) Microchip Technology Inc.
> + * (c) Vates
> + */
> +
> +#include <xen/const.h>
> +#include <xen/device_tree.h>
> +#include <xen/errno.h>
> +#include <xen/init.h>
> +#include <xen/macros.h>
> +#include <xen/xmalloc.h>
> +
> +#include <asm/imsic.h>
> +
> +static struct imsic_config imsic_cfg;
> +
> +/* Callers aren't expected to changed imsic_cfg so return const. */
> +const struct imsic_config *imsic_get_config(void)
> +{
> +    return &imsic_cfg;
> +}
> +
> +static int __init imsic_get_parent_cpuid(const struct dt_device_node *node,
> +                                         unsigned int index,
> +                                         unsigned long *cpuid)
> +{
> +    int res;
> +    struct dt_phandle_args args;
> +
> +    res = dt_parse_phandle_with_args(node, "interrupts-extended",
> +                                     "#interrupt-cells", index, &args);
> +    if ( !res )
> +        res = dt_processor_cpuid(args.np->parent, cpuid);
> +
> +    return res;
> +}
> +
> +static int imsic_parse_node(const struct dt_device_node *node,
> +                            unsigned int *nr_parent_irqs)
> +{
> +    int rc;
> +    unsigned int tmp;
> +    paddr_t base_addr;
> +
> +    /* Find number of parent interrupts */
> +    *nr_parent_irqs = dt_number_of_irq(node);
> +    if ( !*nr_parent_irqs )
> +    {
> +        printk(XENLOG_ERR "%s: no parent irqs available\n", node->name);
> +        return -ENOENT;
> +    }
> +
> +    if ( !dt_property_read_u32(node, "riscv,guest-index-bits",
> +                               &imsic_cfg.guest_index_bits) )
> +        imsic_cfg.guest_index_bits = 0;
> +    tmp = BITS_PER_LONG - IMSIC_MMIO_PAGE_SHIFT;
> +    if ( tmp < imsic_cfg.guest_index_bits )
> +    {
> +        printk(XENLOG_ERR "%s: guest index bits too big\n", node->name);
> +        return -ENOENT;
> +    }
> +
> +    /* Find number of HART index bits */
> +    if ( !dt_property_read_u32(node, "riscv,hart-index-bits",
> +                               &imsic_cfg.hart_index_bits) )
> +    {
> +        /* Assume default value */
> +        imsic_cfg.hart_index_bits = fls(*nr_parent_irqs);
> +        if ( BIT(imsic_cfg.hart_index_bits, UL) < *nr_parent_irqs )
> +            imsic_cfg.hart_index_bits++;
> +    }
> +    tmp -= imsic_cfg.guest_index_bits;
> +    if ( tmp < imsic_cfg.hart_index_bits )
> +    {
> +        printk(XENLOG_ERR "%s: HART index bits too big\n", node->name);
> +        return -ENOENT;
> +    }
> +
> +    /* Find number of group index bits */
> +    if ( !dt_property_read_u32(node, "riscv,group-index-bits",
> +                               &imsic_cfg.group_index_bits) )
> +        imsic_cfg.group_index_bits = 0;
> +    tmp -= imsic_cfg.hart_index_bits;
> +    if ( tmp < imsic_cfg.group_index_bits )
> +    {
> +        printk(XENLOG_ERR "%s: group index bits too big\n", node->name);
> +        return -ENOENT;
> +    }
> +
> +    /* Find first bit position of group index */
> +    tmp = IMSIC_MMIO_PAGE_SHIFT * 2;
> +    if ( !dt_property_read_u32(node, "riscv,group-index-shift",
> +                               &imsic_cfg.group_index_shift) )
> +        imsic_cfg.group_index_shift = tmp;
> +    if ( imsic_cfg.group_index_shift < tmp )
> +    {
> +        printk(XENLOG_ERR "%s: group index shift too small\n", node->name);
> +        return -ENOENT;
> +    }
> +    tmp = imsic_cfg.group_index_bits + imsic_cfg.group_index_shift - 1;
> +    if ( tmp >= BITS_PER_LONG )
> +    {
> +        printk(XENLOG_ERR "%s: group index shift too big\n", node->name);
> +        return -EINVAL;
> +    }
> +
> +    /* Find number of interrupt identities */
> +    if ( !dt_property_read_u32(node, "riscv,num-ids", &imsic_cfg.nr_ids) )
> +    {
> +        printk(XENLOG_ERR "%s: number of interrupt identities not found\n",
> +               node->name);
> +        return -ENOENT;
> +    }
> +
> +    if ( (imsic_cfg.nr_ids < IMSIC_MIN_ID) ||
> +         (imsic_cfg.nr_ids > IMSIC_MAX_ID) ||
> +         ((imsic_cfg.nr_ids & IMSIC_MIN_ID) != IMSIC_MIN_ID) )
> +    {
> +        printk(XENLOG_ERR "%s: invalid number of interrupt identities\n",
> +               node->name);
> +        return -EINVAL;
> +    }
> +
> +    /* Compute base address */
> +    imsic_cfg.nr_mmios = 0;
> +    rc = dt_device_get_address(node, imsic_cfg.nr_mmios, &base_addr, NULL);
> +    if ( rc )
> +    {
> +        printk(XENLOG_ERR "%s: first MMIO resource not found\n", node->name);
> +        return rc;
> +    }
> +
> +    imsic_cfg.base_addr = base_addr;
> +    imsic_cfg.base_addr &= ~(BIT(imsic_cfg.guest_index_bits +
> +                           imsic_cfg.hart_index_bits +
> +                           IMSIC_MMIO_PAGE_SHIFT, UL) - 1);

Nit: indentation, similarly ...

> +    imsic_cfg.base_addr &= ~((BIT(imsic_cfg.group_index_bits, UL) - 1) <<
> +                           imsic_cfg.group_index_shift);

... here.

> +    /* Find number of MMIO register sets */
> +    do {
> +        imsic_cfg.nr_mmios++;
> +    } while ( !dt_device_get_address(node, imsic_cfg.nr_mmios, &base_addr, NULL) );
> +
> +    return 0;
> +}
> +
> +int __init imsic_init(const struct dt_device_node *node)
> +{
> +    int rc;
> +    unsigned long reloff, cpuid;
> +    uint32_t nr_parent_irqs, index, nr_handlers = 0;

I can't spot why unsigned int wouldn't be suitable here. In fact e.g. ...

> +    paddr_t base_addr;
> +    unsigned int nr_mmios;
> +
> +    /* Parse IMSIC node */
> +    rc = imsic_parse_node(node, &nr_parent_irqs);

... this one wants to yield unsigned int * according to the function parameter's
type.

> +    if ( rc )
> +        return rc;
> +
> +    nr_mmios = imsic_cfg.nr_mmios;
> +
> +    /* Allocate MMIO resource array */
> +    imsic_cfg.mmios = xzalloc_array(struct imsic_mmios, nr_mmios);
> +    if ( !imsic_cfg.mmios )
> +        return -ENOMEM;
> +
> +    imsic_cfg.msi = xzalloc_array(struct imsic_msi, nr_parent_irqs);
> +    if ( !imsic_cfg.msi )
> +        return -ENOMEM;

Leaking the earlier successful allocation?

> +    /* Check MMIO register sets */
> +    for ( unsigned int i = 0; i < nr_mmios; i++ )
> +    {
> +        imsic_cfg.mmios[i].cpus = xzalloc_array(unsigned long,
> +                                                BITS_TO_LONGS(nr_parent_irqs));
> +        if ( !imsic_cfg.mmios[i].cpus )
> +            return -ENOMEM;

Leaking all earlier successful allocations?

> +        rc = dt_device_get_address(node, i, &imsic_cfg.mmios[i].base_addr,
> +                                   &imsic_cfg.mmios[i].size);
> +        if ( rc )
> +        {
> +            printk(XENLOG_ERR "%s:  unable to parse MMIO regset %d\n",

Nit: Excess blank.

> +                   node->name, i);
> +            goto imsic_init_err;
> +        }
> +
> +        base_addr = imsic_cfg.mmios[i].base_addr;
> +        base_addr &= ~(BIT(imsic_cfg.guest_index_bits +
> +                     imsic_cfg.hart_index_bits +
> +                     IMSIC_MMIO_PAGE_SHIFT, UL) - 1);
> +        base_addr &= ~((BIT(imsic_cfg.group_index_bits, UL) - 1) <<
> +                     imsic_cfg.group_index_shift);

As above, indentation again.

> +        if ( base_addr != imsic_cfg.base_addr )
> +        {
> +            rc = -EINVAL;
> +            printk(XENLOG_ERR "%s: address mismatch for regset %d\n",
> +                   node->name, i);
> +            goto imsic_init_err;
> +        }
> +    }
> +
> +    /* Configure handlers for target CPUs */
> +    for ( unsigned int i = 0; i < nr_parent_irqs; i++ )
> +    {
> +        rc = imsic_get_parent_cpuid(node, i, &cpuid);

Coming back to a comment I gave on the respective earlier patch: What you get back
here is a DT value, aiui. There's no translation to Xen CPU numbering space, as
would be required for e.g. ...

> +        if ( rc )
> +        {
> +            printk(XENLOG_WARNING "%s: cpu ID for parent irq%d not found\n",
> +                   node->name, i);
> +            continue;
> +        }
> +
> +        if ( cpuid >= num_possible_cpus() )

... this. Are you using DT numbering without any translation, no matter that it
(I suppose) could be very sparse?

> +        {
> +            printk(XENLOG_WARNING "%s: unsupported cpu ID=%lu for parent irq%d\n",
> +                   node->name, cpuid, i);

Nit: i is unsigned int, so wants formatting with %u (also applicable elsewhere).

> +            continue;
> +        }
> +
> +        /* Find MMIO location of MSI page */
> +        index = nr_mmios;
> +        reloff = i * BIT(imsic_cfg.guest_index_bits, UL) * IMSIC_MMIO_PAGE_SZ;
> +        for ( unsigned int j = 0; nr_mmios; j++ )

DYM "j < nr_mmios"?

> +        {
> +            if ( reloff < imsic_cfg.mmios[j].size )
> +            {
> +                index = j;
> +                break;
> +            }
> +
> +            /*
> +             * MMIO region size may not be aligned to
> +             * BIT(global->guest_index_bits) * IMSIC_MMIO_PAGE_SZ
> +             * if holes are present.
> +             */
> +            reloff -= ROUNDUP(imsic_cfg.mmios[j].size,
> +                BIT(imsic_cfg.guest_index_bits, UL) * IMSIC_MMIO_PAGE_SZ);
> +        }
> +
> +        if ( index >= nr_mmios )

Why is it that you need both "index" and "j"?

> +        {
> +            printk(XENLOG_WARNING "%s: MMIO not found for parent irq%d\n",
> +                   node->name, i);
> +            continue;
> +        }
> +
> +        if ( !IS_ALIGNED(imsic_cfg.msi[cpuid].base_addr + reloff, PAGE_SIZE) )
> +        {
> +            printk(XENLOG_WARNING "%s: MMIO address 0x%lx is not aligned on a page\n",

Please prefer to use %#lx, as we do elsewhere.

> +                   node->name, imsic_cfg.msi[cpuid].base_addr + reloff);
> +            imsic_cfg.msi[cpuid].offset = 0;
> +            imsic_cfg.msi[cpuid].base_addr = 0;
> +            continue;
> +        }
> +
> +        bitmap_set(imsic_cfg.mmios[index].cpus, cpuid, 1);

Depending on clarification on the number space used, this may want to be
cpumask_set_cpu() instead. Else I think this is simply __set_bit().

> +        imsic_cfg.msi[cpuid].base_addr = imsic_cfg.mmios[index].base_addr;
> +        imsic_cfg.msi[cpuid].offset = reloff;

How come it's cpuid that's used as array index here? Shouldn't this be i,
seeing that the array allocation is using nr_parent_irqs?

> +        nr_handlers++;
> +    }
> +
> +    if ( !nr_handlers )
> +    {
> +        printk(XENLOG_ERR "%s: No CPU handlers found\n", node->name);
> +        rc = -ENODEV;
> +        goto imsic_init_err;
> +    }
> +
> +    return 0;
> +
> + imsic_init_err:
> +    for ( unsigned int i = 0; i < nr_mmios; i++ )
> +        XFREE(imsic_cfg.mmios[i].cpus);

This can be just xfree(), as the array itself ...

> +    XFREE(imsic_cfg.mmios);

... is then also freed.

> +    XFREE(imsic_cfg.msi);
> +
> +    return rc;
> +}
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/imsic.h
> @@ -0,0 +1,65 @@
> +/* SPDX-License-Identifier: MIT */
> +
> +/*
> + * xen/arch/riscv/imsic.h
> + *
> + * RISC-V Incoming MSI Controller support
> + *
> + * (c) 2023 Microchip Technology Inc.
> + */
> +
> +#ifndef ASM__RISCV__IMSIC_H
> +#define ASM__RISCV__IMSIC_H
> +
> +#include <xen/types.h>
> +
> +#define IMSIC_MMIO_PAGE_SHIFT   12
> +#define IMSIC_MMIO_PAGE_SZ      (1UL << IMSIC_MMIO_PAGE_SHIFT)
> +
> +#define IMSIC_MIN_ID            63

This isn't the "minimum ID", but the "minimum permissible number of IDs" as per
its first use in imsic_parse_node(). Further uses there consider it a mask,
which makes me wonder whether the imsic_cfg.nr_ids field name is actually
correct: Isn't this the maximum valid ID rather than their count/number?

Jan

