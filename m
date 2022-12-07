Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C026453EB
	for <lists+xen-devel@lfdr.de>; Wed,  7 Dec 2022 07:19:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455862.713548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2nle-0004Fq-9G; Wed, 07 Dec 2022 06:18:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455862.713548; Wed, 07 Dec 2022 06:18:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2nle-0004Bh-3E; Wed, 07 Dec 2022 06:18:54 +0000
Received: by outflank-mailman (input) for mailman id 455862;
 Wed, 07 Dec 2022 06:18:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FP08=4F=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1p2nlc-0001rE-64
 for xen-devel@lists.xenproject.org; Wed, 07 Dec 2022 06:18:52 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20615.outbound.protection.outlook.com
 [2a01:111:f400:fe59::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 03d11df2-75f7-11ed-91b6-6bf2151ebd3b;
 Wed, 07 Dec 2022 07:18:51 +0100 (CET)
Received: from DS7PR03CA0021.namprd03.prod.outlook.com (2603:10b6:5:3b8::26)
 by CY8PR12MB8298.namprd12.prod.outlook.com (2603:10b6:930:7c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 06:18:48 +0000
Received: from DS1PEPF0000E64E.namprd02.prod.outlook.com
 (2603:10b6:5:3b8:cafe::9b) by DS7PR03CA0021.outlook.office365.com
 (2603:10b6:5:3b8::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Wed, 7 Dec 2022 06:18:48 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E64E.mail.protection.outlook.com (10.167.18.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.8 via Frontend Transport; Wed, 7 Dec 2022 06:18:48 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Dec
 2022 00:18:47 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Dec
 2022 22:18:47 -0800
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Wed, 7 Dec 2022 00:18:46 -0600
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
X-Inumbo-ID: 03d11df2-75f7-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e1fb3yvNkfoPTHLSJ5CDiIpmRT84v6oW3L0EN8V6n5/+aFJcM+kzYe+eyeLMBVA8Q6ZbLQAMJGaydUGteV3OmGEdgEi2ngNaDs7fq0UHW1gBy38G0A39tbJh2bX+tp0W+C6WbGx1uiOOLoMRiJcPt9NcHsN5fVyt8NAwcGBy4T12JW78sGaF9rFxvOd/juB5tlIWd9d6EdxyrsThXW4EfoSUEsTziqoEh2HBQT1LXQHIrsqYYR5YnhuHnVSBD/IPZ545YmWEM+jRPBquxtyUzQ2JTguPpM4k09ijoyzNsqYNncDD3lr65M+WBMJErgFb4/LJexsNGy2vWsTwB6HYBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BuoYa3ejdKptzo6evNtz7S4dZu6LLa77J+UAHvefdHA=;
 b=duVyDuB00dbJugGCzltfibeIiRVsSX8dLnHMzSHL8lEY4NgYXrBK+T/xM/1cSFdaB/oQpttntjYyQOr5h799RXvDDen+7beAisAugXOWqF/Z97rFnQPVOyUQNOXlEZxXgzfHMomSPqnlwrW2JCjqJ3PpW2WuSQq9kKPKgq/4IbpZHtte3rkVtd8LvJ4DVO9TKWL7nLVez6ohnrHeDAPLrmiCRCN1iu6/gpEftX+g3rNbajY8XmfzTlT45A5UuXcf/Kl1JsbXLRKpjmJIdtVXuzLwR3+y1zLu090VydaaNsbYhMJC1Ix/iK0BsvFpvN2n/db8uskQ97+vbC6WMoGg8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BuoYa3ejdKptzo6evNtz7S4dZu6LLa77J+UAHvefdHA=;
 b=eeoiBpzM/bO6s03305AX6O1r1dyJZjR0bHjbd0vO1mOMvpT7RrHVXjHpZwW50VahklK4fJCalDRZe5jIwwsmMPkaxMCtM82BOOKvjkjZ4iK53bxRsF74BAd3nhYMIIyyRvyVauJu2nQKd69YwLP8EVCgGExzPSzTizMxLQGzSYw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <vikram.garhwal@amd.com>,
	<Luca.Fancellu@arm.com>, Wei Liu <wl@xen.org>, Anthony PERARD
	<anthony.perard@citrix.com>
Subject: [XEN][RFC PATCH v4 16/16] tools/xl: Add new xl command overlay for device tree overlay support
Date: Tue, 6 Dec 2022 22:18:15 -0800
Message-ID: <20221207061815.7404-10-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221207061815.7404-1-vikram.garhwal@amd.com>
References: <20221207061815.7404-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E64E:EE_|CY8PR12MB8298:EE_
X-MS-Office365-Filtering-Correlation-Id: bbc46c4d-5228-43bc-2a95-08dad81ae6f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+ETeav/QZDjQl6TGBYBcr2zgceIcDIq0XGk29itftJU8gHReJthJsOag8RnuRIjfDIMhNNl9DLnCwDwxiNxHkvCD4jxsDvDcPlxY1pfaiWDrs85E2nSYpd6rK+CxnpTf6Xtq4qsM6kiSXZPRZrBIyZFidWGaaWH1qPeM87xBhCYZTbJTnSllJJwjMUwUkSO8+qX6TQPY80L0oa9ASaCx8W/AzxZOOqIcx0Z2Sk3MokKfq2ggQvADK0vOvTitODxJQUsxsdDg8VZd0nf/erajBXPnAGi90U7Ai1ZTTOVKJcyxj0LX1iEOzeYq7Azxs2cYaqysIdSadahRMXYcBXqK2R+C/1hxakYJrHNK4ot2dYN6NQ5UdeuUTukqDtKo9ks58lvXNY2V+ayRTclPOOe357uzkpDlomUc2igzyJMNzZv4V/t9MfWZ0kKQOBtx8bAiXiziWYy1kYru0aNUmBuYaHt0iSQU/y6EU6mhz4/Gb3ZgWpX/XG/88IE6th0El0lIsHDo8lW2Ps2/x6wTBFvw1X6M4obAWPQSFRggJWBdxlEjXRZ8oczetoPYtFnDcHSTw9fFYhocgy8yy/rZpWgXZaFn+9YJ3SOD1UPmaKIb6bfXe9oTLB28H/Qt9ORO0wPlSVR4C37Hmfx20bcUdnzRCfLd+XgNHs0G/pycFpwJw6M1euYTkwS/FVTvXEf9tfW/rLjD8BBuwx9db5YhzO5Pl+VujUeq5xaHbEadclhlXcA=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(346002)(396003)(376002)(451199015)(40470700004)(46966006)(36840700001)(36860700001)(83380400001)(356005)(40460700003)(86362001)(81166007)(8936002)(44832011)(5660300002)(2906002)(4326008)(41300700001)(478600001)(186003)(40480700001)(82310400005)(26005)(336012)(1076003)(426003)(6666004)(47076005)(2616005)(6916009)(54906003)(70206006)(70586007)(316002)(8676002)(82740400003)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 06:18:48.1050
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bbc46c4d-5228-43bc-2a95-08dad81ae6f6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E64E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8298

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 tools/xl/xl.h           |  1 +
 tools/xl/xl_cmdtable.c  |  6 ++++++
 tools/xl/xl_vmcontrol.c | 48 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 55 insertions(+)

diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index 7c9aff6ad7..6e95dfe6ea 100644
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
index 35182ca196..868364c58d 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -630,6 +630,12 @@ const struct cmd_spec cmd_table[] = {
       "Issue a qemu monitor command to the device model of a domain",
       "<Domain> <Command>",
     },
+    { "dt_overlay",
+      &main_dt_overlay, 0, 1,
+      "Add/Remove a device tree overlay",
+      "add/remove <.dtbo>"
+      "-h print this help\n"
+    },
 };
 
 const int cmdtable_len = ARRAY_SIZE(cmd_table);
diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
index 5518c78dc6..b5f04e2741 100644
--- a/tools/xl/xl_vmcontrol.c
+++ b/tools/xl/xl_vmcontrol.c
@@ -1265,6 +1265,54 @@ int main_create(int argc, char **argv)
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
+        return ERROR_FAIL;
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
+    return rc;
+}
 /*
  * Local variables:
  * mode: C
-- 
2.17.1


