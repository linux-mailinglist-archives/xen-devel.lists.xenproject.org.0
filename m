Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C9AA3B2D6
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 08:54:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.892399.1301376 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tketu-00070F-AZ; Wed, 19 Feb 2025 07:53:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 892399.1301376; Wed, 19 Feb 2025 07:53:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tketu-0006xl-6n; Wed, 19 Feb 2025 07:53:46 +0000
Received: by outflank-mailman (input) for mailman id 892399;
 Wed, 19 Feb 2025 07:53:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EceQ=VK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tketr-0006xf-Uz
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 07:53:44 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a2abb3a8-ee96-11ef-9896-31a8f345e629;
 Wed, 19 Feb 2025 08:53:41 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-aaf3c3c104fso1068817866b.1
 for <xen-devel@lists.xenproject.org>; Tue, 18 Feb 2025 23:53:41 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abbbde95957sm252212066b.138.2025.02.18.23.53.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Feb 2025 23:53:40 -0800 (PST)
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
X-Inumbo-ID: a2abb3a8-ee96-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1739951621; x=1740556421; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=o0YVP0nVWw8ihDiDEsYwqp7oQJ3ml/loBkte87Poyv0=;
        b=H3mAF7BAa5FjUCzWD5W2UZyMsl2uwRqeHHPeYYVO/5onl5UIj1bjs+jCYry87u3A3n
         Z7QuBPtZwMW27nowJunO8TJnFN8i/OtO21SPoTueACaRawhd0vKu2Pv8fNIInjxLiYM6
         F8WpbHqb2LM6jnVJk5+/iLdI2QjfWDmQqT/QhnDqEruA/vBcWEFlT5gi3ij6ABitKwBk
         Mvt6MPKIyPJ/8UgxOx+h1D4eFnhMeSqxPWJptMzpTCR2rl6uhdKGdtDufQZ/vXFYFIRa
         QH8obBn7SCQlZ0sJU1UdtSba4rOSWt0eb2ARtDc+dLHFupSS1m/VJzv9kLi3F98DSfY6
         6+Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739951621; x=1740556421;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0YVP0nVWw8ihDiDEsYwqp7oQJ3ml/loBkte87Poyv0=;
        b=rn2ELBNa+5UoExZ7h2EOMK7c2ZlKPHbPayu7FUmQqIFevSF+d4La+bIkggzclxAd+n
         D0x0+NN3tmsQeFbxanmHS1ycWjNXqmFZKziDJlxwbfVPqQXq0epCMYHPMqCRpS167BTl
         UGxkwr4d01m4W8IvtzzofhaSFK5YXSqTuP8YbY/j3L95l+mhNPKZnXZuR071/X0C47tH
         VzD+JB6+XF/X/J0VkynPGqGzs7EvWa2dALB/S1OsroRBovCfK3pG4N6EylOC91u6cLCF
         EnLbl8S1ok+IJW5GQJht/p3+whupIjswkzi0b8nGJXYu7RjOvch448k9m0WeyPxYA2vm
         Lp3A==
X-Forwarded-Encrypted: i=1; AJvYcCXnL7hyI2w8fsYAzMZUn3mpyXVJrtZJ8L9DzQDV5mcMHuImSylcb/sBx0YMjnUYwth0kdOcs7cP9ug=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw3aQ6GuzXyONsvmj0yHSbCd84V6VeUmUGFNfK8hIOJIMnqXhNv
	Z+sM+xVVhgV3N3IK2Q0Knhl8EKbSrhyIpKIBaKp8ypS0xV4k54VoLrqaw468Ug==
X-Gm-Gg: ASbGncvU0jkXtlTxbH5pDrmbWmNiB6JaOaY/o6igs/UjdXSKaj2eeahmq3QZOFftcIi
	G1ilsglHjalIJh2HJhFyrCbCeX7EBfVgPpK47YF+Hj0QEdAn3Zo0E734hqvZmpGC0KkUcof9T3/
	VvJjpODhIuaHHRnSHgxWE8Lac5NUbf1LGG3nrAVHwKp/DXif/kIBVQrQ/1ruJS2LCJ56Cl2TefM
	giBvvTpFkNXy7yZhoci9LIznzyMfSIGsUbDQxK0wnzD+UDL4HKxT8ZgtMYGYxnbF7tVmPyMKZ3D
	IU2QjmrsuC3FKCwI+1xkEKLibO7Hc3fjCbBo0XQnb9ftIkJwm72/PFnm8/RB+5+RemluE47jgin
	8
X-Google-Smtp-Source: AGHT+IFdTIXes3Q94zdkk+2g7KAHxdkJMGTub5oivXN11HP4iQnF1649B4zVl9CH4WFtRYbe2+YI8w==
X-Received: by 2002:a17:907:9615:b0:aae:85a9:e2d with SMTP id a640c23a62f3a-abb70d69a51mr1705833466b.45.1739951620706;
        Tue, 18 Feb 2025 23:53:40 -0800 (PST)
