Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6982CB1107B
	for <lists+xen-devel@lfdr.de>; Thu, 24 Jul 2025 19:44:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056437.1424648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uezzF-00071S-RW; Thu, 24 Jul 2025 17:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056437.1424648; Thu, 24 Jul 2025 17:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uezzF-000701-OF; Thu, 24 Jul 2025 17:44:09 +0000
Received: by outflank-mailman (input) for mailman id 1056437;
 Thu, 24 Jul 2025 17:44:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Qx4=2F=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uezzE-0006zv-G3
 for xen-devel@lists.xenproject.org; Thu, 24 Jul 2025 17:44:08 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2060c.outbound.protection.outlook.com
 [2a01:111:f403:240a::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cabd5329-68b5-11f0-b895-0df219b8e170;
 Thu, 24 Jul 2025 19:44:05 +0200 (CEST)
Received: from BLAP220CA0029.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::34)
 by DM6PR12MB4265.namprd12.prod.outlook.com (2603:10b6:5:211::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.29; Thu, 24 Jul
 2025 17:43:59 +0000
Received: from BN1PEPF0000468C.namprd05.prod.outlook.com
 (2603:10b6:208:32c:cafe::a3) by BLAP220CA0029.outlook.office365.com
 (2603:10b6:208:32c::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Thu,
 24 Jul 2025 17:43:59 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN1PEPF0000468C.mail.protection.outlook.com (10.167.243.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Thu, 24 Jul 2025 17:43:59 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 12:43:58 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 12:43:58 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 24 Jul 2025 12:43:57 -0500
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
X-Inumbo-ID: cabd5329-68b5-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ccbFacQf2GjI7WbFhWt51HXWX74BCtvC1qgEVg44Nwe3k5vuY6rlpgdkMjvOWv14CFfeFCHD34eRtq3jxt10ucUWfRIdwD5shf8iep54EodURIJwdRcuUrddgN7nSaVjWPfHzwgJEasw+WRuUn8b+uNWC3wN6C0dZoRMBy9m2KDMJZ4z3poNIwVN+gccy9YnQBr2sFl6vm/pmMz3aPZ2N/od8uoi5fCZ8H98uSnGI0Bx6pRtoWAI8KqKMp/3FUp7slCnX2lu/YB2YtYfIiN7eah1e4dxOyTh987ExrrRXPCh9dJ75eJITZHeSv0h+uFAYMqGWdgdZFvDpvtb0DqHPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KAoSgw8SWCzjD25FtVeuCnLVIg8fFEHgFLOsGXqcpf8=;
 b=Nrb1FbXwTE2W7q+3DSFecRd/ScufpB0Opelb1aM66IiQQ0jEQuFsSt7Y1HOhuKL1KdQQG9vFVhy7TrbV9KubQ9xfmSSPwGPEh/T1iCAWTWW3Wl3WcWuxEjQkTXRhiJQujrHgsDMXn82LDbuZzsQByWGGwBJ3PjpZohLiMRK6H34G+waEYtWvaloGqHzRtkJv/FT7tLeyB2kWifyE71CnnjJVc3/lcnpTNg8wYAwkSLNKkT7z+y0ID9rIWfyLJVR4o3fWlp7DaHByuBuXXYTZHn7uvxM6if2Q5UwGBmUUgpap+D2/VkE9gr65KgEEj5T7wAQdDCjUWdBLcvqKiH1LyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KAoSgw8SWCzjD25FtVeuCnLVIg8fFEHgFLOsGXqcpf8=;
 b=Q8k6G5inDJ26JJLrMdu0UK253OLv7hepDhkWMVDWLsgAHGF+lzj4xjGh8GHzqsanrJbOW8rHUgf7PuvRJEBe1NYb3DCFN+2q0IeRdeSBiLpjIxs2MPbm2S+koI65AZiPYhFW1WAU7Wae6Zmo4mqEnY00Uyuzq6EZGHK8SSq5RJs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH] iommu: restrict scratch page quarantining to x86
Date: Thu, 24 Jul 2025 13:43:48 -0400
Message-ID: <20250724174351.3969-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468C:EE_|DM6PR12MB4265:EE_
X-MS-Office365-Filtering-Correlation-Id: 637b9ab5-e544-4a6a-a71e-08ddcad9ab85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?W0GwJgMMuXZwoEm3h66UR+PZnptl29v6jsVSjLAFrQ+02PAD/NDNjDMd64Ml?=
 =?us-ascii?Q?bZB9ZihiJe/l5Bx5vGn01gQYLTkGmEhi0jn8U/DIOwfbphRbP0tehfXBJmYj?=
 =?us-ascii?Q?u7EAWsKOG8McfZ6tgcxxMRpUQ7BmPLdgC23lFevNpzb21PqWsrZO8bohF2dW?=
 =?us-ascii?Q?FuW0B5lhBW4k8xSloKcWpH8K3nuYllosRJiIzqLCQv/f72ecQoFtRHBEF9Je?=
 =?us-ascii?Q?6iVmXns3OOicHrUanRch4rfLgOtrDVk6qcWbEHwhEoJ5z0s+r9uxeG8aDTvC?=
 =?us-ascii?Q?m/HefwJ1FW94NCt6P8VO8y2huyLcKpV53D/hHYEOKWsAVnSjrhIpe7vVyt/q?=
 =?us-ascii?Q?x/UCW/ESpzDylF7GNOcLCcLv9o8eiTDfLM4Rbnt4wKT6OP5wXriOmwseZIjg?=
 =?us-ascii?Q?r2ooA2nWdcCcLxdCnv3/alG/O/QEU29BrSdWU/+V11wi0Bla4Yac8eXEo2o9?=
 =?us-ascii?Q?CKouBrI3rBV98w9YLY4+YIQjk9qyW+fhtkaLfqWgz0T8AmNn05WzDg9hkos/?=
 =?us-ascii?Q?FRjsumGTS8n/ZYCRamGlJxDT/NdoU1xX+UG8p7Jo/QcU1nqpO61e2N8tew6k?=
 =?us-ascii?Q?njk6riNCpFVw8jJzP9foJxn+flBfXoL+qF5So2/9FX/Eapqo84wxE2DnN1VI?=
 =?us-ascii?Q?0D7T1kXuBSJJwXO9N+hzyfInul7bVGGvvqE87LIAeCAPeLfdJqbHJSFV2YAY?=
 =?us-ascii?Q?9KSha8HhdwE+tlRj7k9jGlQnW5+Prq2IGWGJriJHZ8YYMjnH4+IiOhm2gOi6?=
 =?us-ascii?Q?VSEe6MDgG9G30aFlBVwrPvxfaLa3s0l01HjAsDvKkll7QKw4OLpQhYAxB3ID?=
 =?us-ascii?Q?aBdvVqfIYfhLOswK/3NfCy8JCG2A5sL1asKDiN/WER5lddnK4efk6+cHMXQC?=
 =?us-ascii?Q?HqoCOPf5th+/Tudf+0/2ttC/LnO9N6s5WVBA2lSjn+v0XTGgtvJ/8MOV2Nio?=
 =?us-ascii?Q?X78aKBtnV0ZH9gXZC8Ypv4b3fU+ipx/qOy48C6S3I0WQw/KViOnunswjCHd5?=
 =?us-ascii?Q?CThLUzblwdQ+yVY0Zy6KyzyLvOiuQQDlNOTFyKj4Alu0I2mrWYPU2gYgIgF+?=
 =?us-ascii?Q?ah9KkjHjeX0qZ7H40/F5/zgNsfs2rFaVM9Y5lPdVV3WGHvcW8EZrcshbb+wj?=
 =?us-ascii?Q?cpSeje50zOPD73Pj+RgeHjeGW1wSzgjry4kML6FusSW4xq7pqchCEveSZvrO?=
 =?us-ascii?Q?qonIo6adR801QjvqSSr62gxz/5xnMzY1RABDR8lppt0hpBF3RUlFJ3hk1LFx?=
 =?us-ascii?Q?oWJZRAMu1gs9vdSYnABRf2lXYm5kAan7skoVjJUqcOla80++diU9WslU3w6g?=
 =?us-ascii?Q?cu/HHC4RPpQXmPXDgNqFuE58TU/4eUyHcp4dR3y33un6THNCoiPkaU2p59Yp?=
 =?us-ascii?Q?TFUAhDAoJINXkAPfadO6/vyWDUqT3brNRw5eP0gHl7K7GSpyemb/F2lbCroh?=
 =?us-ascii?Q?/PeNc9I85RjI4eowwvP3j9JxgZhXg7BSnG4mEhClHK4jLpsnx2koJk8VZWG1?=
 =?us-ascii?Q?vmKYVm2fL8k6sc/WWewx9N3frfJEqY7djpKg?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2025 17:43:59.0425
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 637b9ab5-e544-4a6a-a71e-08ddcad9ab85
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4265

All IOMMU_QUARANTINE_* options are exposed on Arm since 163c6b589879
("xen/arm: pci: introduce PCI_PASSTHROUGH Kconfig option"). However,
only NONE and BASIC are implemented in any Arm iommu driver since
63919fc4d1ca ("xen/arm: smmuv3: Add PCI devices support for SMMUv3") and
ca8f6ffeb6e3 ("xen/arm: smmuv2: Add PCI devices support for SMMUv2").
SCRATCH_PAGE is not yet implemented in any Arm iommu driver. Restrict
scratch page quarantining to x86 for now.

Reported-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
Cc'ing Arm maintainers to request an Arm ack.
---
 xen/drivers/passthrough/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
index 78edd805365e..11aece5f7bda 100644
--- a/xen/drivers/passthrough/Kconfig
+++ b/xen/drivers/passthrough/Kconfig
@@ -90,4 +90,5 @@ choice
 		bool "basic"
 	config IOMMU_QUARANTINE_SCRATCH_PAGE
 		bool "scratch page"
+		depends on X86
 endchoice

base-commit: 150b773a484c911e2926f65adb576e1cdf9de7cf
-- 
2.50.1


