Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2B088001C
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 15:58:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695435.1085171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmavJ-0001cq-Ad; Tue, 19 Mar 2024 14:58:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695435.1085171; Tue, 19 Mar 2024 14:58:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmavJ-0001aD-75; Tue, 19 Mar 2024 14:58:41 +0000
Received: by outflank-mailman (input) for mailman id 695435;
 Tue, 19 Mar 2024 14:58:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aOUF=KZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmavH-0000z5-UQ
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 14:58:40 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a91ebe8-e601-11ee-a1ee-f123f15fe8a2;
 Tue, 19 Mar 2024 15:58:38 +0100 (CET)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-56a9f5694dcso2458139a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 07:58:38 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z16-20020a170906669000b00a46e6affa44sm528793ejo.19.2024.03.19.07.58.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 07:58:36 -0700 (PDT)
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
X-Inumbo-ID: 2a91ebe8-e601-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710860317; x=1711465117; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YbUW3ePII5ZAiaDBAEc4H/aS4xDzwNvro+S1RlWt2Dk=;
        b=PMa+4+prRSn37g8oOqV+UzFG1LArBkYEsSONQb1gs4ELkmWc8DlFVCT68zFspQrBVB
         LFfUZJryCLo09Hz8iTrcVnlW0sEPPMHDTJQXIF0DBoTbX3AZa06SYMhctS2/1FdNIMe2
         OhJ7jUPdUDWn0yIH7w/Oy5gihqcjL47rLrmP3AL+DiTA3Yb1jdK1qABTPO7YB057Cmjx
         byjLWF9rIcZ9LoDskga72XTQuTODhOdPpMKWuHiJJgOiRseCDeNxtLPc7vJG+WS4Yr6X
         cpAW0YTlgUCAsmDIhPsPtsRL+HB4rvWrY7XjEeRtYHaSl0SXlTaMUCMBbTujdo4k1g3d
         4pbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710860317; x=1711465117;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YbUW3ePII5ZAiaDBAEc4H/aS4xDzwNvro+S1RlWt2Dk=;
        b=WEtDtbKtaa6dJiTuweE7KUaYfqSy4qhPkx3pDAO3l5tyZjjE/G5xwsYCsBzxA2psPF
         8UmuoC8/Xwd08/EFFy8lwaiK7VziTOUFC3i7YZ8/E4ZNs/XAQyQ5Y9YXbiYnfsZ88ZtU
         af5p0KsDgXK1Q6jRgAkSDlcJmWVFPlji6IkSwoPZ0jTEcKXZaPqE1VFSsl6AS8KgJaCr
         zl/zEJsx8ABflyqvOfoFO91vkvIIy3zLdHm9otm7DpTDNiNBgLswbDtgilVrQOpo1hDa
         Xb/vh3QHR4cmdZVNx/nTgzn4qWKH94TSq4aFAf51+Goo1VauA19HCb2+0ZtaUZvWZJKf
         tNUA==
X-Forwarded-Encrypted: i=1; AJvYcCX25Q7crbW1WG9t0OfZeYvrLWE0v3s+qQRMDcfI7UXx/gSF7gDd2mGrRyo2yaYgRj/L1ilzb1fD/OuJheKMUQ16vP3rabL4dnyPCegDrtc=
X-Gm-Message-State: AOJu0YzzLxvwMi8kQL+ZbUvWuv7dHu18iT3vdSE4SsH7KoTyKwcw9pQD
	ZEbQmHpSe7HBdKLab9TnUXpqLVLXgKl5Y/PKsEUReAYZtexRhLjRqPI+sH2iLj9APL6d4PHq6FM
	=
X-Google-Smtp-Source: AGHT+IEF57ZO2P59NhfhyciFLk33Rzp6Ts8VD8aTzpZztFCqBMP+Yjis0zu66+KkZwdqGMq4zP1W7g==
X-Received: by 2002:a17:906:af07:b0:a46:b028:7dd2 with SMTP id lx7-20020a170906af0700b00a46b0287dd2mr1847759ejb.48.1710860317349;
        Tue, 19 Mar 2024 07:58:37 -0700 (PDT)
Message-ID: <05e4d3da-4130-4c57-9855-43b685ce5005@suse.com>
Date: Tue, 19 Mar 2024 15:58:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/14] xen/common: add cache coloring common code
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
 <20240315105902.160047-2-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20240315105902.160047-2-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.03.2024 11:58, Carlo Nonato wrote:
> +Background
> +**********
> +
> +Cache hierarchy of a modern multi-core CPU typically has first levels dedicated
> +to each core (hence using multiple cache units), while the last level is shared
> +among all of them. Such configuration implies that memory operations on one
> +core (e.g. running a DomU) are able to generate interference on another core
> +(e.g. hosting another DomU). Cache coloring realizes per-set cache-partitioning
> +in software and mitigates this, guaranteeing higher and more predictable
> +performances for memory accesses.

