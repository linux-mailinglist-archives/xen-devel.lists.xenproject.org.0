Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FC53E8EAA
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:31:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165700.302833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlVs-0002xV-DT; Wed, 11 Aug 2021 10:31:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165700.302833; Wed, 11 Aug 2021 10:31:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlVs-0002lo-5K; Wed, 11 Aug 2021 10:31:08 +0000
Received: by outflank-mailman (input) for mailman id 165700;
 Wed, 11 Aug 2021 10:31:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9qiF=NC=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDlSP-0000BQ-G1
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:27:33 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.51]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eeacf4f9-42c6-4494-8f8a-07b54b30723f;
 Wed, 11 Aug 2021 10:25:58 +0000 (UTC)
Received: from AM6P191CA0108.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::49)
 by PA4PR08MB6014.eurprd08.prod.outlook.com (2603:10a6:102:ee::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Wed, 11 Aug
 2021 10:25:48 +0000
Received: from VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8a:cafe::22) by AM6P191CA0108.outlook.office365.com
 (2603:10a6:209:8a::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:48 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT015.mail.protection.outlook.com (10.152.18.176) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:25:48 +0000
Received: ("Tessian outbound ab45ca2b67bc:v101");
 Wed, 11 Aug 2021 10:25:48 +0000
Received: from ca4836320fdc.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 53EFEF69-6DE1-4D6A-A5C6-ED460416405A.1; 
 Wed, 11 Aug 2021 10:25:42 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ca4836320fdc.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Aug 2021 10:25:42 +0000
Received: from DU2PR04CA0060.eurprd04.prod.outlook.com (2603:10a6:10:234::35)
 by DB9PR08MB6875.eurprd08.prod.outlook.com (2603:10a6:10:2aa::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Wed, 11 Aug
 2021 10:25:38 +0000
Received: from DB5EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:234:cafe::96) by DU2PR04CA0060.outlook.office365.com
 (2603:10a6:10:234::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:38 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT052.mail.protection.outlook.com (10.152.21.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.14 via Frontend Transport; Wed, 11 Aug 2021 10:25:38 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:25:32 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:30 +0000
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
X-Inumbo-ID: eeacf4f9-42c6-4494-8f8a-07b54b30723f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mV9BMQM6jBgOu/GpZfRnWjx48k73m+HxXIGWUQtTgGA=;
 b=rfU/w3FC4h+c2JHSWmjEeCj2tWYArDc1ucexFfoz2uXTDGpTKiy/uFXKTA8vXa8mDBK5nparKIhYujS2CWcMPXK/XINdJ3dfzNXI+tl1LAxrnqW/gdK5HLXabvDh4KHmRFhXFUx9Ox0LkF9i+zz9A6Oc3TH0ZUjn8aLQRXtr6mU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 57b47ae374b91047
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CdmcxWMgVcDZ2Kq1VYadjPEeHePOsXwr70osTNjId9KKwbG6W4xfQEr4FhWTptrLXmRuT0iYJjKXOyZwcIuRIsdU8zsi7OqMsBxDlo3V+bLbIQq240sjNWHe3bYJjctqGM2bZtbPRxID2gdg+qZUZQysX+yhlRkDL2PM98R2bxvSngKEzSt6OEKLpRdAtp7A0fUXvXGu+JvKw7JOTLLMIGROsgTlY9HVCU/DZjiQHYCUd/kuQzcr3cZr+qGgr4eVNwagMn1sxtedtkenPtcMrRDg6MRfgFXJaNKCWD8u/H45Ilp4oIMgsgM5V43lS3etmvRC78+gPadTXiK+YUdRVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mV9BMQM6jBgOu/GpZfRnWjx48k73m+HxXIGWUQtTgGA=;
 b=g9Np371fJbeXX8zwgTdBWx1SqE7F8Fwd7QOczF4EZXI3QlA4ZGrYCWhK5DHQow+Skk1TvJrDHYtY/SXm5W4DhToatgF7a5NCPDLn7Vew/AHDEyA97jOjOipc7nRDBQzkVbCHj2Qz/LSvB3FbEpFMjTJZKPbK1nooRg1rN1YTxZPi7lK4sD5OknLzM7ifhTHzyXeRjuTQR0S+972/L5WjHGPjRpQvw7E3brWDZr5EeB4ggGCGRQoIa93g6RwEKgIPcIn/OLY12cCc3Q+PX9cQqje0iISLDNzLQEvI1kFEfgdMq+xXfBjrbwP7+9WOG+K3yvPf//uUu7X8VGqR35YyxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mV9BMQM6jBgOu/GpZfRnWjx48k73m+HxXIGWUQtTgGA=;
 b=rfU/w3FC4h+c2JHSWmjEeCj2tWYArDc1ucexFfoz2uXTDGpTKiy/uFXKTA8vXa8mDBK5nparKIhYujS2CWcMPXK/XINdJ3dfzNXI+tl1LAxrnqW/gdK5HLXabvDh4KHmRFhXFUx9Ox0LkF9i+zz9A6Oc3TH0ZUjn8aLQRXtr6mU=
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
Subject: [XEN RFC PATCH 25/40] xen/arm: unified entry to parse all NUMA data from device tree
Date: Wed, 11 Aug 2021 18:24:08 +0800
Message-ID: <20210811102423.28908-26-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dfd8cd3c-959c-4a1b-6b66-08d95cb2630b
X-MS-TrafficTypeDiagnostic: DB9PR08MB6875:|PA4PR08MB6014:
X-Microsoft-Antispam-PRVS:
	<PA4PR08MB601423D37AAA6BE2CE96F8559EF89@PA4PR08MB6014.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 65NLayJa2Eg0Naw+roDr1MpisV0vjwrFSWA9O1Q1ZzokcaCdCVV//YQ0hY0Bkt/ejdycNMTicYDDkWGudYlGdJQ0BGN+/fy96t4SozOzve8i5bHgLEJcXATi9GqNEoIPMmVQwhdNht8yhQYNTKC27MgbAfv0lqrhhaebNJfAUGGW8hzABjNVLo7FC2jtbUQFF5uuId9HGwJu+/JmDew40JZV7CB+XMogahl6MN/JC7i0lRlcwcf0VjduljXLBqnZc/YfnzsSTSV4/GNHU8HRvuJXMH9VOYYraNsA9LNrhanfCOwfEljRw4TWJFU7WalAnNm02ctHAaX8ORjMtEYJ4u3YL+vAtS8GFTm2toO5BEDaNy3rIyhmLWmBPlQlPCxJmJW1yY2m8KQGBSz14WtYCm9FivqF+9BmAzY+zSsOjo2GQhjprybE8HjvBcqtKAfdcH2AGnUOBQyf+jEZcqztMoivbscqEPHSPXXwMppIJGU0Huh2RxBiVwHi7CTHvWApDDDy2NDMO2MpiK+Kev84oR6QxhK24acbB7JPQqvAmFD2xzM7xmLhzHbbvz2FxlQV3Mn4lqYd8MBZZrUY9j5wAKZGWCbfquIIIOcwdO2PGYS4MMQ+NfgwpdjDIIsSoNOEDRvUqNv5IapDLEN9MlyCVSy4/Zk/cvkGUSeclv+toFXlSIQEASXMOeFhP26iILWM6PakqclCJ7DxKatj69jPJ6/Ftrq2narzou2I8U4wsS+h47eBXq/iKXjQHBy9KpCV22HwHSiQgoDADm/SeIs/r+1c0hy4mPqLwmSqiYz9LFc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(346002)(136003)(39850400004)(396003)(376002)(46966006)(36840700001)(426003)(82310400003)(4326008)(34070700002)(7696005)(86362001)(47076005)(186003)(36860700001)(8936002)(336012)(316002)(44832011)(8676002)(36756003)(110136005)(1076003)(83380400001)(26005)(82740400003)(2616005)(5660300002)(81166007)(2906002)(478600001)(70206006)(70586007)(6666004)(356005)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6875
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b273a102-d832-4b0f-b764-08d95cb25d3f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sttQUmo36zHtm4rA96fDVALQ4mHQqQxTENZ2mzYo/Jn23Wi0F3DTPKPkJBbyHuuqZrrGuCxXxizZcXe/jFkImW4Lf7Vcfu6gjzTpGQQ8otaSiOgoczMLTCQKavqAkq9XZuKbFWc6vgE7YCKujpgwkafrBeB2jM2zumBEbZo3iwHxkGECgmsVpJkXd4r0p2vDtMdQkn5gE8nFqZbDH4UJK8P9P58LNpocGFRjvWTbWy/So6zpw+Bf3cKIe/53dvCyharrHCUIjQ4GcxgfRDqV8Ir/J9OsduNU1atT/I177oBOVFLHgPJRj8WZ3RXeUDtRiDe3NgvcwjsIf5dUkpQi2Ikjy539qMqu5MVi3a376nHM6lcFAu3JTUAZEHU99i8pYFNkD41bl/JsH3c5CdUOhFpZ3sZHEMyblPK6zAVZlc+xf2z8OoRYO8CM3lSg5OqVWFxlseQAxmA99r2Ycv4yJYnsrNSULubfAbvnyaRaE+YvWTttCf4DF1de7Kvj9yMgjtltM1d0Sqja35CJoH8GEvcix8+0HliP6q/otx4WQqjHCyd3X8tYRjdpBqRi5XU/EwTChtclaYrqCa36gJkuhTT0zTMDnh/Pl0glT6y3nwI0ndK3zwwz1D/lUW/QZEOaG0BboVHQsYdxQavbtMNWWqMU1CRG6W8SabxAEwLxsKqWSfoRLto/krCbc5+HD73J4ce8GJuEmNrARTRp/A8PjmC6ZNEUDKyvRF53PFJMk0I=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(39850400004)(346002)(46966006)(36840700001)(6666004)(186003)(82740400003)(426003)(47076005)(316002)(2906002)(36756003)(70206006)(5660300002)(70586007)(478600001)(81166007)(82310400003)(7696005)(336012)(83380400001)(86362001)(36860700001)(110136005)(8676002)(8936002)(26005)(44832011)(4326008)(2616005)(1076003)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:25:48.4083
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfd8cd3c-959c-4a1b-6b66-08d95cb2630b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6014

In this API, we scan whole device tree to parse CPU node id, memory
node id and distance-map. Though early_scan_node will invoke has a
handler to process memory nodes. If we want to parse memory node id
in this handler, we have to embeded NUMA parse code in this handler.
But we still need to scan whole device tree to find CPU NUMA id and
distance-map. In this case, we include memory NUMA id parse in this
API too. Another benefit is that we have a unique entry for device
tree NUMA data parse.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/numa_device_tree.c | 31 ++++++++++++++++++++++++++++---
 xen/include/asm-arm/numa.h      |  1 +
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/numa_device_tree.c b/xen/arch/arm/numa_device_tree.c
index 6e0d1d3d9f..27ffb72f7b 100644
--- a/xen/arch/arm/numa_device_tree.c
+++ b/xen/arch/arm/numa_device_tree.c
@@ -131,7 +131,8 @@ save_memblk:
 }
 
 /* Parse CPU NUMA node info */
-int __init device_tree_parse_numa_cpu_node(const void *fdt, int node)
+static int __init
+device_tree_parse_numa_cpu_node(const void *fdt, int node)
 {
     uint32_t nid;
 
@@ -147,7 +148,7 @@ int __init device_tree_parse_numa_cpu_node(const void *fdt, int node)
 }
 
 /* Parse memory node NUMA info */
-int __init
+static int __init
 device_tree_parse_numa_memory_node(const void *fdt, int node,
     const char *name, uint32_t addr_cells, uint32_t size_cells)
 {
@@ -202,7 +203,7 @@ device_tree_parse_numa_memory_node(const void *fdt, int node,
 }
 
 /* Parse NUMA distance map v1 */
-int __init
+static int __init
 device_tree_parse_numa_distance_map_v1(const void *fdt, int node)
 {
     const struct fdt_property *prop;
@@ -267,3 +268,27 @@ device_tree_parse_numa_distance_map_v1(const void *fdt, int node)
 
     return 0;
 }
+
+static int __init fdt_scan_numa_nodes(const void *fdt,
+                int node, const char *uname, int depth,
+                u32 address_cells, u32 size_cells, void *data)
+{
+    int ret = 0;
+
+    if ( fdt_node_check_type(fdt, node, "cpu") == 0 )
+        ret = device_tree_parse_numa_cpu_node(fdt, node);
+    else if ( fdt_node_check_type(fdt, node, "memory") == 0 )
+        ret = device_tree_parse_numa_memory_node(fdt, node, uname,
+                                address_cells, size_cells);
+    else if ( fdt_node_check_compatible(fdt, node,
+                                "numa-distance-map-v1") == 0 )
+        ret = device_tree_parse_numa_distance_map_v1(fdt, node);
+
+    return ret;
+}
+
+/* Initialize NUMA from device tree */
+int __init numa_device_tree_init(const void *fdt)
+{
+    return device_tree_for_each_node(fdt, 0, fdt_scan_numa_nodes, NULL);
+}
diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-arm/numa.h
index 756ad82d07..7a3588ac7f 100644
--- a/xen/include/asm-arm/numa.h
+++ b/xen/include/asm-arm/numa.h
@@ -26,6 +26,7 @@ typedef u8 nodeid_t;
 extern s8 device_tree_numa;
 
 extern void numa_init(bool acpi_off);
+extern int numa_device_tree_init(const void *fdt);
 extern void numa_set_distance(nodeid_t from, nodeid_t to, uint32_t distance);
 
 /*
-- 
2.25.1


