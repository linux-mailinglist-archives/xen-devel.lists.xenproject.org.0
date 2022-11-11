Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CF3625707
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 10:41:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442390.696511 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otQWd-0001Mp-5e; Fri, 11 Nov 2022 09:40:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442390.696511; Fri, 11 Nov 2022 09:40:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otQWd-0001Kf-2t; Fri, 11 Nov 2022 09:40:39 +0000
Received: by outflank-mailman (input) for mailman id 442390;
 Fri, 11 Nov 2022 09:40:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1otQWb-0001KZ-QS
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 09:40:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1otQWb-0002aF-D7; Fri, 11 Nov 2022 09:40:37 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1otQWb-0002s4-61; Fri, 11 Nov 2022 09:40:37 +0000
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
	bh=+mUlFzNxdGf+4madsJO3GIwt3c6V3D8vy0iAY4rP9qY=; b=SKwXC3DSqRfMVPZWqsINMzq9iO
	ftTfEDI4SdOGpJvOiNPW3jm6gWaih1gFDXgJ2FgZC4Qpou4riByL6KtOCO3mKkMcO/bvaxRbq2HR7
	0dN9ucKvik3hgfTRIsNA9Q8AQYjfi8Y8x1Sox5n7k7CcyN+NrZ+iP+kd03g64sCzdKOw=;
Message-ID: <23b5f80f-c99c-5993-f940-11402bb98994@xen.org>
Date: Fri, 11 Nov 2022 09:40:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.1
Subject: Re: [PATCH v6 07/11] xen/arm: implement FIXMAP_ADDR for MPU systems
Content-Language: en-US
To: Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: nd <nd@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221104100741.2176307-1-wei.chen@arm.com>
 <20221104100741.2176307-8-wei.chen@arm.com>
 <db5667fc-ac64-411c-4011-dd4bbe25ad7e@xen.org>
 <PAXPR08MB7420B9D326528EC2D20FE47D9E3E9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <88350ef8-3f52-7535-b3e0-b2a76e8bc7de@xen.org>
 <PAXPR08MB7420AF1E44DF6FF39CD74B749E009@PAXPR08MB7420.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <PAXPR08MB7420AF1E44DF6FF39CD74B749E009@PAXPR08MB7420.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 11/11/2022 07:56, Wei Chen wrote:
> Hi Julien,
> 
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: 2022年11月10日 2:30
>> To: Wei Chen <Wei.Chen@arm.com>; xen-devel@lists.xenproject.org
>> Cc: nd <nd@arm.com>; Stefano Stabellini <sstabellini@kernel.org>; Bertrand
>> Marquis <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
>> <Volodymyr_Babchuk@epam.com>
>> Subject: Re: [PATCH v6 07/11] xen/arm: implement FIXMAP_ADDR for MPU
>> systems
>>
>>
>>
>> On 09/11/2022 06:46, Wei Chen wrote:
>>> Hi Julien,
>>
>> Hi Wei,
>>
>>>
>>>> -----Original Message-----
>>>> From: Julien Grall <julien@xen.org>
>>>> Sent: 2022年11月7日 3:45
>>>> To: Wei Chen <Wei.Chen@arm.com>; xen-devel@lists.xenproject.org
>>>> Cc: nd <nd@arm.com>; Stefano Stabellini <sstabellini@kernel.org>;
>> Bertrand
>>>> Marquis <Bertrand.Marquis@arm.com>; Volodymyr Babchuk
>>>> <Volodymyr_Babchuk@epam.com>
>>>> Subject: Re: [PATCH v6 07/11] xen/arm: implement FIXMAP_ADDR for MPU
>>>> systems
>>>>
>>>> Hi Wei,
>>>>
>>>> On 04/11/2022 10:07, Wei Chen wrote:
>>>>> FIXMAP is a special virtual address section for Xen to map some
>>>>> physical ram or device memory temporarily in initialization for
>>>>> MMU systems. FIXMAP_ADDR will return a virtual address by index
>>>>> for special purpose phys-to-virt mapping usage. For example,
>>>>> FIXMAP_ADDR(FIXMAP_CONSOLE) for early console mapping and
>>>>> FIXMAP_ADDR(FIXMAP_MISC) for copy_from_paddr.
>>>>
>>>> To me, we are bending quite a bit the definition of the fixmap. There
>>>> are not many use of the FIXMAP within the code and I think it would
>>>> simply be better to abstract the use (or removing it when possible) and
>>>> avoid defining FIXMAP_ADDR() & co for MPU.
>>>>
>>>
>>> I agree, if we don't mind to add some CONFIG_HAS_MPU in some generic
>> code.
>>
>> FAOD, this is not what I had in mind. Instead, it was to provide helper
>> which for !HAS_MPU would call fixmap and for HAS_MPU would do the work
>> to map the region in the MPU.
>>
> 
> Sorry, I am still confused about this comment, did you mean we can provider
> Some generic helpers like: early_map_console / eary_map_guest_memory.
> For non-MPU system, we still can call fixmap in these callers, but for
> MPU system, we have to map the region to MPU region?

Yes.

Cheers,

-- 
Julien Grall

