Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE2262D7C0
	for <lists+xen-devel@lfdr.de>; Thu, 17 Nov 2022 11:11:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444884.700036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovbs1-00020W-9h; Thu, 17 Nov 2022 10:11:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444884.700036; Thu, 17 Nov 2022 10:11:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovbs1-0001wG-5B; Thu, 17 Nov 2022 10:11:45 +0000
Received: by outflank-mailman (input) for mailman id 444884;
 Thu, 17 Nov 2022 10:11:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ovbrz-0001vj-2M
 for xen-devel@lists.xenproject.org; Thu, 17 Nov 2022 10:11:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ovbry-0007Oc-MN; Thu, 17 Nov 2022 10:11:42 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.7.117]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ovbry-0002Vm-F8; Thu, 17 Nov 2022 10:11:42 +0000
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
	bh=+lE1OfH2Wa6yVgvUbxDsqQGAdIYuuPNt91zLs8IG17k=; b=mYpYUjgyYohWDLFbm+XJwsGUYD
	1TGNKKWcKO6Ptc13Awc2Dq9jBSzlSPNaOuIZZqIqlByKrGWnC5eEkeTYR0OG2OP8jCDxVpjANg3Hj
	1kezAfkbNJaYbAJ69QhJgxnxGvz/S3OROhTgZHkPeXFCQ055YUPckuXFsQdOAEMyiVcw=;
Message-ID: <51fdb064-682e-b995-5171-ba23f75bc760@xen.org>
Date: Thu, 17 Nov 2022 10:11:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH] xen/arm: debug-pl011.inc: Use macros instead of hardcoded
 values
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221024100536.12874-1-michal.orzel@amd.com>
 <fd7bd57d-b7a2-8be6-cead-2903a6115f40@xen.org>
 <d472516a-6ba4-167d-6eed-e9a4a43f65b2@amd.com>
 <653bdfb0-2926-531b-bb56-d0797fbf3877@xen.org>
 <60cf8d8e-e4d6-2c8b-50ba-ab6c3fe7d84c@amd.com>
 <0400b2d8-6f2c-6406-d966-64ed5720688c@xen.org>
 <350afafd-821c-1a05-13cb-1704d3a61bfc@amd.com>
 <84710d96-c473-fa41-d847-2b109dfb49c9@xen.org>
 <85f4f42b-b1ee-36bf-5ba9-21b1047351cf@amd.com>
 <7d3f9021-d608-9e8f-9593-1099d7bd2003@xen.org>
 <c932c530-69c0-8c75-ff37-cb35d0ad5de3@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c932c530-69c0-8c75-ff37-cb35d0ad5de3@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 17/11/2022 09:53, Michal Orzel wrote:
