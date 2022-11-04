Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7998619EDA
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 18:35:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437795.692284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1or0bJ-0006GU-8Q; Fri, 04 Nov 2022 17:35:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437795.692284; Fri, 04 Nov 2022 17:35:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1or0bJ-0006E9-49; Fri, 04 Nov 2022 17:35:29 +0000
Received: by outflank-mailman (input) for mailman id 437795;
 Fri, 04 Nov 2022 17:35:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hzer=3E=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1or0bG-0006E3-P5
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 17:35:26 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10f976d8-5c67-11ed-8fd1-01056ac49cbb;
 Fri, 04 Nov 2022 18:35:25 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so3624647wmb.0
 for <xen-devel@lists.xenproject.org>; Fri, 04 Nov 2022 10:35:25 -0700 (PDT)
Received: from [10.85.37.166] (54-240-197-228.amazon.com. [54.240.197.228])
 by smtp.gmail.com with ESMTPSA id
 f11-20020a05600c4e8b00b003b435c41103sm5125489wmq.0.2022.11.04.10.35.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 10:35:24 -0700 (PDT)
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
X-Inumbo-ID: 10f976d8-5c67-11ed-8fd1-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pHQIylP4BMaKx4/MaFeoDjr/JLtHrpYofumoioa74sw=;
        b=pPJDTk88r42WOVvSsOetGHQK+mqPoxtCExYlowuSg+a9gnA3gFaTzyrRL4jbJDZJAf
         np9Ma3LUKIhY4IeDne8YcTQ1S8NX/wR/pzqU5Qr6po5P2GMaggTGg7W9wWNTJbgJ6QZN
         Qqk+NKCRHoH+5sljCXuKj2f10n+3cyyrd/mL+dpKUq2ryI8RIWwZAAGuUjeJR1FedFh3
         tqeaeiGBN0NdY6mr+ALGm5//BI58Vrp+jPF1l6dzcr65tngfs5ZPLzboyv3Jcy52moSN
         8sEyIIPRDtLXRMHXdhCErSV74Uc13cINkvP2LbinVtdk4bPQ7wrjoZkkJH07ZqKYbl/t
         4mMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pHQIylP4BMaKx4/MaFeoDjr/JLtHrpYofumoioa74sw=;
        b=hBI8tm0Qr+bZHhQGn7smS0gACYgPhMVVKPKsV4mfIXP4RbjlbOpkbvNjAhb9izO0ku
         kBe5gmRdVCuX6kAhXVu9JzubQ7bY55eOJrMMd5s70QTx2VMByTldHL8ylQSzvkTz5X4w
         dTlhYfg+nlP5HzpJSVOrV5FbAIcT4dVWEE6OkFOE1hanHTaPCIuws1CNsrtB6z8BVVY2
         GlKluD6Ms8F5x8XLFDwrqeINTTyyN52hHhJZP4onmGQLl9qx0SN0Vs0WJJjNXqE36+lH
         pkdOscYZjWVGlLOeooIo63lZvfLXYaZ5b8f7MXN4G/84F48BklAXPGsqCWcueLgaGu/3
         1EuQ==
X-Gm-Message-State: ACrzQf3k5kq6ecLObstqCxFO5yNpQLQZqzYMvrFqIbe76wxn80idOS53
	uoTMT2zWOPbY0HalIqvhZ8s=
X-Google-Smtp-Source: AMsMyM7xrwRq4s8Rt/boxcuuZl8V5Ezez8Ygw2S19zXCPmVNvupIpmvESuV1uWSxvGyZi5E+kRqbZw==
X-Received: by 2002:a1c:c90c:0:b0:3b4:adc7:9766 with SMTP id f12-20020a1cc90c000000b003b4adc79766mr25037057wmb.66.1667583324988;
        Fri, 04 Nov 2022 10:35:24 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <2c2d8b2b-e607-6d9d-b991-d1c065aac95d@xen.org>
Date: Fri, 4 Nov 2022 17:35:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH for-4.17 2/2] hvm/apic: repurpose the reporting of the
 APIC assist options
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Henry.Wang@arm.com, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
References: <20221104142235.36556-1-roger.pau@citrix.com>
 <20221104142235.36556-3-roger.pau@citrix.com>
 <2a3c5141-516d-a5e4-392b-e7fe54f3781c@xen.org>
 <Y2U3Zf/nCv3PlTxa@Air-de-Roger>
 <9a505567-57be-a7b4-7cab-d1d737172db0@xen.org>
 <Y2U5bmp2rsUy2C93@Air-de-Roger>
