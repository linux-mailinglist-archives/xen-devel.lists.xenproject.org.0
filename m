Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 547A64341EF
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 01:15:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213515.371738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcyJI-0005dp-5u; Tue, 19 Oct 2021 23:14:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213515.371738; Tue, 19 Oct 2021 23:14:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcyJI-0005bD-2K; Tue, 19 Oct 2021 23:14:20 +0000
Received: by outflank-mailman (input) for mailman id 213515;
 Tue, 19 Oct 2021 23:14:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f1bC=PH=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mcyJF-0005b7-RP
 for xen-devel@lists.xenproject.org; Tue, 19 Oct 2021 23:14:18 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f1d0e151-506d-4f96-a0b8-19c485ea7b4c;
 Tue, 19 Oct 2021 23:14:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 23A6260C4B;
 Tue, 19 Oct 2021 23:14:15 +0000 (UTC)
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
X-Inumbo-ID: f1d0e151-506d-4f96-a0b8-19c485ea7b4c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634685255;
	bh=tOmn0olH/oeHcAtqPlzaITjq0Z12V6pTovw7fR0ubhk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=CVzqty6WOpjaDNsKdfuxPBKPflwcXH23yoQ6O+WqaMaMGqgwrVOcDvLG+GiN/d8rb
	 I6UEkBWvfrkAyYsDc+1twFagsdSIdL2QODvmntEkImNUxnZOyDpzI04JrPB0kBM/fk
	 9fPgJ2/4qASBuXM2J4UH7KjWHPXPOxlazD1oWGjPN9+uSLW3l6SW7PA9m0lSr6vFFT
	 tDMRKWNiA+Eoz8nqWYJQJ6ExBSm2vG7onjhzu3svUptoSIpPiSth1fzZiNPkrcmt7R
	 iwvfbbZbwnVwDw1XQzSFS4o8n10i6ufUMoXBFX1Em+nK6mIj06uXPJ4zdF1G514M9z
	 8Myvm+In4LM3w==
Date: Tue, 19 Oct 2021 16:14:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Bertrand Marquis <bertrand.marquis@arm.com>
cc: xen-devel@lists.xenproject.org, iwj@xenproject.org, 
    Oleksandr_Andrushchenko@epam.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Wei Liu <wl@xen.org>, Paul Durrant <paul@xen.org>
Subject: Re: [PATCH v2 1/1] xen/pci: Install vpci handlers on x86 and fix
 exit path
