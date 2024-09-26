Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7469B9871A8
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2024 12:38:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.805292.1216346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stlt9-0001Kk-HD; Thu, 26 Sep 2024 10:38:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 805292.1216346; Thu, 26 Sep 2024 10:38:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1stlt9-0001J0-Ea; Thu, 26 Sep 2024 10:38:23 +0000
Received: by outflank-mailman (input) for mailman id 805292;
 Thu, 26 Sep 2024 10:38:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J7u3=QY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1stlt8-0001Iu-Aw
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2024 10:38:22 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 72b244c3-7bf3-11ef-99a2-01e77a169b0f;
 Thu, 26 Sep 2024 12:38:20 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5c5b954c359so844270a12.1
 for <xen-devel@lists.xenproject.org>; Thu, 26 Sep 2024 03:38:20 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9393134bc5sm331207566b.208.2024.09.26.03.38.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Sep 2024 03:38:19 -0700 (PDT)
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
X-Inumbo-ID: 72b244c3-7bf3-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1727347100; x=1727951900; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KJVYwRJFziSQ9u6ZcEW4SjxbyugV+9jWZJuh/qeWOH0=;
        b=FJWif9LDRSNyBnYB2PqXsTrR/bKRTdj2ePZd81izCUw902mQa0ogt5gBgQc2sXSqHa
         qXIj+Nqj0TI8bM20PfSbSe30riRwtVNl3mYmesaTF/6RIYljKZpKuPUX+cAJvlgk0qVN
         9F/OwtUDymNEp6qS+n9RjlKa//mskhzc5/FJwJQ4HUXIyZ+zYk3zvt83gW4d3FdkMxwK
         TRDsOqQamPssLdj8jeNPlpEOPAtZObs2XEDTQffeKkC5LUv1FftYbS/mo+whbP8LU8Tw
         Pw8L7zN9iusOQSz5TNrNumxU2UKtlGa9LIY9eoUsxg0ZzA40wweKwsMS1O3pj68FhpXG
         rN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727347100; x=1727951900;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJVYwRJFziSQ9u6ZcEW4SjxbyugV+9jWZJuh/qeWOH0=;
        b=Um+Kq+g3YO6Bsm/pE76x3taIJf8C8f8hXgBbNnwqvnKb6Okvlylx7cHDi5UCeI7H3h
         4mO3QIzIbi8qiOUW94Xtx9NNlr2aQBQrB43xkN7L50f1Ut6YV58txNZG8saxIDFNZn6V
         BpeamTSUNs+zYcmccB+GDS0VFyhFVXn7lMmvMzmeRQQQz1vTI+YMYat65HjxcIn2OuFX
         VG+KXjLUbEe2yWtmusXgtlGuwmCyvJL92kqvckPuIH/2Uo7jvgX1KbSVPypu0zOhY3Xc
         SQxJE1pmTt1aLU4/6I0/yk2kmdn++oxocUZHY07muGQ2pKK7iX8BAjaKk5uv/kHhtOyK
         Fgfw==
X-Forwarded-Encrypted: i=1; AJvYcCV5fhny1op6OE8OizONRbsoP3YLLbSWt5p0jxkEWdfMu20zi4/V1o2z5hMvl99I7/Z3k8/iYzE3yL4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyHJmujKABdDtGf4uCA49F4pUSK2mrO5n3PTzw7bcSH9FZcmegd
	rMJSg2CD4bWmH8HG7KCLgAzDOoJ3G/fDGEZicpZ1sITIMg+yDXUlypcrpqC+pZmJvdC8CBtnXfk
	=
X-Google-Smtp-Source: AGHT+IHd06LL/dsrcmTqMEApZHhPNDCPzTG13VonsfJLpnCocbjq5JsIHNQH2YkpuwwtKlC9hMjFSw==
X-Received: by 2002:a17:907:940a:b0:a91:15dc:34e4 with SMTP id a640c23a62f3a-a93a06bd2bdmr507628266b.59.1727347099777;
        Thu, 26 Sep 2024 03:38:19 -0700 (PDT)
Message-ID: <d71f0aeb-dbfc-488a-b6be-e930297ed393@suse.com>
Date: Thu, 26 Sep 2024 12:38:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] x86/boot: Refactor BIOS/PVH start
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20240925060101.259244-1-frediano.ziglio@cloud.com>
 <20240925060101.259244-3-frediano.ziglio@cloud.com>
 <88189db4-c89c-430d-b96f-46259993fb5e@citrix.com>
 <2c550860-97fc-487d-9799-e543de15fff7@suse.com>
 <CACHz=ZieO0T0zb0+O9SKJTnDiaF3gEsA=AaGQghqkBMNGvgaug@mail.gmail.com>
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
In-Reply-To: <CACHz=ZieO0T0zb0+O9SKJTnDiaF3gEsA=AaGQghqkBMNGvgaug@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 26.09.2024 11:24, Frediano Ziglio wrote:
> On Thu, Sep 26, 2024 at 7:50 AM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 25.09.2024 21:33, Andrew Cooper wrote:
>>> On 25/09/2024 7:00 am, Frediano Ziglio wrote:
>>>> @@ -449,62 +458,40 @@ __pvh_start:
>>>>          mov     %ecx, %es
>>>>          mov     %ecx, %ss
>>>>
>>>> -        /* Skip bootloader setup and bios setup, go straight to trampoline */
>>>> -        movb    $1, sym_esi(pvh_boot)
>>>> -        movb    $1, sym_esi(skip_realmode)
>>>> +        /* Load null selector to unused segment registers. */
>>>> +        xor     %ecx, %ecx
>>>> +        mov     %ecx, %fs
>>>> +        mov     %ecx, %gs
>>>
>>> Honestly, the more I look at this, the more bizarre it is.
>>>
>>> We should just set up %fs/gs like we do %ds/es, which in this case is
>>> simply to drop the comment and the xor.
>>
>> What's bizarre here? As long as we don't use %fs/%gs, it doesn't matter
>> much what we set them to. So yes, they may be set to what %ds etc are set
>> to, but they may as well be marked unusable. Documentation-wise that's
>> cleaner imo, as down the road - when a need to use one arises - it then
>> won't require auditing of all code to figure where the register(s) is(are)
>> actually used (just to find: nowhere). Even if a comment to this effect
>> was left here, I for one wouldn't trust it in a couple of years time, but
>> rather fear it went stale.
> 
> Hi,
>   are you against this change and asking to roll it back?

Well, first of all I'm hoping for a reply by Andrew. Maybe I'm overlooking
something. As it stands right now I indeed think we'd be better off keeping
nul selectors in %fs and %gs.

Jan

