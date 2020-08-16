Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A11BB245868
	for <lists+xen-devel@lfdr.de>; Sun, 16 Aug 2020 17:37:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k7Ki8-0005OC-1T; Sun, 16 Aug 2020 15:36:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0HP3=B2=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1k7Ki7-0005O7-4K
 for xen-devel@lists.xenproject.org; Sun, 16 Aug 2020 15:36:39 +0000
X-Inumbo-ID: 008b8c20-4ba2-4b6b-8fdc-563eb62d60f5
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 008b8c20-4ba2-4b6b-8fdc-563eb62d60f5;
 Sun, 16 Aug 2020 15:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=JsftbPtOF9ndN6T6XQpqTVaOgJ/lgn+z5wxn47t5c84=; b=cJvYxlC3wS8Qsm+AvqjNCt/8Am
 bfDKV6tyOA+9NaUIDBPjGbT4NHzTh4dwHC4/7bQdCCwcneZN5KDsLw1fxQktXq3QZW5gysuJfv/4H
 toTjEts2oiJzOTarqdSfx3KekVtvCxfNxV4MFjeuQhC1XP7+mSLOly17WmB1s+tIZWuo=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k7Khx-0007VK-UR; Sun, 16 Aug 2020 15:36:29 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1k7Khx-0000hp-LE; Sun, 16 Aug 2020 15:36:29 +0000
Subject: Re: [RFC PATCH V1 07/12] A collection of tweaks to be able to run
 emulator in driver domain
To: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>, paul@xen.org,
 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>,
 'Stefano Stabellini' <sstabellini@kernel.org>, 'Wei Liu' <wl@xen.org>,
 'Daniel De Graaf' <dgdegra@tycho.nsa.gov>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-8-git-send-email-olekstysh@gmail.com>
 <4ffa6434-3ad6-04dc-bfde-f75196930fb4@suse.com>
 <005f01d66b47$1c58ccc0$550a6640$@xen.org>
 <a9a8a3fb-10ad-96f7-651b-9bed46310ba2@gmail.com>
 <e8105d18-338f-bd90-39a2-eb37e37345a7@suse.com>
 <17fbc16e-6db8-66e3-967c-85b652df571a@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <a6fcc96e-9f28-0934-21b9-4cb655c3467a@xen.org>
Date: Sun, 16 Aug 2020 16:36:27 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <17fbc16e-6db8-66e3-967c-85b652df571a@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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



On 14/08/2020 17:30, Oleksandr wrote:
> 
> Hello all.
> 
> 
>>>>> -----Original Message-----
>>>>> From: Jan Beulich <jbeulich@suse.com>
>>>>> Sent: 05 August 2020 17:20
>>>>> To: Oleksandr Tyshchenko <olekstysh@gmail.com>; Paul Durrant 
>>>>> <paul@xen.org>
>>>>> Cc: xen-devel@lists.xenproject.org; Oleksandr Tyshchenko 
>>>>> <oleksandr_tyshchenko@epam.com>; Andrew
>>>>> Cooper <andrew.cooper3@citrix.com>; George Dunlap 
>>>>> <george.dunlap@citrix.com>; Ian Jackson
>>>>> <ian.jackson@eu.citrix.com>; Julien Grall <julien@xen.org>; Stefano 
>>>>> Stabellini
>>>>> <sstabellini@kernel.org>; Wei Liu <wl@xen.org>; Daniel De Graaf 
>>>>> <dgdegra@tycho.nsa.gov>
>>>>> Subject: Re: [RFC PATCH V1 07/12] A collection of tweaks to be able 
>>>>> to run emulator in driver domain
>>>>>
>>>>> On 03.08.2020 20:21, Oleksandr Tyshchenko wrote:
>>>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>>
>>>>>> Trying to run emulator in driver domain I ran into various issues
>>>>>> mostly policy-related. So this patch tries to resolve all them
>>>>>> plobably in a hackish way. I would like to get feedback how
>>>>>> to implement them properly as having an emulator in driver domain
>>>>>> is a completely valid use-case.
>>>>>   From going over the comments I can only derive you want to run
>>>>> an emulator in a driver domain, which doesn't really make sense
>>>>> to me. A driver domain has a different purpose after all. If
>>>>> instead you mean it to be run in just some other domain (which
>>>>> also isn't the domain controlling the target), then there may
>>>>> be more infrastructure changes needed.
>>>>>
>>>>> Paul - was/is your standalone ioreq server (demu?) able to run
>>>>> in other than the domain controlling a guest?
>>>>>
>>>> Not something I've done yet, but it was always part of the idea so 
>>>> that we could e.g. pass through a device to a dedicated domain and 
>>>> then run multiple demu instances there to virtualize it for many 
>>>> domUs. (I'm thinking here of a device that is not SR-IOV and hence 
>>>> would need some bespoke emulation code to share it out).That 
>>>> dedicated domain would be termed the 'driver domain' simply because 
>>>> it is running the device driver for the h/w that underpins the 
>>>> emulation.
>>> I may abuse "driver domain" terminology, but indeed in our use-case we
>>> pass through a set of H/W devices to a dedicated domain which is running
>>> the device drivers for that H/Ws. Our target system comprises a thin
>>> Dom0 (without H/W devices at all), DomD (which owns most of the H/W
>>> devices) and DomU which runs on virtual devices. This patch tries to
>>> make changes at Xen side to be able run standalone ioreq server
>>> (emulator) in that dedicated (driver?) domain.
>> Okay, in which case I'm fine with the term. I simply wasn't aware of the
>> targeted scenario, sorry.
> 
> 
> May I kindly ask to suggest me the pointers how to *properly* resolve 
> various policy related issues described in that patch? Without having 
> them resolved it wouldn't be able to run standalone IOREQ server in 
> driver domain.

You could already do that by writing your own XSM policy. Did you 
explore it? If so, may I ask why this wouldn't be suitable?

Also, I would like to emphasis that because of XSA-295 (Unlimited Arm 
Atomics Operations), you can only run emulators in trusted domain on Arm.

There would be more work to do if you wanted to run them in non-trusted 
environment.

Cheers,

-- 
Julien Grall

