Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D5948A99F4
	for <lists+xen-devel@lfdr.de>; Thu, 18 Apr 2024 14:38:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.708335.1107180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxR0u-0001OL-2m; Thu, 18 Apr 2024 12:37:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 708335.1107180; Thu, 18 Apr 2024 12:37:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rxR0t-0001M7-VP; Thu, 18 Apr 2024 12:37:15 +0000
Received: by outflank-mailman (input) for mailman id 708335;
 Thu, 18 Apr 2024 12:37:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wA62=LX=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rxR0s-0001M1-6I
 for xen-devel@lists.xenproject.org; Thu, 18 Apr 2024 12:37:14 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61653754-fd80-11ee-b909-491648fe20b8;
 Thu, 18 Apr 2024 14:37:12 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3455ff1339dso500756f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 18 Apr 2024 05:37:12 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j12-20020adfb30c000000b00346266b612csm1754332wrd.81.2024.04.18.05.37.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Apr 2024 05:37:11 -0700 (PDT)
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
X-Inumbo-ID: 61653754-fd80-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713443832; x=1714048632; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZTfc5awSSxeBq/OCyg80q1gCnNYa9WC5ERaDeEF4l58=;
        b=UH6QxS9eACdUKoHC10vMFbax/h7SN23OWPELDO/t2zzeCcnaFT9jJ38kXbKGrLELvJ
         JalylfupqwO9xRgpRlOyTi93+dAEQJbrHnNSEDEpGX0/k293DP8oX/No+pxra2w7r0Wl
         mf2sy5R7K+UI6IygxZdqAN6BUAfVQGh/AyhUojIa5FRU6ucGebxsqFb1rncE8vjCTNCR
         Tr9txKu9UDv05YgON9YN28DfVoElFEP8lWSvJOmuqUzcBpGmdfwrGkJKeS+qwbMiDlqj
         UDnQanDukADedTPGGOkMrZvWQe9PYLohGeYmmyeLrJZdF7rVrVrwEJ/4RJhNhkII7A6p
         RLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713443832; x=1714048632;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZTfc5awSSxeBq/OCyg80q1gCnNYa9WC5ERaDeEF4l58=;
        b=IQjpmAuj/pi8796U1GyZ0SBrZOY8QluioGxs0W8U3/+hFrzzz9iwu7cbV31Yd10M0U
         cy1cb5xqux35ojXccXQl0LZv50jk+yiA9lgJWTsnrBjPf8aiheUw5NIu7OjQsfo8v7Bb
         ur2zyqpJFtz+EzE8B6yQgYsnK6PyLjUme1N/++Jzkmjq3GgRG5HBRB9kyAwLWV4hLc2/
         tZ4PVY/2SwVRWtpyLWIEsMgoOd76IKotjKeyD1GR8TcjJmq4KA5qu+JXNL3vRm8RTdkg
         7sAg2N+pszO5LGFErQlMHbrCnSHZyb0PiyaXdNs5H554SIEqk5DyrLv0NbSn1C5UeeOb
         mTfw==
X-Forwarded-Encrypted: i=1; AJvYcCVSmiSyKUMFVnOAxjdgGdJITr2UGXbtTXNFy1PifPPdlcIxL1/zyHcFbv5DcAtzTH5IgCNM3JayQjDU7j/7c34KNloYcZwlccJoF/dzayc=
X-Gm-Message-State: AOJu0YwxDNqxdcrMpODS9pq/TOMro/uIxSf/YCvgEgS67IqpRTD24s6E
	H9sZznM/Kv6IVCK4bmMPr3DkyCgdGE93x+obDufR1qGgEDo5GKqnFezrMGDB1Q==
X-Google-Smtp-Source: AGHT+IGD9b2pO/5/spSEmcKX4sRpKXveOaSrMb/ExqIBqMwkuqPEK0+jROpn3opGQnYvOBDOwYfRAg==
X-Received: by 2002:a5d:4571:0:b0:345:816c:6e16 with SMTP id a17-20020a5d4571000000b00345816c6e16mr1955268wrc.25.1713443832186;
        Thu, 18 Apr 2024 05:37:12 -0700 (PDT)
Message-ID: <e3f7b726-f7df-4aee-b69f-638cf492d18b@suse.com>
Date: Thu, 18 Apr 2024 14:37:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] xen/domctl, tools: Introduce a new domctl to get
 guest memory map
Content-Language: en-US
To: Henry Wang <xin.wang2@amd.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Alec Kwapis <alec.kwapis@medtronic.com>, xen-devel@lists.xenproject.org
References: <20240409045357.236802-1-xin.wang2@amd.com>
 <20240409045357.236802-2-xin.wang2@amd.com>
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
In-Reply-To: <20240409045357.236802-2-xin.wang2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.04.2024 06:53, Henry Wang wrote:
> --- a/tools/libs/ctrl/xc_domain.c
> +++ b/tools/libs/ctrl/xc_domain.c
> @@ -697,6 +697,43 @@ int xc_domain_setmaxmem(xc_interface *xch,
>      return do_domctl(xch, &domctl);
>  }
>  
> +int xc_get_domain_mem_map(xc_interface *xch, uint32_t domid,
> +                          struct xen_mem_region mem_regions[],
> +                          uint32_t *nr_regions)
> +{
> +    int rc;
> +    uint32_t nr = *nr_regions;
> +    struct xen_domctl domctl = {
> +        .cmd         = XEN_DOMCTL_get_mem_map,
> +        .domain      = domid,
> +        .u.mem_map = {
> +            .nr_mem_regions = nr,
> +        },
> +    };
> +
> +    DECLARE_HYPERCALL_BOUNCE(mem_regions, sizeof(xen_mem_region_t) * nr,
> +                             XC_HYPERCALL_BUFFER_BOUNCE_OUT);
> +
> +    if ( !mem_regions || xc_hypercall_bounce_pre(xch, mem_regions) || nr < 1 )

Why the nr < 1 part? For a caller to size the necessary buffer, it may want
to pass in 0 (and a NULL buffer pointer) first.

> @@ -176,6 +175,33 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
>  
>          return rc;
>      }
> +    case XEN_DOMCTL_get_mem_map:
> +    {
> +        int rc = 0;
> +        uint32_t nr_regions;

unsigned int (see ./CODING_STYLE)?

> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -223,6 +223,13 @@ typedef uint64_t xen_pfn_t;
>   */
>  #define XEN_LEGACY_MAX_VCPUS 1
>  
> +/*
> + * Maximum number of memory map regions for guest memory layout.
> + * Used by XEN_DOMCTL_get_mem_map, currently there is only one region
> + * for the guest magic pages.
> + */
> +#define XEN_MAX_MEM_REGIONS 1

Why is this in the public header? I can only find Xen-internal uses.

> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -946,6 +946,33 @@ struct xen_domctl_paging_mempool {
>      uint64_aligned_t size; /* Size in bytes. */
>  };
>  
> +#ifndef XEN_MAX_MEM_REGIONS
> +#define XEN_MAX_MEM_REGIONS 1
> +#endif
> +
> +struct xen_mem_region {
> +    uint64_aligned_t start;
> +    uint64_aligned_t size;
> +#define XEN_MEM_REGION_DEFAULT    0

I can't spot any use of this. What's its purpose?

> +#define XEN_MEM_REGION_MAGIC      1
> +    uint32_t         type;
> +    /* Must be zero */
> +    uint32_t         pad;

This being OUT only, I don't think the comment makes sense. I'd omit it
completely; if you absolutely want one, please say "will" instead of "must".

Jan

