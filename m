Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93564B92660
	for <lists+xen-devel@lfdr.de>; Mon, 22 Sep 2025 19:22:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1127896.1468436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0kEs-0001bZ-2M; Mon, 22 Sep 2025 17:22:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1127896.1468436; Mon, 22 Sep 2025 17:22:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0kEr-0001ZG-Ut; Mon, 22 Sep 2025 17:22:09 +0000
Received: by outflank-mailman (input) for mailman id 1127896;
 Mon, 22 Sep 2025 17:22:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1v0kEq-0001ZA-Lg
 for xen-devel@lists.xenproject.org; Mon, 22 Sep 2025 17:22:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1v0kEq-004kYP-0n;
 Mon, 22 Sep 2025 17:22:08 +0000
Received: from [2a02:8012:3a1:0:b59c:e142:82de:6ab8]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1v0kEq-007Oh2-19;
 Mon, 22 Sep 2025 17:22:08 +0000
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
	bh=hRx4qSd5ff7i6y/kWg8c6/2M87Ca1BspaZ//MUGPlhw=; b=P0nU+YkpvVu1KKVNyoK1uWT9eR
	0kdDuHCgrSqvKIg3/Wuu8jSMXWKwlLjLOplRqdfrfXN0WhKSBoc337cmEpneubXLJTa+kAH8VUhXv
	6KeDPnPp4woR9AQWLX22DE/wGWVfwsu+sJ+obSiEbWpEWoNQuc/bxMS6CZSdfUTLn4TE=;
Message-ID: <7afc0bde-062d-4606-8a99-b57abf953710@xen.org>
Date: Mon, 22 Sep 2025 18:22:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] xen/arm: Introduce GICV3 Self Tests
Content-Language: en-GB
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20250912170055.3077923-1-ayan.kumar.halder@amd.com>
 <7bbd581f-bfa4-444e-9c76-bcb833a2ec74@xen.org>
 <b3198457-9aca-430a-80ef-27f22de4ae9b@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b3198457-9aca-430a-80ef-27f22de4ae9b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Ayan,

On 22/09/2025 17:40, Ayan Kumar Halder wrote:
> 
> On 15/09/2025 12:14, Julien Grall wrote:
>> Hi Ayan,
> Hi Julien,
>>
>> On 12/09/2025 18:00, Ayan Kumar Halder wrote:
>>> Introduce CONFIG_GICV3_SELFTEST to enclose tests for GICv3 driver.
>>> Test that Xen is able to generate SGIs.
>>>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> ---
>>> One of the aim of functional safety is to test hw/sw interface. This 
>>> means that
>>> Xen is able to configure the hardware correctly for the desired 
>>> functionalities.
>>>
>>> Normally this is tested from the VMs. For eg if a VM is able to 
>>> receive irq, this
>>> implies that Xen has configured the GICv3 interface 'correctly'. 
>>> However this is
>>> a high level (or integration) test which uses not only the GICv3 
>>> interface
>>> between Xen and VM, but the interrupt injection code for Xen to VMs.
>>>
>>> We want to have some kind of unit tests to check that Xen is able to 
>>> receive
>>> various interrupts, set priorities, etc. Here, we have written unit 
>>> tests for
>>> software generated interrupts (SGIs) as example.
>>>
>>> These tests are expected to be triggered as Xen boots (right after 
>>> Xen has
>>> initialised the GICv3 interface ie gicv3_init(). The aim of this test 
>>> is to
>>> check whether Xen can trigger SGIs after gicv3_init() is invoked. If 
>>> so, we can
>>> claim that gicv3_init() was done properly to be able to trigger SGIs. 
>>
>> To clarify, this only guarantees that the boot CPU can send SGIs to self. 
> Yes, this is the idea.
>> Secondary CPUs are brought up later and will need their own setup to 
>> enable SGIs.
> Yes, we will have separate tests for them.
>>
>>> Likewise
>>> we will have tests to check for priorities, SPIs, etc.
>>>
>>> A script will parse the logs and claim that Xen is able to trigger SGIs.
>>>
>>>   xen/arch/arm/Kconfig  |  8 ++++++++
>>>   xen/arch/arm/gic-v3.c |  7 +++++++
>>>   xen/arch/arm/gic.c    | 21 +++++++++++++++++++++
>>>   3 files changed, 36 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
>>> index 950e4452c1..739f99eaa9 100644
>>> --- a/xen/arch/arm/Kconfig
>>> +++ b/xen/arch/arm/Kconfig
>>> @@ -73,6 +73,14 @@ config GICV3
>>>         Driver for the ARM Generic Interrupt Controller v3.
>>>         If unsure, use the default setting.
>>>   +config GICV3_SELFTEST
>>> +    bool "GICv3 driver self test"
>>> +    default n
>>> +    depends on GICV3
>>> +    ---help---
>>> +
>>> +      Self tests to validate GICV3 driver.
>>> +
>>>   config HAS_ITS
>>>           bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if 
>>> UNSUPPORTED
>>>           depends on GICV3 && !NEW_VGIC && !ARM_32
>>> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
>>> index 4e6c98bada..eb0c05231c 100644
>>> --- a/xen/arch/arm/gic-v3.c
>>> +++ b/xen/arch/arm/gic-v3.c
>>> @@ -1818,6 +1818,13 @@ static int __init gicv3_init(void)
>>>         gicv3_hyp_init();
>>>   +#ifdef CONFIG_GICV3_SELFTEST
>>> +    send_SGI_self(GIC_SGI_EVENT_CHECK);
>>> +    send_SGI_self(GIC_SGI_DUMP_STATE);
>>> +    send_SGI_self(GIC_SGI_CALL_FUNCTION);
>>> +    send_SGI_self(GIC_SGI_MAX);
>>> +#endif
>>
>> Looking a the code below, it seems like Xen will not be functional 
>> after running the selftests? Is this intended? If so, we need to stop 
>> Xen as soon as possible.
> 
> Tbh, I didnot realize this with the current test. However you are 
> correct that for some of these tests, Xen will not be usable. We can put 
> a while(1) after it completes the tests.
> 
> Or, I can invoke machine_halt() .

I think it would be better to use machine_halt(). This would tell QEMU 
to stop and hopefully we don't wait until it timeouts.

> 
> The important bit here is CONFIG_GICV3_SELFTEST cannot be enabled for 
> normal usage of Xen. IOW, user should not expect Xen to run domains when 
> this configuration is enabled.
> 
> They are used to run baremetal tests.
> 
>>
>> Also, looking at start_xen(), we call local_irq_enable() a little 
>> after gicv3_init() is called. So I am a little bit surprised this is 
>> working?
> 
> This is working i.e. we are getting interrupts. However, I can put the 
> test after local_irq_enable() as Xen is expected to terminate after 
> running the tests.

I don't understand how this is working. Can you check whether the 
interrupts are unmasked? If yes, it would be good to know who unmasked 
them because it is not meant to be safe to enable them until the call of 
local_irq_enable() in start_xen().

Cheers,

-- 
Julien Grall


