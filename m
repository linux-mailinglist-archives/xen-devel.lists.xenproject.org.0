Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC14A647DA
	for <lists+xen-devel@lfdr.de>; Mon, 17 Mar 2025 10:44:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.916481.1321562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu71G-0002Zb-0c; Mon, 17 Mar 2025 09:44:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 916481.1321562; Mon, 17 Mar 2025 09:44:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tu71F-0002Wr-Tn; Mon, 17 Mar 2025 09:44:25 +0000
Received: by outflank-mailman (input) for mailman id 916481;
 Mon, 17 Mar 2025 09:44:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tu71E-0002Wl-E1
 for xen-devel@lists.xenproject.org; Mon, 17 Mar 2025 09:44:24 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67b6e2d0-0314-11f0-9899-31a8f345e629;
 Mon, 17 Mar 2025 10:44:22 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-ac25313ea37so848958866b.1
 for <xen-devel@lists.xenproject.org>; Mon, 17 Mar 2025 02:44:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1ffb627csm99884955e9.5.2025.03.17.02.44.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Mar 2025 02:44:10 -0700 (PDT)
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
X-Inumbo-ID: 67b6e2d0-0314-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742204662; x=1742809462; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Gq8zC1bmtsNrqAokFJllexeWTVEPVYL8dmOU5yW+cGg=;
        b=RNNtPCTMcgx/3JNE+Jcc0dhA6wBz8QIDpH2NNN1o738Gc4kv/7vHKcuDXwQr57EMV2
         ay3RPlqWoZQAiAQFHXhPYSncU28BdlSVpq2bZes5fvkwCD+4Ue8mM1KArGWE7u38NsQA
         mO0seLyZUCIN7TyMV9vLHbQVxCnbpQKXY2ZoyLmVnL+x37dmyfviVhkLDT4fDPC+lE0N
         0w4P+1fjaY5pdUBkvbY1vYuaizJtZ3vSxVK6LwvG6tK4z0Z4XvIsXaEcN/PLyBLnSX/N
         kUlPGqsS7jFjV/bs8T/D10wfHIJViXEmoA4Js1NpsW0VDVxrXXduritB9sHegEitkm/I
         taEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742204662; x=1742809462;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gq8zC1bmtsNrqAokFJllexeWTVEPVYL8dmOU5yW+cGg=;
        b=D4YexMPMA+oBQSCeuaM1wBbXXVmaa/63+lZ5Q/cd+1J6dv7074X3TVwOTT26JztpCy
         0Fivyuo9tejzWKqCvYCG3i/d5MKaYXertKQAKEmD6+a2jQFRzOzEs5X6iGxj1IO27rfM
         w378L0TBlacNw0m+CewClMhMMzhvR5/BbGEMtDfKn8W3Dk0wzDRm5Pv4OMiA0OoHZ9qw
         qkA78zlGBGgwT2hb4qnVCgDVHiOaszWOweMsvqT1uHvzsctT1nfUPv27+T/Oeym63QQx
         3rKSfL16gDix8s4VjQDSbsMHjDLb6AICvQ3hlrihZZhKnnSM1zOFVz7ZMJrFp6frxhl+
         ON6w==
X-Forwarded-Encrypted: i=1; AJvYcCXF/UeUcFRSyP+b6nrGziU8eqaRJ4OxNlz4o5WeiA7xSZb7JjlZNzCH64NzBH1+0ZUQk7OBQXiwKEs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyx34Ll9jOxoZdGr+M6CjT7CIw1I4NFCGmeiSdDFPsNN768hwMC
	ZSKwlca8e8nt+BqNRFPpygO7xwSqsYcyKlsleVly7G3oiZLbgs1ywOqbadrdXWD1THn2MzNg3R0
	=
X-Gm-Gg: ASbGncvF3LonnvENNVEI2UVWbi8aMNgmRrIwsVwQKlHd5dSaNJTF3nR1Ydhe2XVPq2E
	JeZeeGnmlIiWGmH6xP64c33L32+paCheXH5LRZF9fMLu2GcT/T7gJdUodluQncuvq9baMMvfZuR
	K+ShjUgjJ/4D1MjQRYkUZH3wzBM6kgDv2hIiKGinORPyRJAJhtf2AXJ7SMxmOpbGMKzN67KEkiy
	qrEI39NIHzjOTRDPypMRoT01ZWBF/4vpOcTOjAVbiCg7bCWKVnJ5qdgM6R7brkQKx3FNiHm9phq
	hnG0QdEiPtGmsq1rXqoh8W3yYj7LCRx40bbJIaTeP5IIgOkUcx6OeP/GrRMllaC9DW5LEaQwUoN
	lH1sXQvpp83oFxJ/yhY80LnyToYX225W+a6unLFij
X-Google-Smtp-Source: AGHT+IEqe5ou6K6SvZGceqmSIYUpaZBRGkgrz+W6aElgR1PtSN9kAufDqQozLWFBTExlW7HzXUWNVg==
X-Received: by 2002:a05:600c:4e8d:b0:43d:4e9:27ff with SMTP id 5b1f17b1804b1-43d1ecb256bmr120260805e9.7.1742204650918;
        Mon, 17 Mar 2025 02:44:10 -0700 (PDT)
