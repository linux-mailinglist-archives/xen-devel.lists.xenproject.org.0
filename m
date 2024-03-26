Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEB788CA08
	for <lists+xen-devel@lfdr.de>; Tue, 26 Mar 2024 18:02:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.698178.1089605 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpABb-0001vI-AV; Tue, 26 Mar 2024 17:02:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 698178.1089605; Tue, 26 Mar 2024 17:02:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rpABb-0001tF-7t; Tue, 26 Mar 2024 17:02:07 +0000
Received: by outflank-mailman (input) for mailman id 698178;
 Tue, 26 Mar 2024 17:02:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NDFk=LA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rpABa-0001t9-M3
 for xen-devel@lists.xenproject.org; Tue, 26 Mar 2024 17:02:06 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 926fbf4b-eb92-11ee-afe3-a90da7624cb6;
 Tue, 26 Mar 2024 18:02:05 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-56be32b9775so5618914a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 26 Mar 2024 10:02:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 f2-20020a50d542000000b00568c2ea2cefsm4535247edj.51.2024.03.26.10.02.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Mar 2024 10:02:04 -0700 (PDT)
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
X-Inumbo-ID: 926fbf4b-eb92-11ee-afe3-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1711472524; x=1712077324; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y1B8qLTsvJuggG/6NUKRHlPw7/Jff/UNOH2aXWdvsY8=;
        b=YMlL1+4mnE7Y8ZDIEVt6FCQE8ROIhFNsd3jbBECRFtFcMOi0/lPtDyL3TtVTXG4lAe
         r6nSfu+ikyBKDFRA3vqbMUCr7uL2pQ9vGT6NdHZWxNt2TrSXzc4FHS9jtVHpMq5SN49o
         VwjI/gnXtfeiT5/KOV3/eHKlo/tDgA/MMunqyUFhTzsVXmEQPgPN+rckX7pylhZrP/zn
         FYckiudZ3mTdpqpABiKQewautPDY+JB4frMLJX75Nu9xtzR7cArwoIWFNbDiDTDuMunc
         YBb5gbH6+CpJmShgLbX3Rhurkf5yieMK5tERdJuC6Sbcq4K7FNWtaxsYE94hRMvtdnNh
         PXHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711472524; x=1712077324;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y1B8qLTsvJuggG/6NUKRHlPw7/Jff/UNOH2aXWdvsY8=;
        b=jBRS3aDnwqKmTpN1nPjuWS0LPT5SSDu9HInXcflGUsdcyS3ijZYLZQMWDcuslj2bIB
         HW7522eI0fWUGiCJWOwkE2wSZCJJKuaaxcSdCIYbJ5HE6gwtIzPHHOpxG2LL31onLs3K
         bHiXan0QA5Q8El+D/zFDIO43Y+L1Y3DhFG22PwzsmQRUx83A+kPRdnaWFZrTll9OkOHT
         r9WI0Y38n3J5YsWZru7E3BfScz2Qtb7TlZSuspJgrUBqlHseijs98BMw6QJfGepW/47d
         xnDIUZLES9ViV0ho6hH7ige7sg81rGSHB2mbhIXF3slfn3RlTLbNnNim1s98kg1GiSH2
         noDg==
X-Forwarded-Encrypted: i=1; AJvYcCWjHUl9NNcr0TNPsq964oE7dFRgGcrlKbmlGT5X+27GuKyItcHa1dJ8jfAHS23UB8rzTWbcMFwyuvRn/+D5PNNhbLUCJT7VSJ77W3il9rE=
X-Gm-Message-State: AOJu0YyBR4uz10+XwfKBdrw53cTURDoqTwVhpdwGjbOF+n6icza+/wjv
	tDFRRf7+Tq9LD86TJQHcx+ehYNiRjF/scoykNAXfNoaw+tDgFAf65iq2bu8wJQ==
X-Google-Smtp-Source: AGHT+IGFW/wqKA+KYrdIuXIeBQwxbKPLldzmtxtdejKcgg+hLSzTmMJ/lH+o9G3RLx38cKaFGUBJWw==
X-Received: by 2002:a50:d51c:0:b0:56b:f5ae:ae58 with SMTP id u28-20020a50d51c000000b0056bf5aeae58mr1384154edi.29.1711472524408;
        Tue, 26 Mar 2024 10:02:04 -0700 (PDT)
Message-ID: <c3b4bacd-47c8-403c-ab5c-7a3adf39eeeb@suse.com>
Date: Tue, 26 Mar 2024 18:02:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] xen/x86: Add topology generator
Content-Language: en-US
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240109153834.4192-1-alejandro.vallejo@cloud.com>
 <20240109153834.4192-7-alejandro.vallejo@cloud.com>
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
In-Reply-To: <20240109153834.4192-7-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.01.2024 16:38, Alejandro Vallejo wrote:
> --- a/tools/include/xenguest.h
> +++ b/tools/include/xenguest.h
> @@ -843,5 +843,20 @@ enum xc_static_cpu_featuremask {
>      XC_FEATUREMASK_HVM_HAP_DEF,
>  };
>  const uint32_t *xc_get_static_cpu_featuremask(enum xc_static_cpu_featuremask);
> +
> +/**
> + * Synthesise topology information in `p` given high-level constraints
> + *
> + * Topology is given in various fields accross several leaves, some of
> + * which are vendor-specific. This function uses the policy itself to
> + * derive such leaves from threads/core and cores/package.
> + *
> + * @param p                   CPU policy of the domain.
> + * @param threads_per_core    threads/core. Doesn't need to be a power of 2.
> + * @param cores_per_package   cores/package. Doesn't need to be a power of 2.
> + */
> +void xc_topo_from_parts(struct cpu_policy *p,
> +                        uint32_t threads_per_core, uint32_t cores_per_pkg);

