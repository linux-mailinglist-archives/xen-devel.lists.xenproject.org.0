Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B59FCB27E36
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 12:26:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083206.1442840 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umrdF-0005vY-Ge; Fri, 15 Aug 2025 10:25:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083206.1442840; Fri, 15 Aug 2025 10:25:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umrdF-0005tA-Df; Fri, 15 Aug 2025 10:25:57 +0000
Received: by outflank-mailman (input) for mailman id 1083206;
 Fri, 15 Aug 2025 10:25:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5DW6=23=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umrdE-0005t4-4u
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 10:25:56 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39607ade-79c2-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 12:25:54 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-6188b7532f3so3007947a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 03:25:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-618b02b11bbsm1190330a12.53.2025.08.15.03.25.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Aug 2025 03:25:53 -0700 (PDT)
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
X-Inumbo-ID: 39607ade-79c2-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755253554; x=1755858354; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LdAvir8I9FSVLQne7J5E45Yzfg6yU0NAhlJ7ukyQ0Lo=;
        b=NFKh0w8ARaWpvKDyJwJgjiJ41iU22S7x0TzYln/XUlmkuHapneNfKJjMvR9oFNL7Ik
         Ka6zlHcJqzDWflr0ikuqhW+IWRfe06EvdLRK1JNYMLD7uH3/nR8Vmqdzt4WkxcLfTTS0
         Le9yzCPC0VnX6gcCURdXByKGxdIFCzLvOd2OL46wkFLue5/mbvQROHPUy/5shL4r5QJe
         jFIs+NxjTNvGNivhsp8yHuoZQLsSfThTaKMss8RwhrThoxvf7hzmUQvwHXKo6wcWuH8Q
         YRBIuGK5vmc0xtC6Ay6o0/IBVrL766KdcctqE5jIjI7EuLC8rZCcr0zYtHHqutRVgLei
         DRYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755253554; x=1755858354;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdAvir8I9FSVLQne7J5E45Yzfg6yU0NAhlJ7ukyQ0Lo=;
        b=GTb03lCNKzjq5LtOwgX2P4njhbrq32rg+UDm7lFcvZrOsXyzKst8BqwjhGw4W4aYWm
         et6nmgXOk7m75hv4rGyzuiioYHd7wwxubAzdWw8qP0mBJQgHsXNgsvVNgeD+qNR7rbDm
         /+Y0oMivBIo9bSWpQa1WGA2Gv73NxYvaYEkX9BWsYW5t4UE1eQs+9ENOb87hwrqr7CWA
         RW3R303XHjCDTFsnK3qTScAIZKqAlV+5DvZFTNT9w3V2S45NgJPr35Lct44R0UyipcJ9
         /z5Lauw+x4X19pEf4tlYfFOUhCVL4+l6lcotmLMoxI2aN2kgTBjV3CX8hgb5QR9EV+CD
         gJ+Q==
X-Gm-Message-State: AOJu0YwvqRvHGiRZBn2yBLPYhqrXhzwIglqlFWMVJyJfPYwSsOcJF1y7
	SYvbgFIFgJC3+kHawm5IB96ykUMlTYzwf2B0c92LdGGQ0jfaLhxC5tagTv8cQri2sw==
X-Gm-Gg: ASbGncuh6RNXJPeKKwngOA7vUeby3xZoeEXMu4ie1yEIP8Va2EQdicGNOKBfb59YnLd
	ObZvBUI6nVaddrTQHjoz64b8XsQ7ZALg/l+3G1t+NuXBMYzK04QORslZGV0C4cSdfEb2GvX8qEQ
	emUZ0xAinWAeOgx+R0gjyuhgv/rzVToR5auy+HsgnX8kzw5fdtSA/M4XGvZuv3B1g+FNSMl24kT
	KcF1aXo2JuQWCSB4tO1Hwr5zGG/3uaJZWcY/y9f8NNl3YUYCpGvVwW5weyOYSeZnQoMRojrlkkE
	/66mcujHBB/rBweizuXeqHMNC7xoltLI1csG0UkWxrWSNICmk9OAicdwtXtCHi32V8E+gVL+owF
	zxFvEchZ8xhsMlBMrhw+lRD+tvYVOWQ2vrQ+CH9kKe+TDjtqcVmp3vSY3JIbH+TEveMyRykAJ3e
	npjpJrLSc=
X-Google-Smtp-Source: AGHT+IEeMfYPzEylAQy/x6LbE0KEgoBcx3lK3YWUvQOxpoujYgOjiOBqRvlTlJ1J8g9zpcxD3pFFDA==
X-Received: by 2002:a05:6402:2811:b0:615:957f:416b with SMTP id 4fb4d7f45d1cf-618b0502bf8mr1244024a12.6.1755253553788;
        Fri, 15 Aug 2025 03:25:53 -0700 (PDT)
