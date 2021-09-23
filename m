Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82460416834
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 00:52:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194627.346745 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTXa3-0006xp-MV; Thu, 23 Sep 2021 22:52:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194627.346745; Thu, 23 Sep 2021 22:52:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTXa3-0006vo-Ii; Thu, 23 Sep 2021 22:52:39 +0000
Received: by outflank-mailman (input) for mailman id 194627;
 Thu, 23 Sep 2021 22:52:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ES3T=ON=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1mTXa1-0006vb-Ix
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 22:52:37 +0000
Received: from mail-lf1-x133.google.com (unknown [2a00:1450:4864:20::133])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cebb96f1-935e-4a1c-a4f8-eb3baed19555;
 Thu, 23 Sep 2021 22:52:36 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id x27so32458280lfu.5
 for <xen-devel@lists.xenproject.org>; Thu, 23 Sep 2021 15:52:36 -0700 (PDT)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id l13sm363733lfk.211.2021.09.23.15.52.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 15:52:35 -0700 (PDT)
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
X-Inumbo-ID: cebb96f1-935e-4a1c-a4f8-eb3baed19555
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=Rj7wStZWi35kb7uWr6bnSQfsxjooFhry4SVMfYi22tM=;
        b=ICz05OGAfH39Vk/ef/1HUaz+Dz3i9X3A556sgUc9XQqG+k2MZBZcEzDPXM7OB/9SKL
         5wXPIWHbwe38Z2ddK9VvrExNZrWNVsllyxBqMcS1sNFjp4vWyDxvhY0Jfdwb6bbk3vO4
         lUzNXX+KCYhIce+ISnMMie56sHYiRAg+pF5PbroAuMN8GKTvDHGNF0xTTveovzUxhZQR
         w7TwvpRF1WvA4gZdU8UU/8AA2CMBGRKfSq1C+Akw0rIy7wjOpZTig24Uki0v17+6TEUa
         a8p7Frg+bjRom1vcPq4RIfW7xgaLPWMauHRvzsUrjCiFXp+vmipJvB24kYYpI1wM6+KC
         3sHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=Rj7wStZWi35kb7uWr6bnSQfsxjooFhry4SVMfYi22tM=;
        b=MxPVsjHXNQlRN4DFG/6DrF48AGzJkKyUUtPDSBTh18cSao254fgF7ENEOVdbneh67p
         MfWk+sDdklQrkYi3Mh4x3S6Dh1Go4p1hqWNjHcZ/U4LIGPaJStB6rFj6hHzyVzlBv4jk
         Gh71UeEonMRTif3uH2MEOkIgNhPsdpC4lNwRa3TQPxmisK1Ewrj7XbBBH6XeZrJDXyIA
         LT8YeBWp3qXqhNsZd+Gb6kFk/LJeewtbUsDUtHWwa6HW2+jzWjVq7gFlOFC1UWsqQuEk
         shMMpWKJoAJAFYEX5njMfjh+/KcqW9QaU+pZHWbYGQWP3HFhicoNEH8uGOX26sSrL6Df
         d8sw==
X-Gm-Message-State: AOAM5331I2gcc9r2mApoqRyl30jbqh0rBlqu13fXjvVWUDZ1ym1KhUGv
	YGA+wrivJHtfhBqSa8UsLKw=
X-Google-Smtp-Source: ABdhPJwQ68hL26Z+5d7YHw5p610VS+FJNXOU3mRNAsV2mw2LQLtS9fcPVzfnxhvjDtyuALtcXkiPeg==
X-Received: by 2002:a05:651c:110f:: with SMTP id d15mr7659767ljo.99.1632437555568;
        Thu, 23 Sep 2021 15:52:35 -0700 (PDT)
Subject: Re: [RFC PATCH 1/3] xen: Introduce "gpaddr_bits" field to
 XEN_SYSCTL_physinfo
