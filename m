Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42360722FE3
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 21:38:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543892.849251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6G0p-0007e7-H4; Mon, 05 Jun 2023 19:37:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543892.849251; Mon, 05 Jun 2023 19:37:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6G0p-0007c6-EO; Mon, 05 Jun 2023 19:37:07 +0000
Received: by outflank-mailman (input) for mailman id 543892;
 Mon, 05 Jun 2023 19:37:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1q6G0n-0007c0-Ut
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 19:37:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6G0n-0004Cd-HW; Mon, 05 Jun 2023 19:37:05 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1q6G0n-0001gY-Bd; Mon, 05 Jun 2023 19:37:05 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=RYQYBT9+jhgGBhfrFP5pW+SCt0y7e3eRnwQ4DWbQrio=; b=bL1KoBWFFJI2BfETMGV6puxdrs
	Tkatc1Y4scczrrCNbMPWoUDxeGlG+yob0NgRVKb2unVjl+eDeIPu4+nMdBwfvuo/1jPKyzTO+pFod
	QAmFN/Oac21eM5OphcLe4X3e8RmnyEMXk+jwnQwrSo3lRG9G0wdOtHqldBC3LFi2Plns=;
Message-ID: <dc5c6d44-32f5-9d16-af1d-a7b1f197b7b5@xen.org>
Date: Mon, 5 Jun 2023 20:37:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.1
To: Vikram Garhwal <vikram.garhwal@amd.com>, xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com, sstabellini@kernel.org, jbeulich@suse.com,
 Paul Durrant <paul@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
 <20230602004824.20731-12-vikram.garhwal@amd.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [XEN][PATCH v7 11/19] xen/iommu: Introduce
 iommu_remove_dt_device()
In-Reply-To: <20230602004824.20731-12-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 02/06/2023 01:48, Vikram Garhwal wrote:
> Remove master device from the IOMMU. This will be helpful when removing the
> overlay nodes using dynamic programming during run time.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
> ---
>   xen/drivers/passthrough/device_tree.c | 41 +++++++++++++++++++++++++++
>   xen/include/xen/iommu.h               |  2 ++
>   2 files changed, 43 insertions(+)
> 
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index 8cc413f867..301a5bcd97 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -126,6 +126,47 @@ int iommu_release_dt_devices(struct domain *d)
>       return 0;
>   }
>   
> +int iommu_remove_dt_device(struct dt_device_node *np)
> +{
> +    const struct iommu_ops *ops = iommu_get_ops();
> +    struct device *dev = dt_to_dev(np);
> +    int rc;
> +

iommu_add_dt_device() checks if the IOMMU is enabled. I think you should 
do the same here as well and return 0 if it is disabled.

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

It is not clear to me why you want to mandate remove_device when using 
the generic IOMMU DT bindings.

But if this is really necessary, then I think the comment should be 
placed on top of the callback definition rather than in the caller.

> +    if ( !ops->remove_device )
> +    {
> +        rc = -EOPNOTSUPP;
> +        goto fail;
> +    }
> +
> +    /*
> +     * Remove master device from the IOMMU if latter is present and available.
> +     * The driver is responsible for removing is_protected flag.
> +     */
> +    rc = ops->remove_device(0, dev);
> +
> +    if ( !rc )
> +        iommu_fwspec_free(dev);
> +
> +fail:
> +    spin_unlock(&dtdevs_lock);
> +    return rc;
> +}
> +
>   int iommu_add_dt_device(struct dt_device_node *np)
>   {
>       const struct iommu_ops *ops = iommu_get_ops();
> diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
> index 405db59971..0d7924821b 100644
> --- a/xen/include/xen/iommu.h
> +++ b/xen/include/xen/iommu.h
> @@ -229,6 +229,8 @@ int iommu_release_dt_devices(struct domain *d);
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

