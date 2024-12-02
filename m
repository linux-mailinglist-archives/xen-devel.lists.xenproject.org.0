Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A87C29DFE60
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 11:11:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846517.1261681 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI3O7-0007is-PF; Mon, 02 Dec 2024 10:10:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846517.1261681; Mon, 02 Dec 2024 10:10:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI3O7-0007gL-LV; Mon, 02 Dec 2024 10:10:43 +0000
Received: by outflank-mailman (input) for mailman id 846517;
 Mon, 02 Dec 2024 10:10:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iCIG=S3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tI3O6-0007gF-1d
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 10:10:42 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad5c121a-b095-11ef-99a3-01e77a169b0f;
 Mon, 02 Dec 2024 11:10:37 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5d0e75dd846so1387477a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 02:10:37 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5996dbf31sm493652166b.47.2024.12.02.02.10.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 02:10:36 -0800 (PST)
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
X-Inumbo-ID: ad5c121a-b095-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo1MzIiLCJoZWxvIjoibWFpbC1lZDEteDUzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImFkNWMxMjFhLWIwOTUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMzMTM0MjM3Ljg1NTI1Nywic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1733134237; x=1733739037; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o2n9k1fhN9P3/o67X3PSacLZ7WGYwV/ZLouRvWA0zN0=;
        b=QsSeKtPvoGBG2L+VXRSU7palxWheKSxqykTku/Ctc0csB5a6vmiho1Nc0k1sS77fnx
         G4/r+f69JW+UZwnMGuFOyjLk90+3RgE1HE30LDRuDs9T6dY8w2yNzFZuL5ma4FXwyb0u
         dbol1P0pF6IkITrg8Pf20oEYTiz9mPQQK1kJbdRYeuFnDzF6a6YsxYNVKGH/AFOxQW6V
         32sO0b3JKq4OcFphxTw3rsswtj6fe8zqDTVTWPAsAu79+t2Cxmz80mxd/yXCfivC9GwU
         FmWFsXr9WIyqkKNF8xj5QY9sxF3VheS8BctfFgG6GAQCE0Zzp4uSagPfz4sLqlx8Stmw
         tSVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733134237; x=1733739037;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o2n9k1fhN9P3/o67X3PSacLZ7WGYwV/ZLouRvWA0zN0=;
        b=klv71dA6kSQfIpMNU1S9B1DHlbJD34uKP6TiUkVRp0fSDHiNodO0gzNM10AFI4cAL3
         KujninIf4clYjRQF611/Myrw9KVXezqL/xEP8WM9/jJxRbDFrxyAyzHoL0r4rgu6r1iP
         lkhLfVq8aPpi3+B/xDJ8M/6sSNE+HaZ5y4h+z4OAGrhsIKXzxRbQ9JxZXxXVYFJfL5wh
         WUDvMA66BzdBxIqf9vO1ZTn+9FyICRmHsNlvt5WneNErPlmJQkhXDe609NQRme9Wk0lf
         GpfA0duWByKdbcZSxdEFdtDg0PgIJY4ZvFiuG1sUTsT3FsAX0EFLvJ7/vlF7gkCW2/lZ
         FIsg==
X-Forwarded-Encrypted: i=1; AJvYcCVPSDb+V+njcvSQ/CWWCIzSc01RwXc9u35f2OZCztIzsmIhk4F73gYGScf3kxxJj1a33vYO9/Q8B70=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyC0ii5yHPT403zgGRtMIslV/SO9PLpJh/l+wPmT+GtRRhYuKdV
	ynHj6zUlwDOvP7kpUeYAMuOW8Bj2eQB4bd/nppCl0ZG/PL+L8VDfSO3uSUsnxg==
X-Gm-Gg: ASbGncvO1VF2NZP1e89G2eHjk4MWxjMz4CyPAOAjwTkNn8zyPpV0KLvtpq2nBTNnO5b
	RZ9aPSoP2z3M6OQ8akeIeNhkyIbtRBUvRNR5i1wsDtGKmIGxdwJoFfDDcKZwFtPtP4G6F4zaykV
	lfs66uXmX6BQJHD/SUVB1lZDKd4ExXYDfBTn3fR2EjKA5CuIKSbyazWlUmUdMhSjBHXvc7h4oaS
	+f7CVPG6s+uGACQHF14zKYlNzE8v/MbILaDp0oqWk970s0BWx7hlX4j8KF79wvm/LIawwBVtwbe
	C2uzC/jYnObXeBFdvABEQxKdJLEWbHyp41s=
X-Google-Smtp-Source: AGHT+IE7kS8BCw7GoeM7M2zsR9xDbP8wAFQK3Ns7Mi2uel5yg7h0SxhZ/cIhgsXl+I81EDDX1ChP3A==
X-Received: by 2002:a05:6402:358a:b0:5d0:81af:4a43 with SMTP id 4fb4d7f45d1cf-5d081af8571mr21465304a12.0.1733134237215;
        Mon, 02 Dec 2024 02:10:37 -0800 (PST)
