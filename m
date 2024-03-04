Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7E28703DA
	for <lists+xen-devel@lfdr.de>; Mon,  4 Mar 2024 15:18:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688424.1072491 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh97t-0006t9-6J; Mon, 04 Mar 2024 14:17:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688424.1072491; Mon, 04 Mar 2024 14:17:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rh97t-0006rX-23; Mon, 04 Mar 2024 14:17:09 +0000
Received: by outflank-mailman (input) for mailman id 688424;
 Mon, 04 Mar 2024 14:17:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kl9k=KK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rh97r-0006rP-PS
 for xen-devel@lists.xenproject.org; Mon, 04 Mar 2024 14:17:07 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e12d72db-da31-11ee-afda-a90da7624cb6;
 Mon, 04 Mar 2024 15:17:06 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-512f54fc2dbso3721898e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Mar 2024 06:17:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n7-20020a05640206c700b00566757b30fbsm4637729edy.45.2024.03.04.06.17.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Mar 2024 06:17:05 -0800 (PST)
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
X-Inumbo-ID: e12d72db-da31-11ee-afda-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709561826; x=1710166626; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a1jmLs6ai3nZb2yvPutDtB57Up6Vs+RvcmBcnNXsSUM=;
        b=L439reIiPcdID4HqCrPryqVB11XdOqMtG9V6+lp65zH0qLcd3fnAuoEiFgYJbIH7MA
         EHbVNy747K2CVW004cx+Oj6TYD4DIKuWU0HNgBay+HSKGubm4jWQepUzl6YIJzJiwflh
         unhw2KfxN0NXfIC5op0vOJJGXpILDsHQ1HeQ4TAma//e3n0kLTMou2J6GZ36o6hlXgKW
         GOR2E01zWlKDGR8E5dkPzIcjO+9lT+ZzATdzubFTh5ljGD8EezrIDF8N8pmxvLLfmxrf
         Sob58pX45MXlNVT1vqbYvk7gNzpVdEtbfJwX6TvdTlItI8n9NQiMky744M4U2JWY4W4U
         ofuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709561826; x=1710166626;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a1jmLs6ai3nZb2yvPutDtB57Up6Vs+RvcmBcnNXsSUM=;
        b=teuYMF+UU2QL1UI0X/Ic2w+DLO++WV/VDwayWQfoIWj5BZDzB+fjcBBaTQ6xKTr71E
         ffaj2jsL612ljaVHuEVQHUM2uVjzEyx5/lZu1oUguzcDMzoUX1iyEU/+0bmNneh++lIS
         0UCog1+hmajcVEfe2sc4+Tw/xARnh+7KHxueoJD2VKcjD4kvyh2/YGaq7GYF6N8Gtk5q
         jN/wEseckD6+Lgw7m6gsX6+b1Hy1rafpm4CHGdMiDG9bjwg1ze8HQjrogVL1HnC6tciW
         /vVv4+m27f768V4t7lLRkf0xAkUiVPLAtOmexyzB/ajC+p3MsTvr2CFD62PS17btA9uf
         W7hw==
X-Forwarded-Encrypted: i=1; AJvYcCVkGkxPhNvnA+Mx1iV8+3ym/2hhc1XcqnhWAde3jeGv5nhMOrDKxoGzQPu2eWyb9HvK4lWB6pGXWjSmBfzEhObwHJAeWGWEfhuAzz2hxbQ=
X-Gm-Message-State: AOJu0Yzsvf1rUflbaD+BXXoSv+Opx7YBKkXMtMm599cqHgzgrpmzQHLo
	+9H5aoWhSlSYXZnoSJvD5+NpoJRqpnr3Vx0Nl+QNR2D+G/1y+tauOHGltK8h6g==
X-Google-Smtp-Source: AGHT+IG56tRR43+eB4kBy1QL4zeGVFpxV+ujT+uOM6He/XFckQNl3ZMmrDk3vgaV6jUi4Y/JKXbknA==
X-Received: by 2002:ac2:5f99:0:b0:512:ed82:fd6f with SMTP id r25-20020ac25f99000000b00512ed82fd6fmr6337681lfe.60.1709561825668;
        Mon, 04 Mar 2024 06:17:05 -0800 (PST)
