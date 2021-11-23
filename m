Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8782245A9EB
	for <lists+xen-devel@lfdr.de>; Tue, 23 Nov 2021 18:23:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.229864.397454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpZVI-0006Ez-4c; Tue, 23 Nov 2021 17:22:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 229864.397454; Tue, 23 Nov 2021 17:22:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpZVI-0006Cp-1h; Tue, 23 Nov 2021 17:22:48 +0000
Received: by outflank-mailman (input) for mailman id 229864;
 Tue, 23 Nov 2021 17:22:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mpZVG-0006Cj-NB
 for xen-devel@lists.xenproject.org; Tue, 23 Nov 2021 17:22:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mpZVG-0000EG-HL; Tue, 23 Nov 2021 17:22:46 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.23.209]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mpZVG-0006CK-Bo; Tue, 23 Nov 2021 17:22:46 +0000
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
	bh=iFugpV/WWGBKAjlRelrhnehAEC7SoYluZXY7vtts0WU=; b=LqjQp+dVdPlWvoIfu14Pr0sz18
	QXmTeAph9S9LgjDzMBjsK0fuzGhW99LVFL3L/d2ERHk0WmEstmOB7FPqqudt7fZATMWy5V7Fz734L
	g7NC4pSnyEr2NMvDxGkjr6pkxNb7uKyAnNOQnbGTi+DIvNKelj7eiXqmsXeqgJl6+HiM=;
Message-ID: <8cc2756b-3781-4c21-6cff-19e348bdbba2@xen.org>
Date: Tue, 23 Nov 2021 17:22:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH v3 02/10] xen/arm: avoid setting XEN_DOMCTL_CDF_iommu when
 IOMMU off
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com
References: <20211116063155.901183-1-penny.zheng@arm.com>
 <20211116063155.901183-3-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211116063155.901183-3-penny.zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 16/11/2021 06:31, Penny Zheng wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> This commit avoids setting XEN_DOMCTL_CDF_iommu when the IOMMU is
> absent/disabled, otherwise xen will fail later when handling
> device assignment.

I would explain briefly in the commit message why you want to do device 
assignment without PCI passthrough.

Other than that, the change below is fine with me.

> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
> v3 changes:
> - new commit, split from the original "[PATCH v2 2/6] xen/arm: introduce
> direct-map for domUs"
> ---
>   xen/arch/arm/domain_build.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 664c88ebe4..7a063f62fe 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2996,7 +2996,8 @@ void __init create_domUs(void)
>               panic("Missing property 'cpus' for domain %s\n",
>                     dt_node_name(node));
>   
> -        if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") )
> +        if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") &&
> +             iommu_enabled )
>               d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>   
>           if ( !dt_property_read_u32(node, "nr_spis", &d_cfg.arch.nr_spis) )
> 

Cheers,

-- 
Julien Grall

