Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8643E8EA9
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:31:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165699.302825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlVr-0002ng-NA; Wed, 11 Aug 2021 10:31:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165699.302825; Wed, 11 Aug 2021 10:31:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlVr-0002af-EF; Wed, 11 Aug 2021 10:31:07 +0000
Received: by outflank-mailman (input) for mailman id 165699;
 Wed, 11 Aug 2021 10:31:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9qiF=NC=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDlRo-0002Qj-HN
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:26:56 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.62]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8e08efd0-fa8e-11eb-a052-12813bfff9fa;
 Wed, 11 Aug 2021 10:26:14 +0000 (UTC)
Received: from AM6PR10CA0007.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::20)
 by HE1PR08MB2841.eurprd08.prod.outlook.com (2603:10a6:7:35::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Wed, 11 Aug
 2021 10:26:11 +0000
Received: from AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:89:cafe::14) by AM6PR10CA0007.outlook.office365.com
 (2603:10a6:209:89::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15 via Frontend
 Transport; Wed, 11 Aug 2021 10:26:11 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT062.mail.protection.outlook.com (10.152.17.120) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.16 via Frontend Transport; Wed, 11 Aug 2021 10:26:10 +0000
Received: ("Tessian outbound 79bfeeb089c1:v101");
 Wed, 11 Aug 2021 10:26:10 +0000
Received: from 82a657d6e15e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9E282BA0-67A4-406D-86BF-90752968C6BB.1; 
 Wed, 11 Aug 2021 10:26:04 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 82a657d6e15e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Aug 2021 10:26:04 +0000
Received: from DB6PR0201CA0024.eurprd02.prod.outlook.com (2603:10a6:4:3f::34)
 by DB7PR08MB3017.eurprd08.prod.outlook.com (2603:10a6:5:1f::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13; Wed, 11 Aug
 2021 10:26:02 +0000
Received: from DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3f:cafe::13) by DB6PR0201CA0024.outlook.office365.com
 (2603:10a6:4:3f::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13 via Frontend
 Transport; Wed, 11 Aug 2021 10:26:02 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT036.mail.protection.outlook.com (10.152.20.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:26:01 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:25:54 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:52 +0000
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
X-Inumbo-ID: 8e08efd0-fa8e-11eb-a052-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/ECE2NT3/W7SlQs3jvLDkVaHn4CW/xBcD06c9TPz4k=;
 b=UKPu+5QRDqqqeNBt76a0Fb94OLpU2gpgQiXW0INoRHhQBeWX5pSYHlSdPKmJgLTw4Vj/p6E/s/5J2cPOOaJRlN19VInwm+bMrEHz0oiGDuIt14Sl4z7kzotBYQ1r+2w/f17VzrLInwMwuCLDNHT3iZyX3EL71VFJ4gnV7OZwAlE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4126685f348a2717
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T7EO4JwNCvMHm3Zu6GYgi/r02kzZf7NpIIzwaVzZNmxepTVDDngCdWNStgxLKq3INWGALdZmg5LKTsIgJzoXUtYYOO/c7OGl0EtwGJRN3rnzq43P4VuDlNUcQ/7AyIvfRpZhPNYDBZYWssvkfT5sBd/IKawyYADFm7lUHKid1fTgjbZPQ8J6uJ9qALaVCFFFu3fEtPH1IEtGy9IHwjMMWvj5L20fODJwePj/QmoejPalI/niU6hi9YQJQiYvfbYcZUN8MiMhjFDiSI6vr4gcyHe1T1RRPH1SEz0HROeJsP46LlKno98Mc1fzlxoxp1p8EWytTfdh4vMVJzIED5cVdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/ECE2NT3/W7SlQs3jvLDkVaHn4CW/xBcD06c9TPz4k=;
 b=WLYW65VYpF2lLbEBSK6+5a4XcQqLWxC+Ny64GhjQfAioWBPntVh8SYRin/0CEF9VDF9zw/raTxlwO0/oxFf+DyDj4/V8G2ob3d7fHZGWSrfmPpMbTPwvNw0ne8wb46DzvH8fp4CwYDwqrQpndYIuIiGLuZ1IJNXSWiac6W/eLjvIXs+r749wPXYK5+mfiRj4rOYne4fsL5lB3hkRjO+xymcUsN+jHgDx1xP6FwVkbx0Ul5I/Dd4s25mNAh0gqq35R3vq+71CbEgyr5XhqzKw/jEEU+vqz+ls/oSfejbg9cNKiujRvIl22lU1H1pQP06186ocln2VW+iwTYqkLA1ggg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/ECE2NT3/W7SlQs3jvLDkVaHn4CW/xBcD06c9TPz4k=;
 b=UKPu+5QRDqqqeNBt76a0Fb94OLpU2gpgQiXW0INoRHhQBeWX5pSYHlSdPKmJgLTw4Vj/p6E/s/5J2cPOOaJRlN19VInwm+bMrEHz0oiGDuIt14Sl4z7kzotBYQ1r+2w/f17VzrLInwMwuCLDNHT3iZyX3EL71VFJ4gnV7OZwAlE=
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
Subject: [XEN RFC PATCH 34/40] xen: move numa_scan_nodes from x86 to common
Date: Wed, 11 Aug 2021 18:24:17 +0800
Message-ID: <20210811102423.28908-35-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ca887c00-64f1-44db-20fb-08d95cb2703e
X-MS-TrafficTypeDiagnostic: DB7PR08MB3017:|HE1PR08MB2841:
X-Microsoft-Antispam-PRVS:
	<HE1PR08MB2841C29D87FF1BEFE2EF16529EF89@HE1PR08MB2841.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1360;OLM:1360;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 i9gsGn94WEJQSwxMutINQSdy20MM2TjbDHpdMk6ZmJ3mBIaYdk99y8vEO5iU0Yufhz4lTsDo3NXtj+lhFTdkku6SVqI+DLY33RnPoEPCrJAj2AGrvEvWjIj/F/uYnFvdTMGJIdPucDdq2Pk4G1ZalYrDvXB0pw1BV7n1FmKpU7x/OTbmtoCSKkaCIGGPpBR+YRx0JkwRWA5hn4UbH3EyY23WORLuJO9w56TBFwV7p9FWgkX+pGTrLCdrlmIlvBxmQeSuoAUyB68y1ZaTCoZMxyukbkAl+h4RpPxrWWG2WX1lI6pz5uezbGQzTiGur7D8JLCvkHRnyWiSWtkQws536BbqvmWE5Vj8hg/GPZ9zsdl9T8avR48d+X1o/M9PxRkOLXWrA/aQwtKwdNz/S+XjjYBsFD4YYOi1X87+trMHPsR28LjywF6VqI+5mz251psBJ/ZhP0/138TbwUkCDKzmh6R/JE4qNGrcDfCQLykYAmhCsDi4w5R1dwy8ISI/3mfT68t53MvyU9z157Ki4WKCk8dG4xbU2RmUWvToJzieIan4Ps1ou2L6wcx3C1AtUShlp2LkAhyeGzKAVCln6LOe9x+3VAw9ov5V8yoVcYTyzseiJewlxmr8sr/ZlMRXyXuSOjp9uZPkUO7/sbWAcOVJNeqEOgvoiyWwV4FK6mgOJLhveXAXtnzm25MP+jw0ysBHSPGgJVxKro+031KNa0iNOsaPymtO1K3kg9ngCZzM5otg4FBMt8GK5QRJg29/VPXYiRV6Wse3aEezwwMv/KeMf6DsKCZi1GoCmpEVI9gsszg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(83380400001)(5660300002)(508600001)(2616005)(44832011)(7696005)(36756003)(1076003)(336012)(34070700002)(356005)(81166007)(82310400003)(70586007)(70206006)(6666004)(8936002)(86362001)(186003)(8676002)(36860700001)(47076005)(2906002)(110136005)(316002)(4326008)(26005)(426003)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3017
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9f0b1209-d713-4618-192a-08d95cb26b13
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kns4oty07p6maIH0Ss47TfwTWSGoVzrjkHBOsGEGTq0UZbX1+vGeauQBsO893+CNNQI6EwvjUoXpCkPSrh4asEhFlSbSnaMMUhx/thn9rbPqApmgLSZDuPfhxArmuPXnSU/c1kinq0j0Kbjq4Adei0qqC8crLZsMuUmFEhDHC2k9jhgIm8pgWW3Eg+2tATI8KvbToJKfWV47Fy1sr8tFONiyeuLbpVi/7BT3vsqRbKLBYFBPK7v413eHBj8zbzD4SJQHi3znDNmA6DyZmqZjSCi93u8KAXwKeAaR6tlg6geL90UbVt9gDpd5Zp2WfuYkRbDEN4eBYrao0whLZh6IZuwc9JB8OgbJaid5HismfhiihU0y27CCBx1yI1ZoPEZLn/QP8sJHg4synSToOKxBd2RyzABaLFJb8/DBwGnNOMrNSGSEkNXl8QTg0bXiTzYC1LaKJSLImQzH1VmvE/rVcGvEP6xy9+w+4c1FLs15D31w4omFYwV4eBlGYzfJx5xJwGGL8V1GHfcYevVQdNmlhJOIbBLpcniKqU7Xf4IAy2QHO0RRIjivL+rULwVcS7jVWOEeFJX3vlGJ1ePDkjN35UdTWwybjYJHCC81UEzQ2PLUjVR8qxwmAoCsv7rMT/cLIFU8CbOhpU0h8JT17GEX12ml05pLz1mUTSDaTmpRYZMBOkkARuIif5+/Rg9F3FyHj39EkEXtcMWXEPl9I1nS5wgdIoJny2u4t9qQJKU4dHg=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(39850400004)(376002)(396003)(136003)(46966006)(36840700001)(70586007)(82740400003)(82310400003)(36860700001)(478600001)(26005)(36756003)(7696005)(83380400001)(70206006)(6666004)(336012)(86362001)(1076003)(110136005)(2616005)(5660300002)(4326008)(44832011)(316002)(186003)(47076005)(426003)(8936002)(2906002)(8676002)(81166007)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:26:10.6130
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ca887c00-64f1-44db-20fb-08d95cb2703e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2841

After the previous patches preparations, numa_scan_nodes can be
used by Arm and x86. So we move this function from x86 to common.
As node_cover_memory will not be used cross files, we restore its
static attribute in this patch.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/x86/srat.c        | 52 ------------------------------------
 xen/common/numa.c          | 54 +++++++++++++++++++++++++++++++++++++-
 xen/include/asm-x86/acpi.h |  3 ---
 xen/include/xen/numa.h     |  3 ++-
 4 files changed, 55 insertions(+), 57 deletions(-)

diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index c979939fdd..c9f019c307 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -361,58 +361,6 @@ void __init srat_parse_regions(u64 addr)
 	pfn_pdx_hole_setup(mask >> PAGE_SHIFT);
 }
 
-/* Use the information discovered above to actually set up the nodes. */
-int __init numa_scan_nodes(u64 start, u64 end)
-{
-	int i;
-	nodemask_t all_nodes_parsed;
-
-	/* First clean up the node list */
-	for (i = 0; i < MAX_NUMNODES; i++)
-		cutoff_node(i, start, end);
-
-#ifdef CONFIG_ACPI_NUMA
-	if (acpi_numa <= 0)
-		return -1;
-#endif
-
-	if (!nodes_cover_memory()) {
-		bad_srat();
-		return -1;
-	}
-
-	memnode_shift = compute_hash_shift(node_memblk_range, num_node_memblks,
-				memblk_nodeid);
-
-	if (memnode_shift < 0) {
-		printk(KERN_ERR
-		     "SRAT: No NUMA node hash function found. Contact maintainer\n");
-		bad_srat();
-		return -1;
-	}
-
-	nodes_or(all_nodes_parsed, memory_nodes_parsed, processor_nodes_parsed);
-
-	/* Finally register nodes */
-	for_each_node_mask(i, all_nodes_parsed)
-	{
-		u64 size = nodes[i].end - nodes[i].start;
-		if ( size == 0 )
-			printk(KERN_WARNING "SRAT: Node %u has no memory. "
-			       "BIOS Bug or mis-configured hardware?\n", i);
-
-		setup_node_bootmem(i, nodes[i].start, nodes[i].end);
-	}
-	for (i = 0; i < nr_cpu_ids; i++) {
-		if (cpu_to_node[i] == NUMA_NO_NODE)
-			continue;
-		if (!nodemask_test(cpu_to_node[i], &processor_nodes_parsed))
-			numa_set_node(i, NUMA_NO_NODE);
-	}
-	numa_init_array();
-	return 0;
-}
-
 static unsigned node_to_pxm(nodeid_t n)
 {
 	unsigned i;
diff --git a/xen/common/numa.c b/xen/common/numa.c
index 4152bbe83b..8ca13e27d1 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -195,7 +195,7 @@ void __init cutoff_node(int i, u64 start, u64 end)
 
 /* Sanity check to catch more bad SRATs (they are amazingly common).
    Make sure the PXMs cover all memory. */
-int __init nodes_cover_memory(void)
+static int __init nodes_cover_memory(void)
 {
 	int i;
 	uint32_t nr_banks = arch_meminfo_get_nr_bank();
@@ -271,6 +271,58 @@ void __init numa_init_array(void)
     }
 }
 
+/* Use the information discovered above to actually set up the nodes. */
+int __init numa_scan_nodes(u64 start, u64 end)
+{
+	int i;
+	nodemask_t all_nodes_parsed;
+
+	/* First clean up the node list */
+	for (i = 0; i < MAX_NUMNODES; i++)
+		cutoff_node(i, start, end);
+
+#ifdef CONFIG_ACPI_NUMA
+	if (acpi_numa <= 0)
+		return -1;
+#endif
+
+	if (!nodes_cover_memory()) {
+		bad_srat();
+		return -1;
+	}
+
+	memnode_shift = compute_hash_shift(node_memblk_range, num_node_memblks,
+				memblk_nodeid);
+
+	if (memnode_shift < 0) {
+		printk(KERN_ERR
+		     "SRAT: No NUMA node hash function found. Contact maintainer\n");
+		bad_srat();
+		return -1;
+	}
+
+	nodes_or(all_nodes_parsed, memory_nodes_parsed, processor_nodes_parsed);
+
+	/* Finally register nodes */
+	for_each_node_mask(i, all_nodes_parsed)
+	{
+		u64 size = nodes[i].end - nodes[i].start;
+		if ( size == 0 )
+			printk(KERN_WARNING "SRAT: Node %u has no memory. "
+			       "BIOS Bug or mis-configured hardware?\n", i);
+
+		setup_node_bootmem(i, nodes[i].start, nodes[i].end);
+	}
+	for (i = 0; i < nr_cpu_ids; i++) {
+		if (cpu_to_node[i] == NUMA_NO_NODE)
+			continue;
+		if (!nodemask_test(cpu_to_node[i], &processor_nodes_parsed))
+			numa_set_node(i, NUMA_NO_NODE);
+	}
+	numa_init_array();
+	return 0;
+}
+
 #ifdef CONFIG_NUMA_EMU
 int numa_fake __initdata = 0;
 
diff --git a/xen/include/asm-x86/acpi.h b/xen/include/asm-x86/acpi.h
index 33b71dfb3b..2140461ff3 100644
--- a/xen/include/asm-x86/acpi.h
+++ b/xen/include/asm-x86/acpi.h
@@ -101,9 +101,6 @@ extern unsigned long acpi_wakeup_address;
 
 #define ARCH_HAS_POWER_INIT	1
 
-extern s8 acpi_numa;
-extern int numa_scan_nodes(u64 start, u64 end);
-
 extern struct acpi_sleep_info acpi_sinfo;
 #define acpi_video_flags bootsym(video_flags)
 struct xenpf_enter_acpi_sleep;
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 490381bd13..b9b5d1ad88 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -81,8 +81,10 @@ extern void bad_srat(void);
 extern void numa_init_array(void);
 extern void numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn);
 extern void numa_set_node(int cpu, nodeid_t node);
+extern int numa_scan_nodes(u64 start, u64 end);
 extern bool numa_off;
 extern int numa_fake;
+extern s8 acpi_numa;
 
 extern void setup_node_bootmem(nodeid_t nodeid, u64 start, u64 end);
 
@@ -94,7 +96,6 @@ static inline void clear_node_cpumask(int cpu)
 extern uint32_t arch_meminfo_get_nr_bank(void);
 extern int arch_meminfo_get_ram_bank_range(int bank,
     unsigned long long *start, unsigned long long *end);
-extern int nodes_cover_memory(void);
 
 #endif /* CONFIG_NUMA */
 
-- 
2.25.1


