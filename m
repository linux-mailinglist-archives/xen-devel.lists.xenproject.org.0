Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E630CA04523
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2025 16:50:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.866579.1277887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVBpv-0002Wb-JW; Tue, 07 Jan 2025 15:49:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 866579.1277887; Tue, 07 Jan 2025 15:49:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVBpv-0002V8-Gc; Tue, 07 Jan 2025 15:49:43 +0000
Received: by outflank-mailman (input) for mailman id 866579;
 Tue, 07 Jan 2025 15:49:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1r68=T7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVBpu-0002V2-5c
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2025 15:49:42 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01989579-cd0f-11ef-a0df-8be0dac302b0;
 Tue, 07 Jan 2025 16:49:40 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-38a25d4b9d4so5910075f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 07 Jan 2025 07:49:40 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1fa2bdfbsm49950718f8f.102.2025.01.07.07.49.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 07:49:39 -0800 (PST)
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
X-Inumbo-ID: 01989579-cd0f-11ef-a0df-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736264980; x=1736869780; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Nk0R7AxUDUa2PYVAgf2NtZ4S4CBkIXwjLjO0HYKmuaE=;
        b=QoPTIHMXOynVjyUL6CPW5x3mtk75RckGvAV0u5u0eibvR8gTjeMYKguSIeo5886++2
         SJVz3t1wxyBhhqQRaJgm4tR75uiXMn7pJUmdXK6RqD2FgNKiuSricbHPwa79VQ0zixE5
         32I16I099MP1eoK93yN2zhjzc4FFmxPaY0sPWROIy1V+fls5MbV1Ot0ir2+cVkAjTAl6
         +VuPwauPrtvdIWMlCjX/Har3iN/AdUYKvLv6+lHdyjkBuemubHA0yj/d8OD1KdUyYgzm
         FEzIWTpHuky49YCQiFLG67nvNcQRzhTR3fEF5xb14U6u3zY00xfaZmBwYc5N6tbQuQTv
         CPDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736264980; x=1736869780;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nk0R7AxUDUa2PYVAgf2NtZ4S4CBkIXwjLjO0HYKmuaE=;
        b=DPyJMaGm0DLjB8AYUDS1nMFpuR5sho1H2c/RNCeHntG24xbLAX4whVy8ukhdZSKlgh
         Pbszaj9UyAZb4PNrBp4mhOl9rNROlTtFDplRzBRH4BOs72/6JPeoSpRm0da3zeS9TXl0
         fbpoAVoZ15kOClo2jw8dFz2DXtvQWxQZ13v8BOHv4c8JSTSyGX+2ejyH0bFk953ka9Wp
         7kfznUgv7jjF46y7sSmNRsbmkxCbOdLT8773QsmBQrbdUoeEv3708JTuU/nCjUCanE3m
         mOaLUO2cljqSnNLq4GWXp+fGGy+gnfstzmGatYjYlBCaxIGMITsNMIQZYc/UUUanLtX/
         HYWg==
X-Forwarded-Encrypted: i=1; AJvYcCUA8Qilmz6rKWgElI5Xd/a9VAbO6VqwNwrgS10zZL0kiGxbQ/8U+gRXKkY85Hs+nmW27mqSrILXMLA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz3pxn6/zPIGGDA5n5Y0YjT7Ohy8YuE5zSeODjxMCZ23wh1llp2
	rPqAUPyXwVgaE0bQrD/EnO7NHY3fgUDqhOZ+glIO+SEujCx7Jcwf5crEcxKugw==
X-Gm-Gg: ASbGnct0I4qyNHcbRd1KPst11AGtIqYISGzRWtpLq5fMQuRC4JuWYOHVGsStgXbQQK5
	jUJfnP6gQ+1tzb+HPAjivE5pozqday9d7KMIBy1mf9bF/PnQrlT97/Le/IuIsX3cfkudmvLZs3H
	my2g2+i9JR9bNrYCQyxKQWoFvnME5aKcyKBl+Ps2Tvc17Puxu7AcOAKpVzZmbbaRg/B69vwlfPc
	WAYE2TbmTtJ7bgDafA//2u1UQhMX7dh3zyEpfexo2KqEx11ovJGno8jyGHoRMqxUuGyzxV+/tIc
	dtuuJKV0kJWZH4VAyef6Fj93jiXBjnrxLd491i3BsA==
