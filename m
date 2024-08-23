Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F87095D389
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 18:32:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782452.1191966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shXCh-0004Op-Ir; Fri, 23 Aug 2024 16:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782452.1191966; Fri, 23 Aug 2024 16:31:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shXCh-0004K3-Bm; Fri, 23 Aug 2024 16:31:59 +0000
Received: by outflank-mailman (input) for mailman id 782452;
 Fri, 23 Aug 2024 16:31:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4lC7=PW=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1shXCf-0003wy-Rl
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 16:31:57 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20615.outbound.protection.outlook.com
 [2a01:111:f403:2405::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3528e294-616d-11ef-8776-851b0ebba9a2;
 Fri, 23 Aug 2024 18:31:56 +0200 (CEST)
Received: from SJ0PR03CA0001.namprd03.prod.outlook.com (2603:10b6:a03:33a::6)
 by PH7PR12MB6812.namprd12.prod.outlook.com (2603:10b6:510:1b6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Fri, 23 Aug
 2024 16:31:49 +0000
Received: from SJ1PEPF000023CF.namprd02.prod.outlook.com
 (2603:10b6:a03:33a:cafe::7b) by SJ0PR03CA0001.outlook.office365.com
 (2603:10b6:a03:33a::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Fri, 23 Aug 2024 16:31:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023CF.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 16:31:47 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 Aug
 2024 11:31:46 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Fri, 23 Aug 2024 11:31:45 -0500
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
X-Inumbo-ID: 3528e294-616d-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YJSwoZ3cPZbUFIfJrMhDAY1/QmBfUBRHnoNeXNCtgXjdexP0SqcYudYe4f5GNwK3bYKsyOq1CgqJdJLIiHnan90h+MyRqiPJa1Yw/3JGyKZ02i/Bf+but8Bc4Jh98PYb3dgF6t785xDVmf0Rt2fAtxnqxXf4CIPuBIFw0s6c2KMUHPoapcJ8b6oOxyEHzmr6loc38pVwJgJkuj+UvzXZb+uSFrhIC0IMASHx+hgTKj0t8XR5G4MORe5TpTZ/u5KhBfC1CrpM3G2baS1lcUhMVCgFrV/y9xm8FCfNBI8PbHeFldHM4pV41QZXLUdA8IjzAECEcgbPrS8plkA0HS9F1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nr9rHx3YRb1ioBThg6/mHfFwNo227Uz+gT46derpfBU=;
 b=Tw6qrhOghLPL/11ZTNK3O3EZG8tXpLKpKz8d/DuSN0vTTsi7XqTbV32U3yRwfZtLsOh+gwcxgyLxExiB11YvyOP/fr458ZUtaa9leICX00E6QNoxx70h+FcpMm/EyE1qUEX6UB8GZoKd+CNxnc0QXqDK383XDuoXuax6EBeIgvqFSM7nyCGOblosOSVugMDw95ky/mgHmR/RXrnhle9kd7t1tfksaQ96gY4rXj7P/cU7UX2E5H2xJzoWif+7+tJg8Yr3wfnlxSw4M7XllwRCItWGKdyPhuuOxkSP4skmxfXHinTxU2Hv2ZQ7jxQ8Op0irHDh14A7UvtXHpW/8b7BPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nr9rHx3YRb1ioBThg6/mHfFwNo227Uz+gT46derpfBU=;
 b=UDW4zK9cjOI1y66eux3xmcnKQFFN4X8YpA44YDAzUw8v4/ZINiRj5r7TAB4eLhYD6SvOVLRMe4+rm+tIXiLwhoyLcVNpQZCXtJ0bVRp9G8mR+RLhp5Bq2iaCCSNeDEwsD449ZRMyKIe7rqzxLBckYQKI27XDBerE+2tr1r8q2ZQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, "Jiamei . Xie" <jiamei.xie@arm.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>
Subject: [PATCH v1 2/4] xen/arm: mpu: Define Xen start address for MPU systems
Date: Fri, 23 Aug 2024 17:31:25 +0100
Message-ID: <20240823163127.3443404-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240823163127.3443404-1-ayan.kumar.halder@amd.com>
References: <20240823163127.3443404-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CF:EE_|PH7PR12MB6812:EE_
X-MS-Office365-Filtering-Correlation-Id: a5601d19-ca2f-46f3-d9a5-08dcc3911580
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ARmCeBXfk6QRFpEG4jk0AIjOUPHmrXb0p+E30Mj7a1K2tFxRiJtMQ/3MD9dJ?=
 =?us-ascii?Q?fF8QDWR69s+cBuSpyloRiCAB8TMkcClsPpplcL7lykHYjRTFX9cwqP6FDuUr?=
 =?us-ascii?Q?F1w447t/1KUktXFjsNJkHXfY5Oattz9FsFLT0CgqrgTWaiT63bCscLG0VetV?=
 =?us-ascii?Q?33RFdNoJpIjM96gA188aKYpAYhWyQqx19ZdQ+U8BFc52QGsFyaUwuoCPADom?=
 =?us-ascii?Q?BN7Yg3qrqdgIXyjoHMojXXqrX7wShL9VuYCcWHPndfKajdGCKQpg4M9UItBA?=
 =?us-ascii?Q?Bhv+v7ISdodHSibwbXp9DT/LbxxMgzE0eGd+HpnE1d3/0bDa3IPNMvTOQ3DB?=
 =?us-ascii?Q?/xnO6j9/08jte0V3npyM18BvXYcLXRWTDBc2m9Z3fMYqfDjVBN6xVS536lkr?=
 =?us-ascii?Q?F2nNMJq0eVMv/sii9WqSadGLjqdmNkgnApwk5d72qPFrS5RqbLYPgRZ12+p/?=
 =?us-ascii?Q?GcVwmaGP/cfXR6bcUL2R9hG34Jn+hV7UANF/TJp6rMVqkREZDWZjRJX6Ju9b?=
 =?us-ascii?Q?ToD0sDNTZOKfeFea+sWVwNUQURQ4sM6Nc8zqX2QYiBvOu5j7MJfsc3RrFOxh?=
 =?us-ascii?Q?E0JShs4q/We6P3IZkuO9U/bG907qf7rSnt+ckgrsmQvTeqOgOlBd9YeKoD1y?=
 =?us-ascii?Q?KNbaZ4D/rdh45YGoEvf/PDKs3miH0iQiJBDBcQR7n2TO1WbkL+SfQEfE9lZY?=
 =?us-ascii?Q?TOGm7U/j2hIKYwA69SN89ceFL3lb3uWCb9nmBmfz+8sXDijI7DFGBJVZWF1d?=
 =?us-ascii?Q?HR0dk482vODG9XDBC/3zCNmiM3g7wzBLczajYaI7ewx/6JnyUwKrHv24MukK?=
 =?us-ascii?Q?5Ixm009qxXRurnOsvtAfUfGN37mtz9s4Ci9UMX44XLq1OMeVtQhGT/pyGnfA?=
 =?us-ascii?Q?lZYO121MnSGxjGp4E8+idzJ1C93UPfHGTm8yy/vq3KUv9WtHoZpUvSbEhsrG?=
 =?us-ascii?Q?UaS4ZCB8CNabMbwfmzTbp75YsEmkktuM82WRxwh1h80GHm8fsJHRSROTnoIE?=
 =?us-ascii?Q?t2j7hpE5N/CZFgWyHWLlMPV7u02uq1wEeTWK7yZvuz1IB31lwy2HdmVscwTW?=
 =?us-ascii?Q?UQDluyVPsMKVdMN82snWBW2qxLrtoAHaZChTBmqwzNf4PFcXcE9xJ5/xQ4+j?=
 =?us-ascii?Q?kQubf8a51oqmcCRTtf8h9hAl3A0HGSFM0/InrQax5qafTYO2eCu+9i7E/UQz?=
 =?us-ascii?Q?r3N5YYpbZve75gcbqwxj1hxTYHcwrox1HDPp9FF/15bCnDt/9gxEwENNc4Lr?=
 =?us-ascii?Q?/wmIq8x9VtVOwQ1tVOG5FXRvJXiPVvDmFWqiFOA3Vvkvb1YqfEEPLmQmJOdG?=
 =?us-ascii?Q?dAI4wYGd+dL7Np2EYnpChsVMHGeF3Kasm64Etyjp/1GisKCqnkgginyNJ+0N?=
 =?us-ascii?Q?uq24XozqtUoa2R+zmKWg+SUaMPzp9hbBSZPSDzhcglSwvfLiAI+amaz+cPnf?=
 =?us-ascii?Q?bdaYP/bB4nfESq29pQgP7FOZs57hLL1/?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 16:31:47.6645
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5601d19-ca2f-46f3-d9a5-08dcc3911580
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CF.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6812

From: Wei Chen <wei.chen@arm.com>

On Armv8-A, Xen has a fixed virtual start address (link address
too) for all Armv8-A platforms. In an MMU based system, Xen can
map its loaded address to this virtual start address. So, on
Armv8-A platforms, the Xen start address does not need to be
configurable. But on Armv8-R platforms, there is no MMU to map
loaded address to a fixed virtual address and different platforms
will have very different address space layout. So Xen cannot use
a fixed physical address on MPU based system and need to have it
configurable.

So in this patch, we reuse the existing arm/platforms to store
Armv8-R platforms' parameters. And `XEN_START_ADDRESS` is one
kind of MPU based platform's parameters. So we define default
`XEN_START_ADDRESS` in the MPU specific header file.

We also introduce one Kconfig option for users to override the
default Xen start address of selected platform, if they think
the default address doesn't suit their scenarios. For this
Kconfig option, we use an unaligned address "0xffffffff" as the
default value to indicate that users haven't used a customized
Xen start address.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Jiamei.Xie <jiamei.xie@arm.com>
Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 xen/arch/arm/Kconfig                  | 11 +++++++++++
 xen/arch/arm/include/asm/mpu/layout.h | 25 +++++++++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 xen/arch/arm/include/asm/mpu/layout.h

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 686948cefd..d722ca690c 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -23,6 +23,17 @@ config ARCH_DEFCONFIG
 	default "arch/arm/configs/arm32_defconfig" if ARM_32
 	default "arch/arm/configs/arm64_defconfig" if ARM_64
 
+config XEN_START_ADDRESS
+	hex "Xen start address: keep default to use platform defined address"
+	default 0xFFFFFFFF
+	depends on MPU
+	help
+	  This option is allowed to set customized address at which Xen will be
+	  linked on MPU systems. This address must be aligned to a page size.
+	  Use 0xFFFFFFFF as the default value to indicate that user hasn't
+	  customized this address, and Xen use use the default value that has
+	  been defined in platform files.
+
 menu "Architecture Features"
 
 choice
diff --git a/xen/arch/arm/include/asm/mpu/layout.h b/xen/arch/arm/include/asm/mpu/layout.h
new file mode 100644
index 0000000000..82a74b8b5b
--- /dev/null
+++ b/xen/arch/arm/include/asm/mpu/layout.h
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * config_mpu.h: A Linux-style configuration list for Arm MPU systems,
+ *               only can be included by config.h
+ */
+
+#ifndef __ARM_CONFIG_MPU_H__
+#define __ARM_CONFIG_MPU_H__
+
+
+#define XEN_START_ADDRESS CONFIG_XEN_START_ADDRESS
+
+/*
+ * All MPU platforms need to provide a XEN_START_ADDRESS for linker. This
+ * address indicates where Xen image will be loaded and run from. This
+ * address must be aligned to a PAGE_SIZE.
+ */
+#if (XEN_START_ADDRESS % PAGE_SIZE) != 0
+#error "XEN_START_ADDRESS must be aligned to PAGE_SIZE"
+#endif
+
+#define XEN_VIRT_START         _AT(paddr_t, XEN_START_ADDRESS)
+
+#endif /* __ARM_CONFIG_MPU_H__ */
+
-- 
2.25.1