Message-ID: <f12f30f2-c1ea-4118-bbd0-c37a948f0ac2@suse.com>
Date: Mon, 2 Dec 2024 11:10:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/15] x86/hyperlaunch: introduce the domain builder
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: jason.andryuk@amd.com, christopher.w.clark@gmail.com,
 stefano.stabellini@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20241123182044.30687-1-dpsmith@apertussolutions.com>
 <20241123182044.30687-7-dpsmith@apertussolutions.com>
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
In-Reply-To: <20241123182044.30687-7-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.11.2024 19:20, Daniel P. Smith wrote:
> Introduce the domain builder which is capable of consuming a device tree as the
> first boot module. If it finds a device tree as the first boot module, it will
> set its type to BOOTMOD_FDT. This change only detects the boot module and
> continues to boot with slight change to the boot convention that the dom0
> kernel is no longer first boot module but is the second.
> 
> No functional change intended.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>  xen/arch/x86/Makefile                    |  2 +
>  xen/arch/x86/domain_builder/Makefile     |  3 ++
>  xen/arch/x86/domain_builder/core.c       | 55 ++++++++++++++++++++++++
>  xen/arch/x86/domain_builder/fdt.c        | 38 ++++++++++++++++
>  xen/arch/x86/domain_builder/fdt.h        | 21 +++++++++
>  xen/arch/x86/include/asm/bootinfo.h      |  3 ++
>  xen/arch/x86/include/asm/domainbuilder.h |  8 ++++
>  xen/arch/x86/setup.c                     | 18 +++++---
>  8 files changed, 142 insertions(+), 6 deletions(-)
>  create mode 100644 xen/arch/x86/domain_builder/Makefile
>  create mode 100644 xen/arch/x86/domain_builder/core.c
>  create mode 100644 xen/arch/x86/domain_builder/fdt.c
>  create mode 100644 xen/arch/x86/domain_builder/fdt.h

As I'm sure I indicated before: Dashes instead of underscores please in new
files' names.

>  create mode 100644 xen/arch/x86/include/asm/domainbuilder.h

Why is there no separator in this file's name?

Similar question as on an earlier patch: Why is all of this x86-specific, when
a goal was generalization?

> --- /dev/null
> +++ b/xen/arch/x86/domain_builder/core.c
> @@ -0,0 +1,55 @@
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
> +        case -EINVAL:
> +            printk("Hyperlaunch device tree was not detected\n");
> +            bi->hyperlaunch_enabled = false;
> +            break;
> +        case -ENOENT:
> +            fallthrough;

No need for this.

> +        case -ENODATA:
> +            printk("Device tree found, but not hyperlaunch (%d)\n", ret);
> +            bi->hyperlaunch_enabled = false;
> +            bi->mods[0].type = BOOTMOD_FDT;
> +            break;
> +        default:
> +            printk("Unknown error (%d) occured checking for hyperlaunch device tree\n",
> +                   ret);
> +            bi->hyperlaunch_enabled = false;
> +        }

Nit: Misra demands "break" at the end of default as well.

Blank lines between non-fallthrough blocks would also be nice.

> +

Nit: Excess blank line.

> --- /dev/null
> +++ b/xen/arch/x86/domain_builder/fdt.c
> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2024, Apertus Solutions, LLC
> + */
> +#include <xen/err.h>
> +#include <xen/init.h>
> +#include <xen/lib.h>
> +#include <xen/libfdt/libfdt.h>
> +#include <xen/rangeset.h> /* required for asm/setup.h */
> +
> +#include <asm/bootinfo.h>
> +#include <asm/page.h>
> +#include <asm/setup.h>
> +
> +#include "fdt.h"
> +
> +int __init has_hyperlaunch_fdt(struct boot_info *bi)
> +{
> +    int ret = 0;
> +    void *fdt = bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX]);

const void *?

> @@ -1277,9 +1278,12 @@ void asmlinkage __init noreturn __start_xen(void)
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

Better latch the result here into a separate local variable, for use ...

> @@ -1466,8 +1470,9 @@ void asmlinkage __init noreturn __start_xen(void)
>          xen->size  = __2M_rwdata_end - _stext;
>      }
>  
> -    bi->mods[0].headroom =
> -        bzimage_headroom(bootstrap_map_bm(&bi->mods[0]), bi->mods[0].size);
> +    i = first_boot_module_index(bi, BOOTMOD_KERNEL);
> +    bi->mods[i].headroom =
> +        bzimage_headroom(bootstrap_map_bm(&bi->mods[i]), bi->mods[i].size);
>      bootstrap_unmap();
>  
>  #ifndef highmem_start
> @@ -1591,7 +1596,8 @@ void asmlinkage __init noreturn __start_xen(void)
>  #endif
>      }
>  
> -    if ( bi->mods[0].headroom && !bi->mods[0].relocated )
> +    i = first_boot_module_index(bi, BOOTMOD_KERNEL);
> +    if ( bi->mods[i].headroom && !bi->mods[0].relocated )
>          panic("Not enough memory to relocate the dom0 kernel image\n");
>      for ( i = 0; i < bi->nr_modules; ++i )
>      {

... in these two places?

Jan

