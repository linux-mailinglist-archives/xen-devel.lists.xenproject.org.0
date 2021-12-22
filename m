Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E0447D3D2
	for <lists+xen-devel@lfdr.de>; Wed, 22 Dec 2021 15:38:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250862.432079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n02kr-0003bE-Lh; Wed, 22 Dec 2021 14:38:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250862.432079; Wed, 22 Dec 2021 14:38:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n02kr-0003ZR-Ij; Wed, 22 Dec 2021 14:38:09 +0000
Received: by outflank-mailman (input) for mailman id 250862;
 Wed, 22 Dec 2021 14:38:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1n02kp-0003ZF-W2
 for xen-devel@lists.xenproject.org; Wed, 22 Dec 2021 14:38:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n02kp-00063L-3e; Wed, 22 Dec 2021 14:38:07 +0000
Received: from [54.239.6.186] (helo=[192.168.17.226])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n02ko-0001nH-Ph; Wed, 22 Dec 2021 14:38:07 +0000
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
	bh=iD+TxZTPLwePxNCkGIS+ksoL7XbZgEjCVRb/1sKrq/0=; b=U16XCPeb15YkQAQLNR+tTq4c4U
	zTUadjPyFTOdHwqV1HRKVXAKRB4UvCZXqc5j6X6guEXl2w/WYcWgC5wtXNMKPb2oG051wfkxj2lbX
	C+KxO3cZPMdAlTNEKBYc40vqbSfsY60sw7AfSO2UBM8aRD81G2Rae1Pd5UBsBY1oV/Co=;
Message-ID: <01246e6b-1fbf-0853-571f-7b33b528d112@xen.org>
Date: Wed, 22 Dec 2021 15:38:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [XEN][RFC PATCH v2 07/12] xen/smmu: Add remove_device callback
 for smmu_iommu ops
To: Vikram Garhwal <fnu.vikram@xilinx.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com,
 volodymyr_babchuk@epam.com, Jan Beulich <jbeulich@suse.com>,
 Paul Durrant <paul@xen.org>
References: <1636441347-133850-1-git-send-email-fnu.vikram@xilinx.com>
 <1636441347-133850-8-git-send-email-fnu.vikram@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1636441347-133850-8-git-send-email-fnu.vikram@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 09/11/2021 08:02, Vikram Garhwal wrote:
> Add remove_device callback for removing the device entry from smmu-master using
>   following steps:
>      1. Find if SMMU master exists for the device node.
>      2. Remove the SMMU master

The commit title and message doesn't match the code.

> 
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> ---
>   xen/drivers/passthrough/device_tree.c | 30 ++++++++++++++++++++++++++++++
>   xen/include/xen/iommu.h               |  2 ++
>   2 files changed, 32 insertions(+)
> 
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index 98f2aa0..9d9eed8 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -127,6 +127,36 @@ int iommu_release_dt_devices(struct domain *d)
>       return 0;
>   }
>   
> +int iommu_remove_dt_device(struct dt_device_node *np)
> +{
> +    const struct iommu_ops *ops = iommu_get_ops();
> +    struct device *dev = dt_to_dev(np);
> +    int rc;
> +
> +    if ( !ops )
> +        return -EOPNOTSUPP;
> +
> +    if ( iommu_dt_device_is_assigned(np) )
> +        return -EPERM;

EPERM means the caller doesn't have the permission to request it. 
However, dom0 will have the permission to remote the device. The problem 
is the device is currently assigned to a domain. So it would be better 
to return EBUSY.

Also, most of the function wants to be protected with dtdevs_lock to 
prevent concurrent access to add/remove/assign/deassign.

I would create a version of iommu_dt_device_is_assigned() (maybe called 
iommu_dt_device_is_assigned_locked()) that would do the same but with 
the caller hold the lock.

> +
> +    /*
> +     * The driver which supports generic IOMMU DT bindings must have
> +     * these callback implemented.
> +     */
> +    if ( !ops->remove_device )
> +        return -EOPNOTSUPP;
> +
> +    /*
> +     * Remove master device from the IOMMU if latter is present and available.
> +     */
> +    rc = ops->remove_device(0, dev);
> +
> +    if ( rc == 0 )
> +        iommu_fwspec_free(dev);
> +
> +    return rc;
> +}
> +
>   int iommu_add_dt_device(struct dt_device_node *np)
>   {
>       const struct iommu_ops *ops = iommu_get_ops();
> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
> index 6b2cdff..c4d5d12 100644
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -215,6 +215,8 @@ int iommu_release_dt_devices(struct domain *d);
>    */
>   int iommu_add_dt_device(struct dt_device_node *np);
>   
> +int iommu_remove_dt_device(struct dt_device_node *np);
> +
>   int iommu_do_dt_domctl(struct xen_domctl *, struct domain *,
>                          XEN_GUEST_HANDLE_PARAM(xen_domctl_t));
>   

Cheers,

-- 
Julien Grall