X-Google-Smtp-Source: AGHT+IESBMPXOWpAWytJe9UWFoA5sg6wrgOsstaApZPO8zUg9kSMPqIYmVK0Y1RXzv5JGreK8/cCIA==
X-Received: by 2002:a05:6000:1543:b0:385:f195:26f with SMTP id ffacd0b85a97d-38a221fb043mr57598990f8f.19.1736264980249;
        Tue, 07 Jan 2025 07:49:40 -0800 (PST)
Message-ID: <270984e8-2296-48b9-b45c-92ab28b4e6dd@suse.com>
Date: Tue, 7 Jan 2025 16:49:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/7] xen/events: fix race with
 set_global_virq_handler()
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20250107101711.5980-1-jgross@suse.com>
 <20250107101711.5980-2-jgross@suse.com>
 <c7ed9380-a4a1-4576-af56-2949d80cfd92@suse.com>
 <c00886ec-184c-4a82-8093-4fc9b470ea1b@suse.com>
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
In-Reply-To: <c00886ec-184c-4a82-8093-4fc9b470ea1b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.01.2025 16:37, Juergen Gross wrote:
> On 07.01.25 16:23, Jan Beulich wrote:
>> On 07.01.2025 11:17, Juergen Gross wrote:
>>> --- a/xen/common/event_channel.c
>>> +++ b/xen/common/event_channel.c
>>> @@ -979,6 +979,7 @@ void send_global_virq(uint32_t virq)
>>>   int set_global_virq_handler(struct domain *d, uint32_t virq)
>>>   {
>>>       struct domain *old;
>>> +    int rc = 0;
>>>   
>>>       if (virq >= NR_VIRQS)
>>>           return -EINVAL;
>>> @@ -992,14 +993,23 @@ int set_global_virq_handler(struct domain *d, uint32_t virq)
>>>           return -EINVAL;
>>>   
>>>       spin_lock(&global_virq_handlers_lock);
>>> -    old = global_virq_handlers[virq];
>>> -    global_virq_handlers[virq] = d;
>>> +
>>> +    if ( d->is_dying != DOMDYING_alive )
>>> +    {
>>> +        old = d;
>>> +        rc = -EINVAL;
>>> +    }
>>
>> While I can see how this eliminates the zombie domain aspect, this doesn't
>> fully eliminate the race. Doing so would require (also) using the domain's
>> event lock. Assuming we're okay with the remaining race, imo a code comment
>> would be needed to state this (including the fact that it's then
>> unpredictable whether this operation might still succeed for a domain
>> already having d->is_dying != DOMDYING_alive).
> 
> AFAIU you mean that it is still possible to set a domain to handle a virq
> when it is in the process of going down, especially if is_dying is set just
> after it has been tested to be DOMDYING_alive?
> 
> I don't see this being a problem, as the same would happen if the domain
> would go down just a millisecond later. This is something we will never be
> able to handle.

Right, but the sequence of events in the case you mention is different: The
insertion into the array would still happen while the domain isn't marked
dying.

> And after all the call of clear_global_virq_handlers() will now reset the
> handling domain to the hardware domain in all cases.

Of course, but in the meantime an event may be sent to such a domain already
marked dying. That likely isn't going to cause problems, but is unexpected
with what description here says is being addressed.

>> Plus the way you do it the early success path remains; ideally that case
>> would also fail for an already dying domain.
> 
> Same again: clear_global_virq_handlers() will reset the handling domain.

Right.

In summary: As indicated, we may be okay with the remaining race, but then
we also should be making clear that we've decided to leave it at that.
Hence my earlier request: If we accept this, say (and briefly justify) this
in a code comment.

Jan

