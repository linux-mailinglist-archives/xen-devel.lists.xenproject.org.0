Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F09868399F
	for <lists+xen-devel@lfdr.de>; Tue, 31 Jan 2023 23:52:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.487901.755725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMzUH-00018O-2o; Tue, 31 Jan 2023 22:52:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 487901.755725; Tue, 31 Jan 2023 22:52:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMzUG-000150-TB; Tue, 31 Jan 2023 22:52:24 +0000
Received: by outflank-mailman (input) for mailman id 487901;
 Tue, 31 Jan 2023 22:52:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=skZt=54=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pMzUF-0008Hj-1K
 for xen-devel@lists.xenproject.org; Tue, 31 Jan 2023 22:52:23 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20631.outbound.protection.outlook.com
 [2a01:111:f400:7e88::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eba51c86-a1b9-11ed-933c-83870f6b2ba8;
 Tue, 31 Jan 2023 23:52:22 +0100 (CET)
Received: from DM6PR03CA0043.namprd03.prod.outlook.com (2603:10b6:5:100::20)
 by CH2PR12MB4924.namprd12.prod.outlook.com (2603:10b6:610:6b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 22:52:18 +0000
Received: from DM6NAM11FT081.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:100:cafe::91) by DM6PR03CA0043.outlook.office365.com
 (2603:10b6:5:100::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38 via Frontend
 Transport; Tue, 31 Jan 2023 22:52:18 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT081.mail.protection.outlook.com (10.13.172.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6043.22 via Frontend Transport; Tue, 31 Jan 2023 22:52:17 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 31 Jan
 2023 16:52:17 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 31 Jan
 2023 16:52:17 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 31 Jan 2023 16:52:16 -0600
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
X-Inumbo-ID: eba51c86-a1b9-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cX79zuo1zxiVfTrZpwDba+Frk8MttNAnD09x4mWSx1PcnTbctu8cdkvNFXLNZ0n0K9a94klLX31GKCPgrJC/BLue+Fy62SxKaBdNbrK7jWpMEE2DqgrO3nzBJ10x/n81PYCVqH+C45+XiySoEBKLzFs0jgLNcb3GO++zZtiSYE4oDgH6ZCCkxbgUzj3FKCV/X9eV2YoJ+JSvli/IfMvLMnUe6NBS/IAC1AqZDNbyIz4C1lTophh68doSqSX5izLHrFazZL7lIXNYBXNAeYulX2VfqXwhBCjp+hkJH2UeCOe7Ys3+f2//WUwpYsA71nNItyJ9YWBhJ/rH2YH0ivZaiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ML6cs7eQSjHyFoTbA1vwZOtdpcA9OgOwmiba5kQ3iTM=;
 b=eMC9FtGmgTvg6Q/jI/19HDsEIERtbYfXBlfabidZ1mqusIttzUbymxsR0u2CgDGv96Sne07w8wyTgSTaAlFt4wjwyqFuqlYKXQPsWszixYRiUYDQZuVBLqEo79Osht3kXuU2bkF1s1tIHaXXrDuOtCL5tS08VJpAYHdurSmJRkaFX30T0qWjhVzsBwn/Zln9KykTjAb1AkKsGR0nBobfbEO9ORJ4JM/vyV39gd5PYnpev1hsoFSi5s+xRwt5wgeWsgy4dJz1l48YYffjc71jK/kXHqV9esbUtchrBtavt2FjUcPNAaXEvP6ru2tYbuAquvx2kRdXHVTkOkrjideyNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ML6cs7eQSjHyFoTbA1vwZOtdpcA9OgOwmiba5kQ3iTM=;
 b=WXfhAZE0/zoFH2j+/xCGXxNanlwaMMclZheYLmdoYfJqAywNNOFzVRWKxiCjoOiKSjaFeC7h0IvGFHpCR+wFwLcfrom7HAewtJkjZXEOkqHg7AbxdsCjCOw2hdTnywIhXKrgQenzfcQRc/3NRo5KotjAno8butAaz2AT5eywGCs=
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
Subject: [QEMU][PATCH v5 06/10] hw/xen/xen-hvm-common: skip ioreq creation on ioreq registration failure
Date: Tue, 31 Jan 2023 14:51:45 -0800
Message-ID: <20230131225149.14764-7-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230131225149.14764-1-vikram.garhwal@amd.com>
References: <20230131225149.14764-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT081:EE_|CH2PR12MB4924:EE_
X-MS-Office365-Filtering-Correlation-Id: 72553e62-25a8-4d7a-4d3a-08db03ddcdf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aDeS878/CJIXyQhsw3x3qt3R67/eDkg6cAHgF6/Cm/0mGhCkhQ45wZbamRZ2K0w82Xc3U/DTn67cSByi2xY6t9w1WzyqaycFXjQJYS3trgpO2l1aoWK2/cGnOSshD3drsWunKDGYHbQEFX1RpV9E1M1T6lxE9xCBd7NB4lv6Pj+24CX4xCU1M3llKbJ68sqVjZlzGbYUmk2A3T1ZZ+ux8pB7zXbuD5lNqjbAmqIddW2MZ9s6Qeo56nQQ8j+svpGDjww176CBmRZ897LlzDuKTeVlp5vyyGaCNxTl1NAbVggtk/fbVRg+0kZvpAvqxXbFn2gK+yht8bhtdClrNXhSdNUSk/1iqRtAH3w/lAV7JcxdK8J0Akku7xAs8iNBBWQ/pavaG023DljnXarlWECrP4+8cRkiZmWCRa5MPfA1YtG73xYU2FykLZTsx1r+009AVKzJ9BKVx7SLQoXqtU6VBzxtlFKc/WnSkX9CS0hvEjwMSOi/+Z1XHy9hA/oNzFwzYskn+Gbvzl+XCaKHyqpvxfukKb2aE4tDPMrDWb2ho3kTNpGFP7/nK8tY5LepkS/JppVqSIOXhFDnNAOs9e8N/509wqkP1SUXH6VBtuZpMZ5R1CKwCP62pMVQr0uUmagfXLKdEelwLkV6Rsts0HjPRTR71U76DLOHpgpygUvrfuhYfAWaEcySsR5BQJM2DepCtVwN7qp/dN8yibfbYTpkXDXrUt3+BN1Oy6gIVTUSsEw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(396003)(376002)(136003)(451199018)(36840700001)(40470700004)(46966006)(6666004)(41300700001)(36756003)(6916009)(70206006)(54906003)(316002)(8676002)(82310400005)(4326008)(8936002)(5660300002)(70586007)(86362001)(356005)(81166007)(82740400003)(36860700001)(186003)(1076003)(26005)(336012)(426003)(40480700001)(2906002)(40460700003)(44832011)(478600001)(47076005)(83380400001)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 22:52:17.9984
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72553e62-25a8-4d7a-4d3a-08db03ddcdf2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT081.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4924

From: Stefano Stabellini <stefano.stabellini@amd.com>

On ARM it is possible to have a functioning xenpv machine with only the
PV backends and no IOREQ server. If the IOREQ server creation fails continue
to the PV backends initialization.

Also, moved the IOREQ registration and mapping subroutine to new function
xen_do_ioreq_register().

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 hw/xen/xen-hvm-common.c | 53 ++++++++++++++++++++++++++++-------------
 1 file changed, 36 insertions(+), 17 deletions(-)

diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
index c2e1e08124..5e3c7b073f 100644
--- a/hw/xen/xen-hvm-common.c
+++ b/hw/xen/xen-hvm-common.c
@@ -781,25 +781,12 @@ err:
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
 
@@ -863,12 +850,44 @@ void xen_register_ioreq(XenIOState *state, unsigned int max_cpus,
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


