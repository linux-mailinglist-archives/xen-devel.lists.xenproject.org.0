Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7309EB25E99
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 10:20:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081019.1441148 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umTCA-0004Kc-V4; Thu, 14 Aug 2025 08:20:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081019.1441148; Thu, 14 Aug 2025 08:20:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umTCA-0004JB-QC; Thu, 14 Aug 2025 08:20:22 +0000
Received: by outflank-mailman (input) for mailman id 1081019;
 Thu, 14 Aug 2025 08:20:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=t1VE=22=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1umTC9-0004Iz-RC
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 08:20:21 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20631.outbound.protection.outlook.com
 [2a01:111:f403:2412::631])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84b632ca-78e7-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 10:20:21 +0200 (CEST)
Received: from BN7PR02CA0006.namprd02.prod.outlook.com (2603:10b6:408:20::19)
 by SA5PPF9176ED2F1.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8d7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Thu, 14 Aug
 2025 08:20:15 +0000
Received: from BL6PEPF00022573.namprd02.prod.outlook.com
 (2603:10b6:408:20:cafe::e5) by BN7PR02CA0006.outlook.office365.com
 (2603:10b6:408:20::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.16 via Frontend Transport; Thu,
 14 Aug 2025 08:20:15 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00022573.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Thu, 14 Aug 2025 08:20:14 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 03:20:11 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 03:20:11 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 14 Aug 2025 03:20:10 -0500
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
X-Inumbo-ID: 84b632ca-78e7-11f0-a328-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hafKtuwQIP8PTmZX+DKZIabhmP4XK6k9LYfq0lG0iAto5HGa8JtKr+k24c8+rTZgcL5ZpXOxKMCi2qUy1gfctFxThvLFi7QFHqzGDyJu3VaI+uYWnBnn+lEYfYjDBgRW0HXgIe6wjtdmVGDehV0ixNHtvwgtk9xo+OIdziUgsCoaQF+6i/SccuXIw9CMclFCRyZhvTDzRHrDwawp/dIvGgK0IXggpRiG6SdrV8t3JYD5hAkm1hh12USIxIOoYEf+wW7NZ0Uy1VcOOKsTXjxcESqa1ApKt9it5D5ZsM/sLTyIvtxxg6tv9W6II00HnqftuUwHltYmk31Za8zvJtsjRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=diXe5/uLcabaESZz6UkvjwqUa3060riuACqXFLyGPyg=;
 b=Z3DzX6wiOrmk1XI5tIWtN/L3w/dkmpUbA0aPpnR8LmIhvMekNwuz+uf3GWWrz5lc6k3mwNQDymaHFVrLLf02C6HJSJ85gt41aXT0yWyiKPJ+UT+716dY13YwkLuDV8giZeNFNmnjyU5Uph9y81QJntFsQ0cXrR7xSMrdvuJ5jIfd5oTai3tgq8PgpNiym3ZE+Xbyne00sL+lZc5GCOfiYpvg6sGSEiyIG4N8J90qa/1nqcr/mzIDfECXqjg5neAZBBY4ROEhIGixp+xbzuh4YA+lEN2++jSvdQTqZZsFbI2XnaZxac5HPiA2HthKY0C93HT+/19XpcaDF+JcwArBxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=diXe5/uLcabaESZz6UkvjwqUa3060riuACqXFLyGPyg=;
 b=ptyriUHtB2+BjR1PxVPaMRqXfOK6dNodZkaRZ6ck80UV4hvKDlTJF86E+KpGbusIfwYeo4WtOXnikiU09xVSAI5Un3IlSH7vz4BdI0C34SuToa+qKXaNBLM5ErYL1Menkl+uVqkgoAsa6wB4cg3FjvjfCTZbcxFyXHWjkewfvfQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 1/2] arm/mpu: Enable is_xen_heap_page and is_xen_heap_mfn for ARM_32
