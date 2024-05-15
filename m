Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A552F8C687B
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 16:22:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722414.1126332 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7FW1-0000vj-V0; Wed, 15 May 2024 14:21:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722414.1126332; Wed, 15 May 2024 14:21:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7FW1-0000t7-Rs; Wed, 15 May 2024 14:21:57 +0000
Received: by outflank-mailman (input) for mailman id 722414;
 Wed, 15 May 2024 14:21:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EWeN=MS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7FW1-0000t1-9l
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 14:21:57 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7aec620e-12c6-11ef-b4bb-af5377834399;
 Wed, 15 May 2024 16:21:54 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a59c0a6415fso183487866b.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 07:21:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17892444sm860426766b.76.2024.05.15.07.21.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 07:21:53 -0700 (PDT)
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
X-Inumbo-ID: 7aec620e-12c6-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715782914; x=1716387714; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VDjKHeVmEF8gDoTf7gHB2hCYAf1lLBmvUSTuuW7v6x8=;
        b=WURRCYYewgip3zSh1apRWAzjUXKalfmAW53mWmQ/sqpTMA4QnxL+GVK1yn3zxh7da+
         8t36Ht6M8eZCv1GvrlP3O7L2jZFbCs5trFLfL0Z+lUyJ6UNLApYUjI/FvNZnB1P5isWR
         3taKLG/MCMF01fJSllpG99iEL0GK3+E+kwuMpYT+XJQVo098AIx18OxEToKoBWbAY0XE
         2YO2K5pdql5HVLwFlGT/Pgx6sQZrctRKttPPMLWPlEuci2qjV4C2Bsox7piEycAygZVL
         Y90edCvtN59S08B3M3o0HCnC9gw/3A0zxwgYPYj0v/Vs31XXDKDzhjkZ2csOmXTuYo+l
         iRSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715782914; x=1716387714;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VDjKHeVmEF8gDoTf7gHB2hCYAf1lLBmvUSTuuW7v6x8=;
        b=IEzYccoBO562QXSEIYXinllNQMUKfryVNpGvoNfx1PAndeW92/NkSkdW+9ZThmfhVm
         XKUZlHrq0oCQgNCsvsvQ3/JsPhalzgI7BQowNEBWW6a46mqEuW3qocWV1QAjJwdQWDM2
         u7bxMom2JMK4aHOGBKx1blRNRG8CDYXbQ5ETYX+c+ukKZdcxl3zCG6ZUpGjE8D78EK4i
         uNfubLmhzRQbteChzH5ERp7WNSrrhWEEzMd7esGar1OfRinwKUNXu+hkgZCWpb5n8Vhc
         x9jvwhbYsXxnpRAe13NMdfc2WA032klBTsquJraTJaZjoyfQfTSprWVCOpXgHoS84dOU
         zt5g==
X-Forwarded-Encrypted: i=1; AJvYcCU6x7UqJ5oHk+w1iQLestUCX2cr/+DSU5n2OP2QJ0aLjPZg7PnAeFymuf4QJgpe/TvhbL5noFvN8ppMVZMMsjXpK30GvBFeDy4301v7cos=
X-Gm-Message-State: AOJu0Yy3XxaZiNpaLi+DHzZCyJwT+df5e52Z2B4ysAKnpvXLuwmsiZrN
	6kiqHp3CLeTPUxobbV2TR+4fwJ7oXljP19CMO+AIo/N2IQOTO4KSzYzBsVJADw==
X-Google-Smtp-Source: AGHT+IFMjyS9z0y/NWW5GiglPbeEuz+v5V6NnYCb3H0G3lPOOGrs2jV2sZhGSQw7q8cwbaebyX/f5Q==
X-Received: by 2002:a17:907:1b0b:b0:a59:a3ef:21eb with SMTP id a640c23a62f3a-a5a2d675b19mr1303577666b.73.1715782914321;
        Wed, 15 May 2024 07:21:54 -0700 (PDT)
