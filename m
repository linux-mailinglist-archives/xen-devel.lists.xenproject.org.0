Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3290818C0C
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 17:22:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657019.1025624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFcqq-0002PP-TQ; Tue, 19 Dec 2023 16:21:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657019.1025624; Tue, 19 Dec 2023 16:21:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFcqq-0002Mu-P5; Tue, 19 Dec 2023 16:21:48 +0000
Received: by outflank-mailman (input) for mailman id 657019;
 Tue, 19 Dec 2023 16:21:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z0wA=H6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFcqo-0002KD-Rf
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 16:21:46 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b33ebe51-9e8a-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 17:21:44 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-40c39ef63d9so52074955e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 08:21:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 az33-20020a05600c602100b0040c4620b9fasm3730457wmb.11.2023.12.19.08.21.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 08:21:44 -0800 (PST)
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
X-Inumbo-ID: b33ebe51-9e8a-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703002904; x=1703607704; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yn8zb5C4LxdnsOqV1h6YXY+UhNcLJCQJ+hVkRFyiQkw=;
        b=aaZB3YnL3Qu1ytIPvdUSVKfjsmg9uTHEFG957tSjT9X04miJof+C3sPVmxJh434Fuy
         TnYY6j7AOWi8GPMPvcZ4Enn+guNJETI4bFXGTZ1HZ4pPiB2ejwbhJfrQTOAYDLvm/lF7
         /KDkR6qSVjh4uNo4gNUgJXdCFXvoNHARSJ8iCqXGZfdCRVO2xlOEPt/HLtEXOHLWwxCG
         K/Stnik2QVQgJ8YmqBjouw4LfA114OVPokyUCHmbmtWL5+0nSt3oPf9zpW6h55w0pbqm
         c/KXwgEm3Z78RF6REby9NwfOGmwqmsnKSYqwWs9T92yRX2/RVnnxu60L/iKz5khD9OXN
         RvWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703002904; x=1703607704;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yn8zb5C4LxdnsOqV1h6YXY+UhNcLJCQJ+hVkRFyiQkw=;
        b=JlYJH75C2Ozttm9R+Zkif8oFpljqfSevByZcDYRcAeTr/loFHphMsqXpSUz7Y6Nc3p
         NffVlhZFWQQTZcKRN949re/L6BCToa2iq8+GR33QY6lIvJSkK2Gjx++YlVOXhPhtCybY
         CfXMePYpuBj3GV6HxMtVbp2+vEplzhLpER3jIn66cY8ryxfAunTJ5hkVYv5g8vKvf6EJ
         +LyKhnb4JxG9tmqtsSo07gl8vEhY+g9vUEsm2rn2GEV0LxkfCAZEjZynFisa/mrRGS0d
         LR1Y+xhjtMxo0+ZrW6zOW6NtkjdJLo9RyHdEfiGPSloBIrOQhoU8BFL5QEpnD/deI1HF
         kxJg==
X-Gm-Message-State: AOJu0YxBySNPLrJt9/E++f/4zddJcGFMWv4ZaaH4GKZa92FdQG/SzG/F
	2cL2QFEN+6F4lG/5MjCffd8D
X-Google-Smtp-Source: AGHT+IHJnK3W83jNQCXw9DSd8L1bAQT9Mss8NDfFL9XDCEjoAvNjV1uxxReDe/fEat9DPXw4WGJTtw==
X-Received: by 2002:a05:600c:500a:b0:40d:1744:6eed with SMTP id n10-20020a05600c500a00b0040d17446eedmr2333454wmr.103.1703002904240;
        Tue, 19 Dec 2023 08:21:44 -0800 (PST)
Message-ID: <595ffb2b-0676-4988-b1c2-d8fb67359330@suse.com>
Date: Tue, 19 Dec 2023 17:21:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] x86/iommu: switch hwdom IOMMU to use a rangeset
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <20231215141832.9492-1-roger.pau@citrix.com>
 <20231215141832.9492-7-roger.pau@citrix.com>
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
In-Reply-To: <20231215141832.9492-7-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.12.2023 15:18, Roger Pau Monne wrote:
> The current loop that iterates from 0 to the maximum RAM address in order to
> setup the IOMMU mappings is highly inefficient, and it will get worse as the
> amount of RAM increases.  It's also not accounting for any reserved regions
> past the last RAM address.
> 
> Instead of iterating over memory addresses, iterate over the memory map regions
> and use a rangeset in order to keep track of which ranges need to be identity
> mapped in the hardware domain physical address space.
> 
> On an AMD EPYC 7452 with 512GiB of RAM, the time to execute
> arch_iommu_hwdom_init() in nanoseconds is:
> 
> x old
> + new
>     N           Min           Max        Median           Avg        Stddev
> x   5 2.2364154e+10  2.338244e+10 2.2474685e+10 2.2622409e+10 4.2949869e+08
> +   5       1025012       1033036       1026188     1028276.2     3623.1194
> Difference at 95.0% confidence
>         -2.26214e+10 +/- 4.42931e+08
>         -99.9955% +/- 9.05152e-05%
>         (Student's t, pooled s = 3.03701e+08)
> 
> Execution time of arch_iommu_hwdom_init() goes down from ~22s to ~0.001s.
> 
> Note there's a change for HVM domains (ie: PVH dom0) that get switched to
> create the p2m mappings using map_mmio_regions() instead of
> p2m_add_identity_entry(), so that ranges can be mapped with a single function
> call if possible.  Note that the interface of map_mmio_regions() doesn't
> allow creating read-only mappings, but so far there are no such mappings
> created for PVH dom0 in arch_iommu_hwdom_init().
> 
> No change intended in the resulting mappings that a hardware domain gets.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> @@ -487,58 +416,45 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
>      if ( !map )
>          panic("IOMMU init: unable to allocate rangeset\n");
>  
> -    max_pfn = (GB(4) >> PAGE_SHIFT) - 1;
> -    top = max(max_pdx, pfn_to_pdx(max_pfn) + 1);
> +    if ( iommu_hwdom_inclusive )
> +    {
> +        /* Add the whole range below 4GB, UNUSABLE regions will be removed. */
> +        rc = rangeset_add_range(map, 0, PFN_DOWN(GB(4)) - 1);
> +        if ( rc )
> +            panic("IOMMU inclusive mappings can't be added: %d\n",
> +                  rc);

As in the earlier patch, perhaps no need to wrap lines here (and again
further down)?

Jan

