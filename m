Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC9B793364
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 03:29:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.596126.929912 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdhMJ-00052g-TY; Wed, 06 Sep 2023 01:29:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 596126.929912; Wed, 06 Sep 2023 01:29:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdhMJ-0004z9-Pz; Wed, 06 Sep 2023 01:29:31 +0000
Received: by outflank-mailman (input) for mailman id 596126;
 Wed, 06 Sep 2023 01:29:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kbfT=EW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qdhAH-0006tr-GT
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 01:17:05 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20605.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1673d7aa-4c53-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 03:17:04 +0200 (CEST)
Received: from CY5PR19CA0013.namprd19.prod.outlook.com (2603:10b6:930:15::32)
 by CY8PR12MB8065.namprd12.prod.outlook.com (2603:10b6:930:73::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Wed, 6 Sep
 2023 01:16:58 +0000
Received: from CY4PEPF0000E9DB.namprd05.prod.outlook.com
 (2603:10b6:930:15:cafe::f4) by CY5PR19CA0013.outlook.office365.com
 (2603:10b6:930:15::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34 via Frontend
 Transport; Wed, 6 Sep 2023 01:16:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9DB.mail.protection.outlook.com (10.167.241.81) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Wed, 6 Sep 2023 01:16:57 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Sep
 2023 20:16:51 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Sep
 2023 20:16:51 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 5 Sep 2023 20:16:50 -0500
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
X-Inumbo-ID: 1673d7aa-4c53-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hb1YC71dWmYwfb1a3xolxxMDYaeNezVKWgfuxWbClIF2IFlUenHyuTW+zKe8MtmkVgVcJIXhUyNR5W/iXrvPZFyXoUCvXCQoZtiA6fiifUvQhrIlN0vVJFh6mBGa2Q7XAAceVMPRh1zoMTiinVUEDcbztpF9rjsgn9OLdOvtaIWC1yIJnQs/0F95vJQdBdNtn3LYga+/zzSaa0qu57jGA4DGEnDsNi0NEzmw/gtLJg2wye5DVUQOyFo5R/NMi47aMPIIM7Y5hTajN77Xh0wM8WxPCKw1ViFtcwXa7hpd6RXb7udIuUuKyDGc7+nnstvNU4pMI/+LSKe6iEkai1ACsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0SOh4yXnAAqd95uGtVLNuRN1JoH4/9uDY70TgG5n3FU=;
 b=kAyIhe93y9ueci/hvUwQB/OarFTCkbKKRZ0VopB7v4VDN9uDOAac9+B9ZePmJ6WBRE1Yw9++XkmK7LOL3dWhlu3hVVoDj5EA7T0HRbwFYPy3csBj7Awp9SXDcK59M8VPqi+KqvlV82aIEziXfnmXHjJwC+pBsnyRamTYmtwjp+pdweSdMMyUf+3ZjvptLWP3wd0dmV+/TpCOJ14f9WYsTznO1G+KvoN0SAm37cVZn+barniUYB/D1IZu4ZpC7E8IqURBDaPh/rbCqBLDIwMoYJw2c17A2UCs+fcHDXifHUwCaCWIHklyMe9rX0FHKIQgBHFOTLgTlzwyEfNixTSAwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0SOh4yXnAAqd95uGtVLNuRN1JoH4/9uDY70TgG5n3FU=;
 b=PgNFZPcvkOTjdzwI22qm6s1v/KD6JMWl3BqAoupfdUeCgb4kmydIcSsB+xyiqZ4p6UYHSExZRa5XfOQ4yBRwmvzjhG63OcAiIOrRGEFocypQ9wFFO8dnf12eTLe0VrGpESWbrHkhBMs8OD+Eb4Qd6YGonVcdpFsSIVNCp3HVG3E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <vikram.garhwal@amd.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [XEN][PATCH v12 20/20] tools/xl: Add new xl command overlay for device tree overlay support
Date: Tue, 5 Sep 2023 18:16:30 -0700
Message-ID: <20230906011631.30310-21-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230906011631.30310-1-vikram.garhwal@amd.com>
References: <20230906011631.30310-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DB:EE_|CY8PR12MB8065:EE_
X-MS-Office365-Filtering-Correlation-Id: 9de38f9f-df21-41d5-e750-08dbae76f735
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OwAUQkkbGzQMyrvIUy0Mbn/RhRsaxwiQ/3OyEGRxrc1x55Rxr/mR6ch2OAIlGm7EUMpLdWXZeFUw6MNnmyRnqORA4pw6e1EPHPUrdLLSA+EmejkMGKGStrbIHr/+18LHlYaJH4Dku1pEQtDlEakifqmyv8JkhF4JWyLhco7HxnbhggAUjAX2u9Bbfwa9Yev2mg48koIAncmCqqMWo7uk8dQjVHjbCuAjsevV2nylSKDQ+OB8H/HwaYaFS6//m4+2MRlWRrjQz8uBSniAQ/ZdPtoMefvR5R+oYgXODUk+8AYWsRfLqQgyH7o/yt1lVs+wy9IpDzrCHQChSK1LnIzkJ8686WoG3gZFsfiibL+a2MvE4JYA0Zp3EotHBP8N1pgZ7NjZhweKP1PxxfLh1fzJM0/oL6rxa5cENvtckw4/ikIK34eWupIy9cZacKjqDF5CZ+5n0g+hAvuhhP0/AAmk1dwU8x+CPO35hNY4xt5pNPZzfNjC+RXSZ+UjwQ7sVtBQPcAMQ0Qp4E8ABJIFDlaaSeTMtIEhWShE7zfD8UYxNpi5pT428u3uf3p9Uv9T9NpkXKyo7uMKhoECV7YQ2J7HymxtsgUk9yT249obfI2LA6iQWoBRfrFkFbAUSnhBuqJAeNtBFt314txtzpPsFSDSg2lReI8Ayjbz9gyQgdmWdqAIUsGyV4PExQdybq9L3qm6g+4Z1bbWbkrfHF7i4AXbbX7KFJJ64xxCLGpdwWVdRbRCauaOHHVFcnSPEn+IfGnlc8xwvna6uE8gd8skOQUmsA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(346002)(376002)(82310400011)(1800799009)(186009)(451199024)(46966006)(40470700004)(36840700001)(40460700003)(36756003)(40480700001)(6666004)(81166007)(478600001)(356005)(82740400003)(2616005)(1076003)(6916009)(316002)(41300700001)(54906003)(70586007)(70206006)(36860700001)(47076005)(426003)(26005)(336012)(83380400001)(2906002)(86362001)(5660300002)(8676002)(4326008)(8936002)(44832011)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 01:16:57.8842
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de38f9f-df21-41d5-e750-08dbae76f735
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8065

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/xl/xl.h           |  1 +
 tools/xl/xl_cmdtable.c  |  6 +++++
 tools/xl/xl_vmcontrol.c | 52 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 59 insertions(+)

diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index 72538d6a81..a923daccd3 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -138,6 +138,7 @@ int main_shutdown(int argc, char **argv);
 int main_reboot(int argc, char **argv);
 int main_list(int argc, char **argv);
 int main_vm_list(int argc, char **argv);
+int main_dt_overlay(int argc, char **argv);
 int main_create(int argc, char **argv);
 int main_config_update(int argc, char **argv);
 int main_button_press(int argc, char **argv);
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 67604e9536..2463521156 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -631,6 +631,12 @@ const struct cmd_spec cmd_table[] = {
       "Issue a qemu monitor command to the device model of a domain",
       "<Domain> <Command>",
     },
+    { "dt-overlay",
+      &main_dt_overlay, 0, 1,
+      "Add/Remove a device tree overlay",
+      "add/remove <.dtbo>"
+      "-h print this help\n"
+    },
 };
 
 const int cmdtable_len = ARRAY_SIZE(cmd_table);
diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
index 03971927e9..cea5b4a88e 100644
--- a/tools/xl/xl_vmcontrol.c
+++ b/tools/xl/xl_vmcontrol.c
@@ -1265,6 +1265,58 @@ int main_create(int argc, char **argv)
     return 0;
 }
 
