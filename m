Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kMcTCFhVcmkJiwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:50:32 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4F06A511
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jan 2026 17:50:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1211438.1523055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vixt3-00080J-6h; Thu, 22 Jan 2026 16:50:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1211438.1523055; Thu, 22 Jan 2026 16:50:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vixt3-0007wi-0p; Thu, 22 Jan 2026 16:50:25 +0000
Received: by outflank-mailman (input) for mailman id 1211438;
 Thu, 22 Jan 2026 16:50:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I1tn=73=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vixt2-000783-1m
 for xen-devel@lists.xenproject.org; Thu, 22 Jan 2026 16:50:24 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 706c6b8c-f7b2-11f0-9ccf-f158ae23cfc8;
 Thu, 22 Jan 2026 17:50:22 +0100 (CET)
Received: from PH8PR22CA0020.namprd22.prod.outlook.com (2603:10b6:510:2d1::27)
 by DS7PR12MB6336.namprd12.prod.outlook.com (2603:10b6:8:93::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.6; Thu, 22 Jan 2026 16:49:59 +0000
Received: from CY4PEPF0000EE36.namprd05.prod.outlook.com
 (2603:10b6:510:2d1:cafe::28) by PH8PR22CA0020.outlook.office365.com
 (2603:10b6:510:2d1::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Thu,
 22 Jan 2026 16:49:56 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE36.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 16:49:58 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 22 Jan
 2026 10:49:56 -0600
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
X-Inumbo-ID: 706c6b8c-f7b2-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T+3n0cPcLdk9SVEHj7IowrD+qD4j3QTx9OdQwfolsb4sgjQ58gD6ZjRjwRmW1RsaOH9FUaQRoisXT3M26l2+3KWBftnvBrfwVa+AXcq3ccyPOsI1+LRC6AgrM6+URT2xDsqtwO71dZ1dvdgzSnr2wKZ3rgLLi74F+ze1fGdCQv1446vexcYK5ittF9ctp4GH2UqEt22XbBhWNdKuU2I2KqDyLGk/khPdO/MGTq91sGh1tn5e8qetphZQoWOpSwYy2hNz2ASbNHXEAJTb/3OIDci58r/Va3uVI78tfP9TLajam+dDgEzZJ1jg9h6lLVskUS4goXJED7/9bcv1C54dkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1q3pybJ8njcZIqPSc+UtUPk8iWYvVUF/kPq+Kf/ddO4=;
 b=eaiGPHbviMO9RbjfL+YOXehUABb2lj7YhCitsVWSpbBKwBEsyFUbGA+v5PLIf/hMp0yokKg4kKe3R20svQjZCTlzy5aWBRbU/UVL1RzA1Ec1+b9zmqperbA1JMpx8W8gex5+SmsTtE2ubBqMNUtZGOKrZX4n+gu2b6c9Q+ehcwdK8ealucb3sLaGCHobZeVlAYkP+uvxot2dnJYkq0fZLMsq7c+bzP3c0gY8D+oV6dNv4NGg/u8PZ8Zz0teO4FIdE+T1Lx5vjIWZGx1v7WxxvHGc05Wpphl3MSabRkCG9l+6XWGd8hY2TTUmuF5CPCHv+7Bey0aoHjCpWCfVE+APWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1q3pybJ8njcZIqPSc+UtUPk8iWYvVUF/kPq+Kf/ddO4=;
 b=H+6IuLW1pD9zh+nzHkbsNKk7K/JJHTwweLyFxK7dmSQga4balB12jHmxvbRKMY9yEAGi8dhQBub1Kep5+zJwUtyY3TbmkCFVy+4xXRMMCu2qKmb1cu5sOrNdGFd/Gc8Ou+3DeDJZwggp4PIrVSgLtSfeSjYoM78d+y2Qq1CkMHM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>, Jan Beulich <jbeulich@suse.com>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH 0/4] x86: Drop cross-vendor support
Date: Thu, 22 Jan 2026 17:49:36 +0100
Message-ID: <20260122164943.20691-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE36:EE_|DS7PR12MB6336:EE_
X-MS-Office365-Filtering-Correlation-Id: bdf352a4-46f9-4ce1-911e-08de59d64760
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QlZwbWV2dzNuVlNTb1E3S0srTCtBem5Tb240aG5FVWUwNUdPTjM3YTBmS3ZO?=
 =?utf-8?B?TXRnUkVaM292RE9sYktXUWpJQmFmYzR5V0c0ZkRJNG1DQVptZ0JHeG9OZVg5?=
 =?utf-8?B?VjEydHlkRkt4cDlkakswUmJTWE53c3Q5SzRRS2JiZTlQTWNDck83TmVjcEdw?=
 =?utf-8?B?aWJUcERUWmNwQXV1VmVNRlpqeUFtMFZPdkl4ZmllczlKb05VdTlENHRkZXNW?=
 =?utf-8?B?czd6YVdROVMyMFdwbkhHdHRycFBOcWlRYU5KMTV3R3RGNFI0ejh4L0xlWTho?=
 =?utf-8?B?TnlRTFFqcHYyTkQyeHgvMy9QYytjQy9ZL3IwL2UyYkpWOVBhUnlxc1I5UVZ4?=
 =?utf-8?B?d1c5c2NhZ0hjc0c5L21OYy8rVEVoWkdpM0k5bFFqRFd4OGxHdFZhY1krVFFt?=
 =?utf-8?B?Tmd0TU9zQXdVUG53bTZKUWx0T3hETm1NR01RTzRDWHpiMS9LV2RIRjJOOHlH?=
 =?utf-8?B?dGw3dXNXVXBWeFNHdVpmbEhNWmFIV2p6QlUzcWwwY0d4U2NuV1FwNmZUS3N5?=
 =?utf-8?B?QkdKZVFLZmUvV3JRVFNFQXNRSTFCYzNyMjRMWmwySlVnNWRUTXNCV1A2TFdQ?=
 =?utf-8?B?M0pDWEFGVm45L3p6WHJQR0xzaFpzc0NxeDc0ZUF3dlpBU3JFUFhLaG56elR3?=
 =?utf-8?B?UFVCRlRvNlFJVFlaVjhWNjduVnB5bElHamtaM2wyZlNnZk5jeWJpbWpiMmhK?=
 =?utf-8?B?Z1hBemxGTVdYY3h6TkxPME43UU8xT1dvdHhXbUVHcFJtT08wdGJvWGJMVmd5?=
 =?utf-8?B?NUdHNWxYNVZuK3lYTjVFYmxUeEdIMGV3bXYyZm5HaUlhbis2akk0SEVzMncx?=
 =?utf-8?B?Rmx6WTB2NjhaSHJObjJmSkFaNlVicHdocy9rTFM4cGNveSt0TTZ1RVVUTlBq?=
 =?utf-8?B?aUh4SkFSa2FsU3FvR0M3RDlvNFB4Z2xHV1ZtejZvekJVc21DVlhORGYvd3Bw?=
 =?utf-8?B?R08zZlV5dzhwTldRbHJQWGljVzVTZjhBSXZUS01MTHgycnpmbUhaZW16Zkdu?=
 =?utf-8?B?VVJybG5LYmY5WWxEVjdnUVd3cXZKQ2tvMUUzdmwrQXoxZHI5NE9MVkJSLytG?=
 =?utf-8?B?THRTMUh5RUxLYmEveVFxMXMvSUxiaFBoZFJGVVJmbUN4bnZxSWREd1lTMXE4?=
 =?utf-8?B?NFJlVkhBa0pzQjhtb2Y5ZDZILzhQb1RVaks5a1k3b3FQaHJrTGZDMDRZUE1J?=
 =?utf-8?B?Zkc2UndVQnZNb3p4aEJRd2oxVktUa2p4T1NmUGp0cnNlUEMrWW0xRDhtcG01?=
 =?utf-8?B?MDlUTXdpUElvZzd3Q0NYSGpOaVdFN1dacDA1c0gzUXkwZ1lQYmZBRjlpQ0dS?=
 =?utf-8?B?Y1JWbXlWbjBnblNEM2dhTFFMSkZjZjVsZHFWL2FBakVvNGVhMlpNajhsWlBa?=
 =?utf-8?B?WHR2TWR3YWJNbkpHeEdmRVZ5dnhmMk55VE90RWJMWjI0TFp1cnJnYjUyaWth?=
 =?utf-8?B?anlObzBZNjdDaGVVR2g4NmxrNjQxdDRtU2ptZ2d5QjJsT05LZisrKzFFWjdj?=
 =?utf-8?B?YVZhU24ySmRBY2dyNzBCTmR4S2ZxTUhsOUhLTUhZcGhWcWFXNXdDS0FySHg5?=
 =?utf-8?B?dk1MOUxIY0pCckdsVTRzUy9qOFZGVmdsaHpCaXdwTGx3cnV5NFp2ZHQ3MS9t?=
 =?utf-8?B?YmQyMGIvUmNmUzhtU1M3cHlDbjVyRlFEQm1BREVVSVlGRXpCcjhYZFdkclZv?=
 =?utf-8?B?WUpaRkR0Z1RuSy83ME1jT1hFbU4ray8yQ2pQbEcxckNWWXBlUDlhd3p4VVhO?=
 =?utf-8?B?TXgrZG5QZU1TL3NEWkwvZ3VOVHRoQWdzcE8zWDFCeGxOZC9tL0NkVmxtajJm?=
 =?utf-8?B?UDNEdkhPVlIxQi8xSmFCV0h6emQyNVJRbWFBQk5QTmJWQkZDdTh5U3V5U3pU?=
 =?utf-8?B?bEdPVWRtbjcvMFdWelFrZkRvNGlTVS80c2JUamNMT2Qrc2UyalhMRHFSei9E?=
 =?utf-8?B?QnErT2RXMXUrUjI2K3lndWtrZUJKTm9nS09nS04vc2hGMTkxbnRlYUJtU1py?=
 =?utf-8?B?Ry8vRFFJUFl2d0MrOHJWL21qcGw5UExIWlFXcWJDTktjL2ZXak95a0F4aTBE?=
 =?utf-8?B?dDhTcHY2c0ZUdGw3RHNtVUlzaWo5T2liS1l0Y245MDB2YUxqaG93UkkxY3B1?=
 =?utf-8?B?NXFGRG5hSEQrVFJLOUhnakJwejFaWWVxbVNpcVEzZzlTWXFBWFdFY0twYjhI?=
 =?utf-8?B?a2l6THdsL0xPbDNWWXhxeDZtZWtVTExzcTFPeWhIR0o5N3hkZ2tKcVZXNDFO?=
 =?utf-8?B?Qk1LTXB0bkhjSUtTLy8wbS80dUpBPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 16:49:58.7703
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bdf352a4-46f9-4ce1-911e-08de59d64760
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE36.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6336
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,xenproject.org,suse.com,citrix.com];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 8D4F06A511
X-Rspamd-Action: no action

