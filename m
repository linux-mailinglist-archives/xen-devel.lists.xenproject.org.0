Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0C45188EC
	for <lists+xen-devel@lfdr.de>; Tue,  3 May 2022 17:45:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319745.540106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nluhf-0006WF-EW; Tue, 03 May 2022 15:44:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319745.540106; Tue, 03 May 2022 15:44:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nluhf-0006TL-B5; Tue, 03 May 2022 15:44:43 +0000
Received: by outflank-mailman (input) for mailman id 319745;
 Tue, 03 May 2022 15:44:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nluhd-0006TC-VZ
 for xen-devel@lists.xenproject.org; Tue, 03 May 2022 15:44:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nluhd-00061t-FA; Tue, 03 May 2022 15:44:41 +0000
Received: from [54.239.6.185] (helo=[192.168.2.157])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nluhd-0000rp-94; Tue, 03 May 2022 15:44:41 +0000
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
	bh=9F7Xv3wLaFGv28kCjn9Bfk2xJDD+LTW1ZkZduRWOKTQ=; b=EWXSU5UfsHMw99AqntlX9d0o5m
	3VvvJmgdOR/qdaax/rXRWHXVF5vpG4uWHdq0Jfm50R+6QGK6MNvD+wpiygTaBv2r8HcnWzm+r9o0k
	3bpxi2RRWnnndZZOrmkxEvVero2zqzVqj6wHHl+KP93+tkCOJJa7L0VpAUfiz7dIojXc=;
Message-ID: <b6af8c10-9331-eec8-9a77-cd192829a6f2@xen.org>
Date: Tue, 3 May 2022 16:44:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH] xen/arm: smmuv1: remove iommu group when deassign a
 device
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <a19f7238f428deb610df643944f60e1e79e273cf.1651075797.git.rahul.singh@arm.com>
 <0c6fd5db-ffc7-893a-1ad0-d54f3974a45a@xen.org>
 <004BB439-72CA-4543-8CEA-C3BADC7D98CF@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <004BB439-72CA-4543-8CEA-C3BADC7D98CF@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 29/04/2022 15:33, Rahul Singh wrote:
> Hi Julien,

Hi Rahul,

>> On 27 Apr 2022, at 6:42 pm, Julien Grall <julien@xen.org> wrote:
>>
>> Hi,
>>
>> On 27/04/2022 17:15, Rahul Singh wrote:
>>> When a device is deassigned from the domain it is required to remove the
>>> iommu group.
>>
>> This read wrong to me. We should not need to re-create the IOMMU group (and call arm_smmu_add_device()) every time a device is re-assigned.
> Ok.
>>
>>> If we don't remove the group, the next time when we assign
>>> a device, SME and S2CR will not be setup correctly for the device
>>> because of that SMMU fault will be observed.
>>
>> I think this is a bug fix for 0435784cc75dcfef3b5f59c29deb1dbb84265ddb. If so, please add a Fixes tag.
> 
> Ok Let me add the Fixes tag in next version.
>>
>>> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
>>> ---
>>> xen/drivers/passthrough/arm/smmu.c | 2 ++
>>> 1 file changed, 2 insertions(+)
>>> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
>>> index 5cacb2dd99..9a31c332d0 100644
>>> --- a/xen/drivers/passthrough/arm/smmu.c
>>> +++ b/xen/drivers/passthrough/arm/smmu.c
>>> @@ -1690,6 +1690,8 @@ static void arm_smmu_detach_dev(struct iommu_domain *domain, struct device *dev)
>>> 	if (cfg)
>>> 		arm_smmu_master_free_smes(cfg);
>>> +	iommu_group_put(dev_iommu_group(dev));
>>> +	dev_iommu_group(dev) = NULL;
>>> }
>>
>> The goal of arm_smmu_detach_dev() is to revert the change made in arm_smmu_attach_dev(). But looking at the code, neither the IOMMU group nor the smes are allocated in arm_smmu_attach_dev().
>>
>> Are the SMES meant to be re-allocated everytime we assign to a different domain? If yes, the allocation should be done in arm_smmu_attach_dev().
> 
> Yes SMES have to be re-allocated every time a device is assigned.

Hmmmm.... Looking at the code, arm_smmu_alloc_smes() doesn't seem to use 
the domain information. So why would it need to be done every time it is 
assigned?

> 
> Is that okay if I will move the function arm_smmu_master_alloc_smes() from arm_smmu_add_device() to arm_smmu_attach_dev().
> In this case we don’t need to remove the IOMMU group and also arm_smmu_detach_dev() will also revert the  change made in arm_smmu_attach_dev().
> 
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index 5cacb2dd99..ff1b73d3d8 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -1680,6 +1680,10 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
>          if (!cfg)
>                  return -ENODEV;
>   
> +       ret = arm_smmu_master_alloc_smes(dev);
> +       if (ret)
> +               return ret;
> +
>          return arm_smmu_domain_add_master(smmu_domain, cfg);

If we go down this route, then you will likely need to revert the change 
made by arm_smmu_master_alloc_smes().

>   }
>   
> @@ -2075,7 +2079,7 @@ static int arm_smmu_add_device(struct device *dev)
>          iommu_group_add_device(group, dev);
>          iommu_group_put(group);
>   
> -       return arm_smmu_master_alloc_smes(dev);
> +       return 0;
>   }
> 
> Regards,
> Rahul
>>
>> If not, then we should not free the SMES here
>>
>> IIUC, the SMES have to be re-allocated every time a device is assigned. Therefore, I think we should move the call to arm_smmu_master_alloc_smes() out of the detach callback and in a helper that would be used when removing a device (not yet supported by Xen).
>>
>> Cheers,
>>
>> -- 
>> Julien Grall
> 

-- 
Julien Grall

