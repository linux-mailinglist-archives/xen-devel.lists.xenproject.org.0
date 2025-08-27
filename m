Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C574B37C40
	for <lists+xen-devel@lfdr.de>; Wed, 27 Aug 2025 09:53:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095629.1450557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urAxN-0007nW-3Y; Wed, 27 Aug 2025 07:52:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095629.1450557; Wed, 27 Aug 2025 07:52:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urAxN-0007kg-0y; Wed, 27 Aug 2025 07:52:33 +0000
Received: by outflank-mailman (input) for mailman id 1095629;
 Wed, 27 Aug 2025 07:52:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gy2E=3H=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1urAxL-0007ka-DS
 for xen-devel@lists.xenproject.org; Wed, 27 Aug 2025 07:52:31 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8170cb3-831a-11f0-a32c-13f23c93f187;
 Wed, 27 Aug 2025 09:52:30 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-afcb731ca8eso1025578466b.0
 for <xen-devel@lists.xenproject.org>; Wed, 27 Aug 2025 00:52:30 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe80daceb5sm590161366b.68.2025.08.27.00.52.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Aug 2025 00:52:29 -0700 (PDT)
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
X-Inumbo-ID: c8170cb3-831a-11f0-a32c-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756281149; x=1756885949; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KfwZ9l5V2bAjpuYOBMDJ7zBCdjwTCyFDu0LrI6NWVBk=;
        b=HkMfNyyaK10wHp2p3v30MKYzC4a5axC8Cs1AYrRRe7IGxjdqx+mqxN+Mxf2wngiEhy
         N08Pdbc0BU7ogfyiws0o/HXYGzwMu/KKlDGzrIgW+PsBpLTYaZwvAoHdYC2T+fEt529d
         KwuKK/VH4Y6rLjUNB4MFTcKt+0lKUruesxkWt6M6NqADPQj7e72YckjnXyAFgld/++nz
         gedwHXsIsfoS19xT3llYPPZXSwYHh/63HDsoFiGiVVgLUj1aTfpupjST3Ov79L18+N1C
         Uu/bn+NonhRjkSyUEiex4UKa1xGf09Ycc+RgCkf52Hf7AYfQVhaW/zv8DvNM/4SBbAAi
         7h6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756281149; x=1756885949;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KfwZ9l5V2bAjpuYOBMDJ7zBCdjwTCyFDu0LrI6NWVBk=;
        b=u7SywqC+h2O3lMLX7CB4Jw1E0TBEZRByvKFrcBnEdWn2OhFg+kH3u/3X7i19cDZrAX
         NmhN0uKXMBBxoreNY8qDlHjBb2BqEldBxr2AzlfKEHyFmr26wP1niEUSuijqijlSa1rz
         yRzzk9Xhxh+Buz5J3zligaUBoZ7CApJaCYaz2wYWyZYoW0UpqMNFxguPbjwAB4GktLUQ
         CMU/OkZc7OUNRv3/EmOoc6YA1eYlgaBj88NYZcpK8NpHMRpmTNYLouJcedb6E41+ze08
         3X0rLGacPpmFPD5fOph9RaEWUKKD5LTvPd3ZbGhb0SHDS+zohMQ6ZjVvlxkC5IFziQIq
         6Yqw==
X-Forwarded-Encrypted: i=1; AJvYcCUCwpTvPY1owHKww6B4Tk/2Drueak54hbfkNZUR4gyD2dOa9lLNBKd4g4lt3OQR2N+3kwj6cs0B/NM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwxN0fAV821tiQIzjrgJS+wW+5TTlhdvBorKuzgIj/7V6OaZJfb
	dcJgxRww5Tce1XdR3MuplIPxbnP5Ri0SLGrFKJv+qfT0PHCGIV6vtxr6wnhfxNhMhw==
X-Gm-Gg: ASbGncuc9Qi8tGGXzLhdjLLPc/7pzh6KW1bkyx7oIlIIuVQUY6ZIxmWOF21d6T6aKED
	BtjDoR7NL3ww3v928cbNIoLgrn1TWnuYbyzNqCu6O4/IP628rGoGnamVJRR3PQPcjB8oY33Wmcd
	pw9X4ZdTaGuvqQHCYUEP5NOliO5YNdvUXKpWvP6dCILVkPj56ba5md4XH7K3qcZmuWBD4Gokmqg
	zcoiNrjveuIGzuYh8JG/9VAB/KS5gMxe3lwULk36s6e1Q3hHmzTG4Wnkx8RfKMSL4g+e3Sef3kU
	RX85r2egRlGT3R5ILzQ+Vzv2QFk5FM8uY6hromvP+j+dTEzZE2CqxWw9DpxDrfFxudmpB5mVlfj
	8CgiSyyEUyZx2h7Rnd2AVxyfRZcutJDxLOuQl2KyDL9s820EYhpr5YA0pBg7eB7fO8+Ogi+xQLY
	vODpqDyrFRhIvyetHcmw==
