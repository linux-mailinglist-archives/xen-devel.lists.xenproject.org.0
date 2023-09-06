Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7218D793338
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 03:17:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595989.929702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdh9v-0006wk-7b; Wed, 06 Sep 2023 01:16:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595989.929702; Wed, 06 Sep 2023 01:16:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdh9v-0006tx-4H; Wed, 06 Sep 2023 01:16:43 +0000
Received: by outflank-mailman (input) for mailman id 595989;
 Wed, 06 Sep 2023 01:16:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kbfT=EW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qdh9u-0006tr-8F
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 01:16:42 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20620.outbound.protection.outlook.com
 [2a01:111:f400:fe59::620])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 082fd43b-4c53-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 03:16:41 +0200 (CEST)
Received: from CY5PR15CA0125.namprd15.prod.outlook.com (2603:10b6:930:68::28)
 by DS7PR12MB6237.namprd12.prod.outlook.com (2603:10b6:8:97::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.28; Wed, 6 Sep
 2023 01:16:36 +0000
Received: from CY4PEPF0000E9DC.namprd05.prod.outlook.com
 (2603:10b6:930:68:cafe::28) by CY5PR15CA0125.outlook.office365.com
 (2603:10b6:930:68::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.34 via Frontend
 Transport; Wed, 6 Sep 2023 01:16:36 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9DC.mail.protection.outlook.com (10.167.241.82) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Wed, 6 Sep 2023 01:16:35 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Sep
 2023 20:16:34 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Sep
 2023 20:16:34 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 5 Sep 2023 20:16:34 -0500
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
X-Inumbo-ID: 082fd43b-4c53-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cjkzRChznUFsL/Kb4ezMYaOVqHLLgwX8VivHXQTbxdPuksUtLcGHtpYaONAcfrNmLFAk8OIrsn7Zkan9vjH0Xj2cEKu9T0VWvnFsQWVQj+lNQjxiVT15QbaKySHyKEtSsRCZMSuqH5P62r3EkNbC2EBPOOuzRusxVHS2fv/RTpJliKFlHO6/kWSxS61b1D4xNffDRkciO/qoyzKREq8TH5BlAAU8hYhIR+zGlMVaozesk9nyTw4XFECOeO3H9SXU6lL+8NM30NCCjVRS7VC7rE6luPimKTNAurrL0Vbv84wUtOi4TDxjBxTVnL/15sL0Rb1ddliajkwl3luDkUm4GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=551FbITUy/lX+UFAVwLYLGK11TzVaHOhuLFDvzMcrP0=;
 b=bHnf0id+X79G0TkY80EYj9riKNuFeUQDAhuo5XE34GTtGxWD1aSTa7t5H1PiCBJ1gNsxt5ANp3OsuMFy+s8IDgsve+LtftUSSJdzB37rigHogZOPE3vYgpcD+cphMtKIMLAIf+/Ysk25aSQicBqNiTgYvM1W1s8FL5NhUOnFWZyzFufOCMthqHEArZGTEo9CnXm3FJuqOcAKhOafxyhCMaPE53jVpiopPSSA6dOEF/3+Wac4CoF5VXpFcsofctkbxzxtqW3JVlpWn1MMfQJ/P8YKWEFWJ1Rbn4+rqUhiscyfYEH66PzhfcnKSkgO3F74P7GTKggnFxDax2tkNIqa9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=551FbITUy/lX+UFAVwLYLGK11TzVaHOhuLFDvzMcrP0=;
 b=2mStBXeiExRDjGr89TFfTiTBbP2C3BpqTOAcHceDOw6rSPuH6Tvz0PeW74t5QkIrsEVFdNCu1PFndvCA4ZU9v0wNsHkKla97MdjhPBtfn48dfIbhIb9yxd81FcltA7ijOoeLswP/jRqaw7K5BfPGkPtZGy7saElcm/12pGnGc1g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <vikram.garhwal@amd.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<sstabellini@kernel.org>
Subject: [XEN][PATCH v12 01/20] common/device_tree: handle memory allocation failure in __unflatten_device_tree()
Date: Tue, 5 Sep 2023 18:16:11 -0700
Message-ID: <20230906011631.30310-2-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230906011631.30310-1-vikram.garhwal@amd.com>
References: <20230906011631.30310-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DC:EE_|DS7PR12MB6237:EE_
X-MS-Office365-Filtering-Correlation-Id: e08b7899-7037-46fd-e334-08dbae76e9e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wC/e+H7Gv3Aj63UAEApYCrfbJCTghyZDKBvaUE1PGN64/fVJr73Sl1EIQQMVdthUQ2UN/wLdllDqKNKBldarPu8NJMtF/wKZk8xW9kP4G3XlqcYdAZalMuA/WUpIAx9aWtURG4SUCXiW0wUhmz8J9uPThuZiOFszkIMO4aC6C1Tk+Gqn85NnPnaLtIg65xlq7w/WpKDOw56vJz1/qYnReZD8mGpqjVI3c5Rpiv6EWq21UWh5i+xxrWG9TZK2GfoJvdUb63zx+EPOoKpE/R3TVtmg7KgfW/viNjU5QIWBEp1eJqsMEVyfohPS+9IZbhKKzBwyWAA/pwOJj5Rsgc6jxAY6lrxBnoNQHCvlkFBUWUkRsJyNsxBq0eqcnNlz2wMo5vliE7IzOA3zTxPIQskC6N9161vMYMVmJyKBHQF7reoAyGLpe9Eq/lM4jRl4/pM7LdBk2QaX0k4nVY7//1OJZeh6xPMa2bkk8LpUFXXcJ0DVUHhYThfXd41zm1HRF2SSNe8fFHE/w4/Ru21vFclfeeZl37Uw5KQefnHx9YmncgNHerICktk/vEQE5WCwmvIBwbrB0ltH+vi998LmnXa/fEHX0bbYNB9BQpYFtd+plqTwqTxk3A11eKe0ONBKY2Z8zfLr5rcuE7V6BezKRZHzu4GiQMjuujmLb0HyMe7B9DFxJmzKb6E81dI0/bylPQyWNRf01AFwwtnZ208zBjzgowbpHuZ29frhuCKPtuORnXJNwUuqN+nuatYSS7mLdztAZGm5tSyvznHiidf7qMp6aQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(136003)(376002)(396003)(451199024)(1800799009)(186009)(82310400011)(40470700004)(36840700001)(46966006)(41300700001)(8936002)(40480700001)(83380400001)(44832011)(478600001)(6916009)(6666004)(2906002)(5660300002)(70206006)(8676002)(316002)(54906003)(4326008)(70586007)(1076003)(40460700003)(26005)(2616005)(36860700001)(336012)(426003)(356005)(36756003)(47076005)(82740400003)(81166007)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 01:16:35.5232
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e08b7899-7037-46fd-e334-08dbae76e9e1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9DC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6237

Change __unflatten_device_tree() return type to integer so it can propagate
memory allocation failure. Add panic() in dt_unflatten_host_device_tree() for
memory allocation failure during boot.

Fixes: fb97eb614acf ("xen/arm: Create a hierarchical device tree")
Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Henry Wang <Henry.Wang@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Julien Grall <jgrall@amazon.com>

---
Changes from v9:
    Update comment regarding return value of unflatten_device_tree().
---
---
 xen/common/device_tree.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 0522fdf976..7c6b41c3b4 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -2091,9 +2091,11 @@ static unsigned long __init unflatten_dt_node(const void *fdt,
  * can be used.
  * @fdt: The fdt to expand
  * @mynodes: The device_node tree created by the call
+ *
+ * Returns 0 on success and a negative number on error
  */
-static void __init __unflatten_device_tree(const void *fdt,
-                                           struct dt_device_node **mynodes)
+static int __init __unflatten_device_tree(const void *fdt,
+                                          struct dt_device_node **mynodes)
 {
     unsigned long start, mem, size;
     struct dt_device_node **allnextp = mynodes;
@@ -2114,6 +2116,8 @@ static void __init __unflatten_device_tree(const void *fdt,
 
     /* Allocate memory for the expanded device tree */
     mem = (unsigned long)_xmalloc (size + 4, __alignof__(struct dt_device_node));
+    if ( !mem )
+        return -ENOMEM;
 
     ((__be32 *)mem)[size / 4] = cpu_to_be32(0xdeadbeefU);
 
@@ -2131,6 +2135,8 @@ static void __init __unflatten_device_tree(const void *fdt,
     *allnextp = NULL;
 
     dt_dprintk(" <- unflatten_device_tree()\n");
+
+    return 0;
 }
 
 static void dt_alias_add(struct dt_alias_prop *ap,
@@ -2215,7 +2221,11 @@ dt_find_interrupt_controller(const struct dt_device_match *matches)
 
 void __init dt_unflatten_host_device_tree(void)
 {
-    __unflatten_device_tree(device_tree_flattened, &dt_host);
+    int error = __unflatten_device_tree(device_tree_flattened, &dt_host);
+
+    if ( error )
+        panic("__unflatten_device_tree failed with error %d\n", error);
+
     dt_alias_scan();
 }
 
-- 
2.17.1


