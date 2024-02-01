Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50656845952
	for <lists+xen-devel@lfdr.de>; Thu,  1 Feb 2024 14:51:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.674444.1049349 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVXTb-0003VD-Oo; Thu, 01 Feb 2024 13:51:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 674444.1049349; Thu, 01 Feb 2024 13:51:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rVXTb-0003T3-MF; Thu, 01 Feb 2024 13:51:35 +0000
Received: by outflank-mailman (input) for mailman id 674444;
 Thu, 01 Feb 2024 13:51:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFwQ=JK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rVXTa-0003Sx-M0
 for xen-devel@lists.xenproject.org; Thu, 01 Feb 2024 13:51:34 +0000
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [2a00:1450:4864:20::433])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 025962d3-c109-11ee-8a43-1f161083a0e0;
 Thu, 01 Feb 2024 14:51:33 +0100 (CET)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-33b1a51743fso255695f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 01 Feb 2024 05:51:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o2-20020a5d4a82000000b0033b1277e95dsm2119858wrq.77.2024.02.01.05.51.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Feb 2024 05:51:32 -0800 (PST)
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
X-Inumbo-ID: 025962d3-c109-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1706795493; x=1707400293; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8RRdQKASc3af7mpTARYqUcV+0lPpVTBJtM4WGMrlCRw=;
        b=AQAMHaPpRg691kwz/SeL4DcMupVqnsJk3jhtovx3ZR1GsqpFv35GZw0Mku4gbmOI9b
         wWSNWbk4N376x1JslwLhA7n8MdJOx9Z8vMhqQumJReGMijTRKVOgntv5LM8VNYybNbQ6
         XcKbcotk9G5k7YZlMf5zK3Cxp2kqKM7ZMy+ZS60fsz6Zz8mbrNefy5P/lrXn+HE2a0L4
         hJNreWQHuRzSWeKIuw9aSWdfQh4OCM9RlI+gurE2ImKBU0proy49C7Q2kulAbiyE5JEw
         Wh0xCCqVWaqowtyDUBdHT9vt98cUbZocRRr86Q90EwT8OVe3H877zIuMiBGCE4mAhAQi
         B9Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706795493; x=1707400293;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8RRdQKASc3af7mpTARYqUcV+0lPpVTBJtM4WGMrlCRw=;
        b=dxNVEyA9kD66itUxye3UrO1LtvAzwVbpZvSRDkj0ksxpKIHznYhaa4CHuMdXFm3lir
         +45Pt+ugvlWC0Dtq/oVboRLj0S2d1xoTvLmP9bc6nJnLI4XxdyYnkXyiZsBE4K+faV6K
         6oTTeBBMO6VdOB9NPErRPC3niiwUDxcR+/ypbIK3VpahR+QDHFyDjzrml1F/+Bonot7N
         bpgyRUJrUInOG+1HP+y5Kj2DSF01MK3aLg3mNdDpcMUMvxMUZsSdsAIxR6EfJGjHLtTl
         xetarOIaJd7QKIayr7dEiaXb9FR4F2R60tq3XBt6dM6LzomImry8N0TVb832Nfz40dI3
         qTPQ==
X-Gm-Message-State: AOJu0Yzs+2enboizNcjPLTw+0zpS+X5ACd9y2iOZwI5Qt+/1N+AHVyES
	Yhmyp7mUCoGykF/mW4SLBMpQqC9Q27PwwSla8L90DtNdBXwZlNDznZw/1tuPeQ==
