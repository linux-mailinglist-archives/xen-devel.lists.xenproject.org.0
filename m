Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76AD487074D
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 17:36:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688447.1072554 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhBIg-000445-5k; Mon, 04 Mar 2024 16:36:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688447.1072554; Mon, 04 Mar 2024 16:36:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhBIg-00042K-2x; Mon, 04 Mar 2024 16:36:26 +0000
Received: by outflank-mailman (input) for mailman id 688447;
 Mon, 04 Mar 2024 16:36:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kl9k=KK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rhBIe-00042E-Ei
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 16:36:24 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5558cf7f-da45-11ee-a1ee-f123f15fe8a2;
 Mon, 04 Mar 2024 17:36:22 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5656e5754ccso6050344a12.0
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 08:36:21 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 q22-20020a50aa96000000b00564e489ce9asm5029353edc.12.2024.03.04.08.36.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 08:36:20 -0800 (PST)
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
X-Inumbo-ID: 5558cf7f-da45-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709570181; x=1710174981; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UFU07q3UlHeJJoaB6lTGmqhiHfuhfu7yy/0BJqnd3Ho=;
        b=W9IVeqe5WYvdYqDgmeBU0IOP4uzaakH+dkOq5TLZifjaysdhmah/jmWx4VivYwQXW4
         G0TYgT44mjcZqhq4w+zQg35RQW8odU146ebU6oNOdx1gKuuuFqdUW6UmalGAXpPKvaM4
         JwpfjjcGd7QJXeB1WGN24LpnyllfqTVfpklRAohYdmnVqhseczYMxQv4pLjDIL8jSg8s
         5r5ZxwMEqo1bEg3yi2TK3e2VLKVvEKAYqNPmuao8dIpD9OyZHayVLuAUxwb9ayANyjTD
         XN/Fo3rPU9c/xwGV9ODMrmKDt4Jddk0pBCsCYxbeRhAIqvu5Q4lCew+cWTwlpJbCfeuV
         +oDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709570181; x=1710174981;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UFU07q3UlHeJJoaB6lTGmqhiHfuhfu7yy/0BJqnd3Ho=;
        b=lR4YBZRAlKaTkbpio5vxOq1uhV51Icja84piA1UeQvSR0GQ2GDik+nMyiFqZZ+lqKF
         VLcGxgbfZcQHv7IhrjUgIM5st6b/HAntMkkLIicM5BnYD1Rh8e0tMlS7j61WdWIDO4OW
         TPRnbZOY/3q6rlV6j/KEeJKsPsjIqADE2QrjleP4wezM/5J/9qhg1l9N1ibj/V22GRMH
         GeK5wq1/h1Rk3Aoz2BZeGUHiT1UPAaAPo2kDlnc0BjqrqinmfhoHBOEVEWQ5PoOKb2E6
         UrZQH2L/xjmEWDK5CGdU15WqsDJeDXeKSCGIKS9E09jnvKqLr2tWGQvcfQb4ZfDnmeJ4
         psZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCdoSMuWcpRCeaeycbQiefHDigcT74OxQOmGtHuZn5GsrIcaNFIddbftDSXHjBlDM0C5dtfy0jPsfuPgOpOtZGo49El0hjmYXbSlwNaOc=
X-Gm-Message-State: AOJu0YyGQ4jyIXHwHdEXl1tOCd9LWn5zyepruVKUQlNfNkASxXqGOjD2
	kmCkmyo1hlXj3h6+7D0LCwifZCDtib6sf2EG+rvdpG6b7UawzJCwfOtmNtn6cQ==
X-Google-Smtp-Source: AGHT+IE4V9OsJB1W76mF2N6NTiGLU3r30ut7usfrcbM8nMmyHyAnwN/9E9+KGVQKmvZetz1XNrxGrg==
X-Received: by 2002:a05:6402:1249:b0:567:4441:89ad with SMTP id l9-20020a056402124900b00567444189admr2626236edw.15.1709570181088;
        Mon, 04 Mar 2024 08:36:21 -0800 (PST)
