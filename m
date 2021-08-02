Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 102093DDBDB
	for <lists+xen-devel@lfdr.de>; Mon,  2 Aug 2021 17:06:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.163133.298910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAZVJ-00084N-TJ; Mon, 02 Aug 2021 15:05:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 163133.298910; Mon, 02 Aug 2021 15:05:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mAZVJ-00081I-Q5; Mon, 02 Aug 2021 15:05:21 +0000
Received: by outflank-mailman (input) for mailman id 163133;
 Mon, 02 Aug 2021 15:05:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mAZVI-00081C-4T
 for xen-devel@lists.xenproject.org; Mon, 02 Aug 2021 15:05:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mAZVF-0000mT-35; Mon, 02 Aug 2021 15:05:17 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mAZVE-00035E-Sl; Mon, 02 Aug 2021 15:05:17 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=JTivbjtnl10q1/JwJkOBAffOInXla3TiITWSZ3ND+E8=; b=07FkTglVkyos7bgDhFF9qAvgb0
	RpOcGLOvuWwfCK/OXlUeyu0KzDpn96f8VieO86xp64ZvjZncE7SlYbIxqaODkqj4+eFH+9hcv3c3B
	eTYHhXjkCwOMRlnlQ9SPGVlt1imkhpgAy7w4ihZCzq33v4odxY9tR8hrBGDgiEHeZWf0=;
Subject: Re: [PATCH v5 2/4] xen: do not return -EEXIST if iommu_add_dt_device
 is called twice
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Bertrand.Marquis@arm.com,
 Volodymyr_Babchuk@epam.com, rahul.singh@arm.com, brian.woods@xilinx.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.21.2107221634130.10122@sstabellini-ThinkPad-T480s>
 <20210722233642.22515-2-sstabellini@kernel.org>
 <acd7e7b6-7c2b-24d5-da80-042396aee5e8@xen.org>
 <alpine.DEB.2.21.2107231043230.10122@sstabellini-ThinkPad-T480s>
 <aa7be3ad-8cbe-a187-3ebc-e1c5d2d11091@xen.org>
 <alpine.DEB.2.21.2107301444100.10122@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien@xen.org>
Message-ID: <427e6a82-7480-2cb6-9e83-f848f9caa218@xen.org>
Date: Mon, 2 Aug 2021 16:05:14 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2107301444100.10122@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 30/07/2021 22:57, Stefano Stabellini wrote:
> On Mon, 26 Jul 2021, Julien Grall wrote:
>> Hi Stefano,
>>
>> On 23/07/2021 21:16, Stefano Stabellini wrote:
>>> On Fri, 23 Jul 2021, Julien Grall wrote:
>>>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>>>> ---
>>>>> Changes in v5:
>>>>> - new patch
>>>>> ---
>>>>>     xen/drivers/passthrough/device_tree.c | 9 +++++++--
>>>>>     1 file changed, 7 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/xen/drivers/passthrough/device_tree.c
>>>>> b/xen/drivers/passthrough/device_tree.c
>>>>> index 999b831d90..32526ecabb 100644
>>>>> --- a/xen/drivers/passthrough/device_tree.c
>>>>> +++ b/xen/drivers/passthrough/device_tree.c
>>>>> @@ -140,8 +140,13 @@ int iommu_add_dt_device(struct dt_device_node *np)
>>>>>         if ( !ops )
>>>>>             return -EINVAL;
>>>>>     +    /*
>>>>> +     * Some Device Trees may expose both legacy SMMU and generic
>>>>> +     * IOMMU bindings together. If both are present, the device
>>>>> +     * can be already added.
>>>>
>>>> Wouldn't this also happen when there is just generic bindings? If so,
>>>> shouldn't this patch be first in the series to avoid breaking bisection?
>>>
>>> No, both need to be present; if there is just the generic bindings we
>>> don't need this change. I can still move it to the beginning of the
>>> series anyway if you prefer.
>>
>> Sorry but I am having some trouble to understand why this is not a problem for
>> just the legacy binding.
>>
>> If I look at patch #1, the dev->iommu_fspec will be allocated in
>> register_smmu_master(). If I am not mistaken, this is called when the SMMU is
>> initialized.
>>
>> So the call to iommu_add_dt_device() in handle_device() should return -EEXIST
>> (dev_iommu_fwspec_get() will return a non-NULL pointer).
>>
>> What did I miss?
> 
> I checked. It is true that we need this check with the legacy bindings,
> even when alone.
> 
> Like you said, dev->iommu_fspec is allocated early by
> register_smmu_master. Then, handle_device, or handle_passthrough_prop
> for dom0less guests, calls iommu_add_dt_device a second time.
> 
> On the other hand with only the generic bindings register_smmu_master
> doesn't call iommu_add_dt_device, so iommu_add_dt_device is called only
> once by handle_device or handle_passthrough_prop. >
> 
> The comment I proposed is not correct. What about this one?
> 
>      /*
>       * In case of legacy SMMU bindings, register_smmu_master might have
>       * already initialized struct iommu_fwspec for this device.
>       */
As I may have mentionned in a previous version of the series, this check 
is not specific to the SMMU. We also need it for other cases (e.g. when 
the device is (re-)assigned to a guest).

So I think a specialized comment is unsuitable here. Instead, we should 
provide a generic comment. Something like:

/*
  * The device may already have been registered. As there is no harm in
  * it just return success early.
  */

Cheers,

-- 
Julien Grall

