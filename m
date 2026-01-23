Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qArCK7TAc2mjyQAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 19:40:52 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E03AB79B9B
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 19:40:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1212494.1523596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjM57-0001gf-K8; Fri, 23 Jan 2026 18:40:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1212494.1523596; Fri, 23 Jan 2026 18:40:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjM57-0001dj-H9; Fri, 23 Jan 2026 18:40:29 +0000
Received: by outflank-mailman (input) for mailman id 1212494;
 Fri, 23 Jan 2026 18:40:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Su0e=74=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1vjM55-0001dd-SW
 for xen-devel@lists.xenproject.org; Fri, 23 Jan 2026 18:40:28 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id faac6575-f88a-11f0-b15e-2bf370ae4941;
 Fri, 23 Jan 2026 19:40:24 +0100 (CET)
Received: from BY3PR04CA0009.namprd04.prod.outlook.com (2603:10b6:a03:217::14)
 by BN7PPF915F74166.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6d9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 18:40:18 +0000
Received: from CO1PEPF000066E7.namprd05.prod.outlook.com
 (2603:10b6:a03:217:cafe::7a) by BY3PR04CA0009.outlook.office365.com
 (2603:10b6:a03:217::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Fri,
 23 Jan 2026 18:39:57 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000066E7.mail.protection.outlook.com (10.167.249.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 18:40:15 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 23 Jan
 2026 12:40:15 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 Jan
 2026 12:40:15 -0600
Received: from SATLEXMB04.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 23 Jan 2026 10:40:14 -0800
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
X-Inumbo-ID: faac6575-f88a-11f0-b15e-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DU6EB6HeWP7XqGZOaivqghcL4mcHR36ybMthxOvqTuxBNry4DuJhQkVrnBFJIBjkFM1jcFDS9p+ZP+OOlBxOInC3CzCpZQGLNTGrl766x86jqPy44jcp63wmpazCsHFTg6jf2Hp2sxzKft47zderASbUGapz96pEA0kNIenn9nlPSGNN3c+x4X0VKRl7ForBlOy7npzA8mo7L4TPRlD04JxLJaumGqHWW+c2pIh0BUyVdbJCFaJO1clHLkuRXKaLDJoqkNjkupNYrrtTIlsy4L5AGI/hQP/9ZOiL5RH730FWheuwFhVfkJw9Gqp6grI5Azs4lx/stRBSAA2GxBlzcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Zn1BH99uusiRfW0GGp2REfCR6pwTNQ4LVM1LBPTGp8=;
 b=SMSNWD/RK/JSA5/sjBW+O1cZJsN17R6i0f0lD9rxL+zsZLvreuMZRCyM9U/AL2R/4b430ZL6LJdnrfp5rSViVESbrjQ7K0lXw7RuIgBk4DacpC7nFe8s0Jz09L/kwkJ7SyuasKpXA2b+LXYKOydkXLs5jsFIUrZraeoiQcqnPAsu9rQWJoUseb1rBjXuQZFIX1rrQUrHqTGRAwRA30el1Cep0cPEHdJoyIlzcZfjousyRkIB4xr1RlhnDLkvNWVrBOdt88rhsRYRDUAe/7JjLQuhwWWXjUTe8VLwMQMOLejvieJwwiZJFKAFTcDrDwJ2HZY34IaF+cKYeGXIErTgtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Zn1BH99uusiRfW0GGp2REfCR6pwTNQ4LVM1LBPTGp8=;
 b=J2hlSOqIl3qSUyd+6J6TljNFao6fTqvohScuFdsIeEtCSjCwJEG19ugu/xBhV5ErgUDZNBehluUjgh4XHV+2vw0RpUdwRGmZFZXWHq+C6Cq3cxJRIRPLr7bJOoKM930PJPVsFjuitsTojt+Xuk/+l4tmbqfkRn6/RckKJuky9ic=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <jgross@suse.com>, <v9fs@lists.linux.dev>, Eric Van Hensbergen
	<ericvh@kernel.org>, Latchesar Ionkov <lucho@ionkov.net>, Dominique Martinet
	<asmadeus@codewreck.org>, Christian Schoenebeck <linux_oss@crudebyte.com>,
	<sstabellini@kernel.org>, Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH] 9p/xen: protect xen_9pfs_front_free against concurrent calls
Date: Fri, 23 Jan 2026 10:40:09 -0800
Message-ID: <20260123184009.1298536-1-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E7:EE_|BN7PPF915F74166:EE_
X-MS-Office365-Filtering-Correlation-Id: f9084faa-dadf-4f10-4223-08de5aaed9d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ztUw7kZYq+/lOjU78pewF8Ti+/GmhdAQCT+Y3shKDyza9tIfZmekNriNPvD4?=
 =?us-ascii?Q?pGIrKMWQezq6g5N1F8t5eq7eS15zONN7A7WsdHwmYZp8p1pcMBM9O2vNxtQ8?=
 =?us-ascii?Q?nU1qNRWwpQHsvlehOSm5Mgj89XYBDwTfTsXrwCiGqw4mHFROY+cbOp1+5CWm?=
 =?us-ascii?Q?E1t2PolShmZoV7KdzGoiiTpKzRFcXl5BH+h6Ch9XUgXpWlQb1//NGVGgq0ZK?=
 =?us-ascii?Q?jDTt/ZTLKq6vUChxo/twEgo7Z/hsw6yVuNYTJ/Uy+dNK1PZ65aXaO5ZZcLjw?=
 =?us-ascii?Q?K3w+mWn6rmSrXL49ZGytWiusPT8dtyYu5+roqvGSje6DBHTZPwWanViple/z?=
 =?us-ascii?Q?aM2C0+iN7ahSglGKPYfcF3CNNO8wUTj4fKlfNKbrJTBGf2STcQrAYwqx68FN?=
 =?us-ascii?Q?fhNeVLx2ZKxvUX8HMBbAMszMf26uhi9onRhq39cd7Jnr43sByNEsL886FPL5?=
 =?us-ascii?Q?zSaY+MrhSOMdQEPVjdm6S8xEE0Rh+DSZxGUHOw1noG/XbhzBJBEvamLVuY9Q?=
 =?us-ascii?Q?JdqAJe5tOpnaX8TSCYxxy6yL1hFIH1jTiArPRKt+81ytEQRBnmXC6IxzKBL6?=
 =?us-ascii?Q?yOGQMC9TrSasYelvsCqETS2JYfSXiBOogOpLOb2q4mPGAptn7Sj910MXk1u0?=
 =?us-ascii?Q?ONH92Kj/cAwiRcxcMFvlC/uhDDMieZ+wKV/2LxFPIp5xyOSZ62U6a0FxbVIN?=
 =?us-ascii?Q?DBaqjCsADp0gCLuJGrfOdSFis7j+m/sm9lYsoeD4Uxg4lsuadrSCNssNF8sM?=
 =?us-ascii?Q?Q0qo3El0YSyMmKO5V5JX1kdYKEt0c0kWTuDhLEmBI7FwzoG5MXd5AvEkbhtW?=
 =?us-ascii?Q?BaVUZKpd4JchGy5JguXXRAD4+Qwa7BZeJHh3mhtsLxtjyVzJ0HsSyc2ikdLn?=
 =?us-ascii?Q?pEmCIf/0JOl5MO6immT2mPYwS6o6HLow3NqxwnJXL/mukwozm0xCnI4CvyB6?=
 =?us-ascii?Q?tTztJUeW8qN2Q4RkhzHH1HdU9BV9V+VEtr5cXcjUt+nppdJ2wmna6X5xB5VT?=
 =?us-ascii?Q?0i/AB724amWLYHCFGbGBn54z0BilQwq/2u+NKN7xo+sYHRChKn58LNZbUg37?=
 =?us-ascii?Q?iLzfrJ4vDLvRmGKXqvtwsmAosynVMC2ig+dhumV9dG0Hf7JfxOUv0tO1+e1F?=
 =?us-ascii?Q?eKNxOn1kP7CXwcRauRqbJiFcqP1P0+GvvsIIGoS5TbqrDUmaIXRjIzNuw+FM?=
 =?us-ascii?Q?bpbuSGtX2JViOfMeru2l6kIBYsVFGL+kJAaIND4D9SY1f2YAFDvdbyFBpoNa?=
 =?us-ascii?Q?n9gWvzjf91l1TEFInZTqnK6LmXzRmcWRTgwR+6ArP1xvO87jtvSGnuzIkB8j?=
 =?us-ascii?Q?S2Koin28HdA/M/qKeZxJFppE8BvjXUchGEnI3he07Cxs7+BqGj9wRhNo0sB0?=
 =?us-ascii?Q?TZHWKUSR3ZV/uW20gWcLOQ+v/8PjX/mZNn6ZAIIQrKRrJQS0Vwv5nCDusvcC?=
 =?us-ascii?Q?H87zG7tcpS6G5jKcK+W3tXsX2/OI3pghG0nhF0bLIKjNN6mbk9ptbsMPJMn4?=
 =?us-ascii?Q?lAUhYQuXZvOn+16Y04FcsDMgTqbEVNfLlSiXsmMplRslMM6bBu8FrfYe84t4?=
 =?us-ascii?Q?z9I6Gp0jPTjnZqxfq9o9jIaVlQacpaIXCsn/7JhGffjuTyHs2aQ5el9spdSm?=
 =?us-ascii?Q?xTV994EpuMz85krGGAd14svjcrqUFmXlh0pIfg+Qqx91J40SjJxTibaxHI6Y?=
 =?us-ascii?Q?dJppJg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 18:40:15.7961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9084faa-dadf-4f10-4223-08de5aaed9d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066E7.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF915F74166
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jgross@suse.com,m:v9fs@lists.linux.dev,m:ericvh@kernel.org,m:lucho@ionkov.net,m:asmadeus@codewreck.org,m:linux_oss@crudebyte.com,m:sstabellini@kernel.org,m:stefano.stabellini@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[stefano.stabellini@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stefano.stabellini@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.840];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid]
X-Rspamd-Queue-Id: E03AB79B9B
X-Rspamd-Action: no action

