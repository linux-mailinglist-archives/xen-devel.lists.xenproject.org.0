Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 003306DE4B5
	for <lists+xen-devel@lfdr.de>; Tue, 11 Apr 2023 21:20:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519885.807055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJXF-0003nC-6E; Tue, 11 Apr 2023 19:20:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519885.807055; Tue, 11 Apr 2023 19:20:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJXE-0003aE-V1; Tue, 11 Apr 2023 19:20:08 +0000
Received: by outflank-mailman (input) for mailman id 519885;
 Tue, 11 Apr 2023 19:20:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOX4=AC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pmJUg-0004DR-Bm
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 19:17:30 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e88::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7e6342f1-d89d-11ed-8611-37d641c3527e;
 Tue, 11 Apr 2023 21:17:27 +0200 (CEST)
Received: from BN7PR02CA0011.namprd02.prod.outlook.com (2603:10b6:408:20::24)
 by PH0PR12MB5607.namprd12.prod.outlook.com (2603:10b6:510:142::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 19:17:23 +0000
Received: from BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:20:cafe::21) by BN7PR02CA0011.outlook.office365.com
 (2603:10b6:408:20::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36 via Frontend
 Transport; Tue, 11 Apr 2023 19:17:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT012.mail.protection.outlook.com (10.13.177.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.28 via Frontend Transport; Tue, 11 Apr 2023 19:17:23 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 14:17:23 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 14:17:22 -0500
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
X-Inumbo-ID: 7e6342f1-d89d-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hYkT+9ybedTAThsa69OTF8pDiP0MapFqOpgACARH+6PwvEwplOikd1yK31DLgjqTQ+NwL2NhFM612qQn1Zk2T6REA9HurY0vIUfm6ASLw9cTfNiqAXo+zsYiW6NgkFbMtRVKKhWh4zBVeAkVUpov/tkhNshlfcm6pDULZyjl7BxJEuemGsbPWwSyfD6XE+czKIfu5bjD6FARRQyZ7BSQ/ScOW4mlS7kUXbzqxyUCsuuV4a9Jg+k+It3c1BmoiLLTyBBu747DBAhbcOA4ZtDg4TTTcsWT0QhuXgHC9nxog1Mu0qoXwfoBkK86oQvEyUwcSFZYZIitwdjyAhkTJ7lT7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nkwDgQcNvE9UkGiRuGgnKgAIS4K7kLAxiI7Z7Wg7YaY=;
 b=bFkwv0hRmgWPKHlPE78WePjeyze5djTM4XidulgttiHnANW6RcfIX235Ic4iOQ4EGGu2nm2KmYzhwCKpyv1ofZ5ALGFn+RObauX7gT5t745XCjHJ9bqBeA38DW350O8BXLiMRHHvlBc89Am8iYZW67l5N96Bc5fMa8BJmAf/jAccbFHW1rtmsF3iJvhcB/dHEj6H9a2PDFep+nPqawQo3qh46GeX5UaAw2jnFBFPp4gNMcTKkYm3f/R/mFy21DQhOYhAr38KHm6H1ibY158dC/TZRwmcN2ICQPNWbW3TUv+gnOVdtKLqXE41I1KX8TopAf2UKqG4E9XVt/sAwJhIrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nkwDgQcNvE9UkGiRuGgnKgAIS4K7kLAxiI7Z7Wg7YaY=;
 b=21/M39zzNkj6wIHkED3tJss5gecgEfRVwuaFUsyo+K3x1WdUj1VY+Ix1f+ggPHp698D1EViTsLUcnRtHqsqNJokVJHXZPoxBvyLa2VuGdBFmfVOkuwkwBiLs2e+dHETrO539r0RHzhgqZGOQUSD7Yh2xicGbe5d3/hZ3/KZT7Kg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Vikram Garhwal <vikram.garhwal@amd.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>
Subject: [XEN][PATCH v5 15/17] tools/libs/ctrl: Implement new xc interfaces for dt overlay
Date: Tue, 11 Apr 2023 12:16:34 -0700
Message-ID: <20230411191636.26926-34-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230411191636.26926-1-vikram.garhwal@amd.com>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT012:EE_|PH0PR12MB5607:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bb3dab3-66a2-4d94-0fae-08db3ac16115
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NjdL+dF7YtTYsdvEmz+gwZtMQejePwuqoUCxVtuOYQWysB0NMs9qEb+cfhvo6TJNzD/9vi69QT2fhp+OJDVPgfUkgVu1tn/qlZAYyWuVTf3N0cFFtJo0+Qx/bvE/w4ztWaOrlR/LK4EUmD9HZWW2Ty6fwF+EGqbSftprSFjA0H6RQ0+31wdLq+JOh4Lvz5Qk8XhjB7JOof5mawk2Vm9n5GJHTQmZUM0XZVb/FLLM3YKedjjhJ7lIt36Kr3VO8TDnbLJ7/aUA3ic4jmVm6ApUiUEZcumHQ/jubuNqi/Kb3NeQDu6KCmMYpYYV68o5Tti7/XfZ1i24vD2De9ayV9gEHlj7jKjNUFoHiifxaHbvGh6U6+T2zQE23AybgmDS/cbFmj4+XbtJauR6nf+e3wc231biL3TBFKbqW2zNtuEZpUYEan3mwwB5X4LJvnHctA5YPldL020mz4UjL0046VI2BorKesLR1Ssm9sqkz8EI5kZxExFETPQ3kOeNcrjqJiwHxl107F2ywBiqNv8UPmLLd3dmLWJmcgRO4nzQeWQ/1oxK6chL1Ec9vfiz7VemckQRV5zKIvroPRvvRjFCfQQOKrFcxUIP+ZcOI/7ZffJpIOW0jxZVakknuR3y4YWkzL4UhICB285ipDmmK59cQxfz7/GjtyTeuY3L1pK+xfCHtwUmmCkdNybWCEk8g6NdEFg/RQ2TRdGemRpmRCb4oJQ4qkxW7GWizOkLjuulhdFCLmhvzgZvWSIgztkxhXpne7E9
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(346002)(396003)(451199021)(46966006)(40470700004)(36840700001)(82310400005)(82740400003)(356005)(54906003)(36860700001)(81166007)(70206006)(70586007)(8676002)(86362001)(6916009)(478600001)(4326008)(336012)(47076005)(426003)(186003)(2616005)(26005)(316002)(41300700001)(36756003)(2906002)(1076003)(44832011)(40460700003)(40480700001)(8936002)(6666004)(5660300002)(2004002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 19:17:23.4457
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bb3dab3-66a2-4d94-0fae-08db3ac16115
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5607

xc_dt_overlay() sends the device tree binary overlay, size of .dtbo and overlay
operation type i.e. add or remove to xen.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 tools/include/xenctrl.h         |  5 ++++
 tools/libs/ctrl/Makefile.common |  1 +
 tools/libs/ctrl/xc_dt_overlay.c | 48 +++++++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+)
 create mode 100644 tools/libs/ctrl/xc_dt_overlay.c

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 05967ecc92..b932589c8d 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2637,6 +2637,11 @@ int xc_livepatch_replace(xc_interface *xch, char *name, uint32_t timeout, uint32
 int xc_domain_cacheflush(xc_interface *xch, uint32_t domid,
                          xen_pfn_t start_pfn, xen_pfn_t nr_pfns);
 
+#if defined(__arm__) || defined(__aarch64__)
+int xc_dt_overlay(xc_interface *xch, void *overlay_fdt,
+                  uint32_t overlay_fdt_size, uint8_t overlay_op);
+#endif
+
 /* Compat shims */
 #include "xenctrl_compat.h"
 
diff --git a/tools/libs/ctrl/Makefile.common b/tools/libs/ctrl/Makefile.common
index 0a09c28fd3..247afbe5f9 100644
--- a/tools/libs/ctrl/Makefile.common
+++ b/tools/libs/ctrl/Makefile.common
@@ -24,6 +24,7 @@ OBJS-y       += xc_hcall_buf.o
 OBJS-y       += xc_foreign_memory.o
 OBJS-y       += xc_kexec.o
 OBJS-y       += xc_resource.o
+OBJS-$(CONFIG_ARM)  += xc_dt_overlay.o
 OBJS-$(CONFIG_X86) += xc_psr.o
 OBJS-$(CONFIG_X86) += xc_pagetab.o
 OBJS-$(CONFIG_Linux) += xc_linux.o
diff --git a/tools/libs/ctrl/xc_dt_overlay.c b/tools/libs/ctrl/xc_dt_overlay.c
new file mode 100644
index 0000000000..202fc906f4
--- /dev/null
+++ b/tools/libs/ctrl/xc_dt_overlay.c
@@ -0,0 +1,48 @@
+/*
+ *
+ * Device Tree Overlay functions.
+ * Copyright (C) 2021 Xilinx Inc.
+ * Author Vikram Garhwal <fnu.vikram@xilinx.com>
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation;
+ * version 2.1 of the License.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "xc_private.h"
+
+int xc_dt_overlay(xc_interface *xch, void *overlay_fdt,
+                  uint32_t overlay_fdt_size, uint8_t overlay_op)
+{
+    int err;
+    DECLARE_SYSCTL;
+
+    DECLARE_HYPERCALL_BOUNCE(overlay_fdt, overlay_fdt_size,
+                             XC_HYPERCALL_BUFFER_BOUNCE_IN);
+
+    if ( (err = xc_hypercall_bounce_pre(xch, overlay_fdt)) )
+        goto err;
+
+    sysctl.cmd = XEN_SYSCTL_dt_overlay;
+    sysctl.u.dt_overlay.overlay_op = overlay_op;
+    sysctl.u.dt_overlay.overlay_fdt_size = overlay_fdt_size;
+
+    set_xen_guest_handle(sysctl.u.dt_overlay.overlay_fdt, overlay_fdt);
+
+    if ( (err = do_sysctl(xch, &sysctl)) != 0 )
+        PERROR("%s failed", __func__);
+
+err:
+    xc_hypercall_bounce_post(xch, overlay_fdt);
+
+    return err;
+}
-- 
2.17.1


