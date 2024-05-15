Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A168C66E9
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2024 15:11:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722344.1126179 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7EPk-0004iA-TR; Wed, 15 May 2024 13:11:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722344.1126179; Wed, 15 May 2024 13:11:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7EPk-0004fj-Pe; Wed, 15 May 2024 13:11:24 +0000
Received: by outflank-mailman (input) for mailman id 722344;
 Wed, 15 May 2024 13:11:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EWeN=MS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s7EPj-0004fd-Ii
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 13:11:23 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0125ebe-12bc-11ef-909d-e314d9c70b13;
 Wed, 15 May 2024 15:11:22 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a59a934ad50so176359166b.1
 for <xen-devel@lists.xenproject.org>; Wed, 15 May 2024 06:11:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a178a9f0fsm855140866b.69.2024.05.15.06.11.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 06:11:21 -0700 (PDT)
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
X-Inumbo-ID: a0125ebe-12bc-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1715778681; x=1716383481; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w9/MpnHlK4WnFuZfgJjdmI8kmoLoZoI3C3K5nxMI4YU=;
        b=D8DMLGu/2hiqXqb8V7B+PYmk+IZXP8iipZT82AugJ5WYgjIQfF7d60OycQJHCIlJ0/
         69kiPggFWV4SM6NZ8eVnWI8od2ubORv8l9x2Pj0ORenKfdUhgJMNydKtNhIq/RNRmITN
         d+BxemhfLNUYMsH4zPXm2+RUZtPEYnv42yfh3Gmi7vKypZocOTwedWawGX2LxG8EYQEu
         O/5Hz9htiUTJu/NwVnC1NurJlPLtv1uCS1Dip2p0v/DG0MFQQWUCCWaL59KrtH/E5mH/
         UsMEhCmDE9QK5tgFFZZC7zlrCIAQxYSoxRx/zdVYS2EXfDxuyOxi5Gcsu/f+YdDNMyA1
         E9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715778681; x=1716383481;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w9/MpnHlK4WnFuZfgJjdmI8kmoLoZoI3C3K5nxMI4YU=;
        b=eS4epKFXExTrkQdvf++noaHahgzjiZIPDAbQd+avoKTD7PdEGAkMeEcZOQC45GrnJE
         wYCEVsKA7gE5X74unHssZmZnIHrE3U924HImLxWT5TcrCDUiB0VZTeUanLku88o2zCHB
         10M/lug0H1Z8gKKD4+jmhQlOVqhZljVFacHyCf8apDGc2DgY75c8e4obnLxjLMYqyu5w
         2WeEC+c0gNOpFW3PkUwUCvotUSYM385ALRrsZUAUmWD4nxMYuM7U9LQ2UCqa0XTjlu2F
         hklUJmg2OmuG6fFAnK1xdVlzL0z7FRMTci71e/yJn5Rn2xFQVPRAThoeDoCgH8oy9jMy
         hVxw==
X-Forwarded-Encrypted: i=1; AJvYcCWoObqCrtRgW+fVxm8Okpzen/3LTRDtnEaNqmwiQ/KIXVkL1JtL8vqgRO2T83OAyjWdnyYIRe61Q6IdUSKEStGMgxV23EbzTPesAC6CAig=
X-Gm-Message-State: AOJu0Yx4rQN40t6XtkjXd8ph4xCB4cxnVXX90xOr/VcePZGB8ED6UbT3
	g5kDdY4vd2ky3Ys60f7CehISL26ki95+8XjKYZHZYIpmKMWM8x6YdWh09tjjPw==
X-Google-Smtp-Source: AGHT+IGAK53JKe8uY1mJvAlgbOf9Fq7VNlvkTNDoR57VN4Sw25olMDFhsAntNvufZiJF+E2XM/gIIA==
X-Received: by 2002:a17:907:3609:b0:a5a:8849:2205 with SMTP id a640c23a62f3a-a5a884925ffmr321408866b.42.1715778681643;
        Wed, 15 May 2024 06:11:21 -0700 (PDT)
Message-ID: <b693b6ba-4ff9-44e8-bf35-590143a077cf@suse.com>
Date: Wed, 15 May 2024 15:11:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 (resend) 04/19] x86: Lift mapcache variable to the arch
 level
Content-Language: en-US
To: Elias El Yandouzi <eliasely@amazon.com>
Cc: julien@xen.org, pdurrant@amazon.com, dwmw@amazon.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Wang <wawei@amazon.de>, Hongyan Xia <hongyxia@amazon.com>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20240513134046.82605-1-eliasely@amazon.com>
 <20240513134046.82605-5-eliasely@amazon.com>
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
In-Reply-To: <20240513134046.82605-5-eliasely@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.05.2024 15:40, Elias El Yandouzi wrote:
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -851,6 +851,8 @@ int arch_domain_create(struct domain *d,
>  
>      psr_domain_init(d);
>  
> +    mapcache_domain_init(d);

This new placement is re-done right away in the next patch. To me this is
another hint at it wanting considering to deal with the idle domain here
as well, right away.

> --- a/xen/arch/x86/domain_page.c
> +++ b/xen/arch/x86/domain_page.c
> @@ -82,11 +82,11 @@ void *map_domain_page(mfn_t mfn)
>  #endif
>  
>      v = mapcache_current_vcpu();
> -    if ( !v || !is_pv_vcpu(v) )
> +    if ( !v )
>          return mfn_to_virt(mfn_x(mfn));

While I don't mind this and ...

> @@ -187,14 +187,14 @@ void unmap_domain_page(const void *ptr)
>      ASSERT(va >= MAPCACHE_VIRT_START && va < MAPCACHE_VIRT_END);
>  
>      v = mapcache_current_vcpu();
> -    ASSERT(v && is_pv_vcpu(v));
> +    ASSERT(v);

... this change being done already here, I don't think that's necessary.
Nor is it really related to what the subject and (so far at least)
description say is being done here. In which case the description wants
to at least mention why the adjustments are pulled ahead earlier than
where they're strictly needed.

Jan

