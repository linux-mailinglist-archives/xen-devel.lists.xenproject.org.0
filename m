Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B05A20786
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2025 10:40:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.878310.1288484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tci4w-0000hG-Ps; Tue, 28 Jan 2025 09:40:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 878310.1288484; Tue, 28 Jan 2025 09:40:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tci4w-0000ek-Mc; Tue, 28 Jan 2025 09:40:18 +0000
Received: by outflank-mailman (input) for mailman id 878310;
 Tue, 28 Jan 2025 09:40:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WhQb=UU=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tci4v-0000QN-04
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2025 09:40:17 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20618.outbound.protection.outlook.com
 [2a01:111:f403:2009::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e005e2cd-dd5b-11ef-99a4-01e77a169b0f;
 Tue, 28 Jan 2025 10:40:15 +0100 (CET)
Received: from SJ0PR03CA0258.namprd03.prod.outlook.com (2603:10b6:a03:3a0::23)
 by CY5PR12MB6106.namprd12.prod.outlook.com (2603:10b6:930:29::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 09:40:10 +0000
Received: from SJ1PEPF00002320.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::dc) by SJ0PR03CA0258.outlook.office365.com
 (2603:10b6:a03:3a0::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.23 via Frontend Transport; Tue,
 28 Jan 2025 09:40:10 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00002320.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Tue, 28 Jan 2025 09:40:09 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 28 Jan
 2025 03:40:08 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 28 Jan
 2025 03:40:08 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 28 Jan 2025 03:40:06 -0600
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
X-Inumbo-ID: e005e2cd-dd5b-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YlVU8/zyJz0/QZoEmFgMCxhJ/nrFEHtP75M2w6+PM0uNBu9gcT7qS/5FhJr0+71S9g6a6qecbNmQ6Djh8qphRRjSxkIumXFv3mL30DCt5kELTfeFdRahIXD466vYji2MK63Rz5bnRsoQ3XYHDDxQ9cB5wtp4Tiyl51F3n8JnKNVtepVWAMzeE5yXYybCugsOQXvD+8Lj5GniYSbFgOv6b3MEZlGjiz/QaCbRo/dJSDGCqsEMNdiuG/Yuq5ACWR+uDDMTyOwOn9gyhM4sO816xMJNI018p1Jx4qF9KS2hA0YqxatNLPRnt8Z+shUcoWiMDrjJkQhuYZwPcwxxBUiXOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p5PS00aovMc/LXTzX3cWiC6NVUzhB6/IMA3gbnyVqzM=;
 b=D7wN9AMda9m9+7wBgZXIYNwl5b3EeSGrsrJ9goF+DX5EFBWU2xDVkoKR3ZdvPP6XVkt7GWsL7itieM8OmklV4oPt6gxPaBfQ2yPHsWUGK11u1TY8T1zyYre07IW2uXyePSo3pyTgpmL8JczZXo3UyvWa/g3OhGYXD67jNNLICizZ1zgPoQhIkT08IsH/03skzEKVLzhO6XNigo+/M9lqE5n4Jh1OlMH6lq0zpo5lVZMYgijj2XdYDw7QOXGd/3Ug0GuI69ViNZeTmKAQROj5slJh2qaSm82riIs6uEMWAhtrEjx/EofBnAozQ3h5zWpnBQ/0I3MSHT+CfsNfJASBMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p5PS00aovMc/LXTzX3cWiC6NVUzhB6/IMA3gbnyVqzM=;
 b=ueVVHoD5wjWM4N047gqpCIGyOkpRA24e+iLsFzDU/S5D0JWkm8CaPi3xh3KLmS055+8lhVtEUskFc3HpqkWhJpOI0fOCIwoCjvBeXlqoSq5fyTEf6QCcTKum2zLy5/T7M6HZ5tD0STpYAFKtChXHpU0zSr8mmQDcmb9J7HJTlpk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<oleksii.kurochko@gmail.com>, Luca Fancellu <luca.fancellu@arm.com>
Subject: [for-4.20][PATCH v2 2/2] xen/arm: Fix build issue when CONFIG_PHYS_ADDR_T_32=y
Date: Tue, 28 Jan 2025 10:40:02 +0100
Message-ID: <20250128094002.145755-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250128094002.145755-1-michal.orzel@amd.com>
References: <20250128094002.145755-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002320:EE_|CY5PR12MB6106:EE_
X-MS-Office365-Filtering-Correlation-Id: d6df9984-2065-4f39-ceea-08dd3f7fc176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?J4JC/3EXPRJp9LbF7KAZWarMl/+Er0MkoTDzfCC/hPZxpH7qlD1c1Uv0ln6o?=
 =?us-ascii?Q?ypcimIOAaEqMsQytF0ui6z+srwY568chCOVrlX50qAx7HcLh2mfD+OXiOcWe?=
 =?us-ascii?Q?q9pZ4J9IXMXIpOSTi9uxLk6dilfe7F8+nb4bW1u4r3VQ2pZIl9F87SOOzGVq?=
 =?us-ascii?Q?bqo6gFY1q31iXf7n29uomreHu3wr+BBsFYwH/BWLHlOnaa7qesh08LzUoz2b?=
 =?us-ascii?Q?PhTuyi3ebXkV6sDd+/qAtDh2Rb2LyIePpSW58SrJN8rnuaKklumBf5NcvnzT?=
 =?us-ascii?Q?Gq6V2Lzs+lSSKODBHpljfh536EJDVAoyxk3rLFDu28MrqiYjAwQz4Ps6/c6j?=
 =?us-ascii?Q?PGuoRkETGB+/y0+ttB538zjy8M8Ax2nezhkG/RRfj+RkXCzoC74PXq2FTl8n?=
 =?us-ascii?Q?oVJGHvIIatLPNk7x0j/7Ld55iLDhOyjOfJMduiFeW6Nglna93LfWd+NQTl3K?=
 =?us-ascii?Q?GZtZq9fg3+/AS41vUgP1jpEUC1jQOEAPB7zQF1615TlB5rMt4VtUOuhwaQKk?=
 =?us-ascii?Q?FQHRFjXkAh2H8ExrmU6VK1YY9ayFVonVTeIDjaArQwuF3uA4AgzPJj1IeGep?=
 =?us-ascii?Q?RwuykkWrhwfsLEMD6VE4Ho6ShJccYKc21P2tOGxr6o+f72zchuvdACsDR+yt?=
 =?us-ascii?Q?zgZ+ApT0W3peobd34EPU3a3Gljo800NAE3NqfRPPmpTYiyXrS8+u2AcjShQ7?=
 =?us-ascii?Q?szYwjPmUE+6gvOZMW8obu/PMy6d2i+FHPG5OQZGvnVWQWLKtyLacvHSpwMSb?=
 =?us-ascii?Q?Zs/I2+l06SWzyeSnGMtQ6o35gTHI2sKpQV89bDk+75I9JSjhY/D2Sx6Zk8k1?=
 =?us-ascii?Q?qHMjLCVMWywJPt6LOyvO5vnBBrvWt19bvhOL2NBAc6YbG4gJRZAQGSfwlmvj?=
 =?us-ascii?Q?2zJAFWVE/IAwctE/boGY2INlbMw6fVWL6DegNSvAnsQkWI+dFWFdiImtccaB?=
 =?us-ascii?Q?8YvHDhz09iuDHRuGiuD9B0GBaWtJ8aO1P9mYVpSX9GxTBYB5AIMmxCGH32qH?=
 =?us-ascii?Q?r/XOk2fwIk+y2XelaMKAgpJ7DGemThMW71l1+91DYk58+GTj23Mbbrkkuo2N?=
 =?us-ascii?Q?qiTKAtO/N8dU7Bii2pOQOTGLFMp9sF6e1dbll+PaF9T95J6ERP+9lj3yXBgk?=
 =?us-ascii?Q?8ZiiQ6wRiCZU49OPBe8ngR0AvjfiH8SfmOneJvVJoun3xVoGhh6pWNElHUJK?=
 =?us-ascii?Q?omltlqLumzU44OioyPYT3FJgJAg691ZGBNyydxFUbeMhRjifrDIjH5W/fFoH?=
 =?us-ascii?Q?haE2aiC2oUxtTwLjq8k30IbmRFftqds88F8/mXRMfKNlKmUuqshOfAnmoZtM?=
 =?us-ascii?Q?2cZiCRJ9o8IVSB/xNjdBh+neu35bGPJY4L9hcIjb+lyakBsGJZQtTVFUyvYb?=
 =?us-ascii?Q?UtdXCggJliNRqdawJOOBq+oYpJ2v3i3pP8FdOz+rksDUJXodbGWMHN+YZduh?=
 =?us-ascii?Q?0MOMLnttyE39SvemWt9JKR6IgGSIOzRWeCDDEhRqjkx8/1oVJVIefuYY9244?=
 =?us-ascii?Q?iQCxmFQIr3prjUs=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 09:40:09.4726
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6df9984-2065-4f39-ceea-08dd3f7fc176
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002320.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6106

On Arm32, when CONFIG_PHYS_ADDR_T_32 is set, a build failure is observed:
arch/arm/platforms/vexpress.c: In function 'vexpress_smp_init':
arch/arm/platforms/vexpress.c:102:12: error: format '%lx' expects argument of type 'long unsigned int', but argument 2 has type 'long long unsigned int' [-Werror=format=]
  102 |     printk("Set SYS_FLAGS to %"PRIpaddr" (%p)\n",

When CONFIG_PHYS_ADDR_T_32 is set, paddr_t is defined as unsigned long.
Commit 96f35de69e59 dropped __virt_to_maddr() which used paddr_t as a
return type. Without a cast, the expression type is unsigned long long
which causes the issue. Fix it.

Fixes: 96f35de69e59 ("x86+Arm: drop (rename) __virt_to_maddr() / __maddr_to_virt()")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Release-Acked-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Tested-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v2:
 - none
---
 xen/arch/arm/include/asm/mm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index f91ff088f6b1..a0d8e5afe977 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -263,7 +263,7 @@ static inline void __iomem *ioremap_wc(paddr_t start, size_t len)
 
 #define virt_to_maddr(va) ({                                        \
     vaddr_t va_ = (vaddr_t)(va);                                    \
-    (va_to_par(va_) & PADDR_MASK & PAGE_MASK) | (va_ & ~PAGE_MASK); \
+    (paddr_t)((va_to_par(va_) & PADDR_MASK & PAGE_MASK) | (va_ & ~PAGE_MASK)); \
 })
 
 #ifdef CONFIG_ARM_32
-- 
2.25.1


