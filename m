Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9111AA85AFB
	for <lists+xen-devel@lfdr.de>; Fri, 11 Apr 2025 13:05:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.947125.1344852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3CCK-0007ud-85; Fri, 11 Apr 2025 11:05:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 947125.1344852; Fri, 11 Apr 2025 11:05:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u3CCK-0007rr-5G; Fri, 11 Apr 2025 11:05:24 +0000
Received: by outflank-mailman (input) for mailman id 947125;
 Fri, 11 Apr 2025 11:05:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Klsp=W5=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u3CCI-000723-IL
 for xen-devel@lists.xenproject.org; Fri, 11 Apr 2025 11:05:22 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2414::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbb127f8-16c4-11f0-9ead-5ba50f476ded;
 Fri, 11 Apr 2025 13:05:21 +0200 (CEST)
Received: from CH2PR08CA0004.namprd08.prod.outlook.com (2603:10b6:610:5a::14)
 by CY5PR12MB6033.namprd12.prod.outlook.com (2603:10b6:930:2f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.28; Fri, 11 Apr
 2025 11:05:15 +0000
Received: from DS3PEPF0000C37B.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::68) by CH2PR08CA0004.outlook.office365.com
 (2603:10b6:610:5a::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.36 via Frontend Transport; Fri,
 11 Apr 2025 11:05:14 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF0000C37B.mail.protection.outlook.com (10.167.23.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 11 Apr 2025 11:05:14 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Apr
 2025 06:05:13 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Apr
 2025 06:05:13 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Fri, 11 Apr 2025 06:05:12 -0500
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
X-Inumbo-ID: dbb127f8-16c4-11f0-9ead-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fbCSG9z1KMuQCzeF4QiHQqMcRV1evA+vZF5YEu1+NBrcm+G8pz+1hE6Sd6DTze9KHqu72DCF5p3mxDvA2WJf4/vr1whuhR23abb7rESfea0582nfh50zbSOI7H4SC87g5VVSUVptFeiWsWLxocEY0XtycJ7bYUc3OS1IN/9os7WvXy7UlJZYVL//a6GiHleP69KCzoS5ZRejg1a1ZLbLBak3Bdpz0GXYlZRQm6CS7JDp4ICfDa8RFD6XtVW+SZ9+/Q7W0K2OznobJfo2dRxH6jabTn1Bi6TUnGb4Sf+6XI8S4Ocr4x2BWVyd2Hv9IDK1qUAJ4yq3LgtYcAssSKQIsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cc4opU6YI2yYLbKnZe7qP3Yd20AGrBwwf09XYqyGIzE=;
 b=jy1HPM0WHCrZSlAWI/ThvfYslHCpG2LhOe9QmCx6Ql43/YiFHro/ROgmNCFGZf+j1xOb7yjOMqguM8rE/YTzhLAtw6MBfu9TS+IzAqS2xQkvQMHvUQIVUE61MbO1YMxKxKYqVj9EjDxnJrptv0idYzHilkgcRIs+GjGSXx4xDsEumRM6Cwr9YT70mOyVuM0SAn4vm8X1/pOeL9ZUKmosXkrfUXI73B4gzG7+9G+nKyK34IKG6LRgK6JXl6JDU1Wlw3BenEHgQrzR4sormcnLbBTfO/Kyqy9t27e4lFJKSRcZEGB0Vtanm3YaId38QQgAH4ASLWHV/K2o289vVuQ/9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cc4opU6YI2yYLbKnZe7qP3Yd20AGrBwwf09XYqyGIzE=;
 b=K8ViVW/o4/R8r6+Jy+30cN0gratcqxke78Z9crk/dvW5YwN0vICTSwgpRDTEACwRdzzi2EJePiERf/CR81qtNmXqpuBadbjEaAFR5wGJhlxYgc2Li47kJDMqAqBDWtm/PwB4EOjfVcB2wSs3Qoow8YHmm+QwOxOksnbni+SRClE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v6 3/3] xen/arm32: mpu: Stubs to build MPU for arm32
Date: Fri, 11 Apr 2025 12:04:52 +0100
Message-ID: <20250411110452.3748186-4-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250411110452.3748186-1-ayan.kumar.halder@amd.com>
References: <20250411110452.3748186-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37B:EE_|CY5PR12MB6033:EE_
X-MS-Office365-Filtering-Correlation-Id: c794ece0-f06f-4112-cb73-08dd78e8bc50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EUt1SKviKFKTUUl3TWWO9TkfuttX7f8VYs0ci339KZnCgxX08C9lAjVmzAlc?=
 =?us-ascii?Q?XhyoN9+lgWd86g8Zx6rQ7FgWFQycqJmgQ1BnA0XDMEenDIa/lBrfjWEA30t0?=
 =?us-ascii?Q?H4XsdXldCN8lpbIpTIYplDl0VKdu4dGCEPW14TUGxLJI/onuQb9FE2dcX1YT?=
 =?us-ascii?Q?43fsbyXze+MQyLg9RUTZykeuRmbyuFNMRiHEPEOwGwG0BJLs4zA1DqQtneKP?=
 =?us-ascii?Q?MKnRKzYuL4pAGhp0JeD3+qytHfw3HFTmzENF00hUPWqWzOjChSLk/wiQ2dD9?=
 =?us-ascii?Q?PeBJemQm5oDAWvdfX1Vy89YOM96Rva4zEiwzcTWZQsEu9dcnyfvDXSPrUQxC?=
 =?us-ascii?Q?exHR0TkDdE7TjK85S3+CfwxpPMfGYBVWUPoOOJM9uuAowRw+Y/wwFVwrBLgg?=
 =?us-ascii?Q?rXDqdrSCpq3A0+fhdvfIZTuMDfZ9akW9w3UkB2DhbJ38NoM6hwh+4gfnvrbC?=
 =?us-ascii?Q?ueBK4MBMvsqd8QhsrEr+tDd93Au5K4N5b96AHreypbb1mp0F5fejJ4+bDRA4?=
 =?us-ascii?Q?2xM7smzeRtUmi5AP1sZUmXolVUgc8WvHQjCaf9d6otTCijUtrxAqEfQ6wcTq?=
 =?us-ascii?Q?Z0YY0Vv3omsVjBugvUJDNmCQr3OOWUsitnWRC5i8cMUaV1ZWCJgUFrvJheET?=
 =?us-ascii?Q?+ye363EK10aOxH3KE4GsZHIDY9siSTZrNcFI+nFvm0NvACoikxgbIg41uWxn?=
 =?us-ascii?Q?86rOl8jgwcPrC3rRNK8OdXCwx0EcG5rK8IWqbV5bWF9DakDRITkJ2Kdtxees?=
 =?us-ascii?Q?/kk1JSyJ05bhn/Rkqt7QACvN9IMl/VceCkPj46uZl1mAork1yyKFlYdg+hu/?=
 =?us-ascii?Q?t5K24cjY3oO513mvKKg2u9wB00ewL+8IP/NDI91q8AK59qwiBdwHZTCXLtnm?=
 =?us-ascii?Q?rmLhjh6o69I2LDMKeOG+jubvFj8rnUFr/5sEbrMHf0SG7FdMWEScvj0A38Dn?=
 =?us-ascii?Q?P8TVk3Vxp4K1+Xhcz3sRhHtH7CNPATaN5LsIKFqSkjhCnccrsx5NMr0ZQLG3?=
 =?us-ascii?Q?+fP3T8zZCNaMgnMrbnmnZJSq/8UGF2Iyeg/RddaYTWW1LdLHWQeWVGYLHXJN?=
 =?us-ascii?Q?yd1kpyjQxs/y0LXjYf5oYcer4U6O7Yd9BAe7uFAEYiucg+3xJGsAQzLaEsqr?=
 =?us-ascii?Q?2Asx14sq4S2nDDoxekeaGrXp5ime19dNp8bvxIseMIedHGkg1X+jxGwgOFzq?=
 =?us-ascii?Q?zLkji8VQb0BfczS2oW/wBoouACBFE/X9E0egjnUk79oR05nU4yeV3TDa8zGj?=
 =?us-ascii?Q?B0f4BiJE29/6Mf4DvMmA0ERTJQXFrzIztCKJmTXVpUwq4ItZvV8gGzWoqKuB?=
 =?us-ascii?Q?W4l9o3JTFmKmff5EBes2g4RgbCvH6ShI0Vn0GgpROWCgOqRV3RC+pTZGtyr1?=
 =?us-ascii?Q?Ovy4k/KSuk0qYmDBxa5XR4AubKRQancuXogFHa5+BLQjHFjbTos2TP0PHV2D?=
 =?us-ascii?Q?WPPrWaSTNcsE/sFhEA6uqKSYtDBRwVu0f5LxLRv4ohIj9TociYMShL4gdjCP?=
 =?us-ascii?Q?JJWUEged4ZJFe0oHaPMpSFA+D+lvrwAw2vr9?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 11:05:14.2698
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c794ece0-f06f-4112-cb73-08dd78e8bc50
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6033

Add stubs to enable compilation.

is_xen_heap_page() and is_xen_heap_mfn() are not implemented for arm32 MPU.
Thus, introduce the stubs for these functions in asm/mpu/mm.h and move the
original code to asm/mmu/mm.h (as it is used for arm32 MMU based system).

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
Changes from :-

v1, v2 -
1. New patch introduced in v3.
2. Should be applied on top of
https://patchwork.kernel.org/project/xen-devel/cover/20250316192445.2376484-1-luca.fancellu@arm.com/

v3 -
1. Add stubs for map_domain_page() and similar functions.

2. 'BUG_ON("unimplemented")' is kept in all the stubs.

v4 - 
1. is_xen_heap_mfn() macros are defined across mpu/mm.h (ARM32 specific)
, mmu/mm.h (ARM32 specific) and asm/mm.h (ARM64 specific)

2. s/(void*)0/NULL

v5 -
1. Add the headers for smpboot.c, domain_page.c and p2m.c.

2. Inclusion of headers and makefile entries are sorted alphabetically.

3. Update the commit message and style changes.

 xen/arch/arm/arm32/mpu/Makefile   |  2 ++
 xen/arch/arm/arm32/mpu/p2m.c      | 19 +++++++++++++
 xen/arch/arm/arm32/mpu/smpboot.c  | 26 ++++++++++++++++++
 xen/arch/arm/include/asm/mm.h     |  9 +------
 xen/arch/arm/include/asm/mmu/mm.h |  7 +++++
 xen/arch/arm/include/asm/mpu/mm.h |  5 ++++
 xen/arch/arm/mpu/Makefile         |  1 +
 xen/arch/arm/mpu/domain_page.c    | 45 +++++++++++++++++++++++++++++++
 8 files changed, 106 insertions(+), 8 deletions(-)
 create mode 100644 xen/arch/arm/arm32/mpu/p2m.c
 create mode 100644 xen/arch/arm/arm32/mpu/smpboot.c
 create mode 100644 xen/arch/arm/mpu/domain_page.c

diff --git a/xen/arch/arm/arm32/mpu/Makefile b/xen/arch/arm/arm32/mpu/Makefile
index 3340058c08..cf0540aecc 100644
--- a/xen/arch/arm/arm32/mpu/Makefile
+++ b/xen/arch/arm/arm32/mpu/Makefile
@@ -1 +1,3 @@
 obj-y += head.o
+obj-y += p2m.o
+obj-y += smpboot.o
diff --git a/xen/arch/arm/arm32/mpu/p2m.c b/xen/arch/arm/arm32/mpu/p2m.c
new file mode 100644
index 0000000000..3d9abe4400
--- /dev/null
+++ b/xen/arch/arm/arm32/mpu/p2m.c
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <asm/p2m.h>
+#include <xen/bug.h>
+#include <xen/init.h>
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
index 0000000000..5090f443f5
--- /dev/null
+++ b/xen/arch/arm/arm32/mpu/smpboot.c
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/bug.h>
+#include <xen/errno.h>
+#include <xen/mm.h>
+#include <xen/stdbool.h>
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
index fbffaccef4..5b67c0f8bb 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -170,14 +170,7 @@ struct page_info
 #define _PGC_need_scrub   _PGC_allocated
 #define PGC_need_scrub    PGC_allocated
 
-#ifdef CONFIG_ARM_32
-#define is_xen_heap_page(page) is_xen_heap_mfn(page_to_mfn(page))
-#define is_xen_heap_mfn(mfn) ({                                 \
-    unsigned long mfn_ = mfn_x(mfn);                            \
-    (mfn_ >= mfn_x(directmap_mfn_start) &&                      \
-     mfn_ < mfn_x(directmap_mfn_end));                          \
-})
-#else
+#ifdef CONFIG_ARM_64
 #define is_xen_heap_page(page) ((page)->count_info & PGC_xen_heap)
 #define is_xen_heap_mfn(mfn) \
     (mfn_valid(mfn) && is_xen_heap_page(mfn_to_page(mfn)))
