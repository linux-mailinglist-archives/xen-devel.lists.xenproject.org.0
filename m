Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1699E8800B6
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 16:31:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695445.1085191 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmbQW-0000kW-Up; Tue, 19 Mar 2024 15:30:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695445.1085191; Tue, 19 Mar 2024 15:30:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmbQW-0000hR-Rg; Tue, 19 Mar 2024 15:30:56 +0000
Received: by outflank-mailman (input) for mailman id 695445;
 Tue, 19 Mar 2024 15:30:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aOUF=KZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmbQV-0000hI-9q
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 15:30:55 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac663525-e605-11ee-afdd-a90da7624cb6;
 Tue, 19 Mar 2024 16:30:53 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-565c6cf4819so11592299a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 08:30:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a4-20020a170906368400b00a44936527b5sm6254121ejc.99.2024.03.19.08.30.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 08:30:53 -0700 (PDT)
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
X-Inumbo-ID: ac663525-e605-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710862253; x=1711467053; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9GKHkOjeZtheQAllbQFw4GKbVr65ZyXVC0TxSA7tP14=;
        b=d0B/nS7eAe//p2is8r5kF7zZGvP3tydIbH0aj6EK7dHnrSFPQs+euti83Ih/UVUFgG
         Hje2CnMJx9bKwqa83XV9520dybpN4dmPGf4JhVQzgpIPVQbuS/J9yBrfuw31OTZHO4Z6
         TB8IF259M4tO1D3YHMxlLcsqgz0h/PwFzPbN2oA9R0oEbg3kibQ3odIgPpAYPnzY0BI4
         1kdmK4ca0jpSmaNyCsgXE/YBQ+d5j8tySih7Z2zA0cHP+gDoFtC7BfuABtOLnH+6JTuB
         52bhfjy/h10YGNJg7DJwn9Ni41EaK93v7XzcLZQcc/95XRpPwGhh3ItbbfdjZ2SquQed
         oM5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710862253; x=1711467053;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9GKHkOjeZtheQAllbQFw4GKbVr65ZyXVC0TxSA7tP14=;
        b=UmpF9EdVUR88TBGw2z6gJw7Wsm1GMS5bhiwaAlM64Zv32JGM9MH9uWoiBvuXHPp9Ir
         YY+oDI3CgD+OBmmrNsIcwojbaQOQzl1ICOYfxKWSvqPqzq2syAH5IitWFGn8Q2IDTlCU
         jlzPP48Hz1O5+Co+cYmYB7RsmqfGkK5RjpzS+AJo2P+HO9NsvnjBq8xqEMVb9otKQDnR
         AU4UG5Kx9ALVBoNK+H6Bd+xgPnouwp4JyufriZzScqKVrXDezJzF7Xbbyv0U8/aRiS8T
         rHKd97lpX8p2+kSDG7nqi9GLf8GsvocujYw9WuwSB/w0H967WmvaI2vhgA2Dh0RHbVl8
         0BKg==
X-Forwarded-Encrypted: i=1; AJvYcCVDcEkLPponzdclH687ti7loqeBHY1lZ0gcFEhIQYljBzkw9weqSpzq2h/1QPLzMjCqz0AB7JaUPkZlW+4YMBLgGbpgpn+LwYKuUK/36Cc=
X-Gm-Message-State: AOJu0YyyzD29h/xPuPbALFCGJv5+hKMzvDcKtiHpTnMIJuiSj8ovr8qf
	ljjlKh2JGehS920KrKkDN1/lXGyvEaDI55x0x0XWH4U8Zzy9P+yOLOmv6jLPhA==
X-Google-Smtp-Source: AGHT+IEWmEb8X07JYPIvvrEm0fbTx2wYusvxHfRGZcorgvirUaZPzVE890C/A/L85ue5apze12Dqew==
X-Received: by 2002:a17:906:7314:b0:a46:bdfe:225b with SMTP id di20-20020a170906731400b00a46bdfe225bmr3436712ejc.11.1710862253276;
        Tue, 19 Mar 2024 08:30:53 -0700 (PDT)
Message-ID: <fa879713-4eee-4905-83f9-6182924cddbb@suse.com>
Date: Tue, 19 Mar 2024 16:30:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/14] xen/arm: add Dom0 cache coloring support
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
 <20240315105902.160047-5-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20240315105902.160047-5-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.03.2024 11:58, Carlo Nonato wrote:
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
> +Specify dom0 LLC color configuration. This option is available only when
> +`CONFIG_LLC_COLORING` is enabled. If the parameter is not set, all available
> +colors are used.

