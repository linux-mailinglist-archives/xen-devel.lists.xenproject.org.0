Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF9D63FE6C
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 04:01:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451352.709094 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0wI0-0008J0-Mz; Fri, 02 Dec 2022 03:00:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451352.709094; Fri, 02 Dec 2022 03:00:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0wI0-0008Di-Hs; Fri, 02 Dec 2022 03:00:36 +0000
Received: by outflank-mailman (input) for mailman id 451352;
 Fri, 02 Dec 2022 03:00:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VP6A=4A=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1p0wHy-0007SV-4I
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 03:00:34 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20621.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7c2b9a71-71ed-11ed-8fd2-01056ac49cbb;
 Fri, 02 Dec 2022 04:00:33 +0100 (CET)
Received: from DM6PR13CA0062.namprd13.prod.outlook.com (2603:10b6:5:134::39)
 by IA1PR12MB6164.namprd12.prod.outlook.com (2603:10b6:208:3e8::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Fri, 2 Dec
 2022 03:00:30 +0000
Received: from DM6NAM11FT089.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:134:cafe::80) by DM6PR13CA0062.outlook.office365.com
 (2603:10b6:5:134::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5901.8 via Frontend
 Transport; Fri, 2 Dec 2022 03:00:29 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT089.mail.protection.outlook.com (10.13.173.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.10 via Frontend Transport; Fri, 2 Dec 2022 03:00:29 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Dec
 2022 21:00:28 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 1 Dec 2022 21:00:28 -0600
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
X-Inumbo-ID: 7c2b9a71-71ed-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cAcCj6X6VcToDutxcWbGh9M5C1dT4Z7wkI1ROwMB0Nrt6o+RJgIMPKh8iaJ2beMPzW9HWTKe8wWBm3vuVbWEubSLFLfjrWL7HulKCCLlVPykzaUG8pgVa1l/ZsySMYohQlV/UL3X+jOeUslqB9HXyn3EIVNiQLybdJJtVE9ui2HaPcU+mS2bWmTiwZjyTRDYgM71S0kEvlzHuCrcsfxODCbG2Axhq+WxSLDj3Qr5aW+QxC+SQSzRUNa7z+cGdxr+N02tbPngLVbQauCZ34Pm/aoqNAwyH3r5MNWEWz7VOzduAYkZeZ85GQ17i6FuGubHkckY7KxQ2drVFlL8PMJk6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1tmPXHFcSNBA9C2WI+chAUP3UxlxvRCN1nMeGlpHbSc=;
 b=HHCqmO/A/ljnO5xzSAzDr1JpETeE0hAIshMFk4cpHLcAAr2w3cEV0ZGSo1CMyXXFA0DCykVZBbvA3rXkKdek4XQK4B9URJvKkJkEb6ve184ndSFgdILFkc/vyctoAWtSNkbkC1yavIwCLK1xw4XqegMSXV/k+MfR0bJlGB4iajPgAoZaU7IxVevKbv/oI6s088Ji3lYH88WiB0xA/3OE1mlfEoBTjyAFTl9EVRGK3DnxXslU5FD2SxSLWO3yMFMuOM+L9cMNr03Qvf02rXPxTCHU/xcHzzwyCyon45MzOhpnq6qlSP+liB5Ib1s+jh4OqZTPFjCDbyHjF+QneTLBJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xilinx.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1tmPXHFcSNBA9C2WI+chAUP3UxlxvRCN1nMeGlpHbSc=;
 b=T+KKDIIUdguZCp2FdwVml7HkpDqMNvzokKxr8tyrUpzLYwlQ9u4zGSGJwvKYmhyFW74yjpYJTZJbHwt3N/bXxXA91dWq2bcYNiTSd7gT9As0Im+w+WLRh2wz5qxFyi32QaUQep8lFNH8dHjufO6rZOHYSpgZsXDTv7Xk4uEDv3Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-dev@xilinx.com>
CC: <stefano.stabellini@amd.com>, <alex.bennee@linaro.org>,
	<xen-devel@lists.xenproject.org>, Vikram Garhwal <vikram.garhwal@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Anthony Perard
	<anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, "open list:All
 patches CC here" <qemu-devel@nongnu.org>
Subject: [QEMU][PATCH v2 07/11] hw/xen/xen-hvm-common: Use g_new and error_setg_errno
Date: Thu, 1 Dec 2022 18:59:59 -0800
Message-ID: <20221202030003.11441-8-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221202030003.11441-1-vikram.garhwal@amd.com>
References: <20221202030003.11441-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT089:EE_|IA1PR12MB6164:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d304450-0196-4d2e-2454-08dad4115ec7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0N/mae+qa86dlBpV6da/C+ijMUknsc1rpJlANABRVoeFirZDIjxVEa7UP+FvXKBAyNgXfFQVXqMrKxOYJfvdjye9O2IUIX9dV1uKHgM2GfHH02GoVmxLVsg8q1DEL+eCycD5pajmOAqSfEIA4wWOENmG1dxVLe0OpHcpmA96YBaBfI+Tlg84urLfFBLhdAeAOTeJxMI88ipfTSfTBdtQiwhHnc8IgmV2sHhIS8EGQgyqlIr8yXc4iwChL4C2PuxeB1aDfYbM6PSYt4LeNtrfVseIxfc2mrfukmJhoHV2Xw6+d2+ITKPVQ6twyIwjxqCE+gxC/0jIxV+gMyetzY0Z7VjQz1RULTBOxKBsKO3xxtpZsulYnmwUBp/EwfP5y1HQtfdVVpM6ojm5pN4FZNd5QnhJtfnOV2JjCyRGrubjOMgWriBY2p6+60rwDaeviUfcyb7T+XFs0/c+ABYIxIfuVBWH8FF7s4PBWjj+eyqIBuRvdKIXj/V9KWdXU6tdJzUWw1xCF+lGPaTgyGkG6XIm7PDQH/QsYnvScFFb4ZOBEoa/3IJtcQdvy80eJp9/zp2/RYC/u3K5pPQElcz5u8MAdb8Cv+T3b7ivjnRtpzphBS3QCWzqjloJQo09ZvjR30+zWM4QHWY8/HMXdlAwWPRBNpBK/X/0yxLN97QB1U/Z/9Mc/vDXNXCYO6JvwFSowXBjiZjwK7bk25iC7Ar56Crt0vLkruwRDDDl3yQj7wXvr8s=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199015)(36840700001)(46966006)(40470700004)(2906002)(44832011)(5660300002)(41300700001)(6862004)(8936002)(40460700003)(36860700001)(70206006)(70586007)(8676002)(4326008)(36756003)(54906003)(316002)(6666004)(1076003)(336012)(82310400005)(478600001)(26005)(86362001)(2616005)(47076005)(186003)(426003)(82740400003)(83380400001)(356005)(40480700001)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 03:00:29.5050
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d304450-0196-4d2e-2454-08dad4115ec7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT089.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6164

Replace g_malloc with g_new and perror with error_setg_errno.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 hw/xen/xen-hvm-common.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index 03128e575b..4ba5141fa2 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -34,7 +34,7 @@ void xen_ram_alloc(ram_addr_t ram_addr, ram_addr_t size, MemoryRegion *mr,
     trace_xen_ram_alloc(ram_addr, size);
 
     nr_pfn = size >> TARGET_PAGE_BITS;
-    pfn_list = g_malloc(sizeof (*pfn_list) * nr_pfn);
+    pfn_list = g_new(xen_pfn_t, nr_pfn);
 
     for (i = 0; i < nr_pfn; i++) {
         pfn_list[i] = (ram_addr >> TARGET_PAGE_BITS) + i;
@@ -717,7 +717,7 @@ void destroy_hvm_domain(bool reboot)
     xc_interface *xc_handle;
     int sts;
     int rc;
-
+    Error *errp = NULL;
     unsigned int reason = reboot ? SHUTDOWN_reboot : SHUTDOWN_poweroff;
 
     if (xen_dmod) {
@@ -726,7 +726,7 @@ void destroy_hvm_domain(bool reboot)
             return;
         }
         if (errno != ENOTTY /* old Xen */) {
-            perror("xendevicemodel_shutdown failed");
+            error_setg_errno(&errp, errno, "xendevicemodel_shutdown failed");
         }
         /* well, try the old thing then */
     }
@@ -797,7 +797,7 @@ static void xen_do_ioreq_register(XenIOState *state,
     }
 
     /* Note: cpus is empty at this point in init */
-    state->cpu_by_vcpu_id = g_malloc0(max_cpus * sizeof(CPUState *));
+    state->cpu_by_vcpu_id = g_new0(CPUState *, max_cpus);
 
     rc = xen_set_ioreq_server_state(xen_domid, state->ioservid, true);
     if (rc < 0) {
@@ -806,7 +806,7 @@ static void xen_do_ioreq_register(XenIOState *state,
         goto err;
     }
 
-    state->ioreq_local_port = g_malloc0(max_cpus * sizeof (evtchn_port_t));
+    state->ioreq_local_port = g_new0(evtchn_port_t, max_cpus);
 
     /* FIXME: how about if we overflow the page here? */
     for (i = 0; i < max_cpus; i++) {
@@ -857,16 +857,17 @@ void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
                         MemoryListener xen_memory_listener)
 {
     int rc;
+    Error *errp = NULL;
 
     state->xce_handle = xenevtchn_open(NULL, 0);
     if (state->xce_handle == NULL) {
-        perror("xen: event channel open");
+        error_setg_errno(&errp, errno, "xen: event channel open");
         goto err;
     }
 
     state->xenstore = xs_daemon_open();
     if (state->xenstore == NULL) {
-        perror("xen: xenstore open");
+        error_setg_errno(&errp, errno, "xen: xenstore open");
         goto err;
     }
 
-- 
2.17.0


