Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 090F13FE981
	for <lists+xen-devel@lfdr.de>; Thu,  2 Sep 2021 08:51:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176935.322187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLgZ0-0007RS-Pd; Thu, 02 Sep 2021 06:51:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176935.322187; Thu, 02 Sep 2021 06:51:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLgYz-00071s-Iv; Thu, 02 Sep 2021 06:51:05 +0000
Received: by outflank-mailman (input) for mailman id 176935;
 Thu, 02 Sep 2021 06:08:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=393g=NY=xilinx.com=fnuv@srs-us1.protection.inumbo.net>)
 id 1mLftM-0004km-9P
 for xen-devel@lists.xenproject.org; Thu, 02 Sep 2021 06:08:04 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (unknown
 [40.107.236.89]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 22069f30-0bb4-11ec-ae3e-12813bfff9fa;
 Thu, 02 Sep 2021 06:08:03 +0000 (UTC)
Received: from BN1PR14CA0026.namprd14.prod.outlook.com (2603:10b6:408:e3::31)
 by SA0PR02MB7500.namprd02.prod.outlook.com (2603:10b6:806:e9::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Thu, 2 Sep
 2021 06:08:02 +0000
Received: from BN1NAM02FT024.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:e3:cafe::fd) by BN1PR14CA0026.outlook.office365.com
 (2603:10b6:408:e3::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17 via Frontend
 Transport; Thu, 2 Sep 2021 06:08:02 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT024.mail.protection.outlook.com (10.13.2.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 06:08:01 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 1 Sep 2021 23:07:23 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 1 Sep 2021 23:07:23 -0700
Received: from [172.19.2.115] (port=56596 helo=xsjfnuv50.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fnu.vikram@xilinx.com>)
 id 1mLfsh-000F6q-AB; Wed, 01 Sep 2021 23:07:23 -0700
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
X-Inumbo-ID: 22069f30-0bb4-11ec-ae3e-12813bfff9fa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PqXc9nZHuBVpovZhtd88HvzHVB8dah0yQfDIGTWKMs+Vv+T5UAMeNAT5E/D6uYfZvEm2uWuuW82J0pjvKifUUNzrwm8/+Skpdi4AgJYGFABnVQlR1QgqiMShDXODKmneMn0YfQ7HenSe8ZdVbg0X9CbRUUoQ58IXoSIVM4kcEwfMGBD8ZHvQGiV9a1oRl/njSUh56tAgKvZ0Z9VmjL7B63ywm2zS46nBMW61TPi9YYsSgCIOKhuJfFrtbgoFyEMWiDRv8iDnNrPZtzBQDaDYMbyJtGdWXnpsWvarRn7AgaWu1S4r7vT+UjOGUWcAE0JFsM8Uc/4twb5JwWjyCZYPUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ykNwRHO6V8HwcABuxYp6Pws7yb5pYX82KhqW7gTX5nc=;
 b=CgY1gDga71hBm89KMbDdD2WJPWR2lnb/Xx0NUtEGdx/Aw+gXSQYIMeiDGyLL7+PNgMeIfowbOOSaH7E5JSBSbypdS0/VXeSh3BEKcwaHOYfuDe/st6iirOvHFrBBabzMUaKQ0Jnuvfy6lRliYhPAgAO+LgwPb05j7ix8uy4Sg+u63jMr8JgSS4eXOkeM54EVt75XTLeTsRPwhnqKsZwEwqct5IDv7ZZWoWvRQ1rk36RitMlitsv4YO81ODiL8BBmXC33L7k8CRYvUXpzkiy6QmiiPJuJvbXM3uSM/Si5wJuctlwhhH5H5QvOYTfR6QvCOIWw7JlroSUjWv05IEXO2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ykNwRHO6V8HwcABuxYp6Pws7yb5pYX82KhqW7gTX5nc=;
 b=G6+822z/VzQ5VXb3CZJGI+vF84PpPixiKHazT8usadnJUJV3GNk1pVcE09e/4/lWTYLrRrqJANikEdGS8Q7HDuOaeJf0OAsaoKBMNTKKIdKqsz910P17k8I65eu3sITtESFZsvSLWPYJWbHL6S82yLDzUN3R2VCtNwLPBI9cy6c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; lists.xenproject.org; dkim=none (message not
 signed) header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
From: Vikram Garhwal <fnu.vikram@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, Vikram Garhwal
	<fnu.vikram@xilinx.com>, Ian Jackson <iwj@xenproject.org>, Wei Liu
	<wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: [XEN][RFC PATCH 13/13] tools/xl: Add new xl commands fpga-add and fpga-del
Date: Wed, 1 Sep 2021 23:06:03 -0700
Message-ID: <1630562763-390068-14-git-send-email-fnu.vikram@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630562763-390068-1-git-send-email-fnu.vikram@xilinx.com>
References: <1630562763-390068-1-git-send-email-fnu.vikram@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c76b6324-d7df-4ebd-1549-08d96dd8056b
X-MS-TrafficTypeDiagnostic: SA0PR02MB7500:
X-Microsoft-Antispam-PRVS:
	<SA0PR02MB75008BEFC4A4BEC256638290BCCE9@SA0PR02MB7500.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:580;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	X4ERjSdA+RWK/hy0b42uEAoSAyrO4UpkaYB7WUQ0Tf+YwDLtoSbqoAuTzatAkj6FhC8rhHhQGKykX/auKQywlj/5IU8rd8cbCIY5D35NXs671zs+GEb6yMwqBcw3jqL2CiAmal8ElmIacC1yg4j2ZBgTZeI5Pan+W85+dlZrw96rE3WFvLZVmy40X+U5EjfL2gvYzbN4XTJXyxSs4X/D9dhZM9Vcp0n62NU+cdvbrCs8zq/h20wNOHmjvXdi2X7UPyNx0/HOLcaRX0FuU3CBAaY38n4XRK2xUh8jCShiMoKV3Fux49PWP9fJOFviHMCTxOWGfxSqLm2JcQ3rz36dWUWmLRBjij8P3NFW7XTyvy+1vm7QP4AlMOIqZVEOzmS9ovfOroBuVdPvb47lY945NumWVBscmwakiIbHieNIfHd33rI5tB6VokevY0nh4DBQ1yuVvIi2utIE5hE4oQcm5kw89FKpZ2rJL2TyisKW21MwN+fJi3JWEsXluiWYrpw7RBPQTstRe3aGMISukcWxV2jpynYMMRoDT/kgQyWB+8YSekOQKARDNKYGzhhZ4qcdKY+jrL5Sehx/poY9pIE6sn65lrLGy9B25mj3p7EG2PFMazDrzFMJjG4eUvtOZnY7ly712XLFUptEP+WlAo4K+E/FvFBmIRW1kqRvkSfqnzfHVhoIM+vlQjHMUHLdzZ8RUHKKyan5BSFtOyKMhIkbucxxenwgKbY5F3olGZtBoQI=
X-Forefront-Antispam-Report:
	CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(39860400002)(136003)(36840700001)(46966006)(316002)(7696005)(36906005)(426003)(83380400001)(478600001)(36756003)(54906003)(26005)(2906002)(36860700001)(9786002)(8936002)(336012)(82310400003)(5660300002)(4326008)(2616005)(82740400003)(356005)(7636003)(8676002)(6916009)(70586007)(6666004)(70206006)(186003)(47076005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 06:08:01.9563
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c76b6324-d7df-4ebd-1549-08d96dd8056b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT024.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7500

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
---
 tools/xl/xl.h           |  2 ++
 tools/xl/xl_cmdtable.c  | 12 ++++++++++++
 tools/xl/xl_vmcontrol.c | 51 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 65 insertions(+)

diff --git a/tools/xl/xl.h b/tools/xl/xl.h
index 7e23f30..63be31e 100644
--- a/tools/xl/xl.h
+++ b/tools/xl/xl.h
@@ -140,6 +140,8 @@ int main_shutdown(int argc, char **argv);
 int main_reboot(int argc, char **argv);
 int main_list(int argc, char **argv);
 int main_vm_list(int argc, char **argv);
+int main_fpga_add(int argc, char **argv);
+int main_fpga_del(int argc, char **argv);
 int main_create(int argc, char **argv);
 int main_config_update(int argc, char **argv);
 int main_button_press(int argc, char **argv);
diff --git a/tools/xl/xl_cmdtable.c b/tools/xl/xl_cmdtable.c
index 661323d..135fe6a 100644
--- a/tools/xl/xl_cmdtable.c
+++ b/tools/xl/xl_cmdtable.c
@@ -20,6 +20,18 @@
 #include "xl.h"
 
 const struct cmd_spec cmd_table[] = {
+    { "fpga-add",
+      &main_fpga_add, 1, 1,
+      "Add a PL block",
+      "<.dtbo>"
+      "-h print this help\n"
+    },
+    { "fpga-del",
+      &main_fpga_del, 1, 1,
+      "Remove a PL block",
+      "<full_node_path>"
+      "-h print this help\n"
+    },
     { "create",
       &main_create, 1, 1,
       "Create a domain from config file <filename>",
diff --git a/tools/xl/xl_vmcontrol.c b/tools/xl/xl_vmcontrol.c
index 435155a..f5bfdbc 100644
--- a/tools/xl/xl_vmcontrol.c
+++ b/tools/xl/xl_vmcontrol.c
@@ -1262,6 +1262,57 @@ int main_create(int argc, char **argv)
     return 0;
 }
 
+int main_fpga_add(int argc, char **argv)
+{
+    const char *fpga_config_file = argv[1];
+    void *pfdt = NULL;
+    int rc;
+    int pfdt_size = 0;
+
+    if (fpga_config_file) {
+        rc = libxl_read_file_contents(ctx, fpga_config_file,
+                                      &pfdt, &pfdt_size);
+
+        if (rc) {
+            fprintf(stderr, "failed to read the fpga-partial device file %s\n",
+                    fpga_config_file);
+            free(pfdt);
+            return ERROR_FAIL;
+        }
+    } else {
+        fprintf(stderr, "FPGA config file is not provided\n");
+        return ERROR_FAIL;
+    }
+
+    rc = libxl_add_fpga_node(ctx, pfdt, pfdt_size);
+    if (rc)
+        fprintf(stderr, "Adding FPGA node failed\n");
+
+    free(pfdt);
+    return rc;
+}
+
+int main_fpga_del(int argc, char **argv)
+{
+    char *full_dt_node_path = argv[1];
+    int rc = 0;
+
+    if (full_dt_node_path) {
+        rc = libxl_del_fpga_node(ctx, full_dt_node_path);
+
+        fprintf(stdout, "fpga-del called for device = %s\n", full_dt_node_path);
+
+        if (rc)
+            fprintf(stderr, "Removing FPGA node failed\n");
+
+    } else {
+        fprintf(stderr, "No device node path provided\n");
+        return ERROR_FAIL;
+    }
+
+    return rc;
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.7.4


