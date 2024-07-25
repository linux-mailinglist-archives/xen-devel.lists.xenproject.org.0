Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE90393C2C4
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 15:18:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764992.1175536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWyMb-0000Yt-P5; Thu, 25 Jul 2024 13:18:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764992.1175536; Thu, 25 Jul 2024 13:18:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWyMb-0000Wa-Lb; Thu, 25 Jul 2024 13:18:33 +0000
Received: by outflank-mailman (input) for mailman id 764992;
 Thu, 25 Jul 2024 13:18:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/1nn=OZ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sWyMa-0000WU-AS
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2024 13:18:32 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 63639286-4a88-11ef-bbff-fd08da9f4363;
 Thu, 25 Jul 2024 15:18:31 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a7ab63a388bso33060666b.1
 for <xen-devel@lists.xenproject.org>; Thu, 25 Jul 2024 06:18:31 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5ac64eb3ab8sm809330a12.71.2024.07.25.06.18.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jul 2024 06:18:30 -0700 (PDT)
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
X-Inumbo-ID: 63639286-4a88-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1721913511; x=1722518311; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lae7/d5qpbENe30pdE3wh0YAmja6ImzeuzBnoBpO5PM=;
        b=eTfTDstkFBqB4bNpmZPI6qkDNgTrH5raT+rw484IEHR/8Xy1Sz7fK9pwpzGZxfsf5B
         dkzl8x6dllpiFWJNkgQamXsvWTOLJso/S1D1dx3AAPB+EkjK5KPpP45SXdjK54L6PayE
         SrrB5LmuZ7LsXmSuNNz7XejiX2ZioheL/8jl2jraAL+47Zemo1kddS4Tbxz5H0+7nzbn
         pzd9YWeLdw27rZ9TonAxryAxEcXIQGLifphpKho6m+4G209YM8JV1GA91yPWosV/UCIk
         0+msuIkvwk9hFA5u5yi4uhAHozBvHg5gMJykooBL30vyGLoLkqyrU1P5U0CU1RH1QCO+
         dkLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721913511; x=1722518311;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lae7/d5qpbENe30pdE3wh0YAmja6ImzeuzBnoBpO5PM=;
        b=G7kN5CpIJjXzlYS+BwKyZ+6jbWmYEJwOirIKaFWhftqt/mGiCptvW5j17a+vpnwaje
         NG7HyvGojUWqFUZWsd5YXyK/lKlGYlnrtGrD3hwMxjv9p9yZ/Rf/1zLmpqFG46R5qwFQ
         HRhW5FCAziCkCIyRsxpul22c1EhisOGGL6AahEuGy7Wvdz2FixV0He8rHvR84eIv9olc
         02UyhmP5qY1lVcVdDCrvMksnM8guoQWhc9k3tGSWAUinQFF82pGNvQkncdzCDZCTxfbf
         aPYddtmz1RqmTCayCw9gjTvcEp4qUvZP/VwiPT978i/QDXn1FkS823JfrhggDu2FxceY
         7oxg==
X-Forwarded-Encrypted: i=1; AJvYcCW2wtyqfO3alFMgb0tjwhktrEYzvWmflBHqyIX7cZJT2JyheR3j359Np1U+ew+ALidvYLuaHVydirUOftDoDa/UumKrFCq08Tt4Akf8mmU=
X-Gm-Message-State: AOJu0YyuIiFkDuNQBpG2ax6BQYJzf3AShYpqeQ7vJy2piH9yaCUL3nvV
	PIu+I3CWIy8JHYPRuyxERtYRfjkHiu6lxwFXSdCgZqu19tKH87t5PnWtWRGFuCqsWtZfzSyqiPY
	=
X-Google-Smtp-Source: AGHT+IHRBMYprdpZlTvHV8KAZ2NU4h0xSOTOe/EGK8/0FFBBf74o+OTp+tWB/57WxbY7XUg66QUM2Q==
X-Received: by 2002:a50:8a91:0:b0:5a2:8f7d:aff4 with SMTP id 4fb4d7f45d1cf-5ac62906b5bmr1860993a12.20.1721913510842;
        Thu, 25 Jul 2024 06:18:30 -0700 (PDT)
Message-ID: <9ecd3a39-55bf-4a49-9f45-1e0abfad353a@suse.com>
Date: Thu, 25 Jul 2024 15:18:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/altcall: further refine clang workaround
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 xen-devel@lists.xenproject.org
References: <20240725105634.16825-1-roger.pau@citrix.com>
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
In-Reply-To: <20240725105634.16825-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.07.2024 12:56, Roger Pau Monne wrote:
> --- a/xen/arch/x86/include/asm/alternative.h
> +++ b/xen/arch/x86/include/asm/alternative.h
> @@ -184,11 +184,11 @@ extern void alternative_branches(void);
>   * https://github.com/llvm/llvm-project/issues/82598
>   */
>  #define ALT_CALL_ARG(arg, n)                                            \
> -    register union {                                                    \
> -        typeof(arg) e[sizeof(long) / sizeof(arg)];                      \
> -        unsigned long r;                                                \
> +    register struct {                                                   \
> +        typeof(arg) e;                                                  \
> +        char pad[sizeof(void *) - sizeof(arg)];                         \

One thing that occurred to me only after our discussion, and I then forgot
to mention this before you would send a patch: What if sizeof(void *) ==
sizeof(arg)? Zero-sized arrays are explicitly something we're trying to
get rid of.

I was wondering whether we could get away resorting to bitfields, as those
are well-defined when having a width of zero:

    register struct {                                                   \
        typeof(arg) e;                                                  \
        unsigned long pad:(sizeof(void *) - sizeof(arg)) * 8;           \
    } ...

Yet when the width is zero, the field may not have name, whereas when the
field uniformly doesn't have a name, Clang would, like also for

    register struct {                                                   \
        typeof(arg) e;                                                  \
        unsigned long :0;                                               \
    } ...

regards that space as not needing any (re)init. Bottom line: For the
moment I'm out of ideas.

Jan

