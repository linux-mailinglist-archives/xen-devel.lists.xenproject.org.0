Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D94B68983F4
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 11:29:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700763.1094394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsJP0-0006NR-Pu; Thu, 04 Apr 2024 09:28:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700763.1094394; Thu, 04 Apr 2024 09:28:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsJP0-0006KI-M7; Thu, 04 Apr 2024 09:28:58 +0000
Received: by outflank-mailman (input) for mailman id 700763;
 Thu, 04 Apr 2024 09:28:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=stKz=LJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rsJOz-0006J1-VO
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 09:28:57 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c1c5dbbf-f265-11ee-a1ef-f123f15fe8a2;
 Thu, 04 Apr 2024 11:28:55 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a472f8c6a55so105115866b.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 02:28:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ay12-20020a170906d28c00b00a46a9c38b16sm8804796ejb.138.2024.04.04.02.28.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Apr 2024 02:28:54 -0700 (PDT)
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
X-Inumbo-ID: c1c5dbbf-f265-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712222935; x=1712827735; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7uwI37r6oCLk1OvdPN0Nbeum4J7vCYJrEF8EHHdazxg=;
        b=aG/chJ0waCph8nEK6msnsXXScbtcegtNrLZ2Gfqn7pHDkRFpnYk3OFFlpYdUaRpiWE
         mfIBduMiCkKenLSAe55vAAHYz8XwwlT2MXcYeGk0h7r0Cnr0mf24h+upyYQv+zGDPO5C
         iveX19ciIRaRqtNNvl6TsOcErLYkezFs1d08B49hBJJEeLmLSoO0Z37a2k5xF95F5hLp
         3hl2sFjf6UwfKeAKi9z92dUh5Va59RQujKWaC9i3AK46u819AOfLLbZHsTnTTY+9uFDG
         P9NkhAjEPbS2Fj3hJCHXiBr3wkTOjVdr22J1CJ4HgQLcqZhrccxHO8z+5SLXHU1PZaZQ
         spTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712222935; x=1712827735;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7uwI37r6oCLk1OvdPN0Nbeum4J7vCYJrEF8EHHdazxg=;
        b=GCFJ6+jXIaTee/ZH5jvAOS4tjsR/K4lhi5Vkub9LcBDfj+ZkVk6JqdZG6intntDTgi
         TiDkKvo7kGsJ5jJaBrI8s01T0wuilWcn6oXpPKyekgcS0dJdoxBpr9+T+DdNDQ38KIeT
         3R8jn5/22/vHr9VmDQMSIXpF6HFhc4SXE6Y+pVlqO8CUgw9tApkp9zi/38Wale0nAea3
         TUTBzMI22IY+C3Q3HaVfegN59PHF+yv+hAwcvj5a8Q6HBkg6utxM57ktfIz8c8EMmCJl
         mz1zCGUQm29cwugBD0Tw/dVAzbx71q0nV98+Xjt2hlJU7uuMryflWZQ2ZJeE1ibh9ZsX
         mSKA==
X-Forwarded-Encrypted: i=1; AJvYcCV5HJ3SNUPjBU54pgkFCKEavT+GBCSbQQ0fXioAkU+h+fCZyxMYgYN9tw5IRI29vAaS2luG3G2a3Yrk1OIH0+6WDyMHzW7XmyKLopT2T6E=
X-Gm-Message-State: AOJu0Yy2UclzRCKybSjIB6PFdmAQ8cepT7wZob+RcIPBsC36Urcqjzou
	cYfA+iE6D3rC01cPHB8VIU5bb4H4JXJl3oDadJnt7d4IKCKdwLm2HBNY2QLE3Q==
X-Google-Smtp-Source: AGHT+IH6p4eqcH7KPNHIt0Jt0Seqdb+jc5TFFTnyNXuhuA5cTqiRRU4bmJvyYDHzTL5tx1se/upGCQ==
X-Received: by 2002:a17:907:a4b:b0:a51:8aa8:56b7 with SMTP id be11-20020a1709070a4b00b00a518aa856b7mr842787ejc.35.1712222934745;
        Thu, 04 Apr 2024 02:28:54 -0700 (PDT)
