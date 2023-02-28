Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DB86A5B46
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 16:05:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503435.775711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX1Xf-0007FB-D2; Tue, 28 Feb 2023 15:05:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503435.775711; Tue, 28 Feb 2023 15:05:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pX1Xf-0007CM-A6; Tue, 28 Feb 2023 15:05:23 +0000
Received: by outflank-mailman (input) for mailman id 503435;
 Tue, 28 Feb 2023 15:05:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4VB9=6Y=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pX1Xe-0007CG-1Y
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 15:05:22 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50c86d35-b779-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 16:05:19 +0100 (CET)
Received: by mail-ed1-x52d.google.com with SMTP id i34so41255809eda.7
 for <xen-devel@lists.xenproject.org>; Tue, 28 Feb 2023 07:05:19 -0800 (PST)
Received: from [192.168.1.93] (adsl-150.109.242.227.tellas.gr.
 [109.242.227.150]) by smtp.gmail.com with ESMTPSA id
 x16-20020a170906441000b008d09b900614sm4536023ejo.80.2023.02.28.07.05.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Feb 2023 07:05:18 -0800 (PST)
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
X-Inumbo-ID: 50c86d35-b779-11ed-a550-8520e6686977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RUmwbozT7YbHnyo7OEP0SEgOgg9ho/6ShyNhqhfcrbk=;
        b=VG8NrYoNYWEzJ3vhndNMWIZKN4pKrvqt8f+2msS+YfyKEXYGBBdT4BQ2fTlIOs/kfs
         EvLYT4iUJuTYqhxDc4NlUC2ZfdarJT/n2WHD5tBmE6Vc9fz1bjR1eckBE7LJCkJTP+Dx
         uAoXMR+jEuKx3XwLC94+67IQ3zFUduXes7XKAsichYcK/hupuxFR8ARr9b180lxBnMaS
         bmUuJA4C2OA9WOakRj0Z6x6buI++wsa3VJX0EBcUjZZ82pK7c3tqI5k2zt/Djr4BZSx9
         K5ew5mlEfcDeiIbh3zj2YgPZ8x7NANuPjWCKyRQUUQgw4Xv3z8Iw1+ZYPzFVlONaci3J
         D5uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RUmwbozT7YbHnyo7OEP0SEgOgg9ho/6ShyNhqhfcrbk=;
        b=aFbepCA6Cqw4Jvm0ItEAR3BkvTtBkcfodXjAYVLJWmPJASFRC/uMY8EnSKY2CCd+P+
         ZvRPkjojSNeATvaVEluhP/2PzOKTy/1v2DadIatKAXVxaUTHXNxfksfX5Vi+TJzqDj1o
         lJdqOi9SRHQHRl0E5ryVPbHn4MX3a9E9HseWIPAKXcwDU49bwmlySjIU+qAPtXo3SUMK
         6NrUj/QGLESXWEDpD4ArNNlY52BJqbCC1Iz+an9e9XSGt51ESJfO2CpSwL3OnSVAHvo/
         oJSC4rYeOURlWEjemZj+E6EsHLh37pc8xYdQ1EbnGmoAawpzSBAz4wBVtWjxl4sco/LF
         UfnQ==
X-Gm-Message-State: AO0yUKVo9gcoyoXIMm8t3CHmxknAAz0HlmVVk6FEP070VMQUbn0pwY3z
	WVo8YSb9es5qepv3qLVn22U=
X-Google-Smtp-Source: AK7set/zJ7bEh3HkyxuhljlAoeBNv9LOlZ2kKmv+wNE56dbhHeBQ+vw0N9nvbq8W7Hsh92BU84PLBg==
X-Received: by 2002:a17:907:3f88:b0:8ae:6b88:e52d with SMTP id hr8-20020a1709073f8800b008ae6b88e52dmr14484928ejc.7.1677596718787;
        Tue, 28 Feb 2023 07:05:18 -0800 (PST)
Message-ID: <b13c5685-7d52-e0e0-95ad-7d766790d057@gmail.com>
Date: Tue, 28 Feb 2023 17:05:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 2/4] x86/svm: split svm_intercept_msr() into
 svm_{set,clear}_msr_intercept()
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230227075652.3782973-1-burzalodowa@gmail.com>
 <20230227075652.3782973-3-burzalodowa@gmail.com>
 <bf77733a-d0cc-8e31-5a05-f0709e7ef1fb@suse.com>
