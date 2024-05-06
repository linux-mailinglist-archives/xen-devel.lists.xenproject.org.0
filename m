Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0AF8BCD6D
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 14:06:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717595.1119963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3x5m-0006Ak-W6; Mon, 06 May 2024 12:05:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717595.1119963; Mon, 06 May 2024 12:05:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3x5m-00068n-TD; Mon, 06 May 2024 12:05:14 +0000
Received: by outflank-mailman (input) for mailman id 717595;
 Mon, 06 May 2024 12:05:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gbjR=MJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s3x5l-00068h-HD
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 12:05:13 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3ca27ac-0ba0-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 14:05:12 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-41ba1ba55e8so11026035e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 05:05:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l8-20020a05600c4f0800b0041bfa349cadsm19496151wmq.16.2024.05.06.05.05.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 05:05:10 -0700 (PDT)
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
X-Inumbo-ID: e3ca27ac-0ba0-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714997111; x=1715601911; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+P+kuDOoW/O68w1duUHJDOYwUCEcePMI8GDNDSdlUQc=;
        b=UgFQhSJxwywsQwaBIE0qcAush4GR6El/t0DUDjcP2oLGAnNg7rXqVbV2n4Cbr6APZF
         sQJVgn7Q+ht0VrpKnc37EZ7/qh+D8/EyYWflJzSU2Lt6s0lFV1tRCc9af8G+JWTBCwla
         TL4zZ9vgzY4b8AewyOQeDKTxcN05jl9L7ExvKnUEgBKUPTWFea4bZgS/PUpNxJ8OxsiF
         ABHPKw/+y/TYPq5ZAnJHK0V41i7mEAbOqqESNPObpvr3v8r1ZVxEm+I0Je6X9vD8G/82
         jeUuNz7ayuE3OgnETXk6bQrnPJ47I4tKMksAF24C0mNiI1N0RSXFYdJANcajBNIf8ax8
         snFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714997111; x=1715601911;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+P+kuDOoW/O68w1duUHJDOYwUCEcePMI8GDNDSdlUQc=;
        b=UqmWUtyzLRGWiw835cvMEuOr6wxC3KK4+3H6LXRnVX19H9h+h83eNqCgP+uDsdR8H+
         YsCGm/BAOhnYqV3X4P87iCcxvTA9gdHicNQIfyxqyNggWhLaHQW17B6m8RctC0FVYTUL
         FmvTpKQKW+VSetJ+2vdtMKwcQ9WkM3+nRuTvm4MEcT9kBhjEUsUb6FZ8l6Pe8aPV2jAx
         Eh32cZGD7l2Kct30KIUyXOyKovTaxz1310Ukt3kHHfmRm/4N5J6usizp0ZNb2jpVjMHb
         9PJsVD9/ejlNMKH31B1FIvQrEqocSG9KAMytW138zXgZna8eJVlPSVrWcLkDVSdupha8
         1MFQ==
X-Forwarded-Encrypted: i=1; AJvYcCXommGgEZJeP6rbieHJ4fRGh2E44JtT0qJd/H6qoaMOPCLXYyv8vZJDkEE3+dX7vjvdCsL8ky58alBro4nH1tVfIRl4lVCVEdgJkMies6g=
X-Gm-Message-State: AOJu0Yy+F5oiccPJjAqe6957u/svhACNCXTNobCG9oHSFysIU2EB/Wxb
	u0SNtWk1MVuHZnausc0dUxt94cCBxXFLXkXdorGk81wZ2YEE3y82mH8c/6gs6vCYpdN8yLoy2Ho
	=
X-Google-Smtp-Source: AGHT+IGtEp9O52Q5V4v4MTeXqoQtciGtDqHEhNmWCT1ioSfMzg37Dhy/Xi/WfxpLOBFVZmc5yW8cHw==
X-Received: by 2002:a05:600c:310e:b0:41b:f979:e359 with SMTP id g14-20020a05600c310e00b0041bf979e359mr6958693wmo.38.1714997111248;
        Mon, 06 May 2024 05:05:11 -0700 (PDT)
Message-ID: <6c37e82b-5116-4856-9a83-8ed20c2d1d0d@suse.com>
Date: Mon, 6 May 2024 14:05:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 05/13] xen: extend domctl interface for cache coloring
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20240502165533.319988-1-carlo.nonato@minervasys.tech>
 <20240502165533.319988-6-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20240502165533.319988-6-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.05.2024 18:55, Carlo Nonato wrote:
> Add a new domctl hypercall to allow the user to set LLC coloring
> configurations. Colors can be set only once, just after domain creation,
> since recoloring isn't supported.
> 
> Based on original work from: Luca Miccio <lucmiccio@gmail.com>
> 
> Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one remark:

> @@ -226,6 +226,46 @@ void domain_llc_coloring_free(struct domain *d)
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
> +    {
> +        domain_set_default_colors(d);
> +        return 0;
> +    }
> +
> +    if ( config->num_llc_colors > max_nr_colors )
> +        return -EINVAL;
> +
> +    colors = xmalloc_array(unsigned int, config->num_llc_colors);
> +    if ( !colors )
> +        return -ENOMEM;
> +
> +    if ( copy_from_guest(colors, config->llc_colors, config->num_llc_colors) )
> +    {
> +        xfree(colors);
> +        return -EFAULT;
> +    }
> +
> +    if ( !check_colors(colors, config->num_llc_colors) )
> +    {
> +        printk(XENLOG_ERR "Bad LLC color config for %pd\n", d);

Slightly shorter (and more in line with what we have elsewhere) as

       printk(XENLOG_ERR "%pd: bad LLC color config\n", d);

Jan

