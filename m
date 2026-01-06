Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A70ECF9184
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 16:33:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1196281.1514144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd93b-0002Ps-HE; Tue, 06 Jan 2026 15:33:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1196281.1514144; Tue, 06 Jan 2026 15:33:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd93b-0002OQ-ER; Tue, 06 Jan 2026 15:33:15 +0000
Received: by outflank-mailman (input) for mailman id 1196281;
 Tue, 06 Jan 2026 15:33:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vd93a-0002OK-6C
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 15:33:14 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 022fde68-eb15-11f0-9ccf-f158ae23cfc8;
 Tue, 06 Jan 2026 16:33:11 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47d1d8a49f5so7465735e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 06 Jan 2026 07:33:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0dabcbsm4690205f8f.7.2026.01.06.07.33.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jan 2026 07:33:10 -0800 (PST)
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
X-Inumbo-ID: 022fde68-eb15-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767713591; x=1768318391; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=IlMszOJoLmP4nNIOLEdUOg2zQbNBuJx9LdtT9pdYzgY=;
        b=WnT3ULP+FQXvCVaKqbN2/tsp8etWKt3KbREqM615iy+IyQ5i0moB31qtQ/+C2j7sP/
         TA8oSXhU7mzNc5TfqV9BZRRVSJgD6TGkjewMA3Vk+8sfOlYdXRshjJ0WV4W3/VA4T9cQ
         /sdy2xjZ26qAsTSvdBLBN3zjVeIM0vcPGzM7+wp+RJ26Rgxw8aTfd/jxU77VUUKVI+UE
         UZ67cPXrma3qbQB3isQfpqowMJ47o1TgbZp7vlXQc/FYNBIzTDYxqfrZ6LLc4S4SRfXu
         Wo549xDXShoYxB3COMK9nZ+9/pmYbyO7XZc90ll1zwxhXfwSkdQjsSSFLrZSdN78JPKX
         X+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767713591; x=1768318391;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IlMszOJoLmP4nNIOLEdUOg2zQbNBuJx9LdtT9pdYzgY=;
        b=dYEwjKpJcgyqIr/+GkVNDTKxNxNGrGKdJ1XxpgUft5+P3xRq/UTc1+7Woq2aEOMMmq
         tq9G1+74/ql/8uObH0zHYWy9dxMHJeKnq0MWgGHne8VkCQnOQq4yZ2Gf+bbqLkoHQJIf
         rNCdTwJSCd25VfX4Pu+chQlT0FGciNFDJBzGGgleu/NIEFN6Q2IAI8JPlh4ZjOgpLeOp
         OqEDmeW506vXmc7gv1tZoJby/8UDcLVZgXB0i2TPLaJ950Q7voif8NrcYWr9LJIf+GK0
         BT/lkxXzvsQ5iZsyf+0AN4od4Zj2lzKhk3RHK10LDiG/TkRRlS5DX/oQTFMFKr1fdyUD
         rUlA==
X-Forwarded-Encrypted: i=1; AJvYcCWAN7Hxkxy2D/78Nn3hxqJqoD37+DENNeLovwkUr3f8W70zz9rr2rAKucOT6EZMwXmF2ntxTD+VMsk=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywamp0D5+qhf4pajiZD8npY68RpE8VMvNW1js6aMCj3hN4celaN
	SH951Y11DNY0xhtROZ7zPJdJiJEFIeHq4xkIoN1Vyx/1efL4XxPjtNsg8dwoNz5jXw==
X-Gm-Gg: AY/fxX512/C7V2qTfPPgCtPe4E4aNDGsRqRcd1usfP8OERcjpcbUW7aTrkOclHezQ/j
	Zy5Ov+9ua6j8Tr4+6fWtYDRV6g0WjzrUP0on0cfuZcaeGJnkAgDt/kwny5bGw4xuETRsq2/KhtU
	hmgMeuD+BVrFrfV4zr1hatPSn+NlGy0b59qLgNWSu5nrWmRkRIIrh679Cakr5kkssk02PjNSWYp
	U4wtSGLgeZMOWamBaSMwBV8b1Jf32tbmx7xePwzxgYyThzvbFDl2ZqRnpA8tmAThfRAPuPAFInP
	zLD0Eif1YKlnjYSNEj8jsTb3Ab++JlXyo4ISZfBOQdRA4LD+IO5wj6GmUED1ONlgzgejTmSw4rq
	hcUyw91IyMHaf9wEmRTQTvIlKjRDiace8VAq3JVMSlF4U+iQnnurZgxk3630cpE2XwCf8BZfQ7m
	Y8HjVqxbulOLlSON3ijEfAnSpNodZhNYBQqOA2disJxmBOMg8OQRGCdxire6qNYX0N31FwBv6JR
	WI=
X-Google-Smtp-Source: AGHT+IGw1f1o35O60ZXy7DP1J5u9az+naxK7h0/Jma2lXGXGVpy3PfIhCDJlfvDZnKIklqHZAFAHLg==
X-Received: by 2002:a05:600c:8b6c:b0:45d:d97c:236c with SMTP id 5b1f17b1804b1-47d7f0929b5mr38685485e9.21.1767713590680;
        Tue, 06 Jan 2026 07:33:10 -0800 (PST)
