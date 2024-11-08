Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F06769C262F
	for <lists+xen-devel@lfdr.de>; Fri,  8 Nov 2024 21:06:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.832853.1248189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9VFi-0008Ja-KB; Fri, 08 Nov 2024 20:06:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 832853.1248189; Fri, 08 Nov 2024 20:06:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t9VFi-0008Hv-HN; Fri, 08 Nov 2024 20:06:42 +0000
Received: by outflank-mailman (input) for mailman id 832853;
 Fri, 08 Nov 2024 20:06:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hbhu=SD=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1t9V94-0008TY-Lk
 for xen-devel@lists.xenproject.org; Fri, 08 Nov 2024 19:59:50 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20625.outbound.protection.outlook.com
 [2a01:111:f403:2412::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fda93938-9e0b-11ef-99a3-01e77a169b0f;
 Fri, 08 Nov 2024 20:59:42 +0100 (CET)
Received: from BL1PR13CA0382.namprd13.prod.outlook.com (2603:10b6:208:2c0::27)
 by MW6PR12MB8958.namprd12.prod.outlook.com (2603:10b6:303:240::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Fri, 8 Nov
 2024 19:59:36 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:2c0:cafe::5e) by BL1PR13CA0382.outlook.office365.com
 (2603:10b6:208:2c0::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19 via Frontend
 Transport; Fri, 8 Nov 2024 19:59:36 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Fri, 8 Nov 2024 19:59:36 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 Nov
 2024 13:59:36 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Fri, 8 Nov 2024 13:59:34 -0600
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
X-Inumbo-ID: fda93938-9e0b-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxMjo6NjI1IiwiaGVsbyI6Ik5BTTEwLU1XMi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImZkYTkzOTM4LTllMGItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMDk1OTgyLjU1ODcyNiwic2VuZGVyIjoiYXlhbi5rdW1hci5oYWxkZXJAYW1kLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HHBdWtrHsQWOyACF6/v0JSMkQoLXpa0OD1w3qu5Y+a15e1nU4m3qywXu8HoWg/AHiI1anpFYvljh6vVBkWuRAHqPNTmAqRY74jtaHk8cfQr6i+NxLQ926WzjTrnDwCGOrCKHUryrlgv8/stdmF2t4PKFh2SbK4Dwc2wSQ2gY26WR89ds9GnUNFPCPY0iIA3HkRw1laUOePnfM4Bm48O59ut2hHs9WGal+6X6H6Se/Ic4iqoPyCRhg/0AMYqLznfUBTCGyYqVzorH8pmtOpqu+xKo376N7Ma81IQcnT2u4aTapopRmQtIlhkdbUrKxu6vo2dDhCPTrcbG0BUB8BrE+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EjVkE7Hn/7zDFOepCcGvGZ5CLYZ0+pgJCfhHdOJNTRQ=;
 b=lnaJcug/13EPYOupgeehr5Qob4tFpQY07Jh8VQfkFBLkmkjrh3J+8GqWmisAPU4aMnvOX0Xlh+/mTpM60nwlcOI7nLm37dk4rq4wwg7wzI650D5saGF7fX4BQ6YyH4mpJ/MSBzOWXJ94oWoal72TF4j08WWSWLax9ZwSwHJhRW9445xhE1MZFYqhPxzX7wFNwdTZ3ucIj0szsfJF96mjdSi+ZvhDVa/ZOxLVMs6WhFaxIJxHgD6ljL+WB8G3Ob4k/+E5oKs5B9wZo8NLznRSXLSl7Ffc6zjsLOeRv6to35rvtqmc0EFTTJLVIPrgI45MGHPUnIzZNz9rJNu9Oa6VfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EjVkE7Hn/7zDFOepCcGvGZ5CLYZ0+pgJCfhHdOJNTRQ=;
 b=1Oi1HF1raRH9lfmCQGY0gaiuoqFaZGJtwP+YvAomcEavufqqExuaeWUwn1QBsom25sFLyqThO5dciu6e9qrMtta7DTJxZLHQt3WmjZor1xfw46XYMdHQ5RGe8fV/Oi9GJtD4X0X9SRYQZjvjEAHobkVl14hOK0y7sFXECWI2D2g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Penny Zheng <Penny.Zheng@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Rahul Singh
	<rahul.singh@arm.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [PATCH v1 2/2] xen/mmu: enable SMMU subsystem only in MMU
Date: Fri, 8 Nov 2024 19:59:18 +0000
Message-ID: <20241108195918.856412-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|MW6PR12MB8958:EE_
X-MS-Office365-Filtering-Correlation-Id: 3be77637-9b36-4752-933a-08dd002fdf42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XTY6IMDccaXIfAS6ano/JEhhlmBBu5wE6RpZ+yXliUzCnYk2M+64nRFLLLAr?=
 =?us-ascii?Q?V3BQX/uqCOodemjOwjhfdOlJP64IaJXH9wrGJytyD7/XQtt6cDGSFVuIX+FR?=
 =?us-ascii?Q?djEXMYn8LXn5NYQkGXcrZflsvKYK11MWlojIZo3HlWMiZKTZgmr8UbQobXsN?=
 =?us-ascii?Q?F7JOkud8jzWcwEaPzUa49eeJ5yg59lSJtMvd+8gaPs/HccL9k4AIcATHyPLG?=
 =?us-ascii?Q?1Az1dLNfnIFGLqKl3chkqUtwyFbqrYlMWN48XFHA/TzKG5DBzy1JxXPQBrIQ?=
 =?us-ascii?Q?0s16eKnltrwGrejszmASRTEMsLPdaqHesxw+QLLZ6JwL4Cx4PXJgafKnqeqk?=
 =?us-ascii?Q?pZFX85nMUJC2H16jEldWK++Q58GrwVb+peJZ7aujgppAeseChwlM6BLGLevR?=
 =?us-ascii?Q?eGZiH6OMKo3wRfhTft9axXfdaazrcOqXYAh+/VuWoqgqQOohakKk6x64AKBR?=
 =?us-ascii?Q?eZFH7lhSHtqp/XACmgr1ScQysLXllEgj9OEfes8/jMmnBrPP0H9Gi8bskjlw?=
 =?us-ascii?Q?eTF20tuaXihb+e6X9o4gJoO+BX5Ykro9E0BBAyLDiLnaaXgKNY92SeLMZG1p?=
 =?us-ascii?Q?+UX74/m0yHxofmCSlMZumXXU8iEPj38t45QoV9ZJxWtHzL/i6F7OruvXdWPl?=
 =?us-ascii?Q?One2lmHjq0l8WrEYr+5IJMGArbfXFcqHBjOS6spymC0ly7uiz6fwo+gMMquF?=
 =?us-ascii?Q?gWMeft+tVO57G40HQJL+QIdOD0LaOM7MC+zot0y/XSBL4AHXgk+DCM240ToY?=
 =?us-ascii?Q?khtHpjJnJ2a9rYney+LO2AnsrIiaXTaIBxXYUeBpKTYVTlIjWObKEcCKVsGa?=
 =?us-ascii?Q?gT/n8/1KnSGM4PgZzt3QDassCOfxRGEUz3euEecFyXqTui3dXwihfXIqcWn9?=
 =?us-ascii?Q?LP33xn9QHYxhcZYQUPFIAUiA+O7Oc3UxndjLvby5vU+Mw6UrkE5gVEGa2NA/?=
 =?us-ascii?Q?xZLeybi3RAYFJGzpB/ZV1jh8/Zv0enbnK5deCM7f1a4OmMOvd1My2ShQX1Q2?=
 =?us-ascii?Q?9fCGVg8SpU5KKvrqQn7sugK5HrZfAQYOcbZ5LGfBbZ2PdEVaWRSEq1u/o2Fq?=
 =?us-ascii?Q?W+RQ3jRfc+EtKwnmlFChE8NThGE8g1Qyz2H1Lm/egrgM9mKFC95c1F3INJCS?=
 =?us-ascii?Q?BpY/6qcN4tjxoLrzylUMUI6q/enn5cyTopCMzNXtR35swdsCUFjf50Y8E4t3?=
 =?us-ascii?Q?Tm1Cvj9rw/m8XPgVJZe6ByQUM4ePuKt44oaYOlEXPbS3snhsPNhEqpHuMOhl?=
 =?us-ascii?Q?uGofjWd0VSY5QknfG5cct2JfgniDyiMCpZMZZ7hPNOL6JFYP27LjrszWUecP?=
 =?us-ascii?Q?q1d1PfR1AErCUotjbwSsxqsUHIdGSC4rh0V7/Jn0hffFS0HYEp1zln2lX/Eg?=
 =?us-ascii?Q?aDHiDkushV1doy+m8EQA6B/SxZO9Ed/H0VHlshToZ+5OvS4S8Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2024 19:59:36.5154
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3be77637-9b36-4752-933a-08dd002fdf42
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8958

From: Penny Zheng <Penny.Zheng@arm.com>

In Xen, SMMU subsystem is supported for MMU system only. The reason being SMMU
driver uses the same page tables as MMU.
Thus, we make it dependent on CONFIG_MMU.

Signed-off-by: Penny Zheng <Penny.Zheng@arm.com>
Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 xen/arch/arm/Kconfig            | 2 +-
 xen/drivers/passthrough/Kconfig | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 15b2e4a227..3699e148e9 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -16,7 +16,7 @@ config ARM
 	select HAS_DEVICE_TREE
 	select HAS_PASSTHROUGH
 	select HAS_UBSAN
-	select IOMMU_FORCE_PT_SHARE
+	select IOMMU_FORCE_PT_SHARE if MMU
 
 config ARCH_DEFCONFIG
 	string
diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
index 78edd80536..75ad403dd3 100644
--- a/xen/drivers/passthrough/Kconfig
+++ b/xen/drivers/passthrough/Kconfig
@@ -5,6 +5,7 @@ config HAS_PASSTHROUGH
 if ARM
 config ARM_SMMU
 	bool "ARM SMMUv1 and v2 driver"
+	depends on MMU
 	default y
 	help
 	  Support for implementations of the ARM System MMU architecture
@@ -15,7 +16,7 @@ config ARM_SMMU
 
 config ARM_SMMU_V3
 	bool "ARM Ltd. System MMU Version 3 (SMMUv3) Support" if EXPERT
-	depends on ARM_64 && (!ACPI || BROKEN)
+	depends on ARM_64 && (!ACPI || BROKEN) && MMU
 	help
 	 Support for implementations of the ARM System MMU architecture
 	 version 3. Driver is in experimental stage and should not be used in
-- 
2.25.1


