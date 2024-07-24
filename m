Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1492493AE68
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 11:17:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764017.1174289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWY7H-0001EB-2r; Wed, 24 Jul 2024 09:16:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764017.1174289; Wed, 24 Jul 2024 09:16:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWY7G-0001Bb-WC; Wed, 24 Jul 2024 09:16:59 +0000
Received: by outflank-mailman (input) for mailman id 764017;
 Wed, 24 Jul 2024 09:16:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D33k=OY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sWY7F-0001BV-Ew
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 09:16:57 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78abb341-499d-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 11:16:55 +0200 (CEST)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5a3458bf989so5160181a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 02:16:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a30a4d7265sm8761587a12.9.2024.07.24.02.16.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 02:16:53 -0700 (PDT)
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
X-Inumbo-ID: 78abb341-499d-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721812615; x=1722417415; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GWgSDsw7CdK+T7TXtpnvUUd+ObIsggG6Z1aob2dx74k=;
        b=TNT/Kwi/lphHy0YccfKzDDYIxkI3+z8dm15i8VBAX4p/tuaVe8+L8ggMcy2m+mFEX+
         RnoflcsxuXOM1gZryLIwb0uiP3hze5UjttEKtEn9c9dfxhhLHq6zEItgG+nMrpVNGx8i
         HXm9nvOdaOU76opHNUZ1/1vLent5qoJalEMouNRI0JF3YCOXeB+1YY+RcQUQ1zUh/cQ6
         C4oVW9XOXA09l36W2CwMEZFGvg1VXJpwQnR6dfEymvAYLK6coB7Xk9MRlPvs4zzCME4b
         BzWyuAJhatOO5yx+gilVpYzLRSMNzwsio5nFi5lvSctQFteCuJQMKi7En72O+VqS0gwF
         wWcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721812615; x=1722417415;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GWgSDsw7CdK+T7TXtpnvUUd+ObIsggG6Z1aob2dx74k=;
        b=npg63FmqcBrjuHz8fceMY8uXRxxDKwP1gIYqOEuPjN2QZd1+cOb8IF/mTXKZ963NDU
         jDIN8gx2s7VEMoaDvnucurbpbxYMthiA/5C//KHFCO5BiT1EGHinSz9XkiucGZaBWGh1
         GabUA6m8Yp6sBQabe/AxKr0xi5ug+IoHZxMnlAvaghuUoXfpfkI9emHpRBtXmQooOoBY
         9ju77o6FzLDQI/3UbZz4O2qvQObw4eMa8QHbm2X+gYfXk1CZprrwXWzuccWoXq721xIH
         b0J9VhK6n/JHbCgsvb4dUUKoCP1HTI2RgyG12ioyOO4863YhMKMR7WgOKW0JrIquiMBt
         x8zg==
X-Forwarded-Encrypted: i=1; AJvYcCUhWKSOcuKBdGyfSsVkpjWNMAltbYCvSW3KuMRVEoGW7OyXmkW6t+MlJNP3pNrJflyapGXEKwhUDbN0T4rI5GFYy0Nh0+uo4EDocQ1nYvs=
X-Gm-Message-State: AOJu0YyLcM7tJ3S6jorloZMb2o1axrBUOYc3lNR1cH5SpOAvSaN+12n9
	C1qGGNI0ujaVWFL8cWNYOXwWiwvkLR/aXAbDL//8RcVaFh4eoPxWX8DDM/0yPQ==
X-Google-Smtp-Source: AGHT+IF1XX5WyqEKHmKpif+pbq/k4VrlqRuMZtLGrZxob1gSEkzYBAsqufPCIOTBYAjKQdDl6tgU+A==
X-Received: by 2002:a50:8d4b:0:b0:57c:7599:2c67 with SMTP id 4fb4d7f45d1cf-5aaeeaa46f5mr965410a12.37.1721812613890;
        Wed, 24 Jul 2024 02:16:53 -0700 (PDT)
Message-ID: <bda9b241-ce89-4e69-939a-e6e9d7259eb4@suse.com>
Date: Wed, 24 Jul 2024 11:16:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] x86/altcall: fix clang code-gen when using
 altcall in loop constructs
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <20240723093117.99487-1-roger.pau@citrix.com>
 <D2X13ED477J8.25JRFH9VEW33O@cloud.com> <Zp_VuwxqH3Mii8_W@macbook>
 <D2X237Y7T92R.1VVSBS9MCJOFW@cloud.com>
 <7a5da6ce-0ef0-4666-a5c4-44383469f67e@suse.com> <ZqC7Hn8R6Mkyqtpl@macbook>
 <4a1bae1e-16d2-4536-b69a-1fff8179ee86@suse.com> <ZqDFpLbGe_HmTrTF@macbook>
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
In-Reply-To: <ZqDFpLbGe_HmTrTF@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.07.2024 11:13, Roger Pau Monné wrote:
> On Wed, Jul 24, 2024 at 10:41:43AM +0200, Jan Beulich wrote:
>> On 24.07.2024 10:28, Roger Pau Monné wrote:
>>> The only way I've found to cope with this is to use something like:
>>>
>>> #define ALT_CALL_ARG(arg, n)                                            \
>>>     union {                                                             \
>>>         typeof(arg) e[(sizeof(long) + sizeof(arg) - 1) / sizeof(arg)];  \
>>>         unsigned long r;                                                \
>>>     } a ## n ## __  = {                                                 \
>>>         .e[0] = ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })\
>>>     };                                                                  \
>>>     register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n ) =      \
>>>         a ## n ## __.r
>>>
>>> An oversized array that ensures all the space of the long is covered
>>> by the array, but then we need an extra variable, as we would
>>> otherwise require modifying ALT_CALL{0..6}_OUT to use aX_.r instead of
>>> aX_.
>>
>> I don't think we need to over-size the array. It just gets yet a little
>> more complex then:
>>
>> #define ALT_CALL_ARG(arg, n)                                            \
>>     register union {                                                    \
>>         struct {                                                        \
>>             typeof(arg) e;                                              \
>>             char pad[sizeof(long) - sizeof(arg)];                       \
>>         } s;                                                            \
>>         unsigned long r;                                                \
>>     } a ## n ## _ asm ( ALT_CALL_arg ## n ) = {                         \
>>         .s.e = ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); }) \
>>     }
> 
> We could even simplify this, there's no need for the union anymore,
> since struct size == sizeof(long) already:
> 
> #define ALT_CALL_ARG(arg, n)                                            \
>     register struct {                                                   \
>         typeof(arg) e;                                                  \
>         char pad[sizeof(long) - sizeof(arg)];                           \
>     } a ## n ## _ asm ( ALT_CALL_arg ## n ) = {                         \
>         .e = ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })   \
>     }
> 
> The above seems to work for both the original issue and the new one.

Oh, good. If the compiler's happy with not being dealt an unsigned long,
even better. Maybe for consistency we want to use sizeof(void *) also in
pad's definition then.

Jan

