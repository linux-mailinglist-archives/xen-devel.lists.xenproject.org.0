Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A98499E4153
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2024 18:23:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848686.1263535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIt5f-0005qV-IH; Wed, 04 Dec 2024 17:23:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848686.1263535; Wed, 04 Dec 2024 17:23:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIt5f-0005nW-EJ; Wed, 04 Dec 2024 17:23:07 +0000
Received: by outflank-mailman (input) for mailman id 848686;
 Wed, 04 Dec 2024 17:23:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Nih=S5=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tIt5d-0005EK-Ux
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2024 17:23:05 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2409::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c04c62d-b264-11ef-a0d4-8be0dac302b0;
 Wed, 04 Dec 2024 18:23:05 +0100 (CET)
Received: from BN8PR15CA0051.namprd15.prod.outlook.com (2603:10b6:408:80::28)
 by BY5PR12MB4260.namprd12.prod.outlook.com (2603:10b6:a03:206::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.11; Wed, 4 Dec
 2024 17:23:00 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:408:80:cafe::60) by BN8PR15CA0051.outlook.office365.com
 (2603:10b6:408:80::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.19 via Frontend Transport; Wed,
 4 Dec 2024 17:22:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Wed, 4 Dec 2024 17:22:57 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Dec
 2024 11:22:57 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Dec
 2024 11:22:57 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 4 Dec 2024 11:22:56 -0600
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
X-Inumbo-ID: 6c04c62d-b264-11ef-a0d4-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sAtKyBlUbfpqp9Mrx0EGP/XAT+ol6bw9Se4GsXT3jNIei1psgO87gNk2KnjiZoiTR9U4EmlJUXMTRxgiR9Hn0B9UjHLzmVNtKBpoV1F5CmDWQzYk8zGwFj8FIMyKDawDJI5gHjJRqzApjFpUX80cmYWpxLZXowp6cpL80o6URUZti3ugRuHVb7iOgof/6FX+jMzoLkYBbC5Lg351+TVYj7majS8k6Y4RfD1V/EPSBvB16sdjST9WOYxIqRfq9C1cKUcpueOf+nSpOKYcdUlDOIewoLmbZY4EqbKrg9/9RAazDGtOsSdXekksblLq7rONzQuVXVdPo3Qmf+6zP1/bHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zkeSlG1x1nQlbLTNFU3f2etPFvJ/ZKq7O/4HU9Y+JXk=;
 b=eZJro7FIbQ9REmIYxPUmr1u3qaavdsCSDhiSub4g5GZ9NV1FW4sQH6w3+fbdAtnVQBckF/QRklhyqtGIJkMJAfIVy8zulLe7U7uQtRJE9MViNaN45wBITa/zimZ2VnATk3TvTHNRznBze6+AWkmVzi82LLuGoN6thJfnsxMpy+nHA/m8KhL/LjxaxA3GK+eCodg3kCx8ItkdixGROYSyTFSVyhM8vdBsCBu0wyEY7JaEbrTQlq4SsGWrs/Bnch7j8tkl5NVrAyb4ToSODmTDSQYUjxnDYP18wnSFftJshDHC32BbuGAvTSMAbIwLf3R0sjYpoMn/5GnXfN6ZpiwmEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=amd.com; dmarc=temperror action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zkeSlG1x1nQlbLTNFU3f2etPFvJ/ZKq7O/4HU9Y+JXk=;
 b=Iq2I1CGUupXI+TMpCEsKM/hAtEmKMC6nISyrs34TMjfmNWvCKQ0qfBeDJS33+1GuDijJdI8Ib0p8M2c7Afu9UWjAhavCjHmeIDiJB2XBI6G604Gm35hpZajb8RGboxIJMawu2/L6FWh6d6vo8H0FJ8zpYY34/gjFINNwltaiwfo=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Penny Zheng <Penny.Zheng@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v3 2/2] xen/mmu: enable SMMU subsystem only in MMU
