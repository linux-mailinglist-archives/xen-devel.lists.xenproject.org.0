Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 231BB6DE498
	for <lists+xen-devel@lfdr.de>; Tue, 11 Apr 2023 21:17:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519782.806845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJUV-0007uX-QS; Tue, 11 Apr 2023 19:17:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519782.806845; Tue, 11 Apr 2023 19:17:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJUU-0007iE-Sz; Tue, 11 Apr 2023 19:17:18 +0000
Received: by outflank-mailman (input) for mailman id 519782;
 Tue, 11 Apr 2023 19:17:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOX4=AC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pmJUQ-0004Ta-Vc
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 19:17:14 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eae::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75d4f138-d89d-11ed-b21e-6b7b168915f2;
 Tue, 11 Apr 2023 21:17:13 +0200 (CEST)
Received: from MW4PR04CA0033.namprd04.prod.outlook.com (2603:10b6:303:6a::8)
 by SA0PR12MB4559.namprd12.prod.outlook.com (2603:10b6:806:9e::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 19:17:09 +0000
Received: from CO1NAM11FT085.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6a:cafe::c1) by MW4PR04CA0033.outlook.office365.com
 (2603:10b6:303:6a::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.28 via Frontend
 Transport; Tue, 11 Apr 2023 19:17:09 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT085.mail.protection.outlook.com (10.13.174.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.29 via Frontend Transport; Tue, 11 Apr 2023 19:17:09 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 14:17:08 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 14:17:08 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 14:17:08 -0500
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
X-Inumbo-ID: 75d4f138-d89d-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DTml8cnkj84ksqDvwmgLUZtR0xNNi8j8gmyZZ50NnJf6XmYk4HgUz7aoClfr4FK1jkfk4g7plQg+djTV75FFKMdPB0MHeFeu0W4d0eHgep/Ape8kzIMtibQyKSlQ2HcwCfkhZzQ61cG3MKquXcpIboKoRpvhINdRYEs+179ympYaKf2fbqF8cKSx9vE423zovjpRNHKf8rT7ooFcREz351MXGRmnGy6V3YM6zUOi5R2bLLuPmsJUV1ZOd6WLqzdMTidyptnQAZ1a+SAT06XcG4KIgsiHhXXdlILV4juyOxujiRVVO0R3sE+nX8flJHmSfRO67haMXeHYRNxVuNkp7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8ANf04rvVBwwTVoSmk1wMh7BnV4jbgpw3PgliDnkIY=;
 b=HnPfgKNaLFifYRiXm89CjxS4F6TXWN/XgNhsUBNeY+VHE1YVDqBxhjNCQQL9rrOaT2XRtjgRmxCcikoVKx8LaB9Nq4VyTfo4SF/u9kg79qz3XWzXcmnK15+nx4p9iJf2zR5U/9VawbiiPi4Z5SGyGvtbLAqpw0w0GhF0M6caGbWoLlFL5cc9AGmrKvApx63v4pC5aQMtmIDvV66olDZ6NDoOZSfW/jgb4Xt+R4ldKtWAwvLbNW+VuVEhubTNm4sw1xwK+i4JH+RcZC1LwUr+euvvnhE8w4TQmOoN4wA6g1Bup0r8nhtRTHJ4UaCYiJ8oJsInS9QTJaAyt/2IDafrXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8ANf04rvVBwwTVoSmk1wMh7BnV4jbgpw3PgliDnkIY=;
 b=rkrcfNVyCeJcZHMV3Mza5hd29yd4W4yc4A3VEwlix84TV47Qvdg/J/YD/UzPLoW9asNTunX/Xp1eeCtMc+rad/aRjHlgyONX5dtS7Tsk6n5H+vz4iSpN/C0apzzGMBWgTn55O00uFgxIx77ez6Pq5BTvsFNeOEPLg5z4cgq0ftM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Vikram Garhwal <vikram.garhwal@amd.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [XEN][PATCH v5 17/17] tools/xl: Add new xl command overlay for device tree overlay support
Date: Tue, 11 Apr 2023 12:16:18 -0700
Message-ID: <20230411191636.26926-18-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230411191636.26926-1-vikram.garhwal@amd.com>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT085:EE_|SA0PR12MB4559:EE_
X-MS-Office365-Filtering-Correlation-Id: e028d683-9b8b-4468-33f4-08db3ac158bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	acc5R9HxREvMwAXUxJDUDLP/yKj+S5WJ6zRQIH7J2xdWmf3Jqiu7x0lcP9LSJvCgCr61Qk9r2NXH5f2ToI2cyrpaUf67UPfRtH+cqDrbkgcuvmndpY8kp99iOxQzTV1MwgCXPdcXVFz8AqacI55kDNTUEpxempIAws7UXihOK5HmtDyLJfKyUMrlGm+W+kSv9q7RCCboOcVU2zwbraBLJ/0S+2kv0PIBQQZK8YFeNFVBOaJipQSAHQvdYRdtf5rXVjWEGhawFasc9dkrtYACET2+YgH6HTx3qyGDJU78m1Hu94wiaswrAQl1PdxBrodzHvqioimRUT8hz7VWmUOM9gA5iHF17CLEjxD9XDCeES0fvA4ZGBxWwI3uRoHYiCw0hniX07Rpwu7kM9Ce0cZyFL0a22B/DWq2394y70mdK5twYuNIKSb5TrZHA9bsEcOq6xrTzbrZPDSXEDTL33u6+yH5VG6Ut3qdKkOPbeNxkSY2S7bVPMPWJ0QsunegqlGFmg1GXz3QMTj+7WHEEJ4Ycwp96sfqQnX0a3b3xCSimkkQe3OwPzn5xpQtaFKyW8zg9UykK3EN/efvjcUGcsr6qxgLBnSjYk0k/XXVX8TqWHZAafajz+PAMfJc+aRFCDzRABFLsJdzfmHz+XhqKWdWA1DifLmYYxeIF5IRWUthWjHyOK6pCs9V561lQJMWq3rmDuoT29l5fO/6WKMwB/z54sksBswB4M1iehdjS67IFk8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(346002)(376002)(396003)(451199021)(46966006)(40470700004)(36840700001)(478600001)(40460700003)(40480700001)(47076005)(83380400001)(36756003)(82740400003)(356005)(81166007)(426003)(86362001)(2616005)(336012)(36860700001)(6666004)(44832011)(2906002)(316002)(1076003)(186003)(5660300002)(26005)(54906003)(41300700001)(8936002)(6916009)(82310400005)(8676002)(70206006)(70586007)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 19:17:09.3544
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e028d683-9b8b-4468-33f4-08db3ac158bd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT085.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4559

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
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
index ccf4d83584..db0acff62a 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -630,6 +630,12 @@ const struct cmd_spec cmd_table[] = {
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
index 5518c78dc6..de56e00d8b 100644
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


