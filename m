Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 698FD9936EA
	for <lists+xen-devel@lfdr.de>; Mon,  7 Oct 2024 20:55:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.812348.1225084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxstW-00037t-0K; Mon, 07 Oct 2024 18:55:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 812348.1225084; Mon, 07 Oct 2024 18:55:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sxstV-00034v-Ry; Mon, 07 Oct 2024 18:55:45 +0000
Received: by outflank-mailman (input) for mailman id 812348;
 Mon, 07 Oct 2024 18:55:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RzQd=RD=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1sxstT-00031L-Qc
 for xen-devel@lists.xenproject.org; Mon, 07 Oct 2024 18:55:43 +0000
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c099259e-84dd-11ef-a0bb-8be0dac302b0;
 Mon, 07 Oct 2024 20:55:42 +0200 (CEST)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-5398d171fa2so5456393e87.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Oct 2024 11:55:42 -0700 (PDT)
Received: from EPUAKYIW03DD.. ([91.123.151.46])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539aff23530sm903643e87.239.2024.10.07.11.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2024 11:55:39 -0700 (PDT)
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
X-Inumbo-ID: c099259e-84dd-11ef-a0bb-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728327342; x=1728932142; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0O/bwYVoYbl6H5jEzHRfmeoSwPu6F3N4nQtAhVDwn+U=;
        b=LNm9OnFzqyClPXyBbLjPnSQPmqPfA76E1z5czt8gmTofQCTNP0BpRQFuxRyuRdrBVP
         T0y+0F1Laui1u9FSL8RE9nGl5TsT8UoKVLvqO2G8ib4qrI64SfGjdtyQhK9lOB5tUueA
         7ImXSJE21zBJuTxsYAeZc2IdeBzB7MXDWmC10rqhtpaTdkgYPgOwoMZlgBp4sS+dUDb8
         aaFm9GHRdvrnkmFJwb82iusZYptc2L93QBU9nXlJHIXB2blNLgaPDVzp/3Pe0MP9xaj4
         C9Tv4rcKG3LFeqZycXbecLFpm2/FfX1ZATlK/1WGc7V367+Vhc77lran/6m1CVwKeUij
         pbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728327342; x=1728932142;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0O/bwYVoYbl6H5jEzHRfmeoSwPu6F3N4nQtAhVDwn+U=;
        b=qwQQ3cJjCL9kGMAiSP9I/ijecblHvMVymLhKP8f3ZwWorQJkCZgF/eaRdVbAYa0pIZ
         dKdgs7zB357xe5BqbkVGS41fEVIwVfIBph2mSV3LLHW9ga41yG5ESbdKaxNPPw7rm0Ip
         3Ut7NYzkhsgZnloUyEQ4/5ImMAZdOXFbAJV/wvZAffK5y46ZkjEqqo88HQ8jd2pDE8fj
         WHdJarel8k56rpeWN2I8Q6Q0iePhK/WvGJdJb35620JWCDqxierCjccx5zIrta84ezfP
         BlE8nCJGCHLcp0JTf7JcIPXOkR3LgOkSKRCu9nQMj18djNm+f7Z6Q9idn5v4ERlSL6pl
         V9ag==
X-Gm-Message-State: AOJu0YxwArIG59/6PmpoiDbndSCFbfk4pZwsS/1VG1Bk0OUdcCO8i8Zd
	PkvGREW8tRfnmmj7VybbT/kPpz2akR4Hlg7cx8P2Ci95Fr9R2EXohN4oIA==
X-Google-Smtp-Source: AGHT+IE1dijPr6it5cor4eT0Dl7l9AHJXIHyY/lyMwb9CGjNnafq4K6WEn5eNDOGsSytgTdPtHv3RA==
X-Received: by 2002:a05:6512:1155:b0:539:9225:43a6 with SMTP id 2adb3069b0e04-539ab88ccb1mr7667357e87.35.1728327341455;
        Mon, 07 Oct 2024 11:55:41 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	Artem Mygaiev <artem_mygaiev@epam.com>,
	Hisao Munakata <hisao.munakata.vt@renesas.com>
