Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A971397A86D
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 22:51:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799692.1209663 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqIfq-000153-Ak; Mon, 16 Sep 2024 20:50:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799692.1209663; Mon, 16 Sep 2024 20:50:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqIfq-00011s-7F; Mon, 16 Sep 2024 20:50:18 +0000
Received: by outflank-mailman (input) for mailman id 799692;
 Mon, 16 Sep 2024 20:50:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lWUd=QO=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1sqIfp-00011m-AY
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 20:50:17 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20619.outbound.protection.outlook.com
 [2a01:111:f403:2418::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4593a197-746d-11ef-a0b7-8be0dac302b0;
 Mon, 16 Sep 2024 22:50:14 +0200 (CEST)
Received: from BL0PR05CA0024.namprd05.prod.outlook.com (2603:10b6:208:91::34)
 by CY8PR12MB7756.namprd12.prod.outlook.com (2603:10b6:930:85::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Mon, 16 Sep
 2024 20:50:09 +0000
Received: from BL02EPF00021F6B.namprd02.prod.outlook.com
 (2603:10b6:208:91:cafe::1c) by BL0PR05CA0024.outlook.office365.com
 (2603:10b6:208:91::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Mon, 16 Sep 2024 20:50:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00021F6B.mail.protection.outlook.com (10.167.249.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Mon, 16 Sep 2024 20:50:09 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Sep
 2024 15:50:08 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 16 Sep 2024 15:50:07 -0500
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
X-Inumbo-ID: 4593a197-746d-11ef-a0b7-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OSptoJIQeJQPH1nccgXsAqRswcwfCJevQgb9lNjex8DLNOqgtI0Ty5A6dxKYmJOdIvf7fuKAmL6+fVyC66bozPGkcwILPyy79jQ07894wM8iv0D4Y2aKalYMF9df45ba1rsdpnddNuf2OVS3TXzINvFqR3hOyLI5u30IGK1w7mwSHPpg4x9LpUPlUU8HvizhfKR1Plks8LgVTwWjgFnGrj3kIUp4fbf3TN53cigSUT5UCMLqc3cF0AO1K8GDdCeZgnA+OkP9SJ1F3ezQRgqT02y2Q+etV2+tAaIDlvo/tMz1tIrERxnC5LppAXhvjWq3k0saryWAeq4TwM4PY07KrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVBV2cb7bPBr1Tftid2eT5WVe4Xttg70FFRroT1A8c4=;
 b=AB+RgJCyRBhjAc3VNOuvZ+VUsZHw4YstA4RoO53lc8hgl0HrMWpfhh7uBFTqmFKy9e0IOQYEp5TGaxR13iSjY+cxY8RroDXiFlqvu742xSfJ03rmjAUTYf90jUcOIXE7xJxBMd48SAJfX0/9FU3zNfk7O4dlmrIZZLp8x2nBA0WKXBQDG6w+zbpp/RZbWWmSdxwUkqrKDjky/BupJLPYPXs0qxV0AZPGbgSZ/XKrjcH9QVca6uN+yYrUIevj2lKM9ShgvXE1uLr38IB/epUlNWYyAdwu0gbUPZKUZA1Q2Kb8nktli8YRWFOVfM9YFwWPKPlLOcd4L7n6TAJ2PCezRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVBV2cb7bPBr1Tftid2eT5WVe4Xttg70FFRroT1A8c4=;
 b=yCmVNWG/Jy/VlrcEcrP/3Z0Mo3vcTScqEkZkrOaYNhtbFDMMobqSoHEMjpOnGevHXMNbw/0WFrFISrFdotm+vaQzRrblrfUnrDYyJkmT52Vb87bTgpqjaqAJBoet/2lRBCSLB1/uSbcmTFN3weHdIuty/dqO4ToIWZLKnx5z76U=
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
CC: Roger Pau Monne <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2] xen/acpi: upload power and performance related data from a PVH dom0
Date: Mon, 16 Sep 2024 16:50:07 -0400
Message-ID: <20240916205009.52887-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6B:EE_|CY8PR12MB7756:EE_
X-MS-Office365-Filtering-Correlation-Id: 257e8309-8f63-41fd-d210-08dcd6912730
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d1NKU0lOSzE5T05WaXVpUE5vMnpzNXFtNHFiRTN1OE93NjY0aHhjdDVvdGY4?=
 =?utf-8?B?NDlNS245RnJDMmZSSGxLS3pGVjhxdGkzdjB3ODlxVEJQN2FiYnd5czlWSEtx?=
 =?utf-8?B?UXUzcU1jd0YrenRDQnFDTjZkc0hLcDBOc3hNblFWSktLNDVFQkhIdG5NREtH?=
 =?utf-8?B?NVVaRXhhb2ltdUo5N0pEamowajVMTm9XWC90eDNtV0FvWjgycXplWTJ0SnBr?=
 =?utf-8?B?REQzTmdySlVleVVud2RQV09JU0xmajBqSjVsOGVMcytiNmRFaWVpRmhuSUg2?=
 =?utf-8?B?V2luU2dRRjNwRFJscjEvc3lBT1pwSEJFZ0l1a0tWRzM0Q3NmYzlTWlJiWVJB?=
 =?utf-8?B?OGI0eHlHaWtXWlBKeVQ1R0U5MkJoSDlsTHZJS1JxOUFPNjlmZHRtZUY5RHFj?=
 =?utf-8?B?M0hDcVQwbzdRdnZKc1BOUm9sQzdlendGUmNrZ2MyWG5LTE9ZdTFWU2ZDb2Zn?=
 =?utf-8?B?RFE3YzZ5R3I0Q2dMZ2pQNXg2dHRZeDBsaENsVW9QTVBPaTFRUTBHeHhuYlRm?=
 =?utf-8?B?SER2YmJSK0h5OFZ1RWc0eDNvRVFEY0lCZUJ5RVJDdWdia3VuZzZKaFBWdDVQ?=
 =?utf-8?B?eVFXVTNSd1VJa0JIbTFiTmh0MTQxZnE5S2ZSN25keHdlNGdBQzIxeGRQVHpK?=
 =?utf-8?B?MUZ3eUZPK2FOc2hnQkpWOGFZSDloSDhvNmtzeWVpdjIyUWlvMktBVkZxcFVW?=
 =?utf-8?B?MWc3U1hkUHp3Wno1LzFnazNjcmN6VVdKYm9UVTkvOCtHRGY0dE4yYS9hYTdw?=
 =?utf-8?B?YkFoYU1qckVmT21LVXl4d0p3bHp6NVRLVklQWHZTUXA4aWFlek1nWll0VmFC?=
 =?utf-8?B?d3RBMUd2RmFrOEhHei9wVFR0TzY5NGJqMXZSU29Ld05FYmhNREpJK1NXZFVE?=
 =?utf-8?B?M3lBL0N3Z1pnWXZWZjAxbEZ4T29TV0djS0FhUDFjeTgxM3FZUmdkOHhWQ1Q0?=
 =?utf-8?B?R0NOS2RUVzI2T3poZ3crUU9NVEtpbjBQeCsxV3JBTGFsVGVMYUhXU0cvUzhW?=
 =?utf-8?B?ZnBTcldFU3dLK3VyNTZzNXZENzIreUJWQkloR08xQjZhamlJU0lZbXRMV1ZX?=
 =?utf-8?B?Z0xOK0hNUTY1MEM3OXRFaDJ5RDJ2Z2tIay8rUVd1T2xWYnZFM0VEN0lramZB?=
 =?utf-8?B?TkJ1dXRUVkFZeExBRWU5RGVSNGFLSzRsMWlLWER4cUducElJM3ZTMzFVNW5v?=
 =?utf-8?B?Y2xJSzY4dE9saXh2M1VnVHJqK2lJMFJyQUcwRHVuckhoTmZmZVFVRmZnODlr?=
 =?utf-8?B?Vjl6VmtWbnJLSXN4a2pRK2g2Y1drMlFDWnA0VHl0R09pOTRtWjMvQnZtbnpq?=
 =?utf-8?B?RzdJMkdHNDRHOG8xMHQwMGQ1cUlsS0dnSEpjeEE3SHJTUFE3bGRnMU5KNkJ5?=
 =?utf-8?B?K1NnWS84RWd6Z21OUi94ODk0dldEYzV0WDRhRDBTS0dBc2FIQmdEQkxWVzRJ?=
 =?utf-8?B?bTlHYVAxQzRDTU1QTHJEc0psM0hZNFZOQTlnUHoyaU5tWlphRmFMbGRDbElh?=
 =?utf-8?B?WG5EUHA5Tml6U1RQclYrVUhHNGg1M3A2anNIZEpadFNVMzRKMFZGM200dkh1?=
 =?utf-8?B?S1UzRkcwRkpMT2dvTUhFdXNNbUh0eVBiMnh5UFVqdFFGellsZEM1K01LQ3pY?=
 =?utf-8?B?SWNxUlJhUWlVVWRiNEVMbHBNWGQ3OXk4UzZDZ3dRcnAveW8yWG9yaDBZSGph?=
 =?utf-8?B?bTh0QnhqQWNDcXZCUngxTVp1T1J3NisrbkY1L3k3UTZBK1FsTnZna0ZkUUdV?=
 =?utf-8?B?dDZTUHhrRUd0Vkp3OXpQeWwrRHJRWG82WEJ2aXEvZGQyKzJKSlRGNnV2SmFs?=
 =?utf-8?B?cHRKWEoydElzdUtGL0NXeG9mL3QxZTBTSUJwVitrTlpMWDNoYmJYSGVOeXlE?=
 =?utf-8?B?V0pEejZpcGs1TEFGQVRzSUF3Sjd3bWxpL0ozRTJYcUgwNkhOMGk0MVNOSWxG?=
 =?utf-8?Q?l3jkJAK71QSv3FU1Cs4m0/qvzoczTtMq?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2024 20:50:09.3536
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 257e8309-8f63-41fd-d210-08dcd6912730
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F6B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7756

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

Running a PVH Dom0 on AMD, I needed this v2 change to get the C-State
information uploaded.

---
 drivers/xen/pcpu.c               |   3 +-
 drivers/xen/xen-acpi-processor.c | 230 ++++++++++++++++++++++++++++---
 include/xen/xen.h                |   2 +-
 3 files changed, 216 insertions(+), 19 deletions(-)

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
index 296703939846..c17f5bb8e49e 100644
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
@@ -354,24 +511,44 @@ read_acpi_id(acpi_handle handle, u32 lvl, void *context, void **rv)
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
+		int rc;
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
+			pr_debug("ACPI CPU%u failed to get performance data\n",
+				 acpi_id);
+		rc = xen_acpi_processor_evaluate_cst(handle, &pr->power);
+		if (rc)
+			pr_debug("ACPI CPU%u failed to get _CST data\n", acpi_id);
+
+		pr_initialized = true;
+	}
+
 	/* It has P-state dependencies */
 	if (!acpi_processor_get_psd(handle, &acpi_psd[acpi_id])) {
 		pr_debug("ACPI CPU%u w/ PST:coord_type = %llu domain = %llu\n",
@@ -379,11 +556,13 @@ read_acpi_id(acpi_handle handle, u32 lvl, void *context, void **rv)
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
 
@@ -392,8 +571,7 @@ read_acpi_id(acpi_handle handle, u32 lvl, void *context, void **rv)
 static int check_acpi_ids(struct acpi_processor *pr_backup)
 {
 
-	if (!pr_backup)
-		return -ENODEV;
+	BUG_ON(!pr_backup);
 
 	if (acpi_id_present && acpi_id_cst_present)
 		/* OK, done this once .. skip to uploading */
@@ -422,8 +600,8 @@ static int check_acpi_ids(struct acpi_processor *pr_backup)
 
 	acpi_walk_namespace(ACPI_TYPE_PROCESSOR, ACPI_ROOT_OBJECT,
 			    ACPI_UINT32_MAX,
-			    read_acpi_id, NULL, NULL, NULL);
-	acpi_get_devices(ACPI_PROCESSOR_DEVICE_HID, read_acpi_id, NULL, NULL);
+			    read_acpi_id, NULL, pr_backup, NULL);
+	acpi_get_devices(ACPI_PROCESSOR_DEVICE_HID, read_acpi_id, pr_backup, NULL);
 
 upload:
 	if (!bitmap_equal(acpi_id_present, acpi_ids_done, nr_acpi_bits)) {
@@ -464,6 +642,7 @@ static int xen_upload_processor_pm_data(void)
 	struct acpi_processor *pr_backup = NULL;
 	int i;
 	int rc = 0;
+	bool free_perf = false;
 
 	pr_info("Uploading Xen processor PM info\n");
 
@@ -473,12 +652,29 @@ static int xen_upload_processor_pm_data(void)
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


