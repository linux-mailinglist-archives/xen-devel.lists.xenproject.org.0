Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0763A83F09
	for <lists+xen-devel@lfdr.de>; Thu, 10 Apr 2025 11:39:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.945139.1343395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2oNj-00049f-Vw; Thu, 10 Apr 2025 09:39:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 945139.1343395; Thu, 10 Apr 2025 09:39:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2oNj-00046d-ST; Thu, 10 Apr 2025 09:39:35 +0000
Received: by outflank-mailman (input) for mailman id 945139;
 Thu, 10 Apr 2025 09:39:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w6Mj=W4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u2oNi-00046X-Gh
 for xen-devel@lists.xenproject.org; Thu, 10 Apr 2025 09:39:34 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b576b102-15ef-11f0-9eac-5ba50f476ded;
 Thu, 10 Apr 2025 11:39:33 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-39c14016868so449477f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 10 Apr 2025 02:39:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39d8936115asm4318560f8f.12.2025.04.10.02.39.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Apr 2025 02:39:32 -0700 (PDT)
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
X-Inumbo-ID: b576b102-15ef-11f0-9eac-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744277973; x=1744882773; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tsq01yQqTKHo/6ctipWEXRrbdJBeY396uyVO71SAIQA=;
        b=NzDxsGVXeL++A8EzEczQncLv+fERhBYvXmA8en2XFgTZI7/aFSEn0g5hx+BH2+bgsk
         YO/thps7b3VEQTwq4vez1MbP884AQsdwhp4Xar1vLmJQAjuo6nHmPwgp8TgL4tAT0EeE
         0dqH1wKNwALEZhkMkWMOPzMP3majT8tsIYhtc10+CbgKcF2vthzpCULsBwlba8EhMFNf
         75at/E1eEWgdlbt1vr8C1X0eTaG9bpalX+2yUpHAh+woU8KrnCfQdcH2P/hEL6G7k0Oe
         K/NIpOnZ1LUgSMBhHMhU8r5ycAGLplwv68lz0zMYW0Zn16PstX51K5c1dcv+1oEIdPcP
         g96w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744277973; x=1744882773;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tsq01yQqTKHo/6ctipWEXRrbdJBeY396uyVO71SAIQA=;
        b=KLpdG9iHUm6kw1Pjvq7N1c405Mf/7giGc4nPyDwhF7QIrbCQS1NBOe9UMvgtqDCJh+
         k/1fsIjkDPFE0OOyxsK49owYfcjdYOtxmSdqg84GswAC3LzUD8w+4jTibxHBn3rDphs6
         wiMNIa1Mr9N/Q3yUfhretZg7gn55hG+56DZznKRrICjCZpxmS5LrYWpzfLcMHS+2mR8P
         TJ3k2g8Mop7u77jZsUMPUWR9Luemq4GaN7NAjLBIMA0gtP9SdJoRTAIwy19QRO3OG2tH
         elCmjd9goBMPIgW9aT1n/uDury1a5MaELB6uNLYLONEtGJGvEQm9+Yv1VXJck40hZ3DP
         e2BQ==
X-Forwarded-Encrypted: i=1; AJvYcCXG2gxv41wue3utXhM4N2FZmX/XE78x+KwSGwtVkdSxYBAAMU3NPBDKkPfJUHZJp/5RIzdMzpRnMqs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxj0qYRe2wwVmhfjIuLa0RS4OlT4N5YPfYiHLrfUxvFy56CiKiy
	ZhR3LDzFAukF//4+gQ+xx+3lptxeLQTX8t8b1hirWKkOBFO/kpkmGLMZzwwIzw==
X-Gm-Gg: ASbGncuuWdP1wzMXta00vFSo/f7cbPSlhunfVqDzcYj+RBuOgG4W/YioVwrxTHRYgfg
	Z3uN1zqJ590/I70xHmJ9hfuLdweGVGyrTvkQs39LQbsuBot9Ew2cAA0cPOZe31DbkKP1Tdh7yRe
	fCccpiF1c2RysHUnWNWdIfhMY6UkrwQGc3IFwkW+LdahQwZjLB82vh/aO6jy1EucykQMik7y5Tz
	/egh/pg2eTO/xbYtEnTxlv6pJdaDMPAD3v0+8/SXrIYmVcMSt/l1a5ucJGHI8knnWsmc7zvY9Es
	83AsBuYfqJFyX78s5YVCefBX7ApgTGga5x7d96ED9Fjy0U5sBCnBifGyauQIgMS8iuXYUIWlqRV
	4/g4O1DBWFO2TBxyY+T62Y6DN7g==
