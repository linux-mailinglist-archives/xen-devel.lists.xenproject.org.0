Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAC741C9FA
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 18:18:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199244.353176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVcH8-0000ow-IV; Wed, 29 Sep 2021 16:17:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199244.353176; Wed, 29 Sep 2021 16:17:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVcH8-0000n5-FH; Wed, 29 Sep 2021 16:17:42 +0000
Received: by outflank-mailman (input) for mailman id 199244;
 Wed, 29 Sep 2021 16:17:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=arYX=OT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mVcH6-0000mz-Il
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 16:17:40 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b145f211-232a-4400-8ed4-805faa3d0a02;
 Wed, 29 Sep 2021 16:17:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 689B66128C;
 Wed, 29 Sep 2021 16:17:38 +0000 (UTC)
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
X-Inumbo-ID: b145f211-232a-4400-8ed4-805faa3d0a02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632932258;
	bh=/FWzk9gz+WM+agqm0EVIgp4Xe6RX12pr52i65jxXhFE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=t1Y1Bpm7NRopopKAafJm+PksyW+Bt+X0JudkwBSbyQfNxPeGiiafg8bN2abCoFVgB
	 Bme0o8v+N0csTWDfieLKJZytt6Iz9tlduZPXVr4YTM/Hrebdk/9sWUxbK6UlAJBoSG
	 daWi+poGc4rUAxLbbb63eSN9OWjsPqEkvAiqpoU57kKYrhfJUhqXnetNcwtHHGTopv
	 91BoEv+Os2gDjoEoZNF+UpZRo07xkajn08/XPOYXEf+BPTPFItXO8uID+q3XDLwg8m
	 q8mPLF6lqeo8VHIAImAjVFbxxqH9hGEfq78/iH8uf0vE9hOzlm25G9A73i3guzUoOV
	 BjwGs/6O9b/6A==
Date: Wed, 29 Sep 2021 09:17:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Luca Fancellu <luca.fancellu@arm.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, 
    Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com, 
    Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 1/3] arm/efi: Introduce uefi,cfg-load DT property
In-Reply-To: <46255EF5-17E6-41AC-A6D9-5D276056C0DA@arm.com>
Message-ID: <alpine.DEB.2.21.2109290916541.5022@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2109281459250.5022@sstabellini-ThinkPad-T480s> <AB8FEF63-EA1F-427F-AF2B-13C1E930F682@arm.com> <46255EF5-17E6-41AC-A6D9-5D276056C0DA@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 29 Sep 2021, Luca Fancellu wrote:
> > On Tue, 28 Sep 2021, Luca Fancellu wrote:
> >> Introduce the uefi,cfg-load DT property of /chosen
> >> node for ARM whose presence decide whether to force
> >> the load of the UEFI Xen configuration file.
> >> 
> >> The logic is that if any multiboot,module is found in
> >> the DT, then the uefi,cfg-load property is used to see
> >> if the UEFI Xen configuration file is needed.
> >> 
> >> Modify a comment in efi_arch_use_config_file, removing
> >> the part that states "dom0 required" because it's not
> >> true anymore with this commit.
> >> 
> >> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> > 
> > The patch looks good. Only one minor change: given that this is a Xen
> > parameter that we are introducing and not a parameter defined by UEFI
> > Forum, I think uefi,cfg-load should be called xen,uefi-cfg-load instead.
> > Because "xen," is our prefix, while "uefi," is not.
> > 
> > With that minor change:
> > 
> > Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> Yes I will rename it.
> 
> > 
> > 
> > Note that the uefi,binary property is different because that property is
> > for xen,domain nodes, so we are already in a Xen specific namespace when
> > we are using it. Instead this property is for /chosen which is not a Xen
> > specific node.
> 
> Given that uefi,binary will be used also for multiboot,module directly under /chosen
> for Dom0, do you think I should rename also that to xen,uefi-binary?

Yes, maybe to stay on the safe side, it would be better to also rename
uefi,binary to xen,uefi-binary.



