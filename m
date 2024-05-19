Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD1A8C944C
	for <lists+xen-devel@lfdr.de>; Sun, 19 May 2024 12:18:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.725561.1130033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8dc2-0004hc-P9; Sun, 19 May 2024 10:17:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 725561.1130033; Sun, 19 May 2024 10:17:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s8dc2-0004eo-MP; Sun, 19 May 2024 10:17:54 +0000
Received: by outflank-mailman (input) for mailman id 725561;
 Sun, 19 May 2024 10:17:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s8dc1-0004ei-CH
 for xen-devel@lists.xenproject.org; Sun, 19 May 2024 10:17:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s8dc1-00063B-39; Sun, 19 May 2024 10:17:53 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s8dc0-0005kW-TI; Sun, 19 May 2024 10:17:53 +0000
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
	bh=PYc/LpTwVSpraHnYT7Wlk5KHA645IoK/9ZUMvQHzb2g=; b=R/C+cxggq4O8UAV6bIoXH+LcQ3
	iItQg44EVm/DohbcRJBAplY3eNxV33JTFCnltqr15j9id4xZgimQCqSm0VCHOyfzg5lHgm5NJb/Ue
	TlF1TGWG5xg98LeAqaNRiUrev+oeVIU4TzdS9GD3BwHp3akF/W+JDXxXX4vbXvNZDe24=;
Message-ID: <01825e63-3cf1-4539-85e4-d87fecbcfcf4@xen.org>
Date: Sun, 19 May 2024 11:17:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] xen/arm, doc: Add a DT property to specify IOMMU
 for Dom0less domUs
Content-Language: en-GB
To: Henry Wang <xin.wang2@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240516100330.1433265-1-xin.wang2@amd.com>
 <20240516100330.1433265-4-xin.wang2@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240516100330.1433265-4-xin.wang2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 16/05/2024 11:03, Henry Wang wrote:
> There are some use cases in which the dom0less domUs need to have
> the XEN_DOMCTL_CDF_iommu set at the domain construction time. For
> example, the dynamic dtbo feature allows the domain to be assigned
> a device that is behind the IOMMU at runtime. For these use cases,
> we need to have a way to specify the domain will need the IOMMU
> mapping at domain construction time.
> 
> Introduce a "passthrough" DT property for Dom0less DomUs following
> the same entry as the xl.cfg. Currently only provide two options,
> i.e. "enable" and "disable". Set the XEN_DOMCTL_CDF_iommu at domain
> construction time based on the property.
> 
> Signed-off-by: Henry Wang <xin.wang2@amd.com>
> ---
> v2:
> - New patch to replace the original patch in v1:
>    "[PATCH 03/15] xen/arm: Always enable IOMMU"
> ---
>   docs/misc/arm/device-tree/booting.txt | 13 +++++++++++++
>   xen/arch/arm/dom0less-build.c         |  7 +++++--
>   2 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index bbd955e9c2..61f9082553 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -260,6 +260,19 @@ with the following properties:
>       value specified by Xen command line parameter gnttab_max_maptrack_frames
>       (or its default value if unspecified, i.e. 1024) is used.
>   
> +- passthrough
> +
> +    A string property specifying whether IOMMU mappings are enabled for the
> +    domain and hence whether it will be enabled for passthrough hardware.
> +    Possible property values are:
> +
> +    - "enabled"
> +    IOMMU mappings are enabled for the domain.
> +
> +    - "disabled"
> +    IOMMU mappings are disabled for the domain and so hardware may not be
> +    passed through. This option is the default if this property is missing.

Looking at the code below, it seems like the default will depend on 
whether the partial device-tree is present. Did I misunderstand?

> +
>   Under the "xen,domain" compatible node, one or more sub-nodes are present
>   for the DomU kernel and ramdisk.
>   
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 74f053c242..1396a102e1 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -848,6 +848,7 @@ static int __init construct_domU(struct domain *d,
>   void __init create_domUs(void)
>   {
>       struct dt_device_node *node;
> +    const char *dom0less_iommu;
>       const struct dt_device_node *cpupool_node,
>                                   *chosen = dt_find_node_by_path("/chosen");
>   
> @@ -895,8 +896,10 @@ void __init create_domUs(void)
>               panic("Missing property 'cpus' for domain %s\n",
>                     dt_node_name(node));
>   
> -        if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") &&
> -             iommu_enabled )
> +        if ( iommu_enabled &&
> +             ((!dt_property_read_string(node, "passthrough", &dom0less_iommu) &&
> +               !strcmp(dom0less_iommu, "enabled")) ||
> +              dt_find_compatible_node(node, NULL, "multiboot,device-tree")) )

This condition is getting a little bit harder to read. Can we cache the 
"passthrough" flag separately?

Also, shouldn't we throw a panic if passthrough = "enabled" but the 
IOMMU is enabled?

>               d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>   
>           if ( !dt_property_read_u32(node, "nr_spis", &d_cfg.arch.nr_spis) )

Cheers,

-- 
Julien Grall

