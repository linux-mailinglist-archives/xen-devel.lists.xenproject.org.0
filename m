Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEE69E00FD
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 12:53:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846601.1261758 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI4zS-0006mH-9k; Mon, 02 Dec 2024 11:53:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846601.1261758; Mon, 02 Dec 2024 11:53:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI4zS-0006jc-78; Mon, 02 Dec 2024 11:53:22 +0000
Received: by outflank-mailman (input) for mailman id 846601;
 Mon, 02 Dec 2024 11:53:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tI4zQ-0006jW-Lc
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 11:53:20 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0496534d-b0a4-11ef-a0d2-8be0dac302b0;
 Mon, 02 Dec 2024 12:53:17 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-aa5b0d8bd41so483578166b.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 03:53:17 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5998e6a4csm506173866b.106.2024.12.02.03.53.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 03:53:16 -0800 (PST)
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
X-Inumbo-ID: 0496534d-b0a4-11ef-a0d2-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MmIiLCJoZWxvIjoibWFpbC1lajEteDYyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjA0OTY1MzRkLWIwYTQtMTFlZi1hMGQyLThiZTBkYWMzMDJiMCIsInRzIjoxNzMzMTQwMzk3LjMxNDg1OSwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733140396; x=1733745196; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5DoJVkRDl7xqQfr3XVSjHuo8s60t3A5HPd+qP0iUR2M=;
        b=Ph0XTUPt9AUR8w8z8LXWGegtDGwsNsqj9GBjp0ahnaLLEAyAx6FLTIwQ9lXesfOztA
         LKf21ybY4KgVODmRY4/1QxA9LR2StRH/rFS/e793U6smHCdjPrIGeWYHr0YF7lxq3/Db
         ZiYLOOVj7g8FPfpokhwheA3yTjj/Iu/rP6RbJrVICiE7r7lwMLA1H0Qsh6PS6LqTQLM1
         xHJ4IQx1aNZLELM6y8ZNgormw8aBGk9ih4qOckQmkwucc0DxNWSuV4Q3ynnoWcVuim6Q
         D4rV5cUdKyHdrbvTgJIeaIlJctftU8JTNIJsgvjhdPlKgJc4cDahY/wKuUeP6vSKCBMw
         82vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733140396; x=1733745196;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5DoJVkRDl7xqQfr3XVSjHuo8s60t3A5HPd+qP0iUR2M=;
        b=byiNrKew2MYRjcJliJ659SsnVQ+4yxSLi3EnJfRtTJXgiPQD4AR5ioQDFD6fQZBYw/
         3E04/fup7ELqe4QgnF32H+zHU6+uIn/KesBfqfBLupyfsJ/7gWKPdU+S0xIiRZX8vhTF
         mxsN5ElYh39YC6dXl7lyM/3WmzoJrwhPT2zi3QwNXmNwk9dVJefmlF/efxI4LfzW+P/r
         dnQnzPVgT5DDjj3Fas+sdbLaZkZbPmgjjKlouq9gk0a1r52k+7WaQFzbVwnJQ6ItebHV
         t0j9Qd+ubc3PfZib1N0UCUzLTnQnhDAjTquMX6tYo5Ma5ipF6UD4ohnM12qNmUXE7sEA
         CXIw==
X-Forwarded-Encrypted: i=1; AJvYcCUNTYzGqau10JiynPM4JiwWYNtZwvucZpJqYg21h2cjF18mdIUwA8yGMmzxN9sUKAOkvnXP8H74138=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw7AJY0bp1qs108VeVlPXx9jDfa1sewvCWcI1+8m4tAFjceY8kB
	CfE98OfsLXu+YAk1k6LFZDp2cW1z8Mdqp6MexGXZmui2N3BJf9q1GXYg8Qh58g==
