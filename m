Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5FDC813F1
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 16:09:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1171398.1496410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNYC6-0005Er-1e; Mon, 24 Nov 2025 15:09:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1171398.1496410; Mon, 24 Nov 2025 15:09:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNYC5-0005Ch-VD; Mon, 24 Nov 2025 15:09:33 +0000
Received: by outflank-mailman (input) for mailman id 1171398;
 Mon, 24 Nov 2025 15:09:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNYC4-0005CS-Au
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 15:09:32 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9348d037-c947-11f0-980a-7dc792cee155;
 Mon, 24 Nov 2025 16:09:30 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4777771ed1aso29321695e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 07:09:30 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fa35c2sm27692618f8f.25.2025.11.24.07.09.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 07:09:29 -0800 (PST)
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
X-Inumbo-ID: 9348d037-c947-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763996969; x=1764601769; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOONM6SxRS++UahGrXvH7O6s+sPl8pztSsyJZaomoAM=;
        b=eZE9MyHlD5ZZgATOzO1Bk9gl5+4NaMq+9ra2iHXBKNWQWKkGT6Yi8QrZ//PXJM85n6
         ai4FGZ2OgzN0X4bwqiinWs3xt9Lf5iC2GwKTk3uu7Jl0LtZNSn1EyuqfCnbz4Umg3m45
         6yQZwn/E1ERoGGkfDzgqqc9k/ZLi6UEHla6zBs2eepbSa+iFlTqmLJQ6TO1GHk/J0Tqe
         yVu5vsVzizHt1y3ZwK7AawLWJjqBP8oWZsk5LuWr035leyzlvTS9qFL6OVfz/p+XjgbY
         bDwyFjmfUsdn+sDDHnrlf/mMk5DRw3fvj7GKaWwkpT1/4madeckQT2tynRnLc53PKgir
         rDcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763996969; x=1764601769;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZOONM6SxRS++UahGrXvH7O6s+sPl8pztSsyJZaomoAM=;
        b=kkhkdMsWpe9XyW3xYnYFKpjS9Hef7OPK5ZoWhLMpCCf+79w8lnYWhsVeWuaR4aPFMq
         hdxIC6QsMhBSsUx51UFbWEJGPnmf20PexObZtRFiJs2FL82sL1FQkDISih5ECWQ6FB3I
         UsXAv1LmKqAtNVVlTocNdtjNK+N5/jzaIXSh+qr3IXjXbn7acuH9hdbxQS8e4yL84RR0
         3vaTWabV1VggEBYRDlx/L/gxJc+vnndYgyNp+pO4RkyTztNMoN3znnOtEULWNUxJ9tbV
         8cs7kD1HTEZofc72ERhTa1w+hAqqrHBsr2x6pkd+OtkX44IUSIn8BuN92DIsCtvG2uaU
         eNuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXptwDr7tBlSwcNySsM3l0yoN/oGt7d7VOzq2BudxKRNWaiIutYE4xJ96/q7K2jKfg/orlowJY+Jpc=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywkb1lBpODKJ6yxiZMbZZrS8lgD2gZn+TC3jdrECm7O1RHRbmKe
	rkdcFRI2R8o71ZsiVXEfNiVdkQyJod7o+reTdL/kMKG1Zar0pFgS/zubYRIrUbqi7Q==
X-Gm-Gg: ASbGncv91iaQlGSsC5zVjNvTYG28QjyTunxUKGLfcPT7HOxSknoTE117fFgQgnUU6ZI
	SuU2sSsGpgVUkKJELoqrICKFfuGS+1yW0qxRKq59C5Iak6xrDQCrbX4nkcsvMdAbOUGk+RucAU6
	PUwfYnMXr9cNfz0VeKGKnwhG8k2TghcCuIgszmNQnuxjYVS7gk21A2NwgO7sOJAH5VT/q7iOhM7
	7v8qHndWkRwgYP1uDhfE5Pwu59YK0JNiRVWEpgupGa9bQSub/seJtXIogkrs1eBaYepf1jYhqpD
	Vtkf3hA6ZmiXiFf2X8fmS+iXqo35SF9ramOYIyY+EiIOf/1TJjjM4Pnpu3/Vkcs7YqGUryxu3E0
	SKPkUVEkumyPnTA2EufmakyIG8RyD3zal0YVqwSdEWO5d4U18QBmGAhx7MSi+Y4fGhKJAtascxp
	d4mEmpMrE0HNyT6uX51PoMylA5/Wdk2xyJO9iygM+umuGq9cYxjEtihMATWGGm1cFZaNrU+5Lqu
	uw=
X-Google-Smtp-Source: AGHT+IF5HXPdqYmYacXoYvd4kJR7hJYZ5xFlFuQxOxkQ/2cEQUhXFLGyJECc8+bHajbJ6saJpED51g==
X-Received: by 2002:a05:600c:3593:b0:46e:32dd:1b1a with SMTP id 5b1f17b1804b1-477c0162f1fmr134678565e9.7.1763996969422;
        Mon, 24 Nov 2025 07:09:29 -0800 (PST)