pipeline: https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines/2277124833
(pipeline differs with the CHANGELOG patch being separate. Nothing functional)

As discussed in a prior RFC (https://lore.kernel.org/xen-devel/dc68b9ce-38aa-4949-b3e7-a7c0a7ee9a25@citrix.com/)
this series drops cross-vendor support. It includes the policy check that
was there and adds this on top:

  * Eliminates #UD handler when HVM_FEP is disabled.
  * Removes the cross-vendor checks from MSR handlers.
  * Eliminate Intel-behaviour hacks for SYSENTER on AMD handlers and drop
    intercept for SYSENTER.

Open question unrelated to the series: Does it make sense to conditionalise the
MSR handlers for non intercepted MSRs on HVM_FEP?

Cheers,
Alejandro

Alejandro Vallejo (4):
  x86: Reject CPU policies with vendors other than the host's
  x86/hvm: Disable non-FEP cross-vendor handling in #UD handler
  x86/hvm: Remove cross-vendor checks from MSR handlers.
  x86/svm: Drop emulation of Intel's SYSENTER behaviour

 CHANGELOG.md                             |  4 +++
 xen/arch/x86/hvm/hvm.c                   | 25 +++----------
 xen/arch/x86/hvm/svm/svm.c               | 46 +++++++++++-------------
 xen/arch/x86/hvm/svm/vmcb.c              |  3 ++
 xen/arch/x86/hvm/vmx/vmx.c               |  4 +--
 xen/arch/x86/include/asm/hvm/svm-types.h | 10 ------
 xen/arch/x86/msr.c                       |  6 ++--
 xen/lib/x86/policy.c                     |  3 +-
 8 files changed, 38 insertions(+), 63 deletions(-)


base-commit: 3001d9a19592bb4f12dab33f161ab2148513e30a
-- 
2.43.0


