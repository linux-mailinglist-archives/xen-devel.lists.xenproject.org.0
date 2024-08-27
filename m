Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29B04961007
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2024 17:05:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.784166.1193580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sixkh-0000Fm-1N; Tue, 27 Aug 2024 15:04:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 784166.1193580; Tue, 27 Aug 2024 15:04:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sixkg-0000Ck-TU; Tue, 27 Aug 2024 15:04:58 +0000
Received: by outflank-mailman (input) for mailman id 784166;
 Tue, 27 Aug 2024 15:04:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tHc6=P2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sixkf-0000Ce-1P
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2024 15:04:57 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b86e6123-6485-11ef-a0b0-8be0dac302b0;
 Tue, 27 Aug 2024 17:04:56 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-5343d2af735so4201589e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 27 Aug 2024 08:04:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a86e582d8a3sm120775366b.136.2024.08.27.08.04.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Aug 2024 08:04:55 -0700 (PDT)
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
X-Inumbo-ID: b86e6123-6485-11ef-a0b0-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724771095; x=1725375895; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=n+VagzEb5uChgRmU+PmbRm9keAJ4VXJ0Ct20vb0wnSg=;
        b=EPW0DCN9kizXwdwX9NosKCMHVv0rtEW/qZOPOs+gglMY+SmQkzkgQmdlr7WKJRaJ6c
         fPTBw7b1KOZmWwX48asrNMwU4dzJ2HUyojT1fimGZ9t5cxQp8TTBqSuO9z4ZOG6bihxO
         abjC+2gfJJGaXaFs7GrrxSHQY4t5dumXgZqB8NE2iA7hMTaI80I7TqL759/Ei0TS8S9C
         sC6ceWk6QolU6hdGBYidy1c+2sUAX6qEBf8Tuk9AnW+AX0Y38rPYq0TP/b/pjo9RY5iG
         D77F//9aJEMXkDd01bkp08pYPWQxPfnowMSCO1lrGSs5h3R+hagYmAmn5vdQWZom4nVp
         dFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724771095; x=1725375895;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n+VagzEb5uChgRmU+PmbRm9keAJ4VXJ0Ct20vb0wnSg=;
        b=aXiUt7ZKSIy3GCt76/tPeVyup/4SrU1FHE1CYMlngfRrUz5lMwL5ccKcuP3XVI4QvU
         s0jJTKvqxy5utpRU6MbWmueLD2atMZ+ZwpzGTDKQiVcp2ypN9M5bOCPX7Sia9rCPFjcz
         R180EpcWCu6tWya50rnlebgGsj6vPFtrQ7NLhFaSCPTvxKfdbg5Jljd4FfgAb09BOWgW
         VbBk5yk2RlFmoCTvCPzlRS1FAYUpTKvrvUdHJK6sRPeKtflFWZ++BH4nPqkfOjtfLSf0
         Bh9RiLHB58/39uxJ+gyc8Ew8SPVutomOoUgzjWIqqAOTR3EP/2JtNOHbYs0VwRBX+cfv
         TxQA==
X-Forwarded-Encrypted: i=1; AJvYcCVhtLV1pI1KjBfDkCGCOANmsjqHhvAdfJlfmXKCwY/XMW7CcN8vOASsb3+yRtR+U/PDUWuzgULATEs=@lists.xenproject.org
X-Gm-Message-State: AOJu0YycDoAPavmEZ/hkXBN5/qE7K6qwN1CeVlF3TE6xXJwhrxyGSShe
	RA5PJsihQ9JBPjlv1Y4IBfgDvBbCn5mRCtLTW6AfBtzUHULf029X0y22W5GIGfvr7RLYsxa4Sqo
	=
X-Google-Smtp-Source: AGHT+IE8JxhL5Sr82z6lHL/PYpQwenbgBsP/5WBaSVgUm/FOmt4OOnlVwmUvOO6h5W9Wrb0SrWhdNw==
X-Received: by 2002:a05:6512:e9a:b0:530:c212:4a5a with SMTP id 2adb3069b0e04-5344e3c9983mr2165789e87.22.1724771095324;
        Tue, 27 Aug 2024 08:04:55 -0700 (PDT)