> On 17/11/2022 10:29, Julien Grall wrote:
>>
>>
>> On 17/11/2022 08:34, Michal Orzel wrote:
>>> Hi Julien,
>>>
>>> On 16/11/2022 19:37, Julien Grall wrote:
>>>>
>>>>
>>>> Hi Michal,
>>>>
>>>> On 16/11/2022 18:05, Michal Orzel wrote:
>>>>> On 16/11/2022 16:56, Julien Grall wrote:
>>>>>>
>>>>>>
>>>>>> On 16/11/2022 14:45, Michal Orzel wrote:
>>>>>>> Hi Julien,
>>>>>>
>>>>>> Hi Michal,
>>>>>>
>>>>>>>>
>>>>>>>>> and use it in the pl011-debug files (+ there is a question whether we should define WLEN_7-5 for completeness).
>>>>>>>>
>>>>>>>> I would not define WLEN_7-5. That said, I wonder if we really need to
>>>>>>>> set the baud rate & co here?
>>>>>>>>
>>>>>>>> AFAICT the runtime driver never touch them. The reasoning is the
>>>>>>>> firmware is responsible to configure the serial. Therefore, I would
>>>>>>>> consider to drop the code (setting UARTCR might still be necessary).
>>>>>>> I do not really agree because the current behavior was done on purpose.
>>>>>>
>>>>>> EARLY_UART_PL011_BAUD_RATE is only used for very early debugging (this
>>>>>> is protected by CONFIG_DEBUG and CONFIG_EXPERT). This is not a
>>>>>> production ready code.
>>>>> I am fully aware of it. I just found it useful but I understand the global reasoning.
>>>>>
>>>>>>
>>>>>>> At the moment early_uart_init is called only if EARLY_UART_PL011_BAUD_RATE is set to a value != 0.
>>>>>>> This is done in order to have flexibility to either stick to what firmware/bootloader configured or to change this
>>>>>>> configuration by specifying the EARLY_UART_PL011_BAUD_RATE (useful when you do not know what
>>>>>>> the firmware configured).
>>>>>> The chances are that you want to use the baud rate that was configured
>>>>>> by the firmware. Otherwise, you would need to change the configuration
>>>>>> of minicom (or whatever you used) to get proper output for the firmware
>>>>>> and then Xen.
>>>>>>
>>>>>> Furthermore, as I wrote before, the runtime driver doesn't configure the
>>>>>> baud rate. This was removed in Xen 4.7 (see commit 2048e17ca9df
>>>>>> "drivers/pl011: Don't configure baudrate") because it was buggy and this
>>>>>> code is not simple.
>>>>>>
>>>>>> So it makes no sense to configure the baud rate when using early printk
>>>>>> but not the runtime driver.
>>>>> Ok, so we will get rid of EARLY_UART_PL011_BAUD_RATE config and setting the bd
>>>>> in the early uart code. Now, what about setting "8n1"? The runtime driver sets them
>>>>> as well as the early code. It can also be set to a different value from the firmware
>>>>> (unlikely but it can happen I think). In any case, if we decide to do what the runtime driver
>>>>> does, I reckon setting LCR_H should be kept in early code.
>>>>
>>>> Good question. I think, you would end up with the same issue I mentioned
>>>> above if the firmware and Xen have different line control registers
>>>> (tools like minicom/screen would ask for it).
>>>>
>>>> So I am on the fence here. In one way, it seems pointless keep it. But
>>>> on the other hand, Xen has always set it. So I have no data to prove
>>>> this will be fine everywhere.
>>> If we are relying on the firmware[1] to configure the baud rate, it is not very wise
>>> not to rely on it to configure the LCR. Looking at the other serial drivers in Xen,
>>> we have a real mismatch in what is being configured. Some of the drivers (omap, imx),
>>> apart from setting 8n1 also set the baud rate explicitly to 115200 and almost all of them
>>> do set 8n1. In that case we will not benefit too much from fixing just pl011.
>> It is not great that Xen hardcode the baud rate (I can't remember
>> whether there was a reason), but I don't think the consistency is
>> necessary here (see more below).
>>
>>>
>>> On the other hand, Xen follows the zImage/Image protocols for ARM [2] which do not
>>> state that serial port initializing is something mandatory. This could indicate that
>>> the firmware does not really need to configure the serial.
>>
>> The firmware doesn't need to configure the serial and yes in theory Xen
>> should configure the baud rate and parity based on the firmware table.
>>
>> However, this is a trade off between complexity and benefits. The patch
>> I mentioned earlier has been removed nearly 6 years ago and I haven't
>> seen anyone reporting any issues.
>>
>> Hence why I think for the PL011 it is not worth looking [3] at the baud
>> rate and instead removing it completely in the early PL011 code as well.
>>
>> That said, if you feel strongly adding support for baud rate then I will
>> be happy to review the patch.
> I'm not in favor of this approach either. That said, I will prepare patches to remove
> CONFIG_EARLY_UART_PL011_BAUD_RATE and its usage in early printk code as we agreed earlier.
> As for the LCR setting, I will keep it in early printk code to maintain the same behavior as
> runtime driver who sets them.
> 
>>
>>>
>>> [1] It is not stated anywhere in our docs.
>>
>> Our docs are not perfect. Patches are welcomed for improvement.
>> Although, I think the statement should only be for driver where we don't
>> set the baud rate. For the others, we should leave it as is unless you
>> can prove this is not necessary (we don't want to break existing setup).
>>
>>>
>>> [2] BTW: our docs/misc/arm/booting contains invalid links to the kernel docs. I guess
>>> this wants to be fixed.
>>
>> Patches are welcomed.
>>
>> [3] I do have a large list of more critical bugs that I will be happy to
>> share if you are looking for improving Xen.
> That is cool and such list would be great for everyone having some spare time (+ newcomers).
> Taking the opportunity of having a GitLab CI epics, I think it is worth adding such work items here:
> https://gitlab.com/groups/xen-project/-/epics?state=opened&page=1&sort=start_date_desc

I already have a Trello board I created a few years ago when I left Arm 
[1] with 30+ issues. I have another 30+ in my private board.

I can try to clean-up the one I have in my private board. But I will 
need some help for transfer everything to gitlab.

Cheers,

[1] 
https://trello.com/invite/b/L54vXoqM/ATTI99c86a2718dec17b3b08f0de35fb3b5bC8729E45/xen

-- 
Julien Grall

