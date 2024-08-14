Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A53951E73
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 17:22:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777436.1187583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seFpF-0000TY-JJ; Wed, 14 Aug 2024 15:22:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777436.1187583; Wed, 14 Aug 2024 15:22:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seFpF-0000R4-Fw; Wed, 14 Aug 2024 15:22:13 +0000
Received: by outflank-mailman (input) for mailman id 777436;
 Wed, 14 Aug 2024 15:22:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NhoJ=PN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1seFpD-0000Qy-Dn
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 15:22:11 +0000
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f97a0717-5a50-11ef-a505-bb4a2ccca743;
 Wed, 14 Aug 2024 17:22:10 +0200 (CEST)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5a309d1a788so35437a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 14 Aug 2024 08:22:10 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80f3fa43f9sm185977866b.53.2024.08.14.08.22.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Aug 2024 08:22:08 -0700 (PDT)
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
X-Inumbo-ID: f97a0717-5a50-11ef-a505-bb4a2ccca743
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723648930; x=1724253730; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sXY2qYSi5ScBM9veJIF83xeLBE3lDb/YHp+U6rSilUk=;
        b=Cchlir952PH0tVJiurO4uesClFRq6SdY5a0niKV/Z2hjpI9qpTWa7G6dANy9GgHvW5
         vkVYRx6GpSpqhGvES4Xb8wCvedmiFhI7MyYfeslfaX7KKy65APkO8g+E+8PPbDuKoya8
         7qOg1lQbZFfhbcggyXsIKHICchpbwZOShWeMIaquhVhJwNRsO79Hqxt1ENIfdehAzrZQ
         SJcTpWLvHSQWdglItj89kZafwSNGm6AdSUnvSEvBnKw7hLALtjJE4ywFUOUsmnh7/bt+
         ftgUDuiA4rg9PYCxmadEJtyQZLhyNTG1/UadMwt4aVj7k4M9gWD4533oibvM7IIPwhF4
         M95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723648930; x=1724253730;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sXY2qYSi5ScBM9veJIF83xeLBE3lDb/YHp+U6rSilUk=;
        b=p2+QvBrpxtS+hWWyYMdvG8Z/WDvi98YgDNvohO2ieQIXPWzaDTqOwoTzhaTbv2w7U9
         oTC+f3pVDsC/3yoFS2Uhx9dkECba0wKP4F5Q95TKxkUg93zVZeOazjD09+jAdIEqkuRX
         utLPCwb2pmEDV3dqA2dPB7Y/5Pxg7fIi59ZFxuqxqH4VGfXgwV9xvRjjd7xKaffHLhIW
         VY2QHsrS1D2y+GLwckW7Oh8XJBKdztjuzUP1JGOZ1l+R3cB0AKsr3zCPu845A66l8wH2
         r6OkaMCPIRXl9i1MLrAFj807n64fhSjmNB+D8YXgAizGx5ePkR0BNZCHyOknH5+UM/oL
         NheQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsL/9xX77nk2iX70Xi2czRG+5vRhHt3ZRwRygMnq8L96gaUIVaM2M+GoZwNgpZyQpIvSjOdvSD6cIClDNjbwJCK6z2R3wtXxoLxh1MmS0=
X-Gm-Message-State: AOJu0Yzcebf/dnHlo66wd7uL11zkWKml1ALgobHEZEaVKJisNL6AsJNK
	Mn6FINC5lX9R7Gcg005npnxtlra9uhyRF/Lm8R2DzBTWZ8sHwnOqdKKOHVxa2Q==
X-Google-Smtp-Source: AGHT+IGKnikD5uhOpS8Qz+KJdWvevlDwdz+2IBTMqXhUZzvn/1ANIUV+sFLzZMIuvEuD7ycqDlHFgg==
X-Received: by 2002:a17:907:7f0c:b0:a7a:ab8a:384 with SMTP id a640c23a62f3a-a8367058086mr236262566b.64.1723648929537;
        Wed, 14 Aug 2024 08:22:09 -0700 (PDT)
Message-ID: <dfb4678f-0b2d-4d1c-be02-10c4720e57b2@suse.com>
Date: Wed, 14 Aug 2024 17:22:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/7] xen/riscv: introduce functionality to work with
 CPU info
