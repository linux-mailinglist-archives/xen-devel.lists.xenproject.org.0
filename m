Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7BA2CA293
	for <lists+xen-devel@lfdr.de>; Tue,  1 Dec 2020 13:24:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.41908.75429 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk4hY-0006Hn-5Z; Tue, 01 Dec 2020 12:24:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 41908.75429; Tue, 01 Dec 2020 12:24:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kk4hX-0006HL-WD; Tue, 01 Dec 2020 12:24:12 +0000
Received: by outflank-mailman (input) for mailman id 41908;
 Tue, 01 Dec 2020 12:24:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Lvrb=FF=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kk4hW-0006HG-GI
 for xen-devel@lists.xenproject.org; Tue, 01 Dec 2020 12:24:10 +0000
Received: from mail-wr1-x433.google.com (unknown [2a00:1450:4864:20::433])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c74b28c0-51d0-4431-99b1-e62b69d739bc;
 Tue, 01 Dec 2020 12:24:09 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id s8so2309799wrw.10
 for <xen-devel@lists.xenproject.org>; Tue, 01 Dec 2020 04:24:09 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id z22sm2520668wml.1.2020.12.01.04.24.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 04:24:08 -0800 (PST)
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
X-Inumbo-ID: c74b28c0-51d0-4431-99b1-e62b69d739bc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=1VWtBrcKLPcRyiQcf3HkSHTQy7W9yax8VnwC0yLWqL4=;
        b=K8FYKEX1y9ESDaEmCqIdtZP/LgAECHiQz4EschbtiL4dx4ieZI2pcgFpK+S8STRLgy
         LhhXsm3DtwCRshkvBm8HkrQI1JwT2TDBKak21+8Rwjn9cwm+PCYDUnINLXwNJwt/6wR0
         zWlolcThkXg6oTUe9mG1s/vwDRafKG8RhIov1jd1n11j1JxIYVLNE9gZIlGInLQ1qX0B
         X6dmaUR9mOCg6vqpKctCblNaFVCdEs/8pqykJaZNH7a78t3k1lPWcmcOE2oK3O5bKVK1
         ppObSqyYdXIHB61/sWVJbR9CtnzztGOyduiefj6YzFKOVT+xtL9Vq++xT0MD1XWTReTl
         6v+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=1VWtBrcKLPcRyiQcf3HkSHTQy7W9yax8VnwC0yLWqL4=;
        b=jA1ipWoIGCTYsugE0Itg+gz1la3f4e43kHDwfZziViPwSa314GXlJSQR4LsHgmFXHL
         4w7nZAvBXrLEVdkVZC9qecjjMmv2vi1C4P04mmmxAzT5iG7RFeLqbZPq+dSxIJuaibM6
         y8aPG62b7rPLzZH5JvkXuorAZbvP1dVCqEs/D3/RQZcjBRCsGjaS1ejLAQT9tRonZWDq
         OE+Kn9pDbLep+2AFMa8A5q/8VI3VvADt+IFY/9HpG6HjQgEQkESx8EhazJTj9P9Hfz8h
         ecAIPjehEkaBwqFnT3TfhwF8zs9quYWhUdPqSuJ/4SUoQe/3dBfu4TC5fE3VK7wLdEP9
         wPmA==
X-Gm-Message-State: AOAM532W98r4OUfzkwaVhIL9Fv4KAHaUfqhmoLMLykVGZaivHSw+hIeg
	mm+M3wyQMn3KU+23u4tK/nk=
X-Google-Smtp-Source: ABdhPJyJjrhMArs/3bbPXMkpu011sVs1J0mB7GSLU+p7pzqCy4EGcV/cLZWe51HY/zGD1KCXxFLtPw==
X-Received: by 2002:a05:6000:82:: with SMTP id m2mr2089524wrx.314.1606825448753;
        Tue, 01 Dec 2020 04:24:08 -0800 (PST)
