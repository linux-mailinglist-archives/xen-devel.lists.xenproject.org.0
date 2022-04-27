Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A1B511CB1
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 19:43:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315345.533854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njlgV-0004Er-OQ; Wed, 27 Apr 2022 17:42:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315345.533854; Wed, 27 Apr 2022 17:42:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njlgV-0004Cd-LO; Wed, 27 Apr 2022 17:42:39 +0000
Received: by outflank-mailman (input) for mailman id 315345;
 Wed, 27 Apr 2022 17:42:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1njlgT-0004CX-Mt
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 17:42:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njlgT-0003CC-7c; Wed, 27 Apr 2022 17:42:37 +0000
Received: from [54.239.6.186] (helo=[192.168.24.58])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1njlgT-000293-1Y; Wed, 27 Apr 2022 17:42:37 +0000
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
	bh=ne/X0zk45QcRzwkhQqLIg+WefE/eqhKLkWfYqAnfwtA=; b=C6uy1phy/SoyqmfELC1F6IfgON
	VrwdW9uF7FnAouiTYFIFrfXt9mbXHsauCDo3TggvllucbQ/bZnb+CYwhiphfoIKOzoZgr2mR4AIFn
	FCRRC8URpDdN6oTaY3Pe1JYDMsiojp81I52KB2U8hESXOy+ER0hswUUZelqWQS+I47UQ=;
Message-ID: <0c6fd5db-ffc7-893a-1ad0-d54f3974a45a@xen.org>
Date: Wed, 27 Apr 2022 18:42:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.1
Subject: Re: [PATCH] xen/arm: smmuv1: remove iommu group when deassign a
 device
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <a19f7238f428deb610df643944f60e1e79e273cf.1651075797.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a19f7238f428deb610df643944f60e1e79e273cf.1651075797.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 27/04/2022 17:15, Rahul Singh wrote:
> When a device is deassigned from the domain it is required to remove the
> iommu group.

This read wrong to me. We should not need to re-create the IOMMU group 
(and call arm_smmu_add_device()) every time a device is re-assigned.

> 
> If we don't remove the group, the next time when we assign
> a device, SME and S2CR will not be setup correctly for the device
> because of that SMMU fault will be observed.

I think this is a bug fix for 0435784cc75dcfef3b5f59c29deb1dbb84265ddb. 
If so, please add a Fixes tag.

> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>   xen/drivers/passthrough/arm/smmu.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
> index 5cacb2dd99..9a31c332d0 100644
> --- a/xen/drivers/passthrough/arm/smmu.c
> +++ b/xen/drivers/passthrough/arm/smmu.c
> @@ -1690,6 +1690,8 @@ static void arm_smmu_detach_dev(struct iommu_domain *domain, struct device *dev)
>   	if (cfg)
>   		arm_smmu_master_free_smes(cfg);
>   
> +	iommu_group_put(dev_iommu_group(dev));
> +	dev_iommu_group(dev) = NULL;
>   }

The goal of arm_smmu_detach_dev() is to revert the change made in 
arm_smmu_attach_dev(). But looking at the code, neither the IOMMU group 
nor the smes are allocated in arm_smmu_attach_dev().

Are the SMES meant to be re-allocated everytime we assign to a different 
domain? If yes, the allocation should be done in arm_smmu_attach_dev().

If not, then we should not free the SMES here

IIUC, the SMES have to be re-allocated every time a device is assigned. 
Therefore, I think we should move the call to 
arm_smmu_master_alloc_smes() out of the detach callback and in a helper 
that would be used when removing a device (not yet supported by Xen).

Cheers,

-- 
Julien Grall

