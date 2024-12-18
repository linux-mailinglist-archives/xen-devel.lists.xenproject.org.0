Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8473E9F6257
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2024 11:05:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860080.1272142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNqvp-0004Cu-Fc; Wed, 18 Dec 2024 10:05:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860080.1272142; Wed, 18 Dec 2024 10:05:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNqvp-0004BR-Ck; Wed, 18 Dec 2024 10:05:29 +0000
Received: by outflank-mailman (input) for mailman id 860080;
 Wed, 18 Dec 2024 10:05:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tNqvo-0004BK-3e
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2024 10:05:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tNqvn-009gvn-1O;
 Wed, 18 Dec 2024 10:05:27 +0000
Received: from [89.27.170.32] (helo=[172.16.75.124])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tNqvn-00Ggri-1S;
 Wed, 18 Dec 2024 10:05:27 +0000
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
	bh=dfP/b2R6O8bEuSAY7cnzLLcSfbF+1Zg+GmUC37MDKJs=; b=7FjU6kziKXFh2e52joGxlYoI2m
	Cfo/1g9f7gtiVE8lYO2Ld5vgwMHuVesRhwtwb00SSBpyxfMxENYQFSfA50QB6+BgdYpBRnhfKF7u4
	2dAgBPgVOSr7FiKuYEUTDgEzIK/MTVRqpXTF9P28V7KbMC3UJF4VFXICrE70lbtaiXi8=;
Message-ID: <baac9d61-f4bf-4de9-a58c-b354111e3c0c@xen.org>
Date: Wed, 18 Dec 2024 11:05:25 +0100
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <5246aa98-d23c-41d5-ba14-c12b0a2ee9af@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 18/12/2024 09:52, Sergiy Kibrik wrote:
> hi Julien,
> 
> 17.12.24 14:42, Julien Grall:
>> Hi,
>>
>> Can you clarify why this is an RFC?
>>
> 
> The code for LATE_HWDOM support on ARM seems to be already in place and 
> working, yet I'm not sure that such configuration is ready to be exposed 
> for users (well, probably not ready yet, considering Daniel's comments 
> regarding XSM later in this thread).

Thanks. In the future, for RFCs, I would suggest to add a section after 
your commit message (generally after ---) to describe a bit more what 
you input you expect from the reviewers.

> 
> 
>> On 17/12/2024 11:47, Sergiy Kibrik wrote:
>>> Allow to build ARM configuration with support for initializing 
>>> hardware domain.
>>> On ARM it is only possible to start hardware domain in multiboot 
>>> mode, so
>>> dom0less support is required. This is reflected by dependency on 
>>> DOM0LESS_BOOT
>>> instead of directly depending on ARM config option.
>>
>> I am a bit confused with the explanation. We already have an hardware 
>> domain on Arm. It is dom0. So what are you trying to achieve? Is this 
>> remove some permissions from the hardware domain?
> 
> I agree, it should have better description.
> This is to split dom0 permissions into control-only and hardware-only 
> domains, much like it can be done in x86.

I don't believe you need the late_hwdom feature to do that on Arm. In 
the case of dom0less, you are creating the domains at boot, so at the 
point you can decide who does what.

You don't need to transfer the permissions (which seems odd in the 
context of dom0less) to a new domain after dom0 is created.

> 
>>
>> If so, why can't the hardware domain stay as dom0 and you remove the 
>> feature you don't want (e.g. control domain)?
> 
> control domain is still needed, but as a separate instance & without 
> hardware access.

Sure. But the control domain doesn't need to be dom0, it could be dom1, 
right?

> 
>>
>> Are you sure this patch is sufficient to use the late hwdom feature? 
>> Looking at the code, to enable the late hwdom, the user needs to 
>> provide a domid on the command line. But AFAICT, there is no way to 
>> provide a domain ID in the DOM0LESS case...
>>
> 
> I append "hardware_dom=1" to xen,xen-bootargs in host's device tree and 
> it works.

AFAIU, the domain needs to be explicitely created. How do you do that? 
Is it just describing the domain in the DT? If so, how does it work if 
there are multiple domain described in the DT?

> 
>>>
>>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>>> ---
>>>   xen/common/Kconfig | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
>>> index 90268d9249..7368ca8208 100644
>>> --- a/xen/common/Kconfig
>>> +++ b/xen/common/Kconfig
>>> @@ -374,7 +374,7 @@ endchoice
>>>   config LATE_HWDOM
>>>       bool "Dedicated hardware domain"
>>>       default n
>>> -    depends on XSM && X86
>>> +    depends on XSM && (X86 || DOM0LESS_BOOT)
>>
>> This will enable LATE_HWDOM for other arch. Is this what we want?
> 
> my assumption was that DOM0LESS_BOOT only available on ARM, hence other 
> arch won't be affected.

Well... There are effort to support dom0less_boot on other 
architectures. But to be honest, I am not convinced that we should 
enable LATE_HWDOM here.

Cheers,

-- 
Julien Grall


