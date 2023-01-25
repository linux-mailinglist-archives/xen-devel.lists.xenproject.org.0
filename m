Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD6367ACEC
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 09:56:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483961.750433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKbZp-00011v-Ry; Wed, 25 Jan 2023 08:56:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483961.750433; Wed, 25 Jan 2023 08:56:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKbZp-0000zO-Od; Wed, 25 Jan 2023 08:56:17 +0000
Received: by outflank-mailman (input) for mailman id 483961;
 Wed, 25 Jan 2023 08:56:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6g1N=5W=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pKbZo-0000CY-S5
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 08:56:16 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20624.outbound.protection.outlook.com
 [2a01:111:f400:7eab::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03a4143e-9c8e-11ed-b8d1-410ff93cb8f0;
 Wed, 25 Jan 2023 09:55:31 +0100 (CET)
Received: from DM6PR02CA0098.namprd02.prod.outlook.com (2603:10b6:5:1f4::39)
 by IA1PR12MB8312.namprd12.prod.outlook.com (2603:10b6:208:3fc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 08:54:45 +0000
Received: from DM6NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1f4:cafe::bd) by DM6PR02CA0098.outlook.office365.com
 (2603:10b6:5:1f4::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Wed, 25 Jan 2023 08:54:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT019.mail.protection.outlook.com (10.13.172.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6023.16 via Frontend Transport; Wed, 25 Jan 2023 08:54:45 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 25 Jan
 2023 02:54:44 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 25 Jan 2023 02:54:43 -0600
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
X-Inumbo-ID: 03a4143e-9c8e-11ed-b8d1-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c3x/o+4D0sGp88pcO1gKkDC1dYpkc8lXDZyi/Jpuavg/QFOcay8K4GWLg0aEYousnVIV6Y0BMcH+oPYLEEOlQNKdkEY0VHXNHpfk0uNDt7+DX6hgHC1NnCbC7jC+yUvWeirOEFWMmWXx66h4uSoSpFr6FNtUmb/ds+sFTrcHn1wRFnh/mz7Ce1MLH0yV6/vKEiM8ZGqaHnQXCziTuNvqDrgSeHqIZh+XzaOwJYOzmj+kV/godniKIk3JaCWLrJJ4KBWMoEAPH+SyAeJFRyCWEDivoUmXOQbBUyDREYLEdkbFudTELcIlhy8zYvYal2iTQtOHNgK4/OtkgEjUihjAxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URxTp3Cj5zWl6imZ6G51I5Cd2LY5Q6C4OO3dPqmmi+4=;
 b=C16Q07x/usFkzOGhugD9BMLkxA78/VLthsz70L0fb1vBaHmkY038W7lMS0aFc+jNBuRDiwtZ9bNecTFkLC4WbQkJZoNG5W7Y0Y5pcLDmlX+uH2/952fVL/TOdNGZNXXwCr3Mv506ckOLC/s1bntx7t4zG7uUnGE0BDwWC1qd0aGPSWWx5L9b23bFj7I6GFD4K/OFIqjbjNaqEfbQxP/6gx+3Iq1IrwmEI4EtfVUeKIp9pqyAAP2LcJAA3V/xJcfhEO5nnCcGsdGgBUffLKfxun4BIePcqvzz/YG8rPt7Vvch2oQTep+4EqyWaqzA/xPVf3miOQA2DRGq/HzzcHxUKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=URxTp3Cj5zWl6imZ6G51I5Cd2LY5Q6C4OO3dPqmmi+4=;
 b=d6jq8Y7r1TRgnT8lPajuS2J4PaZpnpyo3I8YTBfrP5H/pV4+DFDXUqYDdioSbj9HlXrVjH6VrK7d40Cv9YDW/vWcsr6sHWVCRzbUD49Vhu59doJTR25efWA+24Q2COsbhYk0p1JH750N2Nca4GPim5qZOKeA2vW36d1uZLL1IAU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <xen-devel@lists.xenproject.org>, <vikram.garhwal@amd.com>,
	<stefano.stabellini@amd.com>, <alex.bennee@linaro.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Anthony Perard <anthony.perard@citrix.com>, "Paul
 Durrant" <paul@xen.org>
Subject: [QEMU][PATCH v4 06/10] hw/xen/xen-hvm-common: skip ioreq creation on ioreq registration failure
Date: Wed, 25 Jan 2023 00:54:03 -0800
Message-ID: <20230125085407.7144-7-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230125085407.7144-1-vikram.garhwal@amd.com>
References: <20230125085407.7144-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT019:EE_|IA1PR12MB8312:EE_
X-MS-Office365-Filtering-Correlation-Id: 31b10660-926b-4149-e40c-08dafeb1ce6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	buVTwfv4QgoGRQlDDpuL3e5HpCFuDCYoHoHdNCKljxxFM5WAzSpcDUSM+Nn5Yh3NCIxqYu8PkkFnEauYb9k+nwl5sGSGZZLbIo5bn8X/P4qJ9llbbtVxaDxzysu1NZO9h1wi/Lka7hq3jqbWpFct2Z39VioPWlrp8Ok8lCaNr0HgqQeSRjMGqdiwtLIxVgKh5QwfClhDTyuWhf9Y3gV3us6gNMPPdUcsDvqLYfttp9gTofAUCiDU2T4OX5JYrmbsbXaciuSLEO/6+9DzZkH3tQwAX33oB0JRsheQcyFeudqB6BsJkISgvYFDMCNJqMX5tPM6LwrfhmDntZGDwvXhgFuG0/64SKj4JnpvtnYe+/2dib+TyAScqelfqwfg9PFiDX+ysVQEfjdOHRNK9oKZarJ/rtIVrUMoAZSdNMEA7z7wYNHj+KVt2pzx++oIeP2kCOp/pzGCKwc9LjCQeBo2PLLnirvVtz3wfiXNF0906Io1xe35vgtedQYYuTYCiAgurp/GEtBzg1gZxyAsLnRTfaCTQx27/fMZ5pGOQgptLi2HlxJh6bpa5S3JT6lWZAzGeEiX9uUt4l5NvlzkYlhnLeLu0q6wIaweRMfQIWw3whjpUuuk5K9W19e77zxjVFRJPTJp4gim4ypvj9KLWrcNAaejZ6WXYyK8zEy3tlOzBq/1q01e5ah+jMUb9hV9JC622TNobmjE9nTl1byyeiipH0J1QtUUeoBScuAemORZQXE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199018)(46966006)(40470700004)(36840700001)(36860700001)(83380400001)(426003)(336012)(54906003)(47076005)(6916009)(2616005)(478600001)(8676002)(186003)(36756003)(1076003)(70206006)(70586007)(356005)(2906002)(86362001)(82310400005)(82740400003)(41300700001)(81166007)(26005)(5660300002)(316002)(40480700001)(40460700003)(6666004)(44832011)(4326008)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 08:54:45.1409
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31b10660-926b-4149-e40c-08dafeb1ce6b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8312

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
index e748d8d423..94dbbe97ed 100644
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
 
@@ -859,12 +846,44 @@ void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
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
 
     xen_register_backend(state);
 
     return;
+
 err:
-    error_report("xen hardware virtual machine initialisation failed");
+    error_report("xen hardware virtual machine backend registration failed");
     exit(1);
 }
-- 
2.17.0


