Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC48A996E82
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 16:45:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.814687.1228304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syXwU-0008VL-LF; Wed, 09 Oct 2024 14:45:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 814687.1228304; Wed, 09 Oct 2024 14:45:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syXwU-0008Sp-Gn; Wed, 09 Oct 2024 14:45:34 +0000
Received: by outflank-mailman (input) for mailman id 814687;
 Wed, 09 Oct 2024 14:45:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Z5PZ=RF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1syXwT-0008JM-5p
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 14:45:33 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 228d141b-864d-11ef-a0bd-8be0dac302b0;
 Wed, 09 Oct 2024 16:45:32 +0200 (CEST)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a99543ab209so456849366b.2
 for <xen-devel@lists.xenproject.org>; Wed, 09 Oct 2024 07:45:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a994e6e571asm480800066b.85.2024.10.09.07.45.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Oct 2024 07:45:31 -0700 (PDT)
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
X-Inumbo-ID: 228d141b-864d-11ef-a0bd-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1728485132; x=1729089932; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=xqpMyuyP184XSgPcyfxcbT2ZyTA5mjQDSZGaLnuJDpI=;
        b=H8HN3wFbMxylUVvZR9SOzRKp0p61TyeA7h200i34xrkNhogieZz9IW4nz2/mq64lu8
         b03/OzvJrQgx3w7RS2igHM7Hrf0SVAixjdHnQh8a+SKRBXR/LqGcDjrDMVLjEgLagXw4
         ujKgpMAl9RaPb/2LuDwDzA3pbN/7kd8GpMW3MtmeSyGBds5IJpnA+UvjX2JE2J2Qz4AL
         yg/y9YzWvleWfHs44mtvjTdzpytWBDV/PDXjqpjt2/tQ+dVHWZYK+DRGqcBuhv/yvuxy
         xrL0H7CmGa5AM5C+jfbaMNMuzULgbfD5d9uK995Tqotns07e1jCPVv08GHAuKzI67wYA
         G9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728485132; x=1729089932;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqpMyuyP184XSgPcyfxcbT2ZyTA5mjQDSZGaLnuJDpI=;
        b=saU4YYOGDgwCrezEowdHtFMgveqe5jjBlP8Ff7y5YBT6jAp6HZ5tIT1AeuVMeHY1xh
         AzmyALuQ+jxHt0KV2EIvpA2H+nh6HPy2viqpURwhZWS2V4uy/NzMexsEU4biG0m5WCFm
         sV5ipPt1A60RiLtDDrGwZ+oeBwNFIMLm9ZxoF7GAdt7kiS/JzPa9GxZMZg80oTC7qGBA
         ekAPUXK25yzZtqQUdfbSZqA1MnfwFVxAdwAkDnHiQLmUHaQP2s0Rm5KU+EHulsYR04e+
         sytFXIyOrlBzsRRgJruyNRPj6OeMHe6difxqTkaXCabjsTgKF8ogZ4WlO5fgbMDD04ce
         fFWw==
X-Forwarded-Encrypted: i=1; AJvYcCXtGj0ID4NzXEzNhBOFmKGyxrBdo5Gq2ogUIDc5AfW6s/U9olwWIRZYTG0J7aGm9Q1iH5aSaEVGuyw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzsK2Is/lotJR/d/m7ptwAmP4RqqJ5qk/1SDf2tK5l1QL1LCLYb
	JUfnj9Xc8dNy9ibZ1RsazDwyPxUsMevaxLnigsj03CnhS6kga6bu34/vt5cJpg==
X-Google-Smtp-Source: AGHT+IEdsFphsLknG+PyQRCf12sGMTey/aYqsBnnlyQTHpP4YiIOe7xDcT7fAjULxnTNp2SEIBKE8g==
X-Received: by 2002:a17:907:2ce1:b0:a99:3eb1:a37f with SMTP id a640c23a62f3a-a998d3287aamr215362566b.58.1728485131597;
        Wed, 09 Oct 2024 07:45:31 -0700 (PDT)
