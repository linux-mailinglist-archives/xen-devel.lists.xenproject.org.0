Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 912782CBFEA
	for <lists+xen-devel@lfdr.de>; Wed,  2 Dec 2020 15:40:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.42779.76988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkTIa-000327-E4; Wed, 02 Dec 2020 14:40:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 42779.76988; Wed, 02 Dec 2020 14:40:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkTIa-0002zx-Ax; Wed, 02 Dec 2020 14:40:04 +0000
Received: by outflank-mailman (input) for mailman id 42779;
 Wed, 02 Dec 2020 14:40:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1kkTIX-0002eh-TN
 for xen-devel@lists.xenproject.org; Wed, 02 Dec 2020 14:40:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kkTIX-0003A7-I1; Wed, 02 Dec 2020 14:40:01 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kkTIX-00031E-Af; Wed, 02 Dec 2020 14:40:01 +0000
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
	bh=+hRPY9g6YRAHj9s3GL8eUWDrrun+ZidHmmbIACfNpS8=; b=u1zcfHICyNIyvWtZUuBx2wgRc/
	s0O9aNWb1zYdImVmytsJtRJz3TDWxJvumQi21j7fauxpUzOWx4X/KconPnZL0F2AD8OydVNMz+b+4
	P1ZqXYnDqxzJXp5IOSQ2aWOozkGviOLNNLzG6dFP3oIdjWGUMiCkgbeVrLA2k0G2zs60=;
Subject: Re: [PATCH v2 7/8] xen/arm: Remove Linux specific code that is not
 usable in XEN
To: Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1606406359.git.rahul.singh@arm.com>
 <1d9da8ed4845aeb9e86a5ce6750b811bd7e2020e.1606406359.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2012011724350.1100@sstabellini-ThinkPad-T480s>
 <804B8C95-FF10-4FE5-AC82-9959EC9B8041@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <ad58e8e3-2e50-b355-9d6a-d6b8313aaee2@xen.org>
Date: Wed, 2 Dec 2020 14:39:59 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <804B8C95-FF10-4FE5-AC82-9959EC9B8041@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Rahul,

On 02/12/2020 14:34, Rahul Singh wrote:
>>> 	dev_info(smmu->dev, "ias %lu-bit, oas %lu-bit (features 0x%08x)\n",
>>> @@ -2595,9 +2208,6 @@ static int arm_smmu_device_dt_probe(struct platform_device *pdev,
>>>
>>> 	parse_driver_options(smmu);
>>>
>>> -	if (of_dma_is_coherent(dev->of_node))
>>> -		smmu->features |= ARM_SMMU_FEAT_COHERENCY;
>>> -
>>
>> Why this change? The ARM_SMMU_FEAT_COHERENCY flag is still used in
>> arm_smmu_device_hw_probe.
> 
> I remove this as this is linux specific.  I will remove ARM_SMMU_FEAT_COHERENCY flag  used in arm_smmu_device_hw_probe

 From my understanding, ARM_SMMU_FEAT_COHERENCY indicate whether the 
SMMU page table walker will snoop the cache. If the flag is not set, 
then Xen will have to clean to PoC every entry updated in the p2m.

Therefore, I think we need to keep this code.

In the case we don't need to keep the code, then I think the reason 
should be explained in the commit message.

Cheers,

-- 
Julien Grall

