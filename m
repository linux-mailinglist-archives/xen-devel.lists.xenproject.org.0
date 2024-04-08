Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF2089CAE8
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 19:40:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.702036.1096760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtsxd-0006Ob-33; Mon, 08 Apr 2024 17:39:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 702036.1096760; Mon, 08 Apr 2024 17:39:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtsxd-0006Mc-0L; Mon, 08 Apr 2024 17:39:13 +0000
Received: by outflank-mailman (input) for mailman id 702036;
 Mon, 08 Apr 2024 17:39:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7si+=LN=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rtsxb-0006MW-S3
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 17:39:12 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20601.outbound.protection.outlook.com
 [2a01:111:f403:2408::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e5b1336e-f5ce-11ee-b7f7-5d6b493b22b9;
 Mon, 08 Apr 2024 19:39:07 +0200 (CEST)
Received: from SJ0PR13CA0044.namprd13.prod.outlook.com (2603:10b6:a03:2c2::19)
 by SJ2PR12MB8831.namprd12.prod.outlook.com (2603:10b6:a03:4d0::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.55; Mon, 8 Apr
 2024 17:39:01 +0000
Received: from CO1PEPF000042AB.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::e9) by SJ0PR13CA0044.outlook.office365.com
 (2603:10b6:a03:2c2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.16 via Frontend
 Transport; Mon, 8 Apr 2024 17:39:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AB.mail.protection.outlook.com (10.167.243.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Mon, 8 Apr 2024 17:39:01 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 8 Apr
 2024 12:38:55 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 8 Apr
 2024 12:38:54 -0500
Received: from [172.22.155.249] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 8 Apr 2024 12:38:53 -0500
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
X-Inumbo-ID: e5b1336e-f5ce-11ee-b7f7-5d6b493b22b9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f0b7el21/ca02BMEbdsZoBsCJvfo8N/WFF1FWdhRVL1ehZio4pnBlYmdfuOqamgM8/qw6KMoEuf7FgovGMBqgbboLenHMqwl6G6DmJIom2BQk/n+NOeo7RNwxA0ctJC+dgBarQ/WWyxhCdM1qgXpCA5UeRz00WEG73n/G+TH+3VSbXx3JgUv7NnhdAp3Tm59urvs34vaP+Hx2v7CIVxaU8H5IA1jLc1HIUP4qH4uIhAB6GWIMHdo34pDOeC26YM+8Z72Yx2Fkp4/diGbMs+C7sKxjPFQzMCRQZoBryXWCqqESM5JuBwfci27DqQ3gkUr//qG9WUkEUBydySeefU2hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yvV5SQCeWdgRdWuc5tGujfAp/NoKY1TrTKtUJiwNMO8=;
 b=ikKMDrfDTezkt8Wru579V262J6nUcDzpgDV8iVHovuG1Y6Z+aD7ztLpLrkxsY/VAOZ6OHcwy8NX7tucgr2EHwq9WFXmU98v6+pq+Qz03g/viNj1aX5YonBgY8ydpAkEweLXie6q6+cCyRbqaMtoJxyKKiQsqI8qOQN1j4PIXVfe9Um1ru4DGt3ZcKzIfduHD3Q5xI3UXqqzWdvXtkAGhKM1lGz4hnuwvLJ3HGAvAbn/IKSgXC4nDxd2xLezlf4B0S5ywFsLnCtUZ2lV3AxeufSQ+PUjRirmoEngsztWr4s9r3AV3AiAj6CKxbPlh/7AqVLIVDbf9RdFUMwpK+LRfHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yvV5SQCeWdgRdWuc5tGujfAp/NoKY1TrTKtUJiwNMO8=;
 b=cNvjwC4jfJd8PrvcOnc2L6LqLsQJLrl6HxNl0sYOntZGtGxlshVQeVs05FAwtLMGX7NqVf2AAnoLmcySWnwgWyE8FLbzQK8P3OV8sTtoe4aVKRhfh9jk+3V+qBxDBCQixmRjjt9gUepZCWviVPOLfEFVN44dhF6wlrzB9iAf3DQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <33a14c95-c186-48bf-9aa5-cfcac374492a@amd.com>
Date: Mon, 8 Apr 2024 13:38:52 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V4] Add requirements for Device Passthrough
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	<xen-devel@lists.xenproject.org>, <amd-xen-safety@groups.io>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Michal Orzel
	<michal.orzel@amd.com>, Artem Mygaiev <artem_mygaiev@epam.com>, "Ayan Kumar
 Halder" <ayankuma@amd.com>, Stefano Stabellini <stefano.stabellini@amd.com>,
	Mykola Kvach <mykola_kvach@epam.com>
References: <20240408131945.476581-1-olekstysh@gmail.com>
Content-Language: en-US
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
In-Reply-To: <20240408131945.476581-1-olekstysh@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AB:EE_|SJ2PR12MB8831:EE_
X-MS-Office365-Filtering-Correlation-Id: d58d6981-9e02-4005-740c-08dc57f2c70f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qMYTT9iM96k+lJcZqOCkg5kT3lFZc3uXbFOfgJdsNjJtqM832XqNU6Nf72e890rt3jXMPytkisoE3NYAwq/x3waZW/27QVF6sPyYQVfl8GkfPePXFKJqBGNENvNeapW2Mc7BMmbr6SoCxqc8SSHyevx+psW/TRajaaAa1NuRh2srKPFdyqMEohRkyiz6F7wQhknz9x0dbj+O+m9FVrGoQeSAjroYHP1O3YrXKb2/DNNGuRLf7ghNbSJ7QIUs++87vIqSE/yzxMG1jRkrxjUPJILtSAfUGSqbSa1xySlQfoSOEjPGtseCFORjr13pwF9fFDOoMwb48w2WBVd5oqd4vWBKd1ek+26PdaMqyXssrAkN5JqBJ8bLaCErjICmwA/Uo46kVjPvdTqy38aEcFfgSq4Tk2DCTorVYZ7hlLWaZSSKTOFStJyZH3sjfx66Q7H62tBjETZng9K+tL4Inmej0OEk/El5JAPzd6dIMoNslGmAjI0BoFONVQwKeKGz5Ia3gnnWj/Y7VW3IFfKCb0oYAgWRkg6OZWkbhLMazIwakqRNb7eAfCaFJBHhLN1vnr6z+74tq0RNtz+caAPcvCZoceSjwuVRjWSFbPiIFpUmxVE1sRTELOZbWz4ZvuevxHWvgFtZYYXpXU1CwKMsc1Zh6B0TAywPPm42s4PTKiz7mcqmxrEIQNjizcsJDfaFCxdKWlM0ytGQF60m2jO8HaairQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 17:39:01.0023
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d58d6981-9e02-4005-740c-08dc57f2c70f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8831

On 4/8/24 09:19, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Please refer to chapter "Device Passthrough":
> https://groups.io/g/amd-xen-safety/message/1300
> 
> Create corresponding directory and README file.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Two nits below. With those addressed:

Reviewed-by: Stewart Hildebrand <stewart.hildebrand@amd.com>

> ---
> 
>   V2:
>    - add R-b
>    - update README
>    - lower case for platform, s/simple/non-DMA-capable, other misc
>      updates
>    - add "Allowed for the safe direct mapped VMs only"
>      to reqs for DMA-capable devices without IOMMU protection
>    - add dom0less passthrough details where needed
>    - add reqs for PCI devices discovering
> 
>   V3:
>    - move common reqs "Assign PCI device to domain (without IOMMU)" and
>      "Deassign PCI device from domain (without IOMMU)" to Arm64 only
>    - clarify the DMA-capable device assignment w/o IOMMU,
>      add more details
>    - drop R-b
> 
>   V4:
>    - add the following reqs:
>      - Assign interrupt-less platform device to domain
>      - Deassign interrupt-less platform device from domain
>      - Map platform device MMIO region identity
>      - Map platform device MMIO region non-identity
>    - add more details
>    - repeat the relevant info in all assign reqs
> ---
> ---
>  .../physical_resources/README.rst             |  16 +
>  .../physical_resources/passthrough.rst        | 477 ++++++++++++++++++
>  2 files changed, 493 insertions(+)
>  create mode 100644 domain_creation_and_runtime/physical_resources/README.rst
>  create mode 100644 domain_creation_and_runtime/physical_resources/passthrough.rst
> 
> diff --git a/domain_creation_and_runtime/physical_resources/README.rst b/domain_creation_and_runtime/physical_resources/README.rst
> new file mode 100644
> index 0000000..0eb4dd4
> --- /dev/null
> +++ b/domain_creation_and_runtime/physical_resources/README.rst
> @@ -0,0 +1,16 @@
> +Physical resources
> +==================
> +
> +This section lists the requirements related to physical resources directly
> +accessible from the domain as well as physical resources entirely controlled
> +by Xen and invisible to a domain. The later group of resources, although being
> +invisible to a domain, has an impact on it.
> +
> +Examples of domain physical resources:
> +    | 1. PCI device
> +    | 2. Platform device
> +    | 3. MMU stage 1
> +
> +Examples of Xen physical resources:
> +    | 1. IOMMU stage 2
> +    | 2. MMU stage 2
> diff --git a/domain_creation_and_runtime/physical_resources/passthrough.rst b/domain_creation_and_runtime/physical_resources/passthrough.rst
> new file mode 100644
> index 0000000..f619730
> --- /dev/null
> +++ b/domain_creation_and_runtime/physical_resources/passthrough.rst
> @@ -0,0 +1,477 @@
> +Device Passthrough
> +==================
> +
> +The following are the requirements related to a physical device
> +assignment [1], [2] to Arm64 and AMD64 PVH domains.
> +
> +Requirements for both Arm64 and AMD64 PVH
> +=========================================
> +
> +Hide IOMMU from a domain
> +------------------------
> +
> +`XenSSR~hide_iommu_from_domain~1`
> +
> +Description:
> +Xen should not expose the IOMMU device to the domain even if I/O virtualization
> +is disabled. The IOMMU should be under hypervisor control only.
> +
> +Rationale:
> +
> +Covers:
> + - `XenPRQ~device_passthrough~1`
> +
> +Needs:
> + - XenValTestCase
> +
> +Discover PCI devices from hardware domain
> +-----------------------------------------
> +
> +`XenSSR~discover_pci_devices_from_hwdom~1`
> +
> +Description:
> +The hardware domain shall be able to enumerate and discover PCI devices and
> +inform Xen about their appearance and disappearance
> +
> +Rationale:
> +
> +Covers:
> + - `XenPRQ~device_passthrough~1`
> +
> +Needs:
> + - XenValTestCase
> +
> +Discover PCI devices from Xen
> +-----------------------------
> +
> +`XenSSR~discover_pci_devices_from_xen~1`
> +
> +Description:
> +Xen shall be able to discover PCI devices (enumerated by the firmware
> +beforehand) during boot if the hardware domain is not meant to be used
> +
> +Rationale:
> +
> +Covers:
> + - `XenPRQ~device_passthrough~1`
> +
> +Needs:
> + - XenValTestCase
> +
> +Assign PCI device to domain (with IOMMU)
> +----------------------------------------
> +
> +`XenSSR~assign_pci_device_with_iommu~1`
> +
> +Description:
> +Xen shall be able to assign a specified PCI device (always implied as
> +DMA-capable) to a domain during its creation using passthrough (partial)
> +device tree. The physical device to be assigned is protected by the IOMMU.
> +
> +Rationale:
> +
> + - The passthrough device tree is specified using a device tree module node
> +   with compatible ("multiboot,device-tree") in the host device tree
> + - The PCI device to be passed through is specified using device tree property
> +   ("xen,pci-assigned") in the "passthrough" node described in the passthrough
> +   device tree
> +
> +Covers:
> + - `XenPRQ~device_passthrough~1`
> +
> +Needs:
> + - XenValTestCase
> +
> +Deassign PCI device from domain (with IOMMU)
> +--------------------------------------------
> +
> +`XenSSR~deassign_pci_device_with_iommu~1`
> +
> +Description:
> +Xen shall be able to deassign a specified PCI device from a domain during its
> +destruction. The physical device to be deassigned is protected by the IOMMU.
> +
> +Rationale:
> +
> +Covers:
> + - `XenPRQ~device_passthrough~1`
> +
> +Needs:
> + - XenValTestCase
> +
> +Forbid the same PCI device assignment to multiple domains
> +---------------------------------------------------------
> +
> +`XenSSR~forbid_same_pci_device_assignment~1`
> +
> +Description:
> +Xen should not assign the same PCI device to multiple domains by failing
> +to create a new domain if the device to be passed through is already assigned
> +to the existing domain. Also different PCI devices which share any resources
> +(interrupts, IOMMU connections) can be assigned only to the same domain.
> +
> +Rationale:
> +
> +Covers:
> + - `XenPRQ~device_passthrough~1`
> +
> +Needs:
> + - XenValTestCase
> +
> +Requirements for Arm64 only
> +===========================
> +
> +Assign interrupt-less platform device to domain
> +-----------------------------------------------
> +
> +`XenSSR~assign_interrupt_less_platform_device~1`
> +
> +Description:
> +Xen shall be able to assign a specified platform device that has only a MMIO
> +region (does not have any interrupts) to a domain during its creation using
> +passthrough device tree.
> +The example of interrupt-less device is PWM or clock controller.
> +
> +Rationale:
> +
> + - The passthrough device tree is specified using a device tree module node
> +   with compatible ("multiboot,device-tree") in the host device tree
> + - The passthrough device tree should entirely describe the platform device to
> +   be passed through for the domain to be able to discover and use this device
> + - The intention of the platform device usage for the passthrough is specified
> +   using device tree property ("xen,passthrough") in the device node described
> +   in the host device tree
> + - The memory region of the platform device and corresponding guest address for
> +   remapping are specified using device tree property ("xen,reg") in the device
> +   node described in the passthrough device tree
> + - The allowance of the platform device assignment which is not behind an IOMMU
> +   (for both non-DMA-capable and DMA-capable devices) is specified using device
> +   tree property ("xen,force-assign-without-iommu") in the device node
> +   described in the passthrough device tree. The said property also allows
> +   the interrupt-less platform device assignment (a device that has only a MMIO
> +   region) without specifying the corresponding node in the host device via
> +   device tree property ("xen,path").
> +   For the DMA-capable devices this property is only allowed for the direct
> +   mapped VMs with special care to be taken
> +
> +Covers:
> + - `XenPRQ~device_passthrough~1`
> +
> +Needs:
> +
> + - XenValTestCase
> +
> +Deassign interrupt-less platform device from domain
> +---------------------------------------------------
> +
> +`XenSSR~deassign_interrupt_less_platform_device~1`
> +
> +Description:
> +Xen shall be able to deassign a specified platform device that has only a MMIO
> +region (does not have any interrupts) from a domain during its destruction
> +
> +Rationale:
> +
> +Covers:
> + - `XenPRQ~device_passthrough~1`
> +
> +Needs:
> + - XenValTestCase
> +
> +Assign non-DMA-capable platform device to domain
> +------------------------------------------------
> +
> +`XenSSR~assign_non_dma_platform_device~1`
> +
> +Description:
> +Xen shall be able to assign a specified non-DMA-capable platform
> +device to a domain during its creation using passthrough device tree.
> +The example of non-DMA-capable device is Timer.
> +
> +Rationale:
> +
> + - The passthrough device tree is specified using a device tree module node
> +   with compatible ("multiboot,device-tree") in the host device tree
> + - The passthrough device tree should entirely describe the platform device to
> +   be passed through for the domain to be able to discover and use this device
> + - The intention of the platform device usage for the passthrough is specified
> +   using device tree property ("xen,passthrough") in the device node described
> +   in the host device tree
> + - The memory region of the platform device and corresponding guest address for
> +   remapping are specified using device tree property ("xen,reg") in the device
> +   node described in the passthrough device tree
> + - The path of the platform device node in the host device tree is specified
> +   using device tree property ("xen,path") in the device node described
> +   in the passthrough device tree. Both interrupt mappings and IOMMU settings
> +   are based on it
> + - The allowance of the platform device assignment which is not behind an IOMMU
> +   (for both non-DMA-capable and DMA-capable devices) is specified using device
> +   tree property ("xen,force-assign-without-iommu") in the device node
> +   described in the passthrough device tree. The said property also allows
> +   the interrupt-less platform device assignment (a device that has only a MMIO
> +   region) without specifying the corresponding node in the host device via
> +   device tree property ("xen,path").
> +   For the DMA-capable devices this property is only allowed for the direct
> +   mapped VMs with special care to be taken
> +
> +Covers:
> + - `XenPRQ~device_passthrough~1`
> +
> +Needs:
> + - XenValTestCase
> +
> +Deassign non-DMA-capable platform device from domain
> +----------------------------------------------------
> +
> +`XenSSR~deassign_non_dma_platform_device~1`
> +
> +Description:
> +Xen shall be able to deassign a specified non-DMA-capable platform
> +device from a domain during its destruction
> +
> +Rationale:
> +
> +Covers:
> + - `XenPRQ~device_passthrough~1`
> +
> +Needs:
> + - XenValTestCase
> +
> +Assign DMA-capable platform device to domain (with IOMMU)
> +---------------------------------------------------------
> +
> +`XenSSR~assign_dma_platform_device_with_iommu~1`
> +
> +Description:
> +Xen shall be able to assign a specified DMA-capable platform device to a domain
> +during its creation using passthrough device tree. The physical device to be
> +assigned is protected by the IOMMU.
> +
> +Rationale:
> +
> + - The passthrough device tree is specified using a device tree module node
> +   with compatible ("multiboot,device-tree") in the host device tree
> + - The passthrough device tree should entirely describe the platform device to
> +   be passed through for the domain to be able to discover and use this device
> + - The intention of the platform device usage for the passthrough is specified
> +   using device tree property ("xen,passthrough") in the device node described
> +   in the host device tree
> + - The memory region of the platform device and corresponding guest address for
> +   remapping are specified using device tree property ("xen,reg") in the device
> +   node described in the passthrough device tree
> + - The path of the platform device node in the host device tree is specified
> +   using device tree property ("xen,path") in the device node described
> +   in the passthrough device tree. Both interrupt mappings and IOMMU settings
> +   are based on it
> +
> +Covers:
> + - `XenPRQ~device_passthrough~1`
> +
> +Needs:
> + - XenValTestCase
> +
> +Deassign DMA-capable platform device from domain (with IOMMU)
> +-------------------------------------------------------------
> +
> +`XenSSR~deassign_dma_platform_device_with_iommu~1`
> +
> +Description:
> +Xen shall be able to deassign a specified DMA-capable platform device from
> +a domain during its destruction. The physical device to be deassigned is
> +protected by the IOMMU.
> +
> +Rationale:
> +
> +Covers:
> + - `XenPRQ~device_passthrough~1`
> +
> +Needs:
> + - XenValTestCase
> +
> +Assign DMA-capable platform device to domain (without IOMMU)
> +------------------------------------------------------------
> +
> +`XenSSR~assign_dma_platform_device_without_iommu~1`
> +
> +Description:
> +Xen shall be able to assign a specified DMA-capable platform device to a domain
> +during its creation using passthrough device tree. The physical device to be
> +assigned is not protected by the IOMMU.
> +Here and everywhere it applies, the DMA-capable device assignment which is not
> +behind an IOMMU is allowed for the direct mapped VMs only. The direct mapped VM
> +must be either safe or additional security mechanisms for protecting against
> +possible malicious or buggy DMA devices must be in place, e.g. Xilinx memory
> +protection unit (XMPU) and Xilinx peripheral protection unit (XPPU).
> +
> +Rationale:
> +
> + - The IOMMU is absent from the system or it is disabled (status = "disabled"
> +   in the host device tree)
> + - The passthrough device tree is specified using a device tree module node
> +   with compatible ("multiboot,device-tree") in the host device tree
> + - The passthrough device tree should entirely describe the platform device to
> +   be passed through for the domain to be able to discover and use this device
> + - The intention of the platform device usage for the passthrough is specified
> +   using device tree property ("xen,passthrough") in the device node described
> +   in the host device tree
> + - The memory region of the platform device and corresponding guest address for
> +   remapping are specified using device tree property ("xen,reg") in the device
> +   node described in the passthrough device tree
> + - The path of the platform device node in the host device tree is specified
> +   using device tree property ("xen,path") in the device node described
> +   in the passthrough device tree. Both interrupt mappings and IOMMU settings
> +   are based on it
> + - The allowance of the platform device assignment which is not behind an IOMMU
> +   (for both non-DMA-capable and DMA-capable devices) is specified using device
> +   tree property ("xen,force-assign-without-iommu") in the device node
> +   described in the passthrough device tree. The said property also allows
> +   the interrupt-less platform device assignment (a device that has only a MMIO
> +   region) without specifying the corresponding node in the host device via
> +   device tree property ("xen,path").
> +   For the DMA-capable devices this property is only allowed for the direct
> +   mapped VMs with special care to be taken
> +
> +Covers:
> + - `XenPRQ~device_passthrough~1`
> +
> +Needs:
> + - XenValTestCase
> +
> +Deassign DMA-capable platform device from domain (without IOMMU)
> +----------------------------------------------------------------
> +
> +`XenSSR~deassign_dma_platform_device_without_iommu~1`
> +
> +Description:
> +Xen shall be able to deassign a specified DMA-capable platform device from
> +a domain during its destruction. The physical device to be deassigned is not
> +protected by the IOMMU.
> +
> +Rationale:
> +The IOMMU is absent from the system or it is disabled (status = "disabled"
> +in the host device tree)
> +
> +Covers:
> + - `XenPRQ~device_passthrough~1`
> +
> +Needs:
> + - XenValTestCase
> +
> +Map platform device MMIO region identity
> +----------------------------------------
> +
> +`XenSSR~map_platform_device_mmio_region_ident~1`
> +
> +Description:
> +Xen shall be able to map platform device memory region identity
> +(guest address == physical address) when assigning a specified platform
> +device to a domain. The device can be either non-DMA-capable or DMA-capable.
> +
> +Rationale:
> +
> +Covers:
> + - `XenPRQ~device_passthrough~1`
> +
> +Needs:
> + - XenValTestCase
> +
> +Map platform device MMIO region non-identity
> +--------------------------------------------
> +
> +`XenSSR~map_platform_device_mmio_region_non_ident~1`
> +
> +Description:
> +Xen shall be able to map platform device memory region non-identity
> +(guest address != physical address) when assigning a specified platform
> +device to a domain. The device can be either non-DMA-capable or DMA-capable.
> +
> +Rationale:
> +
> +Covers:
> + - `XenPRQ~device_passthrough~1`
> +
> +Needs:
> + - XenValTestCase
> +
> +Assign PCI device to domain (without IOMMU)
> +-------------------------------------------
> +
> +`XenSSR~assign_pci_device_without_iommu~1`
> +
> +Description:
> +Xen shall be able to assign a specified PCI device to a domain during its
> +creation using passthrough device tree. The physical device to be assigned
> +is not protected by the IOMMU.

Nit: The same limitation as the platform device applies here too: it is
allowed for direct mapped VMs only. You do mention "... and everywhere
it applies ..." above, so I guess that covers it here as well.
Regardless, I think it would be clearer to mention it here too, so we
don't have to imply from the context of another requirement.

> +
> +Rationale:
> +
> + - The IOMMU is absent from the system or it is disabled (status = "disabled"
> +   in the host device tree)
> + - The passthrough device tree is specified using a device tree module node
> +   with compatible ("multiboot,device-tree") in the host device tree
> + - The PCI device to be passed through is specified using device tree property
> +   ("xen,pci-assigned") in the "passthrough" node described in the passthrough
> +   device tree
> +
> +Covers:
> + - `XenPRQ~device_passthrough~1`
> +
> +Needs:
> + - XenValTestCase
> +
> +Deassign PCI device from domain (without IOMMU)
> +-----------------------------------------------
> +
> +`XenSSR~deassign_pci_device_without_iommu~1`
> +
> +Description:
> +Xen shall be able to deassign a specified PCI device from a domain during its
> +destruction. The physical device to be deassigned is not protected
> +by the IOMMU.
> +
> +Rationale:
> +The IOMMU is absent from the system or it is disabled (status = "disabled"
> +in the host device tree)
> +
> +Covers:
> + - `XenPRQ~device_passthrough~1`
> +
> +Needs:
> + - XenValTestCase
> +
> +Forbid the same platform device assignment to multiple domains
> +--------------------------------------------------------------
> +
> +`XenSSR~forbid_same_platform_device_assignment~1`
> +
> +Description:
> +Xen should not assign the same platform device to multiple domains by failing
> +to create a new domain if the device to be passed through is already assigned
> +to the existing domain. Also, different platform devices which share any
> +resources (interrupts, IOMMU connections) can be assigned only to the same
> +domain.
> +
> +Rationale:
> +
> +Covers:
> + - `XenPRQ~device_passthrough~1`
> +
> +Needs:
> + - XenValTestCase
> +
> +Notes
> +=====
> +
> +The AMD64 PVH-specific requirements are written under the assumption that once
> +the hyperlaunch feature is completed, Xen shall be able to assign a PCI device
> +to started at boot time domains.

Nit: The grammar here looks odd. How about "... assign a PCI device to
boot time domains." ?

> This is not the case today, where the PCI
> +device can be passed through only to domains launched by a control (toolstack)
> +domain.
> +
> +The Arm64-specific requirements are written under the assumption that once
> +the dom0less PCI Passthrough feature is completed, Xen shall be able to assign
> +a PCI device to started at boot time domains.

Similarly here.

> This is not the case today,
> +where only the platform device Passthrough is supported.
> +
> +| [1] https://xenbits.xenproject.org/gitweb/?p=xen.git;a=blob;f=docs/misc/arm/passthrough.txt;hb=HEAD
> +| [2] https://xenbits.xenproject.org/gitweb/?p=xen.git;a=blob;f=docs/misc/arm/passthrough-noiommu.txt;hb=HEAD


