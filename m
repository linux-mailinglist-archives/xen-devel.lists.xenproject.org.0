Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEEBB3E6DE
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 16:21:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1104957.1455962 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut5Pm-0007qk-2b; Mon, 01 Sep 2025 14:21:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1104957.1455962; Mon, 01 Sep 2025 14:21:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut5Pl-0007oT-V5; Mon, 01 Sep 2025 14:21:45 +0000
Received: by outflank-mailman (input) for mailman id 1104957;
 Mon, 01 Sep 2025 14:21:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wdOO=3M=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1ut5Pk-0007oN-4P
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 14:21:44 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fabf5d49-873e-11f0-8adc-4578a1afcccb;
 Mon, 01 Sep 2025 16:21:43 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-45b88bff3ebso9281175e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 07:21:41 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b7df3ff72sm99621875e9.1.2025.09.01.07.21.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 07:21:40 -0700 (PDT)
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
X-Inumbo-ID: fabf5d49-873e-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1756736501; x=1757341301; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TGEFM4rXYhommHBQGhO2DWsW76qP+gCE1d6nVDVF9io=;
        b=CNT9zcgNnVb+mz+kk+fVpcwprC16SpE59xayVCWSpVhjEB+bTxUOuvzINwm5ctIhjW
         BkjlL92vArSGHBFs9hMgH1lMbNQB/1/CuVhwYuFPQ8tB1UYwaLhys1gUVWYXQhiVCIzN
         +aLRK+RpeAQPfxlBkCOzyd6sLP9+8NVNvkyuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756736501; x=1757341301;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGEFM4rXYhommHBQGhO2DWsW76qP+gCE1d6nVDVF9io=;
        b=PH8RbiblNGrIcmQ7jURUXepiTBnC6MS9HIQ/d823oj7r/hqvosMSUUL1tMiqIlMt15
         ijMKsk/066RHUbL3WWECuCbj6y8oX8LQ5NxKZP+at6RCDNqZnOiKZxcZjP/4xlSv1JAe
         av8GOINLGXw7TR0i0OmnKtb0IKiibN9hfya4elVs3QufmkkE3zf0+1tk7vUxX0QOtczU
         iRmfoI0dCICwTsWv/WPx0vyluTP/Uw1zFptPrmNBbZGwOP1dcP49bjU3FJBXgnvWstqy
         wwhu/ev9CNHDI1Bh/FT5xtDQVs6innp64M7gEEQD2beIgvqc4xuwhWmpDK4NmUsuO8Gq
         i8cg==
X-Forwarded-Encrypted: i=1; AJvYcCWUV04gdGrvwtOEaSjtK2GxMMWarHxQVAqeWPgOw6uanf/zvEZjbDERn7IAH4cHeWFG1K34o1ZfB40=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxFpa5FoidVoE0iwYBkSsTTMTNnd7kTmYGAlzXMERyxdGRb0Tlm
	g1nHjSetzMMo2BUJnFeJaWOmH+A07m2THULH59nJ9CB8rCyAKjkRWRp0ZtvmRKbH5CU=
X-Gm-Gg: ASbGncvA7FTZR+D2MLr6x+v4G0lvFw3TJpLyh4zPRe5CSToLgHt+XCG9eLSTn2vfBMB
	4ZsxbHr3x8RG3r9b8yXRZpgARfKys7BQ1FEdH/tophoUD+SuBUvifynWS84iuHGKkiPghnqrxTT
	0Wi2yBrmc2YKb0rTzYH0zSjrH8E61ADf9f0B9O3CyskNR1gtyplf2ItgY9S0hZxMy19zL2caUOz
	bLwexVyO8EIKPFdF6FttLp9UIA1dB1H8HtST7azQ5EHWC4U/wq8aWkYffdDt8oVPpII/mJSUYde
	ldjZPk7Y/3FFp/U4AjvGr67alqBSkv1PnzqbQ2YqK8ulKwpjNw78PuD0RoYjqlxDo5D3O3zCBlg
	OfuToGfI9kQDdUJwrFK4hVm1AV5ywYkFStwPhIu7Gk/lJNgIym1AwTtR+PO1/QGINl2LG1LNd3Q
	qdCVw=
X-Google-Smtp-Source: AGHT+IEBoBaJgxZopqGWqbE+aqWDNEnoPYd2EP2YOEQnTg51Nv1jG56BXdgGcLjy5jxSspkyRr3SkA==
X-Received: by 2002:a05:600c:3ba8:b0:445:1984:247d with SMTP id 5b1f17b1804b1-45b8552853amr68672335e9.7.1756736500872;
        Mon, 01 Sep 2025 07:21:40 -0700 (PDT)
