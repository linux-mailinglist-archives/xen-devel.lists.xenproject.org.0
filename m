Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C330A3A148
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 16:32:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891910.1300919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkPaQ-0007ML-En; Tue, 18 Feb 2025 15:32:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891910.1300919; Tue, 18 Feb 2025 15:32:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkPaQ-0007Jt-BW; Tue, 18 Feb 2025 15:32:38 +0000
Received: by outflank-mailman (input) for mailman id 891910;
 Tue, 18 Feb 2025 15:32:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X4Dy=VJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tkPaO-0007Jn-Mf
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 15:32:36 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9352f222-ee0d-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 16:32:34 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ab771575040so1287850566b.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 07:32:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba53232282sm1090194566b.12.2025.02.18.07.32.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 07:32:33 -0800 (PST)
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
X-Inumbo-ID: 9352f222-ee0d-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739892754; x=1740497554; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3ydgtmOQYlZluKBJ65YENpIYQDqoG+Szcfc42JStPsw=;
        b=cNzEiy4TUD/83qPhISAzlTZf6rGLfq1P4girmBry2Id7F8shFuu3hr0gkEGINZ8xHj
         iK0mNNAeTY8exKlW5phJpCD4AQcVjKnT/FEQualA/mF/be6JhcheLv4vgUjHjRvK6wJo
         rcycRuC27h7gmO3904K0GL2zHt2dalGm3ZjjoMsw27gATaIEIBBJc44c+aCmBh6nW3Be
         /+X1MN2VUVJonbr00YQ8M9qWLV/psNDcStX/8DPr7jd//Xy8c9cIFImimwIBZtDKnGwM
         3QHAkkl5afan8fUIq98PdydTv0s2+jpeYsruCTYE7rVVQn1ybdQKSJAv19SWYCjhB79T
         XRiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739892754; x=1740497554;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ydgtmOQYlZluKBJ65YENpIYQDqoG+Szcfc42JStPsw=;
        b=Rhmlaq6K+Sl/N8084YhowksZX8MV0TZDcDRQ9z2XVbsJ15P62NcMiVIdOZcE2L0QxT
         YRz4i42u5VhvTi8beip8jnD7/tMZXpemJMStGHKpWJB5fc+t/9Zulh+tHqHoHM86D1w/
         cjj4aG7OTJuQ1IdnPjfv3z4rSs+efHSLDdQ/izp7ySKxON1WLDmFMurgU1kM/x2zF+QG
         xUESpbbG68iMr/wMTTqw5jiS7Lu1wp8VxZw7MqdLDTK1svC4roYvUQO3kiK5WcNsmf3R
         AbPKKXfhLSXr2RnQhZKDGXi//M3TRgB/CYG3z7/r4enu1oX3ww0HAZLrwiEzs6QCALb3
         EHEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKMnGUQJFz3PR3KpkUPQ5ZoG0y/Aa7z6BnrBC8BqEHp6bdYMv0U4vBexzxKDOju+RNHZc+RGbe4VQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyvaUNDf4Fi3/SUGluIuuPSNUzCpRuC7BtkE2TG1QRsSDVo5zfH
	mq9vmsIei6H/9DnQTuXFV49TmDGqIRx9R2TMV4t4PmQEoHhRKSxmOp85DADTmA==
X-Gm-Gg: ASbGncugqXHnALYgcSnt4aBlxxqkO5zdjYf9aZP2f8nk9nVyAmos3cYi4Azu9wshKHd
	Lv3xQqoGFTm4WPsA5OfVe1PhPqMnjQuw/J74zcMPE7rRhtS7r0iDluE7j6YL4aAHlcRwoxftua6
	avuUVjg4rKUCWFLlCh9JXQgijqKHEsLlECkpN/1/e+wg2M/Id5G5IX1JZIJ9B5f4cttVI8lK3Eo
	/Q79tEweKuefHN0xY/M4VErGhO5GnQpicu+nAriNQnTTQDz3eaGpB+ieTt0D4hiECsZzUCaqnIb
	qk1b8blnDXPboAkAw1Xz3W/R4IRcY51E/DmNxAi8zFk4G+sKyz0FZh/brUE5iu76uS3Cf9S2puq
	N
X-Google-Smtp-Source: AGHT+IEPbm7PrZl45BSPII379V2i9cv4f3C0Rqfjrn3RxwRl+38HWmi0rxrC1HPmDuYhFpz8kDFq2A==
X-Received: by 2002:a17:907:d509:b0:abb:b666:8e4e with SMTP id a640c23a62f3a-abbcc7f2dcdmr13912966b.26.1739892753978;
        Tue, 18 Feb 2025 07:32:33 -0800 (PST)
