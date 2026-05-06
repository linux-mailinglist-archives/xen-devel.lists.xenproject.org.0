Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +J0rB0DY+mk+TQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 07:57:20 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFF84D6657
	for <lists+xen-devel@lfdr.de>; Wed, 06 May 2026 07:57:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1301154.1575476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKVFK-0006bd-12; Wed, 06 May 2026 05:56:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1301154.1575476; Wed, 06 May 2026 05:56:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wKVFJ-0006YY-P2; Wed, 06 May 2026 05:56:33 +0000
Received: by outflank-mailman (input) for mailman id 1301154;
 Wed, 06 May 2026 05:56:32 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <penny.zheng@amd.com>) id 1wKVFI-0006YG-3b
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 05:56:32 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wKVFG-00GH5N-NE
 for xen-devel@lists.xenproject.org; Wed, 06 May 2026 07:56:30 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <penny.zheng@amd.com>)
 id 69fad80c-bab6-0a2a0a5309dd-0a2a4502cc5c-6
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 07:56:30 +0200
Received: from [40.107.209.16]
 (helo=PH8PR06CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <penny.zheng@amd.com>)
 id 69fad80c-af86-0a2a45020019-286bd110cdfa-3
 for <xen-devel@lists.xenproject.org>; Wed, 06 May 2026 07:56:29 +0200
Received: from SA1PR02CA0010.namprd02.prod.outlook.com (2603:10b6:806:2cf::16)
 by SA5PPFD911547FB.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8e4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Wed, 6 May
 2026 05:56:23 +0000
