Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC2C84C88A
	for <lists+xen-devel@lfdr.de>; Wed,  7 Feb 2024 11:24:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.677326.1053861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXf6U-0006Kx-BR; Wed, 07 Feb 2024 10:24:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 677326.1053861; Wed, 07 Feb 2024 10:24:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rXf6U-0006It-8q; Wed, 07 Feb 2024 10:24:30 +0000
Received: by outflank-mailman (input) for mailman id 677326;
 Wed, 07 Feb 2024 10:24:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EHwQ=JQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rXf6S-0006In-Qd
 for xen-devel@lists.xenproject.org; Wed, 07 Feb 2024 10:24:28 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11b9a908-c5a3-11ee-98f5-efadbce2ee36;
 Wed, 07 Feb 2024 11:24:26 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-33b466bc363so299308f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 07 Feb 2024 02:24:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a6-20020adffac6000000b0033b4a52bfbfsm1137846wrs.57.2024.02.07.02.24.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Feb 2024 02:24:25 -0800 (PST)
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
X-Inumbo-ID: 11b9a908-c5a3-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707301466; x=1707906266; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DD2ZdcqNJo+L5U+OTILg3YCDJtGAHhzTdFjO+uk8Zpc=;
        b=Xx/s9ULny2oA9eqYGkMd/RFdQ8IL36JOGFVU1k0xB8jh/Mvd/oSz+BAiasKnljNJUn
         2emCT0cmUdvthgleFDTTZBSpsqsA4k0Tz2I4Am7cp08v2WJyaTyq83S3DnLnQvlmkFhm
         kY1hEZUKZaMrHUZBu3KfoE1oibNFEsL55DyB2P4kDPi4ybgjqBZxQXfW2sntauqpHFi0
         bIypqwXHA8cjlGZCmQ/ERL0WxLcfVRUegexlIF9gTtmQIFrFpSKIvts0VhmaWlkJrbHs
         dvf6XaNr1ZkhK/Z92sXCXY65KNcjXU3FOGzOm3NEHGhDErogsdZMQMi+V20xu7tBGKF8
         dzaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707301466; x=1707906266;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DD2ZdcqNJo+L5U+OTILg3YCDJtGAHhzTdFjO+uk8Zpc=;
        b=E+ANQqx8lxUh6yXGzCCYb6/buYg7bKzXdEkWrapK3f/Rrvvo3YLvNB6PsuoIgRWDbe
         lhsUHE5neDBFeumnB7r05y+FaFzD3pIKhCjvYKdLJYnwPr0g+MTkfemdQt/XUfaXGvN7
         wbHlf1foGmGMdwrYhhU7piANKdr4yqTnhMRm1d5SWSfbDV+lEoeraZq1uJ4Gfpzdt0HZ
         M6bIHQnfSBEdgX2UORx20w2E7JvxAuOsc0kXNDOrq5bJQhf6ieGr9NPDAyMEYglolENh
         p3r+dMnZ2jNEO71kSOfLG63yhIiBO1zPdJPFP24mS03pAJPb51N2Ys8ILoRC4wgsGpCe
         7acA==
X-Forwarded-Encrypted: i=1; AJvYcCWJeY7YSQqR67n2TuxeaJCvSUFJe5USHEuAES9qAFcalDQvJ2OFQ/4FZKAEpAO3y8bDRi1wE6HGcIYGo9OU+rdN/QQ6XQOTTv6zsCcFSZw=
X-Gm-Message-State: AOJu0Yxs3PONesz3fVtccRCYnO1REgFM8zLaPBVxW8bGsBridHujmMXb
	gESzzpyFLIbId525nDk8CLZySUb2EXE5IKqfBB2hcZssV7GabySPHBpyN4h92A==
X-Google-Smtp-Source: AGHT+IEB0PXF19yXhagbO8thfBtNm1bkMy70NT9rpsqw4RzAIUUGiawgsvPYdyUUojOVmnXrd2tcrg==
X-Received: by 2002:adf:f546:0:b0:33b:4ad0:5475 with SMTP id j6-20020adff546000000b0033b4ad05475mr2091513wrp.37.1707301465785;
        Wed, 07 Feb 2024 02:24:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX6bIO6tUKisWhyF0XHsGxQ4yRmYU5SidGvgdgYOEZlTDuvCNPleEl7KZMt/pyTcF7b2zIuJlEom6rsBLnL1Y9Vypx9UhmWKkraELrDkeSpwpi4n/B1W4MWYTKMrYzPy48sX0gvSLet1POa98XuOLIx6FlJTwad5thX5VkxUvk1mA9wh13sq86k8Gyh+BydolsvuwA2pvgoFcyOIV1z6BzlnqKCKBzOnTkP4mTAw9qbW+7DdkfTpu3xy8I3racrXLwdwrKap3BC203h9RQyL6y5rDI5U0g0Hfb0R5EkKjNB/M8Zo8hWUsPwoD6WrdDahQhZ9S/CPCOS0nQPUBxaIVohihVC0LzY5d6FgAaVpJKm0aFK/hokJo/9o+P/Pe+nDwaOXV4Yl63Ux3Mme4yJFlEySljPfxD8MwFPmEUlKhIn+Y1WBCUZv7FMvR8Pe96VxG8=
