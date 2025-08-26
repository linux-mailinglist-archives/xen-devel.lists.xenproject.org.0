Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B705DB37440
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 23:09:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095138.1450317 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur0uw-0008QH-0O; Tue, 26 Aug 2025 21:09:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095138.1450317; Tue, 26 Aug 2025 21:09:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur0uv-0008Mq-PA; Tue, 26 Aug 2025 21:09:21 +0000
Received: by outflank-mailman (input) for mailman id 1095138;
 Tue, 26 Aug 2025 21:09:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=etY1=3G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ur0uu-0006z4-5M
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 21:09:20 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20617.outbound.protection.outlook.com
 [2a01:111:f403:2409::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed42067b-82c0-11f0-b898-0df219b8e170;
 Tue, 26 Aug 2025 23:09:18 +0200 (CEST)
Received: from MW4PR03CA0255.namprd03.prod.outlook.com (2603:10b6:303:b4::20)
 by CH3PR12MB9315.namprd12.prod.outlook.com (2603:10b6:610:1cf::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.14; Tue, 26 Aug
 2025 21:09:12 +0000
Received: from MWH0EPF000989EA.namprd02.prod.outlook.com
 (2603:10b6:303:b4:cafe::e) by MW4PR03CA0255.outlook.office365.com
 (2603:10b6:303:b4::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.20 via Frontend Transport; Tue,
 26 Aug 2025 21:09:11 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EA.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Tue, 26 Aug 2025 21:09:11 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Aug
 2025 16:09:11 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Aug
 2025 16:09:10 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 26 Aug 2025 16:09:10 -0500
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
X-Inumbo-ID: ed42067b-82c0-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iVhBjMxN8i8evB/4Nb9TiqtUcWwOAB+5AM9lk0MkC0iJhI2NwPvIaKvXYH/tSrRMy8ubdZNNbKU2GvT11M/F6K8T62Ykon04rLiOoZbDnTQieFY9HqvAhpGOa2Wz31XxdkU35CowP92gFyZn2jpM2zm0qUq2yT2211r5nSqx+6QTQgvW1YolTb2E/0cB/kZQs0oAO8cVvMttxqXa+zQAJRO+3lSuwe3LP6mKzrGJMELji/D7ZrJKQ3q8gANiuABX671562Bt2Cz5bfrdUaunEB5Yna47oHOkRcBS5f8+C3ehClk2ISC3ozO/eEqb3wtqUQVyKGJvvMHuGPc+Qm44Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9F+/mzfDnNswEGDX88fLVWONwAPU8XRv8UZTYl3/UxQ=;
 b=gmOk9YNNE4SNi4RCszvsIP18gXxIKEHIocbibauifWIqJcoBJYrJ7Is8P9oycsTwSPF/bC+a5w2Mcs0OcqfqQrL2kG3F1LdxP4TfzdY2wiMJBHlT92RavwALGokW8LCQ9+FCN6ogA3X3erHRGcp+UY1KqigA1n4rF9WM4orPVk5n+tcxrvZlx28YYF4QVhMcHP0njjxoaUgq1AouHhB9qTQSzrIIRPSpJQtnu/FWk5tavJI6usRUdLispUG69E9y2kdCxQNV2SM7FvOR05is5JBXFG3TCBLu5drbgB1WWr71qKaDFYXoxA86kZa4CaBlH7xfLxzZmHfa8zTs0RVpeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9F+/mzfDnNswEGDX88fLVWONwAPU8XRv8UZTYl3/UxQ=;
 b=VQTp6Gl6HQ1kon5cyKofYDwAR4a+yytFSOBoc6aL40QMENERaPh4PftXkXjfQcUp8ZqonGrnl2mEQ9duzVbns1nju9CnZIX1+cq01CwH1gBXkZdKSup11iA92qhjBXydejOfUsHrSpOMvCYOblx1zjBi6xlqH32Vod1F7DI8SDw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v3 8/8] xen/dom0less: store xenstore event channel in page
Date: Tue, 26 Aug 2025 17:08:47 -0400
Message-ID: <20250826210847.126015-9-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250826210847.126015-1-jason.andryuk@amd.com>
References: <20250826210847.126015-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EA:EE_|CH3PR12MB9315:EE_
X-MS-Office365-Filtering-Correlation-Id: 1493181f-1f82-43a2-ab12-08dde4e4ce0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/MYVNB9SKxzBOsMnX0reLumPgpDkNbd57aiDW9BQHwSvg6rc2Z00K1VkIPFH?=
 =?us-ascii?Q?nhfO7HYiQ/B7lUKy8OwrX1vheYvypd8WzBErY1qTsXxbJ8ttTCPDC7kbEkcD?=
 =?us-ascii?Q?psyGLlz11J1h8zh2onmEXmGdxJcpL7nkmHBvPNCXOztV1IqLkwtSElurQWgN?=
 =?us-ascii?Q?CNd40/7p8C0MOUh3qDr1UCEts52aUMJXN1B4dLQbl+g4feWM1iSpDMAE4QGX?=
 =?us-ascii?Q?NVCGpx1kPbkG69l7nWXfBsMXX5GfvBazhLXdbvfV/PTe5tDIZEWdLQaxwjGs?=
 =?us-ascii?Q?PaL0H8VsxyfWBILmyhW3OX3WOc9agFk0Wh15qZilBPX3n+1c2J7jzvaX/o/B?=
 =?us-ascii?Q?kgAeehkQwQnbv1UHGfupLnsqw88tTThPTn7nfDiKmcy/Kyk2mjbDJkms27/u?=
 =?us-ascii?Q?66qD6xrsZQSwZpwJxgFy8oS8GCcEkDkZGupN2EAtfaaDmESK4roAIDF81C0G?=
 =?us-ascii?Q?bkTU42jpPbCjU7qVm+eCsuPfaDYQeo0I8+7Vp4ISs10faO/PcK05H7tF91gF?=
 =?us-ascii?Q?GKVw1E291Bd9se7Sdvj/9oEjYX+iHf07qjBr7L1o9W6ASwJaHGMIGLwei2Jl?=
 =?us-ascii?Q?TFlo/78YMqmLc60rZcDMsc0wR58eJizC82qv5/G5ftAIqer5QuO7iPlPWjdw?=
 =?us-ascii?Q?sXtubfUALqLar99xb1PhpepohtSeNaHj0H8VMYkTOL57HTTQGRcbYCDGRclD?=
 =?us-ascii?Q?Si3qpzoLhSJ+CK4wX+YmxIgNcB/mIPTBWOtbWU6QGsG+gR2qJjYDRCtVkJ6M?=
 =?us-ascii?Q?MLsejvyzwXSHNMaNxN7lNInsVI7M9J4BuA3xGpraRs5gAxWN57vnqrTJlt5m?=
 =?us-ascii?Q?gPMHn4ajocx1Cqp+Y1Q28SfCu5QzC1mDkhc2J13Ckw5CNdFMWBJOFdBqLdqN?=
 =?us-ascii?Q?7rpGy9+MPHU+DMK8j2MnUvirN1vFtko1JkGQrPl7Q5jht1Yu6RKojlmoYeBu?=
 =?us-ascii?Q?I09Uhi/MxT1VfpZWPFh2ahFQjTp2TOtUZG2bg4mXgLGT+BCZT68KHW1qwp0p?=
 =?us-ascii?Q?1CnLp4F/RlF82rDANaqnNDnvukTxqsgabSvITuWftQySWwhKWmhT1VqGJ/YI?=
 =?us-ascii?Q?o0+Z2ITYWJlINVla0eK1xwbvt53mXZ5FKK2a5D5MlXuYdYcp+ayH/9DL3jc+?=
 =?us-ascii?Q?1WZ9VKqqjxWAUYdwycLutqu9Y+dMIJkgith75osV1d+72LsP6NhTd//BU0uj?=
 =?us-ascii?Q?fjZ3ajyWQ4ddTMs7sNCgkZCpfEmoPyN2x1vYe8U9UVxVVscspMietd6xVJM4?=
 =?us-ascii?Q?jLLOFtL9r2SBqNPo6SuqyoT+OYCT8ltHyNhfIkhPEcV3R4hDyCqXUw1yuels?=
 =?us-ascii?Q?tah3j5My4UBfX817sfuJWYaFmWanRNuNUGvAQ30nQh98QMvbhZOQM6z9p3td?=
 =?us-ascii?Q?DSnLatI+cE4UTQmF4nFMe2fVvuIa4oCPU39CfCOQgzFzwRk2Jpvuy71e4/oQ?=
 =?us-ascii?Q?NW/Qit2Ej4iQVsxBFBxmEme+3ZIBXiOV3AlHsCX3dP55pwhs4TfiSjn8Fopb?=
 =?us-ascii?Q?s5aZwh5DCrmzRsy+qWVI6qQ8XSzPb3wUadci?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 21:09:11.5818
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1493181f-1f82-43a2-ab12-08dde4e4ce0d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989EA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9315

Write the associated event channel into the xenstore page so xenstored
can read it.  xenstored can map the grant by the reserved grant table
entry, and then read out the event channel and bind it.  This eliminates
the need for an additional mechanism to discover the event channel.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v2:
No change

This should go in after the init-dom0less changes so init-dom0less is
ready for xenstored automatically introducing domains.

I'm looking for feedback.  This is ARM-only for the time being, but that
is the only in-tree user of this code.  From the perspective, it is okay
to go in.

If we want a cross-arch approach, a common function to write to guest
physical addresses would be needed for additional arches, but they
aren't available yet.

Oleksii added a function pointer to dtb_load() and initrd_load() when
moving dom0less to common, but I think that isn't necessary.  Just
having a common helper would be sufficient.

copy_to_guest_phys() or something_copy_to_guest_phys() could be defined
or a wrapper for ARM's copy_to_guest_phys_flush_dcache().  Other arches
could need to implement it when using dom0less.

I'm not an ARM expert, but Stefano said
copy_to_guest_phys_flush_dcache() is not necessary since this xenstore
page isn't expected to be accessed without caches enabled.
---
 xen/common/device-tree/dom0less-build.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index badc227031..1a40f68837 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -26,6 +26,7 @@
 #include <public/event_channel.h>
 #include <public/io/xs_wire.h>
 
+#include <asm/guest_access.h>
 #include <asm/setup.h>
 
 #include <xen/static-memory.h>
@@ -120,8 +121,14 @@ static void __init initialize_domU_xenstore(void)
 
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
2.50.1


