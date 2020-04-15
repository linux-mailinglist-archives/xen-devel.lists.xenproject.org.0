Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FB21AA485
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 15:36:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOiD8-0004FG-Sh; Wed, 15 Apr 2020 13:36:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=HSXo=57=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jOiD7-0004FB-Hz
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 13:36:13 +0000
X-Inumbo-ID: 128c91e6-7f1e-11ea-8a4d-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 128c91e6-7f1e-11ea-8a4d-12813bfff9fa;
 Wed, 15 Apr 2020 13:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4GFoXadHKTVKLBfHvbMtoqd143ZBIehi3HQhj4NJpfw=; b=hmoSsmdAqtibBKq2EvUneZqKEm
 5jd02qNlpUd5Khyb8LwzImrWlcIrO2UakXnHTvyChlIaroDiUzQpYJ/RouNvtNZSDi3/qDgFDGl82
 FWRujRMoRjegqozZsBXtxjMVOXiOc59yDG4EnSxE+PBR0/+CNLKeqCa8IAyolsvMBVZI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jOiD5-0003yF-0j; Wed, 15 Apr 2020 13:36:11 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jOiD4-0007LF-MB; Wed, 15 Apr 2020 13:36:10 +0000
Subject: Re: [PATCH 03/12] xen/arm: introduce 1:1 mapping for domUs
To: Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-3-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
Message-ID: <3f26f6a0-89bd-cbec-f07f-90a08fa60e26@xen.org>
Date: Wed, 15 Apr 2020 14:36:09 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415010255.10081-3-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Volodymyr_Babchuk@epam.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 15/04/2020 02:02, Stefano Stabellini wrote:
> In some cases it is desirable to map domU memory 1:1 (guest physical ==
> physical.) For instance, because we want to assign a device to the domU
> but the IOMMU is not present or cannot be used. In these cases, other
> mechanisms should be used for DMA protection, e.g. a MPU.

I am not against this, however the documentation should clearly explain 
that you are making your platform insecure unless you have other mean 
for DMA protection.

> 
> This patch introduces a new device tree option for dom0less guests to
> request a domain to be directly mapped. It also specifies the memory
> ranges. This patch documents the new attribute and parses it at boot
> time. (However, the implementation of 1:1 mapping is missing and just
> BUG() out at the moment.)  Finally the patch sets the new direct_map
> flag for DomU domains.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
>   docs/misc/arm/device-tree/booting.txt | 13 +++++++
>   docs/misc/arm/passthrough-noiommu.txt | 35 ++++++++++++++++++
>   xen/arch/arm/domain_build.c           | 52 +++++++++++++++++++++++++--
>   3 files changed, 98 insertions(+), 2 deletions(-)
>   create mode 100644 docs/misc/arm/passthrough-noiommu.txt
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 5243bc7fd3..fce5f7ed5a 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -159,6 +159,19 @@ with the following properties:
>       used, or GUEST_VPL011_SPI+1 if vpl011 is enabled, whichever is
>       greater.
>   
> +- direct-map
> +
> +    Optional. An array of integer pairs specifying addresses and sizes.
> +    direct_map requests the memory of the domain to be 1:1 mapped with
> +    the memory ranges specified as argument. Only sizes that are a
> +    power of two number of pages are allowed.
> +
> +- #direct-map-addr-cells and #direct-map-size-cells
> +
> +    The number of cells to use for the addresses and for the sizes in
> +    direct-map. Default and maximum are 2 cells for both addresses and
> +    sizes.
> +

As this is going to be mostly used for passthrough, can't we take 
advantage of the partial device-tree and describe the memory region 
using memory node?

