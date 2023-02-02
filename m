Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 421A5687BCA
	for <lists+xen-devel@lfdr.de>; Thu,  2 Feb 2023 12:12:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488694.756957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNXVa-0001Zd-AA; Thu, 02 Feb 2023 11:12:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488694.756957; Thu, 02 Feb 2023 11:12:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pNXVa-0001XW-71; Thu, 02 Feb 2023 11:12:02 +0000
Received: by outflank-mailman (input) for mailman id 488694;
 Thu, 02 Feb 2023 11:12:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pNXVY-0001XQ-Tz
 for xen-devel@lists.xenproject.org; Thu, 02 Feb 2023 11:12:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pNXVY-0000Sp-IH; Thu, 02 Feb 2023 11:12:00 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.13.48]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pNXVY-000069-CW; Thu, 02 Feb 2023 11:12:00 +0000
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
	bh=xi5FAIr9Ftd8CPC1i9gpjjh2DeZ5R57YdiAxh3bAKbg=; b=oTVjY0WVygZ0Lt2Js2NSlR4Mc3
	V4Zb3kxsaeb9uRkDWSu4G+tBm3R9ZeXH2x7BecjYD82/bVCW9iBV6ABBlLWWTudxNk1YDmmkV4505
	OSlMvFxrwODt37WzxBeL6DeQ5AETND2JBDrHW2CmTmHKgomXdgbDi7fS8IP0OabyqX+0=;
Message-ID: <814100fd-5624-7d67-764d-dc6f0f493af9@xen.org>
Date: Thu, 2 Feb 2023 11:11:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 13/40] xen/mpu: introduce unified function
 setup_early_uart to map early UART
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-14-Penny.Zheng@arm.com>
 <23f49916-dd2a-a956-1e6b-6dbb41a8817b@xen.org>
 <AM0PR08MB4530B7AF6EA406882974D528F7D29@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <33bddc11-ae1e-b467-32d7-647748d1c627@xen.org>
 <AM0PR08MB453026B268BA9FBEEE970090F7D39@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <49329992-3203-78a7-fc61-d6494e37705c@xen.org>
 <AM0PR08MB45305D27CA8353162445AE1EF7D09@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <14f9c89a-6eea-204e-cd1b-6bc1cca99716@xen.org>
 <AM0PR08MB4530E442D03BCD5520FEF3EBF7D19@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <6e96eaa7-a8a3-eaf3-ca44-3432c88e71d1@xen.org>
 <AM0PR08MB4530104B9B774F69B3713663F7D69@AM0PR08MB4530.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AM0PR08MB4530104B9B774F69B3713663F7D69@AM0PR08MB4530.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 02/02/2023 08:05, Penny Zheng wrote:
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: Thursday, February 2, 2023 3:27 AM
>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org
>> Cc: Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini
>> <sstabellini@kernel.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
>> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> Subject: Re: [PATCH v2 13/40] xen/mpu: introduce unified function
>> setup_early_uart to map early UART
>>
>>
>>
>> On 01/02/2023 05:36, Penny Zheng wrote:
>>> Hi Julien
>>
>> Hi Penny,
>>
> 
> Hi Julien,
>   
>>>
> [...]
>>>>> xen_mpumap[3] : Xen read-write data
>>>>> xen_mpumap[4] : Xen BSS
>>>>> xen_mpumap[5] : Xen static heap
>>>>> xen_mpumap[6] : Guest memory section
>>>>
>>>> Why do you need to map the "Guest memory section" for the idle vCPU?
>>>>
>>>
>>> Hmmm, "Guest memory section" here refers to *ALL* guest RAM address
>> range with only EL2 read/write access.
>>
>> For what purpose? Earlier, you said you had a setup with a limited number
>> of MPU entries. So it may not be possible to map all the guests RAM.
>>
> 
> The "Guest memory section" I referred here is the memory section defined in my new
> introducing device tree property, "mpu,guest-memory-section = <...>".  It will include
> "ALL" guest memory.
> 
> Let me find an example to illustrate why I introduced it and how it shall work:
> In MPU system, all guest RAM *MUST* be statically configured through "xen,static-mem" under domain node.
> We found that with more and more guests in,  the scattering of  "xen,static-mem" may
> exhaust MPU regions very quickly. TBH, at that time, I didn't figure out that I could map/unmap on demand.
> And in MMU system, We will never encounter this issue, setup_directmap_mappings will map the whole system
> RAM to the directmap area for Xen to access in EL2.
> So instead, "mpu,guest-memory-section" is introduced to limit the scattering and map in advance, we enforce
> users to ensure all guest RAM(through "xen,static-mem") must be included within "mpu,guest-memory-section".
> e.g.
> mpu,guest-memory-section = <0x0 0x20000000 0x0 0x40000000>;
> DomU1:
> xen,static-mem = <0x0 0x40000000 0x0 0x20000000>;
> DomU2:
> xen,static-mem = <0x0 0x20000000 0x0 0x20000000>;
> 
>> Xen should only need to access the guest memory in hypercalls and
>> scrubbing. In both cases you could map/unmap on demand.
>>
> 
> thanks for the explanation.
> In my understanding, during boot-up, there are two spots where Xen may touch the guest memory:
> one is that doing synchronous scrubbing in function unprepare_staticmem_pages.
> Another is coping and pasting kernel image to guest memory.
> In both cases, we could map/unmap on demand.
> And if you think map/unmap on demand is better than "mpu,guest-memory-section", I'll try to fix it in next serie

I think it would be better for a few reasons:
  1) You are making the assumption that all the RAM for the guests are 
contiguous. This may not be true for various reason (i.e. split bank...).
  2) It reduces the amount of work for the integrator
  3) You increase the defense in the hypervisor but it is more difficult 
to access the guest memory if there is a breakage

I don't expect major rework because you could plug the update to the MPU 
in map_domain_page().

>> I have looked at the code and this doesn't entirely answer my question.
>> So let me provide an example.
>>
>> Xen can print to the serial console at any time. So Xen should be able to
>> access the physical UART even when it has context switched to the guest
>> vCPU.
>>
> 
> I understand your concern on "device memory section" with your
> Example here. True, the current implementation is buggy.
> 
> Yes, if vpl011 is not enabled in guest and we instead passthrough a UART to
> guest, in current design, Xen is not able to access the physical UART on guest mode.

So all the guests are using the same UART?

Cheers,

-- 
Julien Grall

