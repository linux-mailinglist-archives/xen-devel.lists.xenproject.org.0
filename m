Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47B0AA5C406
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 15:39:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908228.1315367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts0l0-00053a-6v; Tue, 11 Mar 2025 14:38:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908228.1315367; Tue, 11 Mar 2025 14:38:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ts0l0-000525-3C; Tue, 11 Mar 2025 14:38:58 +0000
Received: by outflank-mailman (input) for mailman id 908228;
 Tue, 11 Mar 2025 14:38:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EmiY=V6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ts0ky-00051z-4A
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 14:38:56 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8ee6a914-fe86-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 15:38:55 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4393dc02b78so33459935e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 07:38:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d025869e7sm32165655e9.7.2025.03.11.07.38.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 07:38:54 -0700 (PDT)
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
X-Inumbo-ID: 8ee6a914-fe86-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1741703934; x=1742308734; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=tspCbd/hT2vDr7de6KAkUb85jCsiDSxeYlkFf9BqpQk=;
        b=Tx7Jk7t+dmrAyph17vY8YgcPTRlyZh8PFxxzl540dJ00Wwuc717OULgBVsrtCH9n5y
         qZvH5qOs2kTtO0gpR/M2qNwBgcVF77JztwtNNWa3vmbOGAGmhNvaZtoIZXHmiPbiIkBl
         w4mZD/oiat/fdITaUOWzDdDcTVyAkJCT7Xj/OqXhFfUpymbkVcDMAfiqHMQ8kD2H0Auj
         352Yzo89lonuqT5pvQzckrJCUt5Qfu0nALBx3shLq79Bvp3+dbR+QAiD8ROllv5qqVh2
         EM7ouUd8++uSnmiWxxUw492CttrWrg6XwjFO0MO9H9TtvMeUy+fFfOZ3fugPjbFKRJy1
         O3YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741703934; x=1742308734;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tspCbd/hT2vDr7de6KAkUb85jCsiDSxeYlkFf9BqpQk=;
        b=u4+OkBBpME9x+KkPBAaso3oeP40lZeHRnxyE8iOU+XnvvFr2CeJE515RgTHg/Q8AML
         A9cXxkqJeuYXLduDzRYaBbi9od5JrnRpqxqLkvZuglVsxZOkFOOtFPK9ltqeno71ycol
         9QPXmvTqiPRChAbKzbaqSb06kGmfc4gAPYxwR7yJMseZ61LToGdjV6PmKhhxWXvbK2pU
         I+CknK/zjDKHJmIVXyO8LGI+zbU8/MrBcQRhiDrJSA6Rl+pjkbkNLkEJ2teA26+FJzc2
         z+YqdWxm4/HvJw3AaZ/qKqUCtcVXgASP8aJZLczZEbv/Zg5t7RaWTIVpzPUU92nhdIPQ
         8dPg==
X-Forwarded-Encrypted: i=1; AJvYcCUeuFGqiL5IkO+b6bQsIlgY/rII6io/PQYQY/3exMC11+q4HdSBa9OMK6W6a1NspWYiEV0rdvXEgDk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzCzpzu/fMJPOzCvlHn4lBu12JAusYwiDoE7bEZkXMA5oMVLfeE
	/7kUlQLWCJo48aR35zUaE2zjddLq+Rf4eoH4dF4vsWZ2RTPUjiVwfRlXWZI7rg==
X-Gm-Gg: ASbGncuOd1N8dWGxDH5WXOw6pfA2fearSqULw+kAmqcra4zqUG1k6f46Yhg15PhE6JU
	xroD91KDEaHk2xdEouHEtMLXrz302ViunILHDQaaMEod0/Pbrw5TaS1wzeny9HJqRWcCNxsqahC
	XsmIBrKFEGBZkQ4zlF220me5TD4HqGpqHE6rjRPylSStca1tkka9q2ENP8z/ZwzDI8uV3gKu+36
	rdJcVW8hw9XP1x1aL7m0ejXfYfWTKAk+JLW69QUOFywzdtj1C22dB3XDWPijkHgg0JjgBA+OiZU
	5ko3iGKKyV0yXsh/0dNyjBRsa05Z19IaqeTrKRFDx4uJ5CeDLXypszyptiHboY/51CT+q3A4bVi
	gme2kE7WJeSq5JZd1Ynz6wBUkbjJsYmTTQIiYkurH
X-Google-Smtp-Source: AGHT+IEebjeYCETbpVREfohUjWQINQA2iWcxwDhY52JML+x4xDgdtX32Ov5OxLy6wzMfXyo0pFvosQ==
X-Received: by 2002:a05:600c:1c05:b0:43b:b756:f0a9 with SMTP id 5b1f17b1804b1-43d01bdbea9mr61202385e9.11.1741703934357;
        Tue, 11 Mar 2025 07:38:54 -0700 (PDT)
