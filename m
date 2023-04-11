Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DB86DE77A
	for <lists+xen-devel@lfdr.de>; Wed, 12 Apr 2023 00:48:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519973.807158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmMmX-0006Mz-Ei; Tue, 11 Apr 2023 22:48:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519973.807158; Tue, 11 Apr 2023 22:48:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmMmX-0006HK-7N; Tue, 11 Apr 2023 22:48:09 +0000
Received: by outflank-mailman (input) for mailman id 519973;
 Tue, 11 Apr 2023 22:48:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOX4=AC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pmMmV-00060o-E8
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 22:48:07 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20610.outbound.protection.outlook.com
 [2a01:111:f400:fe59::610])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb0ae277-d8ba-11ed-b21e-6b7b168915f2;
 Wed, 12 Apr 2023 00:48:05 +0200 (CEST)
Received: from CYZPR12CA0016.namprd12.prod.outlook.com (2603:10b6:930:8b::29)
 by IA0PR12MB8696.namprd12.prod.outlook.com (2603:10b6:208:48f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 22:48:01 +0000
Received: from CY4PEPF0000C97D.namprd02.prod.outlook.com
 (2603:10b6:930:8b:cafe::f) by CYZPR12CA0016.outlook.office365.com
 (2603:10b6:930:8b::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36 via Frontend
 Transport; Tue, 11 Apr 2023 22:48:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C97D.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.25 via Frontend Transport; Tue, 11 Apr 2023 22:48:01 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 17:47:59 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 15:47:59 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 17:47:58 -0500
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
X-Inumbo-ID: eb0ae277-d8ba-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JRCZk4s7Ii4EdN1B74IqEOBLTVU1HXBuT1qc5KzCanwkL6+fzGV3JXjHWjuI6deXYHABYS0YYSRmi5IRb8CulQAPLl0YxFh1M55E4Sv+smIvWSycac1Ra0gCOrtNZgoR9SoF9f7JJjBcTs1lSXCxyWfhn4f/Guy6BI3oW7ZHKaZsJbadhQXdfvZ6VLd5R7xFCy8YAOBXgIlM5cpMIldwiOswb8S4si4hgg0prtLf5HfdQwysRRDN5H0RJ62C2bIpzrvqLrioOmxKmP18cGqUdd0f3Al2NL3ThsBSO5lxMc/0qOPmOVAN8fbPwtg+yndESNYOnPVMcUi3aMJVy3G4+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/uOpZiqStaRi7+Ygxu1TUCLhyLdSY+19OW/XA3O2IUs=;
 b=M/Hr1cvtNvi17dGN0v5w1aKj6s+7gnihp0iCHuBDtGtRnOPo+0JmcUXrDxAvm0hh/6/UHzrr7iD74GXu1fOxl4lNYXOGmWu8DsQ1U5CwNsGOsZHvzbQ6UILYFtqrFfPcZ80tzzdWTBkwNboEwLxSSvMQ4xQblzgSjZl6TwgAopYAhT3KqghmDNUKuj3DPqzj4jcgfUneumnoUcNE1sejiuLaSpjW+3hi8IAn1MWDCvbvm06eOdbqoPubnDweI3/rcC6v23CIXFNa4/WP9lPq5CmxwLOhseXeTuRQM8w4YWI16Yv5twybk/pa2CH7iP2NpTf30Pn8M4MobRGTKGnYkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/uOpZiqStaRi7+Ygxu1TUCLhyLdSY+19OW/XA3O2IUs=;
 b=FQLqW+DEDlfSpoOhisp8UwcBcnJgYmAPdKvPrI1o19LHPtgG1FsWFUXsyrr3PWXnM0Gzv7wWPEase5Qj+J1zkdwaKhi68Q7JZiej9HrfN1eKW5RZ+CcP3ZucphlwuTR9B1hlWs4M9TVhTfLN3ywqZ36iLcL6GWMpc+TqPNvrpOg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, <vikram.garhwal@amd.com>,
	<stefano.stabellini@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
Subject: [QEMU][PATCH v6 06/10] hw/xen/xen-hvm-common: skip ioreq creation on ioreq registration failure
Date: Tue, 11 Apr 2023 15:47:42 -0700
Message-ID: <20230411224746.16152-7-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230411224746.16152-1-vikram.garhwal@amd.com>
References: <20230411224746.16152-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C97D:EE_|IA0PR12MB8696:EE_
X-MS-Office365-Filtering-Correlation-Id: 30eacd88-8e45-4048-b00d-08db3adecdca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7bPuRk+3vt1vNfZklRi2A3XGXwTsjmGSTcl6GZ1Qq8+OVNH5kuDrflKxNZiU7bc9Bi8FObp9zgOoFNy/qY0g/tOYXhGPs1IGsMHY68Qhtbf5C6MMFflErcyX9sTYH/SrsrK2j9Uo7ByurFOR0nstFu6pMGdKLRtN2GG6jKvjFAM+lmqaGR6x05+GUSv62PlWwNQRXfO57Fj5JffZTc4FfGr92To6qkLKXu747pFegzr3YtAGtRkJo+IVI3AxnXYNjeRm/Q+WYOzYz8Q2e+wrHTJRJER5DxI5tqlyTB6LRloybU/TrUGGHgM8dnWyNt5FAfGwR2Hz7yZjx3d5fPw7Yfqxt43iWiCPNebZVWjTIuXlYElnA/Z1m7PXiEyeHMxAkOll6zMszqM6VQG2bwdKtE/KbCgSpv1HaG5CUL6F3RW0+yzeMv8+gL6DsaVgH/9U7meqVY/BPr1fOfnCzTk4LgVILrQwtitX/M8Eis1+4HKzm5EQep+jemW5WUmHbqtqKJtauL7R83fNzBc6GQnsvPq2o/ddL/UEWcyPD9hgI7hr1oY7C4VF3C0AqoPi0GJkphheouYVUVpt61kXMgsuDwtdsMDGaZjbM2IM+wgYNW7pnBZmz1IU1L+Zfpno8XGkUtnsx0SL9JbGL3mcxc8foH3hHUKVa1Y/E+i6YNLL47jSB53Ua/Gk/6GPs3qa3SY+dv5t2+qnnztzQp2Qymg7+NFOg2HOnr1G2TitAs63I8A=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(346002)(136003)(451199021)(36840700001)(46966006)(40470700004)(26005)(6916009)(70206006)(1076003)(4326008)(86362001)(70586007)(316002)(186003)(40460700003)(36756003)(6666004)(54906003)(36860700001)(40480700001)(478600001)(8936002)(8676002)(2616005)(5660300002)(356005)(41300700001)(81166007)(2906002)(44832011)(47076005)(82310400005)(426003)(336012)(83380400001)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 22:48:01.1414
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30eacd88-8e45-4048-b00d-08db3adecdca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000C97D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8696

From: Stefano Stabellini <stefano.stabellini@amd.com>

On ARM it is possible to have a functioning xenpv machine with only the
PV backends and no IOREQ server. If the IOREQ server creation fails continue
to the PV backends initialization.

Also, moved the IOREQ registration and mapping subroutine to new function
xen_do_ioreq_register().

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Paul Durrant <paul@xen.org>
---
 hw/xen/xen-hvm-common.c | 57 +++++++++++++++++++++++++++--------------
 1 file changed, 38 insertions(+), 19 deletions(-)

diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index a31b067404..cb82f4b83d 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -764,27 +764,12 @@ void xen_shutdown_fatal_error(const char *fmt, ...)
     qemu_system_shutdown_request(SHUTDOWN_CAUSE_HOST_ERROR);
 }
 
-void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
-                        MemoryListener xen_memory_listener)
+static void xen_do_ioreq_register(XenIOState *state,
+                                           unsigned int max_cpus,
+                                           MemoryListener xen_memory_listener)
 {
     int i, rc;
 
-    setup_xen_backend_ops();
-
-    state->xce_handle = qemu_xen_evtchn_open();
-    if (state->xce_handle == NULL) {
-        perror("xen: event channel open");
-        goto err;
-    }
-
-    state->xenstore = xs_daemon_open();
-    if (state->xenstore == NULL) {
-        perror("xen: xenstore open");
-        goto err;
-    }
-
-    xen_create_ioreq_server(xen_domid, &state->ioservid);
-
     state->exit.notify = xen_exit_notifier;
     qemu_add_exit_notifier(&state->exit);
 
@@ -849,12 +834,46 @@ void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
     QLIST_INIT(&state->dev_list);
     device_listener_register(&state->device_listener);
 
+    return;
+
+err:
+    error_report("xen hardware virtual machine initialisation failed");
+    exit(1);
+}
+
+void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
+                        MemoryListener xen_memory_listener)
+{
+    int rc;
+
+    setup_xen_backend_ops();
+
+    state->xce_handle = qemu_xen_evtchn_open();
+    if (state->xce_handle == NULL) {
+        perror("xen: event channel open");
+        goto err;
+    }
+
+    state->xenstore = xs_daemon_open();
+    if (state->xenstore == NULL) {
+        perror("xen: xenstore open");
+        goto err;
+    }
+
+    rc = xen_create_ioreq_server(xen_domid, &state->ioservid);
+    if (!rc) {
+        xen_do_ioreq_register(state, max_cpus, xen_memory_listener);
+    } else {
+        warn_report("xen: failed to create ioreq server");
+    }
+
     xen_bus_init();
 
     xen_be_init();
 
     return;
+
 err:
-    error_report("xen hardware virtual machine initialisation failed");
+    error_report("xen hardware virtual machine backend registration failed");
     exit(1);
 }
-- 
2.17.0


