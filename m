Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C79F19E3537
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2024 09:25:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848366.1263293 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIkhc-0004kK-GL; Wed, 04 Dec 2024 08:25:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848366.1263293; Wed, 04 Dec 2024 08:25:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIkhc-0004h1-Ag; Wed, 04 Dec 2024 08:25:44 +0000
Received: by outflank-mailman (input) for mailman id 848366;
 Wed, 04 Dec 2024 08:25:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p5h6=S5=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tIkha-0003co-M3
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2024 08:25:42 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20624.outbound.protection.outlook.com
 [2a01:111:f403:2418::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 585847ba-b219-11ef-99a3-01e77a169b0f;
 Wed, 04 Dec 2024 09:25:40 +0100 (CET)
Received: from BN0PR04CA0047.namprd04.prod.outlook.com (2603:10b6:408:e8::22)
 by CH3PR12MB8458.namprd12.prod.outlook.com (2603:10b6:610:155::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.20; Wed, 4 Dec
 2024 08:25:32 +0000
Received: from MN1PEPF0000ECD6.namprd02.prod.outlook.com
 (2603:10b6:408:e8:cafe::3d) by BN0PR04CA0047.outlook.office365.com
 (2603:10b6:408:e8::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.18 via Frontend Transport; Wed,
 4 Dec 2024 08:25:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD6.mail.protection.outlook.com (10.167.242.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Wed, 4 Dec 2024 08:25:32 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Dec 2024 02:25:29 -0600
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
X-Inumbo-ID: 585847ba-b219-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eb+PYAzenKc1lzpKqcbuEwB8f4SPCjFr7Ql6X127A4L2v0WgHoPEHohMXbjt7XQW33pml9prMVDWXs+imJ042kN5tRR+JjneaLSpxhVFV2zaJmz18dYKDTAY4T5js+zyDTbSrypgfsBO2OxtnBK84NV6byoU1iCN49JKSUvxiPzyPTrmPMaFuwGRyrqXyO08zGxIaD7kauDOpYpmRBd11JvL0blOy4ReQsD+G+ejK98d/UBr7zFQXE9935gniS5WNRiVhDzmPL9/tzdd92TT4ReeLY/38+o82/l+wyL39+WHaHt4DCUSafqsG0BRYiEUHmRk/28eOHHB4z58MXoKZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fE1NdC00ImjH8qXiIUgD1CcWY2B/oXHOxHCeQUc+8NI=;
 b=dN27TteJ2Yvm+pXfd07viowtatKAXvb8B9H1sBBiqDgvP1JnSgYz9yimg8QzaSF48Sm9+WUTbIUFRChFL5vw+D5sPK4D0sDHo/J6sQ6yDQPDJODiwM54uK4N8y0USBJ42CphtTkGTQSeIvfyL8zRr2strslGjUMdtvUv12ChUET9javMjUUSyqj3UgE91zCXkc+wWvUjoce4Unc9KfpyW+yNwCqbKX9C0vnpI2TlhzShWn9ZzdXnvpOhWpf99H9MU8Y0BVh+9NgkaxYXjS4TWYgM7HvMNUMPVaD9PMgLI+97vxXfspDhIqT6VTuGenSu+EUFKNrLFQ7uXiKetsN5xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fE1NdC00ImjH8qXiIUgD1CcWY2B/oXHOxHCeQUc+8NI=;
 b=yuroTZOHIw5tGwlycghtK1stLF1X6DutgZKSMOtB7FSgZIPxgnmtyHhagfmInclr82V/2kOh1hj2I94SlGaBRGRFf5qVTAArZdkR0KqLIlZoGCTuklnC/aRUcwVdvcOx3oOO/lMX+R96WXuW8l5M1YLA6F+2vdXu5lZql3w1pmA=
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
Subject: [PATCH v1 3/4] xen/cppc: get xen-required cppc perf caps data
Date: Wed, 4 Dec 2024 16:24:29 +0800
Message-ID: <20241204082430.469092-4-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD6:EE_|CH3PR12MB8458:EE_
X-MS-Office365-Filtering-Correlation-Id: d2e2623f-1505-478e-fb5a-08dd143d380f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oa3LFcWjJMY3rTcl9SFBEpXPSmZKpxP2WN9f4GQmzoCEW6gj8S59fo7EcBF2?=
 =?us-ascii?Q?afDZTKgfhKxU9yq5w6LnYUcZDXoQp/pNDr+VPe9qdivpvofNYXF1ynFvBYn+?=
 =?us-ascii?Q?S207Lt+7YSKO6kSG6yKwnFAtDFG4hSHahotYBq3x6fnH/SxIRxYqObt3+8fk?=
 =?us-ascii?Q?ezOuMDNU6BppjLUmUhihE81Mri/kcXVmQli63jVo98lsnJ9nnItchTOggQ18?=
 =?us-ascii?Q?ehl0b/Ilo+EK8Fpg/i/g1+FqdnTALHPr9uU5HZNpR5hQZ0L8GOgmvnIAk1kH?=
 =?us-ascii?Q?0RpRud/eqNAtWeay26grv7ziJBMdWXBFtai3zOwQ7TZt6oBadob9HU6qYBPw?=
 =?us-ascii?Q?ooAOoV47VuS/lP+XxjOyEyhrDNJAkBhpXMO2wB6AoxaqWbfAfLfe9uyvV53k?=
 =?us-ascii?Q?4JTW49Q/lMhuKNb7cwetFfVFNlaWX2Tf6XzhTE+++CVsRkeP3dXjxsnw1Y1U?=
 =?us-ascii?Q?BINws9TTOxseG7c722UMwoq3W1TwgVa2V86QxhFDwi5yiJnkPSRNapdexGFE?=
 =?us-ascii?Q?l+mfFobQ2Nou48QZBWKKpwl6nAKSPnWeOrCy9gcYVaqwYacJ3UrxjtJAp/QG?=
 =?us-ascii?Q?WTY2IRckCQptyuNXr8v8NjGigKUTLgZxLCdLeP0h7AxZgwTnNw1Rw2vJf7cn?=
 =?us-ascii?Q?WUohhHX/jwkkeTTzc63FcTyYT8GGTZjoU3NEb58oRyhoTfzRT1Rw//Smxv9H?=
 =?us-ascii?Q?dAJRHpSSQcfk9iHBYMb2Z8P5QsTSU7YlTRvM5eD/Kp/g5aMx8I6PpkjSp54X?=
 =?us-ascii?Q?EFPEgT50KS6uPBHDL7Uw7/9jLUYeprsj+6fJOLG1WSfCTNeNdkRKq9mMkuM4?=
 =?us-ascii?Q?8b6ZncHuwK7D7knxaXlzOBnTWAgS6MGZ+g8cRyNm3ew5BsJp20WFcyhXqEfO?=
 =?us-ascii?Q?Q7rXCTYlND8ayUI9d9S1H4swsiT5/ssZ4dpTrTswkax7+240FiTXH+NlEIZm?=
 =?us-ascii?Q?WJicjO+4JF81x4OGXfNDOL5tjj1nQmmmtGF2Qb0je7sjevDnYvdM5Fie7WJW?=
 =?us-ascii?Q?ecF06+UVvdZUsTlRpVmyA6CyQm79rWx2lGhRXIP354qwKW1GR2vGwZM0+Em2?=
 =?us-ascii?Q?BqgxhKe+re66t79xGx+1gFiZlJmiD1PQde2pLHNuyn19QpsqYM708xhHGLuj?=
 =?us-ascii?Q?K30r6DU2o/g5FmJtG86Gzw2wdUGgGjqvj60TRfpQXUBUZss4ko75vhBqkc6M?=
 =?us-ascii?Q?jhekQukGHWDHjE+hnOzmG89bAt2TjZcv+fbtP/rupHhEegnHvOO1ItyRfC0+?=
 =?us-ascii?Q?Loxyr13LY53/V0t2vXCjYiUVGgmQ4G0tF+23BtCZpmeDI4uwTSUz4rf26suq?=
 =?us-ascii?Q?vfy6KexRxskZGuR6nCR22P0zKW05tuPA/Ct5ty7GZIAUTq+qTiY+FM+el3Qp?=
 =?us-ascii?Q?ss/903hFdiBDY+tLyZBM1+opEPNlOkeNEK8HidAStuVLGr7wVSn82JEZMTjJ?=
 =?us-ascii?Q?MkKkfX+AKM3OK8QieKQhhcoDAWiq0DL4?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 08:25:32.1829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2e2623f-1505-478e-fb5a-08dd143d380f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8458

When running as Xen dom0 PVH guest, processor logical id <-> physical
id map could not be properly set up. So the original function
cppc_get_perf_caps() fails to get correct cppc data for Xen ACPI
processor.

A new function xen_processor_get_perf_caps() is introduced to
get xen-required cppc perf caps data.

Also, as Xen couldn't read and process PCC-type register, this commit
includes a new flag pcc_unsupported in struct acpi_processor_flags to
tell whether platform supports PCC-type register.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 drivers/acpi/cppc_acpi.c | 110 +++++++++++++++++++++++++++++++++++----
 include/acpi/cppc_acpi.h |   5 ++
 include/acpi/processor.h |   1 +
 3 files changed, 105 insertions(+), 11 deletions(-)

diff --git a/drivers/acpi/cppc_acpi.c b/drivers/acpi/cppc_acpi.c
index 40e1fce629aa..d4780739d4a1 100644
--- a/drivers/acpi/cppc_acpi.c
+++ b/drivers/acpi/cppc_acpi.c
@@ -772,6 +772,15 @@ static int acpi_cppc_processor_parse(struct acpi_processor *pr, struct cpc_desc
 			 * so extract it only once.
 			 */
 			if (gas_t->space_id == ACPI_ADR_SPACE_PLATFORM_COMM) {
+				/*
+				 * When ACPI processor represents Xen processor, PCC register type
+				 * could not be properly read and processed right now, as logical
+				 * processor doesn't always have 1:1 map relation to physical processor.
+				 */
+				if (pr->flags.pcc_unsupported) {
+					pr_debug("Unsupported PCC register type:%d\n", pr->acpi_id);
+					goto out_free;
+				}
 				if (pcc_subspace_id < 0) {
 					pcc_subspace_id = gas_t->access_width;
 					if (pcc_data_alloc(pcc_subspace_id))
@@ -837,7 +846,9 @@ static int acpi_cppc_processor_parse(struct acpi_processor *pr, struct cpc_desc
 			goto out_free;
 		}
 	}
-	per_cpu(cpu_pcc_subspace_idx, pr->id) = pcc_subspace_id;
+
+	if (!pr->flags.pcc_unsupported)
+		per_cpu(cpu_pcc_subspace_idx, pr->id) = pcc_subspace_id;
 
 	/*
 	 * Initialize the remaining cpc_regs as unsupported.
@@ -1018,8 +1029,7 @@ int __weak cpc_write_ffh(int cpunum, struct cpc_reg *reg, u64 val)
 static int cpc_read(int cpu, struct cpc_register_resource *reg_res, u64 *val)
 {
 	void __iomem *vaddr = NULL;
-	int size;
-	int pcc_ss_id = per_cpu(cpu_pcc_subspace_idx, cpu);
+	int size, pcc_ss_id;
 	struct cpc_reg *reg = &reg_res->cpc_entry.reg;
 
 	if (reg_res->type == ACPI_TYPE_INTEGER) {
@@ -1044,14 +1054,17 @@ static int cpc_read(int cpu, struct cpc_register_resource *reg_res, u64 *val)
 
 		*val = val_u32;
 		return 0;
-	} else if (reg->space_id == ACPI_ADR_SPACE_PLATFORM_COMM && pcc_ss_id >= 0) {
-		/*
-		 * For registers in PCC space, the register size is determined
-		 * by the bit width field; the access size is used to indicate
-		 * the PCC subspace id.
-		 */
-		size = reg->bit_width;
-		vaddr = GET_PCC_VADDR(reg->address, pcc_ss_id);
+	} else if (reg->space_id == ACPI_ADR_SPACE_PLATFORM_COMM) {
+		pcc_ss_id = per_cpu(cpu_pcc_subspace_idx, cpu);
+		if (pcc_ss_id >= 0) {
+			/*
+			 * For registers in PCC space, the register size is determined
+			 * by the bit width field; the access size is used to indicate
+			 * the PCC subspace id.
+			 */
+			size = reg->bit_width;
+			vaddr = GET_PCC_VADDR(reg->address, pcc_ss_id);
+		}
 	}
 	else if (reg->space_id == ACPI_ADR_SPACE_SYSTEM_MEMORY)
 		vaddr = reg_res->sys_mem_vaddr;
@@ -1282,6 +1295,81 @@ int cppc_get_epp_perf(int cpunum, u64 *epp_perf)
 }
 EXPORT_SYMBOL_GPL(cppc_get_epp_perf);
 
+
+int xen_processor_get_perf_caps(struct acpi_processor *pr, struct cppc_perf_caps *perf_caps)
+{
+	struct cpc_desc *cpc_ptr;
+	struct cpc_register_resource *highest_reg, *lowest_reg,
+		*lowest_non_linear_reg, *nominal_reg,
+		*low_freq_reg = NULL, *nom_freq_reg = NULL;
+	u64 high, low, nom, min_nonlinear, low_f = 0, nom_f = 0;
+	int ret = 0;
+
+	cpc_ptr = kzalloc(sizeof(struct cpc_desc), GFP_KERNEL);
+	if (!cpc_ptr)
+		return -ENOMEM;
+
+	ret = acpi_cppc_processor_parse(pr, cpc_ptr);
+	if (ret)
+		goto err;
+
+	highest_reg = &cpc_ptr->cpc_regs[HIGHEST_PERF];
+	lowest_reg = &cpc_ptr->cpc_regs[LOWEST_PERF];
+	lowest_non_linear_reg = &cpc_ptr->cpc_regs[LOW_NON_LINEAR_PERF];
+	nominal_reg = &cpc_ptr->cpc_regs[NOMINAL_PERF];
+	low_freq_reg = &cpc_ptr->cpc_regs[LOWEST_FREQ];
+	nom_freq_reg = &cpc_ptr->cpc_regs[NOMINAL_FREQ];
+
+	/* Are any of the regs PCC ?*/
+	if (CPC_IN_PCC(highest_reg) || CPC_IN_PCC(lowest_reg) ||
+		CPC_IN_PCC(lowest_non_linear_reg) || CPC_IN_PCC(nominal_reg) ||
+		CPC_IN_PCC(low_freq_reg) || CPC_IN_PCC(nom_freq_reg)) {
+		pr_debug("Unsupported register type read for Xen Processor %d,"
+			 "highest_reg in PCC: %s, lowest_reg in PCC: %s,"
+			 "lowest_non_linear_reg in PCC: %s, nominal_reg in PCC: %s,"
+			 "low_freq_reg in PCC: %s, nom_freq_reg in PCC: %s\n",
+			 pr->acpi_id, CPC_IN_PCC(highest_reg) ? "true" : "false",
+			 CPC_IN_PCC(lowest_reg) ? "true" : "false",
+			 CPC_IN_PCC(lowest_non_linear_reg) ? "true" : "false",
+			 CPC_IN_PCC(nominal_reg) ? "true" : "false",
+			 CPC_IN_PCC(low_freq_reg) ? "true" : "false",
+			 CPC_IN_PCC(nom_freq_reg) ? "true" : "false");
+		goto err;
+	}
+
+	cpc_read(pr->acpi_id, highest_reg, &high);
+	perf_caps->highest_perf = high;
+
+	cpc_read(pr->acpi_id, lowest_reg, &low);
+	perf_caps->lowest_perf = low;
+
+	cpc_read(pr->acpi_id, nominal_reg, &nom);
+	perf_caps->nominal_perf = nom;
+
+	cpc_read(pr->id, lowest_non_linear_reg, &min_nonlinear);
+	perf_caps->lowest_nonlinear_perf = min_nonlinear;
+
+	if (!high || !low || !nom || !min_nonlinear)
+		pr_warn("CPPC: read zero cpc register value for Xen Processor %d"
+			"highest_reg: %llu, lowest_reg: %llu"
+			"nominal_reg: %llu, lowest_non_linear_reg: %llu\n",
+			pr->acpi_id, high, low, nom, min_nonlinear);
+
+	/* Read optional lowest and nominal frequencies if present */
+	if (CPC_SUPPORTED(low_freq_reg))
+		cpc_read(pr->acpi_id, low_freq_reg, &low_f);
+
+	if (CPC_SUPPORTED(nom_freq_reg))
+		cpc_read(pr->acpi_id, nom_freq_reg, &nom_f);
+
+	perf_caps->lowest_freq = low_f;
+	perf_caps->nominal_freq = nom_f;
+
+ err:
+	kfree(cpc_ptr);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(xen_processor_get_perf_caps);
 /**
  * cppc_get_perf_caps - Get a CPU's performance capabilities.
  * @cpunum: CPU from which to get capabilities info.
diff --git a/include/acpi/cppc_acpi.h b/include/acpi/cppc_acpi.h
index 76e44e102780..2281110c00b7 100644
--- a/include/acpi/cppc_acpi.h
+++ b/include/acpi/cppc_acpi.h
@@ -164,6 +164,7 @@ extern int cppc_set_auto_sel(int cpu, bool enable);
 extern int amd_get_highest_perf(unsigned int cpu, u32 *highest_perf);
 extern int amd_get_boost_ratio_numerator(unsigned int cpu, u64 *numerator);
 extern int amd_detect_prefcore(bool *detected);
+extern int xen_processor_get_perf_caps(struct acpi_processor *pr, struct cppc_perf_caps *perf_caps);
 #else /* !CONFIG_ACPI_CPPC_LIB */
 static inline int cppc_get_desired_perf(int cpunum, u64 *desired_perf)
 {
@@ -249,6 +250,10 @@ static inline int amd_detect_prefcore(bool *detected)
 {
 	return -ENODEV;
 }
+static inline int xen_processor_get_perf_caps(struct acpi_processor *pr, struct cppc_perf_caps *perf_caps)
+{
+	return -ENOTSUPP;
+}
 #endif /* !CONFIG_ACPI_CPPC_LIB */
 
 #endif /* _CPPC_ACPI_H*/
diff --git a/include/acpi/processor.h b/include/acpi/processor.h
index e6f6074eadbf..18499cc11366 100644
--- a/include/acpi/processor.h
+++ b/include/acpi/processor.h
@@ -214,6 +214,7 @@ struct acpi_processor_flags {
 	u8 bm_control:1;
 	u8 bm_check:1;
 	u8 has_cst:1;
+	u8 pcc_unsupported:1;
 	u8 has_lpi:1;
 	u8 power_setup_done:1;
 	u8 bm_rld_set:1;
-- 
2.34.1