X-Google-Smtp-Source: AGHT+IF+CSldukE8NjcfFMaFMvMbr7cz+C1R3Nrjo8d9pHccuXQVhbPQglN7tCk93t9qZYeJ7TZ/SA==
X-Received: by 2002:a05:6000:4383:b0:391:4977:5060 with SMTP id ffacd0b85a97d-39d8fda7511mr1572935f8f.53.1744277972912;
        Thu, 10 Apr 2025 02:39:32 -0700 (PDT)
Message-ID: <c0d675de-6755-46d0-a5b4-c818798394a9@suse.com>
Date: Thu, 10 Apr 2025 11:39:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/16] x86/hyperlaunch: introduce the domain builder
To: Alejandro Vallejo <agarciav@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Jason Andryuk <jason.andryuk@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-7-agarciav@amd.com>
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
In-Reply-To: <20250408160802.49870-7-agarciav@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.04.2025 18:07, Alejandro Vallejo wrote:
> --- a/xen/arch/x86/Makefile
> +++ b/xen/arch/x86/Makefile
> @@ -1,6 +1,7 @@
>  obj-y += acpi/
>  obj-y += boot/
>  obj-y += cpu/
> +obj-y += domain-builder/

I continue to be irritated that this isn't obj-$(DOMAIN_BUILDER). The
sole function in core.c has "if ( IS_ENABLED(CONFIG_DOMAIN_BUILDER) )" around
its entire body (which is unhelpful at least from an indentation pov), and
the sole function in fdt.c is only used by the one in core.c. builder_init()
clearly could have an inline stub alternative as of this patch. If future
patches change that picture, imo that would need saying here to justify this
unconditional descend into the new subdir.

> --- a/xen/arch/x86/domain-builder/Kconfig
> +++ b/xen/arch/x86/domain-builder/Kconfig
> @@ -3,7 +3,7 @@ menu "Domain Builder Features"
>  
>  config DOMAIN_BUILDER
>  	bool "Domain builder (UNSUPPORTED)" if UNSUPPORTED
> -	select LIB_DEVICE_TREE
> +	select LIBFDT

That's what the earlier patch meant to be doing?

> --- /dev/null
> +++ b/xen/arch/x86/domain-builder/Makefile
> @@ -0,0 +1,2 @@
> +obj-$(CONFIG_DOMAIN_BUILDER) += fdt.init.o
> +obj-y += core.init.o

*.init.o want enlisting into obj-bin-y.

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

For people not using hyperlaunch (which for the time being is likely going
to be a majority) this log line will be little more than spam. I'd like it
to be considered to be dropped.

> --- /dev/null
> +++ b/xen/arch/x86/domain-builder/fdt.c
> @@ -0,0 +1,37 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2024, Apertus Solutions, LLC
> + */
> +#include <xen/err.h>

Was xen/errno.h meant here?

> +#include <xen/init.h>
> +#include <xen/lib.h>

I don't see anything used from there.

> +#include <xen/libfdt/libfdt.h>
> +
> +#include <asm/bootinfo.h>
> +#include <asm/page.h>

How does page.h come into play here?

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -36,6 +36,7 @@
>  #include <asm/bzimage.h>
>  #include <asm/cpu-policy.h>
>  #include <asm/desc.h>
> +#include <asm/domain-builder.h>
>  #include <asm/e820.h>
>  #include <asm/edd.h>
>  #include <asm/genapic.h>
> @@ -1281,9 +1282,12 @@ void asmlinkage __init noreturn __start_xen(void)
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

For this I think it would be quite desirable if in a prereq patch i's type
was (finally) changed to unsigned int, which is how it's used effectively
everywhere, with one loop requiring a little bit of adjustment.

> +    bi->mods[i].type = BOOTMOD_KERNEL;

Overrunning the array if MAX_NR_BOOTMODS + 1 was returned.

Jan

