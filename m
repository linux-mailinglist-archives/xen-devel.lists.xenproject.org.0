Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E76BFAC98E1
	for <lists+xen-devel@lfdr.de>; Sat, 31 May 2025 03:49:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001870.1382014 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLBLJ-0005Ht-R1; Sat, 31 May 2025 01:49:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001870.1382014; Sat, 31 May 2025 01:49:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLBLJ-0005Fj-OU; Sat, 31 May 2025 01:49:01 +0000
Received: by outflank-mailman (input) for mailman id 1001870;
 Sat, 31 May 2025 01:48:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ffab=YP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uLBLH-0005FZ-Ma
 for xen-devel@lists.xenproject.org; Sat, 31 May 2025 01:48:59 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a624ddb-3dc1-11f0-a300-13f23c93f187;
 Sat, 31 May 2025 03:48:58 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id ACB92449B2;
 Sat, 31 May 2025 01:48:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1AFAC4CEEB;
 Sat, 31 May 2025 01:48:55 +0000 (UTC)
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
X-Inumbo-ID: 6a624ddb-3dc1-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748656136;
	bh=fMLIPfKSgzwgIwruh7IJBznP6b1N/KC/MHf+WAierIE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=AdbUBfWf16XXSEJWVVusoUcJCd4CltljViGEJEr8ktyvOUeTvcWMaSlchwCL5H3pV
	 iEo01s4spUouzgPruuQMFDQLVZar56a5+nVFlWmd6GTAjQHgowlAmOj1UmaJPl1q5R
	 VO3akEklZreeGd231uJPEFderJp2JAe0Vu8jWfseVmlU4WPvjVgYp6O28qnydDkATy
	 mnAisa6Cr5Tdbmo484zIv2CJLb7lDoreS3tCt6YufQvNtG2rk6IqqCTkWIxfG3RfAl
	 BbC0X49iMIS+Mqq4h7Ld729fjfM/oPd7UdyMKZ+P+osifL6OmNYOSxOQaMLO81qxbN
	 juwX5R4KBZzww==
Date: Fri, 30 May 2025 18:48:54 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 16/19] xen/dt: Extract helper to map nodes to module
 kinds
In-Reply-To: <20250530120242.39398-17-agarciav@amd.com>
Message-ID: <alpine.DEB.2.22.394.2505301848460.1147082@ubuntu-linux-20-04-desktop>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com> <20250530120242.39398-1-agarciav@amd.com> <20250530120242.39398-17-agarciav@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 30 May 2025, Alejandro Vallejo wrote:
> This will be required later by x86 code in order to do early identification
> of boot modules when booting off a DTB.
> 
> Not a functional change.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/common/device-tree/bootfdt.c      | 16 ++++++++++++++++
>  xen/common/device-tree/bootinfo-fdt.c | 14 +-------------
>  xen/include/xen/bootfdt.h             |  7 +++++++
>  3 files changed, 24 insertions(+), 13 deletions(-)
> 
> diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
> index 5decf17faf..2dda7a9d19 100644
> --- a/xen/common/device-tree/bootfdt.c
> +++ b/xen/common/device-tree/bootfdt.c
> @@ -4,6 +4,22 @@
>  #include <xen/lib.h>
>  #include <xen/libfdt/libfdt.h>
>  
> +bootmodule_kind __init fdt_node_to_kind(const void *fdt, int node)
> +{
> +    if ( fdt_node_check_compatible(fdt, node, "xen,linux-zimage") == 0 ||
> +         fdt_node_check_compatible(fdt, node, "multiboot,kernel") == 0 )
> +        return BOOTMOD_KERNEL;
> +    if ( fdt_node_check_compatible(fdt, node, "xen,linux-initrd") == 0 ||
> +         fdt_node_check_compatible(fdt, node, "multiboot,ramdisk") == 0 )
> +        return BOOTMOD_RAMDISK;
> +    if ( fdt_node_check_compatible(fdt, node, "xen,xsm-policy") == 0 )
> +        return BOOTMOD_XSM;
> +    if ( fdt_node_check_compatible(fdt, node, "multiboot,device-tree") == 0 )
> +        return BOOTMOD_GUEST_DTB;
> +
> +    return BOOTMOD_UNKNOWN;
> +}
> +
>  uint32_t __init device_tree_get_u32(const void *fdt, int node,
>                                      const char *prop_name, uint32_t dflt)
>  {
> diff --git a/xen/common/device-tree/bootinfo-fdt.c b/xen/common/device-tree/bootinfo-fdt.c
> index 736f877616..dc399bbf61 100644
> --- a/xen/common/device-tree/bootinfo-fdt.c
> +++ b/xen/common/device-tree/bootinfo-fdt.c
> @@ -239,19 +239,7 @@ static void __init process_multiboot_node(const void *fdt, int node,
>  
>      cell = (const __be32 *)prop->data;
>      device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
> -
> -    if ( fdt_node_check_compatible(fdt, node, "xen,linux-zimage") == 0 ||
> -         fdt_node_check_compatible(fdt, node, "multiboot,kernel") == 0 )
> -        kind = BOOTMOD_KERNEL;
> -    else if ( fdt_node_check_compatible(fdt, node, "xen,linux-initrd") == 0 ||
> -              fdt_node_check_compatible(fdt, node, "multiboot,ramdisk") == 0 )
> -        kind = BOOTMOD_RAMDISK;
> -    else if ( fdt_node_check_compatible(fdt, node, "xen,xsm-policy") == 0 )
> -        kind = BOOTMOD_XSM;
> -    else if ( fdt_node_check_compatible(fdt, node, "multiboot,device-tree") == 0 )
> -        kind = BOOTMOD_GUEST_DTB;
> -    else
> -        kind = BOOTMOD_UNKNOWN;
> +    kind = fdt_node_to_kind(fdt, node);
>  
>      /**
>       * Guess the kind of these first two unknowns respectively:
> diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
> index 766956e102..7bc6209986 100644
> --- a/xen/include/xen/bootfdt.h
> +++ b/xen/include/xen/bootfdt.h
> @@ -102,4 +102,11 @@ uint32_t device_tree_get_u32(const void *fdt, int node,
>  void device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
>                           uint32_t size_cells, paddr_t *start, paddr_t *size);
>  
> +/*
> + * Probe an FDT node thought to be a boot module to identify its kind.
> + *
> + * If correctly identified, returns the detected kind, otherwise BOOTMOD_UNKNOWN
> + */
> +bootmodule_kind fdt_node_to_kind(const void *fdt, int node);
> +
>  #endif /* XEN_BOOTFDT_H */
> -- 
> 2.43.0
> 

