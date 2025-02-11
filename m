Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDC2A30B2B
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 13:09:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885487.1295294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thp4Y-0006V3-Pq; Tue, 11 Feb 2025 12:09:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885487.1295294; Tue, 11 Feb 2025 12:09:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thp4Y-0006Sn-My; Tue, 11 Feb 2025 12:09:02 +0000
Received: by outflank-mailman (input) for mailman id 885487;
 Tue, 11 Feb 2025 12:09:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hVvi=VC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1thp4X-0006Sh-7V
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 12:09:01 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f8c25d16-e870-11ef-a075-877d107080fb;
 Tue, 11 Feb 2025 13:08:58 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-ab7ca64da5dso305990566b.0
 for <xen-devel@lists.xenproject.org>; Tue, 11 Feb 2025 04:08:58 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab7c62c464dsm349581266b.28.2025.02.11.04.08.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2025 04:08:57 -0800 (PST)
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
X-Inumbo-ID: f8c25d16-e870-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739275737; x=1739880537; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=L/O2iboCN0tGhojzNUfKzeIFk/Rdj+qaEUIlQip/8Uc=;
        b=Qk2gqhlTn6TI1TwxuSdEZxm7y+xaq5XTyln0pE0WKsCNbv3TatFHiwyNFh4sdu8Qpk
         9OrgOADJySfhXxc3HVYR8LV7+4nFWpsQAW43zEbvdOKszqW5ha47Aov8Z4QFrJ1XiX4D
         iBq0qJMUQ1p+DlY46iIY+b3t1bpGS8IExvOhrsibF08CTd9JEBMSp5Eqg+IwxizsGZmh
         UckqVyNeJnOLumO6hsfCGYxwOhj2QlXJkpQ646c6e57TsyWfpDxpd/68TwS0tUYOyJwZ
         /icXHCyvT9Of+MtZ0lLu1u1dDBrwp4M8Mx0TfmAl8oRs0SmnRXvnPVgF/vgJ1YW1j+64
         B8uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739275737; x=1739880537;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/O2iboCN0tGhojzNUfKzeIFk/Rdj+qaEUIlQip/8Uc=;
        b=OPbbtP6J3TRJsbIx4DSSMpItJHX/Aif60SP1YCEMqi6iUhnNZmbVl86O+yxmXXaMse
         30vGWFwLhyxo9eHIkW73P815oj8pEEzA3GDpC03LKMzw6KPbpZz/5zZQV06cMO8e5nnw
         jQeHbXY3Bm1IP4mJ/40v7jkOWnDOUvgcwjQTbpltU4QWskmsQdFG21kPNO1XH+og+Gci
         lF8Ju4jW5xqgPIulIiyhrmr6GSQGW6qchHYC3XWR1y2pEX7yhaYzj5F2lA9WkFlutkY5
         bdyx7hVIts6O5hfRbi9OibtJuEgiEZApaGrID3Zc1d+0N+duDKHh0mGTqShYxzWn36XA
         rSHg==
X-Forwarded-Encrypted: i=1; AJvYcCXBXbxE9uw1VopUpJvfB6TIEmCBvgKoy4xkmXT9IGiVnfqJXhF+XqBuAvItCdr64C28So1+XjVKXpg=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx7nDSGUJsP95L3KYdKFREtpHjtKzup7ZgA8xZKrJqlDsad+q04
	nmT+lfnbzelbkBJCqo8YKKZwA6h6KxJ2XLpqfIWjadJ/AhyMmGGqNJ/vIw5mew==
X-Gm-Gg: ASbGncs6XIyuDyJXln0KG+XXpWfl+UL50e4N0ma4JtDzQRRmdqda/NLOO1BW4R9rm2Q
	NuQ0ZcY7CHNTkNPqjnCFjgF/Ulws+yWDZUM/hAelaT7gsLt7wt3rWBHyFqIVv5KdUPzHzxATEHZ
	nBJpwMiQQlXyWYzEb+wPjnEI6AfUr8W0NMNw40yTl/ds5zsVdxm1Dy58g4mXnjtb1uY5JkWyssz
	Pp9ut+Pfow4s+S+H2kf8MtPPzdPIeFek878oX4T/ZlqfKPr8fRmUkyrphLAIXfNUASA6wvoNBc7
	/efqP4hyfWVwtjCg1/sZ5JVqgBgBhniYVMJFJF/mobViLbBa6D84/GfD4E2TH+fNof2XLZUkvY0
	I