Message-ID: <3ba13bce-d301-49bb-9028-6d48a05fd077@suse.com>
Date: Thu, 4 Apr 2024 11:28:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] xen/domctl, tools: Introduce a new domctl to get
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
References: <20240403081626.375313-1-xin.wang2@amd.com>
 <20240403081626.375313-2-xin.wang2@amd.com>
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
In-Reply-To: <20240403081626.375313-2-xin.wang2@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.04.2024 10:16, Henry Wang wrote:
> --- a/tools/libs/ctrl/xc_domain.c
> +++ b/tools/libs/ctrl/xc_domain.c
> @@ -697,6 +697,39 @@ int xc_domain_setmaxmem(xc_interface *xch,
>      return do_domctl(xch, &domctl);
>  }
>  
> +int xc_get_domain_mem_map(xc_interface *xch, uint32_t domid,
> +                          struct xen_mem_region mem_regions[],
> +                          uint32_t *nr_regions)
> +{
> +    int rc;
> +    struct xen_domctl domctl = {
> +        .cmd         = XEN_DOMCTL_get_mem_map,
> +        .domain      = domid,
> +        .u.mem_map = {
> +            .nr_mem_regions = *nr_regions,
> +            .pad            = 0,

This isn't needed: By there being an initializer for the struct, all
unmentioned fields will be set to 0 anyway.

> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -696,6 +696,7 @@ int arch_domain_create(struct domain *d,
>  {
>      unsigned int count = 0;
>      int rc;
> +    struct mem_map_domain *mem_map = &d->arch.mem_map;
>  
>      BUILD_BUG_ON(GUEST_MAX_VCPUS < MAX_VIRT_CPUS);
>  
> @@ -785,6 +786,20 @@ int arch_domain_create(struct domain *d,
>      d->arch.sve_vl = config->arch.sve_vl;
>  #endif
>  
> +    if ( mem_map->nr_mem_regions < XEN_MAX_MEM_REGIONS )
> +    {
> +        mem_map->regions[mem_map->nr_mem_regions].start = GUEST_MAGIC_BASE;
> +        mem_map->regions[mem_map->nr_mem_regions].size = GUEST_MAGIC_SIZE;
> +        mem_map->regions[mem_map->nr_mem_regions].type = GUEST_MEM_REGION_MAGIC;
> +        mem_map->nr_mem_regions++;
> +    }
> +    else
> +    {
> +        printk("Exceed max number of supported memory map regions\n");

Debugging leftover?

> --- a/xen/arch/arm/domctl.c
> +++ b/xen/arch/arm/domctl.c
> @@ -148,7 +148,6 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
>  
>          return 0;
>      }
> -
>      case XEN_DOMCTL_vuart_op:
>      {
>          int rc;

Why? Instead you want ...

> @@ -176,6 +175,37 @@ long arch_do_domctl(struct xen_domctl *domctl, struct domain *d,
>  
>          return rc;
>      }
> +    case XEN_DOMCTL_get_mem_map:

... separating blank line above this line and ...

> +    {
> +        int rc = 0;
> +        uint32_t nr_regions, i;
> +
> +        if ( domctl->u.mem_map.pad )
> +            return -EINVAL;
> +
> +        /*
> +         * Cap the number of regions to the minimum value between toolstack and
> +         * hypervisor to avoid overflowing the buffer.
> +         */
> +        nr_regions = min(d->arch.mem_map.nr_mem_regions,
> +                         domctl->u.mem_map.nr_mem_regions);
> +
> +        domctl->u.mem_map.nr_mem_regions = nr_regions;
> +
> +        for ( i = 0; i < nr_regions; i++ )
> +        {
> +            if ( d->arch.mem_map.regions[i].pad )
> +                return -EINVAL;
> +        }
> +
> +        if ( copy_to_guest(domctl->u.mem_map.buffer,
> +                           d->arch.mem_map.regions,
> +                           nr_regions) ||
> +             __copy_to_guest(u_domctl, domctl, 1) )
> +            rc = -EFAULT;
> +
> +        return rc;
> +    }
>      default:

... this one.

Further with the way you use min() above, how is the caller going to know
whether it simply specified too small an array?

And then you check d->arch.mem_map.regions[i].pad. Why's that? And even
if needed here for some reason, that's surely not EINVAL, but an internal
error in Xen.

Finally instead of __copy_to_guest() can't you use __copy_field_to_guest(),
for just nr_regions?

> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -946,6 +946,31 @@ struct xen_domctl_paging_mempool {
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
> +    uint32_t         type;

What is this field set to? I see no #define(s) in this header. If it's
the GUEST_MEM_REGION_* in the Arm header, a connection needs to be made.
Also note that GUEST_MEM_REGION_* violate name space requirements: New
additions should have XEN_ / xen_ prefixes on their names.

> +    /* Must be zero */
> +    uint32_t         pad;

This, being OUT only, should not be required to be set by the caller. As
long as no use appears, Xen merely ought to guarantee that it'll be 0 upon
return.

Jan

