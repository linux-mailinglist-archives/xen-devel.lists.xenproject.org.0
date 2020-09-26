Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E1C279999
	for <lists+xen-devel@lfdr.de>; Sat, 26 Sep 2020 15:18:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMA5a-0005S0-2k; Sat, 26 Sep 2020 13:18:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I7Fr=DD=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kMA5Y-0005Rv-Pd
 for xen-devel@lists.xenproject.org; Sat, 26 Sep 2020 13:18:08 +0000
X-Inumbo-ID: 106e6b11-1642-4984-a3cf-2530babec78f
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 106e6b11-1642-4984-a3cf-2530babec78f;
 Sat, 26 Sep 2020 13:18:07 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id y17so5878476lfa.8
 for <xen-devel@lists.xenproject.org>; Sat, 26 Sep 2020 06:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=zZgn02cqU0Wzx09j8X2D/Z7rj6VHbp2eVFCAJjYKH+A=;
 b=g86Fg9l0to3iJIl0yQixIhAxAy/z+AIhnDqGWvLuXOpBlJsXA6QMi8XEcPnxuqlHZn
 Q5G3VEeG+Jg8yXR1K7zSWtE6gLdmiVzMGd0hfsaUEdcxxJOaCZHiCINoS6UEAY3LYDxI
 tOF/sRuT4OHp1JGEpeBGfVdXzlpVLK9ur1SG80cx27gAU+Zxim2OSLpxtOdj6G72fM45
 EwLxu9HwEQa1wDhgtAUvql7RCnakuOXE2JLEW+SEVVDNZeQ1l4BCUic5JAaRSlSABqE0
 FP0BIR9M1V9el+W4t4UNwSAf/syOymqPetx1UNHFUuNCmdO2+vF36ezRNtPhTiSkPzUW
 Z/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=zZgn02cqU0Wzx09j8X2D/Z7rj6VHbp2eVFCAJjYKH+A=;
 b=onMMV+fqLEuNDPGxbghtRwN6EMLOjXzDL08ZQhYFFOrfMax6mLDYGkVn9wDiGMkf7m
 J94s0+SeVsX83FlUpvi5pQOrSeTEtCMayP81aS+McAQuz9sfBqVCRlstLnUtE0PMANtH
 qx3Clxzm4KI8O30JWIiS8cDIcrXXAeOQan/ofqLYefkT81vYaE/++UAGF+4de75f1OF0
 EteanQSwz1sL9c0MceUMaOrN8klU+StAdHlPWOGzW4Kt5yBMWG8PhhMmeI4rhO1V7iz6
 nmEA2g5Niv3RqTB5hLJBe9iTgWkB2w7uT6Pq2EKUh2x2iOdIIy47vlVaB2rSNBwAf1Nw
 MWig==
X-Gm-Message-State: AOAM532XEZ26G8+r80Mfi7B5goBPUYrH8rj8jHBj/o29ZWWle5O6hHo3
 0XDSp5RYMBZMZigOfMlNtZM=
X-Google-Smtp-Source: ABdhPJxM53RtgzKRxIBShJQozLcguiYJvWWCq4KsgsxCuhkTj1EqGz2wtGg8R2bDnMRx+ELk3vxMAw==
X-Received: by 2002:ac2:5627:: with SMTP id b7mr1268554lff.27.1601126286372;
 Sat, 26 Sep 2020 06:18:06 -0700 (PDT)
Received: from [192.168.1.6] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id y21sm1640165lff.155.2020.09.26.06.18.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Sep 2020 06:18:05 -0700 (PDT)
Subject: Re: [PATCH V1 09/16] arm/ioreq: Introduce arch specific bits for
 IOREQ/DM features
To: Julien Grall <julien@xen.org>
Cc: Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-10-git-send-email-olekstysh@gmail.com>
 <be3401e8-db2b-82a5-b117-2c0fc8b85811@xen.org>
 <7fbab25d-18a9-83d6-2596-f0f9d149058c@gmail.com>
 <af29723b-8ed6-ca8f-8848-29aa65f42b74@suse.com>
 <ffe5148a-e366-d1f1-0a32-2e385ac1934e@gmail.com>
 <a039e213-d25b-1819-3a37-8ed858fa17b8@gmail.com>
 <1575fbc3-5791-67f1-d1e1-823d5e0a8abc@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <3e29285b-bc8d-2152-918b-30c0d8d40a53@gmail.com>
