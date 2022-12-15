Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB2D64DDC4
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 16:26:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463500.721696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5q6y-0002c5-36; Thu, 15 Dec 2022 15:25:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463500.721696; Thu, 15 Dec 2022 15:25:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5q6x-0002Ye-W9; Thu, 15 Dec 2022 15:25:27 +0000
Received: by outflank-mailman (input) for mailman id 463500;
 Thu, 15 Dec 2022 15:25:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GeMf=4N=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1p5q6w-0002YW-9M
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 15:25:26 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2064.outbound.protection.outlook.com [40.107.244.64])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b179933b-7c8c-11ed-8fd3-01056ac49cbb;
 Thu, 15 Dec 2022 16:25:24 +0100 (CET)
Received: from MW4PR04CA0379.namprd04.prod.outlook.com (2603:10b6:303:81::24)
 by MN0PR12MB5809.namprd12.prod.outlook.com (2603:10b6:208:375::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Thu, 15 Dec
 2022 15:25:20 +0000
Received: from CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:81:cafe::23) by MW4PR04CA0379.outlook.office365.com
 (2603:10b6:303:81::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12 via Frontend
 Transport; Thu, 15 Dec 2022 15:25:20 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT018.mail.protection.outlook.com (10.13.175.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.12 via Frontend Transport; Thu, 15 Dec 2022 15:25:19 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 15 Dec
 2022 09:25:19 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 15 Dec 2022 09:25:18 -0600
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
X-Inumbo-ID: b179933b-7c8c-11ed-8fd3-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LauGDEFj6Z4CYADUuQ5eozh3cVXb7gSKRvEtWMPfJ/rotAXD1N6SHjdIVWpROhRTo3I3VDfQjNwHRSX1WjdPBJ+aAsekiFL2MDawOxOo3yIb+c7RpdTk6O7mZMpwZuVRwbp/ZpMDcKLv9h7reeXfHS0ZxG7ieiFhSgXQa5NSyQsk5m0b2nLWaklq6PEMFXQ+JF4xr/TMDkaojb7n4d77/dYiEHZd7Y0QN0puo6JCbMVgnHQOo31UoIOiTV9x9P2kLaPJBoBOayRUeRa0KFZQb7pqScd1u1EytUrb7eF1btNM5gOdnxc56LJhUgHUHtswpgWj4BNHZ9iep5pqPb9x0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3XlbtZruErX/F852tDI5lPA5tVHZaixEiTW1X4sFrHI=;
 b=F11ftwJz4KXRU/7WIop6LzZjdPpuDyje/R3JkyE3UnvQJxG4s5odtwCV5nnd8GlANgJL2ZERJ80Old0lAK/hIisFtFIgHzb5hVLtQkp9WmwJqDcACFw1Slvq82EvSM3VVjUGxoWFlCceTrV7VdUlKbw1lWXuqtaDCvj9mX3lGaAb/kSVwBsGvF5dY56cbyiKjtTQ2HpN1ige0JMrk6HUii77/LrWPPO/OiZ4IiSHCSz0crofdwuDL80UIYw6ZNgeu3foYF0L+5N0ZpEFxF3uFhR0tI6QH+f5fbkph2FR9Xs3HTr0H5A1nJzEcdTvSbZECXJrGBq4IWhkKGcdhloLUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3XlbtZruErX/F852tDI5lPA5tVHZaixEiTW1X4sFrHI=;
 b=vnm/P+LhOyyEin3xLV/ygtf9sgn0oESduTQq4kTrSYCcXyHvn/tySd2vUmNNSXFfPU1uzh2NG/d1xW+PSvuF5G6WuQXK/wWZ6wl44cFUOT7OY84Y5Qb0LLACahe+C8xxi10pwiaFryL/kisauy6ze7oMVNXnGGeAN1pPU1Qyf60=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>
Subject: [XTF-ARM] tests: Hypercall xen_version testing
Date: Thu, 15 Dec 2022 16:25:11 +0100
Message-ID: <20221215152511.10194-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT018:EE_|MN0PR12MB5809:EE_
X-MS-Office365-Filtering-Correlation-Id: fcaedc52-9b09-4e8f-9eea-08dadeb093b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T5t0c6GlEiycoZmzzFHtfZCFBD6eEj0zWh6oukxTSg8myjB1KUi5bZr8gEHH80Ag9kwLTOPw66KcIBYuugQlSlLrhOjbtVnkyRxsJZ3bZ42e7BYSLQaCGB7/MBhDAbSQng8GxTVPwu8bILQi0pRtVE0Xrj++nxAXfXVlo2AEvuPxsiH0IT8blJdW5SXazgfdulwdho7as7Cfhb5/42tNJiCfBkhG3Y92OyPb417X0wEP6JioBir6nADeyhlf7e5hj+WTlKGxu6sGlAO9epyeZGXaI0OeIkhp0ayxsONBQH10GNCV1MwCQqeV2zz5Qksx5NEPa4XmotuzTR60Lw0Fr/+IPzaldGI70w8rCp7TNxtImpARqc4UXyik7ckFqIg8GMITC/C7s0348PyE2/Ro6OLYdNO4wIHLwzZP1sz9dUsUZGPa13E/UmpteT76HHkKJZqMZ4QBclEvzKNpmRru0NjK7v3ftvKEUsPq70L76JAw1B8h9oQ75sBcvD3t0d5PGD/wlBzRS3rIYkR+vLpJqqyZiGkhlK9MsBJVmlaokSrzFkfQXfzGSXRqbm7ij42XRA6nXn11AKHeIUUfzE3fmRKt7BfFb+LoPunwlWaP9rdaRKEMmxUsHxq4f3PINjRQYO+fVA+QQ9kz8FWh1J8DVjnHR1c0/pgPJcOZKlBhvkUf5LEqaK5WzDg5EN62ggeDg9ThRtkPhaEuZ7dIH7N0bBgMOOzada8XLyA8IDAYRQ/BUv+oH6eOHy+ZaZWytFfIujELPvddo9Z6eszRLIBjAQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(396003)(39860400002)(451199015)(46966006)(40470700004)(36840700001)(2906002)(86362001)(44832011)(2616005)(54906003)(36756003)(8936002)(82310400005)(6916009)(36860700001)(316002)(26005)(70206006)(4326008)(8676002)(70586007)(41300700001)(81166007)(1076003)(5660300002)(426003)(336012)(83380400001)(186003)(966005)(40460700003)(478600001)(47076005)(82740400003)(40480700001)(356005)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 15:25:19.8482
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcaedc52-9b09-4e8f-9eea-08dadeb093b4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5809

Add a new test hyp-xen-version to perform functional testing of
xen_version hypercall. Check the following commands (more can be added
later on):
 - XENVER_version,
 - XENVER_extraversion,
 - XENVER_compile_info,
 - XENVER_changeset
 - XENVER_get_features,
 - passing invalid command.

For now, enable this test only for arm64.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
This is a patch for XTF fork https://gitlab.com/xen-project/fusa/xtf
(branch xtf-arm) under which XTF on Arm port is maintained.

Pushed to xen-devel together with patches to Xen CI automation, so that it is
clear what the test is doing.
---
 build/arm64/arch-tests.mk      |   2 +-
 docs/all-tests.dox             |   2 +
 tests/hyp-xen-version/Makefile |  10 ++++
 tests/hyp-xen-version/main.c   | 105 +++++++++++++++++++++++++++++++++
 4 files changed, 118 insertions(+), 1 deletion(-)
 create mode 100644 tests/hyp-xen-version/Makefile
 create mode 100644 tests/hyp-xen-version/main.c

diff --git a/build/arm64/arch-tests.mk b/build/arm64/arch-tests.mk
index 1a13ba923625..c85e28bbea9e 100644
--- a/build/arm64/arch-tests.mk
+++ b/build/arm64/arch-tests.mk
@@ -1,4 +1,4 @@
 # Supported tests by arm64
 
-# Currently only example test is supported
 TESTS := $(ROOT)/tests/example
+TESTS += $(ROOT)/tests/hyp-xen-version
diff --git a/docs/all-tests.dox b/docs/all-tests.dox
index 322f078db09e..48a407593463 100644
--- a/docs/all-tests.dox
+++ b/docs/all-tests.dox
@@ -20,6 +20,8 @@ and functionality.
 
 @subpage test-fpu-exception-emulation - FPU Exception Emulation.  Covers XSA-190.
 
+@subpage test-hyp-xen-version - Hypercall xen_version testing.
+
 @subpage test-invlpg - `invlpg` instruction behaviour.
 
 @subpage test-lbr-tsx-vmentry - Haswell and later LBR/TSX Vmentry failure test.
diff --git a/tests/hyp-xen-version/Makefile b/tests/hyp-xen-version/Makefile
new file mode 100644
index 000000000000..2d7db8fa6ad9
--- /dev/null
+++ b/tests/hyp-xen-version/Makefile
@@ -0,0 +1,10 @@
+include $(ROOT)/build/common.mk
+
+NAME      := hyp-xen-version
+CATEGORY  := functional
+TEST-ARCH := arm64
+TEST-ENVS := $(ALL_ENVIRONMENTS)
+
+obj-perenv += main.o
+
+include $(ROOT)/build/gen.mk
diff --git a/tests/hyp-xen-version/main.c b/tests/hyp-xen-version/main.c
new file mode 100644
index 000000000000..bda591ca5c29
--- /dev/null
+++ b/tests/hyp-xen-version/main.c
@@ -0,0 +1,105 @@
+/**
+ * @file tests/hyp-xen-version/main.c
+ * @ref test-hyp-xen-version
+ *
+ * @page test-hyp-xen-version Hypercall xen_version
+ *
+ * Functional testing of xen_version hypercall.
+ *
+ * @see tests/hyp-xen-version/main.c
+ */
+#include <xtf.h>
+
+const char test_title[] = "Hypercall xen_version testing";
+
+#define INVALID_CMD -1
+
+void test_main(void)
+{
+    int ret;
+
+    printk("Checking XENVER_version:\n");
+    {
+        /*
+        * Version is returned directly in format: ((major << 16) | minor),
+        * so no need to check the return value for an error.
+        */
+        ret = hypercall_xen_version(XENVER_version, NULL);
+        printk(" version: %u.%u\n", ret >> 16, ret & 0xFFFF);
+    }
+
+    printk("Checking XENVER_extraversion:\n");
+    {
+        xen_extraversion_t xen_ev;
+        memset(&xen_ev, 0, sizeof(xen_ev));
+
+        ret = hypercall_xen_version(XENVER_extraversion, xen_ev);
+        if ( ret < 0 )
+            return xtf_error("Error %d\n", ret);
+
+        printk(" extraversion: %s\n", xen_ev);
+    }
+
+    printk("Checking XENVER_compile_info:\n");
+    {
+        xen_compile_info_t xen_ci;
+        memset(&xen_ci, 0, sizeof(xen_ci));
+
+        ret = hypercall_xen_version(XENVER_compile_info, &xen_ci);
+        if ( ret < 0 )
+            return xtf_error("Error %d\n", ret);
+
+        printk(" compiler:       %s\n", xen_ci.compiler);
+        printk(" compile_by:     %s\n", xen_ci.compile_by);
+        printk(" compile_domain: %s\n", xen_ci.compile_domain);
+        printk(" compile_date:   %s\n", xen_ci.compile_date);
+    }
+
+    printk("Checking XENVER_changeset:\n");
+    {
+        xen_changeset_info_t xen_cs;
+        memset(&xen_cs, 0, sizeof(xen_cs));
+
+        ret = hypercall_xen_version(XENVER_changeset, &xen_cs);
+        if ( ret < 0 )
+            return xtf_error("Error %d\n", ret);
+
+        printk(" changeset: %s\n", xen_cs);
+    }
+
+    printk("Checking XENVER_get_features:\n");
+    {
+        for ( unsigned int i = 0; i < XENFEAT_NR_SUBMAPS; i++ )
+        {
+            xen_feature_info_t xen_fi = { .submap_idx = i };
+
+            ret = hypercall_xen_version(XENVER_get_features, &xen_fi);
+            if ( ret < 0 )
+                return xtf_error("Error %d for submap[%u]\n", ret, i);
+
+            printk(" submap[%u]: %#x\n", i, xen_fi.submap);
+        }
+    }
+
+    printk("Checking invalid command:\n");
+    {
+        /* Invalid cmd should result in returning -ENOSYS. */
+        ret = hypercall_xen_version(INVALID_CMD, NULL);
+        if ( ret != -ENOSYS )
+            return xtf_error("Error %d\n", ret);
+
+        printk(" ok\n");
+    }
+
+    xtf_success(NULL);
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.25.1


