Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3694D915AE5
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jun 2024 02:16:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.746991.1154233 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLtrC-0000Qc-IM; Tue, 25 Jun 2024 00:16:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 746991.1154233; Tue, 25 Jun 2024 00:16:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sLtrC-0000O7-Fk; Tue, 25 Jun 2024 00:16:22 +0000
Received: by outflank-mailman (input) for mailman id 746991;
 Tue, 25 Jun 2024 00:16:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=STjk=N3=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1sLtrA-0000O1-TN
 for xen-devel@lists.xenproject.org; Tue, 25 Jun 2024 00:16:21 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20611.outbound.protection.outlook.com
 [2a01:111:f403:200a::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24e475e0-3288-11ef-90a3-e314d9c70b13;
 Tue, 25 Jun 2024 02:16:19 +0200 (CEST)
Received: from PH7P220CA0039.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::26)
 by CH3PR12MB7499.namprd12.prod.outlook.com (2603:10b6:610:142::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.30; Tue, 25 Jun
 2024 00:16:14 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:510:32b:cafe::b) by PH7P220CA0039.outlook.office365.com
 (2603:10b6:510:32b::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.38 via Frontend
 Transport; Tue, 25 Jun 2024 00:16:14 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Tue, 25 Jun 2024 00:16:13 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 24 Jun
 2024 19:16:12 -0500
Received: from xsjwoods50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Mon, 24 Jun 2024 19:16:11 -0500
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
X-Inumbo-ID: 24e475e0-3288-11ef-90a3-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NmdHNuamfhd1lf3IrcwJmSHqV+OnPiklhe7+U1VxAN0b76uopsBMJxEnUName88EsmoBz0mXFpMddIRe1uIHxTAweLCatU5TXigof+QsDdxQMWtLzdr9aUvdDV7hoLY3U2c+a018Hv8v8v/zLiJzK1wj8wMFS7RSxEH5mx04IeWU7yoCzaOOQ264LfqBNuLGvuTT0E7+VFydjr4sjR0ySIci0X9gqiTVx27T5sPzlnrrmovE6tOF+ymFRcBnqIt8PZZuwlqfp8+3ium4NAzomoJhpMmq0CPGmBi4Au6vbQHy5Eya3jU63nxSI18WZVzOAHnmOwk1zwAk/ujnPYVsCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aK6pT63F+/FKNnG3FTGMH16+l8vr5szLZBk4uhshQUc=;
 b=DZm+Pl30ArVMTjBQ77YeMbOutjRx4b4KJxT/pAW3bDRMYOGDTIDfa/4nU3zCj4uKDhwazOA0vYwjRDLrnNxX2qVQBgFo23+paFVZ6Adq1swL2F4NQmQUjAk2ZsO4DMrJo61tZq/u/SIyvZbjuzzwCRY3bgpYL93RbJ65Z7+k9tCHno3DsepohBLrwq+u+NJj4N0XzqcSVqN415FcpHv3dqByXNCnz5CL7VbFEhoTQgGrwb6qp/yR//P9RgMigfIfN+kv2m3yehqeze9GcHFdkCW07ptamr84LNL5XeYJDvMCMnAUQOG+BNP/qa0rD0ainK5H5NoMfA/VLbvFqggsAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aK6pT63F+/FKNnG3FTGMH16+l8vr5szLZBk4uhshQUc=;
 b=m6uBNtXCQlKjLT0NU45c7/b6biX7qsRpYlTdIk6u2UdLAG/NFwIGNc4Q6+WVUQctyOKqAB6AWfanHz727GbNoHN/0SD1qksLMy1xPHvAPWco/vH1CxAZ4XzvLEgj8IUOS/zxwQwQmYm34ZiIlX57dtwRdNafMIXgX8EfZd9Ft9w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Victor Lira <victorm.lira@amd.com>, George Dunlap
	<george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>, "Juergen
 Gross" <jgross@suse.com>
Subject: [XEN PATCH] common/sched: address a violation of MISRA C Rule 17.7
Date: Mon, 24 Jun 2024 17:15:39 -0700
Message-ID: <a5f00432063ead8d4ae09315c1b09617a12b22f7.1719274203.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.37.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|CH3PR12MB7499:EE_
X-MS-Office365-Filtering-Correlation-Id: bee44850-dd3f-4b27-a2bf-08dc94ac0634
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|376011|36860700010|1800799021|82310400023;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yZPMHY7cn1otF/nUDmmDbFGyB198wylYE1mPP8DziI2JWGaRqIw12SsVvwqI?=
 =?us-ascii?Q?JuAdSqdV4l0x/R9tfif/rgq4uODm5FoGrE30h+wiXhgVMM3FMr/LQtAm4549?=
 =?us-ascii?Q?6NE2Id0QxWnvf3NGD2Mj62hizlrPedlZy5rKA1FoVSvEgP+HKZlVX2BwouxP?=
 =?us-ascii?Q?LxCCj5cUr+r1g3VWoIFdryvRQ6iRiOb6gmJdoMdM6scCrCbT508nlUPAvF1E?=
 =?us-ascii?Q?h1WoWBkEtLriHnn6hxfTPI9iH/FoJqqrdqYo+VsoAc514wN8/O7vC5GeQRA3?=
 =?us-ascii?Q?4KPW572YNHfCR/Q+nJ6fTbz5fXbAIjS+KvheOsj/dQFZ6G/24KbOmU3jK9wy?=
 =?us-ascii?Q?6m+h5n7olRf/0N29SNkIRLaacTE8kiTwMDbVjBfmd24TGVI8Ibtkcuff/Ql8?=
 =?us-ascii?Q?uELVOFXgj9irno41IFJ9R3NPO9RUAjiCPi6dp1mQZCOjcuXw+8ABixVrCw2h?=
 =?us-ascii?Q?E4y36PbYtYQjkiMCcYwTPjVx0WmzFrYCSlLpb4wC8kbbyCnk9yIe1bCMUIca?=
 =?us-ascii?Q?SVlWHzICm4kqPeUvHTdgeda2vP1MmUyPoJUoejkjerOvVdzZuOAQkmF/QMWH?=
 =?us-ascii?Q?y79z7uxDE8wkArCI2m/uqRE7q1rJGhZO5v0rsAnDh/s6HCavxe38stBYGmha?=
 =?us-ascii?Q?elfYjxlIXyP51Qp0U47vNXCI11w2l0thctRAC1ZCnInq5uOwI984T17c/tPJ?=
 =?us-ascii?Q?KSp+CI1uRdJAlVBK1a6wBeXUPq9HcvFBH7oojfBtkFS42wFJJt2No7HMSxdm?=
 =?us-ascii?Q?xnoQCcNYO9V33u8SrZqJLIVKX+1W6qQb59WyejcfxmEFSjBa9rgoVh4jr8oI?=
 =?us-ascii?Q?IkK0P0ka5Iv778vWdbdeXrp067xXuIW/fIxBeJj/dn6i7nbNXK7HBnulYe7G?=
 =?us-ascii?Q?MiH7qSLF2GxB0rLMAaKPfgVsX5pNBx5wgv56aJrY9MKsqHfaZBer8X9ks674?=
 =?us-ascii?Q?ZQ0JhX6PJ+3fJ9edfqBysE85VgcdUx16d8aAbj7t4lQFQxgQz3SC3Hcg4HLv?=
 =?us-ascii?Q?Mjx0LSV9UYQ6i5gzWsvcgw+YoqK8EeMxkmOV/EnSV3a5Ajwz1PNMvdKpyVHK?=
 =?us-ascii?Q?CvbBfdadwn2TeLDe5nPCqoEhU3OkoBP0tj2I58n73Jqu2I3UU4/PQkDUEcjF?=
 =?us-ascii?Q?aU0M9o7P/nf0M9lJ5VGsTuI2HEf95us/plXS/FwztL7gBIfeaDpIvqBSgPga?=
 =?us-ascii?Q?1Ynbt71olcQhE9kULXrYoRQE9tReFh8PtM9uqU9NAzjdNF5X0dOXiJ2Mtzgj?=
 =?us-ascii?Q?/ChQGLcwVnGta54QfIkhKaKcq3L6CkcMobNxXPgsb7MY1cqrZJOEAHyPcsp5?=
 =?us-ascii?Q?d+acRCQFGkxChTKZdIY3/KRsoqe9vkmR2ZgpY7AJ6I3r/NKAQ29O4b8Skc+n?=
 =?us-ascii?Q?J/tohPIqYZ4nTE/fhZgRN9aKaf7qxIzosd6qyhq3wgZ8GUy6fA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230037)(376011)(36860700010)(1800799021)(82310400023);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 00:16:13.7916
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bee44850-dd3f-4b27-a2bf-08dc94ac0634
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7499

From: Victor Lira <victorm.lira@amd.com>

Rule 17.7: "The value returned by a function having non-void return type
shall be used"

This patch fixes this by adding a check to the return value.
No functional changes.

Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Dario Faggioli <dfaggioli@suse.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org
---
 xen/common/sched/core.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index d84b65f197..e1cd824622 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -2789,7 +2789,10 @@ static int cpu_schedule_up(unsigned int cpu)
     BUG_ON(cpu >= NR_CPUS);
 
     if ( idle_vcpu[cpu] == NULL )
-        vcpu_create(idle_vcpu[0]->domain, cpu);
+    {
+        if ( vcpu_create(idle_vcpu[0]->domain, cpu) == NULL )
+            return -ENOMEM;
+    }
     else
         idle_vcpu[cpu]->sched_unit->res = sr;
 
-- 
2.37.6


