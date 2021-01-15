Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C482F79BD
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jan 2021 13:40:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.68055.121747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0OOr-0006EP-QW; Fri, 15 Jan 2021 12:40:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 68055.121747; Fri, 15 Jan 2021 12:40:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l0OOr-0006Dz-NA; Fri, 15 Jan 2021 12:40:21 +0000
Received: by outflank-mailman (input) for mailman id 68055;
 Fri, 15 Jan 2021 12:40:19 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l0OOp-0006Do-Ex
 for xen-devel@lists.xenproject.org; Fri, 15 Jan 2021 12:40:19 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l0OOl-0003UO-GV; Fri, 15 Jan 2021 12:40:15 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l0OOl-0006FD-Ai; Fri, 15 Jan 2021 12:40:15 +0000
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
	bh=MKcTFgXcViIPgiQo+NyDCsS1iE1yk1ueRQRnxR9I5gw=; b=6CIihiQj9LmFGWa9+6GBwz7G8g
	8Cqtq9PnzLD56lVUfyXfbsSOREa4o1hOOh8vkqpUeWV21AGyKVFQUwLzeb07H0F8snEWPlf3S+3g8
	QQ0sANtmXIYChgnFQgJRKI6b9iQmJX9pKGWk45HGkmbFEVcD0nypCQIAxI1oZcIM5JzM=;
Subject: Re: [PATCH v4 11/11] xen/arm: smmuv3: Add support for SMMUv3 driver
To: Rahul Singh <Rahul.Singh@arm.com>, Oleksandr <olekstysh@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1610115608.git.rahul.singh@arm.com>
 <9ba174516e01e2a53390420fa957ea563219141f.1610115608.git.rahul.singh@arm.com>
 <7762de2c-da11-5643-8f70-fdd87a7583eb@gmail.com>
 <A92B97AF-953C-4523-A438-CED1D8C1F1AC@arm.com>
 <3485d705-9063-59b9-f282-9661883265f3@gmail.com>
 <2AAC732A-5407-4B6B-ABFC-BA3914FB1DA1@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <41388c13-e30a-1626-c8f4-cfcec6a8244e@xen.org>
Date: Fri, 15 Jan 2021 12:40:13 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <2AAC732A-5407-4B6B-ABFC-BA3914FB1DA1@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 15/01/2021 12:38, Rahul Singh wrote:
> Hello Oleksandr,
> 
>> On 12 Jan 2021, at 8:59 pm, Oleksandr <olekstysh@gmail.com> wrote:
>>
>>
>> On 12.01.21 11:41, Rahul Singh wrote:
>>
>> Hi Rahul
>>
>>
>>>
>>>>>   -static int arm_smmu_of_xlate(struct device *dev, struct of_phandle_args *args)
>>>>> +static int arm_smmu_dt_xlate(struct device *dev,
>>>>> +				const struct dt_phandle_args *args)
>>>>>   {
>>>>> -	return iommu_fwspec_add_ids(dev, args->args, 1);
>>>>> +	int ret;
>>>>> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>>>> Please bear in mind I am not familiar with the SMMU, but don't we need to perform a some kind
>>>> of sanity check of passed DT IOMMU specifier here?
>>> I checked the code follow we will never hit the dt_xlate without IOMMU specifier but anyway I will add the sanity check.
>> By sanity check I meant to make sure that device ID (stream ID) is in allowed range (of course, if this is relevant for SMMU).
>> For example, for IPMMU-VMSA we have a check that device ID (uTLB) is less than max uTLB number.
> 
> Sorry I misunderstood your previous comments. Yes SMMUv3 driver is performing the sanity check for Stream Id before configuring the hardware in function arm_smmu_sid_in_range().
>>
>>>   
>>>
>>>>> +
>>>>> +static int arm_smmu_iommu_xen_domain_init(struct domain *d)
>>>>> +{
>>>>> +	struct arm_smmu_xen_domain *xen_domain;
>>>>> +
>>>>> +	xen_domain = xzalloc(struct arm_smmu_xen_domain);
>>>>> +	if (!xen_domain)
>>>>> +		return -ENOMEM;
>>>>> +
>>>>> +	spin_lock_init(&xen_domain->lock);
>>>>> +	INIT_LIST_HEAD(&xen_domain->contexts);
>>>>> +
>>>>> +	dom_iommu(d)->arch.priv = xen_domain;
>>>>> +	return 0;
>>>>> +
>>>>> +}
>>>>> +
>>>>> +static void __hwdom_init arm_smmu_iommu_hwdom_init(struct domain *d)
>>>>> +{
>>>> Both SMMUv2 and IPMMU perform some actions here. Any reason we don't need to do the same here?
>>>>
>>>>      /* Set to false options not supported on ARM. */
>>>>      if ( iommu_hwdom_inclusive )
>>>>          printk(XENLOG_WARNING
>>>>          "map-inclusive dom0-iommu option is not supported on ARM\n");
>>>>      iommu_hwdom_inclusive = false;
>>>>      if ( iommu_hwdom_reserved == 1 )
>>>>          printk(XENLOG_WARNING
>>>>          "map-reserved dom0-iommu option is not supported on ARM\n");
>>>>      iommu_hwdom_reserved = 0;
>>>>
>>>>      arch_iommu_hwdom_init(d);
>>> I will add the above code for SMMUv3 also.
>>
>> Great.
>>
>> I was thinking about it, this is the third IOMMU driver on Arm which has to disable the _same_ unsupported options, probably this code wants to be folded in arch_iommu_hwdom_init() to avoid duplication?
> 
> Yes I also agree with you to avoid duplication we can move the come code to the function arch_iommu_hwdom_init().
> I will submit the patch(not part of this series)  if everyone is ok to move the common code to arch_iommu_hwdom_init().

+1 on a follow-up.

Cheers,

-- 
Julien Grall

