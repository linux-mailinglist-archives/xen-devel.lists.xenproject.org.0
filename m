Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98681788171
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 10:03:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590547.922873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRmd-0007VO-46; Fri, 25 Aug 2023 08:03:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590547.922873; Fri, 25 Aug 2023 08:03:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRmc-0007RB-QH; Fri, 25 Aug 2023 08:03:06 +0000
Received: by outflank-mailman (input) for mailman id 590547;
 Fri, 25 Aug 2023 08:03:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+VXW=EK=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qZRmb-0007GZ-6u
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 08:03:05 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e88::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d0a40d40-431d-11ee-8783-cb3800f73035;
 Fri, 25 Aug 2023 10:03:04 +0200 (CEST)
Received: from MW4PR03CA0037.namprd03.prod.outlook.com (2603:10b6:303:8e::12)
 by IA1PR12MB8496.namprd12.prod.outlook.com (2603:10b6:208:446::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27; Fri, 25 Aug
 2023 08:02:58 +0000
Received: from CO1PEPF000044FB.namprd21.prod.outlook.com
 (2603:10b6:303:8e:cafe::f6) by MW4PR03CA0037.outlook.office365.com
 (2603:10b6:303:8e::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.30 via Frontend
 Transport; Fri, 25 Aug 2023 08:02:58 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044FB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.2 via Frontend Transport; Fri, 25 Aug 2023 08:02:58 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 25 Aug
 2023 03:02:58 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 25 Aug 2023 03:02:57 -0500
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
X-Inumbo-ID: d0a40d40-431d-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CgumGq9aZCLCsioaDumg9l1ra1WH63XNss7bY8kPvTXG22l0TOwp/q3jWnHJbFPD2mG9YdxxxPDyBHmjo74mfU06S7Fz/sdMVOopAYl5UowekfoIYnJCN/9rj7lLB6ZRvXzuAJgcsUfi0HQkOSkhdajfNZepnFGBL8/BHD3ol4TT8nq2mKf7J6NdRJuff8De6DUC/mh+3QPiJeIzZVQ0lqgkeclvekN309O8ryx5y89BoajL47BraBg9NDEE6ctqHo3ePNqFI4gsP7J0d9bfDSMfn5S2CEEjCFVLEdnS3wSqyWE6oJRioVEpjWuRRpYx64Y1x443V9vtxFC97jYvxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N48gpSlC0ul9Dgr5X4IgXaGnFeuJhzDtng9Ayqa//1E=;
 b=foEjyy0NPEwpDfiwJw/N96j6IlrTtxty8iW7Xb+vfjGZMVLKKLIt90jr0vzSSTXEJP8JRx6g2mo5YnlU9jMg/Z0A8ZFqU5AiciuY+AmZMRdo0S22VLf8+I3Q0J2OAvfJATU+A+kA20rkNCvlM0Ojh+tKR7rEFIHxqqzsTWtnH6s7rryKbFFAfRQpTUC7mzyAK5hR7x3Cg0G1KT4jEGYmdqzj3Rjw3m4Y1iFnqkdbbIMmMZKD/X6p82iwKEKL6RzGmBc4YlwKvcs7Dkt7gOyY07FoxsAMFySSEwOWPZvh8MgHKhanO89GncIP5fZgZoqfTJwi2EwBefxqPpBF26pEKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N48gpSlC0ul9Dgr5X4IgXaGnFeuJhzDtng9Ayqa//1E=;
 b=U5lQyWoIPj714eCMMBBWlHCbVtlrHEUTzdlS4upIGEsQfYZPzscuTcRyxZZ6Voin52grovV4qrBKSoE+KvAV2nq0yTaouLUuDFhsWvOX58rktslRLEJuSzLCa8ew4/bImsy5MKOqqoVa6Lu3CrVO3lOMXZOwV3SjrvhcAAQpzcM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <julien@xen.org>
Subject: [XEN][PATCH v10 04/20] common/device_tree: Export __unflatten_device_tree()
Date: Fri, 25 Aug 2023 01:02:06 -0700
Message-ID: <20230825080222.14247-5-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230825080222.14247-1-vikram.garhwal@amd.com>
References: <20230825080222.14247-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FB:EE_|IA1PR12MB8496:EE_
X-MS-Office365-Filtering-Correlation-Id: 537abbab-683b-413a-1e03-08dba541b25c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QYjgEMkYOgrV7ptUCqmB/PJckNRAgoc8nhwvUqlAwkBtBTTNUCxcq7ZWs1sml+4+rn2C6DdBysmzPaw9gp0uKf0RTBHN1msq3BrJvEFg3uQtYgxsTs6sCDVNlf3YUaU2uCJw002jOLmVnG8yTf16b9ViR8VhhhYAKMv/+kDk7exfaIy0vLmE4LvB0zlOri0cnc6nKhPbpXNeRZz+mruSUFBqpHDiaOLxdtbs4d/fwKnF74++CSIdHEmjQJe9IXaKa2CAd9LKnxusnNAhIgbV/HqiBHSGQfR9SRoZm558a4tWI/u8awthhiIt8GVy4aFGp+m5kKckziXWH3ro7QNqKS5H4wJgWkjS0riBYfnxxAu6ShdHAgpqCWaQmnBc/n92ycf3lV6Z0kzB3SNss5OTyGDaj4MG+U6RECmKd0wcUPP7VBahp6zOLjbukYB2gl4d+bOusLtUSIQrYjHJc3wX+IUT3HgKPTH9HIwIE6m33noYAF3ualORpcJ7pMZ+agJSokx1Dxwv8TZL1MmG/mn4wQqikg3mdH9R6kZaJE1qo0AOX9ig3isaXwvQty4eUZH9g1Q1LYXFF5vIF772eI5ZYJcGPTI89h3DjG2cTjIMMxQbDza3yD3/Sir/8JPu2nRxRm3EKzibQ5UwriYcl8EpG5Qu+FjwHxQujJkI2NR9Xo+lxasjfL8QZ8bk/qRTGi737UvSeIJyntuSiLPRd/CPeOEBhvsHSDnbPUmBtliqbhjgXDMkos/4EA0BIViUm7q/9JZVlf6UxVc7FA2u5BcAlA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(136003)(396003)(376002)(186009)(1800799009)(82310400011)(451199024)(40470700004)(46966006)(36840700001)(54906003)(70586007)(70206006)(316002)(6916009)(81166007)(478600001)(40480700001)(26005)(6666004)(82740400003)(41300700001)(86362001)(2906002)(356005)(4326008)(8676002)(8936002)(83380400001)(2616005)(40460700003)(5660300002)(47076005)(44832011)(1076003)(426003)(336012)(36756003)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 08:02:58.5489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 537abbab-683b-413a-1e03-08dba541b25c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8496

Following changes are done to __unflatten_device_tree():
    1. __unflatten_device_tree() is renamed to unflatten_device_tree().
    2. Remove __init and static function type.

The changes are done to make this function useable for dynamic node programming
where new device tree overlay nodes are added to fdt and further unflattend to
update xen device tree during runtime.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Acked-by: Julien Grall <jgrall@amazon.com>

---
Changes from v7:
    Update the commit with why unflatten_device_tree() is changed.
    Move function documentation to device_tree.h
---
---
 xen/common/device_tree.c      | 19 +++----------------
 xen/include/xen/device_tree.h | 14 ++++++++++++++
 2 files changed, 17 insertions(+), 16 deletions(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index fccf98f94e..b8ef1c7ae2 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -2082,20 +2082,7 @@ static unsigned long unflatten_dt_node(const void *fdt,
     return mem;
 }
 
-/**
- * __unflatten_device_tree - create tree of device_nodes from flat blob
- *
- * unflattens a device-tree, creating the
- * tree of struct device_node. It also fills the "name" and "type"
- * pointers of the nodes so the normal device-tree walking functions
- * can be used.
- * @fdt: The fdt to expand
- * @mynodes: The device_node tree created by the call
- *
- * Returns 0 on success and a negative number on error
- */
-static int __init __unflatten_device_tree(const void *fdt,
-                                          struct dt_device_node **mynodes)
+int unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes)
 {
     unsigned long start, mem, size;
     struct dt_device_node **allnextp = mynodes;
@@ -2234,10 +2221,10 @@ dt_find_interrupt_controller(const struct dt_device_match *matches)
 
 void __init dt_unflatten_host_device_tree(void)
 {
-    int error = __unflatten_device_tree(device_tree_flattened, &dt_host);
+    int error = unflatten_device_tree(device_tree_flattened, &dt_host);
 
     if ( error )
-        panic("__unflatten_device_tree failed with error %d\n", error);
+        panic("unflatten_device_tree failed with error %d\n", error);
 
     dt_alias_scan();
 }
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 1d79e23b28..a518310a62 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -178,6 +178,20 @@ int device_tree_for_each_node(const void *fdt, int node,
  */
 void dt_unflatten_host_device_tree(void);
 
+/**
+ * unflatten_device_tree - create tree of device_nodes from flat blob
+ *
+ * unflattens a device-tree, creating the
+ * tree of struct device_node. It also fills the "name" and "type"
+ * pointers of the nodes so the normal device-tree walking functions
+ * can be used.
+ * @fdt: The fdt to expand
+ * @mynodes: The device_node tree created by the call
+ *
+ * Returns 0 on success and a negative number on error
+ */
+int unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes);
+
 /**
  * IRQ translation callback
  * TODO: For the moment we assume that we only have ONE
-- 
2.17.1


