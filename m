Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id BInPJ0Osj2kCSgEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 23:57:07 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EA9139E2B
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 23:57:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1232035.1536920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vr25f-0001I5-G4; Fri, 13 Feb 2026 22:56:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1232035.1536920; Fri, 13 Feb 2026 22:56:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vr25f-0001GD-Cl; Fri, 13 Feb 2026 22:56:47 +0000
Received: by outflank-mailman (input) for mailman id 1232035;
 Fri, 13 Feb 2026 22:56:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p2Ni=AR=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vr25e-0001G7-0u
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 22:56:46 +0000
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c105::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43604bd2-092f-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 23:56:43 +0100 (CET)
Received: from BL1PR13CA0410.namprd13.prod.outlook.com (2603:10b6:208:2c2::25)
 by DM6PR12MB4284.namprd12.prod.outlook.com (2603:10b6:5:21a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Fri, 13 Feb
 2026 22:56:39 +0000
Received: from BL6PEPF0001AB56.namprd02.prod.outlook.com
 (2603:10b6:208:2c2:cafe::15) by BL1PR13CA0410.outlook.office365.com
 (2603:10b6:208:2c2::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.12 via Frontend Transport; Fri,
 13 Feb 2026 22:56:41 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0001AB56.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Fri, 13 Feb 2026 22:56:38 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 13 Feb
 2026 16:56:38 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 13 Feb
 2026 14:56:38 -0800
Received: from fedora.mshome.net (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 13 Feb 2026 16:56:35 -0600
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
X-Inumbo-ID: 43604bd2-092f-11f1-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kfnq6NdNNVuiOuaR6B4mTFtSUC5xmYKhOavWIw5rVl51xdSDFfjjcNv7WrDrBuNvIrfhggW07s9/uvxbwc6sNJqCCzI/KhZ5FWW0spytDUYnDqBK+noj3UW/fXvmIAaOY7iy3S5LG5xA/26iT+C7c0zDUwSZjoSanDrYC6Ci3LVdscSQLmbbAA8AsjKTiSiEbLZckWlp/byALNLpr53i89ZpUEXRBA9xECjhYeN0usiAAaaJZIQVPOxjpN51a+yX/mXbMFv7TivjS1kFX2eHeS2CRwGEVGYGT+DnYhm4Hc930uX80mnGpMJwAeXpBZZF2QS2hJgQH7Rl5uHp8LIgcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ycUUyyRqydkafbiPgDfQrb38BnVTwnbLy0kPTis535M=;
 b=dgKpYDswQdFigO3A0ZKLa/uhp4WIAxvwYBE4mQA+RW1sgA0SLOtkZiCImyDRWgAg0BRjx2G0aJGFPb7njUOAcPE9SVezhwIoqgPpHQpsLxOHC/NLnIM/cN6qtT9N3bgOz81033F7TCjBULA57FsjE6oI4FoeUCwBrV114LlAo8/ttiF+hXFFFO1zjT3WuR1Q4v6BZu57V2Av3WNrxsF1q3qzk4yXri4AzakuVzgoJkpBorwNAgJA5aNJcpwxbuxVBfwR2H3b2uCms/48oeVRrXUbhhhbrEB3pfCEvaIvmSHAfoRX2MoA04sL3yVSaIZb2H0xsWYBZIhTepifK7R2+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ycUUyyRqydkafbiPgDfQrb38BnVTwnbLy0kPTis535M=;
 b=NV4a8dCHnSc6mc3o2yVjP5bQlzxIE4OnUzg3oqsiCg/d/0Bm3imd1VMFFlcd5kWWNbaXrPKxtx0pI2QgLF7jPr5liUONiHLXJWqsM5WT7rZV/s/pSZNG4ptU0go3fIV9jisv/PZ0kehCpwGbfsuuwBImlStqgNvcwRRDFMYKRXk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2] xen: Put wait.c behind CONFIG_VM_EVENT
Date: Fri, 13 Feb 2026 17:56:35 -0500
Message-ID: <20260213225635.346187-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB56:EE_|DM6PR12MB4284:EE_
X-MS-Office365-Filtering-Correlation-Id: f67a9200-f6ab-4332-f8be-08de6b53255d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XeMu4kUAiovf5L1z0mzzknysoh277V1GJowCdyETSKwq5M0eySJRL/GHMyA8?=
 =?us-ascii?Q?1/VzJCvnu8xFM6EjbrkRLx8yntRToCxjxG0eMaGIKdQEdYmIipn0wcoJP4BQ?=
 =?us-ascii?Q?G2mGHw4S8Ghfjsva6W+27fx0s8YQGbVPpc9Zl39mfRaZgMWn4ePgwWo7tc2K?=
 =?us-ascii?Q?9HM30HIeHlrqCOYRkULA1XunLt8hrehCKQI+LTi3OlxAit7n/Ua4ErWl4LOk?=
 =?us-ascii?Q?XWwXhwMqAe3PgTGtwEM1umXKoPwGCqqwcdc4btzEXPbCF1kYfYW2gq4wOKwB?=
 =?us-ascii?Q?W2WxB5aZFn8+4OYJxeObq0lQ5iR9/ZaTESSvrU7sB9Uj6Sq1vTJKWLdHNgOK?=
 =?us-ascii?Q?g+eKSBY+zsOanQoQvXXEg1H7+sLOb/IGsBSPRoe0CRHtPUHsZThlWYmMmBzP?=
 =?us-ascii?Q?YMAmBIKjLiPKugCh9cjRpjmYX4/D3OJYhipSk+mpEQR4LKRfBEdgUCxmr6OJ?=
 =?us-ascii?Q?+a+sX9a62TNfFXGELi9KuGhpYYhuP7o1vWbH3FnCSyi+qNqLBHUvH7oGpCqV?=
 =?us-ascii?Q?n3jMPBZFevhdiXYOTL3L+IcqJLh/zMgd44j4cVVah57pH6OH/wetDPFM+TM+?=
 =?us-ascii?Q?vu9CKfR8EMECahBf4eGghe2YbwWYSWpPlaQkkgG6RjPQ0c1MAE46ZySDieLo?=
 =?us-ascii?Q?yEuY+VvToyjYSzWig/pp6NlWZYR190oyLNG9V5kgaUZ42btnyrIpcGPYOhJK?=
 =?us-ascii?Q?9xq5oQ2XUwmzJOcByb915TIAWQLd/seKQVj7IKdfFK7P5oHcz6++qQiRE/MY?=
 =?us-ascii?Q?ygA0TuFN957govGV3IR6m30SUeHczkmWq+7mS8D1TVCikCaG4ui8d71KEVU2?=
 =?us-ascii?Q?UCv4of4ho2MalUWTGfRWmmjrS+ibfmHWUSxkrDfcpb30/81hJpAohtLre/E4?=
 =?us-ascii?Q?uaDyZVJIPuofPwBKTa6NluqZoTgZYRY+1NSpEdiWuA34D0mCRXKeGRO0NgHD?=
 =?us-ascii?Q?iKhSKM2RE/vD+PTjSg4iFqGoPE9GqhfQohIxMPFY4uxvqLc2juxhANqAm/xt?=
 =?us-ascii?Q?QneaH/RlYgR2CTH0Phbb3CJ5MF/i5Ct06Bh+nt3/8I2U5rm9fRaIKrfDN6Yv?=
 =?us-ascii?Q?kbgFbhFzwQkd8Sp2qsgZc+lWaI6NzzxVvdECCL8QuVV9m0PUFFfQzeGL7UqT?=
 =?us-ascii?Q?ApK8RqHiooYvR4WgVt92A3dsTPbIYkIDJLw7GUyfDyef+9UlW30D3PDz9At4?=
 =?us-ascii?Q?6wG80M/ugI07Q355cjMwv82y85/dYZShqlUrYSSaNlRa9dkixUVkQdTb+bKp?=
 =?us-ascii?Q?VH9sV7gI3zioqut+AZBaxp7SaApNqukFcYQT70p49S5Wa9U+4Y6vEpRGAhEe?=
 =?us-ascii?Q?aPAVxI4qi41R8Cajo+vr+MJ8s0duEPGhApPgS864lbNy9cZCTk9Dh2l0jbzb?=
 =?us-ascii?Q?6DlnzPTRmR8+NNqOepBdSLAiGqxWjY7w/U+r//wR3XwoDfSYVWQQAzULQciT?=
 =?us-ascii?Q?7BQ13VmYkYBkevJTQ8q1qn00nFnf8arvtYHgqhP/RKJPJKKkwH2HWtdj3WDe?=
 =?us-ascii?Q?b5rtW1WQg9z1g3j4TuqamKS6Y1imX72AEWHhSrP6xs+fmhI5hESc6yUiO+qq?=
 =?us-ascii?Q?AKgPybx80kj5EgvDnE/kI95s4i/n5NuK/cUkSeVzR7UOX0V6wsFJ0XkL9X1P?=
 =?us-ascii?Q?lYbgEFZiMovygNzcf3p87GDZoRrRy2yv7MUteqZZ/EuAbNt11KYsW5hu5v6r?=
 =?us-ascii?Q?jzIRtA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	mur0ccYvPySXfHKLLHCwo0zj9dodRM77Y0iPzK3fHPJkyhHGgeCZixwIs40khJLFUuboh2td/F2CDTaEybImVAzAZ0DwluMdTk7iBZ2HiwIN7TBFbldZfDqKhrYqFqUnKuNahLdhpWxDoz/2dyGDEx2h4WtqJWWo5ril26V1vXX0wUDNzECgBFpl/5vaJeasHpdHe6iSbKEUi9CpY35ki3VGbjms5am5HnO4q/vVduszvXWL80y0X5D/AiPTMAGb2i+EOkLJXFYcIN4cFAB5cDicxW+1vEVcb1eaV4ZdxjjHNMeI8FOnut5ftjX4izcimwuBms4XTKsp0GKtR28fUyTyRh8rTa/2cDo3bAIIhy/Trze5qml9sfr4sbZ+zM6FJeIoA438vi8aG29/6TeO51daxdkaz0gEN+OHIsJxkVxHh+2knMkXhx4vyH+G1Ftf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2026 22:56:38.6113
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f67a9200-f6ab-4332-f8be-08de6b53255d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB56.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4284
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jason.andryuk@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	RCVD_COUNT_TWELVE(0.00)[12];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email]
X-Rspamd-Queue-Id: 03EA9139E2B
X-Rspamd-Action: no action

wait.c is only used by vm_event.c, so build it when CONFIG_VM_EVENT is
selected.

Provide stubs of functions called from common code.  entry.S needs an
ifdef to hide the symbol from the assembly.

Also conditionalize .waitqueue_vcpu in struct vcpu to save space.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v2:
Use CONFIG_VM_EVENT
---
 xen/arch/x86/x86_64/entry.S |  2 ++
 xen/common/Makefile         |  2 +-
 xen/include/xen/sched.h     |  2 ++
 xen/include/xen/wait.h      | 11 +++++++++--
 4 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/x86_64/entry.S b/xen/arch/x86/x86_64/entry.S
index ca446c6ff0..8b83082413 100644
--- a/xen/arch/x86/x86_64/entry.S
+++ b/xen/arch/x86/x86_64/entry.S
@@ -664,7 +664,9 @@ FUNC(continue_pv_domain)
         ALTERNATIVE "", "mov $2, %eax; incsspd %eax", X86_FEATURE_XEN_SHSTK
 #endif
 
+#ifdef CONFIG_VM_EVENT
         call  check_wakeup_from_wait
+#endif
 ret_from_intr:
         GET_CURRENT(bx)
         testb $3, UREGS_cs(%rsp)
diff --git a/xen/common/Makefile b/xen/common/Makefile
index 4fc0c15088..dac8b711cd 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -61,7 +61,7 @@ obj-y += virtual_region.o
 obj-$(CONFIG_VM_EVENT) += vm_event.o
 obj-$(CONFIG_HAS_VMAP) += vmap.o
 obj-y += vsprintf.o
-obj-y += wait.o
+obj-$(CONFIG_VM_EVENT) += wait.o
 obj-bin-y += warning.init.o
 obj-y += xmalloc_tlsf.o
 
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 1268632344..40a35fc15c 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -293,7 +293,9 @@ struct vcpu
     /* Multicall information. */
     struct mc_state  mc_state;
 
+#ifdef CONFIG_VM_EVENT
     struct waitqueue_vcpu *waitqueue_vcpu;
+#endif
 
     struct evtchn_fifo_vcpu *evtchn_fifo;
 
diff --git a/xen/include/xen/wait.h b/xen/include/xen/wait.h
index 1c68bc564b..e3510431ac 100644
--- a/xen/include/xen/wait.h
+++ b/xen/include/xen/wait.h
@@ -49,11 +49,18 @@ do {                                            \
 } while (0)
 
 /* Private functions. */
-int init_waitqueue_vcpu(struct vcpu *v);
-void destroy_waitqueue_vcpu(struct vcpu *v);
 void prepare_to_wait(struct waitqueue_head *wq);
 void wait(void);
 void finish_wait(struct waitqueue_head *wq);
+
+#ifdef CONFIG_VM_EVENT
+int init_waitqueue_vcpu(struct vcpu *v);
+void destroy_waitqueue_vcpu(struct vcpu *v);
 void check_wakeup_from_wait(void);
+#else
+static inline int init_waitqueue_vcpu(struct vcpu *v) { return 0; }
+static inline void destroy_waitqueue_vcpu(struct vcpu *v) {}
+static inline void check_wakeup_from_wait(void) {}
+#endif
 
 #endif /* __XEN_WAIT_H__ */
-- 
2.53.0


