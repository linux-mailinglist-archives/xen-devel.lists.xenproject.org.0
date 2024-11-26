Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D729D958E
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2024 11:27:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.843531.1259139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFsmv-0000r1-Bb; Tue, 26 Nov 2024 10:27:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 843531.1259139; Tue, 26 Nov 2024 10:27:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFsmv-0000pB-92; Tue, 26 Nov 2024 10:27:21 +0000
Received: by outflank-mailman (input) for mailman id 843531;
 Tue, 26 Nov 2024 10:27:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4efj=SV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tFsmt-0000p5-IZ
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 10:27:19 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2415::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ff3d3882-abe0-11ef-a0cd-8be0dac302b0;
 Tue, 26 Nov 2024 11:27:12 +0100 (CET)
Received: from MN2PR07CA0030.namprd07.prod.outlook.com (2603:10b6:208:1a0::40)
 by PH7PR12MB7456.namprd12.prod.outlook.com (2603:10b6:510:20f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Tue, 26 Nov
 2024 10:27:08 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:208:1a0:cafe::60) by MN2PR07CA0030.outlook.office365.com
 (2603:10b6:208:1a0::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.20 via Frontend Transport; Tue,
 26 Nov 2024 10:27:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.0 via Frontend Transport; Tue, 26 Nov 2024 10:27:06 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Nov
 2024 04:27:03 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Nov
 2024 04:27:03 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 26 Nov 2024 04:27:01 -0600
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
X-Inumbo-ID: ff3d3882-abe0-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNTo6NjFmIiwiaGVsbyI6Ik5BTTExLURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImZmM2QzODgyLWFiZTAtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNjE2ODMyLjg2OTI4OSwic2VuZGVyIjoibWljaGFsLm9yemVsQGFtZC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TdNy/4gSQxxS+iDPqT9iJOfPzsvXjj4ernPJ87Qo+4B4vKpmvjCou6Aa5qMDqfTryvqPZzSeo7KjkQGoNYYqWuMCVQxsQB7GRN2ITKjqTkiBw7x4ePFzy+NMMKZwXsMIpfMS3faPan/kUQhSMo1GoY/iLvBQiqpfG/XNLL9fTj1uQ3mIh4ZcUCmFrPYWyabyMoGth7MsyEecLLPB7W2GrZ2QhTPOwduTVNTWdMU7y9k/ea7b14B/tlNY3/W5zCnc07t2mvhvCYX12p3wxod5oQCXVn8EogWFz7wYvimhPgxi0Ped+V6oT8PjcbFEZDwAH+l3qnSBeJCYk4Kw0BxMvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G9kBqC5zBD5gUs1hx/Z74wEDICt99TAu9t6elq2LBLU=;
 b=pbPHn2LsYZy+7PoyriNKorFi1aHDQplLYSe74C+MLLi+MRoFP1dWNa+Sa9ZGsQI6NIbsWG2sNAD2qd1aagdyQ2NDgmZqC4Z3vJYRRVx0sMzN17ubofzwWF+P7CJaw+aBlzknR3GqbAdbDruFPUKZS9J/zRv8+wwjBKAuuJ2uOrc52kOVoHcZmtlBQLSzA64vPLQwpi8mmB1mgI0vIsNpyQQEBDoONNKujYH3qJxTSHZpx+0J9V335GLvSFyka47qNKwBusWMdXwBFzkn1bK9kj1jLTtilb8/tMBftHOOSgZ/+aAv5WtDXMq5K+RuB+kbbLaukPmSNpv87+tC0t4gtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G9kBqC5zBD5gUs1hx/Z74wEDICt99TAu9t6elq2LBLU=;
 b=2CXweczFNQahjRjEKkqUfKfDnBSIWGd/d+C8O7L3uWYYXIYKpUY3YXTYwoYpFFMJVK9bXMezXekwvawZZSOLjxrQi8jqb5w+SSrPYufFIwMs0SX9geMd2E3PUfeB9kWm12EJKi2dJKf8DHb3PZIqWX8gToWhKCyfZtHh+5k8aWA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] domain: Validate __copy_to_guest in VCPUOP_register_runstate_memory_area
