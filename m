Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C349A7EB09
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 20:45:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940883.1340526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1rSz-0002dn-5l; Mon, 07 Apr 2025 18:45:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940883.1340526; Mon, 07 Apr 2025 18:45:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1rSz-0002bm-1t; Mon, 07 Apr 2025 18:45:05 +0000
Received: by outflank-mailman (input) for mailman id 940883;
 Mon, 07 Apr 2025 18:45:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xyMQ=WZ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u1rSx-00026s-7G
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 18:45:03 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2413::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6986d5b0-13e0-11f0-9eaa-5ba50f476ded;
 Mon, 07 Apr 2025 20:45:02 +0200 (CEST)
Received: from BN9PR03CA0457.namprd03.prod.outlook.com (2603:10b6:408:139::12)
 by MW4PR12MB6849.namprd12.prod.outlook.com (2603:10b6:303:20d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Mon, 7 Apr
 2025 18:44:56 +0000
Received: from BN1PEPF0000468D.namprd05.prod.outlook.com
 (2603:10b6:408:139:cafe::92) by BN9PR03CA0457.outlook.office365.com
 (2603:10b6:408:139::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.27 via Frontend Transport; Mon,
 7 Apr 2025 18:44:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000468D.mail.protection.outlook.com (10.167.243.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Mon, 7 Apr 2025 18:44:55 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 13:44:53 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 13:44:53 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Mon, 7 Apr 2025 13:44:52 -0500
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
X-Inumbo-ID: 6986d5b0-13e0-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AHsEk+QfsftAH3O/CeldQK8+grDIr7Y4oCLjsXjjoazanTnrU4LJSORKNLufRGxtnZez3e258es6FN2hS2uWwOpNU5iN/VEP9pCmlFyKnPO4T8hxsElIVI+2rVzQa/NhG9HO8cKMIpDv3PPmW8LvpBX/vF1bBttFlvdYT0OSCxDd7ooKTtSXcVCBEyM2c3yLxStnIl0SxznutPaJ4Jzxs9xwCJCC/zp3N+Jg2md6UslCsgryYNzHsuOjnTuLmeu8W1Sq16VLQzBRV6QJ74246QfQrv+17dcq/XMh65b3cRkVbV7Cu/cTs3SiLzx7033jJOa6jdxKn3tTSNiyRIeqSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HrsIrtzqJo1yG0n5zEJrTCODyjEnqw4pvT+3HqNQDsM=;
 b=IwWPnuxsM5E+H7xd5WNiEbeG8Z/9qHzDFmtUXIkshacsYiCQJJ4Hj3CLXttGY6aeRzGHjF0t2eo7Ntxw0oW9cnvO3GkWkcGeTjBTw12cw1HTezGoWW4k7v0jgbvN9hACUyqyRYHR5jpDaTCkHLCjGyf6s+7jciMX+a9x5B+TQqHqTiNzJFQotdrapa4JHqfqwOpd/QbdCxFEhbwSAShDEYDHUcQwrEsBTh46BtWAv1N4szqMkrXaXX4DoEqUmFMaPqfsXg09/hmgb3KQisHT03C/kajsLyk/6iGktusuUxMAAd212h4QNa0PZDtKUyz3a/sggt+sSY029xMqLizc4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HrsIrtzqJo1yG0n5zEJrTCODyjEnqw4pvT+3HqNQDsM=;
 b=Kedj9tlKyPRx16FMLSoJkceYVnRhxF6WggJLJk7wG5JLTiq5OUJ7vcdPXEL7uRZ7A943/fcvYcU5Wpan1BcE+JKOlRND6LRSDXcYzaP+XC+OqlvQfHKEP5XE82R6FBI/YzMpO15AD/wvekszffNruJ1pVbLfNldEounk5+9taMw=
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
Subject: [PATCH v5 3/3] xen/arm32: mpu: Stubs to build MPU for arm32
Date: Mon, 7 Apr 2025 19:44:43 +0100
Message-ID: <20250407184443.1790995-4-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250407184443.1790995-1-ayan.kumar.halder@amd.com>
References: <20250407184443.1790995-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468D:EE_|MW4PR12MB6849:EE_
X-MS-Office365-Filtering-Correlation-Id: c2d73e46-4fa3-49cb-3911-08dd76044a2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iDVF+btuffi2xe7KCw8hZTfKL21e4GVzLbtZ1oAqfaV4OrMEzie0J/xdySLW?=
 =?us-ascii?Q?XYnAK0pnrGC4rf7rtyVfRrc6+jjfUqapR33J7LsVPqJPImsTAQn4R/KI6JDv?=
 =?us-ascii?Q?Wn3sTR++z3gpTE0YMd2VFeAe9w9nwv6lQAieyAF+k24SU43TwLwKlxMH1IGP?=
 =?us-ascii?Q?Wnl2OwR4q/QSi/OgGS/sSnfuJcO2/xCNoTn9IOeksIcAbLGDWNNn+5NVjZvs?=
 =?us-ascii?Q?AKmbrMjnDFWJaFcYxEZVnmilC/8dYMx/4M1a0neTLut9uoOMpkkqqciWr64R?=
 =?us-ascii?Q?4MiYsGjBXITewf5Qh2yuzAFr10FtVVqPpI7GMNMgdlqXh/SO8NEC1GCNkE9i?=
 =?us-ascii?Q?CbwE/jQiOoaB+hbhvuwr+cgnS1adChbWtKOT33mnIt+akoq7dI7XElCD/kYf?=
 =?us-ascii?Q?HzahfNnQTmT1arDCTMA5paugril3tzn+GmbIbRbNOFREqKrfQdsYsG6T8bw5?=
 =?us-ascii?Q?3Do4efnAiid17poyFDJTGm0kFDj8hHAP6xKRu6mb5a9EY/SbEelKrodC08Eo?=
 =?us-ascii?Q?PuwnvopafgzQTihDdt9DRp2w1nbkivAgyw5PU/Bp1qlMnvlBm4HvCvA1boO2?=
 =?us-ascii?Q?TTysYBCemvgAcfq193oVfQtFLxfoawdU61bXC3NuvuL54G8yHTTHarIU8t7r?=
 =?us-ascii?Q?9nhw+odcGIku4t5y8yhrC71GSEk6qkCWn03/43XTVKTEH3nkMLgSY4267jFv?=
 =?us-ascii?Q?2sNIy1cJFf2RodKppsjg3NN1G6jB2wwajJLpdi4nQ9cBgafLkiYG8he7m5NQ?=
 =?us-ascii?Q?wW40OFV3ybvYeyf5rRct5AQbTGCnsi2tWkWp2I46JDD0J0Z0ZvD6B+cI3xps?=
 =?us-ascii?Q?R1cuPdKKK83gaL3876HUQ3cLeubpvfueJ27fi/veT9KDBzxs/odDy/dH6psN?=
 =?us-ascii?Q?squIzOFgZVJcfPHKmzm2cZHdPgFezflapxOo+ztWVd2e2qylzLxZ8dHcZIkI?=
 =?us-ascii?Q?bN4kiZKNNlH+PoC6NUctdV3lPLn0cV7zBpWaB+zorMV+hcWFm2O8th3LBabT?=
 =?us-ascii?Q?ESjnQGXms46i7vCMgvO6XTlcMaICfBWoVWQUPXNXStdmENnHxCIANh1dE+Fk?=
 =?us-ascii?Q?EZ6KQyFwLuA0sfhn/6Hu/hIU18+sQS1zlUrECf6RcwGN9nU639UWYW+W8NtX?=
 =?us-ascii?Q?th21FRaYmzNzHZXxgse1F2z/xzflBnz2F1dEOge7otgXSIMXRixHGixEQut0?=
 =?us-ascii?Q?5erIwpX8AuypP6awF1q8eWDHao5bQzvJ/7ONe7WWFbQ0XrrCNybi6AJopprX?=
 =?us-ascii?Q?BRjyLr34EQnLPq+t7hSC+s58C0FnTCYEHCZKGMf0nicLn9AT1iO3zqZ3528L?=
 =?us-ascii?Q?op76aLUiDnTSvLsJ2yayQ7qDBkwYA0DzHlbFgo9ZMVDuzYLuHXy1q82xPXtT?=
 =?us-ascii?Q?TDQL0vPqSK8LhreHBgW95SBpPjeSiNDgFGV51pHO2sItwVZ1jTO+ax/m3jUD?=
 =?us-ascii?Q?1DM5WNres7sTHEXJwgaNipSGiTaifPMsm4+RBAWC6RhcE8SLHotPMS2zcN2D?=
 =?us-ascii?Q?gPGvkCzTYrpY6pc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 18:44:55.2612
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d73e46-4fa3-49cb-3911-08dd76044a2f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6849

Add stubs to enable compilation

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
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

 xen/arch/arm/arm32/mpu/Makefile   |  2 ++
 xen/arch/arm/arm32/mpu/p2m.c      | 18 ++++++++++++++
 xen/arch/arm/arm32/mpu/smpboot.c  | 23 +++++++++++++++++
 xen/arch/arm/include/asm/mm.h     |  9 +------
 xen/arch/arm/include/asm/mmu/mm.h |  9 +++++++
 xen/arch/arm/include/asm/mpu/mm.h |  5 ++++
 xen/arch/arm/mpu/Makefile         |  1 +
 xen/arch/arm/mpu/domain_page.c    | 41 +++++++++++++++++++++++++++++++
 8 files changed, 100 insertions(+), 8 deletions(-)
 create mode 100644 xen/arch/arm/arm32/mpu/p2m.c
 create mode 100644 xen/arch/arm/arm32/mpu/smpboot.c
 create mode 100644 xen/arch/arm/mpu/domain_page.c

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
index caba987edc..9b98d12b07 100644
--- a/xen/arch/arm/include/asm/mmu/mm.h
+++ b/xen/arch/arm/include/asm/mmu/mm.h
@@ -21,6 +21,15 @@ extern unsigned long directmap_base_pdx;
 
 #define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
 
+#ifdef CONFIG_ARM_32
+#define is_xen_heap_page(page) is_xen_heap_mfn(page_to_mfn(page))
+#define is_xen_heap_mfn(mfn) ({                                 \
+    unsigned long mfn_ = mfn_x(mfn);                            \
+    (mfn_ >= mfn_x(directmap_mfn_start) &&                      \
+     mfn_ < mfn_x(directmap_mfn_end));                          \
+})
+#endif
+
 #define virt_to_maddr(va) ({                                                   \
     vaddr_t va_ = (vaddr_t)(va);                                               \
     (paddr_t)((va_to_par(va_) & PADDR_MASK & PAGE_MASK) | (va_ & ~PAGE_MASK)); \
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
index 21bbc517b5..ff221011d5 100644
--- a/xen/arch/arm/mpu/Makefile
+++ b/xen/arch/arm/mpu/Makefile
@@ -2,3 +2,4 @@ obj-y += mm.o
 obj-y += p2m.o
 obj-y += setup.init.o
 obj-y += vmap.o
+obj-$(CONFIG_ARM_32) += domain_page.o
diff --git a/xen/arch/arm/mpu/domain_page.c b/xen/arch/arm/mpu/domain_page.c
new file mode 100644
index 0000000000..8859b24e04
--- /dev/null
+++ b/xen/arch/arm/mpu/domain_page.c
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#include <xen/domain_page.h>
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


