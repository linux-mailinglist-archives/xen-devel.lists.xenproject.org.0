Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EBA687AF4
	for <lists+xen-devel@lfdr.de>; Thu,  2 Feb 2023 11:58:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488647.756815 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNXIB-0000Pu-5j; Thu, 02 Feb 2023 10:58:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488647.756815; Thu, 02 Feb 2023 10:58:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNXIB-0000OA-30; Thu, 02 Feb 2023 10:58:11 +0000
Received: by outflank-mailman (input) for mailman id 488647;
 Thu, 02 Feb 2023 10:58:10 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pNXIA-0000O4-0r
 for xen-devel@lists.xenproject.org; Thu, 02 Feb 2023 10:58:10 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pNXI9-00009T-Ol; Thu, 02 Feb 2023 10:58:09 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.13.48]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pNXI9-0007ms-Gz; Thu, 02 Feb 2023 10:58:09 +0000
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
	bh=nFBwOcL5ETnooULiT7DPoLFzZtiIJrQ9WH30Pi4Zs4k=; b=TOEX+c219RHCHtFRmfhu377KYd
	lUfD+K1q+hx51O5eSmHNJB9ukqp6sDEgO7oYwg7aTQdT4EzqjY9ZD/UL31DNtjdS/gFk3hp9g4TtW
	kBJ72Af19ACwsQ8a8SjZLCdBU0L/X0vPZWfuDSuecFo5hzFVqS1zt/3nQmrGwBKFb62c=;
Message-ID: <83ba0e60-1a3f-f91a-05b3-79ec32ba4caa@xen.org>
Date: Thu, 2 Feb 2023 10:58:07 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 11/40] xen/mpu: build up start-of-day Xen MPU memory
 region map
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "ayan.kumar.halder@xilinx.com" <ayan.kumar.halder@xilinx.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-12-Penny.Zheng@arm.com>
 <c30b4458-b5f6-f996-0c3c-220b18bfb356@xen.org>
 <AM0PR08MB453083B74DB1D00BDF469331F7D29@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <7931e70f-3754-363c-28d8-5fde3198d70f@xen.org>
 <AM0PR08MB45308D5CD69EBB5FE85A4B88F7D39@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <3c915633-ddb8-d1e4-f42e-064aaff168b2@xen.org>
 <AM0PR08MB45309F6DCB1B1E0975A741B7F7D09@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <509eafac-bbe7-ed18-ce11-3fede7ca691d@xen.org>
 <AM0PR08MB4530DD5EE9DD4339594F3FE9F7D19@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <1f360356-b143-e732-5a4a-197ed56b2cd1@xen.org>
 <AM0PR08MB4530C5B6E0A8ADCDED65D7C4F7D69@AM0PR08MB4530.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AM0PR08MB4530C5B6E0A8ADCDED65D7C4F7D69@AM0PR08MB4530.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02/02/2023 10:53, Penny Zheng wrote:
> Hi Julien,

Hi,

>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: Thursday, February 2, 2023 2:57 AM
>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org;
>> Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini
>> <sstabellini@kernel.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
>> ayan.kumar.halder@xilinx.com
>> Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> Subject: Re: [PATCH v2 11/40] xen/mpu: build up start-of-day Xen MPU
>> memory region map
>>
>> Hi Penny,
>>
>> On 01/02/2023 05:39, Penny Zheng wrote:
>>>>> If we are adding MPU regions in sequence as you suggested, while
>>>>> using bitmap at the same time to record used entry.
>>>>> TBH, this is how I designed at the very beginning internally. We
>>>>> found that if we don't do reorg late-boot to keep fixed in front and
>>>>> switching ones after, each time when we do vcpu context switch, not
>>>>> only we need to hunt down switching ones to disable, while we add
>>>>> new switch-in regions, using bitmap to find free entry is saying
>>>>> that the
>>>> process is unpredictable. Uncertainty is what we want to avoid in
>>>> Armv8-R architecture.
>>>>
>>>> I don't understand why it would be unpredictable. For a given
>>>> combination of platform/device-tree, the bitmap will always look the
>>>> same. So the number of cycles/instructions will always be the same.
>>>>
>>>
>>> In boot-time, it will be always the same. But if we still use bitmap
>>> to find free entry(for switching MPU regions) on runtime, hmmm, I
>>> thought this part will be unpredictable.
>>
>> I know this point is now moot as we agreed on not using a bitmap but I
>> wanted to answer on the unpredictability part.
>>
>> It depends on whether you decide to allocate more entry at runtime. My
>> assumption is you won't and therefore the the time to walk the bitmap will
>> always be consistent.
>>
> 
> In MPU, we don't have something like vttbr_el2 in MMU, to store stage 2
> EL1/EL0 translation table. Xen stage 1 EL2 mapping and stage 2 EL1/EL0
> mapping are both sharing one table.
> So when context switching into different guest, the current design is to disable
> DOM1's guest RAM mapping firstly, then enable DOM2's guest RAM mapping,
> to ensure isolation and safety.

I understood that but I don't understand how this is related to my point 
here. The entries you are replacing are always going to be the same 
after boot.

So if you have a bitmap indicate the fixed entries and you don't add 
more fixed one at runtime, then it will always take the same time to 
walk it.

Cheers,

-- 
Julien Grall