diff --git a/xen/arch/arm/include/asm/mmu/mm.h b/xen/arch/arm/include/asm/mmu/mm.h
index caba987edc..7f4d59137d 100644
--- a/xen/arch/arm/include/asm/mmu/mm.h
+++ b/xen/arch/arm/include/asm/mmu/mm.h
@@ -27,6 +27,13 @@ extern unsigned long directmap_base_pdx;
 })
 
 #ifdef CONFIG_ARM_32
+#define is_xen_heap_page(page) is_xen_heap_mfn(page_to_mfn(page))
+#define is_xen_heap_mfn(mfn) ({                                 \
+    unsigned long mfn_ = mfn_x(mfn);                            \
+    (mfn_ >= mfn_x(directmap_mfn_start) &&                      \
+     mfn_ < mfn_x(directmap_mfn_end));                          \
+})
+
 /**
  * Find the virtual address corresponding to a machine address
  *
diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
index 86f33d9836..bfd840fa5d 100644
--- a/xen/arch/arm/include/asm/mpu/mm.h
+++ b/xen/arch/arm/include/asm/mpu/mm.h
@@ -13,6 +13,11 @@ extern struct page_info *frame_table;
 
 #define virt_to_maddr(va) ((paddr_t)((vaddr_t)(va) & PADDR_MASK))
 
+#ifdef CONFIG_ARM_32
+#define is_xen_heap_page(page) ({ BUG_ON("unimplemented"); false; })
+#define is_xen_heap_mfn(mfn) ({ BUG_ON("unimplemented"); false; })
+#endif
+
 /* On MPU systems there is no translation, ma == va. */
 static inline void *maddr_to_virt(paddr_t ma)
 {
diff --git a/xen/arch/arm/mpu/Makefile b/xen/arch/arm/mpu/Makefile
index 21bbc517b5..c7e3aa4d87 100644
--- a/xen/arch/arm/mpu/Makefile
+++ b/xen/arch/arm/mpu/Makefile
@@ -1,3 +1,4 @@
+obj-$(CONFIG_ARM_32) += domain_page.o
 obj-y += mm.o
 obj-y += p2m.o
 obj-y += setup.init.o
diff --git a/xen/arch/arm/mpu/domain_page.c b/xen/arch/arm/mpu/domain_page.c
new file mode 100644
index 0000000000..9e30970588
--- /dev/null
+++ b/xen/arch/arm/mpu/domain_page.c
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+
+#include <xen/bug.h>
+#include <xen/domain_page.h>
+#include <xen/mm-frame.h>
+#include <xen/types.h>
+
+void *map_domain_page_global(mfn_t mfn)
+{
+    BUG_ON("unimplemented");
+    return NULL;
+}
+
+/* Map a page of domheap memory */
+void *map_domain_page(mfn_t mfn)
+{
+    BUG_ON("unimplemented");
+    return NULL;
+}
+
+/* Release a mapping taken with map_domain_page() */
+void unmap_domain_page(const void *ptr)
+{
+    BUG_ON("unimplemented");
+}
+
+mfn_t domain_page_map_to_mfn(const void *ptr)
+{
+    BUG_ON("unimplemented");
+    return INVALID_MFN;
+}
+
+void unmap_domain_page_global(const void *va)
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
-- 
2.25.1