Message-ID: <7747cb81-8fdb-4a5f-bfd1-c6c9bdb6039a@suse.com>
Date: Mon, 4 Mar 2024 15:17:03 +0100
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
In-Reply-To: <da1446d6-b248-4c68-8302-2179dbe09987@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 04.03.2024 14:31, Federico Serafini wrote:
> On 01/03/24 09:06, Jan Beulich wrote:
>> On 01.03.2024 00:28, Stefano Stabellini wrote:
>>> On Wed, 14 Feb 2024, Federico Serafini wrote:
>>>> On 14/02/24 14:15, Jan Beulich wrote:
>>>>> On 14.02.2024 12:27, Federico Serafini wrote:
>>>>>> On 14/02/24 09:28, Jan Beulich wrote:
>>>>>>> On 13.02.2024 23:33, Stefano Stabellini wrote:
>>>>>>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>>>>>>> ---
>>>>>>>>     docs/misra/rules.rst | 6 ++++++
>>>>>>>>     1 file changed, 6 insertions(+)
>>>>>>>>
>>>>>>>> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
>>>>>>>> index c185366966..931158b354 100644
>>>>>>>> --- a/docs/misra/rules.rst
>>>>>>>> +++ b/docs/misra/rules.rst
>>>>>>>> @@ -181,6 +181,12 @@ maintainers if you want to suggest a change.
>>>>>>>>            headers (xen/include/public/) are allowed to retain longer
>>>>>>>>            identifiers for backward compatibility.
>>>>>>>>     +   * - `Rule 5.5
>>>>>>>> <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_05.c>`_
>>>>>>>> +     - Required
>>>>>>>> +     - Identifiers shall be distinct from macro names
>>>>>>>> +     - Clashes between function-like macros and non-callable entities
>>>>>>>> +       are allowed. The pattern #define x x is also allowed.
>>>>>>>
>>>>>>> Just for me to know what exactly is covered (hence also a question
>>>>>>> to Roberto as to [to be] implemented Eclair behavior): Even when
>>>>>>> the above would be sufficient (and imo better) people frequently
>>>>>>> write
>>>>>>>
>>>>>>> #define a(x, y) b(x, y)
>>>>>>>
>>>>>>> which, transformed to the specific case here, would then be
>>>>>>>
>>>>>>> #define a(x, y) a(x, y)
>>>>>>>
>>>>>>> I'd assume such ought to also be covered, but that's not clear
>>>>>>> from the spelling above.
>>>>>>
>>>>>> I list what happens in some different situations,
>>>>>> then we can find the right words for the documentation and/or
>>>>>> refine the configuration:
>>>>>>
>>>>>> If you
>>>>>> #define x x
>>>>>> and then use `x' as identifier,
>>>>>> the resulting violation is deviated (allowed pattern).
>>>>>>
>>>>>> If you
>>>>>> #define a(x, y) a(x, y)
>>>>>> and then use `a' as identifier for a non-callable entity,
>>>>>> the resulting violation is deviated (no clash with non-callable
>>>>>> entities).
>>>>>> If you use identifier `a' for a callable entity, the resulting violation
>>>>>> is reported: the allowed pattern covers only macros expanding to their
>>>>>> own name, in this case the macro name is considered to be
>>>>>> `a' only, not a(x, y).
>>>>>>
>>>>>> If you
>>>>>> #define a(x, y) b(x, y)
>>>>>> and then use `a' as identifier for a non-callable entity,
>>>>>> the resulting violation is deviated (no clash with non-callable
>>>>>> entities).
>>>>>
>>>>> I'm afraid I don't see what violation there is in this case, to
>>>>> deviate. As a result I'm also not sure I correctly understand the
>>>>> rest of your reply.
>>>>
>>>> #define a(x, y) b(x, y)
>>>>
>>>> int a; // Violation of Rule 5.5.
>>>>
>>>> The macro name `a' that exist before the preprocessing phase,
>>>> still exists after the preprocessing phase as identifier for the integer
>>>> variable and this is a violation.
>>>>
>>>>>> If you use `a' as identifier for a callable entity,
>>>>>> this is not a violation because after the preprocessing phase,
>>>>>> identifier `a' no longer exists.
>>>> I correct myself:
>>>> if you use `a' as identifier for a *function*,
>>>> it is not a violation because after the preprocessing phase
>>>> the identifier `a' no longer exists, for example:
>>>>
>>>> #define a(x, y) b(x, y)
>>>>
>>>> void a(int x, int y); // Ok.
>>>
>>> Federico, do you have a better wording suggestion for this rule?
>>>
>>> Jan, any further requests here? What would you like to see as next step?
>>
>> A more concise wording proposal would probably help.
> 
> What do you think about:
> 
> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
> index 1e134ccebc..a975b9a85f 100644
> --- a/docs/misra/rules.rst
> +++ b/docs/misra/rules.rst
> @@ -181,6 +181,13 @@ maintainers if you want to suggest a change.
>          headers (xen/include/public/) are allowed to retain longer
>          identifiers for backward compatibility.
> 
> +   * - `Rule 5.5 
> <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_05_05.c>`_
> +     - Required
> +     - Identifiers shall be distinct from macro names
> +     - Macros expanding to their own name are allowed (e.g., #define x x).
> +       Clashes between names of function-like macros and identifiers of
> +       non-callable entities are allowed.

Imo that still leaves open e.g. the

#define a(x, y) a(x, y)

case: Permitted ("own name") or not permitted ("a" pretty clearly is expected
to be a callable entity here, besides being a function-like macro)?

Jan

