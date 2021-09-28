Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FAA41B9D2
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 00:04:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198508.352045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVLCK-0005Ix-E2; Tue, 28 Sep 2021 22:03:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198508.352045; Tue, 28 Sep 2021 22:03:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVLCK-0005GO-9j; Tue, 28 Sep 2021 22:03:36 +0000
Received: by outflank-mailman (input) for mailman id 198508;
 Tue, 28 Sep 2021 22:03:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gf2A=OS=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mVLCI-0005GI-Qf
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 22:03:34 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f0dfba6-681e-4ac6-8f7b-0f305addd103;
 Tue, 28 Sep 2021 22:03:33 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 82CFB6136A;
 Tue, 28 Sep 2021 22:03:32 +0000 (UTC)
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
X-Inumbo-ID: 8f0dfba6-681e-4ac6-8f7b-0f305addd103
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632866612;
	bh=X58llmZjRCUwrjn8CXsxQA2PeJX9NB7ziIvsYon/dZg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RxOQgknj//rnwjfjkvYaqWwRHIvTDf5FRykuTaXqKdfJ8LASz+Zu6zP40DzlvIMY4
	 jKXkuR2KaMOGfbbBuU8jqybL6/QQAa70E+VC6HnH4fpwB8nU43TE+Dm9m+buqOwmSK
	 Hjqel68JgCju/H001d0Wfai8tP0QbMxnGKD9M+2DwkX9Z+nYNdJ+BcYGCx+zFIa5oM
	 yXfgGlIT4WHOibKXetiEy5Eh5j2S8Vc8rfj2/3qdZ7vIm8HMiL0gvcpX0CWCU7tkEh
	 jHKFlU0BL2hL83Jkla5elQ486q/SZ+YBLTR3vuHOdHcV8ppsgXkuzXjoJzubos8xaw
	 KAin8mcUOz+TA==
Date: Tue, 28 Sep 2021 15:03:32 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, wei.chen@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 1/3] arm/efi: Introduce uefi,cfg-load DT property
In-Reply-To: <20210928163209.49611-2-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.21.2109281459250.5022@sstabellini-ThinkPad-T480s>
References: <20210928163209.49611-1-luca.fancellu@arm.com> <20210928163209.49611-2-luca.fancellu@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 28 Sep 2021, Luca Fancellu wrote:
> Introduce the uefi,cfg-load DT property of /chosen
> node for ARM whose presence decide whether to force
> the load of the UEFI Xen configuration file.
> 
> The logic is that if any multiboot,module is found in
> the DT, then the uefi,cfg-load property is used to see
> if the UEFI Xen configuration file is needed.
> 
> Modify a comment in efi_arch_use_config_file, removing
> the part that states "dom0 required" because it's not
> true anymore with this commit.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

The patch looks good. Only one minor change: given that this is a Xen
parameter that we are introducing and not a parameter defined by UEFI
Forum, I think uefi,cfg-load should be called xen,uefi-cfg-load instead.
Because "xen," is our prefix, while "uefi," is not.

With that minor change:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


Note that the uefi,binary property is different because that property is
for xen,domain nodes, so we are already in a Xen specific namespace when
we are using it. Instead this property is for /chosen which is not a Xen
specific node.



> ---
> v3 changes:
> - add documentation to misc/arm/device-tree/booting.txt
> - Modified variable name and logic from skip_cfg_file to
> load_cfg_file
> - Add in the commit message that I'm modifying a comment.
> v2 changes:
> - Introduced uefi,cfg-load property
> - Add documentation about the property
> ---
>  docs/misc/arm/device-tree/booting.txt |  8 ++++++++
>  docs/misc/efi.pandoc                  |  2 ++
>  xen/arch/arm/efi/efi-boot.h           | 28 ++++++++++++++++++++++-----
>  3 files changed, 33 insertions(+), 5 deletions(-)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 44cd9e1a9a..cf878b478e 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -121,6 +121,14 @@ A Xen-aware bootloader would set xen,xen-bootargs for Xen, xen,dom0-bootargs
>  for Dom0 and bootargs for native Linux.
>  
>  
> +UEFI boot and DT
> +================
> +
> +When Xen is booted using UEFI, it doesn't read the configuration file if any
> +multiboot module is specified. To force Xen to load the configuration file, the
> +boolean property uefi,cfg-load must be declared in the /chosen node.
> +
> +
>  Creating Multiple Domains directly from Xen
>  ===========================================
>  
> diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
> index ac3cd58cae..e289c5e7ba 100644
> --- a/docs/misc/efi.pandoc
> +++ b/docs/misc/efi.pandoc
> @@ -14,6 +14,8 @@ loaded the modules and describes them in the device tree provided to Xen.  If a
>  bootloader provides a device tree containing modules then any configuration
>  files are ignored, and the bootloader is responsible for populating all
>  relevant device tree nodes.
> +The property "uefi,cfg-load" can be specified in the /chosen node to force Xen
> +to load the configuration file even if multiboot modules are found.
>  
>  Once built, `make install-xen` will place the resulting binary directly into
>  the EFI boot partition, provided `EFI_VENDOR` is set in the environment (and
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index cf9c37153f..4f1b01757d 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -581,22 +581,40 @@ static void __init efi_arch_load_addr_check(EFI_LOADED_IMAGE *loaded_image)
>  
>  static bool __init efi_arch_use_config_file(EFI_SYSTEM_TABLE *SystemTable)
>  {
> +    bool load_cfg_file = true;
>      /*
>       * For arm, we may get a device tree from GRUB (or other bootloader)
>       * that contains modules that have already been loaded into memory.  In
> -     * this case, we do not use a configuration file, and rely on the
> -     * bootloader to have loaded all required modules and appropriate
> -     * options.
> +     * this case, we search for the property uefi,cfg-load in the /chosen node
> +     * to decide whether to skip the UEFI Xen configuration file or not.
>       */
>  
>      fdt = lookup_fdt_config_table(SystemTable);
>      dtbfile.ptr = fdt;
>      dtbfile.need_to_free = false; /* Config table memory can't be freed. */
> -    if ( !fdt || fdt_node_offset_by_compatible(fdt, 0, "multiboot,module") < 0 )
> +
> +    if ( fdt_node_offset_by_compatible(fdt, 0, "multiboot,module") > 0 )
> +    {
> +        /* Locate chosen node */
> +        int node = fdt_subnode_offset(fdt, 0, "chosen");
> +        const void *cfg_load_prop;
> +        int cfg_load_len;
> +
> +        if ( node > 0 )
> +        {
> +            /* Check if uefi,cfg-load property exists */
> +            cfg_load_prop = fdt_getprop(fdt, node, "uefi,cfg-load",
> +                                        &cfg_load_len);
> +            if ( !cfg_load_prop )
> +                load_cfg_file = false;
> +        }
> +    }
> +
> +    if ( !fdt || load_cfg_file )
>      {
>          /*
>           * We either have no FDT, or one without modules, so we must have a
> -         * Xen EFI configuration file to specify modules.  (dom0 required)
> +         * Xen EFI configuration file to specify modules.
>           */
>          return true;
>      }
> -- 
> 2.17.1
> 