Message-ID: <19888001-ceac-44a8-8d14-cb0dd6d19b2c@suse.com>
Date: Tue, 18 Feb 2025 16:32:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] x86/iommu: account for IOMEM caps when populating
 dom0 IOMMU page-tables
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250217141602.64014-1-roger.pau@citrix.com>
 <20250217141602.64014-2-roger.pau@citrix.com>
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
In-Reply-To: <20250217141602.64014-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.02.2025 15:16, Roger Pau Monne wrote:
> The current code in arch_iommu_hwdom_init() kind of open-codes the same
> MMIO permission ranges that are added to the hardware domain ->iomem_caps.
> Avoid this duplication and use ->iomem_caps in arch_iommu_hwdom_init() to
> filter which memory regions should be added to the dom0 IOMMU page-tables.
> 
> This should result in no change in the memory regions that end up identity
> mapped in the domain IOMMU page tables.
> 
> Note the IO-APIC and MCFG page(s) must be set as not accessible for a PVH
> dom0, otherwise the internal Xen emulation for those ranges won't work.
> This requires an adjustment in dom0_setup_permissions().
> 
> Also the special casing of E820_UNUSABLE regions no longer needs to be done
> in arch_iommu_hwdom_init(), as those regions are already blocked in
> ->iomem_caps and thus would be removed from the rangeset as part of
> ->iomem_caps processing in arch_iommu_hwdom_init().

Only almost: ->iomem_caps has them removed only for addresses 1Mb and up.

> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -552,7 +552,8 @@ int __init dom0_setup_permissions(struct domain *d)
>      for ( i = 0; i < nr_ioapics; i++ )
>      {
>          mfn = paddr_to_pfn(mp_ioapics[i].mpc_apicaddr);
> -        if ( !rangeset_contains_singleton(mmio_ro_ranges, mfn) )
> +        if ( is_hvm_domain(d) ||
> +             !rangeset_contains_singleton(mmio_ro_ranges, mfn) )
>              rc |= iomem_deny_access(d, mfn, mfn);
>      }

The original code used has_vioapic() and had a comment. At least one of#
the two would better be transplanted here, I think.

> @@ -593,6 +594,22 @@ int __init dom0_setup_permissions(struct domain *d)
>              rc |= rangeset_add_singleton(mmio_ro_ranges, mfn);
>      }
>  
> +    /* For PVH dom0 prevent access to MCFG, it's emulated by Xen. */
> +    if ( is_hvm_domain(d) )
> +    {
> +        for ( i = 0; i < pci_mmcfg_config_num; i++ )
> +        {
> +            const unsigned long s =
> +                PFN_DOWN(pci_mmcfg_config[i].address) +
> +                PCI_BDF(pci_mmcfg_config[i].start_bus_number, 0, 0);
> +            const unsigned long e =
> +                PFN_DOWN(pci_mmcfg_config[i].address) +
> +                PCI_BDF(pci_mmcfg_config[i].end_bus_number, ~0, ~0);
> +
> +            rc |= iomem_deny_access(d, s, e);
> +        }
> +    }

Similarly here, the original code used has_vpci() and also had a comment.
Is there actually a strong reason to replace the original MCFG code?

> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -320,6 +320,26 @@ static int __hwdom_init cf_check map_subtract(unsigned long s, unsigned long e,
>      return rangeset_remove_range(map, s, e);
>  }
>  
> +struct handle_iomemcap {
> +    struct rangeset *r;
> +    unsigned long last;
> +};
> +static int __hwdom_init cf_check map_subtract_iomemcap(unsigned long s,
> +                                                       unsigned long e,
> +                                                       void *data)
> +{
> +    struct handle_iomemcap *h = data;
> +    int rc = 0;
> +
> +    if ( h->last != s )
> +        rc = rangeset_remove_range(h->r, h->last, s - 1);
> +
> +    /* Be careful with overflows. */
> +    h->last = max(e + 1, e);

What overflow could occur here? Addresses are limited to 52 bits; frame
numbers are limited to 40 bits. And ->iomem_caps starts out with a range
ending at the last address permitted by paddr_bits.

> @@ -475,22 +488,13 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
>      if ( rc )
>          panic("IOMMU failed to remove Xen ranges: %d\n", rc);
>  
> -    /* Remove any overlap with the Interrupt Address Range. */
> -    rc = rangeset_remove_range(map, 0xfee00, 0xfeeff);
> +    iomem.r = map;
> +    rc = rangeset_report_ranges(d->iomem_caps, 0, ~0UL, map_subtract_iomemcap,
> +                                &iomem);
> +    if ( !rc && iomem.last < ~0UL )
> +        rc = rangeset_remove_range(map, iomem.last, ~0UL);

Similarly here I'm wondering about the upper bound of ~0UL. Is this just
to be on the safe side? And/or just because it's simpler than calculating
the actual upper bound? No ranges above the system physical address width
should ever be entered into the rangeset. Kind of as an implication
iomem.last also is guaranteed to be below ~0UL when making it here.

Jan

