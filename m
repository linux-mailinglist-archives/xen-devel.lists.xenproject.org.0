Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OZfEBUDY+ml8TQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 07:57:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6A54D6655
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 07:57:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301156.1575485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKVFK-0006jS-Fh; Wed, 06 May 2026 05:56:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301156.1575485; Wed, 06 May 2026 05:56:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKVFK-0006cI-9O; Wed, 06 May 2026 05:56:34 +0000
Received: by outflank-mailman (input) for mailman id 1301156;
 Wed, 06 May 2026 05:56:33 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <penny.zheng@amd.com>) id 1wKVFJ-0006YS-1f
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 05:56:33 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKVFI-00GH5N-Eb
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 07:56:32 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <penny.zheng@amd.com>)
 id 69fad7fd-bab6-0a2a0a5309dd-0a2a450aec6a-44
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 07:56:31 +0200
Received: from [52.101.85.7]
 (helo=BYAPR05CU005.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <penny.zheng@amd.com>)
 id 69fad80d-56b3-0a2a450a0019-346555076118-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 07:56:31 +0200
Received: from SA1PR02CA0006.namprd02.prod.outlook.com (2603:10b6:806:2cf::15)
 by SN7PR12MB7177.namprd12.prod.outlook.com (2603:10b6:806:2a5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Wed, 6 May
 2026 05:56:23 +0000
Received: from SN1PEPF00036F3F.namprd05.prod.outlook.com
 (2603:10b6:806:2cf:cafe::9c) by SA1PR02CA0006.outlook.office365.com
 (2603:10b6:806:2cf::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Wed,
 6 May 2026 05:56:23 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F3F.mail.protection.outlook.com (10.167.248.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Wed, 6 May 2026 05:56:23 +0000
Received: from SHA-L-CHUTZHEN.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 6 May
 2026 00:56:07 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ABgYIuFm11r8dreV7cA0DJwFITnbkkyeK5Qo9Php8QrzEeJiU1399+l8JhKRIiVp8zUrs7kQIRv3pAts6y/Tr3K4AxCiXwst48Yzg0+jxNfPrd56oLp3JBGyOjEIR4qnuZkXsWxSwLbzFky5mR+t+OArIUmdJeRV9MmQd1llEaPrToM1xb1fQPWkywTKHeX3TqqpVUTDXWeh2znVcZDgcPFFh7EoLsgG4SgxvM4MuS/xsTx7Ur6EitdpBAYCKolvCDTuHjAP+1wyHoZb+vP9P6k1VEjZWju1zTSvtCGqyE/2sXfEJmSJNalQS54XTJTw/eDmxJefnQtbBqpsG5k/iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HtYmF59T1+vlFA/MbHNkN7Ydeg2pEly/nEThOGxN8ek=;
 b=UTFqJlOcgLd+dl2+0nTQkcqINSb54z21kSN91HdVrnNxJG3G65pUIkAG0l2UBgfC8r+M2sNj3LloifFURyTYEw9HjhqWV0kJQyk8Kfcd9xV22NAZI3tJdNim9en8qLaC9zZg+0JfLLLdlmpBKSys+fghtGp0xn6bIhOd2hWKf69y3feHP2wHoB5y5Gu4+OMC1fo6wkAgZpBQLHulgSnI74qnZ9k4o7+NI/qH1q7Oj+jHdUxU0vkAqA7hLq2xpJPoHA3boYhloTb9EGQepRLVYCWyXUd1JgN7LAxdAhKg2f7JurX++qi0RCkEYR5kA1xuvt6g637kp+fyxkMRbxoEBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HtYmF59T1+vlFA/MbHNkN7Ydeg2pEly/nEThOGxN8ek=;
 b=t64ULJ4i+DqEEuWnfBNxCbjxcQz6WWxjOt7zc/s7QpKYM4G+PPrfWEtCcrDI+HoSdGOH6/uJfTnD/fcQvbJPLWE6ntXFw+cxPUUGMzFsrqvxaiKY7n4SsXtrBQ1HZd0THLi8YHxCamt4P2RvVyCUWTgLzLl3oDtBe8EISynZ788=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <penny.zheng@amd.com>
To: <x86@kernel.org>
CC: <ray.huang@amd.com>, <Jason.Andryuk@amd.com>,
	<stefano.stabellini@amd.com>, Penny Zheng <penny.zheng@amd.com>, "Mario
 Limonciello" <mario.limonciello@amd.com>, Yazen Ghannam
	<yazen.ghannam@amd.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar
	<mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>,
	<xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1 0/2] x86/amd_node: harden amd_smn_init() against Xen dom0 topology
Date: Wed, 6 May 2026 13:55:17 +0800
Message-ID: <20260506055528.476493-1-penny.zheng@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3F:EE_|SN7PR12MB7177:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e8aa03c-bfff-4236-e045-08deab3433fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	1NVEyBkMl3LqMEGt3NC80/SzFN0Hpg6xvKTMYGPUfbUj+o3m43e3P/GFMl7j8LgTmd0cEyjE0W+LysZM1VytePiUkHviB8EAzKcwVu0EHtPWD5aZKrGpVWDTlMrJQ8ngXg18qI3TEamqGggEjBPY2OunV8flVlCYimLTLEstjWxbUpsxbLJKyNkOhlYYhlVgNgALKsImOrTsw12n2tKTfg84koAlywp+NeqiEdnIViQG9Qmlpmi16qbZemWEYaIpOthItOFH61Ut2l5pG/nfbzcmXef8YbAlOzFMTvM4jDIxHjxcVsSd3PopNc8hmiJnNCraND5uMiFCpAVdU4DP4p/mP7K2KCHzKUTIxS8/VE5EPTGZwFjPXFMmY5boz9+DJBgNjzKLvQB4r8Rn4z8hrLttWi8PsZo2y+oEyFGfa/6v2qg6Uvyezb5PpxpDPpHoWGRv8qrZ7KJWC0937/uhX7JbWQH0hoUjVhKBlfCbzQoCfAlIky3ut9vzQmaNcRVW8Tn68QhTqR6B8+ahXItUsIif120DoNvg/Sgg3W8o14DGguxRl9FAx0JGlMBFL4kFQHiHtXUWWEs+JzstBnRbhkbFVDMaDVlck7J55+x8uVL4vTuJjbde+alI1RENN85yKQJiY0cxTstwu1Y2jD+oe1vc/km3nNpdWvWL8OYEQu+edm7cl/isd25bYM0vvksiJeTTluaQb5lwzsUN92IKsdcJPpEvRKjEKEUxm5wv2Yc=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	XYJrrHJ4b4FCGJ9KDdD1K1CPGDtG7/qztUH2o+cpSMg3ux0VNL6RooTSTIJIjJxSA3Xo3Y9uisdahDYebfT3F2qXaAXlVWNjVkn1m1CNmKMHUOluzyI3VLwffFiWNWokh6F7wuh6DnLuxdtgo+C14+yDWuTtYGXwsyoR3bhvnv/sExlPskZRmnVCu4Z/J9kL0fsjkTT5oBtQg8tFQny9WoKRm3S1/xaId4/gbCmWNiOguO92d+wV6uqq+ETxsqkdT3mAe3AvsbYeD4Y2mjZx7EdnVpuXm1mloSJJKL6AAplOwRd7M6aRiLJPCCS0gEYk4A0n3sm78JLwEb68X955cb0imcrlDPWfQ9vo2sYZooivw1TFLwS1Vo5ME/edHnDKwsskejCXNuTB6Q9uTK4LDaBqM+oGCcAP9xngdp1yEDH7p6diOoH0xVWiKg8JMoS+
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 05:56:23.1329
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e8aa03c-bfff-4236-e045-08deab3433fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7177
X-purgate-ID: tlsNG-4011c0/1778046991-4797E8B7-CA23AB72/0/0
X-purgate-type: clean
X-purgate-size: 1221
X-Rspamd-Queue-Id: 5C6A54D6655
X-Rspamd-Action: no action
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
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[penny.zheng@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:x86@kernel.org,m:ray.huang@amd.com,m:Jason.Andryuk@amd.com,m:stefano.stabellini@amd.com,m:penny.zheng@amd.com,m:mario.limonciello@amd.com,m:yazen.ghannam@amd.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:xen-devel@lists.xenproject.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[penny.zheng@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]

While booting a recent linux-next kernel as a Xen PVH dom0 on x86, the kernel
oopses very early during fs_initcall:

  Oops: divide error: 0000 [#1] SMP NOPTI
  RIP: 0010:amd_smn_init+0x188/0x2e0

Followed: on a kernel that survives the divide, it will fail by a NULL pointer
dereference from the first SMN consumer (amd_pmc_probe -> amd_smn_read).

Root cause
==========

To prevent each dom0 vCPU from looking like an SMT sibling of another
vCPU, Xen synthesizes guest x2APIC IDs as vcpu_index * 2. This spacing every
vCPU's APIC ID by 2 can push the synthesized IDs past the package-field
boundary. Linux then infers more "packages" and therefore more AMD
nodes via amd_num_nodes() than the platform actually has, while the
PCI-side host-bridge scan correctly reports the number of root complex.

The fixes are tested on Xen 4.20 PVH dom0 on AMD Zen (16 vCPUs) on top of
linux-next/master (next-20260505).

Penny Zheng (2):
  x86/amd_node: avoid divide-by-zero in amd_smn_init() under Xen dom0
  x86/amd_node: reject SMN access when amd_smn_init() did not complete

 arch/x86/kernel/amd_node.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

-- 
2.43.0