Date: Sat, 26 Sep 2020 16:18:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1575fbc3-5791-67f1-d1e1-823d5e0a8abc@xen.org>
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


On 26.09.20 16:12, Julien Grall wrote:
> Hi,

Hi Julien.


>
> On 24/09/2020 19:02, Oleksandr wrote:
>> On 24.09.20 19:02, Oleksandr wrote:
>>> On 24.09.20 14:08, Jan Beulich wrote:
>>>> On 23.09.2020 22:16, Oleksandr wrote:
>>>>> On 23.09.20 21:03, Julien Grall wrote:
>>>>>> On 10/09/2020 21:22, Oleksandr Tyshchenko wrote:
>>>>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>>> @@ -91,6 +108,28 @@ struct arch_domain
>>>>>>>    #endif
>>>>>>>    }  __cacheline_aligned;
>>>>>>>    +enum hvm_io_completion {
>>>>>>> +    HVMIO_no_completion,
>>>>>>> +    HVMIO_mmio_completion,
>>>>>>> +    HVMIO_pio_completion
>>>>>>> +};
>>>>>>> +
>>>>>>> +struct hvm_vcpu_io {
>>>>>>> +    /* I/O request in flight to device model. */
>>>>>>> +    enum hvm_io_completion io_completion;
>>>>>>> +    ioreq_t                io_req;
>>>>>>> +
>>>>>>> +    /*
>>>>>>> +     * HVM emulation:
>>>>>>> +     *  Linear address @mmio_gla maps to MMIO physical frame
>>>>>>> @mmio_gpfn.
>>>>>>> +     *  The latter is known to be an MMIO frame (not RAM).
>>>>>>> +     *  This translation is only valid for accesses as per
>>>>>>> @mmio_access.
>>>>>>> +     */
>>>>>>> +    struct npfec        mmio_access;
>>>>>>> +    unsigned long       mmio_gla;
>>>>>>> +    unsigned long       mmio_gpfn;
>>>>>>> +};
>>>>>>> +
>>>>>> Why do we need to re-define most of this? Can't this just be in 
>>>>>> common
>>>>>> code?
>>>>> Jan asked almost the similar question in "[PATCH V1 02/16] xen/ioreq:
>>>>> Make x86's IOREQ feature common".
>>>>> Please see my answer there:
>>>>> https://patchwork.kernel.org/patch/11769105/#23637511
>>>>>
>>>>> Theoretically we could move this to the common code, but the 
>>>>> question is
>>>>> how to be with other struct fields the x86's struct hvm_vcpu_io
>>>>> has/needs but
>>>>> Arm's seems not, would it be possible to logically split struct
>>>>> hvm_vcpu_io into common and arch parts?
>>>> Have struct vcpu_io and struct arch_vcpu_io as a sub-part of it?
>>> Although it is going to pull a lot of changes into x86/hvm/*, yes 
>>> this way
>>> we indeed could logically split struct hvm_vcpu_io into common and 
>>> arch parts in a clear way.
>>> If it is really worth it, I will start looking into it.
>> Julien, I noticed that three fields mmio* are not used within current 
>> series on Arm. Do we expect them to be used later on?
>
> IIRC, I just copied them blindly when writing the PoC.
>
> The information can already be found using the HSR (syndrome 
> register), so those fields would be redundant for us.

Got it.


>
>
>> Would be the following acceptable?
>> 1. Both fields "io_completion" and "io_req" (which seems to be the 
>> only fields used in common/ioreq.c) are moved to common struct vcpu 
>> as part of struct vcpu_io,
>>      enum hvm_io_completion is also moved (and renamed).
>> 2. We remove everything related to hvm_vcpu* from the Arm header.
>> 3. x86's struct hvm_vcpu_io stays as it is (but without two fields 
>> "io_completion" and "io_req").
>>      I think, this way we separate a common part and reduce Xen 
>> changes (which are getting bigger).
>
> The plan looks reasonable to me.

OK, will follow it. Thank you


-- 
Regards,

Oleksandr Tyshchenko


