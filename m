Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DCAA380B3
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 11:51:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890236.1299238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjyiC-0001iS-Hs; Mon, 17 Feb 2025 10:50:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890236.1299238; Mon, 17 Feb 2025 10:50:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjyiC-0001g6-FC; Mon, 17 Feb 2025 10:50:52 +0000
Received: by outflank-mailman (input) for mailman id 890236;
 Mon, 17 Feb 2025 10:50:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=o9S/=VI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tjyiB-0001g0-8U
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 10:50:51 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 083a30eb-ed1d-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 11:50:42 +0100 (CET)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-ab7c07e8b9bso716636366b.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 02:50:42 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba53397f47sm860281466b.127.2025.02.17.02.50.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Feb 2025 02:50:41 -0800 (PST)
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
X-Inumbo-ID: 083a30eb-ed1d-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739789441; x=1740394241; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ryqH+nXNJtMUcBUF3RpLG2s2qtxhzwk5xPDxjiunRnI=;
        b=YoHjLmisRWDRtP7BOBTU0Y0aDKU33OaLKVEk4SsxvdHErivw+pDyKBqHQZU6OlIvNS
         zBz8WR+E7TBCUw0hj90TuCC5+eN/mdZjKfEHV16CSfI55TOlhNfVqQy28NaDmF0xSp3e
         1cAMbfsUt+nXeuACRD4ZbMEfI+GWGViXD/+SQdutkSKd1mkz4fKeEU+ipevWStE6pQBO
         3wSJBKTfTrOpWuni6lP8mpJBf+GvIZBLEp3MrL9B/WdEXRoAdwi/nkftiJB35JeyWkJH
         HgPWbM64/82aRSRo6FP+pDyQ882LlXJNHIjofs1kPazEAh2C3rUuXPRUeKuSVQESKbgp
         mfcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739789441; x=1740394241;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ryqH+nXNJtMUcBUF3RpLG2s2qtxhzwk5xPDxjiunRnI=;
        b=v0DUMyUBdlJ9dQCgDCEuPsL5M2bCZjvzx8Bxj9VE5dwJY1KXzuc7EulMFkrS9Dxzu7
         LtvJWXOVGR4IYSvWODUhhjyiccI8mdSHeWLDJLhLxDvf78Dk6DARzd4Upa+1T/rU3B/v
         UnUA15ClMBtL6T1Ixb2tCHSLBiYXbQLsHr7wzAGeGpjdVaJR3FxgTqFAKVafwaKlExR8
         Q2AdUhtIk2PD78yLX2XsVZD5BHuGNFd6zadQ1ZerB+feHmUKMcTzdRhUfMlSKvOB5xK5
         lpwPckwUuJPU5CDstmU/TzrsWzAa3dYiuSRFWQXMRetojTmM+yT6Ngga5i5v8kQYfK1b
         Lg7g==
X-Forwarded-Encrypted: i=1; AJvYcCX1Sor84I/o2JMRdTrjIb2PreX44rN8PgOTGFdGs/YFFoyAuxFpvCuziQAnC5InGNfau94wHIDzsS4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzE/KjEZE3euvRIEj5L7zaEUA2b8jWOY3q45qlazAiy19CwpJAc
	QWXv4zIiin9HhriYVe7Sls1896JJklSg6PsGCEmSYMkvObxJb2BZny1d/BLpJQ==
X-Gm-Gg: ASbGncs9Kmc28OFJRViaR20645n+nInRZsrllGciSVOWvAauIUC7DV+iMuB0YPXnYU4
	YLd3/KZEgemT7t0/BfixlAdjzlo+IQarqz4OGftPV/xjDcvuWLfBRTQOydWb5ZoiD49kuc9EePP
	nVXU1b26/1YN0FzzMbrHopYNpzRQfJLqmPvOYOgUUtXd8VFquUGZJazCumCk2OnCgPn9viXfZY5
	cwgLTGZAn+k4UzLLvL4sptNzuUPyT40LpIicH5UclaSYOkBerTT5qasfXFko3J5Gh/uQQm1kfJa
	tVr4Pj3gzQyLuZgVvwxYmr4chx/l3jLX0J/KiyMilEtfspdeTlKcYoswcRnccwNGCAR0TcfQ5fZ
	7