Subject: [PATCH] docs: fusa: Add requirements for Device Passthrough
Date: Mon,  7 Oct 2024 21:55:08 +0300
Message-Id: <20241007185508.3044115-1-olekstysh@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Add common requirements for a physical device assignment to Arm64
and AMD64 PVH domains.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---
Based on:
[PATCH] docs: fusa: Replace VM with domain
https://patchew.org/Xen/20241007182603.826807-1-ayan.kumar.halder@amd.com/
---
---
 .../reqs/design-reqs/common/passthrough.rst   | 365 ++++++++++++++++++
 docs/fusa/reqs/index.rst                      |   1 +
 docs/fusa/reqs/market-reqs/reqs.rst           |  33 ++
 docs/fusa/reqs/product-reqs/common/reqs.rst   |  29 ++
 4 files changed, 428 insertions(+)
 create mode 100644 docs/fusa/reqs/design-reqs/common/passthrough.rst
 create mode 100644 docs/fusa/reqs/product-reqs/common/reqs.rst

diff --git a/docs/fusa/reqs/design-reqs/common/passthrough.rst b/docs/fusa/reqs/design-reqs/common/passthrough.rst
new file mode 100644
index 0000000000..a1d6676f65
--- /dev/null
+++ b/docs/fusa/reqs/design-reqs/common/passthrough.rst
@@ -0,0 +1,365 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Device Passthrough
+==================
+
+The following are the requirements related to a physical device assignment
+[1], [2] to Arm64 and AMD64 PVH domains.
+
+Requirements for both Arm64 and AMD64 PVH
+=========================================
+
+Hide IOMMU from a domain
+------------------------
+
+`XenSwdgn~passthrough_hide_iommu_from_domain~1`
+
+Description:
+Xen shall not expose the IOMMU device to the domain even if I/O virtualization
+is disabled. The IOMMU shall be under hypervisor control only.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Discover PCI devices from hardware domain
+-----------------------------------------
+
+`XenSwdgn~passthrough_discover_pci_devices_from_hwdom~1`
+
+Description:
+The hardware domain shall enumerate and discover PCI devices and inform Xen
+about their appearance and disappearance.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Discover PCI devices from Xen
+-----------------------------
+
+`XenSwdgn~passthrough_discover_pci_devices_from_xen~1`
+
+Description:
+Xen shall discover PCI devices (enumerated by the firmware beforehand) during
+boot if the hardware domain is not present.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Assign PCI device to domain (with IOMMU)
+----------------------------------------
+
+`XenSwdgn~passthrough_assign_pci_device_with_iommu~1`
+
+Description:
+Xen shall assign a specified PCI device (always implied as DMA-capable) to
+a domain during its creation using passthrough (partial) device tree on Arm64
+and Hyperlaunch device tree on AMD-x86. The physical device to be assigned is
+protected by the IOMMU.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Deassign PCI device from domain (with IOMMU)
+--------------------------------------------
+
+`XenSwdgn~passthrough_deassign_pci_device_with_iommu~1`
+
+Description:
+Xen shall deassign a specified PCI device from a domain during its destruction.
+The physical device to be deassigned is protected by the IOMMU.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Forbid the same PCI device assignment to multiple domains
+---------------------------------------------------------
+
+`XenSwdgn~passthrough_forbid_same_pci_device_assignment~1`
+
+Description:
+Xen shall not assign the same PCI device to multiple domains by failing to
+create a new domain if the device to be passed through is already assigned
+to the existing domain. Also different PCI devices which share some resources
+(interrupts, IOMMU connections) can be assigned only to the same domain.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Requirements for Arm64 only
+===========================
+
+Assign interrupt-less platform device to domain
+-----------------------------------------------
+
+`XenSwdgn~passthrough_assign_interrupt_less_platform_device~1`
+
+Description:
+Xen shall assign a specified platform device that has only a MMIO region
+(does not have any interrupts) to a domain during its creation using passthrough
+device tree.
+The example of interrupt-less device is PWM or clock controller.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Deassign interrupt-less platform device from domain
+---------------------------------------------------
+
+`XenSwdgn~passthrough_deassign_interrupt_less_platform_device~1`
+
+Description:
+Xen shall deassign a specified platform device that has only a MMIO region
+(does not have any interrupts) from a domain during its destruction.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Assign non-DMA-capable platform device to domain
+------------------------------------------------
+
+`XenSwdgn~passthrough_assign_non_dma_platform_device~1`
+
+Description:
+Xen shall assign a specified non-DMA-capable platform device to a domain during
+its creation using passthrough device tree.
+The example of non-DMA-capable device is Timer.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Deassign non-DMA-capable platform device from domain
+----------------------------------------------------
+
+`XenSwdgn~passthrough_deassign_non_dma_platform_device~1`
+
+Description:
+Xen shall deassign a specified non-DMA-capable platform device from a domain
+during its destruction.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Assign DMA-capable platform device to domain (with IOMMU)
+---------------------------------------------------------
+
+`XenSwdgn~passthrough_assign_dma_platform_device_with_iommu~1`
+
+Description:
+Xen shall assign a specified DMA-capable platform device to a domain during
+its creation using passthrough device tree. The physical device to be assigned
+is protected by the IOMMU.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Deassign DMA-capable platform device from domain (with IOMMU)
+-------------------------------------------------------------
+
+`XenSwdgn~passthrough_deassign_dma_platform_device_with_iommu~1`
+
+Description:
+Xen shall deassign a specified DMA-capable platform device from a domain during
+its destruction. The physical device to be deassigned is protected by the IOMMU.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Assign DMA-capable platform device to domain (without IOMMU)
+------------------------------------------------------------
+
+`XenSwdgn~passthrough_assign_dma_platform_device_without_iommu~1`
+
+Description:
+Xen shall assign a specified DMA-capable platform device to a domain during
+its creation using passthrough device tree. The physical device to be assigned
+is not protected by the IOMMU.
+The DMA-capable device assignment which is not behind an IOMMU is allowed for
+the direct mapped domains only. The direct mapped domain must be either safe or
+additional security mechanisms for protecting against possible malicious or
+buggy DMA devices must be in place, e.g. Xilinx memory protection unit (XMPU)
+and Xilinx peripheral protection unit (XPPU).
+
+Rationale:
+The IOMMU is absent from the system or it is disabled (status = "disabled"
+in the host device tree).
+
+Comments:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Deassign DMA-capable platform device from domain (without IOMMU)
+----------------------------------------------------------------
+
+`XenSwdgn~passthrough_deassign_dma_platform_device_without_iommu~1`
+
+Description:
+Xen shall deassign a specified DMA-capable platform device from a domain during
+its destruction. The physical device to be deassigned is not protected
+by the IOMMU.
+
+Rationale:
+The IOMMU is absent from the system or it is disabled (status = "disabled"
+in the host device tree).
+
+Comments:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Map platform device MMIO region identity
+----------------------------------------
+
+`XenSwdgn~passthrough_map_platform_device_mmio_region_ident~1`
+
+Description:
+Xen shall map platform device memory region identity (guest address ==
+physical address) when assigning a specified platform device to a domain.
+The device can be either non-DMA-capable or DMA-capable.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Map platform device MMIO region non-identity
+--------------------------------------------
+
+`XenSwdgn~passthrough_map_platform_device_mmio_region_non_ident~1`
+
+Description:
+Xen shall map platform device memory region non-identity (guest address !=
+physical address) when assigning a specified platform device to a domain.
+The device can be either non-DMA-capable or DMA-capable.
+
+Rationale:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Assign PCI device to domain (without IOMMU)
+-------------------------------------------
+
+`XenSwdgn~passthrough_assign_pci_device_without_iommu~1`
+
+Description:
+Xen shall assign a specified PCI device to a domain during its creation using
+passthrough device tree. The physical device to be assigned is not protected
+by the IOMMU.
+The DMA-capable device assignment which is not behind an IOMMU is allowed for
+the direct mapped domains only. The direct mapped domain must be either safe or
+additional security mechanisms for protecting against possible malicious or
+buggy DMA devices must be in place, e.g. Xilinx memory protection unit (XMPU)
+and Xilinx peripheral protection unit (XPPU).
+
+Rationale:
+The IOMMU is absent from the system or it is disabled (status = "disabled"
+in the host device tree).
+
+Comments:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Deassign PCI device from domain (without IOMMU)
+-----------------------------------------------
+
+`XenSwdgn~passthrough_deassign_pci_device_without_iommu~1`
+
+Description:
+Xen shall deassign a specified PCI device from a domain during its destruction.
+The physical device to be deassigned is not protected by the IOMMU.
+
+Rationale:
+The IOMMU is absent from the system or it is disabled (status = "disabled"
+in the host device tree).
+
+Comments:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Forbid the same platform device assignment to multiple domains
+--------------------------------------------------------------
+
+`XenSwdgn~passthrough_forbid_same_platform_device_assignment~1`
+
+Description:
+Xen shall not assign the same platform device to multiple domains by failing
+to create a new domain if the device to be passed through is already assigned
+to the existing domain. Also, different platform devices which share some
+resources (interrupts, IOMMU connections) can be assigned only to the same
+domain.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~device_passthrough~1`
+
+Notes
+=====
+
+The AMD64 PVH-specific requirements are written under the assumption that once
+the Hyperlaunch feature is completed, Xen shall assign a PCI device to boot
+time domains. This is not the case today, where the PCI device can be passed
+through only to domains launched by a control (toolstack) domain.
+
+The Arm64-specific requirements are written under the assumption that once
+the dom0less PCI Passthrough feature is completed, Xen shall assign a PCI device
+to boot time domains. This is not the case today, where only the platform device
+Passthrough is supported.
+
+[1] https://xenbits.xenproject.org/gitweb/?p=xen.git;a=blob;f=docs/misc/arm/passthrough.txt;hb=HEAD
+[2] https://xenbits.xenproject.org/gitweb/?p=xen.git;a=blob;f=docs/misc/arm/passthrough-noiommu.txt;hb=HEAD
diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
index 183f183b1f..19c2f26b2b 100644
--- a/docs/fusa/reqs/index.rst
+++ b/docs/fusa/reqs/index.rst
@@ -10,3 +10,4 @@ Requirements documentation
    market-reqs
    product-reqs
    design-reqs/arm64
+   design-reqs/common
diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/market-reqs/reqs.rst
index f456788d96..37a443395b 100644
--- a/docs/fusa/reqs/market-reqs/reqs.rst
+++ b/docs/fusa/reqs/market-reqs/reqs.rst
@@ -47,3 +47,36 @@ Comments:
 
 Needs:
  - XenProd
+
+Run AMD-x86 domains
+-------------------
+
+`XenMkt~run_x86_domains~1`
+
+Description:
+Xen shall run AMD-x86 domains.
+
+Rationale:
+
+Comments:
+
+Needs:
+ - XenProd
+
+Domain device assignment
+------------------------
+
+`XenMkt~domain_device_assignment~1`
+
+Description:
+Xen shall assign device to each domain.
+
+For example, it shall assign GPU to domain A, MMC to domain B. Only the domain
+assigned to a device, shall have exclusive access to the device.
+
+Rationale:
+
+Comments:
+
+Needs:
+ - XenProd
diff --git a/docs/fusa/reqs/product-reqs/common/reqs.rst b/docs/fusa/reqs/product-reqs/common/reqs.rst
new file mode 100644
index 0000000000..9304399e4d
--- /dev/null
+++ b/docs/fusa/reqs/product-reqs/common/reqs.rst
@@ -0,0 +1,29 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Domain Creation And Runtime
+===========================
+
+Device Passthrough
+------------------
+
+`XenProd~device_passthrough~1`
+
+Description:
+Xen shall provide mechanism for assigning a physical device to the domains.
+
+For example:
+
+- PCI passthrough
+- MMC passthrough
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenMkt~run_arm64_domains~1`
+ - `XenMkt~run_x86_domains~1`
+ - `XenMkt~domain_device_assignment~1`
+
+Needs:
+ - XenSwdgn
-- 
2.34.1


