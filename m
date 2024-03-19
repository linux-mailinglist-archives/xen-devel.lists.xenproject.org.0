Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 289AD8800EF
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 16:45:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695455.1085221 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmbeL-00041e-Kd; Tue, 19 Mar 2024 15:45:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695455.1085221; Tue, 19 Mar 2024 15:45:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmbeL-0003zc-Hu; Tue, 19 Mar 2024 15:45:13 +0000
Received: by outflank-mailman (input) for mailman id 695455;
 Tue, 19 Mar 2024 15:45:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aOUF=KZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmbeJ-0003zW-Vv
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 15:45:11 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab3dc132-e607-11ee-afdd-a90da7624cb6;
 Tue, 19 Mar 2024 16:45:10 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-563c403719cso6974782a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 08:45:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ij11-20020a056402158b00b005688450c264sm5892611edb.91.2024.03.19.08.45.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 08:45:10 -0700 (PDT)
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
X-Inumbo-ID: ab3dc132-e607-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710863110; x=1711467910; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AXm82f/41fQJPFkPWTE5+4k70f5QuF7qFPegW52LF9s=;
        b=JPz8+C/2JUOp6Z1UjMexV7rGOVVMLS4qiTjQvz80NXn7liEmCCYc0gVpfjlCPl81vt
         K/aRQqBjyLCa7Lk9RA1V/hD4iIKwIzBxX26d1U0n6qDCnzWHvHw8eu/xol/C9mdLYyg9
         r72zn3KcFddbAPnTgDC+eFQc85moEafgQOgLOIpnH3PP/Hcx4PbjyLixIHEIt627IMN3
         rkyWcPjGpxc2GYA3waZppNQqHq/brz5rsybeRaKZlnB30h2B/q0wFpYvsUO/PtC4lEsi
         aJzevdb+K/p8rVqU8VwH1sl9h/FDBG7GVk6XPb3E1YRbgQ/hfinTfYosX+fbu3H5xfxO
         Nw+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710863110; x=1711467910;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AXm82f/41fQJPFkPWTE5+4k70f5QuF7qFPegW52LF9s=;
        b=DM1opTiRT2Wf1vxePa0qWRK4LdFTakW+pF0y0zf6fWEFiP3N782XxoFMYfHQ8mAtY6
         elTT1GEgi1T6cUMRYT9fe0gPHoAqCv2XBpT5n5ad4JwvvDmvePFu7l1PKLleltuKM7fw
         IbpBy2mKvwJzB43ugTzmQbHMX09ollbxs2phILGsOcNjvnOEnpUVq0fAinklMldwTlbx
         WpW2ZAfr9CiEt3se9WQDx0pzQx16BojdEchCGdsX3sTysHItLpWqulT+1Lo+2HWV5EIS
         Yznk92OVi8r4D/7tmne6hgOg/CFAtbJobgOi5g/IlOKk4cbO9evf2jn7ApdkS8ZtA1X/
         m+3A==
X-Forwarded-Encrypted: i=1; AJvYcCX6rwYfRFexPcCjXSWHosirB5dND46rm7N0e01CtRsMEmPgFMAm5/NO7wsi7Gbix8dZ921YcLNXO0Icsbwc7Lz4+Y4AeVRCCd/PKlLv2fo=
X-Gm-Message-State: AOJu0YyqPOcNgLis9PuvbLaui4VTnINuJ0k1wgexRC+kZ6Hl7bOoOJPN
	GBIj5BW1DHhl6lHjETrW9YrRWxTwPDMM99I/jAAy/iiMNSKvJUL4BAhe9LMnkQ==
X-Google-Smtp-Source: AGHT+IHRMJ5WoTQMcGBIYXnf4ljl/QW+q8PlaK1fdoY9TaeLlfCql04BJrThLogAFWQAoZXhKRSNog==
X-Received: by 2002:a05:6402:e10:b0:568:949b:e91f with SMTP id h16-20020a0564020e1000b00568949be91fmr11933713edh.36.1710863110299;
        Tue, 19 Mar 2024 08:45:10 -0700 (PDT)
Message-ID: <c0e82206-2e13-4dc7-a220-e51b40dde778@suse.com>
Date: Tue, 19 Mar 2024 16:45:08 +0100
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
> +
> +        if ( *s == ',' )
> +            s++;
> +        else if ( *s != '\0' )
> +            break;
> +    }
> +
> +    return *s ? -EINVAL : 0;
> +}
> +
> +static int __init parse_dom0_colors(const char *s)
> +{
> +    return parse_color_config(s, dom0_colors, ARRAY_SIZE(dom0_colors),

With it not being possible to pass max_nr_colors here (due to the value
not having been established yet), don't you need to check somewhere else
that ...

> +                              &dom0_num_colors);

... dom0_num_colors isn't too large?

Jan