Message-ID: <4a47654c-54c4-4ada-8139-e5ca9d35af86@suse.com>
Date: Wed, 15 May 2024 16:21:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 (resend) 09/19] x86/domain_page: Remove the fast paths
 when mfn is not in the directmap
Content-Language: en-US
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: julien@xen.org, pdurrant@amazon.com, dwmw@amazon.com,
 Hongyan Xia <hongyxia@amazon.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Julien Grall <jgrall@amazon.com>,
 xen-devel@lists.xenproject.org
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-10-eliasely@amazon.com>
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
In-Reply-To: <20240513134046.82605-10-eliasely@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.05.2024 15:40, Elias El Yandouzi wrote:
> @@ -77,18 +80,24 @@ void *map_domain_page(mfn_t mfn)
>      struct vcpu_maphash_entry *hashent;
>  
>  #ifdef NDEBUG
> -    if ( mfn_x(mfn) <= PFN_DOWN(__pa(HYPERVISOR_VIRT_END - 1)) )
> +    if ( arch_mfns_in_directmap(mfn_x(mfn), 1) )
>          return mfn_to_virt(mfn_x(mfn));
>  #endif
>  
>      v = mapcache_current_vcpu();
> -    if ( !v )
> -        return mfn_to_virt(mfn_x(mfn));
> +    if ( !v || !v->domain->arch.mapcache.inuse )
> +    {
> +        if ( arch_mfns_in_directmap(mfn_x(mfn), 1) )
> +            return mfn_to_virt(mfn_x(mfn));
> +        else
> +        {
> +            BUG_ON(system_state >= SYS_STATE_smp_boot);
> +            return pmap_map(mfn);
> +        }
> +    }
>  
>      dcache = &v->domain->arch.mapcache;
>      vcache = &v->arch.mapcache;
> -    if ( !dcache->inuse )
> -        return mfn_to_virt(mfn_x(mfn));

Is this case (the logic for which you move up) actually possible? I.e.
can we observe a domain here which hasn't made it through
mapcache_domain_init() (where ->inuse is set)?

> @@ -184,6 +193,12 @@ void unmap_domain_page(const void *ptr)
>      if ( !va || va >= DIRECTMAP_VIRT_START )
>          return;
>  
> +    if ( va >= FIXADDR_START && va < FIXADDR_TOP )
> +    {
> +        pmap_unmap((void *)ptr);

Misra is going to object to this casting away of const. It's rather
pmap_unmap() which wants changing, to accept a pointer-to-const.

> @@ -335,6 +350,23 @@ mfn_t domain_page_map_to_mfn(const void *ptr)
>      if ( va >= DIRECTMAP_VIRT_START )
>          return _mfn(virt_to_mfn(ptr));
>  
> +    /*
> +     * The fixmap is stealing the top-end of the VMAP. So the check for
> +     * the PMAP *must* happen first.

Not really. You could also ...

> +     * Also, the fixmap translate a slot to an address backwards. The
> +     * logic will rely on it to avoid any complexity. So check at
> +     * compile time this will always hold.
> +    */
> +    BUILD_BUG_ON(fix_to_virt(FIX_PMAP_BEGIN) < fix_to_virt(FIX_PMAP_END));
> +
> +    if ( ((unsigned long)fix_to_virt(FIX_PMAP_END) <= va) &&
> +         ((va & PAGE_MASK) <= (unsigned long)fix_to_virt(FIX_PMAP_BEGIN)) )
> +    {
> +        BUG_ON(system_state >= SYS_STATE_smp_boot);
> +        return l1e_get_mfn(l1_fixmap[l1_table_offset(va)]);
> +    }
> +
>      if ( va >= VMAP_VIRT_START && va < VMAP_VIRT_END )

... put it into the body of this if() then. Which might be preferable to
keep the non-global-mapping case straight / quick.

Jan

>          return vmap_to_mfn(va);
>  


