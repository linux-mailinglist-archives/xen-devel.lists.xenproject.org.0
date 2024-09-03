Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 623BE969632
	for <lists+xen-devel@lfdr.de>; Tue,  3 Sep 2024 09:54:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.788726.1198190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slOML-0002q5-9b; Tue, 03 Sep 2024 07:53:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 788726.1198190; Tue, 03 Sep 2024 07:53:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slOML-0002oV-6H; Tue, 03 Sep 2024 07:53:53 +0000
Received: by outflank-mailman (input) for mailman id 788726;
 Tue, 03 Sep 2024 07:53:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8q7v=QB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1slOMJ-0002oP-Ea
 for xen-devel@lists.xenproject.org; Tue, 03 Sep 2024 07:53:51 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a794dbf1-69c9-11ef-99a1-01e77a169b0f;
 Tue, 03 Sep 2024 09:53:49 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a86910caf9cso1035568466b.1
 for <xen-devel@lists.xenproject.org>; Tue, 03 Sep 2024 00:53:49 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a89892223dbsm644112666b.202.2024.09.03.00.53.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2024 00:53:48 -0700 (PDT)
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
X-Inumbo-ID: a794dbf1-69c9-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725350029; x=1725954829; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=87/yEiyqdST7u7bqP6CeV349Mjoz6tSSVOlY8vgn7kw=;
        b=XzqHsTfgS+EC8o9oVs0JIcQHLW4MNrNG1GrxHHigM9/xgZLPD3LOhLA8AFNQR0hlRy
         PXRTDlfVoXZKJwl6B7h4XsBT78vOZpR90SabaMGnx1Uqs1RVxnW433c/RrniBN04h15J
         rpgSedJA/d0eVUJrD44IqRG+Jg9nvDmlLILOC5U9uekL/logNfJzC9ZoUidzQYE8Oe6c
         sfykXWnEXqp5S6PiKWMfXfSdHfOguwvi+A+TESxvkit1p8Eek2LHfLEW710Kmhm2NKJT
         lzIvbMkDjF1Ghaf/mhytIprWdVJpSn6x6ly0SfxuUqn2FWGTMWRLv+gqJr2q1YS4BOyH
         XBsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725350029; x=1725954829;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=87/yEiyqdST7u7bqP6CeV349Mjoz6tSSVOlY8vgn7kw=;
        b=bvlcj4+BY4i1Ww+IUZcrRavoWWIfL7WUBhrpHsGhn9R4rtR+S+6NuWiwclYLqefk6i
         +OAordxlE3+jCE6p2JJmHsYH7ih0H+3JoPkyuRVrjbxJjKATPMxMm6EkfBaHUYmg/gUI
         6COaKCQd1AOBcA0i9NaK+eNH2Xmnt3cMHk0eGxhuQJB2+DjjgEXIU8bR8ZX7CVasZZeN
         X3ybsg4Wb8ncBdPUrKlqLxfznYTv0pf5mXfwURH8DM5FQzisAfYjc93IHmBzuws2TDhQ
         T7fyxUAZN6+SADP6J5x66XexH4MViNJoFnM93qtOwf2w1gBmMCFcZ8aNvS3CkdMroVLq
         8/eg==
X-Forwarded-Encrypted: i=1; AJvYcCX/uHLTDFee37fHHGIB9O81Q2JiU2OQgw+6Njw1T/XI9Tmw/7VUhddcZ55huvNjrsvuXuLLKk0fbsQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwWFdC8ueaY9VuNVo5RTXHMiJky97NbfVNtCuR3ntGvmZWsR/BZ
	Cw8Idbc0Gxx0oP5ufnjPC9QSvzboYZTjywVTft4tMVLLF3TzpPGR+DM2lao2cA==
X-Google-Smtp-Source: AGHT+IHF3UJx7ZoIypZNMbNQ194HNhd0KX8FhsIdlGAy0HTasttsk394+/iaYkPstkUtjsbrrgKnmA==
X-Received: by 2002:a17:907:1ca7:b0:a7d:895b:fd with SMTP id a640c23a62f3a-a898231fd75mr1628846966b.6.1725350028678;
        Tue, 03 Sep 2024 00:53:48 -0700 (PDT)
Message-ID: <d7cfa284-f764-46a0-ac2e-e5f928a043ad@suse.com>
Date: Tue, 3 Sep 2024 09:53:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] x86/time: split CMOS time fetching into wrapper
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240830095220.49473-1-roger.pau@citrix.com>
 <20240830095220.49473-2-roger.pau@citrix.com>
 <f193e088-18fb-4e68-a935-720cc65f3947@suse.com>
 <Zta8QLwmHcBWyJd6@macbook.local>
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
In-Reply-To: <Zta8QLwmHcBWyJd6@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.09.2024 09:35, Roger Pau Monné wrote:
> On Tue, Sep 03, 2024 at 08:24:18AM +0200, Jan Beulich wrote:
>> On 30.08.2024 11:52, Roger Pau Monne wrote:
>>> @@ -1285,33 +1270,56 @@ static unsigned long get_cmos_time(void)
>>>          } while ( (CMOS_READ(RTC_FREQ_SELECT) & RTC_UIP) &&
>>>                    t2 < MILLISECS(3) );
>>>  
>>> -        __get_cmos_time(&rtc);
>>> +        __get_cmos_time(rtc);
>>>  
>>>          spin_unlock_irqrestore(&rtc_lock, flags);
>>>  
>>> -        if ( likely(!cmos_rtc_probe) ||
>>> -             t1 > SECONDS(1) || t2 >= MILLISECS(3) ||
>>> -             rtc.sec >= 60 || rtc.min >= 60 || rtc.hour >= 24 ||
>>> -             !rtc.day || rtc.day > 31 ||
>>> -             !rtc.mon || rtc.mon > 12 )
>>> -            break;
>>> +        if ( likely(!cmos_rtc_probe) )
>>> +            return true;
>>> +
>>> +        if ( t1 > SECONDS(1) || t2 >= MILLISECS(3) ||
>>> +             rtc->sec >= 60 || rtc->min >= 60 || rtc->hour >= 24 ||
>>> +             !rtc->day || rtc->day > 31 ||
>>> +             !rtc->mon || rtc->mon > 12 )
>>> +            return false;
>>>  
>>>          if ( seconds < 60 )
>>>          {
>>> -            if ( rtc.sec != seconds )
>>> -            {
>>> -                cmos_rtc_probe = false;
>>
>> This clearing of the variable is lost, which looks wrong to me.
> 
> Note the code in get_cmos_time() is modified, so the variable is no
> longer used past the call to read_cmos_time().  Instead the signaling
> of whether the CMOS is functional or not is done using the return
> value of the newly introduced read_cmos_time() function.

I wasn't concerned of the further processing on the 1st invocation, but
of the behavior of the 2nd invocation. But yes, there the flag will end
up being cleared because of the FADT flag also having been cleared. Not
easily visible, though. Could minimally do with a remark in the
description.

Jan

