Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9534CB33A8E
	for <lists+xen-devel@lfdr.de>; Mon, 25 Aug 2025 11:19:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1092792.1448420 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqTM1-0000xQ-1Q; Mon, 25 Aug 2025 09:19:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1092792.1448420; Mon, 25 Aug 2025 09:19:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqTM0-0000uy-Ue; Mon, 25 Aug 2025 09:19:04 +0000
Received: by outflank-mailman (input) for mailman id 1092792;
 Mon, 25 Aug 2025 09:19:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J9Dq=3F=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uqTM0-0000us-9D
 for xen-devel@lists.xenproject.org; Mon, 25 Aug 2025 09:19:04 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a0e2a97-8194-11f0-b898-0df219b8e170;
 Mon, 25 Aug 2025 11:19:02 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-afcb7a16441so652428766b.2
 for <xen-devel@lists.xenproject.org>; Mon, 25 Aug 2025 02:19:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afe48fc3d82sm515801066b.44.2025.08.25.02.19.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Aug 2025 02:19:01 -0700 (PDT)
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
X-Inumbo-ID: 8a0e2a97-8194-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756113541; x=1756718341; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vxfoE22zXcqBAMwhFngozld/3ksQg0RekGkZfVaLeyY=;
        b=T6yrZED1l8LT3uaRys96lNlcBHN0tlshiDNMN1+/slCPLTiJIGeykRvpC4Lokd9gxj
         VG96ujQr9dpoAZQRZr3NxwGDonfYDAZwsZx+nTQ3L9QPuzPJ9l6ESXs4Xgmq4qeCkmWn
         S6G6f1spWLwEP8cSQcsyYBlWB5jnta3ymL1fWKa+4dySnX4N3vIrL1vL+jJpg+N5PIGi
         jhovMwA/RCopHGNBAur1l21sbUkg3KNksksklkNP4+JLfnLoTZ585DhqUqAHsstOATXt
         oYxJOl1d76gCqqc1Jt1QhbGZqpuT3loNjKF5/vbFSuH3Tn5AUlflXLDGqgIaLgcdnIAN
         nKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756113541; x=1756718341;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxfoE22zXcqBAMwhFngozld/3ksQg0RekGkZfVaLeyY=;
        b=RLCnTD1VTapLYFhcwyRFFCEEYyEwLflTZe/D6KGcz2Zt/RsaIJpDd9EE99cZWZawWi
         WYwYCOMDesc3T0negK1hSXoA9oa4MaPZp5P3P4qZkmKIkzULK3tpHp+z+IR4giNPCcY/
         H9WkfA4qieDJIWkHwR6lTNra2uitxwm5ffX72b0zdd/3cDlz/ScB6RtOxf/VM74joWim
         LrsYiVtkpWkPV6AOOZmBzDCYNzHBot3gnZrJWaR+Wd4XSUth9/2nJyeqyxaZtMuLtOk8
         k/Rm+i4ZMawFZ/eBnL9gu+giaQwCC7w58MQkcUr36qO0SyFEaYK4S9q6NW7Ysuan+vN3
         Kx1g==
X-Forwarded-Encrypted: i=1; AJvYcCXfe40+Iiu4f2WwMwFF/OPKnklXCVAj/FLiVrFqrD8d795XzhP4N37qG9ivhpgczSznzJe9m0eLnV4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyslJAc46hHoQHIZZAJv84mCDAwj91MOzlloPGp56Tnckb/Dar5
	2nerbcYJYSStzBOlicIHBnkOHuhucs+VnN5QK6lUquFY2U87jwYLIcnMhh6ngi4h6w==
X-Gm-Gg: ASbGnctZj5InYuqH8WE8igpxmBQ0zXb5/F8/x0mJaQ791ccTRcBEjUneTaOYRc4pfq+
	SGkxT3nX41IH0lecDbJMIhm+IicKIk4OeEwQetzd9zqKV0Wj29F/osZtHwyyL4izUGlAs3kF/OQ
	LXy82HMIjOe9c6GXRDYgKeOvVm9yAS8mDcmf153fiIbtj4+kJiRI74EkPLnD/gl4cXmq76KzAs7
	MI2wW6ZUFZDqDDBc01uuuS4Sv2lKW6gz6sFId3Msqn1NV5R/pLjwJfj3a5k+FcpIHuYonkx6mrh
	55HAFHy+zKWu6mnwuPdvF7RKx7GRchia6VXi6lvPp86ExBvs0ajQ2Q0C6Xwer89ySWHaXxi9ydL
	u5tzr521PT05VRB98SHgaOJc3WB6fM66d2AEUW3C83CADwBtWUfxxamh8xRTd9HI+U3j56cPJPE
	opX9WCpMsJVJaGit2Z3A==
