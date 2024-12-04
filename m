Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5963C9E3532
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2024 09:25:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848363.1263283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIkhT-0004N9-4T; Wed, 04 Dec 2024 08:25:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848363.1263283; Wed, 04 Dec 2024 08:25:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIkhT-0004Kx-1a; Wed, 04 Dec 2024 08:25:35 +0000
Received: by outflank-mailman (input) for mailman id 848363;
 Wed, 04 Dec 2024 08:25:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p5h6=S5=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tIkhS-00040M-FG
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2024 08:25:34 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2413::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53cfe468-b219-11ef-a0d4-8be0dac302b0;
 Wed, 04 Dec 2024 09:25:33 +0100 (CET)
Received: from BN0PR10CA0020.namprd10.prod.outlook.com (2603:10b6:408:143::11)
 by DS7PR12MB9043.namprd12.prod.outlook.com (2603:10b6:8:db::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.18; Wed, 4 Dec 2024 08:25:28 +0000
Received: from MN1PEPF0000ECD4.namprd02.prod.outlook.com
 (2603:10b6:408:143:cafe::65) by BN0PR10CA0020.outlook.office365.com
 (2603:10b6:408:143::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.19 via Frontend Transport; Wed,
 4 Dec 2024 08:25:28 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD4.mail.protection.outlook.com (10.167.242.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Wed, 4 Dec 2024 08:25:28 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Dec 2024 02:25:25 -0600
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
X-Inumbo-ID: 53cfe468-b219-11ef-a0d4-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h8/1QB1y2kZxqXmuYeLVifrpUmkPMvkhNTg5Co8NqM6fKnwOexeMRIDjxQ0+aSE4UlDUqhlQ06Sd+uS90kkejzfwqNH2mi/GQm/kjJ3Iwoej94Xj7j4BbaAG2+hpGvBkyxMfcyp/zqJb45AjJiMTXnl7NrFWF81dn05S8iQumTIplvPGmU9NKARhfti6fX05BB57pLBOTiiYNnBmnr0yiCxUXMMzhmrMk+1fIP4fcJ0PLpINZ9y8MtY0BZEf1CaVB2/rrzRwow1VxJpUszxBG15WSDtd+3R2TDfdDSs5/qKdbGRc3ASP4eSWjJ3R8xgjwKPb5vHuG10vC3OdjLp5Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5o13Q5hSamLrZeOi0igyIZdjl2uFNvY/kr1u9WVfxZo=;
 b=V/w+1mmCUWfY+iFOzzUV4/lQXldBK6y1sSWdGILrChUkhKmHvZ1BIBZIYTZoOYtCVPqmy4GaLYFQucvUA+QDwuzOKFdQ31YZsRJpZhIlhw05r/Dn9Ba9R1mJWnS6nuinc+/qrBlYJ/CmJHiFtngR8mO+LYahHUscxDE/CbcigBdmk2jLpb1F1kF3MrZ9Znzv7aOzXbmYwOhCxOt1mfGOH4NUM7g9iSjW0z4EC4kW+3nWR5apyqm19Ll0smf6OCE/UWPLJIZKgZ8zJFvNSpp8ytNIV1GGh8LAPegoCaELh7sfV1dYiVHj8VHtnY9wXxoWEGL5WJaR0PCV11+bNxpQmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5o13Q5hSamLrZeOi0igyIZdjl2uFNvY/kr1u9WVfxZo=;
 b=VBVSyk2Jsj+zbFuut4TrHxjgnxpsvrM7zA/fKZl7eqSr7S//eiRs2ORM9kd/w3OgtmeN8zXYcQPQSpyNM0kMQmS1StTfereuS7NeNjsJdFtfQgliyvaerxz0+vx9sFbbv0UodVbFcXcet5gLmHIVbXhTcAXZFghzcg5ts4k1J7I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
CC: Ray Huang <Ray.Huang@amd.com>, Xenia Ragiadakou
	<Xenia.Ragiadakou@amd.com>, Jason Andryuk <jason.andryuk@amd.com>, "Penny
 Zheng" <Penny.Zheng@amd.com>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1 2/4] acpi/cppc: extract _cpc entry parsing logic
Date: Wed, 4 Dec 2024 16:24:28 +0800
Message-ID: <20241204082430.469092-3-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241204082430.469092-1-Penny.Zheng@amd.com>
References: <20241204082430.469092-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD4:EE_|DS7PR12MB9043:EE_
X-MS-Office365-Filtering-Correlation-Id: dd40afde-3d90-49b2-6d79-08dd143d35be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3sdVD9OcpAQT+jvjavi/JkEleCp4OdDAcsHB7/8sWLbjfN/yTDupX4pyl1Eq?=
 =?us-ascii?Q?ZcpXwxz1TglCwRMUI0UCDdD9nn6fdPNqpkhSisCEoxc7Ku9Zi+YtdUtkmpxR?=
 =?us-ascii?Q?t8oLBCrpnGIc3fvvKdN5Jn4yMVXkuB5S5TitU0e7R3a0mHuQzbmyQMpn7ZkD?=
 =?us-ascii?Q?YTqyITjh+UbQQmDtKRnuRL3aIaCAuae7zhKPIS7DDJdkHmp/jeOvLR5cIoiS?=
 =?us-ascii?Q?13aq5t6AkJtRllurOEyQOUA/IKba64wy6R4KZ0ZXRPDM2Iz4i8BLj2Awyvlm?=
 =?us-ascii?Q?iPqnTwpLdQk4o5TzZK/XWtnLpr5g6w/Y6y2OYgzXQ6QKlHk98fNOVYKKnnuf?=
 =?us-ascii?Q?VutHNag6c/mPY+A0l+zyibRckQwpMfpS6PwpGSfwI6tccVtHSSBrAcA0dTkY?=
 =?us-ascii?Q?W9hsaIMS8V47N5+i1l4npjZEBicUbi1SG+udSHeUpcfmfU4QAJvesQxxCWEW?=
 =?us-ascii?Q?813Io+9IDxdJShUrNZtuVgsTfb82XaBdKBSqzRdrZwljWoMhL5T+yceVINbw?=
 =?us-ascii?Q?wBsSHAmlqDYDgG4eJMGVqEifOnhMc0WHHTA/t2LQKKol/JJ6jF1XGJ37U8vj?=
 =?us-ascii?Q?tCxJNeLEczEnkxSsTsqRoU0x4emQ/fyWvZHJ+GwxoPQdqXIdbi2JFRu23HvW?=
 =?us-ascii?Q?RvlOBgQNLMPmTJ6kY48vNhvV21Ztn9diqvUocDJuLkXpwgEOhml4/2BjjhKk?=
 =?us-ascii?Q?ONb3vFpv9nlcVjPZu4LxC0REVvRqhPFYfRfl7UXJz3T+wyq1kK8vryICKAdh?=
 =?us-ascii?Q?yEhle7T9yObd8CiiDvgge7X69wqnYeR0JvKDHoh+VVGN3YoQqGG+TAtgTKnx?=
 =?us-ascii?Q?JRrJDyBFp2/sThol62Dfm74k7kb6qKX9MC9ZZY7p+1/MOohecvkZgxkSo+n8?=
 =?us-ascii?Q?xVN8isE7Mvbfo6U1yJ9VdG1aaUdtpLQMKBLXlHvffmP0yUv12PNyAncH+Dks?=
 =?us-ascii?Q?e3Z+tUOWwh9JTRKGv+mp3ivP2ZHELVSkRkXYQ2vV+l37sm8J7kfS/850kSUo?=
 =?us-ascii?Q?lrgHgsnJUPKkX3M3Sof6MZwFyab17WTIKafdHzZErRLyYoqtf6szU+hE6LW/?=
 =?us-ascii?Q?fodde2bxOxDfMeq9bnNLmrhnDSXYEv0AihJGSVk8EKMsFNScOJ5AA0RgptvP?=
 =?us-ascii?Q?B+PPqfvHu+0lPybv8gsn+7mmT63tM7O0gayIrlBpJA11H9McsCsOzc5F+F38?=
 =?us-ascii?Q?1fP2e10Zpr29gBF2AeafpBoa0mVt+4DkchGg4LtbMWQwM/9ZZ0oKJkgNWO5t?=
 =?us-ascii?Q?gJBVgSdcvtfMNlv7TaQmDj6tCrdTJly88dREi3QwEFV+Jna90zVv4jUeLG+m?=
 =?us-ascii?Q?7jIy9AcQM9RszLpimZ/jc7Hxkssdg/XAa6fkGpsw5DytOCt9TMJWZ1JvqnVb?=
 =?us-ascii?Q?VA9eP5d9gXsQSbBdza6PZ39EjLhKXLtLZDEeD6wFojNhWTcua16GSUOjuf6X?=
 =?us-ascii?Q?QkCKRvoTtVWBXY+1wszMKEnQtrHg1TQE?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 08:25:28.3086
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd40afde-3d90-49b2-6d79-08dd143d35be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9043

When running as Xen dom0 PVH guest, MADT table is customized
and may have the "wrong" UID processor number, which is
inconsistent with the UID in Processor entry in native DSDT.

As a result, during ACPI boot-up for dom0, linux fails to set
up proper processor logical id <-> physical id map(acpi_map_cpuid).
Furthermore, It leads to that some ACPI processor feature data,
like per-cpu cpc_desc structure, failed to be correctly stored.

In order to re-parse _CPC entry later for delivering correct data
in performance hypercall, firstly, we extract parsing logic from
acpi_cppc_processor_probe() and export it as a new function
acpi_cppc_processor_parse().

Also, replace logical processor id with ACPI ID, to show correct print
info in Xen dom0 PVH guest.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 drivers/acpi/cppc_acpi.c | 95 +++++++++++++++++++++++-----------------
 1 file changed, 54 insertions(+), 41 deletions(-)

diff --git a/drivers/acpi/cppc_acpi.c b/drivers/acpi/cppc_acpi.c
index c3fc2c05d868..40e1fce629aa 100644
--- a/drivers/acpi/cppc_acpi.c
+++ b/drivers/acpi/cppc_acpi.c
@@ -675,19 +675,11 @@ static int pcc_data_alloc(int pcc_ss_id)
 static inline void arch_init_invariance_cppc(void) { }
 #endif
 
-/**
- * acpi_cppc_processor_probe - Search for per CPU _CPC objects.
- * @pr: Ptr to acpi_processor containing this CPU's logical ID.
- *
- *	Return: 0 for success or negative value for err.
- */
-int acpi_cppc_processor_probe(struct acpi_processor *pr)
+static int acpi_cppc_processor_parse(struct acpi_processor *pr, struct cpc_desc *cpc_ptr)
 {
 	struct acpi_buffer output = {ACPI_ALLOCATE_BUFFER, NULL};
 	union acpi_object *out_obj, *cpc_obj;
-	struct cpc_desc *cpc_ptr;
 	struct cpc_reg *gas_t;
-	struct device *cpu_dev;
 	acpi_handle handle = pr->handle;
 	unsigned int num_ent, i, cpc_rev;
 	int pcc_subspace_id = -1;
@@ -706,31 +698,24 @@ int acpi_cppc_processor_probe(struct acpi_processor *pr)
 	status = acpi_evaluate_object_typed(handle, "_CPC", NULL, &output,
 			ACPI_TYPE_PACKAGE);
 	if (ACPI_FAILURE(status)) {
-		ret = -ENODEV;
-		goto out_buf_free;
+		return -ENODEV;
 	}
 
 	out_obj = (union acpi_object *) output.pointer;
 
-	cpc_ptr = kzalloc(sizeof(struct cpc_desc), GFP_KERNEL);
-	if (!cpc_ptr) {
-		ret = -ENOMEM;
-		goto out_buf_free;
-	}
-
 	/* First entry is NumEntries. */
 	cpc_obj = &out_obj->package.elements[0];
 	if (cpc_obj->type == ACPI_TYPE_INTEGER)	{
 		num_ent = cpc_obj->integer.value;
 		if (num_ent <= 1) {
 			pr_debug("Unexpected _CPC NumEntries value (%d) for CPU:%d\n",
-				 num_ent, pr->id);
-			goto out_free;
+				 num_ent, pr->acpi_id);
+			goto out_pointer;
 		}
 	} else {
 		pr_debug("Unexpected _CPC NumEntries entry type (%d) for CPU:%d\n",
-			 cpc_obj->type, pr->id);
-		goto out_free;
+			 cpc_obj->type, pr->acpi_id);
+		goto out_pointer;
 	}
 
 	/* Second entry should be revision. */
@@ -739,18 +724,18 @@ int acpi_cppc_processor_probe(struct acpi_processor *pr)
 		cpc_rev = cpc_obj->integer.value;
 	} else {
 		pr_debug("Unexpected _CPC Revision entry type (%d) for CPU:%d\n",
-			 cpc_obj->type, pr->id);
-		goto out_free;
+			 cpc_obj->type, pr->acpi_id);
+		goto out_pointer;
 	}
 
 	if (cpc_rev < CPPC_V2_REV) {
 		pr_debug("Unsupported _CPC Revision (%d) for CPU:%d\n", cpc_rev,
-			 pr->id);
-		goto out_free;
+			 pr->acpi_id);
+		goto out_pointer;
 	}
 
 	/*
-	 * Disregard _CPC if the number of entries in the return pachage is not
+	 * Disregard _CPC if the number of entries in the return package is not
 	 * as expected, but support future revisions being proper supersets of
 	 * the v3 and only causing more entries to be returned by _CPC.
 	 */
