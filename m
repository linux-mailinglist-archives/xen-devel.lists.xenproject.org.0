Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B698B5DAB
	for <lists+xen-devel@lfdr.de>; Mon, 29 Apr 2024 17:29:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714243.1115385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Sw4-0006pZ-Ld; Mon, 29 Apr 2024 15:28:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714243.1115385; Mon, 29 Apr 2024 15:28:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1Sw4-0006mP-Ik; Mon, 29 Apr 2024 15:28:56 +0000
Received: by outflank-mailman (input) for mailman id 714243;
 Mon, 29 Apr 2024 15:28:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GJEf=MC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s1Sw2-0006kh-KA
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2024 15:28:54 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fd81cfc-063d-11ef-909b-e314d9c70b13;
 Mon, 29 Apr 2024 17:28:53 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-41ba1ba55e8so22937815e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 29 Apr 2024 08:28:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h3-20020a05600c314300b0041abdaf8c6asm23778491wmo.13.2024.04.29.08.28.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Apr 2024 08:28:53 -0700 (PDT)
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
X-Inumbo-ID: 2fd81cfc-063d-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714404533; x=1715009333; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=InuNWt0ReyR2Trsd1gbfxM3taYTaGWFpkdDWJENvI7A=;
        b=YZ9UGV6GTV6ELX4HzATaxOW6VoqLRXsLzuQYnDriK7xwc4SLie526W5bbIKw/3yp3p
         LKCRGNvv9OaabJdIgXnGM+GSON0WhUT2P4mfKMd5pKsq131BB0yFgIBjTqpKlFrUQGji
         BF4cwkrT6tuzxSpH+4Rw5aT0wll0GdCigMhkc+SfRytqQplDb7sBs3IRP4m6uFha1PMM
         Jqis6Hhe8NgZnxwwYhLE9sljrR16bHqwBdoHHFPEHZQLVXqQK105DazF4H3bW1XBJSNj
         pfr5ukpisuR2wPJAaDN3xVOe6uWuLukY76SIof2R+L7HRHXAfkqLQL9Zkj+SZSNf56FD
         hFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714404533; x=1715009333;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=InuNWt0ReyR2Trsd1gbfxM3taYTaGWFpkdDWJENvI7A=;
        b=XSQ2PDvcPBOTtrYPQskGDKu13seDO2zAcADoqM4muM/qfNyTlFmPRQLlWp1BqyKwnh
         a6Z+PF2/DN4taOWCGZi0Mz0qd8dY+n1jMzqEZY3ZaKtOcum8ohL9Lr7i4dmzKQhnNHAE
         KaLtfjkVV2JOIaAW58Er/qHGYc7LZZ45OIZJ6dVntz4w/Ti2qSI9MbLcFWze+vJadiRO
         9TFhqLxzC8oJPxGltoI3DddR5CaNhSQiIPUB6HvFO3CvZF/lu+fpc5j/qKisO3P+wcD3
         lyxNHQEOWkN4ToOiacekjxipizyVgYSf7WICYvaP07yYgZ3M9qWPk2/C+NGVLjQxF/w8
         Q8cA==
X-Forwarded-Encrypted: i=1; AJvYcCVnkHe6Z4QpHew/BD+fAPNneD2J2+2PJf0f8Gj5Lrih0wVQLcTPrA75T6i2P3t+jQBSUT9mkqB3ilUv/Dune+7St/E1c6MCtMgzaX4QtY8=
X-Gm-Message-State: AOJu0YxazFlwiEmkulhJezlexsSiZIW+uHF4Vzz8UnWHywtxjpJX3Yp8
	SFZHYDZ/FPE+HL/m0heiL1spguveVHaOq+2vd5ZBrbs2xe8d2KpQf7e34XK9KQ==
X-Google-Smtp-Source: AGHT+IE3oUNUq0kbjDDvksDm4N+kNYPQxmb4aduv106VmqGf3G3BQKOu6idkdYbdS2JhudU1ju+Hqw==
X-Received: by 2002:a05:600c:4f01:b0:414:273:67d4 with SMTP id l1-20020a05600c4f0100b00414027367d4mr103906wmq.30.1714404533342;
        Mon, 29 Apr 2024 08:28:53 -0700 (PDT)
Message-ID: <87f9b33e-146c-4a59-a1cc-e58bbee8647b@suse.com>
Date: Mon, 29 Apr 2024 17:28:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v1 1/7] x86/vpmu: separate amd/intel vPMU code
Content-Language: en-US
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1713860310.git.Sergiy_Kibrik@epam.com>
 <a708db7fe06d131256ed2c75f518efce3d078fbb.1713860310.git.Sergiy_Kibrik@epam.com>
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
In-Reply-To: <a708db7fe06d131256ed2c75f518efce3d078fbb.1713860310.git.Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.04.2024 10:48, Sergiy Kibrik wrote:
> --- a/xen/arch/x86/include/asm/vpmu.h
> +++ b/xen/arch/x86/include/asm/vpmu.h
> @@ -11,6 +11,7 @@
>  #define __ASM_X86_HVM_VPMU_H_
>  
>  #include <public/pmu.h>
> +#include <xen/err.h>
>  
>  #define vcpu_vpmu(vcpu)   (&(vcpu)->arch.vpmu)
>  #define vpmu_vcpu(vpmu)   container_of((vpmu), struct vcpu, arch.vpmu)
> @@ -42,9 +43,27 @@ struct arch_vpmu_ops {
>  #endif
>  };
>  
> +#ifdef CONFIG_INTEL
>  const struct arch_vpmu_ops *core2_vpmu_init(void);
> +#else
> +static inline const struct arch_vpmu_ops *core2_vpmu_init(void)
> +{
> +    return ERR_PTR(-ENODEV);
> +}
> +#endif
> +#ifdef CONFIG_AMD
>  const struct arch_vpmu_ops *amd_vpmu_init(void);
>  const struct arch_vpmu_ops *hygon_vpmu_init(void);
> +#else
> +static inline const struct arch_vpmu_ops *amd_vpmu_init(void)
> +{
> +    return ERR_PTR(-ENODEV);
> +}
> +static inline const struct arch_vpmu_ops *hygon_vpmu_init(void)
> +{
> +    return ERR_PTR(-ENODEV);
> +}
> +#endif

Any reason you don't follow the approach used in patch 7, putting simple
#ifdef in the switch() in vpmu_init()? That would avoid the need for the
three almost identical stubs.

Jan

