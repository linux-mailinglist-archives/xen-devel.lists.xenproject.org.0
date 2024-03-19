Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0FC8800DB
	for <lists+xen-devel@lfdr.de>; Tue, 19 Mar 2024 16:41:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.695451.1085211 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmbaS-0003Qn-4w; Tue, 19 Mar 2024 15:41:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 695451.1085211; Tue, 19 Mar 2024 15:41:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rmbaS-0003Ow-23; Tue, 19 Mar 2024 15:41:12 +0000
Received: by outflank-mailman (input) for mailman id 695451;
 Tue, 19 Mar 2024 15:41:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aOUF=KZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rmbaQ-0003Oq-BC
 for xen-devel@lists.xenproject.org; Tue, 19 Mar 2024 15:41:10 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b3d610f-e607-11ee-afdd-a90da7624cb6;
 Tue, 19 Mar 2024 16:41:09 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-563bb51c36eso6668767a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 19 Mar 2024 08:41:09 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 cn25-20020a0564020cb900b00568c3a2f4f8sm3648492edb.74.2024.03.19.08.41.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Mar 2024 08:41:08 -0700 (PDT)
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
X-Inumbo-ID: 1b3d610f-e607-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710862869; x=1711467669; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5QuJiuZejgGbVVW4I7TxfPxzbgWfyKHNf+/xElfOkWk=;
        b=TutcFcM7pP6+47IXlKAYso8CY6iLL4p8EWYb5B4tRLHqkQzI64onRi9RZ70ATTmcpS
         8wiQiO5cjsTtvdLiY1L+7ZaIhPiKlNLRMfJv3Nhypb7m6h6w07Dfg87A2Mz1bnixGYgJ
         KV1MYV2pq2fhaGwL0c1isO1kINPJXJCYb9mcR6HKGeM2Lt3hCMLrHHx7fWGrMWWTSSbm
         VJdqsJswB5+XkrLaE+i8vtgJQ9cBzvCOT2ldRWdtSPeRxvAQ9POgUcf6MHYsK0hbUg7O
         ILIFoWTPOHRGAz3CFNztI4puEgiuc9hzf5rNDX/L4XIDmfr6NyKIPGmR/2ba56fwGFTA
         W6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710862869; x=1711467669;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5QuJiuZejgGbVVW4I7TxfPxzbgWfyKHNf+/xElfOkWk=;
        b=FdIXPyRyHyTL6WziFdXPFyjF/JU2UUGTlda0/3whjx9dYiYjSGt1Ly/Qh9SZ6m9E5I
         vRsWNHglJXxYoY6sL6BUWCkyjx6lAXhGJKmkTPEkF4CmZ8XlFQpWAtwVMu/kNFmgRYiV
         DgGegu/QO/8ZIQhdAucDYyMKanNkx5VWmXqPK9rxWM9DzB1Kn/NYWzb9fnPMVK0XEenw
         n2g+Gxjxb2jQNVNOv6WBvXn0j8mygDPdoFffGhEar+HyRjyZ72CPiv42nWb1MXlJHBfd
         6n7nE4sJU+eEnex7AXerSgVJSWS1pn6ZYww9LUAdu1qtzmNH8RJAt3RMSCu9jpFTj80k
         ionQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5gRbuqKqBp2eiK7iqdZ2VR97Z/o0uiRgxv5MB/uoFybQ2++tMq1f8OFFZHslat8JMP3vUHzxfgXIFUrvA7T0SeTYwgIydcMdmw0q63UU=
X-Gm-Message-State: AOJu0Yy0Jka3A0ZRU8qG9iYdQ11IdHxZlQNu0jEN9eeaSG0FlUbH+rWT
	NhRu09TrXLLBgced+TZ6JsigMxtftQKofryJ1AsZtVyRCHzPMrj5FscZBK6YuQ==
X-Google-Smtp-Source: AGHT+IGYopEIA0RUKNyFYfgZ0p5xnnwkf23XGKeuXf36RWrKhRxybHMhHZesmI9kdDty+RKeMTDGRQ==
X-Received: by 2002:a05:6402:3604:b0:568:fb58:bc50 with SMTP id el4-20020a056402360400b00568fb58bc50mr2065098edb.25.1710862868742;
        Tue, 19 Mar 2024 08:41:08 -0700 (PDT)
Message-ID: <8194d91a-a71a-44f2-a498-61297ac2ee29@suse.com>
Date: Tue, 19 Mar 2024 16:41:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/14] xen/arm: add support for cache coloring
 configuration via device-tree
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
 <20240315105902.160047-8-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20240315105902.160047-8-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.03.2024 11:58, Carlo Nonato wrote:
> --- a/xen/common/llc-coloring.c
> +++ b/xen/common/llc-coloring.c
> @@ -253,6 +253,37 @@ int domain_set_llc_colors(struct domain *d,
>      return 0;
>  }
>  
> +int __init domain_set_llc_colors_from_str(struct domain *d, const char *str)
> +{
> +    int err;
> +    unsigned int *colors, num_colors;
> +
> +    if ( !str )
> +        return domain_set_default_colors(d);
> +
> +    colors = xmalloc_array(unsigned int, max_nr_colors);
> +    if ( !colors )
> +        return -ENOMEM;
> +
> +    err = parse_color_config(str, colors, max_nr_colors, &num_colors);
> +    if ( err )
> +    {
> +        printk(XENLOG_ERR "Error parsing LLC color configuration");
> +        return err;
> +    }
> +
> +    if ( !check_colors(colors, num_colors) )
> +    {
> +        printk(XENLOG_ERR "Bad LLC color config for %pd\n", d);
> +        return -EINVAL;
> +    }

"colors" is again leaked on the error paths.

> +    d->llc_colors = colors;
> +    d->num_llc_colors = num_colors;

num_colors may be quite a bit smaller than max_nr_colors; worth re-
allocating the array to free up excess space?

Jan

