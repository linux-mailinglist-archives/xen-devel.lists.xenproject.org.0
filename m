Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25184B30E8C
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 08:11:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089520.1447050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upKzO-0001my-DE; Fri, 22 Aug 2025 06:11:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089520.1447050; Fri, 22 Aug 2025 06:11:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upKzO-0001lM-9T; Fri, 22 Aug 2025 06:11:02 +0000
Received: by outflank-mailman (input) for mailman id 1089520;
 Fri, 22 Aug 2025 06:11:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RDWw=3C=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1upKzM-0001lG-IF
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 06:11:00 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5a00b3d-7f1e-11f0-a32b-13f23c93f187;
 Fri, 22 Aug 2025 08:10:59 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-afcb732eee6so284028266b.0
 for <xen-devel@lists.xenproject.org>; Thu, 21 Aug 2025 23:10:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afdf63c85efsm452003366b.10.2025.08.21.23.10.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Aug 2025 23:10:58 -0700 (PDT)
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
X-Inumbo-ID: c5a00b3d-7f1e-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755843058; x=1756447858; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NxhrtaM48Eha+8pwXYiw+DRlJmG2Xq8UwkyvehuSeIw=;
        b=hCSGbOKd9sSXtNZ7C/miMODGrH3dHPAMeq0gY6VsfNoimOX6GLzKYJQcGPSJDPvd5O
         VEZypL+19XOGVNqpQyLtw8/xjF1yiO0DfzGOXCp+5C0v+aEWCwGdJsN4odAMvieR0t+x
         98PVQbesf0crgLLWLYfzdCDzlkUYJR5F/c62aTdfh5A6HaKjk2VeLXFQZYziTfd0/lJM
         2iNOlJGJI4z1ZBu5HIka/B3WPyMjT29rmQ0zTDwX1pAXTdLxsqmJDQySmB6zGR6X/qCi
         +Xa6gtQ8p818Qv3M1dKWjXZS7Z2GGS+XZQ/tBcciABXrr2FpSuAtsPCPRy563q1EZDAd
         ECDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755843058; x=1756447858;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NxhrtaM48Eha+8pwXYiw+DRlJmG2Xq8UwkyvehuSeIw=;
        b=B1Jsnj3GZPESYHCS7Wa2aw68QO1wR/H4PmEFYHWQDdMUEZKSgMLIoqgRJE1o7ztdKl
         I67NFod5GshyogrW535Ygtki9QfUTvhnmuYOBn9W/oIF/SueCpelLRf83AbBPqjR+ufI
         deAkVBia0DWImQoqEqSsQYVWBWHAkmm5+U+fignttHr/Ok+8SNF+2nvrhjJB6/a8Pr9Q
         cOKk71BT1R+ZJ5YXpjNh3xRkxzxJ0NSLSzFOGuBOOwQsawrxduTexnb3g94SfpB5w8sA
         AF6VmIHELGXAyM9Xtki6TCeVvMnX3D4k2zrV0HzJCZYJXEsNAkJemYMW4ErfCkjP0ykz
         a9gA==
X-Forwarded-Encrypted: i=1; AJvYcCWWUrROejE4mp5hX2q+N7N7deFgTbGH5s7C4JoMl6PCrs/3ifALK7nrKikXvooLgj+RHcUzDA1lrCE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxmzRa5SDkq7NpbDagK/kIoDG1T95g+EmtZa7YINkVZbiBLjUnt
	88E+SPl46SW9a4TMF2EsLvYfyxnWmwtMbk80dLx5DVsdVIsFsz3/aIFkd23CjjVCHw==
X-Gm-Gg: ASbGncu9Si6KwdCbozJjmkE4u/lHXw2PiIvkWWzgKIse/GnOVGfvwCAoq8PHmt6RkkB
	0M7EQHvY1OGsVU0BINpUndDRbtk8N/0TsyYAn/NYOEA1NCpBt8POq2gaYZp+Ex2paTB+19KpLYW
	aFKLrlp4H0PEmUrWNVXwZPHiUXlF0G4cctSeUGjdwFUN96ZKKOvIM7mf1t5/mg9C38vjfLWtFJk
	TTLUHGctTTRPbB54F76TCMh2thPGNLZK/kwXIPsbEkLQd/fKdhW9oYSL3H+cfxWfUoS43zECpQ1
	rHUbJ8rrg++UB7I1j3KwZxj2AGvsfECSzji2fdf4Orj0gnqQsmSUHYltNwaZuSUxWUMmbmyK6Jy
	nkdy18DuNBdBq/4kQLNMudepWUgmsxuoCt9GAXJaKZ79838sBGeQrgIAVJPjR0YovYEOxdLI5k0
	3H/2/OmrMpLnKpRT+bZQ==
X-Google-Smtp-Source: AGHT+IECGevi2FLPt+tT2fMOicBYwOG2rftt9rfArE9IpPLdOgsOLPsyMZIeL65giqgHMTlBIiFsog==
X-Received: by 2002:a17:906:3c4c:b0:af9:7b49:c0 with SMTP id a640c23a62f3a-afe29527227mr117818966b.29.1755843058499;
        Thu, 21 Aug 2025 23:10:58 -0700 (PDT)
