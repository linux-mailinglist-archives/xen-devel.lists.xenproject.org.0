Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B6D6453EC
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 07:19:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455865.713561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2nlf-0004Xk-Hh; Wed, 07 Dec 2022 06:18:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455865.713561; Wed, 07 Dec 2022 06:18:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2nlf-0004KI-5w; Wed, 07 Dec 2022 06:18:55 +0000
Received: by outflank-mailman (input) for mailman id 455865;
 Wed, 07 Dec 2022 06:18:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FP08=4F=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1p2nld-0001rE-66
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 06:18:53 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 04af1d4a-75f7-11ed-91b6-6bf2151ebd3b;
 Wed, 07 Dec 2022 07:18:51 +0100 (CET)
Received: from MW4PR02CA0013.namprd02.prod.outlook.com (2603:10b6:303:16d::13)
 by PH7PR12MB6811.namprd12.prod.outlook.com (2603:10b6:510:1b5::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 06:18:49 +0000
Received: from CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:16d:cafe::1) by MW4PR02CA0013.outlook.office365.com
 (2603:10b6:303:16d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Wed, 7 Dec 2022 06:18:48 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT018.mail.protection.outlook.com (10.13.175.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.15 via Frontend Transport; Wed, 7 Dec 2022 06:18:48 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 00:18:43 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Dec
 2022 22:18:43 -0800
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Dec 2022 00:18:42 -0600
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
X-Inumbo-ID: 04af1d4a-75f7-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b0AdmDvBPLBmoY07TZlWdAedXk4v6Y/sHS2JD/1MXwZRrKWpOCxFJqzXedQdGYNMqCO+Vl7cvdH0hxbGBFm0pDhfWYuRwh60aFGHPr/kEE+tDB+izWrMvlIyZg0m1dgUggx86KjaKqXzZklkt7G/swkX/VA3s6nelWcMaA1xW2emVohVuhfDZDNq5je3nOpxS6cJ4e9k+ME20FGaIFeQB3NlZrGMJx0FykC6t/fMzq7XbeI11Ej4Srom82stNriHe8hBbDI1rtXK9Ca4GVbP3/qM4G7zVvh4oVtJotqFWmLIwOPfbY6lm5qjT86+Kuy80zggSC6wQKIR1Zh7eidGTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=goLWEVa+AtelixIUgdIy7KMIuSqD1uMsMPZgQBv8oUg=;
 b=nM3rwMsCnVbvHf7SJnSqrtjzYrLS2CvC2p8HzU6MgokKF4B4NBCfzWyM9KxTRAKb3ZqyTLgYhO1bh2cfoosZPixzveJ7Bc5G102nvS8tLgSmXB80CX48NECYGXG2DMuRZQ8YSP9ZuTnLOE1p/wS8BhLgDbwt+j4OeKnBhAkJw+keprw3yjniB67X9oCyoNOj8AcjGWfXpEBVYjzYKdKY0qUG39IVl5c0I05MMsPbQ2tzN0nn/RCZGh51r0NgSEQue2dPyQdzjiAgCCitdQ2uYgGZrS3AF94NsCW950XITassvb3pweScZZwgXNG82/KTp7C7Z6kyXg1rmmBnvlsR5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=goLWEVa+AtelixIUgdIy7KMIuSqD1uMsMPZgQBv8oUg=;
 b=oAt7mPaMtzFOSb7vNNgL26FZkxX9ERs6kbMdC3/cDpU/ed1DVGnXN4wZ0pgZm0LBG4XHSr0JX9arcVkmrSkX/iwtfVmxkSRbu2kwMV7CH+RFFGL42uj+5HyvLL2lseiyoNx1/Nj3aFTr9ZszdMLp3OyXuoAslJ93MM6J5pZTvmw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <vikram.garhwal@amd.com>,
	<Luca.Fancellu@arm.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [XEN][RFC PATCH v4 14/16] tools/libs/ctrl: Implement new xc interfaces for dt overlay
Date: Tue, 6 Dec 2022 22:18:13 -0800
Message-ID: <20221207061815.7404-8-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221207061815.7404-1-vikram.garhwal@amd.com>
References: <20221207061815.7404-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT018:EE_|PH7PR12MB6811:EE_
X-MS-Office365-Filtering-Correlation-Id: 02b244a0-2337-488b-cff3-08dad81ae6fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	woF9ihQWiczNhFh8OM3ZTckui71eSo9l7wG8mrrycsCFv55BmDqZgpf1QUs2NKZnia8pvXPB4aVSrEQcZKyY5soJmumteRQnSmep54D9bpvrmhPfvikuNIb2lVjs/NNbLNhuX8ys6Wmav1P2JWp0S6cmhUu9Idzr/FszRPDW0AYkpi+yT1br/UthxAbDpAAs9E0gfLqYuKoS2nPnTIKxO6zcEvx1D7Kb1O47plcid6nXiu62mGYAKCPsxm3fTQjvtl9qpiut4bV7Zn5YAOGoT9l8ay2gLohabYD6KMQI5R/BmXfYEiUAxX/EF7ad+kGp/jgMhWLihTtCESIGhnfqh5aVpf1Dgiy6FrDklJ+PbmFNmHRhdhEccSl6+EBbFUSGRnpTw0zJv6RjgsZf6wARZATqwtm67aesF8mlfXbVm9wBFFTS/P0iyNWtsuaj35/XHmltSjvWLIgYEuU/JUegO/aYh1EhkhcYtW8Qsy6k5S8eTLHXbynU259nX7/LJwBBkZmkVbRHpXw2XOdaCN5M2Urf09juLHRFR2glU0OND15w2u4Txeo70qzZSrljT2bYzjyCE+Y6QNTlQJczrv883gceHjqj6ZmN5BgY3yLNY5skdsqq6pG21hKgx6347XU9XjuB9CYTEeGmhtzyvbh83gS76KUsEi8JYlpO3NgxEXmcUaF12iMQDXPyN3qZ9tlj/eEwMHIh/zgVPRWN8XXU1IHUqUY3CtRZ3XpMWE0PBSc+RCPfOJQqW5oUeQ2lTE4cjtUX7nttrr5tviaze4ieFf2xKT5LQ6aiOW5N8xWtAas=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(376002)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(36756003)(70586007)(54906003)(356005)(86362001)(8936002)(41300700001)(81166007)(2906002)(40460700003)(44832011)(4326008)(5660300002)(36860700001)(478600001)(70206006)(316002)(2616005)(6916009)(82740400003)(40480700001)(82310400005)(8676002)(1076003)(47076005)(336012)(426003)(6666004)(186003)(26005)(2004002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 06:18:48.0705
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02b244a0-2337-488b-cff3-08dad81ae6fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6811

xc_dt_overlay() sends the device tree binary overlay, size of .dtbo and overlay
operation type i.e. add or remove to xen.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 tools/include/xenctrl.h         |  3 ++
 tools/libs/ctrl/Makefile.common |  1 +
 tools/libs/ctrl/xc_dt_overlay.c | 51 +++++++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+)
 create mode 100644 tools/libs/ctrl/xc_dt_overlay.c

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 0c8b4c3aa7..a71bc0bb1d 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2633,6 +2633,9 @@ int xc_livepatch_replace(xc_interface *xch, char *name, uint32_t timeout, uint32
 int xc_domain_cacheflush(xc_interface *xch, uint32_t domid,
                          xen_pfn_t start_pfn, xen_pfn_t nr_pfns);
 
+int xc_dt_overlay(xc_interface *xch, void *overlay_fdt,
+                  uint32_t overlay_fdt_size, uint8_t overlay_op);
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
index 0000000000..325c9ef4c0
--- /dev/null
+++ b/tools/libs/ctrl/xc_dt_overlay.c
@@ -0,0 +1,51 @@
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
+#include "xc_bitops.h"
+#include "xc_private.h"
+#include <xen/hvm/hvm_op.h>
+#include <libfdt.h>
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


