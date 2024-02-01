Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 776208458EC
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 14:31:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674415.1049289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVX9H-0003of-Vp; Thu, 01 Feb 2024 13:30:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674415.1049289; Thu, 01 Feb 2024 13:30:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVX9H-0003mX-So; Thu, 01 Feb 2024 13:30:35 +0000
Received: by outflank-mailman (input) for mailman id 674415;
 Thu, 01 Feb 2024 13:30:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFwQ=JK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rVX9H-0003mR-0j
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 13:30:35 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 13558d97-c106-11ee-8a43-1f161083a0e0;
 Thu, 01 Feb 2024 14:30:33 +0100 (CET)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-55f19a3ca7aso3899898a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 05:30:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ty8-20020a170907c70800b00a353d1a19a9sm6117061ejc.191.2024.02.01.05.30.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Feb 2024 05:30:32 -0800 (PST)
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
X-Inumbo-ID: 13558d97-c106-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706794233; x=1707399033; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1YU4wWiLq7QGViTJ8twYyIsIRAeG5ZtwwK8ol7Dc0W4=;
        b=SGazCaxJT2cSx/06lN6VXMdvWCYGuQ0Vw5ZPuvebC2UU28pP0smR//FbRmAz14iLey
         t48jp7IA9J60klspTK5GELimKepMhiWVbbAhPMY9f9gB8irj9TFSu0GNlv5v/B7G2kez
         NN11hOSB2/v9+pbm4DoboUGANTujMRxroNS1X6tC69iEwEEuqftnJKyZ5sX4wjIVC9V5
         6J64E8OkE51nGg+jUbu9lBHlvaBX+y+NqIzDY2CaA9BCai0oJHLmzMt5cWS34AjU4V+Z
         iXT+2fc+2ybAu0fOg1Mk4Lp0EpQA3Y7RQTTKGt5lOG9d1TCPla6YlN58E5zmszADgqlu
         zH/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706794233; x=1707399033;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1YU4wWiLq7QGViTJ8twYyIsIRAeG5ZtwwK8ol7Dc0W4=;
        b=dUiFUZTCVHFBj+le3vtgbHUOGpGn4cfwxXArpfYyPrjmPXEgNdcbddMWj99fXfQYUr
         xPQyzlAmG3ofoHetktmdSa+BuTxpFMlY2vwREX+YCYeTGnE5UysJI6ZByAFdhGoJebg9
         wKKR1SHjDilkx87j7wmlHdfBLXlhFP6R2Yu2BCp/7xZextwxkp9tgAl9hrsv0fOprHnC
         tYMS4/APCQaCUaVF2DjRSlUugV6qKwL/GTumus4/UuQQKIIX54/4G7UysZcbjDkwG0xR
         gXYz6QyL4yhypbd68z+AZjprX/9v7wqEvUhTSZPG5kc6faVFxqzzCwuSHVOXiPqsCOuG
         Lu+w==
X-Gm-Message-State: AOJu0Yzfz9q5x76b/aPa/wmHQdEkxhAs/eKiZhmK9oIh918MjhKH5h6K
	LVdhs322MLNsOO5xJG4NRTGwRq1HxzbrUbwDOYS65r4XiU4gabgfbP0JOcly4g==