> >> ---
> >> v3 changes:
> >> - add documentation to misc/arm/device-tree/booting.txt
> >> - Modified variable name and logic from skip_cfg_file to
> >> load_cfg_file
> >> - Add in the commit message that I'm modifying a comment.
> >> v2 changes:
> >> - Introduced uefi,cfg-load property
> >> - Add documentation about the property
> >> ---
> >> docs/misc/arm/device-tree/booting.txt |  8 ++++++++
> >> docs/misc/efi.pandoc                  |  2 ++
> >> xen/arch/arm/efi/efi-boot.h           | 28 ++++++++++++++++++++++-----
> >> 3 files changed, 33 insertions(+), 5 deletions(-)
> >> 
> >> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> >> index 44cd9e1a9a..cf878b478e 100644
> >> --- a/docs/misc/arm/device-tree/booting.txt
> >> +++ b/docs/misc/arm/device-tree/booting.txt
> >> @@ -121,6 +121,14 @@ A Xen-aware bootloader would set xen,xen-bootargs for Xen, xen,dom0-bootargs
> >> for Dom0 and bootargs for native Linux.
> >> 
> >> 
> >> +UEFI boot and DT
> >> +================
> >> +
> >> +When Xen is booted using UEFI, it doesn't read the configuration file if any
> >> +multiboot module is specified. To force Xen to load the configuration file, the
> >> +boolean property uefi,cfg-load must be declared in the /chosen node.
> >> +
> >> +
> >> Creating Multiple Domains directly from Xen
> >> ===========================================
> >> 
> >> diff --git a/docs/misc/efi.pandoc b/docs/misc/efi.pandoc
> >> index ac3cd58cae..e289c5e7ba 100644
> >> --- a/docs/misc/efi.pandoc
> >> +++ b/docs/misc/efi.pandoc
> >> @@ -14,6 +14,8 @@ loaded the modules and describes them in the device tree provided to Xen.  If a
> >> bootloader provides a device tree containing modules then any configuration
> >> files are ignored, and the bootloader is responsible for populating all
> >> relevant device tree nodes.
> >> +The property "uefi,cfg-load" can be specified in the /chosen node to force Xen
> >> +to load the configuration file even if multiboot modules are found.
> >> 
> >> Once built, `make install-xen` will place the resulting binary directly into
> >> the EFI boot partition, provided `EFI_VENDOR` is set in the environment (and
> >> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> >> index cf9c37153f..4f1b01757d 100644
> >> --- a/xen/arch/arm/efi/efi-boot.h
> >> +++ b/xen/arch/arm/efi/efi-boot.h
> >> @@ -581,22 +581,40 @@ static void __init efi_arch_load_addr_check(EFI_LOADED_IMAGE *loaded_image)
> >> 
> >> static bool __init efi_arch_use_config_file(EFI_SYSTEM_TABLE *SystemTable)
> >> {
> >> +    bool load_cfg_file = true;
> >>     /*
> >>      * For arm, we may get a device tree from GRUB (or other bootloader)
> >>      * that contains modules that have already been loaded into memory.  In
> >> -     * this case, we do not use a configuration file, and rely on the
> >> -     * bootloader to have loaded all required modules and appropriate
> >> -     * options.
> >> +     * this case, we search for the property uefi,cfg-load in the /chosen node
> >> +     * to decide whether to skip the UEFI Xen configuration file or not.
> >>      */
> >> 
> >>     fdt = lookup_fdt_config_table(SystemTable);
> >>     dtbfile.ptr = fdt;
> >>     dtbfile.need_to_free = false; /* Config table memory can't be freed. */
> >> -    if ( !fdt || fdt_node_offset_by_compatible(fdt, 0, "multiboot,module") < 0 )
> >> +
> >> +    if ( fdt_node_offset_by_compatible(fdt, 0, "multiboot,module") > 0 )
> >> +    {
> >> +        /* Locate chosen node */
> >> +        int node = fdt_subnode_offset(fdt, 0, "chosen");
> >> +        const void *cfg_load_prop;
> >> +        int cfg_load_len;
> >> +
> >> +        if ( node > 0 )
> >> +        {
> >> +            /* Check if uefi,cfg-load property exists */
> >> +            cfg_load_prop = fdt_getprop(fdt, node, "uefi,cfg-load",
> >> +                                        &cfg_load_len);
> >> +            if ( !cfg_load_prop )
> >> +                load_cfg_file = false;
> >> +        }
> >> +    }
> >> +
> >> +    if ( !fdt || load_cfg_file )
> >>     {
> >>         /*
> >>          * We either have no FDT, or one without modules, so we must have a
> >> -         * Xen EFI configuration file to specify modules.  (dom0 required)
> >> +         * Xen EFI configuration file to specify modules.
> >>          */
> >>         return true;
> >>     }
> >> -- 
> >> 2.17.1
> >> 
> 
> 

