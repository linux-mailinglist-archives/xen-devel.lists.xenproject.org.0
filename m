Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 38235B2F295
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 10:44:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1088200.1446004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up0tz-0004mk-G7; Thu, 21 Aug 2025 08:44:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1088200.1446004; Thu, 21 Aug 2025 08:44:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1up0tz-0004lK-D9; Thu, 21 Aug 2025 08:44:07 +0000
Received: by outflank-mailman (input) for mailman id 1088200;
 Thu, 21 Aug 2025 08:44:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Hha=3B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1up0tx-0004lE-MU
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 08:44:05 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb60859f-7e6a-11f0-b898-0df219b8e170;
 Thu, 21 Aug 2025 10:43:59 +0200 (CEST)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-6188b7550c0so1117216a12.2
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 01:43:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afded2bc310sm346538966b.5.2025.08.21.01.43.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 01:43:58 -0700 (PDT)
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
X-Inumbo-ID: fb60859f-7e6a-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755765839; x=1756370639; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HvcuYgXjK6airQth5Akct7/Vr+xine1eiyg9x2GPsf8=;
        b=Qxpuh6EWYwa6VDBenxGUVhk7MEN28x1qDJANRE7ODNXBEqOMiFqgJBkJwANe/qqWpa
         ZzNW4KMem4oM5gYscVUyQ+GhE7I5Sx+oMV3/fqymCK1Hxv2oXxWNcSxo+uX7twAO+bRF
         lisi6kViQuiQGVVjgBVixFwUoRzrXt+yPHomHwbFIeGMVBVEg2487ry5e3WsucFcGn0x
         7K66ym/W0PWv38phJhCmWOZeaCSs5FteqNmrfQSimVpiyQKfloX6O+nYhOJedcGsMxVg
         Eijc5fvo+hvkdvgWVw70u7eygXbWwvRbgso5PWtc9RgXLkdWAoJVTsL7r/NIUiwDl+Ia
         apeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755765839; x=1756370639;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HvcuYgXjK6airQth5Akct7/Vr+xine1eiyg9x2GPsf8=;
        b=IWPc06nzaeHbq3YTrAe37vQhHnZUM4n4Eg3777ZePhphbFbRSsCUMi4Iw1ii3p6r6l
         ABZBoa3lYbxCrV3BqPpm8I5j7HUKz0J1ku0OiqxS4YFM3Emx6eSiGroXMRHuj1WlEVrA
         5Q0ZMvK66fd+XwmEQWgBiDUMa+OoBFXv9kpJHtf4JF0fvIr+cTOH//OT5mJ9NFJYvoKJ
         nx1wghEncHU71yfK2dG2s9VtMp6MpQ4/un2fsapmRUIeuIyIumSXajlNAxlzbsn+nEm2
         rob2v6pBHQGev9p7FJxNRCvxJR6B2hsxiiANOwfq0viUTYrLXn3SrnVgTtkP6kzmReRa
         SpuA==
X-Forwarded-Encrypted: i=1; AJvYcCV7yeWI8hl4J1CxbUsySONDQ+zNNuclMk9obfNzSiJOqG0neU90ePl00HAJPaCBaO9AujdP0FHTrnI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyYVr+TXe0hUPHSBOCO+aJZIKBTe3n4Z054Mfrm6MqN6FGlemXx
	NQWMbBOFmoQ99vUUMiJ9pJKrdDsWMkoEi8JhJG8oOKiHkEZkC5eIjuagaiPebAUduQ==
X-Gm-Gg: ASbGncseVtqWSTL1LFnk5mLyZjr+LYzfiVHN3UKfcf7fZ3l3ibXaEd648lhY8s0Njha
	UUZme97GU05hNmr8uKMW3LHXzxeATaNJrHeYKn7imFui42/h7HrKC64bJYTlGGzyIR92z83g5Hx
	OAaCuJgNuOHRIGXY+Kh0UyLXSZ5SMsnZLU4Oa0xobXSDzZlPL99JAuRjp2/mtGzLHw+WqEUimb0
	t/+Ugc1nGKi9GRlFSNROJtslU5pxl8u7th46RAW8e8TmCQBWIrHX/dXKOdJKQW+MHX1f5Eo7tcH
	UsdjgOhqhlhAHgWfO9VNdm6SazE772U3fxFuaTbG7KtMEi2TGLYfeFpuHAkyUXan+MUbVItUnhu
	vv0A7VhbVtxq0LprtNgnVsRoZm+beDe+jLsPLq8hQHHq+4EMN0t85aRHmfYjXoe1k8jmMLuW034
	nbPI/9sryqeLT13ISXzw==
