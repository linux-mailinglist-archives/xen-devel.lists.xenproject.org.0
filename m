Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AAE62C7C0
	for <lists+xen-devel@lfdr.de>; Wed, 16 Nov 2022 19:37:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.444384.699535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovNHY-0000Qb-J6; Wed, 16 Nov 2022 18:37:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 444384.699535; Wed, 16 Nov 2022 18:37:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovNHY-0000O9-F8; Wed, 16 Nov 2022 18:37:08 +0000
Received: by outflank-mailman (input) for mailman id 444384;
 Wed, 16 Nov 2022 18:37:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ovNHX-0000O3-JX
 for xen-devel@lists.xenproject.org; Wed, 16 Nov 2022 18:37:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ovNHX-0002tb-38; Wed, 16 Nov 2022 18:37:07 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.13.29]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ovNHW-0007SC-Rh; Wed, 16 Nov 2022 18:37:07 +0000
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
	bh=yFbTu5tpknRiV3uO3Ck/TG/4lqnA5v7fBAbFu1rRGrs=; b=pTpeh5ICg9sNIiml17ehMoLHME
	OBb5wwOixtFrlvaGAhLpELA4/YeqNdYYHL0tBR0XK9rS16XvSUBNXEYacnS/F1HxZxGut8+LMqrTP
	plM5GMO1SQphqUftDnq5PUTFidcjWuH+KhTV02Wz4HxRa2i9xU5IbwXVVYB3n/a2Ydyc=;
Message-ID: <84710d96-c473-fa41-d847-2b109dfb49c9@xen.org>
Date: Wed, 16 Nov 2022 18:37:04 +0000
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <350afafd-821c-1a05-13cb-1704d3a61bfc@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 16/11/2022 18:05, Michal Orzel wrote:
> On 16/11/2022 16:56, Julien Grall wrote:
>>
>>
>> On 16/11/2022 14:45, Michal Orzel wrote:
>>> Hi Julien,
>>
>> Hi Michal,
>>
>>>>
>>>>> and use it in the pl011-debug files (+ there is a question whether we should define WLEN_7-5 for completeness).
>>>>
>>>> I would not define WLEN_7-5. That said, I wonder if we really need to
>>>> set the baud rate & co here?
>>>>
>>>> AFAICT the runtime driver never touch them. The reasoning is the
>>>> firmware is responsible to configure the serial. Therefore, I would
>>>> consider to drop the code (setting UARTCR might still be necessary).
>>> I do not really agree because the current behavior was done on purpose.
>>
>> EARLY_UART_PL011_BAUD_RATE is only used for very early debugging (this
>> is protected by CONFIG_DEBUG and CONFIG_EXPERT). This is not a
>> production ready code.
> I am fully aware of it. I just found it useful but I understand the global reasoning.
> 
>>
>>> At the moment early_uart_init is called only if EARLY_UART_PL011_BAUD_RATE is set to a value != 0.
>>> This is done in order to have flexibility to either stick to what firmware/bootloader configured or to change this
>>> configuration by specifying the EARLY_UART_PL011_BAUD_RATE (useful when you do not know what
>>> the firmware configured).
>> The chances are that you want to use the baud rate that was configured
>> by the firmware. Otherwise, you would need to change the configuration
>> of minicom (or whatever you used) to get proper output for the firmware
>> and then Xen.
>>
>> Furthermore, as I wrote before, the runtime driver doesn't configure the
>> baud rate. This was removed in Xen 4.7 (see commit 2048e17ca9df
>> "drivers/pl011: Don't configure baudrate") because it was buggy and this
>> code is not simple.
>>
>> So it makes no sense to configure the baud rate when using early printk
>> but not the runtime driver.
> Ok, so we will get rid of EARLY_UART_PL011_BAUD_RATE config and setting the bd
> in the early uart code. Now, what about setting "8n1"? The runtime driver sets them
> as well as the early code. It can also be set to a different value from the firmware
> (unlikely but it can happen I think). In any case, if we decide to do what the runtime driver
> does, I reckon setting LCR_H should be kept in early code.

Good question. I think, you would end up with the same issue I mentioned 
above if the firmware and Xen have different line control registers 
(tools like minicom/screen would ask for it).

So I am on the fence here. In one way, it seems pointless keep it. But 
on the other hand, Xen has always set it. So I have no data to prove 
this will be fine everywhere.

Cheers,

-- 
Julien Grall