Do we really want to constrain things to just two (or in fact any fixed number
of) levels? Iirc on AMD there already can be up to 4.

> @@ -1028,3 +976,89 @@ bool xc_cpu_policy_is_compatible(xc_interface *xch, xc_cpu_policy_t *host,
>  
>      return false;
>  }
> +
> +static uint32_t order(uint32_t n)
> +{
> +    return 32 - __builtin_clz(n);
> +}

This isn't really portable. __builtin_clz() takes an unsigned int, which may
in principle be wider than 32 bits. I also can't see a reason for the
function to have a fixed-width return type. Perhaps

static unsigned int order(unsigned int n)
{
    return sizeof(n) * CHAR_BIT - __builtin_clz(n);
}

?

> +void xc_topo_from_parts(struct cpu_policy *p,
> +                        uint32_t threads_per_core, uint32_t cores_per_pkg)
> +{
> +    uint32_t threads_per_pkg = threads_per_core * cores_per_pkg;
> +    uint32_t apic_id_size;
> +
> +    if ( p->basic.max_leaf < 0xb )
> +        p->basic.max_leaf = 0xb;
> +
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

Same concern as in the other patch regarding "== Intel".

> +    p->topo.subleaf[1].id_shift = p->topo.subleaf[0].id_shift;
> +    p->topo.subleaf[1].level = 1;
> +    p->topo.subleaf[1].type = 2;
> +    if ( cores_per_pkg > 1 )
> +        p->topo.subleaf[1].id_shift += order(cores_per_pkg - 1);

Don't you want to return an error when any of the X_per_Y values is 0?

> +    apic_id_size = p->topo.subleaf[1].id_shift;
> +
> +    /*
> +     * Contrary to what the name might seem to imply. HTT is an enabler for
> +     * SMP and there's no harm in setting it even with a single vCPU.
> +     */
> +    p->basic.htt = true;
> +
> +    p->basic.lppp = 0xff;
> +    if ( threads_per_pkg < 0xff )
> +        p->basic.lppp = threads_per_pkg;
> +
> +    switch ( p->x86_vendor )
> +    {
> +        case X86_VENDOR_INTEL:
> +            struct cpuid_cache_leaf *sl = p->cache.subleaf;
> +            for ( size_t i = 0; sl->type &&
> +                                i < ARRAY_SIZE(p->cache.raw); i++, sl++ )
> +            {
> +                sl->cores_per_package = cores_per_pkg - 1;
> +                sl->threads_per_cache = threads_per_core - 1;

IOW the names in struct cpuid_cache_leaf aren't quite correct.

> +                if ( sl->type == 3 /* unified cache */ )
> +                    sl->threads_per_cache = threads_per_pkg - 1;
> +            }
> +            break;
> +
> +        case X86_VENDOR_AMD:
> +        case X86_VENDOR_HYGON:
> +            /* Expose p->basic.lppp */
> +            p->extd.cmp_legacy = true;
> +
> +            /* Clip NC to the maximum value it can hold */
> +            p->extd.nc = 0xff;
> +            if ( threads_per_pkg <= 0xff )
> +                p->extd.nc = threads_per_pkg - 1;
> +
> +            /* TODO: Expose leaf e1E */
> +            p->extd.topoext = false;
> +
> +            /*
> +             * Clip APIC ID to 8, as that's what high core-count machines do

Nit: "... to 8 bits, ..."

> +             *
> +             * That what AMD EPYC 9654 does with >256 CPUs
> +             */
> +            p->extd.apic_id_size = 8;
> +            if ( apic_id_size < 8 )
> +                p->extd.apic_id_size = apic_id_size;

Use min(), with apic_id_size's type suitably adjusted?

> --- a/xen/arch/x86/cpu-policy.c
> +++ b/xen/arch/x86/cpu-policy.c
> @@ -278,9 +278,6 @@ static void recalculate_misc(struct cpu_policy *p)
>  
>      p->basic.raw[0x8] = EMPTY_LEAF;
>  
> -    /* TODO: Rework topology logic. */
> -    memset(p->topo.raw, 0, sizeof(p->topo.raw));
> -
>      p->basic.raw[0xc] = EMPTY_LEAF;
>  
>      p->extd.e1d &= ~CPUID_COMMON_1D_FEATURES;
> @@ -387,6 +384,9 @@ static void __init calculate_host_policy(void)
>      recalculate_xstate(p);
>      recalculate_misc(p);
>  
> +    /* Wipe host topology. Toolstack is expected to synthesise a sensible one */
> +    memset(p->topo.raw, 0, sizeof(p->topo.raw));

I don't think this should be zapped from the host policy. It wants zapping
from the guest ones instead, imo. The host policy may (will) want using in
Xen itself, and hence it should reflect reality.

Jan

