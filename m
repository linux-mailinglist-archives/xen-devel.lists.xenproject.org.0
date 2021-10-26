Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C22C143B732
	for <lists+xen-devel@lfdr.de>; Tue, 26 Oct 2021 18:29:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.216552.376204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfPJi-0006n9-2N; Tue, 26 Oct 2021 16:28:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 216552.376204; Tue, 26 Oct 2021 16:28:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mfPJh-0006kR-Uv; Tue, 26 Oct 2021 16:28:49 +0000
Received: by outflank-mailman (input) for mailman id 216552;
 Tue, 26 Oct 2021 16:28:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mfPJg-0006js-JU
 for xen-devel@lists.xenproject.org; Tue, 26 Oct 2021 16:28:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mfPJg-0004fJ-1v; Tue, 26 Oct 2021 16:28:48 +0000
Received: from [54.239.6.189] (helo=[10.85.97.81])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mfPJf-0004uu-Rm; Tue, 26 Oct 2021 16:28:47 +0000
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
	bh=Bx6kGXQIsK0qjZ+q2P/KQ6fNZkeu0jChjmrlYC7CoC0=; b=1bRM97NQIsT4qqt1f3PVisLPAO
	h5hFBmKwYG2tv4/TyIg/5D22QpsqEdWoe8SJYFbdXb62gHihBRZuG9iWe1pMXOg5hEkf3jGKsr9GE
	PijrUSO7Vkshl1/w2XIMZ4XjirGVD8Rn0lSLXw29xVxjBhQuRAFdFNunUs6JmC9KAHYA=;
Message-ID: <e5632a4e-db98-41b4-1045-2b3532c098fa@xen.org>
Date: Tue, 26 Oct 2021 17:28:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [patch-4.16] arm/smmuv1,v2: Protect smmu master list with a lock
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com,
 Ian Jackson <iwj@xenproject.org>
References: <20211026122903.15042-1-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211026122903.15042-1-michal.orzel@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Michal,

On 26/10/2021 13:29, Michal Orzel wrote:
> If a device is added to SMMUv1/v2 from DT and PCI
> at the same time, there is a concurrent access
> to a smmu master list. This could lead to a
> scenario where one is looking into a list that
> is being modified at the same time. Add a lock
> to prevent this issue.

Did you intend to say "Hold" rather than "Add"?

> 
> Reuse the existing spinlock arm_smmu_devices_lock
> as it is already protecting find_smmu_master.
> 
> ipmmu-smmu and smmuv3 are not impacted by this
> issue as there is no access or modification of
> a global resource during add_device.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>
> ---
> This patch aims for 4.16 release.
> Benefits:
> Remove a bug that could lead to a corruption of the
> smmu master list, which would be very hard to debug.

 From my understanding, this corruption would only happen with 
CONFIG_HAS_PCI. At the moment, this is a experimental feature as it is 
not fully complete.

> Risks:
> Overall the risk is low as we are touching init code
> rather than a runtime one. In case of any issue, the
> problem would be catched during system boot or guest
> start.

With the PCI feature enabled, this can be called at runtime as this 
plumbed through a PHYSDEVOP. That said, it doesn't matter here as for 
supported code (platform/DT device), this will only happen during boot.

The patch looks straighforward, so I would not mind to have it in Xen 
4.16. Ian, what do you think?

> ---
>   xen/drivers/passthrough/arm/smmu.c | 25 +++++++++++++++++++------
>   1 file changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index c9dfc4caa0..be62a66a28 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -820,21 +820,25 @@ static int arm_smmu_dt_add_device_legacy(struct arm_smmu_device *smmu,
>   					 struct device *dev,
>   					 struct iommu_fwspec *fwspec)
>   {
> -	int i;
> +	int i, ret;
>   	struct arm_smmu_master *master;
>   	struct device_node *dev_node = dev_get_dev_node(dev);
>   
> +	spin_lock(&arm_smmu_devices_lock);
>   	master = find_smmu_master(smmu, dev_node);
>   	if (master) {
>   		dev_err(dev,
>   			"rejecting multiple registrations for master device %s\n",
>   			dev_node->name);
> -		return -EBUSY;
> +		ret = -EBUSY;
> +		goto out_unlock;
>   	}
>   
>   	master = devm_kzalloc(dev, sizeof(*master), GFP_KERNEL);
> -	if (!master)
> -		return -ENOMEM;
> +	if (!master) {
> +		ret = -ENOMEM;
> +		goto out_unlock;
> +	}
>   	master->of_node = dev_node;
>   
>   	/* Xen: Let Xen know that the device is protected by an SMMU */
> @@ -846,11 +850,17 @@ static int arm_smmu_dt_add_device_legacy(struct arm_smmu_device *smmu,
>   			dev_err(dev,
>   				"stream ID for master device %s greater than maximum allowed (%d)\n",
>   				dev_node->name, smmu->num_mapping_groups);
> -			return -ERANGE;
> +			ret = -ERANGE;
> +			goto out_unlock;
>   		}
>   		master->cfg.smendx[i] = INVALID_SMENDX;
>   	}
> -	return insert_smmu_master(smmu, master);
> +
> +	ret = insert_smmu_master(smmu, master);
> +
> +out_unlock:
> +	spin_unlock(&arm_smmu_devices_lock);

Please add a newline here.

> +	return ret;
>   }
>   
>   static int register_smmu_master(struct arm_smmu_device *smmu,
> @@ -2056,7 +2066,10 @@ static int arm_smmu_add_device(struct device *dev)
>   	} else {
>   		struct arm_smmu_master *master;
>   
> +		spin_lock(&arm_smmu_devices_lock);
>   		master = find_smmu_master(smmu, dev->of_node);
> +		spin_unlock(&arm_smmu_devices_lock);

At the moment, unlocking here is fine because we don't remove the 
device. However, there are a series to supporting removing a device (see 
[1]). So I think it would be preferable to unlock after the last use of 
'cfg'.

Looking at the code, I also noticed that the error path is not correct 
for at least the PCI device and we would leak memory. We also assume 
that Stream ID == Requester ID. Are both of them in your radar for PCI 
passthrough?

Cheers,

[1] 
https://lore.kernel.org/xen-devel/1630562763-390068-9-git-send-email-fnu.vikram@xilinx.com/

-- 
Julien Grall

