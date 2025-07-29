Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E53FFB14C91
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 12:53:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062416.1428083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ughwu-0007s6-PW; Tue, 29 Jul 2025 10:52:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062416.1428083; Tue, 29 Jul 2025 10:52:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ughwu-0007ph-MN; Tue, 29 Jul 2025 10:52:48 +0000
Received: by outflank-mailman (input) for mailman id 1062416;
 Tue, 29 Jul 2025 10:52:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fFWP=2K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ughws-0007pW-Nf
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 10:52:46 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2850a601-6c6a-11f0-b895-0df219b8e170;
 Tue, 29 Jul 2025 12:52:44 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3b788feab29so1533780f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 29 Jul 2025 03:52:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24011d5bcbesm49170065ad.10.2025.07.29.03.52.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jul 2025 03:52:43 -0700 (PDT)
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
X-Inumbo-ID: 2850a601-6c6a-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753786364; x=1754391164; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DZ807gXBTYDeHbK87taX0ZfjvA6sgza5ZRcc2TFNU2k=;
        b=ILkUSzYNOBPyaeeqyFeHRNe7aKjAQ7okIRZ3XtvFV0DtKvkOvTwOcYXu8+wBbLAnZj
         grz34+/vKxkd256tqqE1dbYfTiXrX+IWxYdyo59HUjQjbsoFwrv3QyGy8xeFZWAL2TTZ
         pUNnq+6QBesepq72VU70F6CI6Kh4X4BwsKnz3RdKn2My9ujvyYD7gCJqjqFc/Ymseh5x
         nWjXjqvj2QigACiB5NdQKFPelDnLYS0wb0+GJSCCCGV1KN4TNx1IViOBNZ5b6CmXvsWH
         34ae0lvw/d1X3hFkv4maH1+Rjn9LsLS0ahh/iDT7yO65GUf3Ju8LtdqOM0xiPc0Fxt6v
         hNcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753786364; x=1754391164;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZ807gXBTYDeHbK87taX0ZfjvA6sgza5ZRcc2TFNU2k=;
        b=LlaQ8ggrkzuYz7qKUxvHczRyaLJMWXdCahSVv1EpyQF9kFwRQM+78LYyV7xTFRhAqW
         8W2WNFyE0vlI8+XPrdQu2QChmt4vu9VA3lD9/LXEnsp2CCmWcq0wa373EsFt2WwTpGbT
         +qiFvtO0DQSY9F10pdUaWBuYPjrCf2qkDqUg7sAt9F0czeM3Hm7A/+72GYh0hK6JlqNQ
         2XLcphzK4ItwOyTJVODkg6b928zTGfITdUGJnGB43BryoHR2qnFlwyB8IRWbZp5Jp3xc
         wqd6tbXH+5JC41sGdJB6/7wxjlb6SR7awqHLNB6ktvno/FJW/80A9B/B5M32h/ZQZhH9
         ovVA==
X-Forwarded-Encrypted: i=1; AJvYcCX23Ic3nffFPMO5oWw+JEPyUzcVUX1le64otsKN8l0Lr2msMNhDst1PNlRKP9gxidcNjQUNq78Do0I=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw1oxWfVYRhxP/REu8um20/wrl5tiaiYhNNqiY2o5QVY+ykGxnp
	1VEge/Q0jhyZKgMzuO00SheQoDj6wbz437rHls43av+fWXcrIQyrmRzhxJWR/s4QaQ==
X-Gm-Gg: ASbGnctO3F0KDeRZyKrHwSmcXByEPkmKariN+/d0U1DLceVYUgYcQD/yWEuLliXlQOO
	2WHb92s98lmZbGLhaXlRjVmAO6LsBRdayzFLCBYGWTkX/TGCaAEQnmPMmZrh6Ng87u0BQ+mwnhA
	25ku5XyOG6AWNykFC/lB38/fTI0IDF7tVSikFCgWtxBPZkmBiPofkmnz5raycHB0gEdXlOAg09U
	Xi5u/G98qeSsVJ2BxWuR6eKXd/qcULEh+hi3w2xd6KmfLM8kVMX3H7F7jgR2LKJ55cmqu703f0J
	ij3NkBL6RbJvY5bLXdIj1tp5tA0GYEgACrsfm3qZZf0BMVZK1hDzEP6iG0xUZeXWTWoIDlck5WR
	WN0L9YH1ntiXaS9Q6b7+mi+qKaWoFQ06PMqo/L9g8ukez3pnWCC+ibZVWHDqkmUnweovPg9/7jt
	+wXZvzyjw=
