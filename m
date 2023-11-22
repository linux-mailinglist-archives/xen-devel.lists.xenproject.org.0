Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 822977F4940
	for <lists+xen-devel@lfdr.de>; Wed, 22 Nov 2023 15:46:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.638812.995738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5oUY-0007Cr-4Y; Wed, 22 Nov 2023 14:46:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 638812.995738; Wed, 22 Nov 2023 14:46:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5oUY-0007BE-0R; Wed, 22 Nov 2023 14:46:14 +0000
Received: by outflank-mailman (input) for mailman id 638812;
 Wed, 22 Nov 2023 14:46:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SF1Q=HD=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1r5oUW-0007B8-Gv
 for xen-devel@lists.xenproject.org; Wed, 22 Nov 2023 14:46:12 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2060e.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dfd8be97-8945-11ee-98e1-6d05b1d4d9a1;
 Wed, 22 Nov 2023 15:46:10 +0100 (CET)
Received: from DS7PR03CA0150.namprd03.prod.outlook.com (2603:10b6:5:3b4::35)
 by CYYPR12MB8870.namprd12.prod.outlook.com (2603:10b6:930:bb::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19; Wed, 22 Nov
 2023 14:46:07 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:5:3b4:cafe::e2) by DS7PR03CA0150.outlook.office365.com
 (2603:10b6:5:3b4::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.19 via Frontend
 Transport; Wed, 22 Nov 2023 14:46:07 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.210) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Wed, 22 Nov 2023 14:46:06 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 22 Nov
 2023 08:46:05 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 22 Nov 2023 08:46:05 -0600
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
X-Inumbo-ID: dfd8be97-8945-11ee-98e1-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l/pkeZeaA4v7mLHqRSpuBrpYRr3dEIpUhb+RXVFGR+fIdQxVThkruuiknL+VAbf7s2ewFR8wz2RR10i9ha0kIGJV6+qqPHfyq8ah3ARduO88IYDjlyqCQpVbVyUGd0nYeZQe/o2JpTscH8uCpjBs/FtrrTUENOcPM60Absg3/Q4vxbfynUbWD4JXEcLaxEUV8kriLzPZWVD48rCC1lQfCA6sWdNy05mfE+WonuaYEfhFhcSv0SFB/ZF+nxS1SADnTAvc4bAnmLCvxTzHNv6poFPUC/kvrH0aVWdaJBbPcXLzQREfHtnPhly0sULbLfJOW7UZ19j2u2bdad0iQt8Liw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ND3kpUc/XG/zhQFrLsJ9EU9dpoeoL3DZZammnY73ba4=;
 b=Y0vNBGJ87vn+nY1T1P7pX8Gtyg08DULamDjgf4S7vRP6KPuLz2TVSuCLLBf8wt1Z478u4qtj+OxQsFRZXRhfaXa1smPIkJgmgljpS0ffQsnFlzRus3NhhgdMPKumuBVPIXi1PTD5tWDnH8CZj45wsEakGQ0MKUtF9a8FZamLP4dscj4P4zypm1M1qhJ/xt7OrSlgmzr/NpPDFCVMjHXdUNf2zaT6pkvU38Vg5ba8WlaCGsVaqOqTa6OzSjs/95KERSeP5jDa9tnx9DDvnB85vgK6VXELntDcI2/3xjSXmAm8+Dahu6BcalqQGa1SkM7CfiwaUJRgbYwh7ZGmHM46Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ND3kpUc/XG/zhQFrLsJ9EU9dpoeoL3DZZammnY73ba4=;
 b=fuw3oJa7y9yCx+72q3nXeoVOIKvk/Gq2RH0eOwX88hxve6pSheY1sqShp3xP0SH+AK+mnfvvu64Xw/T/gEz6SbTzCqGfDnFVrCx7yX/4uELWLc0rSzvNM58Kx6u1YDejbt2RDyCWZd5BA4W0uX9raPgD7FusTVDhYWMrLsLjzuw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: gicv3: clean up GICD_CTRL write
