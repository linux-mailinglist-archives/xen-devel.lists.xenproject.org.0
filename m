Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C93CEB0FA14
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 20:14:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1054601.1423348 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uedyM-0007ZW-I7; Wed, 23 Jul 2025 18:13:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1054601.1423348; Wed, 23 Jul 2025 18:13:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uedyM-0007X7-EY; Wed, 23 Jul 2025 18:13:46 +0000
Received: by outflank-mailman (input) for mailman id 1054601;
 Wed, 23 Jul 2025 18:13:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3I4v=2E=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uedyL-0007IE-69
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 18:13:45 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2009::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c47c7aea-67f0-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 20:13:44 +0200 (CEST)
Received: from SJ0PR03CA0388.namprd03.prod.outlook.com (2603:10b6:a03:3a1::33)
 by DM4PR12MB6061.namprd12.prod.outlook.com (2603:10b6:8:b3::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.21; Wed, 23 Jul 2025 18:13:40 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::7c) by SJ0PR03CA0388.outlook.office365.com
 (2603:10b6:a03:3a1::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Wed,
 23 Jul 2025 18:13:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Wed, 23 Jul 2025 18:13:39 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 23 Jul
 2025 13:13:38 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 23 Jul 2025 13:13:38 -0500
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
X-Inumbo-ID: c47c7aea-67f0-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F5euP07mF7EpePaOIy8r04kha1Q/xe9QOU4M/HmmhYRWXnLVD2/sBWIZSJ4eQ3tUrn5KxHmGdQw5mPVcHGLsDRBnCW1BVkTlELEhWIheAGBBsYIlniXSLzl7TYWhxwxPn+7q62wGu1qp+36tSke22oLMNRPqmthbCkwicDmwQexwW3GDfr46qVWLA1ASLQ3WFQcxEyCc76s3tiYIH3SqituMi5R9JlV6RSmWHOYnhCBv2v4YdzUCPNADjyYBvVXZ+0+4YL52pnIWR4jMur/S+9HNf2qxJ7Vxz4sWGBtJqxLyra8zHYY35IOJgnz1k8bLgojyzFJ84Od0WqgVvPHN8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cYI2Wa/v781a7NU86VDmJ9rOsg8xDEHr3pDMQmidPno=;
 b=kzZaxpSPprJrd0bEpMRE+UwKqRpP6uq/8CMr6JERy7fiSCD/Tg3ueXPXJFvYNm9qaufyS+X/CIW0akGR9k7DZ0dAIBEfyG0ENTgYRNpNRK/zGmnfm12GGj/3mq6wKP3Xh6n3NyJJsQtWAtukUnAz5hfJ25fIoXB9OUPJl1K52kw8X8/u5OAVUTP48s2UDBuCrb/GGTn1vGofQfq/wQ1JCg3pb53lw9BcqqnTUYTHy4aS0MSdeW6kI3xXSCjCLG0h0a36P01Zb1MyWAUFBfcZ5B9DrcqAqEGjyTtstEMZhKX8BnDYLZLNu8yKTnebCuMQRzOzo7rRBqPWJjHrCiiH8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cYI2Wa/v781a7NU86VDmJ9rOsg8xDEHr3pDMQmidPno=;
 b=ty4vphro8OZR95UEUXstwpJOnjmfDXKkgIdmYZPgd1pA4V2KfHuKTQqW5HImX5rFThDz9c4/4fry1LwnounSeHESaMq+G0uEvaNYc/3qOTP/nsa5EodrmuVvOKLzErBTpVSlbHRFVa4lOcoM3ICC7A7ipy4QgOSixV1F6agHZW8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <stefano.stabellini@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>
Subject: [PATCH v4 2/2] xen/arm: allow translated iommu mappings
Date: Wed, 23 Jul 2025 14:13:28 -0400
Message-ID: <20250723181330.14305-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250723181330.14305-1-stewart.hildebrand@amd.com>
References: <20250723181330.14305-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|DM4PR12MB6061:EE_
X-MS-Office365-Filtering-Correlation-Id: 79b766e7-c355-4b0b-fdf0-08ddca14a65d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RRyePAfwBo+wNKsP3eZ8RB11MqAzhoKfxfvx9LXObAx6UXmt1SBZaRGv6kWT?=
 =?us-ascii?Q?bsR+Gb+/fhB7qcJTQEI3GdITq7EbvuQpUtQk7H9t8agb8q2lyFzL4j/iUCZw?=
 =?us-ascii?Q?mt8Wwyz8QAvrFpJo3eKuoe3l7Zgwl+5Q0YNIlmQaN3etmQ0artDYkJd3Gh7g?=
 =?us-ascii?Q?G7X8GD1yQjwFa86vozRRbhcaXaXQfIXZhLn4mNCmlCK6hL2A1eO3n0Ci1DZx?=
 =?us-ascii?Q?k0HlxTtWb4Q0RWH9PTgwj8AiI95lsuXqUHzOT7MFZFyaaStcoehkrfKHP+Hm?=
 =?us-ascii?Q?Ha55mHEXoVBK2bzPMylNRKJNsW9bOI1VPZtDPFqLud1J82ia9+UJ8o7q/3ZI?=
 =?us-ascii?Q?hjnkNj8s1oTsR4EZDb82VMS/XcWHt3ZKWLCPyJTeG8o/O4JNgzYBvUR8Q2XP?=
 =?us-ascii?Q?oRdzg1W68Q8C5TRMzP2hI80DrsrBU6qgCDIPHzjGHsZeiNqYmYIdgZ8/ewQH?=
 =?us-ascii?Q?UPiDjAEOjdMZGOr0Bv1xRI1pxX+h6Bn6i/LVXCQ4zHxGQhs1KbrudO34AEIr?=
 =?us-ascii?Q?QEKiPQT5vOMnRe5b59s6/vL8Ia4tjM2AJ7XumYq5jrG8GNJ+aFEb7xO+DQYf?=
 =?us-ascii?Q?V1Uq3J6tVw0E+mEerJqkfEC5D8t8oOIJInLY31kUyh0OdJnanTd09r0y805V?=
 =?us-ascii?Q?2zDkSIKFFHaKr8rzvVaw+exJhLc8Dz20cA2T3X3w8dbsdPMBw2kzFVNoPX47?=
 =?us-ascii?Q?9vhS+gGxrgBTAG46IQ/OseV/N7Vmbj1eUpx7iIGOGxmNK8k1SZFz8MIRQgj5?=
 =?us-ascii?Q?+co6j6STBY4q1cvkz8Laf2DMdT/6nngpAIAy6w5jrYqHA3zreGJce+iglUfi?=
 =?us-ascii?Q?ytEaB2vJevuRnSyZqTvbu+ib07WmG+ji0Kx+76xwb4HlOUo6JAJklaLnhnSL?=
 =?us-ascii?Q?XXd3XEuaCUOkUKmQBvLq72OvpKbrKmDclCY8OncOHL/x60iBkSfbxfmzVTGX?=
 =?us-ascii?Q?dFuA/H0JWdYAg8A+pXz/wao7ewEewODfmmUT/uAvhrcQXiTa5oF4sA2NGczl?=
 =?us-ascii?Q?gl93Enn//q+MW45/QBAwbxQWjHUWDSBVv+HKCAlwUFqU70CXxlcx/iSIM0Rw?=
 =?us-ascii?Q?biLmSQjJpRCHTWtAYI5JJ09TmOx9pf3jjlUx7df3ra9mAfIs+fLCNhaZiGds?=
 =?us-ascii?Q?G77/DqFqC/yJEFMsbDBMumdo4HFkzuSXFKZMZ+8MufkqmCNgdQRHWVucXRe+?=
 =?us-ascii?Q?KvPr0o0uOkK3r9Gr9Rnp4XG/RCJKk6mQU7j1assI9kiOVEVmmdkvnr5wcoO1?=
 =?us-ascii?Q?I25yH6BrHvGA05P3io9vWvAc4y89KKgTTllkz18n/fOO1U4U2eTn1nHq4s3K?=
 =?us-ascii?Q?FpHE7EPQic5ot1UnBrBb49dBjkq01CrxiY4WqWajBXQClEoBhcfqrtjNkCE2?=
 =?us-ascii?Q?uaK9tfJL9EyQQrJZ0dxIVljQ1rVr8LnFowx7w9pES1SnsIPCThSOUFXXoAVI?=
 =?us-ascii?Q?d1PrS2OnD94Qg4hLxFDOxSXZ3iPpY7N0eN26MQTCn1mVVpoI5wVt0OCfUQpE?=
 =?us-ascii?Q?kMc3oGXSxpFwcw6ldEZi/oXCUg9iL5XG31Dj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 18:13:39.4467
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79b766e7-c355-4b0b-fdf0-08ddca14a65d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6061

From: Stefano Stabellini <stefano.stabellini@amd.com>

In preparation of exposing vITS to domUs, generalize arm_iommu_map_page
and arm_iommu_unmap_page to allow ITS doorbell mappings with dfn != mfn.

The mfn does not need to be passed to guest_physmap_remove_page since
there is no mfn checking on the p2m_iommu_map_{rw,ro} p2m types during
unmap. Pass INVALID_MFN to guest_physmap_remove_page.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v3->v4:
* no change

v2->v3:
* split change from ("xen/arm: fix arm_iommu_map_page after f9f6b22ab")
* both map and unmap
---
 xen/drivers/passthrough/arm/iommu_helpers.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/xen/drivers/passthrough/arm/iommu_helpers.c b/xen/drivers/passthrough/arm/iommu_helpers.c
index bdb271584b0d..a3e3cafb8705 100644
--- a/xen/drivers/passthrough/arm/iommu_helpers.c
+++ b/xen/drivers/passthrough/arm/iommu_helpers.c
@@ -36,9 +36,6 @@ int __must_check arm_iommu_map_page(struct domain *d, dfn_t dfn, mfn_t mfn,
 {
     p2m_type_t t;
 
-    BUG_ON(!domain_use_host_layout(d));
-    BUG_ON(mfn_x(mfn) != dfn_x(dfn));
-
     /* We only support readable and writable flags */
     if ( !(flags & (IOMMUF_readable | IOMMUF_writable)) )
         return -EINVAL;
@@ -49,7 +46,7 @@ int __must_check arm_iommu_map_page(struct domain *d, dfn_t dfn, mfn_t mfn,
      * The function guest_physmap_add_entry replaces the current mapping
      * if there is already one...
      */
-    return guest_physmap_add_entry(d, _gfn(dfn_x(dfn)), _mfn(dfn_x(dfn)),
+    return guest_physmap_add_entry(d, _gfn(dfn_x(dfn)), mfn,
                                    IOMMUF_order(flags), t);
 }
 
@@ -58,11 +55,7 @@ int __must_check arm_iommu_unmap_page(struct domain *d, dfn_t dfn,
                                       unsigned int order,
                                       unsigned int *flush_flags)
 {
-    if ( !domain_use_host_layout(d) )
-        return -EINVAL;
-
-    return guest_physmap_remove_page(d, _gfn(dfn_x(dfn)), _mfn(dfn_x(dfn)),
-                                     order);
+    return guest_physmap_remove_page(d, _gfn(dfn_x(dfn)), INVALID_MFN, order);
 }
 
 /*
-- 
2.50.1