Date: Wed, 4 Dec 2024 17:22:43 +0000
Message-ID: <20241204172243.1229942-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241204172243.1229942-1-ayan.kumar.halder@amd.com>
References: <20241204172243.1229942-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|BY5PR12MB4260:EE_
X-MS-Office365-Filtering-Correlation-Id: 6327af57-a15a-46f0-afc3-08dd14884c0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wD9lowN9JR0R6D8GyMObCId7u4OTtpQGoXwZ2kcTjpJPLl2hDQqQ+BP7DoA2?=
 =?us-ascii?Q?fdbKiDmZzwBguXZk4PRnvqWZJ4JMa3gagiRUHE+JgNpfinewkC8+yBr66uXU?=
 =?us-ascii?Q?7XaCwpWD/KbYeCNYqIu9NPKb3ELXO3ZAqyON+J9WqevII9F8E7Tk/MkxcP+y?=
 =?us-ascii?Q?mYB6FfMHIvkZ4eAE/TBvm+c8OyIsjOpA5L5TgKj9DCABIrFCoGyZIgb2A46p?=
 =?us-ascii?Q?LRjkgPnLxc8nt6Xq9FKU0mfCqz9XDQJcXakXr62ZWQ4JGEiBndMOxouyKWSC?=
 =?us-ascii?Q?Vt+w43Rt6oHM8UNVs5Lg08YDVmwuo8qhnsw52ho5MvJPME+njKgXn6Bv6vFi?=
 =?us-ascii?Q?TNHFpTgErLoKTmJpwiQjbYv7dXl64NH8fPeDOGnWJksOTs0nYbSXmjOJTzVP?=
 =?us-ascii?Q?aNbsNsB6EiJHc1yTWXxYK9LY2z1fuC6Wqidn3wJMTf/NjwbGfd4FJoWBzlKP?=
 =?us-ascii?Q?qnqbx5NbKWub9IblTUwY8+qvWGX/q3WzwsJI7UZ2EhW1TjkEicCcYA6Fu5tV?=
 =?us-ascii?Q?EIdkZkUJg+PVub9KSXwkcJGy7tBFGDZOpi7ObRD5jqLaIKwGcD4QusuUndfu?=
 =?us-ascii?Q?yJRcV6h+e7nkppQbIiri/rNU3jcAiU/dJUoX/FwAEtWZjHrTKhd+VoJ9qlTb?=
 =?us-ascii?Q?Srt+8nodz1Eq7vyM6jcXKQrIBLt1rb/8z5at2nwdGtwZPJd8Mi637jgM5wzN?=
 =?us-ascii?Q?xOJBcC7IpyfwimZ9ZvhV4XiVHOwcublA90+sCgL8KX0wJ4KZ3VCLMBmg6Uft?=
 =?us-ascii?Q?kxQNPxnsoDt54XhYTV1pl0Eh9eH/ePS11kZCYKt/KRmRyyS+zb9qqmugCVVv?=
 =?us-ascii?Q?03b7WGKtWtA1pI9v/nBAlywhOiNZSrOsT0YK6gvU6gCvtnetqyykTuz+b45U?=
 =?us-ascii?Q?ZKOu+fZdj79tyYKgseLxM0ETV5Ab3tdlky53jFXXSlcovBDt9cqBOGfDCF2J?=
 =?us-ascii?Q?hpqQNJ/mVMSV9zqL37aB3+8sRHC6I7SzfavrTX0C1a37DA9eYFx7Cedmsg2A?=
 =?us-ascii?Q?0itdm6jWnsnEgmwpYVfZWQMJSRhDmQwRRE34v0J7AW9E+j/UlgaQ5wGInpEQ?=
 =?us-ascii?Q?99gJMAwa7Nxdvwj32gsE+U+ZfpxP2sRWII6eTTrUhSpQCiloh/cgJBGN2nrW?=
 =?us-ascii?Q?R5NKcybG8rKuQgngaqZPWgn1VzXy/ZPzKkqys4z+RLRomCT6h+s6DrAefB89?=
 =?us-ascii?Q?YqMu7OcTg14vYUxU2SnE2qn0rIubYba+Ml+OjCf56xYp2MQ5ib3t0c6Hm93m?=
 =?us-ascii?Q?bqkPQ9GtYdT9VqZCjJJdoXXrca8AkwIm9sXQbSUM8aTV+2HyY8sIT1WNp1ty?=
 =?us-ascii?Q?l4zghdH/Q0FMPu7PcB6xIDjZXDdccH4JYtCt8AcLxZf0mUk1R5pgBmkmr3Oc?=
 =?us-ascii?Q?j9P0YbNy/LQHRox0VtrjO3i4lmVRz+2EQhKwyNw2IGKHs6pGEL1C9i5vrq93?=
 =?us-ascii?Q?GrJJguMsIEIGz4sbTuVVoQEvUuLLyNJB?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 17:22:57.9992
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6327af57-a15a-46f0-afc3-08dd14884c0e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4260

From: Penny Zheng <Penny.Zheng@arm.com>

In Xen, SMMU subsystem is supported for MMU system only. The reason being SMMU
driver uses the same page tables as MMU.
Thus, we make it dependent on CONFIG_MMU.

Signed-off-by: Penny Zheng <Penny.Zheng@arm.com>
Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes from 

v1 - 1. HAS_PASSTHROUGH is now enclosed within "config MMU".
There was a pending response on
"[PATCH v1 2/2] xen/mmu: enable SMMU subsystem only in MMU"
that it might introduce a bunch of #if-defs in arm specific common code.
However, there are alternative implementations possible to reduce
#if-defs. So, that can be decided at a later point in time and should
not block the current patch.

v2 - 1. Added Julien's A-b.

 xen/arch/arm/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 23bbc91aad..604aba4996 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -15,9 +15,7 @@ config ARM
 	select GENERIC_UART_INIT
 	select HAS_ALTERNATIVE if HAS_VMAP
 	select HAS_DEVICE_TREE
-	select HAS_PASSTHROUGH
 	select HAS_UBSAN
-	select IOMMU_FORCE_PT_SHARE
 
 config ARCH_DEFCONFIG
 	string
@@ -79,6 +77,8 @@ config MMU
 	bool "MMU"
 	select HAS_PMAP
 	select HAS_VMAP
+	select HAS_PASSTHROUGH
+	select IOMMU_FORCE_PT_SHARE
 	help
 	  Select it if you plan to run Xen on A-profile Armv7+
 
-- 
2.25.1


