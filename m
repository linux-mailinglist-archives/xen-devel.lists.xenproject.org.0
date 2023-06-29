Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 811AB74309C
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 00:30:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557179.870291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF08v-0003V4-Dv; Thu, 29 Jun 2023 22:29:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557179.870291; Thu, 29 Jun 2023 22:29:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF08v-0003Sv-Al; Thu, 29 Jun 2023 22:29:37 +0000
Received: by outflank-mailman (input) for mailman id 557179;
 Thu, 29 Jun 2023 22:29:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qF08t-0003Sp-Iq
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 22:29:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qF08t-0001KX-0q; Thu, 29 Jun 2023 22:29:35 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qF08s-0006BM-RO; Thu, 29 Jun 2023 22:29:34 +0000
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
	bh=Lbq4JSzkHWJwlzw2w21G8vmh4g13grTO+33JLpgAnFc=; b=PYVRdEMwB7t0aQQWapvatTkaSz
	2BsP0ljqPktIhNl4UcSNrLAh4Ycp19Xu0jxtj1mSpTpGpDBglWiEw5tIoqlNN+I+2AXYknVhahQgi
	51VwXKW8GifA2SP5+5S59tQsPW5fQ4VVfHqA8L98zSOIYk/2ePzDKteJOUvgn6gsbNRo=;
Message-ID: <eaec93ad-bd6d-aef6-fa46-d1830f2b65ff@xen.org>
Date: Thu, 29 Jun 2023 23:29:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v4 3/7] iommu/arm: Add iommu_dt_xlate()
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Rahul Singh <rahul.singh@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20230607030220.22698-1-stewart.hildebrand@amd.com>
 <20230607030220.22698-4-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230607030220.22698-4-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stewart,

On 07/06/2023 04:02, Stewart Hildebrand wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Move code for processing DT IOMMU specifier to a separate helper.
> This helper will be re-used for adding PCI devices by the subsequent
> patches as we will need exact the same actions for processing
> DT PCI-IOMMU specifier.
> 
> While at it introduce NO_IOMMU to avoid magic "1".
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> v3->v4:
> * make dt_phandle_args *iommu_spec const
> * move !ops->add_device check to helper
> 
> v2->v3:
> * no change
> 
> v1->v2:
> * no change
> 
> downstream->v1:
> * trivial rebase
> * s/dt_iommu_xlate/iommu_dt_xlate/
> 
> (cherry picked from commit c26bab0415ca303df86aba1d06ef8edc713734d3 from
>   the downstream branch poc/pci-passthrough from
>   https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git)
> ---
>   xen/drivers/passthrough/device_tree.c | 47 ++++++++++++++++++---------
>   1 file changed, 31 insertions(+), 16 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index c60e78eaf556..ff9e66ebf92a 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -127,15 +127,42 @@ int iommu_release_dt_devices(struct domain *d)
>       return 0;
>   }
>   
> +/* This correlation must not be altered */

Please expand why.

> +#define NO_IOMMU    1

Given that the value is returned, should not this be moved to an header 
and used by the callers?

> +
> +static int iommu_dt_xlate(struct device *dev,
> +                          const struct dt_phandle_args *iommu_spec)
> +{
> +    const struct iommu_ops *ops = iommu_get_ops();
> +    int rc;
> +
> +    if ( !ops->dt_xlate )
> +        return -EINVAL;
> +
> +    if ( !dt_device_is_available(iommu_spec->np) )
> +        return NO_IOMMU;
> +
> +    rc = iommu_fwspec_init(dev, &iommu_spec->np->dev);
> +    if ( rc )
> +        return rc;
> +
> +    /*
> +     * Provide DT IOMMU specifier which describes the IOMMU master
> +     * interfaces of that device (device IDs, etc) to the driver.
> +     * The driver is responsible to decide how to interpret them.
> +     */
> +    return ops->dt_xlate(dev, iommu_spec);
> +}
> +
>   int iommu_add_dt_device(struct dt_device_node *np)
>   {
>       const struct iommu_ops *ops = iommu_get_ops();
>       struct dt_phandle_args iommu_spec;
>       struct device *dev = dt_to_dev(np);
> -    int rc = 1, index = 0;
> +    int rc = NO_IOMMU, index = 0;
>   
>       if ( !iommu_enabled )
> -        return 1;
> +        return NO_IOMMU;
>   
>       if ( !ops )
>           return -EINVAL;
> @@ -163,22 +190,10 @@ int iommu_add_dt_device(struct dt_device_node *np)
>            * The driver which supports generic IOMMU DT bindings must have
>            * these callback implemented.

The 's' was missing to callback. But now, I think you want to replace 
'these' with 'this' as you move the second check.

>            */
> -        if ( !ops->add_device || !ops->dt_xlate )
> +        if ( !ops->add_device )
>               return -EINVAL;
>   
> -        if ( !dt_device_is_available(iommu_spec.np) )
> -            break;
> -
> -        rc = iommu_fwspec_init(dev, &iommu_spec.np->dev);
> -        if ( rc )
> -            break;
> -
> -        /*
> -         * Provide DT IOMMU specifier which describes the IOMMU master
> -         * interfaces of that device (device IDs, etc) to the driver.
> -         * The driver is responsible to decide how to interpret them.
> -         */
> -        rc = ops->dt_xlate(dev, &iommu_spec);
> +        rc = iommu_dt_xlate(dev, &iommu_spec);
>           if ( rc )
>               break;
>   

Cheers,

-- 
Julien Grall

