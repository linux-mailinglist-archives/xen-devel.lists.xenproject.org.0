Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F00A5322E9
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 08:14:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336152.560486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntNmm-0002Eb-IV; Tue, 24 May 2022 06:12:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336152.560486; Tue, 24 May 2022 06:12:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntNmm-0002BQ-Ep; Tue, 24 May 2022 06:12:52 +0000
Received: by outflank-mailman (input) for mailman id 336152;
 Tue, 24 May 2022 06:12:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QgIG=WA=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1ntNml-0002BK-OE
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 06:12:51 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 8958a853-db28-11ec-bd2c-47488cf2e6aa;
 Tue, 24 May 2022 08:12:49 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B91B23A;
 Mon, 23 May 2022 23:12:48 -0700 (PDT)
Received: from [10.57.2.178] (unknown [10.57.2.178])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B07CC3F66F;
 Mon, 23 May 2022 23:12:46 -0700 (PDT)
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
X-Inumbo-ID: 8958a853-db28-11ec-bd2c-47488cf2e6aa
Message-ID: <a17db86e-9f15-93e9-492d-abdf3e5d6c3d@arm.com>
Date: Tue, 24 May 2022 08:12:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 13/16] xen/arm32: setup: Move out the code to populate the
 boot allocator
Content-Language: en-US
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220520120937.28925-1-julien@xen.org>
 <20220520120937.28925-14-julien@xen.org>
 <eda75863-018a-6dbd-8f75-837adaba71c1@arm.com>
 <d050d7f7-0efa-17f2-92a0-28085e42803a@xen.org>
From: Michal Orzel <michal.orzel@arm.com>
In-Reply-To: <d050d7f7-0efa-17f2-92a0-28085e42803a@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.05.2022 21:51, Julien Grall wrote:
> 
> 
> On 23/05/2022 08:28, Michal Orzel wrote:
>> Hi Julien,
> 
> Hi Michal,
> 
>>
>> On 20.05.2022 14:09, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> In a follow-up patch, we will want to populate the boot allocator
>>> separately for arm64. The code will end up to be very similar to the one
>>> on arm32. So move out the code in a new helper populate_boot_allocator().
>>>
>>> For now the code is still protected by CONFIG_ARM_32 to avoid any build
>>> failure on arm64.
>>>
>>> Take the opportunity to replace mfn_add(xen_mfn_start, xenheap_pages) with
>>> xenheap_mfn_end as they are equivalent.
>>>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>>
>>> ---
>>>
>>>      Changes in v4:
>>>          - Patch added
>>> ---
>>>   xen/arch/arm/setup.c | 90 +++++++++++++++++++++++++-------------------
>>>   1 file changed, 51 insertions(+), 39 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
>>> index d5d0792ed48a..3d5a2283d4ef 100644
>>> --- a/xen/arch/arm/setup.c
>>> +++ b/xen/arch/arm/setup.c
>>> @@ -637,10 +637,58 @@ static void __init init_staticmem_pages(void)
>>>   }
>>>     #ifdef CONFIG_ARM_32
>>> +/*
>>> + * Populate the boot allocator. All the RAM but the following regions
>>> + * will be added:
>>> + *  - Modules (e.g., Xen, Kernel)
>>> + *  - Reserved regions
>>> + *  - Xenheap
>>> + */
>>> +static void __init populate_boot_allocator(void)
>>> +{
>>> +    unsigned int i;
>> Shouldn't this be an int (as it was previously) because ...
>>> +    const struct meminfo *banks = &bootinfo.mem;
>>> +
>>> +    for ( i = 0; i < banks->nr_banks; i++ )
>> ... nr_banks is int ?
> 
> Hmmm... AFAIK banks->nr_banks never hold a negative value, so I am not sure why it was introduced as an "int".
> 
> Looking through the code, we seem to have a mix of "unsigned int" and "int". There seem to be less on the latter, so I have sent a patch to switch nr_banks to "unsigned int" [1].
That's great, thanks.

> 
> This is based on this series thought and I would like to keep the "unsigned int" here.
> 
>>
>> Apart from that:
>> Reviewed-by: Michal Orzel <michal.orzel@arm.com>
> 
> Thanks! Please let me know if this reviewed-by hold.
Definitely yes.
> 
> Cheers,
> 
> [1] https://lore.kernel.org/xen-devel/20220523194631.66262-1-julien@xen.org
> 

Cheers,
Michal

