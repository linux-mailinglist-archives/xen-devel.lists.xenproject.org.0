Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB39BAA0C2F
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 14:52:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.972529.1360863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9kRV-0002Rl-1r; Tue, 29 Apr 2025 12:52:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 972529.1360863; Tue, 29 Apr 2025 12:52:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9kRU-0002Qm-V9; Tue, 29 Apr 2025 12:52:08 +0000
Received: by outflank-mailman (input) for mailman id 972529;
 Tue, 29 Apr 2025 12:52:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9kRT-0002Ps-PL
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 12:52:07 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb81bee9-24f8-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 14:51:56 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5f63ac6ef0fso7548549a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 05:51:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5f703545234sm7335135a12.56.2025.04.29.05.51.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 05:51:56 -0700 (PDT)
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
X-Inumbo-ID: bb81bee9-24f8-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745931117; x=1746535917; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Np1GRY+1XqV1BiVWzCe+dlEPeaySw3Vj33fmsezJs+k=;
        b=bnmImZ0KPufp0/5J7t6WLZCdN0b6AWSYqZGM1J1OmASUSiHwW4dVOsmTxZaVxqB0Ox
         kMYiHbaD1kfsADLY14DJwrJQACUpl+0yUIR+sfSqcZwtC2PEJlvRCrCONyYwNnD7aga9
         wv9nllHlc1bBOp9eaLMcS7687CHhIPgoW+WXdlpXOjxslefGkeH7yRA4fWVscPzCjPtx
         D7j1grxhcG3dSF9fxZlXaCHPXMuY/GVUGK9ATmKa0tsCMcw9rld3AEmyvn3UJneDo9Ph
         wSJ7KP5809iNGXiSAf0koDcAc8GeYEp3982vHmg5IqeVA3/9VQUkev+3qoL3ijSpBgKG
         W2kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745931117; x=1746535917;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Np1GRY+1XqV1BiVWzCe+dlEPeaySw3Vj33fmsezJs+k=;
        b=b60SZZzUf0In5ANbuYGhxGxyD+PRzMvjB/Dp/R0P9/rrf8Tn+DscCmNSuxWJvyXy08
         AQtM6nFVy40jn7z8Ol+AMJhYjEoWsr2/NEuWBp5LcFDokF7MH6a6PT3FUq6E2h44DbdA
         9EP0fXIxg1KulgctFy6ObfTeTQ6e3vezrqLpda5zRJOQxCRkJul8o9CTkTe2eJfCvW1U
         KnottDIy3USn42XWzfvMc842Fxn3fr0THDGvOmDvof22/mxGkj/rNeCpQzGael95MfTF
         A37Ne+zW/WD1vKQmZxMF/1n7WrwqEhS2/an1lcZVqWA/uK2Tivp6EUH5WmwatcSGA4nN
         2Urw==
X-Forwarded-Encrypted: i=1; AJvYcCXARo/Hw48H7Se5oP2QIxX2o23Rpn9IXb7qt7dnoMXI7pZVq89hg6ooCE7mHlE4OKy2qVmbKeqZ3ks=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw6e5BJcn2cHIspHlrzAlRUcpQl6Jia9va22nLriNDDqcqEHfwk
	YXezOZH9krPOLrB23ciT/LWHyH/AryZ4PC131PRsewmSNUWapsLzMXLbSkeo4A==
X-Gm-Gg: ASbGnctcZW9OVWKZtsaCDyDJUTzMg3w2/rrdgGlqIUnjuYlZPWou7qs7mWdZY1sfRRw
	/PAsHRw0UIF5YfLJiNJ1cyDzIZ7Rcn5E26uPtOUOlwCdzfpq4IT/jl5O6HnsqjRccdN8vnoXydh
	Cgt3eh3OBOp3RuuoQ2dO5kQAxQekHTO0kvvep0TLWDPfJ/OLDGkyK6u3MIt0rPcScBREb/om6t5
	fIzRFX6O1cl3MtBcewxJtKSbKoewF2fOlfG3ZrJUzZiO6oywPtDaa+43sQzc5B2oRc+ir6MwONh
	GoJnvOsxsP4NeEQnTyG9AnbHQ3a28S4bJqLvHRQoK9dcpyCGEUnS7SbR+Ui3H8OVzQGnmlrcOhk
	TiK32nEL50vjBAg+pA92zvJI4RA==
X-Google-Smtp-Source: AGHT+IG38XggkJAAuMllwKysjA1+IecW/i7Uo625aRa6aKuLTscNYFTMSRIwngdrEYNyZjjaYohR9g==
X-Received: by 2002:a05:6402:13d5:b0:5ed:19b4:98ea with SMTP id 4fb4d7f45d1cf-5f8390bd1c6mr2771018a12.0.1745931116878;
        Tue, 29 Apr 2025 05:51:56 -0700 (PDT)
