Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62758849772
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 11:13:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.675756.1051185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWvyf-0007t4-Of; Mon, 05 Feb 2024 10:13:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 675756.1051185; Mon, 05 Feb 2024 10:13:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWvyf-0007rV-Lr; Mon, 05 Feb 2024 10:13:25 +0000
Received: by outflank-mailman (input) for mailman id 675756;
 Mon, 05 Feb 2024 10:13:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rWvyf-0007rP-0K
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 10:13:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rWvyV-0002Gx-NU; Mon, 05 Feb 2024 10:13:15 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rWvyV-0004Yg-FP; Mon, 05 Feb 2024 10:13:15 +0000
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
	bh=J7JoeYQ0DQnkWnozzirMu5yZ/gg+y8pD8sZa9vnAbzM=; b=R4SONskWvj3JoG3HZbtwSEvWmr
	6NZ9Kslz4Xzj/FqYiMdYLKirngGpnk+TqEuD0dtKlc9tR14U0NKJtEmOTYURA23vy11kkK1BxLkBD
	pvM5wFNGoORLB2B7lxEwVvOYei+MxSbGD/HCqsaC0sLP+3UH8amdHFVfhw/sZ6THiNok=;
Message-ID: <5a0c8f09-4f01-45e9-892c-86342c0d0ec5@xen.org>
Date: Mon, 5 Feb 2024 10:13:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/arm: Add imx8q{m,x} platform glue
To: Peng Fan <peng.fan@nxp.com>, John Ernberg <john.ernberg@actia.se>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Jonas Blixt <jonas.blixt@actia.se>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20240131114952.305805-1-john.ernberg@actia.se>
 <20240131114952.305805-2-john.ernberg@actia.se>
 <a2f726f5-df4c-4d15-90af-7d59c0f1f513@xen.org>
 <494d4961-ad8a-4d1d-aaa6-d1bfb9d6a137@actia.se>
 <167f0c7a-e037-446c-82f8-2584e35a7af1@xen.org>
 <a265ea2d-9b5f-4726-9395-448b1b669839@actia.se>
 <012b5f83-2f9b-4477-965e-07b8506c0052@xen.org>
 <DU0PR04MB94170CB1F77E3D594A6D0E9488402@DU0PR04MB9417.eurprd04.prod.outlook.com>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <DU0PR04MB94170CB1F77E3D594A6D0E9488402@DU0PR04MB9417.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 04/02/2024 09:40, Peng Fan wrote:
> 
> 
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: 2024年2月2日 17:20
>> To: John Ernberg <john.ernberg@actia.se>; Stefano Stabellini
>> <sstabellini@kernel.org>; Bertrand Marquis <bertrand.marquis@arm.com>;
>> Michal Orzel <michal.orzel@amd.com>; Volodymyr Babchuk
>> <Volodymyr_Babchuk@epam.com>; Peng Fan <peng.fan@nxp.com>
>> Cc: Jonas Blixt <jonas.blixt@actia.se>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH 1/2] xen/arm: Add imx8q{m,x} platform glue
>>
>> On 01/02/2024 16:17, John Ernberg wrote:
>>> On 2/1/24 13:20, Julien Grall wrote:
>>>>
>>>>
>>>> On 31/01/2024 15:32, John Ernberg wrote:
>>>>> Hi Julien,
>>>>
>>>> Hi John,
>>>>
>>>>> On 1/31/24 13:22, Julien Grall wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 31/01/2024 11:50, John Ernberg wrote:
>>>>>>> When using Linux for dom0 there are a bunch of drivers that need
>>>>>>> to do SMC SIP calls into the PSCI provider to enable certain
>>>>>>> hardware bits like the watchdog.
>>>>>>
>>>>>> Do you know which protocol this is under the hood. Is this SCMI?
>>>>>
>>>>> I think I confused myself here when I wrote the commit log.
>>>>>
>>>>> The EL3 code in our case is ATF, and it does not appear to be SCMI,
>>>>> nor PSCI. The register usage of these SMC SIP calls are as follows:
>>>>> a0 - service
>>>>> a1 - function
>>>>> a2-a7 - args
>>>>>
>>>>> In ATF the handler is declared as a runtime service.
>>>>>
>>>>> Would the appropriate commmit message here be something along the
>>>>> lines of below?
>>>>> """
>>>>> When using Linux for dom0 there are a bunch of drivers that need to
>>>>> do   SMC SIP calls into the firmware to enable certain hardware bits
>>>>> like the watchdog.
>>>>> """
>>>>
>>>> It reads better thanks.
>>>>
>>>> [...]
>>>>
>>>>>> But even if we restrict to dom0, have you checked that none of the
>>>>>> SMCs use buffers?
>>>>> I haven't found any such instances in the Linux kernel where a
>>>>> buffer is used. Adding a call filtering like suggested below
>>>>> additions of such functions can be discovered and adapted for if they
>> would show up later.
>>>>>>
>>>>>> Rather than providing a blanket forward, to me it sounds more like
>>>>>> you want to provide an allowlist of the SMCs. This is more
>>>>>> futureproof and avoid the risk to expose unsafe SMCs to any domain.
>>>>>>
>>>>>> For an example, you can have a look at the EEMI mediator for Xilinx.
>>>>>
>>>>> Ack. Do you prefer to see only on SMCCC service level or also on
>>>>> function level? (a1 register, per description earlier)
>>>>
>>>> I am not sure. It will depend on whether it is correct to expose
>>>> *all* the functions within a service level and they have the same format.
>>>>
>>>> If you can't guarantee that, then you will most likely need to
>>>> allowlist at the function level.
>>>>
>>>> Also, do you have a spec in hand that would help to understand which
>>>> service/function is implemented via those SMCs?
>>>
>>> I don't have the spec unfortunately, but I will add a filter on both
>>> service and function for V2 and we'll take it from there.
>>
>> @Peng, do you have any specification you could share? How stable is the
>> interface?
> 
> No specification, the use is IMX_SIP_X in linux kernel source.
> 
> Such as IMX_SIP_RTC, IMX_SIP_TIMER
> 
> It is stable and no change, we only add new SIP macro if needed
> and no change the meaning or reuse old SIP.

Thanks for the answer. It is a bit unfortunate there are no 
specification, but at least they are stable.

I have searched IMX_SIP in Linux, there doesn't seem many so we could 
allowlist them (see more below). Do you know if there are more necessary 
that are not yet upstreamed in Linux?


Looking through the list, there are some that probably want a bit more 
discussion on whether we want to expose them:
   * IMX_SIP_CPUFREQ: Right now, dom0 is not aware of the full system. 
So it may take wrong decision.
   * IMX_SIP_DDR_DVFS: Some operation seems to take the number of online 
CPUs. Dom0 doesn't know that
   * IMX_SIP_TIMER_*:  This seems to be related to the watchdog. 
Shouldn't dom0 rely on the watchdog provided by Xen instead? So those 
call will be used by Xen.

Also, what happen if we don't expose those SMC to dom0?

Cheers,

-- 
Julien Grall

