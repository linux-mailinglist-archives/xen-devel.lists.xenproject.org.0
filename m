Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 837E7A888F3
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 18:52:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950904.1347084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4N2K-0007QH-Pr; Mon, 14 Apr 2025 16:51:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950904.1347084; Mon, 14 Apr 2025 16:51:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4N2K-0007MI-MG; Mon, 14 Apr 2025 16:51:56 +0000
Received: by outflank-mailman (input) for mailman id 950904;
 Mon, 14 Apr 2025 16:51:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GQ8q=XA=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u4Mx1-0003ls-Lw
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 16:46:27 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20625.outbound.protection.outlook.com
 [2a01:111:f403:2408::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 00cbdb30-1950-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 18:46:26 +0200 (CEST)
Received: from DM6PR07CA0055.namprd07.prod.outlook.com (2603:10b6:5:74::32) by
 IA1PR12MB7517.namprd12.prod.outlook.com (2603:10b6:208:41a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Mon, 14 Apr
 2025 16:46:20 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:5:74:cafe::28) by DM6PR07CA0055.outlook.office365.com
 (2603:10b6:5:74::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.33 via Frontend Transport; Mon,
 14 Apr 2025 16:46:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001708F.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 16:46:19 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Apr
 2025 11:46:19 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Apr
 2025 11:46:18 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Mon, 14 Apr 2025 11:46:17 -0500
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
X-Inumbo-ID: 00cbdb30-1950-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r2Ss3YpbaX2r/31bF47lv3jwZZlIGmbBpue2MxX/wuZ/R8OTdQU1O18n+s8oMvAc+Acs7njsIAjc4tOyNDVD0+W+JPODvgPH3bxYV8wSuVB0j+eXHH5c4U7t2iqYIzgqsOarIE7AMaysbKpyec787+jHD7zbL0d1Q3THBcbhmsnAd4KjFm6O6HVS1ZLwWbsiWBJsyOuRBgX6ZX2c30WaHr635SIbkq96cy0dRBKfozYqcfIbAjGamV/CuXN3627l6sQpFj05xlInleT5q+GulFqwPew8jJBhrOgz0jljHAhCtpWt/pbqQQ975SsbeYqd0RSn6NRRmdm93yw0/jXiqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jPXfW0xKjKPyqHJAGBnbbDaBbiWamWXqAsxKqj91BhA=;
 b=QhU3u8IZuAbyOjM0LDz82UQpAE2ZvZVDpoPpnrh9N/QHHb81izkp3WXw0i0sMNVZAlgahvnTcq+x2lve6nKg/jJFErCBR0dbhULZXefO3Ur0zEb5Rs+fgiSmE1r6ImcdhD219nYKZAZ9XYPaibxFodh04r/8fMI9QBMX9Fqda9LA8eiK61woKDQOIZHYvspOFa16nCv57hVzTA0D+QYkg1yzdvxpf5YKpl1Dk0zlEzHbbc3vJMeAhVcvQDjnG6eQGz3s5C4xV296vDWRlMi6cnKLBa944OA3jqdrWBafTbNPqWkJJcqnCWSu0mFX7DfW9awvsoLJMjxGyhgmiTPi3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPXfW0xKjKPyqHJAGBnbbDaBbiWamWXqAsxKqj91BhA=;
 b=XRvD8q8p3XiPVG9AzJBPIdL+ASA88+zL7+3qAMmRVc5xNAQm86MTA3D3XMJQC7Bf4KBtD5dWicdkoZxsf7MlvHR2WGJ043H7LMvfLT0fTX6vTz/Fx71Gz9o7aAPgEfbpj8LrC26AW5QzPMEi6ktjhe3f8HoeIh1094/2dFUKxds=
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
 Babchuk" <Volodymyr_Babchuk@epam.com>, Luca Fancellu <luca.fancellu@arm.com>
Subject: [PATCH v7 3/3] xen/arm32: mpu: Stubs to build MPU for arm32
Date: Mon, 14 Apr 2025 17:45:14 +0100
Message-ID: <20250414164514.588373-4-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250414164514.588373-1-ayan.kumar.halder@amd.com>
References: <20250414164514.588373-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|IA1PR12MB7517:EE_
X-MS-Office365-Filtering-Correlation-Id: c95b6a67-e794-4456-b78e-08dd7b73e20a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0wkXQu5cACHti+AAXt0zUw900QM+d8nhjryWCSdTMXlHNIduPImX9wlknkCD?=
 =?us-ascii?Q?X+T1JreHtTWfR6I1OLKoODYXSxaEKsCyeoc3rvXJnHr1vfP7CbteRbUrfAgq?=
 =?us-ascii?Q?o4G4L4PXqsuM0uloLg8JC0QdPs6EFTUhJRwuBOqmpQYhvT+r+g9rtoy27XaV?=
 =?us-ascii?Q?MmWPM7UY0zGmxvsfL2RUEu+64qgf1/YD86MEXzL6ZjXQ8gyOHkl9cQuHiqhT?=
 =?us-ascii?Q?4wmOjOQi+dFMDNB+jjAZlhKy5WfgfesxkJBv8cR3boDcKvgOq7KrmOV6BRk9?=
 =?us-ascii?Q?4QeQ4drJblhk2uOgv6xxPepTc1WEoVG2mKEJiSyy/e/JkVn8uF1Cmee3rKow?=
 =?us-ascii?Q?pI3QSBViSul6+O9GsBKLPEAo6OMU9ApCLry9t693q8fcKWUjLQphPxxu/gYZ?=
 =?us-ascii?Q?V08sR37DgEGS9oPnKXmZOnIyp0Z45Kv8nNHa+KYJNSkNrKVQHHfRtFLd2MpE?=
 =?us-ascii?Q?FDX42WMHcqhnG/aChwA5V7UvI468tP0/BcbvjfuD9kmqhW0IqYziTjbZZVvq?=
 =?us-ascii?Q?6oMbCb0PVAVqzuBriOcmLA1A+byNdIMd9EqPze3I/0/Sj7njgGeErCsFQ7g5?=
 =?us-ascii?Q?GYuI6X+NkmEXWMPkBJv+jRvMoLloL4EbLEoLQpA7vbZDfpRgNZDHnmtrZRdc?=
 =?us-ascii?Q?nj7Qs8Gjbvshnp2uQFMQ1qWEwX1X7t5XSIc4bCVwM1K5mPsRDRggLmeuCM1d?=
 =?us-ascii?Q?egDJPoAzLgA0BtwjvgAcEn1tOwwUvQW4yh9jqdXQtmWzw6JWTClkq/e9IvM+?=
 =?us-ascii?Q?uz4HGER8Aw0mHdtFcAz3eLkkIEsdSKUcSJ+TN5ypqDjod4+aygVbiSdfn4XK?=
 =?us-ascii?Q?vS8CosrT0d5j6mcMJNWed5v8BjK/eZU5bqKZqr9uFhJjfcLN3OA6Wo3au1ed?=
 =?us-ascii?Q?/7gjzKb66fbOhIZHgmscnujOiFiW8LlFE+I/NvkLSSLMpL2HZ7C64G6XmV2X?=
 =?us-ascii?Q?aKca9nvqHVQLATc58fEmXpMLy1MH9ItgVEIKPOZsogKGDMx9dTp3FpqABUTW?=
 =?us-ascii?Q?FEY7HiqXdNZmUo5pJIxytBvLEqw1PgkyCBHUZFafSRXoXsMv0FGydbwriz8J?=
 =?us-ascii?Q?TxSlpQppAZCI2gOIlG2gSbFuERnpkZ8ftM5JAkLuij0fN2O/1/ImQa63Z1Du?=
 =?us-ascii?Q?zdTa8AjsxPByOiUiKKVu46wRVXrWAS0WNfVT70Mpe1DIuYK0nyZIhJ3FbVvt?=
 =?us-ascii?Q?FeHOgjnffrp4zmaD9wqtZZvO1Ic3lS9hxg7CVgah7Se4KWYjRhv+3g9py21u?=
 =?us-ascii?Q?CKaNRBtfF93FgFrdVR40dH1ya6uvjjmZ6usa4ay2rkuAo+/TQg6zAmsvNVAE?=
 =?us-ascii?Q?3XxVvgu2ht7clUwrUeZLUhJ+XhZrNLwIFo2QGMXHhv0ViTk8l4/xmz19kkbr?=
 =?us-ascii?Q?Dsbf//FZ/W+6tUQAqhRRs/KA7Tchd6U1Wef/b5xq6Y/H3yXOuKfCbENOwlgT?=
 =?us-ascii?Q?U7FXkGRCdf200NdCQhsdYvMvQIl+rz0jzz1kl0SjWjSWOtI/+lfE+a9EZTSb?=
 =?us-ascii?Q?9jNbzX65YeDW4yymWHEmvLZBTrGgJtCqQCrwGnbcjfcbnLsyG2v/bue3nA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 16:46:19.9349
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c95b6a67-e794-4456-b78e-08dd7b73e20a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7517

Add stubs to enable compilation.

is_xen_heap_page() and is_xen_heap_mfn() are not implemented for arm32 MPU.
Thus, introduce the stubs for these functions in asm/mpu/mm.h and move the
original code to asm/mmu/mm.h (as it is used for arm32 MMU based system).

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Tested-by: Luca Fancellu <luca.fancellu@arm.com>
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

v6 -
1. Add R-b and T-b.
 
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
index 0000000000..df5e06b6db
--- /dev/null
+++ b/xen/arch/arm/mpu/domain_page.c
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
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


