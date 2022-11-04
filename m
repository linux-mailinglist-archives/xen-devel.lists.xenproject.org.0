Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC99619C84
	for <lists+xen-devel@lfdr.de>; Fri,  4 Nov 2022 17:05:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.437747.692207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqzBu-0004dA-Rn; Fri, 04 Nov 2022 16:05:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 437747.692207; Fri, 04 Nov 2022 16:05:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oqzBu-0004aa-Op; Fri, 04 Nov 2022 16:05:10 +0000
Received: by outflank-mailman (input) for mailman id 437747;
 Fri, 04 Nov 2022 16:05:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hzer=3E=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1oqzBt-0004aS-He
 for xen-devel@lists.xenproject.org; Fri, 04 Nov 2022 16:05:09 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 741981ff-5c5a-11ed-91b5-6bf2151ebd3b;
 Fri, 04 Nov 2022 17:05:08 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id g12so7654483wrs.10
 for <xen-devel@lists.xenproject.org>; Fri, 04 Nov 2022 09:05:08 -0700 (PDT)
Received: from [10.85.37.166] (54-240-197-228.amazon.com. [54.240.197.228])
 by smtp.gmail.com with ESMTPSA id
 n14-20020a5d4c4e000000b0023691d62cffsm3718446wrt.70.2022.11.04.09.05.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 09:05:07 -0700 (PDT)
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
X-Inumbo-ID: 741981ff-5c5a-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=7YytsVV4aUSxXUuq0yIyu0RGlEmPxzcC2ujSuhbEbUU=;
        b=i2htBtWoP9sGrr4JbSyXOEBtJKYSwgFByS1l5w3snQ5V4E5Fy93JuMuL1AJB8tiU42
         jk6+1SQkkB/52dhGwXZVVsdHTuyLBNffN7H8LK7YjqxZTiGkdxzmgBA9ymkoYBNV2MfJ
         83WXVMO4QRTjw/2RQv8fu6KSlPGygl48o8oZyNd2nJ6V0VIuQEhqtXL8B3ODVLnRsX6s
         1hKrZXS4gbe9WNKn5/xpfSrz7PjkNW4lJ7g/4PzbnVf7j2cm7vtHUYfhL5ZUhPKG05HF
         mHq839W6P7yBJKEc2cb7sDYNKpKCZSz/9eZKrPGS3lm6rnVmDwKD5qI2vvDYCkLtsBqa
         lh6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7YytsVV4aUSxXUuq0yIyu0RGlEmPxzcC2ujSuhbEbUU=;
        b=vg4q7i2S9oi9st0LEw+B971LBqi3g+KTfy3Z4gv5kaLNn6KwLR7lo9sjiz00g+XsdI
         K1/wqbVjeVc1fJth1EO5ORkwKZ/UmfwERMHUsMwWVznfLstLEsGL9fnOcm3cUz1eSI8N
         F+zXfifMKroO33EmgnIxFrBTbydvZugb2TdViiBnO4Cwxmd6Q2SPE2vpa5Yrdl4JFGQp
         hCCCikm65RfcTL1b+4AfgTjSSwVOuT8EDjJYoKpx3aSfLvH3zXe+5jUPQDTuwJ+R/FTC
         4YkWg+bNYscUZanyazBdG+Iju2/a0fejprEk6JqPlMYJbRlCXeXk4zk4sT5Y4w3/jjGt
         XSCg==
X-Gm-Message-State: ACrzQf1SgSvOi6Pir8lTTbFhy7UoC7gPROMWt1ie4rpvf7lroJRJpQuc
	/bb6l6FZf8Uazf78ZpWlRzM=