Message-ID: <ba5a370e-3cad-4ed8-874c-7372d6d8a4b3@suse.com>
Date: Tue, 11 Mar 2025 15:38:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86/elf: Improve code generation in elf_core_save_regs()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250225224559.1226079-1-andrew.cooper3@citrix.com>
 <68a14ea8-b6f0-448e-8713-e9696c024c43@suse.com>
 <b9bdba63-82a4-4833-b8bd-b3788fd02321@suse.com>
 <3dd5e64c-81cd-44fe-808a-c09e55c92d32@citrix.com>
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
In-Reply-To: <3dd5e64c-81cd-44fe-808a-c09e55c92d32@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.03.2025 15:21, Andrew Cooper wrote:
> On 26/02/2025 8:44 am, Jan Beulich wrote:
>> On 26.02.2025 08:44, Jan Beulich wrote:
>>> On 25.02.2025 23:45, Andrew Cooper wrote:
>>>> A CALL with 0 displacement is handled specially, and is why this logic
>>>> functions even with CET Shadow Stacks active.  Nevertheless a rip-relative LEA
>>>> is the more normal way of doing this in 64bit code.
>>>>
>>>> The retrieval of flags modifies the stack pointer so needs to state a
>>>> dependency on the stack pointer.  Despite it's name, ASM_CALL_CONSTRAINT is
>>>> the way to do this.
>>>>
>>>> read_sreg() forces the answer through a register, causing code generation of
>>>> the form:
>>>>
>>>>     mov    %gs, %eax
>>>>     mov    %eax, %eax
>>>>     mov    %rax, 0x140(%rsi)
>>>>
>>>> Encode the reads directly with a memory operand.  This results in a 16bit
>>>> store instead of an 64bit store, but the backing memory is zeroed.
>>> Raises the question whether we shouldn't change read_sreg(). At least the
>>> emulator uses of it would also benefit from storing straight to memory. And
>>> the remaining uses ought to be optimizable by the compiler, except that I
>>> don't expect we'd be able to express the zero-extending nature when the
>>> destination is a register. Or wait, maybe I can make up something (whether
>>> that's going to be liked is a separate question).
>> Here you go.
>>
>> Jan
>>
>> x86: make read_sreg() "bi-modal"
>>
>> Permit use sites to control whether to store directly to memory; right
>> now both elf_core_save_regs() and the insn emulator's put_fpu()
>> needlessly go through an intermediate GPR. Note that in both cases the
>> apparent loss of zero-extension isn't a problem: The fields written to
>> start out zero-initialized anyway.
>>
>> No change in generated code for the use sites not being touched.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Whether to make the change to put_fpu() is up for discussion: In my
>> build it increases code size slightly, despite the reduction of number
>> of insns emitted. An alternative (leaving the decision to the compiler)
>> might be to drop the if() and use "=g" as constraint.
>>
>> I was considering to omit the assignment to sel_ on the if() branch,
>> expecting the compiler to then flag uses of the return value (as
>> consuming uninitialized data) when a 2nd argument is passed. However,
>> gcc14 then already flags the "sel_;" at the end of the macro as
>> consuming uninitialized data.
>>
>> --- a/xen/arch/x86/include/asm/regs.h
>> +++ b/xen/arch/x86/include/asm/regs.h
>> @@ -16,10 +16,20 @@
>>      !diff || ((r)->cs != __HYPERVISOR_CS);                                    \
>>  })
>>  
>> -#define read_sreg(name) ({                           \
>> -    unsigned int __sel;                              \
>> -    asm ( "mov %%" STR(name) ",%0" : "=r" (__sel) ); \
>> -    __sel;                                           \
>> +#define read_sreg(name, dst...) ({                       \
>> +    unsigned int sel_;                                   \
>> +    BUILD_BUG_ON(count_args(dst) > 1);                   \
>> +    if ( count_args(dst) )                               \
>> +    {                                                    \
>> +        typeof(LASTARG(&sel_, ## dst)) dst_ =            \
>> +            LASTARG(&sel_, ## dst);                      \
>> +        asm ( "mov %%" STR(name) ",%0" : "=m" (*dst_) ); \
>> +        /* The compiler ought to optimize this out. */   \
>> +        sel_ = *dst_;                                    \
>> +    }                                                    \
>> +    else                                                 \
>> +        asm ( "mov %%" STR(name) ",%0" : "=r" (sel_) );  \
>> +    sel_;                                                \
>>  })
> 
> This doesn't fix the register promotion problem.  That can be fixed by
> unsigned long rather than int, as you did for rdmsr. 
> https://godbolt.org/z/K5hKz7KvM

Right, but that's an orthogonal aspect.

> But the fundamental problem is that the sreg instructions with mem16
> encodings are weird.  They don't even follow normal x86 rules for
> operand size.
> 
> By the end of the FRED series (for which this patch was misc cleanup),
> I've almost removed read_sreg(), and was intending to purge it
> completely.

Well, if that's the plan, then ...

>  Even in it's current form, it's not normal C semantics,
> because it looks to take a variable which isn't a variable.
> 
> Clever as this trick is, I feel it's a backwards step in terms of
> legibility, and that plain asm()'s are the lesser evil when it comes to
> mem16 instructions.

... indeed I agree here.

Jan

