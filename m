Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5454D89C173
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 15:21:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701969.1096660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtour-0007pm-6D; Mon, 08 Apr 2024 13:20:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701969.1096660; Mon, 08 Apr 2024 13:20:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtour-0007mO-2j; Mon, 08 Apr 2024 13:20:05 +0000
Received: by outflank-mailman (input) for mailman id 701969;
 Mon, 08 Apr 2024 13:20:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oWAg=LN=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1rtoup-0007Tw-LL
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 13:20:03 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b4da2fbb-f5aa-11ee-afe6-a90da7624cb6;
 Mon, 08 Apr 2024 15:20:02 +0200 (CEST)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2d4979cd8c8so41246691fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 08 Apr 2024 06:20:02 -0700 (PDT)
Received: from EPUAKYIW03DD.. ([91.123.150.5])
 by smtp.gmail.com with ESMTPSA id
 c25-20020a2e9d99000000b002d88804b368sm589854ljj.43.2024.04.08.06.19.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Apr 2024 06:19:59 -0700 (PDT)
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
X-Inumbo-ID: b4da2fbb-f5aa-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712582401; x=1713187201; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+0SuAr8UhOdWRuUtYrEHU+b3ks93OwEClORHW6VBz7g=;
        b=Z+HnS1PNnNmW9zgSxMIFCd2hdWgJfB07ouSOp/aiOQOx02RGwdf5tguk/49at271Ct
         f1Bn4p1jbDClqp3HeRsd8PDvLZL1Ks+7sNcxDP5TWVP7FM9mMryy6IiFX7JSUrcJLobT
         KNUfMpoGpFvO0SuwRHZ2ysJBTVnqlBONPFSZyBW/8ncefLYmXtPLgCOizJGkYOfk5PPT
         AawNMb05GZYRmXoS57smENjg0COW5lScNnMUfChTdBLkNrJZ04Dj6QDJkgJu4cGppb9h
         oEZh0TTalbXCIOass6N66Y0gVXQ4SzuOfaai4KNVo34ljW5+DWeKL0f0bD492/18ch3s
         TrJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712582401; x=1713187201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+0SuAr8UhOdWRuUtYrEHU+b3ks93OwEClORHW6VBz7g=;
        b=bMbO+W2jGUgt/0PocoY5wOkcNltfa36F7ea1dNZhUxEWmz3NJoxLswtLr8P/Naiy13
         m3pjjVdfPgiREVHhS5jHPWTG2X2hx7+G1Fn1MtwhBdnAmiG3UsbW4mHAdLjXcSIf6Zzj
         +FE83RdYjEKU0+m/bnDp+PZVQZHop06QvHUvs103zHP6H/1D5KbDhXfNzeL0eKPJzlao
         FpW8iwN+At3tcq3bWubxXwLeMlucXhRxnvNCGgnoFw7ygd0jiVWGmAchq5JDGdAa5882
         EDtSH3yEl8zVXTSdKKekiVFV+QB0SagY6lXjapmWC6njMnPciSImRcYkvcXz6H6E2tbk
         wYWA==
X-Gm-Message-State: AOJu0Yz3PKzHLmYb52bhKsl9n0ste7il82wQAKsJ6gK4LS8JLxtADzae
	GDV755337akll0y/UVhguOEibvesq/m/i/pmlGGWhCwWxT0oP5mEQmGiHSg5
X-Google-Smtp-Source: AGHT+IHHOUsQooFYwHET2MYHB2djNy/k2k2eqrkQmoaGWG/ZWadCAOu5gtpsIzo4M3wjznWIHJhaKA==
X-Received: by 2002:a2e:83d5:0:b0:2d8:4c1d:10fc with SMTP id s21-20020a2e83d5000000b002d84c1d10fcmr3108472ljh.18.1712582400825;
        Mon, 08 Apr 2024 06:20:00 -0700 (PDT)
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
To: xen-devel@lists.xenproject.org,
	amd-xen-safety@groups.io
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Artem Mygaiev <artem_mygaiev@epam.com>,
	Ayan Kumar Halder <ayankuma@amd.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>,
	Mykola Kvach <mykola_kvach@epam.com>,
	Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: [PATCH V4] Add requirements for Device Passthrough
Date: Mon,  8 Apr 2024 16:19:45 +0300
Message-Id: <20240408131945.476581-1-olekstysh@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Please refer to chapter "Device Passthrough":
https://groups.io/g/amd-xen-safety/message/1300

