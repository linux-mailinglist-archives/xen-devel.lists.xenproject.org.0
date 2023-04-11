Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9AE6DE4A8
	for <lists+xen-devel@lfdr.de>; Tue, 11 Apr 2023 21:19:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519832.806932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJWv-0007r3-9b; Tue, 11 Apr 2023 19:19:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519832.806932; Tue, 11 Apr 2023 19:19:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJWv-0007nz-6W; Tue, 11 Apr 2023 19:19:49 +0000
Received: by outflank-mailman (input) for mailman id 519832;
 Tue, 11 Apr 2023 19:19:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOX4=AC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pmJUX-0004DR-UL
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 19:17:21 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20605.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::605])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7a02f9d4-d89d-11ed-8611-37d641c3527e;
 Tue, 11 Apr 2023 21:17:19 +0200 (CEST)
Received: from MW4PR03CA0193.namprd03.prod.outlook.com (2603:10b6:303:b8::18)
 by BY5PR12MB4082.namprd12.prod.outlook.com (2603:10b6:a03:212::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Tue, 11 Apr
 2023 19:17:16 +0000
Received: from CO1NAM11FT096.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b8:cafe::50) by MW4PR03CA0193.outlook.office365.com
 (2603:10b6:303:b8::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.39 via Frontend
 Transport; Tue, 11 Apr 2023 19:17:16 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT096.mail.protection.outlook.com (10.13.175.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.28 via Frontend Transport; Tue, 11 Apr 2023 19:17:16 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 14:17:15 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 12:17:15 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 14:17:14 -0500
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
X-Inumbo-ID: 7a02f9d4-d89d-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0exrgxOsL3/n+mSGDHDH6/A5pjNuEf1TPtfLeN1YNCdk/0fcuZKfeBQ+kAUCR1oHXMjAPvE4GWoEgdLcUa5IXQSPdX3maD/MO6bq+CXTHU5LaU0IqsbKChtU0AktrZN5df86NdF3mDTlVhNjIcY41LV/rIZwWJLWlSjQRhxQB0isasO/zfTdo4LRCsid8vbMYikhwEtk4/933RhXZmxSNbei+shE8xh3yKyNkG0jhYwCaTFBEFaptQ8zIjLdzCvxToy6C8bW4lxVLJV5YKiItoUp/mGckp+lYgoZKKJT8bDmgYke5UlqVKgdukX8f/G4+27OvNAJDhnOJ7u4Df+Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IPRvr0PydrbevxDRuC5bBe8hAAj8BLWppbzz+G6AD20=;
 b=lrxwKTPqIWTKUtX/8wpDACNNInoA3QgYgqgmcAw+exLo9MtAX5xaaT3gL7prU8bDv23L70gZ55n1nXx+zfkcxjOVA23gHjB3oceDq7HyhmCQgBkKPmA+d/3KKyK1HDmR0RkbE95MoYRQ4EX1rra2gYqQfSuAPzvbKCMRpy3K0TyVlckDUw5BJBbXjQi4LNY/776Fwk1Ht3PhRqhjP2vSys3UfL0iKFekLlyDzUSyClKrvMAa0zXHOuq523iRvuiWLOAByCmBUeaRCIxa8QuahtSZCEshumzaxrAbHWEVRXZbPq9++7ZKY7hYrABhEj4Zk2EjecLRsBHCsbn96lcVCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IPRvr0PydrbevxDRuC5bBe8hAAj8BLWppbzz+G6AD20=;
 b=qH59dc/ukbVX2ZGRfg7805zmZ0sNdHiS/3/rE6u+NrZ0/AfFAQfuPd9pdmWOSQ45slWxwf4a6PXicvYGdbvsLrV0wkn3Tbmrblpj4tSOH/+MOzHoEx4K4IWLyxnY8IS4TQkrGX57VadXkvNt3dnpjGsjO533SpnFoTsgNemL2Pc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Vikram Garhwal <vikram.garhwal@amd.com>, "Julien
 Grall" <julien@xen.org>
Subject: [XEN][PATCH v5 06/17] xen/device-tree: Add device_tree_find_node_by_path() to find nodes in device tree
Date: Tue, 11 Apr 2023 12:16:25 -0700
Message-ID: <20230411191636.26926-25-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230411191636.26926-1-vikram.garhwal@amd.com>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT096:EE_|BY5PR12MB4082:EE_
X-MS-Office365-Filtering-Correlation-Id: b7acaf12-230c-4e31-5eb6-08db3ac15cc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1MfYvPhUa7cLMUQI3UZmTwYyclh+2tL8706Z/bu7eT1dEfy1NAyms7VzyXY5KTCL7NL8JlCu0W1DTsziZzFOz1LkKWWz+hJvfclNY8rCnVN1x7MAjO8H6RhcfhfSJY6EpQLqpjqRpgkRrDTVxp/rhMbvVOWCJc5OzNmCp3dEopgFV44w2pd6ZMUe6EtR5Nu2NU1I7vpxMOs7P1FtgwpQRfP77kZwvanCXLNaI97U71brqvYCDejv6Sn/TJYD+HL4c8A6viwc1bO1W1rNtiJuGrJ8f7wyFIJJISfrqnjUZWXE4OmWJp4fDDk7JD0LTLc5og9uQgXZur+RGQmy9khxVVSklL22dU3GFR8EnsVLVJIb6KU6WogwgkaWgvfQBd2FJLbMRnNgUmL9vzQTwmHUcVU3jmw0cDjqLb7OrMNKOX4zpNpB9gfNQJ4t50f7XMYW+A1imJwbKNMM/lyEOY0Pu8R/ona/GRwnTilEsXuD0PQ8gQxA+Lx3UeLlrPQlix1s5OrdiwcW/AlBCdiDOLDkMPq4jLQOImaGCyrN48Ggk5tpeDYClOPsb1pC2l3ncx/npuVCUnBDsFJL0cTjRJweqVf0zi0Stb2shucwvX2ux25bQrD7r/PTfv3EoIw6ymXFqoTlQGQDqOR+q2Q8G2KUdg0tN6qIbWgz/jeVjII7nW8sl8vgtzC+kGsH8Bv9fw9aE5DTuLubkCAIz7nbgwIyPDGdG1H6YMM0ekmJ29YvqaezDp3wJZke+4Zf1TCiwCxfKW3M2hmkU4kbJk2kIuzQiw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(39860400002)(376002)(451199021)(36840700001)(40470700004)(46966006)(478600001)(1076003)(26005)(316002)(186003)(44832011)(54906003)(2906002)(5660300002)(4326008)(70586007)(70206006)(8676002)(6916009)(6666004)(82310400005)(41300700001)(8936002)(81166007)(356005)(82740400003)(47076005)(40480700001)(83380400001)(86362001)(40460700003)(36756003)(2616005)(426003)(36860700001)(336012)(37363002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 19:17:16.0901
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7acaf12-230c-4e31-5eb6-08db3ac15cc3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT096.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4082

Add device_tree_find_node_by_path() to find a matching node with path for a
dt_device_node.

Reason behind this function:
    Each time overlay nodes are added using .dtbo, a new fdt(memcpy of
    device_tree_flattened) is created and updated with overlay nodes. This
    updated fdt is further unflattened to a dt_host_new. Next, we need to find
    the overlay nodes in dt_host_new, find the overlay node's parent in dt_host
    and add the nodes as child under their parent in the dt_host. Thus we need
    this function to search for node in different unflattened device trees.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 xen/common/device_tree.c      |  5 +++--
 xen/include/xen/device_tree.h | 17 +++++++++++++++--
 2 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index bf847b2584..507b4ac5b6 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -358,11 +358,12 @@ struct dt_device_node *dt_find_node_by_type(struct dt_device_node *from,
     return np;
 }
 
-struct dt_device_node *dt_find_node_by_path(const char *path)
+struct dt_device_node *device_tree_find_node_by_path(struct dt_device_node *dt,
+                                                     const char *path)
 {
     struct dt_device_node *np;
 
-    dt_for_each_device_node(dt_host, np)
+    dt_for_each_device_node(dt, np)
         if ( np->full_name && (dt_node_cmp(np->full_name, path) == 0) )
             break;
 
diff --git a/xen/include/xen/device_tree.h b/xen/include/xen/device_tree.h
index 58ac12abe3..998f972ebc 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -534,13 +534,26 @@ struct dt_device_node *dt_find_node_by_type(struct dt_device_node *from,
 struct dt_device_node *dt_find_node_by_alias(const char *alias);
 
 /**
- * dt_find_node_by_path - Find a node matching a full DT path
+ * device_tree_find_node_by_path - Generic function to find a node matching the
+ * full DT path for any given unflatten device tree
+ * @dt_node: The device tree to search
  * @path: The full path to match
  *
  * Returns a node pointer.
  */
-struct dt_device_node *dt_find_node_by_path(const char *path);
+struct dt_device_node *device_tree_find_node_by_path(struct dt_device_node *dt,
+                                                     const char *path);
 
+/**
+ * dt_find_node_by_path - Find a node matching a full DT path in dt_host
+ * @path: The full path to match
+ *
+ * Returns a node pointer.
+ */
+static inline struct dt_device_node *dt_find_node_by_path(const char *path)
+{
+    return device_tree_find_node_by_path(dt_host, path);
+}
 
 /**
  * dt_find_node_by_gpath - Same as dt_find_node_by_path but retrieve the
-- 
2.17.1


