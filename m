Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 949918D0215
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 15:45:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730770.1135964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBaea-0007OE-Uh; Mon, 27 May 2024 13:44:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730770.1135964; Mon, 27 May 2024 13:44:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBaea-0007Lw-Rn; Mon, 27 May 2024 13:44:44 +0000
Received: by outflank-mailman (input) for mailman id 730770;
 Mon, 27 May 2024 13:44:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O60l=M6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sBaeZ-0007Lq-3A
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 13:44:43 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44ff45ce-1c2f-11ef-90a1-e314d9c70b13;
 Mon, 27 May 2024 15:44:42 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5789733769dso2911176a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2024 06:44:42 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c93842csm492827166b.74.2024.05.27.06.44.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 06:44:41 -0700 (PDT)
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
X-Inumbo-ID: 44ff45ce-1c2f-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716817481; x=1717422281; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t31DnLWpFYc078If3GDECs6MGoQMeqPsm+twD5oOddM=;
        b=Y2bds7srz58f+Nr7GZZsE49m0Lewo0iSPkHX+WZUk/ttC3c9dHj3HVHUT+puD+qcJ3
         PKJ2GHOvfISxzskLjVvg6oLTiub1vdLAavoCo3DmfcfA7IBYe2CYdtSrFzXFg/Y5s/ON
         iisB6lVmS6ApC8CGn3n7i2hEaU0E/V/VvDLvs+2A968bO000AQwIJwoiLIlT6l9bPFoI
         PjdeUF6OueC6yqlW2YSMi7eVHqlJNLjsWsput3bR1qli7PnVWHpxtPuJULWnKmyP4MQi
         DkHIgdMXCSnyJha9iNC1rfzRbRAqRYoBqpNaJzc2eMAUvAVMvvoCuG5RKE+7NfG+vyLj
         wvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716817481; x=1717422281;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t31DnLWpFYc078If3GDECs6MGoQMeqPsm+twD5oOddM=;
        b=pmaRPhillqMOyt0696Tu72E5h+JF2qcWzQ6XRXctLo4e3T/wt5ZkT+kkFm0QkUhB9J
         WDGsC4wxoVSJasKJ6kNG4BvY4Eo4aRKoQcff7/KjmdaPxVA1QdduMCvHgdCjvbGYMrS1
         Fmc5W2rpKCx2QQ6tH/M2moN0BZ5L5UsxshLe6npoXSJfUBDgkeZ74b3PIAPnPuxEmLqN
         Mv+waYaNMwY0TzUFNO0gE/QeDMxLPm7o4iyX9eVYXlnhSpwUHluLd7+OM1JwE07AeG/h
         kQxxji3vQY8BmcM1h9B6sELJ9GEkPh0YTWNmRvbWTiMHSBq0W9fSWIM0gqkbCTGBkH6m
         8Ivg==
X-Forwarded-Encrypted: i=1; AJvYcCUg/F8bX3/ar1oIWpUf4+ntUJVR6TFa2ANdEi3TbSwvrKtZ5tlRHazfb/k6aF+El9We0Jyp3N1vImCkKJuBFxyE+3oG1vpLtiJdOenZzjU=
X-Gm-Message-State: AOJu0Yx5Ak8/kr0EiQ7e6EsjUWUUYpQkbGziVAZ7LEGtrWU1IP0C7CR+
	24m9nciU1kyr3MtQI3qJypbfmA6i4nJAFkmd0emLklgG/vuk1LG462m2M7hdbw==
X-Google-Smtp-Source: AGHT+IEmK6S9V6yeBsj6KLS4hc44ghGJYb3wkQS15wa+HOWJfAMdJfqrkkkjx4uzv/3pLJAcold6tQ==
X-Received: by 2002:a17:906:a3cc:b0:a59:b17c:c9d2 with SMTP id a640c23a62f3a-a623e8d8909mr981938266b.12.1716817481244;
        Mon, 27 May 2024 06:44:41 -0700 (PDT)
Message-ID: <1cf28a31-976f-45dc-8dfb-ceecdc60cac7@suse.com>
Date: Mon, 27 May 2024 15:44:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/13] xen/bitops: Clean up ffs64()/fls64() definitions
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Federico Serafini <federico.serafini@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240524200338.1232391-1-andrew.cooper3@citrix.com>
 <20240524200338.1232391-13-andrew.cooper3@citrix.com>
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
In-Reply-To: <20240524200338.1232391-13-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.05.2024 22:03, Andrew Cooper wrote:
> Implement ffs64() and fls64() as plain static inlines, dropping the ifdefary
> and intermediate generic_f?s64() forms.
> 
> Add tests for all interesting bit positions at 32bit boundaries.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with two remarks:

> --- a/xen/common/bitops.c
> +++ b/xen/common/bitops.c
> @@ -24,6 +24,22 @@ static void __init test_ffs(void)
>      CHECK(ffsl, 1UL << 32, 33);
>      CHECK(ffsl, 1UL << 63, 64);
>  #endif
> +
> +    /*
> +     * unsigned int ffs64(uint64_t)
> +     *
> +     * 32-bit builds of Xen have to split this into two adjacent operations,
> +     * so test all interesting bit positions across the divide.
> +     */
> +    CHECK(ffs64, 0, 0);
> +    CHECK(ffs64, 1, 1);
> +    CHECK(ffs64, 3, 1);
> +    CHECK(ffs64, 7, 1);
> +    CHECK(ffs64, 6, 2);
> +
> +    CHECK(ffs64, 0x8000000080000000ULL, 32);
> +    CHECK(ffs64, 0x8000000100000000ULL, 33);
> +    CHECK(ffs64, 0x8000000000000000ULL, 64);

With the intermediate blank line, the respective part of the comment doesn't
look to be related to these 3 lines. Could I talk you into moving that part
down?

> --- a/xen/include/xen/bitops.h
> +++ b/xen/include/xen/bitops.h
> @@ -60,6 +60,14 @@ static always_inline __pure unsigned int ffsl(unsigned long x)
>  #endif
>  }
>  
> +static always_inline __pure unsigned int ffs64(uint64_t x)
> +{
> +    if ( BITS_PER_LONG == 64 )

In principle >= 64 would be okay here, and hence I'd prefer if we used that
less strict form. Yet I'm not going to insist.

Jan

