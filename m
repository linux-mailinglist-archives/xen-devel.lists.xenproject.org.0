Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E608AA921CB
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 17:39:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.958148.1351093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5RKP-0005H1-U5; Thu, 17 Apr 2025 15:39:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 958148.1351093; Thu, 17 Apr 2025 15:39:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5RKP-0005Eb-RU; Thu, 17 Apr 2025 15:39:01 +0000
Received: by outflank-mailman (input) for mailman id 958148;
 Thu, 17 Apr 2025 15:38:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nsoM=XD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u5RKN-0005EV-SP
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 15:38:59 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 139dbf6a-1ba2-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 17:38:57 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-39149bccb69so976670f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 17 Apr 2025 08:38:57 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f2c2af1299sm433766d6.17.2025.04.17.08.38.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Apr 2025 08:38:56 -0700 (PDT)
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
X-Inumbo-ID: 139dbf6a-1ba2-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744904337; x=1745509137; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=h2UmYj8KoPb0wVajq5s+Cae72/Wscsr/94eHCJIM54Y=;
        b=CGPKletn1wyi3DeBVTV+RW/+MbXvCQEFJp66JOd1p9PjJXEQfg8wU2f7hfR3vQ2l0N
         GrB8xElg96mQcBXJsJPliMADe2STpAj991C/rvQ+j7dy/JzN08SenuhT8RXfMOVU6Vya
         Kd1kIB4NZp2Qzqo8Cudyz2VwX76RNcCQZlwY+2t1JqEf/SuCyjHy+zH+5b1e+qCgidTm
         KJdNrAdIPMpB9gCj2A4qQ+wIGJxlLKnFaEFh2Q6OsV7JHhsLkM1s8GxUiofms2iE1zUb
         9wD7RXcfss5twmJHI0gapZ7uUWD9Do/1xlLBNRfoi8nNPghjz+w0+w1BiczzSyV4hv3h
         zJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744904337; x=1745509137;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h2UmYj8KoPb0wVajq5s+Cae72/Wscsr/94eHCJIM54Y=;
        b=HA1SgGbyZKEEzg3/67CXBTDJBaArYiczeNZv6WUdd+Juz8orfoEprx2NPkfP61wYgw
         yoYQ86udd+wjf2HBrtFVnWEz/MtsQy9wsBgcpZn4ppfRzF3S2HVTp3MWnXO93toBvh57
         3yo4JONsP3yoEKjxtSmJb6tUMWdkyMWj6f8mWTNBbQYEgXPilWW/OgMhSJ/2RyOOBc0B
         3oLQoqEQKJRLDv2E2g+GtJBgNITws4mMuVxw2Bc0focsiD3fgxiYnOhlzrmcajNpWKXz
         y7IMSMqrIyQ7jZbSinE5pJEAkJ330w0LJJ/xjeGGRlRVsEowUnWEWlB0Daq5W3yeMZpL
         vrQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdkmWWSB4fLTJP8Brck/mS8v8bXL1aqw/VOKLPiq/3CPhD9qdMmMrmoNx/vEkeG+sLwR9EEOcHYNU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxDV384xWbESlR+PudahSbrZ3+JhOjwnPo3Ao/swzJIOxnwgmiD
	ldHn8Mdg1+ndftSssTMlKSmxwLgG2FbHazMTJ8PERnrQ8ZRJR2T5ES16Uisfhw==
X-Gm-Gg: ASbGncs9yiZqL9QunQFzc9Kk5QFRR8i1R5lNHI7GztdYD6PensZj+iToSyhaz7m41+S
	vX8yGntLB5hwtaS3F0TQE5WIvjt2M1wOdAMDMS4bdXJYfkYyoMPI6KxeMXCtiWPr5QgcJNQgOvo
	l8kpnThamVympju4BFdAQt1IgRWHm7Y0SXnijJy0E8g6ECdz0DbrCW3ll63DKl6XmBXAGIC1kg6
	3O+vU1iaPnGtIK7a6jLyhITbcwb6AfE7hxl/jNGNIt9awd5fwO2pMvlyuPY/ZsxR6yi92ggsEvj
	QxseUfY6XIlWGmMmNjLPQFndTCLxaiONPJWlyQHDYZj2DKuJ47Y42hAflzOMFbmm/JmAgG/O+FE
	09o+Lj7eFdtFC8OgNH7KcWsfAyg==
