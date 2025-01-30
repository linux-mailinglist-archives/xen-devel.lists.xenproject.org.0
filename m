Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8A7A230A5
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2025 15:53:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.879636.1289859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdVtn-0000L8-CE; Thu, 30 Jan 2025 14:52:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 879636.1289859; Thu, 30 Jan 2025 14:52:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tdVtn-0000JY-8N; Thu, 30 Jan 2025 14:52:07 +0000
Received: by outflank-mailman (input) for mailman id 879636;
 Thu, 30 Jan 2025 14:52:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zr8Z=UW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tdVtl-0000JS-K6
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2025 14:52:05 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c395e909-df19-11ef-99a4-01e77a169b0f;
 Thu, 30 Jan 2025 15:52:02 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-aaf900cc7fbso195258566b.3
 for <xen-devel@lists.xenproject.org>; Thu, 30 Jan 2025 06:52:02 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e49ffe2csm132946366b.97.2025.01.30.06.52.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2025 06:52:01 -0800 (PST)
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
X-Inumbo-ID: c395e909-df19-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1738248721; x=1738853521; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=85SvtHqP8cX49Ac7xOWKCkFBVDAoKOjQb6SChB5iD08=;
        b=gB9oQB3TDK0oigKG24gx8i0xQxomM5wPduMpOJrHsi8bLc3kcIenGRBeaI6/9OgnSi
         01yq4cv7Q1Aak4McLgCLjv4cjVcyMxkV16HW0gW5XdDgbDsUXisUIt141+z7q4eEyg2m
         kL3Qn7VCxgzqbjXlXjiNDfc5y19mRThrycDdnHENrVgsOCWRKuBiDjL80rTve4xuc9+N
         1hZK9w9mcyiZqnLAkgO2EhPAeMsCJE2HmUCmXafW1AGpaL4ghJYIBex8Qvm0zEnsvwQm
         HjAj54Aiy9XqBPA/14rH3I0hyUEFZCX+twih7d+aKE02tf8Ecqtoe7GJK88HBDPpPUpH
         Zc4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738248721; x=1738853521;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=85SvtHqP8cX49Ac7xOWKCkFBVDAoKOjQb6SChB5iD08=;
        b=GvdoGrYLMgW4ceRLA1rO4EhinlZ/4csYf39hN3D7PZuMqnxkSpNyJQ5UqmDCi7Fsoz
         Qh6aP59bBu8jdEzmh12cN6ZyL5zGAQNCri0B/MKiBe7qkC/2A2uuA9QfXoTMnleJjlT7
         UFPqLQX2nxwdFYde+dbEgKU78xe2ahL4bmG1NOXEqUdbaRb/fq1xQ2gQxz1oeSGksXpX
         NMc2yWibJxQk6GXbpLnm+nwr2adRLTXAr2wce13XilUcrbRKwkkWQDHFb+EAyHymksVD
         1SlFtBmgw0vggjSRp+SIlsYi2FnOo72OE420yybSo++/Dfp2TEfF+hN0R3ZQKhtLgajr
         WuwA==
X-Forwarded-Encrypted: i=1; AJvYcCWiw23jZm3ANzJdC0DyIaSJhuJlx3qIzF/OB3OeGK4+lYshUtImglRlGDtLq0Uc7onRYsTJ34jM2Z8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyESm9+LriFyrpKxgfYAaSDDjBvULCQmiYGeD+fIgBA1i7vUL0+
	ueqYdR9qcYEx4h7j0P8x35d3s4ZFg9YSYsB4cJF8yxNLc/B68yZ6uqjFhhcVqQ==
X-Gm-Gg: ASbGncsqceOAqIGcyLdl9jB9qAuFH6n3zW+aNcuKQ1zssZCaKUYCFVFpGPqa0jRRWAx
	N6FKv/uptWv20x69/FQLQPQuXT41gIsNVXGXQ7QcqoKR+9yflcblyvkCxbeIOb4eBYfAhUt9Z+s
	gHYRWdFTd0FuStE7VWBRnaUc4mBXkWJo/zgIaRTI7kLkBbr9sRipkMXQGY45OX6eDchY05x8ylT
	XyuUcFaJpwAijvEL3VdMr5z+QNA2ILVidk210Eq/vr76WCrKDNkYc23qhXT3qYtiloa5hr9TOCg
	CBYLM9FTlvTzJki52vnXOgqoNja8aDasDU3Ra27PfuVqKa36BxHApuAFpBIYazwky1YFgj1xNhd
	m
X-Google-Smtp-Source: AGHT+IHT+NilzeX2bT7xRutSVMoOBdrgFJhNwKe1b3EBqFrlblmVBGuiHgyy1lQkvIpk5D6lRHyWFQ==
X-Received: by 2002:a17:907:94cd:b0:ab6:3633:13e with SMTP id a640c23a62f3a-ab6cfdbd071mr878900966b.41.1738248721523;
        Thu, 30 Jan 2025 06:52:01 -0800 (PST)
