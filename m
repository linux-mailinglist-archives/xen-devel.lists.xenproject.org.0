Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44416A92210
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 17:56:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.958176.1351114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Rag-0002EE-Kz; Thu, 17 Apr 2025 15:55:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 958176.1351114; Thu, 17 Apr 2025 15:55:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5Rag-0002Ck-Hh; Thu, 17 Apr 2025 15:55:50 +0000
Received: by outflank-mailman (input) for mailman id 958176;
 Thu, 17 Apr 2025 15:55:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mHCx=XD=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u5Raf-0002Ce-7J
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 15:55:49 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2414::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67c16ac7-1ba4-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 17:55:38 +0200 (CEST)
Received: from MN2PR16CA0046.namprd16.prod.outlook.com (2603:10b6:208:234::15)
 by BL1PR12MB5948.namprd12.prod.outlook.com (2603:10b6:208:39b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Thu, 17 Apr
 2025 15:55:32 +0000
Received: from BN1PEPF00004680.namprd03.prod.outlook.com
 (2603:10b6:208:234:cafe::13) by MN2PR16CA0046.outlook.office365.com
 (2603:10b6:208:234::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.23 via Frontend Transport; Thu,
 17 Apr 2025 15:55:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004680.mail.protection.outlook.com (10.167.243.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 15:55:31 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 10:55:31 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 17 Apr 2025 10:55:30 -0500
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
X-Inumbo-ID: 67c16ac7-1ba4-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e4NHgnogO1MBqBiz2fuE5x9leI9SGS6vQ1QsnUYVpYVDBSousqyKWLDStRWlD4bj9d2mR+L5fIXqfSblCeh0Ge1/yQbS/a+2sx5QMMoG7oOatblG5BKatgmUfm61zePE6Sp1eR0SMp5dRGCIHLbVF0591cUR/sUFK3UKVwP9r3MEITfBoVWMrlx3UXjkECfqp2zGwrX8r1LqRMJlqnspp+wxyYMJT38Aw4olN9orM1y3YEOdL5JCuBz5ORenbS29fTCHUv05EXMwYQcKZqu8oyo3baXWEjsiIzjrr7nHfGtd0EppGBGGH7xJ3Z6KpdXUtW6jN1sV15mfQfLiV1ZZIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UsTVK0O6DA6xyWThkUXkPqCZ8Z7M1OfU1AEpPk/dMdo=;
 b=W0/HDKNNXrwTDUgBjCMyKxxoJmdzF77Un2IdaJkUHSCwEa4LUOHGCxMdQiO/X+2KGNI22IbOhzZeWxkilowz0fycJDUoEQSirDFWO0TTAuEqogynsQFfLwpFGLVC/ekna0Qqy1YmBI5HN3/PLkLeh1B6ncPv7vatt2uxAKIO3yC955coZpSBiHhPqBp2ffVDK1Y4Hq5+KWbiA0mULUyQB86j3kdAj++HdnGA1QKgAluMuTK+RGTi4m9+q3DFK7TW9QgK9/i9J5MrKPe4ap2rRIAAihvUBMnpSUxw1lhahvN5Vf2Rgwqf58SCNw9GbGnNuFuvd9LVU9sgLl4CUA/r1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UsTVK0O6DA6xyWThkUXkPqCZ8Z7M1OfU1AEpPk/dMdo=;
 b=zzt5At8Mulse6xk1FGi6okqVPP6oNf3HQhK87yF+PWNdweXsvYZHvtGdE+Uu9UMAvcYpR6F+Z0HVUzyVB/3qKrTvktyn/rizVCLPmkwCRwMFy/60bhaP5MDLUQXGrUgMs4BeGeImqW7/RKCA7uaQjg6lDRQRvHXjPFAPc+MpC9Q=
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
Subject: [PATCH v1] xen/arm: AArch32-V8R: Add MPU register definitions
Date: Thu, 17 Apr 2025 16:55:11 +0100
Message-ID: <20250417155511.1854081-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004680:EE_|BL1PR12MB5948:EE_
X-MS-Office365-Filtering-Correlation-Id: a1c33cdc-2a55-411f-0b56-08dd7dc84871
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oFXF9osl32cr/YRxnZ4loyKmlV+UurpD4jr4DIJzwYFa7/Ddq7FicnD3Sg+o?=
 =?us-ascii?Q?HvpgtJJjAnrLxWmyJ89buSY3tRRC6BVxvzo6NW1Thp78hbSHe9n20GZS4IIS?=
 =?us-ascii?Q?/vM+sx2MZe7j26NGNClyUBI/NJp4pfBeFqwz7uc4eSXsv/PcdGob44bImpBO?=
 =?us-ascii?Q?4NIFdzYXtoSJnM9EoiSyuSZHM3uUVkGP9zTpa8488/mi6HYSHE6FCe8xkNon?=
 =?us-ascii?Q?EyyGIrL4bh44/pVoAqUz6rFVutQ+d9MJlPS4bdqsu1wDItA/yKQTQIU+ObqF?=
 =?us-ascii?Q?XI4zsIOPj1G+p2FzZEj8e3pXCmH+amL0ATdm8b0WJYXN0dgAnEKugddiYx1r?=
 =?us-ascii?Q?wUsJm/vFuEoZD/HQ5W59K9hCeW+JPmolPv4mzHudQ1m6PmEhe+dK8qKLnd1z?=
 =?us-ascii?Q?4RxWpXMolLV2EnzU514auuY7DBxwnJ148CSDLE5dmmToj/kyoCT8Mvff2IHU?=
 =?us-ascii?Q?g42wc4Vu7MTme7hmcbBkKF29ot+RwNMSUKhJZV3w7fhGvAZuRSFNWxGx9SO/?=
 =?us-ascii?Q?sMMr5kHWFDvtQGVLss9+Yl5x1rsrUOpT+L7O09PzL3G+2u3qgJb7c87jMpxf?=
 =?us-ascii?Q?yefutP+HT3SwfU0fpIX4JfimQ/5ES1opxLIYsdQJwqIN1udgBuCu01ylCzZz?=
 =?us-ascii?Q?Zu+a6hCZRPWg7Nk8LBYWPBZlMisAtfm0S2xyjsaPQS7lu3dxAPO0TKndcG9Z?=
 =?us-ascii?Q?awSu+jQEBk3AEPYHqNDd/RI0hMR4jVcjJv3u6ZfNrERpr6bqOZe8ijKs3c63?=
 =?us-ascii?Q?x2fV2mraCwSqzlHZ+Zoi9JP9rvpW1GK/N1QjPVtmcwpNK5Vy5IZNBHJ4D0OA?=
 =?us-ascii?Q?mZ5/wGkqcHfH3CL+JF4Iw7aJPj30s7GXWDEPotMCs9xbSrkfRDUfOF8FWazc?=
 =?us-ascii?Q?tv7jg+K05UGSCV1g5wntZEFQBvZfKnatD6Crv7XvBmbvkfexxuTrxK+adsye?=
 =?us-ascii?Q?4qGVm9uqudJxRDjtXoB5Pmdafjaf/ppPD8nTxpr+q9BZ3Z3tVU0zDcK9ARhx?=
 =?us-ascii?Q?p1sDZ8LuoZmxo/y5Rfs9RSR/YoZgVzYIy079M2vwgikBFdTrFHQ7w7nK0EA2?=
 =?us-ascii?Q?SINjJCs9F+w/M5HIrllrHgAxCCP9C8IyuNvyPEDwwpvi3jjCVxkD65x56Q1C?=
 =?us-ascii?Q?xsOP4mnTnufiR0+mJWamFn+XvZJQCGyg7mb8g2GeS3mnFL4uuvTSNSQTOs99?=
 =?us-ascii?Q?vb6ePj90hOmt38IipGDkte+/+79/6bpqCSBe26xy/J0qAjuAG8MRHrLFvLmI?=
 =?us-ascii?Q?0PKas2JyGxiZ8ovEIeHgrHnZ3H8ElUfc0bfPvhALj9Y0qR9S8LGae9Kki6Yu?=
 =?us-ascii?Q?oU20Qu/jQJed2UiW23uTYbxdBEaA0EUo2+Dn1KagynuOvc5cekvdX5KvnUMv?=
 =?us-ascii?Q?/N05xLeOfaUy1OcfChKkX6fzl3zT0gchE9D3NWx0SFIeiokqZOg+YueCmuaV?=
 =?us-ascii?Q?mWTwSAXI/OEk+qKd4iZ3xMxuEPusK41wEnZGMe0IZgRAzepAkBrwGS9sYTy2?=
 =?us-ascii?Q?LkC/z/Fu1HkXfQk1RiwrT4BDtc67Y7kigPAa?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 15:55:31.8465
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1c33cdc-2a55-411f-0b56-08dd7dc84871
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004680.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5948

Add the definitions for HPRBAR<0..31>, HPRLAR<0..31> and HPRENR.
The definitions are taken from ARM DDI 0568A.c ID110520, E2.2.3 HPRBAR<n>,
E2.2.4 HPRENR and E2.2.6 HPRLAR<n>.

Introduce pr_t typedef which is a structure having the prbar and prlar members,
each being structured as the registers of the AArch32-V8R architecture.
This is the arm32 equivalent of
"arm/mpu: Introduce MPU memory region map structure".

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
This patch should be applied after
"[PATCH v3 0/7] First chunk for Arm R82 and MPU support" in order to enable
compilation for AArch32.

 xen/arch/arm/include/asm/arm32/mpu.h  |  59 +++++++++++
 xen/arch/arm/include/asm/mpu.h        |   4 +
 xen/arch/arm/include/asm/mpu/cpregs.h | 135 ++++++++++++++++++++++++++
 3 files changed, 198 insertions(+)
 create mode 100644 xen/arch/arm/include/asm/arm32/mpu.h

diff --git a/xen/arch/arm/include/asm/arm32/mpu.h b/xen/arch/arm/include/asm/arm32/mpu.h
new file mode 100644
index 0000000000..4aabd93479
--- /dev/null
+++ b/xen/arch/arm/include/asm/arm32/mpu.h
@@ -0,0 +1,59 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * mpu.h: Arm Memory Protection Unit definitions for aarch64.
+ */
+
+#ifndef __ARM_ARM32_MPU_H
+#define __ARM_ARM32_MPU_H
+
+#define XN_EL2_ENABLED  0x1
+
+#ifndef __ASSEMBLY__
+
+/* Hypervisor Protection Region Base Address Register */
+typedef union {
+    struct {
+        unsigned int xn:1;       /* Execute-Never */
+        unsigned int ap:2;       /* Acess Permission */
+        unsigned int sh:2;       /* Sharebility */
+        unsigned int res0:1;     /* Reserved as 0 */
+        unsigned int base:26;    /* Base Address */
+    } reg;
+    uint32_t bits;
+} prbar_t;
+
+/* Hypervisor Protection Region Limit Address Register */
+typedef union {
+    struct {
+        unsigned int en:1;     /* Region enable */
+        unsigned int ai:3;     /* Memory Attribute Index */
+        /*
+         * There is no actual ns bit in hardware. It is used here for
+         * compatibility with Armr64 code. Thus, we are reusing a res0 bit for ns.
+         */
+        unsigned int ns:1;     /* Reserved 0 by hardware */
+        unsigned int res0:1;   /* Reserved 0 by hardware */
+        unsigned int limit:26;  /* Limit Address */
+    } reg;
+    uint32_t bits;
+} prlar_t;
+
+/* Protection Region */
+typedef struct {
+    prbar_t prbar;
+    prlar_t prlar;
+    uint64_t p2m_type;          /* Used to store p2m types. */
+} pr_t;
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* __ARM_ARM32_MPU_H */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/mpu.h b/xen/arch/arm/include/asm/mpu.h
index 77d0566f97..67127149c0 100644
--- a/xen/arch/arm/include/asm/mpu.h
+++ b/xen/arch/arm/include/asm/mpu.h
@@ -8,8 +8,12 @@
 
 #if defined(CONFIG_ARM_64)
 # include <asm/arm64/mpu.h>
+#elif defined(CONFIG_ARM_32)
+# include <asm/arm32/mpu.h>
 #endif
 
+#define PRENR_MASK  GENMASK(31, 0)
+
 #define MPU_REGION_SHIFT  6
 #define MPU_REGION_ALIGN  (_AC(1, UL) << MPU_REGION_SHIFT)
 #define MPU_REGION_MASK   (~(MPU_REGION_ALIGN - 1))
diff --git a/xen/arch/arm/include/asm/mpu/cpregs.h b/xen/arch/arm/include/asm/mpu/cpregs.h
index d5cd0e04d5..7cf52aa09a 100644
--- a/xen/arch/arm/include/asm/mpu/cpregs.h
+++ b/xen/arch/arm/include/asm/mpu/cpregs.h
@@ -6,18 +6,153 @@
 /* CP15 CR0: MPU Type Register */
 #define HMPUIR          p15,4,c0,c0,4
 
+/* CP15 CR6: Protection Region Enable Register */
+#define HPRENR          p15,4,c6,c1,1
+
 /* CP15 CR6: MPU Protection Region Base/Limit/Select Address Register */
 #define HPRSELR         p15,4,c6,c2,1
 #define HPRBAR          p15,4,c6,c3,0
 #define HPRLAR          p15,4,c6,c8,1
 
+/* CP15 CR6: MPU Protection Region Base/Limit Address Register */
+#define HPRBAR0         p15,4,c6,c8,0
+#define HPRLAR0         p15,4,c6,c8,1
+#define HPRBAR1         p15,4,c6,c8,4
+#define HPRLAR1         p15,4,c6,c8,5
+#define HPRBAR2         p15,4,c6,c9,0
+#define HPRLAR2         p15,4,c6,c9,1
+#define HPRBAR3         p15,4,c6,c9,4
+#define HPRLAR3         p15,4,c6,c9,5
+#define HPRBAR4         p15,4,c6,c10,0
+#define HPRLAR4         p15,4,c6,c10,1
+#define HPRBAR5         p15,4,c6,c10,4
+#define HPRLAR5         p15,4,c6,c10,5
+#define HPRBAR6         p15,4,c6,c11,0
+#define HPRLAR6         p15,4,c6,c11,1
+#define HPRBAR7         p15,4,c6,c11,4
+#define HPRLAR7         p15,4,c6,c11,5
+#define HPRBAR8         p15,4,c6,c12,0
+#define HPRLAR8         p15,4,c6,c12,1
+#define HPRBAR9         p15,4,c6,c12,4
+#define HPRLAR9         p15,4,c6,c12,5
+#define HPRBAR10        p15,4,c6,c13,0
+#define HPRLAR10        p15,4,c6,c13,1
+#define HPRBAR11        p15,4,c6,c13,4
+#define HPRLAR11        p15,4,c6,c13,5
+#define HPRBAR12        p15,4,c6,c14,0
+#define HPRLAR12        p15,4,c6,c14,1
+#define HPRBAR13        p15,4,c6,c14,4
+#define HPRLAR13        p15,4,c6,c14,5
+#define HPRBAR14        p15,4,c6,c15,0
+#define HPRLAR14        p15,4,c6,c15,1
+#define HPRBAR15        p15,4,c6,c15,4
+#define HPRLAR15        p15,4,c6,c15,5
+#define HPRBAR16        p15,5,c6,c8,0
+#define HPRLAR16        p15,5,c6,c8,1
+#define HPRBAR17        p15,5,c6,c8,4
+#define HPRLAR17        p15,5,c6,c8,5
+#define HPRBAR18        p15,5,c6,c9,0
+#define HPRLAR18        p15,5,c6,c9,1
+#define HPRBAR19        p15,5,c6,c9,4
+#define HPRLAR19        p15,5,c6,c9,5
+#define HPRBAR20        p15,5,c6,c10,0
+#define HPRLAR20        p15,5,c6,c10,1
+#define HPRBAR21        p15,5,c6,c10,4
+#define HPRLAR21        p15,5,c6,c10,5
+#define HPRBAR22        p15,5,c6,c11,0
+#define HPRLAR22        p15,5,c6,c11,1
+#define HPRBAR23        p15,5,c6,c11,4
+#define HPRLAR23        p15,5,c6,c11,5
+#define HPRBAR24        p15,5,c6,c12,0
+#define HPRLAR24        p15,5,c6,c12,1
+#define HPRBAR25        p15,5,c6,c12,4
+#define HPRLAR25        p15,5,c6,c12,5
+#define HPRBAR26        p15,5,c6,c13,0
+#define HPRLAR26        p15,5,c6,c13,1
+#define HPRBAR27        p15,5,c6,c13,4
+#define HPRLAR27        p15,5,c6,c13,5
+#define HPRBAR28        p15,5,c6,c14,0
+#define HPRLAR28        p15,5,c6,c14,1
+#define HPRBAR29        p15,5,c6,c14,4
+#define HPRLAR29        p15,5,c6,c14,5
+#define HPRBAR30        p15,5,c6,c15,0
+#define HPRLAR30        p15,5,c6,c15,1
+#define HPRBAR31        p15,5,c6,c15,4
+#define HPRLAR31        p15,5,c6,c15,5
+
 /* Aliases of AArch64 names for use in common code */
 #ifdef CONFIG_ARM_32
 /* Alphabetically... */
 #define MPUIR_EL2       HMPUIR
 #define PRBAR_EL2       HPRBAR
+#define PRBAR0_EL2      HPRBAR0
+#define PRBAR1_EL2      HPRBAR1
+#define PRBAR2_EL2      HPRBAR2
+#define PRBAR3_EL2      HPRBAR3
+#define PRBAR4_EL2      HPRBAR4
+#define PRBAR5_EL2      HPRBAR5
+#define PRBAR6_EL2      HPRBAR6
+#define PRBAR7_EL2      HPRBAR7
+#define PRBAR8_EL2      HPRBAR8
+#define PRBAR9_EL2      HPRBAR9
+#define PRBAR10_EL2     HPRBAR10
+#define PRBAR11_EL2     HPRBAR11
+#define PRBAR12_EL2     HPRBAR12
+#define PRBAR13_EL2     HPRBAR13
+#define PRBAR14_EL2     HPRBAR14
+#define PRBAR15_EL2     HPRBAR15
+#define PRBAR16_EL2     HPRBAR16
+#define PRBAR17_EL2     HPRBAR17
+#define PRBAR18_EL2     HPRBAR18
+#define PRBAR19_EL2     HPRBAR19
+#define PRBAR20_EL2     HPRBAR20
+#define PRBAR21_EL2     HPRBAR21
+#define PRBAR22_EL2     HPRBAR22
+#define PRBAR23_EL2     HPRBAR23
+#define PRBAR24_EL2     HPRBAR24
+#define PRBAR25_EL2     HPRBAR25
+#define PRBAR26_EL2     HPRBAR26
+#define PRBAR27_EL2     HPRBAR27
+#define PRBAR28_EL2     HPRBAR28
+#define PRBAR29_EL2     HPRBAR29
+#define PRBAR30_EL2     HPRBAR30
+#define PRBAR31_EL2     HPRBAR31
+#define PRENR_EL2       HPRENR
 #define PRLAR_EL2       HPRLAR
+#define PRLAR0_EL2      HPRLAR0
+#define PRLAR1_EL2      HPRLAR1
+#define PRLAR2_EL2      HPRLAR2
+#define PRLAR3_EL2      HPRLAR3
+#define PRLAR4_EL2      HPRLAR4
+#define PRLAR5_EL2      HPRLAR5
+#define PRLAR6_EL2      HPRLAR6
+#define PRLAR7_EL2      HPRLAR7
+#define PRLAR8_EL2      HPRLAR8
+#define PRLAR9_EL2      HPRLAR9
+#define PRLAR10_EL2     HPRLAR10
+#define PRLAR11_EL2     HPRLAR11
+#define PRLAR12_EL2     HPRLAR12
+#define PRLAR13_EL2     HPRLAR13
+#define PRLAR14_EL2     HPRLAR14
+#define PRLAR15_EL2     HPRLAR15
+#define PRLAR16_EL2     HPRLAR16
+#define PRLAR17_EL2     HPRLAR17
+#define PRLAR18_EL2     HPRLAR18
+#define PRLAR19_EL2     HPRLAR19
+#define PRLAR20_EL2     HPRLAR20
+#define PRLAR21_EL2     HPRLAR21
+#define PRLAR22_EL2     HPRLAR22
+#define PRLAR23_EL2     HPRLAR23
+#define PRLAR24_EL2     HPRLAR24
+#define PRLAR25_EL2     HPRLAR25
+#define PRLAR26_EL2     HPRLAR26
+#define PRLAR27_EL2     HPRLAR27
+#define PRLAR28_EL2     HPRLAR28
+#define PRLAR29_EL2     HPRLAR29
+#define PRLAR30_EL2     HPRLAR30
+#define PRLAR31_EL2     HPRLAR31
 #define PRSELR_EL2      HPRSELR
+
 #endif /* CONFIG_ARM_32 */
 
 #endif /* __ARM_MPU_CPREGS_H */
-- 
2.25.1