Message-ID: <9983e3e2-1436-43ca-9e98-57fa23d31885@suse.com>
Date: Fri, 22 Aug 2025 08:10:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/16] x86/msr: Rework rdmsr_safe() using asm goto()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
 <20250815204117.3312742-3-andrew.cooper3@citrix.com>
 <aa57cc7c-c659-4949-aaed-4484ead54ffc@suse.com>
 <7b836f06-74ab-4588-8aeb-d0105b54be91@citrix.com>
 <01ece885-1363-4aac-99ce-205354419400@suse.com>
 <885c3544-1a4b-492b-bd3c-dd2e818d7eff@citrix.com>
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
In-Reply-To: <885c3544-1a4b-492b-bd3c-dd2e818d7eff@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.08.2025 18:20, Andrew Cooper wrote:
> On 19/08/2025 5:23 pm, Jan Beulich wrote:
>> On 19.08.2025 15:52, Andrew Cooper wrote:
>>> On 18/08/2025 12:27 pm, Jan Beulich wrote:
>>>> On 15.08.2025 22:41, Andrew Cooper wrote:
>>>>> ... on capable toolchains.
>>>>>
>>>>> This avoids needing to hold rc in a register across the RDMSR, and in most
>>>>> cases removes direct testing and branching based on rc, as the fault label can
>>>>> be rearranged to directly land on the out-of-line block.
>>>>>
>>>>> There is a subtle difference in behaviour.  The old behaviour would, on fault,
>>>>> still produce 0's and write to val.
>>>>>
>>>>> The new behaviour only writes val on success, and write_msr() is the only
>>>>> place where this matters.  Move temp out of switch() scope and initialise it
>>>>> to 0.
>>>> But what's the motivation behind making this behavioral change? At least in
>>>> the cases where the return value isn't checked, it would feel safer if we
>>>> continued clearing the value. Even if in all cases where this could matter
>>>> (besides the one you cover here) one can prove correctness by looking at
>>>> surrounding code.
>>> I didn't realise I'd made a change at first, but it's a consequence of
>>> the compiler's ability to rearrange basic blocks.
>>>
>>> It can be fixed with ...
>>>
>>>>> --- a/xen/arch/x86/include/asm/msr.h
>>>>> +++ b/xen/arch/x86/include/asm/msr.h
>>>>> @@ -55,6 +55,24 @@ static inline void wrmsrns(uint32_t msr, uint64_t val)
>>>>>  /* rdmsr with exception handling */
>>>>>  static inline int rdmsr_safe(unsigned int msr, uint64_t *val)
>>>>>  {
>>>>> +#ifdef CONFIG_CC_HAS_ASM_GOTO_OUTPUT
>>>>> +    uint64_t lo, hi;
>>>>> +    asm_inline goto (
>>>>> +        "1: rdmsr\n\t"
>>>>> +        _ASM_EXTABLE(1b, %l[fault])
>>>>> +        : "=a" (lo), "=d" (hi)
>>>>> +        : "c" (msr)
>>>>> +        :
>>>>> +        : fault );
>>>>> +
>>>>> +    *val = lo | (hi << 32);
>>>>> +
>>>>> +    return 0;
>>>>> +
>>>>> + fault:
>>>     *val = 0;
>>>
>>> here, but I don't want to do this.  Because val is by pointer and
>>> generally spilled to the stack, the compiler can't optimise away the store.
>> But the compiler is dealing with such indirection in inline functions just
>> fine. I don't expect it would typically spill val to the stack. Is there
>> anything specific here that you think would make this more likely?
> 
> Yes.  The design of the functions they're used in.  Adding this line
> results in:
> 
> add/remove: 0/0 grow/shrink: 7/2 up/down: 109/-36 (73)
> Function                                     old     new   delta
> read_msr                                    1243    1307     +64
> resource_access                              326     341     +15
> hwp_init_msrs.cold                           297     308     +11
> probe_cpuid_faulting                         168     175      +7
> svm_msr_read_intercept                      1034    1039      +5
> hwp_write_request                            113     117      +4
> hwp_init_msrs                                371     374      +3
> amd_log_freq                                 844     828     -16
> guest_rdmsr                                 2168    2148     -20
> 
> Taking read_msr() as a concrete example, this is because it's a store
> into a parent functions variable, not into a local variable, and cannot
> be elided.
> 
> 
>>
>>> I'd far rather get a real compiler error, than to have logic relying on
>>> the result of a faulting MSR read.
>> A compiler error? (Hmm, perhaps you think of uninitialized variable
>> diagnostics. That may or may not trigger, depending on how else the
>> caller's variable is used.)
> 
> Yes I was referring to the uninitialised variable diagnostic.  *_safe()
> are fairly rare, and we've got plenty of coverage in CI.

Well, okay, slightly hesitantly
Reviewed-by: Jan Beulich <jbeulich@suse.com>
preferably with the paragraph in the description that I commented on
slightly expanded to cover the "why" aspect.

Jan

