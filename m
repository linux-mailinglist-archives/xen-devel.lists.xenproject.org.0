Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 452D4C04930
	for <lists+xen-devel@lfdr.de>; Fri, 24 Oct 2025 08:52:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1149929.1481308 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCBeE-0008JC-TY; Fri, 24 Oct 2025 06:51:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1149929.1481308; Fri, 24 Oct 2025 06:51:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vCBeE-0008HK-Qt; Fri, 24 Oct 2025 06:51:38 +0000
Received: by outflank-mailman (input) for mailman id 1149929;
 Fri, 24 Oct 2025 06:51:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+XhT=5B=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vCBeE-0008HE-5A
 for xen-devel@lists.xenproject.org; Fri, 24 Oct 2025 06:51:38 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e26bdb40-b0a5-11f0-9d16-b5c5bf9af7f9;
 Fri, 24 Oct 2025 08:51:36 +0200 (CEST)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-42966ce6dbdso1095681f8f.0
 for <xen-devel@lists.xenproject.org>; Thu, 23 Oct 2025 23:51:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429898add8bsm7472641f8f.23.2025.10.23.23.51.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Oct 2025 23:51:35 -0700 (PDT)
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
X-Inumbo-ID: e26bdb40-b0a5-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761288696; x=1761893496; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/h4sGnBy5P+204SEtTP7BLrBaFVp0ezKagqLkinbr2I=;
        b=Bzo+VfV7ZWdlkJDJ6q9J4ryp+uIqahCfZkDqXZ897sToUJQnOzdYgkP8M6yyn/p2HP
         EfDeN0rUEnvmOv9JPRY13LxASJtrtITiBcKXf2EO/hed0zw3yjeFW4H5rbEqBGfBzSbu
         cFpXSQMuw/GyjQ7nA8NLax5fqUqaBsFtxNizvafOcjVJGxbx6GJhgI9uXuN5sCOjySo9
         Nv4fy2rYwmv459HI2t2PG2w7bqORWxBZtqDZhbpBCuvG0DhFRRdVGvxObro0ZwiwP/9F
         uYluiitzYPtcoNTRIK1Azoikp3XnWYBLN8jxNlS43/8MoqADDxSADX43/XyWB4eRsxbn
         DerQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761288696; x=1761893496;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/h4sGnBy5P+204SEtTP7BLrBaFVp0ezKagqLkinbr2I=;
        b=Jy/TY12Bji0LAaYkwhQuFbQh+4yTe8L9cISSwcY3SMutshZRKiVI4fIyZvaZK5+4BT
         WLd+5d9mosr6XhSwae3F29zl/WvMi3aRPoAcZ9tkX5E7UuOe5kbUWx1oTIr4VcIPYatK
         m9xxTPoStdTdiqJV/MeMx0W0Qsp8AFy9oPDNKqePeUmv2mT7wNlF54njfkGTSUD3Jp/i
         N1qqO27oUBPvDu28+kCW47CNW0AAzO5C33W5vc9sMcMaJfFXp/Lx9raScHnluIDB1mie
         6DD2H+X9bFOni4j5/mrNJCtp+vprfKbDNRi+WaW3osWoWakaGhS9+oCQBvS9RFhJuY1z
         SENw==
X-Forwarded-Encrypted: i=1; AJvYcCXb921V8DTI2XZwg0p8PQ7qAsA8RxG5Z2LPiZN0GqpB7NXy7bz4se0L/q8gAMiZ0+tSmno/elMNhgQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyeG3EOb2Pr8ih3OY7F0+vuSxLxHgmG5rD+3IHlXvC/63dLK87W
	KiufBH1CVXqukvMCj94oCiPd824o6HobAVv19vMcSh+HaqGGhqtgFjJv0VXEN4Hu7Q==