X-Google-Smtp-Source: AGHT+IG0zbt/Kby5a0Ec6Dd4UsqOjpX3KN0wfRbWosqH+TkEDgZfimjmzIjRrxyxy83V9JlR7ln9EQ==
X-Received: by 2002:a17:907:d50b:b0:a36:85b9:cd1b with SMTP id wb11-20020a170907d50b00b00a3685b9cd1bmr4066674ejc.25.1706794232927;
        Thu, 01 Feb 2024 05:30:32 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUvwMi1o4O1O3XGlvYlCzXDYOfiWfPTcXsJzKOvVrT3BOnXf2gCPv6fW/trBSunXLl9f+P+x61r9OstYSLn+Mxc9dor+2jRellnSxHTVaUglgo3mWh0Qjc/tV16PNeN45uj+0844kuxe5DvKlnGbwg9Q1Aj0cT/vCWj1LeNppUlwy9U+Sjco9WYDrfJGlGtJ96UqSw1ZM0283As9U23OPBHmw61neh/J+8JrYHnvSjFQFEtvKg1Rku6oU6gS2qarnXqGLFDNj4XpyME/um0wiovvPG8mFO6nD0UpCHSoBW3kk+uBBlLonRfQJQx+4H5WwsB7VAvodmyuwkV1JrQPPwssJ0L2jgElbaxMWACbZ3VQTaKqMJlxk8FTY5vYAhIKr4LEw==
Message-ID: <cf23d8a8-7111-4014-adc7-93ecd5f110ec@suse.com>
Date: Thu, 1 Feb 2024 14:30:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/15] xen/arm: add Dom0 cache coloring support
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-5-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20240129171811.21382-5-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.01.2024 18:18, Carlo Nonato wrote:
> Add a command line parameter to allow the user to set the coloring
> configuration for Dom0.
> A common configuration syntax for cache colors is introduced and
> documented.
> Take the opportunity to also add:
>  - default configuration notion.
>  - function to check well-formed configurations.
> 
> Direct mapping Dom0 isn't possible when coloring is enabled, so
> CDF_directmap flag is removed when creating it.

What implications does this have?

> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -963,6 +963,15 @@ Controls for the dom0 IOMMU setup.
>  
>  Specify a list of IO ports to be excluded from dom0 access.
>  
> +### dom0-llc-colors
> +> `= List of [ <integer> | <integer>-<integer> ]`
> +
> +> Default: `All available LLC colors`
> +
> +Specify dom0 LLC color configuration. This options is available only when
> +`CONFIG_LLC_COLORING` is enabled. If the parameter is not set, all available
> +colors are used.

Even Arm already has a "dom0=" option. Is there a particular reason why
this doesn't become a new sub-option there?

As to meaning: With just a single <integer>, that's still a color value
then (and not a count of colors)? Wouldn't it make sense to have a
simpler variant available where you just say how many, and a suitable
set/range is then picked?

Finally a nit: "This option is ...".

> @@ -2188,10 +2190,16 @@ void __init create_dom0(void)
>              panic("SVE vector length error\n");
>      }
>  
> -    dom0 = domain_create(0, &dom0_cfg, CDF_privileged | CDF_directmap);
> +    if ( !llc_coloring_enabled )
> +        flags |= CDF_directmap;
> +
> +    dom0 = domain_create(0, &dom0_cfg, flags);
>      if ( IS_ERR(dom0) )
>          panic("Error creating domain 0 (rc = %ld)\n", PTR_ERR(dom0));
>  
> +    if ( llc_coloring_enabled && (rc = dom0_set_llc_colors(dom0)) )
> +        panic("Error initializing LLC coloring for domain 0 (rc = %d)", rc);

As for the earlier patch, I find panic()ing here dubious. You can continue
quite fine, with a warning and perhaps again tainting the system.

> --- a/xen/common/llc-coloring.c
> +++ b/xen/common/llc-coloring.c
> @@ -17,6 +17,63 @@ size_param("llc-way-size", llc_way_size);
>  /* Number of colors available in the LLC */
>  static unsigned int __ro_after_init max_nr_colors = CONFIG_NR_LLC_COLORS;
>  
> +static unsigned int __initdata dom0_colors[CONFIG_NR_LLC_COLORS];
> +static unsigned int __initdata dom0_num_colors;
> +
> +/*
> + * Parse the coloring configuration given in the buf string, following the
> + * syntax below.
> + *
> + * COLOR_CONFIGURATION ::= COLOR | RANGE,...,COLOR | RANGE
> + * RANGE               ::= COLOR-COLOR
> + *
> + * Example: "0,2-6,15-16" represents the set of colors: 0,2,3,4,5,6,15,16.
> + */
> +static int parse_color_config(const char *buf, unsigned int *colors,
> +                              unsigned int num_colors, unsigned int *num_parsed)

