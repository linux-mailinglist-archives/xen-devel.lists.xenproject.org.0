Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD908B0CA0
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 16:34:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711490.1111491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzdh2-00084M-Gi; Wed, 24 Apr 2024 14:33:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711490.1111491; Wed, 24 Apr 2024 14:33:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzdh2-00081i-E0; Wed, 24 Apr 2024 14:33:52 +0000
Received: by outflank-mailman (input) for mailman id 711490;
 Wed, 24 Apr 2024 14:33:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HGaV=L5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rzdh1-0007xb-Hq
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 14:33:51 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ab19fb52-0247-11ef-909a-e314d9c70b13;
 Wed, 24 Apr 2024 16:33:51 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-34b66f0500aso1898106f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Apr 2024 07:33:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 o12-20020a5d684c000000b0034aa1e534c2sm11898892wrw.96.2024.04.24.07.33.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Apr 2024 07:33:50 -0700 (PDT)
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
X-Inumbo-ID: ab19fb52-0247-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713969230; x=1714574030; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hOfjU2lte7ORd6Xg3HV/kxpnkvJ5CjPgnjprnjogXFQ=;
        b=T/eg/xJHOg0obtGrkmK2QBj7H8bgr+Bh30nRZcdC9hS047c39n5ubE1IjbzVC1HnPF
         lNhANOp1CnLlwIfpKBl2CLtVL3XrOxsmlMv3Z/gosKwblpx0gu1CxJp0eLKk71vQxz3/
         BmiluVIVy0spOh+zoLbCTK2kwZkCm+wY479doByOiQq6vywK1oDDKMGHOMsOw9vM1+ZU
         bptp8/XJA8AlVozoyTtA0esLpCVCQxarBjmGI2gSlGj6KFDWQciE0DuioBbW424LH3Bg
         grlkA3ANw6J+0BCSV4VlLgAltqWEcUj7Oi+qpXbfrjzfiNhRMPkckGRQ0279FvxjCQ9g
         dIVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713969230; x=1714574030;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hOfjU2lte7ORd6Xg3HV/kxpnkvJ5CjPgnjprnjogXFQ=;
        b=PuJe7ZkzqNEfkV3OuDwlslm/zDzQa02BMaOUbaaH8lyZDaq5qtF3LX3oSVY0o9OtNJ
         tLDoIDgY1JMK1K1lbLxyVZLdAIjAMIaYO99xsIXzy6MG+Rm8PWZB4EHIYJNzGPSBydb1
         9qHdVRpsP7o9l9y9T21h/8sTowCOXBYMLVV+FPlTueYXi4k+82bo1zHGPXGmYFw4zQYX
         /E94qa8PRnQq+tl+YSUCoHvigdmBOLET2+uXF5gCPw1mvyV46Z6nRzGw/WDd1+o8NVqv
         Nx0laEzqrM4vdgiqYIB3fNDjZqYSRqNPzBf5ryabm71OGKwsTt7thbr2D7U/qyNz0ZGR
         oZ4g==
X-Forwarded-Encrypted: i=1; AJvYcCXmtEFWuZhHNnyzxEsmyiJycofWNTyDdGsK2nTtpkPMJC8V3recPlNLxMgj4vYwzSxJN1ou7eaCqGpEoNtfnOLO5TIhK+HEHi1awJQTUKU=
X-Gm-Message-State: AOJu0Yy/TbNU4UebvL0bILfE2rQ+2x1v1ITWYEUb80J89QRbhcPmcMbF
	j3F1dEb4KMSKQrz3l2Y8so5TQ/rh2zLV889VqxZn9/zOw2QmQQK450jggdxubA==
X-Google-Smtp-Source: AGHT+IG+My6HpqQ2A7s9Gs+5DvXCBoWmW9RrWA+CDzJG1JlP+83ufBzvbKnk6ujtMY5sOhd6QOtLNA==
X-Received: by 2002:adf:e8c7:0:b0:343:c6d1:280d with SMTP id k7-20020adfe8c7000000b00343c6d1280dmr1790929wrn.21.1713969230393;
        Wed, 24 Apr 2024 07:33:50 -0700 (PDT)
Message-ID: <e0f92cf4-3888-4548-a984-bf30fd57101f@suse.com>
Date: Wed, 24 Apr 2024 16:33:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v5 1/3] x86/iommu: Disable IOMMU if cx16 isn't
 supported
Content-Language: en-US
To: Teddy Astie <teddy.astie@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1713433029.git.teddy.astie@vates.tech>
 <4656eab84f7b4b807fc61f54b9ba5c0fc4fae64d.1713433029.git.teddy.astie@vates.tech>
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
In-Reply-To: <4656eab84f7b4b807fc61f54b9ba5c0fc4fae64d.1713433029.git.teddy.astie@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.04.2024 13:57, Teddy Astie wrote:
> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
> @@ -305,6 +305,12 @@ static int __init cf_check iov_detect(void)
>      if ( !iommu_enable && !iommu_intremap )
>          return 0;
>  
> +    if ( unlikely(!cpu_has_cx16) )
> +    {
> +        printk("AMD-Vi: CPU doesn't support CMPXCHG16B, disabling\n");
> +        return -ENODEV;
> +    }

One additional nit: Here you neatly have just AMD-Vi: as a prefix for the
log message. Why ...

> @@ -2630,6 +2598,15 @@ static int __init cf_check vtd_setup(void)
>      int ret;
>      bool reg_inval_supported = true;
>  
> +    if ( unlikely(!cpu_has_cx16) )
> +    {
> +        printk(XENLOG_ERR VTDPREFIX
> +               "IOMMU: CPU doesn't support CMPXCHG16B, disabling\n");
> +
> +        ret = -ENODEV;
> +        goto error;
> +    }

... both VTDPREFIX and "IOMMU:" here?

Jan

