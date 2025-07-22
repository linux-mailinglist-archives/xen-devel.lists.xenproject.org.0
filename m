Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71831B0E6BC
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 00:52:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053031.1421774 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueLpt-0003RH-LB; Tue, 22 Jul 2025 22:51:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053031.1421774; Tue, 22 Jul 2025 22:51:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueLpt-0003Pp-HK; Tue, 22 Jul 2025 22:51:49 +0000
Received: by outflank-mailman (input) for mailman id 1053031;
 Tue, 22 Jul 2025 22:51:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=stB6=2D=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1ueLps-0003Pj-GC
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 22:51:48 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20613.outbound.protection.outlook.com
 [2a01:111:f403:2412::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6de2834e-674e-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 00:51:41 +0200 (CEST)
Received: from CY5PR15CA0059.namprd15.prod.outlook.com (2603:10b6:930:1b::28)
 by CY8PR12MB7268.namprd12.prod.outlook.com (2603:10b6:930:54::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 22:51:36 +0000
Received: from CY4PEPF0000EDD5.namprd03.prod.outlook.com
 (2603:10b6:930:1b:cafe::c4) by CY5PR15CA0059.outlook.office365.com
 (2603:10b6:930:1b::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Tue,
 22 Jul 2025 22:51:36 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD5.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 22:51:35 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 17:51:35 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 17:51:34 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 22 Jul 2025 17:51:33 -0500
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
X-Inumbo-ID: 6de2834e-674e-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kmX8d6rP7UtNOf+N3UaOP5plSbiy3E1t09pBB7JBaUGnaBo70as/EO1s/eqlqNJ7pn6hSZriZAjllaWMBnj+5FCYCMTQOiyAvCrQtH7+ifrqMqb1sa8dvz936ksFcklmlZEGNayNa/c17bam4b2Q+G3Kz4b5sss/3g61DfJm3dDbALCy0DtOQSUxTMSGvS4YPJYn++2X+lwWn1Zb1eVJHX3pYCElhRZlxI1BBqF0OSmPInNYN6FPJaBt2RcjsZ0HiQZ12krPjMPrWXuyqBoM7AtcVzYuCfSqVmFeQbj+l7OR76xPTsLNREmiMbL36wa48/pMfRK767lnGcNRHaC22A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u81A9bKygqw6pTSdgTx1OPSjUHnl8py2nShDllsbhhw=;
 b=tRitJibsy8gNJEoDcJJZHAqaaJLUM337n2385r0RXYu8Ccw7lMmC7h/yM9+tVQZxvhgTIogaepe3fkr+8v8qBQ/c05kkCnrtqd+WQqTUCBp8Sa9IfxXIDZfmH2F3XvhQoTO99nkFXKcUOwZD6ygCk+om/SbPpU0nLCHHlqha59KoU7PibMuYBxwVteergkq4UY0aaJRWwgO9DLhRPySst4Z8JJf/yQ+EEt0vV50EfJB3+mDJn6VXWRiJcBfGvUu0DWCkvIIC1UhAltWyEtRp2uTXdWAMXSRD+a/Zq/WDYD1RyZCrBcJ58ABWeTMY8nK/1GH50rL1UAda26zRXnBIYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u81A9bKygqw6pTSdgTx1OPSjUHnl8py2nShDllsbhhw=;
 b=aghxiqWmnBVhmHovloXbxXyfELZNdouTXCxq6wII8FFi0DuA2Nzti5dDiJmXKaqY0VznQVRXj/pCeVKCf5lqqDLfQOLQztoDk2gqIlRiq1Qf8xoky+7Pp3bdf1eqHYsoYYY01bKFzUaLI8qoSns4QqakzS6p+P3m8Pc15CbqYds=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <stefano.stabellini@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Stewart Hildebrand <stewart.hildebrand@amd.com>
Subject: [PATCH v3 1/2] xen/arm: fix arm_iommu_map_page after f9f6b22abf1d
Date: Tue, 22 Jul 2025 18:51:24 -0400
Message-ID: <20250722225127.81390-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD5:EE_|CY8PR12MB7268:EE_
X-MS-Office365-Filtering-Correlation-Id: 674cde54-75c7-460d-460f-08ddc9724fc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kOZTuQjI4sU8hdhI9VMWs0pPUMooG4uYKSv1Auiih+LZHK1j7sfS7LMqSS4D?=
 =?us-ascii?Q?pZpiYAYToSyp2Um0PwBcTpaBxPyaAysp4PL+9ctSKo8UjyuRecDpsqpZhgd6?=
 =?us-ascii?Q?mRXn7/kBzu9N0b1OBk7V43yis6E7c7EO/WV2QYXMbsAg+JvLfCEEFbBk+xy1?=
 =?us-ascii?Q?VAkoS+x8Zk97tmPJrcyM1wPDcz7GA5B3zWiPhBYT/ni6UWW8litEpctHxCjH?=
 =?us-ascii?Q?iB7uKzKc3lEFZQ8okwOHsf/OvhvmP1swayk7MdMS+h+xNKQTVWexFYHXxgQJ?=
 =?us-ascii?Q?cDEHVFrldBNyB5X4ih83vy4/n0e5YaFewXGnGRfPBTVFR1pLTq2HlEJwnK9C?=
 =?us-ascii?Q?QkC5sOiC4F2JDoLHA8M6OpIfTmQWrS+IO9sB4Qv1Y4e2wS00Ar+VAbM9ywuT?=
 =?us-ascii?Q?AYZapv/rZcE1tpD4q69SKq3dMdX4U26dsf/Z/l477uPmhwn9vOC6fdIPsf/N?=
 =?us-ascii?Q?zDVdjDL0V5fdJFnLgQg3/i2OJJloW/D6akiPKfax1A19GJqLYV1qkd86RxwK?=
 =?us-ascii?Q?04mOP/qDOYJmYkIL3H8bwoglqepzk1PW6du5x+xJJ+e5albF0A69bYmJJlYP?=
 =?us-ascii?Q?QF9SIOeseutTWEiNyiMwmGSpGaOiK91r2EbHhEc1xofHLsLuNzu/pHQw+DAp?=
 =?us-ascii?Q?Tg2WtVTHHton7n/tq5KDEUqPO8a1ASe3HsRyT3dLR78HiO3HPIe2buhH29mR?=
 =?us-ascii?Q?q6GID+W7CpP9/z2gIbnr21nhJAjAgv5t7S7U4BXa/Lb2XphO/q1oze4kl/Tv?=
 =?us-ascii?Q?AZC1koyoAOqo/KYU76YkI7X96aIbRm2tbEvKy2S8X+eMOXdQHa2E+0Wn9DNq?=
 =?us-ascii?Q?Y6gWhN16ZY6TMN+5tA4KMGrETyfLmTQLSIWqvIMk0scKQR0fsBczra4dc+KH?=
 =?us-ascii?Q?wJpBBM4WC+6mLD2UA667g6F/cAxFU4s4kLZcGu0qb7le3gyyD2PkjfyhY2gD?=
 =?us-ascii?Q?G7XZmIVxADXB3BRfU/0Jl9nA4X7GHo7N+bUa/8Ih4h1dQOwFm5qBGWnr12Il?=
 =?us-ascii?Q?bWIgxboas8Z1JcBT7TVL9PskFBqPj8+6IKfRAGMoILKnjCKXTNenSeJth4IK?=
 =?us-ascii?Q?xOaMsFk5+TyrhXG/0XCBfNXmMFBqMeXR+cPJ7LVhlh+AabVpENwtNwfzmQ6V?=
 =?us-ascii?Q?TAhWlUH3K00bek7/w1MX4cJaTirKIgBKV1RJoikank1hdsys5j6Art9JkkMI?=
 =?us-ascii?Q?iXRjn4bWBNt71NFiclKo4AFJxBah8DA1eGv2XWiokJ6pUBdYHEFdtLIfiNU3?=
 =?us-ascii?Q?froxG/QRyAseZCwbyAZo7KYGfaM4UoY94NcrgCT1AJhJ9EOxwytXMay4bru/?=
 =?us-ascii?Q?s6pBuwfB3qZtFkQmXM20xDVQdtZGTkDD3MRmCsMLiVyfiKCRFZE771P+ZlIM?=
 =?us-ascii?Q?6+yvuZ2OJqM56dylBTJdlfL+L4xI8y6Fy6qa4ozhZgNs8ey/9FjYRcdmEkC6?=
 =?us-ascii?Q?0wkQicmWOoOL9eJprheh/styDuKB/xzBbSCApZQKT3Ik+EQJQBLym75TEHcO?=
 =?us-ascii?Q?E9pBlbfJ+oNOW7jdsdCRFwqwvH8meoBWX5Nm?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 22:51:35.7117
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 674cde54-75c7-460d-460f-08ddc9724fc1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7268

From: Stefano Stabellini <stefano.stabellini@amd.com>

Up until f9f6b22abf1d "xen/arm: Map ITS doorbell register to IOMMU page
tables" the only caller of iommu_map on ARM was grant_table.c which has
a specific usage model and restrictions as described by the in-code
comment in arm_iommu_map_page.

f9f6b22abf1d introduced a second caller to iommu_map on ARM:
vgic_v3_its_init_virtual. This specific statement in the
f9f6b22abf1d commit message is partially wrong:

"Note that the 1:1 check in arm_iommu_map_page remains for now, as
virtual ITSes are currently only created for hwdom where the doorbell
mapping is always 1:1."

Leading to crashes any time the hardware domain is not direct-mapped
(e.g. cache coloring and non-Dom0 hardware domain):

(XEN) Xen BUG at drivers/passthrough/arm/iommu_helpers.c:47
[...]
(XEN) Xen call trace:
(XEN)    [<00000a000024c758>] arm_iommu_map_page+0x80/0x90 (PC)
(XEN)    [<00000a000024c750>] arm_iommu_map_page+0x78/0x90 (LR)
(XEN)    [<00000a0000250884>] iommu_map+0xcc/0x29c
(XEN)    [<00000a0000288024>] vgic_v3_its_init_domain+0x18c/0x1e8
(XEN)    [<00000a0000285228>] vgic-v3.c#vgic_v3_domain_init+0x168/0x21c
(XEN)    [<00000a0000281dcc>] domain_vgic_init+0x14c/0x210
(XEN)    [<00000a00002705a4>] arch_domain_create+0x150/0x1f0
(XEN)    [<00000a00002055e8>] domain_create+0x47c/0x6c0
(XEN)    [<00000a00002cf090>] create_domUs+0x7f8/0x8cc
(XEN)    [<00000a00002eb588>] start_xen+0x8f4/0x998
(XEN)    [<00000a000020018c>] head.o#primary_switched+0x4/0x10

Specifically, non-1:1 hardware domain exists with cache coloring
enabled. For that, is_domain_direct_mapped(d) is false but
domain_use_host_layout(d) is true.

Change the is_domain_direct_mapped(d) checks in arm_iommu_map_page and
arm_iommu_unmap_page into domain_use_host_layout(d) checks.

Move the in-code comment specific to the grant table to grant-table.c.

Fixes: f9f6b22abf1d ("xen/arm: Map ITS doorbell register to IOMMU page tables")
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v2->v3:
* split change into 2 patches
* 12-character commit IDs
* change both arm_iommu_map_page and arm_iommu_unmap_page
* s/IPA/GFN/ in comment
---
 xen/common/grant_table.c                    | 10 ++++++++--
 xen/drivers/passthrough/arm/iommu_helpers.c | 16 ++--------------
 2 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index cf131c43a1f1..33d051dfe9b8 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -1274,8 +1274,14 @@ map_grant_ref(
         }
 
         /*
-         * We're not translated, so we know that dfns and mfns are
-         * the same things, so the IOMMU entry is always 1-to-1.
+         * Grant mappings can be used for DMA requests. The dev_bus_addr
+         * returned by the hypercall is the MFN (not the GFN). For
+         * device protected by an IOMMU, Xen needs to add a 1:1 mapping
+         * in the domain p2m to allow DMA request to work. This is only
+         * valid when the domain is directed mapped.
+         *
+         * We're not translated, so we know that dfns and mfns are the
+         * same things, so the IOMMU entry is always 1-to-1.
          */
         if ( !(op->flags & GNTMAP_readonly) && node.cnt.wr == 1 )
             kind = IOMMUF_readable | IOMMUF_writable;
diff --git a/xen/drivers/passthrough/arm/iommu_helpers.c b/xen/drivers/passthrough/arm/iommu_helpers.c
index 5cb198748193..bdb271584b0d 100644
--- a/xen/drivers/passthrough/arm/iommu_helpers.c
+++ b/xen/drivers/passthrough/arm/iommu_helpers.c
@@ -36,15 +36,7 @@ int __must_check arm_iommu_map_page(struct domain *d, dfn_t dfn, mfn_t mfn,
 {
     p2m_type_t t;
 
-    /*
-     * Grant mappings can be used for DMA requests. The dev_bus_addr
-     * returned by the hypercall is the MFN (not the IPA). For device
-     * protected by an IOMMU, Xen needs to add a 1:1 mapping in the domain
-     * p2m to allow DMA request to work.
-     * This is only valid when the domain is directed mapped. Hence this
-     * function should only be used by gnttab code with gfn == mfn == dfn.
-     */
-    BUG_ON(!is_domain_direct_mapped(d));
+    BUG_ON(!domain_use_host_layout(d));
     BUG_ON(mfn_x(mfn) != dfn_x(dfn));
 
     /* We only support readable and writable flags */
@@ -66,11 +58,7 @@ int __must_check arm_iommu_unmap_page(struct domain *d, dfn_t dfn,
                                       unsigned int order,
                                       unsigned int *flush_flags)
 {
-    /*
-     * This function should only be used by gnttab code when the domain
-     * is direct mapped (i.e. gfn == mfn == dfn).
-     */
-    if ( !is_domain_direct_mapped(d) )
+    if ( !domain_use_host_layout(d) )
         return -EINVAL;
 
     return guest_physmap_remove_page(d, _gfn(dfn_x(dfn)), _mfn(dfn_x(dfn)),

base-commit: 2dee23ad966897cb8596e49f37e625bf483d544c
-- 
2.50.1


