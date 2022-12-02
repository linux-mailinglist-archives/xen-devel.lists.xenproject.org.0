Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E1B63FE6F
	for <lists+xen-devel@lfdr.de>; Fri,  2 Dec 2022 04:01:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451349.709073 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0wHz-0007uj-Cg; Fri, 02 Dec 2022 03:00:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451349.709073; Fri, 02 Dec 2022 03:00:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0wHz-0007rm-7i; Fri, 02 Dec 2022 03:00:35 +0000
Received: by outflank-mailman (input) for mailman id 451349;
 Fri, 02 Dec 2022 03:00:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VP6A=4A=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1p0wHx-000723-7i
 for xen-devel@lists.xenproject.org; Fri, 02 Dec 2022 03:00:33 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20603.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7b6687a5-71ed-11ed-91b6-6bf2151ebd3b;
 Fri, 02 Dec 2022 04:00:32 +0100 (CET)
Received: from DS7PR05CA0002.namprd05.prod.outlook.com (2603:10b6:5:3b9::7) by
 SN7PR12MB6691.namprd12.prod.outlook.com (2603:10b6:806:271::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.23; Fri, 2 Dec 2022 03:00:28 +0000
Received: from DM6NAM11FT082.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b9:cafe::8c) by DS7PR05CA0002.outlook.office365.com
 (2603:10b6:5:3b9::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8 via Frontend
 Transport; Fri, 2 Dec 2022 03:00:28 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT082.mail.protection.outlook.com (10.13.173.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.10 via Frontend Transport; Fri, 2 Dec 2022 03:00:28 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Dec
 2022 21:00:27 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 1 Dec 2022 21:00:27 -0600
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
X-Inumbo-ID: 7b6687a5-71ed-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E/w54uctNl1NIZaOHl5i9kGa0YNO308rr13xsV0u2MjImQK6z1SQheBHw4gXUIJ9mht5hAp+m25XSTIhIBDO0HDOZ8n7C44SH30EDZNf6v7uRmAAoxZ//FP1D9dFko/KS4mCyuvZPndlgxDiDCG6I5j/attPb658mXRI5MdM0LOq63OvesdrRhVm6tBGQFjjFhVABnoBvwO22Ttxy5rhgRJneroFI859bYGDA8XYNHVg8OXVZ9NTGqPr/4+pHO9FW5ww/86z5hqV01Yo2CUkawgxOAmmPwrRq0gP/PxflVX8ooRA2Gl90zCJn6bdU4vo1m4Dh/RsQ4zX4pFJETft4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xRRFGuFvueAPG6dlfB7wV8P+a2w87xfPGOLdmtUaYEQ=;
 b=k1Yr3MFayRr2IbB21sR/cIzsYcOAQYr15iVnz0F6tTwsz99VJnIm+BZtWO6DfX4dq4xczcwZukooQa3sMC/Z/uatf0YBeubGmI9BHoJkxjggv588Y1tpQDZzh3H5NAmaNzz3NpFvdoW56ly2PZQ/zI/vBAAW5aBncfOFUvcPxlHAeenWfggyHekiOw+V1W92fHQU79UqPRlx9UI0qjyDzddBC/OpSXlNTep0hXSMwhW1hCG37j9Ww7q0/Q6bv8ZCLjiSwh9z/38nD229h90zXuUNCaxZrAy0NDLpxKUK/YcxTRxyKbosu1efxq5UyxN4HTc220YwaMzn8qlLJmvJLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xilinx.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xRRFGuFvueAPG6dlfB7wV8P+a2w87xfPGOLdmtUaYEQ=;
 b=WwU0mr8aEdWQJfTOWZswgdfut0GBVpJ1enjkYcaoKHxOjnQ3g2dqopDf8xgpp1EwSCbu4mY3I2NtDzOxFv2Tcf3R7FYnwHU66MiAvOXDPrjFVHBCr7POtx+uu9Zf3I3mfuhIV59znJuMFEBkb9PkGDPtxO1e/f1jCN5iEov0orI=
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
Subject: [QEMU][PATCH v2 06/11] hw/xen/xen-hvm-common: skip ioreq creation on ioreq registration failure
Date: Thu, 1 Dec 2022 18:59:58 -0800
Message-ID: <20221202030003.11441-7-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221202030003.11441-1-vikram.garhwal@amd.com>
References: <20221202030003.11441-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT082:EE_|SN7PR12MB6691:EE_
X-MS-Office365-Filtering-Correlation-Id: d5d4f986-cd74-4394-b671-08dad4115e10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	R6P/4L0WAuvMM8GigcCf4H+ucbHUctxiU/7vgN1my/AjUhqUDFAJgr2RvaQj+3+MlKFD0Pxa6RIGZk9WZ5ITv5tOVabuKcwhwW5PHj/ZqRhkcXrH1m0H0PSSLu8Q4uI4jh5LsJ3IWhHAkeLe7VljXh+a1Mu0bz0p7XgAe14JsPJJjS4KcwwdtElCXmY157PhaAtJMz3JC4AQcyAhltgBNz+6RMftGZt5T6qcFu5UUFtYFcU561m/2i7yn/3zHKdQ90ecsC/ycib/yQ3lyERA1aIx6R24eOAqkTI//TWKyZypV4POLSoDVCzalUC/kaucNkSbHcwX8OAweOwO2/AYSf8iNgtzozvUV1H8jqRoUZJ/kvGvBJGFTRJTH/f7hWnQMxBFyyGLwMHbDFJqGaYYqErMuLWDZTkuzTP1nCDTejrKaZy6l5JKqGCFnf47/VmUcu/sOdu3Hz4ipshkFsaiVfPNFUPmRKJOEa8meRA7hUeEm+uJxN5bq8QyvRUuQrkCcwZ98OP7VdswA+lPqV207T/6xucFJ9RSoGJnhoIvA7nznU2iGb3v0EVPwvMfvOEChe2RZl4G37BLZkNzisQyA2g25DFT23LTxRq2rMtTQ99tUGc/hB5kyhvBbrePTpKdKi5K1K7Hae0kNS9kNSTZ/7xwoLzubRAmudjuWvP5EDLZNyTDz4/5oPTz9+QEe1Jftt8w7i0mTlqpfEpUH7mj3G9Q0JKSdaf5yo9Lp5/hpIA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(39860400002)(346002)(376002)(451199015)(36840700001)(40470700004)(46966006)(6666004)(86362001)(2616005)(356005)(70206006)(41300700001)(1076003)(81166007)(26005)(8676002)(316002)(40460700003)(54906003)(4326008)(82740400003)(36756003)(40480700001)(36860700001)(186003)(70586007)(82310400005)(2906002)(83380400001)(5660300002)(8936002)(6862004)(47076005)(426003)(336012)(44832011)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2022 03:00:28.3251
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5d4f986-cd74-4394-b671-08dad4115e10
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT082.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6691

From: Stefano Stabellini <stefano.stabellini@amd.com>

On ARM it is possible to have a functioning xenpv machine with only the
PV backends and no IOREQ server. If the IOREQ server creation fails continue
to the PV backends initialization.

Also, moved the IOREQ registration and mapping subroutine to new function
xen_do_ioreq_register().

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 hw/xen/xen-hvm-common.c | 53 ++++++++++++++++++++++++++++-------------
 1 file changed, 36 insertions(+), 17 deletions(-)

diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index 403b2eebbf..03128e575b 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -777,25 +777,12 @@ err:
     exit(1);
 }
 
-void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
-                        MemoryListener xen_memory_listener)
+static void xen_do_ioreq_register(XenIOState *state,
+                                           unsigned int max_cpus,
+                                           MemoryListener xen_memory_listener)
 {
     int i, rc;
 
-    state->xce_handle = xenevtchn_open(NULL, 0);
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
 
@@ -859,10 +846,42 @@ void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
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
+    state->xce_handle = xenevtchn_open(NULL, 0);
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
 
     return;
+
 err:
-    error_report("xen hardware virtual machine initialisation failed");
+    error_report("xen hardware virtual machine backend registration failed");
     exit(1);
 }
-- 
2.17.0


