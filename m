Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 077BF5B023E
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 13:00:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401235.643038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVsmc-0003c1-9A; Wed, 07 Sep 2022 10:59:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401235.643038; Wed, 07 Sep 2022 10:59:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVsmc-0003Zr-5O; Wed, 07 Sep 2022 10:59:50 +0000
Received: by outflank-mailman (input) for mailman id 401235;
 Wed, 07 Sep 2022 10:59:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVsma-0003Zl-TE
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 10:59:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVsma-0003Ns-LY; Wed, 07 Sep 2022 10:59:48 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.17.46]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVsma-0004AC-FG; Wed, 07 Sep 2022 10:59:48 +0000
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
	bh=DwSWP9bKQIZQ/7Mt9ErlQ/vMBg/HCtrxWlPaHEVJu4Q=; b=EeNl6JFtw9tERJeNv35hqqUdg4
	IH2EcJiUgxmw1pEU4fSrPJNp3oalK+zHL56VvQeEF16UmhWCrUd+bOLdiHYhQJTJpESXubpd5GmV3
	YMgukggxbCVo7/EKD+KqMTjREocuorVv+83ZMjtjhSQoNCQ3mMyFligpYw8w8Xtr1+sY=;
Message-ID: <df7ce48f-097e-e30e-aefb-9aec253492a1@xen.org>
Date: Wed, 7 Sep 2022 11:59:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v3 3/4] xen/arm: mm: Rename xenheap_* variable to
 directmap_*
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220907083643.20152-1-Henry.Wang@arm.com>
 <20220907083643.20152-4-Henry.Wang@arm.com>
 <9234b0da-01c6-dafc-8e62-c7e497f8f146@xen.org>
 <AS8PR08MB799170866BCA3237738B4DE992419@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB799170866BCA3237738B4DE992419@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/09/2022 11:53, Henry Wang wrote:
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Subject: Re: [PATCH v3 3/4] xen/arm: mm: Rename xenheap_* variable to
>> directmap_*
>>
>> Hi Henry,
>>
>> On 07/09/2022 09:36, Henry Wang wrote:
>>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>>> index 7f5b317d3e..4a70ed2986 100644
>>> --- a/xen/arch/arm/mm.c
>>> +++ b/xen/arch/arm/mm.c
>>> @@ -132,12 +132,12 @@ uint64_t init_ttbr;
>>>    static paddr_t phys_offset;
>>>
>>>    /* Limits of the Xen heap */
>>> -mfn_t xenheap_mfn_start __read_mostly = INVALID_MFN_INITIALIZER;
>>> -mfn_t xenheap_mfn_end __read_mostly;
>>> -vaddr_t xenheap_virt_end __read_mostly;
>>> +mfn_t directmap_mfn_start __read_mostly = INVALID_MFN_INITIALIZER;
>>> +mfn_t directmap_mfn_end __read_mostly;
>>> +vaddr_t directmap_virt_end __read_mostly;
>>>    #ifdef CONFIG_ARM_64
>>> -vaddr_t xenheap_virt_start __read_mostly;
>>> -unsigned long xenheap_base_pdx __read_mostly;
>>> +vaddr_t directmap_virt_start __read_mostly;
>>> +unsigned long directmap_base_pdx __read_mostly;
>>>    #endif
>>>
>>>    unsigned long frametable_base_pdx __read_mostly;
>>> @@ -609,7 +609,7 @@ void __init setup_xenheap_mappings(unsigned
>> long base_mfn,
>>
>> I think the function also want to be renamed to match the code below.
> 
> Hmmm, renaming the name to "setup_directmap_mappings" would
> somehow lead me to think of we are getting rid of the name "xenheap"
> completely in the code, which seems a little bit scary to me...
> 
> But I just checked there is a comment
> "/* Set up the xenheap: up to 1GB of contiguous, always-mapped memory."
> above the function and the declaration so I guess we are fine?

We are not getting rid of "xenheap". In fact the common code will 
continue to use the concept.

What we make clear is this function is not only here to map the xenheap 
but other memory (e.g. static domain memory on arm64).

Cheers,

-- 
Julien Grall

