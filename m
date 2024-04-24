Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 292ED8AFFCB
	for <lists+xen-devel@lfdr.de>; Wed, 24 Apr 2024 05:36:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.711031.1110697 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzTQY-0005YP-Cn; Wed, 24 Apr 2024 03:36:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 711031.1110697; Wed, 24 Apr 2024 03:36:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rzTQY-0005WS-8g; Wed, 24 Apr 2024 03:36:10 +0000
Received: by outflank-mailman (input) for mailman id 711031;
 Wed, 24 Apr 2024 03:36:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Z4K=L5=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1rzTQW-0002In-Tn
 for xen-devel@lists.xenproject.org; Wed, 24 Apr 2024 03:36:08 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2415::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c872f204-01eb-11ef-b4bb-af5377834399;
 Wed, 24 Apr 2024 05:36:07 +0200 (CEST)
Received: from MN2PR10CA0023.namprd10.prod.outlook.com (2603:10b6:208:120::36)
 by SJ0PR12MB6926.namprd12.prod.outlook.com (2603:10b6:a03:485::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Wed, 24 Apr
 2024 03:36:04 +0000
Received: from MN1PEPF0000ECD4.namprd02.prod.outlook.com
 (2603:10b6:208:120:cafe::c2) by MN2PR10CA0023.outlook.office365.com
 (2603:10b6:208:120::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.35 via Frontend
 Transport; Wed, 24 Apr 2024 03:36:03 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD4.mail.protection.outlook.com (10.167.242.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Wed, 24 Apr 2024 03:36:03 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 22:36:02 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 23 Apr
 2024 22:35:55 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 23 Apr 2024 22:35:53 -0500
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
X-Inumbo-ID: c872f204-01eb-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nh66hdh8V+MTG1oTqu1QsqHiowAaWj3wP8Dx9Dw18soF0k9bhVbMZbFiNil8E7DqFRpCqtjI2hJTTg+LFnBiqhtRDgQ/I9D7pvR8YcivsfBHizkYcfBBhx67zdQ0ayfRbS6EgoMOqZcAcF3losD2yqPRww4hmUOYxIbhZll1nlOwm00rEde0FEd5Q7kQvi1KH7wFrNwk78S35BEAJs+Dx9+1zHSBvF58MytFQM+tv4xucrHsthzaliHUAdYGAfEo8DQebVjBBxnpQQA2EwG9EzBXCti6ka75gqL6561gTIxM/q/6NF2KT7eBkFzSCeveIvR3JtWcVxdiCuOrxDf7nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xhPYSAm6thH0Vdom9S+qaKObR5KAXalj4mONsm4a1iY=;
 b=Tx97yR0Nwaci2mQu7SHE4ZbiZ3Q2CCNz8VF1eSUZltBTIeqQf720JZuEHLRiQjVQYXUZE0l9bbkkUnzGjqrQIv8IWac7yd2ur2A2jDUMy7EUpK3ObDyO0DyXMUpdXjxc/edfn1HYlkcsvRtS3LTfQihe5wVAc9eLwgblsJo+yFyHFwKPcfGv8uKlEhwUzCFgSb//RsPCyCztMAx7rkGBsnh3k0q0LVeSQta/+qFzM9mc6spRspScLLV8VoxVYLY7IIykNHZ8qUXKCS+q8EESMUkeAtkdiZ/clNEdpp4Jk3SzYki7HwtdqML5qoMkCnhvH68ijyLzuiaSD7M0ry9/ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xhPYSAm6thH0Vdom9S+qaKObR5KAXalj4mONsm4a1iY=;
 b=JiXge333vWlS6NWGQC6pRjlZppIhuiR6f/SjIuknUm7kUB9MG8W0PpJsdY+kIRfQMHfxzAu55itqNRZ8dkdCot+JLSyWt6Ir5ACYMMwgzoEOSa1xBa0tzT0lzG2gfRtdcB8+YMuFV6djfUGGgDKnUtTB7jsBPB8aF+GoQ3fMHGo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Vikram Garhwal <fnu.vikram@xilinx.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Stefano
 Stabellini" <stefano.stabellini@xilinx.com>, Henry Wang <xin.wang2@amd.com>
Subject: [PATCH 09/15] tools/libs/light: Modify dtbo to domU linux dtbo format
Date: Wed, 24 Apr 2024 11:34:43 +0800
Message-ID: <20240424033449.168398-10-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240424033449.168398-1-xin.wang2@amd.com>
References: <20240424033449.168398-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD4:EE_|SJ0PR12MB6926:EE_
X-MS-Office365-Filtering-Correlation-Id: 28364718-01ee-4f1e-42f2-08dc640fab39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?J7IsustZMSCek2kjzRpaPM5uJuakFp5k2JeJfuBN51ZXIqwNZjyKA0q2CEVO?=
 =?us-ascii?Q?+Lg+n+yCTIM9DAZ86HAg6068z4NDI/dVr2ImL3sTJ3dCnf/++J5fQQAX50at?=
 =?us-ascii?Q?O3CKyaEr9shmW8fH8pY6hl9svpVgQxDPnIRWBe1TA9LvjcPxa94KE36TwWMi?=
 =?us-ascii?Q?PsDvJ8tqpKBtpwWmpqyQKWLzKKQz03W4UZsNlIEFZs5w+FRsvhFyca4EW9kL?=
 =?us-ascii?Q?z3rXvUOAlVTm7KIm8QUXGJojjRfM0Pr8fbtLKC/se0CVyd92d2Lk91j39WJB?=
 =?us-ascii?Q?B18/U5E58jfrxCYxzL6q6bFHP3Yt3t2A7R5RuyD0NFrF/7AK77TcKufKMa6A?=
 =?us-ascii?Q?i2rp6yi7QorUu0K5+TZYIC0TViC4/QNTFgnUhmIAILB6NVABdldDvytwTLnP?=
 =?us-ascii?Q?LFSt7JNswii15tqUDIQ79vXLuFIlSP40tjxmFktKclrFcjIHY+MghD8horxw?=
 =?us-ascii?Q?kkbvNVMlQK09LEQ06wLdEYcB0U0POi63nHqRS/4hFJ7HmMsySCKOqNMxJRUl?=
 =?us-ascii?Q?EoQZnaLEiIpmJy+OXZNdNA269UxiPzf21RqQ1zPjeu44AIpBZBy5F4neA3zy?=
 =?us-ascii?Q?BRnNqqbER4SQK4csinmbPhOluOWQBmucIN7AzLcnEIeHLpULv23HcZKPwNkE?=
 =?us-ascii?Q?g6PDlDWdJg6ShdZn/MbqJoa9CxX9ua/6LMHz0EqlQSjjd4Dhg3ColUvjvu8K?=
 =?us-ascii?Q?5k0VXAd39zLHNjdTHtHwh4WruzFBpQThkfu3oMc5u02K+/I9H2EyO9dqnlTc?=
 =?us-ascii?Q?6kTUakvMXByRCZfwoGoSAq7ssxnzlgUCiIh0hZzIyfXK5QpdfkvUmYYkSHr5?=
 =?us-ascii?Q?8br7/lyfFGcNuxf1ognT2QRZxkq69xWzgdTBm3AceczW7NdSD/PAX7JIWXrc?=
 =?us-ascii?Q?ZNeUC9qiU9GqoY5EWHWxu1/zhxfDLoUUow7rd2kyHM6bF8nPzgD0bx3mMXha?=
 =?us-ascii?Q?AmyFtp2HCg8LjH3KUnJzBLqLd2dc2rNlYT1LCsXDrCysMm62smcwmhyEPGkW?=
 =?us-ascii?Q?UxUfUOA2lTMcMYClk7v2x4Wjc0VB4YUC/zlTD1KtMWwiceBUWxdUSRzan9X0?=
 =?us-ascii?Q?F2/zKOkYbDKg7c4mJw1qewk89PeZN8fE41uad2Eoi+kLWqgcb8RMy/mosGzs?=
 =?us-ascii?Q?h20QjA/tlC9WuMxLu1HgANjFi67tntUF/ZkphmvEdtAc4Cyk3lct3kPJ8ooP?=
 =?us-ascii?Q?UlcRB2z2SjiZPFp77J42PxLh7cKHl7ZnDRm48+MeqnmhE6+lePHFn7tYWhnH?=
 =?us-ascii?Q?rxxO9nmuze3IcV1SnSQV7WL0ZyeZK/dJt+a9KI1zoQ/whS9uxI0CWV1sfqvg?=
 =?us-ascii?Q?3XOzuW7p1qd8ymnEByuHcZctdTZor7je6d47CLf4j9kMVplzMrzQaGghFJzU?=
 =?us-ascii?Q?IHEkb1ASl2D1k0u4ECWZY371Mc6t?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(82310400014)(1800799015)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2024 03:36:03.4867
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28364718-01ee-4f1e-42f2-08dc640fab39
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6926

From: Vikram Garhwal <fnu.vikram@xilinx.com>

Add support for modifying dtbo to make it suitable for DomU Linux. This is
done for '-e expert' mode.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
 tools/libs/light/libxl_dt_overlay.c | 73 +++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/tools/libs/light/libxl_dt_overlay.c b/tools/libs/light/libxl_dt_overlay.c
index cdb62b28cf..eaf11a0f9c 100644
--- a/tools/libs/light/libxl_dt_overlay.c
+++ b/tools/libs/light/libxl_dt_overlay.c
@@ -17,6 +17,7 @@
 #include "libxl_internal.h"
 #include <libfdt.h>
 #include <xenctrl.h>
+#include <xen/device_tree_defs.h>
 
 static int check_overlay_fdt(libxl__gc *gc, void *fdt, size_t size)
 {
@@ -41,6 +42,69 @@ static int check_overlay_fdt(libxl__gc *gc, void *fdt, size_t size)
     return 0;
 }
 
+static int modify_overlay_for_domU(libxl__gc *gc, void *overlay_dt_domU,
+                                   size_t size)
+{
+    int rc = 0;
+    int virtual_interrupt_parent = GUEST_PHANDLE_GIC;
+    const struct fdt_property *fdt_prop_node = NULL;
+    int overlay;
+    int prop_len = 0;
+    int subnode = 0;
+    int fragment;
+    const char *prop_name;
+    const char *target_path = "/";
+
+    fdt_for_each_subnode(fragment, overlay_dt_domU, 0) {
+        prop_name = fdt_getprop(overlay_dt_domU, fragment, "target-path",
+                                &prop_len);
+        if (prop_name == NULL) {
+            LOG(ERROR, "target-path property not found\n");
+            rc = ERROR_FAIL;
+            goto err;
+        }
+
+        /* Change target path for domU dtb. */
+        rc = fdt_setprop_string(overlay_dt_domU, fragment, "target-path",
+                                target_path);
+        if (rc) {
+            LOG(ERROR, "Setting interrupt parent property failed for %s\n",
+                prop_name);
+            goto err;
+        }
+
+        overlay = fdt_subnode_offset(overlay_dt_domU, fragment, "__overlay__");
+
+        fdt_for_each_subnode(subnode, overlay_dt_domU, overlay)
+        {
+            const char *node_name = fdt_get_name(overlay_dt_domU, subnode,
+                                                 NULL);
+
+            fdt_prop_node = fdt_getprop(overlay_dt_domU, subnode,
+                                        "interrupt-parent", &prop_len);
+            if (fdt_prop_node == NULL) {
+                LOG(DETAIL, "%s property not found for %s. Skip to next node\n",
+                    "interrupt-parent", node_name);
+                continue;
+            }
+
+            rc = fdt_setprop_inplace_u32(overlay_dt_domU, subnode,
+                                         "interrupt-parent",
+                                         virtual_interrupt_parent);
+            if (rc) {
+                LOG(ERROR, "Setting interrupt parent property failed for %s\n",
+                    "interrupt-parent");
+                goto err;
+            }
+        }
+    }
+
+return 0;
+
+err:
+    return rc;
+}
+
 int libxl_dt_overlay(libxl_ctx *ctx, uint32_t domid, void *overlay_dt,
                      uint32_t overlay_dt_size, uint8_t overlay_op,
                      bool auto_mode, bool domain_mapping)
@@ -73,6 +137,15 @@ int libxl_dt_overlay(libxl_ctx *ctx, uint32_t domid, void *overlay_dt,
         rc = ERROR_FAIL;
     }
 
+    /*
+     * auto_mode doesn't apply to dom0 as dom0 can get the physical
+     * description of the hardware.
+     */
+    if (domid && auto_mode) {
+        if (overlay_op == LIBXL_DT_OVERLAY_ADD)
+            rc = modify_overlay_for_domU(gc, overlay_dt, overlay_dt_size);
+    }
+
 out:
     GC_FREE;
     return rc;
-- 
2.34.1


