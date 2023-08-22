Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53643784AF2
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 22:01:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588720.920303 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYXYo-0004Ww-V9; Tue, 22 Aug 2023 20:01:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588720.920303; Tue, 22 Aug 2023 20:01:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYXYo-0004UN-S6; Tue, 22 Aug 2023 20:01:06 +0000
Received: by outflank-mailman (input) for mailman id 588720;
 Tue, 22 Aug 2023 20:01:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qYXYn-0004UH-1a
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 20:01:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYXYm-0005SK-Db; Tue, 22 Aug 2023 20:01:04 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYXYm-0005Gz-0F; Tue, 22 Aug 2023 20:01:04 +0000
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
	bh=KF0OuaUolrDrGVRKxbCjilaIPfcg+pmCUGAM4vgbmAQ=; b=CaVQQI6UfHhPnJllojnPldFVxu
	ALq60d94c+g1N97j3Ekqq1FgCczIZxeOK5Zs7vdRNn9u97t7MVRHZuOJmu2cJQg25mAi2W2744DdM
	F8098cbSdg/Ly0mEsTCQkkvkXWtxmf+gc2DYXUAeQpM1PrTIwytLT29r7kDTs+qn5wfc=;
Message-ID: <40bdb9a0-abaf-45af-92df-a64e6b4f2748@xen.org>
Date: Tue, 22 Aug 2023 21:01:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v9 11/19] xen/iommu: Introduce
 iommu_remove_dt_device()
Content-Language: en-GB
To: Vikram Garhwal <vikram.garhwal@amd.com>, xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, sstabellini@kernel.org, jbeulich@suse.com,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
 <20230819002850.32349-12-vikram.garhwal@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230819002850.32349-12-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 19/08/2023 01:28, Vikram Garhwal wrote:
> Remove master device from the IOMMU. This will be helpful when removing the
> overlay nodes using dynamic programming during run time.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> 
> ---
> Changes from v7:
>      Add check if IOMMU is enabled.
>      Fix indentation of fail.
> ---
> ---
>   xen/drivers/passthrough/device_tree.c | 44 +++++++++++++++++++++++++++
>   xen/include/xen/iommu.h               |  1 +
>   2 files changed, 45 insertions(+)
> 
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index 096ef2dd68..4cb32dc0b3 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -128,6 +128,50 @@ int iommu_release_dt_devices(struct domain *d)
>       return 0;
>   }
>   
> +int iommu_remove_dt_device(struct dt_device_node *np)
> +{
> +    const struct iommu_ops *ops = iommu_get_ops();
> +    struct device *dev = dt_to_dev(np);
> +    int rc;
> +
> +    if ( !iommu_enabled )
> +        return 1;

The caller doesn't seem to check if the error code is > 0. So can we 
instead return a -ERRNO?

If you want to continue to return a value > 0 then I think it should be 
documented in a comment like we did for iommu_add_dt_device().

> +
> +    if ( !ops )
> +        return -EOPNOTSUPP;
> +
> +    spin_lock(&dtdevs_lock);
> +
> +    if ( iommu_dt_device_is_assigned_locked(np) )
> +    {
> +        rc = -EBUSY;
> +        goto fail;
> +    }
> +
> +    /*
> +     * The driver which supports generic IOMMU DT bindings must have this
> +     * callback implemented.
> +     */

I have questioned this message in v7 and I still question it. I guess 
you copied the comment on top of add_device(), this was add there 
because we have a different way to add legacy device.

But here there are no such requirement. In fact, you are not adding the 
the callback to all the IOMMU drivers... Yet all of them support the 
generic IOMMU DT bindings.

> +    if ( !ops->remove_device )
> +    {
> +        rc = -EOPNOTSUPP;
> +        goto fail;
> +    }
> +
> +    /*
> +     * Remove master device from the IOMMU if latter is present and available.

I read this as this will not return an error if the device is protected. 
However, AFAICT, the implement in the SMMU driver provided in this 
series will return an error. So I would suggest to replace this sentence 
with:

de-register the device from the IOMMU driver.

> +     * The driver is responsible for removing is_protected flag.

Can you add an assert in the 'if ( !rc )' block to confirm that 
is_protected was effectively removed. Something like:

ASSERT(!dt_device_is_protected(dev));

This would help to confirm the driver is respecting what you expect.

> +     */
> +    rc = ops->remove_device(0, dev);
> +
> +    if ( !rc )
> +        iommu_fwspec_free(dev);
> +
> + fail:
> +    spin_unlock(&dtdevs_lock);
> +    return rc;
> +}
> +
>   int iommu_add_dt_device(struct dt_device_node *np)
>   {
>       const struct iommu_ops *ops = iommu_get_ops();
> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
> index 110693c59f..a8e9bc9a2d 100644
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -233,6 +233,7 @@ int iommu_add_dt_device(struct dt_device_node *np);
>   
>   int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>                          XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl);
> +int iommu_remove_dt_device(struct dt_device_node *np);
>   
>   #endif /* HAS_DEVICE_TREE */
>   

Cheers,

-- 
Julien Grall

