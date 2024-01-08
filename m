Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CE88275D0
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 17:54:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663666.1033750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMssp-0006go-Jj; Mon, 08 Jan 2024 16:53:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663666.1033750; Mon, 08 Jan 2024 16:53:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMssp-0006eH-Gf; Mon, 08 Jan 2024 16:53:51 +0000
Received: by outflank-mailman (input) for mailman id 663666;
 Mon, 08 Jan 2024 16:53:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=KH4C=IS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rMssn-0006eB-Rd
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 16:53:49 +0000
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [2a00:1450:4864:20::22f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7d89c69a-ae46-11ee-9b0f-b553b5be7939;
 Mon, 08 Jan 2024 17:53:47 +0100 (CET)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2cd0f4797aaso21323471fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Jan 2024 08:53:47 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 s14-20020a92c5ce000000b0036002c8127asm52881ilt.5.2024.01.08.08.53.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 08:53:46 -0800 (PST)
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
X-Inumbo-ID: 7d89c69a-ae46-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704732827; x=1705337627; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dX9HEPcwcljxT6hAJkXfpEA1cMZtqolfZ7RILMSrI94=;
        b=gucXw5oDzDje4txOa+kX7Qd17DYdvBCAz/CFTDuhO2BRyuyQ54mSwwyRfqjus5HUxm
         IYL/CUYQtY6G6/uPfF1OwYGaRYE3dYDzZNkK5Peo/NMGikl6CjNPuXTQI/eFg0mnw1Oo
         AWngdCgHglUk2t2IICzwfERea4fHFFa9Rw0qIoASE9bFEYAcNLU+urAg2v+oRyzNH4xI
         Aglf4MCueWdeiCRloelh/eqv+ZtRx/i7wDt5TL13JiKE7/QDpI/L0TXb6bh20xQ/FskI
         iFfI0i9kz+Mtr4pPoLm2v43FSfgfqhWdbpgsn8ZVZOL2+jlNWVCgxWdtLGAm1usyDiiN
         Cgmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704732827; x=1705337627;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dX9HEPcwcljxT6hAJkXfpEA1cMZtqolfZ7RILMSrI94=;
        b=M1C+4bKHNKVFuCeS8Mo5sh+IdpB+t2gDJBl537U3eoWjAb0KAaQThbpb7PvPHit71Q
         lQ1fOHg4zbKjmcuSHTmPDSzma8mdMnWGi3WbGH9MLoiZldneKXm4/xjf3qHaulZwWIwM
         ert9Ig+xuuIbCq7RU60dWHAyYlSsfP4yMmZRkVdDOaQ75VYX7fdZZ6+WOZwTIzXKbVHF
         ypoKjI/r/sWBfD4usfGgPVozA6CpPbdycA4d46OgEs3hjVONT+qcCQuaOlyRQPQfCkQe
         Zup/ocggoTc0d4N9idLUp/uFBNslXFH2DZ9YWMZQLTnGU19h2x2L+v+VqaWjjJoQ04DF
         HF6Q==
X-Gm-Message-State: AOJu0YyUYb8pkNobDhCiUO2QL1QZzfd0OCKpKJhDj6KXux8sh7V344S2
	VmsYwDl41sMihq6dltAxcSqv9hu6LVHt
X-Google-Smtp-Source: AGHT+IH9IbXHoOemNRnKU+I6aiiTfRmpPlFYcTUCNzLbeMeR3hvPEqLktJoUwpr/0eeyrhP8dMGUHw==
X-Received: by 2002:a2e:a78e:0:b0:2cc:eeea:9e89 with SMTP id c14-20020a2ea78e000000b002cceeea9e89mr2046484ljf.7.1704732826830;
        Mon, 08 Jan 2024 08:53:46 -0800 (PST)
Message-ID: <feb5542a-081a-4677-b569-5d4218eb794d@suse.com>
Date: Mon, 8 Jan 2024 17:53:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/13] xen/common: add cache coloring common code
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-2-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20240102095138.17933-2-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.01.2024 10:51, Carlo Nonato wrote:
> This commit adds the Last Level Cache (LLC) coloring common header, Kconfig
> options and functions. Since this is an arch specific feature, actual
> implementation is postponed to later patches and Kconfig options are placed
> under xen/arch.

