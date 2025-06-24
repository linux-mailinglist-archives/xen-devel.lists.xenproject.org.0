Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5495DAE65D1
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 15:06:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023672.1399711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU3L3-0007xL-19; Tue, 24 Jun 2025 13:05:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023672.1399711; Tue, 24 Jun 2025 13:05:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU3L2-0007uJ-UN; Tue, 24 Jun 2025 13:05:24 +0000
Received: by outflank-mailman (input) for mailman id 1023672;
 Tue, 24 Jun 2025 13:05:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9+j=ZH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uU3L1-0007uD-HO
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 13:05:23 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1fc72d0-50fb-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 15:05:20 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a4f379662cso4359716f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 06:05:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d860fb63sm107607565ad.130.2025.06.24.06.05.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Jun 2025 06:05:19 -0700 (PDT)
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
X-Inumbo-ID: e1fc72d0-50fb-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750770320; x=1751375120; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=e/GW8Eyf0J4TzNxNAzPAx6rpWSQoNir2DhD7+rjfBtA=;
        b=I79eABBfUfBw1WgghotqPPxpr95oIRJgPii1UFANV2H3ydWpiaV0gSu0mCRum7yoSx
         ZvECLlLHiUEM3XDRWuCARPlhl3mpkxWpbukrPneQNibQeLggQOX+NwtOrKKGWUh6fUzV
         enQR1ILg/4jNraPX4IU/gswO15pdpOskzR8gYKi67GqxGbcM5jiSokCsTgluuqQoWh3M
         +yC/9P/SI+rLuSGBg790tA2iNfyfb9pmhA33lVcaSSeHMORSQwpNrCZVbSfXr7pBtbqG
         Jd4SzO2KfBgIWkSKqqLDPWpa0HrG6J3gzQ85FcAIlzP9y5yjoIWjsdd+WIx/3y7RB//d
         9/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750770320; x=1751375120;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e/GW8Eyf0J4TzNxNAzPAx6rpWSQoNir2DhD7+rjfBtA=;
        b=sypeS1Ce6zax2OhU3vlQEc5T10gPHrcZ1REJRKPJ22KjEnPSUV7R6g0OLLAMc8nts6
         DZqk6MjVUGg8KyqZbLZD3g7tUrXNb43jGrESW9OVXDi4TZ2YIs9KNzCLkWgq1jpBHslZ
         YXv2rMmO/bkVaaF0deX9rac3yaO8Tv7eTJAdOro9gGt7z16ApQOO//lh7aeRzpOyzbj2
         7Fv2cuVZsxK25GGrfY7waIIe/yciFTrNIQfmJUuBJwm8t4lQnkLEtwMLcNuwdoob76e+
         Dhn/9YrAmlRya+PK/14K/6q6KrEwzJzrGH5pW7THCMjpo7i8tmegq7Upyo2XUjTGAdAL
         fYIw==
X-Forwarded-Encrypted: i=1; AJvYcCUZLhWl4kVijBxqgehZkb4xaZHR0dSNyDGtvXeVrGCNqzeDxMyWfbisNEZw71QTmkDke/QC2+995lo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz2I6fMJPXBvIdssSQ1VM1j5xaaE8hZFEiOxEgoI7GQ2balAyVn
	1cbo2h+K/6sdkBZjjGD9lH5thp9+u0QB52TrKcwvhO7hpZeUWEs/byfk2VV6sCsEWRoxEbRDWqZ
	n7UU=
X-Gm-Gg: ASbGncuG92YHKzBgxm/6OWVjNvk0Sdh4U+j0TQXFVut43jP/dEHf3ggM6Fa8bAwmw3r
	naBfUMDF26RStJTV80/TKEMQu7S/FG0TTQYlPjzLQTQYeN7p/0v24Y/L0qRwisj+7lFZ/TtXuoe
	jDCMvD95GGaEpDbcmHk/R4XHCRIkM1nBJas+r7w4Aytv1+eO83bEicZmWV5lF3WCySAl6p23GLe
	WMT/Lyw3y1z4QIeQhbuaBCWpqr2TvAsvNGgeb0fhAtUUO4G/Y9/r4wLWDQTRQ3ok4F5qBOH/IOa
	A7pTaRZalvr+PBEPgieXio94UK/OLiSxfSM9aYFbDn/btnNJplz4aUXg1gdq7G9oARjcJXwa9Zm
	cUEx4dsZybFf5SLsjqcoRC9hKx8t4u2+yrCOgr+JER6HqzpM=
X-Google-Smtp-Source: AGHT+IH6UlcKafrLK8R2lfhg4xkf5ZFKVZbYAhMCffoiFvXbiVKFOyu+wK3GuQiGB13D5Qn9oKeINQ==
X-Received: by 2002:a05:6000:2507:b0:3a4:f038:af74 with SMTP id ffacd0b85a97d-3a6d12ebae4mr12396794f8f.51.1750770319882;
        Tue, 24 Jun 2025 06:05:19 -0700 (PDT)
Message-ID: <e897b424-0bc2-4346-8c3b-3b22837e9481@suse.com>
Date: Tue, 24 Jun 2025 15:05:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] x86/pdx: simplify calculation of domain struct
 allocation boundary
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250620111130.29057-1-roger.pau@citrix.com>
 <20250620111130.29057-2-roger.pau@citrix.com>
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
In-Reply-To: <20250620111130.29057-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.06.2025 13:11, Roger Pau Monne wrote:
> When not using CONFIG_BIGMEM there are some restrictions in the address
> width for allocations of the domain structure, as it's PDX truncated to 32
> bits it's stashed into page_info structure for domain allocated pages.
> 
> The current logic to calculate this limit is based on the internals of the
> PDX compression used, which is not strictly required.  Instead simplify the
> logic to rely on the existing PDX to PFN conversion helpers used elsewhere.
> 
> This has the added benefit of allowing alternative PDX compression
> algorithms to be implemented without requiring to change the calculation of
> the domain structure allocation boundary.
> 
> As a side effect introduce pdx_to_paddr() conversion macro and use it.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> @@ -498,14 +474,20 @@ struct domain *alloc_domain_struct(void)
>       * On systems with CONFIG_BIGMEM there's no packing, and so there's no
>       * such restriction.
>       */
> -#if defined(CONFIG_BIGMEM) || !defined(CONFIG_PDX_COMPRESSION)
> -    const unsigned int bits = IS_ENABLED(CONFIG_BIGMEM) ? 0 :
> -                                                          32 + PAGE_SHIFT;
> +#if defined(CONFIG_BIGMEM)
> +    const unsigned int bits = 0;
>  #else
> -    static unsigned int __read_mostly bits;
> +    static unsigned int __ro_after_init bits;
>  
>      if ( unlikely(!bits) )
> -         bits = _domain_struct_bits();
> +         /*
> +          * Get the width for the next pfn, and unconditionally subtract one
> +          * from it to ensure the used width will not allocate past the PDX
> +          * field limit.
> +          */
> +         bits = flsl(pdx_to_paddr(1UL << (sizeof_field(struct page_info,
> +                                                       v.inuse._domain) * 8)))

You didn't like the slightly shorter sizeof(frame_table->v.inuse._domain) then?

Jan

