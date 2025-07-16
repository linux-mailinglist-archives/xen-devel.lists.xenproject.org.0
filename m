Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEBCB07FA5
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 23:31:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045841.1416148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc9iI-0001A3-Cx; Wed, 16 Jul 2025 21:30:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045841.1416148; Wed, 16 Jul 2025 21:30:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc9iI-00017s-9b; Wed, 16 Jul 2025 21:30:54 +0000
Received: by outflank-mailman (input) for mailman id 1045841;
 Wed, 16 Jul 2025 21:30:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XbuO=Z5=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uc9aF-0007F7-UI
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 21:22:35 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20631.outbound.protection.outlook.com
 [2a01:111:f403:2417::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id faed7667-628a-11f0-a319-13f23c93f187;
 Wed, 16 Jul 2025 23:22:31 +0200 (CEST)
Received: from BN9PR03CA0795.namprd03.prod.outlook.com (2603:10b6:408:13f::20)
 by SJ0PR12MB7036.namprd12.prod.outlook.com (2603:10b6:a03:483::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Wed, 16 Jul
 2025 21:22:26 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com
 (2603:10b6:408:13f:cafe::a9) by BN9PR03CA0795.outlook.office365.com
 (2603:10b6:408:13f::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.22 via Frontend Transport; Wed,
 16 Jul 2025 21:22:25 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Wed, 16 Jul 2025 21:22:25 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 16:22:16 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 16:22:16 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Jul 2025 16:22:15 -0500
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
X-Inumbo-ID: faed7667-628a-11f0-a319-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AFhoBkVLS/GU+GhtiUnq10Ma9LaJdGrReYO3XjVMX6XBPTJR1odKsSbXjEpw83yDvcGqxHjp6U7lY23twdh3VNF4mpBkEJctaBxVvZBf5Q4ks7+2lQTexRXhqmyAlOCGCNG4RGOYFeiTNVvzRaQ5ipZ3hEiZRSPBnuLq0ky7qC0ocTfewPni0FTjAsa8b5/Ercu0j1JKMCcnipswLAftM0KxAWbVeV14jkR4/JiMw7edxt9/7DqUoZjidBbxE7+tiJ2m4PNt01bimaLMxH1mn+3lIVIung8VVcho9PRcfhXND/ToulArcderuSRSY51Zp4SiVWOmeVRKvNqvKBGo4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UqUuUD6LRJlMEqjXYvj5y9JTuUtDy9k4ZoeGLFnyuaY=;
 b=gk+luiv5aCZMIEh1VVQ4BLFHHZ3IXoFm6tunP+hZPewpmzNl+4Q60RTOiTjp1/wc/jB1ci5u6/2GORKqu928JBakN3ZUv/EpIiflvh7Kuo7vhhELsLQfuCpTqumHMp4IADP+OqL/c3INJFA/+ht2WqMJvWRlqKmHNAB9a/NiGd2kemY0FoAWuM9kqFJfg9wI26ku+SAT/bZkw3RBvGcJ2fKY4YHU4XCY6bltlR5OMtCRNGAhzmSMfGgFP5DDuxroiLrN7JylpO+coflR6Q1KbOUvXHvh4M3y8QxKslkmy3fA0gGvlT5gGW1vczrvUUGfLEZ1uiMylntmAN9n2EyS9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UqUuUD6LRJlMEqjXYvj5y9JTuUtDy9k4ZoeGLFnyuaY=;
 b=EKadWf9PO5ZjjumGtWFq/9y/6reHDpyYz3XgfopObCUct5lLnRH1Wi3ngL+3oRb5GdccFHsiR+wc0sa8Lbrz+MZhtfRIiNtx+6onjQR5tKIjwPXc1rt5wIc3iBnZUWAIHpLI8pYOPjuHkvvc0wlhGS3K40/o7KrdTOiI7Ev/KP8=
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
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 09/17] xen/dom0less: store xenstore event channel in page
Date: Wed, 16 Jul 2025 17:14:56 -0400
Message-ID: <20250716211504.291104-10-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250716211504.291104-1-jason.andryuk@amd.com>
References: <20250716211504.291104-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|SJ0PR12MB7036:EE_
X-MS-Office365-Filtering-Correlation-Id: 236d32ba-2c7f-499f-bbab-08ddc4aedc5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vHDQPZxEKZxuJGz6k9FRXENynvH/OSJXFsI8GWR/XqAulmxw2Dj9760115in?=
 =?us-ascii?Q?zaDJdIEs9+pY0HwUeQFht16uxbsDEP9jsM6+YbSyNQ3nkCamL5fPci3c15Vc?=
 =?us-ascii?Q?H9HRB4h4/VZt+OL86WGJu2Iq66SHiZkFamIwckTwcp7n5hfFlGfcOoATOtSf?=
 =?us-ascii?Q?7Kd5WXSd80HQj0wANmNzk3pP29/lKtlPYPQdU+Lc8vppI88AklZfew7Ip5VO?=
 =?us-ascii?Q?rLF2cMWhx7pAt8an9lyqNrQnqPd+5uwcVGMdyo+Au34SwaGkbXkA7ar69I6v?=
 =?us-ascii?Q?1d3YYJDNaAsjrfmjRowXIQ6MSvNtslErvh77/Q5fbkYPj5Jkt7uZEmQqOUW8?=
 =?us-ascii?Q?VpgkNDNxa3ipAZ/HACuSPfxsRE7a4RGUKmpIKj/Ob7LcV+kQlbwX2XE5N7cU?=
 =?us-ascii?Q?F/w1P4DHrFYCrF72+GcSJhizinRcdfpRhr3G16NzY9LEA5HWy6L/E0IwVoBY?=
 =?us-ascii?Q?+Q4NaGlTDKegQK2leTz4KJMOSV6UgVKY+6XTWvWDbFVWfXcyPnOmi1BDlD9h?=
 =?us-ascii?Q?q+Xd7YU/68iNlOhi64JM2DF4BvP0Efzv9/ffDWrfduDdh6S5TaxWot1uMoCr?=
 =?us-ascii?Q?bNYlv3ttwI6PgrXptgu8l/alLiwx2h7eHDZtibBeVTb/olXOCSiy4/UNPLZ6?=
 =?us-ascii?Q?MG73R0j/zHA3ttLySjluSut5wXMjDymcXceclQDxtocHbBebV753jLhIZ/Yg?=
 =?us-ascii?Q?CX4ks7O9H7p1Fk5F0VHJVYRqoWMXKc2dD4fH5sxD7rDU7JFwjXC973zhyWTz?=
 =?us-ascii?Q?C8HaoNe1RcE5UT28CyEBiz6coEJ2GBfbR75X97NtoYciF4loyK1DK49x+ghn?=
 =?us-ascii?Q?oaUoP8ScJ14jernrZi8i96v+Uc2VYw8He4UcpU48y8CVjYopNBzG3G448XoC?=
 =?us-ascii?Q?DuUHaP/oOsB9sKerM8fjGNja8i6qGowu1wPQnA2TaqZA8L8EJbSVw4PlpB0T?=
 =?us-ascii?Q?RJFD81CoxXzTETHrMmJu+WE7necUoW4aruVv3NeBYLlScY34L9+F5LK/4WIN?=
 =?us-ascii?Q?R6RWljMJyf0Uv8R3QZ/hDxI9UAxyGHVGkn8k4t2zIj/YwTGyQ5UtdlHPeyHv?=
 =?us-ascii?Q?xTUa6d7fEAB/OYc25DDJRY8tYoYZMyxQe+Eu/l9KTepXTHcrW5/ClCDtDcbb?=
 =?us-ascii?Q?RFNCFDGwGL7x2gHh5eFAIGGG4TJLhItNpjNMqBBMsZ6SDOPMx00om+8KiXCP?=
 =?us-ascii?Q?/lMD0frJnLh5T75tijQclI0PR94IPSnAmOhTtUfFfBFI89tADNmhmQZPoCxg?=
 =?us-ascii?Q?CXfuf6zb1ALsaFAXQSECmBU1tVDXnAzbG+P/k4HUYT5MSkgBN5PsKZ5kcwge?=
 =?us-ascii?Q?RrKilo0kaq6XuzTOWz/OCy+8aZUhkWFDrCnbfdbh5+8u2jC1dpn88fGn96y+?=
 =?us-ascii?Q?InpV+BRcCF8Ll4eKhmwNQbq3j0kORMCUVZLSKkmyZkN5tpuSSoK7IiIhLrv1?=
 =?us-ascii?Q?hW03QJtKlEVXW8jwNnj78UVxczEnIYlb7eqUNQJ/HrWpYcYIdV3E3IFt3D3R?=
 =?us-ascii?Q?iMAbOMV7mgJwe4ct1SbJSr0r1YGIvobeLYeH?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 21:22:25.6599
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 236d32ba-2c7f-499f-bbab-08ddc4aedc5e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7036

Write the associated event channel into the xenstore page so xenstored
can read it.  xenstored can map the grant by the reserved grant table
entry, and then read out the event channel and bind it.  This eliminates
the need for an additional mechanism to discover the event channel.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/common/device-tree/dom0less-build.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index a2789e3bdf..284139bf14 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -26,6 +26,7 @@
 #include <public/io/xs_wire.h>
 
 #include <asm/dom0less-build.h>
+#include <asm/guest_access.h>
 #include <asm/setup.h>
 
 #include <xen/static-memory.h>
@@ -126,8 +127,14 @@ static void __init initialize_domU_xenstore(void)
 
         if ( gfn != XENSTORE_PFN_LATE_ALLOC && IS_ENABLED(CONFIG_GRANT_TABLE) )
         {
+            evtchn_port_t port = d->arch.hvm.params[HVM_PARAM_STORE_EVTCHN];
+            paddr_t evtchn_gaddr = gfn_to_gaddr(_gfn(gfn)) +
+                offsetof(struct xenstore_domain_interface, evtchn_port);
+
             ASSERT(gfn < UINT32_MAX);
             gnttab_seed_entry(d, GNTTAB_RESERVED_XENSTORE, xs_domid, gfn);
+            access_guest_memory_by_gpa(d, evtchn_gaddr, &port, sizeof(port),
+                                       true /* is_write */);
         }
     }
 }
-- 
2.50.0