X-Gm-Gg: ASbGnctaLSVSpuiu2WveB3Vv8r9SORnAeYjW8EZsXtWtDwPWtAOFKUQcWk8EyV46Kio
	qy8bXqDJtWZVKd38TJJQdy+IaiBdHvpbi3xpfik6jXtCVgFNa87jiT4m3PlFMVk2+Fra56W+xOI
	ihD0tF775yW5EwoKJBT1y//KOqknpllKGlq9Slmp8dzwmCQnh1mRR5/uvQdatqYSe549wQFxpSn
	KME4NpYHvi7iVJMd683PWg1rrWEuBPd8R2+1QYWrIyr119Gbz+m6rWAY6nhw/pjczsaqNJ6Gcuf
	uHWUgQZNoH0lC1A5i56HSghkc9dHOxTOkao=
X-Google-Smtp-Source: AGHT+IEZqItffRhnEE3Z99JLOePc9SGQCNLZJThczJcrs8fxacPAWKXR4tL2LSp7bTQ8l3GVRfdsGw==
X-Received: by 2002:a17:906:1bb1:b0:a9a:1739:91e9 with SMTP id a640c23a62f3a-aa580f26c3bmr1864896366b.24.1733140396515;
        Mon, 02 Dec 2024 03:53:16 -0800 (PST)
Message-ID: <91e6d4e7-b4ff-4e13-8814-95eaac891cf4@suse.com>
Date: Mon, 2 Dec 2024 12:53:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/15] x86/hyperlaunch: locate dom0 kernel with
 hyperlaunch
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-9-dpsmith@apertussolutions.com>
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
In-Reply-To: <20241123182044.30687-9-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.11.2024 19:20, Daniel P. Smith wrote:
> Look for a subnode of type `multiboot,kernel` within a domain node. If found,
> process the reg property for the MB1 module index. If the bootargs property is
> present and there was not an MB1 string, then use the command line from the
> device tree definition.

Why specifically MB1?

> --- a/xen/arch/x86/domain_builder/core.c
> +++ b/xen/arch/x86/domain_builder/core.c
> @@ -56,6 +56,18 @@ void __init builder_init(struct boot_info *bi)
>  
>          printk(XENLOG_INFO "  Number of domains: %d\n", bi->nr_domains);
>      }
> +    else
> +    {
> +        int i;

Plain int when ...

> +        /* Find first unknown boot module to use as Dom0 kernel */
> +        printk("Falling back to using first boot module as dom0\n");
> +        i = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
> +        bi->mods[i].type = BOOTMOD_KERNEL;
> +        bi->domains[0].kernel = &bi->mods[i];
> +        bi->nr_domains = 1;
> +    }

... it's used as array index (and there's no check for the function return
value being negative)?

> --- a/xen/arch/x86/domain_builder/fdt.c
> +++ b/xen/arch/x86/domain_builder/fdt.c
> @@ -14,6 +14,122 @@
>  
>  #include "fdt.h"
>  
> +static inline int __init fdt_get_prop_as_reg(

What does "reg" stand for here?

> +    const void *fdt, int node, const char *name, unsigned int ssize,
> +    unsigned int asize, uint64_t *size, uint64_t *addr)
> +{
> +    int ret;
> +    const struct fdt_property *prop;
> +    fdt32_t *cell;
> +
> +    /* FDT spec max size is 4 (128bit int), but largest arch int size is 64 */
> +    if ( ssize > 2 || asize > 2 )
> +        return -EINVAL;
> +
> +    prop = fdt_get_property(fdt, node, name, &ret);
> +    if ( !prop || ret < sizeof(u32) )
> +        return ret < 0 ? ret : -EINVAL;
> +
> +    /* read address field */
> +    cell = (fdt32_t *)prop->data;
> +
> +    if ( asize == 1 )
> +    {
> +        uint32_t val;
> +        fdt_cell_as_u32(cell, &val);
> +        *addr = (uint64_t)val;

No need for a cast here nor ...

> +    }
> +    else
> +        fdt_cell_as_u64(cell, addr);
> +
> +    /* read size field */
> +    cell += asize;
> +
> +    if ( ssize == 1 )
> +    {
> +        uint32_t val;
> +        fdt_cell_as_u32(cell, &val);
> +        *size = (uint64_t)val;

... here?

> +    }
> +    else
> +        fdt_cell_as_u64(cell, size);
> +
> +    return 0;
> +}

