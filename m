Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 61616A95A28
	for <lists+xen-devel@lfdr.de>; Tue, 22 Apr 2025 02:25:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.961598.1352976 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u71Rv-0007uT-BL; Tue, 22 Apr 2025 00:25:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 961598.1352976; Tue, 22 Apr 2025 00:25:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u71Rv-0007t1-8G; Tue, 22 Apr 2025 00:25:19 +0000
Received: by outflank-mailman (input) for mailman id 961598;
 Tue, 22 Apr 2025 00:25:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eQRL=XI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1u71Rt-0007sv-JW
 for xen-devel@lists.xenproject.org; Tue, 22 Apr 2025 00:25:17 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42b64ee6-1f10-11f0-9ffb-bf95429c2676;
 Tue, 22 Apr 2025 02:25:15 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 43E8DA4BEE1;
 Tue, 22 Apr 2025 00:19:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 847BAC4CEE4;
 Tue, 22 Apr 2025 00:25:12 +0000 (UTC)
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
X-Inumbo-ID: 42b64ee6-1f10-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745281514;
	bh=NOgGudpGVd6y6b9MOT/BSmwCRZbR/r7Tn6OIzOtNyPM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=fue5xmICQba/xRsXZS0gfmgIx8pQA4vi95YMT48pV5dDZuyf3RA5Sv9UHvpi5/xCo
	 erq1AC65w8ZJZx0LAHlgJssEALkD5psIznniiSqhr335HVPEIO+3Z3SeBqEatzxIbn
	 +u57PZjIWlrE0zELz5lqdYpiiDreShBeFx8alFdbjTNC9VA0f/sRYuiKf/5M025wHP
	 E1s0NBikXcZDXfUkzq/gawvfh59RUlDfSXB+g5/2qrxJGp5o5/ZUYM4M3EBoC8x2x1
	 efeopYquvTxwE+Nf3qN8StLk7jPtFDFFSe0jfn2bnamWsUqx7doiMJ/SOHIha8ltJI
	 H6M7G8GyO0Kmw==
Date: Mon, 21 Apr 2025 17:25:10 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stewart Hildebrand <stewart.hildebrand@amd.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Jan Beulich <jbeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Subject: Re: [PATCH v9 7/8] xen/arm: enable dom0 to use PCI devices with
 pci-passthrough=no
