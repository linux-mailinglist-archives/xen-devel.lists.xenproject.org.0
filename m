Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE89184CACD
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 13:41:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677518.1054127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXhER-0006FG-Gn; Wed, 07 Feb 2024 12:40:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677518.1054127; Wed, 07 Feb 2024 12:40:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXhER-0006CE-Dg; Wed, 07 Feb 2024 12:40:51 +0000
Received: by outflank-mailman (input) for mailman id 677518;
 Wed, 07 Feb 2024 12:40:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXhEP-0006C8-B0
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 12:40:49 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e5a3fdf-c5b6-11ee-8a49-1f161083a0e0;
 Wed, 07 Feb 2024 13:40:48 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40fdc63f4feso5060855e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 04:40:48 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 l37-20020a05600c1d2500b0040ee8765901sm2003884wms.43.2024.02.07.04.40.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 04:40:47 -0800 (PST)
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
X-Inumbo-ID: 1e5a3fdf-c5b6-11ee-8a49-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707309647; x=1707914447; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T1lHdXC9Jjw0YX91nZGzqRXP2VzvUdARbS5xf1vyCXU=;
        b=el1s33uqPZ/eEFae3MQDyd0oeGwh3zEGoSVZZHHTll99/JZmGS0RSkQMDT+MZaZchy
         9vBnP+y3iS9FLgVtebyNpQaXEmhvlH1Adk1TqhVphbfrKjCiOi9hiaHa/ZDIKXJKLm9N
         QNaFlRvZnlKPAUQednZALc9tqCVJX6bgyy9r0+XC543VnmL+IiTuFGhn8YVLBLjgDivp
         iN0xervDFZRMg7ZYUeW4/ffRBrW0q74D8mfenn/JoAVt/9DxTnVcdRGa8IU1KVK1okmi
         us2XSrb8ejRLmKUTUhZsPiWl9KN6Dn9jFrqRxtrbB7C4AA+Rt5wDayhY6EBPc21yB47o
         uAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707309647; x=1707914447;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T1lHdXC9Jjw0YX91nZGzqRXP2VzvUdARbS5xf1vyCXU=;
        b=uiy4mUTJ5X3cY3Hd1AEfukyfsQ413x7BfYk45vEpphXJW4ONcexiphcO+3a/V3lWFT
         TZSvuj6pgXEZNOdyolQDcIz1ZCs899MAh/ZTCXS89SAtUb2ijHMOOJRjpRIqnv4JBS5w
         x/3Db8c7+kfIkOJTGPX9QPE0umBRZj19xumTnfIiPfiTmvuSdv29V4DOaN/axiFuhIq0
         Nm3Yln/mjGfJz681qtLC+iZj4uYhFW1hGIkIz7DFw8L70mBUh7vZ4ES4Zwfbk07d0ZgH
         K2wwqUbsXpBztLazlX06I+3h5TNt+5S2uJGpZKORwRTIUuMo3b70FO0hYJ4BhbTrxLFi
         gnPA==
X-Forwarded-Encrypted: i=1; AJvYcCVz9uR/HxhZkjswVBzNWW5wsENlJDY34ginNozqs9vEjIZ9ZGeIvoPyNSr9P+mr2W9M1p+ZFk45VNpOKWwHBffqHYhCR8H3WIApGpNCuJo=
X-Gm-Message-State: AOJu0YyL/eTY++89xrozugKwjovXCqFjaYqqs/VZG7slML8Q5c98wqlp
	ya74gp0dZrwWTpiU6ec21u85XvbFZ49bMUsD1fFoaHcbFWk0xNbVaZXoWwIEnA==
X-Google-Smtp-Source: AGHT+IHaM2t4FvpcMnWtFL2D6FdMm2/5mjLh64fuuyR9/jHOxEa+PHTuOxFlI3AuScnbiYY2JFZgjw==
X-Received: by 2002:a05:600c:510b:b0:40e:b9fb:103 with SMTP id o11-20020a05600c510b00b0040eb9fb0103mr3832256wms.23.1707309647487;
        Wed, 07 Feb 2024 04:40:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXcumd5rXaXzOauyJojIzCtGpP09YDamgBoScdfjbGQmT4YYESL5fb3I0vmOUjXbFZYpRFwE5TBni5+R9GfViw9TnRx9YjK3S29sYItVpRI7SHOTyNh2GMpyM8BoJc1gHZp88Y5XtzCmjg/nO+2WXGy0FzHcZeYKtnw4jedbPuY0HwLLOXT5jxaYAuosXrxJz/TiZl7FC3ztUsDAC343KTKVzeVWsNN1d5kqAc/j6AbYZ8k+9kc05LcnbQKhFnZbLNd0kBD96SHaEUKuzrNhAiskIJHpw/vTQyXJmfh8YkmLqhPLsnjFWwuWUnoUXO1tRVYwSc7cC7eRRe7XBSymrSOm81+Q7kNUS4vefCzHaiWDcI26dkzq3krxxXf/FgjMZNtxWoYZ3iKtuEfe9nNTylWOq0IKzUDyxBJROmx6XqmiTLCqF+HxAAaLabIbZwz43g=
Message-ID: <c6199a60-ecd2-4f8a-b742-199b90e62bac@suse.com>
Date: Wed, 7 Feb 2024 13:40:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v4 1/4] xen: add SAF deviation for debugging and
 logging effects
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, sstabellini@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>,
 Maria Celeste Cesario <maria.celeste.cesario@bugseng.com>,
 xen-devel@lists.xenproject.org