>   - #address-cells and #size-cells
>   
>       Both #address-cells and #size-cells need to be specified because
> diff --git a/docs/misc/arm/passthrough-noiommu.txt b/docs/misc/arm/passthrough-noiommu.txt
> new file mode 100644
> index 0000000000..d2bfaf26c3
> --- /dev/null
> +++ b/docs/misc/arm/passthrough-noiommu.txt
> @@ -0,0 +1,35 @@
> +Request Device Assignment without IOMMU support
> +===============================================
> +
> +Add xen,force-assign-without-iommu; to the device tree snippet
> +
> +    ethernet: ethernet@ff0e0000 {
> +        compatible = "cdns,zynqmp-gem";
> +        xen,path = "/amba/ethernet@ff0e0000";
> +        xen,reg = <0x0 0xff0e0000 0x1000 0x0 0xff0e0000>;
> +        xen,force-assign-without-iommu;
> +
> +Optionally, if none of the domains require an IOMMU, then it could be
> +disabled (not recommended). For instance by adding status = "disabled";
> +under the smmu node:
> +
> +    smmu@fd800000 {
> +        compatible = "arm,mmu-500";
> +        status = "disabled";

I am not sure why this section is added in this patch. Furthermore, the 
file is named "noiommu" but here you mention the IOMMU.

> +
> +
> +Request 1:1 memory mapping for the dom0-less domain
> +===================================================
> +
> +Add a direct-map property under the appropriate /chosen/domU node with
> +the memory ranges you want to assign to your domain. If you are using
> +imagebuilder, you can add to boot.source something like the following:
> +
> +    fdt set /chosen/domU0 direct-map <0x0 0x10000000 0x0 0x10000000 0x0 0x60000000 0x0 0x10000000>
> +
> +Which will assign the ranges:
> +
> +    0x10000000 - 0x20000000
> +    0x60000000 - 0x70000000
> +
> +to the first dom0less domU.
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 2ec7453aa3..a2bb411568 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2435,7 +2435,51 @@ static int __init construct_domU(struct domain *d,
>       /* type must be set before allocate memory */
>       d->arch.type = kinfo.type;
>   #endif
> -    allocate_memory(d, &kinfo);
> +
> +    if ( !is_domain_direct_mapped(d) )
> +        allocate_memory(d, &kinfo);
> +    else
> +    {
> +        struct membank banks[NR_MEM_BANKS];
> +        const struct dt_property *prop;
> +        u32 direct_map_len, direct_map_addr_len = 2, direct_map_size_len = 2;
> +        unsigned int i;
> +        __be32 *p;
> +
> +        prop = dt_find_property(node, "direct-map", &direct_map_len);
> +        BUG_ON(!prop);
> +
> +        dt_property_read_u32(node,
> +                             "#direct-map-addr-cells",
> +                             &direct_map_addr_len);
> +        dt_property_read_u32(node,
> +                             "#direct-map-size-cells",
> +                             &direct_map_size_len);
> +        BUG_ON(direct_map_size_len > 2 || direct_map_addr_len > 2);
> +
> +        for ( i = 0, p = prop->value;
> +              i < direct_map_len /
> +                  (4 * (direct_map_addr_len + direct_map_size_len));
> +              i++)
> +        {
> +            int j;
> +
> +            banks[i].start = 0;
> +            for ( j = 0; j < direct_map_addr_len; j++, p++ )
> +                banks[i].start |= __be32_to_cpu(*p) << (32*j);

Please use dt_read_number();

> +
> +            banks[i].size = 0;
> +            for ( j = 0; j < direct_map_size_len; j++, p++ )
> +                banks[i].size |= __be32_to_cpu(*p) << (32*j);
> +

Same here.

> +            printk(XENLOG_DEBUG
> +                   "direct_map start=%#"PRIpaddr" size=%#"PRIpaddr"\n",
> +                   banks[i].start, banks[i].size);
> +        }
> +
> +        /* reserve_memory_11(d, &kinfo, &banks[0], i); */
> +        BUG();

This can be avoided by re-ordering the patches and folding #6 in this patch.

> +    }
>   
>       rc = prepare_dtb_domU(d, &kinfo);
>       if ( rc < 0 )
> @@ -2455,6 +2499,7 @@ void __init create_domUs(void)
>   {
>       struct dt_device_node *node;
>       const struct dt_device_node *chosen = dt_find_node_by_path("/chosen");
> +    u32 direct_map = 0;
>   
>       BUG_ON(chosen == NULL);
>       dt_for_each_child_node(chosen, node)
> @@ -2476,8 +2521,11 @@ void __init create_domUs(void)
>               panic("Missing property 'cpus' for domain %s\n",`
>                     dt_node_name(node));
>   
> -        if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") )
> +        dt_find_property(node, "direct-map", &direct_map);

Please use dt_property_read_bool().

> +        if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") &&
> +             !direct_map )
>               d_cfg.flags |= XEN_DOMCTL_CDF_iommu;
> +        flags.arch.is_direct_map = direct_map != 0;
>   
>           if ( !dt_property_read_u32(node, "nr_spis", &d_cfg.arch.nr_spis) )
>           {
> 

Cheers,

-- 
Julien Grall

