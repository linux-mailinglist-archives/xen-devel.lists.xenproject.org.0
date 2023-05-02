Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC75E6F4DB5
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 01:39:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528915.822698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzaP-0006Yy-J6; Tue, 02 May 2023 23:39:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528915.822698; Tue, 02 May 2023 23:39:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzaP-0006Wt-EG; Tue, 02 May 2023 23:39:09 +0000
Received: by outflank-mailman (input) for mailman id 528915;
 Tue, 02 May 2023 23:39:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/cxx=AX=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1ptzZ7-0005Si-M1
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 23:37:49 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20600.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 578e1a5d-e942-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 01:37:47 +0200 (CEST)
Received: from BN9PR03CA0243.namprd03.prod.outlook.com (2603:10b6:408:ff::8)
 by SN7PR12MB7953.namprd12.prod.outlook.com (2603:10b6:806:345::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.32; Tue, 2 May
 2023 23:37:44 +0000
Received: from BN8NAM11FT101.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ff:cafe::1a) by BN9PR03CA0243.outlook.office365.com
 (2603:10b6:408:ff::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.21 via Frontend
 Transport; Tue, 2 May 2023 23:37:43 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT101.mail.protection.outlook.com (10.13.177.126) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.21 via Frontend Transport; Tue, 2 May 2023 23:37:43 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 2 May
 2023 18:37:41 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 2 May 2023 18:37:41 -0500
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
X-Inumbo-ID: 578e1a5d-e942-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bERWKi0IoKVO4XW7QmAZRl3xJLDoCyjpHNLhXy2w8KqjDAoMs4NvnCUKsP8Ee2WJwWXgEeCIvj5SsNeRzRSw+O9XGQi3DaHdSauVbrSF6eGvT60gHy4K7VsV3+wh8upOth/TCzae97M7vL0vIZiOeZv2A703E7v+v4lRPiqLWAL6GV1FsYA1cZme8c992f2NDqbHxuiatP1xZhUv+cnRLY5Ex39gbw6PeelY5rR3Pis192NKcDft3LuoL3Z3Z7H0avkqt0ha7trY++XL2wodIBgdKunUOBAMXdaLIgiht7Gw3fTELp02mvA6E4lsnx6/wPNTUdL3GBSzZ3Q5DWSVzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EQ8GqVc2MExei+u64NzeTvfYwAOuigBIRcvJ0a0ukt4=;
 b=TBzHrtkDlEDXZ5Lzf5F99GDULi3RK4nBdtOX21n/x9a6YZTpImEBQ5Whmz29A0Tiz+T/NfvGXC9BxqCIcW0uuBppMH5DBdEtl6xQbhis8jFH471u8+Vw3MQtcZ7sxomqGaK55/VekubFpRxbedk/ZxTLrD0XBozo6xETNhqtPzyG+BR4XAp5aX6FhFqXzHFB753uSVxZfMCf7PUUjqo7k3PVLOg/aNitMpHW3gjSYByVl7OlBQjNEbg2q5s3pnzJ6fTUxO2bEh5cQPJb5QaGu1EHX73zFUEqbtpwbrsJCYSpEGnHxPmZEqhlhJus2bhTs7rQBofRbguO4OEu1E8cyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EQ8GqVc2MExei+u64NzeTvfYwAOuigBIRcvJ0a0ukt4=;
 b=r3D+eMzSnKuDoXOsPjZC7VuCLArC/Phzl8Bgg+JYBuvvdMKeWbrwes775Dj3DJ/BPoOms52uOzfZHhKdRhrs271X7kb84qsN9vr2UBcMqa6faF1/ue/6u1R3KLiTepvf4V0PNlgPvOHeAxnfWXaljExWAuCiaw7hFz5g2qNWpQU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <vikram.garhwal@amd.com>,
	<michal.orzel@amd.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [XEN][PATCH v6 17/19] tools/libs/ctrl: Implement new xc interfaces for dt overlay
Date: Tue, 2 May 2023 16:36:48 -0700
Message-ID: <20230502233650.20121-18-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230502233650.20121-1-vikram.garhwal@amd.com>
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT101:EE_|SN7PR12MB7953:EE_
X-MS-Office365-Filtering-Correlation-Id: a4a8e144-13c2-4e46-1033-08db4b663a23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	V8hJH/YlyuhXPweNA4KTn69XI5co255t1TQrBJSBvak61sR9Z3kCIRm5PnYmiv/8VqFuHPWmw23kSZX9Sgkb1NCFN/xGvif9AfKeylD3OvOSJNwhd2tXo0Jma9dFo399P2p40XlneedckLjeWsUFVEm7BNKVYFIjNl8lfhjCPrdSOB593Wr1vI9Wd7xvkCo5n1NopJMXwljxnE23QQVusPVxoAzbYmLh0w86LPSAH93OiSvn2LLcpWfOEeeyNC/bUFw/93dBSLQPXyon8uYIi6bVTtMpWqAXPh9CyRNEwwshjuLmjWx6d/UBUgY2AJFBP4ipLifz4pY65iVwivesH8NYfiqiXMDW4Zk/sOeDyj4K0mjp+znx5UzhcuLhT87RhGxNR3IcnMOLy6NoAsVmZMIJO5VnkHjH0MQbIFsVHDfmeDYziHmTYE+ufpzQkzNnZY+LRCOawJUiStHSrYS5FkzwcWS8sLXjrYUDh6VqFfMSbf2ewn33FRHtTk30RrMBNAGJiSOpRMlJ0pZ+VJlddqBEzd+yUVl4PQYf01N9kA8qgbPmzZdu6yk289xZGJQykT0fIIAgXxBBr+1frpPvXxKB+unoP/6Ad2o+xLMu0kxg7nxtgaqU/3UFHDOXFIw8rqAKt+xEIg5TMRfFUiWKEw5iEiuxBdvGKaSwymKKL42uIU0VmC3zLY6k92kisa9ONiTE9SuDFSZUM+SFTGybctS0pLMx3HwMmy4G43noknm4Di25fqdTgxamn/6aoYA2
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199021)(46966006)(36840700001)(40470700004)(5660300002)(36860700001)(1076003)(40480700001)(478600001)(356005)(81166007)(26005)(186003)(82740400003)(54906003)(47076005)(426003)(2616005)(336012)(8676002)(41300700001)(8936002)(4326008)(70206006)(2906002)(316002)(6916009)(44832011)(70586007)(86362001)(36756003)(40460700003)(82310400005)(2004002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 23:37:43.6868
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4a8e144-13c2-4e46-1033-08db4b663a23
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT101.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7953

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
index 752fc87580..1a99c06561 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2666,6 +2666,11 @@ int xc_livepatch_replace(xc_interface *xch, char *name, uint32_t timeout, uint32
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


