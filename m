Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEBE9457EF
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2024 08:07:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.770155.1181083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZlRE-00038q-8T; Fri, 02 Aug 2024 06:06:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 770155.1181083; Fri, 02 Aug 2024 06:06:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sZlRE-00037M-59; Fri, 02 Aug 2024 06:06:52 +0000
Received: by outflank-mailman (input) for mailman id 770155;
 Fri, 02 Aug 2024 06:06:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bU9L=PB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sZlRC-00037E-Rf
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2024 06:06:50 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6810abed-5095-11ef-bc03-fd08da9f4363;
 Fri, 02 Aug 2024 08:06:50 +0200 (CEST)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a7a8e73b29cso643761866b.3
 for <xen-devel@lists.xenproject.org>; Thu, 01 Aug 2024 23:06:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7dc9bc3ca6sm57989266b.20.2024.08.01.23.06.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Aug 2024 23:06:48 -0700 (PDT)
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
X-Inumbo-ID: 6810abed-5095-11ef-bc03-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1722578809; x=1723183609; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RoH/DL+nQ38hS1GDHQNCm2eEyYeGyiIBgf7i+VwjW7M=;
        b=BjZb+KGwsh339d6BpUAumRwrara2Db3ZGArPqK4yQDFovvogXVmuODqxX/FDdjh/sp
         ee9nOzMxKjMgsvONI0UqUs/82RgCJMXHsvP7nLifrfFaatZXY2YhY8kaYdPjsOg/oLiq
         mplmqB5uca/wJGtoI1BY2z7S7RkT/yd2aztrDpVYePFvt706m3fddZiXXYEdMkHnJEK1
         gb9gNQAqwPliw79oN882c4g13nSLUprdVHpVOso7r1n5SQ7gL1R4yFbi/AyKgW7Sl3R8
         0KSuWrmuNs6LNBMrvEmmJFfz2n+atwQoAEHvErE5crEQmYINzduXV3jWUUmdlFfmAB1h
         tgIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722578809; x=1723183609;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RoH/DL+nQ38hS1GDHQNCm2eEyYeGyiIBgf7i+VwjW7M=;
        b=b2AUKDsYYQwWvIbBjJ57A6dhprUvclBFpIPvcHMyGfX2YrQ7DND2l6qEz53/6rXX7L
         Q4f3FsQBMgexGT52d6iRm4TEXXX33+tjlJsXq+XqDFgJiYPQCJVuSwswyRbfyBfOycHZ
         oKwnwl71pZCztkNSNEhIL9AqrIW956Mv4Inw8w2hQhBHi/YqD9q9C6gmNT59ezBq5ufM
         2clRpoC0QrqLSY1oFBKY5H8cu/z0UKoWyIIL36X0KmS9pSBCUFQm5JmgsTwSrw2m2RWM
         d2M5XlSoL0qDHUKovcNOR8teHKPd1S5LHa2tTYRIvrcNT0AKtvlQYF8npG8l16AbJBbj
         r17w==
X-Forwarded-Encrypted: i=1; AJvYcCUKElNVB6tSCMFg8ESWZF75VYloi2hVZ4G2bQhH1URY2JDxjeHOPZOvPPP7Z0XSafVan3qLkYvn+BZLbA2sl5Urh32nsUUwLlyVbY62WoY=
X-Gm-Message-State: AOJu0Yz2UYITBq8xJ0thBmnnf8G8LMITGSMUiUKqIAYm2NPr3+inqSHZ
	DCBp9B1CR7BvOVZgTnfCo6qMNgQdP84J66vmG5Js22+CcJ2nPz0Xx0i2Y4IaIQ==
X-Google-Smtp-Source: AGHT+IFhiJAkQLqWivOZjJB30J5mZa4hCf9qqLPJjaMlOJhhFxipESrBccTcO86s7BC5ew0UUkmGSw==
X-Received: by 2002:a17:907:7e9e:b0:a6f:e47d:a965 with SMTP id a640c23a62f3a-a7dc502e77amr168761066b.41.1722578809179;
        Thu, 01 Aug 2024 23:06:49 -0700 (PDT)
Message-ID: <8e110bfd-d6c6-4a24-8062-f728a4cf0a20@suse.com>
Date: Fri, 2 Aug 2024 08:06:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs/misra: add R13.2 and R18.2 to rules.rst
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Julien Grall <julien@xen.org>,
 xen-devel@lists.xenproject.org
