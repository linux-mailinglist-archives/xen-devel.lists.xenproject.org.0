Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA0D9960D0
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2024 09:27:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.813776.1226796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syR5p-0002qP-TJ; Wed, 09 Oct 2024 07:26:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 813776.1226796; Wed, 09 Oct 2024 07:26:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syR5p-0002oS-QD; Wed, 09 Oct 2024 07:26:45 +0000
Received: by outflank-mailman (input) for mailman id 813776;
 Wed, 09 Oct 2024 07:26:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1syR5n-0002mI-KX
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2024 07:26:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1syR5n-0002dR-2n; Wed, 09 Oct 2024 07:26:43 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1syR5m-00078T-On; Wed, 09 Oct 2024 07:26:42 +0000
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
	bh=BGpWss8onohbaIF+hLt+PrmwzMxGyxyGFruVnIGsuUI=; b=CUznHwY4+SP0DUKANKm8Ou536F
	HusvnZVILXID4XUekLHG4I+MytaTKuDcrIZZOwJKGucmR5VVNtWP4JkvE4CTs9mqkgjALjifUcmYN
	D2zKpE/9EUrSAQ7TzQRo9DL4N4B4k3T/ZuScvV5jYlMR6f8MsGQhrIrE77NLltU5Vo5k=;
Message-ID: <1c27b9c0-eb2e-49c2-a94b-d1b8ac6550b1@xen.org>
Date: Wed, 9 Oct 2024 08:26:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fusa: Add requirements for Device Passthrough
Content-Language: en-GB
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 Artem Mygaiev <artem_mygaiev@epam.com>,
 Hisao Munakata <hisao.munakata.vt@renesas.com>
References: <20241007185508.3044115-1-olekstysh@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20241007185508.3044115-1-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 07/10/2024 19:55, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Add common requirements for a physical device assignment to Arm64
> and AMD64 PVH domains.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
> Based on:
> [PATCH] docs: fusa: Replace VM with domain
> https://patchew.org/Xen/20241007182603.826807-1-ayan.kumar.halder@amd.com/
> ---
> ---
>   .../reqs/design-reqs/common/passthrough.rst   | 365 ++++++++++++++++++
>   docs/fusa/reqs/index.rst                      |   1 +
>   docs/fusa/reqs/market-reqs/reqs.rst           |  33 ++
>   docs/fusa/reqs/product-reqs/common/reqs.rst   |  29 ++
>   4 files changed, 428 insertions(+)
>   create mode 100644 docs/fusa/reqs/design-reqs/common/passthrough.rst
>   create mode 100644 docs/fusa/reqs/product-reqs/common/reqs.rst
> 
> diff --git a/docs/fusa/reqs/design-reqs/common/passthrough.rst b/docs/fusa/reqs/design-reqs/common/passthrough.rst
> new file mode 100644
> index 0000000000..a1d6676f65
> --- /dev/null
> +++ b/docs/fusa/reqs/design-reqs/common/passthrough.rst
> @@ -0,0 +1,365 @@
> +.. SPDX-License-Identifier: CC-BY-4.0
> +
> +Device Passthrough
> +==================
> +
> +The following are the requirements related to a physical device assignment
> +[1], [2] to Arm64 and AMD64 PVH domains.
> +
> +Requirements for both Arm64 and AMD64 PVH
> +=========================================
> +
> +Hide IOMMU from a domain
> +------------------------ > +
> +`XenSwdgn~passthrough_hide_iommu_from_domain~1`
> +
> +Description:
> +Xen shall not expose the IOMMU device to the domain even if I/O virtualization
> +is disabled. The IOMMU shall be under hypervisor control only
This requirement would prevent us to expose a virtual SMMU to the guest. 
I think the requirement should only be Xen configures the stage-2 IOMMU.

> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~device_passthrough~1`
> +
> +Discover PCI devices from hardware domain
> +-----------------------------------------
> +
> +`XenSwdgn~passthrough_discover_pci_devices_from_hwdom~1`
> +
> +Description:
> +The hardware domain shall enumerate and discover PCI devices and inform Xen
> +about their appearance and disappearance.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~device_passthrough~1`
> +
> +Discover PCI devices from Xen
> +-----------------------------
> +
> +`XenSwdgn~passthrough_discover_pci_devices_from_xen~1`
> +
> +Description:
> +Xen shall discover PCI devices (enumerated by the firmware beforehand) during
> +boot if the hardware domain is not present.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~device_passthrough~1`
> +
> +Assign PCI device to domain (with IOMMU)
> +----------------------------------------
> +
> +`XenSwdgn~passthrough_assign_pci_device_with_iommu~1`
> +
> +Description:
> +Xen shall assign a specified PCI device (always implied as DMA-capable) to
> +a domain during its creation using passthrough (partial) device tree on Arm64
> +and Hyperlaunch device tree on AMD-x86. The physical device to be assigned is
> +protected by the IOMMU.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~device_passthrough~1`
> +
> +Deassign PCI device from domain (with IOMMU)
> +--------------------------------------------
> +
> +`XenSwdgn~passthrough_deassign_pci_device_with_iommu~1`
> +
> +Description:
> +Xen shall deassign a specified PCI device from a domain during its destruction.
> +The physical device to be deassigned is protected by the IOMMU.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~device_passthrough~1`
> +
> +Forbid the same PCI device assignment to multiple domains
> +---------------------------------------------------------
> +
> +`XenSwdgn~passthrough_forbid_same_pci_device_assignment~1`
> +
> +Description:
> +Xen shall not assign the same PCI device to multiple domains by failing to
> +create a new domain if the device to be passed through is already assigned
> +to the existing domain. Also different PCI devices which share some resources
> +(interrupts, IOMMU connections) can be assigned only to the same domain.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~device_passthrough~1`
> +
> +Requirements for Arm64 only
> +===========================
> +
> +Assign interrupt-less platform device to domain
> +-----------------------------------------------

