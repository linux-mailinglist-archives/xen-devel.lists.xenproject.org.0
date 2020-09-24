Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEB7277592
	for <lists+xen-devel@lfdr.de>; Thu, 24 Sep 2020 17:39:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kLTKD-0002ua-Ul; Thu, 24 Sep 2020 15:38:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EOGg=DB=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kLTKC-0002uV-En
 for xen-devel@lists.xenproject.org; Thu, 24 Sep 2020 15:38:24 +0000
X-Inumbo-ID: 3ae406e6-6138-4137-afd6-3e20c9b984a3
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3ae406e6-6138-4137-afd6-3e20c9b984a3;
 Thu, 24 Sep 2020 15:38:23 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id w11so4465176lfn.2
 for <xen-devel@lists.xenproject.org>; Thu, 24 Sep 2020 08:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Opb4ALQw4TwzmFB65pyYIDEsbwkZH42+yWQccHeY31E=;
 b=iqzbMurKzPmVSFG8VqD5nmBJStPt6grXUykYpMGvXYjpTg5ov/lxflBe9znChuXIhl
 2WEPRoDyzrFb4Pl7s5sNx6K9jF5T6rC1VkWbpzbbfQAJr8Brhz2i/bGlLGL8OgL4Begj
 drpYcatws73hDCAQzWcEziISpUbZ8zLELGDGpbv2TWkrcoT0IuM6h2W1z139sJBCDJ1K
 ub2Jg6ZQEOZZ8mNOlkmgHPvEmR/D8F6oi0tzZ9KKmmp+EVXv1/ghKYTO2os3Y/tpj60d
 M0hdh22PkmCJIWfuRg+9uHqX2n++7V8+Npe4ZPp+aZHKFlAb9w8veJFk8fh7oMhqQCaC
 JLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Opb4ALQw4TwzmFB65pyYIDEsbwkZH42+yWQccHeY31E=;
 b=Gbfg92TIbIAryW5FRz9PHB0TExGewLrGoQ1VsOHXBsoLWXH0QFV1Kj73+C5XpBbH6d
 Qir35KWsnZ0Tscla+Q9iI/REUP/OCpYWuR8XZWbuWfo0E3NkQ8X3NtnL/p0K6P6yCAFg
 QDx+fv2fdrgWzsMF6r2pYcw4pah8ZXJq0NkU4M0Yl+DzT5TFiyx4dPw8VzThzC/ywgCV
 YDYaw78aG8VZIU+PzTyWZnCHP7kTHNYbZz+kSeWFnYFJvKfzE6+qrGH1SAdOPgKwHtqm
 oY2N9X/HrdDCHxTBPMk5Sjom4vtK57oqV0Xiaqc1KDp1sBijTaQiis3s5vGTF0nJH5H5
 V5BA==
X-Gm-Message-State: AOAM531WCe4JyZ15XAoMuqXpTa5TG+XI5NCkFpvCwHCoxzaNdYTCJ1s5
 2uFZQdUO2oP6VSUSki/DAxc=
X-Google-Smtp-Source: ABdhPJwfLwsuEnOZW5506N0T9vATNEzGxEY4bKP9+KPz9/5qk1qkSmS1d7quRqbsYlGRVsUCG9yEiQ==
X-Received: by 2002:a19:4856:: with SMTP id v83mr21900lfa.200.1600961902093;
 Thu, 24 Sep 2020 08:38:22 -0700 (PDT)
Received: from [192.168.1.6] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id 203sm2343010lfc.112.2020.09.24.08.38.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Sep 2020 08:38:21 -0700 (PDT)
Subject: Re: [PATCH V1 02/16] xen/ioreq: Make x86's IOREQ feature common
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Paul Durrant <paul@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-3-git-send-email-olekstysh@gmail.com>
 <7de88222-1a45-7bff-0b45-95f76b4ec019@suse.com>
 <51856cdc-54b4-3d39-bd7b-1b6ac3fc1736@gmail.com>
 <bf128337-699f-5942-b387-aa896000700c@suse.com>
 <97b48017-55e1-8464-031a-b54dd8e4e474@gmail.com>
 <d7d6d211-1a24-b452-d1ea-efb0105995b7@suse.com>
 <7bffd6ec-8c41-202a-655d-df2240c1491a@gmail.com>
 <5e59dd52-71ea-6c63-8f63-13928813bb2f@suse.com>
 <9ebdca87-4105-c27b-635d-7a1b6d4cde82@gmail.com>
 <decab3dd-c754-1c50-6630-95e60ba5eef4@suse.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <2109292f-bdf8-d17d-2563-aa99e39e7c2f@gmail.com>
