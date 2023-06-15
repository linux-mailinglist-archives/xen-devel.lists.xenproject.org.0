Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71965730BE0
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 02:05:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549309.857790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9aUJ-0007Tx-6n; Thu, 15 Jun 2023 00:05:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549309.857790; Thu, 15 Jun 2023 00:05:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9aUJ-0007Rs-1L; Thu, 15 Jun 2023 00:05:19 +0000
Received: by outflank-mailman (input) for mailman id 549309;
 Thu, 15 Jun 2023 00:05:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WANU=CD=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1q9aUG-0006qD-JM
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 00:05:16 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061d.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::61d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d49ac78-0b10-11ee-8611-37d641c3527e;
 Thu, 15 Jun 2023 02:05:14 +0200 (CEST)
Received: from MW4PR04CA0297.namprd04.prod.outlook.com (2603:10b6:303:89::32)
 by LV8PR12MB9264.namprd12.prod.outlook.com (2603:10b6:408:1e8::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.46; Thu, 15 Jun
 2023 00:05:11 +0000
Received: from CO1NAM11FT080.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:89:cafe::64) by MW4PR04CA0297.outlook.office365.com
 (2603:10b6:303:89::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37 via Frontend
 Transport; Thu, 15 Jun 2023 00:05:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT080.mail.protection.outlook.com (10.13.174.99) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6500.23 via Frontend Transport; Thu, 15 Jun 2023 00:05:11 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 14 Jun
 2023 19:05:00 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Wed, 14 Jun
 2023 17:04:41 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Wed, 14 Jun 2023 19:04:41 -0500
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
X-Inumbo-ID: 4d49ac78-0b10-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XOLOC3gYsY/XiNArEWvXiyIdGiPal329t9AhSeiX+QTYt2cbGR0Q4iNCuHQOYqNwy2XFS8JeuNTPTqBa1dyOjyx2iItOvCYykCvTTw+MurNR2eAVbOBpWFt58a+K0psX1eFHBlxi1g/DqtVhZ8HOxFoY4dLJCNPwbTVjXp7Z9EAn8vL0oD7SwYSF06TCOFNHa+NAT/3OVMhN0hZCRO5/W0S+C2BgmJjQjaUXWcE+TJg71jcDjaJNlSyrij0szwfyoIy4oNRAzS/AIjY4zoE0yewC2vVr3ZGQeHjlW2ayKjjAyM+Bt45APaRMIlAACSuOrHbz1gsG02Qx9aLseFLv/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZW0E+n9RRUnGndVzyavBgx17Uvpm/5a+kbmKjIpu9A4=;
 b=agxGqRZl9xowsSaWFFt+qfUL47SDNnrm36X/j1QKbO3CGqQgrAtE0kUXwzwBP2OBDA+0iTKUYfaL4lh0aCKeDiZSEw5nVAn1Jata4GppUgxmdBGMI7RX0L0jg+56NL+HazJbBdIgx3glkuQj5BXx4pARImgU69icy+35M/is6ukAUDkMFZZBEDbU42ZR9slKBXZTWS7B5gKhMkDuFlDJ9B7RUAmZm5trOMCopfgBWqEPLXQXloWMqpmBQZzu1kecZ3pBYF9rc3z7IGZ1T6oHwg/9fFQrhRGcxl3cVUmorOfgDPou4kwvkIlhZiy7zwzaNbgwfJ5Pg5BCESaEQZRKog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZW0E+n9RRUnGndVzyavBgx17Uvpm/5a+kbmKjIpu9A4=;
 b=KwfEWYE1RYj7Hn1oxRyblfisG+7Nj90WCd7F/fD+K1uwMZpHNGiRcgg4ehotdsNPt+o7C6zNzi4jCuQbxou01ZYtOIlmbh2gHXUN8VWo9rGhrgbZQu2evHYXiCdeWtVsSld9BN/PcHmNKYeJg6Eb6inBXWaT3Wih/BxsX9r6Kvs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <sstabellini@kernel.org>, Stefano Stabellini <stefano.stabellini@amd.com>,
	Vikram Garhwal <vikram.garhwal@amd.com>, Anthony Perard
	<anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>, "open list:X86 Xen
 CPUs" <xen-devel@lists.xenproject.org>
Subject: [QEMU][PATCH v8 06/11] hw/xen/xen-hvm-common: skip ioreq creation on ioreq registration failure
Date: Wed, 14 Jun 2023 17:03:34 -0700
Message-ID: <20230615000340.1135-7-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230615000340.1135-1-vikram.garhwal@amd.com>
References: <20230615000340.1135-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT080:EE_|LV8PR12MB9264:EE_
X-MS-Office365-Filtering-Correlation-Id: f75a5b45-9d96-46cb-1c35-08db6d342ff5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	v5IT0s1Pcx8GVvmnrEedCYZMp0elMXcdr+dsGpoMBOfiTkCJGcVVsBRled1m1gylbLXKBsdOBOqLdRui0Dfmxu9tZBld2BuO04JiKkiCdE1ApzK5lJVTcOZ6baP6njeAkU8zcyRFWnrsQ/T3Pa2DvQa0Fbd2gYOR21oLYx9jlx32GFU4LbB+lroyyssBcWv9K0dTIDdZNqpByzf8Pz8U/iR1YG3m8vF3H3yTF9OdRW0YgrJlWnGpj0iJSTJEOwA24JjFlvNFEzbmP/PK9lEu32n25u+ynultWOKJrsR5dkdyMBVcRcCIbPQy3VjAWlDPDQZ7DXc6Cnljs0Tt+B1FtLhhkPtFWTgtaQa7MdgpQBHDvHBey8MHJ6bKTv9EwsOqqiu7bOiuEzoWLfUrlkf5gkyAmXTmqTB3/vOfUt4tQP6dk8lnnSghGOsPaXmOuQt5NQBTRtfX5rlMhVlnHkl5dnumLldUCzd1XRAPj61NvDXVfIQDFMBgWLzPOjuMbWp/Cq57MgFY2TKUDV2+RLCWyAAECizdTsEiLLtrWh/4A+n97gA+bXXq5szfhLM40gCa9AEOwJjOlcxZ3r3gpJlKniC1aMXMt6kylzsN8keDnJdzA+BOo+GefULzJ5iL32ldShPdoakm3U8zzhIFfiFM7WK75Z/VIO9/EkKtkd3/BfYnlYokNEQgR6HyFMIVlbDFUAvdABnq8KkCicsgO7ePMXYa+ANXAfqNO9q3VfvqrbAzJ9FEthz5tc/knyJDE+PUrEchaL1THqLZ9t0wYIp9Kg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(39860400002)(136003)(451199021)(40470700004)(46966006)(36840700001)(40460700003)(54906003)(6666004)(70206006)(70586007)(316002)(36860700001)(478600001)(4326008)(6916009)(36756003)(86362001)(2616005)(426003)(1076003)(83380400001)(26005)(186003)(336012)(5660300002)(8936002)(8676002)(41300700001)(2906002)(82310400005)(44832011)(40480700001)(81166007)(82740400003)(356005)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 00:05:11.1814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f75a5b45-9d96-46cb-1c35-08db6d342ff5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT080.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9264

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
2.17.1


