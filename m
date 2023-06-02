Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 347F371F746
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 02:49:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542788.847076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4syN-00012C-5r; Fri, 02 Jun 2023 00:48:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542788.847076; Fri, 02 Jun 2023 00:48:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4syN-0000zc-0q; Fri, 02 Jun 2023 00:48:55 +0000
Received: by outflank-mailman (input) for mailman id 542788;
 Fri, 02 Jun 2023 00:48:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CQ40=BW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1q4syM-0000if-1a
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 00:48:54 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20628.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ee731f0-00df-11ee-b231-6b7b168915f2;
 Fri, 02 Jun 2023 02:48:53 +0200 (CEST)
Received: from DS7PR03CA0085.namprd03.prod.outlook.com (2603:10b6:5:3bb::30)
 by PH8PR12MB6889.namprd12.prod.outlook.com (2603:10b6:510:1c9::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Fri, 2 Jun
 2023 00:48:49 +0000
Received: from DM6NAM11FT061.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3bb:cafe::82) by DS7PR03CA0085.outlook.office365.com
 (2603:10b6:5:3bb::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23 via Frontend
 Transport; Fri, 2 Jun 2023 00:48:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT061.mail.protection.outlook.com (10.13.173.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6455.24 via Frontend Transport; Fri, 2 Jun 2023 00:48:48 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 19:48:48 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 1 Jun
 2023 17:48:47 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 1 Jun 2023 19:48:47 -0500
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
X-Inumbo-ID: 3ee731f0-00df-11ee-b231-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kDp8mpEodeIBrQv5uBUhgQQwxa/WVdkpPbP8B1ILsrMpnzTN56rC1O3W5wJOt+zKji2JgUce1Io0Jl2aL/mGusxvfTdHBT9+fclvMIp/1ml1WwDiB8njpYXtC3RLdXHlk8qnSnpQM0PxDvVSmuoFgv+llilZZOXyAtLynbNcG3lq2mpddIdxfsWY2rIiAT6IXjkSel6EyJ8T8lIVLvMfE5aOiS25i1Ik6NiOurFUw74jEnY01bbdgtt4Coy+rdpW9rU3DVJTzJtAjy2YWCDmTbo+Dwt0zedoHR9JkznDuX3JPcbHTWyG/2kE9LNCQfyYE51Rd5hnvpAWbmA49y1wYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+0OsyLFwBeugffTn17WHc7QEkMtS0NECm0n9tJPKNc=;
 b=YVO01YQOamasTgM5JrGSkpf5v6s6Re8T0F09UxQKN6WE+IpuDZyAgD9Ju6RsU1F8T+DHjjros9PYDySFJPiquiz1e8G+kRcwGrwKNE+OvvJL2WSttqSY6yCqIFGAKV6As6nSuFcTvwf1bo06KjRhWjYKW+2wvh6J2pkErtb2U1KAkL4kUh6IdpTuydGPDhMmR7/aKUYqLi/cwAMYpARCCbAvPrGqIOIVJR9idACUAL379dwkcOXgQ+Lh0Amubt0AtSz/kqIfj8oFnj5pLVb/3ybF4NS0M2ltJwFJjPzfYbQsyAPzpgAQbUyX/LMd0pXjxh8jxqAsWGdm/krJNXPwOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+0OsyLFwBeugffTn17WHc7QEkMtS0NECm0n9tJPKNc=;
 b=bSqu9jRShA3zWj6FbDpSgQ3NPP0Tcpw/x+kQhL/xFseZlZc+3tleitDn4hhe9NvQs32IKQM9FT3So5a5DGq8pVDDYSfl3y62t0S5VbSxQNFGxKR7Kl8JwY2Kcfem8YYjMJQhr/CD1w47ZgyLxnOn1MStIF/PKKX3lgkhZ1pBuYw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <michal.orzel@amd.com>, <sstabellini@kernel.org>,
	<vikram.garhwal@amd.com>, <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Subject: [XEN][PATCH v7 04/19] common/device_tree: change __unflatten_device_tree() type
Date: Thu, 1 Jun 2023 17:48:09 -0700
Message-ID: <20230602004824.20731-5-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230602004824.20731-1-vikram.garhwal@amd.com>
References: <20230602004824.20731-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT061:EE_|PH8PR12MB6889:EE_
X-MS-Office365-Filtering-Correlation-Id: b56a2613-955e-4a5f-50b5-08db63032091
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9xnPtvt7yJGOkewHJbN0eNRxrBjfq0XMuUvtmLtpixNcLupZRE4LYdidNbWhylYmuNAsfJf6asnb56picysXjYsCHkK/k9bmrIWwGJsto0dXiIUZ0gNV7Loe94qRZ2k99dqhYhOXDt01HIQMHUXOl8CcTawB58mB34f3w9122DWKrf2RbHMlkOmNH8xsSTpF4I3uflVP/pT27Gwqf8Ak7tGfWopw5AmKJSCvF8O5jbiWuRnwwzDRp1hOTeqMjSn6t0BdODvUoFIB2WXKVRRxyCA1kzgqa5/vJgdcMK3/t1omiAXwHANnOSef2MQVLmJ9CVJxfs4GkzbeG2T1B89f53P+ppffR3hpDwgdbLQ3BVQBtXjW/YClMZiMzscsy1VlG9h2xvpTKxDFBBKI15O2dg7KRtozHEE5pB2jGX6boNXj8T0XkPZ5Bpz+eAWD9nJJglS7rguDWqvw8ptpUhlLp4KpPuCkeoIQ823pxThMnwMcYwjKzaq5UH9Xl+jJmsvwLwx0I5o0P0mtg24xNoh1L6K9xwL+GVfldTIxwFBoUGBA9opps4dsZktVXiY3bW8KGqyifKiESew2zcKM05173oLllT9wRJAW/GzEbPYcPGGWUl7IFhCbYqeVqHaCvZk711/6LbGc1XQu//DJz1/bOtwr3YiD0Ixa05C90S2TrF/Knwpw1yR1cZWQdVLyH7VOjSdByWVfBYc9ksE7U6aYVU35iCCkFfyt815RxpfK58da9O2FvaRWKNe5vJ4OvCC2Y74KvHntCMj4Lg+kh6YIdw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(136003)(376002)(346002)(451199021)(40470700004)(46966006)(36840700001)(356005)(40460700003)(2616005)(6916009)(4326008)(70586007)(70206006)(81166007)(26005)(1076003)(54906003)(186003)(82740400003)(40480700001)(2906002)(41300700001)(5660300002)(478600001)(82310400005)(44832011)(36860700001)(47076005)(6666004)(36756003)(83380400001)(8676002)(316002)(8936002)(86362001)(426003)(336012)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 00:48:48.4721
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b56a2613-955e-4a5f-50b5-08db63032091
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT061.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6889

Following changes are done to __unflatten_device_tree():
    1. __unflatten_device_tree() is renamed to unflatten_device_tree().
    2. Remove __init and static function type.

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
Reviewed-by: Henry Wang <Henry.Wang@arm.com>
---
 xen/common/device_tree.c      | 9 ++++-----
 xen/include/xen/device_tree.h | 5 +++++
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
index bbdab07596..16b4b4e946 100644
--- a/xen/common/device_tree.c
+++ b/xen/common/device_tree.c
@@ -2083,7 +2083,7 @@ static unsigned long unflatten_dt_node(const void *fdt,
 }
 
 /**
- * __unflatten_device_tree - create tree of device_nodes from flat blob
+ * unflatten_device_tree - create tree of device_nodes from flat blob
  *
  * unflattens a device-tree, creating the
  * tree of struct device_node. It also fills the "name" and "type"
@@ -2092,8 +2092,7 @@ static unsigned long unflatten_dt_node(const void *fdt,
  * @fdt: The fdt to expand
  * @mynodes: The device_node tree created by the call
  */
-static int __init __unflatten_device_tree(const void *fdt,
-                                          struct dt_device_node **mynodes)
+int unflatten_device_tree(const void *fdt, struct dt_device_node **mynodes)
 {
     unsigned long start, mem, size;
     struct dt_device_node **allnextp = mynodes;
@@ -2230,10 +2229,10 @@ dt_find_interrupt_controller(const struct dt_device_match *matches)
 
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
index c2eada7489..2c35c0d391 100644
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


