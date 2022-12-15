Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E59EA64DD25
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 15:52:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463462.721645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5pZh-0004jf-A4; Thu, 15 Dec 2022 14:51:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463462.721645; Thu, 15 Dec 2022 14:51:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5pZh-0004hY-6o; Thu, 15 Dec 2022 14:51:05 +0000
Received: by outflank-mailman (input) for mailman id 463462;
 Thu, 15 Dec 2022 14:51:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p5pZf-0004hS-N4
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 14:51:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5pZf-00057T-BA; Thu, 15 Dec 2022 14:51:03 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224] helo=[10.85.36.201])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5pZf-0007a5-3c; Thu, 15 Dec 2022 14:51:03 +0000
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
	bh=YmCIpVKc7fi4ZHga/+XquMyjfPzK1KoRyfUUbE86DAs=; b=f2prPIepMRjmZjyMYxCvRzkYw6
	MGnVBZ9VFme0CLQBWxE2xislLPv20tZelaZ8qo2O9L8fvmMZSZbTEYAKpEXsCw3WjnQdb43oCiBHe
	IJWThjJ6m8LqhBr821Jf4F70IMH2kvakP0CHYZdXjqx9C79rTsasACdnt/rtMQ6SugeM=;
Message-ID: <16bf9934-1f50-4694-253c-32fa35f0b097@xen.org>
Date: Thu, 15 Dec 2022 14:51:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v2] xen/arm: smmuv3: mark arm_smmu_disable_pasid
 __maybe_unused
Content-Language: en-US
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221213181855.81713-1-stewart.hildebrand@amd.com>
 <423b32d1-90f1-2a0c-865c-24030a7dcdba@xen.org>
 <41f62567-b05a-26b7-ace1-21745d61b729@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <41f62567-b05a-26b7-ace1-21745d61b729@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stewart,

On 15/12/2022 14:11, Stewart Hildebrand wrote:
> On 12/15/22 06:34, Julien Grall wrote:
>> Hi Stewart,
>>
>> I was about to commit this patch when I noticed the placement of the
>> attribute doesn't match what we are usually doing in Xen.
>>
>> On 13/12/2022 18:18, Stewart Hildebrand wrote:
>>> When building with clang 12 and CONFIG_ARM_SMMU_V3=y, we observe the
>>> following build error:
>>>
>>> drivers/passthrough/arm/smmu-v3.c:1408:20: error: unused function 'arm_smmu_disable_pasid' [-Werror,-Wunused-function]
>>> static inline void arm_smmu_disable_pasid(struct arm_smmu_master *master) { }
>>>                      ^
>>>
>>> arm_smmu_disable_pasid is not currently called from anywhere in Xen, but
>>> it is inside a section of code guarded by CONFIG_PCI_ATS, which may be
>>> helpful in the future if the PASID feature is to be implemented. Add the
>>> attribute __maybe_unused to the function.
>>>
>>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
>>> ---
>>> v1->v2:
>>> Add __maybe_unused attribute instead of removing
>>> ---
>>>    xen/drivers/passthrough/arm/smmu-v3.c | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
>>> index 9c9f4630090e..0cdc862f96d1 100644
>>> --- a/xen/drivers/passthrough/arm/smmu-v3.c
>>> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
>>> @@ -1376,6 +1376,7 @@ static int arm_smmu_enable_pasid(struct arm_smmu_master *master)
>>>        return 0;
>>>    }
>>>
>>> +__maybe_unused
>>>    static void arm_smmu_disable_pasid(struct arm_smmu_master *master)
>>
>> The attribute should be placed after "void". I.e.:
>>
>> static void __maybe_unused arm_smmu_disable_pasid(...)
> 
> I had initially tried placing it exactly where you suggest in the first draft of v2 of this patch. However, the line would then exceed 72 characters (actual 81 characters):

This doesn't change the problem here but the limit is 80 characters per 
line rather than 72.

> 
> static void __maybe_unused arm_smmu_disable_pasid(struct arm_smmu_master *master)
> 
> So I found myself juggling with how best to wrap it. How about a newline after the __maybe_unused attribute?
> 
> static void __maybe_unused
> arm_smmu_disable_pasid(struct arm_smmu_master *master)
> 
> and similarly for the 2nd occurrence:
> 
> static inline void __maybe_unused
> arm_smmu_disable_pasid(struct arm_smmu_master *master) { }
> 
> There is precedent for this style of wrapping in xen/common/sched/credit2.c.

Ah! I didn't realize the line would have been too long. In this case, 
the newline after __maybe_unused is the way to go.

Cheers,

-- 
Julien Grall