From: Oleksandr <olekstysh@gmail.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Juergen Gross <jgross@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Henry Wang <Henry.Wang@arm.com>
References: <1631034578-12598-1-git-send-email-olekstysh@gmail.com>
 <1631034578-12598-2-git-send-email-olekstysh@gmail.com>
 <973f5344-aa10-3ad6-ff02-ad5f358ad279@citrix.com>
 <0994251e-5e02-009a-851d-4e4ee760fc66@gmail.com>
Message-ID: <6a2a183d-c9d8-df2a-41aa-b25283fab197@gmail.com>
Date: Fri, 24 Sep 2021 01:52:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <0994251e-5e02-009a-851d-4e4ee760fc66@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


Hi Andrew.


On 08.09.21 00:28, Oleksandr wrote:
>
> On 07.09.21 20:35, Andrew Cooper wrote:
>
> Hi Andrew
>
>> On 07/09/2021 18:09, Oleksandr Tyshchenko wrote:
>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>
>>> We need to pass info about maximum supported guest address
>>> space size to the toolstack on Arm in order to properly
>>> calculate the base and size of the extended region (safe range)
>>> for the guest. The extended region is unused address space which
>>> could be safely used by domain for foreign/grant mappings on Arm.
>>> The extended region itself will be handled by the subsequents
>>> patch.
>>>
>>> Use p2m_ipa_bits variable on Arm, the x86 equivalent is
>>> hap_paddr_bits.
>>>
>>> As we change the size of structure bump the interface version.
>>>
>>> Suggested-by: Julien Grall <jgrall@amazon.com>
>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>> So while I think this is a suitable way forward, you're painting
>> yourself into a corner WRT migration.
>>
>> On x86, the correct value is d->arch.cpuid->extd.maxphysaddr and this
>> value is under toolstack control, not Xen control.  In particular, it
>> needs to be min(hostA, hostB) to make migration safe, and yes - this is
>> currently a hole in x86's migration logic that will cause large VMs to
>> explode.
>>
>> The same will be true on ARM as/when you gain migration support.
>
> Oh, I admit, I didn't keep in mind migration support while creating 
> this patch.
>
>
>>
>> I think this would be better as a domctl.  On ARM, it can reference
>> p2m_ipa_bits for now along with a /* TODO - make per-domain for
>> migration support */, while on x86 it can take the appropriate value
>> (which will soon actually be safe in migration scenarios).
>
> OK, could you please clarify, did you mean to introduce new domctl 
> (something like get_maxphysaddr) or reuse some existing?


May I please ask for clarification here ^ and ...


>
>
> And ...
>
>>
>> However, that does change the ordering requirements in the toolstack -
>> this hypercall would need to be made after the domain is created, and
>> has been levelled, and before its main memory layout is decided.
>
> ... I am not sure I totally understand the ordering requirements in 
> the toolstack.
>
> On Arm this information (gpaddr_bits) should be obtained by the time 
> we call libxl__arch_domain_finalise_hw_description()
> where we actually calculate extended region and insert it in domain's 
> device-tree. At that time, the domain memory is already populated, so 
> it's layout is known.
> Please see the last patch of this series, which demonstrates the usage:
>
> https://lore.kernel.org/xen-devel/1631034578-12598-4-git-send-email-olekstysh@gmail.com/ 
>
>
>
>> Alternatively, the abstraction could be hidden in libxl itself in arch
>> specific code, with x86 referring to the local cpu policy (as libxl has
>> the copy it is/has worked on), and ARM making a hypercall.  This does
>> make the ordering more obvious.
>
> May I please ask what would be the preferred option to move forward? I 
> am fine with both proposed options, with a little preference for the 
> former (common domctl, abstraction is hidden in Xen itself in arch 
> specific code). It is highly appreciated if we could choose the option 
> which would satisfy all parties, this would save me some time.


... here ^ ?


I have just pushed third version [1] of this series without these being 
addressed. I decided to push V3 to let the reviewers to focus on the 
main aspects, but the way how the information in question is passed to 
the toolstack also needs to be clarified and addressed.


[1] 
https://lore.kernel.org/xen-devel/1632437334-12015-1-git-send-email-olekstysh@gmail.com/


[snip]


-- 
Regards,

Oleksandr Tyshchenko