X-Google-Smtp-Source: AGHT+IGVpYqv8yBYhJsNvHigVRgeYyAVef5KMySzMRIie99Yf/mBmS9qnKrcmfxLr0wAWupE1+jqiA==
X-Received: by 2002:a17:907:2da0:b0:ab3:9aba:ce7d with SMTP id a640c23a62f3a-ab7daf00f52mr235973966b.1.1739275737381;
        Tue, 11 Feb 2025 04:08:57 -0800 (PST)
Message-ID: <ed8af131-7f1b-47db-8d28-553977a4f3cd@suse.com>
Date: Tue, 11 Feb 2025 13:08:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/11] xen/x86: introduce "cpufreq=amd-cppc" xen
 cmdline
To: Penny Zheng <Penny.Zheng@amd.com>
Cc: Ray.Huang@amd.com, Jason.Andryuk@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250206083255.1296363-1-Penny.Zheng@amd.com>
 <20250206083255.1296363-4-Penny.Zheng@amd.com>
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
In-Reply-To: <20250206083255.1296363-4-Penny.Zheng@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.02.2025 09:32, Penny Zheng wrote:
> --- /dev/null
> +++ b/xen/arch/x86/acpi/cpufreq/amd-cppc.c
> @@ -0,0 +1,64 @@
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
> +        const char *end = strpbrk(s, ",;");
> +
> +        if ( !amd_cppc_handle_option(s, end) )

You have an incoming "e" here. What if the comma / semicolon you find
is past where that points? (I understand you've copied that from
hwp_cmdline_parse(), and should have raised the question already there
when reviewing the respective patch. It also looks as if behavior-
wise all would be okay here. It's just that this very much looks like
a buffer overrun on the first and second glance.)

> +        {
> +            printk(XENLOG_WARNING
> +                   "cpufreq/amd-cppc: option '%.*s' not recognized\n",
> +                   (int)((end ?: e) - s), s);
> +
> +            return -EINVAL;
> +        }
> +
> +        s = end ? ++end : end;

The increment is odd here (again inherited from the HWP function), as
"end" is about to go out of scope.

> +    } while ( s && s < e );
> +
> +    return 0;
> +}
> +
> +static const struct cpufreq_driver __initconst_cf_clobber amd_cppc_cpufreq_driver =

Once again too long a line.

> --- a/xen/arch/x86/acpi/cpufreq/cpufreq.c
> +++ b/xen/arch/x86/acpi/cpufreq/cpufreq.c
> @@ -148,6 +148,9 @@ static int __init cf_check cpufreq_driver_init(void)
>                  case CPUFREQ_none:
>                      ret = 0;
>                      break;
> +                default:
> +                    printk(XENLOG_WARNING "Unsupported cpufreq driver for vendor Intel\n");

Same here. The string along overruning line length is fine. But this cal then
still be wrapped as

                    printk(XENLOG_WARNING
                           "Unsupported cpufreq driver for vendor Intel\n");

to respect the line length limit as much as possible.

> @@ -131,6 +131,15 @@ static int __init cf_check setup_cpufreq_option(const char *str)
>              if ( arg[0] && arg[1] )
>                  ret = hwp_cmdline_parse(arg + 1, end);
>          }
> +        else if ( choice < 0 && !cmdline_strcmp(str, "amd-cppc") )
> +        {
> +            xen_processor_pmbits |= XEN_PROCESSOR_PM_CPPC;
> +            cpufreq_controller = FREQCTL_xen;
> +            cpufreq_xen_opts[cpufreq_xen_cnt++] = CPUFREQ_amd_cppc;

While apparently again a pre-existing problem, the risk of array overrun
will become more manifest with this addition: People may plausibly want to
pass a universal option to Xen on all their instances:
"cpufreq=hwp,amd-cppc,xen". I think this wants taking care of in a prereq
patch, i.e. before you further extend it. Here you will then further want
to bump cpufreq_xen_opts[]'es dimension, to account for the now sensible
three-fold option.

I'm also missing IS_ENABLED(CONFIG_AMD) here. The counterpart thereof is
present for the earlier HWP alternative.

> --- a/xen/include/public/platform.h
> +++ b/xen/include/public/platform.h
> @@ -357,6 +357,7 @@ DEFINE_XEN_GUEST_HANDLE(xenpf_getidletime_t);
>  #define XEN_PROCESSOR_PM_CX	1
>  #define XEN_PROCESSOR_PM_PX	2
>  #define XEN_PROCESSOR_PM_TX	4
> +#define XEN_PROCESSOR_PM_CPPC	8

Hmm, seeing this addition: Why do all of these live in a public header?
They're used to set xen_processor_bits only, which is a Xen-internal
variable only. With apparently one exception: PV Dom0 is passed these
bits in si->flags. Does Dom0 have use for this new bit? If not it may
want assigning a value such that it falls outside of SIF_PM_MASK (and
then in a non-public header).

Jan