Message-ID: <ac82e2fa-f35d-413f-9e96-0a16f2c0f323@suse.com>
Date: Wed, 19 Feb 2025 08:53:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: struct mctelem_cookie missing definition
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <alpine.DEB.2.22.394.2502121721490.619090@ubuntu-linux-20-04-desktop>
 <1823d604-aa29-4828-a954-b8a08fbdbda7@citrix.com>
 <alpine.DEB.2.22.394.2502121738440.619090@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2502121800190.619090@ubuntu-linux-20-04-desktop>
 <eccc2a63-9678-4675-8a7b-7c8e94206cb8@suse.com>
 <alpine.DEB.2.22.394.2502131326440.619090@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2502131804510.619090@ubuntu-linux-20-04-desktop>
 <3c883b4587d750c2723637a037fb46b4@bugseng.com>
 <69a70bfa-203c-44f9-99ea-60a674e36442@suse.com>
 <alpine.DEB.2.22.394.2502141245150.3858257@ubuntu-linux-20-04-desktop>
 <c7f35e1a8a14eb5ffb19d67bbc63036b@bugseng.com>
 <cc9d0a73-f189-403e-9ea4-bcd961ce3c44@suse.com>
 <alpine.DEB.2.22.394.2502171837170.1085376@ubuntu-linux-20-04-desktop>
 <9d966b20-18c4-49ac-8007-95bac3a95b51@suse.com>
 <alpine.DEB.2.22.394.2502181330360.1085376@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2502181330360.1085376@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18.02.2025 22:37, Stefano Stabellini wrote:
> On Tue, 18 Feb 2025, Jan Beulich wrote:
>> On 18.02.2025 03:45, Stefano Stabellini wrote:
>>> On Mon, 17 Feb 2025, Jan Beulich wrote:
>>>> On 15.02.2025 09:59, Nicola Vetrini wrote:
>>>>> On 2025-02-15 00:04, Stefano Stabellini wrote:
>>>>>> On Fri, 14 Feb 2025, Jan Beulich wrote:
>>>>>>>> Would deviating macros "COOKIE2MCTE" and "MCTE2COOKIE" work?
>>>>>>>
>>>>>>> If it did, COOKIE2ID and ID2COOKIE would likely need including as 
>>>>>>> well.
>>>>>>
>>>>>> I wrote this patch. Nicola, can you please check the changes to
>>>>>> deviations.ecl, this is the first time I try to write the deviation
>>>>>> myself :-)
>>>>>>
>>>>>> ---
>>>>>> misra: add 11.2 deviation for incomplete types
>>>>>>
>>>>>> struct mctelem_cookie* is used exactly because it is an incomplete type
>>>>>> so the pointer cannot be dereferenced. This is deliberate. So add a
>>>>>> deviation for it.
>>>>>>
>>>>>> In deviations.ecl, add the list of macros that do the conversions to 
>>>>>> and
>>>>>> from struct mctelem_cookie*.
>>>>>>
>>>>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>>>>>
>>>>>> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl 
>>>>>> b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>>> index a28eb0ae76..87bfd2160c 100644
>>>>>> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>>> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
>>>>>> @@ -366,6 +366,14 @@ constant expressions are required.\""
>>>>>>  }
>>>>>>  -doc_end
>>>>>>
>>>>>> +-doc_begin="Certain pointers point to incomplete types purposely so 
>>>>>> that they are impossible to dereference."
>>>>>> +-config=MC3A2.R11.2,reports+={deliberate, 
>>>>>> "any_area(any_loc(any_exp(macro(^COOKIE2MCTE$))))"}
>>>>>> +-config=MC3A2.R11.2,reports+={deliberate, 
>>>>>> "any_area(any_loc(any_exp(macro(^MCTE2COOKIE$))))"}
>>>>>> +-config=MC3A2.R11.2,reports+={deliberate, 
>>>>>> "any_area(any_loc(any_exp(macro(^COOKIE2ID$))))"}
>>>>>> +-config=MC3A2.R11.2,reports+={deliberate, 
>>>>>> "any_area(any_loc(any_exp(macro(^ID2COOKIE$))))"}
>>>>>> +}
>>>>>
>>>>> -config=MC3A2.R11.2,reports+={deliberate, 
>>>>> "any_area(any_loc(any_exp(macro(name(COOKIE2MCTE||MCTE2COOKIE||COOKIE2ID||ID2COOKIE)))))"}
>>>>>
>>>>> Note however that there is also this deviation in place
>>>>>
>>>>> -doc_begin="The conversion from a pointer to an incomplete type to 
>>>>> unsigned long does not lose any information, provided that the target 
>>>>> type has enough bits to store it."
>>>>> -config=MC3A2.R11.2,casts+={safe,
>>>>>    "from(type(any()))
>>>>>     &&to(type(canonical(builtin(unsigned long))))
>>>>>     &&relation(definitely_preserves_value)"
>>>>> }
>>>>> -doc_end
>>>>>
>>>>> I was a bit confused by Jan's remark, which seemed correct, but I 
>>>>> couldn't see any violations in the report, so I dug a bit deeper. 
>>>>> ID2COOKIE and COOKIE2ID, which operate to/from unsigned long are already 
>>>>> excluded due to being safe. If you envision those macros to be used with 
>>>>> other types, then your deviation should mention them, otherwise they are 
>>>>> already handled.
>>>>
>>>> Yet then can't we leverage that deviation to also make the other two
>>>> covered:
>>>>
>>>> #define	COOKIE2MCTE(c)		((struct mctelem_ent *)(unsigned long)(c))
>>>> #define	MCTE2COOKIE(tep)	((mctelem_cookie_t)(unsigned long)(tep))
>>>
>>> Jan is asking why ID2COOKIE and COOKIE2ID are considered safe, while
>>> COOKIE2MCTE and MCTE2COOKIE are not. I think the reason is that
>>> ID2COOKIE and COOKIE2ID convert to/from unsigned long and that falls
>>> under the other deviation we already have:
>>>
>>> -doc_begin="The conversion from a pointer to an incomplete type to 
>>> unsigned long does not lose any information, provided that the target 
>>> type has enough bits to store it."
>>> -config=MC3A2.R11.2,casts+={safe,
>>>    "from(type(any()))
>>>     &&to(type(canonical(builtin(unsigned long))))
>>>     &&relation(definitely_preserves_value)"
>>>
>>> On the other hand COOKIE2MCTE and MCTE2COOKIE convert to/from another
>>> pointer type, so they don't fall under the same deviation.
>>
>> And then the adjusted forms suggested above ought to also be covered,
>> I would have thought.
> 
> I understand your point. I tried it, but it does not work. I do not know
> why. Someone with more knowledge of ECLAIR internals than I have might
> be able to explain.
> 
> https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-project/people/sstabellini/xen/ECLAIR_normal/my-eclair-11.2-4-1/X86_64/9176469474/PROJECT.ecd;/by_service/MC3A2.R11.2.html#{%22select%22:true,%22selection%22:{%22hiddenAreaKinds%22:[],%22hiddenSubareaKinds%22:[],%22show%22:false,%22selector%22:{%22enabled%22:true,%22negated%22:true,%22kind%22:0,%22domain%22:%22kind%22,%22inputs%22:[{%22enabled%22:true,%22text%22:%22violation%22}]}}}
> 
> 
> I suggest we go with this patch instead.
> 
> ---
> misra: add 11.2 deviation for incomplete types
> 
> struct mctelem_cookie* is used exactly because it is an incomplete type
> so the pointer cannot be dereferenced. This is deliberate. So add a
> deviation for it.
> 
> In deviations.ecl, add the list of macros that do the conversions to and
> from struct mctelem_cookie*.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index a28eb0ae76..d33b777e6a 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -366,6 +366,10 @@ constant expressions are required.\""
>  }
>  -doc_end
>  
> +-doc_begin="Certain pointers point to incomplete types purposely so that they are impossible to dereference."
> +-config=MC3A2.R11.2,reports+={deliberate, "any_area(any_loc(any_exp(macro(name(COOKIE2MCTE||MCTE2COOKIE||COOKIE2ID||ID2COOKIE)))))"}
> +-doc_end
> +
>  -doc_begin="Conversions to object pointers that have a pointee type with a smaller (i.e., less strict) alignment requirement are safe."
>  -config=MC3A2.R11.3,casts+={safe,
>    "!relation(more_aligned_pointee)"
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index fe0b1e10a2..04ffc62f44 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -324,6 +324,13 @@ Deviations related to MISRA C:2012 Rules:
>         semantics that do not lead to unexpected behaviour.
>       - Tagged as `safe` for ECLAIR.
>  
> +   * - R11.2
> +     - Certain pointers point to incomplete types purposely so that they
> +       are impossible to dereference, since they cannot be dereferenced,
> +       pointers alignments considerations do not apply.

But that's not true for COOKIE2MCTE(). Its result _is_ being dereferenced.
(Note how in an earlier reply, where I suggested intermediately casting to
unsigned long, I also said that this would be "undermining this rationale
of the rule then, though." The same would apply to putting in place a
deviation, imo.) In fact, looking e.g. at just mctelem_defer(),
mctelem_dataptr(), mctelem_dismiss(), mctelem_commit(), and
mctelem_consume_oldest_end() it's not clear how that's safe to do. For
every one of them it requires looking at all their call sites. And imo
it's the result of doing so which would form the justification.

The only one where just looking at the function using the macro is
sufficient to see things are kind of okay is mctelem_ack(). The argument
for being safe here is that the pointer first is checked against a value
we stored earlier.

For mctelem_consume_oldest_end() analysis is also reasonably easy: It's
only ever passed the return value from an earlier
mctelem_consume_oldest_begin(). In fact I question the need for going
through the cookie type here. I guess I'll make a patch to remove the
macro uses here, reducing the scope of the Misra task at least a little.

Jan