X-Google-Smtp-Source: AGHT+IHgPITgvTLywGwtwlTcrpt09uSTlfWuhY71Bqkv914BqZg4WggMGTqrr/BsUDb5lX5oRmMnMA==
X-Received: by 2002:a05:6000:2381:b0:3b7:8a93:2b78 with SMTP id ffacd0b85a97d-3b78a932e92mr3935541f8f.42.1753786364187;
        Tue, 29 Jul 2025 03:52:44 -0700 (PDT)
Message-ID: <2c016cc6-bd1e-44c1-baaa-5faa6b88cf6b@suse.com>
Date: Tue, 29 Jul 2025 12:52:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra/eclair: set 'noreturn' attribute as safe during
 cast
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8989bf6d8d245537628912a00f5ba4731b292fb1.1753738107.git.dmytro_prokopchuk1@epam.com>
 <2f2a1992-0d88-4429-bed1-af5e60e05664@suse.com>
 <ef43422f-902c-43d6-8b67-10385427e2fe@epam.com>
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
In-Reply-To: <ef43422f-902c-43d6-8b67-10385427e2fe@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.07.2025 12:04, Dmytro Prokopchuk1 wrote:
> 
> 
> On 7/29/25 11:04, Jan Beulich wrote:
>> On 29.07.2025 00:15, Dmytro Prokopchuk1 wrote:
>>> ECLAIR reports a non-compliant cast due to the presence
>>> of the 'noreturn' attribute in the callee function.
>>
>> Which callee function? Which cast? Please be concrete. You don't need
>> to enumerate all case, but one specific example wants pointing at.
>>
>>> The issue occurs when casting a function pointer with
>>> the 'noreturn' attribute (void noreturn (*)(void *))
>>> to a general function pointer type (void (*)(void *)).
>>
>> And again - why "casting"? As per ...
>>
>>> Configure ECLAIR to treat 'noreturn' attributes as safe
>>> in this conversion.
>>>
>>> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
>>> ---
>>> Previous discussion thread:
>>> https://patchew.org/Xen/181a03d5c7625d42c06cf9fa0cf48a9bc6825361.1753647875.git.dmytro._5Fprokopchuk1@epam.com/
>>
>> ... there was no cast involved, iirc. We specifically rejected your
>> attempt to add a cast there. It's a conversion the compiler does, aiui.
>>
> Yes, you are right.
> Word "cast" is not appropriate there.
> 
> Below is updated text:
> 
>      misra: allow 'noreturn' as safe for function pointer conversions
> 
>      The conversion from a function pointer with the
>      'noreturn' attribute ('void noreturn (*)(void *)')
>      to a function pointer type ('void (*)(void *)'
>      causes type incompatibility according to
>      MISRA C Rule 11.1, which forbids conversions
>      between incompatible function pointer types.
> 
>      The violation occurs at the call site
>          smp_call_function(halt_this_cpu, NULL, 0);
>      where 'halt_this_cpu' with type 'void noreturn (*)(void *)'
>      is passed to 'smp_call_function' expecting a function
>      pointer of type 'void (*)(void *)'.
> 
>      The 'noreturn' attribute does not change the function
>      calling convention or parameter handling at runtime,
>      making the conversion safe.

Up to here things read much better now, thanks. Just one more request:
Please make better use of the 72 (or maybe even 75) characters that are
permitted per line.

>      Configure ECLAIR to treat 'noreturn' attributes as safe.

This one is still way to imprecise, though. And I hope it's only this
description, not also the Eclair configuration item that's overly lax.

Jan

