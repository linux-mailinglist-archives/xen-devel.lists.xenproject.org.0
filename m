Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0987F424620
	for <lists+xen-devel@lfdr.de>; Wed,  6 Oct 2021 20:33:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203125.358190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYBiX-0001hF-NK; Wed, 06 Oct 2021 18:32:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203125.358190; Wed, 06 Oct 2021 18:32:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYBiX-0001fR-KG; Wed, 06 Oct 2021 18:32:37 +0000
Received: by outflank-mailman (input) for mailman id 203125;
 Wed, 06 Oct 2021 18:32:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mYBiW-0001fL-E1
 for xen-devel@lists.xenproject.org; Wed, 06 Oct 2021 18:32:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mYBiV-0001U1-06; Wed, 06 Oct 2021 18:32:35 +0000
Received: from [92.174.63.74] (helo=[192.168.1.232])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mYBiU-0005BH-NI; Wed, 06 Oct 2021 18:32:34 +0000
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
	bh=DGSbHLS92yhnnWE4hrus3xUQS1vIhlkGW6ZQK8/XI3g=; b=xHZW3wpuzSAwouRVOqc91Ixc0Y
	GHgBubECPuSjNQimLfJvRxbMh+BrGawmq2orTPFSYKu9wlLjRVOPwxjuCdukJtRrCXeOtjW6u2ikp
	LTRQZCg3E91uK9jHVFtsFFeHXS8vpyjCVi2lOqjuGsxv70YZZB+xMp5iMOqDQwe51hOY=;
Message-ID: <8691f762-e4ca-b099-8b4e-87b63b16abe0@xen.org>
Date: Wed, 6 Oct 2021 20:32:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.1.2
Subject: Re: [PATCH v4 1/3] arm/efi: Introduce xen,uefi-cfg-load DT property
To: Luca Fancellu <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com, wei.chen@arm.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
References: <20210930142846.13348-1-luca.fancellu@arm.com>
 <20210930142846.13348-2-luca.fancellu@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20210930142846.13348-2-luca.fancellu@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Luca,

Sorry for jumping late in the conversation. While skimming through what 
has been committed, I noticed one potential issue in this patch and have 
also a question.

On 30/09/2021 16:28, Luca Fancellu wrote:
> Introduce the xen,uefi-cfg-load DT property of /chosen
> node for ARM whose presence decide whether to force
> the load of the UEFI Xen configuration file.
> 
> The logic is that if any multiboot,module is found in
> the DT, then the xen,uefi-cfg-load property is used to see
> if the UEFI Xen configuration file is needed.
> 
> Modify a comment in efi_arch_use_config_file, removing
> the part that states "dom0 required" because it's not
> true anymore with this commit.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
> v4 changes:
> - modify property name to xen,uefi-cfg-load
> v3 changes:
> - add documentation to misc/arm/device-tree/booting.txt
> - Modified variable name and logic from skip_cfg_file to
> load_cfg_file
> - Add in the commit message that I'm modifying a comment.
> v2 changes:
> - Introduced uefi,cfg-load property
> - Add documentation about the property
> ---
>   docs/misc/arm/device-tree/booting.txt |  8 ++++++++
>   docs/misc/efi.pandoc                  |  2 ++
>   xen/arch/arm/efi/efi-boot.h           | 28 ++++++++++++++++++++++-----
>   3 files changed, 33 insertions(+), 5 deletions(-)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 44cd9e1a9a..352b0ec43a 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -121,6 +121,14 @@ A Xen-aware bootloader would set xen,xen-bootargs for Xen, xen,dom0-bootargs
>   for Dom0 and bootargs for native Linux.
>   
>   
> +UEFI boot and DT
> +================
> +
> +When Xen is booted using UEFI, it doesn't read the configuration file if any
> +multiboot module is specified. To force Xen to load the configuration file, the
> +boolean property xen,uefi-cfg-load must be declared in the /chosen node.
> +
> +
>   Creating Multiple Domains directly from Xen
>   ===========================================
>   
> diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
> index ac3cd58cae..ed85351541 100644
> --- a/docs/misc/efi.pandoc
> +++ b/docs/misc/efi.pandoc
> @@ -14,6 +14,8 @@ loaded the modules and describes them in the device tree provided to Xen.  If a
>   bootloader provides a device tree containing modules then any configuration
>   files are ignored, and the bootloader is responsible for populating all
>   relevant device tree nodes.
> +The property "xen,uefi-cfg-load" can be specified in the /chosen node to force
> +Xen to load the configuration file even if multiboot modules are found.

I think this wants to be clarified. Lets imagine both the Device-Tree 
and the cfg provides a kernel. Which one will get used?


>   
>   Once built, `make install-xen` will place the resulting binary directly into
>   the EFI boot partition, provided `EFI_VENDOR` is set in the environment (and
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index cf9c37153f..a3e46453d4 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -581,22 +581,40 @@ static void __init efi_arch_load_addr_check(EFI_LOADED_IMAGE *loaded_image)
>   
>   static bool __init efi_arch_use_config_file(EFI_SYSTEM_TABLE *SystemTable)
>   {
> +    bool load_cfg_file = true;
>       /*
>        * For arm, we may get a device tree from GRUB (or other bootloader)
>        * that contains modules that have already been loaded into memory.  In
> -     * this case, we do not use a configuration file, and rely on the
> -     * bootloader to have loaded all required modules and appropriate
> -     * options.
> +     * this case, we search for the property xen,uefi-cfg-load in the /chosen
> +     * node to decide whether to skip the UEFI Xen configuration file or not.
>        */
>   
>       fdt = lookup_fdt_config_table(SystemTable);
>       dtbfile.ptr = fdt;
>       dtbfile.need_to_free = false; /* Config table memory can't be freed. */
> -    if ( !fdt || fdt_node_offset_by_compatible(fdt, 0, "multiboot,module") < 0 )
> +
> +    if ( fdt_node_offset_by_compatible(fdt, 0, "multiboot,module") > 0 )

AFAICT, fdt_node_offset_by_compatible expects 'fdt' to be non-NULL. 
However, lookup_fdt_config_table() may return NULL on platform with no 
Device-Tree (server tends to be ACPI only). So wouldn't this result to 
dereference NULL and crash?

> +    {
> +        /* Locate chosen node */
> +        int node = fdt_subnode_offset(fdt, 0, "chosen");
> +        const void *cfg_load_prop;
> +        int cfg_load_len;
> +
> +        if ( node > 0 )
> +        {
> +            /* Check if xen,uefi-cfg-load property exists */
> +            cfg_load_prop = fdt_getprop(fdt, node, "xen,uefi-cfg-load",
> +                                        &cfg_load_len);
> +            if ( !cfg_load_prop )
> +                load_cfg_file = false;
> +        }
> +    }
> +
> +    if ( !fdt || load_cfg_file )
>       {
>           /*
>            * We either have no FDT, or one without modules, so we must have a
> -         * Xen EFI configuration file to specify modules.  (dom0 required)
> +         * Xen EFI configuration file to specify modules.
>            */
>           return true;
>       }
> 

Cheers,

-- 
Julien Grall