Create corresponding directory and README file.

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
---

  V2:
   - add R-b
   - update README
   - lower case for platform, s/simple/non-DMA-capable, other misc
     updates
   - add "Allowed for the safe direct mapped VMs only"
     to reqs for DMA-capable devices without IOMMU protection
   - add dom0less passthrough details where needed
   - add reqs for PCI devices discovering

  V3:
   - move common reqs "Assign PCI device to domain (without IOMMU)" and
     "Deassign PCI device from domain (without IOMMU)" to Arm64 only
   - clarify the DMA-capable device assignment w/o IOMMU,
     add more details
   - drop R-b

  V4:
   - add the following reqs:
     - Assign interrupt-less platform device to domain
     - Deassign interrupt-less platform device from domain
     - Map platform device MMIO region identity
     - Map platform device MMIO region non-identity
   - add more details
   - repeat the relevant info in all assign reqs
---
---
 .../physical_resources/README.rst             |  16 +
 .../physical_resources/passthrough.rst        | 477 ++++++++++++++++++
 2 files changed, 493 insertions(+)
 create mode 100644 domain_creation_and_runtime/physical_resources/README.rst
 create mode 100644 domain_creation_and_runtime/physical_resources/passthrough.rst

diff --git a/domain_creation_and_runtime/physical_resources/README.rst b/domain_creation_and_runtime/physical_resources/README.rst
new file mode 100644
index 0000000..0eb4dd4
--- /dev/null
+++ b/domain_creation_and_runtime/physical_resources/README.rst
@@ -0,0 +1,16 @@
+Physical resources
+==================
+
+This section lists the requirements related to physical resources directly
+accessible from the domain as well as physical resources entirely controlled
+by Xen and invisible to a domain. The later group of resources, although being
+invisible to a domain, has an impact on it.
+
+Examples of domain physical resources:
+    | 1. PCI device
+    | 2. Platform device
+    | 3. MMU stage 1
+
+Examples of Xen physical resources:
+    | 1. IOMMU stage 2
+    | 2. MMU stage 2
diff --git a/domain_creation_and_runtime/physical_resources/passthrough.rst b/domain_creation_and_runtime/physical_resources/passthrough.rst
new file mode 100644
index 0000000..f619730
--- /dev/null
+++ b/domain_creation_and_runtime/physical_resources/passthrough.rst
@@ -0,0 +1,477 @@
+Device Passthrough
+==================
+
+The following are the requirements related to a physical device
+assignment [1], [2] to Arm64 and AMD64 PVH domains.
+
+Requirements for both Arm64 and AMD64 PVH
+=========================================
+
+Hide IOMMU from a domain
+------------------------
+
+`XenSSR~hide_iommu_from_domain~1`
+
+Description:
+Xen should not expose the IOMMU device to the domain even if I/O virtualization
+is disabled. The IOMMU should be under hypervisor control only.
+
+Rationale:
+
+Covers:
+ - `XenPRQ~device_passthrough~1`
+
+Needs:
+ - XenValTestCase
+
+Discover PCI devices from hardware domain
+-----------------------------------------
+
+`XenSSR~discover_pci_devices_from_hwdom~1`
+
+Description:
+The hardware domain shall be able to enumerate and discover PCI devices and
+inform Xen about their appearance and disappearance
+
+Rationale:
+
+Covers:
+ - `XenPRQ~device_passthrough~1`
+
+Needs:
+ - XenValTestCase
+
+Discover PCI devices from Xen
+-----------------------------
+
+`XenSSR~discover_pci_devices_from_xen~1`
+
+Description:
+Xen shall be able to discover PCI devices (enumerated by the firmware
+beforehand) during boot if the hardware domain is not meant to be used
+
+Rationale:
+
+Covers:
+ - `XenPRQ~device_passthrough~1`
+
+Needs:
+ - XenValTestCase
+
+Assign PCI device to domain (with IOMMU)
+----------------------------------------
+
+`XenSSR~assign_pci_device_with_iommu~1`
+
+Description:
+Xen shall be able to assign a specified PCI device (always implied as
+DMA-capable) to a domain during its creation using passthrough (partial)
+device tree. The physical device to be assigned is protected by the IOMMU.
+
+Rationale:
+
+ - The passthrough device tree is specified using a device tree module node
+   with compatible ("multiboot,device-tree") in the host device tree
+ - The PCI device to be passed through is specified using device tree property
+   ("xen,pci-assigned") in the "passthrough" node described in the passthrough
+   device tree
+
+Covers:
+ - `XenPRQ~device_passthrough~1`
+
+Needs:
+ - XenValTestCase
+
+Deassign PCI device from domain (with IOMMU)
+--------------------------------------------
+
+`XenSSR~deassign_pci_device_with_iommu~1`
+
+Description:
+Xen shall be able to deassign a specified PCI device from a domain during its
+destruction. The physical device to be deassigned is protected by the IOMMU.
+
+Rationale:
+
+Covers:
+ - `XenPRQ~device_passthrough~1`
+
+Needs:
+ - XenValTestCase
+
+Forbid the same PCI device assignment to multiple domains
+---------------------------------------------------------
+
+`XenSSR~forbid_same_pci_device_assignment~1`
+
+Description:
+Xen should not assign the same PCI device to multiple domains by failing
+to create a new domain if the device to be passed through is already assigned
+to the existing domain. Also different PCI devices which share any resources
+(interrupts, IOMMU connections) can be assigned only to the same domain.
+
+Rationale:
+
+Covers:
+ - `XenPRQ~device_passthrough~1`
+
+Needs:
+ - XenValTestCase
+
+Requirements for Arm64 only
+===========================
+
+Assign interrupt-less platform device to domain
+-----------------------------------------------
+
+`XenSSR~assign_interrupt_less_platform_device~1`
+
+Description:
+Xen shall be able to assign a specified platform device that has only a MMIO
+region (does not have any interrupts) to a domain during its creation using
+passthrough device tree.
+The example of interrupt-less device is PWM or clock controller.
+
+Rationale:
+
+ - The passthrough device tree is specified using a device tree module node
+   with compatible ("multiboot,device-tree") in the host device tree
+ - The passthrough device tree should entirely describe the platform device to
+   be passed through for the domain to be able to discover and use this device
+ - The intention of the platform device usage for the passthrough is specified
+   using device tree property ("xen,passthrough") in the device node described
+   in the host device tree
+ - The memory region of the platform device and corresponding guest address for
+   remapping are specified using device tree property ("xen,reg") in the device
+   node described in the passthrough device tree
+ - The allowance of the platform device assignment which is not behind an IOMMU
+   (for both non-DMA-capable and DMA-capable devices) is specified using device
+   tree property ("xen,force-assign-without-iommu") in the device node
+   described in the passthrough device tree. The said property also allows
+   the interrupt-less platform device assignment (a device that has only a MMIO
+   region) without specifying the corresponding node in the host device via
+   device tree property ("xen,path").
+   For the DMA-capable devices this property is only allowed for the direct
+   mapped VMs with special care to be taken
+
+Covers:
+ - `XenPRQ~device_passthrough~1`
+
+Needs:
+
+ - XenValTestCase
+
+Deassign interrupt-less platform device from domain
+---------------------------------------------------
+
+`XenSSR~deassign_interrupt_less_platform_device~1`
+
+Description:
+Xen shall be able to deassign a specified platform device that has only a MMIO
+region (does not have any interrupts) from a domain during its destruction
+
+Rationale:
+
+Covers:
+ - `XenPRQ~device_passthrough~1`
+
+Needs:
+ - XenValTestCase
+
+Assign non-DMA-capable platform device to domain
+------------------------------------------------
+
+`XenSSR~assign_non_dma_platform_device~1`
+
+Description:
+Xen shall be able to assign a specified non-DMA-capable platform
+device to a domain during its creation using passthrough device tree.
+The example of non-DMA-capable device is Timer.
+
+Rationale:
+
+ - The passthrough device tree is specified using a device tree module node
+   with compatible ("multiboot,device-tree") in the host device tree
+ - The passthrough device tree should entirely describe the platform device to
+   be passed through for the domain to be able to discover and use this device
+ - The intention of the platform device usage for the passthrough is specified
+   using device tree property ("xen,passthrough") in the device node described
+   in the host device tree
+ - The memory region of the platform device and corresponding guest address for
+   remapping are specified using device tree property ("xen,reg") in the device
+   node described in the passthrough device tree
+ - The path of the platform device node in the host device tree is specified
+   using device tree property ("xen,path") in the device node described
+   in the passthrough device tree. Both interrupt mappings and IOMMU settings
+   are based on it
+ - The allowance of the platform device assignment which is not behind an IOMMU
+   (for both non-DMA-capable and DMA-capable devices) is specified using device
+   tree property ("xen,force-assign-without-iommu") in the device node
+   described in the passthrough device tree. The said property also allows
+   the interrupt-less platform device assignment (a device that has only a MMIO
+   region) without specifying the corresponding node in the host device via
+   device tree property ("xen,path").
+   For the DMA-capable devices this property is only allowed for the direct
+   mapped VMs with special care to be taken
+
+Covers:
+ - `XenPRQ~device_passthrough~1`
+
+Needs:
+ - XenValTestCase
+
+Deassign non-DMA-capable platform device from domain
+----------------------------------------------------
+
+`XenSSR~deassign_non_dma_platform_device~1`
+
+Description:
+Xen shall be able to deassign a specified non-DMA-capable platform
+device from a domain during its destruction
+
+Rationale:
+
+Covers:
+ - `XenPRQ~device_passthrough~1`
+
+Needs:
+ - XenValTestCase
+
+Assign DMA-capable platform device to domain (with IOMMU)
+---------------------------------------------------------
+
+`XenSSR~assign_dma_platform_device_with_iommu~1`
+
+Description:
+Xen shall be able to assign a specified DMA-capable platform device to a domain
+during its creation using passthrough device tree. The physical device to be
+assigned is protected by the IOMMU.
+
+Rationale:
+
+ - The passthrough device tree is specified using a device tree module node
+   with compatible ("multiboot,device-tree") in the host device tree
+ - The passthrough device tree should entirely describe the platform device to
+   be passed through for the domain to be able to discover and use this device
+ - The intention of the platform device usage for the passthrough is specified
+   using device tree property ("xen,passthrough") in the device node described
+   in the host device tree
+ - The memory region of the platform device and corresponding guest address for
+   remapping are specified using device tree property ("xen,reg") in the device
+   node described in the passthrough device tree
+ - The path of the platform device node in the host device tree is specified
+   using device tree property ("xen,path") in the device node described
+   in the passthrough device tree. Both interrupt mappings and IOMMU settings
+   are based on it
+
+Covers:
+ - `XenPRQ~device_passthrough~1`
+
+Needs:
+ - XenValTestCase
+
+Deassign DMA-capable platform device from domain (with IOMMU)
+-------------------------------------------------------------
+
+`XenSSR~deassign_dma_platform_device_with_iommu~1`
+
+Description:
+Xen shall be able to deassign a specified DMA-capable platform device from
+a domain during its destruction. The physical device to be deassigned is
+protected by the IOMMU.
+
+Rationale:
+
+Covers:
+ - `XenPRQ~device_passthrough~1`
+
+Needs:
+ - XenValTestCase
+
+Assign DMA-capable platform device to domain (without IOMMU)
+------------------------------------------------------------
+
+`XenSSR~assign_dma_platform_device_without_iommu~1`
+
+Description:
+Xen shall be able to assign a specified DMA-capable platform device to a domain
+during its creation using passthrough device tree. The physical device to be
+assigned is not protected by the IOMMU.
+Here and everywhere it applies, the DMA-capable device assignment which is not
+behind an IOMMU is allowed for the direct mapped VMs only. The direct mapped VM
+must be either safe or additional security mechanisms for protecting against
+possible malicious or buggy DMA devices must be in place, e.g. Xilinx memory
+protection unit (XMPU) and Xilinx peripheral protection unit (XPPU).
+
+Rationale:
+
+ - The IOMMU is absent from the system or it is disabled (status = "disabled"
+   in the host device tree)
+ - The passthrough device tree is specified using a device tree module node
+   with compatible ("multiboot,device-tree") in the host device tree
+ - The passthrough device tree should entirely describe the platform device to
+   be passed through for the domain to be able to discover and use this device
+ - The intention of the platform device usage for the passthrough is specified
+   using device tree property ("xen,passthrough") in the device node described
+   in the host device tree
+ - The memory region of the platform device and corresponding guest address for
+   remapping are specified using device tree property ("xen,reg") in the device
+   node described in the passthrough device tree
+ - The path of the platform device node in the host device tree is specified
+   using device tree property ("xen,path") in the device node described
+   in the passthrough device tree. Both interrupt mappings and IOMMU settings
+   are based on it
+ - The allowance of the platform device assignment which is not behind an IOMMU
+   (for both non-DMA-capable and DMA-capable devices) is specified using device
+   tree property ("xen,force-assign-without-iommu") in the device node
+   described in the passthrough device tree. The said property also allows
+   the interrupt-less platform device assignment (a device that has only a MMIO
+   region) without specifying the corresponding node in the host device via
+   device tree property ("xen,path").
+   For the DMA-capable devices this property is only allowed for the direct
+   mapped VMs with special care to be taken
+
+Covers:
+ - `XenPRQ~device_passthrough~1`
+
+Needs:
+ - XenValTestCase
+
+Deassign DMA-capable platform device from domain (without IOMMU)
+----------------------------------------------------------------
+
+`XenSSR~deassign_dma_platform_device_without_iommu~1`
+
+Description:
+Xen shall be able to deassign a specified DMA-capable platform device from
+a domain during its destruction. The physical device to be deassigned is not
+protected by the IOMMU.
+
+Rationale:
+The IOMMU is absent from the system or it is disabled (status = "disabled"
+in the host device tree)
+
+Covers:
+ - `XenPRQ~device_passthrough~1`
+
+Needs:
+ - XenValTestCase
+
+Map platform device MMIO region identity
+----------------------------------------
+
+`XenSSR~map_platform_device_mmio_region_ident~1`
+
+Description:
+Xen shall be able to map platform device memory region identity
+(guest address == physical address) when assigning a specified platform
+device to a domain. The device can be either non-DMA-capable or DMA-capable.
+
+Rationale:
+
+Covers:
+ - `XenPRQ~device_passthrough~1`
+
+Needs:
+ - XenValTestCase
+
+Map platform device MMIO region non-identity
+--------------------------------------------
+
+`XenSSR~map_platform_device_mmio_region_non_ident~1`
+
+Description:
+Xen shall be able to map platform device memory region non-identity
+(guest address != physical address) when assigning a specified platform
+device to a domain. The device can be either non-DMA-capable or DMA-capable.
+
+Rationale:
+
+Covers:
+ - `XenPRQ~device_passthrough~1`
+
+Needs:
+ - XenValTestCase
+
+Assign PCI device to domain (without IOMMU)
+-------------------------------------------
+
+`XenSSR~assign_pci_device_without_iommu~1`
+
+Description:
+Xen shall be able to assign a specified PCI device to a domain during its
+creation using passthrough device tree. The physical device to be assigned
+is not protected by the IOMMU.
+
+Rationale:
+
+ - The IOMMU is absent from the system or it is disabled (status = "disabled"
+   in the host device tree)
+ - The passthrough device tree is specified using a device tree module node
+   with compatible ("multiboot,device-tree") in the host device tree
+ - The PCI device to be passed through is specified using device tree property
+   ("xen,pci-assigned") in the "passthrough" node described in the passthrough
+   device tree
+
+Covers:
+ - `XenPRQ~device_passthrough~1`
+
+Needs:
+ - XenValTestCase
+
+Deassign PCI device from domain (without IOMMU)
+-----------------------------------------------
+
+`XenSSR~deassign_pci_device_without_iommu~1`
+
+Description:
+Xen shall be able to deassign a specified PCI device from a domain during its
+destruction. The physical device to be deassigned is not protected
+by the IOMMU.
+
+Rationale:
+The IOMMU is absent from the system or it is disabled (status = "disabled"
+in the host device tree)
+
+Covers:
+ - `XenPRQ~device_passthrough~1`
+
+Needs:
+ - XenValTestCase
+
+Forbid the same platform device assignment to multiple domains
+--------------------------------------------------------------
+
+`XenSSR~forbid_same_platform_device_assignment~1`
+
+Description:
+Xen should not assign the same platform device to multiple domains by failing
+to create a new domain if the device to be passed through is already assigned
+to the existing domain. Also, different platform devices which share any
+resources (interrupts, IOMMU connections) can be assigned only to the same
+domain.
+
+Rationale:
+
+Covers:
+ - `XenPRQ~device_passthrough~1`
+
+Needs:
+ - XenValTestCase
+
+Notes
+=====
+
+The AMD64 PVH-specific requirements are written under the assumption that once
+the hyperlaunch feature is completed, Xen shall be able to assign a PCI device
+to started at boot time domains. This is not the case today, where the PCI
+device can be passed through only to domains launched by a control (toolstack)
+domain.
+
+The Arm64-specific requirements are written under the assumption that once
+the dom0less PCI Passthrough feature is completed, Xen shall be able to assign
+a PCI device to started at boot time domains. This is not the case today,
+where only the platform device Passthrough is supported.
+
+| [1] https://xenbits.xenproject.org/gitweb/?p=xen.git;a=blob;f=docs/misc/arm/passthrough.txt;hb=HEAD
+| [2] https://xenbits.xenproject.org/gitweb/?p=xen.git;a=blob;f=docs/misc/arm/passthrough-noiommu.txt;hb=HEAD
-- 
2.34.1


