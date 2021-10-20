Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C28D434BDF
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 15:14:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213919.372290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdBQF-0001Wh-DS; Wed, 20 Oct 2021 13:14:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213919.372290; Wed, 20 Oct 2021 13:14:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mdBQF-0001Uc-9K; Wed, 20 Oct 2021 13:14:23 +0000
Received: by outflank-mailman (input) for mailman id 213919;
 Wed, 20 Oct 2021 13:14:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mdBQE-0001UN-5M
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 13:14:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mdBQC-0005bn-Hz; Wed, 20 Oct 2021 13:14:20 +0000
Received: from [54.239.6.185] (helo=[192.168.28.129])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mdBQC-0006d8-B1; Wed, 20 Oct 2021 13:14:20 +0000
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
	bh=w7QZUxo74HM2JkZAyVpajt72WJzeHNi6Ca7poB+1Jf8=; b=jTKhtufYKxRXkem83QDL7kIh2p
	jIZDCsOErPaAiG4c+byabWsHtFdBbJvdNEoVasVpB8d2DnNfipjwKF79n3eTATZRs/lx1zb5zJQ/J
	u6SO5+V/8KaKufm7yJJ8jUUOK2Sffn6//D7x4dT1Tr+EBfMhTKD1WA+d2GQTNwno2PhQ=;
Message-ID: <5982b3fd-6a1a-c759-5da4-156fb50790f5@xen.org>
Date: Wed, 20 Oct 2021 14:14:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v3 1/1] xen/pci: Install vpci handlers on x86 and fix
 error paths
To: Bertrand Marquis <bertrand.marquis@arm.com>,
 xen-devel@lists.xenproject.org
Cc: iwj@xenproject.org, Oleksandr_Andrushchenko@epam.com,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>
References: <cover.1634723903.git.bertrand.marquis@arm.com>
 <c82cc9c933e09806c9d043c61d92bd793060f9ab.1634723903.git.bertrand.marquis@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c82cc9c933e09806c9d043c61d92bd793060f9ab.1634723903.git.bertrand.marquis@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Bertrand,

