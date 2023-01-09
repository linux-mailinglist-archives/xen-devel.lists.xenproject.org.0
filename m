Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE2166227D
	for <lists+xen-devel@lfdr.de>; Mon,  9 Jan 2023 11:08:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473477.734109 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEp4A-0007uT-2K; Mon, 09 Jan 2023 10:07:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473477.734109; Mon, 09 Jan 2023 10:07:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEp49-0007s1-Vu; Mon, 09 Jan 2023 10:07:41 +0000
Received: by outflank-mailman (input) for mailman id 473477;
 Mon, 09 Jan 2023 10:07:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pEp49-0007rv-8t
 for xen-devel@lists.xenproject.org; Mon, 09 Jan 2023 10:07:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pEp48-0001lq-UR; Mon, 09 Jan 2023 10:07:40 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.1.158]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pEp48-0002mi-OT; Mon, 09 Jan 2023 10:07:40 +0000
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
	bh=k5BdFwjEDTMlEnnae9Dcz9y3S/+ffqN3Ib5N2Jhcr9Y=; b=ufQqEnTzUhf+V5fqms0QRn46Vz
	MfLbjmIZtZrmNFaqX9JFTw2fy0ZS/cSm7E+bXehMhQE4nTR61MpCsGJ+1G+Ew9KeoMcnbv83MEpxP
	pX/xSSN6MD+M5DTfktTCgMif8ynGsmYTUQCByTwqd+r3cJZM1Or9xLYP76dedIEPUwhk=;
Message-ID: <23983bc4-8868-dfed-d58d-ca6baa6d05d4@xen.org>
Date: Mon, 9 Jan 2023 10:07:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v1 05/13] xen/arm: allocate shared memory from heap when
 host address not provided
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221115025235.1378931-1-Penny.Zheng@arm.com>
 <20221115025235.1378931-6-Penny.Zheng@arm.com>
 <ff0870ab-d1b1-e029-26aa-c690063d348b@xen.org>
 <AM0PR08MB4530EC5FBFD2625E521AC067F7FE9@AM0PR08MB4530.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AM0PR08MB4530EC5FBFD2625E521AC067F7FE9@AM0PR08MB4530.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 09/01/2023 07:50, Penny Zheng wrote:
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: Sunday, January 8, 2023 8:23 PM
>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org
>> Cc: Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini
>> <sstabellini@kernel.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
>> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> Subject: Re: [PATCH v1 05/13] xen/arm: allocate shared memory from heap
>> when host address not provided
>>
>> Hi Penny,
>>
> 
> Hi Julien,
> 
>> On 15/11/2022 02:52, Penny Zheng wrote:
>>> when host address is not provided in "xen,shared-mem", we let Xen
>>> allocate requested shared memory from heap, and once the shared
>> memory
>>> is allocated, it will be marked as static(PGC_static), which means
>>> that it will be reserved as static memory, and will not go back to heap even
>> on freeing.
>>
>> Please don't move pages from the {xen,dom}heap to the static heap. If you
>> need to keep the pages for longer, then get an extra reference so they will
>> not be released.
>>
>>>
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>> ---
>>>    xen/arch/arm/domain_build.c | 83
>> ++++++++++++++++++++++++++++++++++++-
>>>    1 file changed, 82 insertions(+), 1 deletion(-)
>>>
>>> +static int __init allocate_shared_memory(struct shm_membank
>> *shm_membank,
>>> +                                         paddr_t psize) {
>>> +    struct meminfo *banks;
>>> +    int ret;
>>> +
>>> +    BUG_ON(shm_membank->mem.banks.meminfo != NULL);
>>> +
>>> +    banks = xmalloc_bytes(sizeof(struct meminfo));
>>
>> Where is this freed?
>>
> 
> These kinds of info will be only used in boot-time, so maybe I shall
> free them in init_done()?

I don't think you can free it in init_done() because we don't keep a 
pointer to kinfo past construct_dom*().

> Or just after process_shm() ?

This might work. But I think it would be better to avoid the dynamic 
memory allocation if we can.

Cheers,

-- 
Julien Grall

