Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C41A2788172
	for <lists+xen-devel@lfdr.de>; Fri, 25 Aug 2023 10:03:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590545.922860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRmc-0007Jg-8n; Fri, 25 Aug 2023 08:03:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590545.922860; Fri, 25 Aug 2023 08:03:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZRmc-0007H8-5g; Fri, 25 Aug 2023 08:03:06 +0000
Received: by outflank-mailman (input) for mailman id 590545;
 Fri, 25 Aug 2023 08:03:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+VXW=EK=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qZRma-0007G4-5E
 for xen-devel@lists.xenproject.org; Fri, 25 Aug 2023 08:03:04 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062a.outbound.protection.outlook.com
 [2a01:111:f400:fe59::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cf165a16-431d-11ee-9b0c-b553b5be7939;
 Fri, 25 Aug 2023 10:03:01 +0200 (CEST)
Received: from MW4PR03CA0055.namprd03.prod.outlook.com (2603:10b6:303:8e::30)
 by CH0PR12MB8579.namprd12.prod.outlook.com (2603:10b6:610:182::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.29; Fri, 25 Aug
 2023 08:02:58 +0000
Received: from CO1PEPF000044FB.namprd21.prod.outlook.com
 (2603:10b6:303:8e:cafe::6b) by MW4PR03CA0055.outlook.office365.com
 (2603:10b6:303:8e::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.30 via Frontend
 Transport; Fri, 25 Aug 2023 08:02:57 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044FB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.2 via Frontend Transport; Fri, 25 Aug 2023 08:02:56 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 25 Aug
 2023 03:02:56 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Fri, 25 Aug 2023 03:02:56 -0500
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
X-Inumbo-ID: cf165a16-431d-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lBOpXoPbVXKhhA9fvSvRPQDpLfTnQc/j2mT1T1cFfeHMFNpOhP0gJBEntm94K7+WcWQiY5xGcPtem8NS5vIA3gs1BykGxoodMow2z2BZqm6I8MqOPwWQqk2yg+Q4n/f46kVn4rf73LFL848EnclVuL/G8xv/h2LjZ2mCtpaYwckE97dVdPxR0hJKUBTqcu94Upk3iD8CJnchP6HAXs3+G5oGpsziNANxFeDazX5NZEm+VmHeP/EoNOGx2Onh19UFx6FZeOChiNdwEzJEkzB16RPbtsI5AwfHYsNRDE6i4FE2sUgmft00UmQHQNqXguER63rgKu3ZHOJsq71keORTUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TvyzZKkKruBh4hcUgS0xB1M/ZVRIznonRnMXhEGKKko=;
 b=D8sIOba4VEYzLXSpBIfSfUF0avv+xNqRjRB5RnMtl83nr1mWQiH+INv5PfB+Ite8LLD3bVD8bQmzjO9kqKqirMs0ft+3rbSccIMKCcOzsSSej+SfiX1LxaAw3/t+vfzBbiWIqVJcV2E/cfbubM3SYKTkrpx+D1cqtP25/VJp0kXXIlKUw9W9gv4ovFvRevQCW5e+WXIVow2XMJELT+syzAmSWVXKtQNj4byBgF1QbwDS+TXyNAVV1oyXcq17HHPLZaSnPCjWwi5sS6bCfJI8j0FaiHDu3eoi8iRvoSMilUgvWVRkIH5GCfUnu7E0eJJDY7tn2SEEVhqh9eJEr2y+kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TvyzZKkKruBh4hcUgS0xB1M/ZVRIznonRnMXhEGKKko=;
 b=Mf+rCflavkMxuB6E/HBkt2zLAo/0V4lnxc1DhzZ2InHLW+b/M77HwO1z4BVsB+rZkmsVQsCN0XU1TYXZqciNkmEncR2ctS+X+pjWypAdHQ9lvsANiL+wAyEwSk0ua6xXbf36sBANNPoUl9XuXPJdzw//f2ZSHmFYkbK6no9SZ4c=
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
Subject: [XEN][PATCH v10 02/20] common/device_tree.c: unflatten_device_tree() propagate errors
Date: Fri, 25 Aug 2023 01:02:04 -0700
Message-ID: <20230825080222.14247-3-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230825080222.14247-1-vikram.garhwal@amd.com>
References: <20230825080222.14247-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FB:EE_|CH0PR12MB8579:EE_
X-MS-Office365-Filtering-Correlation-Id: 27be0861-6331-4eb8-c6c9-08dba541b161
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7633raw/rY21lrYvW8KiPPfcqYi3gUz/Z2zNyZ5d/SXhDGvYg8amPgPdnKH4keKZCtbkUK7WMewNPSEpZ4FoIYPaoYFNNbz3g6K0jnwqxPmwJKCEdFcyY2qmq3WHKiecJFyG3tUvWCjli3wnuTAFkDgA22DQJwcKjI3LChn5oapa64A8DkJquGgcqXFG1VPozZ3wGUpiJ9Nsqh8ZbvS+4KMw2VtRkymGRf0YB3YI3Nr0cWnRlF/VjzxBQ72fR6KpVbFRvlCJwCTz10cjnIepZoD3fUBQ3MzOEGuTlmIEGSl83fqSZgl3EYauaZH4fPStjeg3fXGgMwt9Y9T9IlVfR9xrTu+VsxgqLNjO0Dm84duNZHw8xemLAi+jeO0sWEypX51x2K5q1hEyY4ju+J4Hwd3FNhGsj1/B4psbCKzdmxnjEkUMkLltxe9y6yCWrkMtNN7dh26Np1DXxyPIsT+vi5Hc9TvzpCcpWHo5/+11uZ62pL4spivnaBjjr5nxXmflFkrsIc5BgZS5jCXCuM7gwYFigVRthXArntCucX7T+HMSEHI6EK4S0/+O5hRBcaiUoUAhiZdmNex7vDKe0So4fAb+L7cwNZu3DqnzxiAgum3q6lb8ua8m4rHA95OaOdIRao3PvguJXJvN0RpDLqVCjz+uNKn6L7ZsprOJeyLQeat+7onKt8FPTd73ZnaT5B+KX5/ZNBJlFzj4Y38rmK58n7LhgCZqj5Pf8ZSbdT4eI3d3T5rhwsX2LXiwysjTHv7cEVNB0Ah2u1Q4jAiitAvkZQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(39860400002)(396003)(376002)(186009)(82310400011)(1800799009)(451199024)(40470700004)(36840700001)(46966006)(356005)(82740400003)(81166007)(40460700003)(8676002)(4326008)(8936002)(54906003)(41300700001)(6666004)(316002)(36756003)(6916009)(70586007)(70206006)(86362001)(40480700001)(47076005)(26005)(478600001)(336012)(36860700001)(1076003)(44832011)(83380400001)(2906002)(2616005)(5660300002)(426003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 08:02:56.9083
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27be0861-6331-4eb8-c6c9-08dba541b161
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8579

This will be useful in dynamic node programming when new dt nodes are unflattend
during runtime. Invalid device tree node related errors should be propagated
back to the caller.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>

---
Changes from v9:
    Replace __be64 with void.
Changes from v7:
    Free allocated memory in case of errors when calling unflatten_dt_node.
---
---
 xen/common/device_tree.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index 7c6b41c3b4..b6d9f018c6 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -2110,6 +2110,9 @@ static int __init __unflatten_device_tree(const void *fdt,
     /* First pass, scan for size */
     start = ((unsigned long)fdt) + fdt_off_dt_struct(fdt);
     size = unflatten_dt_node(fdt, 0, &start, NULL, NULL, 0);
+    if ( !size )
+        return -EINVAL;
+
     size = (size | 3) + 1;
 
     dt_dprintk("  size is %#lx allocating...\n", size);
@@ -2127,11 +2130,21 @@ static int __init __unflatten_device_tree(const void *fdt,
     start = ((unsigned long)fdt) + fdt_off_dt_struct(fdt);
     unflatten_dt_node(fdt, mem, &start, NULL, &allnextp, 0);
     if ( be32_to_cpup((__be32 *)start) != FDT_END )
-        printk(XENLOG_WARNING "Weird tag at end of tree: %08x\n",
+    {
+        printk(XENLOG_ERR "Weird tag at end of tree: %08x\n",
                   *((u32 *)start));
+        xfree((void *)mem);
+        return -EINVAL;
+    }
+
     if ( be32_to_cpu(((__be32 *)mem)[size / 4]) != 0xdeadbeefU )
-        printk(XENLOG_WARNING "End of tree marker overwritten: %08x\n",
+    {
+        printk(XENLOG_ERR "End of tree marker overwritten: %08x\n",
                   be32_to_cpu(((__be32 *)mem)[size / 4]));
+        xfree((void *)mem);
+        return -EINVAL;
+    }
+
     *allnextp = NULL;
 
     dt_dprintk(" <- unflatten_device_tree()\n");
-- 
2.17.1


