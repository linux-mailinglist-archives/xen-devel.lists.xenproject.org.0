Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF5A6F4D9E
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 01:37:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528855.822528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzYo-0005W5-4P; Tue, 02 May 2023 23:37:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528855.822528; Tue, 02 May 2023 23:37:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptzYo-0005Ta-0Z; Tue, 02 May 2023 23:37:30 +0000
Received: by outflank-mailman (input) for mailman id 528855;
 Tue, 02 May 2023 23:37:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/cxx=AX=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1ptzYm-0005Si-Oc
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 23:37:28 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20623.outbound.protection.outlook.com
 [2a01:111:f400:7e88::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4ba8dd56-e942-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 01:37:26 +0200 (CEST)
Received: from BN9PR03CA0740.namprd03.prod.outlook.com (2603:10b6:408:110::25)
 by MN0PR12MB6128.namprd12.prod.outlook.com (2603:10b6:208:3c4::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.30; Tue, 2 May
 2023 23:37:22 +0000
Received: from BN8NAM11FT063.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:110:cafe::cb) by BN9PR03CA0740.outlook.office365.com
 (2603:10b6:408:110::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31 via Frontend
 Transport; Tue, 2 May 2023 23:37:22 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT063.mail.protection.outlook.com (10.13.177.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6363.22 via Frontend Transport; Tue, 2 May 2023 23:37:22 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 2 May
 2023 18:37:22 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 2 May
 2023 18:37:21 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 2 May 2023 18:37:21 -0500
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
X-Inumbo-ID: 4ba8dd56-e942-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QTtkvu0gTNoHijYkh0caIcnZNMVLdlec5IVV1/GIiTyjW8HTmKScMudSqSiA3htV1cZ8vvhz5Bp/iZxudHo6+QUlCAtUcKThf+SRQ50LgjN9tHlngZkudxvpRTONEh2X3jrIQ7j0XDW1jl44qpHXArcZOmLeQibWvf31pSHUv/3Jiov4FyS8ANGHpCEQ16Ebhp3dmYOCLLU3oSD/5GM2sHD9RM0YdolPfIPFvsv5spS352CyEZZBn0DTy/bewuV3hojwbfrFIuT31bYRiCcbai+i86Qs9LrNF5edALt1qcC4S5osQ/yQ3mYm9BwHeuQzP/8yg1iio7VIktsgVQ8pxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qGBrlYz1MYPx3dVlqExLGnD1JoxqWVU0WGIisylldqw=;
 b=JGM+vcyC9zcVJ2lePJixNlxjB8OaBGl9kNpIMLOyiWdAyyaFllsWoph8OQu0PUe+WBjm7p5F9YKGVaP3cUkvauBksR2KigrhusO5wEBshJnBuHjtluCBEoW9hm8cgySyGsYiL3VoemRRJ6hSBwbGPxdwMQGh3ZbLsYlXYbIvQ80PiYAL9Ew0KohhuJm5SrL5K3d95bUblb9tydvbEWK3QYC/4R5oG2xOM4CmS58xTI0Rij8YK+/F2Q5JQeZ/kNHRDSOoG/LFQOfloIeFMAjvGBUnSSh8I7BAz7TRS6jIkI1Xv0WuvvQn+tSVfnwWCxj0CN6qgNbSQZpgzWP9jkqn0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGBrlYz1MYPx3dVlqExLGnD1JoxqWVU0WGIisylldqw=;
 b=b0/gi+WxhUSiSWWIvLFFkAUwRqFGs3UEBrAFs07LH6hZ84oI6vK6hqW6holvwjIV3jQiHwobuv5R+dQHHoiqCYsvctQ+e/lOYTIdtXWan8YNF8dBsqGE6UYT4oybDw0v6AyDLHnktDOldilktGJ/5AV4TN9e95H/qWVqiFBbALo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <vikram.garhwal@amd.com>,
	<michal.orzel@amd.com>, Julien Grall <julien@xen.org>
Subject: [XEN][PATCH v6 03/19] common/device_tree: change __unflatten_device_tree() type
Date: Tue, 2 May 2023 16:36:34 -0700
Message-ID: <20230502233650.20121-4-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230502233650.20121-1-vikram.garhwal@amd.com>
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT063:EE_|MN0PR12MB6128:EE_
X-MS-Office365-Filtering-Correlation-Id: 29ae46b7-ee61-4327-35bc-08db4b662d8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TXciANatIM6/IA9AvojUj9UdWhHKXAjDMGdyeU7y3PB48zQRGYNcagqGIB4G/9pZwjBlr3rKRIB1gvc91DXmfFM/EKpywHX2cc4ldJKyO0WqRdKA1NeVp3RGih4E0Z4auQW29j56ew7JUrTl9LUcmJ+nYoM+V9ULgs6Inyh+Etrm8LLl6Qf/odhshXhPaXXq/L7rZmYz63BSG4HpzeV6clkINLNS3yKBzM/ueQ7YmFvDpLcCMWskCYFXxui12nhmw0urmd4HC3mPMDiWIcigy4idQRczIg9IOq4adYscUamiqrKLVbLEqWkL0UqK3+DKOn56XuSXtrLXuOircKZyjI9Je3gFadHOORoJE/4Jc74qMiK4x+1RoUoHeMV90AKRmbm6yis3hnW8/3zekqawupqsB1wG4KoFW6TQErDNFg82moRqoNZP/NR0hu8QJg6bVDHke/zXNNb6FIYWb3HWAGXlgk1UtOAfs2LgQm7y38qrHh29DZpdwrOKjqhIwfNHStb2q/7ycAHlUnm/4FLUK3sHTvzm5H4Jln/fNq9Pfcad/fF1C6sLNZr759GFEmm17lTzVU4dgHKAizHd8zr0ceqavN6CnDuITP5a+KQUpq6tZqDfhjaoymXCru5MnOyahS7RJaaJBvbrNjt1uFqM8BEuxbHqRrg+f2ZpBZYJCLkmtQwinAqxUpU1ZOH9ZvZ+g22HYi9fqk9I77DriJ/oHFnSw/MgvXuDfu6zLSCAncw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(376002)(39860400002)(346002)(451199021)(40470700004)(46966006)(36840700001)(41300700001)(8936002)(44832011)(8676002)(5660300002)(86362001)(36860700001)(47076005)(83380400001)(81166007)(82740400003)(356005)(2616005)(426003)(316002)(26005)(40480700001)(478600001)(36756003)(336012)(54906003)(70586007)(4326008)(6666004)(6916009)(70206006)(40460700003)(2906002)(1076003)(186003)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2023 23:37:22.5368
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29ae46b7-ee61-4327-35bc-08db4b662d8a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT063.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6128

Following changes are done to __unflatten_device_tree():
    1. __unflatten_device_tree() is renamed to unflatten_device_tree().
    2. Remove __init and static function type.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 xen/common/device_tree.c      | 9 ++++-----
 xen/include/xen/device_tree.h | 5 +++++
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index fc38a0b3dd..5daf5197bd 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -2047,7 +2047,7 @@ static unsigned long unflatten_dt_node(const void *fdt,
 }
 
 /**
- * __unflatten_device_tree - create tree of device_nodes from flat blob
+ * unflatten_device_tree - create tree of device_nodes from flat blob
  *
  * unflattens a device-tree, creating the
  * tree of struct device_node. It also fills the "name" and "type"
@@ -2056,8 +2056,7 @@ static unsigned long unflatten_dt_node(const void *fdt,
  * @fdt: The fdt to expand
  * @mynodes: The device_node tree created by the call
  */
-static int __init __unflatten_device_tree(const void *fdt,
-                                          struct dt_device_node **mynodes)
+int unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes)
 {
     unsigned long start, mem, size;
     struct dt_device_node **allnextp = mynodes;
@@ -2183,9 +2182,9 @@ dt_find_interrupt_controller(const struct dt_device_match *matches)
 
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
index 19a74909ce..eef0335b79 100644
--- a/xen/include/xen/device_tree.h
+++ b/xen/include/xen/device_tree.h
@@ -178,6 +178,11 @@ int device_tree_for_each_node(const void *fdt, int node,
  */
 void dt_unflatten_host_device_tree(void);
 
+/**
+ * unflatten any device tree.
+ */
+int unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes);
+
 /**
  * IRQ translation callback
  * TODO: For the moment we assume that we only have ONE
-- 
2.17.1