@@ -758,8 +743,8 @@ int acpi_cppc_processor_probe(struct acpi_processor *pr)
 	    (cpc_rev == CPPC_V3_REV && num_ent != CPPC_V3_NUM_ENT) ||
 	    (cpc_rev > CPPC_V3_REV && num_ent <= CPPC_V3_NUM_ENT)) {
 		pr_debug("Unexpected number of _CPC return package entries (%d) for CPU:%d\n",
-			 num_ent, pr->id);
-		goto out_free;
+			 num_ent, pr->acpi_id);
+		goto out_pointer;
 	}
 	if (cpc_rev > CPPC_V3_REV) {
 		num_ent = CPPC_V3_NUM_ENT;
@@ -793,7 +778,7 @@ int acpi_cppc_processor_probe(struct acpi_processor *pr)
 						goto out_free;
 				} else if (pcc_subspace_id != gas_t->access_width) {
 					pr_debug("Mismatched PCC ids in _CPC for CPU:%d\n",
-						 pr->id);
+						 pr->acpi_id);
 					goto out_free;
 				}
 			} else if (gas_t->space_id == ACPI_ADR_SPACE_SYSTEM_MEMORY) {
@@ -848,7 +833,7 @@ int acpi_cppc_processor_probe(struct acpi_processor *pr)
 			memcpy(&cpc_ptr->cpc_regs[i-2].cpc_entry.reg, gas_t, sizeof(*gas_t));
 		} else {
 			pr_debug("Invalid entry type (%d) in _CPC for CPU:%d\n",
-				 i, pr->id);
+				 i, pr->acpi_id);
 			goto out_free;
 		}
 	}
