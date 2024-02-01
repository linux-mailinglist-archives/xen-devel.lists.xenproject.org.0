Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E05784585B
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 14:00:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674409.1049279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVWfX-0003i0-J2; Thu, 01 Feb 2024 12:59:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674409.1049279; Thu, 01 Feb 2024 12:59:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVWfX-0003fM-GB; Thu, 01 Feb 2024 12:59:51 +0000
Received: by outflank-mailman (input) for mailman id 674409;
 Thu, 01 Feb 2024 12:59:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFwQ=JK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rVWfV-0003do-Ca
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 12:59:49 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c5d893dc-c101-11ee-98f5-efadbce2ee36;
 Thu, 01 Feb 2024 13:59:45 +0100 (CET)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a3510d79ae9so108924266b.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 04:59:45 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 un6-20020a170907cb8600b00a36a7f0f087sm853168ejc.222.2024.02.01.04.59.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Feb 2024 04:59:44 -0800 (PST)
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
X-Inumbo-ID: c5d893dc-c101-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706792385; x=1707397185; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zl2cW3Nf4pRC//h1O/iq1g877AMcMR/l+E8T3gdpu4c=;
        b=WwCQMQpPaJNq3qRfK4HKLccSKMqIzeHhBm3Li6rMDu5+nrBCvvOHoV0s+pY4Q8JhBv
         hN72jbOvfBqzTHXpBqsv+qZuW87AF3Xctz+/8rqGDBWP/4DY+NMaO47xluzDdpKHwRuG
         WN4t8ny1hJnEdxrCI7dmjzMgR3u/7LCvL1+Hd+32scGf0mnfDuLZOqKwxLTGiYyWysfR
         a4exlMcICb9Ffv0Mdk3VZ7R7GtWIeT+b4OE/DfRCgiXm3/dPgsXJB+aYOwyFGhSvrqcz
         4cGsN1hFCpam1YHSvPCkVJqFsUDW0PYQOBkimiKnWCF1bo0Ke8zv4CBVIyW6tBhLZFda
         aKfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706792385; x=1707397185;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zl2cW3Nf4pRC//h1O/iq1g877AMcMR/l+E8T3gdpu4c=;
        b=loINMDXLkEvILakdMdGotnWzqKyfBJpPGM+qpWpgUW9PGCffKvoyf4DRuLVdyg/eYP
         MQooYlDVUC3J2kdKuj8OOst7nk8iki0gBj17c0MVFYTaJQe2nVlO+yWBOWePttfdeckd
         B0fdRz8hZCKfFLBfZpAbaEdlKHEJrM6pqe7nDhZo6c04RkTgxmnA1fQVV40KAOivHoHb
         2DhjYckNO1+4NT0eO0F87mmdRvBs4DNBYzBnq9FvDeoV9NLMDW6xMVe7Dzk0UY05YshD
         NrZ5NmlJUKcJvRQmX+z+7gRn+hs8AT2WHLWzaKFdscwEwi4F2byXmL44nfC+lxLqEpTU
         /zmQ==
X-Gm-Message-State: AOJu0YwtMbAZmRygDpYl64t8UGT/OaNckJbt3rOZPGSOaJL2u4wRl++u
	d/xV0mDG41oOBYHqOSK0KgkN7mKVHH14w/mDVuCNiEp2gnI6DJw/WxWJlszFZQ==
X-Google-Smtp-Source: AGHT+IGjwjGs0v1oXiJdD8mOW31gkXxFyk3rQD2SskaB5KSot/lGzXDyFgsWowu6ah8cajrXrFalzg==
X-Received: by 2002:a17:906:a883:b0:a36:5079:d6c9 with SMTP id ha3-20020a170906a88300b00a365079d6c9mr3338004ejb.76.1706792384939;
        Thu, 01 Feb 2024 04:59:44 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXMv61hXbNFRRGNxKyhVFyOzUYucwqmMJh7MEuQw8gspOkU4MzN9MwCijeDbkN5hQ5zqGi/3nGaG+efacx08Z4JOatK1pioa50xojOtAQ1ZZ2f7Y7OK3mJ4Up49Ardy5KLUsN9xijDO5IL3abIN6I68+3z7IArUef5p3J2DkofcdSY81mYQGPor4BabVq6G7hvytIuUFvpTRzEoB5JFCe/aPYAT8cEzqvr2IYxHXcYZtlqRlB69Xh/hgSWbQQlDTuigkcmKDzHZFFCM7kachH4wGiO9ohms
Message-ID: <749799db-de6f-4ca8-bab1-67468f97929b@suse.com>
Date: Thu, 1 Feb 2024 13:59:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/15] xen/common: add cache coloring common code
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Marco Solieri <marco.solieri@minervasys.tech>,
 xen-devel@lists.xenproject.org
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-2-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20240129171811.21382-2-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.01.2024 18:17, Carlo Nonato wrote:
> --- a/xen/arch/Kconfig
> +++ b/xen/arch/Kconfig
> @@ -31,3 +31,20 @@ config NR_NUMA_NODES
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
> +	range 2 1024