X-Gm-Gg: ASbGncskKKcVkZMAemkEZ1mJ6tbWnabSjiQex0JX3lCq7LPXCVh4TiNKVGzB1PREmJm
	OUNdyCuCU19FDOkfLzOVW7GDjWo3O2GaeZ7LMb7TYai2hcuBrz/+LH5NBQYUztZOyrYdL6eztrX
	fT78xOffdiPv4P7Gj+2SrLFrqaHpK4BUWW9nbzq+Y7ZV4eqZJ5YmxvO1TMfv6wBiDzFZvsL9MF9
	uituAs3bKGtNcCBSbd1hgCWkPkMcUMZdqJf0SMJo0NJ7aLUADuDfNmhpfdoQkzBvW8lDiQ+v05J
	VkiRjaKTwe3qR9Q+NJYcw0rO7YooomSbYA2DhHpNpb25nKgiDmSr1NqxBCpPPfZdyG3bBM2F12V
	+hTYfaMCA+/zXzdC//kCotFzEHQCG26Ff0cW+Wjdsxp7HQshy84EPAaoGVK4KyrXkSUobxhVusr
	kw8DadBSjBP4apmpv1ptaSYFwcLAqBV9s+rzXIw4ry/exVWqfUJD7WAMyLHkSz
X-Google-Smtp-Source: AGHT+IFxYxxPqSA80BfjAf+Mbsemr4HP5Kkuatt8qMc55dWqgGKkMghT70p69uzE1ae7Yxtv2fKw/g==
X-Received: by 2002:a05:6000:200f:b0:428:3e7f:88c3 with SMTP id ffacd0b85a97d-4283e7f8a82mr14252514f8f.50.1761288695857;
        Thu, 23 Oct 2025 23:51:35 -0700 (PDT)
