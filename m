Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 347939E3535
	for <lists+xen-devel@lfdr.de>; Wed,  4 Dec 2024 09:25:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.848367.1263298 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIkhc-0004pu-RN; Wed, 04 Dec 2024 08:25:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 848367.1263298; Wed, 04 Dec 2024 08:25:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIkhc-0004js-KZ; Wed, 04 Dec 2024 08:25:44 +0000
Received: by outflank-mailman (input) for mailman id 848367;
 Wed, 04 Dec 2024 08:25:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p5h6=S5=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tIkha-00040M-P9
 for xen-devel@lists.xenproject.org; Wed, 04 Dec 2024 08:25:42 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20622.outbound.protection.outlook.com
 [2a01:111:f403:2415::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5988f3f9-b219-11ef-a0d4-8be0dac302b0;
 Wed, 04 Dec 2024 09:25:42 +0100 (CET)
Received: from MN2PR19CA0052.namprd19.prod.outlook.com (2603:10b6:208:19b::29)
 by SN7PR12MB6792.namprd12.prod.outlook.com (2603:10b6:806:267::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Wed, 4 Dec
 2024 08:25:35 +0000
Received: from MN1PEPF0000ECDB.namprd02.prod.outlook.com
 (2603:10b6:208:19b:cafe::93) by MN2PR19CA0052.outlook.office365.com
 (2603:10b6:208:19b::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.19 via Frontend Transport; Wed,
 4 Dec 2024 08:25:35 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECDB.mail.protection.outlook.com (10.167.242.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Wed, 4 Dec 2024 08:25:35 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Dec 2024 02:25:32 -0600
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
X-Inumbo-ID: 5988f3f9-b219-11ef-a0d4-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J9WfmQDUwN2JjN4E4Xe1ObgamQKqZc2hbEWSZPsuzl6xFm6wfxllatd0yEztip/pJ2rZipu3T1AuHd6R86isSY9yETdMMDJscCUjVa5JESyIB5l3tQQUC3kQGPGav60hZC/mnY0vWocVLzrs4nkdF4m3Ez5OEeFTWazdUaHsCc2AGsVNjrEVLt7iMRQvjPGVeDP08uNW1gQsH7ovNZmVrbJNU6hROfrXSzY+95IK8DnuVdq45xqiPXd6QX+TECk5Jv7x1PjMTyn+bhLSeBJIDxfz62lESGP63DxiqbFmxFuhuQ+KCojsa1Ba53hmhSVHKnT7B+8yOEGsWGJro++iGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o8eXS7xLrtcql42ixed09fNk4mrAhayll7Z9u3NR5mY=;
 b=Jf3fz+Ov7iCH6z1V2pm03HB5OF/nsHLHHHe6qLgbeANXJ4Ui8V+/7FjFkJcBlj/BWfC3Guns/JagdTj20juu07pXZtJ4NaK6+20Z6pFfwMNVneMfSUXKrnkERpu8UiAX8k5y7KnCcf6+1oJk/Pb53NNn9Bub5Yu97bU01SYEgBeBCP8FFonhAhE6SN47GK3ACRVpxMQr47ierHDOUlSlGtd7iwf+kRvF03s2+DkKOfpXXJ766EvWCa13523nuXVxBWyVg/ZLXTFa4sCaIwpHPc3FDXL/hE8L9lvX6Kw8A6el43TLZaVreWsxT90Xlb748dzEQs0S+DURrldvWGl9AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o8eXS7xLrtcql42ixed09fNk4mrAhayll7Z9u3NR5mY=;
 b=IaetdHkyhWQeRWf5b5w371yj4DjpZyPBwFPyESbf96m1BYYdxFLs6+GJg648hb/oEVPBvzNUu8v9cYBu96zNlsaMtPjHi9yH6DxuMBO7FhjFQPKVwwj8TPEOcs1gcLs1bzHsbNR3IB/y1BYw4b3/XSKLP+78kuu7M0q80j+IUac=
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
Subject: [PATCH v1 4/4] xen/cppc: introduce cppc data upload sub-hypercall
Date: Wed, 4 Dec 2024 16:24:30 +0800
Message-ID: <20241204082430.469092-5-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDB:EE_|SN7PR12MB6792:EE_
X-MS-Office365-Filtering-Correlation-Id: 29f313d5-150c-4f40-ecbd-08dd143d3a01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jfiCw+Bz+ad1ip6zgK0+ATny7qg2dnuQXIh1FvIC17Qnte/x8vOY2RTnxdc/?=
 =?us-ascii?Q?v+T8ZATNQYTUVqCf3cWkyxdcXqU6LugnF/eYswwViUlzi2qOdO6KVkbKXPGV?=
 =?us-ascii?Q?hSuInLw3vGspIK4omfnXKJ6xAM1Boka+L6kBRnIIInq5RBFiGAcdIBBKBO7y?=
 =?us-ascii?Q?KSz69SRolceswWg5eUM1tEDWGXIDEhhJvYVEB1m/0I8SS/lI7WbnNGm52t8R?=
 =?us-ascii?Q?aacoAiMZqt4kOEILdLxmSfXp+wcs9Y8Mk5o4EHHT6ScZmtRZ2ZPyl+rjwi9+?=
 =?us-ascii?Q?gJmE3f5egtJq8FOdAf9Yrr6Ve50usEnXVcEAPUlOsiuTGy8PlO7B3XiwmbBx?=
 =?us-ascii?Q?bsNkGrjFODPnMJ0rf5Jm+at/hWwBaQcK9+pmvoudviXr59H7Vt8BjQjf+bUC?=
 =?us-ascii?Q?cjgcO9hQM3cjoGXjdwnm1/m3Zl1rPe6evxcsvzOHABxMbYNXvXYY3IKgOfpn?=
 =?us-ascii?Q?ITtQ7xUOOGIZIOSLVTn9fcRhHaYYFpW4VszhxfUmtveDQeDKUa8wR/VE5TW/?=
 =?us-ascii?Q?XtQRmceORtwT5KWfF6BS7BV27oLzEN9WBCzhIQsNxHsC9k/R0a2OWF9oawjL?=
 =?us-ascii?Q?Uip8MPFDWzaiY/ZDQutP6vL7fPUA5GHoj8L1vwn6jtaEI4q0ahje1uZVzwD6?=
 =?us-ascii?Q?gHEHLqn3AoBS2Xg5QZeQ7gImtyXrqGS77kCC/StReLP0hWq/P94jKEEnT+ut?=
 =?us-ascii?Q?/aG3MPfii7/wSuX38HGSsXs+CmX3kt1x7xiYN1DuyQBQ2h1vw/KVFyfcYBE2?=
 =?us-ascii?Q?kpxqVu08CD5+AtygtYeitlqXcp6c8oXlciQIsYoghO9MvknLfnlxcUPaXqX3?=
 =?us-ascii?Q?FwvJmbFkkrq0Mzp/6S1DQwlbJ/IrT7O+cGbZkF/RYaWPpC9pZ4//MhAx8S6s?=
 =?us-ascii?Q?6yCEaliEfhNFjhKSTrX63c7r3gCKS+sH7gqwWQVSd3ySPXE8SK+COsCMtZBy?=
 =?us-ascii?Q?QUzwWhk+/V/hklu0kWbdhl7T0eDIfhLlJLWK5mkPWMzYuYw0ttyptewnjTGy?=
 =?us-ascii?Q?s9j4EpP2ODhj9TJ6+JA+dWcovUGiabk1iXoW3loPJrFDf7lLMiGrQVL/15jU?=
 =?us-ascii?Q?ecFn0RBKUTF3pz4JjmilMfJsQB2nHRNGeN7PDk5OGvyfpPpHVEeJCI+7yoP6?=
 =?us-ascii?Q?sgLi1vrZtprHzdgjk27REr/FFf4DbjKLstUQmgXQLz/QOH1ZPdyXeZiBS4R4?=
 =?us-ascii?Q?FEqenAJTDrPebqmv12vu01AY5GgwKpd6Y8fMBYUSXQVQ1A8g+tZc57NtPczz?=
 =?us-ascii?Q?4FLPTgVNGhhufpsu/dBZymgqwnyr4n9LzBym2l6fN+rxgYpZzgFx0owp7Ttd?=
 =?us-ascii?Q?hn+tc/rCxr9zuk3wGIK3vqZrqyuXacRpzQWkQVCozUhq+zsDDdFDe+TYmzUU?=
 =?us-ascii?Q?kRG/kYvTyQ6RmxDi/8ShcPzKiUfL55fIMb1vzrnm4sLBLNqEzSB3uGl4oJ4t?=
 =?us-ascii?Q?EoVUC0UCS9fVMoOLA1RnXj68S2UJS90z?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 08:25:35.4462
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29f313d5-150c-4f40-ecbd-08dd143d3a01
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6792

As Xen is uncapable of parsing the ACPI dynamic table, this commit
introduces a new sub-hypercall XEN_PM_CPPC to deliver CPPC perf
caps data.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 drivers/acpi/cppc_acpi.c         |  1 +
 drivers/xen/xen-acpi-processor.c | 89 +++++++++++++++++++++++++++++++-
 include/acpi/processor.h         |  1 +
 include/xen/interface/platform.h | 11 ++++
 4 files changed, 101 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/cppc_acpi.c b/drivers/acpi/cppc_acpi.c
index d4780739d4a1..a30eeb0d9cb7 100644
--- a/drivers/acpi/cppc_acpi.c
+++ b/drivers/acpi/cppc_acpi.c
@@ -860,6 +860,7 @@ static int acpi_cppc_processor_parse(struct acpi_processor *pr, struct cpc_desc
 		cpc_ptr->cpc_regs[i].cpc_entry.int_value = 0;
 	}
 
+	pr->flags.has_cpc = 1;
 	pr_debug("Parsed _CPC entry for CPU: %d\n", pr->acpi_id);
 	kfree(output.pointer);
 	return 0;
diff --git a/drivers/xen/xen-acpi-processor.c b/drivers/xen/xen-acpi-processor.c
index 74dcc84b9199..9de59774eac5 100644
--- a/drivers/xen/xen-acpi-processor.c
+++ b/drivers/xen/xen-acpi-processor.c
@@ -25,6 +25,7 @@
 #include <xen/xen.h>
 #include <xen/interface/platform.h>
 #include <asm/xen/hypercall.h>
+#include <acpi/cppc_acpi.h>
 
 static int no_hypercall;
 MODULE_PARM_DESC(off, "Inhibit the hypercall.");
@@ -45,8 +46,12 @@ static unsigned long *acpi_ids_done;
 static unsigned long *acpi_id_present;
 /* And if there is an _CST definition (or a PBLK) for the ACPI IDs */
 static unsigned long *acpi_id_cst_present;
+/* And if there is an _CPC entry for the ACPI IDs */
+static unsigned long *acpi_id_cpc_present;
 /* Which ACPI P-State dependencies for a enumerated processor */
 static struct acpi_psd_package *acpi_psd;
+/* ACPI CPPC structures for a enumerated processor */
+static struct cppc_perf_caps *acpi_cppc_data;
 
 static bool pr_initialized;
 
@@ -208,6 +213,44 @@ static int xen_copy_pct_data(struct acpi_pct_register *pct,
 	dst_pct->address = pct->address;
 	return 0;
 }
+static int push_cppc_to_hypervisor(struct acpi_processor *_pr)
+{
+	int ret = 0;
+	struct xen_platform_op op = {
+		.cmd            = XENPF_set_processor_pminfo,
+		.interface_version  = XENPF_INTERFACE_VERSION,
+		.u.set_pminfo.id    = _pr->acpi_id,
+		.u.set_pminfo.type  = XEN_PM_CPPC,
+	};
+	struct cppc_perf_caps *cppc_perf = acpi_cppc_data + _pr->acpi_id;
+
+	op.u.set_pminfo.cppc_data.highest_perf = cppc_perf->highest_perf;
+	op.u.set_pminfo.cppc_data.lowest_perf = cppc_perf->lowest_perf;
+	op.u.set_pminfo.cppc_data.nominal_perf = cppc_perf->nominal_perf;
+	op.u.set_pminfo.cppc_data.lowest_nonlinear_perf = cppc_perf->lowest_nonlinear_perf;
+	op.u.set_pminfo.cppc_data.lowest_freq = cppc_perf->lowest_freq;
+	op.u.set_pminfo.cppc_data.nominal_freq = cppc_perf->nominal_freq;
+
+	if (!no_hypercall)
+		ret = HYPERVISOR_platform_op(&op);
+
+	if (!ret) {
+		pr_debug("ACPI CPU%u - CPPC uploaded.\n", _pr->acpi_id);
+		pr_debug("     highest_perf: %d\n", cppc_perf->highest_perf);
+		pr_debug("     lowest_perf: %d\n", cppc_perf->lowest_perf);
+		pr_debug("     lowest_nonlinear_perf: %d\n", cppc_perf->lowest_nonlinear_perf);
+		pr_debug("     nominal_perf: %d\n", cppc_perf->nominal_perf);
+		pr_debug("     lowest_freq: %d Mhz\n", cppc_perf->lowest_freq);
+		pr_debug("     nominal_freq: %d Mhz\n", cppc_perf->nominal_freq);
+	} else if ((ret != -EINVAL) && (ret != -ENOSYS))
+		/* EINVAL means the ACPI ID is incorrect - meaning the ACPI
+		 * table is referencing a non-existing CPU - which can happen
+		 * with broken ACPI tables. */
+		pr_warn("(_CPC): Hypervisor error (%d) for ACPI CPU%u\n",
+			ret, _pr->acpi_id);
+
+		return ret;
+}
 static int push_pxx_to_hypervisor(struct acpi_processor *_pr)
 {
 	int ret = 0;
@@ -284,6 +327,9 @@ static int upload_pm_data(struct acpi_processor *_pr)
 	if (_pr->flags.power)
 		err = push_cxx_to_hypervisor(_pr);
 
+	if (_pr->flags.has_cpc)
+		err |= push_cppc_to_hypervisor(_pr);
+
 	if (_pr->performance && _pr->performance->states)
 		err |= push_pxx_to_hypervisor(_pr);
 
@@ -488,6 +534,7 @@ read_acpi_id(acpi_handle handle, u32 lvl, void *context, void **rv)
 	union acpi_object object = { 0 };
 	struct acpi_buffer buffer = { sizeof(union acpi_object), &object };
 	struct acpi_buffer cst_buf = { ACPI_ALLOCATE_BUFFER, NULL };
+	struct acpi_buffer cpc_buf = { ACPI_ALLOCATE_BUFFER, NULL };
 	acpi_io_address pblk = 0;
 
 	status = acpi_get_type(handle, &acpi_type);
@@ -567,6 +614,15 @@ read_acpi_id(acpi_handle handle, u32 lvl, void *context, void **rv)
 	/* .. and it has a C-state */
 	__set_bit(acpi_id, acpi_id_cst_present);
 
+	status = acpi_evaluate_object(handle, "_CPC", NULL, &cpc_buf);
+	if (ACPI_FAILURE(status)) {
+		return AE_OK;
+	}
+	kfree(cpc_buf.pointer);
+
+	/* .. and it has a _CPC entry */
+	__set_bit(acpi_id, acpi_id_cpc_present);
+
 	return AE_OK;
 }
 static int check_acpi_ids(struct acpi_processor *pr_backup)
@@ -574,7 +630,7 @@ static int check_acpi_ids(struct acpi_processor *pr_backup)
 
 	BUG_ON(!pr_backup);
 
-	if (acpi_id_present && acpi_id_cst_present)
+	if (acpi_id_present && acpi_id_cst_present && acpi_id_cpc_present)
 		/* OK, done this once .. skip to uploading */
 		goto upload;
 
@@ -591,11 +647,19 @@ static int check_acpi_ids(struct acpi_processor *pr_backup)
 		return -ENOMEM;
 	}
 
+	acpi_id_cpc_present = bitmap_zalloc(nr_acpi_bits, GFP_KERNEL);
+	if (!acpi_id_cpc_present) {
+		bitmap_free(acpi_id_present);
+		bitmap_free(acpi_id_cst_present);
+		return -ENOMEM;
+	}
+
 	acpi_psd = kcalloc(nr_acpi_bits, sizeof(struct acpi_psd_package),
 			   GFP_KERNEL);
 	if (!acpi_psd) {
 		bitmap_free(acpi_id_present);
 		bitmap_free(acpi_id_cst_present);
+		bitmap_free(acpi_id_cpc_present);
 		return -ENOMEM;
 	}
 
@@ -611,6 +675,12 @@ static int check_acpi_ids(struct acpi_processor *pr_backup)
 			pr_backup->acpi_id = i;
 			/* Mask out C-states if there are no _CST or PBLK */
 			pr_backup->flags.power = test_bit(i, acpi_id_cst_present);
+			/* Mask out relevant flag if there are no _CPC */
+			pr_backup->flags.has_cpc = test_bit(i, acpi_id_cpc_present);
+			if (pr_backup->flags.has_cpc) {
+				if (xen_processor_get_perf_caps(pr_backup, acpi_cppc_data + i))
+					return -EINVAL;
+			}
 			/* num_entries is non-zero if we evaluated _PSD */
 			if (acpi_psd[i].num_entries) {
 				memcpy(&pr_backup->performance->domain_info,
@@ -729,6 +799,15 @@ static int __init xen_acpi_processor_init(void)
 		bitmap_free(acpi_ids_done);
 		return -ENOMEM;
 	}
+
+	acpi_cppc_data = kcalloc(nr_acpi_bits, sizeof(struct cppc_perf_caps),
+				GFP_KERNEL);
+	if (!acpi_cppc_data) {
+		pr_debug("Memory allocation error for acpi_cppc_data\n");
+		rc = -ENOMEM;
+		goto err1_out;
+	}
+
 	for_each_possible_cpu(i) {
 		if (!zalloc_cpumask_var_node(
 			&per_cpu_ptr(acpi_perf_data, i)->shared_cpu_map,
@@ -754,6 +833,11 @@ static int __init xen_acpi_processor_init(void)
 		rc = acpi_processor_get_performance_info(pr);
 		if (rc)
 			goto err_out;
+
+		pr->flags.pcc_unsupported = true;
+		rc = xen_processor_get_perf_caps(pr, acpi_cppc_data + i);
+		if (rc)
+			goto err_out;
 	}
 
 	rc = xen_upload_processor_pm_data();
@@ -769,6 +853,8 @@ static int __init xen_acpi_processor_init(void)
 
 err_out:
 	/* Freeing a NULL pointer is OK: alloc_percpu zeroes. */
+	kfree(acpi_cppc_data);
+err1_out:
 	free_acpi_perf_data();
 	bitmap_free(acpi_ids_done);
 	return rc;
@@ -782,6 +868,7 @@ static void __exit xen_acpi_processor_exit(void)
 	bitmap_free(acpi_id_present);
 	bitmap_free(acpi_id_cst_present);
 	kfree(acpi_psd);
+	kfree(acpi_cppc_data);
 	for_each_possible_cpu(i)
 		acpi_processor_unregister_performance(i);
 
diff --git a/include/acpi/processor.h b/include/acpi/processor.h
index 18499cc11366..66492f5d68a8 100644
--- a/include/acpi/processor.h
+++ b/include/acpi/processor.h
@@ -214,6 +214,7 @@ struct acpi_processor_flags {
 	u8 bm_control:1;
 	u8 bm_check:1;
 	u8 has_cst:1;
+	u8 has_cpc:1;
 	u8 pcc_unsupported:1;
 	u8 has_lpi:1;
 	u8 power_setup_done:1;
diff --git a/include/xen/interface/platform.h b/include/xen/interface/platform.h
index 79a443c65ea9..e11bb9443dc0 100644
--- a/include/xen/interface/platform.h
+++ b/include/xen/interface/platform.h
@@ -319,6 +319,7 @@ DEFINE_GUEST_HANDLE_STRUCT(xenpf_getidletime_t);
 #define XEN_PM_PX   1
 #define XEN_PM_TX   2
 #define XEN_PM_PDC  3
+#define XEN_PM_CPPC 4
 /* Px sub info type */
 #define XEN_PX_PCT   1
 #define XEN_PX_PSS   2
@@ -384,6 +385,15 @@ struct xen_processor_px {
 };
 DEFINE_GUEST_HANDLE_STRUCT(xen_processor_px);
 
+struct xen_processor_cppc {
+    uint32_t highest_perf;
+    uint32_t nominal_perf;
+    uint32_t lowest_perf;
+    uint32_t lowest_nonlinear_perf;
+    uint32_t lowest_freq;
+    uint32_t nominal_freq;
+};
+
 struct xen_psd_package {
 	uint64_t num_entries;
 	uint64_t revision;
@@ -412,6 +422,7 @@ struct xenpf_set_processor_pminfo {
 		struct xen_processor_power          power;/* Cx: _CST/_CSD */
 		struct xen_processor_performance    perf; /* Px: _PPC/_PCT/_PSS/_PSD */
 		GUEST_HANDLE(uint32_t)              pdc;
+		struct xen_processor_cppc           cppc_data; /* _CPC */
 	};
 };
 DEFINE_GUEST_HANDLE_STRUCT(xenpf_set_processor_pminfo);
-- 
2.34.1


