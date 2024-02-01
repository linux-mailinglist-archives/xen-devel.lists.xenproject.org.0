Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFAB8459F8
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 15:20:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674464.1049390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVXuy-0003gR-R0; Thu, 01 Feb 2024 14:19:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674464.1049390; Thu, 01 Feb 2024 14:19:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVXuy-0003da-O1; Thu, 01 Feb 2024 14:19:52 +0000
Received: by outflank-mailman (input) for mailman id 674464;
 Thu, 01 Feb 2024 14:19:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFwQ=JK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rVXux-0003c4-Od
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 14:19:51 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5e4368e-c10c-11ee-8a43-1f161083a0e0;
 Thu, 01 Feb 2024 15:19:50 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-55a9008c185so1738283a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 06:19:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ev20-20020a056402541400b0055a8fe70387sm6856536edb.1.2024.02.01.06.19.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Feb 2024 06:19:49 -0800 (PST)
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
X-Inumbo-ID: f5e4368e-c10c-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706797190; x=1707401990; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xFLBrh7Dpw3f87TJClFlFdPkIP+m+X3DpeBb+FAMqqw=;
        b=PNI7jFTnDkJrprISyHNm5/JCws0Ort9DCoRhyRIgD4jcth7NqGqSqc0CpcxqtX4jYg
         L85KMwpFGpWywHXjAqxOiiTATHd4GJ1E7GwhDyUaJcHGdjYnKgPagKy91DuGUmGEoTks
         sVvrFa7SZPRC/9iQz9fyRaupjxTfbPs0rW6SqpH6TaJQE4QAjfsewHK7IDmQDvGDa2h7
         a2Mi41mWn7+GNf4DCoHBYw3FIBsVb8E4MzhVH1MTK1b9DNwO8TF52QYNaEU+Rq8tP3UI
         eR9r2jN2tRque+hRXHOrJ3XqzZpa9DFDW0MVqA/aMed89nLHRp0IGW3NRrmzRkBjrRYI
         krQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706797190; x=1707401990;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xFLBrh7Dpw3f87TJClFlFdPkIP+m+X3DpeBb+FAMqqw=;
        b=r2HHmU0m9dce4+4KJcA7gQTs6wg3HH/bDh+ITU6AgV3zS+wevAlUX6YkE91Tdu7yh3
         lFWdLbaD/MUYzAePbDi0JJrcXUzwBjGdbgM50IaKU0omLNHE5uNjtoQRt1o/8oeBCom2
         U91F2wGztB/FLDaXWegdinjWu9V4sVAl5pPA9qZ0GZzKJd2x93SU5KQGckdCemguBXxf
         5rwB9CZJApeH1E2TJ0GW/R5/NL7/7g25b6jqud/7d5/ymiAEm43GNzT5k4EiVcbZ+LJW
         c7oTiBLbQv0/Up/xS6pWR36q6RrvmhBA4hbTqHrhMqG+maUj/hCAQKjxW2wvxyDpiYIE
         G6HQ==
X-Gm-Message-State: AOJu0Yz7mpWVjtOu/3FRqcqgCiLZhvBAxcV1zKw3sgq/h9uoSxckT2XV
	pW+RNb/XQCUuc7b3p5dAmH18WayQI5zMCsUQZarWXXMwSmA6FIVjGIYN/jRQNg==
X-Google-Smtp-Source: AGHT+IEjsmIYEgx0oOGNg8gK4dNS2Sc9/aKI1hvXhaj3q0G54l/mXV66zL4dQRKZUW2UtAfPQtp3+Q==
X-Received: by 2002:a50:8e43:0:b0:55f:5197:6314 with SMTP id 3-20020a508e43000000b0055f51976314mr4697303edx.18.1706797190022;
        Thu, 01 Feb 2024 06:19:50 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUBqgQZk9DK8Vom/o14kamV2ZuSDDHgUC0AQp3yBxYwUOGEmXiAYPGzLM3CQ20RXxd9iDYUmoddPqZUGol9geb9pxXvFY5GN4xMTU7yBbmI4kJoTzFb7L1oj1b7BAjpfNDnm+o2X2jtV4xc59RYoPUfyucokPaHc431aTtnsGeIJENOHMBiUSchSrHNsVDMGhPBbbB1uVf1IKIsuh9TGdVQdjz9bB1VYhLOSu95PHqDb4plwZFY5GdjeTJj+kGay3KWy8LrrBJyBooCFZQY+KG4WbsXXEVuWqgVak2BDDPmjt4X33fll2lgJEvRsV2QDWB+pezyb1vXk6rablH5Xe9foxJ/XAGwPFrIfbZrc8L71JakFnlV5S94jhb10dzSbpKuMQ==
Message-ID: <a6ffb4a5-cd83-4c04-9e5a-12d605863b5d@suse.com>
Date: Thu, 1 Feb 2024 15:19:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/15] xen/arm: add support for cache coloring
 configuration via device-tree
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-8-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20240129171811.21382-8-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.01.2024 18:18, Carlo Nonato wrote:
> @@ -950,6 +951,11 @@ void __init create_domUs(void)
>  #endif
>          }
>  
> +        dt_property_read_string(node, "llc-colors", &llc_colors_str);
> +        if ( !llc_coloring_enabled && llc_colors_str)
> +            printk(XENLOG_WARNING
> +                   "'llc-colors' found, but LLC coloring is disabled\n");

Why's this just a warning, when ...

> @@ -960,6 +966,11 @@ void __init create_domUs(void)
>              panic("Error creating domain %s (rc = %ld)\n",
>                    dt_node_name(node), PTR_ERR(d));
>  
> +        if ( llc_coloring_enabled &&
> +             (rc = domain_set_llc_colors_from_str(d, llc_colors_str)) )
> +            panic("Error initializing LLC coloring for domain %s (rc = %d)\n",
> +                  dt_node_name(node), rc);

... this results in panic()?

> --- a/xen/common/llc-coloring.c
> +++ b/xen/common/llc-coloring.c
> @@ -254,6 +254,29 @@ int domain_set_llc_colors_domctl(struct domain *d,
>      return domain_check_colors(d);
>  }
>  
> +int domain_set_llc_colors_from_str(struct domain *d, const char *str)

__init ?

> +{
> +    int err;
> +    unsigned int *colors;
> +
> +    if ( !str )
> +        return domain_set_default_colors(d);
> +
> +    colors = alloc_colors(max_nr_colors);
> +    if ( !colors )
> +        return -ENOMEM;
> +
> +    err = parse_color_config(str, colors, max_nr_colors, &d->num_llc_colors);
> +    if ( err )
> +    {
> +        printk(XENLOG_ERR "Error parsing LLC color configuration.");

Nit: No full stop at the end of log messages please.

> +        return err;
> +    }
> +    d->llc_colors = colors;
> +
> +    return domain_check_colors(d);

Same ordering issue as in the earlier patch, I think.

Jan

