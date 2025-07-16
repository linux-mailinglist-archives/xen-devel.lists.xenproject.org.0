Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE27BB07F7B
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 23:22:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045772.1415973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc9Zx-0007LC-Vp; Wed, 16 Jul 2025 21:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045772.1415973; Wed, 16 Jul 2025 21:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc9Zx-0007Gi-RW; Wed, 16 Jul 2025 21:22:17 +0000
Received: by outflank-mailman (input) for mailman id 1045772;
 Wed, 16 Jul 2025 21:22:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XbuO=Z5=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uc9Zw-0007F7-Ge
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 21:22:16 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062d.outbound.protection.outlook.com
 [2a01:111:f403:200a::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f1304f1c-628a-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 23:22:15 +0200 (CEST)
Received: from MN2PR19CA0031.namprd19.prod.outlook.com (2603:10b6:208:178::44)
 by DM6PR12MB4468.namprd12.prod.outlook.com (2603:10b6:5:2ac::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 16 Jul
 2025 21:22:10 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:208:178:cafe::2f) by MN2PR19CA0031.outlook.office365.com
 (2603:10b6:208:178::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.19 via Frontend Transport; Wed,
 16 Jul 2025 21:22:10 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Wed, 16 Jul 2025 21:22:09 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 16:22:06 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Jul 2025 16:22:06 -0500
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
X-Inumbo-ID: f1304f1c-628a-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pc7u0fhp9ftcI03MaDLygqb/RKjNEtQngy7y+nv2ZfOdFahqvW3pVx8DAek7XW4ON11sFWpjpw5A1b6KW7vqyG0c3JL+vWcKzrLMoBXjhMW55uKSxJKAKpe0kc2q9oDdeh+Wj4Ec6ASLNP88Ro8gggxNiCs9uVx+Tci7JuM0L7x9RtOrL/qnXC06FOtY8XjEM/sQoMIO56v+jcSpAElxUdYlj1U/cD/V1a58laduR2wi5qyLyhvUZmCw927VXiUXxCx38WcOIK/vA3Y3+uSCl6/89VBDJIxaSrSlyU2tB5Tnz9y/78EKJFcFIzMHtwE5Nv3ACW3Iy2QECkOico6PjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0aY3FMYTuQ7tdFM3fGV+p5FWokH/Sbpk9Ft38bfAWK0=;
 b=LaqKN67jV7sJbRD2uEJkoLCftLYN7M1YbSjTpp/gWliE0uKW0PF8s1u5jqKy4JG7fB7E5HNczS96cqUGE1cmwhr5tO/GWtTBOJz4oNsPxKGK4FCQxUMcC9n3Bw7MvgDlVoX1FD5qLa2wR1v3YBlafYRs3gCzwy5iF2CbXbdPlYgA3cX58TQ7PbIW1qHmP46ZITcqhvMHvIZUWyEVHvDCBzJWHmXXMxtpflOX0/7yiFunon7mVvuKTPUD7qXb6JaCtLEXqq3Xz+05zTbUVu6n8yy/YzASjCJGA2F2BPDWmqGG+jPy92NPat8zTBSGmy0dSm2Vu4oiiQOhxbtp6Y1HqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0aY3FMYTuQ7tdFM3fGV+p5FWokH/Sbpk9Ft38bfAWK0=;
 b=fJFAu6tY3qncuQD4IbRBwa4lz8FQIuNQEL2TqKU6aczomH+B7uK8hSux3ADN2ZlxmncxAqD4uqfp1RyxMw2zzqFR5K2407qiuLl/XvUXyNQ9QXqD5d9HtINKLHjLNUePeDONzUx+01RtGvrEs8sDaMUeQy2IjwbFCRSgmt4Bu2w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH v2 02/17] xsm/silo: Support hardware & xenstore domains
Date: Wed, 16 Jul 2025 17:14:49 -0400
Message-ID: <20250716211504.291104-3-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250716211504.291104-1-jason.andryuk@amd.com>
References: <20250716211504.291104-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|DM6PR12MB4468:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c5f8a9b-1c58-4364-be4f-08ddc4aed2ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8QB4T+hlJl0wQ6nL5ymIrDHm6Efbdop2nC+6OV9KFN7ovQKbxNZ8OW2LW2HI?=
 =?us-ascii?Q?dZPGtzg3zhN8yCo3iHagbaZAH7cKYWYMHE2WJGwq4QJ/KJstJMXXSEb3cMBj?=
 =?us-ascii?Q?qK4IqemwxeVZYSFwuVjxxaZ9g4N0tMOeV2n4hgSEXtx+fjbmW0nIu+vzgv1x?=
 =?us-ascii?Q?NAgKMyacEquEMgQMsdG44gP5p+rOmv553sXSUkpzQn9abq5A6Rdn7yrfmRwb?=
 =?us-ascii?Q?+UQj1n7bQiYv0/AnijEhs1zTwVyZmO3oe0utUu8Tkn0gBNuwOCUyOpWrE/Fn?=
 =?us-ascii?Q?qo7FgtCAALUX8z2pRWHA6r4t+EFtSz57ZVqwweT2UF2ywuE9CEabQd38DG2p?=
 =?us-ascii?Q?lJJakj3WQ6jd78OgL427XIfBpjWaaFco0EkXJ2CCn5dIyrgjPr8gDgL54qiL?=
 =?us-ascii?Q?FlzGsBZBZuKIIQ9RpGOYNT5iMbQzaiLD6njDFhzEtU2THbZUUz68mGYpXx0/?=
 =?us-ascii?Q?iZ3xTlxSMZBcipCPpB5EoFZC8mUXy6XGOsDXSX7xj4tz1Oo4yIKsll42IqDc?=
 =?us-ascii?Q?NjPNPxB6IjlhizQx36sajSDTNxtBkPkHx3By7NTxgcCFwnhlOFqacVBWcCIn?=
 =?us-ascii?Q?UGhbyjKhG5N8n2XHVVCUydQ3Ptof80psm3zMekrZWo6TO0hpI0Gstkyd5Lfe?=
 =?us-ascii?Q?7UVgf+Pon8NL9PDj2Y3sMe92Pb5H8C8ZZ5tRNwAWBD/Drzeg40OjUhu7Avbt?=
 =?us-ascii?Q?p7FKhUOvXXuuCeZXwflz12FM35kFmwQQjmF7mwS5oAKYcMarWM90RVQBg86r?=
 =?us-ascii?Q?t01zC8w0Mt+Bgu9hyWHb0cXmQuS5rTEXS1uLolmG1vOOq0/KUG9j1zxZAz7D?=
 =?us-ascii?Q?6XwXQAB7tp2SNAAzd/yppmG+gFp4HL60+eQKLt/RGQ2tYHqyN1iHvA+S6Jur?=
 =?us-ascii?Q?XZ2rwYuVBPKvI80lgnyNJm9PXmLPcTLwGCBbw3kpfsj9opYkZ1MP/l92DbfQ?=
 =?us-ascii?Q?LfWA3EU93g/C3g/QCTxorl4vxojPjEj/8igru0qnBVcoiDbsP0oiSc6cY6jk?=
 =?us-ascii?Q?CKi8OA0Eob8Y3qQSoVkhaWufblw8Lzy9zxogL1AknM+Zl8Msm6D8WSsOaBgw?=
 =?us-ascii?Q?tAAKIo/JZSEKY8EMgXeLoo2mzxW9wvOLlSSmDbCpNGwCsjDiVZUshu0hujXZ?=
 =?us-ascii?Q?SnHgejW2P0QTAnr6uO63HU+hP3JLTJA9SR2bAZdyJDpxkCpJhocwgrEAQge9?=
 =?us-ascii?Q?VFLX8T2SRLHc6iMiKYK3mBWXA0StwxTEetFdpkAFx6UKvdxGJIv744Uf/LQ1?=
 =?us-ascii?Q?A54nsLaedKiAeE0WRQfPvfgtorfoVLFdA+2NnEmadnJ/1NX2l2QQMWOWmyN7?=
 =?us-ascii?Q?OM1mrl+gAujp2q8GbbKL1JYQPm/R7APsMvzXzCxFyVpVL9xULrfwUgs7X4Bj?=
 =?us-ascii?Q?djYeDJd2fA2F3G27bpEH6phAUZC1X6htmNQ+4gveM0LWIZA5OPoPpQMimXab?=
 =?us-ascii?Q?ljBbIRa7IMFbMXYOZ3HKCDBKheUTlrHaNPn0ed9gIG12TRwUaxvzG0/fy8Hs?=
 =?us-ascii?Q?ZgAHoCdurnnVbjty/OAFAwdvYAnHWYiko6Nq?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 21:22:09.9372
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c5f8a9b-1c58-4364-be4f-08ddc4aed2ff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4468

In a disaggregated environment, dom0 is split into Control, Hardware,
and Xenstore domains, along with domUs.  The is_control_domain() check
is not sufficient to handle all these cases.  Add is_priv_domain() to
support allowing for the various domains.

The purpose of SILO mode is to prevent domUs from interacting with each
other.  But dom0 was allowed to communicate with domUs to provide
services.

To provide xenstore connections, the Xenstore domain must be allowed to
connect via grants and event channels.  Xenstore domain must also be
allowed to connect to Control and Hardware to provide xenstore to them.

Hardware domain will provide PV devices to domains, so it must be
allowed to connect to domains.

That leaves Control.  Xenstore and Hardware would already allow access
to Control, so it can obtain services that way.  Control should be
"privileged", which would mean it can make the connections.  But with
Xenstore and Hardware providing their services to domUs, there may not
be a reason to allow Control to use grants or event channels with domUs.

This silo check is for grants, event channels and argo.  The dummy
policy handles other calls, so Hardware is prevented from foreign
mapping Control's memory with that.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v2:
Use single evaluate_nospec() for checks.
Remove Control
Add xenstore domain
Expand commit message
Remove always_inline
---
 xen/xsm/silo.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/xen/xsm/silo.c b/xen/xsm/silo.c
index b89b364287..b392f32507 100644
--- a/xen/xsm/silo.c
+++ b/xen/xsm/silo.c
@@ -20,6 +20,17 @@
 #define XSM_NO_WRAPPERS
 #include <xsm/dummy.h>
 
+static bool is_priv_domain(const struct domain *d)
+{
+    /*
+     * Open coding of:
+     *    is_xenstore_domain(d) || is_hardware_domain(d)
+     * to place all within one speculative barrier.
+     */
+    return evaluate_nospec((d->options & XEN_DOMCTL_CDF_xs_domain) ||
+                           d == hardware_domain);
+}
+
 /*
  * Check if inter-domain communication is allowed.
  * Return true when pass check.
@@ -29,8 +40,8 @@ static bool silo_mode_dom_check(const struct domain *ldom,
 {
     const struct domain *currd = current->domain;
 
-    return (is_control_domain(currd) || is_control_domain(ldom) ||
-            is_control_domain(rdom) || ldom == rdom);
+    return (is_priv_domain(currd) || is_priv_domain(ldom) ||
+            is_priv_domain(rdom) || ldom == rdom);
 }
 
 static int cf_check silo_evtchn_unbound(
-- 
2.50.0