From: Xenia Ragiadakou <burzalodowa@gmail.com>
In-Reply-To: <bf77733a-d0cc-8e31-5a05-f0709e7ef1fb@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 2/28/23 16:20, Jan Beulich wrote:
> On 27.02.2023 08:56, Xenia Ragiadakou wrote:
>> This change aims to render the control interface of MSR intercepts identical
>> between SVM and VMX code, so that the control of the MSR intercept in common
>> code can be done through an hvm_funcs callback.
>>
>> Create two new functions:
>> - svm_set_msr_intercept(), enables interception of read/write accesses to the
>>    corresponding MSR, by setting the corresponding read/write bits in the MSRPM
>>    based on the flags
>> - svm_clear_msr_intercept(), disables interception of read/write accesses to
>>    the corresponding MSR, by clearing the corresponding read/write bits in the
>>    MSRPM based on the flags
> 
> In how far is VMX'es present model better than SVM's? They both have pros and
> cons, depending on the specific use. I'm not asking to do it the other way
> around (at least not yet), I'd merely like to understand why we're going to
> gain two new hooks (if I'm not mistaken) when we could also get away with
> just one.

SVM approach always touches both read/write bits (either by setting or 
clearing them). I thought that using the SVM approach on VMX could be 
considered a functional change (because there are parts where VMX 
assumes that a bit is already set or cleared and does not touch it).

> 
>> --- a/xen/arch/x86/cpu/vpmu_amd.c
>> +++ b/xen/arch/x86/cpu/vpmu_amd.c
>> @@ -165,8 +165,9 @@ static void amd_vpmu_set_msr_bitmap(struct vcpu *v)
>>   
>>       for ( i = 0; i < num_counters; i++ )
>>       {
>> -        svm_intercept_msr(v, counters[i], MSR_INTERCEPT_NONE);
>> -        svm_intercept_msr(v, ctrls[i], MSR_INTERCEPT_WRITE);
>> +        svm_clear_msr_intercept(v, counters[i], MSR_RW);
>> +        svm_set_msr_intercept(v, ctrls[i], MSR_W);
>> +        svm_clear_msr_intercept(v, ctrls[i], MSR_R);
>>       }
>>   
>>       msr_bitmap_on(vpmu);
>> @@ -179,8 +180,8 @@ static void amd_vpmu_unset_msr_bitmap(struct vcpu *v)
>>   
>>       for ( i = 0; i < num_counters; i++ )
>>       {
>> -        svm_intercept_msr(v, counters[i], MSR_INTERCEPT_RW);
>> -        svm_intercept_msr(v, ctrls[i], MSR_INTERCEPT_RW);
>> +        svm_set_msr_intercept(v, counters[i], MSR_RW);
>> +        svm_set_msr_intercept(v, ctrls[i], MSR_RW);
>>       }
> 
> This, aiui, restores back original state (I question the condition that the
> caller uses, though, but that's a separate issue). Therefore is the single
> "set" in the earlier function actually needed?

This is what the svm_intercept_msr(v, ctrls[i], MSR_INTERCEPT_WRITE) 
does, i.e it sets the WRITE and clears the READ. It is not needed if it 
is already set, but in my opinion the redundant parts should be removed 
in another patch.

> 
>> --- a/xen/arch/x86/hvm/svm/svm.c
>> +++ b/xen/arch/x86/hvm/svm/svm.c
>> @@ -288,23 +288,34 @@ svm_msrbit(unsigned long *msr_bitmap, uint32_t msr)
>>       return msr_bit;
>>   }
>>   
>> -void svm_intercept_msr(struct vcpu *v, uint32_t msr, int flags)
>> +void svm_set_msr_intercept(struct vcpu *v, uint32_t msr, int flags)
> 
> Can the last parameter become "unsigned int", please?
> 
>>   {
>> -    unsigned long *msr_bit;
>> -    const struct domain *d = v->domain;
>> +    unsigned long *msr_bit = svm_msrbit(v->arch.hvm.svm.msrpm, msr);
>> +
>> +    if ( msr_bit == NULL )
>> +        return;
>>   
>> -    msr_bit = svm_msrbit(v->arch.hvm.svm.msrpm, msr);
>> -    BUG_ON(msr_bit == NULL);
> 
> The conversion from BUG_ON() to "return" needs explanation; I don't see
> why that's warranted here. From all I can tell the case is impossible
> due to the way construct_vmcb() works, and hence BUG_ON() is appropriate
> (and personally I would also be fine with no check at all, provided I'm
> not overlooking anything).

It was my mistake I should have not removed it.

> 
>> @@ -312,8 +323,10 @@ static void cf_check svm_enable_msr_interception(struct domain *d, uint32_t msr)
>>   {
>>       struct vcpu *v;
>>   
>> -    for_each_vcpu ( d, v )
>> -        svm_intercept_msr(v, msr, MSR_INTERCEPT_WRITE);
>> +    for_each_vcpu ( d, v ) {
> 
> Nit: Brace placement.

Sorry. I will fix.

> 
>> @@ -595,22 +608,31 @@ static void cf_check svm_cpuid_policy_changed(struct vcpu *v)
>>       vmcb_set_exception_intercepts(vmcb, bitmap);
>>   
>>       /* Give access to MSR_SPEC_CTRL if the guest has been told about it. */
>> -    svm_intercept_msr(v, MSR_SPEC_CTRL,
>> -                      cp->extd.ibrs ? MSR_INTERCEPT_NONE : MSR_INTERCEPT_RW);
>> +    if ( cp->extd.ibrs )
>> +        svm_clear_msr_intercept(v, MSR_SPEC_CTRL, MSR_RW);
>> +    else
>> +        svm_set_msr_intercept(v, MSR_SPEC_CTRL, MSR_RW);
>>   
>>       /*
>>        * Always trap write accesses to VIRT_SPEC_CTRL in order to cache the guest
>>        * setting and avoid having to perform a rdmsr on vmexit to get the guest
>>        * setting even if VIRT_SSBD is offered to Xen itself.
>>        */
>> -    svm_intercept_msr(v, MSR_VIRT_SPEC_CTRL,
>> -                      cp->extd.virt_ssbd && cpu_has_virt_ssbd &&
>> -                      !cpu_has_amd_ssbd ?
>> -                      MSR_INTERCEPT_WRITE : MSR_INTERCEPT_RW);
>> +    if ( cp->extd.virt_ssbd && cpu_has_virt_ssbd && !cpu_has_amd_ssbd )
>> +    {
>> +        svm_set_msr_intercept(v, MSR_VIRT_SPEC_CTRL, MSR_W);
>> +        svm_clear_msr_intercept(v, MSR_VIRT_SPEC_CTRL, MSR_R);
>> +    }
>> +    else
>> +    {
>> +        svm_set_msr_intercept(v, MSR_VIRT_SPEC_CTRL, MSR_RW);
>> +    }
> 
> Preferably omit the braces for "else" here, just like you do above and ...

I added them for symmetry, since the first has. I find it easier to 
follow, personally. I can omit it.

> 
>>       /* Give access to MSR_PRED_CMD if the guest has been told about it. */
>> -    svm_intercept_msr(v, MSR_PRED_CMD,
>> -                      cp->extd.ibpb ? MSR_INTERCEPT_NONE : MSR_INTERCEPT_RW);
>> +    if ( cp->extd.ibpb )
>> +        svm_clear_msr_intercept(v, MSR_VIRT_SPEC_CTRL, MSR_RW);
>> +    else
>> +        svm_set_msr_intercept(v, MSR_VIRT_SPEC_CTRL, MSR_RW);
> 
> ... here.
> 
>> --- a/xen/arch/x86/include/asm/hvm/svm/vmcb.h
>> +++ b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
>> @@ -585,13 +585,12 @@ void svm_destroy_vmcb(struct vcpu *v);
>>   
>>   void setup_vmcb_dump(void);
>>   
>> -#define MSR_INTERCEPT_NONE    0
>> -#define MSR_INTERCEPT_READ    1
>> -#define MSR_INTERCEPT_WRITE   2
>> -#define MSR_INTERCEPT_RW      (MSR_INTERCEPT_WRITE | MSR_INTERCEPT_READ)
>> -void svm_intercept_msr(struct vcpu *v, uint32_t msr, int enable);
>> -#define svm_disable_intercept_for_msr(v, msr) svm_intercept_msr((v), (msr), MSR_INTERCEPT_NONE)
>> -#define svm_enable_intercept_for_msr(v, msr) svm_intercept_msr((v), (msr), MSR_INTERCEPT_RW)
>> +void svm_set_msr_intercept(struct vcpu *v, uint32_t msr, int flags);
>> +void svm_clear_msr_intercept(struct vcpu *v, uint32_t msr, int flags);
>> +#define svm_disable_intercept_for_msr(v, msr) \
>> +    svm_clear_msr_intercept((v), (msr), MSR_RW)
>> +#define svm_enable_intercept_for_msr(v, msr) \
>> +    svm_set_intercept_msr((v), (msr), MSR_RW)
> 
> Please avoid excess parentheses. Also could you clarify why you retain
> these shorthands when you don't use them in the conversion that you're
> doing (e.g. ())? Are you intending them to go
> away down the road?

Ok.
I did not understand the question. Which shorthands?

> 
> Jan

-- 
Xenia