Why does it need to be "interrupt-less"?

> +
> +`XenSwdgn~passthrough_assign_interrupt_less_platform_device~1`
> +
> +Description:
> +Xen shall assign a specified platform device that has only a MMIO region
> +(does not have any interrupts) to a domain during its creation using passthrough
> +device tree.

Is this requirement meant to be written from a dom0less point of view? 
Asking because platform device are assigned using an xl configuration 
for non-dom0less.


> +The example of interrupt-less device is PWM or clock controller.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~device_passthrough~1`
> +
> +Deassign interrupt-less platform device from domain
> +---------------------------------------------------
> +
> +`XenSwdgn~passthrough_deassign_interrupt_less_platform_device~1`
> +
> +Description:
> +Xen shall deassign a specified platform device that has only a MMIO region
> +(does not have any interrupts) from a domain during its destruction.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~device_passthrough~1`
> +
> +Assign non-DMA-capable platform device to domain
> +------------------------------------------------
> +
> +`XenSwdgn~passthrough_assign_non_dma_platform_device~1`
> +
> +Description:
> +Xen shall assign a specified non-DMA-capable platform device to a domain during
> +its creation using passthrough device tree.
> +The example of non-DMA-capable device is Timer.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~device_passthrough~1`
> +
> +Deassign non-DMA-capable platform device from domain
> +----------------------------------------------------
> +
> +`XenSwdgn~passthrough_deassign_non_dma_platform_device~1`
> +
> +Description:
> +Xen shall deassign a specified non-DMA-capable platform device from a domain
> +during its destruction.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~device_passthrough~1`
> +
> +Assign DMA-capable platform device to domain (with IOMMU)
> +---------------------------------------------------------
> +
> +`XenSwdgn~passthrough_assign_dma_platform_device_with_iommu~1`
> +
> +Description:
> +Xen shall assign a specified DMA-capable platform device to a domain during
> +its creation using passthrough device tree. The physical device to be assigned
> +is protected by the IOMMU.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~device_passthrough~1`
> +
> +Deassign DMA-capable platform device from domain (with IOMMU)
> +-------------------------------------------------------------
> +
> +`XenSwdgn~passthrough_deassign_dma_platform_device_with_iommu~1`
> +
> +Description:
> +Xen shall deassign a specified DMA-capable platform device from a domain during
> +its destruction. The physical device to be deassigned is protected by the IOMMU.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~device_passthrough~1`
> +
> +Assign DMA-capable platform device to domain (without IOMMU)
> +------------------------------------------------------------
> +
> +`XenSwdgn~passthrough_assign_dma_platform_device_without_iommu~1`
> +
> +Description:
> +Xen shall assign a specified DMA-capable platform device to a domain during
> +its creation using passthrough device tree. The physical device to be assigned
> +is not protected by the IOMMU.
> +The DMA-capable device assignment which is not behind an IOMMU is allowed for
> +the direct mapped domains only. The direct mapped domain must be either safe or

What do you mean by "safe" in the context? Did you intend to say "trusted"?

> +additional security mechanisms for protecting against possible malicious or
> +buggy DMA devices must be in place, e.g. Xilinx memory protection unit (XMPU)
> +and Xilinx peripheral protection unit (XPPU).
> +
> +Rationale:
> +The IOMMU is absent from the system or it is disabled (status = "disabled"
> +in the host device tree).
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~device_passthrough~1`
> +
> +Deassign DMA-capable platform device from domain (without IOMMU)
> +----------------------------------------------------------------

Do we actually need a separate section for deassign assign without the 
IOMMU? IOW, can this be combined with the deassign with IOMMU?

> +
> +`XenSwdgn~passthrough_deassign_dma_platform_device_without_iommu~1`
> +
> +Description:
> +Xen shall deassign a specified DMA-capable platform device from a domain during
> +its destruction. The physical device to be deassigned is not protected
> +by the IOMMU.
> +
> +Rationale:
> +The IOMMU is absent from the system or it is disabled (status = "disabled"
> +in the host device tree).
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~device_passthrough~1`
> +
> +Map platform device MMIO region identity
> +----------------------------------------

Can you explain why we need to make the distinction between identity 
mapping and ...

> +
> +`XenSwdgn~passthrough_map_platform_device_mmio_region_ident~1`
> +
> +Description:
> +Xen shall map platform device memory region identity (guest address ==
> +physical address) when assigning a specified platform device to a domain.
> +The device can be either non-DMA-capable or DMA-capable.
> +
> +Rationale:
> +
> +Comments:
> +
> +Covers:
> + - `XenProd~device_passthrough~1`
> +
> +Map platform device MMIO region non-identity
> +--------------------------------------------

... non-identity one?

Cheers,

-- 
Julien Grall

