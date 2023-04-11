Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C753B6DE49F
	for <lists+xen-devel@lfdr.de>; Tue, 11 Apr 2023 21:17:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519783.806855 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJUX-00088X-5q; Tue, 11 Apr 2023 19:17:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519783.806855; Tue, 11 Apr 2023 19:17:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJUW-0007uF-0H; Tue, 11 Apr 2023 19:17:20 +0000
Received: by outflank-mailman (input) for mailman id 519783;
 Tue, 11 Apr 2023 19:17:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOX4=AC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pmJUR-0004DR-Q0
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 19:17:15 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20606.outbound.protection.outlook.com
 [2a01:111:f400:7e8c::606])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75bcde91-d89d-11ed-8611-37d641c3527e;
 Tue, 11 Apr 2023 21:17:13 +0200 (CEST)
Received: from MW4PR04CA0041.namprd04.prod.outlook.com (2603:10b6:303:6a::16)
 by IA1PR12MB6529.namprd12.prod.outlook.com (2603:10b6:208:3a6::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.34; Tue, 11 Apr
 2023 19:17:08 +0000
Received: from CO1NAM11FT085.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6a:cafe::d0) by MW4PR04CA0041.outlook.office365.com
 (2603:10b6:303:6a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.40 via Frontend
 Transport; Tue, 11 Apr 2023 19:17:08 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT085.mail.protection.outlook.com (10.13.174.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.29 via Frontend Transport; Tue, 11 Apr 2023 19:17:08 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 14:17:07 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 12:17:06 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 14:17:06 -0500
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
X-Inumbo-ID: 75bcde91-d89d-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YpIDKdgdf7yz2eJTAnEtGnIAAnvHfpj3300VLO6iafBOlyg9uKGtWR8AlWLxZXP7jXq9z+MOemUrxotW3ALnTbYqRKLYnv4hTlBU7fOiISFawFTn2sfZGHNIb/LaE9ZO2I+2Qd/HNcuwn5+M8fnxdXlS6Bqmzr3N6eCnwFV/c9YZRm82uhULvb8h7wuS9Mip6Y5DUmuTbpTPaJGax/zVmWaporPWDtZGvPYZXRhakfjvF5Glz2cx6XgfjW78lAGD/6ddcqxVFNiG3vicbmGg0mYIVHVd7jMXYOiGlYnApFw9Vr1UlR226LBQIzbrDZb7A5rL6hhtY7hLB1EWpHlorQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nkwDgQcNvE9UkGiRuGgnKgAIS4K7kLAxiI7Z7Wg7YaY=;
 b=F5OZE8ajLmHZ/3smvtrG3B3WH5oV4QmrHteG/vHTRllwu508EHSaQPST7gJiFbgHoDWf/e2BCweqleNSWP9MHT+GLdqcgZK5AiBmzlg2os1366qXKVcQlnDk4JdYYrnROOe5Sy2X4NZVgweQrs5LGeNMPwrv8/9f4U0UI7nyceUS39HZ6pA7+XALE0/zSb90fv+KxfUmpme0YPQeuQrPeuVfI61ZaGeJM97fGAA/SZn+rC4m0cvg6C0lUtesgR/EQkCsDqHidnogKC/o+r6wpScV0HDwk2GrA1yn+zaL2Xc7m9py2DDfF9tBZfERXRPetcpYXqwXCxeV7y22lYa4UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nkwDgQcNvE9UkGiRuGgnKgAIS4K7kLAxiI7Z7Wg7YaY=;
 b=34B69AbRgoSes/U8YltA7jp1SIRw84uuhNt7TRQZNULohAXDZZhsPhgLOiVTgnRk+J/lfOOIctNDhuCdHAaPGqQfAc3uPDMpNjcUypQ3tyfJV2gzFGg9cZP7f0PTD/hRhQXzyre6jKZVAHVEzs9NDOUJMKcbR6jeo+riXyEmy8o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Vikram Garhwal <vikram.garhwal@amd.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross
	<jgross@suse.com>
Subject: [XEN][PATCH v5 15/17] tools/libs/ctrl: Implement new xc interfaces for dt overlay
Date: Tue, 11 Apr 2023 12:16:16 -0700
Message-ID: <20230411191636.26926-16-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230411191636.26926-1-vikram.garhwal@amd.com>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT085:EE_|IA1PR12MB6529:EE_
X-MS-Office365-Filtering-Correlation-Id: 79fb94b7-2e1f-4cd8-dde2-08db3ac15800
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	osc+4KnrjY/eXHRp/c21nvn18/PBqzgrfrXWovfYXG3QrplR0MgbJ72hALFCiEcxPhk3QCSjzTFO0dTXS6yY9bt/J8GQaZ3WYGZnBX2YGioCcALoBjUowaD5pS+r/sLI+L2YN/4s9DHwAJKZFS2+nLiYjL1EMqTc6AHTqNHVpeHyOcIaMNldU5M5EzDaASxUhO3oCEUMTi96Ba4RbWsjp3sMkNFeeKj7mdIpNg39NVoQtJJrexrczJ3CXJ4N5k3KSt8jbO0kW511tYq5p+Ahe7LLGnRU0SMi7baInhIHt0mb5n2gFKkRFvd0ht9LB96tkW4dWRFp3QKStHnhBh7nZG/l8PXpbqpgzp4viFw2WKasPQ5v0VkIlSn0xAafRSR/qj3De+tPh/fTVyxfhRntQdkTvcpxMSsXaIHjID7Nyxx24+li9JVuGCxeXyewaEMKOsrFzaQ4y+oj7CslTKxiL9D0SR+uWSi/EfyxI8TfNgnalPhnHrEZzPQOsBKxFrh0eaXeS/MW13vx6/MePibxA9oju6iZnUa+Hc80Zf2Dr5VbNvLe7Tl+P13UgrnjzYNyI9vQS+oO0EdP89r4GuGuwIdysUR9FW1yxvmTteTro8D60MVMkOZyS/XwStAp5xf8DPld7jEQcQpzt8I5BHTNI+rEq3SpHSmv7VEwN27rRCI+IUMoActsf1te3hUn69CJxWUpjJw0GHVSd/eNq7wywPqJvAYdGBddDOaD8uiSerCTHaw/TBAANLwczdGUStdu
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(39860400002)(396003)(346002)(451199021)(40470700004)(46966006)(36840700001)(40460700003)(70206006)(4326008)(478600001)(8676002)(54906003)(41300700001)(316002)(70586007)(6916009)(86362001)(36756003)(47076005)(2616005)(336012)(26005)(1076003)(426003)(6666004)(5660300002)(44832011)(2906002)(82310400005)(40480700001)(8936002)(356005)(82740400003)(186003)(81166007)(36860700001)(2004002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 19:17:08.1201
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79fb94b7-2e1f-4cd8-dde2-08db3ac15800
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT085.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6529

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


