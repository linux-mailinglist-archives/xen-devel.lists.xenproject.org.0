Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F10793341
	for <lists+xen-devel@lfdr.de>; Wed,  6 Sep 2023 03:17:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595994.929751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdhA0-0008Bs-4q; Wed, 06 Sep 2023 01:16:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595994.929751; Wed, 06 Sep 2023 01:16:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdhA0-00085A-04; Wed, 06 Sep 2023 01:16:48 +0000
Received: by outflank-mailman (input) for mailman id 595994;
 Wed, 06 Sep 2023 01:16:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kbfT=EW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1qdh9x-0006tr-UF
 for xen-devel@lists.xenproject.org; Wed, 06 Sep 2023 01:16:45 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061e.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ab2a3b0-4c53-11ee-8783-cb3800f73035;
 Wed, 06 Sep 2023 03:16:44 +0200 (CEST)
Received: from BL0PR0102CA0019.prod.exchangelabs.com (2603:10b6:207:18::32) by
 PH7PR12MB6977.namprd12.prod.outlook.com (2603:10b6:510:1b7::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6745.34; Wed, 6 Sep 2023 01:16:39 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:207:18:cafe::a4) by BL0PR0102CA0019.outlook.office365.com
 (2603:10b6:207:18::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.30 via Frontend
 Transport; Wed, 6 Sep 2023 01:16:38 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Wed, 6 Sep 2023 01:16:38 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Sep
 2023 20:16:37 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Sep
 2023 20:16:37 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Tue, 5 Sep 2023 20:16:36 -0500
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
X-Inumbo-ID: 0ab2a3b0-4c53-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fldq++7/Oe8Bk8QQTy24bj8wmNJnukw7JGYG3EJ4sDbp94f81UjbKy/CjBYlEpH5dMFj3XIOw2SYl3jRo3wXLYwgJpsq+lkWoF8dImRtyeib3HvB/4Y+v00Mvox6BPOTN63CGh1Pk+n2HsIkVzsBeS6JvZrU1aAGc8DDwO5IthAisQxX4eIDq9KptwCanaLFb0yOw1ZtMNYszxNCryCRBXaDVnYltp9sTrD44OvSKI8DpP+7iQYXP3MaLC36YvvBGIIZN8OJiVDdE5HUN6Pd2BDmsSse29M3lWVNMmSzbaZ2au1wldOeTYL1cl2Ofj/6b3sp2TCtDX7MQvCf7QWqAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N48gpSlC0ul9Dgr5X4IgXaGnFeuJhzDtng9Ayqa//1E=;
 b=hDJg47iSvsg+IRLSvQJ8i13lBe4K2A3uXfBGyCA02CG7psq8WLfeog+mmszNdzamSCz6F5zs0aPhECWFSpeTR2PpGQR5tfj5E0/4tSa2gWS7we8sJnlfJlpT6utWfBWIim3ZM1T2GE1XjbsRrE8VvqJWfUJjT4D9J/34xLRHjIqaAZ73hij7qzyJSyVCs6BYcKr9WRaok6B/XVWgYIf3vTZY2w4XIk9U7a9hfmuxwoeEitOldBRYFV0SRRFgrN7gDK1sGo7V3EcJPMItT/oOqCcPRo1YXPOnzrk6Hfp0k9q4yHcl6jbiGGdjC4wOY+dHiIpmgqsJ5Hpylg9ixpx6TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N48gpSlC0ul9Dgr5X4IgXaGnFeuJhzDtng9Ayqa//1E=;
 b=3Ozu8m7HW/fHwu5SlGsge3V8Uigk+jree6lfqjc3BA/ms4BZnXhDOCBztwuYufko4afLp2O1KrM4ZWkvE8BlRM7UXysnfriD/tl5Ts1L7LWvLbXqpg7tUX0jS3ogHDk0sQ+l1dWUQbwg2nW2aZJhciWC+JVM1VUQ9vvsofNQsdk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <vikram.garhwal@amd.com>, <julien@xen.org>, <michal.orzel@amd.com>,
	<sstabellini@kernel.org>
Subject: [XEN][PATCH v12 04/20] common/device_tree: Export __unflatten_device_tree()
Date: Tue, 5 Sep 2023 18:16:14 -0700
Message-ID: <20230906011631.30310-5-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230906011631.30310-1-vikram.garhwal@amd.com>
References: <20230906011631.30310-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|PH7PR12MB6977:EE_
X-MS-Office365-Filtering-Correlation-Id: 174c8e84-ed8e-4e23-eb6f-08dbae76eb74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/UM5K77t4AdsTCHzHs9b8dGRd0PqzZSZbYvjhNbDtWkCsuejBD3/3xKycSgHZAarTTv+pKla1Kak/6PVpDbf2ayv6MSqrVvDbhAfytf+uU0rQ+MQ9Z2O8NSWqtb6JxpfA3SQHzjyvrarKuAwlrdcjuthb5eui9aBjN0kjYKgU/jhJnOrmKuk5Rlh4+vKljaPEv/a9KXpXAryqYdc5qvdJyJBIGAL0D5YH4ui6EbCoV4fuiUX6bpvabr2SzR5ZWmVCICprhR2TgE7tjuT428WA5JBTEODck/cSml7TlEIxITke/M+koxLGzYSwoGzfaWhSWLzZfc7qG+HhJO66q/PL6gF4QO5dqIp6oXTxoYOi4nNCOSpmwpX5R+AdfRG0tIt6hSPpXbX6CNjvtmbkQnpQ9gJwEkMm62E74Vfal5gq/BgHckB8WT4MxnQE4yyFAF5MAeNxOAt+/9R9yj/bUCBwZJdY8jv11eblfvN1bVdKL41zZcN9XDAttGeYyGyVXTHRU6d0tSQ4Ksnifz0Ow7dl2r18vwkwuiTg493m8fxjwbytK6ZMl0/0ZvjZyDxsMNWN0E0JbUhVJLYvfna8dmENTwfulp+OuiJpPwtn8mjXKl+ldVwz2cE/H7d602jVBqrZW9QJpbxUBisdgwkIl0n0GsSGnESXGYjs7be6jzXRYhO8hvjV9MIZaMilcGVXJT7iZFJAnSsUYsu0uPvC3hCSOBbgWH7cyHufEItjZJF46CpK1mVYKowhwpQV90DXys3DfX1UaMKP+u4iBJV4eEBFw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(39860400002)(396003)(346002)(451199024)(1800799009)(186009)(82310400011)(46966006)(40470700004)(36840700001)(5660300002)(41300700001)(40480700001)(8676002)(8936002)(316002)(6916009)(54906003)(44832011)(70206006)(70586007)(4326008)(2906002)(40460700003)(356005)(81166007)(83380400001)(47076005)(82740400003)(26005)(2616005)(336012)(426003)(1076003)(86362001)(36756003)(36860700001)(478600001)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2023 01:16:38.2270
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 174c8e84-ed8e-4e23-eb6f-08dbae76eb74
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6977

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


