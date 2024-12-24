Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6359C9FBEDF
	for <lists+xen-devel@lfdr.de>; Tue, 24 Dec 2024 14:55:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863057.1274543 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQ5MZ-0004tx-1x; Tue, 24 Dec 2024 13:54:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863057.1274543; Tue, 24 Dec 2024 13:54:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQ5MY-0004s2-Vi; Tue, 24 Dec 2024 13:54:18 +0000
Received: by outflank-mailman (input) for mailman id 863057;
 Tue, 24 Dec 2024 13:54:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tQ5MX-0004rw-FJ
 for xen-devel@lists.xenproject.org; Tue, 24 Dec 2024 13:54:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tQ5MW-002Idi-2F;
 Tue, 24 Dec 2024 13:54:16 +0000
Received: from [15.248.2.30] (helo=[10.24.66.98])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tQ5MW-000vFd-21;
 Tue, 24 Dec 2024 13:54:16 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=nG9Jt/w7ebfIKWHcuFPsgeZVbjLuMvkAfS4xzTDtxGc=; b=fTXN0484EVnhWHtYvHxIslpfsc
	1IzsHrj1uZ0yZPLMWXJy/xdF0Zt49CC5cze8bNZKi30sSORv66EoFSw6MmQoVY2sVBkzNVRIiRUIy
	+hhERT3/tlyVZwQZE8PvCY5gSJa/sIPgCV380k9C+8mV0IoTDV+idK+BCcZTTyIxkaWI=;
Message-ID: <12f210d1-e117-4b72-a168-1acf47c99a6d@xen.org>
Date: Tue, 24 Dec 2024 13:54:14 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/kconfig: allow LATE_HWDOM config for ARM
Content-Language: en-GB
To: Sergiy Kibrik <sergiy_kibrik@epam.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20241217114719.2870676-1-Sergiy_Kibrik@epam.com>
 <4e437c60-4fee-40ed-9d2a-789bac0b36d9@xen.org>
 <5246aa98-d23c-41d5-ba14-c12b0a2ee9af@epam.com>
 <baac9d61-f4bf-4de9-a58c-b354111e3c0c@xen.org>
 <16694707-ce8b-4c4e-a6ec-2190b8124735@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <16694707-ce8b-4c4e-a6ec-2190b8124735@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Replying your last two replies in the same thread.


On 24/12/2024 03:41, Sergiy Kibrik wrote:
> 18.12.24 12:05, Julien Grall:

 > yes, I had to assign devices to hardware domain manually.

I think it would be easier for the user to say "This is my hardware 
domain" and let Xen assign all the devices, generate the device-tree & co.

>>>> On 17/12/2024 11:47, Sergiy Kibrik wrote:
>>>>> Allow to build ARM configuration with support for initializing 
>>>>> hardware domain.
>>>>> On ARM it is only possible to start hardware domain in multiboot 
>>>>> mode, so
>>>>> dom0less support is required. This is reflected by dependency on 
>>>>> DOM0LESS_BOOT
>>>>> instead of directly depending on ARM config option.
>>>>
>>>> I am a bit confused with the explanation. We already have an 
>>>> hardware domain on Arm. It is dom0. So what are you trying to 
>>>> achieve? Is this remove some permissions from the hardware domain?
>>>
>>> I agree, it should have better description.
>>> This is to split dom0 permissions into control-only and hardware-only 
>>> domains, much like it can be done in x86.
>>
>> I don't believe you need the late_hwdom feature to do that on Arm. In 
>> the case of dom0less, you are creating the domains at boot, so at the 
>> point you can decide who does what.
> 
> I'm not sure which mechanism to use for this. Can it be done by XSM 
> policy management?

For hyperlaunch, Christopher and Daniel proposed to specify the domain 
permissions (e.g. control domain, hardware domain) in the device-tree. I 
think we could re-use a similar approach. See 
docs/designs/launch/hyperlaunch-devicetree.rst for more details.

> 
>>>
>>>>
>>>> If so, why can't the hardware domain stay as dom0 and you remove the 
>>>> feature you don't want (e.g. control domain)?
>>>
>>> control domain is still needed, but as a separate instance & without 
>>> hardware access.
>>
>> Sure. But the control domain doesn't need to be dom0, it could be 
>> dom1, right?
>>
> 
> I suppose it can. But again -- how do I make dom1 (or any other) a 
> control domain instead of dom0?

See above.

> 
>>>
>>>>
>>>> Are you sure this patch is sufficient to use the late hwdom feature? 
>>>> Looking at the code, to enable the late hwdom, the user needs to 
>>>> provide a domid on the command line. But AFAICT, there is no way to 
>>>> provide a domain ID in the DOM0LESS case...
>>>>
>>>
>>> I append "hardware_dom=1" to xen,xen-bootargs in host's device tree 
>>> and it works.
>>
>> AFAIU, the domain needs to be explicitely created. How do you do that? 
>> Is it just describing the domain in the DT? If so, how does it work if 
>> there are multiple domain described in the DT?
>>
> 
> Indeed, in my case it works only because there's single domain 
> description in DT.
> If there're many domains in DT, we can't be sure which domain ID each of 
> them would receive at boot, right?

Correct. We don't (and should not) make any guarantee on the ordering. 
If the domid matters, then we would need to introduce a new property 
specifying the domain.

Cheers,

-- 
Julien Grall


