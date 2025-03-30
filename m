Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F1BA75BAA
	for <lists+xen-devel@lfdr.de>; Sun, 30 Mar 2025 20:04:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.931679.1333907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyx0o-0005mI-U3; Sun, 30 Mar 2025 18:03:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931679.1333907; Sun, 30 Mar 2025 18:03:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyx0o-0005j5-Qa; Sun, 30 Mar 2025 18:03:58 +0000
Received: by outflank-mailman (input) for mailman id 931679;
 Sun, 30 Mar 2025 18:03:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bHYC=WR=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tyx0m-0004t7-M2
 for xen-devel@lists.xenproject.org; Sun, 30 Mar 2025 18:03:56 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2407::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57dd375d-0d91-11f0-9ea7-5ba50f476ded;
 Sun, 30 Mar 2025 20:03:55 +0200 (CEST)
Received: from BN0PR04CA0123.namprd04.prod.outlook.com (2603:10b6:408:ed::8)
 by SA5PPFCAFD069B8.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8e1) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Sun, 30 Mar
 2025 18:03:50 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:408:ed:cafe::c2) by BN0PR04CA0123.outlook.office365.com
 (2603:10b6:408:ed::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.53 via Frontend Transport; Sun,
 30 Mar 2025 18:03:50 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Sun, 30 Mar 2025 18:03:50 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 30 Mar
 2025 13:03:49 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Sun, 30 Mar 2025 13:03:48 -0500
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
X-Inumbo-ID: 57dd375d-0d91-11f0-9ea7-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9Kyje7ezUgHmtBbc8GAtYgdYx6CT4eZnz/nDJHRrtnOfO9MSIhYbj2c3Z3GnOQSz2eR+bxkL5MTrmzFvqteaErARPfUxQknEi5yOYBdbbVWcYk5uFaHs6w4kIMHdZiCcuSFGlGdNLL3dpwS5u6Mu+v3aWDlNDx2T6l2VTMZma6o7RT0ltxiQb7ootDW3L+iZJs1avSH3K4K5AHN0bXxchPeNveoMgPq0PfNmDaHk6rYs08j/CFvFZzQrAzV66tw04lDEoLr9D5rkXbCBEm3GMg3DHgtwx1jIrpRPJ5VUv0PalYGAcdBag1ZM0I0d+EgjNhMsRwl0cF7Gi7YmtQhrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zk+vRuec4fDRob1b6VKS0/iKJpo2k5z+nvuNuE8XdSY=;
 b=muMGQC+oi2k06pmqwm+NP6I/jlnT096A/qaiiTUuuU36lbI24uHjBx2uHCRc+AT0CDTrp3S6orap4/CHnupKCxAtaFSi/ZqZWCSUd/jbcMnHZCkLvpryOjvZMwkiGRo2Ma1oJc5iNVz/mN0p/RqgfsQM729qUFxSoGVmFCDpGdF8xfUV3ikpbAHoTF8/cOJayGw0pBhf0dg8PTb9v8rljE3Ws8xfavk5KWJSj3IBpnAEBGziRsx5Z9Mz8334z1hr79CIi0/0BU6doYZhxODNAA5CWQSm41giwvMdwoCUQO+oeFakuxD3qQhMPbkFfno/G9TJVrZ7uzmQAybzqa+upQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zk+vRuec4fDRob1b6VKS0/iKJpo2k5z+nvuNuE8XdSY=;
 b=jOrMGuMW7ydD3nLAKdgTEb5jGCmzV63D2xRccqQxBvqeRYo64Gd7DUpcVCGvqPwKDyiJfcwgwfOrhUwlM+ySFWVaLijZVkIw8q5FLkL57k9QN9Kao8UQDspqsCz/WYiiz1nSg30ksesc8PJkgE+a1JPti85U9d9slUDpmSk3jlY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 5/5] xen/arm32: mpu: Stubs to build MPU for arm32