Message-ID: <7595b3ab-0891-42f7-81b0-5666651046b9@suse.com>
Date: Wed, 9 Oct 2024 16:45:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/11] xen/lib: Add topology generator for x86
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20241001123807.605-1-alejandro.vallejo@cloud.com>
 <20241001123807.605-9-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20241001123807.605-9-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.10.2024 14:38, Alejandro Vallejo wrote:
> --- a/xen/include/xen/lib/x86/cpu-policy.h
> +++ b/xen/include/xen/lib/x86/cpu-policy.h
> @@ -542,6 +542,22 @@ int x86_cpu_policies_are_compatible(const struct cpu_policy *host,
>                                      const struct cpu_policy *guest,
>                                      struct cpu_policy_errors *err);
>  
> +/**
> + * Synthesise topology information in `p` given high-level constraints
> + *
> + * Topology is given in various fields accross several leaves, some of
> + * which are vendor-specific. This function uses the policy itself to
> + * derive such leaves from threads/core and cores/package.

Isn't it more like s/uses/fills/ (and the rest of the sentence then
possibly adjust some to match)? The policy looks to be purely an output
here (except for the vendor field).

> --- a/xen/lib/x86/policy.c
> +++ b/xen/lib/x86/policy.c
> @@ -2,6 +2,94 @@
>  
>  #include <xen/lib/x86/cpu-policy.h>
>  
> +static unsigned int order(unsigned int n)
> +{
> +    ASSERT(n); /* clz(0) is UB */
> +
> +    return 8 * sizeof(n) - __builtin_clz(n);
> +}
> +
> +int x86_topo_from_parts(struct cpu_policy *p,
> +                        unsigned int threads_per_core,
> +                        unsigned int cores_per_pkg)
> +{
> +    unsigned int threads_per_pkg = threads_per_core * cores_per_pkg;

What about the (admittedly absurd) case of this overflowing?

> +    unsigned int apic_id_size;
> +
> +    if ( !p || !threads_per_core || !cores_per_pkg )
> +        return -EINVAL;
> +
> +    p->basic.max_leaf = MAX(0xb, p->basic.max_leaf);

Better use the type-safe max() (and min() further down)?

> +    memset(p->topo.raw, 0, sizeof(p->topo.raw));
> +
> +    /* thread level */
> +    p->topo.subleaf[0].nr_logical = threads_per_core;
> +    p->topo.subleaf[0].id_shift = 0;
> +    p->topo.subleaf[0].level = 0;
> +    p->topo.subleaf[0].type = 1;
> +    if ( threads_per_core > 1 )
> +        p->topo.subleaf[0].id_shift = order(threads_per_core - 1);
> +
> +    /* core level */
> +    p->topo.subleaf[1].nr_logical = cores_per_pkg;
> +    if ( p->x86_vendor == X86_VENDOR_INTEL )
> +        p->topo.subleaf[1].nr_logical = threads_per_pkg;
> +    p->topo.subleaf[1].id_shift = p->topo.subleaf[0].id_shift;
> +    p->topo.subleaf[1].level = 1;
> +    p->topo.subleaf[1].type = 2;
> +    if ( cores_per_pkg > 1 )
> +        p->topo.subleaf[1].id_shift += order(cores_per_pkg - 1);
> +
> +    apic_id_size = p->topo.subleaf[1].id_shift;
> +
> +    /*
> +     * Contrary to what the name might seem to imply. HTT is an enabler for
> +     * SMP and there's no harm in setting it even with a single vCPU.
> +     */
> +    p->basic.htt = true;
> +    p->basic.lppp = MIN(0xff, threads_per_pkg);
> +
> +    switch ( p->x86_vendor )
> +    {
> +    case X86_VENDOR_INTEL: {
> +        struct cpuid_cache_leaf *sl = p->cache.subleaf;
> +
> +        for ( size_t i = 0; sl->type &&
> +                            i < ARRAY_SIZE(p->cache.raw); i++, sl++ )
> +        {
> +            sl->cores_per_package = cores_per_pkg - 1;
> +            sl->threads_per_cache = threads_per_core - 1;
> +            if ( sl->type == 3 /* unified cache */ )
> +                sl->threads_per_cache = threads_per_pkg - 1;

I wasn't able to find documentation for this, well, anomaly. Can you please
point me at where this is spelled out?

Jan

