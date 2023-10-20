Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E267D15F9
	for <lists+xen-devel@lfdr.de>; Fri, 20 Oct 2023 20:50:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619936.965832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtuYO-00041f-0W; Fri, 20 Oct 2023 18:49:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619936.965832; Fri, 20 Oct 2023 18:48:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtuYN-0003zm-UA; Fri, 20 Oct 2023 18:48:59 +0000
Received: by outflank-mailman (input) for mailman id 619936;
 Fri, 20 Oct 2023 18:48:58 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qtuYM-0003zf-A8
 for xen-devel@lists.xenproject.org; Fri, 20 Oct 2023 18:48:58 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qtuYL-0002mH-Ud; Fri, 20 Oct 2023 18:48:57 +0000
Received: from [54.239.6.188] (helo=[192.168.205.12])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qtuYL-0007mS-ND; Fri, 20 Oct 2023 18:48:57 +0000
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
	bh=BQVRZ4fNAz0vCSTq9xZ9ylTGV0MPdHcNLIKBab3M37Y=; b=GpUtMUxU2oU8nOyp5Cd19HnGyv
	aaLssJcx5pH7N2vUIGpx9FjeSgcaE9zRtSKet/tE0pB4R2/lNFcXkxv0Kf3m14roaQrBST71kTeuN
	3DSoqqnf8X649QZJoYqECrBHwqdSPTF2MLEZvncxmOCiDT0aO+5oV/7i2W2qVYTHa85o=;
Message-ID: <31cdf500-959d-42cb-a1ce-bbee7cb5e251@xen.org>
Date: Fri, 20 Oct 2023 19:48:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/9] xen/arm: don't pass iommu properties to hwdom for
 iommu-map
Content-Language: en-GB
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20231004145604.1085358-1-stewart.hildebrand@amd.com>
 <20231004145604.1085358-2-stewart.hildebrand@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231004145604.1085358-2-stewart.hildebrand@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 04/10/2023 15:55, Stewart Hildebrand wrote:
> A device tree node for a PCIe root controller may have an iommu-map property [1]
> with a phandle reference to the SMMU node, but not necessarily an iommus
> property. In this case, we want to treat it the same as we currently handle
> devices with an iommus property: don't pass the iommu related properties to
> hwdom.
> 
> [1] https://www.kernel.org/doc/Documentation/devicetree/bindings/pci/pci-iommu.txt
> 
> Reported-by: Michal Orzel <michal.orzel@amd.com>
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

Acked-by: Julien Grall <jgrall@amazon.com>

> ---
> v4->v5:
> * new patch
> ---
>   xen/arch/arm/domain_build.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 24c9019cc43c..7da254709d17 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1135,6 +1135,8 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
>        * should be skipped.
>        */
>       iommu_node = dt_parse_phandle(node, "iommus", 0);
> +    if ( !iommu_node )
> +        iommu_node = dt_parse_phandle(node, "iommu-map", 1);
>       if ( iommu_node && device_get_class(iommu_node) != DEVICE_IOMMU )
>           iommu_node = NULL;

I was looking at the history to understand why we decided to not always 
hide the properties.

AFAICT, this was mainly to avoid removing the master properties but 
keeping the IOMMU nodes in the DT. However, in reality, I don't expect 
the IOMMU to function properly in dom0 (in particular when grants are 
used for DMA).

Looking at the bindings, it turns out that all the IOMMU using the 
generic bindigns would contain the property #iommu-cells. So we could 
remove any device with such property.

This would not work for IOMMU bindings not using the generic one. AFAIK, 
this is only legacy SMMUv{1,2} binding so we could filter them by 
compatible.

With that we would unconditionally remove the properties iommu-* and 
avoid increasing the complexity.

Any thoughts?

Cheers,

-- 
Julien Grall

