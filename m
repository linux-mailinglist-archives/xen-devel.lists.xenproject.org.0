Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0916B682894
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 10:19:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487462.755084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMmnU-0004jq-Vl; Tue, 31 Jan 2023 09:19:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487462.755084; Tue, 31 Jan 2023 09:19:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMmnU-0004gh-SE; Tue, 31 Jan 2023 09:19:24 +0000
Received: by outflank-mailman (input) for mailman id 487462;
 Tue, 31 Jan 2023 09:19:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pMmnT-0004gZ-A7
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 09:19:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMmnS-0005Vc-TP; Tue, 31 Jan 2023 09:19:22 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.14.74]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMmnS-0002S8-N9; Tue, 31 Jan 2023 09:19:22 +0000
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
	bh=IWtLm+5apAMskl5lwqIIWvgIeweGCvq3HPr7LSyV2yU=; b=Kn9uMvrWEHONvKbcgNW4Qu74CK
	MT4CmtvhnRXnsqvu1ASB73bPqwXxWWHklbrMmnQB7QN1AIUxuTFH7kKsRMyYM73zoKMus2P5+uZ3t
	O+ZI1sWru6V0fgQglD+ysPzO64egWdsbqS7va7oH+hZSEsApmxxXuYnn9XulwLYF1IIM=;
Message-ID: <ffa2c5e3-9dcb-eca1-fe3f-6ad4c7c83bae@xen.org>
Date: Tue, 31 Jan 2023 09:19:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 1/3] xen/arm: Add memory overlap check for
 bootinfo.reserved_mem
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Chen <Wei.Chen@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230130040535.188236-1-Henry.Wang@arm.com>
 <20230130040535.188236-2-Henry.Wang@arm.com>
 <fca91d3c-5d8a-3f7e-419a-a4c5208273dc@xen.org>
 <AS8PR08MB79910D7E3C7F32D8CDCB851092D09@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB79910D7E3C7F32D8CDCB851092D09@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 31/01/2023 02:25, Henry Wang wrote:
> Hi Julien,
> 
>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Subject: Re: [PATCH v3 1/3] xen/arm: Add memory overlap check for
>> bootinfo.reserved_mem
>>
>> Hi Henry,
>>
>>> +{
>>> +    paddr_t bank_start = INVALID_PADDR, bank_end = 0;
>>> +    paddr_t region_end = region_start + region_size;
>>> +    unsigned int i, bank_num = meminfo->nr_banks;
>>> +
>>> +    for ( i = 0; i < bank_num; i++ )
>>> +    {
>>> +        bank_start = meminfo->bank[i].start;
>>> +        bank_end = bank_start + meminfo->bank[i].size;
>>> +
>>> +        if ( region_end <= bank_start || region_start >= bank_end )
>>
>> ... it clearly shows how this check would be wrong when either the bank
>> or the region is at the end of the address space. You may say it doesn't
>> overlap when it could (e.g. when region_end < region_start).
> 
> Here do you mean if the region is at the end of the addr space,
> "region_start + region_end" will overflow and cause
> region_end < region_start? If so...

Yes.

> 
>>
>> That said, unless we rework 'bank', we would not properly solve the
>> problem. But that's likely a bigger piece of work and not something I
>> would request.
>>
>> So for now, I would suggest to add a comment. Stefano, what do you think?
> 
> ...I am not really sure if simply adding a comment here would help,
> because when the overflow happens, we are already doomed because
> of the messed-up device tree.

Not necessarily. This could happen if the region is right at the top of 
the address (e.g. finishing at 2^64 - 1). As the 'end' is exclusive, 
then it would be equal to 0.

I think this is less likely for arm64, but this could happen for 32-bit 
Arm as we will allow the admin to reduce paddr_t from 64-bit to 32-bit.

> 
> Would adding a `BUG_ON(region_end < region_start)` make sense to you?
No for the reason I stated above.

> 
>>
>>> +            continue;
>>> +        else
>>> +        {
>>> +            printk("Region: [%#"PRIpaddr", %#"PRIpaddr"] overlapping with
>> bank[%u]: [%#"PRIpaddr", %#"PRIpaddr"]\n",
>>
>> ']' usually mean inclusive. But here, 'end' is exclusive. So you want '['.
> 
> Oh, now I understand the misunderstanding in our communication in v1:
> I didn't know '[' means exclusive because I was educated to use ')' [1] so I
> thought you meant inclusive. Sorry for this.

No worries. That might be only me using [ and ) interchangeably :).

> 
> To keep consistency, may I use ')' here? Because I think this is the current
> way in the code base, for example see:
> xen/include/xen/numa.h L99: [*start, *end)
> xen/drivers/passthrough/amd/iommu_acpi.c L177: overlap [%lx,%lx)

I am fine with that.

>> BTW, the same comments applies for the second patch.
> 
> I will fix this patch and #2 in v4.

I am happy to deal with it on commit if you want.

Cheers,

-- 
Julien Grall