Date: Wed, 22 Nov 2023 09:46:00 -0500
Message-ID: <20231122144602.2282417-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|CYYPR12MB8870:EE_
X-MS-Office365-Filtering-Correlation-Id: a8e4ea03-3a0f-464a-4311-08dbeb69c256
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9GS7gF1bq3MwNqWzudu7ubjwxp+aaJKyj4VClxpTwk4rnWIYFrRpnw4B0sYP8PJLeffCCfTsIdc15hT3OHuNizJus2vIj04085ddaMI7u1l0JzNS7LN0BttwVmycFjTDMsTsjLbZsLfFtAHrlMD/45BT4keuHA/xRBwGp+AhP/4vKud//2WNe5b0h0nhhbefLRrcbsglqo8+eIg4h7ICnqersSJ/n7VaWy4oZ+A/jzRVmaYuel5LZ6oNiOjplJQ7Nwb+z0+nmDmTFUH3Ziaf4sQ51tYNWvl/lAkqjawJAD/ZAASuV6PhuYAAO9TzLvGbrbpE/mzOXkQAu8VXEhWZnLFcSgMb/9HisNKeMBa1hiLxgh1NNbv4MfZPh586ZoUGmf7wpLcuc+4l6nhgN7kf6wIwQrmMZnYbQxbPFiTmqCGihPYK4GOngWo3+Mmn0So8fKyApN3DCUE7eXZ1yh9TKQECUS9gCHaXMvyMlWblsggWPzz5YLB/3FlArge6bNhEJT2W1mj7yzTV2mZd/uePycFsms75svjPjAFAV7tDyYK3Uo4oBcPmQIThtaARnGj4di97c56qC3jRpHrvorS1/aXsBd5+24Q26SjKHZgeF4lySJp3YulA2/XFgG2HNmcbhIFzI2EU8LnzFhzVOgCYuZe0uD54n3Mkt0T3H4KmCZKksBfhLaMFRup2MmLO2gQTlir74o6j76vA8Cj6+h473ZINQJJZ3a/kVOu85OMgj5gYPcLgDs+bkNQ3Q6HJDuHVaCfMXz5eQ8oKe/cn/SmOiQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(136003)(346002)(396003)(230922051799003)(186009)(64100799003)(82310400011)(1800799012)(451199024)(46966006)(40470700004)(36840700001)(40480700001)(2616005)(26005)(1076003)(83380400001)(82740400003)(356005)(81166007)(40460700003)(36756003)(86362001)(5660300002)(44832011)(2906002)(4744005)(6666004)(47076005)(426003)(36860700001)(54906003)(6916009)(4326008)(8676002)(316002)(478600001)(336012)(41300700001)(70586007)(8936002)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2023 14:46:06.6490
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a8e4ea03-3a0f-464a-4311-08dbeb69c256
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8870

GICD_CTL_ENABLE is a GICv2 bit. Remove it. The definitions of
GICD_CTL_ENABLE and GICD_CTLR_ENABLE_G1 are identical, so the value
written is unchanged.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
 xen/arch/arm/gic-v3.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 172ff8c005ff..9b35a8c8a735 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -633,8 +633,8 @@ static void __init gicv3_dist_init(void)
     gicv3_dist_wait_for_rwp();
 
     /* Turn on the distributor */
-    writel_relaxed(GICD_CTL_ENABLE | GICD_CTLR_ARE_NS |
-                GICD_CTLR_ENABLE_G1A | GICD_CTLR_ENABLE_G1, GICD + GICD_CTLR);
+    writel_relaxed(GICD_CTLR_ARE_NS | GICD_CTLR_ENABLE_G1A |
+                   GICD_CTLR_ENABLE_G1, GICD + GICD_CTLR);
 
     /* Route all global IRQs to this CPU */
     affinity = gicv3_mpidr_to_affinity(smp_processor_id());

base-commit: c22fe7213c9b1f99cbc64c33e391afa223f9cd08
-- 
2.43.0