Is this function going to be re-used? If not, it wants to be __init.
If so, I wonder where the input string is going to come from ...

Also "num_colors" looks to be misnamed - doesn't this specify an
upper bound only?

> +{
> +    const char *s = buf;
> +
> +    if ( !colors || !num_colors )
> +        return -EINVAL;

Why do you check colors but not ...

> +    *num_parsed = 0;

... num_parsed? I think internal functions don't need such NULL checks.

> +    while ( *s != '\0' )
> +    {
> +        if ( *s != ',' )

Hmm, this way you also accept leading/trailing commas as well as multiple
consecutive ones. Elsewhere we're more strict.

> @@ -70,12 +150,85 @@ void __init llc_coloring_init(void)
>      arch_llc_coloring_init();
>  }
>  
> +void domain_llc_coloring_free(struct domain *d)
> +{
> +    xfree(__va(__pa(d->llc_colors)));

This __va(__pa()) trick deserves a comment, I think.

> +}
> +
>  void domain_dump_llc_colors(const struct domain *d)
>  {
>      printk("Domain %pd has %u LLC colors: ", d, d->num_llc_colors);
>      print_colors(d->llc_colors, d->num_llc_colors);
>  }
>  
> +static unsigned int *alloc_colors(unsigned int num_colors)
> +{
> +    unsigned int *colors;
> +
> +    if ( num_colors > max_nr_colors )
> +        return NULL;

Shouldn't check_colors() have made sure of this? If so, convert to
ASSERT()?

> +    colors = xmalloc_array(unsigned int, num_colors);
> +    if ( !colors )
> +        return NULL;

These last two lines are redundant with ...

> +    return colors;

... this one. Question then is whether this is useful at all as a
separate helper function.

> +}
> +
> +static int domain_check_colors(const struct domain *d)
> +{
> +    if ( !d->num_llc_colors )
> +    {
> +        printk(XENLOG_ERR "No LLC color config found for %pd\n", d);
> +        return -ENODATA;
> +    }
> +    else if ( !check_colors(d->llc_colors, d->num_llc_colors) )

I generally recommend against use of "else" in cases like this one.

> +    {
> +        printk(XENLOG_ERR "Bad LLC color config for %pd\n", d);
> +        return -EINVAL;
> +    }
> +
> +    return 0;
> +}
> +
> +static int domain_set_default_colors(struct domain *d)
> +{
> +    unsigned int *colors = alloc_colors(max_nr_colors);
> +    unsigned int i;
> +
> +    if ( !colors )
> +        return -ENOMEM;
> +
> +    printk(XENLOG_WARNING
> +           "LLC color config not found for %pd, using default\n", d);

Leaving open what the default(s) is/are. Judging from ...

> +    for ( i = 0; i < max_nr_colors; i++ )
> +        colors[i] = i;

... this it's simply "all colors". Then perhaps have the message also
say so?

> +    d->llc_colors = colors;
> +    d->num_llc_colors = max_nr_colors;
> +
> +    return 0;
> +}
> +
> +int __init dom0_set_llc_colors(struct domain *d)
> +{
> +    unsigned int *colors;
> +
> +    if ( !dom0_num_colors )
> +        return domain_set_default_colors(d);
> +
> +    colors = alloc_colors(dom0_num_colors);
> +    if ( !colors )
> +        return -ENOMEM;
> +
> +    memcpy(colors, dom0_colors, sizeof(unsigned int) * dom0_num_colors);

sizeof(*colors) or some such please. Plus a check that colors and
dom0_colors are actually of the same type. Alternatively, how about
making dom0_colors[] __ro_after_init? Is this too much of a waste?

Jan

