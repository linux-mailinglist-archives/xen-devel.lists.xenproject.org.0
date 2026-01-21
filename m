Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEuyOSfjcGkhawAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 15:31:03 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF2E58733
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jan 2026 15:31:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1209827.1521741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viZDu-0007Gs-Lp; Wed, 21 Jan 2026 14:30:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1209827.1521741; Wed, 21 Jan 2026 14:30:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1viZDu-0007Br-I5; Wed, 21 Jan 2026 14:30:18 +0000
Received: by outflank-mailman (input) for mailman id 1209827;
 Wed, 21 Jan 2026 14:30:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D6Gw=72=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1viZDs-0006vP-GG
 for xen-devel@lists.xenproject.org; Wed, 21 Jan 2026 14:30:16 +0000
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazlp170120002.outbound.protection.outlook.com
 [2a01:111:f403:c001::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b21b3698-f6d5-11f0-9ccf-f158ae23cfc8;
 Wed, 21 Jan 2026 15:30:12 +0100 (CET)
Received: from MN2PR07CA0021.namprd07.prod.outlook.com (2603:10b6:208:1a0::31)
 by MN0PR12MB5979.namprd12.prod.outlook.com (2603:10b6:208:37e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 14:30:04 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:208:1a0:cafe::94) by MN2PR07CA0021.outlook.office365.com
 (2603:10b6:208:1a0::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 14:29:57 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 14:29:57 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 21 Jan
 2026 08:29:55 -0600
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
X-Inumbo-ID: b21b3698-f6d5-11f0-9ccf-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KRn0zPRCiuvYDH//aXD7NbQwPl6LlXpN5nxnXBG4Ja1cdEi8vy4E5qRGVh1Oce+bFssjRv+aU/eGUvyFj/EyYjqpmRpD1qfP9+ytMsUXJmhhhCAiPoac2sswCfnS8z1Z50HLsD/g+CCH6ElgvQ+aLtAV3Scg/i3EuZPfCBBLXEC8SRjumeqki6GjDMmqcMXmzbC5Ac5i9Ke+eUNE414ArNj3UfZ8Nj2hQ87GKfVJhZJXBF329R5CqF8Lao5ZZc19PBTPOls5y74qpsTI36HsjcYKI3UGqdVqK7fvWNLB9WINoH7dEX2x8eVbH2wss6pDhXlfOqeTFXCOLD47xjIRhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NB/bRU2K+Hx6Vf9hp6DVAPKBk1y2bdwkPR9p0WpfVXk=;
 b=I9UnAmd6UhBii4U2XueoQuU8q+dGMOon3Zyufpntn1rfsgmUO1SsQNJYNYkEWZuzq48oW9oMyLwzV8JREdtxEfObPbs9F1+MUUxQj+nTD62UPHv4jWRU3M8/KnxEv0BBBF/9aKKYYiYLaRvFJqKBNN9/OM8dmpywIeQcOVLIylw9rOPWgC9EZU3QFLmsm2ofkWxAYlgYlMZtgiWjSnUgwlwCaemLjhV2DBLK2MpwBnbyhut7gVaKsbKJvZ5Ob5bjNOpBi7dos9gMDrRdp+wxhG9yIrDX2OQIAJup98fvesAW9hsBdGA698wtyLKnFMOxE6YYiomOkbfvX+9z1GH8qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NB/bRU2K+Hx6Vf9hp6DVAPKBk1y2bdwkPR9p0WpfVXk=;
 b=IGOoULY+XQcjVXRraQii5WcZWmoNHnCX2s1BLRZTfIgDBMjKBijETMjbdzCS5lYImsit2Adts1u6To3n2zBvQ0LmcIhjq43LxPvjvuSq5FmT21rNzv4wnDkIIbzjslU9qxTWxDze0+obR1Fz2J1IloF4uq3u0mVQUUt7aBgaA2E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>
Subject: [PATCH v2 0/3] x86/svm: Add support for Bus Lock Threshold
Date: Wed, 21 Jan 2026 15:28:52 +0100
Message-ID: <20260121142857.39069-1-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|MN0PR12MB5979:EE_
X-MS-Office365-Filtering-Correlation-Id: d98dbdab-82df-4681-d1ed-08de58f98d87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kmx0z1wsPEtHoI3LtvIq4vGHjMMf7QRXvaGb4hzC2kNDM4KPKjUM3aCsha6R?=
 =?us-ascii?Q?izMCh5kfhaU8zx9Gi6AEkyit427nt4Boa6+lGQAv2FyABeREaQDzL7Dako57?=
 =?us-ascii?Q?Zh9xk5ftk3xA7jmH8+2FgJtBnstYTRiJK794KMZMjJ/yhDYKlmDD26JnXNpw?=
 =?us-ascii?Q?TzO9QxEbwsu/iDwtf7NX/LNMH++jztRq2OflGGWOc86dl22Fd0C0RmK3dVrU?=
 =?us-ascii?Q?iAKw0sxAk+zNvlH3jezbPnOhrcl5aZVT912m2QoDsO7DKVd8tcD+WmYQix9W?=
 =?us-ascii?Q?TFds8wtMZpsNMyGuXoOaKJBXkavYS/VDk9FD+qhajk+KfEgGBG2F82xC/tFP?=
 =?us-ascii?Q?xkM5MCa/0efBaFxQlVMldpGA45X9tM5Rx2MCVZ9UI3gyjG3ijcIGS48Gjdfg?=
 =?us-ascii?Q?RC7y0pPEsjnY1EEx4EAI2TQjyGPz3lQMbbXgfr1RaycTGjXD9EkJ61Mh/GQi?=
 =?us-ascii?Q?i6RMNrwFd3tjsMv1PSXWd760IjFpR8g6OCk6l6g0QuQzcDaiPnimlFxfxlLb?=
 =?us-ascii?Q?X/KAg7O4UWRKo49mCaVyzPa92tTJXb+hW+zKEtCTK+8Tfdf283Q+VumYd485?=
 =?us-ascii?Q?fFpf+r280Dd3OP6b+KQAasERuKyAmwarbm5LVc7/2ExNYNFbp2FqJmdspxAN?=
 =?us-ascii?Q?tgt15rxOgoQyQ7VgpoqYX5AvEfRT83OVIlN0QheMPKuX/s0vzfwS8xmOnoCc?=
 =?us-ascii?Q?GhpXBatlUC2PdT1KUw4YchjruojmO754S9ZRfUtFlUYksxlYU/ORZRftDpvd?=
 =?us-ascii?Q?yNLIoFxBO5y1s0uo3BWZJ9Z+t7hJdoU0iXF5LgkENFMGF9XIAw/36NT7Jois?=
 =?us-ascii?Q?BKiuud0L6ySuzF+gXzJD+1WjgMRs30MEVlOn9PZgggSD6WeX9RV1/LQdXeNM?=
 =?us-ascii?Q?hq8ou5hbHV71iGzkCNLqt+6PUWXegvPZvueF8bkW3GHyyNkzKvYcscdYlnDv?=
 =?us-ascii?Q?x086qRChN6vmUAQ7IIL1ZMMrtqyQPrgLXIZ4v+hh4FokoFYYq4UTEm4hK0a7?=
 =?us-ascii?Q?gAu35uE5eAGi881ZPA3ATqH9y8YOkkMwefx1gEj/5DSx3x80TOKY1ZSa35kx?=
 =?us-ascii?Q?L+vpyj024nWAqX6A39CmBR3hss4A+28y0MdVB/mzw3Fda+p3qiSy9WSEbLte?=
 =?us-ascii?Q?9Sb1E0H4RofbMKoa/iCGqhEZggZq3WqQUWnDJ1sh9EoLreI1EMqN9HLwL+ZV?=
 =?us-ascii?Q?lvV1CfzcxEyflrwfsNzLSM78sIxDQmqu6SjuymLU/Ah3eypa/IUpwJmz15To?=
 =?us-ascii?Q?78dJm4hNpsAG8hTrfyX5fVYke7jK+GP83JfuI2q0NTFcwz7Sy8lY0KKjS11Y?=
 =?us-ascii?Q?QKUHkSSd6do5/hgfbhiU1Auqt+dPpmt9qaR7o5Vx6orEyfzwaKNm++LUCXBq?=
 =?us-ascii?Q?/qwfscz6P6p7Vj637WB7K9PQb12oAW7yQsR0OuDYkoYwGH+mabWjrk+w3oZA?=
 =?us-ascii?Q?HfBg42W+At+iAjgXbiaG7+mBAco4/loASB4Hb3RTkw2KO21Gr90/YPD/hZ7O?=
 =?us-ascii?Q?XWJWQptw3xMMFUcgQWmNFHsKyuiVvySPre0b2/0+5J6txYFoZeYdy6tmVr4S?=
 =?us-ascii?Q?qU/m17g9ZamS7eIeiB5Hng/FoA3xw8WoL+0DmerV+jak1ICQZTedXsh+hXzF?=
 =?us-ascii?Q?T2crfL1V7q52IOEqv/K//4AiL+ORS2MaPIJY0YzRKloZMj0RIPCSeJKsHgr/?=
 =?us-ascii?Q?DjZwog=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 14:29:57.7348
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d98dbdab-82df-4681-d1ed-08de58f98d87
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5979
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:alejandro.garciavallejo@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:jason.andryuk@amd.com,m:oleksii.kurochko@gmail.com,m:community.manager@xenproject.org,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amd.com,suse.com,citrix.com,gmail.com,xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[changelog.md:url,lists.xenproject.org:rdns,lists.xenproject.org:helo];
	FROM_NEQ_ENVFROM(0.00)[alejandro.garciavallejo@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 1BF2E58733
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

v1: https://lore.kernel.org/xen-devel/20260120095353.2778-1-alejandro.garciavallejo@amd.com
pipeline (in progress):
    https://gitlab.com/xen-project/people/agvallejo/xen/-/pipelines/2276726870

Original cover letter:

Bus Locks are very costly and a VM left unchecked spamming instructions that
lock the memory bus (e.g: unaligned atomic CAS) makes system perf take a
nosedive. This patch is similar to BLD of VMX, but for SVM. It configures all
VMRUNs so they automatically exit at the first encounter of a buslock event,
effectively rate-limiting them.

Cheers,
Alejandro

Alejandro Vallejo (3):
  x86/svm: Add infrastructure for Bus Lock Threshold
  x86/svm: Intercept Bus Locks for HVM guests
  CHANGELOG: Note the new SVM bus-lock intercept

 CHANGELOG.md                          |  3 +++
 xen/arch/x86/hvm/svm/svm.c            |  6 ++++++
 xen/arch/x86/hvm/svm/vmcb.c           |  3 +++
 xen/arch/x86/hvm/svm/vmcb.h           | 15 +++++++++++++--
 xen/arch/x86/include/asm/hvm/svm.h    |  2 ++
 xen/arch/x86/include/asm/perfc_defn.h |  2 +-
 6 files changed, 28 insertions(+), 3 deletions(-)


base-commit: 61204ed24ba4537d6eff56594faa5d23cacb8310
-- 
2.43.0


