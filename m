Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A8550942C
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 02:30:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309714.526160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhKiD-0001L5-N7; Thu, 21 Apr 2022 00:30:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309714.526160; Thu, 21 Apr 2022 00:30:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhKiD-0001Ig-JZ; Thu, 21 Apr 2022 00:30:21 +0000
Received: by outflank-mailman (input) for mailman id 309714;
 Thu, 21 Apr 2022 00:30:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=45zg=U7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nhKiC-0001Ia-Qw
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 00:30:20 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39429bf7-c10a-11ec-a405-831a346695d4;
 Thu, 21 Apr 2022 02:30:19 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 55219B82239;
 Thu, 21 Apr 2022 00:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A137C385A0;
 Thu, 21 Apr 2022 00:30:17 +0000 (UTC)
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
X-Inumbo-ID: 39429bf7-c10a-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650501017;
	bh=Yvmw5PHMhlY0F2tFAujdl+1NQEj9T2rDNEyfu7S1j+4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RX6eUHm+8GXgQ7pWkMXbtP1RJ37VGYqLmtfyDhuNfM3RPVuAhKpuyEoiCJwALxkK6
	 Bj+v+AoESa/4haDpoGB2G2z8gLfAIfpBecGPSXQuw96N4dmsMk3b4GUhtJLmgEbJ3M
	 USLHFvnZw1swpHjJohWoA03SIZ9OiQRT1CCeP31ulak2I847yrs5w3bQ+ZLO+BFMWH
	 Ml4Ks3SC7YeGpTsKjV1viMQO3sYBj7tZikq139/ej3o2T6KsN6pAp9+uOX4uhqYGkP
	 V0KvM6ulHevER+WUO9lPGeod0yKIiZSLGP4W5DWqDDfTRCGtX2Egm9pG9jBgMPrjcV
	 MXQ6TvIH3r82A==
Date: Wed, 20 Apr 2022 17:30:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, nd@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 04/10] xen/arm: Keep memory nodes in device tree when
 Xen boots from EFI
In-Reply-To: <20220418090735.3940393-5-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.22.394.2204201728560.915916@ubuntu-linux-20-04-desktop>
References: <20220418090735.3940393-1-wei.chen@arm.com> <20220418090735.3940393-5-wei.chen@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 18 Apr 2022, Wei Chen wrote:
> In current code, when Xen is booting from EFI, it will delete
> all memory nodes in device tree. This would work well in current
> stage, because Xen can get memory map from EFI system table.
> However, EFI system table cannot completely replace memory nodes
> of device tree. EFI system table doesn't contain memory NUMA
> information. Xen depends on ACPI SRAT or device tree memory nodes
> to parse memory blocks' NUMA mapping. So in EFI + DTB boot, Xen
> doesn't have any method to get numa-node-id for memory blocks any
> more. This makes device tree based NUMA support become impossible
> for Xen in EFI + DTB boot.
> 
> So in this patch, we will keep memory nodes in device tree for
> NUMA code to parse memory numa-node-id later.
> 
> As a side effect, if we still parse boot memory information in
> early_scan_node, bootmem.info will calculate memory ranges in
> memory nodes twice. So we have to prevent early_scan_node to
> parse memory nodes in EFI boot.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> v1 -> v2:
> 1. Move this patch from later to early of this series.
> 2. Refine commit message.
> ---
>  xen/arch/arm/bootfdt.c      |  8 +++++++-
>  xen/arch/arm/efi/efi-boot.h | 25 -------------------------
>  2 files changed, 7 insertions(+), 26 deletions(-)
> 
> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
> index e318ef9603..78e10c6ebc 100644
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
> +     * If Xen has been booted via UEFI, the memory banks are
> +     * populated. So we should skip the parsing.
> +     */
> +    if ( !efi_enabled(EFI_BOOT) &&
> +         device_tree_node_matches(fdt, node, "memory") )
>          rc = process_memory_node(fdt, node, name, depth,
>                                   address_cells, size_cells, &bootinfo.mem);
>      else if ( depth == 1 && !dt_node_cmp(name, "reserved-memory") )
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index e452b687d8..59d93c24a1 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -231,33 +231,8 @@ EFI_STATUS __init fdt_add_uefi_nodes(EFI_SYSTEM_TABLE *sys_table,
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
> -- 
> 2.25.1
> 

