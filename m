Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA53AC0D57E
	for <lists+xen-devel@lfdr.de>; Mon, 27 Oct 2025 12:58:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1151540.1482073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDLrG-0006F4-9G; Mon, 27 Oct 2025 11:57:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1151540.1482073; Mon, 27 Oct 2025 11:57:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vDLrG-0006DJ-5t; Mon, 27 Oct 2025 11:57:54 +0000
Received: by outflank-mailman (input) for mailman id 1151540;
 Mon, 27 Oct 2025 11:57:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=UVx/=5E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vDLrF-0006DB-7d
 for xen-devel@lists.xenproject.org; Mon, 27 Oct 2025 11:57:53 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a7736b5-b32c-11f0-9d16-b5c5bf9af7f9;
 Mon, 27 Oct 2025 12:57:52 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-471b80b994bso64821345e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 Oct 2025 04:57:52 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd494d5csm134704095e9.9.2025.10.27.04.57.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 04:57:51 -0700 (PDT)
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
X-Inumbo-ID: 2a7736b5-b32c-11f0-9d16-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761566271; x=1762171071; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=czRsJIkeIQyDickI5ZiW35dj4RlYbVgngh7L36yZgVo=;
        b=ESc9ZkhdqoCf74/B5JPdL578SZ4odlH33XYuU3EHqI8QM2fNSVo7OJF7hPpEPEcJ7o
         znCbCXCvNOXJmVHJcJOtxoTGk3WiQgp0yrJgpxwt9ZOsRw9YuwY4oGA4HnMInMh/pO26
         KZvmPsFHdqmGwhpd5d/15kD2sZwacbwBFdtCsoWn058YGKQtO9E5np/MUJqu0jBeU3YC
         6jzfYeSkdh3FjG3PB3Ihwj74UDveI0AZwUmyxLx+6TgUd31Z/pmXaon3Br/t7fdA93Hj
         oOKZYbzjQbggmA/qCcrqyl+gx+dG9ZEkt+XXVpL9qhC/2uaFr4BDziCHErxWr/RD2BJm
         WoIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761566271; x=1762171071;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=czRsJIkeIQyDickI5ZiW35dj4RlYbVgngh7L36yZgVo=;
        b=fr9W83soH/48mm04yzkCBhawt1j7dqVQBjKFBKnJUUifeF4ZqTlm+5/kheWdK1BEok
         cL/jdmrYoImN/9i2b63OzggQWlbuL0dzEm/IOXuBAeVBL1qDzS6w8UlASw9X10ATjWqL
         c2lNdoP0zU0zUHu/BM8Ok8TJXLXgaF6rIDJi4xrrMtzKyy3/nvqYYf3dTgUlGHLmekEs
         qOg4w17UgQ5LhNDOwHG5+EQId7Y3/etpKU82P6qUqpEa/d40vS63aMzxddaT+kcYV4Kf
         aB7ZknB64PMEzlR6dqqg4VdL/4fR/CWAC6JYwfAT0PiI9o6s/Zge5c0zFcw+iyGG/KPw
         mlFg==
X-Gm-Message-State: AOJu0YwkHUD9RzWM5RFL8gsXbZ2HMoY5PB5uvWbeUjKkjASz2g+cJQGL
	+4x/vOd8IUJi9YLOXjilczjKWXnEAM3r6lDgOVLAFLF9AgKtffCTpMHrMK9Q5cNOnrM9mYcsJJM
	ddl8=
X-Gm-Gg: ASbGncs4dT8OQn6PpRSMZlIZhj5/H7nPctHL7RPWUoKitXyV4cPO7dHpy1C7FFbTp1+
	SchcpOdnEakLp8jYwMuJCFtjvzVQdkW+ehj/vi2mdkt6nOktE0tCu1kXXBplwa28qW5e/tqpWaV
	GWAEkYvUVloX5dH5wwkNeL7/17aD5hQNXYoxo6OWfR4e3yhRv17h3mcmPiADB9BJNhEF7CL9t4j
	X9t2RHurUojZCpZ9WTW5C9Dl+BH1ww2AcDC2k3YFoAbU7BIL1iP6iNJ0LI4XQVKQc06tIe+ArOX
	ocz2xLS7hGmGICYxqzv6nW1ev74dNjHrlpRIQAoRHSnYfOqsNssz3uV72zwQXpamBARdkxLe6kM
	M2UF2vxiqxbOsdAhP71oid+IP/dLoX7pv6om9xS03cYppnbfiiNqcXHdfzmWq7SACG+bQ67XGCd
	+vQJnMjJfJdL2RCdDbrTW7g9MwygHgY7cOQmvmynq3Evqg1vBNf1vpJwTvSKzSx85H4EVibQ8=
