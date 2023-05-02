Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C65A56F4DB3
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 01:39:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528894.822678 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzaG-0005r6-0T; Tue, 02 May 2023 23:39:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528894.822678; Tue, 02 May 2023 23:38:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzaF-0005on-Rv; Tue, 02 May 2023 23:38:59 +0000
Received: by outflank-mailman (input) for mailman id 528894;
 Tue, 02 May 2023 23:38:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/cxx=AX=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1ptzZ7-0004sC-Lr
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 23:37:49 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7eab::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 582050bd-e942-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 01:37:49 +0200 (CEST)
Received: from BN9PR03CA0269.namprd03.prod.outlook.com (2603:10b6:408:ff::34)
 by DS0PR12MB6559.namprd12.prod.outlook.com (2603:10b6:8:d1::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6363.20; Tue, 2 May 2023 23:37:45 +0000
Received: from BN8NAM11FT101.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ff:cafe::2c) by BN9PR03CA0269.outlook.office365.com
 (2603:10b6:408:ff::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31 via Frontend
 Transport; Tue, 2 May 2023 23:37:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT101.mail.protection.outlook.com (10.13.177.126) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.21 via Frontend Transport; Tue, 2 May 2023 23:37:45 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 2 May
 2023 18:37:43 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 2 May 2023 18:37:42 -0500
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
X-Inumbo-ID: 582050bd-e942-11ed-b225-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DROLClaF+aGH7NYS5zydzrPTP4mibpTNPe0ZoUB0bNtEgTnF7SV6zAwcvfmxH3k8vXh0kFr3FltTZ9r851MD1pbZeZ/2Y4GGAoUmC64jqHyT7oieI4BlyMayUPqlbrzPZJn3JKnhqRFvb8RmEVY5yDj3/msJR0MkBMAoZ0c9ubGZvmUG2Yyys/8mVGJEcIl2fVFRZ0TwB9LKsNidCjRYK7wBxEqI/KqTn93UHrmDTqRLM29+5bA1ptTsEN68F3xU7vt02WgfzTenO1Fqst1MWPbqytuWEtf/l5x/iEshJ8RaTYN/OuC0iJ+NEP7qMrT8EHhgWnYhsXIVB9VysQAgow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8ANf04rvVBwwTVoSmk1wMh7BnV4jbgpw3PgliDnkIY=;
 b=T9QZoJnBB2xOZ1/jmK/an5wpiebV1ZJURBqpIOADuHLmDou8E6zhHXpMY3idjmzyiHZghWswDPZsaf07fVuWeVaHQIWUTk7wf5jApo5WaBXs5vsBpn/23OUeCky6wA4v7cpeyQnBNkBviXD+oUiosL/uYaYBSwX3kr74lqjs3fszIw8ay97Gyj0sYnAD9I5a7ZBU216h4WztFF72nJ/F/WsAae5RCRNMmXiukDov2K5RinaWmAT9tMRsA1w+sWhZpsfiRDfgCjOvS3RMyaSH9aJuDxdaRb4WN3Vgrq3YmyJRnvCB/ioixZc+VV89Sj1xEsSqh5QWYr6n8Zz5H9EPZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8ANf04rvVBwwTVoSmk1wMh7BnV4jbgpw3PgliDnkIY=;
 b=mfMEDx1uFImG7A79WBozqHEF2QaRa5nkflQ1zG9Mp0jlMowT7VOk82LRmrBYQfGZDBCBnpgATlgNfzKix+vIYo4VbAU6H9liO3KEs+CYIjNkz/fSrX4+cOhbflIktTiB+vr4TSuOhNIgM1lMUj28Xv853meqj4V/feAdQPZpnls=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <vikram.garhwal@amd.com>,
	<michal.orzel@amd.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [XEN][PATCH v6 19/19] tools/xl: Add new xl command overlay for device tree overlay support
Date: Tue, 2 May 2023 16:36:50 -0700
Message-ID: <20230502233650.20121-20-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230502233650.20121-1-vikram.garhwal@amd.com>
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT101:EE_|DS0PR12MB6559:EE_
X-MS-Office365-Filtering-Correlation-Id: 87db793a-0ce9-45e1-14f2-08db4b663b0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5Ky0jDQ4nyKCJRDumE86REXWu2MwxLdK/N4E2ZhzE8ccdaSyv3yNRoPZcsBcI9fQGC1FFQ/fuGX/KAekGKo6JCmQo+ouL+BxL123Vhxn60oV76fmKva9JBNBWOfuMEUH9voXJHENWv8N22JPCO26FT0XR1OT9seGW9JnX4p0redjuQ7qAAGFxLsHDhDB0ggjl+HHJeiBhSGfRJhD3ikXu72OwkfaSYS5bWHGKlInr4B1K5p9N5aanBizbmTHGlN1pgUgQX3rSMf2c7l7zFRCvAhjeoC18ebw/S8OwmNrf5aBIYL18q3kKRXSQVqiuAhpxeZAowrLBMCideSLROGISJ06GfSo8FWUxf+jypIXCJPmwGYT0jPWrsR4l8GCCpJjtmi29Jvax1Ed9gInCVCh6JmtKRwhkcRo27MU0oGdbLYkBcoTnvuuFz6mfoA4ndvHW6AUFxWiJA2IsVSsXUdD2FqsPGOcOZXH3bs7/gVpITYaJCTM9nrjVGmLCV24FsGrjawGG+1UM313zXFLcq5GB6MHVQ/0HU6bR7gJDhaFdK9VB/iNnzZbYxSUW8EdZJdsLfbxsnR1v0nlWHtASoCs5KFNuWFnfGe2Ji9uR5nMwjSMt2R9ZCPJw8aOZOi9A8zdLYopXEkBmVdxLdOx+C9ZGJykxd28HM6La4dK1GWl3S3Z7O9C3VRTneCMX0RyorMCAsI/GPgWuT0fl2/RsGRNNEWRPCHSl1V8urf9CMN8nmU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(396003)(136003)(451199021)(40470700004)(46966006)(36840700001)(356005)(2906002)(81166007)(1076003)(82740400003)(186003)(26005)(6666004)(47076005)(36860700001)(2616005)(82310400005)(336012)(426003)(36756003)(44832011)(40460700003)(5660300002)(54906003)(478600001)(86362001)(83380400001)(8936002)(8676002)(41300700001)(6916009)(70206006)(70586007)(316002)(40480700001)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 23:37:45.2336
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87db793a-0ce9-45e1-14f2-08db4b663b0f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT101.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6559

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


