Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4174E3E8EB2
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:31:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165724.302926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlWC-0007AE-N2; Wed, 11 Aug 2021 10:31:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165724.302926; Wed, 11 Aug 2021 10:31:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlWC-0006tL-0C; Wed, 11 Aug 2021 10:31:28 +0000
Received: by outflank-mailman (input) for mailman id 165724;
 Wed, 11 Aug 2021 10:31:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9qiF=NC=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDlSU-0000BQ-G8
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:27:38 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.54]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b0d107f6-ed81-4e24-8ce5-e2f934523559;
 Wed, 11 Aug 2021 10:25:58 +0000 (UTC)
Received: from AM5PR0701CA0022.eurprd07.prod.outlook.com
 (2603:10a6:203:51::32) by DBBPR08MB4314.eurprd08.prod.outlook.com
 (2603:10a6:10:ce::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Wed, 11 Aug
 2021 10:25:56 +0000
Received: from AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::9c) by AM5PR0701CA0022.outlook.office365.com
 (2603:10a6:203:51::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.4 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT016.mail.protection.outlook.com (10.152.16.142) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.14 via Frontend Transport; Wed, 11 Aug 2021 10:25:56 +0000
Received: ("Tessian outbound ab45ca2b67bc:v101");
 Wed, 11 Aug 2021 10:25:56 +0000
Received: from 8eeff61bb6e1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 76596E82-7C72-4D3F-B57F-77F15178233B.1; 
 Wed, 11 Aug 2021 10:25:34 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8eeff61bb6e1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Aug 2021 10:25:34 +0000
Received: from DB7PR05CA0045.eurprd05.prod.outlook.com (2603:10a6:10:2e::22)
 by AM5PR0802MB2451.eurprd08.prod.outlook.com (2603:10a6:203:9d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Wed, 11 Aug
 2021 10:25:33 +0000
Received: from DB5EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::ad) by DB7PR05CA0045.outlook.office365.com
 (2603:10a6:10:2e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:33 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT024.mail.protection.outlook.com (10.152.20.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:25:33 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:25:28 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 11
 Aug 2021 10:25:28 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:25 +0000
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
X-Inumbo-ID: b0d107f6-ed81-4e24-8ce5-e2f934523559
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iOH05sifhuQzcpRT3Qs8FnL8mDtMKXH8DTapkC3LA0o=;
 b=h7k8kV4sHOqLuCE1j1SJpw/E7leLYZjBAzxBKy5J4YFNrmUFqSrQXa3If964hrSFsCRJ4dffGcNJx1BjSilMjlFd0nZJhaVKLRMdSXt1vdskRtJtl3QLIrMAy/76Fx/Qytppj2/0b4YmvyrDSfINFNc5mIYQKIw43ejwWqRakZM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0cfbb24433a938be
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SKVsYL2yubwMsE98Gky6IJU/Xe1n6vL2iDeKxH+o5lrEOTnE7ipCXHkinNNw2tjVXoLuDF0f4mn3rvYQcdrzLclG6SadHbnszdX81v6z3ccHtb0POB35csYhNokV2A88G+APeDlaef0WsjraYgIDB60Csf8IZ+Jezbb6f9It0ZsfJUGAV6UQIYIOopgz7aiaQNS8fpm8XMUNEeu3GRiS2r990Lx2ribm75Piu2z0FBvdrMUH/8d2LAA/4veYcGxGmdqvcDJCBkozDlEHNN7z2XVHVcsvnjUon0VGCIklfNPO5xVf88z40NT7ql/AZL6HRLeu17WZCly6AdOoFQDFBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iOH05sifhuQzcpRT3Qs8FnL8mDtMKXH8DTapkC3LA0o=;
 b=IrfvEmmHoM3h66+KSk7hZERgqwhdx6avDL4WpQHouyzhb6oQGi4Sbc/9zmk33lixvd8T4EcYRGM/XssuwUtbpuHLQFLjiDMofb/sH/TI0wogR6kXsOpCo6VK3mptNXAnTrDj/F3HoRW+CPTybqZwzYPgrDV8IBo97okX2IeW+rEKkBavHAHbn/P21VJn4cc6HFcXBpntMFDd+/VLsbhj//Iwo3XxjZUZtQJDr2ZhK5PY9Pnp/31drCvw8kwkSugYpmXdLbM31YggJLoPztXdj2bGNyPZBODwJjh+AdODPOfBlU+rTtQnw8SOklr1qd0h0J8nlY3LpvzFfyJlj7u12Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iOH05sifhuQzcpRT3Qs8FnL8mDtMKXH8DTapkC3LA0o=;
 b=h7k8kV4sHOqLuCE1j1SJpw/E7leLYZjBAzxBKy5J4YFNrmUFqSrQXa3If964hrSFsCRJ4dffGcNJx1BjSilMjlFd0nZJhaVKLRMdSXt1vdskRtJtl3QLIrMAy/76Fx/Qytppj2/0b4YmvyrDSfINFNc5mIYQKIw43ejwWqRakZM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <wei.chen@arm.com>, <xen-devel@lists.xenproject.org>,
	<sstabellini@kernel.org>, <julien@xen.org>, <jbeulich@suse.com>
CC: <Bertrand.Marquis@arm.com>
Subject: [XEN RFC PATCH 23/40] xen/arm: introduce a helper to parse device tree memory node
Date: Wed, 11 Aug 2021 18:24:06 +0800
Message-ID: <20210811102423.28908-24-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6239f186-01bd-4779-7866-08d95cb267b9
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2451:|DBBPR08MB4314:
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB4314D891A266DEB9C32C6EE39EF89@DBBPR08MB4314.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 3ojiCzWck34GgIl326ga518rTAcUOG2C1VbmrEoevtZSfmmzt4MqDvnbVcw4OWMybOIATiPcqcTQlr0o5mNsyv7iGTwt/RXmYrcf1zK9ca7k7Y36gOjn4mL8bsAglRiRgetxpWGGCxnReuFAGG9NfkHyYlABdPRNJ1OFZgphqv4ahXR2kRtq+12nYdFc1WPtyY/v3gMPHzgo1P3gni5nOc0WzTEDSWMY2NGGBzUqNMBvpAXYNXqc4ohKRyLP0A5Kt8UIwmf2z0RJqVeB6yz2xNJLIx48qnAi1+EHTbSQRyeLXAwOVJuVgmIbDuCqxGOBZGCL5BPVpxqtJhUm/tlYNP8myWCweSGBlXBBGFZXt8+bV9th+Tpp7jgMOwnleBrzgqjES56hKpjfVNuCxnzrPXAmoR+FnnyoVKJFsLRZr1+V15L1X6/69gmOtpZqc4z56V0FNaK0nfwPsQOwSt2+59x95R2OmfyEo0Lkg4KXhwgaxi+enU7t00mLh1WiLcps5TIn4kVuWT/jALdBJ6YzfI7S1wd0LeOy4+OT1d6VzUnet4DlTe9r0a5HEofzwat/Nky97X445M0+Plp1fudh9dogRnKyfZmh+UieuWKuK4w3Rh6v4UNNXvW3DCjHNoAt39Rp/geh+RETPHYLPyRSW/mUM2La2C7A8NAjOw4WvZSaKVrjvebX1D0Zx06WMovS7WElb0hAPO/cLriU7mD/hhKQZ2Uf/v98MuesFpAAZLrrRnpha41aCn9t7ucTafy3qZ3mVSPuuFHW3lD013Lg0e5G0uVTJcRka2NI2amUSSA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(186003)(70206006)(83380400001)(2906002)(8676002)(81166007)(336012)(70586007)(4326008)(8936002)(47076005)(36756003)(508600001)(356005)(7696005)(82310400003)(26005)(36860700001)(2616005)(1076003)(5660300002)(316002)(34070700002)(110136005)(86362001)(6666004)(44832011)(426003)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2451
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b39eca59-d21f-4aca-5433-08d95cb259db
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QL92bXEy9IPsxUrun4i5hHHk09CkZKH0pJYm2vn9owbHanq8BRP8M9dWAwNZBKXvz5LdxZo5rsVfo+pVv17DSoBkdR4GvrekgwtZc31CS6l8BxA/BbEQQOxss+HKcM5FujcNiqPCK3yWIhchYuuGxTLSIYE/lJTLFX7tTLsJg3a773iesjp219hFNtekMUBKvSkeHOL4sKIXUs0dobYDeGAG8Qjnyjd81PcLahQLxvta49ev/FXKWffbxejk+OOBVnK+PN0s28SUl9ecpQofntyvs98sNyHWR8QFH444VJY/Gt/UCfkZm00ziovWWrag9RAkbGm5xZblM/HAk2C79NgX11NmHVmvHUiigxTR+AoiK1adpV0mAO3z/HepyeCNJg2+YMKlkVnt+6t6Ro6sGRhFu0qqUKrkHw0X25dU5JwJh7K+Pg6++a+5/ar0aaqQV3+OyYWNtGoWVEtyIAwGhIJv0JDqevXYnzfqtP6N46HWF/LhY66TZg3xjg0wvHAtDKOFyAfptp5GYyB1+Gh2kROGrHgl70S1wJOACTwF9DHpFRDC3LV9+vcherSXqMRodKZEKuziakiRcwh8671yYzMO7kFmcC+tXEaAKd8Kb4zs1+tQoDOGF30loElEhO/i9Ii1v5fHb1GJrOkrLjulfUpMdPPBV3XmoK8D/r0FdOKK44nS9qnt/A12K/PFNDFYlfz6nnBM5KKBIDgzIsb65BfxSC/RAibnAxHv0RBjMNA=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(396003)(346002)(136003)(36840700001)(46966006)(82310400003)(426003)(26005)(83380400001)(70586007)(4326008)(336012)(1076003)(478600001)(7696005)(2616005)(47076005)(5660300002)(70206006)(86362001)(8936002)(36860700001)(2906002)(8676002)(316002)(44832011)(6666004)(110136005)(82740400003)(186003)(81166007)(36756003)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:25:56.3158
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6239f186-01bd-4779-7866-08d95cb267b9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4314

Memory blocks' NUMA ID information is stored in device tree's
memory nodes as "numa-node-id". We need a new helper to parse
and verify this ID from memory nodes.

In order to support memory affinity in later use, the valid
memory ranges and NUMA ID will be saved to tables.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/numa_device_tree.c | 130 ++++++++++++++++++++++++++++++++
 1 file changed, 130 insertions(+)

diff --git a/xen/arch/arm/numa_device_tree.c b/xen/arch/arm/numa_device_tree.c
index 37cc56acf3..bbe081dcd1 100644
--- a/xen/arch/arm/numa_device_tree.c
+++ b/xen/arch/arm/numa_device_tree.c
@@ -20,11 +20,13 @@
 #include <xen/init.h>
 #include <xen/nodemask.h>
 #include <xen/numa.h>
+#include <xen/libfdt/libfdt.h>
 #include <xen/device_tree.h>
 #include <asm/setup.h>
 
 s8 device_tree_numa = 0;
 static nodemask_t processor_nodes_parsed __initdata;
+static nodemask_t memory_nodes_parsed __initdata;
 
 static int srat_disabled(void)
 {
@@ -55,6 +57,79 @@ static int __init dtb_numa_processor_affinity_init(nodeid_t node)
     return 0;
 }
 
+/* Callback for parsing of the memory regions affinity */
+static int __init dtb_numa_memory_affinity_init(nodeid_t node,
+                                paddr_t start, paddr_t size)
+{
+    struct node *nd;
+    paddr_t end;
+    int i;
+
+    if ( srat_disabled() )
+        return -EINVAL;
+
+    end = start + size;
+    if ( num_node_memblks >= NR_NODE_MEMBLKS )
+    {
+        dprintk(XENLOG_WARNING,
+                "Too many numa entry, try bigger NR_NODE_MEMBLKS \n");
+        bad_srat();
+        return -EINVAL;
+    }
+
+    /* It is fine to add this area to the nodes data it will be used later */
+    i = conflicting_memblks(start, end);
+    /* No conflicting memory block, we can save it for later usage */;
+    if ( i < 0 )
+        goto save_memblk;
+
+    if ( memblk_nodeid[i] == node ) {
+        /*
+         * Overlaps with other memblk in the same node, warning here.
+         * This memblk will be merged with conflicted memblk later.
+         */
+        printk(XENLOG_WARNING
+               "DT: NUMA NODE %u (%"PRIx64
+               "-%"PRIx64") overlaps with itself (%"PRIx64"-%"PRIx64")\n",
+               node, start, end,
+               node_memblk_range[i].start, node_memblk_range[i].end);
+    } else {
+        /*
+         * Conflict with memblk in other node, this is an error.
+         * The NUMA information is invalid, NUMA will be turn off.
+         */
+        printk(XENLOG_ERR
+               "DT: NUMA NODE %u (%"PRIx64"-%"
+               PRIx64") overlaps with NODE %u (%"PRIx64"-%"PRIx64")\n",
+               node, start, end, memblk_nodeid[i],
+               node_memblk_range[i].start, node_memblk_range[i].end);
+        bad_srat();
+        return -EINVAL;
+    }
+
+save_memblk:
+    nd = &nodes[node];
+    if ( !node_test_and_set(node, memory_nodes_parsed) ) {
+        nd->start = start;
+        nd->end = end;
+    } else {
+        if ( start < nd->start )
+            nd->start = start;
+        if ( nd->end < end )
+            nd->end = end;
+    }
+
+    printk(XENLOG_INFO "DT: NUMA node %u %"PRIx64"-%"PRIx64"\n",
+           node, start, end);
+
+    node_memblk_range[num_node_memblks].start = start;
+    node_memblk_range[num_node_memblks].end = end;
+    memblk_nodeid[num_node_memblks] = node;
+    num_node_memblks++;
+
+    return 0;
+}
+
 /* Parse CPU NUMA node info */
 int __init device_tree_parse_numa_cpu_node(const void *fdt, int node)
 {
@@ -70,3 +145,58 @@ int __init device_tree_parse_numa_cpu_node(const void *fdt, int node)
 
     return dtb_numa_processor_affinity_init(nid);
 }
+
+/* Parse memory node NUMA info */
+int __init
+device_tree_parse_numa_memory_node(const void *fdt, int node,
+    const char *name, uint32_t addr_cells, uint32_t size_cells)
+{
+    uint32_t nid;
+    int ret = 0, len;
+    paddr_t addr, size;
+    const struct fdt_property *prop;
+    uint32_t idx, ranges;
+    const __be32 *addresses;
+
+    nid = device_tree_get_u32(fdt, node, "numa-node-id", MAX_NUMNODES);
+    if ( nid >= MAX_NUMNODES )
+    {
+        printk(XENLOG_WARNING "Node id %u exceeds maximum value\n", nid);
+        return -EINVAL;
+    }
+
+    prop = fdt_get_property(fdt, node, "reg", &len);
+    if ( !prop )
+    {
+        printk(XENLOG_WARNING
+               "fdt: node `%s': missing `reg' property\n", name);
+        return -EINVAL;
+    }
+
+    addresses = (const __be32 *)prop->data;
+    ranges = len / (sizeof(__be32)* (addr_cells + size_cells));
+    for ( idx = 0; idx < ranges; idx++ )
+    {
+        device_tree_get_reg(&addresses, addr_cells, size_cells, &addr, &size);
+        /* Skip zero size ranges */
+        if ( !size )
+            continue;
+
+        ret = dtb_numa_memory_affinity_init(nid, addr, size);
+        if ( ret ) {
+            printk(XENLOG_WARNING
+                   "NUMA: process range#%d addr = %lx size=%lx failed!\n",
+                   idx, addr, size);
+            return -EINVAL;
+        }
+    }
+
+    if ( idx == 0 )
+    {
+        printk(XENLOG_ERR
+               "bad property in memory node, idx=%d ret=%d\n", idx, ret);
+        return -EINVAL;
+    }
+
+    return 0;
+}
-- 
2.25.1


