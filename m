Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE5AA74188
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 00:34:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930039.1332767 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txwk3-0000Un-Gt; Thu, 27 Mar 2025 23:34:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930039.1332767; Thu, 27 Mar 2025 23:34:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txwk3-0000Se-Dd; Thu, 27 Mar 2025 23:34:31 +0000
Received: by outflank-mailman (input) for mailman id 930039;
 Thu, 27 Mar 2025 23:34:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZXwx=WO=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1txwk1-0000SW-It
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 23:34:29 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060c.outbound.protection.outlook.com
 [2a01:111:f403:200a::60c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04e2daec-0b64-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 00:34:27 +0100 (CET)
Received: from BN9PR03CA0592.namprd03.prod.outlook.com (2603:10b6:408:10d::27)
 by CY8PR12MB7097.namprd12.prod.outlook.com (2603:10b6:930:51::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 23:34:22 +0000
Received: from BN1PEPF00004681.namprd03.prod.outlook.com
 (2603:10b6:408:10d:cafe::3d) by BN9PR03CA0592.outlook.office365.com
 (2603:10b6:408:10d::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.44 via Frontend Transport; Thu,
 27 Mar 2025 23:34:21 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN1PEPF00004681.mail.protection.outlook.com (10.167.243.87) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Thu, 27 Mar 2025 23:34:21 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Mar
 2025 18:34:21 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 27 Mar 2025 18:34:20 -0500
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
X-Inumbo-ID: 04e2daec-0b64-11f0-9ffa-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lIU8hSbFiveeea3tDYv3YwzPgylW99V6EsjupXKgm4Fy9k+U7KTzh1Pwhm57uCzy2lzu+D6xuzl0rKiBp6UtKUQ8hYslJm0VhUNyoZ05r3phE7c3WeqVYB+PS3oFpgEwqlQVm0uxb5aXiXGy7kIqK6qqbKdhdJa21iNCqnFVJo8rMiGubwdJYQ4Sn+nGUWF09oYyRgD9zE3Gd4ISf+DLbRbFv5QSTRLl+DZ9XtIWmKljRglZOI8Je749B6PXLCGpaThmx2zsV1EJ/VAkJagP4cw/P0wDqmUABRhjuz2r9LjqwUXnCyOo18pEl0L13DsAE1sYRgR+YrmaM79z4Gj7kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DxGiGT+5FrG26tFJesGKy21PvaBF5tmc1jLI4X5eyBQ=;
 b=uGk9WM8tzgTTkgTuLAVQhfx+grGWKpvdjjz1xcYpZ9dwJYWSmzUK1s4CmL/F21v5Q/5v7WMOzgVWPgYVWZ4LTMRhOCiIOm37L+OUXAjORljXmuiLKgYM/FwwsBTANc2TZkl2A+Fo+AbXBdpz6pR94ud2vi6x2qEnHOm9+DzW6Xmmgji/jqZL2GQv0os0rnYHBolVnAG9KnTp2JokuG/yH+bYE4pJfl7Rg1rCNlZ0Uk8RWlS3qZ6+OegyK93V3wJb6DmhSx6BUYDZUUq/Ho84r2cRte9u7gcN40ggv+/4Wmm0LT0ak/4UJGiX2VWmHEgdCZVj1YWcUklynisuUnB8dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DxGiGT+5FrG26tFJesGKy21PvaBF5tmc1jLI4X5eyBQ=;
 b=vCt/HkmEoPWldQlNniwR2J6IX+cBcrsMm5XILL3fG07JosgXiD0TVsGLW0PtCBRs71BVs+weAnuWdRLapx01QTXDqmi/rvuvDNysL+ktXCvDuI+jQCz6IR266OfIE2pb5wSE/93MKEmpJp8e40eIwaH6EqD+lqBjyKVsqnZ+5lk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <andrew.cooper3@citrix.com>,
	<jbeulich@suse.com>, <roger.pau@citrix.com>, <julien@xen.org>,
	<michal.orzel@amd.com>, <bertrand.marquis@arm.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: [PATCH v3] xen: simplify bitmap_to_xenctl_bitmap for little endian
Date: Thu, 27 Mar 2025 16:34:19 -0700
Message-ID: <20250327233419.1119763-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004681:EE_|CY8PR12MB7097:EE_
X-MS-Office365-Filtering-Correlation-Id: b5b008ae-57f2-47c1-c202-08dd6d87e6b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZxTMBS3K/g1e8XKrK4mm69Mk0+4G+ln+wB4ifOWyZwQ9B3ERBWolrZxtfxId?=
 =?us-ascii?Q?x0+F+LeLei5BzOdhzHpgpgNFtKN98pxFBKf5FDCW6HmZdTH2Fm6hXDJZeH3u?=
 =?us-ascii?Q?QXjoWnmE83ZFdCBFjnzJmZo/GqtrOW9KFVA63yoAn+9mzEMuxT/XJOo93AWC?=
 =?us-ascii?Q?LxVO6BJFrVuQH2PC6hgQLXArUjbu557wt1qyYqmos4HmCEolQ09yshBsJl4q?=
 =?us-ascii?Q?yTmyYI2N64+V1qic/FXASAccKjFbQObarGPRWpQO5ceJYYJ8nh2Fumi6vri9?=
 =?us-ascii?Q?CmOWoZTku/3qw3WQ3tvoRUawosDpdDkKzaN+KlEyqMoygA1MySlWpdlWl6Hc?=
 =?us-ascii?Q?A1t4aqOMwucbyBu/eXU/xPDRc07VYjTNFNfcK2eAQT1L6h7rX8ihh0BsIiFl?=
 =?us-ascii?Q?9CQbQZUn9n7hOvho7bPHohZ8YIUsMXCgxM7hQ8JqNSRA0IBnExzUG+L1oOwW?=
 =?us-ascii?Q?/YiK9cY7OqpjPnSVL1P+NO8xVcBEUrAzmuBKdCrx4xgQW4WdGdKzgxTPofFD?=
 =?us-ascii?Q?4TsNTUoHCop9uEUpBhyabJ2HfTgGefjbeVcdnu/lgGjZGO4hgUCZh8m07feo?=
 =?us-ascii?Q?g96khTeUve+y4PJhbHG18WEcZj7D3MGwLUxQfTmxIna8kohakbC3t7lGRoVr?=
 =?us-ascii?Q?ih13F1rjUnFswmaT4rPYSc4a5LcbfWV692bPVyHqQH0FPtfrdtVktiaWpjZB?=
 =?us-ascii?Q?zCkXZQDRiOpmPXi2xxxUvenouN4Z/e2n/6WaJOSXoix0a28xagxCSFwtBRNR?=
 =?us-ascii?Q?mkaszuwzBeplJrQ2DRnNg9lrLRQBIg5mVXO25m54OoL6FF2tN5fLi6t5z5RB?=
 =?us-ascii?Q?o/+f4PCFy4tl9Y0OeiESS7qiI1JW3RbDyjtWwN75fdBx6Qx/L04m4UraXdFt?=
 =?us-ascii?Q?pALHdmGxvCLdSos2FK/VLeuFjIZrwj9Y5cvW7+CfG3MMMIYJfi2GeNbTkO+e?=
 =?us-ascii?Q?reVybNSGcND+zCEa+EqmaYuVNeN0DpzCZs9WjzPGZZcDDXgKaMKq2a/j40r1?=
 =?us-ascii?Q?aEor8awviNmCkPrp+V/qDM6VL4iv0YznKBhefc0/4otn1fO2dA2oDXCtEyYP?=
 =?us-ascii?Q?050mB3Yn1iHKrWPsPv1cm3x5W33zgzuhN2qLMIAkv4n6ms/kjdM7OVTlD2Vd?=
 =?us-ascii?Q?41H+IwQWxofNWIYui1IyTedk+6CXoFSgaXRglTk9RZSdGT9RjMsfQJIrw3EW?=
 =?us-ascii?Q?mijM7EeUeoj+MJT0ihkFXfizyyWp/AKzvHFEeZuMmNOtqZOh4HfUkBL5yX+i?=
 =?us-ascii?Q?4SJgzUUuGcDoqUVlO1cFdjTweQoz8X3tzT1x8/+nAH+WpCIQcB7qNxtZyDea?=
 =?us-ascii?Q?pgkDRprYdBzoUveWV1LOGCTonSQUQsaPSLugXhktwMDexJq7lqd8X65WqT9u?=
 =?us-ascii?Q?MPZd+t3SVRvPiHAm5UeJbDceR8W04JiQM7XeO+pdlrl7ggQRNgZYwUNUAYi0?=
 =?us-ascii?Q?LC46SdMVnZlFSSXMgVCkaerr3JBjEo0xkmJSqBNCy8Vs0yuLp9/AsVJkIsp3?=
 =?us-ascii?Q?aNvbPh8j9PVn0i8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 23:34:21.4512
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5b008ae-57f2-47c1-c202-08dd6d87e6b7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004681.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7097

The little endian implementation of bitmap_to_xenctl_bitmap leads to
unnecessary xmallocs and xfrees. Given that Xen only supports little
endian architectures, it is worth optimizing.

This patch removes the need for the xmalloc on little endian
architectures.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v3:
- code style
- copy_bytes > 1 checks
- copy_bytes > 0 check for copy_to_guest_offset
---
 xen/common/bitmap.c | 42 ++++++++++++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 12 deletions(-)

diff --git a/xen/common/bitmap.c b/xen/common/bitmap.c
index 3da63a32a6..d3f9347e62 100644
--- a/xen/common/bitmap.c
+++ b/xen/common/bitmap.c
@@ -52,7 +52,7 @@ static void clamp_last_byte(uint8_t *bp, unsigned int nbits)
 	unsigned int remainder = nbits % 8;
 
 	if (remainder)
-		bp[nbits/8] &= (1U << remainder) - 1;
+		*bp &= (1U << remainder) - 1;
 }
 
 int __bitmap_empty(const unsigned long *bitmap, unsigned int bits)
@@ -338,7 +338,6 @@ static void bitmap_long_to_byte(uint8_t *bp, const unsigned long *lp,
 			nbits -= 8;
 		}
 	}
-	clamp_last_byte(bp, nbits);
 }
 
 static void bitmap_byte_to_long(unsigned long *lp, const uint8_t *bp,
@@ -363,7 +362,6 @@ static void bitmap_long_to_byte(uint8_t *bp, const unsigned long *lp,
 				unsigned int nbits)
 {
 	memcpy(bp, lp, DIV_ROUND_UP(nbits, BITS_PER_BYTE));
-	clamp_last_byte(bp, nbits);
 }
 
 static void bitmap_byte_to_long(unsigned long *lp, const uint8_t *bp,
@@ -384,21 +382,41 @@ int bitmap_to_xenctl_bitmap(struct xenctl_bitmap *xenctl_bitmap,
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
+    clamp_last_byte(&last, nbits);
+    if ( copy_bytes > 0 &&
+         copy_to_guest_offset(xenctl_bitmap->bitmap, copy_bytes - 1, &last, 1) )
+        err = -EFAULT;
 
     for ( i = copy_bytes; !err && i < guest_bytes; i++ )
         if ( copy_to_guest_offset(xenctl_bitmap->bitmap, i, &zero, 1) )
-- 
2.25.1