Message-ID: <e8a1fc9c-6715-4ac7-acee-754ec29283fe@suse.com>
Date: Tue, 6 Jan 2026 16:33:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/15] xen/riscv: introduce struct arch_vcpu
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1766595589.git.oleksii.kurochko@gmail.com>
 <3b531dff3755da010664111cf7d936ccba7c1f5d.1766595589.git.oleksii.kurochko@gmail.com>
 <41b7b388-6c10-4cbe-a4af-a25baba64e2a@suse.com>
 <89629a0d-de6e-46e2-8517-a4b2fdd52183@gmail.com>
 <2253f28f-07af-46db-9116-e9b5427953a9@suse.com>
 <839c06a2-dbd2-44c5-abe6-905a1f3ffefd@gmail.com>
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
In-Reply-To: <839c06a2-dbd2-44c5-abe6-905a1f3ffefd@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06.01.2026 16:05, Oleksii Kurochko wrote:
> On 1/6/26 3:26 PM, Jan Beulich wrote:
>> On 06.01.2026 15:19, Oleksii Kurochko wrote:
>>> On 1/5/26 5:58 PM, Jan Beulich wrote:
>>>> On 24.12.2025 18:03, Oleksii Kurochko wrote:
>>>>> Introduce structure with VCPU's registers which describes its state.
>>>>>
>>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>> Since none of this is being used for the time being, I think the description
>>>> wants to be a little less terse. Coming from the x86 (rather then the Arm)
>>>> side, I find the arrangements irritating. And even when comparing to Arm, ...
>>>>
>>>>> --- a/xen/arch/riscv/include/asm/domain.h
>>>>> +++ b/xen/arch/riscv/include/asm/domain.h
>>>>> @@ -22,9 +22,63 @@ struct hvm_domain
>>>>>    struct arch_vcpu_io {
>>>>>    };
>>>>>    
>>>>> -struct arch_vcpu {
>>>>> +struct arch_vcpu
>>>>> +{
>>>>>        struct vcpu_vmid vmid;
>>>>> -};
>>>>> +
>>>>> +    /* Xen's state: Callee-saved registers and tp, gp, ra */
>>>> ... I don't think the following structure describes "Xen's state". On Arm
>>>> it's guest controlled register values which are being saved afaict. I
>>>> would then expect the same to become the case for RISC-V.
>>> I think this is not fully correct, because guest-controlled registers on
>>> Arm are allocated on the stack [1][2].
>> I'll admit that I should have said "possibly guest-controlled". Callee-
>> saved registers may or may not be used in functions, and if one isn't
>> used throughout the call-stack reaching __context_switch(), it would
>> still hold whatever the guest had put there.
> 
> But the guest doesn't put there nothing, only Xen does that and it is a reason
> why I am trying to call it Xen state. Guest works only with what is stored in
> struct cpu_info->guest_cpu_user_regs.* ...
> 
>>> Regarding|xen_saved_context| (or|saved_context| on Arm, which I used as a base),
>>> I think|xen_saved_context| is a slightly better name. Looking at how the
>>> |saved_context| structure is used on Arm [3], it can be concluded that
>>> |__context_switch()| switches only Xen’s internal context. What actually happens is
>>> that|__context_switch()| is called while running on the previous vCPU’s stack
>>> and returns on the next vCPU’s stack. Therefore, it is necessary to have
>>> the correct register values stored in the|saved_context| structure in order
>>> to continue Xen’s execution when it later returns to the previous stack.
>> For this and ...
>>
>>> Probably I need to introduce|__context_switch()| in this patch series for RISC-V
>>> now; I hope this will clarify things better. At the moment, it looks like [4].
>>>
>>> [1] https://elixir.bootlin.com/xen/v4.21.0/source/xen/arch/arm/include/asm/arm64/processor.h#L14
>>> [2] https://elixir.bootlin.com/xen/v4.21.0/source/xen/arch/arm/domain.c#L547
>>>
>>> [3] https://elixir.bootlin.com/xen/v4.21.0/source/xen/arch/arm/arm64/entry.S#L650
>>>
>>> [4] https://gitlab.com/xen-project/people/olkur/xen/-/blob/riscv-next-upstreaming/xen/arch/riscv/entry.S?ref_type=heads#L153
>>>
>>>>> +    struct
>>>>> +    {
>>>>> +        register_t s0;
>>>>> +        register_t s1;
>>>>> +        register_t s2;
>>>>> +        register_t s3;
>>>>> +        register_t s4;
>>>>> +        register_t s5;
>>>>> +        register_t s6;
>>>>> +        register_t s7;
>>>>> +        register_t s8;
>>>>> +        register_t s9;
>>>>> +        register_t s10;
>>>>> +        register_t s11;
>>>>> +
>>>>> +        register_t sp;
>>>>> +        register_t gp;
>>>>> +
>>>>> +        /* ra is used to jump to guest when creating new vcpu */
>>>>> +        register_t ra;
>>>>> +    } xen_saved_context;
>>>> The xen_ prefix here also doesn't exist in Arm code.
>>> I think it should be added for Arm too. I can send a patch.
>> ... this, to reword my comment: What value does the xen_ prefix add?
> 
> ... because guest doesn't access saved_context and as I mentioned above
> guest has "access" only to struct cpu_info->guest_cpu_user_regs.*.

The guest has no access to anything in the hypervisor. That said, seeing
that Andrew had asked for this, so be it then (albeit I remain unconvinced).

Jan