Message-ID: <90bd696f-f31e-4356-a9ea-267da384f820@suse.com>
Date: Mon, 17 Mar 2025 10:44:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] x86: make Viridian support optional
To: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250317071919.3766976-1-Sergiy_Kibrik@epam.com>
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
In-Reply-To: <20250317071919.3766976-1-Sergiy_Kibrik@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.03.2025 08:19, Sergiy Kibrik wrote:
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -348,6 +348,11 @@ config HYPERV_GUEST
>  
>  endif
>  
> +config HVM_VIRIDIAN
> +	bool "Viridian enlightenments support" if EXPERT
> +	depends on HVM
> +	default y

Imo the prompt wants to include "guest", somewhat along the lines of what
Alejandro has also said.

> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -695,9 +695,12 @@ int hvm_domain_initialise(struct domain *d,
>      if ( hvm_tsc_scaling_supported )
>          d->arch.hvm.tsc_scaling_ratio = hvm_default_tsc_scaling_ratio;
>  
> -    rc = viridian_domain_init(d);
> -    if ( rc )
> -        goto fail2;
> +    if ( is_viridian_domain(d) )
> +    {
> +        rc = viridian_domain_init(d);
> +        if ( rc )
> +            goto fail2;
> +    }
>  
>      rc = alternative_call(hvm_funcs.domain_initialise, d);
>      if ( rc != 0 )
> @@ -733,7 +736,8 @@ void hvm_domain_relinquish_resources(struct domain *d)
>      if ( hvm_funcs.nhvm_domain_relinquish_resources )
>          alternative_vcall(hvm_funcs.nhvm_domain_relinquish_resources, d);
>  
> -    viridian_domain_deinit(d);
> +    if ( is_viridian_domain(d) )
> +        viridian_domain_deinit(d);
>  
>      ioreq_server_destroy_all(d);
>  
> @@ -1637,9 +1641,12 @@ int hvm_vcpu_initialise(struct vcpu *v)
>           && (rc = nestedhvm_vcpu_initialise(v)) < 0 ) /* teardown: nestedhvm_vcpu_destroy */
>          goto fail5;
>  
> -    rc = viridian_vcpu_init(v);
> -    if ( rc )
> -        goto fail6;
> +    if ( is_viridian_domain(v->domain) )

Like you do further up, please also use "d" here and ...

> @@ -1669,13 +1676,15 @@ int hvm_vcpu_initialise(struct vcpu *v)
>   fail2:
>      hvm_vcpu_cacheattr_destroy(v);
>   fail1:
> -    viridian_vcpu_deinit(v);
> +    if ( is_viridian_domain(v->domain) )

... here.

> --- a/xen/arch/x86/hvm/vlapic.c
> +++ b/xen/arch/x86/hvm/vlapic.c
> @@ -426,7 +426,8 @@ void vlapic_EOI_set(struct vlapic *vlapic)
>       * priority vector and then recurse to handle the lower priority
>       * vector.
>       */
> -    bool missed_eoi = viridian_apic_assist_completed(v);
> +    bool missed_eoi = has_viridian_apic_assist(v->domain) ?
> +                          viridian_apic_assist_completed(v) : false;

    bool missed_eoi = has_viridian_apic_assist(v->domain) &&
                      viridian_apic_assist_completed(v);

?

> --- a/xen/arch/x86/include/asm/hvm/domain.h
> +++ b/xen/arch/x86/include/asm/hvm/domain.h
> @@ -110,9 +110,9 @@ struct hvm_domain {
>  
>      /* hypervisor intercepted msix table */
>      struct list_head       msixtbl_list;
> -
> +#ifdef CONFIG_HVM_VIRIDIAN
>      struct viridian_domain *viridian;
> -
> +#endif
>      /*
>       * TSC value that VCPUs use to calculate their tsc_offset value.
>       * Used during initialization and save/restore.

Why would the blank lines need to go away?

> --- a/xen/arch/x86/include/asm/hvm/hvm.h
> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
> @@ -507,7 +507,8 @@ hvm_get_cpl(struct vcpu *v)
>      (has_hvm_params(d) ? (d)->arch.hvm.params[HVM_PARAM_VIRIDIAN] : 0)
>  
>  #define is_viridian_domain(d) \
> -    (is_hvm_domain(d) && (viridian_feature_mask(d) & HVMPV_base_freq))
> +    (is_hvm_domain(d) && IS_ENABLED(CONFIG_HVM_VIRIDIAN) && \
> +                         (viridian_feature_mask(d) & HVMPV_base_freq))

May I suggest to put IS_ENABLED() first? And to adjust (reduce) indentation
on the 2nd line?

> --- a/xen/arch/x86/include/asm/hvm/vcpu.h
> +++ b/xen/arch/x86/include/asm/hvm/vcpu.h
> @@ -171,8 +171,9 @@ struct hvm_vcpu {
>  
>      /* Pending hw/sw interrupt (.vector = -1 means nothing pending). */
>      struct x86_event     inject_event;
> -
> +#ifdef CONFIG_HVM_VIRIDIAN
>      struct viridian_vcpu *viridian;
> +#endif
>  };

Again, not need for the blank line to go away.

Jan

