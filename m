Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77884416956
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 03:23:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194714.346942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTZvt-0000fQ-C5; Fri, 24 Sep 2021 01:23:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194714.346942; Fri, 24 Sep 2021 01:23:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTZvt-0000dZ-8p; Fri, 24 Sep 2021 01:23:21 +0000
Received: by outflank-mailman (input) for mailman id 194714;
 Fri, 24 Sep 2021 01:23:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UhVx=OO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mTZvr-0000dT-Gi
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 01:23:19 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ff4dcb0c-1cd5-11ec-ba97-12813bfff9fa;
 Fri, 24 Sep 2021 01:23:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5F64F60D42;
 Fri, 24 Sep 2021 01:23:17 +0000 (UTC)
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
X-Inumbo-ID: ff4dcb0c-1cd5-11ec-ba97-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632446597;
	bh=v7XjX7PamS/qhqjnlrVsOMjD1o/G9sQUnxpd/xsgtcQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=l4hYsbsGLPQvcbP2YRVPZ9CvXuJ7myq3NeySsNEOaXp/65cyptyBmMqHljO0uX4/P
	 GJIehVEUU6sl6VDanZ6t7PuFW44T78mKwx4mejKni+/QvI5jkcOssGz9X+oEOGJwua
	 1aH7F2HvbsQ2rxyyfbz3lKsawlfTEaWuzIWi5vZXdE78vYpCBhEQA5CkJyYkI1sOnn
	 x3av2AdiWKyVyuJsAoHoC2HVCAOaISbfEvPHEXpMmECAYI4+2oe2GXd3QMfpyXsTGQ
	 dHCH78Ye7V5zugptDhIObj4NLnzqoxdGrR3JeXTg5lV/MGqfK6tNO5nneF3/INjLOh
	 xjJk9gFl6vsLA==
Date: Thu, 23 Sep 2021 18:23:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    Bertrand.Marquis@arm.com
Subject: Re: [PATCH 21/37] xen/arm: Keep memory nodes in dtb for NUMA when
 boot from EFI
In-Reply-To: <20210923120236.3692135-22-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.21.2109231822090.17979@sstabellini-ThinkPad-T480s>
References: <20210923120236.3692135-1-wei.chen@arm.com> <20210923120236.3692135-22-wei.chen@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 23 Sep 2021, Wei Chen wrote:
> EFI can get memory map from EFI system table. But EFI system
> table doesn't contain memory NUMA information, EFI depends on
> ACPI SRAT or device tree memory node to parse memory blocks'
> NUMA mapping.
> 
> But in current code, when Xen is booting from EFI, it will
> delete all memory nodes in device tree. So in UEFI + DTB
> boot, we don't have numa-node-id for memory blocks any more.
> 
> So in this patch, we will keep memory nodes in device tree for
> NUMA code to parse memory numa-node-id later.
> 
> As a side effect, if we still parse boot memory information in
> early_scan_node, bootmem.info will calculate memory ranges in
> memory nodes twice. So we have to prevent early_scan_node to
> parse memory nodes in EFI boot.
> 
> As EFI APIs only can be used in Arm64, so we introduced a stub
> API for non-EFI supported Arm32. This will prevent

This last sentence is incomplete.

But aside from that, this patch looks good to me.


> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>  xen/arch/arm/bootfdt.c      |  8 +++++++-
>  xen/arch/arm/efi/efi-boot.h | 25 -------------------------
>  xen/include/xen/efi.h       |  7 +++++++
>  3 files changed, 14 insertions(+), 26 deletions(-)
> 
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index afaa0e249b..6bc5a465ec 100644
> --- a/xen/arch/arm/bootfdt.c
> +++ b/xen/arch/arm/bootfdt.c
> @@ -11,6 +11,7 @@
>  #include <xen/lib.h>
>  #include <xen/kernel.h>
>  #include <xen/init.h>
> +#include <xen/efi.h>
>  #include <xen/device_tree.h>
>  #include <xen/libfdt/libfdt.h>
>  #include <xen/sort.h>
> @@ -370,7 +371,12 @@ static int __init early_scan_node(const void *fdt,
>  {
>      int rc = 0;
>  
> -    if ( device_tree_node_matches(fdt, node, "memory") )
> +    /*
> +     * If Xen has been booted via UEFI, the memory banks will already
> +     * be populated. So we should skip the parsing.
> +     */
> +    if ( !efi_enabled(EFI_BOOT) &&
> +         device_tree_node_matches(fdt, node, "memory"))
>          rc = process_memory_node(fdt, node, name, depth,
>                                   address_cells, size_cells, &bootinfo.mem);
>      else if ( depth == 1 && !dt_node_cmp(name, "reserved-memory") )
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index cf9c37153f..d0a9987fa4 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -197,33 +197,8 @@ EFI_STATUS __init fdt_add_uefi_nodes(EFI_SYSTEM_TABLE *sys_table,
>      int status;
>      u32 fdt_val32;
>      u64 fdt_val64;
> -    int prev;
>      int num_rsv;
>  
> -    /*
> -     * Delete any memory nodes present.  The EFI memory map is the only
> -     * memory description provided to Xen.
> -     */
> -    prev = 0;
> -    for (;;)
> -    {
> -        const char *type;
> -        int len;
> -
> -        node = fdt_next_node(fdt, prev, NULL);
> -        if ( node < 0 )
> -            break;
> -
> -        type = fdt_getprop(fdt, node, "device_type", &len);
> -        if ( type && strncmp(type, "memory", len) == 0 )
> -        {
> -            fdt_del_node(fdt, node);
> -            continue;
> -        }
> -
> -        prev = node;
> -    }
> -
>     /*
>      * Delete all memory reserve map entries. When booting via UEFI,
>      * kernel will use the UEFI memory map to find reserved regions.
> diff --git a/xen/include/xen/efi.h b/xen/include/xen/efi.h
> index 661a48286a..b52a4678e9 100644
> --- a/xen/include/xen/efi.h
> +++ b/xen/include/xen/efi.h
> @@ -47,6 +47,13 @@ int efi_runtime_call(struct xenpf_efi_runtime_call *);
>  int efi_compat_get_info(uint32_t idx, union compat_pf_efi_info *);
>  int efi_compat_runtime_call(struct compat_pf_efi_runtime_call *);
>  
> +#else
> +
> +static inline bool efi_enabled(unsigned int feature)
> +{
> +    return false;
> +}
> +
>  #endif /* CONFIG_EFI*/
>  
>  #endif /* !__ASSEMBLY__ */
> -- 
> 2.25.1
> 