Message-ID: <98c23088-a40f-41eb-9a10-3d310cfba255@suse.com>
Date: Mon, 24 Nov 2025 16:09:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/vhpet: Fix sanitization of legacy IRQ route
To: Tu Dinh <ngoc-tu.dinh@vates.tech>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20251124134344.456-1-ngoc-tu.dinh@vates.tech>
 <8581c3ce-e0f7-41e5-aee7-cf607f8f338d@suse.com>
 <143076ee-6ade-4fe8-924a-a2b8a5af1a5f@vates.tech>
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
In-Reply-To: <143076ee-6ade-4fe8-924a-a2b8a5af1a5f@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2025 16:02, Tu Dinh wrote:
> On 24/11/2025 15:53, Jan Beulich wrote:
>> On 24.11.2025 14:43, Tu Dinh wrote:
>>> When setting a timer's config register, timer_sanitize_int_route will
>>> always reset the IRQ route value to what's valid corresponding to the
>>> !HPET_CFG_LEGACY case. This is applied even if the HPET is set to
>>> HPET_CFG_LEGACY.
>>>
>>> When some operating systems (e.g. Windows) try to write to a timer
>>> config, they will verify and rewrite the register if the values don't
>>> match what they expect. This causes an unnecessary write to HPET_Tn_CFG.
>>>
>>> Note, the HPET specification states that for the Tn_INT_ROUTE_CNF field:
>>>
>>> "If the value is not supported by this prarticular timer, then the value
>>> read back will not match what is written. [...] If the LegacyReplacement
>>> Route bit is set, then Timers 0 and 1 will have a different routing, and
>>> this bit field has no effect for those two timers."

According to this, ...

>>> Therefore, Xen should not reset timer_int_route if legacy mode is
>>> enabled, regardless of what's in there.
>>
>> Fixes: ec40d3fe2147 ("x86/vhpet: check that the set interrupt route is valid")
>> (I think)
> 
> Yes, thanks.
> 
>>
>>> Signed-off-by: Tu Dinh <ngoc-tu.dinh@vates.tech>
>>> ---
>>>   xen/arch/x86/hvm/hpet.c | 11 ++++++++---
>>>   1 file changed, 8 insertions(+), 3 deletions(-)
>>>
>>> --- a/xen/arch/x86/hvm/hpet.c
>>> +++ b/xen/arch/x86/hvm/hpet.c
>>> @@ -48,6 +48,8 @@
>>>   #define timer_is_32bit(h, n)     (timer_config(h, n) & HPET_TN_32BIT)
>>>   #define hpet_enabled(h)          ((h)->hpet.config & HPET_CFG_ENABLE)
>>>   #define timer_level(h, n)        (timer_config(h, n) & HPET_TN_LEVEL)
>>> +#define timer_is_legacy(h, n) \
>>> +    (((n) <= 1) && ((h)->hpet.config & HPET_CFG_LEGACY))
>>>   
>>>   #define timer_int_route(h, n)    MASK_EXTR(timer_config(h, n), HPET_TN_ROUTE)
>>>   
>>> @@ -244,7 +246,7 @@ static void hpet_set_timer(HPETState *h, unsigned int tn,
>>>            (timer_level(h, tn) && test_bit(tn, &h->hpet.isr)) )
>>>           return;
>>>   
>>> -    if ( !timer_int_route_valid(h, tn) )
>>> +    if ( !timer_is_legacy(h, tn) && !timer_int_route_valid(h, tn) )
>>
>> Seeing this and the other use together with timer_int_route_valid(),
>> wouldn't timer_int_route_valid() better itself invoke the new macro?
> 
> I thought about it, but I found that it was overloading the definition 
> of timer_int_route_valid a little too much. Since timer_is_legacy() is 
> being used by itself later anyway, I figured it'd be better to just 
> separate the two.

... the route setting is valid (because of being ignored) when in legacy
mode. Hence why I think the check wants integrating there.

>>> @@ -379,6 +381,9 @@ static int cf_check hpet_write(
>>>           h->hpet.config = hpet_fixup_reg(new_val, old_val,
>>>                                           HPET_CFG_ENABLE | HPET_CFG_LEGACY);
>>>   
>>> +        for ( i = 0; i < HPET_TIMER_NUM; i++ )
>>> +            timer_sanitize_int_route(h, i);
>>
>> Strictly speaking this is needed only when HPET_CFG_LEGACY went from
>> 1 to 0. Plus it's needed only on the first 2 channels, as it's only
>> there where timer_sanitize_int_route() changes behavior. I'm not going
>> to insist to limit it like this, but if you don't, then I'd like to ask
>> for a comment here clarifying that excess work is done for simplicity's
>> sake.
> 
> Agreed, I can limit it to i <= 1.

May I ask that you avoid such open-coding and use timer_is_legacy(h, i) as
the loop continuation expression instead?

Jan

