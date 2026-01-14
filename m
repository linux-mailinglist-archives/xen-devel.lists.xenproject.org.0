Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C905D21D97
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 01:27:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203961.1518882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgBD5-0005Tk-VB; Thu, 15 Jan 2026 00:27:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203961.1518882; Thu, 15 Jan 2026 00:27:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgBD5-0005RK-S9; Thu, 15 Jan 2026 00:27:35 +0000
Received: by outflank-mailman (input) for mailman id 1203961;
 Thu, 15 Jan 2026 00:27:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YAhB=7U=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1vgBD4-0005DR-74
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 00:27:34 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8a5d706-f1a8-11f0-9ccf-f158ae23cfc8;
 Thu, 15 Jan 2026 01:27:29 +0100 (CET)
Received: from SJ0PR05CA0038.namprd05.prod.outlook.com (2603:10b6:a03:33f::13)
 by MN0PR12MB5881.namprd12.prod.outlook.com (2603:10b6:208:379::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 00:27:23 +0000
Received: from SJ1PEPF000023CE.namprd02.prod.outlook.com
 (2603:10b6:a03:33f:cafe::73) by SJ0PR05CA0038.outlook.office365.com
 (2603:10b6:a03:33f::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Thu,
 15 Jan 2026 00:27:16 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023CE.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 15 Jan 2026 00:27:23 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 14 Jan
 2026 18:27:22 -0600
Received: from xsjvictlira01-ubuntu-0.tail79467d.ts.net (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 14 Jan 2026 16:27:21 -0800
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
X-Inumbo-ID: f8a5d706-f1a8-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I19nhdgREnO2j9Qc+KepZVpS118i84PkTFlSRTPdZ5toWULvloABEGJtBeyXtqw9XFRtTY4Wq8J9llO8ifeMVNgcqZiZmysQKz/E8CweUK3tTE7KnQCYRrUgGpV6HoCwATEqW0jcG2XEVm92ffXFZ8ZDbKiypgLscTEQuZrc0yONSj420M3+LnsykjvxAtkDk9iATxzMiEJ1LqFTnsIxdwYApxHJAVMMU5Z4gcGHIh63VYTtC34nRFzSL/Lb4wko/JA+eNrpS7NrEj5Cqlm9h7eM8KIPGsYmDtehvzG8cL65Ot0CKCf6aBDTIxHG2RjayTm93U54hUt1pmt0yattQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PH3djnAJYdyXCisb5N7pK2eva89Bdz1+TR97+9/YAiU=;
 b=m2mNdh44pro1s9V+cWIh+Dncpg51Izhf8moQ22vSHEsxcK5+JNS09XGCyI81AXEH7x0VFgP+T5h9m+haK+mrApZV9Kqn1IKCa7KVgYl5prvq/Gu4/AjySULdMpNh7Z8fZQYaiCmnCNcocpyip4L8vhu0ZnPNawaqIvpp3UFazcAIOrqzIbUdeqy1+mHzdPB2ayPSAqwPwm52xtLpC9eENLyqR8TFZP6koQPzu4owcZ02VzI6f+OoLG/CG2Yu1hLAyfwfOvVs8DwbNvrapL58EMX8rM0++yson3exgHbr0Nh2LxzH7BeZHubg5JdxQWdCPlYePNw78IIqfOtPHhTiMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PH3djnAJYdyXCisb5N7pK2eva89Bdz1+TR97+9/YAiU=;
 b=zMiQE6JH6f13YKwX8bqblbZwCQSrzMNd4jV2ekHneKp03btuopC62dBFu3223JeQX6KlshbcMoK2ktNftLSylvDrVVDXbu+kQ3vcOjfIFCDz6b7C8mLxck7FACBFDb1uQ862rKeaal/UvV6xnX4RtGi4pTewp+K+sf+NWF0XbF0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Victor Lira <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Alejandro Vallejo <Alejandro.GarciaVallejo@amd.com>
Subject: [XEN PATCH v1 1/1] x86/vlapic: match broadcasts for logical destination mode
Date: Wed, 14 Jan 2026 23:55:48 +0000
Message-ID: <20260114235548.626696-2-victorm.lira@amd.com>
X-Mailer: git-send-email 2.51.GIT
In-Reply-To: <20260114235548.626696-1-victorm.lira@amd.com>
References: <20260114235548.626696-1-victorm.lira@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CE:EE_|MN0PR12MB5881:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b67fb97-edea-4528-c019-08de53ccda61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?DdgFKJCx6DFCOpNFgRasww/a5jSmsvi05g2A44Tl+t0b4Q4NclpVBdIMSRum?=
 =?us-ascii?Q?86YwZazR1tFLemAjSGyEDQXYv4hK2JkX+YHnHJv7JyrFN+92Qb6PosfyNYEJ?=
 =?us-ascii?Q?hi3VgsdtfGVKv6oK8PD3e4KXrNig0D0c8U3pcvhY0kYJkwYK/a4k8DzWZo+z?=
 =?us-ascii?Q?LQqZRTCY3W+PmwJSoWvX/7nnwJyLTFWsRG0Yg+qjj9+oCb2J0yOv5qDgOGcd?=
 =?us-ascii?Q?ARSCpDPPDr9CqLoz5PL53ZLdvUcqsuO50AFyceiSok65G12KFKtYZn2Zso6C?=
 =?us-ascii?Q?EQAoY+TdggU1Q4Q5AVgHr6zacn4IR/kkk4XGzxsHZTGWH8aOK8eyAqiRfwGr?=
 =?us-ascii?Q?tFG3VXKVeOOua4lWbDMbL2XQxCKmD+5LqH/yeYJnerPokF23aJyQVb/twQws?=
 =?us-ascii?Q?MyopvmlWDDeYotJ4WImAfE5cCJddwy5BHJaSSa4vB5WGA2sMKzrHcEh1fnUY?=
 =?us-ascii?Q?G479tp6taVtdphsNgvKSO7TgSt5+lOZrOjVoq+YVC72fUUQJR3E7gRBWoFj4?=
 =?us-ascii?Q?rzH1eryUUgm3EjZ52fg25hh4Kf6dKcwmQfTqYx/C39dCB6fKvwGd4OoSsLTu?=
 =?us-ascii?Q?eGFeX+2FVSJf57fOGGIlRmWG92HpQW3ItJ7gFodOc3n0/bBMnvdsNzJT6dVc?=
 =?us-ascii?Q?OljWYC1EDnzK372ZwQp24PbyYiiGc9fK+uUbtZ6//mHBA64lK56zYacGOyp5?=
 =?us-ascii?Q?kFkbM8NvjbD5xanBwaAnwMOdi2xTRxNANbW461Vz3dCuql9Wuj28JpextlTh?=
 =?us-ascii?Q?vrqrC4kPXi9zz1aR/O7eTiJWA+7eWrjfsoSQKm3hd+FCLUXmrVw/5Lp6KRtJ?=
 =?us-ascii?Q?wDDVfL/tOlzCNzlqsJo/MCf8BAdPyHKVq/KqsAQ+7nRNiU/OYGnjTn18HbXi?=
 =?us-ascii?Q?m4szjRnyJlAXDq5bT0i5v5YOHpmOKOL8xQ4hgpQ6QLg7xlIHsUeyBqTlfnOW?=
 =?us-ascii?Q?Lz3FJvGZVCwJDBhDaNB9/xuaEBPHs92nZX1kXrx4UgRHop75CuBnghRKGJgW?=
 =?us-ascii?Q?7g+un7Wddfe/2GoCEApaG8LYwlAJkmflwmgYJXNVDf19vOSfgkJmE02aRe9a?=
 =?us-ascii?Q?TxBSjIc4ljvyWYq2z1Rk+KFpsTL6h2b7fLSYumkXjNFChVMCxCkZMUs1Bx1/?=
 =?us-ascii?Q?VT/bgJO2GukOZGGTo/p7YAoPFngCy+RlQlDijlmuwU1WjXFQjq2PJnwDRYDA?=
 =?us-ascii?Q?T4IhavYAyXgUDUc9VnnFHL3S1b7v7O8Qj5u/IesFgB0I1x6CCH4UwrSmfHe9?=
 =?us-ascii?Q?4/cqAgg6yJBpSndp0gQTnRbJsYBScnsQVaO51bhyLNEzZUOgYzr3kS9rQ0hA?=
 =?us-ascii?Q?DFzCh8ZbBJMxnu7+hNo1WkCF08tBL7bJcBPbBzPadD9LaO1hocIeg/KybXw9?=
 =?us-ascii?Q?abYurGtb6qab/1y7a1RdFf6CA6v17xvN1WN1xGZmVcsICqMi1/uD5bmQePea?=
 =?us-ascii?Q?9jw2JkS3W9SN2E6q0wArCw2R71YqkKFxXfCzQZkMLkXET6dTGw8h5YHmMIYO?=
 =?us-ascii?Q?biTCMVt1WcIqvf3PN7PBBq/fII1owwR2NnEExjW/pGZ89Bh+GSMsMouIXLpy?=
 =?us-ascii?Q?mG5XshLubY2WTfZMghbKKWcKhGgiiwnk0Z+TsfSXib0lcZpR7j3RBOMa5YYt?=
 =?us-ascii?Q?if7g72mMXwPt40+o5yy3K1BVLFtydIteMaluNZQDDt4P41gwDM/b0EW37dHl?=
 =?us-ascii?Q?+osRjg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 00:27:23.4046
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b67fb97-edea-4528-c019-08de53ccda61
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5881

amd64 vol 3
16.6.1: "In both the flat model and the cluster model, if the
destination field = FFh, the interrupt is accepted by all local APICs."
16.14: "A DEST value of FFFF_FFFFh in the ICR is used to broadcast
IPIs to all local APICs."

intel 64 vol 3
12.6.2.2: "Broadcast to all local APICs is achieved by setting all
destination bits to one."
12.12.9: "A destination ID value of FFFF_FFFFH is used
for broadcast of interrupts in both logical destination and physical
destination modes."

The specs say 0xFFFFFFFF/0xFF should be a broadcast to all APICs in
logical destination mode but it is matched only for cluster 0xFFFF/0xFF
(or as flat mode in xAPIC).

Add a check in vlapic_match_dest similar to what is done for physical
destination mode.

Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
 xen/arch/x86/hvm/vlapic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 79697487ba..1208cd21f0 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -248,7 +248,8 @@ bool vlapic_match_dest(
     {
     case APIC_DEST_NOSHORT:
         if ( dest_mode )
-            return vlapic_match_logical_addr(target, dest);
+            return (dest == _VLAPIC_ID(target, 0xffffffffU)) ||
+                   vlapic_match_logical_addr(target, dest);
         return (dest == _VLAPIC_ID(target, 0xffffffffU)) ||
                (dest == VLAPIC_ID(target));

--
2.51.GIT

