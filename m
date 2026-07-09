Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DFxWH8dBT2oEdAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 08:37:59 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F3372D3D9
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 08:37:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=EyV0Px6l;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1357546.1611925 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whiNW-0004HO-S3; Thu, 09 Jul 2026 06:36:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357546.1611925; Thu, 09 Jul 2026 06:36:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whiNW-0004FM-PU; Thu, 09 Jul 2026 06:36:58 +0000
Received: by outflank-mailman (input) for mailman id 1357546;
 Thu, 09 Jul 2026 06:36:57 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1whiNU-0004FG-Jc
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 06:36:56 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whiNT-001z7i-DP
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 08:36:55 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a4f4175-5cb7-0a2a0a5109dd-0a2a45098b32-38
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 08:36:54 +0200
Received: from [40.93.198.44]
 (helo=CY7PR03CU001.outbound.protection.outlook.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a4f4185-97e6-0a2a45090019-285dc62c2322-4
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 08:36:54 +0200
Received: from MW4PR03CA0122.namprd03.prod.outlook.com (2603:10b6:303:8c::7)
 by SJ0PR12MB8165.namprd12.prod.outlook.com (2603:10b6:a03:4e4::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 9 Jul
 2026 06:36:48 +0000
Received: from MWH0EPF000C6187.namprd02.prod.outlook.com
 (2603:10b6:303:8c:cafe::37) by MW4PR03CA0122.outlook.office365.com
 (2603:10b6:303:8c::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.11 via Frontend Transport; Thu, 9
 Jul 2026 06:36:48 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6187.mail.protection.outlook.com (10.167.249.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 06:36:48 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 01:36:48 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 01:36:47 -0500
Received: from APPOL-18KY0J4.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via
 Frontend Transport; Thu, 9 Jul 2026 01:36:46 -0500
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
 b=Z7opmmPBM6q3apAlse3NxuqMuCHd82Z+qNIWB/nMO3a/43mCpBUdUAFC3k8x3GNATV7nBG9E8rtsBo2KcZriwqCHl4lotZmSdMLtA8Z4Ld5YbeNfM3H7qMZXN23aVOIev0TU3y6ZLtoykzKEsDE3XmVKENlPrEJ0thpm1Tx5eLFFc9bKfea1vfUQzOaD8za8z/MAFWqcawoa+giXQBnbsno0HYKZLY8DT0wpiGew7HezJwfNavS4Cyb1k5xLDx4mCXoGA5gfbXQvxVAOAly/eqO/v8ot6o9Ql3DwGSkwsiJCzivUF9IVsouFgL2nkN/whw+MEVlOhJQjakAPyluPSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zhdxdf5zL6a+U1/hrk4aLT3C9PkcV0JvLE8J6lvzQu4=;
 b=GWfhkpVl0/G1lfJxS1Vr7ENsKxYDa2ke6tOl97R3yeO6wd1n20zdITnZljJshO3hjVOADTw78r/LmksqkUAnQszrjJryH8IF9hUvTQAAdJmTIiJvkSMBnzJyNO77n/RcvnzA1CpEPtovv1o3n5nhPQ9qeQD+ixkp9YyYUT1pFU8uR2xp+lwikoihREG9ln6Zf6X6PPdtiPIZCxbMvWFFQ1VB0l39ckyKCpnsXpaIraYpyWV+36AYwcQCJWCn+0Ddj3ZiuSS7nJwQWnEfRzdquXKjlMGIdhloBiVhoS/26NY4pdpNIOeX1nHbDzVnJ+J1a+d2O5r9NWlmj6l9QHiJxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zhdxdf5zL6a+U1/hrk4aLT3C9PkcV0JvLE8J6lvzQu4=;
 b=EyV0Px6li/SL6TTXVRg1cAeQ6p/FCXOeRzTyK2GmhF31fjq8HHxk1Z4hrUBaHfJ0KLVMrUNIbIShLxiBG5Dv2/XKxn/R2IqeXxn174GhfEZQRpThZdPdDOnB1iXXXy4/dDIUTHT/eJwRJu25gBOftHCPpE/KcZN02gJKvuypejU=
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
	<ayan.kumar.halder@amd.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [for-4.22][PATCH v2] xen/arm: Fail domain construction if a secondary vCPU cannot be created
Date: Thu, 9 Jul 2026 08:36:43 +0200
Message-ID: <20260709063643.11800-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6187:EE_|SJ0PR12MB8165:EE_
X-MS-Office365-Filtering-Correlation-Id: eebeb375-50d5-4286-abc7-08dedd847401
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|36860700016|82310400026|11063799006|18002099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	Lejpg5EQeEKzwUTs10xfYy9+aRaZnmXzJ0L00rYroZYzPhK2yWPoaO879GE/S1fmkrgzducL/79WIMZgRfaVH0vM8hm7dYzMy6ph4frwGo5clJ2SA+v9ssr4m0p6A+MFeAAxV3XvVwLwPJ9NEnX2G53/ICbxVGyRoTfmUfEa4FOBgjgZX0ZO/rdT2xD1OpNVweHYHI3AY1nn19W9U+IiYe1U5RygYJCnfqOOo/78mscuzNoCuevXYHpVDtSn9IvF4fu+6BgRjocmtjn2jrUh5j6zFxag+Qr2Dy+pmOKmCgLZF7DMtMNqCFafw/PFCPXRZ53PljwCoY4LzDCQc8INyFxYYRRNYMa4JzPHx77QFRVGwL23ZB2rIOfCqu2SyuqSEcOu61xs/NNyG2UwjYCcTEOPycQkj6T+Q9WMFuyylby8faYOdBuN3XE//urWoTcfKDiu6VF8aXrRk81c1OPlQ2XQyTkgsLLxcDEMLL039EiQF/0u+MuxP5nWm6nqmQ4PjQrUIAc5RAROtvTcu2bargO/LXUEIeTInfxDeaFB4EvBgSxt0ZwpXRPaOi6mVA5/Tjl+eICBLaAyN+yCcXO84gtj414G/nilmVFrCo1mIjR1d5/dEdJEmQSl6ySSJUMA4ZH3uj23eNd0sjvin8Xze/jvNqBSCUUg0cRm68mN8H8+JTsOzwAqrbeGO0jGHo8eJSl/Ez3pxd73QRI57099Hw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(11063799006)(18002099003)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	6QOxPq44SFPm2mf57tbxuu66EFV0Qtxjhq4yx3U2Kw6i1BhBbpifEH+i034ai1WeKKzIu0EPiZKxg3tps58BMZpUtmYw62DTy9p2J6OrKWF11rEV+jD/dvCi3M/+K5pDuQzHHNyqdNkttaYvuAhq1c1eVHhFSdv6VRE7tKNVrZyGYCIojjUdmetJv+NsOosLzRg2Wgj7qvQ6AZ0d+hF+t3ZufptBHwgABzwlxtyI5zusc/AVTfPEI8g/6US2SaTJB9OVdgqTnroIJ1JBqKL+F/vZwdnr20IOkOPkHf2oZqHzqBKWlQDgam/OhM/mr/vuOb00MvtwyHKWBMbqOETYV1nIE3UFqYJFDwbttvXHyB9QrhnIH8eUMrpcwwJPDlaT7dAXn5bOInFwvXKP+NsLUub+SPJIAcRLXG/OhsCE0cokrJI5MjCaRstLs7Of1mYX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 06:36:48.4075
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eebeb375-50d5-4286-abc7-08dedd847401
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6187.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8165
X-purgate-ID: tlsNG-bad1c0/1783579014-577AD986-EFA176D1/0/0
X-purgate-type: clean
X-purgate-size: 1728
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[amd.com,kernel.org,xen.org,arm.com,epam.com,gmail.com];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:michal.orzel@amd.com,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:ayan.kumar.halder@amd.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:from_mime,amd.com:email,amd.com:mid,amd.com:dkim,lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C7F3372D3D9

construct_domain() creates the secondary vCPUs in a loop, but on a
vcpu_create() failure it only prints a message and breaks out of the
loop returning success. As a result the domain can be partially
constructed with fewer vCPUs than d->max_vcpus. This causes two contract
violations:
 - Xen-Guest: domain's FDT is generated before vCPU creation - Xen exposes
   incorrect information (e.g. two vCPUs listed in a device tree while only
   one is actually created),
 - User-Xen: unlike x86, on Arm port we try to bail out as soon as
   possible on unsatisfied user requests (e.g. user requested two vCPUs
   for a domain but it was created with only one).

Return an error instead of breaking out of the loop. Both callers
(construct_domU() and construct_hwdom()) already propagate a negative
return value and fail domain construction.

Fixes: 6b0e8e43348a ("xen/arm: allocate secondaries dom0 vcpus")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
 - return ENOMEM as allocation failure is most frequent cause of failure
 - update commit msg to focus on unmet contracts
---
 xen/arch/arm/domain_build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 550617f152bb..72d531618045 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1847,7 +1847,7 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
         if ( vcpu_create(d, i) == NULL )
         {
             printk("Failed to allocate d%dv%d\n", d->domain_id, i);
-            break;
+            return -ENOMEM;
         }
 
         if ( is_64bit_domain(d) )
-- 
2.43.0