Date: Thu, 14 Aug 2025 09:19:58 +0100
Message-ID: <20250814081959.3504145-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250814081959.3504145-1-ayan.kumar.halder@amd.com>
References: <20250814081959.3504145-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022573:EE_|SA5PPF9176ED2F1:EE_
X-MS-Office365-Filtering-Correlation-Id: bed1fd0a-88ac-42c8-c0bb-08dddb0b657e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QD+ZwxooAZ9H6xWipmD+6vb0uZ7EhgrFL6fkT/vCIlku3UcqhQoulxdrv/8w?=
 =?us-ascii?Q?8uLuzQm9FfaAHZDj1+45Piam81dCLEleyprxDodksAqtsAeeixGqWQ3rsQPZ?=
 =?us-ascii?Q?EK0i6kecG/oQXyAH9VBgIdLhsAtS6xGPztRBffndI6XbcuLCT1MEVKwEx1ua?=
 =?us-ascii?Q?BFqbRgGF8GYP+3vwCIUKHzYNIfZO1U/xnxftFAUR9EKfDERNwjZJN3fvIfZ2?=
 =?us-ascii?Q?7jeHnUDBEVVm6Nuv3VbHJ93AAWTeSPOxBiX4GbMoPhND5PdVqyHK3MY0ATEw?=
 =?us-ascii?Q?UdtKyGeJZfpTzVYW7OZJ5B4Y67BqRjIhZJ7Z9ZYM3+HSRp64FVcSyh70YL9M?=
 =?us-ascii?Q?91Uds57AqUaoXFj9NipbPOS7wzqKU0BsGiy6gCOY1U4g1xA/wH5HnO6m0qfy?=
 =?us-ascii?Q?ULiolx1oSs4nOdb5fSXY8TJrjoeG8hfEnC1HJrmDM9ItgSRiUrbXLe43eKXc?=
 =?us-ascii?Q?J+vJrNQCOA3UvoKNS3vIy0N3sOz7PxbDnfWZXax19VQUrjRAsiZ3Jczg3HVD?=
 =?us-ascii?Q?eWLa1hAEBQXty9LqePmA78Ozf4YZKY64th2B1WZqImJV4o8zduYLa61kr4te?=
 =?us-ascii?Q?dNKMFZGWmsC5ha2PjIUfdtgheyUIJ0cimLpT1NaGAI3AzCG9Uqx9HzfoSdQ9?=
 =?us-ascii?Q?VawLibs4Tw6dBBSD/OTmxrZWw5besqlqNNCZcnvHJoOWi/XNisfUthBQxi94?=
 =?us-ascii?Q?cG9omx8iaPwttdik/B4cCEPJ53qsKoISAbWtv3tJeGD4Q+PGrQBguSzwg5uX?=
 =?us-ascii?Q?Qaov9pXg99l1y3mjTPoIMMI7bQePJZEh8pH+IWaAC1DgDaaC44c2dEOJz07/?=
 =?us-ascii?Q?je8XHgcJZRtl09MTdj1EcemRGIj1p/2I+G8ch1TyFpFDJeOPyehov1b/JTdv?=
 =?us-ascii?Q?7yYJV2enXgS153EyxA/1k8+iOPc1akkdE9MVlyAouMpgKR8vFzprOzJ/G22P?=
 =?us-ascii?Q?LqC8yNkiyTH2210Dlzlpktr4kBA+vqunQQLDVvKd6CIm4Oda29XYVx3G41CI?=
 =?us-ascii?Q?bIQ12C6+9mHDbP36wtlpdWMoxeyIL4FnDKQxSRYaMWTcaJpDzQUvub6FpNUG?=
 =?us-ascii?Q?rm6JEfqFN1+ehJVOsK0flE8pVLPEmhVR852Wrv9AsjTPLqfd9zhbdJao9uIq?=
 =?us-ascii?Q?uYz8xCTJxApo9j8yPEy7ZofLNBVUvfBp5sSN1ehwueOtqoEeBvoQhDmli8o2?=
 =?us-ascii?Q?S4Jbdna6ZA1iMXH8bBX6tdg/BJuUNkY114H5Jp8YT0uUD6OdQMLhqH66zzvY?=
 =?us-ascii?Q?p1LRqt36x7qY6TBnbkUI3wUxZkwIb+GfVmoQaCP6+u+xHPdvMisBzvck3b1A?=
 =?us-ascii?Q?w/WuffoppSowhkwpgmN3cBvUCBVYUPFJ+8YR0tpxDgc4BLPF8JvwG87uTyKB?=
 =?us-ascii?Q?FmHSLuowE0e3OoXzhMNchL4r5PDb+syC6QoRC3jDkFBNEavbslsay+H6Qlf2?=
 =?us-ascii?Q?ijUH8ZF3UiOZAdfQVZrOAsXG9unCJM8SFlXY3Gkq5/RhKzOxl+CGk+pjf9Jv?=
 =?us-ascii?Q?JCf2zFJvAAhpyDnWFLgHLyeQpJCKXlSIbffC?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 08:20:14.9968
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bed1fd0a-88ac-42c8-c0bb-08dddb0b657e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022573.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF9176ED2F1

In case of ARM_32, all of the RAM will be covered by a permanent contiguous
mapping (where VA == PA) and there will be a single heap. Thus, the memory
allocated from Xen heap uses PGC_xen_heap.
This is similar to the scenario described for
"CONFIG_SEPARATE_XENHEAP=n W/ DIRECT MAP OF ALL RAM" in common/page_alloc.c.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from :-

v1 - 1. Enable is_xen_heap_page() and is_xen_heap_mfn() definitions for ARM_64
or MPU (fixed a build break).

 xen/arch/arm/include/asm/mm.h     | 2 +-
 xen/arch/arm/include/asm/mpu/mm.h | 5 -----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index fb79aeb088..7a93dad2ed 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -170,7 +170,7 @@ struct page_info
 #define _PGC_need_scrub   _PGC_allocated
 #define PGC_need_scrub    PGC_allocated
 
-#ifdef CONFIG_ARM_64
+#if defined(CONFIG_ARM_64) || defined(CONFIG_MPU)
 #define is_xen_heap_page(page) ((page)->count_info & PGC_xen_heap)
 #define is_xen_heap_mfn(mfn) \
     (mfn_valid(mfn) && is_xen_heap_page(mfn_to_page(mfn)))
diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
index c32fac8905..e1ded6521d 100644
--- a/xen/arch/arm/include/asm/mpu/mm.h
+++ b/xen/arch/arm/include/asm/mpu/mm.h
@@ -27,11 +27,6 @@ extern pr_t xen_mpumap[MAX_MPU_REGION_NR];
 
 #define virt_to_maddr(va) ((paddr_t)((vaddr_t)(va) & PADDR_MASK))
 
-#ifdef CONFIG_ARM_32
-#define is_xen_heap_page(page) ({ BUG_ON("unimplemented"); false; })
-#define is_xen_heap_mfn(mfn) ({ BUG_ON("unimplemented"); false; })
-#endif
-
 /* On MPU systems there is no translation, ma == va. */
 static inline void *maddr_to_virt(paddr_t ma)
 {
-- 
2.25.1