X-Google-Smtp-Source: AGHT+IE+rVeLyBgS8fEpsG121iV+Wie8oT62/toqCMA2k3eQ1iNe/thwLyc0Q+znFtd4tckDtTmQSQ==
X-Received: by 2002:a05:6000:144f:b0:38f:6287:6474 with SMTP id ffacd0b85a97d-39ee5b15c87mr6139858f8f.15.1744904337231;
        Thu, 17 Apr 2025 08:38:57 -0700 (PDT)
Message-ID: <f71bc0f8-8de1-4ecd-a2c0-a420e991e429@suse.com>
Date: Thu, 17 Apr 2025 17:38:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] x86/hvm: fix handling of accesses to partial r/o
 MMIO pages
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250417152514.13702-1-roger.pau@citrix.com>
 <20250417152514.13702-3-roger.pau@citrix.com>
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
In-Reply-To: <20250417152514.13702-3-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.04.2025 17:25, Roger Pau Monne wrote:
> --- a/xen/arch/x86/hvm/emulate.c
> +++ b/xen/arch/x86/hvm/emulate.c
> @@ -370,7 +370,15 @@ static int hvmemul_do_io(
>          /* If there is no suitable backing DM, just ignore accesses */
>          if ( !s )
>          {
> -            if ( is_mmio && is_hardware_domain(currd) )
> +            if ( is_mmio && is_hardware_domain(currd) &&
> +                 /*
> +                  * Do not attempt to fixup write accesses to r/o MMIO regions,
> +                  * they are expected to be terminated by the null handler
> +                  * below.
> +                  */
> +                 (!rangeset_contains_singleton(mmio_ro_ranges,
> +                                               PFN_DOWN(addr)) ||
> +                  dir == IOREQ_READ) )

These two would better be swapped, for the cheap one to be done first.

> --- /dev/null
> +++ b/xen/arch/x86/hvm/mmio.c
> @@ -0,0 +1,125 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * MMIO related routines.
> + *
> + * Copyright (c) 2025 Cloud Software Group
> + */
> +
> +#include <xen/io.h>
> +#include <xen/mm.h>
> +
> +#include <asm/p2m.h>
> +
> +static int cf_check subpage_mmio_accept(struct vcpu *v, unsigned long addr)
> +{
> +    p2m_type_t t;
> +    mfn_t mfn = get_gfn_query_unlocked(v->domain, PFN_DOWN(addr), &t);
> +
> +    return !mfn_eq(mfn, INVALID_MFN) && t == p2m_mmio_direct &&
> +           subpage_mmio_find_page(mfn);
> +}
> +
> +/*
> + * The guest has read access to those regions, and consequently read accesses
> + * shouldn't fault.  However read-modify-write operations may take this path,
> + * so handling of reads is necessary.
> + */
> +static int cf_check subpage_mmio_read(
> +    struct vcpu *v, unsigned long addr, unsigned int len, unsigned long *data)
> +{
> +    struct domain *d = v->domain;
> +    unsigned long gfn = PFN_DOWN(addr);
> +    p2m_type_t t;
> +    mfn_t mfn;
> +    struct subpage_ro_range *entry;
> +    volatile void __iomem *mem;
> +
> +    *data = ~0UL;
> +
> +    if ( !IS_ALIGNED(len | addr, len) )

What's the point of doing the | ? len can't be misaligned with itself?

> --- a/xen/arch/x86/include/asm/mm.h
> +++ b/xen/arch/x86/include/asm/mm.h
> @@ -554,6 +554,18 @@ int cf_check mmio_ro_emulated_write(
>      enum x86_segment seg, unsigned long offset, void *p_data,
>      unsigned int bytes, struct x86_emulate_ctxt *ctxt);
>  
> +/* r/o MMIO subpage access handlers. */
> +struct subpage_ro_range {
> +    struct list_head list;
> +    mfn_t mfn;
> +    void __iomem *mapped;
> +    DECLARE_BITMAP(ro_elems, PAGE_SIZE / MMIO_RO_SUBPAGE_GRAN);
> +};
> +struct subpage_ro_range *subpage_mmio_find_page(mfn_t mfn);
> +void __iomem *subpage_mmio_map_page(struct subpage_ro_range *entry);

I notice you didn't move the __iomem, which - as indicated - I agree with,
but Andrew didn't. Did you sort this with him privately?

Jan

