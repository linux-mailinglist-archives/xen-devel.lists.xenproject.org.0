Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8485B40CC
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 22:41:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.404536.647042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWkoL-0005ZG-62; Fri, 09 Sep 2022 20:41:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 404536.647042; Fri, 09 Sep 2022 20:41:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWkoL-0005WD-3F; Fri, 09 Sep 2022 20:41:13 +0000
Received: by outflank-mailman (input) for mailman id 404536;
 Fri, 09 Sep 2022 20:41:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5CMf=ZM=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oWkoJ-0005Td-Kx
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 20:41:11 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9c6250a-307f-11ed-a31c-8f8a9ae3403f;
 Fri, 09 Sep 2022 22:41:06 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0754A62031;
 Fri,  9 Sep 2022 20:41:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F6EFC433C1;
 Fri,  9 Sep 2022 20:41:04 +0000 (UTC)
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
X-Inumbo-ID: b9c6250a-307f-11ed-a31c-8f8a9ae3403f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662756064;
	bh=hkxcvj/8MrM7eaEYMmpHk8S/3LUdyXPLgYfV8uQOfVo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tNbDiNcazIwMQFmld4a2/Hcd0sAPfYYsTyeznx+FEXYPRqYshVHG5vWHdbNraBiGu
	 azDZzkTgmYlD9zLHRnaiEgYeKeigZEjVaY/WWdAzHhpE3l9sDGNnqqA81xv/oSKwGT
	 97CqLal175qV+ynoVmYgb7xeflUV1LbRZK/QuYq4FzctKlTpZ7UmFXJ0pmyIr3OtJH
	 l/SeDMHfvEBqX1sgFpNytYaJzBG7EqehF6oaudQyD2+q2lQoCffX0JOOtSLG/RrxMe
	 16TzmyPSH0GKXCDrl9VwOPCJkd9UN/mM2PER8a1kiGraxPQ45KYqY8WdKqhENlHoDJ
	 qSfcwHXRS750g==
Date: Fri, 9 Sep 2022 13:41:03 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <Henry.Wang@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2] xen/arm, device-tree: Make static-mem use
 #{address,size}-cells
In-Reply-To: <20220909052357.49349-1-Henry.Wang@arm.com>
Message-ID: <alpine.DEB.2.22.394.2209091313250.157835@ubuntu-linux-20-04-desktop>
References: <20220909052357.49349-1-Henry.Wang@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 9 Sep 2022, Henry Wang wrote:
> In order to keep consistency in the device tree binding, there is
> no need for static memory allocation feature to define a specific
> set of address and size cells for "xen,static-mem" property.
> 
> Therefore, this commit reuses the regular #{address,size}-cells
> for parsing the device tree "xen,static-mem" property. Update
> the documentation accordingly.
> 
> Also, take the chance to remove the unnecessary "#address-cells"
> and "#size-cells" in the domU1 node of the device tree to only
> emphasize the related part that the example is showing.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes from v1 to v2:
> - Remove the "----" addition, as it is unnecessary to this patch.
> - Mention the removal of #address-cells and #size-cells in domU1
>   node in the commit message.
> ---
>  docs/misc/arm/device-tree/booting.txt | 11 +++++------
>  docs/misc/arm/passthrough-noiommu.txt |  7 +++----
>  xen/arch/arm/bootfdt.c                |  5 -----
>  xen/arch/arm/domain_build.c           | 16 ++--------------
>  4 files changed, 10 insertions(+), 29 deletions(-)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 5395a1077c..10caf4f1af 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -350,8 +350,8 @@ areas are pre-defined by configuration using physical address ranges.
>  
>  Memory can be statically allocated to a domain using the property "xen,static-
>  mem" defined in the domain configuration. The number of cells for the address
> -and the size must be defined using respectively the properties
> -"#xen,static-mem-address-cells" and "#xen,static-mem-size-cells".
> +and the size must be defined respectively by the parent node properties
> +"#address-cells" and "#size-cells".
>  
>  The property 'memory' is still needed and should match the amount of memory
>  given to the guest. Currently, it either comes from static memory or lets Xen
> @@ -366,14 +366,13 @@ device-tree:
>  
>      / {
>          chosen {
> +            #address-cells = <0x1>;
> +            #size-cells = <0x1>;
> +            ...
>              domU1 {
>                  compatible = "xen,domain";
> -                #address-cells = <0x2>;
> -                #size-cells = <0x2>;
>                  cpus = <2>;
>                  memory = <0x0 0x80000>;
> -                #xen,static-mem-address-cells = <0x1>;
> -                #xen,static-mem-size-cells = <0x1>;
>                  xen,static-mem = <0x30000000 0x20000000>;
>                  ...
>              };
> diff --git a/docs/misc/arm/passthrough-noiommu.txt b/docs/misc/arm/passthrough-noiommu.txt
> index 3e2ef21ad7..69b8de1975 100644
> --- a/docs/misc/arm/passthrough-noiommu.txt
> +++ b/docs/misc/arm/passthrough-noiommu.txt
> @@ -33,14 +33,13 @@ on static allocation in the device-tree:
>  
>  / {
>  	chosen {
> +		#address-cells = <0x1>;
> +		#size-cells = <0x1>;
> +		...
>  		domU1 {
>  			compatible = "xen,domain";
> -			#address-cells = <0x2>;
> -			#size-cells = <0x2>;
>  			cpus = <2>;
>  			memory = <0x0 0x80000>;
> -			#xen,static-mem-address-cells = <0x1>;
> -			#xen,static-mem-size-cells = <0x1>;
>  			xen,static-mem = <0x30000000 0x20000000>;
>  			direct-map;
>  			...
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index 9e1ea60094..59675f086b 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -370,11 +370,6 @@ static int __init process_domain_node(const void *fdt, int node,
>          /* No "xen,static-mem" present. */
>          return 0;
>  
> -    address_cells = device_tree_get_u32(fdt, node,
> -                                        "#xen,static-mem-address-cells", 0);
> -    size_cells = device_tree_get_u32(fdt, node,
> -                                     "#xen,static-mem-size-cells", 0);
> -
>      return device_tree_get_meminfo(fdt, node, "xen,static-mem", address_cells,
>                                     size_cells, &bootinfo.reserved_mem,
>                                     MEMBANK_STATIC_DOMAIN);
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 7412303d20..9040a8c6cb 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -565,21 +565,9 @@ static int __init parse_static_mem_prop(const struct dt_device_node *node,
>      const struct dt_property *prop;
>  
>      prop = dt_find_property(node, "xen,static-mem", NULL);
> -    if ( !dt_property_read_u32(node, "#xen,static-mem-address-cells",
> -                               addr_cells) )
> -    {
> -        printk(XENLOG_ERR
> -               "failed to read \"#xen,static-mem-address-cells\".\n");
> -        return -EINVAL;
> -    }
>  
> -    if ( !dt_property_read_u32(node, "#xen,static-mem-size-cells",
> -                               size_cells) )
> -    {
> -        printk(XENLOG_ERR
> -               "failed to read \"#xen,static-mem-size-cells\".\n");
> -        return -EINVAL;
> -    }
> +    *addr_cells = dt_n_addr_cells(node);
> +    *size_cells = dt_n_size_cells(node);
>  
>      *cell = (const __be32 *)prop->value;
>      *length = prop->length;
> -- 
> 2.17.1
> 