To: oleksii.kurochko@gmail.com
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <cover.1723214540.git.oleksii.kurochko@gmail.com>
 <452e2960d1f064a2e3abcaae1ac354f48aafd24c.1723214540.git.oleksii.kurochko@gmail.com>
 <e0285026-40c5-4316-8129-d07801a9c233@suse.com>
 <ee3a2e61435e860f1ddb6022fbb712a8d890ae3e.camel@gmail.com>
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
In-Reply-To: <ee3a2e61435e860f1ddb6022fbb712a8d890ae3e.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.08.2024 16:45, oleksii.kurochko@gmail.com wrote:
> On Tue, 2024-08-13 at 10:54 +0200, Jan Beulich wrote:
>> On 09.08.2024 18:19, Oleksii Kurochko wrote:
>>> --- a/xen/arch/riscv/include/asm/smp.h
>>> +++ b/xen/arch/riscv/include/asm/smp.h
>>> @@ -5,6 +5,8 @@
>>>  #include <xen/cpumask.h>
>>>  #include <xen/percpu.h>
>>>  
>>> +#define INVALID_HARTID UINT_MAX
>>> +
>>>  DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
>>>  DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
>>>  
>>> @@ -14,6 +16,14 @@ DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
>>>   */
>>>  #define park_offline_cpus false
>>>  
>>> +void smp_set_bootcpu_id(unsigned long boot_cpu_hartid);
>>> +
>>> +/*
>>> + * Mapping between linux logical cpu index and hartid.
>>> + */
>>> +extern unsigned long cpuid_to_hartid_map[NR_CPUS];
>>> +#define cpuid_to_hartid(cpu) cpuid_to_hartid_map[cpu]
>>
>> How wide can hart IDs be? Wider than 32 bits? If not, why unsigned
>> long?
> According to the spec:
> ```
> The mhartid CSR is an MXLEN-bit read-only register containing the
> integer ID of the hardware thread running the code
> ```
> where MXLEN can bit 32 and 64.

Hmm, okay. If the full MXLEN bits can be used, then using unsigned long
is indeed the right thing here.

>>> @@ -40,6 +41,19 @@ void __init noreturn start_xen(unsigned long
>>> bootcpu_id,
>>>  {
>>>      remove_identity_mapping();
>>>  
>>> +    /*
>>> +     * tp register contains an address of physical cpu
>>> information.
>>> +     * So write physical CPU info of boot cpu to tp register
>>> +     * It will be used later by get_processor_id() ( look at
>>> +     * <asm/processor.h> ):
>>> +     *   #define get_processor_id()    (tp->processor_id)
>>> +     */
>>> +    asm volatile ( "mv tp, %0" : : "r"((unsigned
>>> long)&pcpu_info[0]) );
>>
>> Perhaps be on the safe side and also add a memory barrier?
> Do you mean compiler barrier? ( asm volatile ( "..." :: ... : "memory"
> )? )

Yes.

>> Perhaps be on the safe side and do this absolutely first in the
>> function,
>> or even in assembly (such that initializers of future variables
>> declared
>> at the top of the function end up safe, too)?
> I am not sure that I am following your part related to put this code in
> assembler ( instructions in assembly code still code be re-ordered what
> can affect a time when tp will be set with correct value )

I'm afraid I don't understand this. Instructions can be re-ordered, sure,
but later instructions are guaranteed to observe the effects on register
state that earlier instructions caused.

> and what do
> you mean by "initializers of future variables declared at the top of
> the function end up safe"

With

void start_xen()
{
    int var = func();

    asm volatile ( "mv tp, %0" :: ...);
    ...

you end up with the requirement that func() must not use anything that
depends on tp being set. In this simple example it may be easy to say
"don't use an initializer and call the function afterwards". But that is
going to be a risky game to play. Look at x86'es __start_xen(). An
insertion into such a big set of declarations may not pay attention to
tp not being set yet, when _all_ other C code may reasonably assume tp
is set.

>>> --- /dev/null
>>> +++ b/xen/arch/riscv/smp.c
>>> @@ -0,0 +1,4 @@
>>> +#include <xen/smp.h>
>>> +
>>> +/* tp points to one of these per cpu */
>>> +struct pcpu_info pcpu_info[NR_CPUS];
>>
>> And they all need setting up statically? Is there a plan to make this
>> dynamic (which could be recorded in a "fixme" in the comment)?
> I didn't plan to make allocation of this array dynamic. I don't expect
> that NR_CPUS will be big.

What is this expectation of yours based on? Other architectures permit
systems with hundreds or even thousands of CPUs; why would RISC-V be
different there?

> I can add "fixme" but I am not really
> understand what will be advantages if pcpu_info[] will be allocated
> dynamically.

Where possible it's better to avoid static allocations, of which on
some systems only a very small part may be used. Even if you put yourself
on the position that many take - memory being cheap - you then still
waste cache and TLB bandwidth. Furthermore as long as struct pcpu_info
isn't big enough (and properly aligned) for two successive array entries
to not share cache lines, you may end up playing cacheline ping-pong
when a CPU writes to its own array slot.

Jan

