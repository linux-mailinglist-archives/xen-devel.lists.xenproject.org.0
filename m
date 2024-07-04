Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2D4926FB8
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jul 2024 08:39:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.753530.1161711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPG6v-0002AO-0l; Thu, 04 Jul 2024 06:38:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 753530.1161711; Thu, 04 Jul 2024 06:38:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sPG6u-00028Z-U3; Thu, 04 Jul 2024 06:38:28 +0000
Received: by outflank-mailman (input) for mailman id 753530;
 Thu, 04 Jul 2024 06:38:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=V0d6=OE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sPG6u-00028T-6e
 for xen-devel@lists.xenproject.org; Thu, 04 Jul 2024 06:38:28 +0000
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [2a00:1450:4864:20::430])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04313c00-39d0-11ef-8776-851b0ebba9a2;
 Thu, 04 Jul 2024 08:38:26 +0200 (CEST)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3678aa359b7so862831f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Jul 2024 23:38:26 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7080256af5asm11454597b3a.56.2024.07.03.23.38.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Jul 2024 23:38:24 -0700 (PDT)
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
X-Inumbo-ID: 04313c00-39d0-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720075105; x=1720679905; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=avJyP+Quku7VqET8tmEwXfNBzilUGwWXw5ynaA0tX8Y=;
        b=XASo+Qi5+/sv/DiCIV2ShZPxzba7sATeCAKs2Sdv6vAwDvWv1+RnjXoV9ueP+yc9Av
         uXRcvqdlZuK809CEs62NzsVoLWi7By26htTG03XYpwb4c3j2kmFHBj4nl2ndJWGwZrxf
         Fh9H3YTNMiYujNZu8C87anU3spIIRkQzSjXJG2v5Zr6/pUolnf+NUkN5Euop+uvDDx3C
         H8KjuvQP1xR0ufzmfBlXwDqiGU1LuSD9tnWVoS/4om7m1ggwMuuj0jHIPZYNriN/Eqbh
         ldkOOz7EmmsVIAxTRywugaSOehi9D0/Z+CNp/hJAHeO9PDz4UjrH+r91lB8FMsEKkHH+
         /6kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720075105; x=1720679905;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=avJyP+Quku7VqET8tmEwXfNBzilUGwWXw5ynaA0tX8Y=;
        b=sOI3EzAzOIRIIqazM7gkfccloXboWix9dke5U69BjBI34QKXjdwJfd++WAihAl5cFM
         TqZN0cNaGvMkHrF09OVjn37SPWhNwCeTnOTNAfCenMr4tMt06+s1GgHQ5od3Lo+pd2JF
         Nj0mqx8ebym5KiAJo2YaQKNHQ1qTIqc6QojQr4a2qSxFtOUwpldBVrCd/7pn3xDPCrYy
         FOqGYk1ZP7mHg6DYEF92WGY8R+pXOAhnnaucf+2j+3btTlhu6ZH24W0QE4y3zJA14eL6
         6R/wmGPHWEQASl9UCxuBzeAzBwlOxXOXF1HNGFS7OCQu1H7xy5yDczfWB6JorJylToId
         1NaA==
X-Forwarded-Encrypted: i=1; AJvYcCXVjeOOEEMVMtrfL9hutVNem8opZgegUDclTwsWyQe1SIhthkaxv78Zl53dwn3HgydK/xj5Uog1PsrdSfr8mjusMWYqj77ez9P9C+2/Hsk=
X-Gm-Message-State: AOJu0YxIl56veYFlPrcFI0eLrSi+Zj7kyVO1ZXIseWXkRv2Pa/AiQoUR
	8IB9C74IeeclD3eyeKKY/Xn3AXNLEr7v2aY38U5vEJNNlPZV92Ir1QJ8EKGEEA==
X-Google-Smtp-Source: AGHT+IHxJCvK4HX6pFwdfsHmLcBzFkKKN/1sADlncuMGX3+BTvm+o+saOEy/I5U3YAkWh63yGCEIew==
X-Received: by 2002:adf:ab08:0:b0:363:1c9d:d853 with SMTP id ffacd0b85a97d-3679f76ff77mr440935f8f.32.1720075105277;
        Wed, 03 Jul 2024 23:38:25 -0700 (PDT)