Message-ID: <41474fe7-c65f-4244-a455-0aaa0e4315e3@suse.com>
Date: Wed, 7 Feb 2024 11:24:24 +0100
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
In-Reply-To: <851eb6ec-558b-4a89-a31a-34046730bb55@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.02.2024 11:03, Simone Ballarin wrote:
> On 06/02/24 13:04, Jan Beulich wrote:
>> On 02.02.2024 16:16, Simone Ballarin wrote:
>>> Rule 13.1: Initializer lists shall not contain persistent side effects
>>>
>>> Effects caused by debug/logging macros and functions (like ASSERT, __bad_atomic_size,
>>> LOG, etc ...) that crash execution or produce logs are not dangerous in initializer
>>> lists. The evaluation order in abnormal conditions is not relevant. Evaluation order
>>> of logging effects is always safe.
>>
>> I thought I said so before: When talking of just logging, evaluation order
>> may very well have a impact on correctness. Therefore we shouldn't mix
>> debugging and logging.
> 
> My general feeling was that changes like the following one are not supported by
> the community:
> 
> - x = { .field1 = function_with_logs_effects() /*other eventual code*/ };
> + int field1 = function_with_logs_effects();
> + x = { .field1 = field1 /*other eventual code*/};
> 
> so I tried to deviate as much as possible.
> 
> If having log effects is a good reason to do changes like the above, I can
> propose a patch in that sense.

Just to avoid misunderstandings: I'm not advocating for changes like the
one you outline above. I simply consider the rule too strict: There's
nothing at risk when there's just a single operation with side effects
in an initializer. Even when there are multiple such operations, whether
there's anything at risk depends on whether any of the side effects
actually collide. In a number of cases the compiler would actually warn
(and thus, due to -Werror, the build would fail).

The primary purpose of my comment here was that we need to please
separate debugging from logging side effects.

>>> --- a/xen/arch/arm/guestcopy.c
>>> +++ b/xen/arch/arm/guestcopy.c
>>> @@ -110,26 +110,34 @@ static unsigned long copy_guest(void *buf, uint64_t addr, unsigned int len,
>>>   unsigned long raw_copy_to_guest(void *to, const void *from, unsigned int len)
>>>   {
>>>       return copy_guest((void *)from, (vaddr_t)to, len,
>>> -                      GVA_INFO(current), COPY_to_guest | COPY_linear);
>>> +                      /* SAF-4-safe No persistent side effects */
>>> +                      GVA_INFO(current),
>>
>> I _still_ think this leaves ambiguity. The more that you need to look
>> up GVA_INFO() to recognize what this is about.
> 
> 
> Just to recap: here the point is that current reads a register with a volatile asm, so the
> violation is in the expansion of GVA_INFO(current). Both GVA_INFO and current taken alone
> are completely fine, so this is the only place where a SAF comment can be placed.
> 
> The exapansion is:
> ((copy_info_t) { .gva = { ((*({ unsigned long __ptr; __asm__ ("" : "=r"(__ptr) : "0"(&
>    per_cpu__curr_vcpu)); (typeof(&per_cpu__curr_vcpu)) (__ptr + (({ uint64_t _r; asm volatile("mrs  %0, ""TPIDR_EL2" : "=r"
>    (_r)); _r; }))); }))) } }), (1U << 1) | (1U << 2));
> 
> My proposals are:
> 1) address the violation moving the current expansion outside (extra variable);
> 2) put a more detailed comment to avoid the ambiguity;
> 3) use an ECL deviation for GVA_INFO(current).
> 
> Do you have any preference or proposal?

Imo 3 is not an option at all. Probably 1 wouldn't be too bad here, but
I still wouldn't like it (as matching a general pattern I try to avoid:
introducing local variables that are used just once and don't meaningfully
improve e.g. readability). Therefore out of what you list, 2 would remain.
But I'm not happy with a comment here either - as per above, there's
nothing that can go wrong here as long as there's only a single construct
with side effect(s).

>>> --- a/xen/arch/x86/hvm/hvm.c
>>> +++ b/xen/arch/x86/hvm/hvm.c
>>> @@ -800,6 +800,7 @@ static int cf_check hvm_save_cpu_ctxt(struct vcpu *v, hvm_domain_context_t *h)
>>>   {
>>>       struct segment_register seg;
>>>       struct hvm_hw_cpu ctxt = {
>>> +        /* SAF-3-safe effects for debugging/logging reasons are safe */
>>>           .tsc = hvm_get_guest_tsc_fixed(v, v->domain->arch.hvm.sync_tsc),
>>
>> A prereq for this imo is that the function take const struct vcpu *.
>> But I'm not sure that'll suffice. The function can change at any time,
>> rendering the comment here stale perhaps without anyone noticing.
>>
> 
> IMO It isn't a strict prereq, but it would make everything more clear.
> 
> In any case, apart adding the const, I do not see other easy solutions.
> Would you give me your ack if I change the function signature?

Well, as said: I'm not sure that'll suffice.

> Another possible solutions would be documenting the function in the new
> JSON file with a special attribute like only_debug_effect. Of course,
> this still requires keeping the JSON up to date in case of changes.

Exactly. So wouldn't really help.

In any event I'd like to ask that you consider splitting up this patch,
such that you won't need multiple acks for any of the parts. That'll
also allow focusing on one aspect at a time in reviews.

Jan