References: <cover.1706886631.git.simone.ballarin@bugseng.com>
 <7c6aeedac626b171ed44df50ce5e3e2c76593f60.1706886631.git.simone.ballarin@bugseng.com>
 <09869431-ed00-4102-93fd-84c697a5c950@suse.com>
 <851eb6ec-558b-4a89-a31a-34046730bb55@bugseng.com>
 <41474fe7-c65f-4244-a455-0aaa0e4315e3@suse.com>
 <e48f4d49-274c-4bd6-8e3b-1ecaee6fa602@bugseng.com>
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
In-Reply-To: <e48f4d49-274c-4bd6-8e3b-1ecaee6fa602@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.02.2024 13:21, Simone Ballarin wrote:
> On 07/02/24 11:24, Jan Beulich wrote:
>> On 07.02.2024 11:03, Simone Ballarin wrote:
>>> On 06/02/24 13:04, Jan Beulich wrote:
>>>> On 02.02.2024 16:16, Simone Ballarin wrote:
>>>>> Rule 13.1: Initializer lists shall not contain persistent side effects
>>>>>
>>>>> Effects caused by debug/logging macros and functions (like ASSERT, __bad_atomic_size,
>>>>> LOG, etc ...) that crash execution or produce logs are not dangerous in initializer
>>>>> lists. The evaluation order in abnormal conditions is not relevant. Evaluation order
>>>>> of logging effects is always safe.
>>>>
>>>> I thought I said so before: When talking of just logging, evaluation order
>>>> may very well have a impact on correctness. Therefore we shouldn't mix
>>>> debugging and logging.
>>>
>>> My general feeling was that changes like the following one are not supported by
>>> the community:
>>>
>>> - x = { .field1 = function_with_logs_effects() /*other eventual code*/ };
>>> + int field1 = function_with_logs_effects();
>>> + x = { .field1 = field1 /*other eventual code*/};
>>>
>>> so I tried to deviate as much as possible.
>>>
>>> If having log effects is a good reason to do changes like the above, I can
>>> propose a patch in that sense.
>>
>> Just to avoid misunderstandings: I'm not advocating for changes like the
>> one you outline above. I simply consider the rule too strict: There's
>> nothing at risk when there's just a single operation with side effects
>> in an initializer.
> 
> I agree for the safe cases such as single item list initializers (independently
> by the number of effect contained in io_apic_read).
> In fact, I was about to propose in another patch to deviate cases like:
> 
> union IO_APIC_reg_01 reg_01 = { .raw = io_apic_read(idx, 1) };
> union IO_APIC_reg_02 reg_02 = { .raw = io_apic_read(idx, 2) };
> 
>> Even when there are multiple such operations, whether
>> there's anything at risk depends on whether any of the side effects
>> actually collide. In a number of cases the compiler would actually warn
>> (and thus, due to -Werror, the build would fail).
>>
> 
> I don't completely agree on that, this requires an in-depth comprehension
> of the code especially when complex call chains are involved. Moreover
> these deviations need to be maintained when one of the function involved changes.

Right, and I didn't really mean multiple function calls here, but e.g.
multiple ++ or --.

>>>>> --- a/xen/arch/arm/guestcopy.c
>>>>> +++ b/xen/arch/arm/guestcopy.c
>>>>> @@ -110,26 +110,34 @@ static unsigned long copy_guest(void *buf, uint64_t addr, unsigned int len,
>>>>>    unsigned long raw_copy_to_guest(void *to, const void *from, unsigned int len)
>>>>>    {
>>>>>        return copy_guest((void *)from, (vaddr_t)to, len,
>>>>> -                      GVA_INFO(current), COPY_to_guest | COPY_linear);
>>>>> +                      /* SAF-4-safe No persistent side effects */
>>>>> +                      GVA_INFO(current),
>>>>
>>>> I _still_ think this leaves ambiguity. The more that you need to look
>>>> up GVA_INFO() to recognize what this is about.
>>>
>>>
>>> Just to recap: here the point is that current reads a register with a volatile asm, so the
>>> violation is in the expansion of GVA_INFO(current). Both GVA_INFO and current taken alone
>>> are completely fine, so this is the only place where a SAF comment can be placed.
>>>
>>> The exapansion is:
>>> ((copy_info_t) { .gva = { ((*({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"(&
>>>     per_cpu__curr_vcpu)); (typeof(&per_cpu__curr_vcpu)) (__ptr + (({ uint64_t _r; asm volatile("mrs  %0, ""TPIDR_EL2" : "=r"
>>>     (_r)); _r; }))); }))) } }), (1U << 1) | (1U << 2));
>>>
>>> My proposals are:
>>> 1) address the violation moving the current expansion outside (extra variable);
>>> 2) put a more detailed comment to avoid the ambiguity;
>>> 3) use an ECL deviation for GVA_INFO(current).
>>>
>>> Do you have any preference or proposal?
>>
>> Imo 3 is not an option at all. Probably 1 wouldn't be too bad here, but
>> I still wouldn't like it (as matching a general pattern I try to avoid:
>> introducing local variables that are used just once and don't meaningfully
>> improve e.g. readability). Therefore out of what you list, 2 would remain.
>> But I'm not happy with a comment here either - as per above, there's
>> nothing that can go wrong here as long as there's only a single construct
>> with side effect(s).
>>
> So, would be changing the SAF in:
> /* SAF-<new_id>-safe single item initializer */
> 
> OK for you?

A comment, as said, is only the least bad of what you did enumerate. But
for this code in particular I'm not a maintainer anyway, so it's not me
you need to convince. I'm taking this only as an example for discussing
underlying aspects.

Jan

