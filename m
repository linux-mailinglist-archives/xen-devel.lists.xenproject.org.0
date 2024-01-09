Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF2D828468
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jan 2024 12:00:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.664403.1034607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rN9os-0004wn-AF; Tue, 09 Jan 2024 10:58:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 664403.1034607; Tue, 09 Jan 2024 10:58:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rN9os-0004v5-6v; Tue, 09 Jan 2024 10:58:54 +0000
Received: by outflank-mailman (input) for mailman id 664403;
 Tue, 09 Jan 2024 10:58:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RTBC=IT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rN9oq-0004uz-QE
 for xen-devel@lists.xenproject.org; Tue, 09 Jan 2024 10:58:52 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1291011c-aede-11ee-98ef-6d05b1d4d9a1;
 Tue, 09 Jan 2024 11:58:51 +0100 (CET)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2cd1232a2c7so32211621fa.0
 for <xen-devel@lists.xenproject.org>; Tue, 09 Jan 2024 02:58:51 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 z8-20020a056638318800b0046923df89easm569064jak.158.2024.01.09.02.58.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Jan 2024 02:58:50 -0800 (PST)
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
X-Inumbo-ID: 1291011c-aede-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704797931; x=1705402731; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/oJ1jHaEX1jsRipvPZ7jDGys4mLWZkwv+2Oo9F2Cbs8=;
        b=UehohF58g63TcsZ77mwu9e7YonuPr2Q4GsOE88Qi9YuJUyIfOV/l8uKhJXPFYJOC6v
         z6p46wRuLsOH43bk6oXvZmQ9EzYomOy1RY1quMEwVkiT0gdSJGnxCOHpghrdlBrQb8eg
         AZnahQmWfgbI1WhTYHKZY+W8pUKXXmJpVm81bKRag7hElAYm/9YEMO49/8HTzWRvAanq
         zKx+I4v5mQDpodPaHmJmfw6FHDFfPVfDth8b3ZWcsI4AQQnjbA1t9rOkPlgpcOq5kmus
         UjOhHEcoqNV5TT/W92huWiSpaUYW3dCIAsW1ftulD8+oDYM8A/9qprhQ9N8mgOVEoKzP
         y+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704797931; x=1705402731;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/oJ1jHaEX1jsRipvPZ7jDGys4mLWZkwv+2Oo9F2Cbs8=;
        b=TzLzv6WpsrscdRfpb4RBE8P8Z4tb1v61YEtT0APZHq+wRO4+lOMK2GYEvvsgL4yGnQ
         9HuQTaE3uJ1uJfXlloQOCOgI502ZM0R1jzr5BSn1MRLXzDAa0JPyGMY8GSY5N5ho6xs3
         3GbHNBsd0mks8EmCNCEbeMlORgRBdj7vmlOUL4eJAiOwAwOLRaLSb50cgMQgIRk91pTK
         cer8aYzxdvljEv04IKzwCEE0i/BehzKsm0QCAlFbqGfmS+f/HUAROoi4qJX9ojUMGxbU
         J0gEaIrhwGddlpiit2X+SgZNge6bOqexxGBQA3+rkWOSlKFP/0S1MCztaFE5eeTayNuf
         zvYQ==
X-Gm-Message-State: AOJu0Yz1x4w+o9FeD3zGT1YU3xstmekce6VK+RrXR6m1rY5lcEs3hTQN
	v3P/1BE1wta3Jphcq6QDTQjGnWg4bY+E
X-Google-Smtp-Source: AGHT+IHkUsgeGY1JUBt3Iqh8iXFuGqy3RvMo+jU0cIG3+9K7HZQfLEo1Q8yoSSxqjYBh8o9cLQk7qA==
X-Received: by 2002:a2e:b8c2:0:b0:2cd:4f03:ad4c with SMTP id s2-20020a2eb8c2000000b002cd4f03ad4cmr2042271ljp.80.1704797930851;
        Tue, 09 Jan 2024 02:58:50 -0800 (PST)
