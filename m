Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3815B27D3C
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 11:36:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083133.1442779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umqr9-0004IX-NV; Fri, 15 Aug 2025 09:36:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083133.1442779; Fri, 15 Aug 2025 09:36:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umqr9-0004GO-Kv; Fri, 15 Aug 2025 09:36:15 +0000
Received: by outflank-mailman (input) for mailman id 1083133;
 Fri, 15 Aug 2025 09:36:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5DW6=23=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umqr7-0004Ek-FV
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 09:36:13 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 47687d3a-79bb-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 11:36:11 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-6188b5b113eso2556506a12.0
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 02:36:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-618af9e0156sm1129573a12.25.2025.08.15.02.36.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Aug 2025 02:36:10 -0700 (PDT)
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
X-Inumbo-ID: 47687d3a-79bb-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755250571; x=1755855371; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6612q3TaD0wbHG2zsWzab6k3N6lA7slpYvrXGGQ8J0E=;
        b=PPK0mQnQlO8ilk/Sf5J022pfVVnStKnPTUkH3+y5yvP6TqfXn9WwvJGFePZieDQJbA
         EW9ZbKnvYseHUK7zmTAtL4Lv+JPQxAi07Jzac6GF6DaBz3DWzBMxKK/eVTBNx9L+PMQl
         0l/Xl0KAEoO+pcZ9qebPU8OxEtyp8/i1jnknUWw90SNEKr+9a+shS3+7mIbzVPlNi8Wv
         v1d7y5gkOt58fNBh6MrD3sjb/lC4h6W8q5HxlPmKmUC5Z0iWGYnL01IWnr1VDU5QJixD
         gtXaMJPxZmpQVydFNcOxezhVXTbnV68KSTfUw81TMLrzXuHsFIgjUShsGuD3RuFHl2cQ
         T1fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755250571; x=1755855371;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6612q3TaD0wbHG2zsWzab6k3N6lA7slpYvrXGGQ8J0E=;
        b=qkT/4IjWWVQd8YCqIyvTaWMCUQek1Pd4DS18teDqlMsQG2VVBvlMJYHifMvBdf1HSi
         +7/26kkPG7pne6S7sgBAS151YxUTLO5lvGN1mIfgDGsFmFe5sqVHXRH8U8KQZWwtMCbX
         yA2aXNMeM7p4fv4ypLli6eSnebPMOhQDfQt8KYc6Jwf+gCaucJHy3UvTscy7jC4UGp86
         5e8AZ4wuS8slWVnyMXaM9suIaXkqtndTIweKqNshe6LXsGRHq9Cx5UqhrpqZd3k5Ep1t
         7cXYIBbRm4YwSdBxmdY4Df95Y4iBzCQeLgY7LbY3Fy6r5YeDRrASMOncttl1+cxKYax6
         wECg==
X-Gm-Message-State: AOJu0YwaInuYbRAKFZMi+zXG3ZGYjhLWTq60Q+ckTYA8K2HgAEFjNlcp
	5J6U9CcGUxHe7P/RLf4s5T1VgPzwb/D0ZsirOyOGgn+GPDgJ6rrQqK84S7pYIkGZww==
X-Gm-Gg: ASbGncscqW2swdNFvv9txy+XEccDEDE+I5R9zWb81ssxhRAYn3Tf2mmlPaPetPwKtLG
	baAnwXp+IcaMdP+7+Im6w68c4CF5XJU/kS1lb4rpGbCifp5mDVdc7eI1RudxaTwgZLFa37EMm5m
	i2uH6G+o0t6tuMXQUGMEPfzF5cV4NbLNST3IOL7gAGCycdQcabGUe8V2YOJ7rzNSiOiqVQv/7EV
	MHrUf9TKMOqvHdppMFBW7/eKt03lmwj25laAo2iGWFrcJIYq+eOwzwC1HVtH0/DCXpxCSboW0oq
	Y/HIR9Lm2l+xN0X4JhEAl7J8XQDKd+gke9HuRzcBWkC+o5Fv76yOknMLn+4Pu3jTYdNwydd+Shw
	2FFahhyXqOnxROkTQRhNt1/GY0sxGnCSpUE+Wk9YGjWrxFxm5gzL3TSvwnG8p9YrXTcnJYPmYt2
	muqtCLEDI=
X-Google-Smtp-Source: AGHT+IEexVo7lmeSUMu/qNm7ecSdcIK6lwWUcvHbdjxs7VTtlrHeZasiqCOxYn0Rg6+XYUN5MOzxYA==
X-Received: by 2002:a05:6402:3509:b0:618:8964:bdda with SMTP id 4fb4d7f45d1cf-618b065baf6mr971764a12.23.1755250570870;
        Fri, 15 Aug 2025 02:36:10 -0700 (PDT)
