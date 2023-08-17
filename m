Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AAB77EE79
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 02:50:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585060.916087 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWRDr-0004Mz-WB; Thu, 17 Aug 2023 00:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585060.916087; Thu, 17 Aug 2023 00:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWRDr-0004I6-RD; Thu, 17 Aug 2023 00:50:47 +0000
Received: by outflank-mailman (input) for mailman id 585060;
 Thu, 17 Aug 2023 00:50:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IvtK=EC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qWR4O-000280-GO
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 00:41:00 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20630.outbound.protection.outlook.com
 [2a01:111:f400:7e89::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id baa59e11-3c96-11ee-9b0c-b553b5be7939;
 Thu, 17 Aug 2023 02:40:58 +0200 (CEST)
Received: from SA1P222CA0134.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c2::7)
 by DS0PR12MB8293.namprd12.prod.outlook.com (2603:10b6:8:f3::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6678.30; Thu, 17 Aug 2023 00:40:55 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:806:3c2:cafe::5e) by SA1P222CA0134.outlook.office365.com
 (2603:10b6:806:3c2::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.14 via Frontend
 Transport; Thu, 17 Aug 2023 00:40:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6699.14 via Frontend Transport; Thu, 17 Aug 2023 00:40:54 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 16 Aug
 2023 19:40:51 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Wed, 16 Aug 2023 19:40:51 -0500
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
X-Inumbo-ID: baa59e11-3c96-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PLUiWpf1KFzkONzyhdcjkurYXUX3NrUZ0EKZIcIMQ1MmsJWnF/xndv6J5uAXyxOF3VLjOv1EZ+0QccjNSaAb4Fx4+yC3RR3Op+lsmQooi7E1R5EQAf8IpEng5t6olohlrB7gmxz07QGDQqbhyyEVT0d8h+T+T2OCLnYSXR4/2t92YOD+46X6MLBDiTYxent2awHbQyVFubyfk+OOMxGWAvFE8pRkjT5EBT00d+XPBlhOXJoC6MQBC4ct2Pkt+rbnA18Qlp0l+3Ve4W0mT9CeRp4khLA6h1gFU1/OVPQexSjV4W20X8GhqndDWb1Hvz7eK3VgASRi8VV05glC8VTfGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0SOh4yXnAAqd95uGtVLNuRN1JoH4/9uDY70TgG5n3FU=;
 b=J0efkVb81dfCiGmyHFvtqEttvYSgRd+9yqcrucgfDdIhClMyzxHAos3P14iQNGt9ZFXPJvdu91GVGltRHbLugNDPMm2J4n4OBMIa9iyYi4OPmw+xWm2jjyhCMnoYS7OvNKTHwr9zRZFtCa4TwyPBB64+ZnJvwtmqg0SjWDUcMsH+feEf3yr7cP1a9N0+eH7PTsHMFg769/f8wMwlNpook40X+n0E3dV89cCa9iVYLbVDkJNd9m+DUjXqkECmGb/G9J0zMgtVQhCt5G9avsP3K0WUX7lEMXbDY3JwifU01HerdceNUztBAo/t8CVPbmD+I1al4ruLS+eRKctisxLqmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0SOh4yXnAAqd95uGtVLNuRN1JoH4/9uDY70TgG5n3FU=;
 b=w1PyhOqZuBAU/VTPctXsYQKQuqpUTdT/wzKtHVLYm6yKth8S5iebaSG7Uml/A9Jk7Vbi7L1cnz0SSvuDj0agGJ/zOPVhJe2f69WNp9gW/6EgaakHUa5tWXmksiO2udRFVr9iJ4SFm36QkBPwZXA4pP29BL44LRo/5JTaE3rtauk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [XEN][PATCH v8 19/19] tools/xl: Add new xl command overlay for device tree overlay support
Date: Wed, 16 Aug 2023 17:39:47 -0700
Message-ID: <20230817003947.3849-20-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230817003947.3849-1-vikram.garhwal@amd.com>
References: <20230817003947.3849-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|DS0PR12MB8293:EE_
X-MS-Office365-Filtering-Correlation-Id: 06d9c245-2573-40da-99f0-08db9eba9d57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zb3344ncoCOPPWQLtON0jvilShop9lFI5o5WZE74JxdqEuiakoyBYcY1qF64jHdfBBpM+6tG3fhtU4kOurPPC2DvWQWsQ3OQmN976oor63lmeoWBeVL1CbvHpjZpm0xuGhEKZx+651rAkuciFkV9zsxj6Vtqq74mktBzrCUBfhW798Q8GbtvFGyKvrK6nCJYNQbziR5nrMbV4C+gNekUDTI0WY1hIWpcio+uoSX3qyMV7ZU75xxI3lZN7KI9uSB4dy1ELRrflQTe+oDubnYA06W0gfSGYOkdS00pKNg3pCHqUAPvfHcCL1ulwpQoW4/FfyusADnK0yaqydcvPO55h0huBhZmlrqVWAkKr2EPy044uWsA0Rq7DGZmWk+4bDsAzpGaCaCmiR3tq/GNQaijkSsPE1EnVIG7RhXiDdOzRP2QjxamppGnq/hx5cWiMv8AjFqqDvonyS88i4MVCxk1N5L54/DGxpnluaxYTjuhAbThdobcEI81AojZHO74RD3W/dWjyzKX0NF87s8GAjYn2SS7hIENycFBvMbF8QOmjX4dwWRwdFOfl54vwLri95ZTnzvmHwYJRYjnADZRRqM2H4DglADcR+txEFNDQG5wE2mC4/ckszfhGj3sozoGDln+0EjTAKWmw92Zn/wiYWVV/g0arKK3dYfW/HnzUQj21iIy8YaO/U4YkUPTYld9u3bANi81XZEuy1V8U7epr/pDQk+Fdajr7UV1avK4b+nVgCYbrSwUzyXwx6dRhjq3IBESPKyBb7QXThAIp/ugdIcqEw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(396003)(136003)(376002)(39860400002)(186009)(451199024)(82310400011)(1800799009)(40470700004)(36840700001)(46966006)(36756003)(86362001)(40480700001)(40460700003)(83380400001)(8936002)(4326008)(8676002)(5660300002)(2906002)(41300700001)(1076003)(26005)(6666004)(2616005)(44832011)(426003)(36860700001)(336012)(47076005)(478600001)(316002)(82740400003)(356005)(81166007)(70586007)(54906003)(6916009)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 00:40:54.3301
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 06d9c245-2573-40da-99f0-08db9eba9d57
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8293

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


