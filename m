Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C47954AF3E0
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 15:17:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269237.463263 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHnls-0000aB-31; Wed, 09 Feb 2022 14:16:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269237.463263; Wed, 09 Feb 2022 14:16:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHnlr-0000YM-Vo; Wed, 09 Feb 2022 14:16:35 +0000
Received: by outflank-mailman (input) for mailman id 269237;
 Wed, 09 Feb 2022 14:16:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nHnlr-0000YG-02
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 14:16:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nHnlq-000648-Rv; Wed, 09 Feb 2022 14:16:34 +0000
Received: from 54-240-197-228.amazon.com ([54.240.197.228]
 helo=[192.168.1.215]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nHnlq-00035r-J8; Wed, 09 Feb 2022 14:16:34 +0000
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
	bh=DfyDGre4l2hO+MXmqtYTAZ7Wr3qqX1OXsphpzwHcwXc=; b=RZVw8iuCvUHTp0wKJSabD2AfCs
	NEHGGs1YHE1VW28M8kOHH62PYwXlYPmHRzuOTQSMnwTQEaH2HTPAKGGxGH0xRiPNwIYwg3tt0JfDf
	6e4RY47tAv6W/odP8ZtHPAnzXowcixQ9+hJnMZContCLSP83Sz16mARXxexeKYNqHyW4=;
Message-ID: <c0f76e2a-fb5a-169f-c6d9-f9f5391eb049@xen.org>
Date: Wed, 9 Feb 2022 14:16:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v5 03/11] xen/arm: avoid setting XEN_DOMCTL_CDF_iommu when
 IOMMU off
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com
References: <20220127074929.502885-1-penny.zheng@arm.com>
 <20220127074929.502885-4-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220127074929.502885-4-penny.zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/01/2022 07:49, Penny Zheng wrote:
> From: Stefano Stabellini <sstabellini@kernel.org>
> 
> When IOMMU is absent or shall not be used (trusted domain, performance,
> hardware limitation, ..., etc), in which cases this commit avoids setting
> XEN_DOMCTL_CDF_iommu to make those user cases possible and prevent failure
> later during device assignment.
How about:

xen/arm: Allow device-passthrough even the IOMMU is off

At the moment, we are only supporting device-passthrough when Xen has 
enabled the IOMMU. There are some uses cases where it is not possible to 
use the IOMMU (e.g. doesn't exist, hardware limitation, performance) yet
it would be OK to assign a device to trusted domain so long they are are 
direct-mapped or the device doesn't do DMA.

Note that when the IOMMU is disabled, it will be necessary to add 
xen,force-assign-without-iommu for every device that needs to be assigned.

> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Tested-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
> v3 changes:
> - new commit, split from the original "[PATCH v2 2/6] xen/arm: introduce
> direct-map for domUs"
> ---
> v4 changes:
> - explain briefly in the commit message why we want to do device assignment
> without IOMMU.
> ---
> v5 changes:
> - nothing changed
> ---
>   xen/arch/arm/domain_build.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 6467e8ee32..c1e8c99f64 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -3047,7 +3047,8 @@ void __init create_domUs(void)
>               panic("Missing property 'cpus' for domain %s\n",
>                     dt_node_name(node));
>   
> -        if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") )
> +        if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") &&
> +             iommu_enabled )
>               d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>   
>           if ( !dt_property_read_u32(node, "nr_spis", &d_cfg.arch.nr_spis) )

Cheers,

-- 
Julien Grall