Date: Sun, 30 Mar 2025 19:03:08 +0100
Message-ID: <20250330180308.2551195-6-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250330180308.2551195-1-ayan.kumar.halder@amd.com>
References: <20250330180308.2551195-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|SA5PPFCAFD069B8:EE_
X-MS-Office365-Filtering-Correlation-Id: e997f276-95ae-4b2b-1903-08dd6fb539a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|34020700016|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1mJpm3BhczMtwDiezlXpCjTfDrEfppl32JNqYyJLl2kXKZDhcIM6TFdgJpiA?=
 =?us-ascii?Q?BaPYdTvXg9Omh3q36rViGf5kDFoicsRD6PrRzk9MKPqBgnbjX248gzRhp9fc?=
 =?us-ascii?Q?s5pHe1x4/hZuZ1j4S8Z/J6vfYLc/mpwuuibos7/4YOt0uM/4H72+PKnvnTER?=
 =?us-ascii?Q?jhtvfrdSTsGQxTAi7qaJLdKri4jQDXjozuDKcc4ZW3jX+SEFUTW6MGFmU3rS?=
 =?us-ascii?Q?8bNGkdRVfdDiSr8YkksTVhbODCyptzioFYvzwwM454dmDh3C5T/NISG9xLVO?=
 =?us-ascii?Q?JAwwXDZGu2Y51oOkTVyQhbDLGYnJPmLXKihXJwHOMpOTgXuRr0Tuzojt3+JV?=
 =?us-ascii?Q?vFMRUMykegUsSc/04arH0CWyDSvoPIdgNAWxoJpoWJeItFypYwubBtnqgc9C?=
 =?us-ascii?Q?p4EHhimhk+GwjecSycTckmhfTmCjT8OF8XHvEighRvuHU26IpOPsRTEXpbAC?=
 =?us-ascii?Q?s7UZVey4LrSj5Rjc3dyxgoiix7Oau88HIhk7/IRAzVT8FY/5Yx+nHwetHWUh?=
 =?us-ascii?Q?A71HLO/S1fiSg6IgfuwiHeJ4mcmplAXOYGD7zcbjRpZCXyTC/eU9Jq9fe0U/?=
 =?us-ascii?Q?dojiq+dM5JAnshd1hv0qcpg7O8o4V6yNVIxxuKbTuoy3+tme/9uem7+I8xaW?=
 =?us-ascii?Q?Kiu1pfBIniVZE4fjo+u4Z0StPWhcSuWsUzvD1SUIKilf4ifZt0fDFSgFuv3x?=
 =?us-ascii?Q?qImWD2Ul9nSbk7uA3x3zT1oIaUZVTWQGlPyLOFhNCxea8jTFcR+g86WJfU36?=
 =?us-ascii?Q?SpX7mlW0Wl2Pjn6tpLypl5uCNjORpZzcPC06wfQICBiI2RDyKduWjpe43W33?=
 =?us-ascii?Q?BRczkHAKt53qtpfExGWethx06WfWlVxbYmxqTxwDD82q755CCtrZ0BKhKZ1z?=
 =?us-ascii?Q?7+pqNRL6PA/nwIZk/gU1LDesNiva43Ca+TNkgKb54VGii+IbPwle5Jflyk9O?=
 =?us-ascii?Q?ns4hMATYNBxXhitE6INpKg4cQphwAPA70e1e9B4y29TRDDzo/r9fm3yJzvgZ?=
 =?us-ascii?Q?aXBfBQzUar5/zXxITku2k+x8pV8HMrCOMahMV5e0HVLt+osNyQyghYKF3DEg?=
 =?us-ascii?Q?PbKw3/UweP6rsiN2M9GkE4pwEVm4P9gSfTdIMeC2dB1DmR/D/OBtvtiNxMlR?=
 =?us-ascii?Q?yI/DgplAGj2i5pod3WkXZdhD2hon3SjOTmjlLd4G5kaC4BYchVrDQAy8WGAt?=
 =?us-ascii?Q?vz8wqRY3hAp5Sim4eWr0laTUS3Nd3Vl2e3N3SSNo6/q6aPnmILwyGsmhAQov?=
 =?us-ascii?Q?ALsX9WaDdjgpZKP051eJGvFlR77+5GeGozIGVbglUH35g46ZII5r2LiNVr8q?=
 =?us-ascii?Q?UGpHe1v+xWmZY3BScAA/VvSYHJi7o5FyDQaxC4u0EuGLrjVJzLQ6UqHNfQ82?=
 =?us-ascii?Q?P/fXUfU/JVMtloI1owDmb8qxyzLKcXeCrjeqfLQu0VORdr4wsxyA4LTIwYpD?=
 =?us-ascii?Q?ITc7bT9rgvdckTJZr/ySsHxovWEIb005otziT7caWIYmOy4Wv37ik5F50tYW?=
 =?us-ascii?Q?fqrkKGDFhxNtEUQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(34020700016)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2025 18:03:50.2960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e997f276-95ae-4b2b-1903-08dd6fb539a6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFCAFD069B8

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from :-

