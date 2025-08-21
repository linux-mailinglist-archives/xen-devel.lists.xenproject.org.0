Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 909EAB2EA47
	for <lists+xen-devel@lfdr.de>; Thu, 21 Aug 2025 03:15:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1087714.1445591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uottQ-0001rW-GD; Thu, 21 Aug 2025 01:15:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1087714.1445591; Thu, 21 Aug 2025 01:15:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uottQ-0001p5-DI; Thu, 21 Aug 2025 01:15:04 +0000
Received: by outflank-mailman (input) for mailman id 1087714;
 Thu, 21 Aug 2025 01:15:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JTf3=3B=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uottP-0001ov-0a
 for xen-devel@lists.xenproject.org; Thu, 21 Aug 2025 01:15:03 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 38733782-7e2c-11f0-b898-0df219b8e170;
 Thu, 21 Aug 2025 03:14:44 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AEDB261444;
 Thu, 21 Aug 2025 01:14:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3F14C4CEE7;
 Thu, 21 Aug 2025 01:14:41 +0000 (UTC)
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
X-Inumbo-ID: 38733782-7e2c-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755738883;
	bh=NWK3EpbPykEacrT/1T9HLbSOdjhsB7NrT+97Pj+3I8U=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MsTWaHpCSjG2QwR46KaS4MO2LMTwzlJ13IulGrTx1bbEG3Fk+hl5dZYHGL7kz3ALy
	 pb0Y4AgEHT1MUIxJge2w3sGbEu8U7/eoXFud+vaLSZIVfRdsLSZM6AvcrXiKhk85HW
	 SNhuahXf6n5LoUL420AJeOufU/1U+CQ5A22cwHiFwZi82nQ0ESOoLDH8pppm8yVLy+
	 Rh7+2nZViJr3YV2noG68r7hXU4/WTqeHQkE/u+8T2C/mfHJjxjWagK0Qfg1U/9gqSb
	 hWafEtYuQg5sdEtGukcV3wVg7RaaL1uC0RbH44xhH3sFhFxgYB72SdrTy40DkXkjmD
	 Iemnoorz/mrug==
Date: Wed, 20 Aug 2025 18:14:40 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Mykyta Poturai <Mykyta_Poturai@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Edward Pickup <Edward.Pickup@arm.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Luca Fancellu <luca.fancellu@arm.com>, 
    Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: Re: [PATCH v2 1/3] arm/pci: Add pci-scan boot argument
In-Reply-To: <e73e8d13a09294ccc8b256b15a8d3facfc878238.1755683961.git.mykyta_poturai@epam.com>
Message-ID: <alpine.DEB.2.22.394.2508201814300.2743087@ubuntu-linux-20-04-desktop>
References: <cover.1755683961.git.mykyta_poturai@epam.com> <e73e8d13a09294ccc8b256b15a8d3facfc878238.1755683961.git.mykyta_poturai@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 20 Aug 2025, Mykyta Poturai wrote:
> From: Edward Pickup <Edward.Pickup@arm.com>
> 
> This patch adds a Xen boot arguments that, if enabled, causes a call to
> existing code to scan pci devices enumerated by the firmware.
> 
> This will be needed ahead of dom0less support for pci passthrough on
> arm.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> (cherry picked from commit bce463e1588a45e1bfdf59fc0d5f88b16604e439 from
>  the downstream branch poc/pci-passthrough from
>  https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git)
> 
> v1->v2:
> * remove is_pci_scan_enabled wrapper
> * make pci_scan_enabled ro_after_init
> * drop debug prints
> * drop Edward's SOB
> 
> changes since cherry-pick:
> * s/always_inline/inline/
> * replace additional kconfig option with config DEBUG
> 
> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> ---
>  docs/misc/xen-command-line.pandoc  |  7 +++++++
>  xen/arch/arm/include/asm/pci.h     |  3 +++
>  xen/arch/arm/pci/pci-host-common.c |  1 +
>  xen/arch/arm/pci/pci.c             | 24 ++++++++++++++++++++++--
>  4 files changed, 33 insertions(+), 2 deletions(-)
> 
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index a75b6c9301..762a1a4f5f 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -2059,6 +2059,13 @@ This option can be specified more than once (up to 8 times at present).
>  
>  Flag to enable or disable support for PCI passthrough
>  
> +### pci-scan (arm)
> +> `= <boolean>`
> +
> +> Default: `false`
> +
> +Flag to enable or disable Xen PCI scan at boot.
> +
>  ### pcid (x86)
>  > `= <boolean> | xpti=<bool>`
>  
> diff --git a/xen/arch/arm/include/asm/pci.h b/xen/arch/arm/include/asm/pci.h
> index 08ffcd4438..7289f7688b 100644
> --- a/xen/arch/arm/include/asm/pci.h
> +++ b/xen/arch/arm/include/asm/pci.h
> @@ -23,6 +23,7 @@
>  #define pci_to_dev(pcidev) (&(pcidev)->arch.dev)
>  
>  extern bool pci_passthrough_enabled;
> +extern bool pci_scan_enabled;
>  
>  struct rangeset;
>  
> @@ -155,6 +156,8 @@ bool arch_pci_device_physdevop(void);
>  
>  #else   /*!CONFIG_HAS_PCI*/
>  
> +#define pci_scan_enabled false
> +
>  struct pci_dev;
>  
>  static inline void arch_pci_init_pdev(struct pci_dev *pdev) {}
> diff --git a/xen/arch/arm/pci/pci-host-common.c b/xen/arch/arm/pci/pci-host-common.c
> index 487c545f3a..d3481b05eb 100644
> --- a/xen/arch/arm/pci/pci-host-common.c
> +++ b/xen/arch/arm/pci/pci-host-common.c
> @@ -284,6 +284,7 @@ pci_host_common_probe(struct dt_device_node *dev,
>      }
>  
>      pci_add_host_bridge(bridge);
> +    pci_add_segment(bridge->segment);
>  
>      return bridge;
>  
> diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
> index beb1f971fa..1b34e17517 100644
> --- a/xen/arch/arm/pci/pci.c
> +++ b/xen/arch/arm/pci/pci.c
> @@ -91,8 +91,14 @@ bool arch_pci_device_physdevop(void)
>  bool __read_mostly pci_passthrough_enabled;
>  boolean_param("pci-passthrough", pci_passthrough_enabled);
>  
> +/* By default pci scan is disabled. */
> +bool __ro_after_init pci_scan_enabled;
> +boolean_param("pci-scan", pci_scan_enabled);
> +
>  static int __init pci_init(void)
>  {
> +    int ret;
> +
>      /*
>       * Enable PCI passthrough when has been enabled explicitly
>       * (pci-passthrough=on).
> @@ -104,9 +110,23 @@ static int __init pci_init(void)
>          panic("Could not initialize PCI segment 0\n");
>  
>      if ( acpi_disabled )
> -        return dt_pci_init();
> +        ret = dt_pci_init();
>      else
> -        return acpi_pci_init();
> +        ret = acpi_pci_init();
> +
> +    if ( ret < 0 )
> +        return ret;
> +
> +    if ( pci_scan_enabled )
> +    {
> +        ret = scan_pci_devices();
> +
> +        if ( ret < 0 )
> +            return ret;
> +
> +    }
> +
> +    return 0;
>  }
>  __initcall(pci_init);
>  
> -- 
> 2.34.1
> 

