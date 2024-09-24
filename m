Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E59F9845DA
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 14:22:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802744.1213034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st4YS-0000tt-Rf; Tue, 24 Sep 2024 12:22:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802744.1213034; Tue, 24 Sep 2024 12:22:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st4YS-0000sD-P4; Tue, 24 Sep 2024 12:22:08 +0000
Received: by outflank-mailman (input) for mailman id 802744;
 Tue, 24 Sep 2024 12:22:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Vfmb=QW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1st4YR-0000rJ-GZ
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 12:22:07 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c899243-7a6f-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 14:22:05 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2f7657f9f62so60176861fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Sep 2024 05:22:05 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c5cf48c40asm695515a12.1.2024.09.24.05.22.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Sep 2024 05:22:04 -0700 (PDT)
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
X-Inumbo-ID: 9c899243-7a6f-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727180525; x=1727785325; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tsxT5oFGd27QqAZjTt4SiSTTJwwPP09/RGB2IXL1uAg=;
        b=JrCi0koBwOMGA+e7LTWWGDRzUumQZJKWvv5vUhtdLuO5cVDvStFpzi+VnQoh1Ijg0O
         fhyD69EguQh5WSXNbki4//ug9nJi3ajhxxUAMFbG45A6MD4vqer+0pV96HnY6g9K+H5U
         7nrVz00oYdXP4f+pbXGn7QVfMnZtdVjAU1L+t3S+JFfHrPi7FPJofuwuWgEtdNbtnLo+
         k6RsCcRSZfGbyzjS5v4QxB1/ZpdvektbOz34j8tAQoIvvasvsjZk81zkHFoKkXJv1Qjk
         lqBUNDu4xrgNmZfL846FeQQxl2WsUBimlyDPkmR+9xhYkSEFEFUaMuWX6/F35q17/zbV
         7ZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727180525; x=1727785325;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tsxT5oFGd27QqAZjTt4SiSTTJwwPP09/RGB2IXL1uAg=;
        b=WTOf5JSp/I4yophCgRDnYW63zWV0Tdf8PCm3Pk/9MHb3Sm3WAxIqKdagnjHO7LfiBO
         N63mrLFEB/Vc7449/zmdgYH4VhoggJ1awwnGcF8nUuIllOBitJqlwOwZnbe/Jbsrtl3q
         ulR6OCKRMki8JLx6u0pXqDjSweBgTOa1Iwf1Ly0YP4lqNVVP3bSpzquBO/rWZkDAq3cr
         +O1S4bSp8/hsX/qejJFfUbUVQhRDM+y24ZLFYy71+5eVJwWjfp2MS5L2WApWOmWfh7vi
         DI1wnGNrXZMgZ0MoLjSSrdhKOyn5ya5xAK+e9hANEFUeoMNWs/jCP5nkQgaLfKn4yD+p
         xTRg==
X-Forwarded-Encrypted: i=1; AJvYcCW5MCT4XKD914nwvuBojBsL7gmOOLhyCbZg5fbbTtErAEtEGz9lsZeAjIcF1Um6soHwa2rVEPrzDwQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwtsNANyxP6S4meDv5fDT/JnGEBMOacjgbNciwAaQadwlMuHQbQ
	NbD5s//CEBW8pXROBmr5tMBxkvmicUsNEX1uQbCOlnOt4UHlz077LEEGlswouQ==
X-Google-Smtp-Source: AGHT+IFQiQqWKyyDn0Ws8qPhUgyv+fq9nArq5VwGT6rEPz60e5oZbk/xgZueI69nY8niYJtHjyV00w==
X-Received: by 2002:a2e:bc0a:0:b0:2f3:e2f0:af15 with SMTP id 38308e7fff4ca-2f7cc5ba6a8mr84129731fa.30.1727180525133;
        Tue, 24 Sep 2024 05:22:05 -0700 (PDT)
Message-ID: <dc2ba7dd-fc55-4f4b-a33f-c733bb142efe@suse.com>
Date: Tue, 24 Sep 2024 14:22:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] xen/arm: mpu: Implement a dummy
 enable_secondary_cpu_mm
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20240918175102.223076-1-ayan.kumar.halder@amd.com>
 <20240918175102.223076-5-ayan.kumar.halder@amd.com>
 <c27ebb1a-6ca4-41d7-99d8-ea613e3120fc@suse.com>
 <c0ce0c42-6b23-4687-a444-81a617629125@amd.com>
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
In-Reply-To: <c0ce0c42-6b23-4687-a444-81a617629125@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.09.2024 13:54, Ayan Kumar Halder wrote:
> Hi Jan,
> 
> On 23/09/2024 11:23, Jan Beulich wrote:
>> On 18.09.2024 19:51, Ayan Kumar Halder wrote:
>>> Secondary cpus initialization is not yet supported. Thus, we print an
>>> appropriate message and put the secondary cpus in WFE state.
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> ---
>>> Changes from :-
>>>
>>> v1 - 1. NR_CPUS is defined as 1 for MPU
>> Not quite, what you do is ...
>>
>>> --- a/xen/arch/Kconfig
>>> +++ b/xen/arch/Kconfig
>>> @@ -11,6 +11,7 @@ config NR_CPUS
>>>   	default "8" if ARM && RCAR3
>>>   	default "4" if ARM && QEMU
>>>   	default "4" if ARM && MPSOC
>>> +	default "1" if ARM && MPU
>>>   	default "128" if ARM
>>>   	help
>>>   	  Controls the build-time size of various arrays and bitmaps
>> ... merely set the default. I wonder how useful that is, the more that
>> - as per the description - this is temporary only anyway.
> 
> Yes, I can enforce a build time check like this.
> 
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -295,6 +295,12 @@ void asmlinkage __init start_xen(unsigned long 
> fdt_paddr)
>       struct domain *d;
>       int rc, i;
> 
> +    /*
> +     * Currently MPU does not support SMP.
> +     */
> +#ifdef CONFIG_MPU
> +    BUILD_BUG_ON(NR_CPUS > 1);
> +#endif
>       dcache_line_bytes = read_dcache_line_bytes();
> 
> Does this look ok ?

Well, I'd still want to understand the purpose (if I was maintainer of
this code at least). You can't bring up secondary processors yet - fine.
But why does that mean you want to limit the build to NR_CPUS=1? Any
number is fine, but just not useful?

Jan

