Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 572DB40D0BC
	for <lists+xen-devel@lfdr.de>; Thu, 16 Sep 2021 02:17:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.187962.336994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQf5F-0004i0-EO; Thu, 16 Sep 2021 00:16:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 187962.336994; Thu, 16 Sep 2021 00:16:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQf5F-0004fD-BD; Thu, 16 Sep 2021 00:16:57 +0000
Received: by outflank-mailman (input) for mailman id 187962;
 Thu, 16 Sep 2021 00:16:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ef7n=OG=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mQf5D-0004f7-LL
 for xen-devel@lists.xenproject.org; Thu, 16 Sep 2021 00:16:55 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3c9481d1-ad2c-441b-8808-02056be20422;
 Thu, 16 Sep 2021 00:16:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9C0D060EB2;
 Thu, 16 Sep 2021 00:16:53 +0000 (UTC)
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
X-Inumbo-ID: 3c9481d1-ad2c-441b-8808-02056be20422
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1631751413;
	bh=onGWlFEk9oyIq3lK1eeV4qxYMy2d6NV2RY/n99pE2x8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VlxQgxuENrFMz6nl/au1A+RMahgcwbqcrwtg+XPbybcQIoP3EfCR5yEcpnPyB73uP
	 SYFYkZDBpqlvRJExytG5KDoI6p9D7kry+5HLLQ6u7wmkcG89biRmK1aMjYRh/gckXe
	 yIbgWVIA/IQ0rrAnV+KtE0hY3sJDi+pVvINKpjCo/a5GYHrL4AVSqXXotTO14NfGbI
	 t2QBCUwFHm2zBkbwgizYO2BfjxXw5grmbG5vV1KgpdBjVpyRDkmjQc9ss+fbxwOUJt
	 w/BdlxudpXg/2NRUorJw/IIRiisTHICfVBwzo9vvXYrnCEDQpx54iyq3wDFRY9IWp2
	 YrgVmihkscnrA==
Date: Wed, 15 Sep 2021 17:16:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Luca Fancellu <luca.fancellu@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, wei.chen@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, jbeulich@suse.com
Subject: Re: [PATCH 1/2] xen/efi: Restrict check for DT boot modules on EFI
 boot
In-Reply-To: <20210915142602.42862-2-luca.fancellu@arm.com>
Message-ID: <alpine.DEB.2.21.2109151445080.21985@sstabellini-ThinkPad-T480s>
References: <20210915142602.42862-1-luca.fancellu@arm.com> <20210915142602.42862-2-luca.fancellu@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Adding Jan for an opinion on the EFI common code changes. See below.


On Wed, 15 Sep 2021, Luca Fancellu wrote:
> When Xen is started as EFI application, it is checking
> the presence of multiboot,module in the DT, if any is
> found, the configuration file is skipped.
> Restrict this check to just any multiboot,module that
> is a direct child of the /chosen node.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  xen/arch/arm/efi/efi-boot.h | 30 ++++++++++++++++++++++++++++--
>  1 file changed, 28 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
> index cf9c37153f..5ff626c6a0 100644
> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -581,6 +581,8 @@ static void __init efi_arch_load_addr_check(EFI_LOADED_IMAGE *loaded_image)
>  
>  static bool __init efi_arch_use_config_file(EFI_SYSTEM_TABLE *SystemTable)
>  {
> +    int node;
> +    bool dom0_module_found = false;
>      /*
>       * For arm, we may get a device tree from GRUB (or other bootloader)
>       * that contains modules that have already been loaded into memory.  In
> @@ -592,11 +594,35 @@ static bool __init efi_arch_use_config_file(EFI_SYSTEM_TABLE *SystemTable)
>      fdt = lookup_fdt_config_table(SystemTable);
>      dtbfile.ptr = fdt;
>      dtbfile.need_to_free = false; /* Config table memory can't be freed. */
> -    if ( !fdt || fdt_node_offset_by_compatible(fdt, 0, "multiboot,module") < 0 )
> +
> +    /* Locate chosen node */
> +    node = fdt_subnode_offset(fdt, 0, "chosen");
> +
> +    /* Cycle through every node inside chosen having multiboot,module */
> +    do {
> +        int depth = 0;
> +        node = fdt_node_offset_by_compatible(fdt, node, "multiboot,module");
> +        /*
> +         * If the multiboot,module just found is placed at depth less than 3,
> +         * it means that it is here: /chosen/<module> so it is a module to
> +         * start dom0. (root is counted as 0)
> +         */
> +        if ( node > 0 )
> +        {
> +            depth = fdt_node_depth(fdt, node);
> +            if ( (depth >= 0) && (depth < 3) )
> +            {
> +                dom0_module_found = true;
> +                break;
> +            }
> +        }
> +    } while(node > 0);

It should be possible to enable the uefi,binary bootflow for Dom0 and
the Dom0 ramdisk too. It would be nice as we could have a 100% UEFI
boot, not dependent on U-Boot, both Dom0 and Dom0less, without the
xen.cfg file. It doesn't have to be done now by this series, but it
should be possible from a device tree bindings perspective.

With that in mind, is this check accurate? This patch is saying that if
Dom0 is not present in the device tree, then load xen.cfg. But what if
it is a true dom0less configuration? Then we would have no dom0, only
dom0less VMs, and we might still not want to load xen.cfg. True dom0less
is another one of those configurations that don't have to be enabled now
by this series but they should be possible from a device tree bindings
perspective.


I tried to think of ways to improve this check, for instance searching
for a module that doesn't have "uefi,binary" but has the regular "reg"
property. If there is one, then we could skip loading xen.cfg. But that
doesn't work if we have a UEFI-only true dom0less configuration.

So I am thinking that we have no choice but introducing a new property
to tell us whether we should or should not load xen.cfg when
multiboot,modules are present.

Taking inspiration from HyperLaunch, it could be a new node:

chosen {
    cfg {
        compatible = "xen,uefi-config", "multiboot,module";
        uefi,binary = "xen.cfg";
    };
};

In efi_arch_use_config_file we would check if there are any nodes
compatible with "multiboot,module". If there are none, it returns true.

If there are any, and one of them is also compatible "xen,uefi-config",
then efi_arch_use_config_file returns true and also the specified
configuration filename.

If there are nodes compatible to "multiboot,module" but none of them is
compatible to "module,uefi-config", then efi_arch_use_config_file
returns false. We use the device tree only.

I think that would be clearer and more consistent from a specification
perspective, but it requires one change in common code:
efi_arch_use_config_file would not just return bool but it would also
return a filename if found (it could be a pointer parameter to the
function).


Otherwise, we could add a simple property like the following, without a
specific value and without a filename:

chosen {
    xen,uefi-config;
};

The presence of xen,uefi-config could mean that Xen should go through
the usual guessing game to figure out the right cfg file to load. This
would not require any common code changes because
efi_arch_use_config_file could simply return bool as it does today.

My preference is the xen,uefi-config compatible node, but I think the
property would also work.


Jan, do you have an opinion on whether efi_arch_use_config_file has to
stay as it is today, or would you be open to the possibility of making
efi_arch_use_config_file return a filename too?

