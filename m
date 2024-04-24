Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D83E8B0A5A
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 15:03:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711450.1111432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzcHj-0005sP-4f; Wed, 24 Apr 2024 13:03:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711450.1111432; Wed, 24 Apr 2024 13:03:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzcHj-0005qN-0z; Wed, 24 Apr 2024 13:03:39 +0000
Received: by outflank-mailman (input) for mailman id 711450;
 Wed, 24 Apr 2024 13:03:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rzcHh-0005qF-DG
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 13:03:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rzcHg-0001qX-Mn; Wed, 24 Apr 2024 13:03:36 +0000
Received: from [15.248.2.25] (helo=[10.24.67.29])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rzcHg-00032r-GO; Wed, 24 Apr 2024 13:03:36 +0000
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
	bh=Ys4C8gLPcnF6ZmjaJhXMd5gMX5YbxCXXIjPyDlquEOc=; b=G6vTdQUIn+E+Y3fgdVQP9y3Ijc
	wYYaRCpVagILe2Fmie/Fad2cZ6rW+VdWjLC3+Qe1YadfMKItOLMAndSEaRlCEMivnLpj3xmsb6nNi
	P4GtAAjANwJm6WXIFxYg+B4jFXWbbHLAdClJF44NHqOOxexD/6YrK/2eyl/xMQ0mwmic=;
Message-ID: <fe0a39f3-f737-4df3-85bf-836b51fc8942@xen.org>
Date: Wed, 24 Apr 2024 14:03:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/15] xen/arm: Always enable IOMMU
Content-Language: en-GB
To: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org
Cc: Vikram Garhwal <fnu.vikram@xilinx.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <20240424033449.168398-1-xin.wang2@amd.com>
 <20240424033449.168398-4-xin.wang2@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240424033449.168398-4-xin.wang2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 24/04/2024 04:34, Henry Wang wrote:
> From: Vikram Garhwal <fnu.vikram@xilinx.com>
> 
> For overlay with iommu functionality to work with running VMs, we need to enable
> IOMMU by default for the domains.
> 
> Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> ---
>   xen/arch/arm/dom0less-build.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index fb63ec6fd1..2d1fd1e214 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -894,7 +894,8 @@ void __init create_domUs(void)
>               panic("Missing property 'cpus' for domain %s\n",
>                     dt_node_name(node));
>   
> -        if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") &&
> +        if ( (IS_ENABLED(CONFIG_OVERLAY_DTB) ||

Similar to the first patch, building Xen with the DTB overlay doesn't 
mean the user will want to use it (think of distros that may want to 
provide a generic Xen).

Instead, we should introduce a new DT property "passthrough" that would 
indicate whether the IOMMU should be used.

To be futureproof, I would match the values used by xl.cfg (see 
docs/man/xl.cfg.5.pod.in).

> +              dt_find_compatible_node(node, NULL, "multiboot,device-tree")) &&
>                iommu_enabled )
>               d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>   

Cheers,

-- 
Julien Grall