Are you sure about "higher"? On an otherwise idle system, a single domain (or
vCPU) may perform better when not partitioned, as more cache would be available
to it overall.

> +How to compute the number of colors
> +###################################
> +
> +Given the linear mapping from physical memory to cache lines for granted, the
> +number of available colors for a specific platform is computed using three
> +parameters:
> +
> +- the size of the LLC.
> +- the number of the LLC ways.
> +- the page size used by Xen.
> +
> +The first two parameters can be found in the processor manual, while the third
> +one is the minimum mapping granularity. Dividing the cache size by the number of
> +its ways we obtain the size of a way. Dividing this number by the page size,
> +the number of total cache colors is found. So for example an Arm Cortex-A53
> +with a 16-ways associative 1 MiB LLC can isolate up to 16 colors when pages are
> +4 KiB in size.
> +
> +LLC size and number of ways are probed automatically by default so there's
> +should be no need to compute the number of colors by yourself.

Is this a leftover from the earlier (single) command line option?

> +Effective colors assignment
> +###########################
> +
> +When assigning colors:
> +
> +1. If one wants to avoid cache interference between two domains, different
> +   colors needs to be used for their memory.
> +
> +2. To improve spatial locality, color assignment should privilege continuity in

s/privilege/prefer/ ?

> +   the partitioning. E.g., assigning colors (0,1) to domain I and (2,3) to
> +   domain J is better than assigning colors (0,2) to I and (1,3) to J.

While I consider 1 obvious without further explanation, the same isn't
the case for 2: What's the benefit of spatial locality? If there was
support for allocating higher order pages, I could certainly see the
point, but iirc that isn't supported (yet).

> +Command line parameters
> +***********************
> +
> +Specific documentation is available at `docs/misc/xen-command-line.pandoc`.
> +
> ++----------------------+-------------------------------+
> +| **Parameter**        | **Description**               |
> ++----------------------+-------------------------------+
> +| ``llc-coloring``     | enable coloring at runtime    |
> ++----------------------+-------------------------------+
> +| ``llc-size``         | set the LLC size              |
> ++----------------------+-------------------------------+
> +| ``llc-nr-ways``      | set the LLC number of ways    |
> ++----------------------+-------------------------------+
> +
> +Auto-probing of LLC specs
> +#########################
> +
> +LLC size and number of ways are probed automatically by default.
> +
> +LLC specs can be manually set via the above command line parameters. This
> +bypasses any auto-probing and it's used to overcome failing situations or for
> +debugging/testing purposes.

As well as perhaps for cases where the auto-probing logic is flawed?

> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1706,6 +1706,43 @@ This option is intended for debugging purposes only.  Enable MSR_DEBUGCTL.LBR
>  in hypervisor context to be able to dump the Last Interrupt/Exception To/From
>  record with other registers.
>  
> +### llc-coloring
> +> `= <boolean>`
> +
> +> Default: `false`
> +
> +Flag to enable or disable LLC coloring support at runtime. This option is
> +available only when `CONFIG_LLC_COLORING` is enabled. See the general
> +cache coloring documentation for more info.
> +
> +### llc-nr-ways
> +> `= <integer>`
> +
> +> Default: `Obtained from hardware`
> +
> +Specify the number of ways of the Last Level Cache. This option is available
> +only when `CONFIG_LLC_COLORING` is enabled. LLC size and number of ways are used
> +to find the number of supported cache colors. By default the value is
> +automatically computed by probing the hardware, but in case of specific needs,
> +it can be manually set. Those include failing probing and debugging/testing
> +purposes so that it's possibile to emulate platforms with different number of
> +supported colors. If set, also "llc-size" must be set, otherwise the default
> +will be used.
> +
> +### llc-size
> +> `= <size>`
> +
> +> Default: `Obtained from hardware`
> +
> +Specify the size of the Last Level Cache. This option is available only when
> +`CONFIG_LLC_COLORING` is enabled. LLC size and number of ways are used to find
> +the number of supported cache colors. By default the value is automatically
> +computed by probing the hardware, but in case of specific needs, it can be
> +manually set. Those include failing probing and debugging/testing purposes so
> +that it's possibile to emulate platforms with different number of supported
> +colors. If set, also "llc-nr-ways" must be set, otherwise the default will be
> +used.

Wouldn't it make sense to infer "llc-coloring" when both of the latter options
were supplied?

