Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBFAB3B344
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 08:20:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100591.1453950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ursTT-0006HQ-2o; Fri, 29 Aug 2025 06:20:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100591.1453950; Fri, 29 Aug 2025 06:20:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ursTS-0006Ea-W0; Fri, 29 Aug 2025 06:20:34 +0000
Received: by outflank-mailman (input) for mailman id 1100591;
 Fri, 29 Aug 2025 06:20:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xaUo=3J=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ursTR-0006EB-HL
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 06:20:33 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 441dbe53-84a0-11f0-8adc-4578a1afcccb;
 Fri, 29 Aug 2025 08:20:32 +0200 (CEST)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-61cb9f6dbe7so3096619a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 28 Aug 2025 23:20:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc22dfa1sm1153279a12.22.2025.08.28.23.20.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Aug 2025 23:20:31 -0700 (PDT)
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
X-Inumbo-ID: 441dbe53-84a0-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756448432; x=1757053232; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SwL8ZSyp2xvdczBMLmzpIMgQu7XvJRUCLOwwoh43KYs=;
        b=ItcPzFZFfrFEEqxLNfhVRBZeYMq54Alpgg21abgx6IyzlCQMOWfublKEGTXAlX2oYw
         IfRld0YA/DFaWeJchvWdTDNtcUSHUnR7clFL33T61SA876HE//MMgEQz33VLKTnnEcy3
         SGzvPpnd4UTV1rdlpJOJFvxSaFZjgPlozzAfb5uzRngeWI6DB019zX6tVHHG4RcjZEf1
         cVaTepiHA9EEESBr3/YTP0i+TZ+TL2JCwFM5hlcVazhKzq2pme9aktJSSe52F0O1OTnp
         /Ps93qtwcloggSbfBCBSj1U6cln+p8XQOr0+BF3p+YTIPJEvMJGyLVEbZAiJuRhfRUcA
         rl6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756448432; x=1757053232;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SwL8ZSyp2xvdczBMLmzpIMgQu7XvJRUCLOwwoh43KYs=;
        b=k5kOYtcZZPdei8MkC+ReQSxuOHk+Jhtkg1bjo/f28NU/537ceD7/7wtfUTIDeq9uVh
         QXvP/knE2modwKxAhx1r6vERF2RO9BOBQQbJNjyMlL3TuNDHxyLOpYpyEoz+olGZyIrw
         o2szXVvIw0Q0z5RFcNAUsUfIeM7TwGwx3ahBndlgafWtipHmL8yjBqqH910b9tq1xie9
         cWZkRXk9BKn+lCGT41J15sQn4R3OryoZGQRqA9tM/YoXxi/ZWOfdNVoAflDVSgs5Czwh
         sVRDksHvEVnyTEOJJMRP/xDc+6ipa0XQ9p9fo8HsOMd6YdXASeLxsRyCxsyQnJ4tqukO
         ZEbg==
X-Forwarded-Encrypted: i=1; AJvYcCXjvQDoJTYwaI2wz1mgk0NubpHkBGSgtLc6Q7vu9eWKgNqRcxLu2WXwlshP2GLsHU0xtTM5aTyg+mo=@lists.xenproject.org
X-Gm-Message-State: AOJu0YymychhMylWok5dH56+4HWONDcVtug6ZCpjF2Wg8F+GF3N2qbia
	paB5+kJ1u/GHBjTfEHzDa5hy91pPORL4vGxTDFlKsQ7vWdARh3VVzRnh4eQpTfqntg==
X-Gm-Gg: ASbGncvTfsG9aY8c0dMxLrqnRejkTod1v422EIgRS7wciCufGml12D9+6MushtTVxo3
	Yra0w3MwBQirxMLy0BxSjE51gs6/a8OnmlkxGCGqpFUXKSexJNKXFJ8YCgbsB1jzVCVMhz3G3Rg
	4N02VhwnZ8c5rzvAW7e56uNrtJKGgX9w341Fh1vdU2X3F7VghX7klgXdKgGy8UOp49Flw7oAZ4v
	vfz/oI+OhAudpoW0O6U5MvCbv/4k7JVA/FO6GuYErwEP6XYdd1exCmThoEpSWUUBLlGKxaoXgP4
	pmXX4YKSyaREoBHK4mtWuv+zBW6uefoyurATby4A4ID0FCMivQOBOnEYoVh9kZB8I6j0ksRE/P5
	ssSYOMA9nl9fnG6SmzNuPM0lwcAW2HJIYDR5cHesx2B8mLPwPxGsdm4r4FHf8onaH1xJEFYHaHY
	agaKNRqBKw0VowVuAfmg==
