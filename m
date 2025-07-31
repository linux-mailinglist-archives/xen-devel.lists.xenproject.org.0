Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3064B17024
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 13:09:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1065444.1430806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhR9c-0001t1-QO; Thu, 31 Jul 2025 11:08:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1065444.1430806; Thu, 31 Jul 2025 11:08:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhR9c-0001rN-Nl; Thu, 31 Jul 2025 11:08:56 +0000
Received: by outflank-mailman (input) for mailman id 1065444;
 Thu, 31 Jul 2025 11:08:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lm68=2M=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uhR9b-0001rH-3I
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 11:08:55 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc68e361-6dfe-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 13:08:50 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3b7825e2775so252941f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jul 2025 04:08:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b422bb0570bsm1275001a12.54.2025.07.31.04.08.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Jul 2025 04:08:48 -0700 (PDT)
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
X-Inumbo-ID: bc68e361-6dfe-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753960129; x=1754564929; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=byG7eJknxoczUHZI6YI8xBvGwlhSL1Q9I1NRwti3t/4=;
        b=eF1+HgOJJH7bFxEL3fxq1QFYBrRNpHaoQPXXfuiYoOj+YZwKqWdOHA8g+EjpqhzI4E
         9uZDECo9+5NVs9XZeT1tty/H6zIN3zc0RTr/EFwzQYJOUveni6qORCyeiZ176oukjIcB
         p/VK6H0uBX9RcOMAd8cqxfq/rDllsNgX93xw+dY9JRVj1MfpC+QxrZrzqBXvTKS/NhXj
         AZ2FKx8MsSBHeS9rBUD4xuutM6UOWjmYV3DFS8F/lGGdji/v8L6Vi9B/82r8HmdHuGbJ
         b7eo7bGTVsr0jg9BGcHyzY8hYplcn9q0V2iwD2G/G//CtlyuluN7BeIrmgiWJjv23eDp
         nXuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753960129; x=1754564929;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byG7eJknxoczUHZI6YI8xBvGwlhSL1Q9I1NRwti3t/4=;
        b=jHdt4qHWNvUu2VYA/TR1xP8lpPLaKFZh+VuvA5UlI+ltAcUyrYnJCux643Pe5iY7ap
         5/z3YDU3sq9l3aLY9dXFysInb2gTM81nUm9rgZmhW5Lx+YXowWJFKo4lN+Uabs9DWJdL
         XXgsdWD/DJNKXuX93tN5P+nOEmv95D+/Ah0jVuq5gdUfOCY2YlfKw1zeofgKC3C2v3Oy
         oLHB/zM0WijxCHUUEaVnAEFVY9Jz8+xqa7Fl/59A2PV5WgaX6nqDNg/AReiWNSV4NZbO
         hMpcUXEBDeQv/Eatx5Zhkl4iwVO6WAtPcEFuaYT+Q8iCOL073B5rIBZvGEXQB5qqB3zd
         Xw8w==
X-Forwarded-Encrypted: i=1; AJvYcCU8bc7nTITrZWS6Xmrnfl7Ays8B1aWd/95pBwQMJseMFJKmmuHl190h3Z40F1+I8Q55UYGMHmkeH2g=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWg1h0eAQxdSpvufMT/VvNAXfiD7J+WS6Ro3qNzXiELPM6ThmM
	8QJnuEfjLvTVA57FlOEPFp0DSXTnTWKAKTaDMFYvBEtM2xNAc+mPSSczKSkBFZKspA==