Message-ID: <cf91ebe9-7753-4f38-af2d-00b7b35cf1a3@suse.com>
Date: Fri, 24 Oct 2025 08:51:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] misra: consider conversion from UL or (void*) to
 function pointer as safe
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <0e72c83102668dfa6f14c4e8f9839b4a73d30b3d.1760458094.git.dmytro_prokopchuk1@epam.com>
 <ceedeefa-c506-41ca-9dfc-76937979caa9@suse.com>
 <321363444f9a3d3471bf1b3b2e020047@bugseng.com>
 <0767a5c4-6a2c-4ed0-92d3-f9f89313ad85@epam.com>
 <64411f5b-a826-48b6-9122-bf80ac377c7a@suse.com>
 <9a09cbab-851c-46f1-8026-603a7cb9d79b@epam.com>
 <5a6d1670-ce9e-4264-bbea-786df5cc5679@suse.com>
 <276064a9-619c-4d08-ac9e-0f92f01cef10@epam.com>
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
In-Reply-To: <276064a9-619c-4d08-ac9e-0f92f01cef10@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.10.2025 18:01, Dmytro Prokopchuk1 wrote:
> On 10/23/25 17:41, Jan Beulich wrote:
>> On 23.10.2025 15:57, Dmytro Prokopchuk1 wrote:
>>> On 10/23/25 13:23, Jan Beulich wrote:
>>>> On 23.10.2025 12:00, Dmytro Prokopchuk1 wrote:
>>>>> On 10/17/25 10:09, Nicola Vetrini wrote:
>>>>>> On 2025-10-15 08:20, Jan Beulich wrote:
>>>>>>> On 14.10.2025 18:16, Dmytro Prokopchuk1 wrote:
>>>>>>>> --- a/xen/common/version.c
>>>>>>>> +++ b/xen/common/version.c
>>>>>>>> @@ -217,6 +217,20 @@ void __init xen_build_init(void)
>>>>>>>>    #endif /* CONFIG_X86 */
>>>>>>>>    }
>>>>>>>>    #endif /* BUILD_ID */
>>>>>>>> +
>>>>>>>> +#if defined(__i386__) || defined(__x86_64__) || defined(__arm__) ||
>>>>>>>> defined(__aarch64__)
>>>>>>>
>>>>>>> Why __i386__? Also (nit): Line too long.
>>>>>
>>>>> Well, I copied this line from Xen codebase,
>>>>> but yeah, __i386__ is outdated now.
>>>>> I'll remove it.
>>>>>
>>>>>>>
>>>>>>> And why this restriction without any comment here or ...
>>>>>>>
>>>>>>>> +static void __init __maybe_unused build_assertions(void)
>>>>>>>> +{
>>>>>>>> +    /*
>>>>>>>> +     * To confirm conversion compatibility between unsigned long,
>>>>>>>> (void *)
>>>>>>>> +     * and function pointers for X86 and ARM architectures only.
>>>>>>>
>>>>>>> ... explanation here? More generally - how would people know to update
>>>>>>> the condition if another port was to be certified?
>>>>>>>
>>>>>>> Finally, with the v3 addition here, is Nicola's R-b really still
>>>>>>> applicable?
>>>>>>>
>>>>>>
>>>>>> I agree with the point you make about i386 (e.g., C-language-
>>>>>> toolchain.rst may be mentioned to provide some context about the
>>>>>> preprocessor guard); that said, my R-by can be retained
>>>>>>>
>>>>>>>> +     */
>>>>>>>> +
>>>>>>>> +    BUILD_BUG_ON(sizeof(unsigned long) != sizeof(void (*)(void)));
>>>>>>>> +    BUILD_BUG_ON(sizeof(void *) != sizeof(void (*)(void)));
>>>>>>>> +}
>>>>>>>> +#endif
>>>>>>>> +
>>>>>>>>    /*
>>>>>>>>     * Local variables:
>>>>>>>>     * mode: C
>>>>>>
>>>>>
>>>>> And probably v4 can have the following wording:
>>>>>
>>>>> /*
>>>>>     * This assertion checks compatibility between 'unsigned long', 'void *',
>>>>>     * and function pointers. This is true for X86 (x86_64) and ARM (arm,
>>>>> aarch64)
>>>>>     * architectures, which is why the check is restricted to these.
>>>>>     *
>>>>>     * For more context on architecture-specific preprocessor guards, see
>>>>>     * docs/misc/C-language-toolchain.rst.
>>>>>     *
>>>>>     * If Xen is ported to a new architecture, verify that this
>>>>> compatibility holds
>>>>>     * before adding its macro to the condition below. If the compatibility
>>>>> does not
>>>>>     * hold, this assertion may need to be revised or removed for that
>>>>> architecture.
>>>>>     */
>>>>
>>>> Except that this doesn't address my concern. Imo the checks want to be there
>>>> unconditionally, and ports where they're _not_ applicable would then need
>>>> excluding (with suitable commentary and/or alternative checks).
>>>
>>> Ok, below is the updated logic:
>>>
>>> /*
>>>    * This assertion checks compatibility between 'unsigned long', 'void *',
>>>    * and function pointers. This is true for most supported architectures,
>>>    * including X86 (x86_64) and ARM (arm, aarch64).
>>>    *
>>>    * For more context on architecture-specific preprocessor guards, see
>>>    * docs/misc/C-language-toolchain.rst.
>>>    *
>>>    * If porting Xen to a new architecture where this compatibility does
>>> not hold,
>>>    * exclude that architecture from these checks and provide suitable
>>> commentary
>>>    * and/or alternative checks as appropriate.
>>>    */
>>> static void __init __maybe_unused build_assertions(void)
>>> {
>>>       /*
>>>        * Exclude architectures where function pointers are larger than
>>> data pointers:
>>>        * - IA-64: uses 'fat' function pointers (code address + global
>>> pointer)
>>>        */
>>> #if !defined(__ia64__)
>>>       BUILD_BUG_ON(sizeof(unsigned long) != sizeof(void (*)(void)));
>>>       BUILD_BUG_ON(sizeof(void *) != sizeof(void (*)(void)));
>>> #endif
>>> }
>>
>> I would omit architectures we don't support, though. I gave IA-64 as an
>> example where things are more complicated (albeit iirc the checks would still
>> succeed there). However, I didn't expect any trace of it to be added to the
>> code base (again).
> 
> Well, looks like only __powerpc__ matches these criterias.
> At least, I see it in 'xen/arch'.
> 
> But, this assertion didn't trigger build to fail, when I run CI:
> https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/jobs/11822940884
> because PPC64 pointer size is 64-bits (according to the 
> C-language-toolchain.rst).

Right, because like for ia64 what is being passed around aren't function
pointers, but pointer to the function descriptors.

> In any case the __powerpc__ is out of scope of certification, so this 
> architecture should be excluded.

Not sure here.

Jan