Date: Thu, 24 Sep 2020 18:38:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <decab3dd-c754-1c50-6630-95e60ba5eef4@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 24.09.20 13:58, Jan Beulich wrote:

Hi Jan

> On 23.09.2020 14:28, Oleksandr wrote:
>> On 22.09.20 18:52, Jan Beulich wrote:
>>> On 22.09.2020 17:05, Oleksandr wrote:
>>>> 3. *arch.hvm.hvm_io*: We could also use the following:
>>>>
>>>>       #define ioreq_get_io_completion(v) ((v)->arch.hvm.hvm_io.io_completion)
>>>>       #define ioreq_get_io_req(v) ((v)->arch.hvm.hvm_io.io_req)
>>>>
>>>>       This way struct hvm_vcpu_io won't be used in common code as well.
>>> But if Arm needs similar field, why keep them in arch.hvm.hvm_io?
>> Yes, Arm needs the "some" fields, but not "all of them" as x86 has.
>> For example Arm needs only the following (at least in the context of
>> this series):
>>
>> +struct hvm_vcpu_io {
>> +    /* I/O request in flight to device model. */
>> +    enum hvm_io_completion io_completion;
>> +    ioreq_t                io_req;
>> +
>> +    /*
>> +     * HVM emulation:
>> +     *  Linear address @mmio_gla maps to MMIO physical frame @mmio_gpfn.
>> +     *  The latter is known to be an MMIO frame (not RAM).
>> +     *  This translation is only valid for accesses as per @mmio_access.
>> +     */
>> +    struct npfec        mmio_access;
>> +    unsigned long       mmio_gla;
>> +    unsigned long       mmio_gpfn;
>> +};
>>
>> But for x86 the number of fields is quite bigger. If they were in same
>> way applicable for both archs (as what we have with ioreq_server struct)
>> I would move it to the common domain. I didn't think of a better idea
>> than just abstracting accesses to these (used in common ioreq.c) two
>> fields by macro.
> I'm surprised Arm would need all the three last fields that you
> mention. Both here and ...
>
>>>> @@ -247,7 +247,7 @@ static gfn_t hvm_alloc_legacy_ioreq_gfn(struct
>>>> hvm_ioreq_server *s)
>>>>         for ( i = HVM_PARAM_IOREQ_PFN; i <= HVM_PARAM_BUFIOREQ_PFN; i++ )
>>>>         {
>>>>             if ( !test_and_clear_bit(i, &d->ioreq_gfn.legacy_mask) )
>>>> -            return _gfn(d->arch.hvm.params[i]);
>>>> +            return _gfn(ioreq_get_params(d, i));
>>>>         }
>>>>
>>>>         return INVALID_GFN;
>>>> @@ -279,7 +279,7 @@ static bool hvm_free_legacy_ioreq_gfn(struct
>>>> hvm_ioreq_server *s,
>>>>
>>>>         for ( i = HVM_PARAM_IOREQ_PFN; i <= HVM_PARAM_BUFIOREQ_PFN; i++ )
>>>>         {
>>>> -        if ( gfn_eq(gfn, _gfn(d->arch.hvm.params[i])) )
>>>> +        if ( gfn_eq(gfn, _gfn(ioreq_get_params(d, i))) )
>>>>                  break;
>>>>         }
>>>>         if ( i > HVM_PARAM_BUFIOREQ_PFN )
>>> And these two are needed by Arm? Shouldn't Arm exclusively use
>>> the new model, via acquire_resource?
>> I dropped HVMOP plumbing on Arm as it was requested. Only acquire
>> interface should be used.
>> This code is not supposed to be called on Arm, but it is a part of
>> common code and we need to find a way how to abstract away *arch.hvm.params*
> ... here I wonder whether you aren't moving more pieces to common
> code than are actually arch-independent. I think a prereq step
> missing so far is to clearly identify which pieces of the code
> are arch-independent, and work towards abstracting away all of the
> arch-dependent ones.
Unfortunately, not all things are clear and obvious from the very beginning.
I have to admit, I didn't even imagine earlier that *arch.hvm.* usage in 
the common code is a layering violation issue.
Hopefully, now it is clear as well as the steps to avoid it in future.

...


I saw your advise (but haven't answered yet there) regarding splitting 
struct hvm_vcpu_io in
[PATCH V1 09/16] arm/ioreq: Introduce arch specific bits for IOREQ/DM 
features. I think, it makes sense.
The only remaining bits I would like to clarify here is 
*arch.hvm.params*. Should we really want to move HVM params field to the 
common code
rather than abstracting away by proposed macro? Although stores a few 
IOREQ params, it is not a (completely) IOREQ stuff and is specific to 
the architecture.

-- 
Regards,

Oleksandr Tyshchenko


