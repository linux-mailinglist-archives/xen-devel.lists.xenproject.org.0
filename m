Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB029522D4
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 21:51:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777633.1187751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seK1Z-0004GM-Ss; Wed, 14 Aug 2024 19:51:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777633.1187751; Wed, 14 Aug 2024 19:51:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seK1Z-0004EG-Nw; Wed, 14 Aug 2024 19:51:13 +0000
Received: by outflank-mailman (input) for mailman id 777633;
 Wed, 14 Aug 2024 19:51:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gOS0=PN=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1seK1Y-0003Wx-01
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 19:51:12 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20622.outbound.protection.outlook.com
 [2a01:111:f403:2418::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8dd6a284-5a76-11ef-a505-bb4a2ccca743;
 Wed, 14 Aug 2024 21:51:11 +0200 (CEST)
Received: from MW2PR16CA0046.namprd16.prod.outlook.com (2603:10b6:907:1::23)
 by SA1PR12MB8743.namprd12.prod.outlook.com (2603:10b6:806:37c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Wed, 14 Aug
 2024 19:51:04 +0000
Received: from CO1PEPF000075F0.namprd03.prod.outlook.com
 (2603:10b6:907:1:cafe::ad) by MW2PR16CA0046.outlook.office365.com
 (2603:10b6:907:1::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22 via Frontend
 Transport; Wed, 14 Aug 2024 19:51:04 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000075F0.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Wed, 14 Aug 2024 19:51:04 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 Aug
 2024 14:51:03 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 Aug
 2024 14:51:03 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 14 Aug 2024 14:51:02 -0500
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
X-Inumbo-ID: 8dd6a284-5a76-11ef-a505-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fZ6is2OKSqdYNpys3d1K7VBgqyyAY67MfnY0PjwU3IgcO4WJLdbjIcINGGBAJSc8IqdIGJowJ24vtXJguPj2kVP2WAKFMN8vxAe7sxw6C+kXz7R/ZrXIZnEBqg3NcVyqtOB47+iNfEpd3N87W7+WLdL+xsX+X1od1R1Nsci2USHrlRe/sv7ueRTVdJw0AaEfzfy48ZCRFLO+Xyf/w4Yfy5O0sPVbCz4ZTzlTwYOCUWa9cI6whQRYGUiwLBTxFi/i2pjiSPu6F0hYd4Sz+bP0kNcEgDh0ofdNYh4ei5x7jgxK60ptPAzk3ExzC4FgI1G7erLY8pjnYkIZq3GnbGPsmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=87Cir7MUe+90Zd8HQRFVV15Z21B672vcEXroWazgwgg=;
 b=ZeAeS989OLttb6QlmfBvI/WoYi0U1R6mMrb0fOEB8YcBjW9VEBVEQCYKkoLHZWT8sQuXa0fYbL4ECr/VZvUV0tM0KB7zCbVEoHpiCf+QDTkNW2qTThSl/Lpd4cOrHACEqE5my7Xq7hVFe+nrqpXIGTJAaTlnHet24eXHxvhq3y94N6uG/TYAG9aaJZ44t6AGbLZpKAE+m0lSgPc6+SXF5hb8NcmHaXLo1BXVHM/ZBBNJ1rPEbyxV05zOS+P4OI/2Cg9egO/JTQ0y+mk+25mD4UleVFCAVlZ9TQ6pUwvRNN8FvrcPbAEOCVcT64T091nzumwuApflbIz+eVYXpCAHIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=87Cir7MUe+90Zd8HQRFVV15Z21B672vcEXroWazgwgg=;
 b=2N0BS+dlpm/JXu2SbD0i3UpV0TCtpAwk6BYxRwB6S8dgg4+FQypxeHyfcEy7+c3zMcKoTed3iPWweCN/pwDVT13flMK8g+fJcRsO+7KuMxIn5KIbKu5wu0ycfFB4Hkw4LJXt6TVRdyuabXOlwyPdbv0DTKB2b9eW55taluIGNL8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: Juergen Gross <jgross@suse.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>, "Ingo
 Molnar" <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>, Stefano Stabellini <sstabellini@kernel.org>, "Oleksandr
 Tyshchenko" <oleksandr_tyshchenko@epam.com>, Paolo Bonzini
	<pbonzini@redhat.com>, Brian Gerst <brgerst@gmail.com>
CC: <xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>, "Jason
 Andryuk" <jason.andryuk@amd.com>
Subject: [PATCH v2 3/5] x86/pvh: Set phys_base when calling xen_prepare_pvh()
Date: Wed, 14 Aug 2024 15:50:51 -0400
Message-ID: <20240814195053.5564-4-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240814195053.5564-1-jason.andryuk@amd.com>
References: <20240814195053.5564-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F0:EE_|SA1PR12MB8743:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bc7d726-6511-4f2d-7f26-08dcbc9a6e6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0vzejcCUK6r8Y8Ulc57rWd6+7qNtKC9BzVRWN4QujDn2uG0Yv8w4aK/9J/RV?=
 =?us-ascii?Q?W6mnTPXhoJcG+AC6Owoojcb/2apBtIhiSZnr2ntiZRMmE35IgLLH9SDXJFs6?=
 =?us-ascii?Q?6A+zVevCfwpbLTQKzWAH0mTjqMxJ1Kf10Fe8NvwaSusmqZQE/iv/RkiloABj?=
 =?us-ascii?Q?C9q7zBuo4h8N9Zm8dmTPIgCUQV7gZlOiKIJBocfCCW4N+kk86Wx/O8KrZlz0?=
 =?us-ascii?Q?H+h0uGIxfp0rR88a4aXZeB+U4J1tCQykfZU6tzf+eepjVh7hgpHQNTmwlEwY?=
 =?us-ascii?Q?shBWVWzzRvTf9hIbp0Bj3tb4OygaO9Wt+PSaHpvkijd9qa8MA5ScPDBfaW5Z?=
 =?us-ascii?Q?O9rBhpANAcJZVg3NPLKVMRi3PvtRokxWFm2TWE6YmRu0odDVWv4o8PpdUNW1?=
 =?us-ascii?Q?i1Fu7c7lLPLuaVwFamgU0XhEilny+WXBglGq5/LtMFPUZV+E3M0RB8z5t3Lc?=
 =?us-ascii?Q?rRUv2hswC0A7ckbW4cNpgh5ofVKUnIAjtH/sJ0Tq36gjfsLZPvma3qeysZvt?=
 =?us-ascii?Q?xZRTMDKDKQQmF+I+LYsKP3aW/mq7eLhx2XQN3ISidIQ3AaLRvp+fJT32pzmj?=
 =?us-ascii?Q?4GTfAkLmlEGhBK9zWSVd6+ZjRiOUspx2wf4qxdIj9PsmLeWyXfkrTaWiRF/b?=
 =?us-ascii?Q?aHRdwl9lzAcpe2S7dSaAT3ecO08+q4N9Ex71FJ7dyKwGYCNa1s8xzL2stIHe?=
 =?us-ascii?Q?R5F9hwg8KKcQqUCcMXc384Ah9oyTdwdOyPTLNNlTfORJzDEyKZuqllRPYi4i?=
 =?us-ascii?Q?AMRZA+Sj4su5jcNflKbRvj4BsGvGyh1kI8sfrO+6nZSytl3Oa/ziGkDqkxVl?=
 =?us-ascii?Q?NNdY542kA+KSPzZUvMP9bOMcCBytTQHfbnAPAuVbcKQxmrCG6pbfk6Q2qNyb?=
 =?us-ascii?Q?pxA6jXXs9b371UkZXnVfFbVe+Kw+1XAIIk2oEcMednC78m6YxqAWEeSfLcL2?=
 =?us-ascii?Q?LRox1gTaRdpcKdlxFpew9LckrF7J7RdHVqBIXMwA98nKTDQ/D03gXtOy1LoT?=
 =?us-ascii?Q?SUkvObYkNo7mi3aV4fiXrNpWXrlJMEtDviabVDB0aLbnarIopUicKoQjG2SQ?=
 =?us-ascii?Q?nWhMTXZtJPx30Jl5BNb2jHvkGqQ5RMtLSCLszCq9yZTYpPOMgBn+8mQ3AIUQ?=
 =?us-ascii?Q?IeICBRZA1bV30ufoY+3uNTkLUtpVMm4It2J0KTIzoJk4/aXEVtMxbWFkC6cn?=
 =?us-ascii?Q?aXdIgFks5h3yD8Lk83AJ+TZLD+cVmwAHsD4dlRQS6gwX0L2rU17QpjYPba4W?=
 =?us-ascii?Q?Ao20vOrjv9f3A0ryCQ/t7sh1owFjVm+z7dSU5iMN0IjCEvqo0dDdp82jO+V5?=
 =?us-ascii?Q?jlG3+/qMF7LABquaQpOls3aOF8AaY9L75Ldyxk2FXfK84OznW9WzagABqc0E?=
 =?us-ascii?Q?GCf1dfJN95Cmfp4wG2qLFWU3FKVqUYHUqm38J4TBJ1BUEOadT/0VEYm8poQJ?=
 =?us-ascii?Q?Uu0jHFi5NZh71/cQmcvKgyaMvRubiD7O?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 19:51:04.1351
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bc7d726-6511-4f2d-7f26-08dcbc9a6e6a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075F0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8743

phys_base needs to be set for __pa() to work in xen_pvh_init() when
finding the hypercall page.  Set it before calling into
xen_prepare_pvh(), which calls xen_pvh_init().  Clear it afterward to
avoid __startup_64() adding to it and creating an incorrect value.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
v2:
Fix comment style
Add Juergen's R-b
s/LOAD_PHYSICAL_ADDR/_pa(pvh_start_xen)/ in case they differ
---
 arch/x86/platform/pvh/head.S | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/x86/platform/pvh/head.S b/arch/x86/platform/pvh/head.S
index ba4d0eab4436..14b4345d9bae 100644
--- a/arch/x86/platform/pvh/head.S
+++ b/arch/x86/platform/pvh/head.S
@@ -125,7 +125,20 @@ SYM_CODE_START_LOCAL(pvh_start_xen)
 	xor %edx, %edx
 	wrmsr
 
+	/*
+	 * Calculate load offset and store in phys_base.  __pa() needs
+	 * phys_base set to calculate the hypercall page in xen_pvh_init().
+	 */
+	movq %rbp, %rbx
+	subq $_pa(pvh_start_xen), %rbx
+	movq %rbx, phys_base(%rip)
 	call xen_prepare_pvh
+	/*
+	 * Clear phys_base.  __startup_64 will *add* to its value,
+	 * so reset to 0.
+	 */
+	xor  %rbx, %rbx
+	movq %rbx, phys_base(%rip)
 
 	/* startup_64 expects boot_params in %rsi. */
 	lea pvh_bootparams(%rip), %rsi
-- 
2.34.1


