Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6299EB07F74
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 23:22:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045778.1416013 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc9aC-0008St-Az; Wed, 16 Jul 2025 21:22:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045778.1416013; Wed, 16 Jul 2025 21:22:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc9aC-0008Np-2U; Wed, 16 Jul 2025 21:22:32 +0000
Received: by outflank-mailman (input) for mailman id 1045778;
 Wed, 16 Jul 2025 21:22:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XbuO=Z5=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uc9aA-0007F2-4v
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 21:22:30 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20631.outbound.protection.outlook.com
 [2a01:111:f403:2407::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f92d37ba-628a-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 23:22:28 +0200 (CEST)
Received: from BL1PR13CA0325.namprd13.prod.outlook.com (2603:10b6:208:2c1::30)
 by DM6PR12MB4140.namprd12.prod.outlook.com (2603:10b6:5:221::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Wed, 16 Jul
 2025 21:22:25 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:208:2c1:cafe::3d) by BL1PR13CA0325.outlook.office365.com
 (2603:10b6:208:2c1::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.12 via Frontend Transport; Wed,
 16 Jul 2025 21:22:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Wed, 16 Jul 2025 21:22:24 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 16:22:11 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Jul 2025 16:22:10 -0500
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
X-Inumbo-ID: f92d37ba-628a-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NAzuXxw9ukkiGgpUpJwKnOgtwnp5pmGd3Y42MAyrjrgMKjVIC+MhwQvCkx7yI+ufWQh2TpzftCu4vNEDWJ13cZ/ULV+T/2h/YNRJ0NnONEAzFABa68BA+PEbtQUv63EoT6jU9KsCX2JWzZry4Hyg5U56tPGhyC1ODaw8ty1I0PAdWDGORN18NmV49ltaqYrBrFAwWFQGuFpHCZAGo6CaUD9Njwf3r+gBZxGMr9Bk8EfcFQc1PInolq7u+eVpMaxeF6byATe28bKt2ELVo1tFE+poBPoGaYzYS1xji+/F/NQ5UkEe+cjM9vBlToOvkhM+EAkDMi3I5m6gW8LV6hFmvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=flbFdc0ODgOl/ffFodWP5kfJpi5M4Vh460vEQRALjBE=;
 b=xv2CGAka7OvWhw+hnK4eEU0Jv/rVnY6yOP4t1j419z8Fa8j06u/Ouu+fNkIoEQHzHzPx/+vqfFyDLg8+MnsLyG1GyjCvuELxMynAafUSDtIKU6VtJAi6v4dHwf8xEms68R5WyuRVHGmbJA/kiWeyKyXoTYFPcrFyGHXkGHdP6RA7BX5rPsw8Ax6oRGKYzjfFVN9dxaRvierK1ua05tU/a1zlz/8Sgo6mI9WgSQRXP2rsFBGjdEeEt2YSWa9CDb9hSgITXQCgfLLNKhYosugI+kZogdVbgBifOiSJaw0VKZE412QcbGeKayunNE/klAGxx4CB7eRFM8Wyuacm4fI5dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=flbFdc0ODgOl/ffFodWP5kfJpi5M4Vh460vEQRALjBE=;
 b=2/+lgIFs/6BsnzEP2ozotFZk2ElrSbK99qUgpQfREzovFlFZb5bLrHg/XLZFrVeoeBSkhJ6xQu9CNSSW2Mt2eQP7k83vXDQjfLqdtSreovFD83OZqeCXD9Ap4+X0+SpPY0wahXC9rPlLArgFR+sin+2cNW/87BVVo6GRK1TBlEM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v2 05/17] xen/dom0less: Workaround XSM for evtchn_alloc_unbound
Date: Wed, 16 Jul 2025 17:14:52 -0400
Message-ID: <20250716211504.291104-6-jason.andryuk@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|DM6PR12MB4140:EE_
X-MS-Office365-Filtering-Correlation-Id: eb8176d5-b36a-4370-c923-08ddc4aedbb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0MpSp7yZ6SSqOyGOaxlPJ1B5zSFxv+8Gwp8uifpvK5IKrEzDjlNlzDFCchmb?=
 =?us-ascii?Q?5Kd2BYn0Lwws34bey53W9W5LdvtkfPepzPVexI34LdpkDjMZLrdInzZT5hnV?=
 =?us-ascii?Q?7bjnDaVpY/lkJ37hfCXFk2pi+Q3RpIlhwBFatr4YioLeZq7kP7kTuiXujLAg?=
 =?us-ascii?Q?cJ4BzpCvXNEiD00kRTABq7IlndtO63z/9rBEveTBxJGg3kec9uC/ryAxphp9?=
 =?us-ascii?Q?zXK2c9p49rb0jWPnP279++6RPO1UOOPbGFfJIkyQ1/6bdTeEYyGdbBB2Dm08?=
 =?us-ascii?Q?p4A/EWcrVD3vzv8PT3205S82R8qSGtL4Jf5R57+3xefNPcDQ2gMN73I4ORRH?=
 =?us-ascii?Q?AnmxyErF4Uv5t+VR6pRTn89+LPS4WlCrsFSb7oCA0CK647xl/WBfv8cRmiat?=
 =?us-ascii?Q?G0fOhLpZL+jNxZ8/P1O82i21vxDEd+IDY9xE35ZxGEVe6ra+t1w8X+UHwEWv?=
 =?us-ascii?Q?t6/5AJslc4B/TG2uk875FT62PN9gkMZ10rpRGWbl6hqat6LCZO/irRxlCFv9?=
 =?us-ascii?Q?65/JjAMs5U9fVhVnIaQBzlSxAHuKHHME9ZRFBrXfpNjX72/yOuk4osEQzgYN?=
 =?us-ascii?Q?E87CoOWpDBBGbuodLQr+xeytmuDPdshWEa4X+0VTCvc/aOnANG9vKFyi6I9J?=
 =?us-ascii?Q?2basWnMUBuk/nBsNrz9VI5c9cSdSH4S9GKuYwPA4fPMbjYL/TuLNYjD7RC78?=
 =?us-ascii?Q?76Snp7Ujs48bz8IhkB0pfTyLXXO54WcVRS048xXrEaR7qvjfV0xmIDQNi+B+?=
 =?us-ascii?Q?GMDcMigbytljj/cHTkR0EHbODG5ejcTTXgg4LJTGpBJnslEn2b2VM9I6U6HA?=
 =?us-ascii?Q?y40neD0U3cbghmKrvUBoJwzaXEYn1Z+scQuOdCEtLHRCuLE1o4CVeTL5lW1M?=
 =?us-ascii?Q?sDeo3vX4iRUOhCFqs5HGt2YiUEKVHMtG5LgjGrxMS5VDoU2NTwq9ao8u6bi/?=
 =?us-ascii?Q?C77RwxyGWlxMF/3f1Ckk24MHSjDKQsPtvPvho0Bv6L0OWKuKMHrtayMytxVo?=
 =?us-ascii?Q?nhorHDXalDKqNmfCGROR4oKv7aFYU6VuqRWoeenvvLEpihvK1twO4VSj/LYr?=
 =?us-ascii?Q?nGsetpKHn8mfMUlRBQUf6djWlHhUL5E+x0+8Rry0ojAKfcsy59Qud/F97MIF?=
 =?us-ascii?Q?B1JZ4t7Tk36jME+oWe1iJNh6o3PtLttLEndqvaj4Wa1GBM1dkvDjVTqWDAc6?=
 =?us-ascii?Q?5EtM6NHeHHKdNykNY7ULWDSO23dksXkR7EYYwvI97XKkQ43sKkXydZiFimZ2?=
 =?us-ascii?Q?nR/rEBQp5k1hIZTLq+/aQwkJM32HolVUG8P200o6u7jz7oRGYeOQKG2J/1xR?=
 =?us-ascii?Q?+v7f2NJfOJqdDiAmmVnOi17eHRBLihPjnB8DVQ6IxltsaLGiypkndZeYWSh3?=
 =?us-ascii?Q?3/QPxKtviQYi2ZOSyhpsy2dVXf/wFEE+rJM1kJHYb9kQ7Ze8nWIB6TlOQUQn?=
 =?us-ascii?Q?8kzwUNYJzAUtXpc0Ywmlii6juwRhi/fT4Fh6OMSIucyarDbcFFvFGERBcGQd?=
 =?us-ascii?Q?49HDNX+capGhFFdsl2Km4+TDlnLFnZyWJZpJ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 21:22:24.5246
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb8176d5-b36a-4370-c923-08ddc4aedbb1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4140

When used with an untargetable domain, xsm_evtchn_unbound fails even
though the idle domain has is_privileged = true.  Switch current to the
domain under construction so that event channel creation is allowed as
XSM_TARGET.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v2:
New

This was Jan's suggestion when dom0less originally had trouble with
evtchn_alloc_unbound() and xsm_set_system_active() was introduced.  As
noted, is_privileged is insufficient for operating on an untargetable
domain.
---
 xen/common/device-tree/dom0less-build.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 22af043aa5..a2789e3bdf 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -77,11 +77,20 @@ bool __init is_dom0less_mode(void)
 static int __init alloc_xenstore_evtchn(struct domain *d)
 {
     evtchn_alloc_unbound_t alloc;
+    struct vcpu *old_current;
     int rc;
 
     alloc.dom = d->domain_id;
     alloc.remote_dom = xs_domid;
+    /*
+     * Switch current from the Xen idle vcpu to the domain's vcpu.  This is to
+     * pass the xsm_evtchn_unbound() check for an untargetable domain.
+     */
+    old_current = current;
+    set_current(d->vcpu[0]);
     rc = evtchn_alloc_unbound(&alloc, 0);
+    /* Restore Xen idle vcpu. */
+    set_current(old_current);
     if ( rc )
     {
         printk("Failed allocating event channel for domain\n");
-- 
2.50.0


