Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AB56828CD
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 10:28:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487473.755104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMmvU-00070G-4Y; Tue, 31 Jan 2023 09:27:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487473.755104; Tue, 31 Jan 2023 09:27:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMmvU-0006xw-0d; Tue, 31 Jan 2023 09:27:40 +0000
Received: by outflank-mailman (input) for mailman id 487473;
 Tue, 31 Jan 2023 09:27:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pMmvS-0006xq-Tg
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 09:27:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMmvS-0005g0-Fe; Tue, 31 Jan 2023 09:27:38 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.14.74]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMmvS-0002kH-9C; Tue, 31 Jan 2023 09:27:38 +0000
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
	bh=iEOW7X8Cc3FoaUkO2QLv7nhpRfsoHwTOTV3ZCYd3sO8=; b=wHXsLZB3AoKB3zX/lHL6EkcfGm
	jMfwxPWcjUEfDmZntmHoica2rgz1NVnmkcuNITy2ci1UtyJVf6howibx2p8nO8AG9LrxQB99XuzLp
	/NuVUp95WgDMeWzbHD/cNR2FhLxs8vqu0+1X1lBzN/XWOKidcjnqSj9qhTO6SL9hsie8=;
Message-ID: <509eafac-bbe7-ed18-ce11-3fede7ca691d@xen.org>
Date: Tue, 31 Jan 2023 09:27:36 +0000
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <AM0PR08MB45309F6DCB1B1E0975A741B7F7D09@AM0PR08MB4530.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 31/01/2023 04:11, Penny Zheng wrote:
> Hi Julien
> 
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: Monday, January 30, 2023 5:40 PM
>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org
>> Cc: Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini
>> <sstabellini@kernel.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
>> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> Subject: Re: [PATCH v2 11/40] xen/mpu: build up start-of-day Xen MPU
>> memory region map
>>
>> Hi Penny,
>>
>> On 30/01/2023 05:45, Penny Zheng wrote:
>>>    There are three types of MPU regions during boot-time:
>>> 1. Fixed MPU region
>>> Regions like Xen text section, Xen heap section, etc.
>>> 2. Boot-only MPU region
>>> Regions like Xen init sections, etc. It will be removed at the end of booting.
>>> 3.   Regions need switching in/out during vcpu context switch
>>> Region like system device memory map.
>>> For example, for FVP_BaseR_AEMv8R, we have [0x80000000, 0xfffff000) as
>>> the whole system device memory map for Xen(idle vcpu) in EL2,  when
>>> context switching to guest vcpu, it shall be replaced with
>>> guest-specific device mapping, like vgic, vpl011, passthrough device, etc.
>>>
>>> We don't have two mappings for different stage translations in MPU, like
>> we had in MMU.
>>> Xen stage 1 EL2 mapping and stage 2 mapping are both sharing one MPU
>>> memory mapping(xen_mpumap) So to save the trouble of hunting down
>> each
>>> switching regions in time-sensitive context switch, we must re-order
>> xen_mpumap to keep fixed regions in the front, and switching ones in the
>> heels of them.
>>
>>   From my understanding, hunting down each switching regions would be a
>> matter to loop over a bitmap. There will be a slight increase in the number
>> of instructions executed, but I don't believe it will be noticeable.
>>
>>>
>>> In Patch Serie v1, I was adding MPU regions in sequence,  and I
>>> introduced a set of bitmaps to record the location of same type
>>> regions. At the end of booting, I need to *disable* MPU to do the
>> reshuffling, as I can't move regions like xen heap while MPU on.
>>>
>>> And we discussed that it is too risky to disable MPU, and you
>>> suggested [1] "
>>>> You should not need any reorg if you map the boot-only section
>>>> towards in the higher slot index (or just after the fixed ones).
>>> "
>>
>> Right, looking at the new code. I realize that this was probably a bad idea
>> because we are adding complexity in the assembly code.
>>
>>>
>>> Maybe in assembly, we know exactly how many fixed regions are,
>>> boot-only regions are, but in C codes, we parse FDT to get static
>> configuration, like we don't know how many fixed regions for xen static
>> heap is enough.
>>> Approximation is not suggested in MPU system with limited MPU regions,
>>> some platform may only have 16 MPU regions, IMHO, it is not worthy
>> wasting in approximation.
>>
>> I haven't suggested to use approximation anywhere here. I will answer
>> about the limited number of entries in the other thread.
>>
>>>
>>> So I take the suggestion of putting regions in the higher slot index.
>>> Putting fixed regions in the front, and putting boot-only and
>>> switching ones at tail. Then, at the end of booting, when we reorg the
>> mpu mapping, we remove all boot-only regions, and for switching ones, we
>> disable-relocate(after fixed ones)-enable them. Specific codes in [2].
>>
>>   From this discussion, it feels to me that you are trying to make the code
>> more complicated just to keep the split and save a few cycles (see above).
>>
>> I would suggest to investigate the cost of "hunting down each section".
>> Depending on the result, we can discuss what the best approach.
>>
> 
> Correct me if I'm wrong, the complicated things in assembly you are worried about
> is that we couldn't define the index for initial sections, no hardcoded to keep simple.

Correct.

> And function write_pr, ik, is really a big chunk of codes, however the logic is simple there,
> just a bunch of "switch-cases".

I agree that write_pr() is a bunch of switch-cases. But there are a lot 
of duplication in it and the interface to use it is, IMHO, not intuitive.

> 
> If we are adding MPU regions in sequence as you suggested, while using bitmap at the
> same time to record used entry.
> TBH, this is how I designed at the very beginning internally. We found that if we don't
> do reorg late-boot to keep fixed in front and switching ones after, each time when we
> do vcpu context switch, not only we need to hunt down switching ones to disable,
> while we add new switch-in regions, using bitmap to find free entry is saying that the
> process is unpredictable. Uncertainty is what we want to avoid in Armv8-R architecture.

I don't understand why it would be unpredictable. For a given 
combination of platform/device-tree, the bitmap will always look the 
same. So the number of cycles/instructions will always be the same.

This is not very different from the case where you split the MPU in two 
because

> 
> Hmmm, TBH, I really really like your suggestion to put boot-only/switching regions into
> higher slot. It really saved a lot trouble in late-init reorg and also avoids disabling MPU
> at the same time. The split is a simple and easy-to-understand construction compared
> with bitmap too.

I would like to propose another split. I will reply to that in the 
thread where you provided the MPU layout.

Cheers,

-- 
Julien Grall

