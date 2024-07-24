Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7AC693ADFB
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 10:42:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764001.1174270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWXZF-0004sm-A8; Wed, 24 Jul 2024 08:41:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764001.1174270; Wed, 24 Jul 2024 08:41:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWXZF-0004pl-6N; Wed, 24 Jul 2024 08:41:49 +0000
Received: by outflank-mailman (input) for mailman id 764001;
 Wed, 24 Jul 2024 08:41:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D33k=OY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sWXZD-0004pf-W2
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 08:41:47 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8f19ebe4-4998-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 10:41:45 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a7aada2358fso105218866b.0
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jul 2024 01:41:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c786162sm629289766b.18.2024.07.24.01.41.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 01:41:44 -0700 (PDT)
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
X-Inumbo-ID: 8f19ebe4-4998-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721810505; x=1722415305; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oMHZbGhqlChhbKXjQggAVAlCh5PZB2DlKGGnDf22Eyk=;
        b=W8z8rzPqOoFM+j1qOUVBrWd9rF4OKxSA4twwC7Y8yQEqP+cmgoMMlLWMXTvsTIdJBL
         x6asj1zpOMHLfOYKEJ1eVAPXANKnqiVxew7DSwiZnXlvpX2F/Y626wfq58SDuM8jd5Ol
         iO3Zsaq+/lMJMBtcydtTilAbgcjGNcelbYyzx+wQ9MPOaIFKVU5l6u6GLwRQ6yiJWBXB
         c9lxN7mETZOKHn8SHZl2z7A8aeQQvwxz43RDxZl5V96/SFTKlXC2qFocIRwRq49NEuwl
         qwOEjepF0KrM80t7KrPlAXfZZsWmQp0EmWNzYB2UQQ20y3JTa40kkToL0sRonx6l9t4d
         vCnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721810505; x=1722415305;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oMHZbGhqlChhbKXjQggAVAlCh5PZB2DlKGGnDf22Eyk=;
        b=N2V1SILK2ehgGLSw+n19lKrC7WpTLpPLPb4aVPkzspVyhZKbGneC782P4vsIuKqEaZ
         hu9HbcsheZAocihGhAxYyb7VSA17QBcuozcNo3lzemNgdmd/EwxtLTpLEi3jyG2nD/CV
         +Pap/KBnDIRiKHdKXmxl5aMlFlP0xo6vhW9w7oeF4wakdtEUktzsEoi6kLrSkDyH+tz6
         Q/cHcf0a+HZwP0FQDXVTw01Xa8m/5ZH3reHrqw8ra/ZWf6+qxZGwCxIkqSyaObOKd8YE
         VOV4gWMskMGvj7gSGkfDFX3pvR8qouAxH0yttQLnfquK4hjDQ00Ra7MsoFD7e9fcg3oV
         iwKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWeoncaE/B5HAece7Ybve1EiJLQT5n1/0MKO52NrDkUnpGnANoPO32h7vb0w7ippFUrqEgfzIYL+Wr5jJHWKVNlDS4CVX93iKSMvnzBQQ=
X-Gm-Message-State: AOJu0YwV9KapLFYaFwSaCGgcnwcxcnSlGNfjGbipJyxfepc6Hs9zlR5N
	In60/SV4FrLUSShSZgGLHqLTPyU0XDxS1OD+Y0jMtQ+30dtzhxiuJk9lf+KVeA==
X-Google-Smtp-Source: AGHT+IFI2JOKHlsU5JfRmnGGOHYeuzXYgSmiq8/E95gFCnMpnn0ALdRHhXAlHS25QD2gBPWRZU+OSA==
X-Received: by 2002:a17:906:eece:b0:a7a:a763:842e with SMTP id a640c23a62f3a-a7ab2e48c70mr103165766b.13.1721810505056;
        Wed, 24 Jul 2024 01:41:45 -0700 (PDT)
Message-ID: <4a1bae1e-16d2-4536-b69a-1fff8179ee86@suse.com>
Date: Wed, 24 Jul 2024 10:41:43 +0200
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
In-Reply-To: <ZqC7Hn8R6Mkyqtpl@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.07.2024 10:28, Roger Pau Monné wrote:
> The only way I've found to cope with this is to use something like:
> 
> #define ALT_CALL_ARG(arg, n)                                            \
>     union {                                                             \
>         typeof(arg) e[(sizeof(long) + sizeof(arg) - 1) / sizeof(arg)];  \
>         unsigned long r;                                                \
>     } a ## n ## __  = {                                                 \
>         .e[0] = ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); })\
>     };                                                                  \
>     register unsigned long a ## n ## _ asm ( ALT_CALL_arg ## n ) =      \
>         a ## n ## __.r
> 
> An oversized array that ensures all the space of the long is covered
> by the array, but then we need an extra variable, as we would
> otherwise require modifying ALT_CALL{0..6}_OUT to use aX_.r instead of
> aX_.

I don't think we need to over-size the array. It just gets yet a little
more complex then:

#define ALT_CALL_ARG(arg, n)                                            \
    register union {                                                    \
        struct {                                                        \
            typeof(arg) e;                                              \
            char pad[sizeof(long) - sizeof(arg)];                       \
        } s;                                                            \
        unsigned long r;                                                \
    } a ## n ## _ asm ( ALT_CALL_arg ## n ) = {                         \
        .s.e = ({ BUILD_BUG_ON(sizeof(arg) > sizeof(void *)); (arg); }) \
    }

Jan

