Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 056B241E58B
	for <lists+xen-devel@lfdr.de>; Fri,  1 Oct 2021 02:34:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.200319.354810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mW6VT-0000tu-RS; Fri, 01 Oct 2021 00:34:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 200319.354810; Fri, 01 Oct 2021 00:34:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mW6VT-0000ri-O3; Fri, 01 Oct 2021 00:34:31 +0000
Received: by outflank-mailman (input) for mailman id 200319;
 Fri, 01 Oct 2021 00:34:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cSXX=OV=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1mW6VS-0000rc-8W
 for xen-devel@lists.xenproject.org; Fri, 01 Oct 2021 00:34:30 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5666c457-224f-11ec-bd77-12813bfff9fa;
 Fri, 01 Oct 2021 00:34:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3A1BA60F4B;
 Fri,  1 Oct 2021 00:34:28 +0000 (UTC)
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
X-Inumbo-ID: 5666c457-224f-11ec-bd77-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1633048468;
	bh=D8IZbxLhA+ZhjMPOMMpFwzwfko2pn9o15xrHXzH0mlY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dbyXAwPbkSNX/uc5syot0YSApoJarV1MhJxj5WH0xiPvazY/h1iTInKmHMRhYM+da
	 9NH+65M9LjfTph8GeYuhSRq3YJc861jaZ7H41dlrXTJCpX1m+j3QpeQTvPY/rtnmH2
	 n8CN+hDpFiTjcjvD48k2jxTwP+Ts5eynmzSRdptYflX97duQVrZ65gvZSw9O60f+xH
	 u9NS/5ylvq2UgS4be5BTfdSt2HyoBEmS0AoqvAhdvm2R6zSv9DpGjb0E2FgXu8rJVV
	 VMNmy+B2W0n8ycyYzX/3UeRSPAbyuFa7kMPhr2/D9tFLoDUVcHrV1PkI02bh2qkO3m
	 1zoNNXRi44ATA==
Date: Thu, 30 Sep 2021 17:34:27 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Andrushchenko <andr2000@gmail.com>
cc: xen-devel@lists.xenproject.org, julien@xen.org, sstabellini@kernel.org, 
    oleksandr_tyshchenko@epam.com, volodymyr_babchuk@epam.com, 
    Artem_Mygaiev@epam.com, roger.pau@citrix.com, bertrand.marquis@arm.com, 
    rahul.singh@arm.com, 
    Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: Re: [PATCH v3 05/11] xen/arm: Mark device as PCI while creating
 one
In-Reply-To: <20210930071326.857390-6-andr2000@gmail.com>
Message-ID: <alpine.DEB.2.21.2109301733250.3209@sstabellini-ThinkPad-T480s>
References: <20210930071326.857390-1-andr2000@gmail.com> <20210930071326.857390-6-andr2000@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1455477428-1633048468=:3209"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1455477428-1633048468=:3209
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 30 Sep 2021, Oleksandr Andrushchenko wrote:
> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> 
> While adding a PCI device mark it as such, so other frameworks
> can distinguish it from DT devices.
> For that introduce an architecture defined helper which may perform
> additional initialization of the newly created PCI device.
> 
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

I get a build failure without CONFIG_PCI on ARM64:

In file included from /local/repos/xen-upstream/xen/include/xen/pci.h:66:0,
                 from /local/repos/xen-upstream/xen/include/xen/iommu.h:25,
                 from /local/repos/xen-upstream/xen/include/xen/sched.h:12,
                 from arch/arm/arm64/asm-offsets.c:9:
/local/repos/xen-upstream/xen/include/asm/pci.h:127:46: error: ‘struct pci_dev’ declared inside parameter list will not be visible outside of this definition or declaration [-Werror]
 static inline void arch_pci_init_pdev(struct pci_dev *pdev) {}
                                              ^~~~~~~
cc1: all warnings being treated as errors


> ---
> Since v2:
>  - !! dropped Stefano's r-b because of the changes
>  - introduced arch_pci_init_pdev (Jan)
> Since v1:
>  - moved the assignment from iommu_add_device to alloc_pdev
> ---
>  xen/arch/arm/pci/pci.c        | 5 +++++
>  xen/drivers/passthrough/pci.c | 2 ++
>  xen/include/asm-arm/pci.h     | 5 +++++
>  xen/include/asm-x86/pci.h     | 2 ++
>  4 files changed, 14 insertions(+)
> 
> diff --git a/xen/arch/arm/pci/pci.c b/xen/arch/arm/pci/pci.c
> index 9fc522e566a9..a8d10e869603 100644
> --- a/xen/arch/arm/pci/pci.c
> +++ b/xen/arch/arm/pci/pci.c
> @@ -34,6 +34,11 @@ struct pci_dev *dev_to_pci(struct device *dev)
>      return container_of(dev, struct pci_dev, arch.dev);
>  }
>  
> +void arch_pci_init_pdev(struct pci_dev *pdev)
> +{
> +    pci_to_dev(pdev)->type = DEV_PCI;
> +}
> +
>  static int __init dt_pci_init(void)
>  {
>      struct dt_device_node *np;
> diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
> index 38eb451448a3..9f804a50e780 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -329,6 +329,8 @@ static struct pci_dev *alloc_pdev(struct pci_seg *pseg, u8 bus, u8 devfn)
>      *((u8*) &pdev->devfn) = devfn;
>      pdev->domain = NULL;
>  
> +    arch_pci_init_pdev(pdev);
> +
>      rc = pdev_msi_init(pdev);
>      if ( rc )
>      {
> diff --git a/xen/include/asm-arm/pci.h b/xen/include/asm-arm/pci.h
> index e6d4000e2ac8..566a9436a18e 100644
> --- a/xen/include/asm-arm/pci.h
> +++ b/xen/include/asm-arm/pci.h
> @@ -105,6 +105,9 @@ static always_inline bool is_pci_passthrough_enabled(void)
>  {
>      return pci_passthrough_enabled;
>  }
> +
> +void arch_pci_init_pdev(struct pci_dev *pdev);
> +
>  #else   /*!CONFIG_HAS_PCI*/
>  
>  struct arch_pci_dev { };
> @@ -121,5 +124,7 @@ static inline int pci_get_host_bridge_segment(const struct dt_device_node *node,
>      return -EINVAL;
>  }
>  
> +static inline void arch_pci_init_pdev(struct pci_dev *pdev) {}
> +
>  #endif  /*!CONFIG_HAS_PCI*/
>  #endif /* __ARM_PCI_H__ */
> diff --git a/xen/include/asm-x86/pci.h b/xen/include/asm-x86/pci.h
> index 61b940c91d4a..e7f10beb4eb8 100644
> --- a/xen/include/asm-x86/pci.h
> +++ b/xen/include/asm-x86/pci.h
> @@ -38,4 +38,6 @@ static always_inline bool is_pci_passthrough_enabled(void)
>      return true;
>  }
>  
> +static inline void arch_pci_init_pdev(struct pci_dev *pdev) {}
> +
>  #endif /* __X86_PCI_H__ */
> -- 
> 2.25.1
> 
--8323329-1455477428-1633048468=:3209--

