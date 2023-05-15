Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 034857027D4
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 11:06:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534662.831898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyU9q-0004b7-ON; Mon, 15 May 2023 09:06:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534662.831898; Mon, 15 May 2023 09:06:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyU9q-0004Yb-Lh; Mon, 15 May 2023 09:06:18 +0000
Received: by outflank-mailman (input) for mailman id 534662;
 Mon, 15 May 2023 09:06:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pyU9p-0004YV-5Z
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 09:06:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pyU9o-0001vr-NQ; Mon, 15 May 2023 09:06:16 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.27.136]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pyU9o-0002fB-Hd; Mon, 15 May 2023 09:06:16 +0000
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
	bh=H0qhiCwgVN4xX6yrB482OoZ5Sd6rF4cYlo0mutjTYcM=; b=OMa7pPWGUmSTyVgZd4WWaGN4d3
	KiCn6NJFwVYxqfphDg1W/ti1FgUoyMXJuyF6G5GxHCMuOWxp4Gg/Ma3Y+Lo6bYPSpSlhM/hq1dMEf
	KvFPoSV4krx9M6fyDwMJCGpnTrXetz+4/4HQhNQ3VPbExom10KEIHrYm6JgqVOfEcOjE=;
Message-ID: <bfc634ce-43f9-2617-eee7-6ce8ab15b6b1@xen.org>
Date: Mon, 15 May 2023 10:06:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 2/2] xen/arm: smmuv3: Advertise coherent table walk if
 supported
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230512143535.29679-1-michal.orzel@amd.com>
 <20230512143535.29679-3-michal.orzel@amd.com>
 <dff8ab04-ae35-3a71-b923-abe722dcdb1c@xen.org>
 <f043c234-eb51-126f-1a1f-610796c203e8@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f043c234-eb51-126f-1a1f-610796c203e8@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 15/05/2023 10:03, Michal Orzel wrote:
> Hi Julien,

Hi Michal,

> 
> On 15/05/2023 10:56, Julien Grall wrote:
>>
>>
>> Hi,
>>
>> On 12/05/2023 15:35, Michal Orzel wrote:
>>> At the moment, even in case of a SMMU being I/O coherent, we clean the
>>> updated PT as a result of not advertising the coherency feature. SMMUv3
>>> coherency feature means that page table walks, accesses to memory
>>> structures and queues are I/O coherent (refer ARM IHI 0070 E.A, 3.15).
>>>
>>> Follow the same steps that were done for SMMU v1,v2 driver by the commit:
>>> 080dcb781e1bc3bb22f55a9dfdecb830ccbabe88
>>>
>>> The same restrictions apply, meaning that in order to advertise coherent
>>> table walk platform feature, all the SMMU devices need to report coherency
>>> feature. This is because the page tables (we are sharing them with CPU)
>>> are populated before any device assignment and in case of a device being
>>> behind non-coherent SMMU, we would have to scan the tables and clean
>>> the cache.
>>>
>>> It is to be noted that the SBSA/BSA (refer ARM DEN0094C 1.0C, section D)
>>> requires that all SMMUv3 devices support I/O coherency.
>>>
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>> ---
>>> There are very few platforms out there with SMMUv3 but I have never seen
>>> a SMMUv3 that is not I/O coherent.
>>> ---
>>>    xen/drivers/passthrough/arm/smmu-v3.c | 24 +++++++++++++++++++++++-
>>>    1 file changed, 23 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
>>> index bf053cdb6d5c..2adaad0fa038 100644
>>> --- a/xen/drivers/passthrough/arm/smmu-v3.c
>>> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
>>> @@ -2526,6 +2526,15 @@ static const struct dt_device_match arm_smmu_of_match[] = {
>>>    };
>>>
>>>    /* Start of Xen specific code. */
>>> +
>>> +/*
>>> + * Platform features. It indicates the list of features supported by all
>>> + * SMMUs. Actually we only care about coherent table walk, which in case of
>>> + * SMMUv3 is implied by the overall coherency feature (refer ARM IHI 0070 E.A,
>>> + * section 3.15 and SMMU_IDR0.COHACC bit description).
>>> + */
>>> +static uint32_t platform_features = ARM_SMMU_FEAT_COHERENCY;
>>
>> AFAICT, this variable is not meant to change after boot. So please add
>> the attribute __ro_after_init.
> Yes, that makes total sense. After probing this variable is not meant to be modified.
> Is it something that can be done on commit or would you want me to respin this patch?

I can do it on commit. With that:

Reviewed-by: Julien Grall <jgrall@amazon.com>


Cheers,

-- 
Julien Grall

