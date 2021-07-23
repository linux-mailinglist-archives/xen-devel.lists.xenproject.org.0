Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8264D3D3771
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jul 2021 11:14:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.160032.294299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6rFA-00019H-J8; Fri, 23 Jul 2021 09:13:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 160032.294299; Fri, 23 Jul 2021 09:13:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6rFA-000173-FD; Fri, 23 Jul 2021 09:13:20 +0000
Received: by outflank-mailman (input) for mailman id 160032;
 Fri, 23 Jul 2021 09:13:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m6rF8-00016t-Pz
 for xen-devel@lists.xenproject.org; Fri, 23 Jul 2021 09:13:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m6rF5-0000NL-ET; Fri, 23 Jul 2021 09:13:15 +0000
Received: from [54.239.6.189] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m6rF5-0000v0-7z; Fri, 23 Jul 2021 09:13:15 +0000
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
	bh=2UcrJwB7dwQ4U9xjgEKZhNPgE8WvL8B8u3P1Bq+n6xM=; b=WM1sixrJOKT21qtEwLDpmw/Ehi
	Zz5mlqCJJuZwuMmZSA2MwSx0lpnTy+2Dls7nTUEn4ZAzW4coUtIvNTjQ59r0GxfdxMf+ggtWCDkt9
	zuylF2O1rJSZExMTsvoVtNd8OLLNgSn+orh7u5C0qciiogwKBQsS/C4nFkG3U9P2skvg=;
Subject: Re: [PATCH v5 2/4] xen: do not return -EEXIST if iommu_add_dt_device
 is called twice
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 rahul.singh@arm.com, brian.woods@xilinx.com,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.21.2107221634130.10122@sstabellini-ThinkPad-T480s>
 <20210722233642.22515-2-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <acd7e7b6-7c2b-24d5-da80-042396aee5e8@xen.org>
Date: Fri, 23 Jul 2021 10:13:13 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210722233642.22515-2-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 23/07/2021 00:36, Stefano Stabellini wrote:
> If both legacy IOMMU bindings and generic bindings are present,
> iommu_add_dt_device can be called twice. Do not return error in that
> case, that way there is no need to check for -EEXIST at the call sites.
> Remove the one existing -EEXIT check, now unneeded.

The commit message implies that we already support both legacy and 
generic bindings. However, this is not yet implemented.

So how about:

"
iommu_add_dt_device() will returns -EEXIST if the device was already 
registered.

At the moment, this can only happen if the device was already assigned 
to a domain (either dom0 at boot or via XEN_DOMCTL_assign_device).

In a follow-up patch, we will convert the SMMU driver to use the FW 
spec. When the legacy bindings are used, all the devices will be 
registered at probe. Therefore, iommu_add_dt_device() will always 
returns -EEXIST.

Currently, one caller (XEN_DOMCTL_assign_device) will check the return 
and ignore -EEXIST. All the other will fail because it was technically a 
programming error.

However, there is no harm to call iommu_add_dt_device() twice, so we can 
simply return 0.

With that in place the caller doesn't need to check -EEXIST anymore, so 
remove the check.
"

> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
> Changes in v5:
> - new patch
> ---
>   xen/drivers/passthrough/device_tree.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index 999b831d90..32526ecabb 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -140,8 +140,13 @@ int iommu_add_dt_device(struct dt_device_node *np)
>       if ( !ops )
>           return -EINVAL;
>   
> +    /*
> +     * Some Device Trees may expose both legacy SMMU and generic
> +     * IOMMU bindings together. If both are present, the device
> +     * can be already added.

Wouldn't this also happen when there is just generic bindings? If so, 
shouldn't this patch be first in the series to avoid breaking bisection?

> +     */

My point on the previous version is this is not the only reasons why 
dev_iommu_fwspec_get(). So either we want to write all the reasons 
(AFAICT, there is only two) or we want to write a generic message.

>       if ( dev_iommu_fwspec_get(dev) )
> -        return -EEXIST;
> +        return 0;
>   
>       /*
>        * According to the Documentation/devicetree/bindings/iommu/iommu.txt
> @@ -254,7 +259,7 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>            * already added to the IOMMU (positive result). Such happens after
>            * re-creating guest domain.
>            */

This comment on top is now stale.

> -        if ( ret < 0 && ret != -EEXIST )
> +        if ( ret < 0 )
>           {
>               printk(XENLOG_G_ERR "Failed to add %s to the IOMMU\n",
>                      dt_node_full_name(dev));
> 

Cheers,

-- 
Julien Grall

