Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 187CD41BEFC
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 08:12:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198639.352228 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVSoy-00059S-HO; Wed, 29 Sep 2021 06:12:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198639.352228; Wed, 29 Sep 2021 06:12:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVSoy-00057F-E3; Wed, 29 Sep 2021 06:12:00 +0000
Received: by outflank-mailman (input) for mailman id 198639;
 Wed, 29 Sep 2021 06:11:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=arYX=OT=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mVSox-000574-2M
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 06:11:59 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 26cdc910-20ec-11ec-bcde-12813bfff9fa;
 Wed, 29 Sep 2021 06:11:58 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 49DA760560;
 Wed, 29 Sep 2021 06:11:57 +0000 (UTC)
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
X-Inumbo-ID: 26cdc910-20ec-11ec-bcde-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1632895917;
	bh=T58myEBQBInPXM+HTVDBnF2QadmvX8E8f1gGzvv/Z/4=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=toJ/4iHpCaE5Fse8SSBwXzLQMjLOoWDr8DAiOT4ZcvGi/UmxmrZv68HZlwRxP+jtk
	 JiUCApaeepWuCQxfWVoAHviu06OgHUx49B/UNkEAMrTu/8dNCm+cVhBM2S3VM1paIO
	 j04IVhfiB0BjcjtGPJLx+VlKUG5MIolF6HwIyRWCKzbRuvhsB6gNAsBzFyx1Ic3mb7
	 tMdZAzoaCTWYz6DkV2H8shxPZ14xRYswzZomuqG8BFnGPVmgI4yzyYDpbPSO3kx7W9
	 FUqXmTzn+ny5emM67X7F+JBEHhCx9CciIhY3t0j8i71fxryXY5kVO0ar2iuNr6M5us
	 2ZPq+qrNCpv7g==
Date: Tue, 28 Sep 2021 23:11:57 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Rahul Singh <rahul.singh@arm.com>
cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com, 
    Andre.Przywara@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
    Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v3 10/17] xen/arm: Add cmdline boot option "pci-passthrough
 = <boolean>"
In-Reply-To: <edd6689cc977292fa874059861474993e5819c14.1632847120.git.rahul.singh@arm.com>
Message-ID: <alpine.DEB.2.21.2109281629480.5022@sstabellini-ThinkPad-T480s>
References: <cover.1632847120.git.rahul.singh@arm.com> <edd6689cc977292fa874059861474993e5819c14.1632847120.git.rahul.singh@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 28 Sep 2021, Rahul Singh wrote:
> Add cmdline boot option "pci-passthrough = = <boolean>" to enable or
> disable the PCI passthrough support on ARM.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Change in v3:
> - Remove "define pci_passthrough_enabled (false)"
> - Fixed coding style and minor comment
> Change in v2:
> - Add option in xen-command-line.pandoc
> - Change pci option to pci-passthrough
> - modify option from custom_param to boolean param
> ---
>  docs/misc/xen-command-line.pandoc |  7 +++++++
>  xen/arch/arm/pci/pci.c            | 14 ++++++++++++++
>  xen/common/physdev.c              |  6 ++++++
>  xen/include/asm-arm/pci.h         | 11 +++++++++++
>  xen/include/asm-x86/pci.h         |  8 ++++++++
>  5 files changed, 46 insertions(+)
> 
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 177e656f12..c8bf96ccf8 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1808,6 +1808,13 @@ All numbers specified must be hexadecimal ones.
>  
>  This option can be specified more than once (up to 8 times at present).
>  
> +### pci-passthrough (arm)
> +> `= <boolean>`
> +
> +> Default: `false`
> +
> +Flag to enable or disable support for PCI passthrough
> +
>  ### pcid (x86)
>  > `= <boolean> | xpti=<bool>`
>  
> diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
> index e359bab9ea..84d8f0d634 100644
> --- a/xen/arch/arm/pci/pci.c
> +++ b/xen/arch/arm/pci/pci.c
> @@ -16,6 +16,7 @@
>  #include <xen/device_tree.h>
>  #include <xen/errno.h>
>  #include <xen/init.h>
> +#include <xen/param.h>
>  #include <xen/pci.h>
>  
>  /*
> @@ -62,8 +63,21 @@ static int __init acpi_pci_init(void)
>  }
>  #endif
>  
> +/*
> + * By default pci passthrough is disabled
> + */
> +bool __read_mostly pci_passthrough_enabled = false;
> +boolean_param("pci-passthrough", pci_passthrough_enabled);
> +
>  static int __init pci_init(void)
>  {
> +    /*
> +     * Enable PCI passthrough when has been enabled explicitly
> +     * (pci-passthrough=on)
> +     */
> +    if ( !pci_passthrough_enabled )
> +        return 0;
> +
>      pci_segments_init();
>  
>      if ( acpi_disabled )
> diff --git a/xen/common/physdev.c b/xen/common/physdev.c
> index 20a5530269..2d5fc886fc 100644
> --- a/xen/common/physdev.c
> +++ b/xen/common/physdev.c
> @@ -19,6 +19,9 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          struct pci_dev_info pdev_info;
>          nodeid_t node;
>  
> +        if ( !is_pci_passthrough_enabled() )
> +            return -ENOSYS;
> +
>          ret = -EFAULT;
>          if ( copy_from_guest(&add, arg, 1) != 0 )
>              break;
> @@ -54,6 +57,9 @@ ret_t do_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>      case PHYSDEVOP_pci_device_remove: {
>          struct physdev_pci_device dev;
>  
> +        if ( !is_pci_passthrough_enabled() )
> +            return -ENOSYS;
> +
>          ret = -EFAULT;
>          if ( copy_from_guest(&dev, arg, 1) != 0 )
>              break;
> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
> index 7dd9eb3dba..0cf849e26f 100644
> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -19,14 +19,25 @@
>  
>  #define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
>  
> +extern bool_t pci_passthrough_enabled;
> +
>  /* Arch pci dev struct */
>  struct arch_pci_dev {
>      struct device dev;
>  };
>  
> +static always_inline bool is_pci_passthrough_enabled(void)
> +{
> +    return pci_passthrough_enabled;
> +}
>  #else   /*!CONFIG_HAS_PCI*/
>  
>  struct arch_pci_dev { };
>  
> +static always_inline bool is_pci_passthrough_enabled(void)
> +{
> +    return false;
> +}
> +
>  #endif  /*!CONFIG_HAS_PCI*/
>  #endif /* __ARM_PCI_H__ */
> diff --git a/xen/include/asm-x86/pci.h b/xen/include/asm-x86/pci.h
> index cc05045e9c..3f806ce7a8 100644
> --- a/xen/include/asm-x86/pci.h
> +++ b/xen/include/asm-x86/pci.h
> @@ -32,4 +32,12 @@ bool_t pci_ro_mmcfg_decode(unsigned long mfn, unsigned int *seg,
>  extern int pci_mmcfg_config_num;
>  extern struct acpi_mcfg_allocation *pci_mmcfg_config;
>  
> +/*
> + * Unlike ARM, PCI passthrough is always enabled for x86.
> + */
> +static always_inline bool is_pci_passthrough_enabled(void)
> +{
> +    return true;
> +}
> +
>  #endif /* __X86_PCI_H__ */
> -- 
> 2.17.1
> 

