Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C97D5875C2B
	for <lists+xen-devel@lfdr.de>; Fri,  8 Mar 2024 02:55:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.690076.1075747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riPRo-0002NZ-5S; Fri, 08 Mar 2024 01:54:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 690076.1075747; Fri, 08 Mar 2024 01:54:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riPRo-0002Ky-2R; Fri, 08 Mar 2024 01:54:56 +0000
Received: by outflank-mailman (input) for mailman id 690076;
 Fri, 08 Mar 2024 01:54:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OTfa=KO=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1riPRm-000262-AL
 for xen-devel@lists.xenproject.org; Fri, 08 Mar 2024 01:54:54 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2412::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dabc7394-dcee-11ee-a1ee-f123f15fe8a2;
 Fri, 08 Mar 2024 02:54:52 +0100 (CET)
Received: from DM6PR10CA0002.namprd10.prod.outlook.com (2603:10b6:5:60::15) by
 SA0PR12MB7001.namprd12.prod.outlook.com (2603:10b6:806:2c0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Fri, 8 Mar
 2024 01:54:47 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:5:60:cafe::27) by DM6PR10CA0002.outlook.office365.com
 (2603:10b6:5:60::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.27 via Frontend
 Transport; Fri, 8 Mar 2024 01:54:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Fri, 8 Mar 2024 01:54:47 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 7 Mar
 2024 19:54:46 -0600
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 7 Mar 2024 19:54:44 -0600
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
X-Inumbo-ID: dabc7394-dcee-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LrbOO0R3HbwVD8i17/u6NyTVrytsLJlqwJqo9h12AcfNq210pVfNaP9fTiTF2sGm/MJJVaSMw7uQpdG/al5Zt84NjgKwsHD0DeIRoPx7KBuhhzXVZ0fysQFwRmqHHd7R9Dhv0FYeVgrOxNwiKyBntTHx1iPZhU1JYvotco/WWwje0Iv46jk9xiYVXLHR7Ga7qjO42cbnUCiQpegOVkw6B2PKHz9MLTbSBJvXXVrSW8NWWjm5xg25S2QegpXK0b4Q42M37regoxg2jJ6GbGierOdqJ9eZfPrCC9DdDEo8xQ7ZqELEK87X5xhNzsfrr1fW027gCzxP6f36HOX0EBg51A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t+i1Nrwfs3RtzHQxrkA9Q/UxYobRSCipIPuuOohcu4M=;
 b=OqD7j2+pBbQKSJemR7k5d7fNhk4BHfbtJzX39H/LLWeERTWwYpeuN7LASrzZN+IdjSj1/nvIA0ySHSdHYXP0+WGHixnemoakFkbkKRSaktPC3yM3lYrZTMGc+uIS9flWHv+ZLzHxlBQxHsO+Vt9XjvMZN4dHanld0g1gyxYYGopmT2xAB1bFaoXMQXBUOH7UR3smiDB2aV7moQfTAwWlMhdD0reDlD3z6m7NJpgTtv845DXKxvSBwXJwaBJre035ElDMxu/AXr3vzUIZ2zJ7kSFxB2g5gKvFLXfD2zEf0Z8Awe3XU9STeL80NFaBbVUenD1q4Zie8FVjO3Xte5AO+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t+i1Nrwfs3RtzHQxrkA9Q/UxYobRSCipIPuuOohcu4M=;
 b=4Ubdres3RNzCsVrJnpv5T9kC8Wp7I13Ear5jk3r4dht3aEp4yMgDZoC79ycuBu6q0Elu994q+Wd6c0Q9ybseKY2iZznlhrzEkU1Mo+3/QO2gkX6wbXRWMTitZacYV4Ro9aVdyn2mMXSL68uh+hZWlWozuG1Gmh2gzVKlnTka5Jk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 1/5] xen/arm: Rename assign_static_memory_11() for consistency