Date: Tue, 26 Nov 2024 11:26:53 +0100
Message-ID: <20241126102653.25487-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|PH7PR12MB7456:EE_
X-MS-Office365-Filtering-Correlation-Id: 609c2cdc-52fc-44e6-5645-08dd0e04e07f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?r2bMdiPUF6UdYbQdk1X4KWWtDX8R+WqkV4dUSGKOx48J5Y35R3hwu25SIqCx?=
 =?us-ascii?Q?Og67vSlXk5OFKOUDtrvDLl2KtBCnV/JlOOLaz+jeorOEfunIWjq3fEA9/2/0?=
 =?us-ascii?Q?OW9tbXLWFduotxPyDA6R+3lTLU6SFZZAQ+B6ALlOyPB7Lok+2VVtOvJ/ML5u?=
 =?us-ascii?Q?n1wRJC6U7LYrMi48c2km4y35l1v5qXE7iZHZpJ/m6anOmah7+9XMnUML3uiF?=
 =?us-ascii?Q?EQhKukTWt/wg+nBKHf8snlR81qSxQ40eQOJGgMjhpN+HMoz+yBowgplQxsFJ?=
 =?us-ascii?Q?jDt7lODAHHu6ZX2goqCjeaHuxEuKLU22koniK/74z/dOTYd/E7kRQo+5oAUw?=
 =?us-ascii?Q?6+dB1bg3JzkHJBfCABJtE3wNi7eEP3bS0+ZM3sQdMYs4xLeepB8+gqevyxvj?=
 =?us-ascii?Q?q8O2GJZPjHzIqvN7sroPcpnoMgssbmiiywrjrrUgDmryc1kzovi51KRdlYnN?=
 =?us-ascii?Q?9cuhqUPQYhB2KC34FAhL2G8EDww57YTovde5gS/luyuIiD3t+Lec8K9vkCrU?=
 =?us-ascii?Q?PxtNmYgSQjCAegXnWtYZAh3wyoMEh0E23ws2dlDkEl7PQtSDNtu+7zv0MnVz?=
 =?us-ascii?Q?g4uvilau9o4fYqCzQCKeAk2vJsKCV+Ekk4U+8FMER/aGuw5tQVT9IAhHmQb6?=
 =?us-ascii?Q?23BkeeZOpnqb++/QCc+Z23FreTXIMOIWDd+R61/aKLyJgMD7fUAaXrM+I1VX?=
 =?us-ascii?Q?aFW9YDcRNiunjj1lqRsVgoE6gSuM6kNlDnJkmIstztv5+CWypN+K32icD7fP?=
 =?us-ascii?Q?spsqeyVZQ8DesSLaq/yW5n/Q/ClhQu/bqGFvTKkwNUc1ki4K3rSyyxcVTsCA?=
 =?us-ascii?Q?5FuJ45TYnqolvVvToAzFjuZbz+zTTMiFhhJpordYmZ+Txb+CW1ODmdi+wT2R?=
 =?us-ascii?Q?TKlsSC0SAQxJ3bclQPwMbu6hFMOozavNYdZuVKOEnKiraZCfjaAnfI0ZwoEj?=
 =?us-ascii?Q?W0dA63yDT7Mp/V04CfHln5rzCXTt4iq2xx3JngHoo7ZUss8/yryYYnr9Llzw?=
 =?us-ascii?Q?DQlouv+R8ViEaum2WpVIBupD6iGNs/nC0JDQL16Jrr+ohyaHso2xkiR+X7uD?=
 =?us-ascii?Q?HYr3bYh7SwkM1TPtwD/0dGa+NPIVKZlJj9s/LdRZOqLiODOXLQ90PsvMZeO+?=
 =?us-ascii?Q?nyX23r0Z/xxdBl+k+sytWrnCEfo9SNbr/a68lv2x863DLf2omPngb8U16nqP?=
 =?us-ascii?Q?04YHjuqm0c2UzRth+nqRj6VD8k0NrI7KLPtscn40hn0d0GVFN3f5E0F98XXz?=
 =?us-ascii?Q?3YxHOZXlwGwDhMtJSNqolEQc9Rv/kk4ovKy03KJ24qFwCzCSSkrPjw+4bYTj?=
 =?us-ascii?Q?M+vNpoPfUgFPuNzDTym9FOd1s0YStGc8BhFZUcdVbLDPQ+wR6IkKSAe4RHfu?=
 =?us-ascii?Q?Lfxmc6xwKPSTNfW4dulfHQXedqWpMnpgMsgxXW4EOF7ugAkd68dRwJqBD5jp?=
 =?us-ascii?Q?GIS2N/6y0Ja4eK3kXOsyHTygxQReiE/v?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 10:27:06.4919
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 609c2cdc-52fc-44e6-5645-08dd0e04e07f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7456

For guests with paging mode external, guest_handle_okay() always returns
success, even if the guest handle is invalid (e.g. address not in P2M).
In VCPUOP_register_runstate_memory_area, we would then blindly set
runstate_guest() for a given vCPU to invalid handle. Moreover, we don't
check the return value from __copy_to_guest() and return success to the
guest, even in case of a failure during copy. Fix it, by checking the
return value from __copy_to_guest() and set runstate_guest() only on
success.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
I'm not sure what would be the appropriate commit for a Fixes tag. Arm port
only moved this code to common in 8968bafa3170d46d21d8f6ee2d0856f270c864ad,
so if at all, it would be:
Fixes: 8968bafa3170 ("xen: move VCPUOP_register_runstate_memory_area to common code")
---
 xen/common/domain.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 92263a4fbdc5..3f6fb0798fa3 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -2046,19 +2046,21 @@ long common_vcpu_op(int cmd, struct vcpu *v, XEN_GUEST_HANDLE_PARAM(void) arg)
         if ( !guest_handle_okay(area.addr.h, 1) )
             break;
 
-        rc = 0;
-        runstate_guest(v) = area.addr.h;
-
         if ( v == current )
         {
-            __copy_to_guest(runstate_guest(v), &v->runstate, 1);
+            if ( __copy_to_guest(area.addr.h, &v->runstate, 1) )
+                break;
         }
         else
         {
             vcpu_runstate_get(v, &runstate);
-            __copy_to_guest(runstate_guest(v), &runstate, 1);
+            if ( __copy_to_guest(area.addr.h, &runstate, 1) )
+                break;
         }
 
+        rc = 0;
+        runstate_guest(v) = area.addr.h;
+
         break;
     }
 
-- 
2.25.1


