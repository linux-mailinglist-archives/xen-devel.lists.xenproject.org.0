Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C673F89897D
	for <lists+xen-devel@lfdr.de>; Thu,  4 Apr 2024 16:05:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.700909.1094714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsNi6-0007YI-7T; Thu, 04 Apr 2024 14:04:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 700909.1094714; Thu, 04 Apr 2024 14:04:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsNi6-0007Vx-4n; Thu, 04 Apr 2024 14:04:58 +0000
Received: by outflank-mailman (input) for mailman id 700909;
 Thu, 04 Apr 2024 14:04:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=stKz=LJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rsNi5-0007Vr-Ja
 for xen-devel@lists.xenproject.org; Thu, 04 Apr 2024 14:04:57 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 506a9b80-f28c-11ee-a1ef-f123f15fe8a2;
 Thu, 04 Apr 2024 16:04:55 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4162ad8ddd0so4249895e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 04 Apr 2024 07:04:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 fl22-20020a05600c0b9600b004162bf2f149sm1071550wmb.48.2024.04.04.07.04.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Apr 2024 07:04:54 -0700 (PDT)
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
X-Inumbo-ID: 506a9b80-f28c-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1712239495; x=1712844295; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UL+5hFDFHh5W9EWGOvhcCuV6h0LlMmVkIbFtufYIPWc=;
        b=eqP6Gcg1I4twgw+tvvTR/03z6HZkMqQIc4JoiM/+m1UVmlAApHVc9DWr62yqnNww3m
         5oHDNjHeypDAE7TD07RIS7wTiNHH4izg1fgBrwUSGsOnxf1CsdsruwwydP5KWaiFCOv6
         /2FlJVz08BjVoqMLfFeQpqVfIWaBg76dE4wbiGD98Am7YX81X3mLxcEirrNhBM2dMtgm
         eYNnhrE8S2b/Fsjnn1Yhm37Kq8vBZrE3xkkf71f3P5F56OxOpW7FqR/6mQbZLj5IAfYF
         nPQT2NAtjf1zzBadX5MxqLPmJG3jiWnLjlAzQtyRzDQVcipsPasSkQPuC2FTUaa+oSZf
         Zmbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712239495; x=1712844295;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UL+5hFDFHh5W9EWGOvhcCuV6h0LlMmVkIbFtufYIPWc=;
        b=fxEQH/qchlMT2ECIjEO1BWjHPkPnefsCUkfNYT4V0RGpOO7N3N+Dp82Cz/wWwNdgnL
         fNanKrpvSPO/f4V6AYCCjFq3pQf3BO+94xacPEd69JkrDfxLyjxj8WXkEtKoZiKRlgAY
         vjcS//L8nvMuN7tXkIa1P8ye+nQsOO1pcAIyNAllixcqWNKDxHMtAup7IqmFTbUrEUMb
         NbloPS4pnOZoVO1zEv5lIYCb6soJ5hwLEPhwAkZRUcwkzJ4vOBcAgvT4y4irAOHM3g4o
         /a9GuYlIKccLK+ZQ7KfxQ+9iqGTmed5maCf1EVNExELtJSgTnXtWxT1vDeU2p4NKpKBl
         l9ng==
X-Forwarded-Encrypted: i=1; AJvYcCV+2qVr8pwcpyGQh2v6dZWxshQmXlbhNZ/1Sg/KGQzF779vJvUsHwJoYvBCAR/OuIKGDTxFyWAs1yKUB3iONZaCsW9UWZbJ3Jqd3U2e4WE=
X-Gm-Message-State: AOJu0YzdBu0YqqPSmEQl02+HcKvkSm/ZrJ7c0/xB6rG7upKqkn+sgll6
	F+IJMhpNt1SUwW+1vgNi3qNhbcQu1rbMsyr/YEOWi/hsLQNzKwn3rv2lFTzuwQ==
X-Google-Smtp-Source: AGHT+IECvx2koKoS8xxgFgu/YNQrbbEr0XBfbpBxxE5zr1k0QHHS+1j1/5xmlFBOU8qJeDmP1J+mUw==
X-Received: by 2002:a05:600c:4a83:b0:416:1e4d:4fce with SMTP id b3-20020a05600c4a8300b004161e4d4fcemr2111607wmp.38.1712239494991;
        Thu, 04 Apr 2024 07:04:54 -0700 (PDT)
Message-ID: <74742686-1799-41cc-aa7c-c427ae3d47fe@suse.com>
Date: Thu, 4 Apr 2024 16:04:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 05/19] xen/bitops: implement fls{l}() in common logic
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <cover.1712137031.git.oleksii.kurochko@gmail.com>
 <f2fb33097608fc1317b81e78d00d1b91b0fc4c1d.1712137031.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <f2fb33097608fc1317b81e78d00d1b91b0fc4c1d.1712137031.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03.04.2024 12:19, Oleksii Kurochko wrote:
> --- a/xen/include/xen/bitops.h
> +++ b/xen/include/xen/bitops.h
> @@ -201,7 +201,7 @@ static always_inline __pure int test_bit(int nr, const volatile void *addr)
>  
>  static always_inline __pure int fls(unsigned int x)
>  {
> -    if (__builtin_constant_p(x))
> +    if ( __builtin_constant_p(x) )
>          return generic_fls(x);
>  
>  #ifndef arch_fls
> @@ -213,7 +213,7 @@ static always_inline __pure int fls(unsigned int x)
>  
>  static always_inline __pure int flsl(unsigned long x)
>  {
> -    if (__builtin_constant_p(x))
> +    if ( __builtin_constant_p(x) )
>          return generic_flsl(x);
>  
>  #ifndef arch_flsl

As per this something is clearly wrong with the split between the previous
patch and this one.

Jan