v1, v2 -
1. New patch introduced in v3.
2. Should be applied on top of
https://patchwork.kernel.org/project/xen-devel/cover/20250316192445.2376484-1-luca.fancellu@arm.com/

 xen/arch/arm/Kconfig             |  2 +-
 xen/arch/arm/arm32/mpu/Makefile  |  2 ++
 xen/arch/arm/arm32/mpu/p2m.c     | 18 ++++++++++++++++++
 xen/arch/arm/arm32/mpu/smpboot.c | 23 +++++++++++++++++++++++
 xen/arch/arm/include/asm/mm.h    |  5 +++++
 5 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/arm32/mpu/p2m.c
 create mode 100644 xen/arch/arm/arm32/mpu/smpboot.c

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 565f288331..a1dd942091 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -1,7 +1,7 @@
 config ARM_32
 	def_bool y
 	depends on "$(ARCH)" = "arm32"
-	select ARCH_MAP_DOMAIN_PAGE
+	select ARCH_MAP_DOMAIN_PAGE if MMU
 
 config ARM_64
 	def_bool y
diff --git a/xen/arch/arm/arm32/mpu/Makefile b/xen/arch/arm/arm32/mpu/Makefile
index 3340058c08..38797f28af 100644
--- a/xen/arch/arm/arm32/mpu/Makefile
+++ b/xen/arch/arm/arm32/mpu/Makefile
@@ -1 +1,3 @@
 obj-y += head.o
+obj-y += smpboot.o
+obj-y += p2m.o
diff --git a/xen/arch/arm/arm32/mpu/p2m.c b/xen/arch/arm/arm32/mpu/p2m.c
new file mode 100644
index 0000000000..df8de5c7d8
--- /dev/null
+++ b/xen/arch/arm/arm32/mpu/p2m.c
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/init.h>
+#include <asm/p2m.h>
+
+void __init setup_virt_paging(void)
+{
+    BUG_ON("unimplemented");
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/arm32/mpu/smpboot.c b/xen/arch/arm/arm32/mpu/smpboot.c
new file mode 100644
index 0000000000..3f3e54294e
--- /dev/null
+++ b/xen/arch/arm/arm32/mpu/smpboot.c
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/mm.h>
+
+int prepare_secondary_mm(int cpu)
+{
+    BUG_ON("unimplemented");
+    return -EINVAL;
+}
+
+void update_boot_mapping(bool enable)
+{
+    BUG_ON("unimplemented");
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index fbffaccef4..a894e28ac9 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -171,12 +171,17 @@ struct page_info
 #define PGC_need_scrub    PGC_allocated
 
 #ifdef CONFIG_ARM_32
+#ifdef CONFIG_MPU
+#define is_xen_heap_page(page) false
+#define is_xen_heap_mfn(mfn) false
+#else
 #define is_xen_heap_page(page) is_xen_heap_mfn(page_to_mfn(page))
 #define is_xen_heap_mfn(mfn) ({                                 \
     unsigned long mfn_ = mfn_x(mfn);                            \
     (mfn_ >= mfn_x(directmap_mfn_start) &&                      \
      mfn_ < mfn_x(directmap_mfn_end));                          \
 })
+#endif
 #else
 #define is_xen_heap_page(page) ((page)->count_info & PGC_xen_heap)
 #define is_xen_heap_mfn(mfn) \
-- 
2.25.1