Message-ID: <57a3b2c0-d57d-46e3-b248-0e243f715423@suse.com>
Date: Tue, 29 Apr 2025 14:51:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/15] xen/x86: introduce "cpufreq=amd-cppc" xen
 cmdline
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250414074056.3696888-1-Penny.Zheng@amd.com>
 <20250414074056.3696888-6-Penny.Zheng@amd.com>
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
In-Reply-To: <20250414074056.3696888-6-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.04.2025 09:40, Penny Zheng wrote:
> @@ -514,5 +515,16 @@ acpi_cpufreq_driver = {
>  
>  int __init acpi_cpufreq_register(void)
>  {
> -    return cpufreq_register_driver(&acpi_cpufreq_driver);
> +    int ret;
> +
> +    ret = cpufreq_register_driver(&acpi_cpufreq_driver);
> +    if ( ret )
> +        return ret;
> +    /*
> +     * After cpufreq driver registeration, XEN_PROCESSOR_PM_CPPC
> +     * and XEN_PROCESSOR_PM_PX shall become exclusive flags
> +     */
> +    xen_processor_pmbits &= ~XEN_PROCESSOR_PM_CPPC;
> +
> +    return ret;
>  }

Why is no similar adjustment needed in powernow_register_driver()? In principle
I would have expected that it's not each individual driver which needs to care
about this aspect, but that the framework is taking care of this.

> --- /dev/null
> +++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
> @@ -0,0 +1,81 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * amd-cppc.c - AMD Processor CPPC Frequency Driver
> + *
> + * Copyright (C) 2025 Advanced Micro Devices, Inc. All Rights Reserved.
> + *
> + * Author: Penny Zheng <penny.zheng@amd.com>
> + *
> + * AMD CPPC cpufreq driver introduces a new CPU performance scaling design
> + * for AMD processors using the ACPI Collaborative Performance and Power
> + * Control (CPPC) feature which provides finer grained frequency control range.
> + */
> +
> +#include <xen/domain.h>
> +#include <xen/init.h>
> +#include <xen/param.h>
> +#include <acpi/cpufreq/cpufreq.h>
> +
> +static bool __init amd_cppc_handle_option(const char *s, const char *end)
> +{
> +    int ret;
> +
> +    ret = parse_boolean("verbose", s, end);
> +    if ( ret >= 0 )
> +    {
> +        cpufreq_verbose = ret;
> +        return true;
> +    }
> +
> +    return false;
> +}
> +
> +int __init amd_cppc_cmdline_parse(const char *s, const char *e)
> +{
> +    do
> +    {

Nit (style): Brace placement is special here, just like it is ...

> +        const char *end = strpbrk(s, ",;");
> +
> +        if ( !amd_cppc_handle_option(s, end) )
> +        {
> +            printk(XENLOG_WARNING
> +                   "cpufreq/amd-cppc: option '%.*s' not recognized\n",
> +                   (int)((end ?: e) - s), s);
> +
> +            return -EINVAL;
> +        }
> +
> +        s = end ? end + 1 : NULL;
> +    } while ( s && s < e );

... here.

> --- a/xen/arch/x86/platform_hypercall.c
> +++ b/xen/arch/x86/platform_hypercall.c
> @@ -542,6 +542,9 @@ ret_t do_platform_op(
>                  ret = -ENOSYS;
>                  break;
>              }
> +            /* Xen doesn't support mixed mode */
> +            ASSERT((xen_processor_pmbits & XEN_PROCESSOR_PM_CPPC) == 0);

Please prefer ! over "== 0" in such purely boolean contexts.

> @@ -573,6 +576,14 @@ ret_t do_platform_op(
>          }
>  
>          case XEN_PM_CPPC:
> +            if ( !(xen_processor_pmbits & XEN_PROCESSOR_PM_CPPC) )
> +            {
> +                ret = -EOPNOTSUPP;
> +                break;
> +            }

While at least you no longer use -ENOSYS here, I question this behavior,
including that for the pre-existing cases: How is the caller supposed to know
whether to invoke this sub-op? Ignoring errors is generally not a good idea,
so it would be better if the caller could blindly issue this request, getting
back success unless there really was an issue with the data provided.

> @@ -102,6 +103,9 @@ static int __init handle_cpufreq_cmdline(enum cpufreq_xen_opt option)
>      cpufreq_xen_opts[cpufreq_xen_cnt++] = option;
>      switch ( option )
>      {
> +    case CPUFREQ_amd_cppc:
> +        xen_processor_pmbits |= XEN_PROCESSOR_PM_CPPC;
> +        break;
>      case CPUFREQ_hwp:
>      case CPUFREQ_xen:
>          xen_processor_pmbits |= XEN_PROCESSOR_PM_PX;

Here and (about) everywhere else: Blank line please between non-fall-through
case blocks. I guess I'm not going to repeat this any further. There are
very tiny switch() statements where it is okay to violate this principle, but
as a rule of thumb - if in doubt, put a blank line there.

> --- a/xen/include/acpi/cpufreq/processor_perf.h
> +++ b/xen/include/acpi/cpufreq/processor_perf.h
> @@ -5,6 +5,9 @@
>  #include <public/sysctl.h>
>  #include <xen/acpi.h>
>  
> +/* ability bits */
> +#define XEN_PROCESSOR_PM_CPPC   8

This needs correlating (at least via commentary, better by build-time checking)
with the other XEN_PROCESSOR_PM_* values. Otherwise someone adding a new #define
in the public header may not (easily) notice a possible conflict. With that in
mind I also question whether 8 is actually a good choice: That's the obvious
next value to use in the public interface. SIF_PM_MASK is 8 bits wide, so a
sensible value to use here would by e.g. 0x100.

Jan