Message-ID: <77a1fdf8-f02d-4125-832c-f022d8750c87@suse.com>
Date: Tue, 9 Jan 2024 11:58:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] x86/HVM: split restore state checking from state
 loading
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <1e855575-8c0f-4222-80ba-e64305ea714b@suse.com>
 <05e69eea-79cc-4b3c-861b-855fa67c878a@suse.com> <ZYGqbboWvjVOGZkb@macbook>
 <48b5a33e-19c8-49fd-9682-17056e0acb00@suse.com> <ZZ0fVDLQb__IvgT3@macbook>
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
In-Reply-To: <ZZ0fVDLQb__IvgT3@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09.01.2024 11:26, Roger Pau Monné wrote:
> On Tue, Dec 19, 2023 at 04:24:02PM +0100, Jan Beulich wrote:
>> On 19.12.2023 15:36, Roger Pau Monné wrote:
>>> On Mon, Dec 18, 2023 at 03:39:55PM +0100, Jan Beulich wrote:
>>>> --- a/xen/arch/x86/domctl.c
>>>> +++ b/xen/arch/x86/domctl.c
>>>> @@ -379,8 +379,12 @@ long arch_do_domctl(
>>>>          if ( copy_from_guest(c.data, domctl->u.hvmcontext.buffer, c.size) != 0 )
>>>>              goto sethvmcontext_out;
>>>>  
>>>> +        ret = hvm_load(d, false, &c);
>>>> +        if ( ret )
>>>> +            goto sethvmcontext_out;
>>>> +
>>>>          domain_pause(d);
>>>> -        ret = hvm_load(d, &c);
>>>> +        ret = hvm_load(d, true, &c);
>>>
>>> Now that the check has been done ahead, do we want to somehow assert
>>> that this cannot fail?  AIUI that's the expectation.
>>
>> We certainly can't until all checking was moved out of the load handlers.
>> And even then I think there are still cases where load might produce an
>> error. (In fact I would have refused a little more strongly to folding
>> the prior hvm_check() into hvm_load() if indeed a separate hvm_load()
>> could have ended up returning void in the long run.)
> 
> I see, _load could fail even if all the data provided was correct, for
> example because the hypervisor is OoM?

That's the primary hypothetical cause for such a failure, yes.

>>>> @@ -291,50 +295,91 @@ int hvm_load(struct domain *d, hvm_domai
>>>>      if ( !hdr )
>>>>          return -ENODATA;
>>>>  
>>>> -    rc = arch_hvm_load(d, hdr);
>>>> -    if ( rc )
>>>> -        return rc;
>>>> +    rc = arch_hvm_check(d, hdr);
>>>
>>> Shouldn't this _check function only be called when real == false?
>>
>> Possibly. In v4 I directly transformed what I had in v3:
>>
>>     ASSERT(!arch_hvm_check(d, hdr));
>>
>> I.e. it is now the call above plus ...
>>
>>>> +    if ( real )
>>>> +    {
>>>> +        struct vcpu *v;
>>>> +
>>>> +        ASSERT(!rc);
>>
>> ... this assertion. Really the little brother of the call site assertion
>> you're asking for (see above).
>>
>>>> +        arch_hvm_load(d, hdr);
>>>>  
>>>> -    /* Down all the vcpus: we only re-enable the ones that had state saved. */
>>>> -    for_each_vcpu(d, v)
>>>> -        if ( !test_and_set_bit(_VPF_down, &v->pause_flags) )
>>>> -            vcpu_sleep_nosync(v);
>>>> +        /*
>>>> +         * Down all the vcpus: we only re-enable the ones that had state
>>>> +         * saved.
>>>> +         */
>>>> +        for_each_vcpu(d, v)
>>>> +            if ( !test_and_set_bit(_VPF_down, &v->pause_flags) )
>>>> +                vcpu_sleep_nosync(v);
>>>> +    }
>>>> +    else if ( rc )
>>>> +        return rc;
> 
> The issue I see with this is that when built with debug=n the call to
> arch_hvm_check() with real == true is useless, as the result is never
> evaluated - IOW: would be clearer to just avoid the call altogether.

Which, besides being imo slightly worse for then having two call sites,
puts me in a difficult position: It may not have been here, but on
another patch (but I think it was an earlier version of this one)
where Andrew commented on

    ASSERT(func());

as generally being a disliked pattern, for having a "side effect" in
the expression of an assertion. Plus the call isn't pointless even in
release builds, because of the log messages issued: Them appearing
twice in close succession might be a good hint of something fishy
going on.

Jan