X-Google-Smtp-Source: AGHT+IFMBy8UxQLDea4mgrUx/zzQwIOassxiv2dP8qnvvs6//4Bn0T41OedMDEPWMSkZT6UI6Pd3Fg==
X-Received: by 2002:adf:ce8b:0:b0:33a:eae4:aaf7 with SMTP id r11-20020adfce8b000000b0033aeae4aaf7mr3489557wrn.48.1706795492933;
        Thu, 01 Feb 2024 05:51:32 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCVxHvl2mTcAPoZFlqoBOxEKsYLkudUEhv4D2bXChYhJXFEbGOOqDIEcPN/gcwZMR/HfIBcRen8SPC7QV2XjKCQuwK4/fPf+KMW7Uz7xxMW2Fv7CSHUbB5CxRSYhmsDzsGUzqYo6MiSeeglG3M/XEKvldWp8IPzaaG4vsq6bwzZkBcGZI2As2YzcjlLOv4NHyFg9pSjOOBj5RKrC5WseG7andnq9bCeGxHkNjbVSy6bz0q6ok8gBVv7R8bpbhEmF57pJvhfYKMZcgAdPyg+MdRcJdHdN00RN
Message-ID: <49827753-14f1-42cc-8791-27c5400e6e50@suse.com>
Date: Thu, 1 Feb 2024 14:51:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/15] xen: extend domctl interface for cache coloring
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, Marco Solieri <marco.solieri@minervasys.tech>,
 xen-devel@lists.xenproject.org
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
 <20240129171811.21382-6-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20240129171811.21382-6-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.01.2024 18:18, Carlo Nonato wrote:
> @@ -858,6 +859,16 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>                  __HYPERVISOR_domctl, "h", u_domctl);
>          break;
>  
> +    case XEN_DOMCTL_set_llc_colors:
> +        if ( !llc_coloring_enabled )
> +            break;

With "ret" still being 0, this amounts to "successfully ignored". Ought
to be -EOPNOTSUPP, I guess.

> +        ret = domain_set_llc_colors_domctl(d, &op->u.set_llc_colors);
> +        if ( ret == -EEXIST )
> +            printk(XENLOG_ERR
> +                   "Can't set LLC colors on an already created domain\n");

If at all a dprintk(). But personally I think even that's too much - we
don't do so elsewhere, I don't think.

> --- a/xen/common/llc-coloring.c
> +++ b/xen/common/llc-coloring.c
> @@ -4,6 +4,7 @@
>   *
>   * Copyright (C) 2022 Xilinx Inc.
>   */
> +#include <xen/guest_access.h>
>  #include <xen/keyhandler.h>
>  #include <xen/llc-coloring.h>
>  #include <xen/param.h>
> @@ -229,6 +230,30 @@ int __init dom0_set_llc_colors(struct domain *d)
>      return domain_check_colors(d);
>  }
>  
> +int domain_set_llc_colors_domctl(struct domain *d,
> +                                 const struct xen_domctl_set_llc_colors *config)

What purpose has the "domctl" in the function name?

> +{
> +    unsigned int *colors;
> +
> +    if ( d->num_llc_colors )
> +        return -EEXIST;
> +
> +    if ( !config->num_llc_colors )
> +        return domain_set_default_colors(d);
> +
> +    colors = alloc_colors(config->num_llc_colors);
> +    if ( !colors )
> +        return -ENOMEM;

Hmm, I see here you call the function without first having bounds checked
the input. But in case of too big a value, -ENOMEM is inappropriate, so
such a check wants adding up front anyway.

> +    if ( copy_from_guest(colors, config->llc_colors, config->num_llc_colors) )
> +        return -EFAULT;

There again wants to be a check that the pointed to values are the same,
or at least of the same size. Else you'd need to do element-wise copy.

> +    d->llc_colors = colors;
> +    d->num_llc_colors = config->num_llc_colors;
> +
> +    return domain_check_colors(d);

And if this fails, you leave the domain with the bad settings? Shouldn't
you check and only then store pointer and count?

> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -1190,6 +1190,13 @@ struct xen_domctl_vmtrace_op {
>  typedef struct xen_domctl_vmtrace_op xen_domctl_vmtrace_op_t;
>  DEFINE_XEN_GUEST_HANDLE(xen_domctl_vmtrace_op_t);
>  
> +struct xen_domctl_set_llc_colors {
> +    /* IN LLC coloring parameters */
> +    uint32_t num_llc_colors;
> +    uint32_t padding;

I see you've added padding, but: You don't check it to be zero. Plus
the overwhelming majority of padding fields is named "pad".

Jan

