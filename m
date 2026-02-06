Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4qNbLeFXhmnDMAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 22:06:41 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2023103514
	for <lists+xen-devel@lfdr.de>; Fri, 06 Feb 2026 22:06:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1223941.1531297 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voT1o-0002dc-Ly; Fri, 06 Feb 2026 21:06:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1223941.1531297; Fri, 06 Feb 2026 21:06:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1voT1o-0002c9-Hg; Fri, 06 Feb 2026 21:06:12 +0000
Received: by outflank-mailman (input) for mailman id 1223941;
 Fri, 06 Feb 2026 21:06:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3tkN=AK=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1voT1n-0002c3-5V
 for xen-devel@lists.xenproject.org; Fri, 06 Feb 2026 21:06:11 +0000
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c107::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a6b7ab68-039f-11f1-b161-2bf370ae4941;
 Fri, 06 Feb 2026 22:06:08 +0100 (CET)
Received: from MN0P220CA0023.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:52e::27)
 by DM4PR12MB7693.namprd12.prod.outlook.com (2603:10b6:8:103::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Fri, 6 Feb
 2026 21:05:57 +0000
Received: from MN1PEPF0000ECDB.namprd02.prod.outlook.com
 (2603:10b6:208:52e:cafe::d) by MN0P220CA0023.outlook.office365.com
 (2603:10b6:208:52e::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.16 via Frontend Transport; Fri,
 6 Feb 2026 21:05:52 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECDB.mail.protection.outlook.com (10.167.242.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 21:05:56 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Feb
 2026 15:05:56 -0600
Received: from SATLEXMB04.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 6 Feb 2026 15:05:55 -0600
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
X-Inumbo-ID: a6b7ab68-039f-11f1-b161-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n/CyJmSpK3aSSOU9EuchTa9pifYl95O7BdCTK8psRgq06xGqZlX7u8oeqR9WJvdKdN4kNenb7MeA6rMMoCvmXCT5ih7/HsfhtLAgWqmjz3xsLG5qDTNg3lyitkZHLjblKMeud+UesMBnJCGTqsv1kuhUDz0UChlCa9cLHBc8u0412At9sh8naWZMDZ7Wbk64aXHnvWSbRHgpXSPZGwtOXLD1P2wWjKLbUO+NZELBqHeRoCc29jJUUqRtjWSLk/noDpMoIsgIPHUCis3k8LdssKmi72WKXN/ELd2JNJ6xRaPZTmhHy6yn18hyyACE9O5OqBE0bN5El7mMgJp7qqx3Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b00a3xbubGuypy17s5wYQfasEn0j9YKwFi9GJMkSJ48=;
 b=lFnLo3tqjra6XreOPCs0+WqWqdMbmaMESTPoqPOZ0JcShZN03OCXaDQOhX+N0qp5fUME3aDYKLMWnyKcAde8EoRgKeqpB8PJRqEWNId9238tBPEdm2IW9I52BDAkK9oTMYDK+RDHgP77szr4qoLHroePq0KHYbDRA5AGNg3tANrltnNexIxZJLUIGe7iweImhvoZctBxHypFIwEniZdTMEXj1vgZFZ98QCo9BpbODf/0VNZfpCOpFhHu93T7NbQ/Dj2mG5QaAsEcC+aICrBssaLZ74LHDg8fXr+C3nRC+tHUelLiYREgze6VVsFEsXMjPMRem173n0wYuXQ/v1vSGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b00a3xbubGuypy17s5wYQfasEn0j9YKwFi9GJMkSJ48=;
 b=OyOGDwMHSddChVufmb7Zojgi2ArbC+O3WqBv88beH2m+6wL1Dh7OH4/Es716w7sC0XhQU9pbIqfHawMy3ukAvW3K39+GVA8J2/UrIWVfw5nxgLQFmySFoKnXCiAGcARs4Jd6X29Rb1rch1gTs03WpcWijxb9xCzNRzWbw2av3Uw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <roger.pau@citrix.com>, <jbeulich@suse.com>, <andrew.cooper3@citrix.com>,
	<jason.andryuk@amd.com>, <alejandro.garciavallejo@amd.com>, "Stefano
 Stabellini" <stefano.stabellini@amd.com>
Subject: [PATCH v2] x86/hvm: Add Kconfig option to disable nested virtualization
Date: Fri, 6 Feb 2026 13:05:54 -0800
Message-ID: <20260206210554.126443-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDB:EE_|DM4PR12MB7693:EE_
X-MS-Office365-Filtering-Correlation-Id: cea37211-1d07-446a-64c4-08de65c3855b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EvuPWGGIsp2/w4WUFPGcCJSnt2mhD4YTos80abfte9Q09bV63SSGiNZnGnZW?=
 =?us-ascii?Q?XGFW5D7+yM3QgXbw8nxxVm86sM5xbwRZ9FgMp1AxNa3srOhlRZX3h/SS5hS7?=
 =?us-ascii?Q?2yR+eSSfiKYgLf1dRoW6Jhgx0vQunS8sJYgsqCF3JPx8jSJNUlzzpXDPnuSn?=
 =?us-ascii?Q?AwfhNVh1VcrZOyb3h9NA4wWhbzNKeH4MOdpbT/+CYQ+vFyFkK0bHrDJicurE?=
 =?us-ascii?Q?TxgO/oqClUAIUzvjGnFUXdlLMbDIaWHMjV4lrCTbdJ6oZ4Wak4e6xhbrsV6p?=
 =?us-ascii?Q?Zi8NMecvOcMK4LBPfDsDah19b4H0rEhMPy53ry5EPqX/fg5iA4TIwJkK0fma?=
 =?us-ascii?Q?PYaauuIeXUpmx/vMStm2XXBo3YEjQVPYcvrv2Y009SatwDtoV/A3mImGkTOb?=
 =?us-ascii?Q?mQY94bmCTCGOt0BLS7bxUg/tgaIpa+1FXDH39bA4U9OV3SjbPMfd/d4OUQp+?=
 =?us-ascii?Q?VB6EeVwYUQr3GCwRdlkigAQrBgWZLFvezsOSDkqOwHE7F5qP2WuFJS8Bh/zO?=
 =?us-ascii?Q?+U1C6axGTmidlVXrVzn1QFmAoxCPgCgxpgT9P2HaZ20Iu044tEXUEKSsb17x?=
 =?us-ascii?Q?3Pj87b8yAiV0GAaDJeUfTg7ljN9yXQtRvJWuNwKAbP5CqFV1fKYmVlk2f/kN?=
 =?us-ascii?Q?lJYtaOdmQJY2lAuGxM8CN49+HsVNog/wOFFF3yXori5ZUJuZR1gL8vQIr2F2?=
 =?us-ascii?Q?aq31xqM9Qf5w7x/0NRexxjWFQb7Kid5iJWD7rf68Aix8yfmQcaONuaJs06po?=
 =?us-ascii?Q?qMU9GVPtolzYJq+joNwNJfWsnZTLahbusNm0z5zukHL5XSKziYAnePLZjs3z?=
 =?us-ascii?Q?Gijmn/8WjCYfUxNPdHxKCQM7pWf3XZfC+hhAJEgIHOd+8P8pOss1MVBSWvYM?=
 =?us-ascii?Q?wrNsh42SY28NtFIg3myIBEj4TW9oXZ1o/rxJ9YnL2JbuXX6g0gSc5NaMQSb/?=
 =?us-ascii?Q?9UexkLoYZACixBI8XIPG5WBrBX4lMNs6cVip6TFCJ/GD5cDdVVWPGVZA4zf8?=
 =?us-ascii?Q?KbYZl4Yf9JsuN8C+Jx/bMYdPIQIbRsx+sTAPXVyX/JRvWu32yYrKvPtlYPOJ?=
 =?us-ascii?Q?kcVhnbRHn+Dxb4pA8dBh4ZceMaL0IatWQe8nm33OYgI9PVs/YHlbbVIfAeBL?=
 =?us-ascii?Q?6qd2vnlmLhqzejbSCQr8pijGJRxmRc1iIa6MisCYNDXG+hTv1cCwBB/f7pNM?=
 =?us-ascii?Q?etGO/No1+ldyr8TvsNxqvLaggDDKffpeINVWeXjk9fYiEJ7e8mpogWBcqbfZ?=
 =?us-ascii?Q?X04GXi5bqaH6j1jjI3UgijR6w7XiM93coyjk8NJREHO3qem0HZKkDSE03OP1?=
 =?us-ascii?Q?HFCEVJ0yz4GaKZLpMH2kyHEw7A1rKPixfxtc15dTdIQ0CDZrvToQ1iZ/1/cj?=
 =?us-ascii?Q?Tx9y7RExCWw8tVUkcsLcpS5BVdS/elMR7N0K7OEtM6uVAzRILdm5ZwYT9ctb?=
 =?us-ascii?Q?ldRW6qlf6A5ZJiJ7zb4fvgIz/eI/xuegbOUpAj89Rd9mip8Rn6r7PaR7Jyu2?=
 =?us-ascii?Q?Mu2CpZm4yVmFpcJoufEM/hhCKrI1P2bEOn3cNy517iIzO9Dz/mzXuH1KL+S6?=
 =?us-ascii?Q?Z3ZwEU8rVYXuxcxlncTAI/cg5JUrfj3TDzb6Pl2hYAQ29pTzTw3VMJGMGgZB?=
 =?us-ascii?Q?ZHENhIGLPN9n/eXmq6XPTPWGmiAvbjjDs635Ivt6tAMYZcOB7s3nwi5aa3QM?=
 =?us-ascii?Q?sh8Fqw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sMhv5Jumpt9QIMcgUf3bBp5A4vTDTwevJcRnm027tPQBui0Wos02ePcD8ruvyrdg0p7kA/GZKMSdUiWMutXGuTEtLpHrsBd8zYDJ8YIkptb3Kas1rgHBoRr+RBuo6dhWjt4U/NpBfMncMlfYTDrnrIn1AfU2vE7ANQ+webY7bzRv1bjZuPdtMClh881GarAhsFCAtvBExeSlfraJLz3Sstuvc+DuT24NpAY79Qs7Cos6dL1JM9W9dKSuOZGUJcKv6Pi2DBjdIwzvf+dozo4COEUNqSpz59zUAknf+ugTAOv5Dt98J1hy7FPXG6/WhcAU5nqWkk2hVQHTOoRurhKpfeL9p4dOU3YSXxXNj/6281c2rc6mYdv13a0p5JqDVq3Yup+XnBShdIZ4Qh1pQyL+CjN4H3pNMKVJ0XH4eUeCBNYQBvQ+JlEqn1xlL+efe1Va
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 21:05:56.3113
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cea37211-1d07-446a-64c4-08de65c3855b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7693
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:roger.pau@citrix.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:jason.andryuk@amd.com,m:alejandro.garciavallejo@amd.com,m:stefano.stabellini@amd.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[stefano.stabellini@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stefano.stabellini@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: C2023103514
X-Rspamd-Action: no action

Introduce CONFIG_NESTED_VIRT (default y, requires EXPERT to disable)
to allow nested virtualization support to be disabled at build time.
This is useful for embedded or safety-focused deployments where
nested virtualization is not needed, reducing code size and attack
surface.

When CONFIG_NESTED_VIRT=n, the following source files are excluded:
- arch/x86/hvm/nestedhvm.c
- arch/x86/hvm/svm/nestedsvm.c
- arch/x86/hvm/vmx/vvmx.c
- arch/x86/mm/nested.c
- arch/x86/mm/hap/nested_hap.c
- arch/x86/mm/hap/nested_ept.c

Add inline stubs where needed in headers.

No functional change when CONFIG_NESTED_VIRT=y.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
Changes in v2:
- add ASSERT_UNREACHABLE
- change default to N and remove EXPERT
- don't compile nested_hap if not VMX
- add XEN_SYSCTL_PHYSCAP_nestedhvm
- add IS_ENABLED check in hvm_nested_virt_supported 
---
 xen/arch/x86/hvm/Kconfig                 | 10 ++++
 xen/arch/x86/hvm/Makefile                |  2 +-
 xen/arch/x86/hvm/svm/Makefile            |  2 +-
 xen/arch/x86/hvm/svm/nestedhvm.h         | 60 +++++++++++++++++++++--
 xen/arch/x86/hvm/svm/svm.c               |  6 +++
 xen/arch/x86/hvm/vmx/Makefile            |  2 +-
 xen/arch/x86/hvm/vmx/vmx.c               | 10 +++-
 xen/arch/x86/include/asm/hvm/hvm.h       |  2 +-
 xen/arch/x86/include/asm/hvm/nestedhvm.h | 52 ++++++++++++++++----
 xen/arch/x86/include/asm/hvm/vmx/vvmx.h  | 62 ++++++++++++++++++++++++
 xen/arch/x86/mm/Makefile                 |  2 +-
 xen/arch/x86/mm/hap/Makefile             |  4 +-
 xen/arch/x86/mm/p2m.h                    |  6 +++
 xen/arch/x86/sysctl.c                    |  2 +
 xen/include/public/sysctl.h              |  4 +-
 15 files changed, 202 insertions(+), 24 deletions(-)

diff --git a/xen/arch/x86/hvm/Kconfig b/xen/arch/x86/hvm/Kconfig
index f32bf5cbb7..133f19a063 100644
--- a/xen/arch/x86/hvm/Kconfig
+++ b/xen/arch/x86/hvm/Kconfig
@@ -92,4 +92,14 @@ config MEM_SHARING
 	bool "Xen memory sharing support (UNSUPPORTED)" if UNSUPPORTED
 	depends on INTEL_VMX
 
+config NESTED_VIRT
+	bool "Nested virtualization support"
+	depends on AMD_SVM || INTEL_VMX
+	default n
+	help
+	  Enable nested virtualization, allowing guests to run their own
+	  hypervisors. This requires hardware support.
+
+	  If unsure, say N.
+
 endif
diff --git a/xen/arch/x86/hvm/Makefile b/xen/arch/x86/hvm/Makefile
index f34fb03934..b8a0a68624 100644
--- a/xen/arch/x86/hvm/Makefile
+++ b/xen/arch/x86/hvm/Makefile
@@ -18,7 +18,7 @@ obj-y += irq.o
 obj-y += mmio.o
 obj-$(CONFIG_VM_EVENT) += monitor.o
 obj-y += mtrr.o
-obj-y += nestedhvm.o
+obj-$(CONFIG_NESTED_VIRT) += nestedhvm.o
 obj-y += pmtimer.o
 obj-y += quirks.o
 obj-y += rtc.o
diff --git a/xen/arch/x86/hvm/svm/Makefile b/xen/arch/x86/hvm/svm/Makefile
index 8a072cafd5..92418e3444 100644
--- a/xen/arch/x86/hvm/svm/Makefile
+++ b/xen/arch/x86/hvm/svm/Makefile
@@ -2,6 +2,6 @@ obj-y += asid.o
 obj-y += emulate.o
 obj-bin-y += entry.o
 obj-y += intr.o
-obj-y += nestedsvm.o
+obj-$(CONFIG_NESTED_VIRT) += nestedsvm.o
 obj-y += svm.o
 obj-y += vmcb.o
diff --git a/xen/arch/x86/hvm/svm/nestedhvm.h b/xen/arch/x86/hvm/svm/nestedhvm.h
index 9bfed5ffd7..ed1aa847e5 100644
--- a/xen/arch/x86/hvm/svm/nestedhvm.h
+++ b/xen/arch/x86/hvm/svm/nestedhvm.h
@@ -26,6 +26,13 @@
 #define nsvm_efer_svm_enabled(v) \
     (!!((v)->arch.hvm.guest_efer & EFER_SVME))
 
+#define NSVM_INTR_NOTHANDLED     3
+#define NSVM_INTR_NOTINTERCEPTED 2
+#define NSVM_INTR_FORCEVMEXIT    1
+#define NSVM_INTR_MASKED         0
+
+#ifdef CONFIG_NESTED_VIRT
+
 int nestedsvm_vmcb_map(struct vcpu *v, uint64_t vmcbaddr);
 void nestedsvm_vmexit_defer(struct vcpu *v,
     uint64_t exitcode, uint64_t exitinfo1, uint64_t exitinfo2);
@@ -57,13 +64,56 @@ int cf_check nsvm_hap_walk_L1_p2m(
     struct vcpu *v, paddr_t L2_gpa, paddr_t *L1_gpa, unsigned int *page_order,
     uint8_t *p2m_acc, struct npfec npfec);
 
-#define NSVM_INTR_NOTHANDLED     3
-#define NSVM_INTR_NOTINTERCEPTED 2
-#define NSVM_INTR_FORCEVMEXIT    1
-#define NSVM_INTR_MASKED         0
-
 int nestedsvm_vcpu_interrupt(struct vcpu *v, const struct hvm_intack intack);
 
+#else /* !CONFIG_NESTED_VIRT */
+
+static inline int nestedsvm_vmcb_map(struct vcpu *v, uint64_t vmcbaddr)
+{
+    ASSERT_UNREACHABLE();
+    return -EOPNOTSUPP;
+}
+static inline void nestedsvm_vmexit_defer(struct vcpu *v,
+    uint64_t exitcode, uint64_t exitinfo1, uint64_t exitinfo2)
+{
+    ASSERT_UNREACHABLE();
+}
+static inline enum nestedhvm_vmexits nestedsvm_vmexit_n2n1(struct vcpu *v,
+    struct cpu_user_regs *regs)
+{
+    ASSERT_UNREACHABLE();
+    return NESTEDHVM_VMEXIT_ERROR;
+}
+static inline enum nestedhvm_vmexits nestedsvm_check_intercepts(struct vcpu *v,
+    struct cpu_user_regs *regs, uint64_t exitcode)
+{
+    ASSERT_UNREACHABLE();
+    return NESTEDHVM_VMEXIT_ERROR;
+}
+static inline void svm_nested_features_on_efer_update(struct vcpu *v)
+{
+    ASSERT_UNREACHABLE();
+}
+static inline void svm_vmexit_do_clgi(struct cpu_user_regs *regs,
+                                      struct vcpu *v)
+{
+    ASSERT_UNREACHABLE();
+}
+static inline void svm_vmexit_do_stgi(struct cpu_user_regs *regs,
+                                       struct vcpu *v)
+{
+    ASSERT_UNREACHABLE();
+}
+static inline bool nestedsvm_gif_isset(struct vcpu *v) { return true; }
+static inline int nestedsvm_vcpu_interrupt(struct vcpu *v,
+                                           const struct hvm_intack intack)
+{
+    ASSERT_UNREACHABLE();
+    return NSVM_INTR_NOTINTERCEPTED;
+}
+
+#endif /* CONFIG_NESTED_VIRT */
+
 #endif /* __X86_HVM_SVM_NESTEDHVM_PRIV_H__ */
 
 /*
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 18ba837738..0234b57afb 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -46,6 +46,10 @@
 
 void noreturn svm_asm_do_resume(void);
 
+#ifndef CONFIG_NESTED_VIRT
+void asmlinkage nsvm_vcpu_switch(void) { }
+#endif
+
 u32 svm_feature_flags;
 
 /*
@@ -2465,6 +2469,7 @@ static struct hvm_function_table __initdata_cf_clobber svm_function_table = {
     .set_rdtsc_exiting    = svm_set_rdtsc_exiting,
     .get_insn_bytes       = svm_get_insn_bytes,
 
+#ifdef CONFIG_NESTED_VIRT
     .nhvm_vcpu_initialise = nsvm_vcpu_initialise,
     .nhvm_vcpu_destroy = nsvm_vcpu_destroy,
     .nhvm_vcpu_reset = nsvm_vcpu_reset,
@@ -2474,6 +2479,7 @@ static struct hvm_function_table __initdata_cf_clobber svm_function_table = {
     .nhvm_vmcx_hap_enabled = nsvm_vmcb_hap_enabled,
     .nhvm_intr_blocked = nsvm_intr_blocked,
     .nhvm_hap_walk_L1_p2m = nsvm_hap_walk_L1_p2m,
+#endif
 
     .get_reg = svm_get_reg,
     .set_reg = svm_set_reg,
diff --git a/xen/arch/x86/hvm/vmx/Makefile b/xen/arch/x86/hvm/vmx/Makefile
index 04a29ce59d..902564b3e2 100644
--- a/xen/arch/x86/hvm/vmx/Makefile
+++ b/xen/arch/x86/hvm/vmx/Makefile
@@ -3,4 +3,4 @@ obj-y += intr.o
 obj-y += realmode.o
 obj-y += vmcs.o
 obj-y += vmx.o
-obj-y += vvmx.o
+obj-$(CONFIG_NESTED_VIRT) += vvmx.o
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 82c55f49ae..252f27322b 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -55,6 +55,10 @@
 #include <public/hvm/save.h>
 #include <public/sched.h>
 
+#ifndef CONFIG_NESTED_VIRT
+void asmlinkage nvmx_switch_guest(void) { }
+#endif
+
 static bool __initdata opt_force_ept;
 boolean_param("force-ept", opt_force_ept);
 
@@ -2033,7 +2037,7 @@ static void nvmx_enqueue_n2_exceptions(struct vcpu *v,
                  nvmx->intr.intr_info, nvmx->intr.error_code);
 }
 
-static int cf_check nvmx_vmexit_event(
+static int cf_check __maybe_unused nvmx_vmexit_event(
     struct vcpu *v, const struct x86_event *event)
 {
     nvmx_enqueue_n2_exceptions(v, event->vector, event->error_code,
@@ -2933,6 +2937,7 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
     .handle_cd            = vmx_handle_cd,
     .set_info_guest       = vmx_set_info_guest,
     .set_rdtsc_exiting    = vmx_set_rdtsc_exiting,
+#ifdef CONFIG_NESTED_VIRT
     .nhvm_vcpu_initialise = nvmx_vcpu_initialise,
     .nhvm_vcpu_destroy    = nvmx_vcpu_destroy,
     .nhvm_vcpu_reset      = nvmx_vcpu_reset,
@@ -2942,8 +2947,9 @@ static struct hvm_function_table __initdata_cf_clobber vmx_function_table = {
     .nhvm_vcpu_vmexit_event = nvmx_vmexit_event,
     .nhvm_intr_blocked    = nvmx_intr_blocked,
     .nhvm_domain_relinquish_resources = nvmx_domain_relinquish_resources,
-    .update_vlapic_mode = vmx_vlapic_msr_changed,
     .nhvm_hap_walk_L1_p2m = nvmx_hap_walk_L1_p2m,
+#endif
+    .update_vlapic_mode = vmx_vlapic_msr_changed,
 #ifdef CONFIG_VM_EVENT
     .enable_msr_interception = vmx_enable_msr_interception,
 #endif
diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
index 7d9774df59..536a38b450 100644
--- a/xen/arch/x86/include/asm/hvm/hvm.h
+++ b/xen/arch/x86/include/asm/hvm/hvm.h
@@ -711,7 +711,7 @@ static inline bool hvm_altp2m_supported(void)
 /* Returns true if we have the minimum hardware requirements for nested virt */
 static inline bool hvm_nested_virt_supported(void)
 {
-    return hvm_funcs.caps.nested_virt;
+    return IS_ENABLED(CONFIG_NESTED_VIRT) && hvm_funcs.caps.nested_virt;
 }
 
 #ifdef CONFIG_ALTP2M
diff --git a/xen/arch/x86/include/asm/hvm/nestedhvm.h b/xen/arch/x86/include/asm/hvm/nestedhvm.h
index ea2c1bc328..e18d59e0eb 100644
--- a/xen/arch/x86/include/asm/hvm/nestedhvm.h
+++ b/xen/arch/x86/include/asm/hvm/nestedhvm.h
@@ -25,9 +25,21 @@ enum nestedhvm_vmexits {
 /* Nested HVM on/off per domain */
 static inline bool nestedhvm_enabled(const struct domain *d)
 {
-    return IS_ENABLED(CONFIG_HVM) && (d->options & XEN_DOMCTL_CDF_nested_virt);
+    return IS_ENABLED(CONFIG_NESTED_VIRT) &&
+           (d->options & XEN_DOMCTL_CDF_nested_virt);
 }
 
+/* Nested paging */
+#define NESTEDHVM_PAGEFAULT_DONE       0
+#define NESTEDHVM_PAGEFAULT_INJECT     1
+#define NESTEDHVM_PAGEFAULT_L1_ERROR   2
+#define NESTEDHVM_PAGEFAULT_L0_ERROR   3
+#define NESTEDHVM_PAGEFAULT_MMIO       4
+#define NESTEDHVM_PAGEFAULT_RETRY      5
+#define NESTEDHVM_PAGEFAULT_DIRECT_MMIO 6
+
+#ifdef CONFIG_NESTED_VIRT
+
 /* Nested VCPU */
 int nestedhvm_vcpu_initialise(struct vcpu *v);
 void nestedhvm_vcpu_destroy(struct vcpu *v);
@@ -38,14 +50,6 @@ bool nestedhvm_vcpu_in_guestmode(struct vcpu *v);
 #define nestedhvm_vcpu_exit_guestmode(v)  \
     vcpu_nestedhvm(v).nv_guestmode = 0
 
-/* Nested paging */
-#define NESTEDHVM_PAGEFAULT_DONE       0
-#define NESTEDHVM_PAGEFAULT_INJECT     1
-#define NESTEDHVM_PAGEFAULT_L1_ERROR   2
-#define NESTEDHVM_PAGEFAULT_L0_ERROR   3
-#define NESTEDHVM_PAGEFAULT_MMIO       4
-#define NESTEDHVM_PAGEFAULT_RETRY      5
-#define NESTEDHVM_PAGEFAULT_DIRECT_MMIO 6
 int nestedhvm_hap_nested_page_fault(struct vcpu *v, paddr_t *L2_gpa,
                                     struct npfec npfec);
 
@@ -59,6 +63,36 @@ unsigned long *nestedhvm_vcpu_iomap_get(bool ioport_80, bool ioport_ed);
 
 void nestedhvm_vmcx_flushtlb(struct p2m_domain *p2m);
 
+#else /* !CONFIG_NESTED_VIRT */
+
+static inline int nestedhvm_vcpu_initialise(struct vcpu *v)
+{
+    ASSERT_UNREACHABLE();
+    return -EOPNOTSUPP;
+}
+static inline void nestedhvm_vcpu_destroy(struct vcpu *v) { }
+static inline void nestedhvm_vcpu_reset(struct vcpu *v)
+{
+    ASSERT_UNREACHABLE();
+}
+static inline bool nestedhvm_vcpu_in_guestmode(struct vcpu *v) { return false; }
+static inline int nestedhvm_hap_nested_page_fault(struct vcpu *v, paddr_t *L2_gpa,
+                                                  struct npfec npfec)
+{
+    ASSERT_UNREACHABLE();
+    return NESTEDHVM_PAGEFAULT_L0_ERROR;
+}
+#define nestedhvm_vcpu_enter_guestmode(v) do { ASSERT_UNREACHABLE(); } while (0)
+#define nestedhvm_vcpu_exit_guestmode(v)  do { ASSERT_UNREACHABLE(); } while (0)
+#define nestedhvm_paging_mode_hap(v) false
+#define nestedhvm_vmswitch_in_progress(v) false
+static inline void nestedhvm_vmcx_flushtlb(struct p2m_domain *p2m)
+{
+    ASSERT_UNREACHABLE();
+}
+
+#endif /* CONFIG_NESTED_VIRT */
+
 static inline bool nestedhvm_is_n2(struct vcpu *v)
 {
     if ( !nestedhvm_enabled(v->domain) ||
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h b/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
index da10d3fa96..ad56cdf01e 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vvmx.h
@@ -73,6 +73,8 @@ union vmx_inst_info {
     u32 word;
 };
 
+#ifdef CONFIG_NESTED_VIRT
+
 int cf_check nvmx_vcpu_initialise(struct vcpu *v);
 void cf_check nvmx_vcpu_destroy(struct vcpu *v);
 int cf_check nvmx_vcpu_reset(struct vcpu *v);
@@ -199,5 +201,65 @@ int nept_translate_l2ga(struct vcpu *v, paddr_t l2ga,
                         uint64_t *exit_qual, uint32_t *exit_reason);
 int nvmx_cpu_up_prepare(unsigned int cpu);
 void nvmx_cpu_dead(unsigned int cpu);
+
+#else /* !CONFIG_NESTED_VIRT */
+
+static inline void nvmx_update_exec_control(struct vcpu *v, u32 value)
+{
+    ASSERT_UNREACHABLE();
+}
+static inline void nvmx_update_secondary_exec_control(struct vcpu *v,
+                                                      unsigned long value)
+{
+    ASSERT_UNREACHABLE();
+}
+static inline void nvmx_update_exception_bitmap(struct vcpu *v,
+                                                unsigned long value)
+{
+    ASSERT_UNREACHABLE();
+}
+static inline u64 nvmx_get_tsc_offset(struct vcpu *v)
+{
+    ASSERT_UNREACHABLE();
+    return 0;
+}
+static inline void nvmx_set_cr_read_shadow(struct vcpu *v, unsigned int cr)
+{
+    ASSERT_UNREACHABLE();
+}
+static inline bool nvmx_intercepts_exception(struct vcpu *v, unsigned int vector,
+                                             int error_code)
+{
+    ASSERT_UNREACHABLE();
+    return false;
+}
+static inline int nvmx_n2_vmexit_handler(struct cpu_user_regs *regs,
+                                         unsigned int exit_reason)
+{
+    ASSERT_UNREACHABLE();
+    return 0;
+}
+static inline void nvmx_idtv_handling(void)
+{
+    ASSERT_UNREACHABLE();
+}
+static inline int nvmx_msr_read_intercept(unsigned int msr, u64 *msr_content)
+{
+    ASSERT_UNREACHABLE();
+    return 0;
+}
+static inline int nvmx_handle_vmx_insn(struct cpu_user_regs *regs,
+                                       unsigned int exit_reason)
+{
+    ASSERT_UNREACHABLE();
+    return 0;
+}
+static inline int nvmx_cpu_up_prepare(unsigned int cpu) { return 0; }
+static inline void nvmx_cpu_dead(unsigned int cpu) { }
+
+#define get_vvmcs(vcpu, encoding) 0
+
+#endif /* CONFIG_NESTED_VIRT */
+
 #endif /* __ASM_X86_HVM_VVMX_H__ */
 
diff --git a/xen/arch/x86/mm/Makefile b/xen/arch/x86/mm/Makefile
index 960f6e8409..aa15811c2e 100644
--- a/xen/arch/x86/mm/Makefile
+++ b/xen/arch/x86/mm/Makefile
@@ -7,7 +7,7 @@ obj-$(CONFIG_SHADOW_PAGING) += guest_walk_4.o
 obj-$(CONFIG_VM_EVENT) += mem_access.o
 obj-$(CONFIG_MEM_PAGING) += mem_paging.o
 obj-$(CONFIG_MEM_SHARING) += mem_sharing.o
-obj-$(CONFIG_HVM) += nested.o
+obj-$(CONFIG_NESTED_VIRT) += nested.o
 obj-$(CONFIG_HVM) += p2m.o
 obj-y += p2m-basic.o
 obj-$(CONFIG_INTEL_VMX) += p2m-ept.o
diff --git a/xen/arch/x86/mm/hap/Makefile b/xen/arch/x86/mm/hap/Makefile
index 67c29b2162..2082dfee2d 100644
--- a/xen/arch/x86/mm/hap/Makefile
+++ b/xen/arch/x86/mm/hap/Makefile
@@ -2,5 +2,5 @@ obj-y += hap.o
 obj-y += guest_walk_2.o
 obj-y += guest_walk_3.o
 obj-y += guest_walk_4.o
-obj-y += nested_hap.o
-obj-$(CONFIG_INTEL_VMX) += nested_ept.o
+obj-$(CONFIG_NESTED_VIRT) += nested_hap.o
+obj-$(filter $(CONFIG_NESTED_VIRT),$(CONFIG_INTEL_VMX)) += nested_ept.o
diff --git a/xen/arch/x86/mm/p2m.h b/xen/arch/x86/mm/p2m.h
index 635f5a7f45..63808dddcc 100644
--- a/xen/arch/x86/mm/p2m.h
+++ b/xen/arch/x86/mm/p2m.h
@@ -25,9 +25,15 @@ void p2m_teardown_altp2m(struct domain *d);
 void p2m_flush_table_locked(struct p2m_domain *p2m);
 int __must_check p2m_remove_entry(struct p2m_domain *p2m, gfn_t gfn, mfn_t mfn,
                                   unsigned int page_order);
+#ifdef CONFIG_NESTED_VIRT
 void p2m_nestedp2m_init(struct p2m_domain *p2m);
 int p2m_init_nestedp2m(struct domain *d);
 void p2m_teardown_nestedp2m(struct domain *d);
+#else
+static inline void p2m_nestedp2m_init(struct p2m_domain *p2m) { }
+static inline int p2m_init_nestedp2m(struct domain *d) { return 0; }
+static inline void p2m_teardown_nestedp2m(struct domain *d) { }
+#endif
 
 int ept_p2m_init(struct p2m_domain *p2m);
 void ept_p2m_uninit(struct p2m_domain *p2m);
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index 1b04947516..b1d865e1c8 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -103,6 +103,8 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
         pi->capabilities |= XEN_SYSCTL_PHYSCAP_hap;
     if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
         pi->capabilities |= XEN_SYSCTL_PHYSCAP_shadow;
+    if ( hvm_nested_virt_supported() )
+        pi->capabilities |= XEN_SYSCTL_PHYSCAP_nestedhvm;
 }
 
 long arch_do_sysctl(
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index 66c9b65465..b4bd1dd7b2 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -100,9 +100,11 @@ struct xen_sysctl_tbuf_op {
 /* Xen supports the Grant v1 and/or v2 ABIs. */
 #define XEN_SYSCTL_PHYSCAP_gnttab_v1     (1u << 8)
 #define XEN_SYSCTL_PHYSCAP_gnttab_v2     (1u << 9)
+/* The platform supports nested HVM. */
+#define XEN_SYSCTL_PHYSCAP_nestedhvm     (1u << 10)
 
 /* Max XEN_SYSCTL_PHYSCAP_* constant.  Used for ABI checking. */
-#define XEN_SYSCTL_PHYSCAP_MAX XEN_SYSCTL_PHYSCAP_gnttab_v2
+#define XEN_SYSCTL_PHYSCAP_MAX XEN_SYSCTL_PHYSCAP_nestedhvm
 
 #if defined(__arm__) || defined(__aarch64__)
 #define XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK  (0x1FU)
-- 
2.25.1


