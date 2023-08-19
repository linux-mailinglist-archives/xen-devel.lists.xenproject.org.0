Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C31178160B
	for <lists+xen-devel@lfdr.de>; Sat, 19 Aug 2023 02:29:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586705.918074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX9qO-00064k-G9; Sat, 19 Aug 2023 00:29:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586705.918074; Sat, 19 Aug 2023 00:29:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX9qN-0005n0-ER; Sat, 19 Aug 2023 00:29:31 +0000
Received: by outflank-mailman (input) for mailman id 586705;
 Sat, 19 Aug 2023 00:29:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eu5+=EE=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qX9qI-0001hl-9P
 for xen-devel@lists.xenproject.org; Sat, 19 Aug 2023 00:29:26 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062d.outbound.protection.outlook.com
 [2a01:111:f400:fe59::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 725a0d22-3e27-11ee-9b0c-b553b5be7939;
 Sat, 19 Aug 2023 02:29:24 +0200 (CEST)
Received: from DM5PR07CA0095.namprd07.prod.outlook.com (2603:10b6:4:ae::24) by
 SN7PR12MB6671.namprd12.prod.outlook.com (2603:10b6:806:26d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Sat, 19 Aug
 2023 00:29:20 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:4:ae:cafe::57) by DM5PR07CA0095.outlook.office365.com
 (2603:10b6:4:ae::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.17 via Frontend
 Transport; Sat, 19 Aug 2023 00:29:19 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.211) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Sat, 19 Aug 2023 00:29:19 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 18 Aug
 2023 19:29:18 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 18 Aug
 2023 17:29:18 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 18 Aug 2023 19:29:17 -0500
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
X-Inumbo-ID: 725a0d22-3e27-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FofzKqMoQmBzi3NAKRtGjNZ7gDO8O3qYJMtNLTY4jfI0J9l88NXmvPqU+Rl+VFnu+rOo4g8oniXfzd4uVE+S0ASdfbg8XMLtVxGjLqnR/vUbHJs5ulKF2+Pd9TVflQjr396W/w4G2YLRGXPFkX3uYPd4innfWGZVp6IpYqHrIuFb6ssZ9TZzR7eKnrfKCQ/3dkSa5M8iYiIvf7IlMPHoaEmlBeUBxnHF5LeWXjRhZ9O0J6Sk4kjp2JcRXB16xke3SOzufL8aViQwbpMDnd/9tvBZOMTzqXnstTUHbGbqn4D0jlEC8Xj3tCqraWJjRapZ7aSqgqPh74lrZR0Ffgjl5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TSMRF97QlKBb4iu384YTAKHEZ9yf+f7ss37J2EfX8aY=;
 b=FDBhISok0p87Xj4mjb8VJYNyXpwX+DaURrGtt2lwvP8wm4MKKBMDMgmkguywkQxaBPIM4ycqQOWBTLkMg4ru28lV0Nz79nAd2e3aMJkSWZe6h0tgy1q8dCX7Rff6a5mEnrfBWk2TLtDKcke6F1st8hs6REsMdZo2jOz5RcK+4Iuc6I32DXVcWBCUcI+XSpne8PMqKlPdNhU4ZpuXzVnH1MKi9yoKfa5wfA6nwMks8sSmqVbAI/OJxVKSbOHiGzlkKVMd6tTkUG6o+F8ZVf0q0qolgh53aShA+diFK2h+ujWWR5sb9Z1omopwkKrSHtS8XU4jM/LQVrEdp4Hm/o5kFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TSMRF97QlKBb4iu384YTAKHEZ9yf+f7ss37J2EfX8aY=;
 b=e7eKMeOf3UMWT6ebZKwaQp8Qxdt6XFVAQNNiUxX4EN8vOErTXASynhroq5St2ufeMPObQN41fODLw1XSnYnJl7nDhNjK4mL7U42hl8WM84sozIS2DBMDYi8LnGQt0Qh/i9UT2uDXeE2RaoD/0vzdXlT3/TW2ZoaB7FqHSFLIHsQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <jbeulich@suse.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>
Subject: [XEN][PATCH v9 17/19] tools/libs/ctrl: Implement new xc interfaces for dt overlay
Date: Fri, 18 Aug 2023 17:28:48 -0700
Message-ID: <20230819002850.32349-18-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230819002850.32349-1-vikram.garhwal@amd.com>
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|SN7PR12MB6671:EE_
X-MS-Office365-Filtering-Correlation-Id: f99f7a5d-6375-43e7-06e2-08dba04b541b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1K0gE38sTvjRKD5yVLhsaFTRw9Xpm6g/UX13ez/FuIxkjDdU0iW6r0FxRUZ2f/nfq29VBKjh7ZQ5UtA2G0gTKsi3Mln6rjzbQ87NAudoZtDuYX2F3XGaag49tRYte5Cq1cK2vvZOawIaFhQHhoir3Kzk5i/YasM6FocFhb6Q4ywnIR+s1F+K2xGECUgBn6MAneL9r5fRj7TL+OWMZMYVDsA0q03sNWjv7dRuTIvc6dHQsCPsyWdC2bjEA8RQQReqTAglfBNXug3SoNlm2GYIiFPAc5cAzYRowfqimZBIMT9SpLU3p6TkLHayaAtjLzQOJmRrp2/i97zdSHLz89/HknK8qjC10oMgsLPHs1ezXonW+Zois0oADm5MhHRqnONox7P9vvfSMDCi1/w1sB+IfM8l0E2g0B5fFaoE0WAULwE0pMQa+VHRf6GeYLxTbeXZezI2CbhztAndu6uG2I7gQGwhwh7Ep0QoSbmZXySd5eebwEy9VGojt3pghNuey0lN2qdFk3QDNlUUvk5dEHpwbR+zzAcSJ/rDO/7BglzqaUArJmlev/YqZLFZ8a/mCYP80N+V5LDHJ+dh8mY31mkv+BsI5SCOtrnv6G83HQxAGnVCpiiVFGm/7lBttYfECAdsPjuIpRQFe6p9AF4T6aAZwDqjWR4FDzxvvEzxifrh2ek01XS1sq46K8fKqDtwuEWH/LyK5OPcL0jGuS8YStKVfFY+dwIF8YY5KI09EeywLiGV13T8uA/sujsIpIrodxfHBVucYg+4KGXIRdOht9+VwIM/uam7mjrrjPYkphkpWvI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(136003)(346002)(376002)(1800799009)(82310400011)(186009)(451199024)(40470700004)(46966006)(36840700001)(40480700001)(40460700003)(47076005)(426003)(2906002)(36860700001)(336012)(70586007)(6916009)(70206006)(478600001)(54906003)(6666004)(316002)(44832011)(2616005)(4326008)(1076003)(8676002)(8936002)(41300700001)(26005)(5660300002)(86362001)(36756003)(82740400003)(81166007)(356005)(2004002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2023 00:29:19.6012
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f99f7a5d-6375-43e7-06e2-08dba04b541b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6671

xc_dt_overlay() sends the device tree binary overlay, size of .dtbo and overlay
operation type i.e. add or remove to xen.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 tools/include/xenctrl.h         |  5 ++++
 tools/libs/ctrl/Makefile.common |  1 +
 tools/libs/ctrl/xc_dt_overlay.c | 51 +++++++++++++++++++++++++++++++++
 3 files changed, 57 insertions(+)
 create mode 100644 tools/libs/ctrl/xc_dt_overlay.c

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index faec1dd824..3da602586c 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -2643,6 +2643,11 @@ int xc_livepatch_replace(xc_interface *xch, char *name, uint32_t timeout, uint32
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
index 0000000000..58283b9ef6
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
+    sysctl.u.dt_overlay.pad[0]= 0;
+    sysctl.u.dt_overlay.pad[1]= 0;
+    sysctl.u.dt_overlay.pad[2]= 0;
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


