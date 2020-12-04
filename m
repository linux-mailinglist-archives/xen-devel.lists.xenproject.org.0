Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6F02CEA76
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 10:06:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44237.79327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl727-0000du-G8; Fri, 04 Dec 2020 09:05:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44237.79327; Fri, 04 Dec 2020 09:05:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kl727-0000dY-Cl; Fri, 04 Dec 2020 09:05:43 +0000
Received: by outflank-mailman (input) for mailman id 44237;
 Fri, 04 Dec 2020 09:05:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kl726-0000dT-0z
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 09:05:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kl724-0004XG-KS; Fri, 04 Dec 2020 09:05:40 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kl724-0000e0-F6; Fri, 04 Dec 2020 09:05:40 +0000
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
	bh=A/FoQA/sadJy6m4W7CwLip1NCAOD/yNDGZPhkRJBuRQ=; b=PtBcDVh3D2h2/ZKPr5mYzYBKeB
	qP6yRvbTZ0YxF8+OP4OxABWJh1kQZJXPKxods4ilhxw5xuCgdbF5oDAj1t0ZY47rxLxO05Dr6we2+
	CbHSXVK4a3jiazyBC1Inybgnp7sMHVZTh2P7eUxvIurUY4Mwk5vs5OH4/R1sptK5R4Sk=;
Subject: Re: [PATCH v2 7/8] xen/arm: Remove Linux specific code that is not
 usable in XEN
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1606406359.git.rahul.singh@arm.com>
 <1d9da8ed4845aeb9e86a5ce6750b811bd7e2020e.1606406359.git.rahul.singh@arm.com>
 <cd74f2a7-7836-ef90-9cd8-857068adb0f5@xen.org>
 <51C0C24A-3CE6-48A3-85F5-14F010409DC3@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b87e9293-77bb-2c43-63d0-8d54d5fc9a7e@xen.org>
Date: Fri, 4 Dec 2020 09:05:38 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <51C0C24A-3CE6-48A3-85F5-14F010409DC3@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Rahul,

On 03/12/2020 14:33, Rahul Singh wrote:
>> On 2 Dec 2020, at 2:45 pm, Julien Grall <julien@xen.org> wrote:
>>> -
>>> -static struct iommu_device *arm_smmu_probe_device(struct device *dev)
>>> -{
>>
>> Most of the code here looks useful to Xen. I think you want to keep the code and re-use it afterwards.
> 
> Ok. I removed the code here and added the XEN compatible code to add devices in next patch.
> I will keep it in this patch and will modifying the code to make XEN compatible.

In general, it is prefer if the code the code rather than dropping in 
patch A and then add it again differently patch B. This makes easier to 
check that the code outcome of the function is mostly the same.

>>> -static struct iommu_ops arm_smmu_ops = {
>>> -	.capable		= arm_smmu_capable,
>>> -	.domain_alloc		= arm_smmu_domain_alloc,
>>> -	.domain_free		= arm_smmu_domain_free,
>>> -	.attach_dev		= arm_smmu_attach_dev,
>>> -	.map			= arm_smmu_map,
>>> -	.unmap			= arm_smmu_unmap,
>>> -	.flush_iotlb_all	= arm_smmu_flush_iotlb_all,
>>> -	.iotlb_sync		= arm_smmu_iotlb_sync,
>>> -	.iova_to_phys		= arm_smmu_iova_to_phys,
>>> -	.probe_device		= arm_smmu_probe_device,
>>> -	.release_device		= arm_smmu_release_device,
>>> -	.device_group		= arm_smmu_device_group,
>>> -	.domain_get_attr	= arm_smmu_domain_get_attr,
>>> -	.domain_set_attr	= arm_smmu_domain_set_attr,
>>> -	.of_xlate		= arm_smmu_of_xlate,
>>> -	.get_resv_regions	= arm_smmu_get_resv_regions,
>>> -	.put_resv_regions	= generic_iommu_put_resv_regions,
>>> -	.pgsize_bitmap		= -1UL, /* Restricted during device attach */
>>> -};
>>> -
>>>   /* Probing and initialisation functions */
>>>   static int arm_smmu_init_one_queue(struct arm_smmu_device *smmu,
>>>   				   struct arm_smmu_queue *q,
>>> @@ -2406,7 +2032,6 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>>>   	switch (FIELD_GET(IDR0_STALL_MODEL, reg)) {
>>>   	case IDR0_STALL_MODEL_FORCE:
>>>   		smmu->features |= ARM_SMMU_FEAT_STALL_FORCE;
>>> -		fallthrough;
>>
>> We should keep all the fallthrough documented. So I think we want to introduce the fallthrough in Xen as well.
> 
> Ok I will keep fallthrough documented in this patch.
> 
> fallthrough implementation in XEN should be another patch. I am not sure when we can implement but we will try to implement.

Yes, I didn't ask to implement "fallthrough" in this patch, but instead 
as a pre-requirement patch.

I would implement it in include/xen/compiler.h.

Cheers,

-- 
Julien Grall

