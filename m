Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6784EA7A86F
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 19:13:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936978.1338096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0O7p-0006XV-Ni; Thu, 03 Apr 2025 17:13:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936978.1338096; Thu, 03 Apr 2025 17:13:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0O7p-0006Tv-I2; Thu, 03 Apr 2025 17:13:09 +0000
Received: by outflank-mailman (input) for mailman id 936978;
 Thu, 03 Apr 2025 17:13:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+EW4=WV=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u0O7o-0006L0-RM
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 17:13:08 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20603.outbound.protection.outlook.com
 [2a01:111:f403:2009::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8380067-10ae-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 19:13:06 +0200 (CEST)
Received: from MW4PR04CA0341.namprd04.prod.outlook.com (2603:10b6:303:8a::16)
 by CYXPR12MB9425.namprd12.prod.outlook.com (2603:10b6:930:dc::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 3 Apr
 2025 17:13:02 +0000
Received: from CO1PEPF000044F0.namprd05.prod.outlook.com
 (2603:10b6:303:8a:cafe::ca) by MW4PR04CA0341.outlook.office365.com
 (2603:10b6:303:8a::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8583.41 via Frontend Transport; Thu,
 3 Apr 2025 17:13:02 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F0.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Thu, 3 Apr 2025 17:13:02 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 12:13:00 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 3 Apr 2025 12:12:59 -0500
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
X-Inumbo-ID: e8380067-10ae-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zAa8UVDK5p8n3Kp3/Tcj3dChSMFgSIS8fpMjuDgGGj6SBAUwRTu/fJc6tNLHIXKO/xgbEix+FKeHeQ3XmZTk1FWLQ20j+o0WM5FjB/eaBe1jaccdRVYl69/4xJW5VDYgeqizOmLlZS+en5vM1d+FD07P9HwV83VhMWcdkFO1eszVksDfkm4+oqV3YnB76HKp0Lpts812ipCq7YGzJT1lL7WT/aW8CP6QoV6ULSeeh/RMe6DP1d2TN/tdbzQ30qzlRxjqfZ+0QCpjqgZ4F+Sbf9OU94+J0Nhci8rSaFc8G6r+A0G1dyk3yoClN9KzEwwN23xu/RsQVSBac6hR1KYe9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LFxRm3vAxLemsPGaMdn1gRfz+lxEXXhaQLxo4JEHLaw=;
 b=h1ABOHVYp3AqpAl47Han9h5Mpcd3gitvijyETS6MBNh4T+1P1dSBtD9fsqgvqyC61rz9BBWYNaMEMlM5rnvmn+hkBn7rV0fOQPjzbMuZKQq2R1ul2LEpafDIv3c9bydDDRiEhcWV9kxjnr7k9yew/bgHJuOfZPH7OjHeSi5rz3RUeNTqGBW/iRG/a77OKsclR9NNua6GDXPdT5wLAQurcCpis6mTChe4Udw9e69KKUB3okIGAkSIHYW0GZcZLT49VdkxFM0nMHOXncCQ6ots81o88Up7Js3WI5hIlAk5D0LWSt6kMr6XI3AlGX+PQn38odRgh4yRcgRAeJ2QhqDyow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LFxRm3vAxLemsPGaMdn1gRfz+lxEXXhaQLxo4JEHLaw=;
 b=fgyQUcgvt9wy9jOaC46DGS32yAoxCHYsvIIv3ga+kmT+LI5r+qZbQOBFYF/gjsAq/SM/XuoQN8wWHOuAOiEnveNT9QwZDkB+x90wIpPIivbBbtLz63KsBOL93KgOusirZgUv4Nl5WjPQogSqy5uUIaHOT5QlfcsyO27XKDFxI14=
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
Subject: [PATCH v4 3/3] xen/arm32: mpu: Stubs to build MPU for arm32
Date: Thu, 3 Apr 2025 18:12:41 +0100
Message-ID: <20250403171241.975377-4-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250403171241.975377-1-ayan.kumar.halder@amd.com>
References: <20250403171241.975377-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F0:EE_|CYXPR12MB9425:EE_
X-MS-Office365-Filtering-Correlation-Id: 862b974f-9f7a-4d42-5303-08dd72d2ca9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uloNzALX8F/VGB8+8su6jVSsMKSlKErxVqlYBO2tzXTza5ov1yNHDcsm0Zoj?=
 =?us-ascii?Q?DLnM7WDFwyK28ti/bI09solcczbjka/S7eWXPfU04ddqHsRdt44lQcY3y7fK?=
 =?us-ascii?Q?tKqsKW7/5nVSt36tnUq8/ObKEQYRRqqAkzoCJNCFZGe6QXkZWs0govF4trhZ?=
 =?us-ascii?Q?eMUAthTgkxUSycwkJHnzYvdnHQiwkZ2BbntNCMdCqtfLERbeOzSGhhYE14DO?=
 =?us-ascii?Q?yyd7FGy9i4cPQcq6b47NmSIh3hzROEUao6ESoVFrxHLxXqBBE6HuIwz7OAXx?=
 =?us-ascii?Q?wdUJXcpjeEv/F+oThp4wKyw2Zja2IdgQ0ujwVgx7h6kYWIQrwdE3apfk/qv6?=
 =?us-ascii?Q?3qoXFwwgsebou9YrLTdMlkCny4BlJpMBKRGtVFefOfY+26IE/+kr4c9ZVWp+?=
 =?us-ascii?Q?tdTAA5pDikqw40Y4BsGg+iamPGnvrMWOtqRaTar/xVsymxNFnFu5t1FqyfS3?=
 =?us-ascii?Q?30xfT+EljJOIHFv4YkVZmTWeejKoTHspZCIMRrCBD+pvS3PtzZCOi+eF5UC3?=
 =?us-ascii?Q?Y/q5b3c2N0xehqctsPywZFfdHBoA2p4n9CuaQyz8bjRcqfq8c9ryWBrgv/yF?=
 =?us-ascii?Q?ltv+V6RQ40E9DgVytHi0t4tWmJUUdWs9ImZ2JD7majtMuYzli+EnmK27NB5n?=
 =?us-ascii?Q?4YR02wriYuHj4b5hGmfUycRm98VFXhEJRwdU0IWpgK4d/ngcvygjm2/7zogA?=
 =?us-ascii?Q?H5zh2sKINRm9QV54GYF+3hvw0JAsi+mcfDsD+1iDAl89nse0LZTq6F3y8Efo?=
 =?us-ascii?Q?hUM+jsVeeROjhLEVeUoarsOC6k+qpTWZjkjaygJSlLyP9bNIeiadjjxMCBjl?=
 =?us-ascii?Q?kyZ1ejHDM1Ibf9Lb5LDL23cm2i9NQPs+aN512sY4cfgAkwtorzzchQ96b2xn?=
 =?us-ascii?Q?hQep8oHsJZH2B3oAmvhsC8B76JwxaLJlu07419bQ61lFd2DAiVd8JnKNcuPP?=
 =?us-ascii?Q?68OEDfGuPRiGqn5qzypVg5TbF4KnQk7ZPPQUCQuMa26KhryN4VN7SszAEyRS?=
 =?us-ascii?Q?EyhEJFj6nDTC4JwOK3fZCoBB4UaaDcJ1olUaVAzoQHm8+YxlNvxaBbD3sWAF?=
 =?us-ascii?Q?CPVFKYkn3x80hdSCJm7bewbG5Q8/4SlDxr5bMsYrOZVOfDmhCZFkWPKdPWtw?=
 =?us-ascii?Q?ByRKPtFmSPdF1eghBztDYfBkcf/V3nVxWztXq7TPbjGcuyZCEPuSl7J3auW5?=
 =?us-ascii?Q?GGB/MWdSDsaxLtl8ckyauBvJkR30AcC4vvulnLl0cZy4NT1cmDMGD0o9fSkz?=
 =?us-ascii?Q?QnDZ7UfpEOprgulzT0cUNs/ikcE8HTuhMe3CZiVBSN9QV5ZhcDXdSqZBywFX?=
 =?us-ascii?Q?4KSB2YyqeQ9MwMMUUt2mU5hN6lIqlTSdMfgUg5YUEqkx7zoceYI1wvIxEkmR?=
 =?us-ascii?Q?f2c6BzJAUf/MqnOn9tcAypD9bUD9feBRpDA3CKsYQnAEa0i13nqvUFl1ngx6?=
 =?us-ascii?Q?EYDYeC79SOj13Y52gM2qLydqDjQL5LussWlyFRF2ysewcqtsnDbyp/ggVKUh?=
 =?us-ascii?Q?NSQskDvS+RwY5Zk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 17:13:02.3013
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 862b974f-9f7a-4d42-5303-08dd72d2ca9c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9425

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

 xen/arch/arm/arm32/mpu/Makefile  |  2 ++
 xen/arch/arm/arm32/mpu/p2m.c     | 18 ++++++++++++++
 xen/arch/arm/arm32/mpu/smpboot.c | 23 ++++++++++++++++++
 xen/arch/arm/include/asm/mm.h    |  5 ++++
 xen/arch/arm/mpu/Makefile        |  1 +
 xen/arch/arm/mpu/domain_page.c   | 40 ++++++++++++++++++++++++++++++++
 6 files changed, 89 insertions(+)
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
index fbffaccef4..2a52cf530f 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -171,12 +171,17 @@ struct page_info
 #define PGC_need_scrub    PGC_allocated
 
 #ifdef CONFIG_ARM_32
+#ifdef CONFIG_MPU
+#define is_xen_heap_page(page) ({ BUG_ON("unimplemented"); false; })
+#define is_xen_heap_mfn(mfn) ({ BUG_ON("unimplemented"); false; })
+#else /* !CONFIG_MPU */
 #define is_xen_heap_page(page) is_xen_heap_mfn(page_to_mfn(page))
 #define is_xen_heap_mfn(mfn) ({                                 \
     unsigned long mfn_ = mfn_x(mfn);                            \
     (mfn_ >= mfn_x(directmap_mfn_start) &&                      \
      mfn_ < mfn_x(directmap_mfn_end));                          \
 })
+#endif /* !CONFIG_MPU */
 #else
 #define is_xen_heap_page(page) ((page)->count_info & PGC_xen_heap)
 #define is_xen_heap_mfn(mfn) \
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
index 0000000000..b9ebb03d67
--- /dev/null
+++ b/xen/arch/arm/mpu/domain_page.c
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#include <xen/domain_page.h>
+
+void *map_domain_page_global(mfn_t mfn)
+{
+    BUG_ON("unimplemented");
+    return (void*)0;
+}
+
+/* Map a page of domheap memory */
+void *map_domain_page(mfn_t mfn)
+{
+    BUG_ON("unimplemented");
+    return (void*)0;
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