X-Google-Smtp-Source: AGHT+IHWk97UOp2QDyTudZ5L+TMTvuM6I9s+mS0aatR/rMGs5qCZ7aUuMusMa4dTjLjnLtwWd7O+eA==
X-Received: by 2002:a17:907:1b29:b0:af9:611d:8d06 with SMTP id a640c23a62f3a-afe2965b625mr1127582666b.54.1756113541448;
        Mon, 25 Aug 2025 02:19:01 -0700 (PDT)
Message-ID: <56b3b2fd-a209-40ce-b170-277600ac9ec7@suse.com>
Date: Mon, 25 Aug 2025 11:19:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/22] x86/traps: Alter switch_stack_and_jump() for FRED
 mode
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-21-andrew.cooper3@citrix.com>
 <7b46de92-d7b6-462f-8469-0f334d9e70bb@suse.com>
 <17498f02-0603-489c-bbc9-2207ffef8029@citrix.com>
 <0fdea579-7100-43d8-b5ec-0c9d34476aea@suse.com>
 <8229c4f7-e1ca-4d79-9131-df5d74e464bc@citrix.com>
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
In-Reply-To: <8229c4f7-e1ca-4d79-9131-df5d74e464bc@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.08.2025 00:56, Andrew Cooper wrote:
> On 15/08/2025 10:10 am, Jan Beulich wrote:
>> On 14.08.2025 22:55, Andrew Cooper wrote:
>>> On 14/08/2025 4:35 pm, Jan Beulich wrote:
>>>> On 08.08.2025 22:23, Andrew Cooper wrote:
>>>>> @@ -154,7 +155,6 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
>>>>>      "rdsspd %[ssp];"                                            \
>>>>>      "cmp $1, %[ssp];"                                           \
>>>>>      "je .L_shstk_done.%=;" /* CET not active?  Skip. */         \
>>>>> -    "mov $%c[skstk_base], %[val];"                              \
>>>>>      "and $%c[stack_mask], %[ssp];"                              \
>>>>>      "sub %[ssp], %[val];"                                       \
>>>>>      "shr $3, %[val];"                                           \
>>>> With the latter two insns here, ...
>>>>
>>>>> @@ -177,6 +177,8 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
>>>>>  
>>>>>  #define switch_stack_and_jump(fn, instr, constr)                        \
>>>>>      ({                                                                  \
>>>>> +        unsigned int token_offset =                                     \
>>>>> +            (PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - (opt_fred ? 0 : 8);  \
>>>>>          unsigned int tmp;                                               \
>>>>>          BUILD_BUG_ON(!ssaj_has_attr_noreturn(fn));                      \
>>>>>          __asm__ __volatile__ (                                          \
>>>>> @@ -184,12 +186,11 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
>>>>>              "mov %[stk], %%rsp;"                                        \
>>>>>              CHECK_FOR_LIVEPATCH_WORK                                    \
>>>>>              instr "[fun]"                                               \
>>>>> -            : [val] "=&r" (tmp),                                        \
>>>>> +            : [val] "=r" (tmp),                                         \
>>>> ... I don't think you can legitimately drop the & from here? With it
>>>> retained:
>>>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>> You chopped the bit which has an explicit input for "[val]", making the
>>> earlyclobber incorrect.
>> I was wondering whether there was a connection there, but ...
>>
>>> IIRC, one version of Clang complained.
>> ... that's not good. Without the early-clobber the asm() isn't quite
>> correct imo. If the same value appeared as another input, the compiler
>> may validly tie both together, assuming the register stays intact until
>> the very last insn (and hence even that last insn could still use the
>> register as an input). IOW if there's a Clang issue here, I think it
>> may need working around explicitly.
> 
> Given that I need an alternative anyway, this becomes much easier, and
> shrinks to this single hunk:
> 
> diff --git a/xen/arch/x86/include/asm/current.h b/xen/arch/x86/include/asm/current.h
> index c1eb27b1c4c2..35cc61fa88e7 100644
> --- a/xen/arch/x86/include/asm/current.h
> +++ b/xen/arch/x86/include/asm/current.h
> @@ -154,7 +154,9 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
>      "rdsspd %[ssp];"                                            \
>      "cmp $1, %[ssp];"                                           \
>      "je .L_shstk_done.%=;" /* CET not active?  Skip. */         \
> -    "mov $%c[skstk_base], %[val];"                              \
> +    ALTERNATIVE("mov $%c[skstk_base], %[val];",                 \
> +                "mov $%c[skstk_base] + 8, %[val];",             \
> +                X86_FEATURE_XEN_FRED)                           \
>      "and $%c[stack_mask], %[ssp];"                              \
>      "sub %[ssp], %[val];"                                       \
>      "shr $3, %[val];"                                           \

Oh, okay. But then please again without unnecessary use of $%c constructs,
when just % will do.

Tangential: Now that I look at this again, what's the 1st 'k' standing
for in skstk_base? Was that maybe meant to be 'h'?

Jan

Jan