Message-ID: <22585e0f-b1d6-49b0-a04f-fe9161f79ea2@suse.com>
Date: Tue, 27 Aug 2024 17:04:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] x86/bitops: Use the POPCNT instruction when available
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240822230635.954557-1-andrew.cooper3@citrix.com>
 <20240822230635.954557-10-andrew.cooper3@citrix.com>
 <03febf18-516b-4677-a0a5-102036c91a29@suse.com>
 <3300b035-46d7-41d3-9908-1a0093c433e8@citrix.com>
 <89a5586b-bc9d-47da-a2b6-36e2208a6317@suse.com>
 <f924efc6-825f-4101-97e7-7bff9a50e5c6@citrix.com>
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
In-Reply-To: <f924efc6-825f-4101-97e7-7bff9a50e5c6@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.08.2024 16:59, Andrew Cooper wrote:
> On 27/08/2024 1:47 pm, Jan Beulich wrote:
>> On 27.08.2024 13:17, Andrew Cooper wrote:
>>> On 26/08/2024 2:07 pm, Jan Beulich wrote:
>>>> On 23.08.2024 01:06, Andrew Cooper wrote:
>>>>> @@ -475,4 +476,24 @@ static always_inline unsigned int arch_flsl(unsigned long x)
>>>>>  }
>>>>>  #define arch_flsl arch_flsl
>>>>>  
>>>>> +static always_inline unsigned int arch_hweightl(unsigned long x)
>>>>> +{
>>>>> +    unsigned int r;
>>>>> +
>>>>> +    /*
>>>>> +     * arch_generic_hweightl() is written in ASM in order to preserve all
>>>>> +     * registers, as the compiler can't see the call.
>>>>> +     *
>>>>> +     * This limits the POPCNT instruction to using the same ABI as a function
>>>>> +     * call (input in %rdi, output in %eax) but that's fine.
>>>>> +     */
>>>>> +    alternative_io("call arch_generic_hweightl",
>>>>> +                   "popcnt %[val], %q[res]", X86_FEATURE_POPCNT,
>>>>> +                   ASM_OUTPUT2([res] "=a" (r) ASM_CALL_CONSTRAINT),
>>>>> +                   [val] "D" (x));
>>>> If you made [val] an output ("+D") you could avoid preserving the register
>>>> in the function. And I'd expect the register wouldn't be re-used often
>>>> afterwards, so its clobbering likely won't harm code quality very much.
>>> "+D" means it's modified by the asm, which forces preservation of the
>>> register, if it's still needed afterwards.
>>>
>>> Plain "D" means not modified by the asm, which means it can be reused if
>>> necessary.
>> And we likely would prefer the former: If the register's value isn't
>> use afterwards (and that's the case as far as the function on its own
>> goes), the compiler will know it doesn't need to preserve anything.
>> That way, rather than always preserving (in the called function)
>> preservation will be limited to just the (likely few) cases where the
>> value actually is still needed afterwards.
> 
> Constraints are there to describe how the asm() behaves to the compiler.
> 
> You appear to be asking me to put in explicitly-incorrect constraints
> because you think it will game the optimiser.
> 
> Except the reasoning is backwards.  The only thing forcing "+D" will do
> is cause the compiler to preserve the value elsewhere if it's actually
> needed later, despite the contents of %rdi still being good for the purpose.
> 
> In other words, using "+D" for asm which is really only "D" (as this one
> is) will result in strictly worse code generation in the corner case you
> seem to be worried about.

Well, then leave it as is. (An extra benefit would have been that
arch_generic_hweightl() then would ended up with a odd-number-of-slots
stack frame. Not that this matters much, but having ABI-compliant
functions where possible seems always preferable, when possible.)

Jan