On 20/10/2021 11:05, Bertrand Marquis wrote:
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
> Move code adding the domain to the pdev domain_list as vpci_add_handlers
> needs this to be set and remove it from the list in the error path.
> 
> Exit early of vpci_remove_device if the domain has no vpci support.
> 
> Add empty static inline for vpci_remove_device when CONFIG_VPCI is not
> defined.
> 
> Add an ASSERT in vpci_add_handlers to check that the function is not
> called twice for the same device.
> 
> Fixes: d59168dc05 ("xen/arm: Enable the existing x86 virtual PCI support
> for ARM")
> Suggested-by: Jan Beulich <jbeulich@suse.com>
> Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>

For the arm bits:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
> Changes in v3
> - change title (s/exit/error/ and s/path/paths)
> - add early exit in vpci_remove_device if the domain has no vpci support
> - add ASSERT in vpci_add_handlers to check that the call is only made
> once per device
> - move the call adding the domain in the pdev domain list and remove it
> in the error path
> Changes in v2
> - add comment suggested by Jan on top of vpci_add_handlers call
> - merge the 3 patches of the serie in one patch and renamed it
> - fix x86 and arm linker script to only keep vpci_array in rodata and
> only when CONFIG_VPCI is set.
> ---
>   xen/arch/arm/xen.lds.S        |  9 +--------
>   xen/arch/x86/xen.lds.S        |  9 +--------
>   xen/drivers/passthrough/pci.c | 14 ++++++++------
>   xen/drivers/vpci/vpci.c       |  8 +++++++-
>   xen/include/xen/vpci.h        |  2 ++
>   5 files changed, 19 insertions(+), 23 deletions(-)
> 
> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> index b773f91f1c..08016948ab 100644
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -60,7 +60,7 @@ SECTIONS
>          *(.proc.info)
>          __proc_info_end = .;
>   
> -#if defined(CONFIG_HAS_VPCI) && defined(CONFIG_LATE_HWDOM)
> +#ifdef CONFIG_HAS_VPCI
>          . = ALIGN(POINTER_ALIGN);
>          __start_vpci_array = .;
>          *(SORT(.data.vpci.*))
> @@ -189,13 +189,6 @@ SECTIONS
>          *(.init_array)
>          *(SORT(.init_array.*))
>          __ctors_end = .;
> -
> -#if defined(CONFIG_HAS_VPCI) && !defined(CONFIG_LATE_HWDOM)
> -       . = ALIGN(POINTER_ALIGN);
> -       __start_vpci_array = .;
> -       *(SORT(.data.vpci.*))
> -       __end_vpci_array = .;
> -#endif
>     } :text
>     __init_end_efi = .;
>     . = ALIGN(STACK_SIZE);
> diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
> index 11b1da2154..87e344d4dd 100644
> --- a/xen/arch/x86/xen.lds.S
> +++ b/xen/arch/x86/xen.lds.S
> @@ -134,7 +134,7 @@ SECTIONS
>          *(.ex_table.pre)
>          __stop___pre_ex_table = .;
>   
> -#if defined(CONFIG_HAS_VPCI) && defined(CONFIG_LATE_HWDOM)
> +#ifdef CONFIG_HAS_VPCI
>          . = ALIGN(POINTER_ALIGN);
>          __start_vpci_array = .;
>          *(SORT(.data.vpci.*))
> @@ -247,13 +247,6 @@ SECTIONS
>          *(.init_array)
>          *(SORT(.init_array.*))
>          __ctors_end = .;
> -
> -#if defined(CONFIG_HAS_VPCI) && !defined(CONFIG_LATE_HWDOM)
> -       . = ALIGN(POINTER_ALIGN);
> -       __start_vpci_array = .;
> -       *(SORT(.data.vpci.*))
> -       __end_vpci_array = .;
> -#endif
>     } PHDR(text)
>   
>     . = ALIGN(SECTION_ALIGN);
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 35e0190796..0d8ab2e716 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -756,27 +756,28 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>       if ( !pdev->domain )
>       {
>           pdev->domain = hardware_domain;
> -#ifdef CONFIG_ARM
> +        list_add(&pdev->domain_list, &hardware_domain->pdev_list);
> +
>           /*
> -         * On ARM PCI devices discovery will be done by Dom0. Add vpci handler
> -         * when Dom0 inform XEN to add the PCI devices in XEN.
> +         * For devices not discovered by Xen during boot, add vPCI handlers
> +         * when Dom0 first informs Xen about such devices.
>            */
>           ret = vpci_add_handlers(pdev);
>           if ( ret )
>           {
>               printk(XENLOG_ERR "Setup of vPCI failed: %d\n", ret);
> +            list_del(&pdev->domain_list);
>               pdev->domain = NULL;
>               goto out;
>           }
> -#endif
>           ret = iommu_add_device(pdev);
>           if ( ret )
>           {
> +            vpci_remove_device(pdev);
> +            list_del(&pdev->domain_list);
>               pdev->domain = NULL;
>               goto out;
>           }
> -
> -        list_add(&pdev->domain_list, &hardware_domain->pdev_list);
>       }
>       else
>           iommu_enable_device(pdev);
> @@ -819,6 +820,7 @@ int pci_remove_device(u16 seg, u8 bus, u8 devfn)
>       list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
>           if ( pdev->bus == bus && pdev->devfn == devfn )
>           {
> +            vpci_remove_device(pdev);
>               pci_cleanup_msi(pdev);
>               ret = iommu_remove_device(pdev);
>               if ( pdev->domain )
> diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
> index decf7d87a1..657697fe34 100644
> --- a/xen/drivers/vpci/vpci.c
> +++ b/xen/drivers/vpci/vpci.c
> @@ -37,6 +37,9 @@ extern vpci_register_init_t *const __end_vpci_array[];
>   
>   void vpci_remove_device(struct pci_dev *pdev)
>   {
> +    if ( !has_vpci(pdev->domain) )
> +        return;
> +
>       spin_lock(&pdev->vpci->lock);
>       while ( !list_empty(&pdev->vpci->handlers) )
>       {
> @@ -54,7 +57,7 @@ void vpci_remove_device(struct pci_dev *pdev)
>       pdev->vpci = NULL;
>   }
>   
> -int __hwdom_init vpci_add_handlers(struct pci_dev *pdev)
> +int vpci_add_handlers(struct pci_dev *pdev)
>   {
>       unsigned int i;
>       int rc = 0;
> @@ -62,6 +65,9 @@ int __hwdom_init vpci_add_handlers(struct pci_dev *pdev)
>       if ( !has_vpci(pdev->domain) )
>           return 0;
>   
> +    /* We should not get here twice for the same device. */
> +    ASSERT(!pdev->vpci);
> +
>       pdev->vpci = xzalloc(struct vpci);
>       if ( !pdev->vpci )
>           return -ENOMEM;
> diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
> index 6746c2589a..9ea66e033f 100644
> --- a/xen/include/xen/vpci.h
> +++ b/xen/include/xen/vpci.h
> @@ -230,6 +230,8 @@ static inline int vpci_add_handlers(struct pci_dev *pdev)
>       return 0;
>   }
>   
> +static inline void vpci_remove_device(struct pci_dev *pdev) { }
> +
>   static inline void vpci_dump_msi(void) { }
>   
>   static inline uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg,
> 

-- 
Julien Grall

