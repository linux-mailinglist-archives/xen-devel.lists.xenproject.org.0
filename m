Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73253B01028
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 02:25:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040009.1411496 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua1Zn-0003Xs-46; Fri, 11 Jul 2025 00:25:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040009.1411496; Fri, 11 Jul 2025 00:25:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua1Zn-0003WN-05; Fri, 11 Jul 2025 00:25:19 +0000
Received: by outflank-mailman (input) for mailman id 1040009;
 Fri, 11 Jul 2025 00:25:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qphH=ZY=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1ua1Zl-0003WH-Fy
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 00:25:17 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20627.outbound.protection.outlook.com
 [2a01:111:f403:2415::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8382352e-5ded-11f0-a318-13f23c93f187;
 Fri, 11 Jul 2025 02:25:15 +0200 (CEST)
Received: from DS7PR03CA0066.namprd03.prod.outlook.com (2603:10b6:5:3bb::11)
 by BY5PR12MB4067.namprd12.prod.outlook.com (2603:10b6:a03:212::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.24; Fri, 11 Jul
 2025 00:25:10 +0000
Received: from DS1PEPF0001709B.namprd05.prod.outlook.com
 (2603:10b6:5:3bb:cafe::34) by DS7PR03CA0066.outlook.office365.com
 (2603:10b6:5:3bb::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via Frontend Transport; Fri,
 11 Jul 2025 00:25:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709B.mail.protection.outlook.com (10.167.18.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Fri, 11 Jul 2025 00:25:09 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Jul
 2025 19:25:08 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Jul
 2025 19:25:07 -0500
Received: from ubuntu-20.04.2-arm64.shared (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 10 Jul 2025 19:25:06 -0500
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
X-Inumbo-ID: 8382352e-5ded-11f0-a318-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ycr7pKfagT7hlYb4sDjyaIsWQrsAP31I702VE+Ktd4JRxOAn8EvTQEOaHlHWR5ahNFEo4t65QzBXVglF2Lirljr2afUaGmo6MqRrq1q2iSCP23ahMtxyBNwc2UTCtExmfyEWe3gsOl8I0aP1w+TS35OL0LZ3FAAoS4HfGknbEtUf6EOjPlDNsR346Ji2F3W/xwLpkygYcN0HU+DYqQskqcT9nhR+C+hM/CWBMfJUyTmVfeh6ohEi9yVPTV4Elb6fTKTVTfuxXJu/DdY4FnWZQItQJW5ucCGrCUmjHLjKDQC7NX+35N9IbRnoNaVqIyna1q74cB2IEkmlaxMdRUaIOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJOUJVuqDeVm4e/RFbpZ3pToTtnx3zgcWatOfvA8u7k=;
 b=ITq2fxj3xQ+VnPo+aJrLewYTW17bme706SXDPIC/oVePuVDuLJ4RPhdHc5zeoDSXAql9g25x0hMvT3G5xVUswW3ZW+Z8xtva20xTrCEfG03aC+66l8Gzl46WVKW6ab3OEqDkTfYR56WrnYfZDbS5VYWJpkkDvPTWoiHlFPJXJcbYxpUcdXlv5EcqP/dtkSLwz9Px0/OYi1DDh8JmmicTkrRcM3cQtwpj5RqNB8o2g8vsEKIFg6tig+T8zY1m1vPfdfiJPcNApLUpK8w4qSPnU5KMPmbo6Jg9ofd35bIl9n2SuakjQ2GT3Mtoz2+F1aHMtwanTkTClBul1nQK/i2VYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJOUJVuqDeVm4e/RFbpZ3pToTtnx3zgcWatOfvA8u7k=;
 b=5Jf/sWa3VsWRlDBmgS5G4RjnGlWT03mBfZcehL7vIgrYdWFw+NhAgB5QGU/fr0Z3ELHSCWuRxZ3rn2X4sBGp0WPuKF2Kb0vYTrnS+clA28UuAbHSQlnuJvPZQKf/DSCPO8o/xTQ897Kcyk4OqWFFPQ+LfJNI4nxl4YEkATqbMeA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Date: Thu, 10 Jul 2025 17:25:06 -0700
From: Stefano Stabellini <stefano.stabellini@amd.com>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: <xen-devel@lists.xenproject.org>
CC: Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Rahul Singh <rahul.singh@arm.com>,
	<jason.andryuk@amd.com>, <stewart.hildebrand@amd.com>,
	<stefano.stabellini@amd.com>
Subject: [PATCH v2] xen/arm: fix arm_iommu_map_page after f9f6b22ab
Message-ID: <alpine.DEB.2.22.394.2507101724180.605088@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: None (SATLEXMB05.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709B:EE_|BY5PR12MB4067:EE_
X-MS-Office365-Filtering-Correlation-Id: c186fb01-2f27-4477-cef7-08ddc011651e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2oOZoD+2XY2WhmksrVYAhngnlPnvqB1UzV2GgtObBA8zzxyqoHkF36ayqD5X?=
 =?us-ascii?Q?Oz/TSOvLRJCA0G+YAQCE0p384A/9ySw+g0QGI56MK9BHQpsqVIyVRFSoTG+2?=
 =?us-ascii?Q?H9Km3Feupmq4erDBPKRsuye0VYgiwa51zQYL4/kcRjpQTIo8QSM8pHavJCkX?=
 =?us-ascii?Q?Xc3fHI008N0fmgqg5xNGplW337U2ttm8gMXncI6OzrKp1LbqDZcfK6zeXDXP?=
 =?us-ascii?Q?CXoFG9TbtiAKkF0FzO1PYYFpk37J61nJHiEAzCVpZeKGtsc3HnJHS8UnTvV+?=
 =?us-ascii?Q?TS3cMxmPxIL9OH8c7WJK4ulZrawSS0IR41zzd9PYwF8S5Gy+vR63FreayFTk?=
 =?us-ascii?Q?irJICuTWBbQ7QkfbdYIPqEPLwnm+/RqJ/7VfrkkMffF4AlywR/9DkffqAh/1?=
 =?us-ascii?Q?dkJc37hcav0X8pHfOh8FUvpGG+rsb1q3080zxnSb2wAJNJwMQX6LsY0xswlk?=
 =?us-ascii?Q?L9AWMyJgVR7NakznrKLFGTbT86OpCD3kUa/PrtijjWBhTPdJWDqVRzB4cJZv?=
 =?us-ascii?Q?OvVolIYzDLeftvNc2+YXwqFwjKljP2uA8jiOMRBFqjtBcx9L7upgD6Iu3kWi?=
 =?us-ascii?Q?K6hHp6vky+Ypq9HinP/ly4/mOtaga1Qg3XZXyk2HOD+GKQA/rhasBgUDzFkE?=
 =?us-ascii?Q?TBfW9BbV+a/1mesW+WsaR2b+O/dJTxiSkG3h/lb5wMSKnMzEMgGSYthdrsIZ?=
 =?us-ascii?Q?ONrOtFomy8yD3OPvTmI2cFHg0p1XEMGHa35B12dI4xlOzZnIZQofpNlQFT+h?=
 =?us-ascii?Q?ehQIbV0UOYiovh6IBZtzjmXg3p/O0WkboWchBezSlZ6peVj75xkJYbp65aio?=
 =?us-ascii?Q?raEKsteCt4L8zt3KbFEWUPKQIu9SToPhc7+fo/ej924MbxF0AfrfvLaT5m+v?=
 =?us-ascii?Q?CLjtMeco521n+w8nj8gPojsrJ5gxLpcrmXvKXOFKgM6Yc4EQlF9jtNqEKI7v?=
 =?us-ascii?Q?ishqdCZFKQQ1D9erl9NyTt5spVt/VqaWHo50A31Qblvbg8iNJ6s4CANJL/32?=
 =?us-ascii?Q?qYzUpq6fSJNL+A4Z0kRRhzf5t07ux9oI7d4qcN9zQnC9eFvPZV8ydFjFUWcg?=
 =?us-ascii?Q?fL41F+NEdg+DpQl/CTm4ojCAPlRew4Xf4n7Nl4pVmtW+aYUupqUxxAfcFV4x?=
 =?us-ascii?Q?UqYAOdwUv6IixLddXWLu/eEDgAFn1JgBPPMeifyuUu2JDk6CVRUsn5yZC4z2?=
 =?us-ascii?Q?7DaBXxeRTvDt1BvIdtswxGbBgha2W/BRQAXfq32EFIx4+dEdwPhV7zSp/1oU?=
 =?us-ascii?Q?AP1eUZ1InGV1Nr7AJ14JI+CIrxIG6slMSzhl+YAYk4hpz9JiFiQNZOxxP/mw?=
 =?us-ascii?Q?gckCxmvxNz6MRDu+A21veTOlX8NKPz9CVQ7qMXIBs4F02b0Qw5/glO7bRfSo?=
 =?us-ascii?Q?x76dvu1iXK7L3PoETVE7urtkrLSzRzlsPYnWMqVehD6ZQJDTRVk5aEqc5Jr7?=
 =?us-ascii?Q?C6uv316YqvYAFT3CXYzCvFX3tiyBPr0gXGc/IaBY+AZfuNoIk3160Tz0AHBh?=
 =?us-ascii?Q?eiRttHUlM9NKL1WuHv1fRxjoYb1GDuUn0V55?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 00:25:09.9605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c186fb01-2f27-4477-cef7-08ddc011651e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4067

Up until f9f6b22ab "xen/arm: Map ITS doorbell register to IOMMU page
tables" the only caller of iommu_map on ARM was grant_table.c which has
a specific usage model and restrictions as described by the in-code
comment in arm_iommu_map_page.

f9f6b22ab introduced a second caller to iommu_map on ARM:
vgic_v3_its_init_virtual. This specific statement in the
f9f6b22ab commit message is wrong:

"Note that the 1:1 check in arm_iommu_map_page remains for now, as
virtual ITSes are currently only created for hwdom where the doorbell
mapping is always 1:1."

Leading to crashes any time the hardware domain is not direct-mapped
(e.g. cache coloring and non-Dom0 hardware domain):

(XEN) Xen BUG at drivers/passthrough/arm/iommu_helpers.c:49
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

At a minimum, we need to change the is_domain_direct_mapped(d) check in
arm_iommu_map_page into a domain_use_host_layout(d) check. But in
preparation of exposing vITS to domUs, let's take this opportunity to
generalize the arm_iommu_map_page function further to be more generic
and unopinionated. Move the in-code comment specific to the grant table
can live in grant-table.c instead.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 xen/common/grant_table.c                    | 10 ++++++++--
 xen/drivers/passthrough/arm/iommu_helpers.c | 13 +------------
 2 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index cf131c43a1..2e08dac656 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -1274,8 +1274,14 @@ map_grant_ref(
         }
 
         /*
-         * We're not translated, so we know that dfns and mfns are
-         * the same things, so the IOMMU entry is always 1-to-1.
+         * Grant mappings can be used for DMA requests. The dev_bus_addr
+         * returned by the hypercall is the MFN (not the IPA). For
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
index 5cb1987481..dae5fc0caa 100644
--- a/xen/drivers/passthrough/arm/iommu_helpers.c
+++ b/xen/drivers/passthrough/arm/iommu_helpers.c
@@ -36,17 +36,6 @@ int __must_check arm_iommu_map_page(struct domain *d, dfn_t dfn, mfn_t mfn,
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
-    BUG_ON(mfn_x(mfn) != dfn_x(dfn));
-
     /* We only support readable and writable flags */
     if ( !(flags & (IOMMUF_readable | IOMMUF_writable)) )
         return -EINVAL;
@@ -57,7 +46,7 @@ int __must_check arm_iommu_map_page(struct domain *d, dfn_t dfn, mfn_t mfn,
      * The function guest_physmap_add_entry replaces the current mapping
      * if there is already one...
      */
-    return guest_physmap_add_entry(d, _gfn(dfn_x(dfn)), _mfn(dfn_x(dfn)),
+    return guest_physmap_add_entry(d, _gfn(dfn_x(dfn)), mfn,
                                    IOMMUF_order(flags), t);
 }
 
-- 
2.25.1


