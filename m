Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD60F71F758
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 02:49:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542805.847214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4syj-0005lK-VD; Fri, 02 Jun 2023 00:49:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542805.847214; Fri, 02 Jun 2023 00:49:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4syi-0005Im-L9; Fri, 02 Jun 2023 00:49:16 +0000
Received: by outflank-mailman (input) for mailman id 542805;
 Fri, 02 Jun 2023 00:49:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CQ40=BW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1q4syZ-0000if-L4
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 00:49:07 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20630.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4647b034-00df-11ee-b231-6b7b168915f2;
 Fri, 02 Jun 2023 02:49:06 +0200 (CEST)
Received: from MW4P222CA0008.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::13)
 by CH0PR12MB5187.namprd12.prod.outlook.com (2603:10b6:610:ba::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.22; Fri, 2 Jun
 2023 00:49:03 +0000
Received: from CO1NAM11FT110.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:114:cafe::aa) by MW4P222CA0008.outlook.office365.com
 (2603:10b6:303:114::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23 via Frontend
 Transport; Fri, 2 Jun 2023 00:49:03 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT110.mail.protection.outlook.com (10.13.175.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.24 via Frontend Transport; Fri, 2 Jun 2023 00:49:03 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 19:49:02 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 17:49:02 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 1 Jun 2023 19:49:01 -0500
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
X-Inumbo-ID: 4647b034-00df-11ee-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rp8pHoRg8ed/ajxYTfWD92SqZMZrLCBcZN3UWy+ptnHfLsDX+ICStJkKoY/yryHXNMDHBTJkJ3WmKtnn/NsT6U4wZFCq5Pg8WZGriDRMI/CWejHLmGXbr9ElkA80o5bt3aQVXe7NXLuNfdJr6NrtTs5aCLz/05yQv/v6I+/tRFDNxIn69gkoEThqmRJ+wsztuXZudgJ8fLnnKJ9jlUb7oPZow2xtJ2IZwy4JMvBcR7btU+TMviyQlAMUdhaRk0v1q/KX5h6nSJl5rfH3jbMDiHzamSyhJFdGd+y8iPMZthqVDpWwkGR82NhzoVQZhB5L1boI9mPgP/M80FiC6L4OWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=82cXKCd9pIjt4k7d+0pxA09Bfm65PUipqTwwDD6EGDA=;
 b=Pn2x5FXILpdvqOf2hmUNCzmraeWDHN64/T51cK0kPKh/JmWsLHo4wfwxp8ONazBlYnG9LNYm01Dj5j7AqUvRup8AW6/cC8I9jHts+OcYMmsFvzfUh2qJTScHaUgFMwWGYDXWMtwZceFnk5iR9AMdSDchFXsLpmwmtR/u1mjumWQhToKPS1NtVlodD5wtmoHWh8RmdWO5OVc8Eml/BknEQoU0SAG+6JOVcdDUP+3H+86cZTzBnP1ShBh/ZYLU0CyOSqIN+kq4rRMgmRWgka0PvAZGH4RzhtVJozQVPMvMVN7jlQeFgCzH0N7DmxK+BplBhRfMGTSWeF21t6bIDwjiGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=82cXKCd9pIjt4k7d+0pxA09Bfm65PUipqTwwDD6EGDA=;
 b=2jU3mT6+M6dDk79F9dnowrh5R/zXyXisroar1oIaklo5yJoPayg7i7I+5vuCqcO1b5PX5yIaJkBdyP0rNEIZyeDD27AOohgfCm7xA+k64rgkijryZHZcoQUVqC6HwIRiH1r4SQk5QkPTVbW6GkLtaFJurqEulU8xAf6JkZ7G3PA=
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
Subject: [XEN][PATCH v7 19/19] tools/xl: Add new xl command overlay for device tree overlay support
Date: Thu, 1 Jun 2023 17:48:24 -0700
Message-ID: <20230602004824.20731-20-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230602004824.20731-1-vikram.garhwal@amd.com>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT110:EE_|CH0PR12MB5187:EE_
X-MS-Office365-Filtering-Correlation-Id: a087ca27-b981-4a87-a051-08db6303294d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vemutuTFnXRVmPffSDPBvLSvxxFt9Ce10+r2J5sVaRJ4LgzzAfBykLUDJOyJdvWa7P5ldy21TcqJ9MTYqvDdrsyDXu638qCl8yVPifuaMmtdD5fCe/C/LMoGvC9VhiqAdq6fPLAUoiAqph2WHA7ZfRV7guLGcxoxbqA5uuFBMwfmLymK2AZEKr1tGMKtyphiB+w3LURsqyt0SvIr8GLFSoZjYWAWPniseoDdC0ySePzxeWvQq3gPmVa7ifYOtAKCvgngutohGzp+Z+RYzba0OpHtW181sb6pNQSlwuT0qFJqRXj4msRH7adENLZIgtmriYTRwJ9KlenGRTiQZNPbpLeBzxoZq1JsVV/a12BAwUr4m25basXfOA8qvWPQgWN05JV1rbh3+tkG5geZVBNSIZWpW0mwL5qN09ZrmPmE2+HRIwXAPDq+JbTFsbdmTXdACJOc6iKDHerS105eYnshgVCUMvlgFZjKdv2qVSbXtCpciPzTtlAuxUFHWAYwwloLwT2WQ4JB3ukKRsjPNcJ+kuMUpZ6aBbsUNmwx/aXcRZKpAvK2/PD72dJS+61KEUHpL16qS8dy4qHKlKRlwZPuTV3kaKGj4eIaROPdPjze/50XnznDbEuGuLOjiUgITsOFnSM4Bn6vBsWyWKqb8ziz66uEShgFzj6WesNhY8GZScon1YoiSP1gXBLWljlW/zmWUj4yfwMPpnkwGL21VoXT0MFnC5qHXJkQMaR4Swyi+YcqYc158CO5DYrZieMih9xvvRdcprWt8t9SAz2gZ1FQBg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(376002)(39860400002)(396003)(451199021)(40470700004)(46966006)(36840700001)(54906003)(8936002)(8676002)(2906002)(4326008)(6916009)(70206006)(70586007)(316002)(41300700001)(44832011)(5660300002)(478600001)(6666004)(40460700003)(82740400003)(81166007)(1076003)(40480700001)(186003)(26005)(426003)(47076005)(36860700001)(356005)(86362001)(83380400001)(336012)(2616005)(36756003)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 00:49:03.0499
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a087ca27-b981-4a87-a051-08db6303294d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT110.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5187

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


