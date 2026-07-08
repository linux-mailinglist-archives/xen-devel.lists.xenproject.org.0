Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zoIjGU0BTmosBgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 09:50:37 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2D8722D46
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 09:50:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=McadYgRn;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1356647.1611214 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whN2J-0005oZ-KE; Wed, 08 Jul 2026 07:49:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1356647.1611214; Wed, 08 Jul 2026 07:49:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whN2J-0005mQ-HW; Wed, 08 Jul 2026 07:49:39 +0000
Received: by outflank-mailman (input) for mailman id 1356647;
 Wed, 08 Jul 2026 07:49:39 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1whN2I-0005mK-QZ
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 07:49:39 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whN2G-00GXvF-JR
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 09:49:36 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a4e010c-5cb7-0a2a0a5109dd-0a2a4506e7d0-12
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 09:49:36 +0200
Received: from [40.107.208.37]
 (helo=PH0PR06CU001.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a4e010e-08de-0a2a45060019-286bd0257056-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 09:49:35 +0200
Received: from BY3PR03CA0003.namprd03.prod.outlook.com (2603:10b6:a03:39a::8)
 by DM4PR12MB6159.namprd12.prod.outlook.com (2603:10b6:8:a8::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.8; Wed, 8 Jul 2026 07:49:30 +0000
Received: from SJ1PEPF000023CE.namprd02.prod.outlook.com
 (2603:10b6:a03:39a:cafe::87) by BY3PR03CA0003.outlook.office365.com
 (2603:10b6:a03:39a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Wed, 8
 Jul 2026 07:49:29 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023CE.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Wed, 8 Jul 2026 07:49:29 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 8 Jul
 2026 02:49:28 -0500
Received: from APPOL-18KY0J4.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via
 Frontend Transport; Wed, 8 Jul 2026 02:49:27 -0500
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
 b=FDUviwYPwm7RxDd7vImGo3R1njAN3cppE7nof++P95nCmLF34AriEbNS8sINqeC188scrwKrKaA6FcUqk+Hi7+TA7R19otPM7L3Vg5dym9GfIz4OA0diIhSIfMexSeUOTmkQ/UXMpKSgPi27bJC5LEM59CJe5ZcYKv4hK7oWR1YsARwx/Vkb0jkrSjAkD4iwV5HT9G2E1hSyhTlEJdfJKLysylmN62QGmVVsBxWAq5B2y/WHY/7Ff/Omt1Vbg62z70DPF6Po1B72q/POhvZeWXcSGJTQ+Adde+D8Jpwq8c4e2VFvoH7bZz6iNFiVMgQiwCjssLWN3q/ypSZ2sizV1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OR6VlZfptXUjOwDr2aFzCqN6jh9+wY6MDQv0CCeuibY=;
 b=cNoxb2l9SsQN5VcAmtm2Os+jZ3SEe2Pex3WjlWoP2+ZozUjMfDvU2+jiashPtJ0OnayPhhPmunYwL+AoYQLAc5n6b2beypuNb7WAJTNBeDnFmvHtPp0QXkF7INfzFj4GiHzSHLDy199nK718ivRGUUpJUdb1awcpa7eql9h1allfrpf8ft/PecsxR1/NTU6AAgV7uFc5O9B6n+22f0gGfW68aWWFRlKoHL1wkoqT181q2gH2XCg4j65R6DLo3MYz2MlfCgj/Z/MrtcEnRL7kbCeTBvmw20+dcbxZfpLcn9iRA/r4FgE2xJvW5vI0+Z3qmVo9C7KF9tvGbiXvDvuMgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OR6VlZfptXUjOwDr2aFzCqN6jh9+wY6MDQv0CCeuibY=;
 b=McadYgRn1tGtUrdozXMAGVaCXqQBlv5MhBuljkXkh591x/2eljzT6QBsS17EZwN74tEdGM4J6vRodvpARYimKSvXyUdGJ4ZFwIDam9Y21Ovigqo+OsN27/Ic+dQmn08Ntc4FZ9TNU6p69ybbecg4bR7TlsaSHVAtu7hAJOHXg6w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<ayan.kumar.halder@amd.com>
Subject: [for-4.22][PATCH] xen/arm: Fail domain construction if a secondary vCPU cannot be created
Date: Wed, 8 Jul 2026 09:49:19 +0200
Message-ID: <20260708074919.33381-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CE:EE_|DM4PR12MB6159:EE_
X-MS-Office365-Filtering-Correlation-Id: f7655a8c-8e05-41b4-d3eb-08dedcc57122
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|1800799024|36860700016|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	j1eCAPsCB0xEHjbGb9WOSPUHTYBl83Iq5e+ujJa8vMbq7ywuKvIll3cUizj26w10zMWPdlZdmuYGtXLJFqe4eOl2r2GrBc0Uz0V5chW8l33G9aivVSHrGDmhhdMQU2sqNw6ph3xV5EHhTKZGRlfWaEXGdpfAzb0K4zbhRP3zVPntsMfIT6UfCYUvLmW3nPMXDnk8+9haMiDoiGbfSPdBehZxAlXmiHr+Dc6mXd4xXci+DFUSwqhnK42g8ugXEUGHzaqoCrC9LjkEU180uMVqLa2KTIHzvf5oA2JJ0ND6qmkxkMBFjyxy31Sc9sAtbWzr4emi+vj5TMXYw1feoKlN/zIkvxL8m121gcyC9lWrzCoIkkL5XhFigwwFGS3ZnxXiT2ZpFE8iLLM8YJ0Fid2SPuvflfvMSWzpga2+iKgHr8cyAtyzXnuByNm816AZWmRBjxGxRU33uw8EureMsIMotUEa1LLMQS5/soPPezEOo+VDAmMWiLjAOW8WefhoEUYaL7dC3tVzHV0iKc/8mIwmxxpy+2HiGpZsPyzupvyQKRSTpWxbSRiasrAyNdX5NPIIxerpeqanFdfGGdk0w64tZTCVYkZ5+PU7Nqs3Mi2o7g36ENZikylBSSNUAE01gDBeUI5Qd0w5uxLCNFNPU/XyHyCuJEMlTsjkicUYW5aSvKKym+6ZOpeInXgMS2KPlfLvSVTXycTVQmVP7Mkq83phsA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(1800799024)(36860700016)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WYxulBs6MFRxVmsuQXcZHEE2HHTwwLTyOX/ed2Vv4zE75fmzIBJ8D1uOOjgVgy0FqIgUFmTMv78OQb0OUWjhA11mxWWQvHa68rzcC05hYVYivBaaiHdU/wPIzMaQ9zgbdD7VDhyFeNXn5hZSFTUZeD2Ntogwp7SuxJOP2r4VapJ8lFqilmsgWved6rR0X9um88IvDgipsX1g0J1OyhrQg8pawF/41O3AHaeCJ+CS0owh4Zd/xFbZ3tMvVhYMYIf5hozFYovJW+M4/be9+xy+ZTA8MYerlI2ONKYEtUsmoO6pgNGRGHTnxuvCPGm27APDbO8oByGDZDP70QkFuz/Pnb5M+cfB3WYzEU3/K8h+I/E5l/mcI+A56ke/6J+kF7BjMpy3L4gKuCPwO2cU7r0NfTHkQw9/nbxcThG4hsqybD/y3xNSaeoay4SFm5D4csO4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 07:49:29.6697
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7655a8c-8e05-41b4-d3eb-08dedcc57122
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6159
X-purgate-ID: tlsNG-16d1c6/1783496975-4292368D-BC3FEFAD/0/0
X-purgate-type: clean
X-purgate-size: 1546
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:ayan.kumar.halder@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[13];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:from_mime,amd.com:email,amd.com:mid,amd.com:dkim,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: AB2D8722D46

construct_domain() creates the secondary vCPUs in a loop, but on a
vcpu_create() failure it only prints a message and breaks out of the
loop returning success. As a result the domain can be constructed
with fewer vCPUs than d->max_vcpus, leaving NULL holes in d->vcpu[]
below max_vcpus.

When the guest probes the redistributor of a vCPU that was never created,
get_vcpu_from_rdist() only checks vcpu_id against d->max_vcpus and then
dereferences the NULL d->vcpu[vcpu_id], resulting in a data abort.

Return an error instead of breaking out of the loop. Both callers
(construct_domU() and construct_hwdom()) already propagate a negative
return value and fail domain construction, which is the correct
behaviour: a domain that cannot provide the requested number of vCPUs
should not be brought up.

Fixes: 6b0e8e43348a ("xen/arm: allocate secondaries dom0 vcpus")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/domain_build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 550617f152bb..b46574fd32aa 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1847,7 +1847,7 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
         if ( vcpu_create(d, i) == NULL )
         {
             printk("Failed to allocate d%dv%d\n", d->domain_id, i);
-            break;
+            return -EINVAL;
         }
 
         if ( is_64bit_domain(d) )
-- 
2.43.0