As a general remark / nit: "This commit", "this patch", or alike aren't
well suited for descriptions.

> --- a/xen/arch/Kconfig
> +++ b/xen/arch/Kconfig
> @@ -31,3 +31,19 @@ config NR_NUMA_NODES
>  	  associated with multiple-nodes management. It is the upper bound of
>  	  the number of NUMA nodes that the scheduler, memory allocation and
>  	  other NUMA-aware components can handle.
> +
> +config LLC_COLORING
> +	bool "Last Level Cache (LLC) coloring" if EXPERT
> +	depends on HAS_LLC_COLORING
> +
> +config NR_LLC_COLORS
> +	int "Maximum number of LLC colors"
> +	default 128

What if I set to value to 0? Or to an unreasonably large one? You don't
bound the value range at all.

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -7,6 +7,7 @@
>  #include <xen/compat.h>
>  #include <xen/init.h>
>  #include <xen/lib.h>
> +#include <xen/llc-coloring.h>
>  #include <xen/ctype.h>
>  #include <xen/err.h>
>  #include <xen/param.h>
> @@ -1144,6 +1145,9 @@ static void cf_check complete_domain_destroy(struct rcu_head *head)
>      struct vcpu *v;
>      int i;
>  
> +    if ( is_domain_llc_colored(d) )
> +        domain_llc_coloring_free(d);

Would be nice if the freeing function could be called unconditionally,
being a no-op for non-colored domains.

Further - is it really necessary to do this freeing this late?

> --- a/xen/common/keyhandler.c
> +++ b/xen/common/keyhandler.c
> @@ -6,6 +6,7 @@
>  #include <xen/debugger.h>
>  #include <xen/delay.h>
>  #include <xen/keyhandler.h>
> +#include <xen/llc-coloring.h>
>  #include <xen/param.h>
>  #include <xen/shutdown.h>
>  #include <xen/event.h>
> @@ -307,6 +308,9 @@ static void cf_check dump_domains(unsigned char key)
>  
>          arch_dump_domain_info(d);
>  
> +        if ( is_domain_llc_colored(d) )
> +            domain_dump_llc_colors(d);

I'm less concerned of the conditional here, but along the lines of the
comment above, it could of course again be the function that simply is
a no-op for non-colored domains.

> --- /dev/null
> +++ b/xen/include/xen/llc-coloring.h
> @@ -0,0 +1,46 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Last Level Cache (LLC) coloring common header
> + *
> + * Copyright (C) 2022 Xilinx Inc.
> + *
> + * Authors:
> + *    Carlo Nonato <carlo.nonato@minervasys.tech>
> + */
> +#ifndef __COLORING_H__
> +#define __COLORING_H__
> +
> +#include <xen/sched.h>
> +#include <public/domctl.h>
> +
> +#ifdef CONFIG_HAS_LLC_COLORING

Why does this matter here? IOW why ...

> +#include <asm/llc-coloring.h>
> +
> +#ifdef CONFIG_LLC_COLORING

... is it not just this which is checked?

> +extern bool llc_coloring_enabled;
> +#define llc_coloring_enabled (llc_coloring_enabled)
> +#endif
> +
> +#endif
> +
> +#ifndef llc_coloring_enabled
> +#define llc_coloring_enabled (false)
> +#endif

+1 to the question Julien has raised here.

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -626,6 +626,11 @@ struct domain
>  
>      /* Holding CDF_* constant. Internal flags for domain creation. */
>      unsigned int cdf;
> +
> +#ifdef CONFIG_LLC_COLORING
> +    unsigned int *llc_colors;

Can the color values change over the lifetime of a domain? If not,
it may be prudent to have this be pointer-to-const.

Jan

> +    unsigned int num_llc_colors;
> +#endif
>  };
>  
>  static inline struct page_list_head *page_to_list(


