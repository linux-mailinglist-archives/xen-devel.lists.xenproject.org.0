Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id q48mL9dEhWl//AMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 02:33:11 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16836F8F9E
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 02:33:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1222658.1530427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voAi7-0002iy-2I; Fri, 06 Feb 2026 01:32:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1222658.1530427; Fri, 06 Feb 2026 01:32:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voAi6-0002g9-VN; Fri, 06 Feb 2026 01:32:38 +0000
Received: by outflank-mailman (input) for mailman id 1222658;
 Fri, 06 Feb 2026 01:32:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3tkN=AK=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1voAi4-0002g2-Gb
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 01:32:36 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b3bb4031-02fb-11f1-9ccf-f158ae23cfc8;
 Fri, 06 Feb 2026 02:32:30 +0100 (CET)
Received: from SJ0PR13CA0184.namprd13.prod.outlook.com (2603:10b6:a03:2c3::9)
 by MN6PR12MB8469.namprd12.prod.outlook.com (2603:10b6:208:46e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.12; Fri, 6 Feb
 2026 01:32:25 +0000
Received: from MWH0EPF000989E5.namprd02.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::b2) by SJ0PR13CA0184.outlook.office365.com
 (2603:10b6:a03:2c3::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.14 via Frontend Transport; Fri,
 6 Feb 2026 01:32:29 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000989E5.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 01:32:24 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 5 Feb
 2026 19:32:24 -0600
Received: from SATLEXMB03.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 5 Feb 2026 17:32:23 -0800
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
X-Inumbo-ID: b3bb4031-02fb-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rhp2vCi1E4rFQ6MwavvVHHrcZEpK0bCkpZskIJfP4IGKNeajMXx8Z7qnS1tVNfqiKAFRnny4XUh7lIV2ng9UgWI0lUOxh4n0gsYg3HKqPEU//AOFNMrEcw1qoQIxOF9JG8w81kjC/VThESye3hZT3Md60l7kse1nA5kqgTtoy9sIaZWM3YYPD+HykGAeG6OqFc+GUvfR2qu7QUGQBLbel0jwZLZVGaR1hjlT1J5IUKtBdlTqSQX6BTWsPHO6GAk4j+sq0lO20cQ8ZRVAdHLMy9NOQZtG+2xgo48LivE/Ki7HxQYK9OvFQ6DXypv1q3giDOF8MYo5WJn80XdCDuWt1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W2QrLWOJ471WddrIDb2oIZoosMi0VA38DRqFzfwk6Bw=;
 b=tqRsKIzxy9oKIV3lWIKAEA5PktGGZPJH+FSYyQmYVWNdxT+qXQKe1f3JiPyLyHWqczByo4pONcEiXDs4yG2H3GKrmKJzKQ8Faa/G7hKw/GQpYAB0jMBxtCN69nQhUNsdkDdgUxdmDHN73hQOR+rhLaaeoejXRTDgNMjiVU3+UEI33g+ZoFaDzmEvYinqNx85HMpkX86DoT1y6xKB2+gYxwuX3kFF6yOKiz0eW8MVLq3UfX3BX3wY+G6Bttvn1054k6WWsvseN+GE2CxhkISnPqedJ0uKpVTmJ5df3UxTbOSseqDTN9RE5+yGZy2vojxSD3crhJNeh8Yj3QtN6sfnvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W2QrLWOJ471WddrIDb2oIZoosMi0VA38DRqFzfwk6Bw=;
 b=QzXzPPErPY2rF7igR4pHYEiKfvBJjeg6Y5SMeVugFz2HtEj9n37YISmauBbE29kfMx7ZttHbYEaccgcYKzwWm+/9xHP1/e68YApF5rkOSQrECLDIg+KqTwnmopTS14dRBvZXgtA8EAQdM2doyqkItijaHk0aaXswxXjdrq0Q0oU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <jbeulich@suse.com>, <andrew.cooper3@citrix.com>, <roger.pau@citrix.com>,
	<jason.andryuk@amd.com>, Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH] x86/cpufreq: Add Kconfig option for CPU frequency scaling