X-Google-Smtp-Source: AGHT+IG97OgE+q5CtVvLLkc3GStHfAQajLG8u2Sh+0CNzYVzhtjYMYNKfFyLNZpjjubaxC18HGjbIA==
X-Received: by 2002:a17:907:6d08:b0:ab7:d87f:665a with SMTP id a640c23a62f3a-abb70dc5897mr1122564066b.46.1739789441522;
        Mon, 17 Feb 2025 02:50:41 -0800 (PST)
Message-ID: <cbea397a-e919-4b00-a56a-f706ddc13e53@suse.com>
Date: Mon, 17 Feb 2025 11:50:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/passthrough: Provide stub functions when
 !HAS_PASSTHROUGH
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250217102732.2343729-1-luca.fancellu@arm.com>
 <20250217102732.2343729-2-luca.fancellu@arm.com>
Content-Language: en-US
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
In-Reply-To: <20250217102732.2343729-2-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.02.2025 11:27, Luca Fancellu wrote:
> When Xen is built without HAS_PASSTHROUGH, there are some parts
> in arm and x86 where iommu_* functions are called in the codebase,
> but their implementation is under xen/drivers/passthrough that is
> not built.

Why the mention of x86, where HAS_PASSTHROUGH is always selected?

> So provide some stub for these functions in order to build Xen
> when !HAS_PASSTHROUGH, which is the case for example on systems
> with MPU support.

Is this fixing a build issue when MPU=y? If so, ...

> For gnttab_need_iommu_mapping() in the Arm part, modify the macro
> to use IS_ENABLED for the HAS_PASSTHROUGH Kconfig.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

... is there a Fixes: tag missing?

> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -110,6 +110,8 @@ extern int8_t iommu_hwdom_reserved;
>  
>  extern unsigned int iommu_dev_iotlb_timeout;
>  
> +#ifdef CONFIG_HAS_PASSTHROUGH
> +
>  int iommu_setup(void);
>  int iommu_hardware_setup(void);
>  
> @@ -122,6 +124,24 @@ int arch_iommu_domain_init(struct domain *d);
>  void arch_iommu_check_autotranslated_hwdom(struct domain *d);
>  void arch_iommu_hwdom_init(struct domain *d);
>  
> +#else
> +
> +static inline int iommu_setup(void)
> +{
> +    return -ENODEV;
> +}
> +
> +static inline int iommu_domain_init(struct domain *d, unsigned int opts)
> +{
> +    return 0;

Shouldn't this fail when is_iommu_enabled(d) is true? (The use of the
predicate here as well as in the real function is slightly strange, but
that's the way it is.)

> @@ -381,17 +423,19 @@ struct domain_iommu {
>  #define iommu_set_feature(d, f)   set_bit(f, dom_iommu(d)->features)
>  #define iommu_clear_feature(d, f) clear_bit(f, dom_iommu(d)->features)
>  
> +/* Does the IOMMU pagetable need to be kept synchronized with the P2M */

This comment belongs to just ...

> +#ifdef CONFIG_HAS_PASSTHROUGH
>  /* Are we using the domain P2M table as its IOMMU pagetable? */
>  #define iommu_use_hap_pt(d)       (IS_ENABLED(CONFIG_HVM) && \
>                                     dom_iommu(d)->hap_pt_share)
>  
> -/* Does the IOMMU pagetable need to be kept synchronized with the P2M */
> -#ifdef CONFIG_HAS_PASSTHROUGH
>  #define need_iommu_pt_sync(d)     (dom_iommu(d)->need_sync)

... this, not also iommu_use_hap_pt(). There's a connection between the
two, but that is unrelated to what the comment says. I'm also not clear
about the need for ...

>  int iommu_do_domctl(struct xen_domctl *domctl, struct domain *d,
>                      XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
>  #else
> +#define iommu_use_hap_pt(d)       ({ (void)(d); false; })
> +
>  #define need_iommu_pt_sync(d)     ({ (void)(d); false; })

... this change, i.e. the need for a stub. Afaics there's nothing in the
description to help understanding this need.

Jan

