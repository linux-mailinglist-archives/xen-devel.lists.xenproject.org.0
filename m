Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2402AD21D96
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jan 2026 01:27:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1203960.1518871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgBD3-0005GA-KC; Thu, 15 Jan 2026 00:27:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1203960.1518871; Thu, 15 Jan 2026 00:27:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vgBD3-0005DX-HW; Thu, 15 Jan 2026 00:27:33 +0000
Received: by outflank-mailman (input) for mailman id 1203960;
 Thu, 15 Jan 2026 00:27:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YAhB=7U=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1vgBD1-0005DR-QO
 for xen-devel@lists.xenproject.org; Thu, 15 Jan 2026 00:27:31 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f87d75d2-f1a8-11f0-9ccf-f158ae23cfc8;
 Thu, 15 Jan 2026 01:27:28 +0100 (CET)
Received: from SJ0PR05CA0048.namprd05.prod.outlook.com (2603:10b6:a03:33f::23)
 by SN7PR12MB6910.namprd12.prod.outlook.com (2603:10b6:806:262::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 00:27:23 +0000
Received: from SJ1PEPF000023CE.namprd02.prod.outlook.com
 (2603:10b6:a03:33f:cafe::65) by SJ0PR05CA0048.outlook.office365.com
 (2603:10b6:a03:33f::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.2 via Frontend Transport; Thu,
 15 Jan 2026 00:26:57 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023CE.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 15 Jan 2026 00:27:21 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 14 Jan
 2026 18:27:21 -0600
Received: from xsjvictlira01-ubuntu-0.tail79467d.ts.net (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 14 Jan 2026 16:27:21 -0800
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
X-Inumbo-ID: f87d75d2-f1a8-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jdGanimCwDJYNPrc/WRiKLXwosKB/b3JH2PGkBKXpOt6YCCYD59RawV85Zc3RyWEkUwU7EYE+z02jPk9h7zkLyNhC8Q8oEnGZ9blM09u1AyVKdW+Sm971Mejv71IP0vJNu5+mFSRtf25eVehgZ4xAbNT/mkjA7PEjOvdU/QmC9p5b4uI3X7UUpvts2+ix9I6cKULOj0yvYogp5i9WcMvXnFTtBaegGK2sKXJwcJ6v2Zg+Whw2zCEw21zND8UAVNwd2vo6zYbD6V1+G/6iCrFb9QRM4KzXm6zZo3avKLBtmVAnxLpYVKTpH4/akIsutTeDCjT/pIKYoZzQFBl0m09Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZ5n/e7VN4IhVHwvH03BwDAA+krGDXIA0x/6VQiU8ZU=;
 b=KxcqPyiicKooUL0K8C/bZ65C6o+Has7EsXFsHaRTiyTUTgJk2fzDasSejrBo7YbMhllC64a0I0/PRvHrsoY8VyXPspQbCLmGIfHeOjziWWWrAE+k6DzvimW9mUzsBXwQR61PxE7GbMJiXdLBMmnvMujw8AoklmbsB9UdRwIKNoN/PneGAP8Iu897DcSCdLHNJ1UimP0whukp1+fxeag+5mEwOuw6Kw3R9OnlqNGd30GgZf/3hQ0CmxPgKOsxLjvI8z1xxgQdLsvtYt1Fhn+n6y595JZSzquGUD9uGb9bQ1rpb9AYNhJiWj44EFXhyvQb3rVl67w3YQt0nAD+HqRiLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZ5n/e7VN4IhVHwvH03BwDAA+krGDXIA0x/6VQiU8ZU=;
 b=zSf67CZAe+RxVkidBt4QNwE7BpRnt3sg5VCO7R2j3907mBdjFQED+mgUWdPdsoKrN6UmQvd/W4hAoxDan4VYxORv1snY6bzHPNwHwqgWq/eXkw7tRHGKO3rlAFB3sF3RtR5jxmLhw1UyH3MLxNRTMh8pZPvvui78QX+rIRPFWs0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Victor Lira <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Alejandro Vallejo <Alejandro.GarciaVallejo@amd.com>
Subject: [XEN PATCH v1 0/1] x86/vlapic: match broadcasts for logical destination mode
Date: Wed, 14 Jan 2026 23:55:47 +0000
Message-ID: <20260114235548.626696-1-victorm.lira@amd.com>
X-Mailer: git-send-email 2.51.GIT
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CE:EE_|SN7PR12MB6910:EE_
X-MS-Office365-Filtering-Correlation-Id: d048247d-8d86-4b50-836b-08de53ccd978
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5JozR4eUCoPkhcfMpWLoWgfnKVyiCD8kvaKqxPC4sGfsJTgwFGJG8H21lh27?=
 =?us-ascii?Q?xFkuk1B0KMXV3uLGreYjd8UFnYShx2Pnxeknk8n1U1UphBAOnvXjjVT6k53M?=
 =?us-ascii?Q?lC6qxbcwVG2v3vQZaL2DnbBVEjpQooGO2hpCyuA2C8rN9JtBWdO68mb19b9/?=
 =?us-ascii?Q?QTo7YWIfSayA2eqI6mlk7ktHqXp9Uja5nmKWIjpiz7UFYIjQkNRRel3IZofN?=
 =?us-ascii?Q?AbJH4+yenw9E+amoVIZ175WSbkZNn5a5JnkAFxFGIn1KMw6ZP/POmW7OTBAI?=
 =?us-ascii?Q?vUL/ePdOVL3D9UTi8Ka8V/I6UN0EfVJVG7idtQ7drYvrNH5xMh6H4v7rWGz8?=
 =?us-ascii?Q?zxoMAW3mzdZGhUMfre0WAalCZZicd7D7izY8BX3F1F6u8cvJSMUQjrke/WHM?=
 =?us-ascii?Q?WFGLGS8N7gaZyn7pkyA+qVJ/D4Zt/TWliapcbaFMDWcfvoT9xk+bDzhTgtE5?=
 =?us-ascii?Q?LPiziUh2pnT5M1/ekFZXN4y3aY0st2hhqlItON52RswvMgOldVvJY04BeAy/?=
 =?us-ascii?Q?SSpW3eEGoLNcZ8a1l7STUX5dZazUML0aiLpLCwvE5VJREdkcIM1BPZKBnHH1?=
 =?us-ascii?Q?j4aKIbfag130z2WaIZohBCNKPRdTdle1/aNyfNRi0/FbNiqxDeF54m2KGymn?=
 =?us-ascii?Q?DRRaRXsQ9wK5MQCcXyhn+JbOUBEzaCcmkcIQkMOSRL57AUxQwdD+neRQLHfQ?=
 =?us-ascii?Q?9BinsCDeOyupIxA0gJJJDKc2U5VvSHx965y86ns3LHm5Gac8I3fIV/cNZx9D?=
 =?us-ascii?Q?6s0uM70oJs95HejYv/HUy5TzDMCPJgj/eMzKKw90EgmRLLw+7cSa5rzYs6k0?=
 =?us-ascii?Q?ivt2D14qWguoQt8pmCdTI0jtMxU3ADndlXIzrtyvL8sWEL0RRJHhsI5mDAim?=
 =?us-ascii?Q?kIxL6VFMIq0p4ubzqXTBA/X+nFW0DzEAOfQBCi6x2MYh6P22a4VcJWS/lTXv?=
 =?us-ascii?Q?X6aP9JN5dDmq6t6r1CipuPmdUgTLjxikU1SUurAzsL/clb3cl0lySYwLFNpk?=
 =?us-ascii?Q?0lsVjBkU57WBfODHOIquJ2kebtxcL4if6fGTNgXOex30Qya5ASxwU5ZnAGHH?=
 =?us-ascii?Q?PIpZzW3FOVuk/9/l4xd1TBpOc4TEp/zgkNnJrnybkkdu+R+Bv0mVR4mBXDn+?=
 =?us-ascii?Q?tSCPDqJGjbi9oLKT1yEFOX8Gce+FhWQOUxjL1605b0Nj/+cdmOeqFdd1TrEN?=
 =?us-ascii?Q?meV0lzSHwol22QfZkGAVJgUKWY9aFojyphOKfUX9yh3U2rC/FG/yiv7LCM1u?=
 =?us-ascii?Q?YITNX6lXMyHf2DmXhlS9fdkiWMlW0QaH7VHv73c0ZA1K3bbBMi4UmwNw9h3a?=
 =?us-ascii?Q?dmr9VJ53p9XT8JDtS2WTFaaBlpMsOsPRw+3YUNiYXBO4R+hPDJpRajU0mpzk?=
 =?us-ascii?Q?9S0e/30kdLXjiXb+rPGNmywAsk2vg6Qs0jOrR+MgEl2/FJ/OT4I9Ke96XaRf?=
 =?us-ascii?Q?EY3o1D9EFga+yZ9QL9vg5IXEpzdQKEqLAXidim31RvOh5PPL0NjdZZOqByHy?=
 =?us-ascii?Q?J8Rzn3HiyaC6XQf0DmPXNiwmNx4EobkcYPv4kjT+DPeKJFH2dW7hVlByovJV?=
 =?us-ascii?Q?1H5xVHA1WcsjqJYlZFOz+SEbzpUwKlVIsIf8MrB21Ay7H6nnC2vSe3i+s4hO?=
 =?us-ascii?Q?lrycTHdCxjxkYNh1WFyLKMIeUI0+nEqOxsEhwzNEqraJyFuaywvZk9u8NQ9E?=
 =?us-ascii?Q?Vf4WOg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 00:27:21.8810
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d048247d-8d86-4b50-836b-08de53ccd978
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6910

Hello,

I came across something that is out of spec behavior in the domain APIC.
Sent IPI's with broadcast destination are broadcast for physical mode but not
for logical mode.

Please give it a check because in 7429bfd50dd7 it seems that it was intentional
to crash the domain if the command was lowest priority + logical + broadcast
dest but it got removed.

relevant commits:
  e03ad58f0b8c
  8a02f12b7751
  7429bfd50dd7

Victor Lira (1):
  x86/vlapic: match broadcasts for logical destination mode

 xen/arch/x86/hvm/vlapic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--
2.51.GIT