@@ -864,6 +849,45 @@ int acpi_cppc_processor_probe(struct acpi_processor *pr)
 		cpc_ptr->cpc_regs[i].cpc_entry.int_value = 0;
 	}
 
+	pr_debug("Parsed _CPC entry for CPU: %d\n", pr->acpi_id);
+	kfree(output.pointer);
+	return 0;
+
+ out_free:
+	/* Free all the mapped sys mem areas for this CPU */
+	for (i = 2; i < cpc_ptr->num_entries; i++) {
+		void __iomem *addr = cpc_ptr->cpc_regs[i-2].sys_mem_vaddr;
+
+		if (addr)
+			iounmap(addr);
+	}
+ out_pointer:
+	kfree(output.pointer);
+	return ret;
+}
+
+/**
+ * acpi_cppc_processor_probe - Search for per CPU _CPC objects.
+ * @pr: Ptr to acpi_processor containing this CPU's logical ID.
+ *
+ *	Return: 0 for success or negative value for err.
+ */
+int acpi_cppc_processor_probe(struct acpi_processor *pr)
+{
+	acpi_handle handle = pr->handle;
+	struct cpc_desc *cpc_ptr;
+	struct device *cpu_dev;
+	int pcc_subspace_id = -1;
+	int ret = -ENODATA;
+
+	cpc_ptr = kzalloc(sizeof(struct cpc_desc), GFP_KERNEL);
+	if (!cpc_ptr)
+		return -ENOMEM;
+
+	ret = acpi_cppc_processor_parse(pr, cpc_ptr);
+	if (ret)
+		goto out_free;
+	pcc_subspace_id = per_cpu(cpu_pcc_subspace_idx, pr->id);
 
 	/* Store CPU Logical ID */
 	cpc_ptr->cpu_id = pr->id;
@@ -907,21 +931,10 @@ int acpi_cppc_processor_probe(struct acpi_processor *pr)
 
 	arch_init_invariance_cppc();
 
-	kfree(output.pointer);
 	return 0;
 
 out_free:
-	/* Free all the mapped sys mem areas for this CPU */
-	for (i = 2; i < cpc_ptr->num_entries; i++) {
-		void __iomem *addr = cpc_ptr->cpc_regs[i-2].sys_mem_vaddr;
-
-		if (addr)
-			iounmap(addr);
-	}
 	kfree(cpc_ptr);
-
-out_buf_free:
-	kfree(output.pointer);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(acpi_cppc_processor_probe);
-- 
2.34.1


