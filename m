Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Xg57MpoOImr3RwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 01:47:38 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D903643FEA
	for <lists+xen-devel@lfdr.de>; Fri, 05 Jun 2026 01:47:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=3di9JRgm;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1328743.1593059 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVHm3-0001DZ-8r; Thu, 04 Jun 2026 23:46:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1328743.1593059; Thu, 04 Jun 2026 23:46:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wVHm3-0001Bu-5V; Thu, 04 Jun 2026 23:46:55 +0000
Received: by outflank-mailman (input) for mailman id 1328743;
 Thu, 04 Jun 2026 23:46:53 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Jason.Andryuk@amd.com>) id 1wVHm1-0001Bo-I2
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2026 23:46:53 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wVHm0-00Biis-GZ
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2026 01:46:52 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a220e1f-5cb7-0a2a0a5109dd-0a2a4504cb40-28
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 01:46:51 +0200
Received: from [52.101.62.26]
 (helo=DM5PR21CU001.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Jason.Andryuk@amd.com>)
 id 6a220e6a-1dec-0a2a45040019-34653e1a393b-3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Jun 2026 01:46:51 +0200
Received: from MN0PR05CA0017.namprd05.prod.outlook.com (2603:10b6:208:52c::21)
 by DM4PR12MB5819.namprd12.prod.outlook.com (2603:10b6:8:63::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Thu, 4 Jun 2026
 23:46:43 +0000
Received: from BL6PEPF00020E60.namprd04.prod.outlook.com
 (2603:10b6:208:52c:cafe::1e) by MN0PR05CA0017.outlook.office365.com
 (2603:10b6:208:52c::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.8 via Frontend Transport; Thu, 4
 Jun 2026 23:46:43 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF00020E60.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Thu, 4 Jun 2026 23:46:43 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 4 Jun
 2026 18:46:43 -0500
Received: from fedora.mshome.net (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 4 Jun 2026 18:46:42 -0500
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b6JQg1YUgLSWV/9UsBg9gTuGQO0kg45Jj9+e37RXAbYF1vSTmT85D3bH4J8g6EeGymD98kF8EKwAb1MQzAdMAKKgU7Qj9Ru2VaeXakG3VAf8CI+u6BWRh0cvHWkCH4pCMM/uQPviOM2Bfs3kSyo2bbAsVaPeM/HYXk3U+/t5LEGAEi2r0dcgVVEusO0ddMBLysPE/vqeFd4cOHiQCiSWZuUZSsJmLlhimR850kLosiTLjsmgHzDTPJLp3np/JNj50ss8+0xA32tbE74qbqRnCF3+wraOkRnirUBY47ezrKgl9MUxcl/GVcq20/sQNkqYcjeuSiCMddVE3fZqfN5QiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZwCksKfILv1JCX2VIL7HBGHWudnziVFXLEMwV2cvdo4=;
 b=Dw1uakKTDqrRijGnhU7KxcvAM2QwqnRpN5nwUSI3Ch5pLdvXXTb8V90tLCWrqEclYPBgTpqAiPeGgEYC1qrnpG9qX114GFC8v8v6J6Dr7BDq3qgdOEqGPaPjWoxww//PV07Ml9t4sGv8dfbwaYdREnFWvfuDKDEZTmpAcs/k+0EPmqhDspsJn0TpqHE3Ws6C9hJPtmg3mMSqSugeAGfoFdx65o3uB5fvPvK5wIaiTRgx9EVAHAP/0lb9clknVQ4CQAzeh7VegjZrkerhd+es8Dp+xgX/pomYVhnPxoXoThuqfemVl0/HzCT1H54ncopwmPSP5byr7kYCe1+CgV6PKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZwCksKfILv1JCX2VIL7HBGHWudnziVFXLEMwV2cvdo4=;
 b=3di9JRgmoR4euCnMNIWqkOrXi1Fld1FqgRBu3cMkiwTgS+6ZsXmVjGgTdrl3sZHpNF0BuFQ/N/qCeFObi8Nmt+6jvuEtKfr/Pgk/Q/mV9CgaCc4NfgNHcOUpGGrixqFFejcuYZqC5FozTmWzo4d/UA10xGrAF4ftzPxqg9UT1cA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Teddy Astie
	<teddy.astie@vates.tech>
Subject: [PATCH v2 0/3] xen/x86: Change stub page freeing to fix smt=0
Date: Thu, 4 Jun 2026 19:18:34 -0400
Message-ID: <20260604231837.804560-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E60:EE_|DM4PR12MB5819:EE_
X-MS-Office365-Filtering-Correlation-Id: 2383ccb5-1c39-43c7-7065-08dec2938846
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	GwjszNfZLqlEz0PxIWpyoHHPhxYC7tFRqEnfjz/Wbru+Yq/7UKlOTumGVjZeo24zQ5tQqRn22ejZJdc6l6glwHFSDlwc/hbnwBL38aSkhtbPkpWK+H587o2grmzNhRyg+Exj+PjOED5zoI9UEq459NVsrKCxbJX4iAmPS6ostuiUsDwroGuuM67rC0Hu/YWRIgcIuOXqdZp/OgwdChaIQnt0bpYc/31zqqwfqOTYCHtptSKpMCyXU/+PWGIzqhn5RzyN+qpbASyowA1/bnKmIYkRH8Wofrkvb6bUaHtxqUrfjcCiXDrwlFZyRmBU+FZQf5CFxWD/QwTeFa3Sx5xQdKXd1cIMUnEp5A8RVXmAfDT90b3tGTNGEn2FT2G9H4TGtD3Orx3NT8tSCw2L6eUM7X6HseOQGaVV71cE7zhCJyU2pT1YRogIZniO6YXePOl+4yubB/zvmexy6B3xstS2/zP0MJnyXQwKb/3gSPOkv3eFrO4LSpJ4K4jnnlDjQIQWwgknOd7lnRZ0iAW3Bjsev2NhbCEWdXOy2rNAXsrd2GsNci4F1gYehl1VRI+38QeeiJAn8uw9Sk209iYxolEkYjBC1wwGjoFiXW8yt7wPNmaTVcCumTe9TYdygzXK0Ef4eyrLVkUyuIK2kyYE3sWcB10SVPN5FP2ZJUZb7UFaejf59FKUD93hDTOB17GbC1iiwffZ6BdXj5lkkL30Doe1zj2TI1U8E/qPnJ0/teX04S8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(56012099006)(18002099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dKlyG4vMytzekext18+S5oTy2RJcx48T8G1XqlPkDm2kqeiA3/cp7ePuPYcT3vkzjOynMOq/BZ8U3x5ywgVOjHsUiO3f0CHw27Rpk6jqghKgLTBpc4FItIWLy48ynRa6908JEVfeZEwR0v1W8p1F7Jv0lS6qDh7K+DdgmQn7j/j0nlqC/Vgzj/CZwniJb9tZrlFpwjb4oGrMcJhwa8MqCjwPcdOmqQFI4ashiogUUbGVfDCItgfO/ctFzinNBOCZaOjxTKskW+/gjbLPFzUyIPZCt+BjF4O9G5I12W/RsFnmDxbM7sIq6+2rm6MT4Eo9b62Z07G8QpOz9JGpTe7jYoWKHYPeUpR05+VhjNDnu99NrEK+iAjySQ6nTjDEwBXBnqzaFaVBZ8cDlcH+ktZKs8azXPObIq5xjeHoYKWNQZzwRBgFqEcro6AuGMalvFRA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 23:46:43.5039
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2383ccb5-1c39-43c7-7065-08dec2938846
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E60.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5819
X-purgate-ID: tlsNG-ebf023/1780616811-43F6D3FF-FFAABADA/0/0
X-purgate-type: clean
X-purgate-size: 520
X-Rspamd-Action: no action
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
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:jason.andryuk@amd.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1D903643FEA

This is a different approach to fixing the stub page handling that is
broken with !CONFIG_PV and smt=0.

Jason Andryuk (3):
  xen/x86: Remove unneeded stub_page setting
  xen/x86: Split out page_walk_mfn() helper
  xen/x86: Change stub page allocation/free logic

 xen/arch/x86/include/asm/mm.h |  1 +
 xen/arch/x86/smpboot.c        | 32 ++++++++++++++++++++------------
 xen/arch/x86/x86_64/mm.c      | 31 +++++++++++++++++++++----------
 3 files changed, 42 insertions(+), 22 deletions(-)

-- 
2.54.0