X-Google-Smtp-Source: AGHT+IGCjPT1xyNwuZCR3Jg0OFLrxYx6Jor6bxa/5AM7KD7tHLXEJV8y83wMDOr4DW9pz1pr2jiY8g==
X-Received: by 2002:a17:907:3f86:b0:ae0:da2f:dcf3 with SMTP id a640c23a62f3a-afe07d695e5mr142047666b.59.1755765839062;
        Thu, 21 Aug 2025 01:43:59 -0700 (PDT)
Message-ID: <06e2b225-fe82-4c69-a8a1-affdecdc195c@suse.com>
Date: Thu, 21 Aug 2025 10:43:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] misra: consider conversion from UL or (void*) to function
 pointer as safe
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <9e5e4ff2c7ba0a90a6ac403e2de9318e18949274.1755628705.git.dmytro_prokopchuk1@epam.com>
 <90fb95a3-4b32-4785-a77c-373e5b9da6ed@suse.com>
 <e1e2abdf0ef8708097aa78440eeb7147@bugseng.com>
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
In-Reply-To: <e1e2abdf0ef8708097aa78440eeb7147@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.08.2025 10:25, Nicola Vetrini wrote:
> On 2025-08-21 10:01, Jan Beulich wrote:
>> On 19.08.2025 20:55, Dmytro Prokopchuk1 wrote:
>>> Rule 11.1 states as following: "Conversions shall not be performed
>>> between a pointer to a function and any other type."
>>>
>>> The conversion from unsigned long or (void *) to a function pointer
>>> is safe in Xen because the architectures it supports (e.g., x86 and
>>> ARM) guarantee compatible representations between these types.
>>
>> I think we need to be as precise as possible here. The architectures
>> guarantee nothing, they only offer necessary fundamentals. In the
>> Windows x86 ABI, for example, you can't convert pointers to/from longs
>> without losing data. What we build upon is what respective ABIs say,
>> possibly in combination of implementation specifics left to compilers.
>>
> 
> +1, a mention of the compilers and targets this deviation relies upon is 
> needed.
> 
>>> --- a/docs/misra/deviations.rst
>>> +++ b/docs/misra/deviations.rst
>>> @@ -370,6 +370,16 @@ Deviations related to MISRA C:2012 Rules:
>>>         to store it.
>>>       - Tagged as `safe` for ECLAIR.
>>>
>>> +   * - R11.1
>>> +     - The conversion from unsigned long or (void \*) to a function 
>>> pointer does
>>> +       not lose any information or violate type safety assumptions if 
>>> unsigned
>>> +       long or (void \*) type is guaranteed to be the same bit size 
>>> as a
>>> +       function pointer. This ensures that the function pointer can 
>>> be fully
>>> +       represented without truncation or corruption. The macro 
>>> BUILD_BUG_ON is
>>> +       integrated into xen/common/version.c to confirm conversion 
>>> compatibility
>>> +       across all target platforms.
>>> +     - Tagged as `safe` for ECLAIR.
>>
>> Why the escaping of * here, when ...
>>
>>> --- a/docs/misra/rules.rst
>>> +++ b/docs/misra/rules.rst
>>> @@ -431,7 +431,13 @@ maintainers if you want to suggest a change.
>>>       - All conversions to integer types are permitted if the 
>>> destination
>>>         type has enough bits to hold the entire value. Conversions to 
>>> bool
>>>         and void* are permitted. Conversions from 'void noreturn 
>>> (*)(...)'
>>> -       to 'void (*)(...)' are permitted.
>>> +       to 'void (*)(...)' are permitted. Conversions from unsigned 
>>> long or
>>> +       (void \*) to a function pointer are permitted if the source 
>>> type has
>>> +       enough bits to restore function pointer without truncation or 
>>> corruption.
>>> +       Example::
>>> +
>>> +           unsigned long func_addr = (unsigned long)&some_function;
>>> +           void (*restored_func)(void) = (void (*)(void))func_addr;
>>
>> ... context here suggests they work fine un-escaped, and you even add 
>> some un-
>> escaped instances as well. Perhaps I'm simply unaware of some 
>> peculiarity?
> 
> This is a literal rst block, while the other is not (* acts as a bullet 
> point in rst iirc)

But everything here is bullet-pointed (with at least two levels)?

Jan

