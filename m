Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6007881A5
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 10:11:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590660.923050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRuJ-0002lR-K0; Fri, 25 Aug 2023 08:11:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590660.923050; Fri, 25 Aug 2023 08:11:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRuJ-0002jC-GA; Fri, 25 Aug 2023 08:11:03 +0000
Received: by outflank-mailman (input) for mailman id 590660;
 Fri, 25 Aug 2023 08:11:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+VXW=EK=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qZRnT-0007G4-Nj
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 08:03:59 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20627.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0f866ca-431d-11ee-9b0c-b553b5be7939;
 Fri, 25 Aug 2023 10:03:58 +0200 (CEST)
Received: from SA9P223CA0027.NAMP223.PROD.OUTLOOK.COM (2603:10b6:806:26::32)
 by CY5PR12MB6081.namprd12.prod.outlook.com (2603:10b6:930:2b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.29; Fri, 25 Aug
 2023 08:03:52 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:806:26:cafe::8b) by SA9P223CA0027.outlook.office365.com
 (2603:10b6:806:26::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Fri, 25 Aug 2023 08:03:52 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Fri, 25 Aug 2023 08:03:52 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 25 Aug
 2023 03:03:49 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 25 Aug 2023 03:03:48 -0500
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
X-Inumbo-ID: f0f866ca-431d-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WW6AVVrnKdyipkWb2LMak/2n2vr+oSfaz/3ky9grqSHLmk39S9JIcVWHXOk8/+ynVojFDU3jnUACTUVhEXf2kR4varDAMzBX3NAvRKTUM9c/KTOdAgO3idoM0It88BwUcEY564csD23kW+x1bjeJ7Jd9l5F3MczzbPWzbC13qGzzBrv3yrrhZ3pmufencXU8g9uWVYgEWR3gjYXalmixJ6OKv4YNlfTj6M5ObseiC1FrKhFMJ7yPq/idVEzVMN7dV7Pwo98132nUcFaUi3Ilto2dYCUKxNy+fKEAdYM1CyOaW9vqhhpIqpPWNP7FclHc4DdSO5+i/8mFshW5o8wpEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0SOh4yXnAAqd95uGtVLNuRN1JoH4/9uDY70TgG5n3FU=;
 b=TIcZzuoyJFBSnK9lvM9tk/UhtBZDrF4tll0jlMcf5JT5MLXlGgfqT7Y8aEgqjsazO4enQlddihFtnXhMB5UYF+bYGWi5Ih7+B2Miu3Tr8/q4yc1vTOXKIWNmYiBl3ydP5OKe+EnPUOiRciSP0okRh5Th54frke1m+1EZvFNKTSuGRkotBXgXJQhcbK6ZlNjgQF6MLqgu95HeOydM2Zb8UAyiLuE2f/MtsarB61LOC/xvoUJ4d2W8uCXt2kTewfzYfQ+8v726X4HsmjnzOibon4rPbnLFkU0mMq/3iwo8BKz3Xx04iFRXJLXQ+dY3PlW2xgeueKmbtc3i5BfMnNQ3dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0SOh4yXnAAqd95uGtVLNuRN1JoH4/9uDY70TgG5n3FU=;
 b=fTHdPbffVyCXa+PBA2aZKc7HPrp+7r7Qt7hyW0TOEosMuQgzeIq96aVk1fJL1g3BDoIL2SCRrcDNtfYeTA2zAxEdrof2nmkRNakB9qY5xKJJ0QOt9+/Swp5Py9aVvfDXv33UxNx7itgM8JzCMYHjPPKCiaS/QtXiayueIVp46Yg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <julien@xen.org>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>
Subject: [XEN][PATCH v10 20/20] tools/xl: Add new xl command overlay for device tree overlay support
Date: Fri, 25 Aug 2023 01:02:22 -0700
Message-ID: <20230825080222.14247-21-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230825080222.14247-1-vikram.garhwal@amd.com>
References: <20230825080222.14247-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|CY5PR12MB6081:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ee1585e-aab8-4244-73b1-08dba541d29b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gjV7tIifUFa107+ucGl8wEN4osFHEV9lq7BM9BVP8ACk75J3CHh4NyFMAgpdRdSVRQ9HglykEnUiTIlgdMsa0XOUwIpStwzOXhnpLCKiNU4kicc+oCho1h5yBhINtMqt+wy4ST18dBcSTDg4O3j3FAL3A4+uDqILLku5vVmk9yvUPTZGReGSQl1OBVTk/u7NQXGhJM/Iya75z3Q/jPc7FJ3uH4AXPPehTobVQaPVt7YmgF5BQ2sRrElIIIrp4dk3WkvAuZZ9FZQ9l16QG2KKL1B/EO0uXY2Obpezg4SGpg3Djq5bKUBRg5BuV8zm1m2akVaD9Xot4rkn1eaGaPaosv9zNIeMYsRn4okEVxGGWW7cBWSca4svVrpqZdZ1PruZ5R66rLsu9N3561328rR2FYJU/Ljegrr60fs1pd3OgXsy9RNCTA1C6jAysrrmnewnzVXw0nNoCZ3NwHOmX2GHyYYDNtuzXMsyFUEbyCMYPaODadTmULiAEcALa6zXbBLVN406B9nNu1E+Lzx2EYOjZ90c3R4UOtxOXo77ZX9zxPltvQsE1yT1DU41D6Wgtd5LYiEMPXjrwGa74q1lLGnl1GR0XXqZKGM8IQ8YZ7yMoRrz/sL8Hbtzw4rlt2R68EaGKuImk8HUCtpSBnZ8bQsNLL6EbO1677dmjRJ0LRdjIjG+Ikkx1DTpW3GqAIphSEHT1H2FIJMfXFNLdnpPe0XC0A5X49T2Un5y8730jWNgYKxSoD8dB3h9lwNLFswFdU2QxsvNhUiq+ka9Wk+obcrifg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(376002)(346002)(396003)(82310400011)(451199024)(1800799009)(186009)(46966006)(40470700004)(36840700001)(82740400003)(81166007)(356005)(40460700003)(8676002)(4326008)(8936002)(54906003)(41300700001)(6666004)(316002)(36756003)(6916009)(70586007)(70206006)(86362001)(40480700001)(47076005)(26005)(478600001)(336012)(36860700001)(1076003)(44832011)(83380400001)(2906002)(2616005)(426003)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 08:03:52.7292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ee1585e-aab8-4244-73b1-08dba541d29b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6081

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