Date: Thu, 5 Feb 2026 17:32:22 -0800
Message-ID: <20260206013222.4081160-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E5:EE_|MN6PR12MB8469:EE_
X-MS-Office365-Filtering-Correlation-Id: f1fd3076-a094-4b19-c9df-08de651f94a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?3pzHTKet3QvvucXjQIp0QCQEvXucr5ukpUaXbbWCbEhFsUYLV7YQVv+ckZC0?=
 =?us-ascii?Q?/BMFGtzsAufo0v85l+QemgPhLmsSDDFaU+CPQujAuijHOxzXhk4lbiMUgRNP?=
 =?us-ascii?Q?YQzmIyJjvZI8wLqTPOVJYbEDAx3PRZbvYYWc/jmaHMrk4GiL0dNN4OVJ8Ymu?=
 =?us-ascii?Q?tpYIVbjlne6BdNXPkeCSmG+pVq6n718J6B8nlBlz8v38+ByxoXooaUd9zZBj?=
 =?us-ascii?Q?IW0yoLwMf7vjMJXB5IlCaOL3Ufy/5+qcv9Ax/BfgrPDkm4CA66sGkPdVRPqT?=
 =?us-ascii?Q?PDueUJyH2X20pead89SII9k6RckAMFcegyhuT+0TsCIdP4ZD4Tyc/3chxwlL?=
 =?us-ascii?Q?ZHUEh2bBZMiUhMDdOceC/MI/PvgA5px8ztOcL/wpKn07B4XQ4ASZW2DlmWSr?=
 =?us-ascii?Q?iUDtCPLC6F+kZfT5WbTLPdrZw3nL2huey8i1/bffFcXZw5F2ieqUdPiIxlkq?=
 =?us-ascii?Q?m7GrRn/ordrW1PXUh6+g0S0gxp41P71nI/dzfvX9NN7JsS1EYJojgVxqOBA0?=
 =?us-ascii?Q?B6nkXcHl3lVSM38+cAE9MHmXFD5letvE6vM4Geoq4kXe+86HMy8GF6a3+Ae5?=
 =?us-ascii?Q?1RboNJJASgdplGyNsrLmPlXWqVA/L4QnBShiR035blG7e7QxoDX3GrVhHjN7?=
 =?us-ascii?Q?JOjw7Z7SnXgPwniVJy99NJuhHcf771N9hkSsFaBkuVF5xveDajAgqcWyQU8N?=
 =?us-ascii?Q?VuT9xK4Zn8wRnjF5VWlpCI1YoTNVY23MKqUmWQH+r/9fY1MGsrbolQy/YL2w?=
 =?us-ascii?Q?OsPeOfF5yOvQGh5Bi/RnBM2SvWTymI+Wn3O0mfdpwyH7flszvVANeWMLkYVs?=
 =?us-ascii?Q?MwWUZ0AHBUncxpf93f6gR8aR8f5EcNa2Z4OT1F7pefYEFhDZak9DroImCZgi?=
 =?us-ascii?Q?4CdJGRRvoebcVhUREXGyku1LCXAylXTKpyFnec2CPf20YeR9H/JGQfi9d0uO?=
 =?us-ascii?Q?NgmvF7AFFYkLUR5UgDUj+Sim+CEFQChviVvqk50UPQmbsHRqgiKzHZJSjXKO?=
 =?us-ascii?Q?HHch0xT+d27D8+tBfD/7aLUpYrAITWWwQyfU8/r93vhhhEsUTkIw0gCoa3+Z?=
 =?us-ascii?Q?SHpe+3Co68BV8foRVEAPoxeIMrQLm9S3g6A8S+E2NP7/8YsIq4adPli6LENQ?=
 =?us-ascii?Q?5g3WUs/CPgpbxiCMQ5MJ8FErqJ/6oGuT1Ynv95+778FjOj/uDjeCMhHwry4A?=
 =?us-ascii?Q?rjGcnR2IYYWeCmkllhl5KU/dn8J7SOQX6koE4d+OXbYHZKSTBILoyIwbZJqd?=
 =?us-ascii?Q?ZnlwYtNMu/RhWlkS/Q7fLfWgmidOeoQgwncCMoS8/uO3m/pDC43kt91/G1CH?=
 =?us-ascii?Q?BeuwLCubYXyFIbELJ93nPx3D7B4lvGuQZp63IQIE67nUS17s16aFhuR3A4ZB?=
 =?us-ascii?Q?nLHat1ODY4V5b5ChijTMYKWrDyY59KaBCel3ibAd13pxYI6fw9sqC5s74izl?=
 =?us-ascii?Q?Hv1WVGpSs9ANNRb/bKH70nmcmp5f3efJqvfpXtNvcMW0GdOE2wMst/INl8Gd?=
 =?us-ascii?Q?HQMGYZWMuotJ3jkGHh73qSTfUkfgaOs6cc0PKI3NmtmpDXWreLlp+NqD/rvN?=
 =?us-ascii?Q?9Ny0o/2rLgJrwCcfIzdwaEsbOQfgosUj/6BTtQUr9Zh18QAabST+3a9kjybe?=
 =?us-ascii?Q?wgEIvqNn/UK3hFeLJcpv+USyChpdHQ3FcbCnYNj/Jo+4JfFySImIuDvROXoI?=
 =?us-ascii?Q?wAaGcA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	D1jrqW67Bxg8HgjGs991HO/Cxw8Ry0ivNHxcmg4YiO3nfuETo0jM0fB1Upw40ajNkPew2jE/4QLW/0eOkuNrx5P4b7nQSJX556esrpA9aQcwi7hDg6UxvRpfXH50tfFrLwg6bpb3a6KYtHKIlxFZnnZm8QRraffmQOJeM6VaC4b1ShNIWcJRkMBQFxb1Y38Y6KAtJbIse8bSAf+GtvHq5/TCuloFEkpNnfj6KOB1HKPaDSxaP0MtzS/ZhDHFSJSMe1xE3R6ws+Pj4yCJaRPSf2cQwbl2yQg4OivyJVxzId59ITJ60PaIIOGvijzgUm94GSdjEz1vdPJMnTRACNdv4FrkUke6MqcX+8gjO2w8XOw7lW55yeX7vxz5fgBfAKl/QSsC99BSeMXp3hWLmLvrMie/9Eetz9TjVFtVaTms/ZiphG1T5flbXbqMxRNlmh/Y
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 01:32:24.4167
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1fd3076-a094-4b19-c9df-08de651f94a5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8469
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:stefano.stabellini@amd.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[stefano.stabellini@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stefano.stabellini@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 16836F8F9E
X-Rspamd-Action: no action

Add CONFIG_CPUFREQ to allow CPU frequency scaling support to be
disabled at build time. When disabled, this removes cpufreq code
from the build.

Add stubs where necessary.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 xen/arch/x86/acpi/Makefile         |  2 +-
 xen/common/Kconfig                 |  4 ++--
 xen/drivers/Makefile               |  2 +-
 xen/drivers/cpufreq/Kconfig        | 16 +++++++++++++++-
 xen/include/acpi/cpufreq/cpufreq.h |  5 +++++
 xen/include/xen/acpi.h             |  8 +++++++-
 xen/include/xen/pmstat.h           | 15 ++++++++++++++-
 xen/include/xen/sched.h            |  9 +++++++--
 8 files changed, 52 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/acpi/Makefile b/xen/arch/x86/acpi/Makefile
index 041377e2bb..aa476f65d5 100644
--- a/xen/arch/x86/acpi/Makefile
+++ b/xen/arch/x86/acpi/Makefile
@@ -1,4 +1,4 @@
-obj-y += cpufreq/
+obj-$(CONFIG_CPUFREQ) += cpufreq/
 
 obj-y += lib.o power.o cpu_idle.o cpuidle_menu.o
 obj-bin-y += boot.init.o wakeup_prot.o
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index d7e79e752a..cddd7337bb 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -652,7 +652,7 @@ endmenu
 
 config PM_OP
 	bool "Enable Performance Management Operation"
-	depends on ACPI && HAS_CPUFREQ && SYSCTL
+	depends on ACPI && CPUFREQ && SYSCTL
 	default y
 	help
 	  This option shall enable userspace performance management control
@@ -660,7 +660,7 @@ config PM_OP
 
 config PM_STATS
 	bool "Enable Performance Management Statistics"
-	depends on ACPI && HAS_CPUFREQ && SYSCTL
+	depends on ACPI && CPUFREQ && SYSCTL
 	default y
 	help
 	  Enable collection of performance management statistics to aid in
diff --git a/xen/drivers/Makefile b/xen/drivers/Makefile
index 2a1ae8ad13..3d81b8dde4 100644
--- a/xen/drivers/Makefile
+++ b/xen/drivers/Makefile
@@ -1,5 +1,5 @@
 obj-y += char/
-obj-$(CONFIG_HAS_CPUFREQ) += cpufreq/
+obj-$(CONFIG_CPUFREQ) += cpufreq/
 obj-$(CONFIG_HAS_PCI) += pci/
 obj-$(CONFIG_HAS_VPCI) += vpci/
 obj-$(CONFIG_HAS_PASSTHROUGH) += passthrough/
diff --git a/xen/drivers/cpufreq/Kconfig b/xen/drivers/cpufreq/Kconfig
index cce80f4aec..49631f92de 100644
--- a/xen/drivers/cpufreq/Kconfig
+++ b/xen/drivers/cpufreq/Kconfig
@@ -1,3 +1,17 @@
-
 config HAS_CPUFREQ
 	bool
+
+config CPUFREQ
+	bool "CPU Frequency scaling"
+	default y
+	depends on HAS_CPUFREQ
+	help
+	  Enable CPU frequency scaling and power management governors.
+	  This allows Xen to dynamically adjust CPU P-states (performance
+	  states) based on system load.
+
+	  Disabling this option removes all cpufreq governors and power
+	  management interfaces. This is useful for real-time systems or
+	  minimal hypervisor builds.
+
+	  If unsure, say Y.
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 0171ccf0ba..a97c642a50 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -381,8 +381,13 @@ int write_ondemand_up_threshold(unsigned int up_threshold);
 
 int write_userspace_scaling_setspeed(unsigned int cpu, unsigned int freq);
 
+#ifdef CONFIG_CPUFREQ
 void cpufreq_dbs_timer_suspend(void);
 void cpufreq_dbs_timer_resume(void);
+#else
+static inline void cpufreq_dbs_timer_suspend(void) {}
+static inline void cpufreq_dbs_timer_resume(void) {}
+#endif
 
 void intel_feature_detect(struct cpufreq_policy *policy);
 
diff --git a/xen/include/xen/acpi.h b/xen/include/xen/acpi.h
index 90635ba0f3..7077c27150 100644
--- a/xen/include/xen/acpi.h
+++ b/xen/include/xen/acpi.h
@@ -185,8 +185,14 @@ static inline unsigned int acpi_get_csubstate_limit(void) { return 0; }
 static inline void acpi_set_csubstate_limit(unsigned int new_limit) { return; }
 #endif
 
-#ifdef XEN_GUEST_HANDLE
+#if defined(XEN_GUEST_HANDLE) && defined(CONFIG_CPUFREQ)
 int acpi_set_pdc_bits(unsigned int acpi_id, XEN_GUEST_HANDLE(uint32));
+#elif defined(XEN_GUEST_HANDLE)
+static inline int acpi_set_pdc_bits(unsigned int acpi_id,
+                                    XEN_GUEST_HANDLE(uint32) pdc)
+{
+    return -ENOSYS;
+}
 #endif
 int arch_acpi_set_pdc_bits(u32 acpi_id, u32 *, u32 mask);
 
diff --git a/xen/include/xen/pmstat.h b/xen/include/xen/pmstat.h
index 6096560d3c..4efddad438 100644
--- a/xen/include/xen/pmstat.h
+++ b/xen/include/xen/pmstat.h
@@ -5,10 +5,23 @@
 #include <public/platform.h> /* for struct xen_processor_power */
 #include <public/sysctl.h>   /* for struct pm_cx_stat */
 
+#ifdef CONFIG_CPUFREQ
 int set_px_pminfo(uint32_t acpi_id, struct xen_processor_performance *perf);
-long set_cx_pminfo(uint32_t acpi_id, struct xen_processor_power *power);
 int set_cppc_pminfo(unsigned int acpi_id,
                     const struct xen_processor_cppc *cppc_data);
+#else
+static inline int set_px_pminfo(uint32_t acpi_id,
+                                struct xen_processor_performance *perf)
+{
+    return -ENOSYS;
+}
+static inline int set_cppc_pminfo(unsigned int acpi_id,
+                                  const struct xen_processor_cppc *cppc_data)
+{
+    return -ENOSYS;
+}
+#endif
+long set_cx_pminfo(uint32_t acpi_id, struct xen_processor_power *power);
 
 #ifdef CONFIG_COMPAT
 struct compat_processor_performance;
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 1268632344..1b431fc726 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1255,9 +1255,14 @@ static always_inline bool is_iommu_enabled(const struct domain *d)
 extern bool sched_smt_power_savings;
 extern bool sched_disable_smt_switching;
 
-extern enum cpufreq_controller {
+enum cpufreq_controller {
     FREQCTL_none, FREQCTL_dom0_kernel, FREQCTL_xen
-} cpufreq_controller;
+};
+#ifdef CONFIG_CPUFREQ
+extern enum cpufreq_controller cpufreq_controller;
+#else
+#define cpufreq_controller FREQCTL_none
+#endif
 
 static always_inline bool is_cpufreq_controller(const struct domain *d)
 {
-- 
2.25.1


