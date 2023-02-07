Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F80468D195
	for <lists+xen-devel@lfdr.de>; Tue,  7 Feb 2023 09:41:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.490925.759832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPJXZ-0000ST-Bf; Tue, 07 Feb 2023 08:41:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 490925.759832; Tue, 07 Feb 2023 08:41:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pPJXZ-0000Qm-7Y; Tue, 07 Feb 2023 08:41:25 +0000
Received: by outflank-mailman (input) for mailman id 490925;
 Tue, 07 Feb 2023 08:41:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pPJXX-0000Qg-Ix
 for xen-devel@lists.xenproject.org; Tue, 07 Feb 2023 08:41:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pPJXX-0003TC-6z; Tue, 07 Feb 2023 08:41:23 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pPJXX-0007W4-1E; Tue, 07 Feb 2023 08:41:23 +0000
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
	bh=NMGu9IlDm6SJdAa7XdU6aw2VhY12g264AbakLErmg7w=; b=odiPZuUCsu/vktmJMcyOFn1SJO
	pJUqSscJtDTUTIvXAhopzNjNNUxQRmkXFyi4OwBzQl2wYlr1kSjEsTi2ieNwxF6LhLA9NrQSUc3zg
	eQHnIUVeqo+R7Dj57qmPkBPGQsHZqjE7chgYH1v/eoo3G9X3vSJckq0kJW2yUzXJ6LIY=;
Message-ID: <3c4b0308-1042-b21c-e558-5bbf7bd34757@xen.org>
Date: Tue, 7 Feb 2023 08:41:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [PATCH v2 15/40] xen/arm: move MMU-specific memory management
 code to mm_mmu.c/mm_mmu.h
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-16-Penny.Zheng@arm.com>
 <6aebebad-2b01-4bd6-8a2f-7be3591382d8@xen.org>
 <AM0PR08MB4530246ADCB77E67CB5AB1B3F7DB9@AM0PR08MB4530.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AM0PR08MB4530246ADCB77E67CB5AB1B3F7DB9@AM0PR08MB4530.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/02/2023 03:59, Penny Zheng wrote:
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: Monday, February 6, 2023 5:30 AM
>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org
>> Cc: Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini
>> <sstabellini@kernel.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
>> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> Subject: Re: [PATCH v2 15/40] xen/arm: move MMU-specific memory
>> management code to mm_mmu.c/mm_mmu.h
>>
>> Hi,
>>
>> On 13/01/2023 05:28, Penny Zheng wrote:
>>> From: Wei Chen <wei.chen@arm.com>
>>>
>>> To make the code readable and maintainable, we move MMU-specific
>>> memory management code from mm.c to mm_mmu.c and move MMU-
>> specific
>>> definitions from mm.h to mm_mmu.h.
>>> Later we will create mm_mpu.h and mm_mpu.c for MPU-specific memory
>>> management code.
>>
>> This sentence implies there is no mm_mpu.{c, h} yet and this is not touched
>> within this patch. However...
>>
>>
>>> This will avoid lots of #ifdef in memory management code and header files.
>>>
>>> Signed-off-by: Wei Chen <wei.chen@arm.com>
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>> ---
>>>    xen/arch/arm/Makefile             |    5 +
>>>    xen/arch/arm/include/asm/mm.h     |   19 +-
>>>    xen/arch/arm/include/asm/mm_mmu.h |   35 +
>>>    xen/arch/arm/mm.c                 | 1352 +---------------------------
>>>    xen/arch/arm/mm_mmu.c             | 1376
>> +++++++++++++++++++++++++++++
>>>    xen/arch/arm/mm_mpu.c             |   67 ++
>>
>> ... It looks like they already exists and you are modifying them. That
>> said, it would be better if this patch only contains code movement (IOW
>> no MPU changes).
>>
>>>    6 files changed, 1488 insertions(+), 1366 deletions(-)
>>>    create mode 100644 xen/arch/arm/include/asm/mm_mmu.h
>>>    create mode 100644 xen/arch/arm/mm_mmu.c
>>
>> I don't particular like the naming. I think it would make more sense to
>> introduce two directories: "mmu" and "mpu" which includes code specific
>> to each flavor of Xen.
>>
> [...]
>>>
>>> -
>>> -/* Release all __init and __initdata ranges to be reused */
>>> -void free_init_memory(void)
>>
>> This function doesn't look specific to the MMU.
>>
> 
> Functions like, early_fdt_map[1] / setup_frametable_mappings[2] / free_init_memory [3] ...

I looked at setup_frametable_mappings() and didn't think it was possible 
to share much code. But I agree for early_fdt_map and free_init_memory().

> they both share quite the same logic as MMU does in MPU system, the difference could only
> be address translation regime. Still, in order to avoid putting too much #ifdef here and there,
> I implement different MMU and MPU version of them.

I am not sure why you would need to put #ifdef in the code. Looking at 
it, there is usually only a chunk that is different for the mapping. So 
you could provide an helper that will be implemented in the MMU/MPU code.

>   
> Or I keep them in generic file here, then in future commits when we implement MPU version
> of them(I list related commits below), I transfer them to MMU file there.

I am not entirely sure. In one way it help to figure out the commonality 
but on the other way we are mixing code movement and new code.

In this case, the code movement would probably small, so that might be 
better for the review.

Cheers,

-- 
Julien Grall