Received: from SN1PEPF00036F3F.namprd05.prod.outlook.com
 (2603:10b6:806:2cf:cafe::d5) by SA1PR02CA0010.outlook.office365.com
 (2603:10b6:806:2cf::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.15 via Frontend Transport; Wed,
 6 May 2026 05:56:23 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF00036F3F.mail.protection.outlook.com (10.167.248.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Wed, 6 May 2026 05:56:23 +0000
Received: from SHA-L-CHUTZHEN.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 6 May
 2026 00:56:10 -0500
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
 b=gT5sSpRgbJ3+NfaH6JETfRsV7BQRYWKAR2FC2YK2Ap9XXioOmZ+uwGr/MeK+dtQvdiPNdAzkkrbyXhygoyHAEF6MPtS0l4IiHwL4PPTb3AvWf3G4PAd9jb1ywQB1EUaZu1jkDSy/VlLirOQT/DMKCLBkVOd0r+D9jziCN2PeS8EAKe+GEZvIJSTFyNsJCTLoy4uXd4T+axCIJBftAcq9Fmb28KocM4Svxg8TyhjCPx+uV1+HuIo2a+5TWfZc9RytGZw3FQj2UICSRLASTe8igEsUeMWRGupD8v6sm+XJXJOJgV51lzrScnKakYcpG8M7aAfrr4xd63QBrB+kVqhRpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WEGHCDfQ42PqJ5PokzCA75qVSyr4zXg8komsg2bzaf4=;
 b=jUK7tWwGYwpjpcIQXvAtNXJwgr9ie1zb1eZclxxLhEyan2V5dlaTUQQjwr61mCTWGIiA1ng4j/VWVBEfmyGfoFcvKoiVENeWwccm2cw0yoe+5J5LmBDj/I4+7nafAwwT0VLRoXsm0bpypYPKttqMdX4dyTRN4feZsmPbGBwX7dh/jDn8JdvqaFIn3wm0LDSd2WWmcXL9Rhv7a61xxjEN6+yy5jIkCKHohRtwWN6OEsJ+iuV63XuyAxayNxRbwHlXxy6cddz6Nxkmd4pdHuNQhLQHTQbOzf1Ihmiv78L/BUzVhDwXWjvh7qBv1p4GoZn5Sr0kNdFHwplVtslvkN1wVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WEGHCDfQ42PqJ5PokzCA75qVSyr4zXg8komsg2bzaf4=;
 b=swvpuLYRJckBccxYUcZMUMJbqRCtVtN04L9QfAbLqZZDuiJiOBFmnS5Xyv/87OzWBKNYxxUuN3utL4PNmZ6kTRAlwJbs6vYO6EiTHNdUGW2sVj/MIz+1IH3FdBisXqpXpkZ/yg5J2UY2+0a6lV8lDVliYFCjE8C7jtNMBJehDbk=
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
Subject: [PATCH v1 1/2] x86/amd_node: avoid divide-by-zero in amd_smn_init() under Xen dom0
Date: Wed, 6 May 2026 13:55:18 +0800
Message-ID: <20260506055528.476493-2-penny.zheng@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260506055528.476493-1-penny.zheng@amd.com>
References: <20260506055528.476493-1-penny.zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3F:EE_|SA5PPFD911547FB:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b51d57d-91d4-4d7f-2040-08deab343453
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	cy+qAi7I4xJtTYFwg/Xv7Tf5ht5MGr4cHFOe3vAYX6IGgQHjPpYRnQsWan9wkuai6Jj+offQtYO1a1DZ3DFKZOBJ5o/noynfsAfbgt2A4U8d5cTei0ixs27v7xMT+2yojuHuNqM+hGf06B6nIbCwUFZKWiJ/cZI1475bzWKqlCoejTdvRZbL3UpWw6SMh2MVKYA9rtT860nQ0zuwKV2iWxqjasmZXtM/lD3hVrYCyFM1FT3Im9Y9whYUOAeLwWycJHhYp6vQtzZU4GicFEkLe+NI09m+z73+PTru7C9xHVc8XIwEZYMNiI7DXmHTXyhjMpdPF9n8jn7uoQqPM9fqKYinEot94XLBVeHhkpFrxy+lN3qCs7aIKnsX4xwZFWHcHy/oYvJHrrXY8AIspkxkFKCFmn5uOFnjOPKKqblVe6kDqznl65NqqhDHsIyikKOZq4MP4M6EIe8uvqxw0ES8leypt+1rolay4rEIxbTUrJUeHkTZVsJx/qCyadgF3ph7Yl3nfJrwg23rWAlcWq6eTFvBsZu3P3b1UEKk3h8kMglSpJweo+d2thA8o+8Zb2Us8uzl3/faQMGRdim3S4+VSdUYXA1BSoSeDkUWCA9kGO+7qxKwMgcZZEErYgtpMLkjQYCaQFn8avXeon9FTFo1V1bkz6gO6FuWUYNF/6mCeE79ycMdQ/b/p1iqYTlXuk1WeF5TsMx9HsnBbQNy35P6z1y4ywiXQ3wAsNZEKmTwx5Y=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	++9QBZu2qMm3vsjUnSr6e/ceM3c0R7gkHyjkPA3d39jAg4M4Pa7Qsqf233LskQMdMpJ55jhPitso3p9oVCLA3rOg68QI2Z/75Cps89DZL2FwE053LrUHxaQ4OiZZS0Gqv1rgtktWwkjn3uDLEcenMs5Z3jaGjEAQYaB/Qi392OueHGbE0JmpXmLAg4U21UNd/9Y2EKwUR5EHYaBG7fCPGDXFN04TwyoWlGyrZhj7vr1akeJOnni2JY6NqugsvmZNnKCfgomEU0QwTyess8jlgJvD+mWXIIVlhDBpPPMznA8qkIe7xIQ6tJM+MRt7cxHt0MpuC2y4lrAXtpwo74IggP4eyEr33IYWUVry2Gsxmqf2lt36dIIhebhGF6z7HlYbDiNNV+Xo4W+G+HMypvfagZGULW14DH5D+Yeza3FzAB+08/8fbqLqoXC+wStUWgQa
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 05:56:23.7040
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b51d57d-91d4-4d7f-2040-08deab343453
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFD911547FB
X-purgate-ID: tlsNG-720697/1778046989-83961161-0B5678D3/0/0
X-purgate-type: clean
X-purgate-size: 1563
X-Rspamd-Queue-Id: BDFF84D6657
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns]

To prevent each dom0 vCPU from looking like an SMT sibling of another
vCPU, Xen synthesizes guest x2APIC IDs as vcpu_index * 2.
While the spacing every vCPU's APIC ID by 2 can therefore push the IDs
past the package-field boundary, making Linux see more packages than
the platform actually has. amd_num_nodes() inherits that inflated count,
so num_nodes can exceed num_roots (the number of AMD root complexes
discovered on the PCI bus). The subsequent

    roots_per_node = num_roots / num_nodes;
    ... count % roots_per_node ...

then divides by zero in amd_smn_init().

Reject num_roots < num_nodes explicitly and bail out with -ENODEV.

Signed-off-by: Penny Zheng <penny.zheng@amd.com>
---
 arch/x86/kernel/amd_node.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/x86/kernel/amd_node.c b/arch/x86/kernel/amd_node.c
index 0be01725a2a4..c896060fe0df 100644
--- a/arch/x86/kernel/amd_node.c
+++ b/arch/x86/kernel/amd_node.c
@@ -282,6 +282,18 @@ static int __init amd_smn_init(void)
 		return -ENODEV;
 
 	num_nodes = amd_num_nodes();
+
+	/*
+	 * Xen dom0's synthetic APIC IDs may imply more nodes than host
+	 * bridges visible in PCI config space. Bail out to avoid a
+	 * divide-by-zero when later computing roots_per_node.
+	 */
+	if (num_roots < num_nodes) {
+		pr_debug("AMD root count (%u) < node count (%u); skipping SMN init\n",
+			 num_roots, num_nodes);
+		return -ENODEV;
+	}
+
 	amd_roots = kzalloc_objs(*amd_roots, num_nodes);
 	if (!amd_roots)
 		return -ENOMEM;
-- 
2.43.0