My reservation towards this being a top-level option remains.

> --- a/xen/common/llc-coloring.c
> +++ b/xen/common/llc-coloring.c
> @@ -18,6 +18,63 @@ integer_param("llc-nr-ways", llc_nr_ways);
>  /* Number of colors available in the LLC */
>  static unsigned int __ro_after_init max_nr_colors;
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
> +static int __init parse_color_config(const char *buf, unsigned int *colors,
> +                                     unsigned int max_num_colors,
> +                                     unsigned int *num_colors)
> +{
> +    const char *s = buf;
> +
> +    *num_colors = 0;
> +
> +    while ( *s != '\0' )
> +    {
> +        unsigned int color, start, end;
> +
> +        start = simple_strtoul(s, &s, 0);
> +
> +        if ( *s == '-' )    /* Range */
> +        {
> +            s++;
> +            end = simple_strtoul(s, &s, 0);
> +        }
> +        else                /* Single value */
> +            end = start;
> +
> +        if ( start > end || (end - start) > (UINT_MAX - *num_colors) ||
> +             (*num_colors + (end - start)) >= max_num_colors )
> +            return -EINVAL;
> +
> +        for ( color = start; color <= end; color++ )
> +            colors[(*num_colors)++] = color;

I can't spot any range check on start/end/color itself. In fact I was first
meaning to ask why the return value of simple_strtoul() is silently clipped
from unsigned long to unsigned int. Don't forget that a range specification
may easily degenerate into a negative number (due to a simple oversight or
typo), which would then be converted to a huge positive one.

> @@ -41,6 +98,22 @@ static void print_colors(const unsigned int *colors, unsigned int num_colors)
>      printk(" }\n");
>  }
>  
> +static bool check_colors(const unsigned int *colors, unsigned int num_colors)
> +{
> +    unsigned int i;
> +
> +    for ( i = 0; i < num_colors; i++ )
> +    {
> +        if ( colors[i] >= max_nr_colors )
> +        {
> +            printk(XENLOG_ERR "LLC color %u >= %u\n", colors[i], max_nr_colors);
> +            return false;
> +        }
> +    }
> +
> +    return true;
> +}

Oh, here's the range checking of the color values themselves. Perhaps
a comment in parse_color_config() would help.

> @@ -91,6 +164,61 @@ void cf_check domain_dump_llc_colors(const struct domain *d)
>      print_colors(d->llc_colors, d->num_llc_colors);
>  }
>  
> +static int domain_set_default_colors(struct domain *d)
> +{
> +    unsigned int *colors = xmalloc_array(unsigned int, max_nr_colors);
> +    unsigned int i;
> +
> +    if ( !colors )
> +        return -ENOMEM;
> +
> +    printk(XENLOG_WARNING
> +           "LLC color config not found for %pd, using all colors\n", d);
> +
> +    for ( i = 0; i < max_nr_colors; i++ )
> +        colors[i] = i;
> +
> +    d->llc_colors = colors;
> +    d->num_llc_colors = max_nr_colors;
> +
> +    return 0;
> +}

If this function is expected to actually come into play, wouldn't it
make sense to set up such an array just once, and re-use it wherever
necessary?

Also right here both this and check_colors() could be __init. I
understand that subsequent patches will also want to use the
functions at runtime, but until then this looks slightly wrong. I'd
like to ask that such aspects be mentioned in the description, to
avoid respective questions.

> +int __init dom0_set_llc_colors(struct domain *d)
> +{
> +    unsigned int *colors;
> +
> +    if ( !dom0_num_colors )
> +        return domain_set_default_colors(d);
> +
> +    if ( !check_colors(dom0_colors, dom0_num_colors) )
> +    {
> +        printk(XENLOG_ERR "Bad LLC color config for %pd\n", d);
> +        return -EINVAL;
> +    }
> +
> +    colors = xmalloc_array(unsigned int, dom0_num_colors);
> +    if ( !colors )
> +        return -ENOMEM;
> +
> +    /* Static type checking */
> +    (void)(colors == dom0_colors);

Btw, a means to avoid this would by to use typeof() in the declaration
of "colors".

Jan