X-Google-Smtp-Source: AGHT+IHIpvhmevXzID993Jjkojmc1EXIeV+k2RSEEPf5zr2LxpJIGPp22+UmKRdyOtiOYtRAvWixkQ==
X-Received: by 2002:a05:6402:2114:b0:61d:13b:3c6d with SMTP id 4fb4d7f45d1cf-61d013b4883mr1142029a12.24.1756448431764;
        Thu, 28 Aug 2025 23:20:31 -0700 (PDT)
Message-ID: <8fbe910a-d6ff-4ddf-8375-f1c008ffde42@suse.com>
Date: Fri, 29 Aug 2025 08:20:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/8] xen/cpufreq: implement amd-cppc driver for CPPC in
 passive mode
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: ray.huang@amd.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org,
 Penny Zheng <Penny.Zheng@amd.com>
References: <20250828100306.1776031-1-Penny.Zheng@amd.com>
 <20250828100306.1776031-4-Penny.Zheng@amd.com>
 <b2712815-97c2-4473-bcf6-aae8517aad37@suse.com>
 <24474024-0542-48e5-a1b8-bb534c7eeb4b@amd.com>
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
In-Reply-To: <24474024-0542-48e5-a1b8-bb534c7eeb4b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.08.2025 02:16, Jason Andryuk wrote:
> On 2025-08-28 07:22, Jan Beulich wrote:
>> On 28.08.2025 12:03, Penny Zheng wrote:
>>> +static int cf_check amd_cppc_cpufreq_target(struct cpufreq_policy *policy,
>>> +                                            unsigned int target_freq,
>>> +                                            unsigned int relation)
>>> +{
>>> +    unsigned int cpu = policy->cpu;
>>> +    const struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data, cpu);
>>
>> I fear there's a problem here that I so far overlooked. As it happens, just
>> yesterday I made a patch to eliminate cpufreq_drv_data[] global. In the
>> course of doing so it became clear that in principle the CPU denoted by
>> policy->cpu can be offline. Hence its per-CPU data is also unavailable. See
>> cpufreq_add_cpu()'s invocation of .init() and cpufreq_del_cpu()'s invocation
>> of .exit(). Is there anything well-hidden (and likely lacking some suitable
>> comment) which guarantees that no two CPUs (threads) will be in the same
>> domain? If not, I fear you simply can't use per-CPU data here.
> 
> Sorry, I'm confused by your use of "domain" here.

I agree it's confusing, but that's the terminology used in cpufreq.c (see
e.g. "struct cpufreq_dom" or "const struct xen_psd_package *domain_info").

>  Do you mean a 
> per_cpu(..., policy->cpu) access racing with a cpu offline?

Yes (I wouldn't call it "racing" though, as it's not a timing issue).

>  I'm not 
> away of anything preventing that, though I'm not particularly familiar 
> with it.



> do_pm_op() has:
>      if ( op->cpuid >= nr_cpu_ids || !cpu_online(op->cpuid) )
>          return -EINVAL;
>      pmpt = processor_pminfo[op->cpuid];
> 
> and do_get_pm_info() has:
>      if ( !op || (op->cpuid >= nr_cpu_ids) || !cpu_online(op->cpuid) )
>          return -EINVAL;
>      pmpt = processor_pminfo[op->cpuid];
> 
> But those are only at entry.

That's not accessing struct cpufreq_policy, though. Per-CPU accesses
using policy->cpu are the problematic ones, as - from all I can tell -
the CPU named there can have gone offline, with the policy surviving
when some other CPU is also part of the same "domain".

As said in the reply to Penny, main question is whether the data
controlling what a "domain" covers may be constrained in the HWP case,
demanding that no two CPUs (threads) can be in the same "domain". Then
adding merely a sanity check somewhere would suffice.

Jan

