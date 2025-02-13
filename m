Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C98A33AA2
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 10:06:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887265.1296790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiVB1-0002fs-QV; Thu, 13 Feb 2025 09:06:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887265.1296790; Thu, 13 Feb 2025 09:06:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiVB1-0002df-Nu; Thu, 13 Feb 2025 09:06:31 +0000
Received: by outflank-mailman (input) for mailman id 887265;
 Thu, 13 Feb 2025 09:06:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tiVB0-0002dZ-8u
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 09:06:30 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf739478-e9e9-11ef-a075-877d107080fb;
 Thu, 13 Feb 2025 10:06:29 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-aaee2c5ee6eso107889466b.1
 for <xen-devel@lists.xenproject.org>; Thu, 13 Feb 2025 01:06:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aba532322b9sm90206266b.37.2025.02.13.01.06.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 01:06:28 -0800 (PST)
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
X-Inumbo-ID: cf739478-e9e9-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739437588; x=1740042388; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/QJJuYS+u1WDGOVGYoGD3zjw7sgNUL5sd9CyWxE27eI=;
        b=cU6S4QKOlWT3QpBSHD5mL15Z/fftKnVWgMc5y7aWnDGdLck9k+3ltvdCIjU3KcSU3W
         Mn47FO4fkP5Jish3zean/YpLwaRbmdB0AWh5hYI5fgLBwvgSV7Q4JNQb8WZXQEQUipgt
         W8vIjprGbpX/SED4t5qbyAJr7l4AdnwRf7Qq/H79I86HXXfVWU0uu6bwQgZyq/ZO5gBi
         XpJXpnagIIB0iehn5EBp1Mtj7C2TIqTQro7M4ZctsXKNtSvZOcixCF68GJWY/3W7zQWA
         0Bo0rZTKVHpKfoSdQGi/maUlY2tlf71Xn9ydqW1d5sqpvAQ9EAXr14okPdRX+21rWmLm
         apxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739437588; x=1740042388;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/QJJuYS+u1WDGOVGYoGD3zjw7sgNUL5sd9CyWxE27eI=;
        b=pzCe2VP2r0c80TsPGdKSNL3SK/sd6/xhEIz9SyhgFLfgHlOqNrgrleET9xvXOm0OPW
         Rtdq+7vzF9USz2DORtfMTtt2aPsj8IbsrbNq4pEQxjGO/ZIKYYIWUzlW3q0mFdRyi/l9
         IHXjpqoVZArneHqsJvAekG7pCPvq1v1r88Gnd7KQDvAsYbH+CBQSB+LfsiDW+uWU2mfU
         7jF0l5mpgGTeGp+LfYK0XB9Ze+3FW7ZsE76JRCIkV0ZRVzOrijlCjREuhFaa1t2Z/x+6
         eH+Q/L+pYCwWbR+mHSK6UXEi6MjzjXkJr1DmW4KUDrDn12lkKVVSVusv2MYid70VijSL
         YMLw==
X-Forwarded-Encrypted: i=1; AJvYcCXDCg7/Th80fetLIcCqMUXMGIT3ljxOqJOtIMLc9TebXBWOthSgoWXuLETaDR+ajgXVk2ydc+dOx0g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyjI1H23z91AUHniX+27qAjrPkHilQZIsMu6KZEUT9WQQtweZJl
	iUM8dds124UMXGNYLALM22hTxr5pXaT7Z3UfBjLwHEgxWApDomdi9nyEsR7Esw==
X-Gm-Gg: ASbGnctfZEpst5/0rEA6AqUDSwbZpKsLicIvmqKuMEI1Gk0KfGRCBfWap7ZGTg/GxIq
	fBUBqwCho08CxR5U81KD9aSxcbAhjj2Gkxz1cGe8KrQFD01v7GmXl4jetuwBAUXfSUua1tb3tNV
	lrN50rJAT2ovWbtPOu0DNIZc2UalgNSjm7UftIZ9apg4N3v9KOYcTSV6FW7PP98fW26K6fR6/9g
	4Z07C2G+IIUdEayF2ojh56icE4TgYsf/edE1GsZkZ/+qYXinH2ntG4Cj4FPksbvlwZnsJdIAXVs
	ilOpKlpiwV5t0FR/snI1og5Nnr+2UDZR9V4lJQTbPyTwdzGzFDZzXjTd4FYlBbihfNyRIGolIwq
	S
X-Google-Smtp-Source: AGHT+IHyp9bTtxp9cM41sKY5Ffv6HBTW8KTCciMYs4MjmiIqZknzxG1grfkzNUJqku4WFYe9c470uw==
X-Received: by 2002:a17:907:c717:b0:ab7:d87f:6669 with SMTP id a640c23a62f3a-ab7f34a7a1bmr511797666b.54.1739437588323;
        Thu, 13 Feb 2025 01:06:28 -0800 (PST)
Message-ID: <50d81725-f039-444e-95f1-e77fcea731e5@suse.com>
Date: Thu, 13 Feb 2025 10:06:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.20?] x86/dom0: be less restrictive with the
 Interrupt Address Range
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: oleksii.kurochko@gmail.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org
References: <20250212153800.5159-1-roger.pau@citrix.com>
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
In-Reply-To: <20250212153800.5159-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.02.2025 16:38, Roger Pau Monne wrote:
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -555,10 +555,6 @@ int __init dom0_setup_permissions(struct domain *d)
>          if ( !rangeset_contains_singleton(mmio_ro_ranges, mfn) )
>              rc |= iomem_deny_access(d, mfn, mfn);
>      }
> -    /* MSI range. */
> -    rc |= iomem_deny_access(d, paddr_to_pfn(MSI_ADDR_BASE_LO),
> -                            paddr_to_pfn(MSI_ADDR_BASE_LO +
> -                                         MSI_ADDR_DEST_ID_MASK));

For this one, yes, I can see the LAPIC counterpart a few lines up from here
(as the description says). In arch_iommu_hwdom_init(), however, I can't.
Where's that?

> --- a/xen/drivers/passthrough/x86/iommu.c
> +++ b/xen/drivers/passthrough/x86/iommu.c
> @@ -475,11 +475,6 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
>      if ( rc )
>          panic("IOMMU failed to remove Xen ranges: %d\n", rc);
>  
> -    /* Remove any overlap with the Interrupt Address Range. */
> -    rc = rangeset_remove_range(map, 0xfee00, 0xfeeff);
> -    if ( rc )
> -        panic("IOMMU failed to remove Interrupt Address Range: %d\n", rc);

Besides being puzzled by the use of literal numbers here, why was this
necessary in the first place? Or in other words, why do we not respect the
domain's ->iomem_caps here (irrespective of iommu_hwdom_{inclusive,reserved}),
thus making sure we don't allow access to anything dom0_setup_permissions()
denies? There is iomem_access_permitted() checking in identity_map() for PV,
but no equivalent for PVH that I could spot. If that was checked somewhere, my
question on the earlier hunk would then also be addressed, of course.

Further, with the expectation for the UCSI region to eventually be marked
ACPI_NVS, how's that going to help here? The loop over the E820 map a few
lines up from here doesn't make any mappings for E820_{ACPI,NVS}. (later) Oh,
pvh_setup_acpi() does map them, and it running after iommu_hwdom_init() the
mappings should be made in both page tables (if not shared). Which gets me to
a tangential question though: Am I failing to spot where we avoid, for the
shared page tables case, doing all the work arch_iommu_hwdom_init() does?

Jan

