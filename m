Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC153B6681
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jun 2021 18:15:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147919.273097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxtuA-0000QS-W5; Mon, 28 Jun 2021 16:14:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147919.273097; Mon, 28 Jun 2021 16:14:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxtuA-0000Nj-T9; Mon, 28 Jun 2021 16:14:38 +0000
Received: by outflank-mailman (input) for mailman id 147919;
 Mon, 28 Jun 2021 16:14:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lxtuA-0000Nd-3Z
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 16:14:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lxtu9-00056W-R5; Mon, 28 Jun 2021 16:14:37 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lxtu9-0003RF-LK; Mon, 28 Jun 2021 16:14:37 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=EkmHBmybHyhTkWaI7QWBXlFpsguUGKDGOYul6WZWT2c=; b=jEQAsIp817TA3T5MWgnV1fULxa
	a1Jymj+9skjeEmOaTOyjwBM8cYu4t46DPSJXWDV/SlPYK3vwpQM2n0s49OK4DRXHz5JbRirh2DKiy
	ZnzLTccPas774k6DUUavAQaDHFpAa/854nhuMdyDH/YH1AsIs0qTD50JBkjCm/clBrZc=;
Subject: Re: [PATCH] xen/arm: add forward_smc command line option for
 debugging
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Volodymyr_Babchuk@epam.com
References: <alpine.DEB.2.21.2106241749310.24906@sstabellini-ThinkPad-T480s>
 <b5ba0757-322f-a77a-2293-111b77b29d35@xen.org>
 <alpine.DEB.2.21.2106251033500.24906@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <db2405f9-61d2-5d8f-816e-547bc09bb95c@xen.org>
