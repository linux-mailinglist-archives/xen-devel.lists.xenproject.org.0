Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F8886ACCE
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 12:19:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686477.1068577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfHxM-00008b-4o; Wed, 28 Feb 2024 11:18:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686477.1068577; Wed, 28 Feb 2024 11:18:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfHxM-00006Q-1B; Wed, 28 Feb 2024 11:18:36 +0000
Received: by outflank-mailman (input) for mailman id 686477;
 Wed, 28 Feb 2024 11:18:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iHog=KF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfHxL-00006K-6y
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 11:18:35 +0000
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [2a00:1450:4864:20::134])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1bf9f421-d62b-11ee-afd7-a90da7624cb6;
 Wed, 28 Feb 2024 12:18:33 +0100 (CET)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-512ab55fde6so7208488e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 28 Feb 2024 03:18:33 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 u24-20020a170906409800b00a3cfd838f32sm1762879ejj.178.2024.02.28.03.18.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Feb 2024 03:18:32 -0800 (PST)
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
X-Inumbo-ID: 1bf9f421-d62b-11ee-afd7-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709119113; x=1709723913; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4uh43WYyos/QNMgImDchNX+Q4uLC6PkPBT72EL0leEI=;
        b=anX5e6hxZhLquR1PN3R0xDI9z/JuNNrIdLtBsVmmL5iGjbXi8XrAlKZ8zjo+BbFa4Q
         AX4b7dft4eDXEXcyTPOSAkyfxyTNf8acrM3z5SWxF9FXrQaDEK41GtK6YJQT/FFQmXRK
         E3sIUOXVgI50OXytkju7K7yy4aPzIu8E+GenOZTcwQDjyg071o3mwQ4SiqzCguumL5g5
         GCzSNgUSi3eHXSEk7mE+BqbJHsgdBDS0T4zOiJ9Zy3Ia4Bb3PJS/a5b/FZgw4xXwRH0c
         dN3ZQuO9vK6f6mkvvkDgobMGMiWszgmQ//P584LIUi99z1qZzOYJXwdMbORI7TGYO76b
         deag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709119113; x=1709723913;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4uh43WYyos/QNMgImDchNX+Q4uLC6PkPBT72EL0leEI=;
        b=kA5KV6P5aTJvf8K9W2MNVOjPZrjmREYupt6Nx6LkJhvEg2MBEeE4byNoRbDbyJo6K+
         dVgKnaeWHZZNgg3UqGpvZE9K+PYeQHQdU4SDYOxt2OdR14F2SdHKA8wXTJKXWeyqU/gP
         bbdpzLFeOpR7BpA7rfPlbdNn7Nv0PX/Dr2FvNPHFmIaJhfQCsLbjj8rxDWqtuF3beqOv
         XS2kUy0x0yBoqwoi9RbfGAkE/ApIxSC33tZ7iC1YJMHGLReqTiqDgiTumHkokH2fuhKt
         SvrdtvPmfi2E2Llrobw7SflMdzVNwUMfMMS78eYXdc0fFDoLldef3BfOKiGpjgZNVcqa
         +yTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiNMk2uFSiR8sQ0teOo/WCLO7ccUPwzmkJSIwN1kXgWwGJpIG0RUaSq+5VBYYd0mVg0EI0UJ4sqxb8kM5HjIsGkRQ6x4P+Qs9H2UVQ2OI=
X-Gm-Message-State: AOJu0YwHBrsrGdR5qwuXut5aBLBAdKMgY7en/lq7Ess0MTKCmOT67G1c
	QcGuViF3o8Z7Q+PRapBgnArx5o63MCo9V6UMvUnbBMyvUPt3hWwonw3/AbaKVg==
X-Google-Smtp-Source: AGHT+IFDwO14G023nwh5yMKiO/3bGVUn4uxx31tIhARZJWTjAVgomiIy+Zh0n6sb5dOWFYMUxbLjYw==
X-Received: by 2002:ac2:5309:0:b0:513:17fb:24a1 with SMTP id c9-20020ac25309000000b0051317fb24a1mr1370119lfh.64.1709119113162;
        Wed, 28 Feb 2024 03:18:33 -0800 (PST)
Message-ID: <de7c8de8-2373-4d78-8aec-c633bb253660@suse.com>
Date: Wed, 28 Feb 2024 12:18:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/memsharing: use an atomic add instead of a
 cmpxchg loop
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20240222090530.62530-1-roger.pau@citrix.com>
 <20240222090530.62530-2-roger.pau@citrix.com>
 <d8939069-a1cb-4794-a6aa-75a3e4d97884@suse.com>
 <CABfawhkhH7Pakkq+RgjfmW-f60CbOKxr6wWxvBSr2AkN+m1OdQ@mail.gmail.com>
 <2f68276d-0b10-4cec-8636-5456314c194e@suse.com> <Zd8QtCwp75Phjluc@macbook>
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
In-Reply-To: <Zd8QtCwp75Phjluc@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.02.2024 11:53, Roger Pau Monné wrote:
> On Fri, Feb 23, 2024 at 08:43:24AM +0100, Jan Beulich wrote:
>> On 22.02.2024 19:03, Tamas K Lengyel wrote:
>>> On Thu, Feb 22, 2024 at 5:06 AM Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 22.02.2024 10:05, Roger Pau Monne wrote:
>>>>> The usage of a cmpxchg loop in get_next_handle() is unnecessary, as the same
>>>>> can be achieved with an atomic increment, which is both simpler to read, and
>>>>> avoid any need for a loop.
>>>>>
>>>>> The cmpxchg usage is likely a remnant of 32bit support, which didn't have an
>>>>> instruction to do an atomic 64bit add, and instead a cmpxchg had to be used.
>>>>>
>>>>> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>> Signed-of-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>
>>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>>> albeit ...
>>>>
>>>>> --- a/xen/arch/x86/mm/mem_sharing.c
>>>>> +++ b/xen/arch/x86/mm/mem_sharing.c
>>>>> @@ -179,13 +179,7 @@ static void mem_sharing_page_unlock(struct page_info *pg)
>>>>>
>>>>>  static shr_handle_t get_next_handle(void)
>>>>>  {
>>>>> -    /* Get the next handle get_page style */
>>>>> -    uint64_t x, y = next_handle;
>>>>> -    do {
>>>>> -        x = y;
>>>>> -    }
>>>>> -    while ( (y = cmpxchg(&next_handle, x, x + 1)) != x );
>>>>> -    return x + 1;
>>>>> +    return arch_fetch_and_add(&next_handle, 1) + 1;
>>>>>  }
>>>>
>>>> ... the adding of 1 here is a little odd when taken together with
>>>> next_handle's initializer. Tamas, you've not written that code, but do
>>>> you have any thoughts towards the possible removal of either the
>>>> initializer or the adding here? Plus that variable of course could
>>>> very well do with moving into this function.
>>>
>>> I have to say I find the existing logic here hard to parse but by the
>>> looks I don't think we need the + 1 once we switch to
>>> arch_fetch_and_add. Also could go without initializing next_handle to
>>> 1. Moving it into the function would not really accomplish anything
>>> other than style AFAICT?
>>
>> Well, limiting scope of things can be viewed as purely style, but I
>> think it's more than that: It makes intentions more clear and reduces
>> the chance of abuse (deliberate or unintentional).
> 
> I'm afraid that whatever is the outcome here, I will defer it to a
> further commit, since the purpose here is to be a non-functional
> change.

That's fine with me, but an ack from Tamas is still pending, unless I
missed something somewhere.

Jan