X-Google-Smtp-Source: AGHT+IFz6t0xh3WrMotafXWmuMTy6nRH5AkFrQ9WN8rtTxSXohdXoYDKiOYqYshcwNiA6yfGOJ15Xw==
X-Received: by 2002:a17:907:86aa:b0:ae0:a483:7b29 with SMTP id a640c23a62f3a-afe29550672mr1723992666b.49.1756281149387;
        Wed, 27 Aug 2025 00:52:29 -0700 (PDT)
Message-ID: <3ec7b53e-aef6-4a00-acb3-19cbbe6543c9@suse.com>
Date: Wed, 27 Aug 2025 09:52:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/bitops: Optimise arch_ffs{,l}() some more on AMD
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250527222930.1452674-1-andrew.cooper3@citrix.com>
 <20250826174135.605220-1-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250826174135.605220-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.08.2025 19:41, Andrew Cooper wrote:
> --- a/xen/common/bitops.c
> +++ b/xen/common/bitops.c
> @@ -97,14 +97,14 @@ static void __init test_for_each_set_bit(void)
>      if ( ui != ui_res )
>          panic("for_each_set_bit(uint) expected %#x, got %#x\n", ui, ui_res);
>  
> -    ul = HIDE(1UL << (BITS_PER_LONG - 1) | 1);
> +    ul = HIDE(1UL << (BITS_PER_LONG - 1) | 0x11);
>      for_each_set_bit ( i, ul )
>          ul_res |= 1UL << i;
>  
>      if ( ul != ul_res )
>          panic("for_each_set_bit(ulong) expected %#lx, got %#lx\n", ul, ul_res);
>  
> -    ull = HIDE(0x8000000180000001ULL);
> +    ull = HIDE(0x8000000180000011ULL);
>      for_each_set_bit ( i, ull )
>          ull_res |= 1ULL << i;

How do these changes make a difference? Apart from ffs() using TZCNT, ...

> @@ -127,6 +127,79 @@ static void __init test_for_each_set_bit(void)
>          panic("for_each_set_bit(break) expected 0x1008, got %#x\n", ui_res);
>  }
>  
> +/*
> + * A type-generic fls() which picks the appropriate fls{,l,64}() based on it's
> + * argument.
> + */
> +#define fls_g(x)                                        \
> +    (sizeof(x) <= sizeof(int)      ? fls(x) :           \
> +     sizeof(x) <= sizeof(long)     ? flsl(x) :          \
> +     sizeof(x) <= sizeof(uint64_t) ? fls64(x) :         \
> +     ({ BUILD_ERROR("fls_g() Bad input type"); 0; }))
> +
> +/*
> + * for_each_set_bit_reverse() - Iterate over all set bits in a scalar value,
> + * from MSB to LSB.
> + *
> + * @iter An iterator name.  Scoped is within the loop only.
> + * @val  A scalar value to iterate over.
> + *
> + * A copy of @val is taken internally.
> + */
> +#define for_each_set_bit_reverse(iter, val)             \
> +    for ( typeof(val) __v = (val); __v; __v = 0 )       \
> +        for ( unsigned int (iter);                      \
> +              __v && ((iter) = fls_g(__v) - 1, true);   \
> +              __clear_bit(iter, &__v) )
> +
> +/*
> + * Xen doesn't have need of for_each_set_bit_reverse() at present, but the
> + * construct does exercise a case of arch_fls*() not covered anywhere else by
> + * these tests.
> + */
> +static void __init test_for_each_set_bit_reverse(void)
> +{
> +    unsigned int  ui,  ui_res = 0, tmp;
> +    unsigned long ul,  ul_res = 0;
> +    uint64_t      ull, ull_res = 0;
> +
> +    ui = HIDE(0x80008001U);
> +    for_each_set_bit_reverse ( i, ui )
> +        ui_res |= 1U << i;
> +
> +    if ( ui != ui_res )
> +        panic("for_each_set_bit_reverse(uint) expected %#x, got %#x\n", ui, ui_res);
> +
> +    ul = HIDE(1UL << (BITS_PER_LONG - 1) | 0x11);
> +    for_each_set_bit_reverse ( i, ul )
> +        ul_res |= 1UL << i;
> +
> +    if ( ul != ul_res )
> +        panic("for_each_set_bit_reverse(ulong) expected %#lx, got %#lx\n", ul, ul_res);
> +
> +    ull = HIDE(0x8000000180000011ULL);
> +    for_each_set_bit_reverse ( i, ull )
> +        ull_res |= 1ULL << i;

... even here the need for the extra setting of bit 4 remains unclear to
me: The thing that was missing was the testing of the reverse for-each.
You mention the need for an asymmetric input in the description, but isn't
that covered already by the first test using 0x80008001U?

That said, I certainly don't mind the change, it just isn't quite clear to
me whether I'm missing something crucial.

Jan

