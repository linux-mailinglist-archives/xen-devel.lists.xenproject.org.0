Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FAFFB0E6BB
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 00:52:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053032.1421784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueLpy-0003fi-10; Tue, 22 Jul 2025 22:51:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053032.1421784; Tue, 22 Jul 2025 22:51:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueLpx-0003e9-Tc; Tue, 22 Jul 2025 22:51:53 +0000
Received: by outflank-mailman (input) for mailman id 1053032;
 Tue, 22 Jul 2025 22:51:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=stB6=2D=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1ueLpw-0003Pj-Ja
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 22:51:52 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061d.outbound.protection.outlook.com
 [2a01:111:f403:200a::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7375006e-674e-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 00:51:51 +0200 (CEST)
Received: from MW4PR03CA0019.namprd03.prod.outlook.com (2603:10b6:303:8f::24)
 by DM4PR12MB7528.namprd12.prod.outlook.com (2603:10b6:8:110::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 22:51:44 +0000
Received: from BY1PEPF0001AE18.namprd04.prod.outlook.com
 (2603:10b6:303:8f:cafe::46) by MW4PR03CA0019.outlook.office365.com
 (2603:10b6:303:8f::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Tue,
 22 Jul 2025 22:51:44 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE18.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 22:51:43 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 17:51:42 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 17:51:42 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 22 Jul 2025 17:51:41 -0500
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
X-Inumbo-ID: 7375006e-674e-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EVCaUOlCe1k8jT/BmCYYOhNBE4S/HLTf6JMUfjgAHkSgmRmKtOjrOg4qMssh8GclABiL/2+aNKAjdBWuAhQO8JFwBHMkcJd0ERX/HBZCG0Dml2mYjTKo53oOSJF4NttP9R+0Rm0dyiXA8NKDeSBP2YFCy8EqnFs1GnAaxToDeHe4FVcnoL6H45jhjysU6mWCXtiA93c48YuV9GdO1ib5ui/3KlGiz5vsthlqcRBlgiOfsw4ntT+LPr4WhnRCY7wEQn+K0PiVWzsNupPTLQO37ka13V1Fr1JZJMpam9E2r5X1a3Gs8vtgTuamC9DjrNu2OZHEpsaeMm+tBBLMB9yb6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=odzuwLMUbjumx7YA9q/tHmH+rdqA+R4OdgxxOO9c9Ks=;
 b=UjhQTUAkyy3FCIg/K5qWSvl11Z092YS+tAgNHl4SFYbj6o8WFEPBZ1TuDYbPUNXapp38PMmPzdhIaFKSkr+NjRexjyxZQC/ITqY4lfTpw463GL12435dBHb3m2VWmAuIqUZZMHo4Hldlgi278uHcIwr8QHFT3+5yXuyZQZIh268JOzPibREinqy/PXqh76mmqWVvYdkrwVNijqVXiI/DMasXSsUPqdU/SA1VG8O9hxIj2D1qPXZgQc4SJGXg2hZXjSZD0GYh/oWfGTNCNYYeOYA2+VUgp4NzSvsS3bhJDuzaNlhP8HqjHysgyShjkuB7FNttcouj13TOvAc95pm8GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=odzuwLMUbjumx7YA9q/tHmH+rdqA+R4OdgxxOO9c9Ks=;
 b=R2iHA0SA49hZY9khCnSrWZvTkB8JTCEdKq1SJYxbyB3BMtAXtwkMW+hnwVERDTRi1dTnYXcNgfN+xWLUDlM1G2LIl1vWFKCqvedi6LXhEzWmkb9vHxUL6tv0sPP2tI/BarzSe022pRCVyJxFLKkEnBxzep+c0fOSsdLMqpHPaSM=
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
Subject: [PATCH v3 2/2] xen/arm: allow translated iommu mappings
Date: Tue, 22 Jul 2025 18:51:25 -0400
Message-ID: <20250722225127.81390-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250722225127.81390-1-stewart.hildebrand@amd.com>
References: <20250722225127.81390-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE18:EE_|DM4PR12MB7528:EE_
X-MS-Office365-Filtering-Correlation-Id: 72553619-fbb9-4235-3dc6-08ddc9725439
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?dYTELft4W/bmrGNuYAjJAX6Suasaa0F8VyPPDnETIx7IqTZ4qR6x+ck3XFKD?=
 =?us-ascii?Q?/I2DBHeNQSMHUGYnxtJ63HXHU3wGkW0dK3WpFh5WP6b519/slcWjiWpsyGcb?=
 =?us-ascii?Q?0aeS7TjfQSARKsEzgxHc8afVoQYLos8wWB1XFQ5GxpXDQdXwh46+hAnFYY4k?=
 =?us-ascii?Q?Tp/jatoisCdmSthJ+jO3X10/yL2tMlFDbI2750qU319BWvOgtwxcIT50vPdr?=
 =?us-ascii?Q?SsdNP2CrkSMkhzHB+ywgu1I+CFL7IHyCxf7iax1UA6r4w0g91QIXzxKplM6Z?=
 =?us-ascii?Q?j3PPEWO5ZIK334EeXauCWh/Z2gRjgfRZgkXDt1IcTYb4lfbu7Oomm8Wn979F?=
 =?us-ascii?Q?dSs6yrjL7A1IUtDjZxL96SEfFMatOvSsKWh5MFr5COLp7OACzDKCR59XGtRq?=
 =?us-ascii?Q?MdsB8xR8dGkg3KDXMuBX8Apci8qsPOLnCyzJDVOt6p+jCwwVnqLF1ldBqaMn?=
 =?us-ascii?Q?J+9GypIddoBI7ue2uXDDlmYjRCXw7om/1rWgcs5Qo2Qt1paAXJLFJkpqjH3x?=
 =?us-ascii?Q?KNnAu1zrO452o1FucUaM0lWNomv3Xk4Y71WPwKVlypt/BrlTe9gylEsgfzVC?=
 =?us-ascii?Q?0v/Q+bqfTREGrrBss843zbs91OBAHd6plTIY7mdALUJ9TjPaMndl8z661Jdk?=
 =?us-ascii?Q?vpkRn69U+LnOHBY6mB374zoKNjSWLxnu8BkqauizEPjHvVkS7hmSrrvQnna7?=
 =?us-ascii?Q?DCdIfM9SKZ2bAw9rWFYqhPKkY1JJi6Ro2U9GUKAevaIgtSbx5E/om573l0dS?=
 =?us-ascii?Q?gVzNYWX+i19ds/Iag3tdInrWyr1+0AEOw2NFfO7zhzkkJz3yA9pkVKaMJekS?=
 =?us-ascii?Q?8a59MC+6RPmDLItdRTwySvZFLpkQF1Ui6NjoDI9WnxvoH+PJKmWmMQoDJAeB?=
 =?us-ascii?Q?JlrcoLTwIiWn+hyfyz25aBz57CdP8oojhh17Ut0+wIJTwdnHsYRnKMfqWJRV?=
 =?us-ascii?Q?mMuFGIDKdDOL7hhYU/DOgHNOzAIa4gcrDdYwzeJNcMtfE4NSC1Bdclp1zbBy?=
 =?us-ascii?Q?i4Dq2WfIJWsNct2MAI9mZYdlxt3uW0KhQEcDTLVfrwjc6QspaZYlBKM1AK6N?=
 =?us-ascii?Q?sEdg71h8NtBzKv9kBfi5+QfV7BCNH2HgZ7YCcYxcF39cYag8Djc2T36iNpHz?=
 =?us-ascii?Q?LDHn2yDeNTkbiHaMXJwRaQOvovpPvf+yHcXU470x4uEcRM7DDI4vPmV4rnWv?=
 =?us-ascii?Q?rcVPwEt6Hv/tG6euIZdkPQmR+UByJjIYwQwpKKAiMvrRb9DQOqJOlcf5DdBV?=
 =?us-ascii?Q?o+fADq+ueoVcv7PJhAEAWYCro9hIW3SntwKHrbZDk7ijqvVfAEaBVffBK4q5?=
 =?us-ascii?Q?OtuPFRrFDG5GDYCIuscLNh7aar5/4ypIf8/MNiIVu3RSLfoKR3Y/1AG2QevJ?=
 =?us-ascii?Q?Ha3L50Bup9r5Do6hgn2zRLR9+7cXCkV4H3ENFi4e1h8JyEg4R/qRYJ6yCAim?=
 =?us-ascii?Q?pQRz18v40fXy8c2LCVF1rokJeh7HZADG8Lprt1qUyu96E1McDjLBk14Mrtam?=
 =?us-ascii?Q?szGUn6EsRpsXDS/9/2GtX4cdzkFe5kEo+53z?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 22:51:43.1634
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72553619-fbb9-4235-3dc6-08ddc9725439
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF0001AE18.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7528

From: Stefano Stabellini <stefano.stabellini@amd.com>

In preparation of exposing vITS to domUs, generalize arm_iommu_map_page
and arm_iommu_unmap_page to allow ITS doorbell mappings with dfn != mfn.

The mfn does not need to be passed to guest_physmap_remove_page since
there is no mfn checking on the p2m_iommu_map_{rw,ro} p2m types during
unmap. Pass INVALID_MFN to guest_physmap_remove_page.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
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


