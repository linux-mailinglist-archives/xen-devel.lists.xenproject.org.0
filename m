Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89777C8A96F
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 16:19:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1173035.1498132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOHIa-0001oi-W2; Wed, 26 Nov 2025 15:19:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1173035.1498132; Wed, 26 Nov 2025 15:19:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOHIa-0001m6-TL; Wed, 26 Nov 2025 15:19:16 +0000
Received: by outflank-mailman (input) for mailman id 1173035;
 Wed, 26 Nov 2025 15:19:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JzEl=6C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vOHIZ-0001m0-RP
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 15:19:15 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42219654-cadb-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 16:19:10 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4779a4fc95aso7188345e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 07:19:10 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fd8baesm41395248f8f.39.2025.11.26.07.19.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 07:19:09 -0800 (PST)
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
X-Inumbo-ID: 42219654-cadb-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1764170350; x=1764775150; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KsHU4dxGEv6RrKQhhKegdFM7bQurrwyCPfkSzmID0bk=;
        b=Oqn3u+X34hyA/AWPVVqCHaXdwbtzr9CDQC/2rYNKWroUnsb+Tj1jJRHhCKRS8JKNHy
         ic0hdXDu2SKVlkoabteUFgsYv5XhNINOaAZAxJcbdBJSb0wMFt68VohxHKlDxIw8pvZ9
         3slyNRwfebXsAxDQ+w52hKBUPyrRsx8Y+qcRiWVdOymrHEZ0luSN8/ZPLlXnTRF31RLc
         oWI3fua2qSvbKEVmwiIDdtfq2vXtoMfHZw4pIg27RaeBi/2UHrBUw3DZz5V6IZ8SAz0M
         nj5Zb1QOpCoLA1oFxGZR+ZbrCHE3iF/RQaiofzolFG2eJJOchkmC4uHw83f2caj34fAn
         t/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764170350; x=1764775150;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KsHU4dxGEv6RrKQhhKegdFM7bQurrwyCPfkSzmID0bk=;
        b=UTxZx5YJhy/3C2t7UpCjvsjtIklM/b+JpPaDa+DZTGFyHPfrJYL0H6+Ld1lQ1g7NjI
         5F/N5hzDVdehkvKp6sDP6dxOOaESNdFsKrUAtpUBuY21pgFTTaByj3c7lpdeTsPQhptz
         YuQ9/Cd7N+rmIf6MR5VydCl08D9243c7ft7gAltSc/7tddRGlguEPFA9Xd6nBNTmpY3E
         NAwC0l1fHqUSY8KFc4msolZsPmMVjcVAcJeAWdaYYqSpG2EHvRbK+ft39uBrMjaanztd
         07es0sw5XC8zfBYDwn+p6RAaVBOemGsKnSM/yj/8TVeRoKufKugXB8y5IIMj+zHw2dCh
         Q2nw==
X-Forwarded-Encrypted: i=1; AJvYcCVGYXb4Nfo/nmRaATcteblkwPkBfz5zgdGTgT2mK3Z7wsqpAc+Nyrkval/o+da6YT03Iw3BF3y0TSU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxSAx+5iCBTQWz3JSB3abpGrWlGRXf4d8nVXQvv/ou4RchRdqMQ
	U71lTdDo/EzAk0+axenAHVaXsjz9X5GzcLBAP/GEM4cv0w4oxxuEK3BkCWYUTqs7bg==
X-Gm-Gg: ASbGncsyDDM8J4FbASp397QWCaTG8grp3kwCsI81OLdPJkPdEepli2hxefTsTygGbIR
	Hhqu9+N0bo7OLHptgZwcMdm5uwqYr9YA4my89kTr88fSWtQNwexHmOTP9bIygm7tnC+pgnWxZeO
	9eshkUVQEHu909l3S0Anm4hDJsVM3fss5iEj6D/1JRmzBaF/DvTWQbC2P7ijC3X4Ew4ZvK6N7BB
	u/MVoaPro7wPfECfjm9ta0on0suqv2ZwBRYF727QfELCV7AwIqy3ozDemqcdTRBMqJZvF8Sphjv
	Nh3XMamJ9C68qXEa5eDP/w+nonUoM4n4IQQat9I8aAy3RKoXuIEFvpi3sser/Bq9+q/5EMAsui4
	2RXATG/3Fp1C9E4AG8O4x204ewnPQMMT+3Gv33NmY9yWVZwWIjcRBE0fqCpyueC37BqWfQhuph7
	EEn3NK+KZ+8WwL3uBMoEEz+2Esn809XclyL7yBHCfCdazRRV4Ynpfr1IYFMFhgpijbRpqbMRZl/
	yI=
X-Google-Smtp-Source: AGHT+IESstNzAHd9xz3EcCuyPNk0VoK5VqapXPC6oI12EoyPUdBc0VoTT1llGexBIhlgQ2AL8OfLJQ==
X-Received: by 2002:a05:6000:1844:b0:429:d4e1:cb9f with SMTP id ffacd0b85a97d-42cc137bd1bmr23794014f8f.22.1764170349899;
        Wed, 26 Nov 2025 07:19:09 -0800 (PST)
Message-ID: <1930930f-d9a4-4ad2-b6b1-5c138227924f@suse.com>
Date: Wed, 26 Nov 2025 16:19:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/domain: introduce generic functions for domain
 struct allocation and freeing
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Timothy Pearson <tpearson@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <b5c703a64c616d6321f8a98cd28f0659838d41df.1764167337.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <b5c703a64c616d6321f8a98cd28f0659838d41df.1764167337.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.11.2025 15:32, Oleksii Kurochko wrote:
> --- a/xen/arch/x86/include/asm/pv/domain.h
> +++ b/xen/arch/x86/include/asm/pv/domain.h
> @@ -18,6 +18,9 @@ extern int8_t opt_pv32;
>  # define opt_pv32 false
>  #endif
>  
> +unsigned int arch_alloc_domain_struct_bits(void);
> +#define arch_alloc_domin_struct_bits arch_alloc_domain_struct_bits

There was an 'a' lost in the identifier.

> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -799,6 +799,29 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
>      return arch_sanitise_domain_config(config);
>  }
>  
> +struct domain *alloc_domain_struct(void)
> +{
> +    struct domain *d;
> +    unsigned int bits = 0;
> +
> +#ifdef arch_alloc_domin_struct_bits
> +    bits = arch_alloc_domin_struct_bits();
> +#endif

Maybe

#ifndef arch_alloc_domain_struct_bits
# define arch_alloc_domain_struct_bits() 0
#endif

ahead of the use and then simply

    unsigned int bits = arch_alloc_domain_struct_bits();

?

> +    BUILD_BUG_ON(sizeof(*d) > PAGE_SIZE);
> +
> +    d = alloc_xenheap_pages(0, MEMF_bits(bits));

I'd go a little farther and allow the arch to specify all the memflags that
are wanted. Then the hook name would also be less ambiguous, as "bits" can
mean many things. Perhaps arch_alloc_domain_struct_memflags() or, since
"memflags" kind of implies allocation, arch_domain_struct_memflags()?

Jan

