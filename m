Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B54D08800D2
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 16:37:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695449.1085200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmbWW-0001Ow-MY; Tue, 19 Mar 2024 15:37:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695449.1085200; Tue, 19 Mar 2024 15:37:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmbWW-0001Mi-JT; Tue, 19 Mar 2024 15:37:08 +0000
Received: by outflank-mailman (input) for mailman id 695449;
 Tue, 19 Mar 2024 15:37:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aOUF=KZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmbWU-0001Mc-Ln
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 15:37:06 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a11de87-e606-11ee-afdd-a90da7624cb6;
 Tue, 19 Mar 2024 16:37:05 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a46aaf6081fso416531966b.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 08:37:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z10-20020a170906714a00b00a46c39e6a47sm2216558ejj.148.2024.03.19.08.37.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 08:37:05 -0700 (PDT)
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
X-Inumbo-ID: 8a11de87-e606-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710862625; x=1711467425; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yxmMfJKep6cdOjOBXJ+1uQB48ZQiNW+XkVD5iLhBlvI=;
        b=ZeEZD3qTsODZWKNoxW15M4sQVNcMoLFCyALySSvoJ+4H/co0+BiN842poMolA0Km2H
         AxzmBemuiA3ag+jxIv+VsNeF4ApmISaGheeIkE8WRWvkVPcsqHtJH/cgc7Wnj68anhYw
         F+RLNoE5RwWe4X2pBIgS4/ZAsGYZlwzkZVpTvBJjzBxdRrhZ4yU1ddy1oEaHdtxF2j5P
         3t5vFmCAP1CaPOii6rFgZQ/3T6iAg1lnBngXPW+1EI4dBQCTdiGboMAqok9DMdeXjyDU
         +kqhZHcOfDP/nIwO2xcoqF9E4nixQUIXI61Ct16TVuJ5hs1QUDYeZneVeSPhDjvdK0uF
         qm5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710862625; x=1711467425;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yxmMfJKep6cdOjOBXJ+1uQB48ZQiNW+XkVD5iLhBlvI=;
        b=QYh96hJXYv0PRUdnT73Nnj6y897FLsCOeW3ZuDs4fnNKYPTZfVjM78y1rVIHnBxLf3
         vemSLy0fB82oXbL3BrCQC3AHKjiv2aWBSa3kX/85d0ipNuLta5fORsOuW0XV0LGnFMuk
         SqKuBKqoy+cIkZSTV+H/rH4eHDHOqkQF6p+h9wJD/4rJjdpLPf4XtOUI4eSI3zBjL5HQ
         1X4//UCjiM28zYBcQPfs9tnfpcK3+JM3oiZuwT0cuSUitqgRJrIzBKk5urnyiwvBu4O0
         0jPEc9i0YsHStbBirgutNP+istEV+oxMRfkrTrUgEwJSWBsjAYwmIY3wbfXhXJTIspus
         tWlw==
X-Forwarded-Encrypted: i=1; AJvYcCUBprV9C9qr0yaJq92crLNoI/oTKnq6zo+/VAZD6k2pEda0cfzwFiUZwGYwWfsJlhDTUJl0tV0bMEdtYR6ePIucexj9mreI3kUPox5EjwA=
X-Gm-Message-State: AOJu0Yw+Z2hzqu2Paf0e0UPtQm25+9edqc3fwAN5ruvUAWBi8qG+RH4a
	qjEnEKM8QRUSYMByBGhKng8WD3mNLM5Kr5us5JzuCZ9JpH13FlA8jAk0YbUsCA==
X-Google-Smtp-Source: AGHT+IHPpVabhpNCjDg5DU/0rCIbUF3xWyMJkyAs0KvhE5DgDzT8gFmkEUCuy9pCDQ90Z6bO09FdSg==
X-Received: by 2002:a17:906:2310:b0:a46:9681:9811 with SMTP id l16-20020a170906231000b00a4696819811mr2052467eja.33.1710862625217;
        Tue, 19 Mar 2024 08:37:05 -0700 (PDT)
Message-ID: <f934db54-3233-4330-9573-f3df3af389a1@suse.com>
Date: Tue, 19 Mar 2024 16:37:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/14] xen: extend domctl interface for cache coloring
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
 <20240315105902.160047-6-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20240315105902.160047-6-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.03.2024 11:58, Carlo Nonato wrote:
> @@ -219,6 +220,39 @@ void domain_llc_coloring_free(struct domain *d)
>      xfree(__va(__pa(d->llc_colors)));
>  }
>  
> +int domain_set_llc_colors(struct domain *d,
> +                          const struct xen_domctl_set_llc_colors *config)
> +{
> +    unsigned int *colors;
> +
> +    if ( d->num_llc_colors )
> +        return -EEXIST;
> +
> +    if ( !config->num_llc_colors )
> +        return domain_set_default_colors(d);
> +
> +    if ( config->num_llc_colors > max_nr_colors || config->pad )

The check of "pad" wants carrying out in all cases; I expect it wants
moving to the caller.

> +        return -EINVAL;
> +
> +    colors = xmalloc_array(unsigned int, config->num_llc_colors);
> +    if ( !colors )
> +        return -ENOMEM;
> +
> +    if ( copy_from_guest(colors, config->llc_colors, config->num_llc_colors) )
> +        return -EFAULT;

You're leaking "colors" when taking this or ...

> +    if ( !check_colors(colors, config->num_llc_colors) )
> +    {
> +        printk(XENLOG_ERR "Bad LLC color config for %pd\n", d);
> +        return -EINVAL;

... this error path.

Jan