Message-ID: <004b066a-b26f-44bd-994f-5c573f6511e6@suse.com>
Date: Thu, 30 Jan 2025 15:52:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 06/15] x86/hyperlaunch: introduce the domain builder
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241226165740.29812-1-dpsmith@apertussolutions.com>
 <20241226165740.29812-7-dpsmith@apertussolutions.com>
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
In-Reply-To: <20241226165740.29812-7-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.12.2024 17:57, Daniel P. Smith wrote:
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -81,6 +81,8 @@ obj-$(CONFIG_COMPAT) += x86_64/platform_hypercall.o
>  obj-y += sysctl.o
>  endif
>  
> +obj-y += domain-builder/

The set of subdirs needed in $(obj-y) is specified at the top of the file.
Also shouldn't this be obj-$(CONFIG_DOMAIN_BUILDER)?

> --- /dev/null
> +++ b/xen/arch/x86/domain-builder/core.c
> @@ -0,0 +1,57 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2024, Apertus Solutions, LLC
> + */
> +#include <xen/err.h>
> +#include <xen/init.h>
> +#include <xen/kconfig.h>
> +#include <xen/lib.h>
> +
> +#include <asm/bootinfo.h>
> +
> +#include "fdt.h"
> +
> +void __init builder_init(struct boot_info *bi)
> +{
> +    if ( IS_ENABLED(CONFIG_DOMAIN_BUILDER) )
> +    {
> +        int ret;
> +
> +        switch ( ret = has_hyperlaunch_fdt(bi) )
> +        {
> +        case 0:
> +            printk("Hyperlaunch device tree detected\n");
> +            bi->hyperlaunch_enabled = true;
> +            bi->mods[0].type = BOOTMOD_FDT;
> +            break;
> +
> +        case -EINVAL:
> +            printk("Hyperlaunch device tree was not detected\n");
> +            bi->hyperlaunch_enabled = false;
> +            break;
> +
> +        case -ENOENT:
> +        case -ENODATA:
> +            printk("Device tree found, but not hyperlaunch (%d)\n", ret);
> +            bi->hyperlaunch_enabled = false;
> +            bi->mods[0].type = BOOTMOD_FDT;
> +            break;
> +
> +        default:
> +            printk("Unknown error (%d) occured checking for hyperlaunch device tree\n",
> +                   ret);
> +            bi->hyperlaunch_enabled = false;
> +            break;
> +        }
> +    }
> +}

What is it that's x86-specific in here?

> --- /dev/null
> +++ b/xen/arch/x86/domain-builder/fdt.c
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2024, Apertus Solutions, LLC
> + */
> +#include <xen/err.h>
> +#include <xen/init.h>
> +#include <xen/lib.h>
> +#include <xen/libfdt/libfdt.h>
> +
> +#include <asm/bootinfo.h>
> +#include <asm/page.h>
> +#include <asm/setup.h>
> +
> +#include "fdt.h"
> +
> +int __init has_hyperlaunch_fdt(struct boot_info *bi)

Pointer-to-const?

> +{
> +    int ret = 0;
> +    const void *fdt = bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX]);
> +
> +    if ( fdt_check_header(fdt) < 0 )
> +        ret = -EINVAL;
> +
> +    bootstrap_unmap();
> +
> +    return ret;
> +}

Is this function intended to later be extended? Aiui anything fitting
the hyperlaunch-agnostic fdt_check_header() will do here, despite the
name of the function.

And again - what is it that's x86-specific in here?

> --- /dev/null
> +++ b/xen/arch/x86/domain-builder/fdt.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
> +#ifndef __XEN_X86_FDT_H__
> +#define __XEN_X86_FDT_H__
> +
> +#include <xen/init.h>
> +
> +#include <asm/bootinfo.h>

This isn't needed here, nor ...

> --- /dev/null
> +++ b/xen/arch/x86/include/asm/domainbuilder.h
> @@ -0,0 +1,8 @@
> +#ifndef __XEN_X86_DOMBUILDER_H__
> +#define __XEN_X86_DOMBUILDER_H__
> +
> +#include <asm/bootinfo.h>

... here, is it? Forward decls of struct boot_info are going to do.

> @@ -1285,9 +1286,12 @@ void asmlinkage __init noreturn __start_xen(void)
>                 bi->nr_modules);
>      }
>  
> -    /* Dom0 kernel is always first */
> -    bi->mods[0].type = BOOTMOD_KERNEL;
> -    bi->domains[0].kernel = &bi->mods[0];
> +    builder_init(bi);
> +
> +    /* Find first unknown boot module to use as Dom0 kernel */
> +    i = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
> +    bi->mods[i].type = BOOTMOD_KERNEL;
> +    bi->domains[0].kernel = &bi->mods[i];

This is going to change again later? Or else what about there already
being a module marked BOOTMOD_KERNEL?

Jan

