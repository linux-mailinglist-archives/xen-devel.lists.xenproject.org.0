Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C9C80589F
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 16:27:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648024.1011922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAXKJ-0002mN-GO; Tue, 05 Dec 2023 15:27:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648024.1011922; Tue, 05 Dec 2023 15:27:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAXKJ-0002kE-Dg; Tue, 05 Dec 2023 15:27:11 +0000
Received: by outflank-mailman (input) for mailman id 648024;
 Tue, 05 Dec 2023 15:27:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kfJ1=HQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAXKI-0002k8-02
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 15:27:10 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0493fdf-9382-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 16:27:07 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40bd5eaa66cso47037865e9.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 07:27:07 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 i19-20020a05600c355300b0040b3867a297sm18810084wmq.36.2023.12.05.07.27.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 07:27:06 -0800 (PST)
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
X-Inumbo-ID: c0493fdf-9382-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701790027; x=1702394827; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CgY2D1k/e8Uf0F4+f2H7wb182xU0wRVEhobTv2hzE4A=;
        b=dHMUUJUTIM0EI+0peDF5BxQjT7OfjY3c6vVHlw4QYhjDqwN87O1UgbQxB0WST8AWL1
         cMYkFG0nC3FyFIy6IHPqb0+ajhqa2D+LaB8sZWnovJODpRwEd/qIlhjED/MGCUrOn8Qp
         zyWgaUop3DVpO4oUxGUjh6hpevjxAkBg4/khOFR6414R27qD2sUpc7LsOtYtp/dhU6Ju
         h2drdlxw92ewJPU6Ijp1qJtoBX0SSSSEkB/RoJb8gj8HRvvQezrWNvmmHAVTLlTiGdbd
         QDRdp1Wvwf2wrbe1XUhb/w6dyR/MZT9psAE3ZQagcBSLEdM/hCitb/gDpXP5gVEl5s9v
         UtKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701790027; x=1702394827;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CgY2D1k/e8Uf0F4+f2H7wb182xU0wRVEhobTv2hzE4A=;
        b=Bu3ntJKpgkOzHoIUvsdd03gArZoY95ljc1PnrL+FiSPbLXzkV+lGUBe+3EFDxalN3z
         22LMBP3BLHQyAZtM1WU5nY8S1rLEWjpyy6i5aeSrfPOeB76SIGrO8EJ3py985OyWNyLq
         OlPhXd61oF5/twTGkbVjurkt7Hps0c7be3EmYfxjeTHmXPLJXEVsTW5U6LRjQQS0QMjM
         VCuKUHuIGVP/Gm3WpR8YJEmQoZzcqW9zF086snfQimXK727etF2FPUYaTw9ejZsQDmre
         jPk5g9cNrEuw/Np6d1NbAWTr1FiblooxP5D5/BeclzdZsAwO9C8EytKX17NrE3IGTS+L
         G4CA==
X-Gm-Message-State: AOJu0YyCfK557RkM1JqVxFpoZwIkvIrLbmnfp859DKy499ABiNCQFR/u
	yP4Y1wWw4tTYr8yfH6IiQ5u94nJUgO8GIpmrroeZ
X-Google-Smtp-Source: AGHT+IFMzDYOwPBpG+ZZA2mleKJpLTk9lNn79UiQndBrsGHot8ykbuuj4AKY+68R6nNYiOcaoMX3pg==
X-Received: by 2002:a05:600c:3309:b0:40b:5e21:dd37 with SMTP id q9-20020a05600c330900b0040b5e21dd37mr635035wmp.101.1701790027167;
        Tue, 05 Dec 2023 07:27:07 -0800 (PST)
Message-ID: <095c2f4c-9b10-4ab8-95ea-101f62096678@suse.com>
Date: Tue, 5 Dec 2023 16:27:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] x86/iommu: switch hwdom IOMMU to use a rangeset
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20231204094305.59267-1-roger.pau@citrix.com>
 <20231204094305.59267-6-roger.pau@citrix.com>
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
In-Reply-To: <20231204094305.59267-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.12.2023 10:43, Roger Pau Monne wrote:
> @@ -476,58 +406,55 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
>      if ( !map )
>          panic("IOMMU init: unable to allocate rangeset\n");
>  
> -    max_pfn = (GB(4) >> PAGE_SHIFT) - 1;
> -    top = max(max_pdx, pfn_to_pdx(max_pfn) + 1);
> +    if ( iommu_hwdom_inclusive )
> +    {
> +        /* Add the whole range below 4GB, UNUSABLE regions will be removed. */
> +        rc = rangeset_add_range(map, 0, max_pfn);
> +        if ( rc )
> +            panic("IOMMU inclusive mappings can't be added: %d\n",
> +                  rc);
> +    }
>  
> -    for ( i = 0, start = 0, count = 0; i < top; )
> +    for ( i = 0; i < e820.nr_map; i++ )
>      {
> -        unsigned long pfn = pdx_to_pfn(i);
> -        unsigned int perms = hwdom_iommu_map(d, pfn, max_pfn);
> +        struct e820entry entry = e820.map[i];
>  
> -        if ( !perms )
> -            /* nothing */;
> -        else if ( paging_mode_translate(d) )
> +        switch ( entry.type )
>          {
> -            int rc;
> +        case E820_UNUSABLE:
> +            if ( !iommu_hwdom_inclusive || PFN_DOWN(entry.addr) > max_pfn )
> +                continue;

The !iommu_hwdom_inclusive part isn't really needed here, is it? The ...

> -            rc = p2m_add_identity_entry(d, pfn,
> -                                        perms & IOMMUF_writable ? p2m_access_rw
> -                                                                : p2m_access_r,
> -                                        0);
> +            rc = rangeset_remove_range(map, PFN_DOWN(entry.addr),
> +                                       PFN_DOWN(entry.addr + entry.size - 1));

... call here would then simply be a no-op, as it looks. And things would
overall look more safe if the removal was skipped for fewer reasons.

> @@ -605,7 +532,7 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
>      rangeset_destroy(map);
>  
>      /* Use if to avoid compiler warning */
> -    if ( iommu_iotlb_flush_all(d, flush_flags) )
> +    if ( iommu_iotlb_flush_all(d, map_data.flush_flags) )
>          return;
>  }

Ah yes, here is said change. But I think for correctness this wants
moving to the earlier patch.

Jan

