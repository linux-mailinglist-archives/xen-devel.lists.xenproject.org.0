Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D5589735F
	for <lists+xen-devel@lfdr.de>; Wed,  3 Apr 2024 17:04:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700589.1093957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs2A5-0000xT-3M; Wed, 03 Apr 2024 15:04:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700589.1093957; Wed, 03 Apr 2024 15:04:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rs2A5-0000vv-0h; Wed, 03 Apr 2024 15:04:25 +0000
Received: by outflank-mailman (input) for mailman id 700589;
 Wed, 03 Apr 2024 15:04:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XszW=LI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rs2A3-0000vp-VD
 for xen-devel@lists.xenproject.org; Wed, 03 Apr 2024 15:04:23 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73d132dc-f1cb-11ee-afe5-a90da7624cb6;
 Wed, 03 Apr 2024 17:04:22 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a47385a4379so206085566b.0
 for <xen-devel@lists.xenproject.org>; Wed, 03 Apr 2024 08:04:22 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 g16-20020a170906539000b00a46dd1f7dc1sm7827794ejo.92.2024.04.03.08.04.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Apr 2024 08:04:21 -0700 (PDT)
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
X-Inumbo-ID: 73d132dc-f1cb-11ee-afe5-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712156661; x=1712761461; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J0lIHadVjTx24honbCAGDQ8HCreWm6KTJx6ajbE8yHE=;
        b=XzHwqd77zf0ty79bzG8IcZqAbUyQ+DCO5H6fjjvoajI3ABwCD3OCb/PxECCjbm8eRX
         G/R+3rsUxQpxV9Om2F+h02n5TmQyS0pgpK2TDN+FBRI8Y7s36XLj7HS6mdslqSM5/nbS
         LVByYHAvtq9U7fMG4GS59wRREqB72ZgnAbVzZM4VlcGuCauSwoyV5jkCeL6i+e0mZpfE
         glF6eAOYy3ktQOgnzSV1RNOjSjXt8hsi8SBtRLHId9o1El0hYoaolSCHMFGpUTOwiBr3
         XU6HTSLnwye2IIj/Gj60zrlagxdOZ2nEkCGXRbJZNJRfTDkHcFn5n/UGrcYKDoF1jpBT
         EkSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712156661; x=1712761461;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J0lIHadVjTx24honbCAGDQ8HCreWm6KTJx6ajbE8yHE=;
        b=ZdZy1pE4Wu9r/fWaeY5P5nIl/N3X0cOgfvP1nW270JHZefbP/fB2lskyw1kbfKAt44
         FUhS2wjMCUS6k1F+KeQne5dWsHz2w8l09iGSbU+e2djt6eSaUXtJNrPyyBrvg9R7BZMc
         gtGi/C7UsnWLl7jU6aPOCvSRjZTf20Xhtod7FVRPOWzTjnWhF5gyDHM/mMwOn0Ykai3F
         V3otSpfr1gU7qGm1lUy9XHcYlE59w5NdUtnM0AqQmoKFdhG8//tydhw8AuQ52K+y0lLg
         ZgnOYhgNZ20BqcWaNkx8Nqz4yOrOfIivPYtdYkabveRtOaPqmFOxSUwNYHZZf0JUHMF/
         PWwQ==
X-Gm-Message-State: AOJu0Yxq/Ap2N99WM/1y3PCkGURB9CZ4hdzZuqzJPTi7mGZa7x3IXtz5
	1ObzdfWyinhg5TMCbTHIdW48UElmV+Epaz+SBuIOFQTLkNGwLn0Sas0UaIs8+Zby/U7PqAds+/A
	=
X-Google-Smtp-Source: AGHT+IHJScxu3NgkmGVx9d/VuRlGvAXkfcudua80j9FDdstH/sBFFZEDPFG91n18VZ4Te8GWLYhRKA==
X-Received: by 2002:a17:906:6bd5:b0:a4e:68af:b1d8 with SMTP id t21-20020a1709066bd500b00a4e68afb1d8mr2668131ejs.2.1712156661505;
        Wed, 03 Apr 2024 08:04:21 -0700 (PDT)
Message-ID: <8c7ffed8-4faa-4dd3-8a41-d436ba49898b@suse.com>
Date: Wed, 3 Apr 2024 17:04:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: text-tsx fails on Intel core 8th gen system
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
References: <Zg1stUacaDBkyDOn@mail-itl>
Cc: xen-devel <xen-devel@lists.xenproject.org>
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
In-Reply-To: <Zg1stUacaDBkyDOn@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.04.2024 16:50, Marek Marczykowski-Górecki wrote:
> Hi,
> 
> I've noticed that tools/tests/tsx/test-tsx fails on a system with Intel
> Core i7-8750H. Specific error I get:
> 
>     [user@dom0 tsx]$ ./test-tsx 
>     TSX tests
>       Got 16 CPUs
>     Testing MSR_TSX_FORCE_ABORT consistency
>       CPU0 val 0
>     Testing MSR_TSX_CTRL consistency
>     Testing MSR_MCU_OPT_CTRL consistency
>       CPU0 val 0
>     Testing RTM behaviour
>       Got #UD
>       Host reports RTM, but appears unavailable

Isn't this ...

>     Testing PV default/max policies
>       Max: RTM 1, HLE 1, TSX_FORCE_ABORT 0, RTM_ALWAYS_ABORT 0, TSX_CTRL 0
>       Def: RTM 0, HLE 0, TSX_FORCE_ABORT 0, RTM_ALWAYS_ABORT 0, TSX_CTRL 0
>       HLE/RTM offered to guests despite not being available
>     Testing HVM default/max policies
>       Max: RTM 1, HLE 1, TSX_FORCE_ABORT 0, RTM_ALWAYS_ABORT 0, TSX_CTRL 0
>       Def: RTM 0, HLE 0, TSX_FORCE_ABORT 0, RTM_ALWAYS_ABORT 0, TSX_CTRL 0
>       HLE/RTM offered to guests despite not being available
>     Testing PV guest
>       Created d8
>       Cur: RTM 0, HLE 0, TSX_FORCE_ABORT 0, RTM_ALWAYS_ABORT 0, TSX_CTRL 0
>       Cur: RTM 1, HLE 1, TSX_FORCE_ABORT 0, RTM_ALWAYS_ABORT 0, TSX_CTRL 0
>     Testing HVM guest
>       Created d9
>       Cur: RTM 0, HLE 0, TSX_FORCE_ABORT 0, RTM_ALWAYS_ABORT 0, TSX_CTRL 0
>       Cur: RTM 1, HLE 1, TSX_FORCE_ABORT 0, RTM_ALWAYS_ABORT 0, TSX_CTRL 0
>     [user@dom0 tsx]$ echo $?
>     1

... the reason for this?

Jan