Date: Mon, 28 Jun 2021 17:14:36 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2106251033500.24906@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 25/06/2021 18:47, Stefano Stabellini wrote:
> On Fri, 25 Jun 2021, Julien Grall wrote:
>> Hi,
>>
>> On 25/06/2021 02:51, Stefano Stabellini wrote:
>>> It has become clear that an option to disable trapping SMC calls to Xen
>>> is very useful for debugging user issues.
>>>
>>> Instead of having to provide a
>>> patch to users every time, it would be great if we could just tell them
>>> to add forward_smc=true to the Xen command line.
>>
>> I can understand this woud be useful to go a bit further in dom0 boot. But I
>> am quite sceptical on the idea of providing an option directly in Xen because:
>>
>> 1) This breaks other SMC uses in Xen (optee, VM monitor...)
>> 2) There are no guarantee that the SMC call will not wreck Xen. To be clear, I
>> don't refer to a malicious OS here, but a normal OS that boot
>> 3) Very likely the next steps for the user (or better call it the developper
>> because that option should really not be used by a normal user) will be to
>> decide whether they should modify the kernel or implement a mediator in Xen.
>>
>>> This option is obviously unsafe and unsecure and only meant for
>>> debugging. Make clear in the description that if you pass
>>> forward_smc=true then the system is not security supported.
>>>
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>>
>>> diff --git a/docs/misc/xen-command-line.pandoc
>>> b/docs/misc/xen-command-line.pandoc
>>> index 3ece83a427..0833fe80fc 100644
>>> --- a/docs/misc/xen-command-line.pandoc
>>> +++ b/docs/misc/xen-command-line.pandoc
>>> @@ -2501,6 +2501,16 @@ vwfi to `native` reduces irq latency significantly.
>>> It can also lead to
>>>    suboptimal scheduling decisions, but only when the system is
>>>    oversubscribed (i.e., in total there are more vCPUs than pCPUs).
>>>    +### forward_smc (arm)
>>> +> `= <boolean>`
>>> +
>>> +> Default: `false`
>>> +
>>> +If enabled, instead of trapping firmware SMC calls to Xen, allow SMC
>>> +calls from VMs directly to the firmware. This option is UNSAFE and it is
>>> +only meant for debugging. Systems with forward_smc=true are not security
>>> +supported.
>>> +
>>>    ### watchdog (x86)
>>>    > `= force | <boolean>`
>>>    diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
>>> index e7384381cc..0580ac5762 100644
>>> --- a/xen/arch/arm/traps.c
>>> +++ b/xen/arch/arm/traps.c
>>> @@ -95,11 +95,15 @@ static int __init parse_vwfi(const char *s)
>>>    }
>>>    custom_param("vwfi", parse_vwfi);
>>>    +static bool forward_smc = false;
>>> +boolean_param("forward_smc", forward_smc);
>>> +
>>>    register_t get_default_hcr_flags(void)
>>>    {
>>>        return  (HCR_PTW|HCR_BSU_INNER|HCR_AMO|HCR_IMO|HCR_FMO|HCR_VM|
>>>                 (vwfi != NATIVE ? (HCR_TWI|HCR_TWE) : 0) |
>>> -             HCR_TID3|HCR_TSC|HCR_TAC|HCR_SWIO|HCR_TIDCP|HCR_FB|HCR_TSW);
>>> +             (forward_smc ? 0 : HCR_TSC) |
>>> +             HCR_TID3|HCR_TAC|HCR_SWIO|HCR_TIDCP|HCR_FB|HCR_TSW);
>>
>> A system wide option to turn off SMC trapping is a no-go because this would
>> only be usable for debugging dom0 and not a guest.
>>
>> So at the minimum this should be a per-domain option. Also, I think we still
>> want to integrate with the rest of the SMC users. So Xen should still trap the
>> SMC and the forward should happen in vsmccc_handle_call().
>>
>> This would cover my first point.
> 
> Yes, you are totally right. I thought about it this morning as well.
> This patch would break even PSCI :-(
> 
> It would be best implemented in platform_smc as forward_to_fw (see
> xen/arch/arm/platforms/xilinx-zynqmp-eemi.c:forward_to_fw).

There is one problem though. How do you know which calling convention to 
use? IOW, will all the firmware call (in particular on older platform) 
follow the SMCCC?

> 
> 
>> For the second and third point, I still like
>> to understand how this is going to help the developer to fully port the
>> board/OS to Xen with this option disabled?
> 
> This is meant to help with bug triage only. There are a number of bugs
> that can happen if certain platform SMCs are intercerpted by Xen instead
> of being forwarded to the hardware.

We already print a message informating the user that the SMC call was 
trapped and terminated in Xen. So I am not entirely sure why you also 
need to passthrough all the SMC calls to triage it. You already know 
that the SMC will have to be implemented in Xen...


> I found myself having to provide a
> patch to forward_to_fw all platform SMCs as a first test to
> triage bugs a few times recently. It is never a fix, only a way to
> understand the next step of debugging. Also Alex stumbled across
> something similar on a non-Xilinx board (MacchiatoBin) so I thought it
> was time for a better debugging option.
> 
> I think for debugging purposes it would be sufficient if all platform
> SMCs were forward_to_fw from all domains. Of course it is totally
> unsafe, but it is just for debugging.

In order to add a debugging option in Xen, we need to be reasonably 
confident that the option will not make more damage (I am not speaking 
about security here...) than it is actually worth it.

I can see how this helps in both your situation to boot dom0. However, I 
am not sure this can be generalized to every platform. A developper (or 
user) enabling this debugging option may end up to see corruption/hang 
because:
   1) SMC call may pass memory address. A domain would pass a guest 
physical address but the firmware will interpret as host physical 
address. This working(ish) for dom0 because both are equivalent, but for 
other domain this will break.
  2) SMC call may change the behavior of the system (i.e. turning off 
the UART)...

It would be difficult to pinpoint whether the problem is because an SMC 
(or else) without implementing each SMC call in Xen.

I don't think it is a lot of work to implement SMCs in Xen as you find 
them (sooner or later, you will have to do it anyway...). At which 
point, forwarding all the unknowns SMCs to attempt to boot further is 
probably more risky than it is worth it.

If the problem is re-building, then we could consider to provide a 
command line option to easily specify which SMC call is passthrough...

Cheers,

-- 
Julien Grall

