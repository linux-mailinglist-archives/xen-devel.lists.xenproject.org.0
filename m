Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B639652AA74
	for <lists+xen-devel@lfdr.de>; Tue, 17 May 2022 20:20:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.331418.554929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nr1nA-0007rj-Ek; Tue, 17 May 2022 18:19:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 331418.554929; Tue, 17 May 2022 18:19:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nr1nA-0007pc-As; Tue, 17 May 2022 18:19:32 +0000
Received: by outflank-mailman (input) for mailman id 331418;
 Tue, 17 May 2022 18:19:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nr1n9-0007pW-BS
 for xen-devel@lists.xenproject.org; Tue, 17 May 2022 18:19:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nr1n8-0001hd-4v; Tue, 17 May 2022 18:19:30 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227] helo=[10.95.147.55])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nr1n7-0002O0-Tk; Tue, 17 May 2022 18:19:30 +0000
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
	bh=TqLslw6Jw+aq1LB6AjK4iMjV9CAMB5hPzOKylZ6obik=; b=amaQoJtiYiLTUm4JbTTDNRF/Ic
	7qiR2Sr1oL2ULouIUdrIC7u6X08/wAe/jPiWiqrm0QIcUroarbJWmSytITBJNdD7bsUrZU1giqOMq
	yABbpyXDIQbe2MUrVVv6JplCyt0IJtVE8YoI+iA9F4U8aJCrmlTgrAZUmmwVaxEgTvnQ=;
Message-ID: <2cfaf0c9-a9c5-1ada-cd78-900b7497519c@xen.org>
Date: Tue, 17 May 2022 19:19:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [XEN][RFC PATCH v3 07/14] xen/iommu: Move spin_lock from
 iommu_dt_device_is_assigned to caller
To: Vikram Garhwal <fnu.vikram@xilinx.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com,
 volodymyr_babchuk@epam.com
References: <20220308194704.14061-1-fnu.vikram@xilinx.com>
 <20220308194704.14061-8-fnu.vikram@xilinx.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220308194704.14061-8-fnu.vikram@xilinx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 08/03/2022 19:46, Vikram Garhwal wrote:
> Rename iommu_dt_device_is_assigned() to iommu_dt_device_is_assigned_lock().
> 
> Moving spin_lock to caller was done to prevent the concurrent access to
> iommu_dt_device_is_assigned while doing add/remove/assign/deassign.
> 
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> ---
>   xen/drivers/passthrough/device_tree.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
> index 98f2aa0dad..b3b04f8e03 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -83,16 +83,14 @@ fail:
>       return rc;
>   }
>   
> -static bool_t iommu_dt_device_is_assigned(const struct dt_device_node *dev)
> +static bool_t iommu_dt_device_is_assigned_lock(const struct dt_device_node *dev)

NIT: We tend to use "_locked" when a function should be called with the 
lock taken.

>   {
>       bool_t assigned = 0;
>   
>       if ( !dt_device_is_protected(dev) )
>           return 0;
>   
> -    spin_lock(&dtdevs_lock);
>       assigned = !list_empty(&dev->domain_list);
> -    spin_unlock(&dtdevs_lock);
>   
>       return assigned;
>   }
> @@ -225,12 +223,17 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, struct domain *d,
>   
>           if ( domctl->cmd == XEN_DOMCTL_test_assign_device )
>           {
> -            if ( iommu_dt_device_is_assigned(dev) )
> +            spin_lock(&dtdevs_lock);

Is this actually sufficient? IOW what will ensure that the "dev" doesn't 
disappear between the time we look it up (see dt_find_node_by_gpath()) 
and we check the assignment?

Cheers,

-- 
Julien Grall