This whole function reads very much like a library one. Does it really need
adding here, rather than to the FDT library code we already have? In any
event there's nothing x86-specific about it, afaics.

> +static int __init dom0less_module_node(
> +    void *fdt, int node, int size_size, int address_size)

Three times plain int, when ...

> +{
> +    uint64_t size, addr;
> +    int ret = fdt_get_prop_as_reg(fdt, node, "reg", size_size, address_size,

... two get converted to unsigned int in the course of the function call
here?

> +                                  &size, &addr);
> +    /* An FDT error value may have been returned, translate to -EINVAL */
> +    if ( ret < 0 )
> +        return -EINVAL;
> +
> +    if ( size != 0 )
> +        return -EOPNOTSUPP;

Not knowing much about DT: What does 0 represent here?

> +    if ( addr > MAX_NR_BOOTMODS )
> +        return -ERANGE;
> +
> +    /*
> +     * MAX_NR_BOOTMODS cannot exceed the max for MB1, represented by a u32,
> +     * thus the cast down to a u32 will be safe due to the prior check.
> +     */
> +    return (int)addr;

Comment and cast contradict one another. DYM u32 (really: uint32_t), or plain
int? If you mean to return a plain int (for the sake of the -errno values
further up), MAX_NR_BOOTMODS needs to stay below 2**31.

> +static int __init process_domain_node(
> +    struct boot_info *bi, void *fdt, int dom_node)
> +{
> +    int node;
> +    struct boot_domain *bd = &bi->domains[bi->nr_domains];
> +    const char *name = fdt_get_name(fdt, dom_node, NULL);
> +    int address_size = fdt_address_cells(fdt, dom_node);
> +    int size_size = fdt_size_cells(fdt, dom_node);
> +
> +    if ( address_size < 0 || size_size < 0 )
> +    {
> +        printk("  failed processing #address or #size for domain %s)\n",
> +               name == NULL ? "unknown" : name);
> +        return -EINVAL;
> +    }
> +
> +    fdt_for_each_subnode(node, fdt, dom_node)
> +    {
> +        if ( fdt_node_check_compatible(fdt, node, "multiboot,kernel") == 0 )
> +        {
> +            int idx = dom0less_module_node(fdt, node, size_size, address_size);
> +            if ( idx < 0 )
> +            {
> +                printk("  failed processing kernel module for domain %s)\n",
> +                       name == NULL ? "unknown" : name);
> +                return idx;
> +            }
> +
> +            if ( idx > bi->nr_modules )
> +            {
> +                printk("  invalid kernel module index for domain node (%d)\n",
> +                       bi->nr_domains);
> +                return -EINVAL;
> +            }
> +
> +            printk("  kernel: boot module %d\n", idx);
> +            bi->mods[idx].type = BOOTMOD_KERNEL;
> +            bd->kernel = &bi->mods[idx];
> +        }
> +    }

What if you find two?

> --- a/xen/arch/x86/domain_builder/fdt.h
> +++ b/xen/arch/x86/domain_builder/fdt.h
> @@ -3,6 +3,7 @@
>  #define __XEN_X86_FDT_H__
>  
>  #include <xen/init.h>
> +#include <xen/libfdt/libfdt.h>
>  
>  #include <asm/bootinfo.h>
>  
> @@ -10,6 +11,22 @@
>  #define HYPERLAUNCH_MODULE_IDX 0
>  
>  #ifdef CONFIG_DOMAIN_BUILDER
> +
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
> +
> +    return 0;
> +}

Basic library routines again?

Jan