Message-ID: <5ff1e337-9ec5-466b-b21f-cf29274b007b@suse.com>
Date: Fri, 15 Aug 2025 12:25:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: Use auto as per C23
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <20250814222524.2638883-1-andrew.cooper3@citrix.com>
 <3056ed85948288639110e3cdd6b28c6e@bugseng.com>
 <f3ff5b2d-8077-4591-bf1f-bd658d705242@citrix.com>
 <7fc93aeef27153f1d6caa786bd44420f@bugseng.com>
 <caf19e2b-046e-495f-b425-9cb3a0053006@suse.com>
 <bd3f9c28-aaf4-479d-b56e-48838442f7a3@citrix.com>
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
In-Reply-To: <bd3f9c28-aaf4-479d-b56e-48838442f7a3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.08.2025 11:51, Andrew Cooper wrote:
> On 15/08/2025 10:36 am, Jan Beulich wrote:
>> On 15.08.2025 10:33, Nicola Vetrini wrote:
>>> On 2025-08-15 10:17, Andrew Cooper wrote:
>>>> On 15/08/2025 8:20 am, Nicola Vetrini wrote:
>>>>> On 2025-08-15 00:25, Andrew Cooper wrote:
>>>>>> In macros it is common to declare local variables using typeof(param)
>>>>>> in order
>>>>>> to ensure that side effects are only evaluated once.  A consequence
>>>>>> of this is
>>>>>> double textural expansion of the parameter, which can get out of hand
>>>>>> very
>>>>>> quickly with nested macros.
>>>>>>
>>>>>> In C23, the auto keyword has been repurposed to perform type 
>>>>>> inference.
>>>>>>
>>>>>> A GCC extension, __auto_type, is now avaialble in the new toolchain
>>>>>> baseline
>>>>>> and avoids the double textural expansion.
>>>>>>
>>>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>> Thankyou.
>>>>
>>>>>> diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
>>>>>> index 88bf26bc5109..38ef5d82ad95 100644
>>>>>> --- a/xen/include/xen/compiler.h
>>>>>> +++ b/xen/include/xen/compiler.h
>>>>>> @@ -64,6 +64,20 @@
>>>>>>  # define asm_inline asm
>>>>>>  #endif
>>>>>>
>>>>>> +/*
>>>>>> + * In C23, the auto keyword has been repurposed to perform type
>>>>>> inference.
>>>>>> + *
>>>>>> + * This behaviour is available via the __auto_type extension in
>>>>>> supported
>>>>>> + * toolchains.
>>>>>> + *
>>>>>> + *
>>>>>> https://www.gnu.org/software/c-intro-and-ref/manual/html_node/Auto-Type.html
>>>>>> + * https://clang.llvm.org/docs/LanguageExtensions.html#auto-type
>>>>>> + */
>>>>>> +#if !defined(__STDC_VERSION__) || __STDC_VERSION__ < 202311L
>>>>>> +/* SAF-3-safe MISRA C Rule 20.4: Giving the keyword it's C23
>>>>>> meaning. */
>>>>>> +#define auto __auto_type
>>>>>> +#endif
>>>>>> +
>>>>> A more detailed explanation should live in deviations.rst under this
>>>>> bullet point
>>>>>
>>>>>    * - R20.4
>>>>>      - The override of the keyword \"inline\" in xen/compiler.h is
>>>>> present so
>>>>>        that section contents checks pass when the compiler chooses not 
>>>>> to
>>>>>        inline a particular function.
>>>>>      - Comment-based deviation.
>>>>>
>>>>> as described in the SAF entry:
>>>>>
>>>>>         {
>>>>>             "id": "SAF-3-safe",
>>>>>             "analyser": {
>>>>>                 "eclair": "MC3A2.R20.4"
>>>>>             },
>>>>>             "name": "MC3A2.R20.4: allow the definition of a macro with
>>>>> the same name as a keyword in some special cases",
>>>>>             "text": "The definition of a macro with the same name as a
>>>>> keyword can be useful in certain configurations to improve the
>>>>> guarantees that can be provided by Xen. See docs/misra/deviations.rst
>>>>> for a precise rationale for all such cases."
>>>>>         },
>>>> Ah right.  What about this:
>>>>
>>>> "Xen does not use the \"auto\" keyword as a storage qualifier.  The
>>>> override of the keyword \"auto\" in xen/compiler.h is to give it it's
>>>> C23 behaviour of type inference."
>>>>
>>>> ?
>>> Seems good to me. Maybe this should be spelled out in ./CODING_STYLE as 
>>> well, so that newcomers don't trip over this?
>> I'm not sure newcomers would look there, but in the absence of any better
>> place that's perhaps indeed where to mention this.
> 
> How about this:
> 
> diff --git a/CODING_STYLE b/CODING_STYLE
> index 7bf3848444ad..e33b9d1170cf 100644
> --- a/CODING_STYLE
> +++ b/CODING_STYLE
> @@ -129,6 +129,10 @@ Fixed width types should only be used when a fixed width quantity is
>  meant (which for example may be a value read from or to be written to a
>  register).
>  
> +Macros which otherwise would use "typeof(arg) newarg =" to avoid double
> +evaluation of side effects should use "auto newarg =" per it's C23 behaviour,
> +to also avoid double textural expansion.
> +
>  Especially with pointer types, whenever the pointed to object is not
>  (supposed to be) modified, qualify the pointed to type with "const".

That doesn't focus on the pitfall though, in that people shouldn't be using
the "auto" keyword (except in said cases).

Jan

