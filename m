Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A64C13EF0D4
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 19:22:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167982.306692 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mG2me-0004IP-Tl; Tue, 17 Aug 2021 17:21:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167982.306692; Tue, 17 Aug 2021 17:21:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mG2me-0004Gc-Qb; Tue, 17 Aug 2021 17:21:52 +0000
Received: by outflank-mailman (input) for mailman id 167982;
 Tue, 17 Aug 2021 17:21:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mG2md-0004GW-8z
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 17:21:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mG2md-0002f9-04; Tue, 17 Aug 2021 17:21:51 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mG2mc-0002JL-Pg; Tue, 17 Aug 2021 17:21:50 +0000
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
	bh=2JZdPGyyh5CI5AK4ag3uWk7fkcVlcYLk1ASCgdhk11g=; b=t3vQuPHXXZvfejSzNdLvBMrYJX
	oOEdGPawo0Y+2k6SfCboe6P04NhAUJOe14h55XouClLES7TmBBlE5WQ7/qY+zcdLucxmcTQoORHo1
	la8uozO0miL3i0+srO+KV9vWSplbHDWv/x25m9sKbF5+rQU1RcGwqDh0DZeLLKPHdkp8=;
Subject: Re: [PATCH] xen/arm: smmu: Set/clear IOMMU domain for device
To: Oleksandr Andrushchenko <andr2000@gmail.com>, sstabellini@kernel.org,
 Volodymyr_Babchuk@epam.com, xen-devel@lists.xenproject.org
Cc: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <20210811130356.1143743-1-andr2000@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c964783e-73ee-a971-58f2-e2bc4b78a5ff@xen.org>
Date: Tue, 17 Aug 2021 18:21:48 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210811130356.1143743-1-andr2000@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

Apologies for the late answer.

On 11/08/2021 14:03, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> When a device is assigned/de-assigned it is required to properly set
> IOMMU domain used to protect the device. This assignment was missing,
> thus it was not possible to de-assign the device:
> 
> (XEN) Deassigning device 0000:03:00.0 from dom2
> (XEN) smmu: 0000:03:00.0:  not attached to domain 2
> (XEN) d2: deassign (0000:03:00.0) failed (-3)
> 
> Fix this by assigning IOMMU domain on arm_smmu_assign_dev and reset it
> to NULL on arm_smmu_deassign_dev.
I think this was introduced by commit 06d1f7a278dd "xen/arm: smmuv1: 
Keep track of S2CR state". If so, please add:

Fixes: 06d1f7a278dd ("xen/arm: smmuv1: Keep track of S2CR state")

Looking at the commit message, the IOMMU domain used to be set/unset in 
arm_smmu_{attach, detach}_dev() but Linux drop it because they now rely 
in the core IOMMU framework to track the domain.

So I agree with the new position for...

> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
>   xen/drivers/passthrough/arm/smmu.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index c234ad9c7f1e..373d9d4d123a 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -2768,6 +2768,7 @@ static int arm_smmu_assign_dev(struct domain *d, u8 devfn,
>   			arm_smmu_destroy_iommu_domain(domain);
>   	} else {
>   		atomic_inc(&domain->ref);
> +		dev_iommu_domain(dev) = domain;

... this one. However...

>   	}
>   
>   out:
> @@ -2794,7 +2795,10 @@ static int arm_smmu_deassign_dev(struct domain *d, struct device *dev)
>   	atomic_dec(&domain->ref);
>   
>   	if (domain->ref.counter == 0)
> +	{
>   		arm_smmu_destroy_iommu_domain(domain);
> +		dev_iommu_domain(dev) = NULL;
> +	}

... I think this one is incorrect because you would only unset 
dev_iommu_domain() is the refcount drop to 0. You can have multiple 
device in the same domain, so the ref.counter may not be 0.

So I think this needs to be moved outside of the if. Note that it is 
also a good practice to remove any reference (e.g. set to NULL) before 
freeing even if it doesn't much matter here.

Lastly, the file is using the Linux coding style. So { needs to be on 
the same line as the if.

Cheers,

-- 
Julien Grall