Message-ID: <a3721ce4-b474-45d3-b2e7-4f2fd72544bf@suse.com>
Date: Thu, 4 Jul 2024 08:38:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v11 2/8] x86/pvh: Allow (un)map_pirq when dom0 is PVH
To: "Chen, Jiqian" <Jiqian.Chen@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Juergen Gross <jgross@suse.com>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 "Hildebrand, Stewart" <Stewart.Hildebrand@amd.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20240630123344.20623-1-Jiqian.Chen@amd.com>
 <20240630123344.20623-3-Jiqian.Chen@amd.com>
 <9a311ee0-dcf2-4609-aced-7f57b322da5f@suse.com>
 <BL1PR12MB5849C3882D31620ADAC55ADAE7DC2@BL1PR12MB5849.namprd12.prod.outlook.com>
 <d1b22fa7-870e-4968-ba5d-c5d6fccb0af7@suse.com>
 <BL1PR12MB5849C0E9310A505E95937BDEE7DE2@BL1PR12MB5849.namprd12.prod.outlook.com>
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
In-Reply-To: <BL1PR12MB5849C0E9310A505E95937BDEE7DE2@BL1PR12MB5849.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.07.2024 04:56, Chen, Jiqian wrote:
> On 2024/7/2 16:44, Jan Beulich wrote:
>> On 02.07.2024 05:15, Chen, Jiqian wrote:
>>> On 2024/7/1 15:44, Jan Beulich wrote:
>>>> On 30.06.2024 14:33, Jiqian Chen wrote:
>>>>> --- a/xen/arch/x86/physdev.c
>>>>> +++ b/xen/arch/x86/physdev.c
>>>>> @@ -323,6 +323,13 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>>>          if ( !d )
>>>>>              break;
>>>>>  
>>>>> +        /* Prevent mapping when the subject domain has no X86_EMU_USE_PIRQ */
>>>>> +        if ( is_hvm_domain(d) && !has_pirq(d) )
>>>>> +        {
>>>>> +            rcu_unlock_domain(d);
>>>>> +            return -EOPNOTSUPP;
>>>>> +        }
>>>>> +
>>>>>          ret = physdev_map_pirq(d, map.type, &map.index, &map.pirq, &msi);
>>>>>  
>>>>>          rcu_unlock_domain(d);
>>>>> @@ -346,6 +353,13 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>>>>>          if ( !d )
>>>>>              break;
>>>>>  
>>>>> +        /* Prevent unmapping when the subject domain has no X86_EMU_USE_PIRQ */
>>>>> +        if ( is_hvm_domain(d) && !has_pirq(d) )
>>>>> +        {
>>>>> +            rcu_unlock_domain(d);
>>>>> +            return -EOPNOTSUPP;
>>>>> +        }
>>>>> +
>>>>>          ret = physdev_unmap_pirq(d, unmap.pirq);
>>>>>  
>>>>>          rcu_unlock_domain(d);
>>>>
>>>> If you did go look, you will have noticed that we use "return" in the middle
>>>> of this function only very sparingly (when alternatives would result in more
>>>> complicated code elsewhere). I think you want to avoid "return" here, too,
>>>> and probably go even further and avoid the extra rcu_unlock_domain() as well.
>>>> That's easily possible to arrange for (taking the latter case as example):
>>>>
>>>>         /* Prevent unmapping when the subject domain has no X86_EMU_USE_PIRQ */
>>>>         if ( !is_hvm_domain(d) || has_pirq(d) )
>>>>             ret = physdev_unmap_pirq(d, unmap.pirq);
>>>>         else
>>>>             ret = -EOPNOTSUPP;
>>>>
>>>>         rcu_unlock_domain(d);
>>>>
>>>> Personally I would even use a conditional operator here, but I believe
>>>> others might dislike its use in situations like this one.
>>>>
>>>> The re-arrangement make a little more noticeable though that the comment
>>>> isn't quite right either: PV domains necessarily have no
>>>> X86_EMU_USE_PIRQ. Maybe "... has no notion of pIRQ"?
>>>
>>> Or just like below?
>>>
>>>         /*
>>>          * Prevent unmapping when the subject hvm domain has no
>>>          * X86_EMU_USE_PIRQ
>>>          */
>>>         if ( is_hvm_domain(d) && !has_pirq(d) )
>>>             ret = -EOPNOTSUPP;
>>>         else
>>>             ret = physdev_unmap_pirq(d, unmap.pirq);
>>
>> No objection to the slightly changed comment. The code alternative you
>> present is of course functionally identical, yet personally I prefer to
>> have the "good" case on the "if" branch and the "bad" one following
>> "else". I wouldn't insist, though.
> OK, will change "good" case on the "if" branch.
> Do I need to change "!is_hvm_domain(d)" to "is_pv_domain(d)" ?
> And then have:
> 
>         /* Only unmapping when the subject domain has a notion of PIRQ */
>         if ( is_pv_domain(d) || has_pirq(d) )
>             ret = physdev_unmap_pirq(d, unmap.pirq);
>         else
>             ret = -EOPNOTSUPP;

I for one would prefer if you kept using is_hvm_domain(), for being more
precise in this situation.

Jan

