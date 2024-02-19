Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B979685AB98
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 19:54:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683066.1062399 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc8mE-0008WR-EY; Mon, 19 Feb 2024 18:54:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683066.1062399; Mon, 19 Feb 2024 18:54:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc8mE-0008Tn-BO; Mon, 19 Feb 2024 18:54:06 +0000
Received: by outflank-mailman (input) for mailman id 683066;
 Mon, 19 Feb 2024 18:54:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rc8mC-0008Tf-Lm
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 18:54:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rc8m7-0005D4-DZ; Mon, 19 Feb 2024 18:53:59 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rc8m7-0007N8-3G; Mon, 19 Feb 2024 18:53:59 +0000
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
	bh=6SriAx32xfN0JE6QolJyWzGOt83J/1pLDjR8pM5iAzc=; b=uaTK9AqEjUKXyHkcPHcnR9g5eA
	qzm97Ns0NIb7GIuFIBaXKcB0yVLum9Yk0a1tdqcFrmBwJkSK8fnPkT1xRhd9h3ZGcDKsWSB1oYgdH
	rYxlJsvmAThYTBIeXqw3a8OLN7wy0A/wd+JN+MsTH3RWWWS+nTZ0CPyFwgpebpqBKebs=;
Message-ID: <a11912c0-1135-4c0d-a5c1-d4396d5a4579@xen.org>
Date: Mon, 19 Feb 2024 18:53:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 7/7] xen/asm-generic: fold struct devarch into struct
 dev
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1708086091.git.oleksii.kurochko@gmail.com>
 <3a5bf394a9d95a28cecac996f6e0decb788c19fd.1708086092.git.oleksii.kurochko@gmail.com>
 <92e7c679-fbf5-4f2e-9b0d-ba61a198832c@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <92e7c679-fbf5-4f2e-9b0d-ba61a198832c@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 19/02/2024 11:26, Jan Beulich wrote:
> On 16.02.2024 13:39, Oleksii Kurochko wrote:
>> The current patch is a follow-up to the patch titled:
>>      xen/asm-generic: introduce generic device.h
>> Also, a prerequisite for this patch is, without which a compilation
>> error will occur:
>>      xen/arm: switch Arm to use asm-generic/device.h
>>
>> The 'struct dev_archdata' is exclusively used within 'struct device',
>> so it could be merged into 'struct device.'
>>
>> After the merger, it is necessary to update the 'dev_archdata()'
>> macros and the comments above 'struct arm_smmu_xen_device' in
>> drivers/passthrough/arm/smmu.c.
>> Additionally, it is required to update instances of
>> "dev->archdata->iommu" to "dev->iommu".
>>
>> Suggested-by: Julien Grall <julien@xen.org>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> ---
>>    This patch can be merged with patches 4 and 5 of this patch series.
>> ---
>> Changes in V9:
>>   - newly introduced patch.
>> ---
>>   xen/drivers/passthrough/arm/smmu.c | 12 ++++++------
>>   xen/include/asm-generic/device.h   |  8 +-------
>>   2 files changed, 7 insertions(+), 13 deletions(-)
>>
>> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
>> index 32e2ff279b..4a272c8779 100644
>> --- a/xen/drivers/passthrough/arm/smmu.c
>> +++ b/xen/drivers/passthrough/arm/smmu.c
>> @@ -227,9 +227,9 @@ struct arm_smmu_xen_domain {
>>   };
>>   
>>   /*
>> - * Xen: Information about each device stored in dev->archdata.iommu
>> + * Xen: Information about each device stored in dev->iommu
>>    *
>> - * Initially dev->archdata.iommu only stores the iommu_domain (runtime
>> + * Initially dev->iommu only stores the iommu_domain (runtime
>>    * configuration of the SMMU) but, on Xen, we also have to store the
>>    * iommu_group (list of streamIDs associated to the device).
>>    *
>> @@ -242,7 +242,7 @@ struct arm_smmu_xen_device {
>>   	struct iommu_group *group;
>>   };
>>   
>> -#define dev_archdata(dev) ((struct arm_smmu_xen_device *)dev->archdata.iommu)
>> +#define dev_archdata(dev) ((struct arm_smmu_xen_device *)dev->iommu)
> 
> I find in particular the naming here odd. But I'll let Julien judge whether
> this really is along the lines of what he suggested.

It is. The naming is not great, but the SMMU code is intended to stay 
close to Linux. So we want to do the minimum amount of change (at least 
until we decide we should diverge).

Cheers,

-- 
Julien Grall

