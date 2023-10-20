Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 310C27D1596
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 20:17:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619927.965813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtu3X-0002fi-Av; Fri, 20 Oct 2023 18:17:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619927.965813; Fri, 20 Oct 2023 18:17:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtu3X-0002cm-72; Fri, 20 Oct 2023 18:17:07 +0000
Received: by outflank-mailman (input) for mailman id 619927;
 Fri, 20 Oct 2023 18:17:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qtu3V-0002ce-Vw
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 18:17:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qtu3V-000244-Jx; Fri, 20 Oct 2023 18:17:05 +0000
Received: from [54.239.6.188] (helo=[192.168.205.12])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qtu3V-0006d7-Bz; Fri, 20 Oct 2023 18:17:05 +0000
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
	bh=bAIPwaYn9EI/xmr168E3J+iH0LHDDLju4ouL0s3MhlA=; b=21diqskqfwZtUEVELBOkgvqInY
	+5pIKDOh6hisKOrJ62zBfPYlDy89SV5ed1d2ESscVrEZMWbe7Q1y+/Dszm9EMdqrrIZr/sJWXlmql
	vKHrHurMEjBE66dkyMFzB8sqMTME2SIHfjOvcAkhMV8p5CswPBMjJzxw7/PQCDrT/xhM=;
Message-ID: <7a1bb4f1-4bb1-4592-8ddf-9e97ad4a39f3@xen.org>
Date: Fri, 20 Oct 2023 19:17:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/9] xen/arm: Fix mapping for PCI bridge mmio region
Content-Language: en-GB
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231004145604.1085358-1-stewart.hildebrand@amd.com>
 <20231004145604.1085358-8-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231004145604.1085358-8-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stewart,

On 04/10/2023 15:55, Stewart Hildebrand wrote:
> From: Rahul Singh <rahul.singh@arm.com>
> 
> Current code skip the mapping for PCI bridge MMIO region to dom0 when
> pci_passthrough_enabled flag is set. Mapping should be skip when
> has_vpci(d) is enabled for the domain, as we need to skip the mapping
> only when VPCI handler are registered for ECAM.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
> v4->v5:
> * new patch

I am a bit lost. How is this a new patch but...

> * rebase on top of "dynamic node programming using overlay dtbo" series
> * replace !is_pci_passthrough_enabled() check with !IS_ENABLED(CONFIG_HAS_PCI)
>    instead of removing

... there is a changelog. Did you get the patch from somewhere?

> ---
>   xen/arch/arm/device.c       | 2 +-
>   xen/arch/arm/domain_build.c | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
> index 1f631d327441..4d69c298858d 100644
> --- a/xen/arch/arm/device.c
> +++ b/xen/arch/arm/device.c
> @@ -330,7 +330,7 @@ int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
>           .d = d,
>           .p2mt = p2mt,
>           .skip_mapping = !own_device ||
> -                        (is_pci_passthrough_enabled() &&
> +                        (has_vpci(d) &&
>                           (device_get_class(dev) == DEVICE_PCI_HOSTBRIDGE)),
>           .iomem_ranges = iomem_ranges,
>           .irq_ranges = irq_ranges
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 7da254709d17..2c55528a62d4 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1064,7 +1064,7 @@ static void __init assign_static_memory_11(struct domain *d,
>   #endif
>   
>   /*
> - * When PCI passthrough is available we want to keep the
> + * When HAS_PCI is enabled we want to keep the
>    * "linux,pci-domain" in sync for every host bridge.
>    *
>    * Xen may not have a driver for all the host bridges. So we have
> @@ -1080,7 +1080,7 @@ static int __init handle_linux_pci_domain(struct kernel_info *kinfo,
>       uint16_t segment;
>       int res;
>   
> -    if ( !is_pci_passthrough_enabled() )
> +    if ( !IS_ENABLED(CONFIG_HAS_PCI) )

I don't understand why this wants to be HAS_PCI rather than has_vcpi()? 
This also doesn't seem to be mentioned in the commit message.

>           return 0;
>   
>       if ( !dt_device_type_is_equal(node, "pci") )

Cheers,

-- 
Julien Grall

