Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37117AB3C2D
	for <lists+xen-devel@lfdr.de>; Mon, 12 May 2025 17:34:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.981741.1368149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEVAK-0003vd-6S; Mon, 12 May 2025 15:34:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 981741.1368149; Mon, 12 May 2025 15:34:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEVAK-0003t1-3s; Mon, 12 May 2025 15:34:04 +0000
Received: by outflank-mailman (input) for mailman id 981741;
 Mon, 12 May 2025 15:34:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1o4g=X4=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uEVAI-0003sv-Oo
 for xen-devel@lists.xenproject.org; Mon, 12 May 2025 15:34:02 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8668c418-2f46-11f0-9ffb-bf95429c2676;
 Mon, 12 May 2025 17:34:00 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5f7ec0e4978so862312a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 12 May 2025 08:34:00 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5fc9d700e56sm5842028a12.57.2025.05.12.08.33.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 May 2025 08:33:59 -0700 (PDT)
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
X-Inumbo-ID: 8668c418-2f46-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747064039; x=1747668839; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QPIXPAv4PPVLmmkjR87Ub2AuyzhTKKJSpkg0dNS1NR0=;
        b=DDNivKTg9FRivwKYO+Vhcf1HofOHoM4CgOPHd5SNbqEiKLjfyfbH8FFTi9Dv/XybcK
         0pycNPY0U+TV6yge1Qw2rW8u9RAag8QSAgJIV/2pwULLZwixquIccJb1QJlkvOENh5tl
         I5y9D0091QGemZwE9ClA7a3vwGDxaRtQg9maZj00Sc0oXMBTXrwRB57xZQfhsQqyXFTm
         3QuOMBzwe2g6MITofOvE97esNG/u1BQtFoxd2vebt3HLknR/a9PNXVK5/Idu6kIp0jUA
         vlQWHoWuHAE0LJEA3fAFdwed+dKvM4hlecm95kuNIji76sKvOE+S1GvHIiPzqwCnD9dA
         UMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747064039; x=1747668839;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QPIXPAv4PPVLmmkjR87Ub2AuyzhTKKJSpkg0dNS1NR0=;
        b=qJ6RJvVdOCq+FP5p8eWSI3U8mO3KT+9E42D1zNNd46t7ltyFrAHCflMip7zKguvZSi
         hRtf/EjqZUsDibMiZCnVJLkCue8xUmQLWNCqEW5Nn7/KQF1hAhKTgFJ9ncFqkHN6b6MQ
         RSktdrporHjeaSuiJjRJ9DtdOk81Hq68NG6k+YemZTUws9eIs4uiUeFD8VEcWClSBgXI
         LW4txJHExpKS2DkFVywB6cMwy0LDe3+jBVhxHBHH4G0gWFDYAjWuemof9lBmLlI8HcZV
         oxLldY4ph01Ug3Afi4XX+7FewcF+QzNO6VbnqHfz9UjfRCeHcD7gywI2olqdhQmCuD/A
         gbug==
X-Forwarded-Encrypted: i=1; AJvYcCW74ynLpuZZG+tVamcGPEV6/ZmuViPiro6yBsSGHlwAv6nEnUq7/QnSDTQewpypCifOkOkdMrAmIDo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxoTC/fmS9DMxsGLS8lBXuBirIvu5Jc8VtCsz1OjZ+YxkYncPur
	OrJcbTZjliAHCxS8Gf5rgdmK8Exc5jFRNE8yeIuxjhqkSI3MxE3uWNNitrTsxw==
X-Gm-Gg: ASbGncsoDr8SJou5l2lhnzKEfBw1qTZWOGh5StV8PQN9VKkHfYYoNy0AKZr2Jaz/RvN
	mtX7yExOkneX8R+MBpJ3Hrp1rWBig0LPx8gS/szMdi1jV6YQoPdA2scemNJ5z2YZyIKyDZbtJtJ
	rFpQUOH+19bpTtvhlWBh+glIWJyR6XsaWnh3Yhl6liBLETSNkd/IkZxGwkkkebiagBaae2loxxs
	F4MbpuxePi1u+veExogXX8MMVw7iPDC8gRZL2s+qJdJiGrY+j83S+4Rc/sHmiJdV/0Eg2tRksIF
	iEuZXEJr0LmaOdWbH2prlctdxU1k4xE6h2UqIkWwGw+CiGsSkW5RyfsgiiqQTCvmF+FbPcu3lu5
	MY1YLgLGlJLbi17/fL5jiy44Hc/4BDXG6LlTV
X-Google-Smtp-Source: AGHT+IGxopyOP86skr4mx/8q8/3wLGXVVktB59X6nLu8qcKQmi42DK3JomojZ7id53QgedcXwlHdzg==
X-Received: by 2002:a05:6402:280a:b0:5fc:a510:502e with SMTP id 4fb4d7f45d1cf-5fca510505cmr9314145a12.29.1747064039411;
        Mon, 12 May 2025 08:33:59 -0700 (PDT)
Message-ID: <50d87c60-55fa-49c8-be85-7c70ee6dcb42@suse.com>
Date: Mon, 12 May 2025 17:33:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] xen/x86: track dirty pCPU caches for a given vCPU
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250506083148.34963-1-roger.pau@citrix.com>
 <20250506083148.34963-10-roger.pau@citrix.com>
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
In-Reply-To: <20250506083148.34963-10-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.05.2025 10:31, Roger Pau Monne wrote:
> @@ -2606,6 +2619,36 @@ unsigned int domain_max_paddr_bits(const struct domain *d)
>      return bits;
>  }
>  
> +void vcpu_flush_cache(struct vcpu *curr)
> +{
> +    ASSERT(curr == current);
> +    ASSERT(cache_flush_permitted(curr->domain));
> +
> +    flush_mask(curr->arch.dirty_cache, FLUSH_CACHE);
> +    cpumask_clear(curr->arch.dirty_cache);

While here re-ordering of the two operations would be merely for (kind of)
doc purposes, ...

> +    __cpumask_set_cpu(smp_processor_id(), curr->arch.dirty_cache);
> +}
> +
> +void domain_flush_cache(const struct domain *d)
> +{
> +    const struct vcpu *v;
> +    cpumask_t *mask = this_cpu(scratch_cpumask);
> +
> +    ASSERT(cache_flush_permitted(d));
> +
> +    cpumask_clear(mask);
> +    for_each_vcpu( d, v )
> +        cpumask_or(mask, mask, v->arch.dirty_cache);
> +
> +    flush_mask(mask, FLUSH_CACHE);
> +    /*
> +     * Clearing the mask of vCPUs in the domain would be racy unless all vCPUs
> +     * are paused, so just leave them as-is, at the cost of possibly doing
> +     * redundant flushes in later calls.  It's still better than doing a
> +     * host-wide cache flush.
> +     */

... wouldn't clearing before flushing avoid the raciness here?

> +}

Also imo both functions are a better fit in mm.c.

Jan

