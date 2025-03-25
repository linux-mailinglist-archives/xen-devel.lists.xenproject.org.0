Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AAADA70834
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 18:28:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926785.1329620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx83y-0005AE-St; Tue, 25 Mar 2025 17:27:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926785.1329620; Tue, 25 Mar 2025 17:27:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx83y-00057E-P8; Tue, 25 Mar 2025 17:27:42 +0000
Received: by outflank-mailman (input) for mailman id 926785;
 Tue, 25 Mar 2025 17:27:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xav3=WM=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1tx83x-000578-Jx
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 17:27:41 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20603.outbound.protection.outlook.com
 [2a01:111:f403:2412::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71f74afd-099e-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 18:27:39 +0100 (CET)
Received: from BN9PR03CA0345.namprd03.prod.outlook.com (2603:10b6:408:f6::20)
 by SA1PR12MB7410.namprd12.prod.outlook.com (2603:10b6:806:2b4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 17:27:32 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:408:f6:cafe::95) by BN9PR03CA0345.outlook.office365.com
 (2603:10b6:408:f6::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.36 via Frontend Transport; Tue,
 25 Mar 2025 17:27:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Tue, 25 Mar 2025 17:27:32 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Mar
 2025 12:27:30 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Mar
 2025 12:27:30 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 25 Mar 2025 12:27:28 -0500
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
X-Inumbo-ID: 71f74afd-099e-11f0-9ea3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GSg0anlI2M6MpQ/+bt90C8JoyKOPnIP8a/rUVls1pbDV6KFuXlH+8ERAtxYGohfQeORusAbu+Nue7yZZKaNvz/JOVOwvx69GiJtSV5lldDa+alIB0IzB/98D6s9Ad8zPdG6hkku1hp0mWA8gzdghzGylkx5ah9GFf/M/XIlDKLNzL66BIJg+sZN7NbRnJe/Azc8/CITtOO1yCkbD9Jzy1jgVH8gRTAa1T1EryxfTls6TpnhvmmSjH5iSHIZkEj4O4s3sBWLU73ID9eZdJXgvIC2HO7Un0WgGmwPwRCKVs/Yk5Z1uMM+tPIJkgnffQQdWmkz+bUJ+NNkGhaanotgw/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0RWTOnmH6tz6U6U1DeErdYi6QrRu1YE9l9Bn84wJP0Q=;
 b=UyFT6P+dONq+oqfmfd3McRQuF2JQ91qGAccB0dJcRbMvRztHDYEDOY8w1ezYlyOlj3hZlLIVgcVAZiFr413EwUl3Fe6ag82dTzVboJOuQY3uOz44wqF3C/4yvbpxVpdjHwV2/LpWfq86PyZnoubcUNWBubOUFHyLF7dGZLoDJUwIbAz+OYrbxl3JqnUPKZ/4Rh7raX9YfG/H7FnLF1zc5qrQTK2U099h+9AprH2R1LOFeFHd2ztQkfG8Qm5cFalzvejLqiUQS3g4KsLsRaNbB1tWO5CtznONzfYGAsuoA1mLlSLb7zl6kBVgsOCOMhArMIdC2O+SCMDGdsblRq9Lpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0RWTOnmH6tz6U6U1DeErdYi6QrRu1YE9l9Bn84wJP0Q=;
 b=M5Jn+biJnUQExSV5ur7ngwlmjJy6xE9QPA+KrqXeS8NJM3pS3qIDmYogsErQfZ/4tYzoJlVTinzxgeJWO59puiJlSMrlkbKjvudV6b97BM9rLdQptIlZiLd1O0uEu48hZ8Zu6K9nWIiRUtPHqQTNumOZ7PAzog6VBWlSx6lrVKg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Jiqian Chen <Jiqian.Chen@amd.com>, "Mykyta
 Poturai" <Mykyta_Poturai@epam.com>
Subject: [PATCH v18 0/2] PCI devices passthrough on Arm, part 3
Date: Tue, 25 Mar 2025 13:27:24 -0400
Message-ID: <20250325172727.600716-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|SA1PR12MB7410:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ba8e1ee-4309-4806-ef5c-08dd6bc25362
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Tm0xY1lQTkFDNW5Ld2x3OGFEVTVJMGNxWEI1THM2NlZIbnN3L2JObmExZGFz?=
 =?utf-8?B?M0pvYk00WG50aHp0SWJrVU05SENadGwrUG9FZTljak5SZnNDZ3h0Q2d0Y0VK?=
 =?utf-8?B?a3RpZXZuckUwMDVnUFFmR3dUTDhWb292RTk4OTJYc1g0OFhyZHJEK2RBNEph?=
 =?utf-8?B?SWNWc0VYcUNJcm9GV0U5dklOaEVCU1F5TlhlN1NRVG9wOTFNUGhpemJ2TTAr?=
 =?utf-8?B?ZHFsdE5QV05OS0gzaVdPVGw2dU96NVFMcFp6dlY1b1NjbnVKcmxvZEU4d2Mz?=
 =?utf-8?B?MXhvNWdFeXN2U01SQzFEb1UxRk1vOTRUZ1kwQWZIOW1yc2RLT3Y4VlQ5cG8w?=
 =?utf-8?B?ZHkvV0hGdDZLMlFMWUd1MERuUkpKKzFxbzF1NTdBNCsrTzgzek9nRUJzam51?=
 =?utf-8?B?a0RhKzVlWmQrOUlNUlVWd2hjejdkQWNQSXFlYVZUMFhzZjR2Wnp1Uk9LUjVm?=
 =?utf-8?B?dnVjMjd3ZkRCVWxnbmVpTUFGTlZrYVdtUjdRemhiZHg5S28vdC9WTVJaZGdE?=
 =?utf-8?B?MnByTmhkL1AvZGZacmVNZTlSYXZJQzVjcStiVmxqcTZPa1JYVW1oNjVQMEd0?=
 =?utf-8?B?SnZReVVmNXFjaHNvTG4zTlpienc5QmFuNEw5c2srTzFSbkFlSXBuWDljT1F5?=
 =?utf-8?B?eVdKa0hEWWlyVCtHZUtYWmdXU1NsRGM0Uzg0OVZqT0hZSFl4djRKZ3lwbVRj?=
 =?utf-8?B?SXFHZUl4VjRscVJTRHVHUmR3b3pnSkxvNVBjM3UwWjRHUDJSV1d4NnFsZFYx?=
 =?utf-8?B?NmJDYmFVdm5rRDdYS1NPV0IvU1pyRkZlT0xSMlZFOE9CMlJYeDhIeXkwSGtE?=
 =?utf-8?B?OGpBTDVXaTdoWEQyVERjY2tQRU5UNUJ6T2JIck1hTFFpU3NkMGY1eXpHNGF0?=
 =?utf-8?B?K25pdzBnQythWmcxWVUvcDQvVkJ4Y1FkZGJZUitVQkJCWTZWYksxMmpjUEcy?=
 =?utf-8?B?WGlKNWJUVXV1VndzMXlsU0M3dTFpQ1MzclNobkVnK3QxR3VRWjVNUy9pRHpH?=
 =?utf-8?B?cW1FWnJFekh0SFVSaEM1Z0gzM3NPVjlSY1dkNmJpTWZQRGVpOU5lREZ4aEhr?=
 =?utf-8?B?dm15RGZxckJieXRaNEJEcDRRLzZsTGovN3Z2UlRwMXc3SWR5dGYyVHV5NEhw?=
 =?utf-8?B?bVcwd3hQNzdJZDQ0Z3lqeVZGem00dUhLUGNnSXN3MWpxRnBwVGRGUkJoZ1lu?=
 =?utf-8?B?QmNIZ3pMTXMxZmw1cDNZN2gwYVo5dTFhWnJwUk1zVkNaRjZJN081UEZGc1pV?=
 =?utf-8?B?SldybkFxZXg4MDlxZHBTMzJab0VkSE4yTWhEZEhuQlIwZWRuNlFlRnI3WEdI?=
 =?utf-8?B?KzE0bk9xOXpTSDBnRTNRZGU0UmFoNGdPeVpQakF1K0ZlTHl2Z21FcTVaSFYx?=
 =?utf-8?B?SmpvV3cxVzAwNEE2S2JLQVVYNHZBUG5TYUN4TGU3VEx0TWNhckprMlRSdzQw?=
 =?utf-8?B?YXliMko0K2Y3UmdWcGtERnBReW8zVW40ODFzRi9kWUpaL1N5YUQ2OXA4ajZk?=
 =?utf-8?B?aC9pcWpzTEh2ZDFueHpHcVZjbkFiTitabmZFNEoyenRZVG5XeWc3d2tPTG5Q?=
 =?utf-8?B?NWdrS0E4YWRrR0dpK3V3MEpHSGJHSmJHNzhCVk1CeVhxc0krUGQrOU9GYWJH?=
 =?utf-8?B?ZThOaTFuaExtQ2hESW92ZlQ0UzUwckN2dFRNd1krRzVTRHl1WTNGUGR1bDJH?=
 =?utf-8?B?MC83ZDNPTm4xT0sxUlByMkxkcVRUaGhEckZKVnYySFNlVjg4UTZDazJXenU1?=
 =?utf-8?B?ek02VGdqL2UrR0t4dzI3VWtBeTU4UkdYNTh1OFpWSERMQ1VOZkpBZktKeGpw?=
 =?utf-8?B?SzNDbHJ4elVPcUsvTTkyZ3ZONVMvZE9LNU5xa2h5ZGs3bUgzNzdIM1I1ZCtz?=
 =?utf-8?B?VWdYQ08xUDRodUM2S3Jld2J4dWhUa1JLTjZPaWdndFVlU1VpYThqRFBBZnZz?=
 =?utf-8?B?TDROV1pxSkYwdklTeFFIZWRhOStvRzJwbTcrWk8vWEZJaUJnazdNQ2xWUncy?=
 =?utf-8?Q?0XTRyzFE9HduOXL3ByRl1dyrL9mrCw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 17:27:32.2829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ba8e1ee-4309-4806-ef5c-08dd6bc25362
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7410

This is next version of vPCI rework. Aim of this series is to prepare
ground for introducing PCI support on ARM platform.

in v18:
 - address warning in vpci test suite

in v17:
 - add ("xen/arm: check read handler behavior")
 - drop ("xen/arm: account IO handlers for emulated PCI MSI-X") as it
   should wait for future work
 - drop committed patches

in v16:
 - minor updates - see individual patches

in v15:
 - reorder so ("arm/vpci: honor access size when returning an error")
   comes first

in v14:
 - drop first 9 patches as they were committed
 - updated ("vpci/header: emulate PCI_COMMAND register for guests")

in v13:
 - drop ("xen/arm: vpci: permit access to guest vpci space") as it was
   unnecessary

in v12:
 - I (Stewart) coordinated with Volodomyr to send this whole series. So,
   add my (Stewart) Signed-off-by to all patches.
 - The biggest change is to re-work the PCI_COMMAND register patch.
   Additional feedback has also been addressed - see individual patches.
 - Drop ("pci: msi: pass pdev to pci_enable_msi() function") and
   ("pci: introduce per-domain PCI rwlock") as they were committed
 - Rename ("rangeset: add rangeset_empty() function")
       to ("rangeset: add rangeset_purge() function")
 - Rename ("vpci/header: rework exit path in init_bars")
       to ("vpci/header: rework exit path in init_header()")

in v11:
 - Added my (Volodymyr) Signed-off-by tag to all patches
 - Patch "vpci/header: emulate PCI_COMMAND register for guests" is in
   intermediate state, because it was agreed to rework it once Stewart's
   series on register handling are in.
 - Addressed comments, please see patch descriptions for details.

in v10:

 - Removed patch ("xen/arm: vpci: check guest range"), proper fix
   for the issue is part of ("vpci/header: emulate PCI_COMMAND
   register for guests")
 - Removed patch ("pci/header: reset the command register when adding
   devices")
 - Added patch ("rangeset: add rangeset_empty() function") because
   this function is needed in ("vpci/header: handle p2m range sets
   per BAR")
 - Added ("vpci/header: handle p2m range sets per BAR") which addressed
   an issue discovered by Andrii Chepurnyi during virtio integration
 - Added ("pci: msi: pass pdev to pci_enable_msi() function"), which is
   prereq for ("pci: introduce per-domain PCI rwlock")
 - Fixed "Since v9/v8/... " comments in changelogs to reduce confusion.
   I left "Since" entries for older versions, because they were added
   by original author of the patches.

in v9:

v9 includes addressed commentes from a previous one. Also it
introduces a couple patches from Stewart. This patches are related to
vPCI use on ARM. Patch "vpci/header: rework exit path in init_bars"
was factored-out from "vpci/header: handle p2m range sets per BAR".

in v8:

The biggest change from previous, mistakenly named, v7 series is how
locking is implemented. Instead of d->vpci_rwlock we introduce
d->pci_lock which has broader scope, as it protects not only domain's
vpci state, but domain's list of PCI devices as well.

As we discussed in IRC with Roger, it is not feasible to rework all
the existing code to use the new lock right away. It was agreed that
any write access to d->pdev_list will be protected by **both**
d->pci_lock in write mode and pcidevs_lock(). Read access on other
hand should be protected by either d->pci_lock in read mode or
pcidevs_lock(). It is expected that existing code will use
pcidevs_lock() and new users will use new rw lock. Of course, this
does not mean that new users shall not use pcidevs_lock() when it is
appropriate.

Changes from previous versions are described in each separate patch.

Oleksandr Andrushchenko (1):
  xen/arm: translate virtual PCI bus topology for guests

Stewart Hildebrand (1):
  xen/arm: check read handler behavior

 tools/tests/vpci/emul.h |  7 ++++---
 xen/arch/arm/io.c       |  2 ++
 xen/arch/arm/vpci.c     | 43 +++++++++++++++++++++++++++++++----------
 xen/drivers/vpci/vpci.c | 26 +++++++++++++++++++++++++
 xen/include/xen/vpci.h  | 12 ++++++++++++
 5 files changed, 77 insertions(+), 13 deletions(-)


base-commit: 28fa31d6bb7835be530c2855dd6cf4e77438ae12
-- 
2.49.0