> --- a/xen/arch/Kconfig
> +++ b/xen/arch/Kconfig
> @@ -31,3 +31,23 @@ config NR_NUMA_NODES
>  	  associated with multiple-nodes management. It is the upper bound of
>  	  the number of NUMA nodes that the scheduler, memory allocation and
>  	  other NUMA-aware components can handle.
> +
> +config LLC_COLORING
> +	bool "Last Level Cache (LLC) coloring" if EXPERT
> +	depends on HAS_LLC_COLORING
> +	depends on !NUMA
> +
> +config NR_LLC_COLORS
> +	int "Maximum number of LLC colors"
> +	range 2 1024
> +	default 128
> +	depends on LLC_COLORING
> +	help
> +	  Controls the build-time size of various arrays associated with LLC
> +	  coloring. Refer to cache coloring documentation for how to compute the
> +	  number of colors supported by the platform. This is only an upper
> +	  bound. The runtime value is autocomputed or manually set via cmdline.
> +	  The default value corresponds to an 8 MiB 16-ways LLC, which should be
> +	  more than what's needed in the general case. Use only power of 2 values.

I think I said so before: Rather than telling people to pick only power-of-2
values (and it remaining unclear what happens if they don't), why don't you
simply keep them from specifying anything bogus, by having them pass in the
value to use as a power of 2? I.e. "range 1 10" and "default 7" for what
you're currently putting in place.

> +	  1024 is the number of colors that fit in a 4 KiB page when integers are 4
> +	  bytes long.

How's this relevant here? As a justification it would make sense to have in
the description.

I'm btw also not convinced this is a good place to put these options. Imo ...

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -71,6 +71,9 @@ config HAS_IOPORTS
>  config HAS_KEXEC
>  	bool
>  
> +config HAS_LLC_COLORING
> +	bool
> +
>  config HAS_PMAP
>  	bool

... they'd better live further down from here.

> --- /dev/null
> +++ b/xen/common/llc-coloring.c
> @@ -0,0 +1,102 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Last Level Cache (LLC) coloring common code
> + *
> + * Copyright (C) 2022 Xilinx Inc.
> + */
> +#include <xen/keyhandler.h>
> +#include <xen/llc-coloring.h>
> +#include <xen/param.h>
> +
> +static bool __ro_after_init llc_coloring_enabled;
> +boolean_param("llc-coloring", llc_coloring_enabled);
> +
> +static unsigned int __initdata llc_size;
> +size_param("llc-size", llc_size);
> +static unsigned int __initdata llc_nr_ways;
> +integer_param("llc-nr-ways", llc_nr_ways);
> +/* Number of colors available in the LLC */
> +static unsigned int __ro_after_init max_nr_colors;
> +
> +static void print_colors(const unsigned int *colors, unsigned int num_colors)
> +{
> +    unsigned int i;
> +
> +    printk("{ ");
> +    for ( i = 0; i < num_colors; i++ )
> +    {
> +        unsigned int start = colors[i], end = start;
> +
> +        printk("%u", start);
> +
> +        for ( ; i < num_colors - 1 && end + 1 == colors[i + 1]; i++, end++ )
> +            ;
> +
> +        if ( start != end )
> +            printk("-%u", end);
> +
> +        if ( i < num_colors - 1 )
> +            printk(", ");
> +    }
> +    printk(" }\n");
> +}
> +
> +void __init llc_coloring_init(void)
> +{
> +    unsigned int way_size;
> +
> +    if ( !llc_coloring_enabled )
> +        return;
> +
> +    if ( llc_size && llc_nr_ways )
> +        way_size = llc_size / llc_nr_ways;
> +    else
> +    {
> +        way_size = get_llc_way_size();
> +        if ( !way_size )
> +            panic("LLC probing failed and 'llc-size' or 'llc-nr-ways' missing\n");
> +    }
> +
> +    /*
> +     * The maximum number of colors must be a power of 2 in order to correctly
> +     * map them to bits of an address.
> +     */
> +    max_nr_colors = way_size >> PAGE_SHIFT;
> +
> +    if ( max_nr_colors & (max_nr_colors - 1) )
> +        panic("Number of LLC colors (%u) isn't a power of 2\n", max_nr_colors);
> +
> +    if ( max_nr_colors < 2 || max_nr_colors > CONFIG_NR_LLC_COLORS )
> +        panic("Number of LLC colors (%u) not in range [2, %u]\n",
> +              max_nr_colors, CONFIG_NR_LLC_COLORS);

Rather than crashing when max_nr_colors is too large, couldn't you simply
halve it a number of times? That would still satisfy the requirement on
isolation, wouldn't it?

> +    arch_llc_coloring_init();
> +}
> +
> +void cf_check dump_llc_coloring_info(void)

I don't think cf_check is needed here nor ...

> +void cf_check domain_dump_llc_colors(const struct domain *d)

... here anymore. You're using direct calls now.

Jan