X-Gm-Gg: ASbGnctOzf3gOQUD5CZaVzT6R7iEvYEfCmTSihtF10RKwzw8+UdKA41KuLr2tv7AGqd
	qzhIbHppwKWYTtGAKivWmvZmxgCMdbgvPfJuvqY2ljlRkkrmZZjz3LqYGrSXyTyqgGhn9EmuZVk
	gCJGgeEDAk/PcvLjW0FX82iunA0aRm35vJo2X8nM0/2+oV+stI7OP38Cw4u9qKzhKRTzBZF+cD9
	gCDSRlX2m+TH/2j4x9FaVBKlzXbM7c2/iahlEw4DJW7RJD3zmFx2kqYJvRDbJm0rxlnu0aimHs3
	IDUUvv3cX2BayLMX0LZFagvHLtYr2AKxHBx3bE6u8d3Zb2LML12UmSINKBOxCXaT+sAQN98FqFQ
	RMpCdA7sK1o9I6l+i8DaWfzz3XooN3AjptABLMGQOBos7NGF7dYw9rlAUWj5RWSU9PTccwnW3Hr
	VDeS4EOCU=
X-Google-Smtp-Source: AGHT+IEXOnz37O5mjootPsZf+PlT68fDCK4Iyl/dHE4rC2KIDzwXZcICtIPlP7Dd6Iw+XwDxNvHIsg==
X-Received: by 2002:a05:6000:26ca:b0:3b7:7377:84c5 with SMTP id ffacd0b85a97d-3b794f65696mr5667430f8f.0.1753960129301;
        Thu, 31 Jul 2025 04:08:49 -0700 (PDT)
Message-ID: <ab677d61-c320-49e0-a977-c32a31b1ba23@suse.com>
Date: Thu, 31 Jul 2025 13:08:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 2/7] xen/domctl: introduce XEN_DOMCTL_CDF_is_32bits
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250731094234.996684-1-grygorii_strashko@epam.com>
 <20250731094234.996684-3-grygorii_strashko@epam.com>
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
In-Reply-To: <20250731094234.996684-3-grygorii_strashko@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31.07.2025 11:42, Grygorii Strashko wrote:
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -613,7 +613,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>      unsigned int flags_required = (XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap);
>      unsigned int flags_optional = (XEN_DOMCTL_CDF_iommu | XEN_DOMCTL_CDF_vpmu |
>                                     XEN_DOMCTL_CDF_xs_domain |
> -                                   XEN_DOMCTL_CDF_trap_unmapped_accesses );
> +                                   XEN_DOMCTL_CDF_trap_unmapped_accesses |
> +                                   XEN_DOMCTL_CDF_is_32bits );
>      unsigned int sve_vl_bits = sve_decode_vl(config->arch.sve_vl);
>  
>      if ( (config->flags & ~flags_optional) != flags_required )
> @@ -711,6 +712,13 @@ int arch_domain_create(struct domain *d,
>  
>      BUILD_BUG_ON(GUEST_MAX_VCPUS < MAX_VIRT_CPUS);
>  
> +#ifdef CONFIG_ARM_64
> +    if ( d->options & XEN_DOMCTL_CDF_is_32bits )
> +        d->arch.type = DOMAIN_32BIT;
> +    else
> +        d->arch.type = DOMAIN_64BIT;
> +#endif
> +
>  #ifdef CONFIG_IOREQ_SERVER
>      ioreq_domain_init(d);
>  #endif

No adjustment to x86'es arch_sanitise_domain_config()? Until the new bit
is actually properly handled, I think its use will need rejecting.

> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -68,9 +68,14 @@ struct xen_domctl_createdomain {
>  #define XEN_DOMCTL_CDF_vpmu           (1U << 7)
>  /* Should we trap guest accesses to unmapped addresses? */
>  #define XEN_DOMCTL_CDF_trap_unmapped_accesses  (1U << 8)
> +/*
> + * Is this domain running 32bit guest?
> + * Used for 64bits arches.
> + */
> +#define XEN_DOMCTL_CDF_is_32bits (1U << 9)

Please pad suitably, as is the case for XEN_DOMCTL_CDF_vpmu visible in
context. XEN_DOMCTL_CDF_trap_unmapped_accesses simply is too long to fit
that padding scheme.

Jan

