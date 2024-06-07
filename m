Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9AF9003BC
	for <lists+xen-devel@lfdr.de>; Fri,  7 Jun 2024 14:37:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.736526.1142620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFYpD-0002Ti-Vl; Fri, 07 Jun 2024 12:36:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 736526.1142620; Fri, 07 Jun 2024 12:36:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sFYpD-0002Rl-SX; Fri, 07 Jun 2024 12:36:07 +0000
Received: by outflank-mailman (input) for mailman id 736526;
 Fri, 07 Jun 2024 12:36:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G7b/=NJ=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sFYpB-0002RJ-W8
 for xen-devel@lists.xenproject.org; Fri, 07 Jun 2024 12:36:06 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7dd65613-24ca-11ef-b4bb-af5377834399;
 Fri, 07 Jun 2024 14:35:58 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-5295eb47b48so2606734e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 07 Jun 2024 05:35:58 -0700 (PDT)
Received: from [10.125.142.153] ([195.23.45.50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5d297b3sm3955459f8f.11.2024.06.07.05.35.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Jun 2024 05:35:57 -0700 (PDT)
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
X-Inumbo-ID: 7dd65613-24ca-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1717763758; x=1718368558; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qyFVA/YJxpXuaxVqjWyhVVSmoMFJCUIPYQc7kLaBNYc=;
        b=Yf5NehunkjXQPiAC0EGDMQWlaYevzMudPUHZdocV+SJCbII75Bjt4//JMXUEfj9wuI
         0IWrI4/GFLO2UPh8I2rzoFvq/KWIIpEZj0kk519mSsqSQQkZQfiBYFWkiGRPEOcLQ+hb
         nhF7fBaKa1aTNVGZ0IWvJVynxlkPqrjZSHYMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717763758; x=1718368558;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qyFVA/YJxpXuaxVqjWyhVVSmoMFJCUIPYQc7kLaBNYc=;
        b=s0AHnY/q6ydzsHuAmFMK9r3ijqv+k1WFTQ22VuxT6xKQazZwe0rWxXLqXBo4zz/R7R
         xILm2AoPYUIgoQWi8SIbq6fngwmpgd2Y6FRMsyrn3q1e8JMgQyQNiuA7uUluhy4yyVTW
         210r8wnDLsB+lHnfMMcnAcj0JHuIvEROTkStR04VK9wOkF4yIiSgBAdJSzY4DmLr3Vo8
         MXk3p/r3gKB0lwW9lyAbzbVvlIa4EVwOEGVXXvi6QVxtP+wT3E7pIniOl3gQ9yBG5DOP
         W8B2/+szIfHVsUK1qb7wdtBhWzgWBydib3er/ZAy5phUooqE6XiueJLNWMmgcGbzQG2V
         Vx/A==
X-Forwarded-Encrypted: i=1; AJvYcCUhixif5lLRkfoRVmjnRt6R+b5FfQEtIcWGev56dkMjH62sf8mz3QNNnbfVeUMU2CsiLX7TYQk6Yu5DYH7i6ZQmbybpmcUT/EfUlUB8Z8U=
X-Gm-Message-State: AOJu0YydHrCgcV3uv2ncgLlhfpSxqq974f/jkvDSlz9flrl/52VbvgEx
	n8KZI7cJ1FmDBEoq9hFhRxkaRDQvjkTkexXB0dV/JcmQshyz//pxt4rNo1fhfUU=
X-Google-Smtp-Source: AGHT+IHjTbSMmt+YrVEJqQHm1gjLG8K/75BBhPpOkGnkohWMtWDh20IR41tGNmQR7HAHcyP4rnTWcQ==
X-Received: by 2002:a05:6512:202f:b0:52b:7c3a:423e with SMTP id 2adb3069b0e04-52bb9f7c802mr1360734e87.20.1717763757849;
        Fri, 07 Jun 2024 05:35:57 -0700 (PDT)
Message-ID: <1745d84b-59b7-4f90-a0a8-5d459b83b0bc@citrix.com>
Date: Fri, 7 Jun 2024 13:35:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: vcpumask_to_pcpumask() case study
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <3bb4e3fa-376b-4641-824d-61864b4e1e8e@citrix.com>
 <c5951643-5172-4aa1-9833-1a7a0eebb540@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <c5951643-5172-4aa1-9833-1a7a0eebb540@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03/06/2024 10:19 pm, Jan Beulich wrote:
> On 01.06.2024 20:50, Andrew Cooper wrote:
>> One of the followon items I had from the bitops clean-up is this:
>>
>> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
>> index 648d6dd475ba..9c3a017606ed 100644
>> --- a/xen/arch/x86/mm.c
>> +++ b/xen/arch/x86/mm.c
>> @@ -3425,7 +3425,7 @@ static int vcpumask_to_pcpumask(
>>              unsigned int cpu;
>>  
>>              vcpu_id = ffsl(vmask) - 1;
>> -            vmask &= ~(1UL << vcpu_id);
>> +            vmask &= vmask - 1;
>>              vcpu_id += vcpu_bias;
>>              if ( (vcpu_id >= d->max_vcpus) )
>>                  return 0;
>>
>> which yields the following improvement:
>>
>>   add/remove: 0/0 grow/shrink: 0/1 up/down: 0/-34 (-34)
>>   Function                                     old     new   delta
>>   vcpumask_to_pcpumask                         519     485     -34
> Nice. At the risk of getting flamed again for raising dumb questions:
> Considering that elsewhere "trickery" like the &= mask - 1 here were
> deemed not nice to have (at least wanting to be hidden behind a
> suitably named macro; see e.g. ISOLATE_LSB()), wouldn't __clear_bit()
> be suitable here too, and less at risk of being considered "trickery"?

__clear_bit() is even worse, because it forces the bitmap to be spilled
to memory.  It hopefully wont when I've given the test/set helpers the
same treatment as ffs/fls.

I'm not really a fan of the bithack.  Like the others, it's completely
unintuitive unless you know it.

However, the improvements speak for themselves and in this one case, the
best chance of people recognising it is in full; hiding any part behind
a macro (of any name) obscures things further.

> But yes, that would eliminate the benefit of making the bit clearing
> independent of the ffsl() result. And personally I'm fine anyway with
> the form as suggested.
>
>> While I (the programmer) can reason the two expressions are equivalent,
>> the compiler can't,
> Why is it you think it can't? There's no further knowledge that you
> as a human need to rely on for this, afaics. If ffsl() uses the
> built-in (as it now does), the compiler has full insight into what's
> going on. It's just that compiler engineers may not deem it worth the
> effort to carry out such a special-case optimization.

On x86, it's a block of asm, not the builtin.

But even with the builtin, just because there is a builtin transforming
a common expression into efficient assembly, doesn't mean there's
semantic reasoning about the result.

https://godbolt.org/z/eah1374a1

I can't find any way to get any compiler to reason about bit in order to
avoid the shift (or rotate, for Clang).

~Andrew