X-Google-Smtp-Source: AMsMyM4yzn3zm7FTAxEJ/R39XJuDKdRjS7tFKu+7Ho0GclzYJaMZMqUDApuK8Pum7do0zqMl0eUC1g==
X-Received: by 2002:adf:e90d:0:b0:236:7129:d7e6 with SMTP id f13-20020adfe90d000000b002367129d7e6mr23561149wrm.398.1667577907943;
        Fri, 04 Nov 2022 09:05:07 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <9a505567-57be-a7b4-7cab-d1d737172db0@xen.org>
Date: Fri, 4 Nov 2022 16:05:05 +0000
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
Organization: Xen Project
In-Reply-To: <Y2U3Zf/nCv3PlTxa@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/11/2022 16:01, Roger Pau Monné wrote:
> On Fri, Nov 04, 2022 at 03:55:54PM +0000, Paul Durrant wrote:
>> On 04/11/2022 14:22, Roger Pau Monne wrote:
>>> The current reporting of the hardware assisted APIC options is done by
>>> checking "virtualize APIC accesses" which is not very helpful, as that
>>> feature doesn't avoid a vmexit, instead it does provide some help in
>>> order to detect APIC MMIO accesses in vmexit processing.
>>>
>>> Repurpose the current reporting of xAPIC assistance to instead report
>>> such feature as present when there's support for "TPR shadow" and
>>> "APIC register virtualization" because in that case some xAPIC MMIO
>>> register accesses are handled directly by the hardware, without
>>> requiring a vmexit.
>>>
>>> For symetry also change assisted x2APIC reporting to require
>>> "virtualize x2APIC mode" and "APIC register virtualization", dropping
>>> the option to also be reported when "virtual interrupt delivery" is
>>> available.  Presence of the "virtual interrupt delivery" feature will
>>> be reported using a different option.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>> I find the logic in vmx_vlapic_msr_changed() hard to follow, but I
>>> don't want to rewrite the function logic at this point.
>>> ---
>>>    xen/arch/x86/hvm/viridian/viridian.c |  2 +-
>>>    xen/arch/x86/hvm/vmx/vmcs.c          |  8 ++++----
>>>    xen/arch/x86/hvm/vmx/vmx.c           | 25 ++++++++++++++++++-------
>>>    xen/arch/x86/traps.c                 |  4 +---
>>>    4 files changed, 24 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/xen/arch/x86/hvm/viridian/viridian.c b/xen/arch/x86/hvm/viridian/viridian.c
>>> index c4fa0a8b32..bafd8e90de 100644
>>> --- a/xen/arch/x86/hvm/viridian/viridian.c
>>> +++ b/xen/arch/x86/hvm/viridian/viridian.c
>>> @@ -201,7 +201,7 @@ void cpuid_viridian_leaves(const struct vcpu *v, uint32_t leaf,
>>>             * Suggest x2APIC mode by default, unless xAPIC registers are hardware
>>>             * virtualized and x2APIC ones aren't.
>>>             */
>>> -        if ( !cpu_has_vmx_apic_reg_virt || cpu_has_vmx_virtualize_x2apic_mode )
>>> +        if ( !has_assisted_xapic(d) || has_assisted_x2apic(d) )
>>
>> So, not sure why this is separated from patch 1 but stated this way it seems
>> counterintuitive. We only want to use the viridian MSRs if they are going to
>> be more efficient.. which I think is only in the case where we have neither
>> an x2apic not an assisted xapic (hence we would trap for MMIO).
> 
> I've read the MS HTLFS and I guess I got confused, the section about
> this CPUID bit states:
> 
> "Bit 3: Recommend using MSRs for accessing APIC registers EOI, ICR and
> TPR rather than their memory-mapped"
> 
> So I've (wrongly) understood that MSRs for accessing APIC registers
> was meant to be a recommendation to use x2APIC mode in order to access
> those registers.  Didn't realize Viridian had a way to expose certain
> APIC registers using MSRs when the APIC is in xAPIC mode.
> 

Yeah, I think they predate the existence of x2apic.

> I withdraw patch 1 and adjust patch 2 accordingly then.
> 
Cool. Thanks,

   Paul