Message-ID: <8e5d4c48-558d-40e2-851a-3eb6bfa5dbfe@suse.com>
Date: Mon, 4 Mar 2024 17:36:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] docs/misra/rules.rst: add rule 5.5
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com, julien@xen.org,
 bertrand.marquis@arm.com, roger.pau@citrix.com,
 xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 roberto.bagnara@bugseng.com, Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.22.394.2402131431070.1925432@ubuntu-linux-20-04-desktop>
 <20240213223334.3693410-2-stefano.stabellini@amd.com>
 <50719397-b053-43e1-9cf7-cc9eae9098ed@suse.com>
 <40b7465f-4966-43c7-8db3-e28a6cc48445@bugseng.com>
 <2da73259-a86e-4a13-9fd4-4217372f4b76@suse.com>
 <3632611e-61ff-455a-9cc1-990a1f663d83@bugseng.com>
 <alpine.DEB.2.22.394.2402291528230.853156@ubuntu-linux-20-04-desktop>
 <e3c894d5-4d7b-426c-bf1a-536b4f1f83ce@suse.com>
 <da1446d6-b248-4c68-8302-2179dbe09987@bugseng.com>
 <7747cb81-8fdb-4a5f-bfd1-c6c9bdb6039a@suse.com>
 <a2a90115-762a-497c-8de3-95b6d14ab9e2@bugseng.com>
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
In-Reply-To: <a2a90115-762a-497c-8de3-95b6d14ab9e2@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.03.2024 16:39, Federico Serafini wrote:
> On 04/03/24 15:17, Jan Beulich wrote:
>> On 04.03.2024 14:31, Federico Serafini wrote:
>>> On 01/03/24 09:06, Jan Beulich wrote:
>>>> On 01.03.2024 00:28, Stefano Stabellini wrote:
>>>>> On Wed, 14 Feb 2024, Federico Serafini wrote:
>>>>>> On 14/02/24 14:15, Jan Beulich wrote:
>>>>>>> On 14.02.2024 12:27, Federico Serafini wrote:
>>>>>>>> On 14/02/24 09:28, Jan Beulich wrote:
>>>>>>>>> On 13.02.2024 23:33, Stefano Stabellini wrote:
>>>>>>>>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>>>>>>>>> ---
>>>>>>>>>>      docs/misra/rules.rst | 6 ++++++
>>>>>>>>>>      1 file changed, 6 insertions(+)
>>>>>>>>>>
>>>>>>>>>> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
>>>>>>>>>> index c185366966..931158b354 100644
>>>>>>>>>> --- a/docs/misra/rules.rst
>>>>>>>>>> +++ b/docs/misra/rules.rst
>>>>>>>>>> @@ -181,6 +181,12 @@ maintainers if you want to suggest a change.
>>>>>>>>>>             headers (xen/include/public/) are allowed to retain longer
>>>>>>>>>>             identifiers for backward compatibility.
>>>>>>>>>>      +   * - `Rule 5.5
>>>>>>>>>> <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_05.c>`_
>>>>>>>>>> +     - Required
>>>>>>>>>> +     - Identifiers shall be distinct from macro names
>>>>>>>>>> +     - Clashes between function-like macros and non-callable entities
>>>>>>>>>> +       are allowed. The pattern #define x x is also allowed.
>>>>>>>>>
>>>>>>>>> Just for me to know what exactly is covered (hence also a question
>>>>>>>>> to Roberto as to [to be] implemented Eclair behavior): Even when
>>>>>>>>> the above would be sufficient (and imo better) people frequently
>>>>>>>>> write
>>>>>>>>>
>>>>>>>>> #define a(x, y) b(x, y)
>>>>>>>>>
>>>>>>>>> which, transformed to the specific case here, would then be
>>>>>>>>>
>>>>>>>>> #define a(x, y) a(x, y)
>>>>>>>>>
>>>>>>>>> I'd assume such ought to also be covered, but that's not clear
>>>>>>>>> from the spelling above.
>>>>>>>>
>>>>>>>> I list what happens in some different situations,
>>>>>>>> then we can find the right words for the documentation and/or
>>>>>>>> refine the configuration:
>>>>>>>>
>>>>>>>> If you
>>>>>>>> #define x x
>>>>>>>> and then use `x' as identifier,
>>>>>>>> the resulting violation is deviated (allowed pattern).
>>>>>>>>
>>>>>>>> If you
>>>>>>>> #define a(x, y) a(x, y)
>>>>>>>> and then use `a' as identifier for a non-callable entity,
>>>>>>>> the resulting violation is deviated (no clash with non-callable
>>>>>>>> entities).
>>>>>>>> If you use identifier `a' for a callable entity, the resulting violation
>>>>>>>> is reported: the allowed pattern covers only macros expanding to their
>>>>>>>> own name, in this case the macro name is considered to be
>>>>>>>> `a' only, not a(x, y).
>>>>>>>>
>>>>>>>> If you
>>>>>>>> #define a(x, y) b(x, y)
>>>>>>>> and then use `a' as identifier for a non-callable entity,
>>>>>>>> the resulting violation is deviated (no clash with non-callable
>>>>>>>> entities).
>>>>>>>
>>>>>>> I'm afraid I don't see what violation there is in this case, to
>>>>>>> deviate. As a result I'm also not sure I correctly understand the
>>>>>>> rest of your reply.
>>>>>>
>>>>>> #define a(x, y) b(x, y)
>>>>>>
>>>>>> int a; // Violation of Rule 5.5.
>>>>>>
>>>>>> The macro name `a' that exist before the preprocessing phase,
>>>>>> still exists after the preprocessing phase as identifier for the integer
>>>>>> variable and this is a violation.
>>>>>>
>>>>>>>> If you use `a' as identifier for a callable entity,
>>>>>>>> this is not a violation because after the preprocessing phase,
>>>>>>>> identifier `a' no longer exists.
>>>>>> I correct myself:
>>>>>> if you use `a' as identifier for a *function*,
>>>>>> it is not a violation because after the preprocessing phase
>>>>>> the identifier `a' no longer exists, for example:
>>>>>>
>>>>>> #define a(x, y) b(x, y)
>>>>>>
>>>>>> void a(int x, int y); // Ok.
>>>>>
>>>>> Federico, do you have a better wording suggestion for this rule?
>>>>>
>>>>> Jan, any further requests here? What would you like to see as next step?
>>>>
>>>> A more concise wording proposal would probably help.
>>>
>>> What do you think about:
>>>
>>> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
>>> index 1e134ccebc..a975b9a85f 100644
>>> --- a/docs/misra/rules.rst
>>> +++ b/docs/misra/rules.rst
>>> @@ -181,6 +181,13 @@ maintainers if you want to suggest a change.
>>>           headers (xen/include/public/) are allowed to retain longer
>>>           identifiers for backward compatibility.
>>>
>>> +   * - `Rule 5.5
>>> <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_05.c>`_
>>> +     - Required
>>> +     - Identifiers shall be distinct from macro names
>>> +     - Macros expanding to their own name are allowed (e.g., #define x x).
>>> +       Clashes between names of function-like macros and identifiers of
>>> +       non-callable entities are allowed.
>>
>> Imo that still leaves open e.g. the
>>
>> #define a(x, y) a(x, y)
>>
>> case: Permitted ("own name") or not permitted ("a" pretty clearly is expected
>> to be a callable entity here, besides being a function-like macro)?
> 
> I would not consider your example as a macro that expands to its own
> name, the macro name is considered to be `a' only.

That's what I was assuming, and hence my asking back. I think the
above ought to be permitted just like "#define x x", and hence the
suggested text would need expanding, to ...

> Rather, you example can be used to trigger the "callable-noncallable"
> part of the deviation, for example:
> 
> #define a(x, y) a(x, y)
> 
> void a(int x, int y); /* Not permitted (callable entity 'a'). */

... prevent this ("not permitted") from happening. I'm pretty sure
you've already found instances of this pattern in our code base.

Jan

> void foo(int a);      /* Permitted (non-callable entity `a'). */
> 


