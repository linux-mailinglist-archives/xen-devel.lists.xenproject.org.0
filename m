Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D3AA93E12
	for <lists+xen-devel@lfdr.de>; Fri, 18 Apr 2025 21:00:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.959322.1351719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5qva-000179-4b; Fri, 18 Apr 2025 18:59:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 959322.1351719; Fri, 18 Apr 2025 18:59:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5qva-00014z-1X; Fri, 18 Apr 2025 18:59:06 +0000
Received: by outflank-mailman (input) for mailman id 959322;
 Fri, 18 Apr 2025 18:59:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gHr6=XE=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1u5qvY-00014S-Mc
 for xen-devel@lists.xenproject.org; Fri, 18 Apr 2025 18:59:04 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20631.outbound.protection.outlook.com
 [2a01:111:f403:200a::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31330881-1c87-11f0-9eb0-5ba50f476ded;
 Fri, 18 Apr 2025 20:59:03 +0200 (CEST)
Received: from BL1PR13CA0025.namprd13.prod.outlook.com (2603:10b6:208:256::30)
 by CH2PR12MB4232.namprd12.prod.outlook.com (2603:10b6:610:a4::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Fri, 18 Apr
 2025 18:58:59 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:208:256:cafe::d9) by BL1PR13CA0025.outlook.office365.com
 (2603:10b6:208:256::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.22 via Frontend Transport; Fri,
 18 Apr 2025 18:58:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8678.4 via Frontend Transport; Fri, 18 Apr 2025 18:58:57 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Apr
 2025 13:58:55 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 18 Apr
 2025 13:58:55 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 18 Apr 2025 13:58:54 -0500
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
X-Inumbo-ID: 31330881-1c87-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iQhtwhdmDS5CR6bx98OS9ihZWmVNjchTDGQ0LBIFZGccXUmF3tlb9dLzmASTOZe0W7tMPc9ijo/so62o6GhMoNZLlLJ0gN3VsyNJFz0c/YCtbnpMU83zze5+8BBq8kqX8/PbvG9dqrDqE0BUm56iaz7vUwkkyYvuDtXzwqsuuUdNWNqqhum8VVBk06GC4j586YVI/4aIi99+Z7et1hxncqu/jyZjmBYG3qaLgahGJSGJ7/4DDPQU2VMI6ZAvSdwb4Vb6t+JkCdZfdeFAH8pI3e0tgTNrDE5PLdODOJHcXZV7OBp4V+LfEMCLaFWaPOf0i78G7ct7AknNJ1axHLjomg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URMOqZG5s1vx2KMq+fNibyCW/yJcHW76mKqaaJIzs+U=;
 b=yaEuTQz5YkIuS1OyuOmpfQ3Rf74TYoN5jxdx5oz5Q4vcXCEHdlXgSPEmIHO7qB2gx8xLVCLONYj9I/dRdu3Nudnuzuhp4GtEHEdzhTgeWGCS21AwX180TplS0kl8nPOxbCliZxViRjZSLYLs4bGmIiaCXKcrVfhDwYd/8yxj6x8hEfkjd5HIagSXE7effT0/ZcON2kPCZTE8OdFKNgjfFqw0FuHDUiFv38Gg68/nIdDaD55wx79nNfvSyUF7j18Y70N+ByF50Ou4ZubdkanT8GNrMalFH42/zjUYIeekKTPRN5+5is+BgD+izfagNsc3Y+UTemtRwTJjsEV4WE/9+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=amd.com; dmarc=temperror action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=URMOqZG5s1vx2KMq+fNibyCW/yJcHW76mKqaaJIzs+U=;
 b=J6341tr6cW4vZxviMuu7za/vbGUOP7TUl7Gk3SYY41+YC2DTenATyjTQvByi8blLi81VuEMMALgdttwn5a4BPQ82E1CDPmO3sW91R7kUyCq0S9JFMqNKrC8IdPDdf+KZRIA52KZU4Fe8+WGGqwSmIMR238jXYOwkawf3DO3YZy4=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v20 1/2] xen/arm: check read handler behavior
Date: Fri, 18 Apr 2025 14:58:36 -0400
Message-ID: <20250418185840.335816-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250418185840.335816-1-stewart.hildebrand@amd.com>
References: <20250418185840.335816-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|CH2PR12MB4232:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a45411a-4aae-483c-c9cb-08dd7eab12ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QzJ0Vlo4Z0RqVGptUFVONkZZU3JDWDNqZTVRMGRlVkNhNE41WHIxNDhNb3I3?=
 =?utf-8?B?dU1QR01EZGNoNjZmbDFHMzNpYVNDRWFsUm9SYmE4M25JZHQvQ3BiYTBZOVAx?=
 =?utf-8?B?ZVZrUDlBTXd3RGxlcWd2SHdjcWp5ZzlkWk0xTWxRNlM3d0I4SWRaV1B3aUZs?=
 =?utf-8?B?Z3VHRzlsVzFpU1JtNXZzZGg0QW1Cd1g5bjVEa0k4Y1BCanhpNkRGdjBwa29m?=
 =?utf-8?B?d0Vjc2ljb3ZTVjI0MC9ZVVpBZmtMYkxJZFU5WFBSVVNTTFRhZTZZc0pTTXk4?=
 =?utf-8?B?bHUvSks2RXZycWpuakVVM0hsUjNoUTRiU3k0bi8vT0huMnFWcDZqYmdBeW51?=
 =?utf-8?B?dXNSQU1yMEt6UEJ0aEVXNFZ1SUljSTQveFlzbXM1enBESnFJc3BiR0JxUFox?=
 =?utf-8?B?ZXhzSFAxWjlVdk96Ry9XdDdFM09vd1FZZUlIYmZNM0tHL2tXaDRkUzV2RWk2?=
 =?utf-8?B?ZndZSWFqMFkrU25TeXFsLzhKZk9TcmZ5MUxYblY1djJyRHRuUzR6eHBSNjlQ?=
 =?utf-8?B?V3Q4K1BzbUFBeEFDSzRuZUtvY3ZSaUM2V21PclZUSnJmTEZQR0p2YzZxMW1R?=
 =?utf-8?B?Tm5WU2dnR0RFbHIxRnNFZk12K3FZaVYzb095aGwzNmh2ZkcvMitRV0ptd0ho?=
 =?utf-8?B?Sm1HMFpocmxPSTRKN2pFeXJMRU9ldjFQdUlHb1VJTzRpZkVRSHpOQjlIOFhq?=
 =?utf-8?B?TzNtSG1DK2o0UVdMVk94cEpvS0YrOWJrZlBLZEZwTDRWZE1zbkRVcWsrbXRV?=
 =?utf-8?B?aWIzcW14ZUpUZTlrL0Rvdmhzc2RxenF3dis3aGkyR003RTBYeFFPTG5DUGRv?=
 =?utf-8?B?TGpiUS9oMndjM2gwbFVWVS81MklkMTRxOTJydU1pRFVtZHM5Nmd6NExSeDYx?=
 =?utf-8?B?dGhZNGtnS1ltR0x2ZE9HV1VXWU0vZ3hhU29XZFdIbkFENzZqc01kei9XVkMy?=
 =?utf-8?B?Q0hLb3lTVnFnZE1yNmZLdTRLVm1sb3lMaUVmWUtiVmJZbFNsY3l5UWV6Q2NK?=
 =?utf-8?B?dnlYQ0toN3g4M2NGdkdPNGV4OVRJdUJiSExGUUhzTy9GOFVBN1FKdlZwOWhO?=
 =?utf-8?B?aE94WC9GT2ZiVjhRNjNUWDluVGxkNUQ4d0x3NG9NTEZWaTNzUjlsRTlHdnNv?=
 =?utf-8?B?YXVIRWo2VHZmSHk5SDY4WHZUUnk4TVY1OTd5ZHAxb1FKQnMwcENtQ05iWWI3?=
 =?utf-8?B?OERJUThiNjVGS2RDRWVFeU12YllZcnBmaC92L1lTYThPNHM5c0FFR2VUemcw?=
 =?utf-8?B?cE5zSVhwNlc4SGpLOVp5U1pwY0YzQ3JkU1FORzkwUnNWVk00SmRlY0tOUlhQ?=
 =?utf-8?B?R1ZDNi8zSlJaSm0veXBiNWliOFl4VFJNRmVURHJCMUpjK3hkdHpvMWtaY2tn?=
 =?utf-8?B?NkNFOCsraGtRMFlZSVF0YmpydXFqOWV0TUFIRHNyYUxUU0FuN28zUFdqN05i?=
 =?utf-8?B?QTh3ek1lTTZ1WTNDR045RUltRnlBWlBOWTh1QlNQcUhIdnpRL0tkY0xBL0VI?=
 =?utf-8?B?V2liTDNiY2ZFSjUxOGhpMTh0MGQyS3lZQm1xZUNGaEowaDNhUVhVUmY1Qmdk?=
 =?utf-8?B?OEpJcFlGcmp1bTFkTXlQY05EV0htcjZWR3hsa0FMWnJjYTBGcDhQVzlWa1lS?=
 =?utf-8?B?RkRpRDF1MmJMcWZXcGR5dmc2eDhBUFJIMG1DYnFzbzhhS3o3cHMzMGdSM1U4?=
 =?utf-8?B?TUZyNmIwOXFZazZJWDB1d0hCcld4clg5YWxIRldKNzdwbFBvaHpLYy9lSmpS?=
 =?utf-8?B?clFwcU9iYVBxTTA4emNEbDF4MDJoNUJEWlVFU3JpSEtzMEZRZnJqSXkvenZj?=
 =?utf-8?B?UG5KR3Z6VEk2ZjUyKzFNRG4rR29haVhvM1lVM2F2ZUplWmg0Ui9CdnA0WHpx?=
 =?utf-8?B?cEtTNDk3UGVBSjByK25taVp0Z0plb3hKck9lQWdTemk5U2FWNSs5N1M3ZzlI?=
 =?utf-8?B?eW15VVBrSzBxTHFnSUJxZi9VVUFjOTJnZi9WdFliaGlWZk0xWEZiTThnZi85?=
 =?utf-8?Q?MEYRmiigaMoLl6A5sf2aDUpIdIUAXM=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 18:58:57.8078
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a45411a-4aae-483c-c9cb-08dd7eab12ec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4232

We expect mmio read handlers to leave the bits above the access size
zeroed. Add an ASSERT to check this aspect of read handler behavior.

Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
There's no need to wait for the rest of the series to commit this patch.

v19->v20:
* no change

v18->v19:
* add Julien's A-b
* s/GENMASK_ULL/GENMASK/

v17->v18:
* no change

v16->v17:
* new patch

See https://lore.kernel.org/xen-devel/bc6660ef-59f1-4514-9792-067d987e3fbc@xen.org/

Also see 7db7bd0f319f ("arm/vpci: honor access size when returning an error")

Also see xen/arch/arm/ioreq.c:handle_ioserv()
---
 xen/arch/arm/io.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index 653428e16c1f..5a4b0e8f25c6 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -37,6 +37,8 @@ static enum io_state handle_read(const struct mmio_handler *handler,
     if ( !handler->ops->read(v, info, &r, handler->priv) )
         return IO_ABORT;
 
+    ASSERT((r & ~GENMASK((1U << info->dabt.size) * 8 - 1, 0)) == 0);
+
     r = sign_extend(dabt, r);
 
     set_user_reg(regs, dabt.reg, r);
-- 
2.49.0