References: <alpine.DEB.2.22.394.2407301626460.4857@ubuntu-linux-20-04-desktop>
 <6575beb5-645a-470a-89a1-8485adeace60@suse.com>
 <alpine.DEB.2.22.394.2407311647170.4857@ubuntu-linux-20-04-desktop>
 <dd463c03-71ca-4333-ac3f-629241b0f9bc@suse.com>
 <alpine.DEB.2.22.394.2408011044320.4857@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2408011044320.4857@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.08.2024 19:59, Stefano Stabellini wrote:
> On Thu, 1 Aug 2024, Jan Beulich wrote:
>> On 01.08.2024 01:50, Stefano Stabellini wrote:
>>> On Wed, 31 Jul 2024, Jan Beulich wrote:
>>>> On 31.07.2024 01:30, Stefano Stabellini wrote:
>>>>> --- a/docs/misra/rules.rst
>>>>> +++ b/docs/misra/rules.rst
>>>>> @@ -462,6 +462,15 @@ maintainers if you want to suggest a change.
>>>>>       - Initializer lists shall not contain persistent side effects
>>>>>       -
>>>>>  
>>>>> +   * - `Rule 13.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_13_02.c>`_
>>>>> +     - Required
>>>>> +     - The value of an expression and its persistent side-effects shall
>>>>> +       be the same under all permitted evaluation orders
>>>>> +     - Be aware that the static analysis tool Eclair might report
>>>>> +       several findings for Rule 13.2 of type "caution". These are
>>>>> +       instances where Eclair is unable to verify that the code is valid
>>>>> +       in regard to Rule 13.2. Caution reports are not violations.
>>>>
>>>> Which doesn't make clear what our take is towards new code people may
>>>> submit.
>>>
>>> Good point, see my comment below
>>>
>>>
>>>>> @@ -583,6 +592,15 @@ maintainers if you want to suggest a change.
>>>>>         submitting new patches please try to decrease the number of
>>>>>         violations when possible.
>>>>>  
>>>>> +   * - `Rule 18.2 <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_18_02.c>`_
>>>>> +     - Required
>>>>> +     - Subtraction between pointers shall only be applied to pointers
>>>>> +       that address elements of the same array
>>>>> +     - Be aware that the static analysis tool Eclair might report
>>>>> +       several findings for Rule 18.2 of type "caution". These are
>>>>> +       instances where Eclair is unable to verify that the code is valid
>>>>> +       in regard to Rule 18.2. Caution reports are not violations.
>>>>
>>>> And while the same wording is used here, I think it is pretty clear for
>>>> this that we'd reject changes where bad subtractions are used. IOW even
>>>> more so important to clarify the (possibly different) positions on what
>>>> is going to be added into the code base.
>>>
>>> In both of these cases, we would reject code that doesn't follow R13.2
>>> and R18.2.
>>
>> But we shouldn't (unconditionally) do so for for 13.2, should we?
>>
>>> I'll change it to the following:
>>>
>>>
>>> Be aware that the static analysis tool Eclair might report several
>>> findings for Rule 18.2 of type "caution". These are instances where
>>> Eclair is unable to verify that the code is valid in regard to Rule
>>> 18.2. Caution reports are not violations. Regardless, new code is
>>> expected to follow this rule.
>>
>> I'm fine with this for 18.2, but not so much for 13.2.
> 
> Let me clarify something about R13.2. I expect we are aligned on this.
> 
> Rule 13.2 only expects that "the value of an expression and its persistent
> side-effects shall be the same under all permitted evaluation orders"
> and nothing more.
> 
> It is an outstanding limitation of static analyzers such as ECLAIR
> that they cannot be certain that "the value of an expression and its
> persistent side-effects shall be the same under all permitted evaluation
> orders". So one way to make ECLAIR happy is to change this code:
> 
> 1)
> func1(param1, func2(a), func3(b);
> 
> into this code:
> 
> 2)
> param2 = func2(a);
> param3 = func3(b);
> func1(param1, param2, param3);
> 
> Rule 13.2 is not asking us to change 1) into 2). 1) is acceptable. It is
> just that ECLAIR cannot help us ensure that 1) is compliant with Rule
> 13.2. It is totally fine to accept new code written in the form 1), of
> course only if "the value of an expression and its persistent
> side-effects shall be the same under all permitted evaluation orders".
> It would likely increase the number of ECLAIR cautions, but it is not
> necessarily a problem, and the ECLAIR Gitlab job will not fail.
> 
> If one of the reviewers discovers that 1) doesn't comply with Rule 13.2
> due to manual review, then they should ask the contributor to change the
> code. That is a good idea because we wouldn't want the value of an
> expression to be dependant on the evaluation order which GCC cannot
> guarantee.

Okay, if that is our interpretation of the rule for practical purposes,
then I'm no longer concerned.

Jan

