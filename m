Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E8578F7D7
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 07:11:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594261.927560 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwR8-0001Sf-JN; Fri, 01 Sep 2023 05:11:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594261.927560; Fri, 01 Sep 2023 05:11:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbwR8-0001Qb-Ca; Fri, 01 Sep 2023 05:11:14 +0000
Received: by outflank-mailman (input) for mailman id 594261;
 Fri, 01 Sep 2023 05:11:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JvPm=ER=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qbwGu-0001Hn-FU
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 05:00:40 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20601.outbound.protection.outlook.com
 [2a01:111:f400:fe59::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7bffc160-4884-11ee-9b0d-b553b5be7939;
 Fri, 01 Sep 2023 07:00:35 +0200 (CEST)
Received: from DS7PR03CA0168.namprd03.prod.outlook.com (2603:10b6:5:3b2::23)
 by MN0PR12MB6126.namprd12.prod.outlook.com (2603:10b6:208:3c6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Fri, 1 Sep
 2023 05:00:33 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:5:3b2:cafe::5a) by DS7PR03CA0168.outlook.office365.com
 (2603:10b6:5:3b2::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.22 via Frontend
 Transport; Fri, 1 Sep 2023 05:00:32 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.17 via Frontend Transport; Fri, 1 Sep 2023 05:00:32 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 1 Sep
 2023 00:00:31 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 1 Sep 2023 00:00:31 -0500
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
X-Inumbo-ID: 7bffc160-4884-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nf8WcL3qB/lcjeQrNWjnbCxHRKatLQmfford6ksOpyPUlcqya9+6rqLgYHywlsZblr/XqdHW9+2jg1w9yYp3m8RwUQ8a1IzjUXFe1zpVSNpMDHoyIDfeElnLXLfCRiAdMm711eMUs9deU4JNMIos8c2bjyb8LM1DvgkFjvqHyUXaQNxD7020+jlv/GwYuaF2uevF1YznENf02LOymE+zYjppuOmaLJdBA0jLTDIWY6SMHxSm+hyJg4hdvjCZ+CBAtVvLj7TXlTTGr2dtiuOZum8WYtTq+d/Rc7V69LGfIgzpq1KA/f56iIqHAvuTTczPY2sPwpZSBhrg7btHh6izvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0SOh4yXnAAqd95uGtVLNuRN1JoH4/9uDY70TgG5n3FU=;
 b=Y04HI+23rnClaNfPhIzLPu8Fg9wvbrQvhxVZD5/M7f6mLclgN0/1oOS2z1kWJ95H89ulgddenQqeBei8xnjA/A6BL2z4jSmW3tS29lRaLbMADPbvtvYM4GpV91h86rcJsMLEA8v2JYbibWjc8vVhLOa+pV+vCEpvhrrOg+gEK/B5BuWzMd/jdbml1oD9ZT3MrZWW+q9EKL/5JWsvaZoaAuYOyxaiy6G1b382y5uJ9PAX6uxMmW8E8/XFLE5id3H9bGpl331cHP+EYg32yk4h0uEl1qE60p1WjLGf5PaH8/PdR/49zNHcFfoK5/DqDv23d0UZjJTiPWZejhd1AtrqQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0SOh4yXnAAqd95uGtVLNuRN1JoH4/9uDY70TgG5n3FU=;
 b=eRlDvm2fCP5AReW4gx03Pg8Kf2U02BfUUIIQtpSLJe4eQsaud9OM/x7iDki4adYaP9+ZngKDrI/Xvpp3bgiyaF9J27sBtZMS5Hg1xW7jnUk6qZ/33i+IPVzihyk8joOLOW7hPdvbsYKDzP+6EHN6YEsKGisDn50urLG790xYNrU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <vikram.garhwal@amd.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [XEN][PATCH v11 20/20] tools/xl: Add new xl command overlay for device tree overlay support
Date: Thu, 31 Aug 2023 21:59:47 -0700
Message-ID: <20230901045947.32351-21-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230901045947.32351-1-vikram.garhwal@amd.com>
References: <20230901045947.32351-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|MN0PR12MB6126:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a01316f-071a-4814-6833-08dbaaa85f04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IKgAg60HDsnCItKCyZIz3/h3CEXHdWo7f3LshDBSsMpz8sM2j6hvobqqtIcVFQgp64BA6iCqOVXUBSTXjl2s8ZjcxNxdzqAPjWPU4L6qH+ubC2jAs+FwiFgKk5+zAedinFu8K6nMp03lf65E0B25JC/p9nqEwE6LYMlBfUxXpYsN04zGTZwiqDdI3pfdcVnNySNJvEewOD0jy87+k6ohbwi8M0Pvb/0bLxgqWlSOt5U3mDs6bdkLTMuSB5yKeO4M9VGMKPO1I0qEcjmiuBSByYduPreVAuAJr4uAJOgwBpIkpl8iNAdFif1oH6wXx6LynkUGWTctN80dxnkLY3qYitQvmrgjJTiFb+jD5oTH9hxPSJE9EjAxDq9KaTQP3ezctCYR6j5Zgr9KBuP3cMI6BNOs9dmfKW9OmYi1UxxukD9jDrzGx0Yw+R/txXg46/X3UwKR0Y/wEFm5HXISvrpkYDubk/ESh3rSbZdxBdgozJ6D8CvRXgyEUwxB2f1UTsRNfJX4qDcqfacFrQiB7z8ybNXbo9Ans4y066VVmKBn4S59IMfMEeBzRT5t2cDniEexEqiJS64j3zu9RmB4amXQiBKjoYIEHyaTz57Naj4iXYFNkvB1PaAuq/LeN72CuZ+5B2Y7B4l0GvqgMn3F15zh8H9MqFAXZZBVA9ZjGaHvLMRVeA52pDv/rB/Z7phzs9zQrgpq0nfa0mvBltnEZG8UDrdNfqj5K18n5W3zCI3sPKmE0EnKTO2ydX1Dwpxp4Z9E2uFdhtPrElO8PTWw6uj6Yg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(346002)(376002)(136003)(1800799009)(186009)(451199024)(82310400011)(36840700001)(46966006)(40470700004)(356005)(82740400003)(6666004)(36756003)(40460700003)(36860700001)(86362001)(81166007)(47076005)(40480700001)(2616005)(1076003)(2906002)(426003)(336012)(26005)(83380400001)(478600001)(70586007)(70206006)(8936002)(54906003)(8676002)(4326008)(44832011)(5660300002)(41300700001)(6916009)(316002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2023 05:00:32.7315
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a01316f-071a-4814-6833-08dbaaa85f04
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6126

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