Subject: Re: [PATCH V3 19/23] xen/arm: io: Abstract sign-extension
To: Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com>
 <1606732298-22107-20-git-send-email-olekstysh@gmail.com>
 <878sai7e1a.fsf@epam.com> <cad0d7fe-3a9f-3992-9d89-8e9bb438dfbe@gmail.com>
 <93284ea1-e658-ffff-3223-174d633e38ad@suse.com>
 <d7b8f43d-2a59-6316-5609-0595b2a86045@xen.org>
 <932d7826-7e48-aaee-d566-44c384f84e1c@gmail.com>
 <a7e9a898-c096-2506-c944-b465f60d153c@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <458dc9d7-6ef7-6591-5212-48363bb56971@gmail.com>
Date: Tue, 1 Dec 2020 14:24:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a7e9a898-c096-2506-c944-b465f60d153c@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 01.12.20 14:13, Julien Grall wrote:
> Hi Oleksandr,

Hi Julien.


>
>>>>>>> --- a/xen/include/asm-arm/traps.h
>>>>>>> +++ b/xen/include/asm-arm/traps.h
>>>>>>> @@ -83,6 +83,30 @@ static inline bool VABORT_GEN_BY_GUEST(const 
>>>>>>> struct cpu_user_regs *regs)
>>>>>>>            (unsigned long)abort_guest_exit_end == regs->pc;
>>>>>>>    }
>>>>>>>    +/* Check whether the sign extension is required and perform 
>>>>>>> it */
>>>>>>> +static inline register_t sign_extend(const struct hsr_dabt 
>>>>>>> dabt, register_t r)
>>>>>>> +{
>>>>>>> +    uint8_t size = (1 << dabt.size) * 8;
>>>>>>> +
>>>>>>> +    /*
>>>>>>> +     * Sign extend if required.
>>>>>>> +     * Note that we expect the read handler to have zeroed the 
>>>>>>> bits
>>>>>>> +     * outside the requested access size.
>>>>>>> +     */
>>>>>>> +    if ( dabt.sign && (r & (1UL << (size - 1))) )
>>>>>>> +    {
>>>>>>> +        /*
>>>>>>> +         * We are relying on register_t using the same as
>>>>>>> +         * an unsigned long in order to keep the 32-bit assembly
>>>>>>> +         * code smaller.
>>>>>>> +         */
>>>>>>> +        BUILD_BUG_ON(sizeof(register_t) != sizeof(unsigned long));
>>>>>>> +        r |= (~0UL) << size;
>>>>>> If `size` is 64, you will get undefined behavior there.
>>>>> I think, we don't need to worry about undefined behavior here. Having
>>>>> size=64 would be possible with doubleword (dabt.size=3). But if "r"
>>>>> adjustment gets called (I mean Syndrome Sign Extend bit is set) then
>>>>> we deal with byte, halfword or word operations (dabt.size<3). Or I
>>>>> missed something?
>>>>
>>>> At which point please put in a respective ASSERT(), possibly amended
>>>> by a brief comment.
>>>
>>> ASSERT()s are only meant to catch programatic error. However, in 
>>> this case, the bigger risk is an hardware bug such as advertising a 
>>> sign extension for either 64-bit (or 32-bit) on Arm64 (resp. Arm32).
>>>
>>> Actually the Armv8 spec is a bit more blurry when running in AArch32 
>>> state because they suggest that the sign extension can be set even 
>>> for 32-bit access. I think this is a spelling mistake, but it is 
>>> probably better to be cautious here.
>>>
>>> Therefore, I would recommend to rework the code so it is only called 
>>> when len < sizeof(register_t).
>>
>> I am not sure I understand the recommendation, could you please 
>> clarify (also I don't see 'len' being used here).
>
> Sorry I meant 'size'. I think something like:
>
> if ( dabt.sign && (size < sizeof(register_t)) &&
>      (r & (1UL << (size - 1)) )
> {
> }
>
> Another posibility would be:
>
> if ( dabt.sign && (size < sizeof(register_t)) )
> {
>    /* find whether the sign bit is set and propagate it */
> }
>
> I have a slight preference for the latter as the "if" is easier to read.
>
> In any case, I think this change should be done in a separate patch (I 
> don't mint whether this is done after or before this one).

ok, I got it, thank you for the clarification. Of course, I will do that 
in a separate patch, since the current one is to avoid code duplication 
only. BTW, do you have comments on this patch itself?

-- 
Regards,

Oleksandr Tyshchenko