+int main_dt_overlay(int argc, char **argv)
+{
+    const char *overlay_ops = NULL;
+    const char *overlay_config_file = NULL;
+    void *overlay_dtb = NULL;
+    int rc;
+    uint8_t op;
+    int overlay_dtb_size = 0;
+    const int overlay_add_op = 1;
+    const int overlay_remove_op = 2;
+
+    if (argc < 2) {
+        help("dt_overlay");
+        return EXIT_FAILURE;
+    }
+
+    overlay_ops = argv[1];
+    overlay_config_file = argv[2];
+
+    if (strcmp(overlay_ops, "add") == 0)
+        op = overlay_add_op;
+    else if (strcmp(overlay_ops, "remove") == 0)
+        op = overlay_remove_op;
+    else {
+        fprintf(stderr, "Invalid dt overlay operation\n");
+        return EXIT_FAILURE;
+    }
+
+    if (overlay_config_file) {
+        rc = libxl_read_file_contents(ctx, overlay_config_file,
+                                      &overlay_dtb, &overlay_dtb_size);
+
+        if (rc) {
+            fprintf(stderr, "failed to read the overlay device tree file %s\n",
+                    overlay_config_file);
+            free(overlay_dtb);
+            return ERROR_FAIL;
+        }
+    } else {
+        fprintf(stderr, "overlay dtbo file not provided\n");
+        return ERROR_FAIL;
+    }
+
+    rc = libxl_dt_overlay(ctx, overlay_dtb, overlay_dtb_size, op);
+
+    free(overlay_dtb);
+
+    if (rc)
+        return EXIT_FAILURE;
+
+    return rc;
+}
 /*
  * Local variables:
  * mode: C
-- 
2.17.1


