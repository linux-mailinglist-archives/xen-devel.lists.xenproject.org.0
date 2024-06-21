Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D5F91173A
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jun 2024 02:21:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744930.1152052 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKS1x-0004qO-4k; Fri, 21 Jun 2024 00:21:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744930.1152052; Fri, 21 Jun 2024 00:21:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKS1x-0004o8-1H; Fri, 21 Jun 2024 00:21:29 +0000
Received: by outflank-mailman (input) for mailman id 744930;
 Fri, 21 Jun 2024 00:21:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=drXV=NX=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1sKS1v-0004nl-BO
 for xen-devel@lists.xenproject.org; Fri, 21 Jun 2024 00:21:27 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061a.outbound.protection.outlook.com
 [2a01:111:f403:2009::61a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31818b8b-2f64-11ef-90a3-e314d9c70b13;
 Fri, 21 Jun 2024 02:21:25 +0200 (CEST)
Received: from BN9PR03CA0085.namprd03.prod.outlook.com (2603:10b6:408:fc::30)
 by SA0PR12MB4496.namprd12.prod.outlook.com (2603:10b6:806:9b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Fri, 21 Jun
 2024 00:21:22 +0000
Received: from BN3PEPF0000B06D.namprd21.prod.outlook.com
 (2603:10b6:408:fc:cafe::c1) by BN9PR03CA0085.outlook.office365.com
 (2603:10b6:408:fc::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.33 via Frontend
 Transport; Fri, 21 Jun 2024 00:21:21 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B06D.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7719.0 via Frontend Transport; Fri, 21 Jun 2024 00:21:20 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Jun
 2024 19:21:20 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Jun
 2024 19:21:20 -0500
Received: from xsjwoods50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Thu, 20 Jun 2024 19:21:19 -0500
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
X-Inumbo-ID: 31818b8b-2f64-11ef-90a3-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zk61pXsG9FqDEl5FulA1Vz3elwRIHugBhKHZ+6umFwl3ZvlMgVC94DnC7+IDQygWF2aZ9dB/7+cFzhXk70b8wYFvsWtiwX9UCYb01CbxQ/+bk1E+seftq3Kwgx9lLwMZfloR+SiwnhCHf5yNq6i0vAtC5PA6126i9gh0WbRGOHkImYNTljgdykV2cBNkWghUi9SCmPgahg01UfIqSWRTLWCSN3vE9nPERx7K5v/O7fGM7i2uyGFMhFGe6P69Tj6fiUVviDhAaYOak396BOKUzqXqoxXAn568mshq1NCtl0zHI7Io8wztlYXrE1qdNaG3f6X/qhlW3pjPDMrhjdxgQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vpxELYzvYWyx31e2HQRfcOug61WECZXw5QfrjJ9qZVA=;
 b=K/ZN8uNo8mbmbq2oEMx6OL1sY9GyNEQFcbpVGMt4YqIdPVFgln4EdQtUBOyQaQw3NNu1tkSf1hQfpElPwzWhxXnhdlz+hIBHm4X/sePZ8NbP/DrORflbehYUom1XgfgeHs6HOQsHdda/hAqHDELUlbAa4Z0C+wyCONqbsyl0j7SymlE7JxEPzYBv0JXaiqi1m8uvXA23aCFrat01hLwUtzQepUe2P+8K5ekp1w9UtPKN7DrOu3GDRctOQj09VXK8D5/6zJlogm/xbPl8FnHTnNF3ebqGlcmToeWTC94/9v+1m3ZUyBByfR5ASKC01wDpP1qtC2JIIuUelRlHer49xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vpxELYzvYWyx31e2HQRfcOug61WECZXw5QfrjJ9qZVA=;
 b=TrNtBvwAelRayBUKjiF+BJJfqWnga73uKVZaiVnWaZiwJToIc30CNibx5aMhR3pHBT1rR7MmYaodtx1NB56jrvCWm9fuxQ/ehE3c7wW+qUrqZR0S6fjT02h+DJZ7tccinTMZ9B28GooilF8Ciquxld3njT288Tt7UPHtSQQDH5w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Victor Lira <victorm.lira@amd.com>, "Stewart
 Hildebrand" <stewart.hildebrand@amd.com>, George Dunlap
	<george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>, "Juergen
 Gross" <jgross@suse.com>
Subject: [XEN PATCH] common/sched: address a violation of MISRA C Rule 8.8
Date: Thu, 20 Jun 2024 17:20:30 -0700
Message-ID: <5b6dfc7571bd76b5546d3881bd660a4e7a745409.1718928467.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.37.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06D:EE_|SA0PR12MB4496:EE_
X-MS-Office365-Filtering-Correlation-Id: 463a6245-b74d-41e6-dcab-08dc9188138d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|376011|82310400023|36860700010|1800799021;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Vl1tuuKaOnLtnLRBHLWWaaToJPoAuGjzctZeMoFntLsklB9g+JsBbbBI7KzY?=
 =?us-ascii?Q?V2GMCVNaSj2FO3vukHoCZPn5OjUs6f8OQLy4Mfto3xO81TjDDpeFumURRH1o?=
 =?us-ascii?Q?dEaTqSGav7Qr+by5rLFucWBlH3ETaJDjxr5Y2N7sMT4R8jxM87zA5PKvG0Ax?=
 =?us-ascii?Q?JUrdS/LnFjjSfnRfAx6NMwN/LU/tyBtzpzLem+nV5nqlYx+ff/vc5zR+Jq7H?=
 =?us-ascii?Q?FZ3z9h/FOblUYDje7+JTf/yJGu/NiZwze2XhmN3Yi6REHjuTsXmHV2Z0eZ9O?=
 =?us-ascii?Q?/L1QY726VCKNl6aFsv9Je9boZJgKTIckNYKATq8qcSEc5ZcjhCEQ21Hfc+63?=
 =?us-ascii?Q?1CEDJpMgTbGh2q2u+YS0/Y1fnT1ujtabeD8PfncGcVLULPFGNL4WC8AVPxax?=
 =?us-ascii?Q?r49MkQB+CDc69LRZWJZt4Qs9VQWq48lYUx/CPJwXpoL1IkAus6JkyMHyuYGP?=
 =?us-ascii?Q?6x0e8s0v44x15V9qRsjjw7l7Xe4BvOAY2pJOC0+mFlEkNzB28Y815dPPDjOL?=
 =?us-ascii?Q?ds0lC0HoXsVJK7QxbYm5hULrP2DsFrLegT0smZZia/yi0y/RVSizW6f2vJ9P?=
 =?us-ascii?Q?i/vHpT9MjsUDKfS2VkJft0ENLKUT2qcy1vXwQQx3X+ttdF5IA6ICdqO71D1x?=
 =?us-ascii?Q?YJscLXE2u9bBNO0qrDKy8q84oYjhmVrYiK9zhPAAH97L4JlaCJXaeDsyDdEu?=
 =?us-ascii?Q?NOABYQkKMoi1ZGSJltwHjLGJWEqBC5YugEuMBU2rajPh7LXXTRpaeOIX0VMJ?=
 =?us-ascii?Q?jKAVr9Pm0sKTiaZAB4fN6Wk4q5fP8+9Z5Qn+gB5obsNGZ1qhaWgRjNbgcSom?=
 =?us-ascii?Q?Th2saXx929V7JPG5Coj3I6LlYfURW0GM+3LyBCbghn4woV0IyJdWztE7fK7/?=
 =?us-ascii?Q?tW6p9uQS6W/E4P2a7k6cuslPrmwRGzVJtLWo+AdRQlp5JTJ4qEFFH3BnxMVG?=
 =?us-ascii?Q?XBPM0Ctqs8npZ44wYH+iZpKFn0ockvn7BNqB+mQWbhE+REZ43rzR8MX0lFG/?=
 =?us-ascii?Q?qeI4akBmYl251z63mbTfKohxPwEz15khgCpBwuaqLZI8IXGKT1ceLETH9Ywg?=
 =?us-ascii?Q?qFlbctvd0taSXM8tvS5Vjrkf+QXi8dH3bePpg0TTcyegppPQwmAtHoJ1uU3Z?=
 =?us-ascii?Q?mJQ85PmfpvOhwM7wfLaIpWR4ftvkg3jk3DdLr6CtLV5BKTiHjSC1b4KUJK4e?=
 =?us-ascii?Q?bRarxS8oUHkUI6Jwzg/iIf8gfoAm7kfsmevUC5Xws8vcFLdls9gXvrA/tN7t?=
 =?us-ascii?Q?nbJ+PSD4Fnp4QrobIKowKFeP2ggEfRNoTWZDZk2u558+rg5PnoLICZSIB9CS?=
 =?us-ascii?Q?CDXFXvY6MKxJHKPojTds7CBs7kYeXNn9vXurHUB0ktqEnI9+DNixUe8Z09UC?=
 =?us-ascii?Q?zuHzWJmkZ77UMziBvyVecsZb5migU+8gMbr9rjMF5Zc0KdAOqQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230037)(376011)(82310400023)(36860700010)(1800799021);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2024 00:21:20.8786
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 463a6245-b74d-41e6-dcab-08dc9188138d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4496

From: Victor Lira <victorm.lira@amd.com>

Rule 8.8: "The static storage class specifier shall be used in all
declarations of objects and functions that have internal linkage"

This patch fixes this by adding the static specifier.
No functional changes.

Reported-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Dario Faggioli <dfaggioli@suse.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
---
 xen/common/sched/credit2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
index 685929c290..10a32bd160 100644
--- a/xen/common/sched/credit2.c
+++ b/xen/common/sched/credit2.c
@@ -1476,7 +1476,7 @@ static inline void runq_remove(struct csched2_unit *svc)
     list_del_init(&svc->runq_elem);
 }
 
-void burn_credits(struct csched2_runqueue_data *rqd, struct csched2_unit *svc,
+static void burn_credits(struct csched2_runqueue_data *rqd, struct csched2_unit *svc,
                   s_time_t now);
 
 static inline void
@@ -1855,7 +1855,7 @@ static void reset_credit(int cpu, s_time_t now, struct csched2_unit *snext)
     /* No need to resort runqueue, as everyone's order should be the same. */
 }
 
-void burn_credits(struct csched2_runqueue_data *rqd,
+static void burn_credits(struct csched2_runqueue_data *rqd,
                   struct csched2_unit *svc, s_time_t now)
 {
     s_time_t delta;
-- 
2.37.6


