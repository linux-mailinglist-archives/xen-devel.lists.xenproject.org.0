Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FF7A77215
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 02:50:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933280.1335269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzPpd-0007jl-29; Tue, 01 Apr 2025 00:50:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933280.1335269; Tue, 01 Apr 2025 00:50:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzPpc-0007iJ-VW; Tue, 01 Apr 2025 00:50:20 +0000
Received: by outflank-mailman (input) for mailman id 933280;
 Tue, 01 Apr 2025 00:50:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TUTC=WT=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1tzPpb-0007iD-Ma
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 00:50:19 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46e6f017-0e93-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 02:50:17 +0200 (CEST)
Received: from BL1PR13CA0232.namprd13.prod.outlook.com (2603:10b6:208:2bf::27)
 by IA0PR12MB8226.namprd12.prod.outlook.com (2603:10b6:208:403::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 00:50:11 +0000
Received: from BL6PEPF00020E64.namprd04.prod.outlook.com
 (2603:10b6:208:2bf:cafe::5e) by BL1PR13CA0232.outlook.office365.com
 (2603:10b6:208:2bf::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.21 via Frontend Transport; Tue,
 1 Apr 2025 00:50:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00020E64.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Tue, 1 Apr 2025 00:50:10 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 31 Mar
 2025 19:50:10 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 31 Mar 2025 19:50:09 -0500
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
X-Inumbo-ID: 46e6f017-0e93-11f0-9ea7-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XZN4vu8818YkPvLHSjYkK3fXn75B6cvgfJ3Y/kXRjtvkK0CDFA4k1AfG61VMlhl4VrCu9+lnXohOgb3Zu8lFLpnSv0qfB/Q8iM/JekYaS+Y6/mDejuAVXQG8n4SLYyHInY0dpYyHLT1aEJDJd7BRfAPj8FCTJm6SDFUZLynWCbhpoTGuk46jVFX3R4sbaBWIufEKe/9xuh0rkd0+4B1ZIC4LJad7eOtP3DB44PjBn9vD+ST/2iU25B6U4vTpvhZdZlMOtKT+LBsVWH4808JYHQZ2vd60acGaobvM6wSwkj52xLdDAEBZCheX7DpeiZykHQvmJYv9GM4hEgEoZvh5kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QOh1PMhAmneXmi4SqQjeQtPfLaspvsz6qTHru6ouAok=;
 b=UaockEq4PmaTCWXRakySE4lLhx7mrZ0sSkPrvexYgxwSHjqV3p5lJFlzM9XjFZlwP7PzG3cKekOik/kFowbebWKuSqnG2sZW/ItUzZThb24qsWSHi3eCfvFCHrGYFJWAzafy9rfsx4rV2sf25kZdo4LLJKoAJ+nQeLjA1cBRXrGlQ8rXPP7kbT+H8w+U0hJ0UyjM87wC9+s+TMCT9ZzkGzmE1L5hR0G0G1yIjuEIRwsVh9Pe9rsr3UnYPmXm50xpj9+TKFE+Joeu0P7ryCpL78j4C4MB0eRux3KrArHji5QvhI62Fd1oNRKyuIKZOuaRZAScxN40uMQ9ELcslgiyhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QOh1PMhAmneXmi4SqQjeQtPfLaspvsz6qTHru6ouAok=;
 b=jTvVzFTaHlaKsfJ200otkbktqPDGMVz3zSOCGREV18tWPXwSMxtcJImiX1bKW3vPN3/+O5pOY/s4YXoyeIy8rToP58HRNueh8DQtt2NbkttM8cCYaEIwp+/dqx95jMvxS1ydmMv6SUtrgstREhkJ+hY6N49+MAbssNki+LSCPvo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <jbeulich@suse.com>, <julien@xen.org>,
	<michal.orzel@amd.com>, <bertrand.marquis@arm.com>, <roger.pau@citrix.com>,
	<andrew.cooper3@citrix.com>, Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH v4] xen: simplify bitmap_to_xenctl_bitmap for little endian
Date: Mon, 31 Mar 2025 17:50:08 -0700
Message-ID: <20250401005008.2787764-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E64:EE_|IA0PR12MB8226:EE_
X-MS-Office365-Filtering-Correlation-Id: 64a27bf4-b9a0-488d-cdcd-08dd70b727eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|34020700016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?J/qzyqmhbATRFLj3AxHwRHBjzvxUlVgOPM8iSaeVlOvOyDZQmrJy1IMUNeoy?=
 =?us-ascii?Q?jP50VWp8ZkRmXeKOi8eNI09vHGe+282OE3Y8ri2wLbAZTJqsuz45eLyJvWqz?=
 =?us-ascii?Q?clhZyPcKj98a06uz8AhBg1vnn0bQ4HKx2eK5wI6ATFD4RzvaiOI7I9QUcKsx?=
 =?us-ascii?Q?tn9PsRoWxU+hMCFMYKJ+sEUYxgOKda5j6e8xDpcpxziLUN0dBT4caHnFmEXb?=
 =?us-ascii?Q?8YAabZ7mWhY7PLxQhUQfur+8N9SKQIgMEWRUGl05xJsFqMiPJ3lVOuXls7X4?=
 =?us-ascii?Q?IaWdtTtG1yB67x/+r1kLVcw7q7wJDZXnB7tl5Q01SKRu525COkIYgs8tlsWS?=
 =?us-ascii?Q?mdsN6uO3cLX+gUDsoX3Q+v4eVL1EuwsxHCcOv4wEAzcGvH9YiOGEOjb0FlMg?=
 =?us-ascii?Q?N5CcdyhSLxYN4jcL96MI7XPf9uKyztbMFjF6l4vvYfKDmtR4yS3ZC4MAR3VV?=
 =?us-ascii?Q?OqBTlb4+k85EwO5uKDW4Twtdem1sfuRDTw/Os8gjw1NS8KAtIS7NEGdisqGw?=
 =?us-ascii?Q?mWVVQFcIap2Mj5SkoMIE9OV5aEiEUsQQTDrTh1HvNHVPoxFpHcY1zrGb7rlW?=
 =?us-ascii?Q?tulLCuqe3Hs/YJMYVXYhOuJb4Izel8PYncCIDJ77JhoAytnx3ygDiPl+nh5A?=
 =?us-ascii?Q?X9DS2U0gvY3N4ASkKLSI7duM9W7nYd+jETi6dq57eZbf7U11rDDFyMKdObju?=
 =?us-ascii?Q?kLM8MVrU76RaWLgDP6E/HG8ivuC/yP6woqjfUUTDhKC+znBfWytijUYZhtxu?=
 =?us-ascii?Q?XWBf8V3NCY5MmG3uql0xC1faUgGZIBcc3/G7a+1ZBT0xzh5EUhcr3rXOlkzl?=
 =?us-ascii?Q?7aQ42VyShYn340+HDhHjhQSRUKwhnoPq1MqUFTR+raYXBFMP1J4Iki/60daQ?=
 =?us-ascii?Q?A/IUqcefOqNwFtK0uTjPfNM7T8YKqhUnNYE/C7VyiCMjephaqYUrxJtdidGx?=
 =?us-ascii?Q?JIP99kdNH+muECvN13naUDOcioze4qSfgNMXSDfXLKUT0HAfdhT9c2aPNsqM?=
 =?us-ascii?Q?5GzVTeWlFMgbaKiLW9Vgv6Y9OZBf0B0wV4HH3DzU3ksDCyH+HddUVFll3nVj?=
 =?us-ascii?Q?Mz1S3jboKHivsiUGpJiNY+sbx9QK8VlZOemuaXrquZsYelCavlwqeTdzUSsD?=
 =?us-ascii?Q?6nnrhnCIhSpMD/z03NP8Bw1EGX61D2n0Qkd8MPz9sr364fUv6p9qQTNWNnGE?=
 =?us-ascii?Q?bewBF9WPIcfufO9dl4bFnmo7oW888yeZVssSPFW0BiGE+2O0fpiUX0Aq8pI1?=
 =?us-ascii?Q?aPh74bQtoZtjsy9IQPQfhonpsjjO6IaXyoL107TyjYF66rBwIDSvsYf9xcpg?=
 =?us-ascii?Q?s64NyUjwUDlUdrVLH6F1y/3pu8Rrh/9B3065JjUR44BdqLFIJ2B3V21xsz3g?=
 =?us-ascii?Q?DtYXnzjEy/CCgYTBwHJTFatPcV8Zrhg7d42eu1ESc8NVDyzP1UBfIu37gGW3?=
 =?us-ascii?Q?zLG+Q7euvbfFScIrA/gZYu89zAQ/QdsBydRmzAgVggk8t6O82YPasgh9VGxL?=
 =?us-ascii?Q?terTuSjfFrCrvms=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(34020700016)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 00:50:10.7100
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 64a27bf4-b9a0-488d-cdcd-08dd70b727eb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8226

The little endian implementation of bitmap_to_xenctl_bitmap leads to
unnecessary xmallocs and xfrees. Given that Xen only supports little
endian architectures, it is worth optimizing.

This patch removes the need for the xmalloc on little endian
architectures.

Remove clamp_last_byte as it is only called once and only needs to
modify one byte. Inline it.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v4:
- improve commit message
- remove clamp_last_byte
---
 xen/common/bitmap.c | 64 +++++++++++++++++++++++++++------------------
 1 file changed, 38 insertions(+), 26 deletions(-)

diff --git a/xen/common/bitmap.c b/xen/common/bitmap.c
index 3da63a32a6..10d19f4c0d 100644
--- a/xen/common/bitmap.c
+++ b/xen/common/bitmap.c
@@ -40,21 +40,6 @@
  * for the best explanations of this ordering.
  */
 
-/*
- * If a bitmap has a number of bits which is not a multiple of 8 then
- * the last few bits of the last byte of the bitmap can be
- * unexpectedly set which can confuse consumers (e.g. in the tools)
- * who also round up their loops to 8 bits. Ensure we clear those left
- * over bits so as to prevent surprises.
- */
-static void clamp_last_byte(uint8_t *bp, unsigned int nbits)
-{
-	unsigned int remainder = nbits % 8;
-
-	if (remainder)
-		bp[nbits/8] &= (1U << remainder) - 1;
-}
-
 int __bitmap_empty(const unsigned long *bitmap, unsigned int bits)
 {
 	int k, lim = bits/BITS_PER_LONG;
@@ -338,7 +323,6 @@ static void bitmap_long_to_byte(uint8_t *bp, const unsigned long *lp,
 			nbits -= 8;
 		}
 	}
-	clamp_last_byte(bp, nbits);
 }
 
 static void bitmap_byte_to_long(unsigned long *lp, const uint8_t *bp,
@@ -363,7 +347,6 @@ static void bitmap_long_to_byte(uint8_t *bp, const unsigned long *lp,
 				unsigned int nbits)
 {
 	memcpy(bp, lp, DIV_ROUND_UP(nbits, BITS_PER_BYTE));
-	clamp_last_byte(bp, nbits);
 }
 
 static void bitmap_byte_to_long(unsigned long *lp, const uint8_t *bp,
@@ -377,6 +360,13 @@ static void bitmap_byte_to_long(unsigned long *lp, const uint8_t *bp,
 
 #endif
 
+/*
+ * If a bitmap has a number of bits which is not a multiple of 8 then
+ * the last few bits of the last byte of the bitmap can be
+ * unexpectedly set which can confuse consumers (e.g. in the tools)
+ * who also round up their loops to 8 bits. Ensure we clear those left
+ * over bits so as to prevent surprises.
+ */
 int bitmap_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_bitmap,
                             const unsigned long *bitmap, unsigned int nbits)
 {
@@ -384,21 +374,43 @@ int bitmap_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_bitmap,
     uint8_t zero = 0;
     int err = 0;
     unsigned int xen_bytes = DIV_ROUND_UP(nbits, BITS_PER_BYTE);
-    uint8_t *bytemap = xmalloc_array(uint8_t, xen_bytes);
-
-    if ( !bytemap )
-        return -ENOMEM;
+    uint8_t last;
 
     guest_bytes = DIV_ROUND_UP(xenctl_bitmap->nr_bits, BITS_PER_BYTE);
     copy_bytes  = min(guest_bytes, xen_bytes);
 
-    bitmap_long_to_byte(bytemap, bitmap, nbits);
+    if ( IS_ENABLED(__BIG_ENDIAN) )
+    {
+        uint8_t *bytemap = xmalloc_array(uint8_t, xen_bytes);
 
-    if ( copy_bytes &&
-         copy_to_guest(xenctl_bitmap->bitmap, bytemap, copy_bytes) )
-        err = -EFAULT;
+        if ( !bytemap )
+            return -ENOMEM;
 
-    xfree(bytemap);
+        bitmap_long_to_byte(bytemap, bitmap, nbits);
+        last = bytemap[nbits / 8];
+
+        if ( copy_bytes > 1 &&
+             copy_to_guest(xenctl_bitmap->bitmap, bytemap, copy_bytes - 1) )
+            err = -EFAULT;
+
+        xfree(bytemap);
+    }
+    else
+    {
+        const uint8_t *bytemap = (const uint8_t *)bitmap;
+        last = bytemap[nbits / 8];
+
+        if ( copy_bytes > 1 &&
+             copy_to_guest(xenctl_bitmap->bitmap, bytemap, copy_bytes - 1) )
+            err = -EFAULT;
+    }
+
+    if ( nbits % 8 )
+        last &= (1U << (nbits % 8)) - 1;
+
+    if ( copy_bytes > 0 &&
+         copy_to_guest_offset(xenctl_bitmap->bitmap, copy_bytes - 1, &last, 1) )
+        err = -EFAULT;
 
     for ( i = copy_bytes; !err && i < guest_bytes; i++ )
         if ( copy_to_guest_offset(xenctl_bitmap->bitmap, i, &zero, 1) )
-- 
2.25.1


