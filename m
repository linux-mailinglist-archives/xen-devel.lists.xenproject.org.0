Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0658141529A
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 23:20:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193082.343913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT9er-0004Lg-2Q; Wed, 22 Sep 2021 21:20:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193082.343913; Wed, 22 Sep 2021 21:20:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT9eq-0004Jt-Ve; Wed, 22 Sep 2021 21:20:00 +0000
Received: by outflank-mailman (input) for mailman id 193082;
 Wed, 22 Sep 2021 21:19:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ilSY=OM=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mT9ep-0004Jn-7L
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 21:19:59 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d672e0f0-1bea-11ec-b9e3-12813bfff9fa;
 Wed, 22 Sep 2021 21:19:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E08F761107;
 Wed, 22 Sep 2021 21:19:56 +0000 (UTC)
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
X-Inumbo-ID: d672e0f0-1bea-11ec-b9e3-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632345597;
	bh=M1UDbhXsb2YNGVdOS6vL4VAm7p9HjWIoQIvjCnDrze4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RUlL8pekKkkNBRmrXS+MtyiV2eRwQ/ZDR8IhLbbipbBiOHsNCFuJuxQ4HfcJeqmDh
	 fg/wTRCmHgeisG1rfqHGks/esMXo5JbyCNkTUV9OA19x4z7ogNTOCVy8XO08NwYbSs
	 /ppLSEUoXXMnMvBVvm8c2otxASTFCRGhDXccfKzoyW//5pJVnnwmX6l2Ca3H9UQTGr
	 FgFeN83/JCWlEFfrFQ1cv/LaRO6lWeSscc7ba8fuGTC8FWTV+insu0ygTpn5yPu3cL
	 lC/UUyllYEBSysO0lbAg06f7xT6Sw1tRP3PR0+Gyz1R/YusWlKRRi1jnQkUvaXvcQc
	 jRZ9/sMcLne4g==
Date: Wed, 22 Sep 2021 14:19:55 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, wei.chen@arm.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 1/2] arm/efi: Introduce uefi,cfg-load DT property
In-Reply-To: <20210922141341.42288-2-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.21.2109221411200.17979@sstabellini-ThinkPad-T480s>
References: <20210922141341.42288-1-luca.fancellu@arm.com> <20210922141341.42288-2-luca.fancellu@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 22 Sep 2021, Luca Fancellu wrote:
> Introduce the uefi,cfg-load DT property of /chosen
> node for ARM whose presence decide whether to force
> the load of the UEFI Xen configuration file.
> 
> The logic is that if any multiboot,module is found in
> the DT, then the uefi,cfg-load property is used to see
> if the UEFI Xen configuration file is needed.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>

The patch looks OK, just a couple of minor comments below.


> ---
> v2 changes:
> - Introduced uefi,cfg-load property
> - Add documentation about the property
> ---
>  docs/misc/efi.pandoc        |  2 ++
>  xen/arch/arm/efi/efi-boot.h | 28 +++++++++++++++++++++++-----
>  2 files changed, 25 insertions(+), 5 deletions(-)
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

I think that, in addition to this, we also need to add the property to
docs/misc/arm/device-tree/booting.txt where our "official" device tree
bindings are maintained. I would add it below "Command lines" and before
"Creating Multiple Domains directly from Xen" maybe as a new chapter.
It could be called "Other Options" but other ideas could be valid too.

You can say that uefi,cfg-load is a boolean.


>  Once built, `make install-xen` will place the resulting binary directly into
>  the EFI boot partition, provided `EFI_VENDOR` is set in the environment (and
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index cf9c37153f..8ceeba4ad1 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -581,22 +581,40 @@ static void __init efi_arch_load_addr_check(EFI_LOADED_IMAGE *loaded_image)
>  
>  static bool __init efi_arch_use_config_file(EFI_SYSTEM_TABLE *SystemTable)
>  {
> +    bool skip_cfg_file = false;
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
> +                skip_cfg_file = true;
> +        }
> +    }
> +
> +    if ( !fdt || !skip_cfg_file )

Just a suggestion, but rather than the double negative, wouldn't it be
simpler to define it as

    bool load_cfg_file = true;

?


>      {
>          /*
>           * We either have no FDT, or one without modules, so we must have a
> -         * Xen EFI configuration file to specify modules.  (dom0 required)
> +         * Xen EFI configuration file to specify modules.
>           */

Also mention in the commit message that you are taking the opportunity
to update this comment do remove "dom0 required".


>          return true;
>      }
> -- 
> 2.17.1
> 