In-Reply-To: <132afbca390edd6e9fd7b1ffacf6c5aff0d29aa7.1741958647.git.mykyta_poturai@epam.com>
Message-ID: <alpine.DEB.2.22.394.2504211724230.785180@ubuntu-linux-20-04-desktop>
References: <cover.1741958647.git.mykyta_poturai@epam.com> <132afbca390edd6e9fd7b1ffacf6c5aff0d29aa7.1741958647.git.mykyta_poturai@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 14 Mar 2025, Mykyta Poturai wrote:
> From: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> Enable the use of IOMMU + PCI in dom0 without having to specify
> "pci-passthrough=yes". We rely on dom0 to initialize the PCI controller
> and perform a PHYSDEVOP_pci_device_add call to add each device to SMMU.
> 
> Enable pci_init() for initializing Xen's internal PCI subsystem, and
> allow PHYSDEVOP_pci_device_add when pci-passthrough is disabled.
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
> ---
> hmm. Since
>   dec9e02f3190 ("xen: avoid generation of stub <asm/pci.h> header")
> Should we also move is_pci_passthrough_enabled() back to xen/arch/arm/include/asm/pci.h ?
> Not sure if PPC/RISC-V will plan on using this check.
> 
> v8-v9:
> * move iommu_enabled check inside is_pci_passthrough_enabled()
> 
> v7->v8:
> * bring back x86 definition of is_pci_passthrough_enabled()
> 
> v6->v7:
> * remove x86 definition of is_pci_passthrough_enabled()
> * update comments
> * make pci_physdev_op checks stricter
> 
> v5->v6:
> * new patch - this effectively replaces
>   ("Revert "xen/arm: Add cmdline boot option "pci-passthrough = <boolean>""")
> ---
>  xen/arch/arm/domain_build.c    |  2 +-
>  xen/arch/arm/include/asm/pci.h |  5 +----
>  xen/arch/arm/pci/pci.c         | 11 ++++++++++-
>  xen/arch/x86/include/asm/pci.h |  2 +-
>  xen/drivers/pci/physdev.c      |  4 ++--
>  xen/include/xen/pci.h          |  2 +-
>  6 files changed, 16 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 7b47abade1..fbd6db9438 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -526,7 +526,7 @@ static int __init handle_linux_pci_domain(struct kernel_info *kinfo,
>      uint16_t segment;
>      int res;
>  
> -    if ( !is_pci_passthrough_enabled() )
> +    if ( !is_pci_passthrough_enabled(false) )
>          return 0;
>  
>      if ( !dt_device_type_is_equal(node, "pci") )
> diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.h
> index 7f77226c9b..3ae85b4666 100644
> --- a/xen/arch/arm/include/asm/pci.h
> +++ b/xen/arch/arm/include/asm/pci.h
> @@ -111,10 +111,7 @@ pci_find_host_bridge_node(const struct pci_dev *pdev);
>  int pci_get_host_bridge_segment(const struct dt_device_node *node,
>                                  uint16_t *segment);
>  
> -static always_inline bool is_pci_passthrough_enabled(void)
> -{
> -    return pci_passthrough_enabled;
> -}
> +bool is_pci_passthrough_enabled(bool dom0);
>  
>  void arch_pci_init_pdev(struct pci_dev *pdev);
>  
> diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
> index 78b97beaef..79bb8728a4 100644
> --- a/xen/arch/arm/pci/pci.c
> +++ b/xen/arch/arm/pci/pci.c
> @@ -16,9 +16,18 @@
>  #include <xen/device_tree.h>
>  #include <xen/errno.h>
>  #include <xen/init.h>
> +#include <xen/iommu.h>
>  #include <xen/param.h>
>  #include <xen/pci.h>
>  
> +bool is_pci_passthrough_enabled(bool dom0)
> +{
> +    if ( dom0 )
> +        return pci_passthrough_enabled || iommu_enabled;

Could this be written as:

    if ( is_hardware_domain(current->domain) )
        return pci_passthrough_enabled || iommu_enabled;

If so, then I think it would be better, if not:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>



> +    return pci_passthrough_enabled;
> +}
> +
>  /*
>   * PIRQ event channels are not supported on Arm, so nothing to do.
>   */
> @@ -85,7 +94,7 @@ static int __init pci_init(void)
>       * Enable PCI passthrough when has been enabled explicitly
>       * (pci-passthrough=on).
>       */
> -    if ( !pci_passthrough_enabled )
> +    if ( !is_pci_passthrough_enabled(true) )
>          return 0;
>  
>      pci_segments_init();
> diff --git a/xen/arch/x86/include/asm/pci.h b/xen/arch/x86/include/asm/pci.h
> index fd5480d67d..bffeaa507d 100644
> --- a/xen/arch/x86/include/asm/pci.h
> +++ b/xen/arch/x86/include/asm/pci.h
> @@ -50,7 +50,7 @@ extern int pci_mmcfg_config_num;
>  extern struct acpi_mcfg_allocation *pci_mmcfg_config;
>  
>  /* Unlike ARM, PCI passthrough is always enabled for x86. */
> -static always_inline bool is_pci_passthrough_enabled(void)
> +static always_inline bool is_pci_passthrough_enabled(__maybe_unused bool dom0)
>  {
>      return true;
>  }
> diff --git a/xen/drivers/pci/physdev.c b/xen/drivers/pci/physdev.c
> index 0161a85e1e..18448b94b3 100644
> --- a/xen/drivers/pci/physdev.c
> +++ b/xen/drivers/pci/physdev.c
> @@ -19,7 +19,7 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>          struct pci_dev_info pdev_info;
>          nodeid_t node = NUMA_NO_NODE;
>  
> -        if ( !is_pci_passthrough_enabled() )
> +        if ( !is_pci_passthrough_enabled(true) )
>              return -EOPNOTSUPP;
>  
>          ret = -EFAULT;
> @@ -57,7 +57,7 @@ ret_t pci_physdev_op(int cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>      case PHYSDEVOP_pci_device_remove: {
>          struct physdev_pci_device dev;
>  
> -        if ( !is_pci_passthrough_enabled() )
> +        if ( !is_pci_passthrough_enabled(true) )
>              return -EOPNOTSUPP;
>  
>          ret = -EFAULT;
> diff --git a/xen/include/xen/pci.h b/xen/include/xen/pci.h
> index f784e91160..c4a49cf584 100644
> --- a/xen/include/xen/pci.h
> +++ b/xen/include/xen/pci.h
> @@ -74,7 +74,7 @@ typedef union {
>  
>  struct arch_pci_dev { };
>  
> -static inline bool is_pci_passthrough_enabled(void)
> +static inline bool is_pci_passthrough_enabled(__maybe_unused bool dom0)
>  {
>      return false;
>  }
> -- 
> 2.34.1
> 

