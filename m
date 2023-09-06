Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 457AC793351
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 03:20:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596058.929862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdhDi-0000CH-Qh; Wed, 06 Sep 2023 01:20:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596058.929862; Wed, 06 Sep 2023 01:20:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdhDi-00009V-Mt; Wed, 06 Sep 2023 01:20:38 +0000
Received: by outflank-mailman (input) for mailman id 596058;
 Wed, 06 Sep 2023 01:20:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kbfT=EW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qdhA8-0006tr-Mw
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 01:16:56 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20623.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 11306e33-4c53-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 03:16:56 +0200 (CEST)
Received: from MN2PR19CA0014.namprd19.prod.outlook.com (2603:10b6:208:178::27)
 by DM4PR12MB5216.namprd12.prod.outlook.com (2603:10b6:5:398::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 01:16:52 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:178:cafe::6d) by MN2PR19CA0014.outlook.office365.com
 (2603:10b6:208:178::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34 via Frontend
 Transport; Wed, 6 Sep 2023 01:16:52 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Wed, 6 Sep 2023 01:16:52 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Sep
 2023 20:16:49 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Sep
 2023 18:16:49 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 5 Sep 2023 20:16:48 -0500
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
X-Inumbo-ID: 11306e33-4c53-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yq4mhoS3LAABD9NmKBUaIFKOTq7SLsBeTC8uhAWCvLljbwCFTDnh77nChkC1XOMuLOm1sBiKVEaketWHHthJ4cYlmNs/42UPV6yew2GYFVNTRjr5Sst5UiEkxonhR9yj4YvA0ViMzXVRjSqJNv36/weTAKXXlcjTynRbFxTAIoY0yBccyFS7Kezw136w3CSVElzteGfIpdzSp4/4beFynfQvSgSBMd6nqvvtqmyLsb6K2dhBY+XubdRBBjShncSstdheoNgzySHCbgY4QF9vCYPchHTkNR6f0aK9GztbLoEl7gE9vlcpDFcobApsI0z/lPstztE9ztKhfQkN8G6Sgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f3CXFnL+4aLIWZtU9p5mMJcpke4wuyPy6FqvOY6YZ1o=;
 b=RIPBciSjncsw7YeHrzTWt61p0BsB9wLoO6aGsWsnNdAzk1rETwl68AuggqHKjRRBJlZgQQFS3ltPeVK1uoveJbH6aYC4p8FjBp1mqLDQLBFW7Of7RvJ5EsZQBIbe/qYqJnNCMLu+vegC8f8Ryt7wRERrV5j1LpU0J08AbyZ/LX5EIvOpnt5BLYKstKrZ3Epooyn+AfXnep5o2WzdbgNHd0ExM5rzJfv0U7tqhrhjwqfRvcn0Ooe/MbNOyU6HKyNTe/4CxNRqnMQ0rW2fFu4CNW6SCEylpnrszm+TjWAhIlClMAGK34cfgVtnWrD0rmZAr9HYKp3BrVAqjZnvNIlThw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f3CXFnL+4aLIWZtU9p5mMJcpke4wuyPy6FqvOY6YZ1o=;
 b=0tNn2rCiudBygV+H1xPMR7qt7toR0jUKsmtxgxZEUf1X08ZvobL8xM40NZGyRE7gRVVhHpDgzcu0BStoAZDzVKecinn139vHPRfRbj1DWmOYsnpsDSS+sDvhfeMlTB81iY/jBGZB7kxqszB6c1bv9rpCQEQ5FPx9k2OyMBtFtvA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <vikram.garhwal@amd.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [XEN][PATCH v12 18/20] tools/libs/ctrl: Implement new xc interfaces for dt overlay
Date: Tue, 5 Sep 2023 18:16:28 -0700
Message-ID: <20230906011631.30310-19-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230906011631.30310-1-vikram.garhwal@amd.com>
References: <20230906011631.30310-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|DM4PR12MB5216:EE_
X-MS-Office365-Filtering-Correlation-Id: f60b614e-9acb-4e7b-a949-08dbae76f3e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9sgS/T4Zdd8wWUnKjUTNt/qFjZCgspRdV+wXJhCxxUfETelrMECuLbCDhnHW7FZ7AapEURPNk5HpW7YO3tV1ChaQ9BBrUGEyQ4Rp+zdsCxUJF7PYMTa7/HI/gaqgUlj7ejND435NTiE5k7sAvGGwUFEGfd2auSdx/35s5/5ahry4hrhqkhQXHH231HzIIqmF9dtnF1jHX8Bb7sNOCzvMUGvMPIdyBZVFe1eeFINU0n+dUjANG0III5NHIssN64WNhRgTE58iEK4EqxUt7HkfvwdbWGQxxCRwzqXo6wg89ObjvGWCKQTEzW5jZDJ57ZvA195GDGg+IWwsK0xH3hki8sEG6GJtdoN2fdL9MsaaI1dLmwJo/0XpdrWI/HGmjEhk02UYkHUPzKitg4o0hfGDi1mVdOUNl6pn4OaWw9qJY0hAVBKZ8URxjaB5c8acIO6k2pUo1meg0s3QdblGDSHYPcd2vbAk/nliBbWJwRyRYw5UgRGtAV1WkigsDo5OcudkuDX8KFEfvMb4JpQtqDi9AC7sCNFL+ZrfTXctYUkFSekpEs6q6yDkua4PofvTif3LPnHpbJiSEFAW9ofLuqFi1uvbtjPe+u5eCZsd/S1lEW5CQ2ygucs1Qp1lCGUi88ccNwbzlZLlStdSo4m1YRPZkrvOxVj0D8/npCQkM9qiZHG16XTSVpW0Ibm39qzEktS3daRJBzX+1U7VM02ucCqS0NhzPRrshE5Uha3mAJluSYbPFwL5nvS9WUCyT3iqGFv8nU+0Uam5dw2o9+CPQ1gWnc6+4ofkCwZQqJl+hULy6f0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(39860400002)(136003)(376002)(82310400011)(1800799009)(186009)(451199024)(36840700001)(46966006)(40470700004)(40460700003)(336012)(426003)(36756003)(81166007)(356005)(2906002)(36860700001)(70206006)(47076005)(82740400003)(40480700001)(54906003)(41300700001)(316002)(6916009)(70586007)(86362001)(6666004)(478600001)(8936002)(8676002)(4326008)(5660300002)(2616005)(1076003)(44832011)(26005)(2004002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 01:16:52.3942
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f60b614e-9acb-4e7b-a949-08dbae76f3e6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5216

xc_dt_overlay() sends the device tree binary overlay, size of .dtbo and overlay
operation type i.e. add or remove to xen.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/include/xenctrl.h         |  5 ++++
 tools/libs/ctrl/Makefile.common |  1 +
 tools/libs/ctrl/xc_dt_overlay.c | 50 +++++++++++++++++++++++++++++++++
 3 files changed, 56 insertions(+)
 create mode 100644 tools/libs/ctrl/xc_dt_overlay.c

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 12dca13b69..2ef8b4e054 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2653,6 +2653,11 @@ int xc_livepatch_replace(xc_interface *xch, char *name, uint32_t timeout, uint32
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
index 0000000000..c2224c4d15
--- /dev/null
+++ b/tools/libs/ctrl/xc_dt_overlay.c
@@ -0,0 +1,50 @@
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
+    struct xen_sysctl sysctl = {
+        .cmd = XEN_SYSCTL_dt_overlay,
+        .u.dt_overlay = {
+            .overlay_op = overlay_op,
+            .overlay_fdt_size = overlay_fdt_size,
+        }
+    };
+
+    DECLARE_HYPERCALL_BOUNCE(overlay_fdt, overlay_fdt_size,
+                             XC_HYPERCALL_BUFFER_BOUNCE_IN);
+
+    if ( (err = xc_hypercall_bounce_pre(xch, overlay_fdt)) )
+        goto err;
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


