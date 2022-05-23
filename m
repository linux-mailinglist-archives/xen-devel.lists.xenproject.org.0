Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 833DC5315D3
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 21:51:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336070.560341 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntE5L-0002mx-SF; Mon, 23 May 2022 19:51:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336070.560341; Mon, 23 May 2022 19:51:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntE5L-0002kk-P6; Mon, 23 May 2022 19:51:23 +0000
Received: by outflank-mailman (input) for mailman id 336070;
 Mon, 23 May 2022 19:51:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ntE5K-0002kK-HB
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 19:51:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ntE5K-0007Cl-6M; Mon, 23 May 2022 19:51:22 +0000
Received: from [54.239.6.190] (helo=[192.168.27.218])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ntE5K-0008BN-01; Mon, 23 May 2022 19:51:22 +0000
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
	bh=3xvucrrkCcZAhvNjpP2wC+OQkX4sm9SUeF55V65PEuY=; b=2e6qTLSLGjPgC+hnfxd/WanEK9
	6gJ7iPQgfPuKnNfJd+U66ijBYutOyJ4XdigBhg/UX6y0zC39gTLgXdo9/zekWzCmfQIWCVbvum7NS
	GuAb46DDO9okK6t30KMIO3laT0XG8wccYSbYROWrXFmWix5WgbRjC26AgLothNFmkcao=;
Message-ID: <d050d7f7-0efa-17f2-92a0-28085e42803a@xen.org>
Date: Mon, 23 May 2022 20:51:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH 13/16] xen/arm32: setup: Move out the code to populate the
 boot allocator
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220520120937.28925-1-julien@xen.org>
 <20220520120937.28925-14-julien@xen.org>
 <eda75863-018a-6dbd-8f75-837adaba71c1@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <eda75863-018a-6dbd-8f75-837adaba71c1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 23/05/2022 08:28, Michal Orzel wrote:
> Hi Julien,

Hi Michal,

> 
> On 20.05.2022 14:09, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> In a follow-up patch, we will want to populate the boot allocator
>> separately for arm64. The code will end up to be very similar to the one
>> on arm32. So move out the code in a new helper populate_boot_allocator().
>>
>> For now the code is still protected by CONFIG_ARM_32 to avoid any build
>> failure on arm64.
>>
>> Take the opportunity to replace mfn_add(xen_mfn_start, xenheap_pages) with
>> xenheap_mfn_end as they are equivalent.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> ---
>>
>>      Changes in v4:
>>          - Patch added
>> ---
>>   xen/arch/arm/setup.c | 90 +++++++++++++++++++++++++-------------------
>>   1 file changed, 51 insertions(+), 39 deletions(-)
>>
>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>> index d5d0792ed48a..3d5a2283d4ef 100644
>> --- a/xen/arch/arm/setup.c
>> +++ b/xen/arch/arm/setup.c
>> @@ -637,10 +637,58 @@ static void __init init_staticmem_pages(void)
>>   }
>>   
>>   #ifdef CONFIG_ARM_32
>> +/*
>> + * Populate the boot allocator. All the RAM but the following regions
>> + * will be added:
>> + *  - Modules (e.g., Xen, Kernel)
>> + *  - Reserved regions
>> + *  - Xenheap
>> + */
>> +static void __init populate_boot_allocator(void)
>> +{
>> +    unsigned int i;
> Shouldn't this be an int (as it was previously) because ...
>> +    const struct meminfo *banks = &bootinfo.mem;
>> +
>> +    for ( i = 0; i < banks->nr_banks; i++ )
> ... nr_banks is int ?

Hmmm... AFAIK banks->nr_banks never hold a negative value, so I am not 
sure why it was introduced as an "int".

Looking through the code, we seem to have a mix of "unsigned int" and 
"int". There seem to be less on the latter, so I have sent a patch to 
switch nr_banks to "unsigned int" [1].

This is based on this series thought and I would like to keep the 
"unsigned int" here.

> 
> Apart from that:
> Reviewed-by: Michal Orzel <michal.orzel@arm.com>

Thanks! Please let me know if this reviewed-by hold.

Cheers,

[1] https://lore.kernel.org/xen-devel/20220523194631.66262-1-julien@xen.org

-- 
Julien Grall

