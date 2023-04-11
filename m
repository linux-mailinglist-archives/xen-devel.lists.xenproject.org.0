Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC786DE4B3
	for <lists+xen-devel@lfdr.de>; Tue, 11 Apr 2023 21:20:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519883.807043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJXD-0003Pl-VV; Tue, 11 Apr 2023 19:20:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519883.807043; Tue, 11 Apr 2023 19:20:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJXD-0003LY-Pv; Tue, 11 Apr 2023 19:20:07 +0000
Received: by outflank-mailman (input) for mailman id 519883;
 Tue, 11 Apr 2023 19:20:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOX4=AC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pmJUk-0004DR-CY
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 19:17:34 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20620.outbound.protection.outlook.com
 [2a01:111:f400:fe59::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80294892-d89d-11ed-8611-37d641c3527e;
 Tue, 11 Apr 2023 21:17:30 +0200 (CEST)
Received: from BN7PR02CA0032.namprd02.prod.outlook.com (2603:10b6:408:20::45)
 by CH0PR12MB8505.namprd12.prod.outlook.com (2603:10b6:610:193::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35; Tue, 11 Apr
 2023 19:17:27 +0000
Received: from BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:20:cafe::fb) by BN7PR02CA0032.outlook.office365.com
 (2603:10b6:408:20::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36 via Frontend
 Transport; Tue, 11 Apr 2023 19:17:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT012.mail.protection.outlook.com (10.13.177.55) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.28 via Frontend Transport; Tue, 11 Apr 2023 19:17:26 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 14:17:24 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 14:17:24 -0500
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
X-Inumbo-ID: 80294892-d89d-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bXcp6be5EOxaRQCLBYG53j+05Hu7TinVPhvIYfE9gJxAavjYLIKc6/7NioHLDCrcurhEiJ8Z2L+kT8x8gZErqZHQveFz/ruJQC4QkbuQqpM+92ljIOdfuP1I2u/pM4nz1sHzr2x8WdmSAXTeG2eg/BC+DDTNeWk8lZjUOdCyn5diec1fDD9yvuLTOeQ5YgC0gn68dAKFW97Q16ccg8J0j/r0k1YHoqXrxJVxZogmu9dMnkw80x5/LFGjdetpX2PvM8gZoSG8Fdn4fE+/BJeN2UF7mygE1eUVZUG4NOffEyu08L0s9wDgjSKyuYNR4a6rehID9pHzKBo806PvJx6twA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W8ANf04rvVBwwTVoSmk1wMh7BnV4jbgpw3PgliDnkIY=;
 b=UESNVU5X4U7Mb1sIUnUW6Y8bS06cx8WSLF1wrd4oXl7LaOBS0lr2K4Qe0+ehQ4ecstfVO8GS+uIHD58VyL/8yZaXE/DygxLfAybnwrm984eiL5SYI0oqjyWMNEyuQdrRqupBzXpjJIi19DjBXsAG0H0LpvXjM9vfuom1IOdVOVhKy9TyxbfNtu2BtzMXEUFOcZOUNiEBsqb/5jL951M0S0Qprc0Qm/rS23Ykn9k6VAfTYSm7Bei64FeQbd9n/gDX+HlnvFgBlEEZ7mgdlduem0kBgsuoRoMTv/hkzr2rYS+E1YtH83fyufPQzFdQCIK5LLUkEsBxy6Vf9O97nLxQQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W8ANf04rvVBwwTVoSmk1wMh7BnV4jbgpw3PgliDnkIY=;
 b=1GiTmjkOyBemqL8wpiEBx/y65ZzIdEqTLmoD55ye5iseqtdm0w/3O0UOXVUz9BaJUICEmxgiIUKELqme1d8WUFiyqIehMkIZFtdJjfne7ZG3siohBJ3oBuULNFkBPUYiciJZmCtGOKSInpWejEyWQCnaqdfWD0LwyroHP+ufIqY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Vikram Garhwal <vikram.garhwal@amd.com>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [XEN][PATCH v5 17/17] tools/xl: Add new xl command overlay for device tree overlay support
Date: Tue, 11 Apr 2023 12:16:36 -0700
Message-ID: <20230411191636.26926-36-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230411191636.26926-1-vikram.garhwal@amd.com>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT012:EE_|CH0PR12MB8505:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d59fb95-371e-40ee-d911-08db3ac1632f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nW4r2U3H6TrJMWIKgWISxhpfKTRgrSgjfkPPjFEqwV+PV72ixWavNRL57lf2zNDQvBzpHxBd5fpfXOKDOoZuT0F9iXe5r2UGkLbHTo6FDWqwLxgsVqgBDxQYeUyVovX0KXicgBcTNmyPeNshlu+kRcDVyNvkn0Ryy5uBzfKG+LQctr271k1kF/ky7COwagWYTdwNcUctEsn+FhjKBK0+QXRmkZxEoZry2EUPvR3YK7IHS0SxTml6xucxAGGASNSmJpKQ0uiyfGDDjXnpZvfU2XL27qCF0OqLy9kXAtayBDdOisSra46hjYIDTtFTX39UaUk88yN1vPb0y6lYaDNMjkpp0U1qDpba40BDxhUgF7J0YL3bi31c5fX4jlBNiaLBxs3mElWEAgWdiXNCmVXwWFSfYwpjqq6L8CQgQZ/qUolUvE7N5+NJo1FJi0NXaiK4Oyv9lizIqEXHugZILPEbXo0NMfd1UTeSxPaMCK3iAi82zqUogxDD6kmvFO70tx/W32bf5hrPW08ShFLiMMB4cNea0g2f4SJ9AarBaBKiClsUNU+cnOX/XrGaWwzWVky1+pPgzMt0P0aZwIOHXWKQB682ONv95mLVneYfIc6DkQXBeXpGxsQtFtsGo62JFcw0lRgf7pUQwrPbHvo+63NR+VUp5MY9uhdzRvacRJq61i0hCX6nkI0QPvIdactc/McmqnLOvsBVAvi+O6tG0bbpOhvPh1fsTupE8G+oJmTh9RU=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199021)(40470700004)(36840700001)(46966006)(40460700003)(6916009)(54906003)(8676002)(70206006)(70586007)(478600001)(4326008)(41300700001)(316002)(36756003)(86362001)(83380400001)(336012)(2616005)(426003)(26005)(1076003)(6666004)(47076005)(8936002)(2906002)(44832011)(82310400005)(5660300002)(40480700001)(36860700001)(81166007)(186003)(82740400003)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 19:17:26.9767
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d59fb95-371e-40ee-d911-08db3ac1632f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8505

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


