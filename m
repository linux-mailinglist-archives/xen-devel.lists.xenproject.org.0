Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D219E2F50
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 23:54:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848281.1263212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIbm1-00047U-7P; Tue, 03 Dec 2024 22:53:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848281.1263212; Tue, 03 Dec 2024 22:53:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIbm1-00044X-4W; Tue, 03 Dec 2024 22:53:41 +0000
Received: by outflank-mailman (input) for mailman id 848281;
 Tue, 03 Dec 2024 22:53:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BnMR=S4=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tIbm0-00044R-5p
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 22:53:40 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2416::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d5f6853-b1c9-11ef-99a3-01e77a169b0f;
 Tue, 03 Dec 2024 23:53:37 +0100 (CET)
Received: from BYAPR07CA0087.namprd07.prod.outlook.com (2603:10b6:a03:12b::28)
 by CY5PR12MB6105.namprd12.prod.outlook.com (2603:10b6:930:2a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 22:53:29 +0000
Received: from MWH0EPF000971E4.namprd02.prod.outlook.com
 (2603:10b6:a03:12b:cafe::8b) by BYAPR07CA0087.outlook.office365.com
 (2603:10b6:a03:12b::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.17 via Frontend Transport; Tue,
 3 Dec 2024 22:53:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E4.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Tue, 3 Dec 2024 22:53:29 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Dec
 2024 16:53:28 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Dec
 2024 16:53:28 -0600
Received: from amd-BIRMANPLUS.mshome.net (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 3 Dec 2024 16:53:27 -0600
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
X-Inumbo-ID: 6d5f6853-b1c9-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RxIBrZ+qohD9VdQRnDtgId6ZLGxmlIrbKPgav5YrnwYYldLwbTHMhgYC4NUzINBvyeIW/us87eDrZQNYKOiviSG4w+Op6C1b4UAHKGkRnzYsK1t5CQRgldxUkFfuugJ3rj/b+y9RGu/UHRBU1pMRl59B9dNA+nl4jjb9R+h8iSJ3OKQTRxQfJtONmQrBcmYJBqsvukQS7ClqbYRq1K3ceLpl0V+988BZS2BBzFafvzM/XmxtWzW4QsKLLboBr36K9y2KeBi58KOubtZi2UR3uXOc1MSc8iOpJssf1vtxnoiQurpywfgUmtGOFt1nPIX91pXQoDr2QYizErnNU+UNVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=buKuJRQISbtaWxtySk3tsXXCvGMq1tZmcfuosqxgBs8=;
 b=NK18/WgRtiTOLBUmbRvHZ9MHkq4Up9swiSLGr1/1aZTktnAzQVDUG4NCXRdXQXjrthR8spg+c7qKFLDLU8BTc5nw4PSyQIsF4U+LbOJlvotrm9UB7V9q+4FXXGsCNb3K5cT+moJJ7uqo/cagC7ZdhS23uX0Ps7hWnzySH4Vpii2sCzIFlLe8Ijolg/BHG4Ub5eXjvgcmfGT21FhH9imaJqsISqhMAU+bSMtY8D5hNuStqWVCZ7+RyU6fHIGeZtsq6xsvWa874EOdjqzkoKtaG4gse8IIeW6zlm7eBVtE2ag2boP3VtiKIqNqNACeTUqaUUq4dPbFNiCUx5EpZVtQPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=buKuJRQISbtaWxtySk3tsXXCvGMq1tZmcfuosqxgBs8=;
 b=JjQpvTjZv9IQyjhlG/enYKBDmsXbTs0zbBhdPVa9Uv3P0L9HWfbyBPLeqaePWSEmSZGy+gQ7iPuVJrdLi+j/PfnNSHJX8l2DvS8UiSApVsAI1xMk7vxELypq+l4hcJTxfWca1X1zB/w4xrgx7j+++ydcPNwmUMo1MFwsglNf5p0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
CC: Penny Zheng <penny.zheng@arm.com>, Roger Pau Monne <roger.pau@citrix.com>,
	Jason Andryuk <jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v3] xen/acpi: upload power and performance related data from a PVH dom0
Date: Tue, 3 Dec 2024 17:53:37 -0500
Message-ID: <20241203225338.1336-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E4:EE_|CY5PR12MB6105:EE_
X-MS-Office365-Filtering-Correlation-Id: 605e909e-da62-447d-2bf1-08dd13ed4dfb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eUVyclF4TGpWY0JVemo5MEtidTNuNEEwK1E5VGtmR3VJNmFlRU42Y1BEOWhu?=
 =?utf-8?B?WXNESCtjZmw5RElzYjlNYkxXRDNuZTNtQzg3OGtSMGtKWHdSRVdyTnRIeXll?=
 =?utf-8?B?SlBkUy9objlIMHJBRVUvKzhOajR4eGx6NWcrOWpkZFEvNTJabFd0Umxuellh?=
 =?utf-8?B?MDZBR1k0OE9oSlJ3OEkxUXcrYklBcUwyWDNLZnBQdnhaY3NtYm9YWllIYmFm?=
 =?utf-8?B?ZHRXQVcxM042cmZ1aHNJTHNXZHVaaG05bmpYTXVHbmFLYWdhK01USnJBZTRz?=
 =?utf-8?B?YVFRZ1NBNXl4MEgvL21JVmJia0dSczBCaWdyNGxtaGEyeWxhaTV2MzRJUjFH?=
 =?utf-8?B?TGVtM3U2dllDM2l6NWZiUVRvSVdmTEpLR1kvL0MxM2c3VWRuNzFqcFBJVHJw?=
 =?utf-8?B?QjcyRENtQVZHemVQbzhoZVZrM1JLQkJDZzFjWDU1NnFweUJEUURqZWdUOUl1?=
 =?utf-8?B?bTBFRytFZ1ZhUy9uK1J0T2EwSmxwWWt3T2dLb2szc3VTM3FuZlBBeCtRQ2x5?=
 =?utf-8?B?TTRkOVlmMWF1ZHM4OExkbTcySXhhOVRlaW81V2IrM2VsOWwwU0d6UmRBN1Mw?=
 =?utf-8?B?WU0rNkkzUDVocElxUHdQK1V2K3hLV3ZVUE55a1R6a0JlTDY5ODkybEovM2Ji?=
 =?utf-8?B?RnBnTGVtOWRFNnJxQ0t3YVYvY0hDZVBkaXE4T3BPTWcweTJ1cWVuczBpcFpp?=
 =?utf-8?B?Q3YwQ3hrZHRiRzhKbC9yR1N5UElFaXhYcmc3Z2FHL0NDdHJtQlJha0traE5y?=
 =?utf-8?B?ZENEbGxUTG5HejhSMUtOUTBHOTZDMU5icnViL3NZTzlpTk4xZUJYR0xRd2hy?=
 =?utf-8?B?R29XSVhlWndVcDYvc01vMVBzTVlMZXFZNVVXNk1PbG9QalpJeW5WL2IxMVls?=
 =?utf-8?B?NkFJOXBETnZxMGluSjJONitUc2pNck5BOGhkaDZRc25UaXVZc2RPbXd0bXYw?=
 =?utf-8?B?OHJYVXJSU0VPaXYwK0xwVW4wa3BXWG0wMVIzOUQvK1FKQnczZVdTR1IyamFM?=
 =?utf-8?B?ZG9ZelhNemRrQTJUUWhBeXpwWlduWjFDcHcyaExrcENkcGUvKzdwMUJPY0Vw?=
 =?utf-8?B?cUs2b0pDdHZRZ1E4SVNReHYreUJuMlR6NU5JSEUvSU53ZWFkU0hiQVlTRkxr?=
 =?utf-8?B?Ty9BQytGTTEwSmxRYkNJRldRbWRNR25Vb29sVmFhRUVYL1dHRFVMdHdRNnF1?=
 =?utf-8?B?V2VLK3Bmb1RHdzJ2Y1BxRHVXTWc3VVJLSnVPVjZpK2lQd1k5VldrWE9zNzBm?=
 =?utf-8?B?TVRmQXlleTdNRy9ybXFNL3FtM0hhRUllaGtzdkVFVUVYQW94czlpdWVZcXFT?=
 =?utf-8?B?clhUYW1WOVhaNE9DbUhxVktOZ2l5TWJyb3pNa0p4bFdueEc1QmtGRnB6UHpz?=
 =?utf-8?B?a3ZuS2VhMDJ1Tyt2Z2xkSVZqVHlXOEpZcGxudllsQ1BXM2lQMENpTkJ2L2ZW?=
 =?utf-8?B?QnpxV1d0WE9tMjdqcnJSTURpenR5eTM3K3NTRjJQeSs4c1pBeEdRZ1ZoWW1R?=
 =?utf-8?B?RVdKL3NrZzVJdnhPaVowejU4dlFUZVg4dmhwTzZJYkZCTVJKVzJBbC84bk44?=
 =?utf-8?B?T2djOFNJSlc2ckFQODg3L1dHcW0vNHBLYmYzeGJnR2ZHa0loMUFLZmhoV0dL?=
 =?utf-8?B?MHRzVnFlK1R4YmlRSE5BTk5JQThnemFBYXNqQVRQd0JIS2NyZG9XOXc1dGta?=
 =?utf-8?B?Nzl4VUhYVkQ4VkVXaWN2V1M3UzBLVHFxNVlhemQwb0R1b0xEbzVFMjdXa2tu?=
 =?utf-8?B?NFRlVzF4STZqQ0JCZzJZWVN0MTZ1ZEFPbHcrWjcyTERaMGo2cjVjYUEvaUJX?=
 =?utf-8?B?Y0pBdmhEZUhzdllXb3RNb2xxeEQ4K2k3czVrWFBhS256VEFlRHpiaFRwYWJH?=
 =?utf-8?B?L0dHY3JyT1JCVHYvZlI1YXlBbVpmakU4MnVZcjYvcHhYU0wxNzJkdmpGV0lM?=
 =?utf-8?Q?88iwSQ+fu2rUL3+hZGTmAbfi9D+5p2gy?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 22:53:29.1243
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 605e909e-da62-447d-2bf1-08dd13ed4dfb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6105

From: Roger Pau Monne <roger.pau@citrix.com>

When running as a PVH dom0 the ACPI MADT is crafted by Xen in order to
report the correct numbers of vCPUs that dom0 has, so the host MADT is
not provided to dom0.  This creates issues when parsing the power and
performance related data from ACPI dynamic tables, as the ACPI
Processor UIDs found on the dynamic code are likely to not match the
ones crafted by Xen in the dom0 MADT.

Xen would rely on Linux having filled at least the power and
performance related data of the vCPUs on the system, and would clone
that information in order to setup the remaining pCPUs on the system
if dom0 vCPUs < pCPUs.  However when running as PVH dom0 it's likely
that none of dom0 CPUs will have the power and performance data
filled, and hence the Xen ACPI Processor driver needs to fetch that
information by itself.

In order to do so correctly, introduce a new helper to fetch the _CST
data without taking into account the system capabilities from the
CPUID output, as the capabilities reported to dom0 in CPUID might be
different from the ones on the host.

Note that the newly introduced code will only fetch the _CST, _PSS,
_PPC and _PCT from a single CPU, and clone that information for all the
other Processors.  This won't work on an heterogeneous system with
Processors having different power and performance related data between
them.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v2:
Add second buffer for _CST.  Call was failing with
AE_BUFFER_OVERFLOW(0x000b)

v3:
Upgrade some failures to pr_err
Only set pr_initialized when acpi_processor_get_performance_info() and
xen_acpi_processor_evaluate_cst() both succeed.
Remove BUG_ON(!pr_backup) - checkpatch complains and the case is handled
earlier.
---
 drivers/xen/pcpu.c               |   3 +-
 drivers/xen/xen-acpi-processor.c | 232 ++++++++++++++++++++++++++++---
 include/xen/xen.h                |   2 +-
 3 files changed, 216 insertions(+), 21 deletions(-)

diff --git a/drivers/xen/pcpu.c b/drivers/xen/pcpu.c
index c63f317e3df3..dc9f2c14bf62 100644
--- a/drivers/xen/pcpu.c
+++ b/drivers/xen/pcpu.c
@@ -388,7 +388,7 @@ static int __init xen_pcpu_init(void)
 arch_initcall(xen_pcpu_init);
 
 #ifdef CONFIG_ACPI
-bool __init xen_processor_present(uint32_t acpi_id)
+bool xen_processor_present(uint32_t acpi_id)
 {
 	const struct pcpu *pcpu;
 	bool online = false;
@@ -403,6 +403,7 @@ bool __init xen_processor_present(uint32_t acpi_id)
 
 	return online;
 }
+EXPORT_SYMBOL_GPL(xen_processor_present);
 
 void xen_sanitize_proc_cap_bits(uint32_t *cap)
 {
diff --git a/drivers/xen/xen-acpi-processor.c b/drivers/xen/xen-acpi-processor.c
index 296703939846..e9f38f171240 100644
--- a/drivers/xen/xen-acpi-processor.c
+++ b/drivers/xen/xen-acpi-processor.c
@@ -48,6 +48,8 @@ static unsigned long *acpi_id_cst_present;
 /* Which ACPI P-State dependencies for a enumerated processor */
 static struct acpi_psd_package *acpi_psd;
 
+static bool pr_initialized;
+
 static int push_cxx_to_hypervisor(struct acpi_processor *_pr)
 {
 	struct xen_platform_op op = {
@@ -172,8 +174,13 @@ static int xen_copy_psd_data(struct acpi_processor *_pr,
 
 	/* 'acpi_processor_preregister_performance' does not parse if the
 	 * num_processors <= 1, but Xen still requires it. Do it manually here.
+	 *
+	 * Also init the field if not set, as that's possible if the physical
+	 * CPUs on the system doesn't match the data provided in the MADT when
+	 * running as a PVH dom0.
 	 */
-	if (pdomain->num_processors <= 1) {
+	if (pdomain->num_processors <= 1 ||
+	    dst->shared_type == CPUFREQ_SHARED_TYPE_NONE) {
 		if (pdomain->coord_type == DOMAIN_COORD_TYPE_SW_ALL)
 			dst->shared_type = CPUFREQ_SHARED_TYPE_ALL;
 		else if (pdomain->coord_type == DOMAIN_COORD_TYPE_HW_ALL)
@@ -313,6 +320,155 @@ static unsigned int __init get_max_acpi_id(void)
 	pr_debug("Max ACPI ID: %u\n", max_acpi_id);
 	return max_acpi_id;
 }
+
+/*
+ * Custom version of the native acpi_processor_evaluate_cst() function, to
+ * avoid some sanity checks done based on the CPUID data.  When running as a
+ * Xen domain the CPUID data provided to dom0 is not the native one, so C
+ * states cannot be sanity checked.  Leave it to the hypervisor which is also
+ * the entity running the driver.
+ */
+static int xen_acpi_processor_evaluate_cst(acpi_handle handle,
+					   struct acpi_processor_power *info)
+{
+	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *cst;
+	acpi_status status;
+	u64 count;
+	int last_index = 0;
+	int i, ret = 0;
+
+	status = acpi_evaluate_object(handle, "_CST", NULL, &buffer);
+	if (ACPI_FAILURE(status)) {
+		acpi_handle_debug(handle, "No _CST\n");
+		return -ENODEV;
+	}
+
+	cst = buffer.pointer;
+
+	/* There must be at least 2 elements. */
+	if (!cst || cst->type != ACPI_TYPE_PACKAGE || cst->package.count < 2) {
+		acpi_handle_warn(handle, "Invalid _CST output\n");
+		ret = -EFAULT;
+		goto end;
+	}
+
+	count = cst->package.elements[0].integer.value;
+
+	/* Validate the number of C-states. */
+	if (count < 1 || count != cst->package.count - 1) {
+		acpi_handle_warn(handle, "Inconsistent _CST data\n");
+		ret = -EFAULT;
+		goto end;
+	}
+
+	for (i = 1; i <= count; i++) {
+		union acpi_object *element;
+		union acpi_object *obj;
+		struct acpi_power_register *reg;
+		struct acpi_processor_cx cx;
+
+		/*
+		 * If there is not enough space for all C-states, skip the
+		 * excess ones and log a warning.
+		 */
+		if (last_index >= ACPI_PROCESSOR_MAX_POWER - 1) {
+			acpi_handle_warn(handle, "No room for more idle states (limit: %d)\n",
+					 ACPI_PROCESSOR_MAX_POWER - 1);
+			break;
+		}
+
+		memset(&cx, 0, sizeof(cx));
+
+		element = &cst->package.elements[i];
+		if (element->type != ACPI_TYPE_PACKAGE) {
+			acpi_handle_info(handle, "_CST C%d type(%x) is not package, skip...\n",
+					 i, element->type);
+			continue;
+		}
+
+		if (element->package.count != 4) {
+			acpi_handle_info(handle, "_CST C%d package count(%d) is not 4, skip...\n",
+				i, element->package.count);
+			continue;
+		}
+
+		obj = &element->package.elements[0];
+
+		if (obj->type != ACPI_TYPE_BUFFER) {
+			acpi_handle_info(handle, "_CST C%d package element[0] type(%x) is not buffer, skip...\n",
+					 i, obj->type);
+			continue;
+		}
+
+		reg = (struct acpi_power_register *)obj->buffer.pointer;
+
+		obj = &element->package.elements[1];
+		if (obj->type != ACPI_TYPE_INTEGER) {
+			acpi_handle_info(handle, "_CST C[%d] package element[1] type(%x) is not integer, skip...\n",
+					 i, obj->type);
+			continue;
+		}
+
+		cx.type = obj->integer.value;
+		/*
+		 * There are known cases in which the _CST output does not
+		 * contain C1, so if the type of the first state found is not
+		 * C1, leave an empty slot for C1 to be filled in later.
+		 */
+		if (i == 1 && cx.type != ACPI_STATE_C1)
+			last_index = 1;
+
+		cx.address = reg->address;
+		cx.index = last_index + 1;
+
+		switch (reg->space_id) {
+		case ACPI_ADR_SPACE_FIXED_HARDWARE:
+			cx.entry_method = ACPI_CSTATE_FFH;
+			break;
+
+		case ACPI_ADR_SPACE_SYSTEM_IO:
+			cx.entry_method = ACPI_CSTATE_SYSTEMIO;
+			break;
+
+		default:
+			acpi_handle_info(handle, "_CST C%d space_id(%x) neither FIXED_HARDWARE nor SYSTEM_IO, skip...\n",
+					 i, reg->space_id);
+			continue;
+		}
+
+		if (cx.type == ACPI_STATE_C1)
+			cx.valid = 1;
+
+		obj = &element->package.elements[2];
+		if (obj->type != ACPI_TYPE_INTEGER) {
+			acpi_handle_info(handle, "_CST C%d package element[2] type(%x) not integer, skip...\n",
+					 i, obj->type);
+			continue;
+		}
+
+		cx.latency = obj->integer.value;
+
+		obj = &element->package.elements[3];
+		if (obj->type != ACPI_TYPE_INTEGER) {
+			acpi_handle_info(handle, "_CST C%d package element[3] type(%x) not integer, skip...\n",
+					 i, obj->type);
+			continue;
+		}
+
+		memcpy(&info->states[++last_index], &cx, sizeof(cx));
+	}
+
+	acpi_handle_info(handle, "Found %d idle states\n", last_index);
+
+	info->count = last_index;
+
+end:
+	kfree(buffer.pointer);
+
+	return ret;
+}
+
 /*
  * The read_acpi_id and check_acpi_ids are there to support the Xen
  * oddity of virtual CPUs != physical CPUs in the initial domain.
@@ -331,6 +487,7 @@ read_acpi_id(acpi_handle handle, u32 lvl, void *context, void **rv)
 	unsigned long long tmp;
 	union acpi_object object = { 0 };
 	struct acpi_buffer buffer = { sizeof(union acpi_object), &object };
+	struct acpi_buffer cst_buf = { ACPI_ALLOCATE_BUFFER, NULL };
 	acpi_io_address pblk = 0;
 
 	status = acpi_get_type(handle, &acpi_type);
@@ -354,24 +511,45 @@ read_acpi_id(acpi_handle handle, u32 lvl, void *context, void **rv)
 	default:
 		return AE_OK;
 	}
-	if (invalid_phys_cpuid(acpi_get_phys_id(handle,
-						acpi_type == ACPI_TYPE_DEVICE,
-						acpi_id))) {
+
+	if (!xen_processor_present(acpi_id)) {
 		pr_debug("CPU with ACPI ID %u is unavailable\n", acpi_id);
 		return AE_OK;
 	}
-	/* There are more ACPI Processor objects than in x2APIC or MADT.
-	 * This can happen with incorrect ACPI SSDT declerations. */
-	if (acpi_id >= nr_acpi_bits) {
-		pr_debug("max acpi id %u, trying to set %u\n",
-			 nr_acpi_bits - 1, acpi_id);
-		return AE_OK;
-	}
+
 	/* OK, There is a ACPI Processor object */
 	__set_bit(acpi_id, acpi_id_present);
 
 	pr_debug("ACPI CPU%u w/ PBLK:0x%lx\n", acpi_id, (unsigned long)pblk);
 
+	if (!pr_initialized) {
+		struct acpi_processor *pr = context;
+		int rc, rc2;
+
+		/*
+		 * There's no CPU on the system that has any performance or
+		 * power related data, initialize all the required fields by
+		 * fetching that info here.
+		 *
+		 * Note such information is only fetched once, and then reused
+		 * for all pCPUs.  This won't work on heterogeneous systems
+		 * with different Cx anb/or Px states between CPUs.
+		 */
+
+		pr->handle = handle;
+
+		rc = acpi_processor_get_performance_info(pr);
+		if (rc)
+			pr_err("ACPI CPU%u failed to get performance data\n",
+			       acpi_id);
+		rc2 = xen_acpi_processor_evaluate_cst(handle, &pr->power);
+		if (rc2)
+			pr_err("ACPI CPU%u failed to get _CST data\n", acpi_id);
+
+		if (!rc && !rc2)
+			pr_initialized = true;
+	}
+
 	/* It has P-state dependencies */
 	if (!acpi_processor_get_psd(handle, &acpi_psd[acpi_id])) {
 		pr_debug("ACPI CPU%u w/ PST:coord_type = %llu domain = %llu\n",
@@ -379,11 +557,13 @@ read_acpi_id(acpi_handle handle, u32 lvl, void *context, void **rv)
 			 acpi_psd[acpi_id].domain);
 	}
 
-	status = acpi_evaluate_object(handle, "_CST", NULL, &buffer);
+	status = acpi_evaluate_object(handle, "_CST", NULL, &cst_buf);
 	if (ACPI_FAILURE(status)) {
 		if (!pblk)
 			return AE_OK;
 	}
+	kfree(cst_buf.pointer);
+
 	/* .. and it has a C-state */
 	__set_bit(acpi_id, acpi_id_cst_present);
 
@@ -391,10 +571,6 @@ read_acpi_id(acpi_handle handle, u32 lvl, void *context, void **rv)
 }
 static int check_acpi_ids(struct acpi_processor *pr_backup)
 {
-
-	if (!pr_backup)
-		return -ENODEV;
-
 	if (acpi_id_present && acpi_id_cst_present)
 		/* OK, done this once .. skip to uploading */
 		goto upload;
@@ -422,8 +598,8 @@ static int check_acpi_ids(struct acpi_processor *pr_backup)
 
 	acpi_walk_namespace(ACPI_TYPE_PROCESSOR, ACPI_ROOT_OBJECT,
 			    ACPI_UINT32_MAX,
-			    read_acpi_id, NULL, NULL, NULL);
-	acpi_get_devices(ACPI_PROCESSOR_DEVICE_HID, read_acpi_id, NULL, NULL);
+			    read_acpi_id, NULL, pr_backup, NULL);
+	acpi_get_devices(ACPI_PROCESSOR_DEVICE_HID, read_acpi_id, pr_backup, NULL);
 
 upload:
 	if (!bitmap_equal(acpi_id_present, acpi_ids_done, nr_acpi_bits)) {
@@ -464,6 +640,7 @@ static int xen_upload_processor_pm_data(void)
 	struct acpi_processor *pr_backup = NULL;
 	int i;
 	int rc = 0;
+	bool free_perf = false;
 
 	pr_info("Uploading Xen processor PM info\n");
 
@@ -473,12 +650,29 @@ static int xen_upload_processor_pm_data(void)
 		if (!_pr)
 			continue;
 
-		if (!pr_backup)
+		if (!pr_backup) {
 			pr_backup = kmemdup(_pr, sizeof(*_pr), GFP_KERNEL);
+			pr_initialized = true;
+		}
 		(void)upload_pm_data(_pr);
 	}
 
+	if (!pr_backup) {
+		pr_backup = kzalloc(sizeof(struct acpi_processor), GFP_KERNEL);
+		if (!pr_backup)
+			return -ENOMEM;
+		pr_backup->performance = kzalloc(sizeof(struct acpi_processor_performance),
+						 GFP_KERNEL);
+		if (!pr_backup->performance) {
+			kfree(pr_backup);
+			return -ENOMEM;
+		}
+		free_perf = true;
+	}
+
 	rc = check_acpi_ids(pr_backup);
+	if (free_perf)
+		kfree(pr_backup->performance);
 	kfree(pr_backup);
 
 	return rc;
diff --git a/include/xen/xen.h b/include/xen/xen.h
index a1e5b3f18d69..6ff3e2f40803 100644
--- a/include/xen/xen.h
+++ b/include/xen/xen.h
@@ -81,7 +81,7 @@ static inline void xen_free_unpopulated_pages(unsigned int nr_pages,
 #endif
 
 #if defined(CONFIG_XEN_DOM0) && defined(CONFIG_ACPI) && defined(CONFIG_X86)
-bool __init xen_processor_present(uint32_t acpi_id);
+bool xen_processor_present(uint32_t acpi_id);
 #else
 #include <linux/bug.h>
 static inline bool xen_processor_present(uint32_t acpi_id)
-- 
2.34.1