In-Reply-To: <d788dcce9e344a39f6761633f0e96774ab42c2aa.1634659471.git.bertrand.marquis@arm.com>
Message-ID: <alpine.DEB.2.21.2110191538440.21467@sstabellini-ThinkPad-T480s>
References: <cover.1634659471.git.bertrand.marquis@arm.com> <d788dcce9e344a39f6761633f0e96774ab42c2aa.1634659471.git.bertrand.marquis@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 19 Oct 2021, Bertrand Marquis wrote:
> Xen might not be able to discover at boot time all devices or some devices
> might appear after specific actions from dom0.
> In this case dom0 can use the PHYSDEVOP_pci_device_add to signal some
> PCI devices to Xen.
> As those devices where not known from Xen before, the vpci handlers must
> be properly installed during pci_device_add for x86 PVH Dom0, in the
> same way as what is done currently on arm (where Xen does not detect PCI
> devices but relies on Dom0 to declare them all the time).
> 
> So this patch is removing the ifdef protecting the call to
> vpci_add_handlers and the comment which was arm specific.
> 
> vpci_add_handlers is called on during pci_device_add which can be called
> at runtime through hypercall physdev_op.
> Remove __hwdom_init as the call is not limited anymore to hardware
> domain init and fix linker script to only keep vpci_array in rodata
> section.
> 
> Add missing vpci handlers cleanup during pci_device_remove and in case
> of error with iommu during pci_device_add.
> 
> Add empty static inline for vpci_remove_device when CONFIG_VPCI is not
> defined.
> 
> Fixes: d59168dc05 ("xen/arm: Enable the existing x86 virtual PCI support
> for ARM")
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v2
> - add comment suggested by Jan on top of vpci_add_handlers call
> - merge the 3 patches of the serie in one patch and renamed it
> - fix x86 and arm linker script to only keep vpci_array in rodata and
> only when CONFIG_VPCI is set.
> ---
>  xen/arch/arm/xen.lds.S        | 9 +--------
>  xen/arch/x86/xen.lds.S        | 9 +--------
>  xen/drivers/passthrough/pci.c | 8 ++++----
>  xen/drivers/vpci/vpci.c       | 2 +-
>  xen/include/xen/vpci.h        | 2 ++
>  5 files changed, 9 insertions(+), 21 deletions(-)
> 
> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> index b773f91f1c..08016948ab 100644
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -60,7 +60,7 @@ SECTIONS
>         *(.proc.info)
>         __proc_info_end = .;
>  
> -#if defined(CONFIG_HAS_VPCI) && defined(CONFIG_LATE_HWDOM)
> +#ifdef CONFIG_HAS_VPCI
>         . = ALIGN(POINTER_ALIGN);
>         __start_vpci_array = .;
>         *(SORT(.data.vpci.*))
> @@ -189,13 +189,6 @@ SECTIONS
>         *(.init_array)
>         *(SORT(.init_array.*))
>         __ctors_end = .;
> -
> -#if defined(CONFIG_HAS_VPCI) && !defined(CONFIG_LATE_HWDOM)
> -       . = ALIGN(POINTER_ALIGN);
> -       __start_vpci_array = .;
> -       *(SORT(.data.vpci.*))
> -       __end_vpci_array = .;
> -#endif
>    } :text
>    __init_end_efi = .;
>    . = ALIGN(STACK_SIZE);
> diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
> index 11b1da2154..87e344d4dd 100644
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -134,7 +134,7 @@ SECTIONS
>         *(.ex_table.pre)
>         __stop___pre_ex_table = .;
>  
> -#if defined(CONFIG_HAS_VPCI) && defined(CONFIG_LATE_HWDOM)
> +#ifdef CONFIG_HAS_VPCI
>         . = ALIGN(POINTER_ALIGN);
>         __start_vpci_array = .;
>         *(SORT(.data.vpci.*))
> @@ -247,13 +247,6 @@ SECTIONS
>         *(.init_array)
>         *(SORT(.init_array.*))
>         __ctors_end = .;
> -
> -#if defined(CONFIG_HAS_VPCI) && !defined(CONFIG_LATE_HWDOM)
> -       . = ALIGN(POINTER_ALIGN);
> -       __start_vpci_array = .;
> -       *(SORT(.data.vpci.*))
> -       __end_vpci_array = .;
> -#endif
>    } PHDR(text)
>  
>    . = ALIGN(SECTION_ALIGN);
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 35e0190796..8928a1c07d 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -756,10 +756,9 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>      if ( !pdev->domain )
>      {
>          pdev->domain = hardware_domain;
> -#ifdef CONFIG_ARM
>          /*
> -         * On ARM PCI devices discovery will be done by Dom0. Add vpci handler
> -         * when Dom0 inform XEN to add the PCI devices in XEN.
> +         * For devices not discovered by Xen during boot, add vPCI handlers
> +         * when Dom0 first informs Xen about such devices.
>           */
>          ret = vpci_add_handlers(pdev);
>          if ( ret )
> @@ -768,10 +767,10 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>              pdev->domain = NULL;
>              goto out;
>          }
> -#endif
>          ret = iommu_add_device(pdev);
>          if ( ret )
>          {
> +            vpci_remove_device(pdev);
>              pdev->domain = NULL;
>              goto out;
>          }
> @@ -819,6 +818,7 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>      list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
>          if ( pdev->bus == bus && pdev->devfn == devfn )
>          {
> +            vpci_remove_device(pdev);
>              pci_cleanup_msi(pdev);
>              ret = iommu_remove_device(pdev);
>              if ( pdev->domain )
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index decf7d87a1..74894bcbac 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -54,7 +54,7 @@ void vpci_remove_device(struct pci_dev *pdev)
>      pdev->vpci = NULL;
>  }
>  
> -int __hwdom_init vpci_add_handlers(struct pci_dev *pdev)
> +int vpci_add_handlers(struct pci_dev *pdev)
>  {
>      unsigned int i;
>      int rc = 0;
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index 6746c2589a..9ea66e033f 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -230,6 +230,8 @@ static inline int vpci_add_handlers(struct pci_dev *pdev)
>      return 0;
>  }
>  
> +static inline void vpci_remove_device(struct pci_dev *pdev) { }
> +
>  static inline void vpci_dump_msi(void) { }
>  
>  static inline uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg,
> -- 
> 2.25.1
> 