X-Google-Smtp-Source: AGHT+IGX91LqigwF59GuTZwo94JcPcMRNw6IwY1xq0l/DF0p3H5km1ooN7GscEhqJhMRu+2A0PTkgA==
X-Received: by 2002:a05:600c:3e12:b0:45b:7d77:b592 with SMTP id 5b1f17b1804b1-471178a74demr270805175e9.12.1761566271530;
        Mon, 27 Oct 2025 04:57:51 -0700 (PDT)
Message-ID: <53fe0d0e-54a5-4ac0-8243-0199587a6d19@suse.com>
Date: Mon, 27 Oct 2025 12:57:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 for-4.21 2/9] x86/HPET: use single, global,
 low-priority vector for broadcast IRQ
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <6a8a912c-7276-42bd-af2b-b94fc6ce4291@suse.com>
 <545d98e0-755d-471b-84c5-54f129a5aece@suse.com> <aPt-B5R-FwJpQbZR@Mac.lan>
 <6428217d-b5f6-4948-aff2-b007a6cfcfc0@suse.com> <aP9YkLo782XbfMQM@Mac.lan>
 <536c4e25-1e32-4adf-865d-7750f08a2922@suse.com>
Content-Language: en-US
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
In-Reply-To: <536c4e25-1e32-4adf-865d-7750f08a2922@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.10.2025 12:53, Jan Beulich wrote:
> On 27.10.2025 12:33, Roger Pau Monné wrote:
>> On Mon, Oct 27, 2025 at 11:23:58AM +0100, Jan Beulich wrote:
>>> On 24.10.2025 15:24, Roger Pau Monné wrote:
>>>> On Thu, Oct 23, 2025 at 05:50:17PM +0200, Jan Beulich wrote:
>>>>> @@ -343,6 +347,12 @@ static int __init hpet_setup_msi_irq(str
>>>>>      u32 cfg = hpet_read32(HPET_Tn_CFG(ch->idx));
>>>>>      irq_desc_t *desc = irq_to_desc(ch->msi.irq);
>>>>>  
>>>>> +    clear_irq_vector(ch->msi.irq);
>>>>> +    ret = bind_irq_vector(ch->msi.irq, HPET_BROADCAST_VECTOR, &cpu_online_map);
>>>>
>>>> By passing cpu_online_map here, it leads to _bind_irq_vector() doing:
>>>>
>>>> cpumask_copy(desc->arch.cpu_mask, &cpu_online_map);
>>>>
>>>> Which strictly speaking is wrong.  However this is just a cosmetic
>>>> issue until the irq is used for the first time, at which point it will
>>>> be assigned to a concrete CPU.
>>>>
>>>> You could do:
>>>>
>>>> cpumask_clear(desc->arch.cpu_mask);
>>>> cpumask_set_cpu(cpumask_any(&cpu_online_map), desc->arch.cpu_mask);
>>>>
>>>> (Or equivalent)
>>>>
>>>> To assign the interrupt to a concrete CPU and reflex it on the
>>>> cpu_mask after the bind_irq_vector() call, but I can live with it
>>>> being like this.  I have patches to adjust _bind_irq_vector() myself,
>>>> which I hope I will be able to post soon.
>>>
>>> Hmm, I wrongly memorized hpet_broadcast_init() as being pre-SMP-init only.
>>> It has three call sites:
>>> - mwait_idle_init(), called from cpuidle_presmp_init(),
>>> - amd_cpuidle_init(), calling in only when invoked the very first time,
>>>   which is again from cpuidle_presmp_init(),
>>> - _disable_pit_irq(), called from the regular initcall disable_pit_irq().
>>> I.e. for the latter you're right that the CPU mask is too broad (in only a
>>> cosmetic way though). Would be you okay if I used cpumask_of(0) in place
>>> of &cpu_online_map?
>>
>> Using cpumask_of(0) would be OK, as the per-cpu vector_irq array will
>> be updated ahead of assigning the interrupt to a CPU, and hence it
>> doesn't need to be done for all possible online CPUs in
>> _bind_irq_vector().
>>
>> In the context here it would be more accurate to provide an empty CPU
>> mask, as the interrupt is not yet targeting any CPU.  Using CPU 0
>> would be a placeholder, which seems fine for the purpose.
> 
> Putting an empty mask there, while indeed logically correct, would (I fear)
> again put us at risk with other code making various assumptions.

And indeed: _bind_irq_vector() would reject an empty mask.

Jan