Message-ID: <caf19e2b-046e-495f-b425-9cb3a0053006@suse.com>
Date: Fri, 15 Aug 2025 11:36:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: Use auto as per C23
To: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Roberto Bagnara <roberto.bagnara@bugseng.com>,
 "consulting @ bugseng . com" <consulting@bugseng.com>
References: <20250814222524.2638883-1-andrew.cooper3@citrix.com>
 <3056ed85948288639110e3cdd6b28c6e@bugseng.com>
 <f3ff5b2d-8077-4591-bf1f-bd658d705242@citrix.com>
 <7fc93aeef27153f1d6caa786bd44420f@bugseng.com>
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
In-Reply-To: <7fc93aeef27153f1d6caa786bd44420f@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 15.08.2025 10:33, Nicola Vetrini wrote:
> On 2025-08-15 10:17, Andrew Cooper wrote:
>> On 15/08/2025 8:20 am, Nicola Vetrini wrote:
>>> On 2025-08-15 00:25, Andrew Cooper wrote:
>>>> In macros it is common to declare local variables using typeof(param)
>>>> in order
>>>> to ensure that side effects are only evaluated once.  A consequence
>>>> of this is
>>>> double textural expansion of the parameter, which can get out of hand
>>>> very
>>>> quickly with nested macros.
>>>>
>>>> In C23, the auto keyword has been repurposed to perform type 
>>>> inference.
>>>>
>>>> A GCC extension, __auto_type, is now avaialble in the new toolchain
>>>> baseline
>>>> and avoids the double textural expansion.
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>
>>> Reviewed-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>
>> Thankyou.
>>
>>>>
>>>> diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
>>>> index 88bf26bc5109..38ef5d82ad95 100644
>>>> --- a/xen/include/xen/compiler.h
>>>> +++ b/xen/include/xen/compiler.h
>>>> @@ -64,6 +64,20 @@
>>>>  # define asm_inline asm
>>>>  #endif
>>>>
>>>> +/*
>>>> + * In C23, the auto keyword has been repurposed to perform type
>>>> inference.
>>>> + *
>>>> + * This behaviour is available via the __auto_type extension in
>>>> supported
>>>> + * toolchains.
>>>> + *
>>>> + *
>>>> https://www.gnu.org/software/c-intro-and-ref/manual/html_node/Auto-Type.html
>>>> + * https://clang.llvm.org/docs/LanguageExtensions.html#auto-type
>>>> + */
>>>> +#if !defined(__STDC_VERSION__) || __STDC_VERSION__ < 202311L
>>>> +/* SAF-3-safe MISRA C Rule 20.4: Giving the keyword it's C23
>>>> meaning. */
>>>> +#define auto __auto_type
>>>> +#endif
>>>> +
>>>
>>> A more detailed explanation should live in deviations.rst under this
>>> bullet point
>>>
>>>    * - R20.4
>>>      - The override of the keyword \"inline\" in xen/compiler.h is
>>> present so
>>>        that section contents checks pass when the compiler chooses not 
>>> to
>>>        inline a particular function.
>>>      - Comment-based deviation.
>>>
>>> as described in the SAF entry:
>>>
>>>         {
>>>             "id": "SAF-3-safe",
>>>             "analyser": {
>>>                 "eclair": "MC3A2.R20.4"
>>>             },
>>>             "name": "MC3A2.R20.4: allow the definition of a macro with
>>> the same name as a keyword in some special cases",
>>>             "text": "The definition of a macro with the same name as a
>>> keyword can be useful in certain configurations to improve the
>>> guarantees that can be provided by Xen. See docs/misra/deviations.rst
>>> for a precise rationale for all such cases."
>>>         },
>>
>> Ah right.  What about this:
>>
>> "Xen does not use the \"auto\" keyword as a storage qualifier.  The
>> override of the keyword \"auto\" in xen/compiler.h is to give it it's
>> C23 behaviour of type inference."
>>
>> ?
> 
> Seems good to me. Maybe this should be spelled out in ./CODING_STYLE as 
> well, so that newcomers don't trip over this?

I'm not sure newcomers would look there, but in the absence of any better
place that's perhaps indeed where to mention this.

I am, however, still not quite sure if we're doing ourselves a favor with
the re-purposing of auto (while not using C23 in general). It'll certainly
hit me as unexpected, for some time, to see uses of the keyword. It simply
has been for too long that it had its earlier meaning (of very limited use).

Jan

