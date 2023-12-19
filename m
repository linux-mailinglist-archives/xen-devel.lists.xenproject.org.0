Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91232818C0B
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 17:19:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657017.1025614 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFcnu-0007aI-Eq; Tue, 19 Dec 2023 16:18:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657017.1025614; Tue, 19 Dec 2023 16:18:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFcnu-0007XM-BG; Tue, 19 Dec 2023 16:18:46 +0000
Received: by outflank-mailman (input) for mailman id 657017;
 Tue, 19 Dec 2023 16:18:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z0wA=H6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFcns-0007X7-M4
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 16:18:44 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4589832f-9e8a-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 17:18:40 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40d3102a2d9so302175e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 08:18:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 p41-20020a05600c1da900b0040b360cc65csm3603004wms.0.2023.12.19.08.18.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 08:18:39 -0800 (PST)
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
X-Inumbo-ID: 4589832f-9e8a-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703002720; x=1703607520; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vPPqqJrUaQkmPcAAtrY5I8vHm8c1EopnsBiEuX5FNJ0=;
        b=efh/6MN77PsCeovm849k56ZlftEUDQVgVw6/nHufbYyIm5jikKA1swIcjuTlptk7vm
         QybfXyw+0itt/hDuYf3YQo+UdJ9y2NZGeoqc/PsRaQMPjLN9MsCwC3c7ueloXMDWv2CP
         SejoeYKY7vNMlhNck0hB//AaBlwphTAXOIB/EeOGprw/UTszt1EFP51JysXC+fEm5TSj
         C1Jy8aLhlBOpC9BGVbYfGUaktbaTyDOx7UJh7Yf3TXMPkU/emFkQabvQIFBN2+yNVHBW
         Xk2VV5SkLYJHSvS6R20alf2RHlSrfU0DcVXk77H9oJtrG/EWOf2K1tayDpPRC7lgLVAJ
         WXRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703002720; x=1703607520;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vPPqqJrUaQkmPcAAtrY5I8vHm8c1EopnsBiEuX5FNJ0=;
        b=PcC8DMEW3A/DSyKeKUuaH32XR8UQ+alNO3WdwKd6i/JZaNx68eNkszHZIXltP0DPhR
         SQAfZqHuC76Bp2hxxlsfrE53eYHE1AdzfLels7IJVQBMtpWuwwAvSfzQwHFRmmK1O9wW
         k/Y+O4dzNp4UOpxpiaFSN9L7EyUiCKXRbdxYQ8/dJAFj3FeAamdcXb2dQxeSuCDVG+z2
         HFqVkqXZXnwMFvCgQC07IFgu44DTHPmrT4YER3QOMwOUvQo9VIBz+7/AhqaBEtoUNALx
         GdYXdkxnsSMOcuCug6FKZCl0QWbaQxknDVTxj0C7o5gytBH7eOAmkFvMJrqdgQMf+l7e
         8Pjw==
X-Gm-Message-State: AOJu0Yxlu1JNwjeujr3HXqSWOJZxMB5V2ErGOoN+vuqOBlyz9HITWk3d
	jfkyBCRHsNLGowD74fo8uhKi
X-Google-Smtp-Source: AGHT+IGst+B2/ZkiybTVkARVlsNNXcjdRaiz8Ir3iTNW/5UC3Y13whrLXCN1MxKAj4TZ7LvCnXFaHg==
X-Received: by 2002:a05:600c:3ba6:b0:40b:5e21:e27a with SMTP id n38-20020a05600c3ba600b0040b5e21e27amr9764379wms.103.1703002720155;
        Tue, 19 Dec 2023 08:18:40 -0800 (PST)
Message-ID: <2966f31a-8390-46fd-84c5-c424382dff29@suse.com>
Date: Tue, 19 Dec 2023 17:18:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] x86/iommu: remove regions not to be mapped
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20231215141832.9492-1-roger.pau@citrix.com>
 <20231215141832.9492-6-roger.pau@citrix.com>
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
In-Reply-To: <20231215141832.9492-6-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.12.2023 15:18, Roger Pau Monne wrote:
> Introduce the code to remove regions not to be mapped from the rangeset
> that will be used to setup the IOMMU page tables for the hardware domain.
> 
> This change also introduces two new functions: remove_xen_ranges() and
> vpci_subtract_mmcfg() that copy the logic in xen_in_range() and
> vpci_is_mmcfg_address() respectively and remove the ranges that would otherwise
> be intercepted by the original functions.
> 
> Note that the rangeset is still not populated.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

> @@ -533,6 +541,62 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
>              goto commit;
>      }
>  
> +    /* Remove any areas in-use by Xen. */
> +    rc = remove_xen_ranges(map);
> +    if ( rc )
> +        panic("IOMMU failed to remove Xen ranges: %d\n", rc);
> +
> +    /* Remove any overlap with the Interrupt Address Range. */
> +    rc = rangeset_remove_range(map, 0xfee00, 0xfeeff);
> +    if ( rc )
> +        panic("IOMMU failed to remove Interrupt Address Range: %d\n",
> +              rc);
> +
> +    /* If emulating IO-APIC(s) make sure the base address is unmapped. */
> +    if ( has_vioapic(d) )
> +    {
> +        for ( i = 0; i < d->arch.hvm.nr_vioapics; i++ )
> +        {
> +            rc = rangeset_remove_singleton(map,
> +                PFN_DOWN(domain_vioapic(d, i)->base_address));
> +            if ( rc )
> +                panic("IOMMU failed to remove IO-APIC: %d\n",
> +                      rc);
> +        }
> +    }
> +
> +    if ( is_pv_domain(d) )
> +    {
> +        /*
> +         * Be consistent with CPU mappings: Dom0 is permitted to establish r/o
> +         * ones there (also for e.g. HPET in certain cases), so it should also
> +         * have such established for IOMMUs.  Remove any read-only ranges here,
> +         * since ranges in mmio_ro_ranges are already explicitly mapped below
> +         * in read-only mode.
> +         */
> +        rc = rangeset_report_ranges(mmio_ro_ranges, 0, ~0UL, map_subtract, map);

I find it a little odd that you iterate over mmio_ro_ranges twice (once
here, once in what the earlier patch added), but I guess overall it's
easier this way.

Also, nit: Either this line is too long, or ...

> +        if ( rc )
> +            panic("IOMMU failed to remove read-only regions: %d\n",
> +                  rc);

... there's no need to wrap lines here.

Jan