Organization: Xen Project
In-Reply-To: <Y2U5bmp2rsUy2C93@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/11/2022 16:10, Roger Pau Monné wrote:
> On Fri, Nov 04, 2022 at 04:05:05PM +0000, Paul Durrant wrote:
>> On 04/11/2022 16:01, Roger Pau Monné wrote:
>>> On Fri, Nov 04, 2022 at 03:55:54PM +0000, Paul Durrant wrote:
>>>> On 04/11/2022 14:22, Roger Pau Monne wrote:
>>>>> The current reporting of the hardware assisted APIC options is done by
>>>>> checking "virtualize APIC accesses" which is not very helpful, as that
>>>>> feature doesn't avoid a vmexit, instead it does provide some help in
>>>>> order to detect APIC MMIO accesses in vmexit processing.
>>>>>
>>>>> Repurpose the current reporting of xAPIC assistance to instead report
>>>>> such feature as present when there's support for "TPR shadow" and
>>>>> "APIC register virtualization" because in that case some xAPIC MMIO
>>>>> register accesses are handled directly by the hardware, without
>>>>> requiring a vmexit.
>>>>>
>>>>> For symetry also change assisted x2APIC reporting to require
>>>>> "virtualize x2APIC mode" and "APIC register virtualization", dropping
>>>>> the option to also be reported when "virtual interrupt delivery" is
>>>>> available.  Presence of the "virtual interrupt delivery" feature will
>>>>> be reported using a different option.
>>>>>
>>>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>>>> ---
>>>>> I find the logic in vmx_vlapic_msr_changed() hard to follow, but I
>>>>> don't want to rewrite the function logic at this point.
>>>>> ---
>>>>>     xen/arch/x86/hvm/viridian/viridian.c |  2 +-
>>>>>     xen/arch/x86/hvm/vmx/vmcs.c          |  8 ++++----
>>>>>     xen/arch/x86/hvm/vmx/vmx.c           | 25 ++++++++++++++++++-------
>>>>>     xen/arch/x86/traps.c                 |  4 +---
>>>>>     4 files changed, 24 insertions(+), 15 deletions(-)
>>>>>
>>>>> diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
>>>>> index c4fa0a8b32..bafd8e90de 100644
>>>>> --- a/xen/arch/x86/hvm/viridian/viridian.c
>>>>> +++ b/xen/arch/x86/hvm/viridian/viridian.c
>>>>> @@ -201,7 +201,7 @@ void cpuid_viridian_leaves(const struct vcpu *v, uint32_t leaf,
>>>>>              * Suggest x2APIC mode by default, unless xAPIC registers are hardware
>>>>>              * virtualized and x2APIC ones aren't.
>>>>>              */
>>>>> -        if ( !cpu_has_vmx_apic_reg_virt || cpu_has_vmx_virtualize_x2apic_mode )
>>>>> +        if ( !has_assisted_xapic(d) || has_assisted_x2apic(d) )
>>>>
>>>> So, not sure why this is separated from patch 1 but stated this way it seems
>>>> counterintuitive. We only want to use the viridian MSRs if they are going to
>>>> be more efficient.. which I think is only in the case where we have neither
>>>> an x2apic not an assisted xapic (hence we would trap for MMIO).
>>>
>>> I've read the MS HTLFS and I guess I got confused, the section about
>>> this CPUID bit states:
>>>
>>> "Bit 3: Recommend using MSRs for accessing APIC registers EOI, ICR and
>>> TPR rather than their memory-mapped"
>>>
>>> So I've (wrongly) understood that MSRs for accessing APIC registers
>>> was meant to be a recommendation to use x2APIC mode in order to access
>>> those registers.  Didn't realize Viridian had a way to expose certain
>>> APIC registers using MSRs when the APIC is in xAPIC mode.
>>>
>>
>> Yeah, I think they predate the existence of x2apic.
>>
>>> I withdraw patch 1 and adjust patch 2 accordingly then.
>>>
>> Cool. Thanks,
> 
> How does Windows know whether to use xAPIC or x2APIC?
> 

cpuid? TBH I'm not sure why this recommendation would ever trump x2apic 
anyway.

> I would assume CPUID4A_MSR_BASED_APIC only makes sense when in xAPIC
> mode, as otherwise the registers are already accesses using MSRs.
> 
> Thanks, Roger.