What's the reasoning behind this upper bound? IOW - can something to this
effect be said in the description, please?

> +	default 128
> +	depends on LLC_COLORING
> +	help
> +	  Controls the build-time size of various arrays associated with LLC
> +	  coloring. Refer to cache coloring documentation for how to compute the
> +	  number of colors supported by the platform. This is only an upper
> +	  bound. The runtime value is autocomputed or manually set via cmdline.
> +	  The default value corresponds to an 8 MiB 16-ways LLC, which should be
> +	  more than what needed in the general case.

Aiui while not outright wrong, non-power-of-2 values are meaningless to
specify. Perhaps that is worth mentioning (if not making this a value
that's used as exponent of 2 in the first place)?

As to the default and its description: As said for the documentation,
doesn't what this corresponds to also depend on cache line size? Even
if this was still Arm-specific rather than common code, I'd question
whether now and forever Arm chips may only use one pre-determined cache
line size.

> --- /dev/null
> +++ b/xen/common/llc-coloring.c
> @@ -0,0 +1,87 @@
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
> +bool __ro_after_init llc_coloring_enabled;
> +boolean_param("llc-coloring", llc_coloring_enabled);

The variable has no use right now afaics, so it's unclear whether (a) it
is legitimately non-static and (b) placed in an appropriate section.

> +/* Size of an LLC way */
> +static unsigned int __ro_after_init llc_way_size;
> +size_param("llc-way-size", llc_way_size);
> +/* Number of colors available in the LLC */
> +static unsigned int __ro_after_init max_nr_colors = CONFIG_NR_LLC_COLORS;
> +
> +static void print_colors(const unsigned int *colors, unsigned int num_colors)
> +{
> +    unsigned int i;
> +
> +    printk("{ ");
> +    for ( i = 0; i < num_colors; i++ ) {

Nit (style): Brace placement.

> +        unsigned int start = colors[i], end = colors[i];
> +
> +        printk("%u", start);
> +
> +        for ( ;
> +              i < num_colors - 1 && colors[i] + 1 == colors[i + 1];

To reduce the number of array accesses, may I suggest to use "end + 1"
here instead of "colors[i] + 1"? (The initializer of "end" could also
be "start", but I guess the compiler will recognize this anyway.) This
would then (imo) also better justify the desire for having "end" in
the first place.

> +              i++, end++ );

Imo for clarity the semicolon want to live on its own line.

> +static void dump_coloring_info(unsigned char key)

This being common code now, I think it would be good practice to have
cf_check here right away, even if for now (for whatever reason) the
feature is meant to be limited to Arm. (Albeit see below for whether
this is to remain that way.)

> +void __init llc_coloring_init(void)
> +{
> +    if ( !llc_way_size && !(llc_way_size = get_llc_way_size()) )
> +        panic("Probed LLC coloring way size is 0 and no custom value found\n");
> +
> +    /*
> +     * The maximum number of colors must be a power of 2 in order to correctly
> +     * map them to bits of an address, so also the LLC way size must be so.
> +     */
> +    if ( llc_way_size & (llc_way_size - 1) )
> +        panic("LLC coloring way size (%u) isn't a power of 2\n", llc_way_size);
> +
> +    max_nr_colors = llc_way_size >> PAGE_SHIFT;

With this unconditionally initialized here, what's the purpose of the
variable's initializer?

> +    if ( max_nr_colors < 2 || max_nr_colors > CONFIG_NR_LLC_COLORS )
> +        panic("Number of LLC colors (%u) not in range [2, %u]\n",
> +              max_nr_colors, CONFIG_NR_LLC_COLORS);

I'm not convinced of panic()ing here (including the earlier two
instances). You could warn, taint, disable, and continue. If you want
to stick to panic(), please justify doing so in the description.

Plus, if you panic(), shouldn't that be limited to llc_coloring_enabled
being true? Or - not visible here, due to the lack of a caller of the
function - is that meant to be taken care of by the caller (to not call
here when the flag is off)? I think it would be cleaner if the check
lived here; quite possibly that would then further permit the flag
variable to become static.

> +    register_keyhandler('K', dump_coloring_info, "dump LLC coloring info", 1);

I'm also not convinced of using a separate key for this little bit of
information. How about attaching this to what 'm' or 'H' produce?

> +    arch_llc_coloring_init();
> +}
> +
> +void domain_dump_llc_colors(const struct domain *d)
> +{
> +    printk("Domain %pd has %u LLC colors: ", d, d->num_llc_colors);

%pd resolves to d<N> - why "Domain" as a prefix? And really - why the
domain identifier in the first place? All surrounding information is
already for this very domain.

> +    print_colors(d->llc_colors, d->num_llc_colors);

Imo this (or perhaps even the entire function) wants skipping when
num_llc_colors is zero, which would in particular also cover the
!llc_coloring_enabled case.

> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -626,6 +626,11 @@ struct domain
>  
>      /* Holding CDF_* constant. Internal flags for domain creation. */
>      unsigned int cdf;
> +
> +#ifdef CONFIG_LLC_COLORING
> +    unsigned const int *llc_colors;

const unsigned int * please.

Jan