Date: Fri, 8 Mar 2024 09:54:31 +0800
Message-ID: <20240308015435.4044339-2-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240308015435.4044339-1-xin.wang2@amd.com>
References: <20240308015435.4044339-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|SA0PR12MB7001:EE_
X-MS-Office365-Filtering-Correlation-Id: d1e475ed-1378-433f-83c8-08dc3f12bbfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/9Q/4lcYBxbykpoXUM/fT/CW1Nrc89QJIVrrF1vK1MD9RWhgqn8Czd1FQRckfhiTjT5oMjJWfwzcVpAsn74AQrVXtoVlvpe0FNGxbQS4c8rcAFI48GiNVVR3HvF3X9VoxLYyKgihEYb9d7ngp5Gn8/lPYKLd+Cc/nMEPcYtftDgxZMRqxjbpod8GQnnUvnzeSmvxBqZlTx+K5mEDLCXAoJmM/wGPHk1kmcAevX92uj7xM3GAb2z5bYJ9/UMmW01I1Jcn88DPKHPjbhGLS1hm4MfEKur8mgO/LETPUhyITGG2laF8WYOgLw0QaYNQQHbXTVsRl5KsUcRtS8j9magy2WpFE1hAcQap/1gVp+i0wM+xxWNvfmXAxBv+9kOaWXG5nh+p0JYYzXPwKLWYd/WOIxqduijE1HpyisxVUk8+SI8ee6wMQzwVUti7PwICRf9KYwDp1OK7Dl4DI8CpQc+nzLJkssABVIxiY4LgO9WmQvreKJJYdJccagS2y4DXrPdtCXO2lo3tp9jZY+/8ckqz2wZpWmHKd0ghwfAo5/Xq/M4WDHknfbQmg3WJqogvt6IhF82TS2FHiWjUPSzEhTARKsxazmottxusBJE4HEmQGaT+vyZncyJn1s8NA8Ilg6ciztDQ+Yi7W++xN0WoXS0NOxzfTS1Y7xsTwpMfYtoht8Q16f+DZOIDP+Vvu3IvcP0l1dH0XJGALP/1j9565/3eDp3Ymhoid/wJRuHJSjGh2JuVkByYKuiaDwG5vAYwWZuh
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(82310400014)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 01:54:47.4861
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d1e475ed-1378-433f-83c8-08dc3f12bbfa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7001

Currently on Arm there are 4 functions to allocate memory as domain
RAM at boot time for different types of domains:
(1) allocate_memory(): To allocate memory for Dom0less DomUs that
    do not use static memory.
(2) allocate_static_memory(): To allocate memory for Dom0less DomUs
    that use static memory.
(3) allocate_memory_11(): To allocate memory for Dom0.
(4) assign_static_memory_11(): To allocate memory for Dom0less DomUs
    that use static memory and directmapped.

To keep consistency between the names and the in-code comment on top
of the functions, rename assign_static_memory_11() to
allocate_static_memory_11(). No functional change intended.

Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
v2:
- New patch
---
 xen/arch/arm/dom0less-build.c            | 2 +-
 xen/arch/arm/include/asm/static-memory.h | 8 ++++----
 xen/arch/arm/static-memory.c             | 5 +++--
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index fb63ec6fd1..1e1c8d83ae 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -806,7 +806,7 @@ static int __init construct_domU(struct domain *d,
     else if ( !is_domain_direct_mapped(d) )
         allocate_static_memory(d, &kinfo, node);
     else
-        assign_static_memory_11(d, &kinfo, node);
+        allocate_static_memory_11(d, &kinfo, node);
 
     rc = process_shm(d, &kinfo, node);
     if ( rc < 0 )
diff --git a/xen/arch/arm/include/asm/static-memory.h b/xen/arch/arm/include/asm/static-memory.h
index 3e3efd70c3..667e6d3804 100644
--- a/xen/arch/arm/include/asm/static-memory.h
+++ b/xen/arch/arm/include/asm/static-memory.h
@@ -9,7 +9,7 @@
 
 void allocate_static_memory(struct domain *d, struct kernel_info *kinfo,
                             const struct dt_device_node *node);
-void assign_static_memory_11(struct domain *d, struct kernel_info *kinfo,
+void allocate_static_memory_11(struct domain *d, struct kernel_info *kinfo,
                              const struct dt_device_node *node);
 void init_staticmem_pages(void);
 
@@ -22,9 +22,9 @@ static inline void allocate_static_memory(struct domain *d,
     ASSERT_UNREACHABLE();
 }
 
-static inline void assign_static_memory_11(struct domain *d,
-                                           struct kernel_info *kinfo,
-                                           const struct dt_device_node *node)
+static inline void allocate_static_memory_11(struct domain *d,
+                                             struct kernel_info *kinfo,
+                                             const struct dt_device_node *node)
 {
     ASSERT_UNREACHABLE();
 }
diff --git a/xen/arch/arm/static-memory.c b/xen/arch/arm/static-memory.c
index cffbab7241..20333a7f94 100644
--- a/xen/arch/arm/static-memory.c
+++ b/xen/arch/arm/static-memory.c
@@ -187,8 +187,9 @@ void __init allocate_static_memory(struct domain *d, struct kernel_info *kinfo,
  * The static memory will be directly mapped in the guest(Guest Physical
  * Address == Physical Address).
  */
-void __init assign_static_memory_11(struct domain *d, struct kernel_info *kinfo,
-                                    const struct dt_device_node *node)
+void __init allocate_static_memory_11(struct domain *d,
+                                      struct kernel_info *kinfo,
+                                      const struct dt_device_node *node)
 {
     u32 addr_cells, size_cells, reg_cells;
     unsigned int nr_banks, bank = 0;
-- 
2.34.1


