Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B79FA781617
	for <lists+xen-devel@lfdr.de>; Sat, 19 Aug 2023 02:30:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.586743.918096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX9qz-0002na-EG; Sat, 19 Aug 2023 00:30:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 586743.918096; Sat, 19 Aug 2023 00:30:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qX9qz-0002lm-Ap; Sat, 19 Aug 2023 00:30:09 +0000
Received: by outflank-mailman (input) for mailman id 586743;
 Sat, 19 Aug 2023 00:30:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eu5+=EE=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qX9qJ-0001hl-V0
 for xen-devel@lists.xenproject.org; Sat, 19 Aug 2023 00:29:27 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20609.outbound.protection.outlook.com
 [2a01:111:f400:7eab::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 739a1e64-3e27-11ee-9b0c-b553b5be7939;
 Sat, 19 Aug 2023 02:29:26 +0200 (CEST)
Received: from BYAPR11CA0097.namprd11.prod.outlook.com (2603:10b6:a03:f4::38)
 by DS0PR12MB7828.namprd12.prod.outlook.com (2603:10b6:8:14b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.31; Sat, 19 Aug
 2023 00:29:22 +0000
Received: from CO1PEPF000042AC.namprd03.prod.outlook.com
 (2603:10b6:a03:f4:cafe::73) by BYAPR11CA0097.outlook.office365.com
 (2603:10b6:a03:f4::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.20 via Frontend
 Transport; Sat, 19 Aug 2023 00:29:22 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042AC.mail.protection.outlook.com (10.167.243.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Sat, 19 Aug 2023 00:29:22 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 18 Aug
 2023 19:29:20 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 18 Aug 2023 19:29:19 -0500
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
X-Inumbo-ID: 739a1e64-3e27-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O7n/v5ju94oU2iD8RROA18bYko0jBipOoOBfdNA4SXpZaVm68qE8gBq4U/8dXHswXf2ZbufugPt4cMk6aPsg/F2ZwWNQnH+xNwdFRoU0QNx4s2bicFPwsxUCJ8lTfA3iEuw/g5dlsxbViXW3WQ/TaUop7FDDxkB14MWM1GUg+LB9acbW0QxLyUQU1bd2xyA760LMoHeGchPBzugDmKDeQAUubezLNbfhMbxtyeELN10VDXt5Llf/jIONQ4V8ikGrgd+q5QF32NqKB585+zTfWeSvyluHRztomY3fYpXOxo8ijvBWqGZkyNVg4SarEVMJA6oKYzfwqSsrWLujI2kZgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0SOh4yXnAAqd95uGtVLNuRN1JoH4/9uDY70TgG5n3FU=;
 b=j6FwwfGKPqqre++4HDYv3+AdQjL0p3rgE4RMgV5euR6VOnKbbUe1LXI+GRp/Z6aVO2vHLd6RpAjPnKMun1jsXJ21OedHA49oOHDf0F4Sc1pRYW1MUsl/PcboCOmzImCgZwBn+8LPXbg8A9d2tHPe08ZPDAfoTr+ncFe5MJkmxQf59xgVxLjdl//cH99FpD5A8WVYPb64K3yfyJULo84/lELb33z/Nw+JALCNRf2bum7t0yy0QJZn5wxnftUEf3RDHrSPLTeOZRrTL71s6qEqcW/xHHugV0N6dlp8ogXBl7JUReDw2DiVVChpWBJhcmHiHU/NAf/ZQ+gnXU/ZZMcMSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0SOh4yXnAAqd95uGtVLNuRN1JoH4/9uDY70TgG5n3FU=;
 b=Gt4psFmTZfhrqK+xSgSl1zlSpDad9mlYcxexKg5UtLcTHGtsShk5CE6pk0O8E8L5RcL+eNRztU1+lVgyUlr/oqZgNUx/3vUq1FdexnEYXSCKkh0c4txPxKioTJE+oRTrHj6ZGUKKNcLNDA43BKT7ZFYAkPgvzE+Jw+tMiL9t9mU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <jbeulich@suse.com>, Wei Liu <wl@xen.org>, "Anthony
 PERARD" <anthony.perard@citrix.com>
Subject: [XEN][PATCH v9 19/19] tools/xl: Add new xl command overlay for device tree overlay support
Date: Fri, 18 Aug 2023 17:28:50 -0700
Message-ID: <20230819002850.32349-20-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230819002850.32349-1-vikram.garhwal@amd.com>
References: <20230819002850.32349-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AC:EE_|DS0PR12MB7828:EE_
X-MS-Office365-Filtering-Correlation-Id: 069ca356-ee90-4287-179e-08dba04b55a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Gg0RPoycr29GSRoM0Z6biMj8S8kM/yVakj9sWPRoY9JWXrynfSQluGfDmMz+rrHB2d0KELAM92gFmduGCT/T4h8h927xRXUrICtjspNINf9BETy9xdeiHrB4WhYNmpYLFHeCrOxZLqEKKUrP3XKf4Mjh3H3B12G0SHPwjBtKAyZ1FkMVjqpLRj5MnWfbb1Acy574tTR+qU+3UL9Cm6BywcfvTWcgVg+KSWQQpCXlyMKGq7S1/q3siP5xLkPuxicQ27IAM4+/XC8MfewS3ChlCwwkCrk/X3JcBpTjAfnxKtFLlXDZUPQBWJWXYbp9Ua2qs6J21OmUDBMKFT5SoeM1uwtHNYY2OFjV8gPpBqp881kUSIlPQZE3zc5IesJnRhFMg3VqOj2oGdItafsDBySBt/ycROKyth6tJO8ikrPxUSd9srTiE09H9Y5NiOxbBqjnzol50HWhx4WZuEZ1L4Xl9KKNL+9joSiODc+gu1Vpe86AMrSnWMlvHjGLLDTL7/zYxGamuzx+EkI+5hgAbQzutlQMBir5q9YeV8Z/68Rva9UiNHhnPp9Sq9JDl3ngHiW42nsJI0Z3lG7YZ7VNIPL0+fiIrhhpc1QV8x+n6HAEYTHKCV8JUBtqZbwwi2uLnNPnALe+yd/EogJOrSLp4z7/jibOVVZyOXOIaged9Z22oXx3EzfnrqeviMLzUm4QSjEcPodltqfD5qL7AC+WsLilxlWxRP8h6FxoCTZhkb3I1SnQSPeqKzjcEhuamPWfRkeBotk9lwtQJu8pojFvxegIuQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(346002)(396003)(136003)(451199024)(186009)(82310400011)(1800799009)(36840700001)(46966006)(40470700004)(86362001)(36756003)(40460700003)(40480700001)(83380400001)(8936002)(4326008)(5660300002)(36860700001)(1076003)(2906002)(8676002)(41300700001)(26005)(44832011)(426003)(47076005)(6666004)(336012)(2616005)(356005)(478600001)(82740400003)(81166007)(316002)(70206006)(70586007)(6916009)(54906003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2023 00:29:22.1328
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 069ca356-ee90-4287-179e-08dba04b55a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AC.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7828

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