The xenwatch thread can race with other back-end change notifications
and call xen_9pfs_front_free() twice, hitting the observed general
protection fault due to a double-free. Guard the teardown path so only
one caller can release the front-end state at a time, preventing the
crash.

This is a fix for the following double-free:

[   27.052347] Oops: general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b6b: 0000 [#1] SMP DEBUG_PAGEALLOC NOPTI
[   27.052357] CPU: 0 UID: 0 PID: 32 Comm: xenwatch Not tainted 6.18.0-02087-g51ab33fc0a8b-dirty #60 PREEMPT(none)
[   27.052363] RIP: e030:xen_9pfs_front_free+0x1d/0x150
[   27.052368] Code: 90 90 90 90 90 90 90 90 90 90 90 90 90 41 55 41 54 55 48 89 fd 48 c7 c7 48 d0 92 85 53 e8 cb cb 05 00 48 8b 45 08 48 8b 55 00 <48> 3b 28 0f 85 f9 28 35 fe 48 3b 6a 08 0f 85 ef 28 35 fe 48 89 42
[   27.052377] RSP: e02b:ffffc9004016fdd0 EFLAGS: 00010246
[   27.052381] RAX: 6b6b6b6b6b6b6b6b RBX: ffff88800d66e400 RCX: 0000000000000000
[   27.052385] RDX: 6b6b6b6b6b6b6b6b RSI: 0000000000000000 RDI: 0000000000000000
[   27.052389] RBP: ffff88800a887040 R08: 0000000000000000 R09: 0000000000000000
[   27.052393] R10: 0000000000000000 R11: 0000000000000000 R12: ffff888009e46b68
[   27.052397] R13: 0000000000000200 R14: 0000000000000000 R15: ffff88800a887040
[   27.052404] FS:  0000000000000000(0000) GS:ffff88808ca57000(0000) knlGS:0000000000000000
[   27.052408] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[   27.052412] CR2: 00007f9714004360 CR3: 0000000004834000 CR4: 0000000000050660
[   27.052418] Call Trace:
[   27.052420]  <TASK>
[   27.052422]  xen_9pfs_front_changed+0x5d5/0x720
[   27.052426]  ? xenbus_otherend_changed+0x72/0x140
[   27.052430]  ? __pfx_xenwatch_thread+0x10/0x10
[   27.052434]  xenwatch_thread+0x94/0x1c0
[   27.052438]  ? __pfx_autoremove_wake_function+0x10/0x10
[   27.052442]  kthread+0xf8/0x240
[   27.052445]  ? __pfx_kthread+0x10/0x10
[   27.052449]  ? __pfx_kthread+0x10/0x10
[   27.052452]  ret_from_fork+0x16b/0x1a0
[   27.052456]  ? __pfx_kthread+0x10/0x10
[   27.052459]  ret_from_fork_asm+0x1a/0x30
[   27.052463]  </TASK>
[   27.052465] Modules linked in:
[   27.052471] ---[ end trace 0000000000000000 ]---

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 net/9p/trans_xen.c | 41 +++++++++++++++++++++--------------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/net/9p/trans_xen.c b/net/9p/trans_xen.c
index 280f686f60fbb..8809f3c06ec95 100644
--- a/net/9p/trans_xen.c
+++ b/net/9p/trans_xen.c
@@ -274,11 +274,7 @@ static void xen_9pfs_front_free(struct xen_9pfs_front_priv *priv)
 {
 	int i, j;
 
-	write_lock(&xen_9pfs_lock);
-	list_del(&priv->list);
-	write_unlock(&xen_9pfs_lock);
-
-	for (i = 0; i < XEN_9PFS_NUM_RINGS; i++) {
+	for (i = 0; priv->rings != NULL && i < XEN_9PFS_NUM_RINGS; i++) {
 		struct xen_9pfs_dataring *ring = &priv->rings[i];
 
 		cancel_work_sync(&ring->work);
@@ -310,9 +306,18 @@ static void xen_9pfs_front_free(struct xen_9pfs_front_priv *priv)
 
 static void xen_9pfs_front_remove(struct xenbus_device *dev)
 {
-	struct xen_9pfs_front_priv *priv = dev_get_drvdata(&dev->dev);
+	struct xen_9pfs_front_priv *priv;
 
+	write_lock(&xen_9pfs_lock);
+	priv = dev_get_drvdata(&dev->dev);
+	if (priv == NULL) {
+		write_unlock(&xen_9pfs_lock);
+		return;
+	}
 	dev_set_drvdata(&dev->dev, NULL);
+	list_del_init(&priv->list);
+	write_unlock(&xen_9pfs_lock);
+
 	xen_9pfs_front_free(priv);
 }
 
@@ -387,7 +392,7 @@ static int xen_9pfs_front_init(struct xenbus_device *dev)
 {
 	int ret, i;
 	struct xenbus_transaction xbt;
-	struct xen_9pfs_front_priv *priv = dev_get_drvdata(&dev->dev);
+	struct xen_9pfs_front_priv *priv;
 	char *versions, *v;
 	unsigned int max_rings, max_ring_order, len = 0;
 
@@ -415,6 +420,10 @@ static int xen_9pfs_front_init(struct xenbus_device *dev)
 	if (p9_xen_trans.maxsize > XEN_FLEX_RING_SIZE(max_ring_order))
 		p9_xen_trans.maxsize = XEN_FLEX_RING_SIZE(max_ring_order) / 2;
 
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	priv->dev = dev;
 	priv->rings = kcalloc(XEN_9PFS_NUM_RINGS, sizeof(*priv->rings),
 			      GFP_KERNEL);
 	if (!priv->rings) {
@@ -473,6 +482,11 @@ static int xen_9pfs_front_init(struct xenbus_device *dev)
 		goto error;
 	}
 
+	write_lock(&xen_9pfs_lock);
+	dev_set_drvdata(&dev->dev, priv);
+	list_add_tail(&priv->list, &xen_9pfs_devs);
+	write_unlock(&xen_9pfs_lock);
+
 	xenbus_switch_state(dev, XenbusStateInitialised);
 	return 0;
 
@@ -487,19 +501,6 @@ static int xen_9pfs_front_init(struct xenbus_device *dev)
 static int xen_9pfs_front_probe(struct xenbus_device *dev,
 				const struct xenbus_device_id *id)
 {
-	struct xen_9pfs_front_priv *priv = NULL;
-
-	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
-
-	priv->dev = dev;
-	dev_set_drvdata(&dev->dev, priv);
-
-	write_lock(&xen_9pfs_lock);
-	list_add_tail(&priv->list, &xen_9pfs_devs);
-	write_unlock(&xen_9pfs_lock);
-
 	return 0;
 }
 
-- 
2.25.1