Message-ID: <fa534ac9-21db-4d26-94f7-e7a016f31edf@citrix.com>
Date: Mon, 1 Sep 2025 15:21:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] x86/bitops: Optimise arch_ffs{,l}() some more on AMD
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250527222930.1452674-1-andrew.cooper3@citrix.com>
 <20250826174135.605220-1-andrew.cooper3@citrix.com>
 <3ec7b53e-aef6-4a00-acb3-19cbbe6543c9@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <3ec7b53e-aef6-4a00-acb3-19cbbe6543c9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/08/2025 8:52 am, Jan Beulich wrote:
> On 26.08.2025 19:41, Andrew Cooper wrote:
>> --- a/xen/common/bitops.c
>> +++ b/xen/common/bitops.c
>> @@ -97,14 +97,14 @@ static void __init test_for_each_set_bit(void)
>>      if ( ui != ui_res )
>>          panic("for_each_set_bit(uint) expected %#x, got %#x\n", ui, ui_res);
>>  
>> -    ul = HIDE(1UL << (BITS_PER_LONG - 1) | 1);
>> +    ul = HIDE(1UL << (BITS_PER_LONG - 1) | 0x11);
>>      for_each_set_bit ( i, ul )
>>          ul_res |= 1UL << i;
>>  
>>      if ( ul != ul_res )
>>          panic("for_each_set_bit(ulong) expected %#lx, got %#lx\n", ul, ul_res);
>>  
>> -    ull = HIDE(0x8000000180000001ULL);
>> +    ull = HIDE(0x8000000180000011ULL);
>>      for_each_set_bit ( i, ull )
>>          ull_res |= 1ULL << i;
> How do these changes make a difference? Apart from ffs() using TZCNT, ...
>
>> @@ -127,6 +127,79 @@ static void __init test_for_each_set_bit(void)
>>          panic("for_each_set_bit(break) expected 0x1008, got %#x\n", ui_res);
>>  }
>>  
>> +/*
>> + * A type-generic fls() which picks the appropriate fls{,l,64}() based on it's
>> + * argument.
>> + */
>> +#define fls_g(x)                                        \
>> +    (sizeof(x) <= sizeof(int)      ? fls(x) :           \
>> +     sizeof(x) <= sizeof(long)     ? flsl(x) :          \
>> +     sizeof(x) <= sizeof(uint64_t) ? fls64(x) :         \
>> +     ({ BUILD_ERROR("fls_g() Bad input type"); 0; }))
>> +
>> +/*
>> + * for_each_set_bit_reverse() - Iterate over all set bits in a scalar value,
>> + * from MSB to LSB.
>> + *
>> + * @iter An iterator name.  Scoped is within the loop only.
>> + * @val  A scalar value to iterate over.
>> + *
>> + * A copy of @val is taken internally.
>> + */
>> +#define for_each_set_bit_reverse(iter, val)             \
>> +    for ( typeof(val) __v = (val); __v; __v = 0 )       \
>> +        for ( unsigned int (iter);                      \
>> +              __v && ((iter) = fls_g(__v) - 1, true);   \
>> +              __clear_bit(iter, &__v) )
>> +
>> +/*
>> + * Xen doesn't have need of for_each_set_bit_reverse() at present, but the
>> + * construct does exercise a case of arch_fls*() not covered anywhere else by
>> + * these tests.
>> + */
>> +static void __init test_for_each_set_bit_reverse(void)
>> +{
>> +    unsigned int  ui,  ui_res = 0, tmp;
>> +    unsigned long ul,  ul_res = 0;
>> +    uint64_t      ull, ull_res = 0;
>> +
>> +    ui = HIDE(0x80008001U);
>> +    for_each_set_bit_reverse ( i, ui )
>> +        ui_res |= 1U << i;
>> +
>> +    if ( ui != ui_res )
>> +        panic("for_each_set_bit_reverse(uint) expected %#x, got %#x\n", ui, ui_res);
>> +
>> +    ul = HIDE(1UL << (BITS_PER_LONG - 1) | 0x11);
>> +    for_each_set_bit_reverse ( i, ul )
>> +        ul_res |= 1UL << i;
>> +
>> +    if ( ul != ul_res )
>> +        panic("for_each_set_bit_reverse(ulong) expected %#lx, got %#lx\n", ul, ul_res);
>> +
>> +    ull = HIDE(0x8000000180000011ULL);
>> +    for_each_set_bit_reverse ( i, ull )
>> +        ull_res |= 1ULL << i;
> ... even here the need for the extra setting of bit 4 remains unclear to
> me: The thing that was missing was the testing of the reverse for-each.
> You mention the need for an asymmetric input in the description, but isn't
> that covered already by the first test using 0x80008001U?

The first test covers {arch_,}f[fl]s() only.  It happens to be safe to
count-from-the-wrong-end bugs, but that was by chance.

The second test covers {arch_,}f[fs]sl() only.  They are unsafe WRT
symmetry, and disjoint (coverage wise) from the first test.

The third test, while the same as the second test on x86, isn't the same
on arm32.


Just because one test happens to be safe (symmetry wise) and passes,
doesn't make the other variants tested.

~Andrew

