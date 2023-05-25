Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFA27112DC
	for <lists+xen-devel@lfdr.de>; Thu, 25 May 2023 19:52:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.539790.841009 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2F7e-0005hT-Eb; Thu, 25 May 2023 17:51:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 539790.841009; Thu, 25 May 2023 17:51:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q2F7e-0005fB-Bt; Thu, 25 May 2023 17:51:34 +0000
Received: by outflank-mailman (input) for mailman id 539790;
 Thu, 25 May 2023 17:51:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x5Sm=BO=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1q2F7d-0005f5-2t
 for xen-devel@lists.xenproject.org; Thu, 25 May 2023 17:51:33 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20628.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c6fe3548-fb24-11ed-b230-6b7b168915f2;
 Thu, 25 May 2023 19:51:30 +0200 (CEST)
Received: from BN8PR04CA0003.namprd04.prod.outlook.com (2603:10b6:408:70::16)
 by CH3PR12MB8186.namprd12.prod.outlook.com (2603:10b6:610:129::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 17:51:27 +0000
Received: from BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:70:cafe::3a) by BN8PR04CA0003.outlook.office365.com
 (2603:10b6:408:70::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28 via Frontend
 Transport; Thu, 25 May 2023 17:51:27 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT032.mail.protection.outlook.com (10.13.177.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6433.18 via Frontend Transport; Thu, 25 May 2023 17:51:26 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 12:51:26 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 25 May
 2023 10:51:25 -0700
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 25 May 2023 12:51:24 -0500
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
X-Inumbo-ID: c6fe3548-fb24-11ed-b230-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QmwDVvqvLBMq9rvX7/nxvfxoGSbLQPs70Yvy74wHswksUfHiAUO1ekfrMyt5duXjy6ctniy+aR81XAT+dwq2/o0Jk9oH18aVffPSolO0PIG+lQ4Y37nPGaRNZ/8pD9at3adjNazBXZUCcrMBRaGVrkgbqBPxQB+dYtsUuzUgO2TLBqjGDuKVPoINciLYiYtqTZ0AskYkkBz6Lr7wzgZu6oqIhEeWrHilZbuO0mQAjbtYzqXQc6LeWnzi+F/ZRJ0w0PGwOeY1bs2vf50ey0bxeFfgLB4gbLyqTdeYK0h1kHhD714BjTdvFsGKqR8R125hCsr0AU4TCg/GtZqeleDt6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4r+bKjQj1My3UE73dkVNZmyr82oDetzB3Ozifh2S6OI=;
 b=h/yS2EYvlry1GKi5WgXNF7RnwQw3xaWxYh3uza1KXfxVlpuS89UAo8J9XrP5rhoQ2NiowAxAu3yUZGHGLLrddqTTwjqU5b+V793LlPSJ9RDXKL4uyKtoVpyske3GATXBvn3oiF5miiVGtQrJmT0u9etssfjwqPbxKP/QW+VibNqGsolUPHLAAIunRVmZ25QVbie4U9lZ4eX//ZvvMDVHn/MRzy2pQhX3vjIiyUvJJABRIAB6HjWU9gJp5yNEriCqTtdrGfyhjpnGaQdV7DKAON9v8oTjG9sy/ucwRISeBMJ8/KZUlGfCWXpBUggw6110uN3SXYmbf5FGfkq5DDzhHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4r+bKjQj1My3UE73dkVNZmyr82oDetzB3Ozifh2S6OI=;
 b=LIwhuUimWdC8zR4ENl6OwMbTBmnMAbqcpEreJnUf7Rku72oZV3zppPNNpwEKcrjn8xMY5KKxdIy4B6dN4bq/grsxJM5PFaNYk/+am4GGwA6swD8nW6dkEwgSpDjiMtldLc1PGxs4J+ehgqPWkNt0i+aN0Pjge/n5V13XZoqMxa0=
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
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH] xen/arm: un-break build with clang
Date: Thu, 25 May 2023 13:51:15 -0400
Message-ID: <20230525175115.110606-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT032:EE_|CH3PR12MB8186:EE_
X-MS-Office365-Filtering-Correlation-Id: 90b7500e-368c-4be0-af7e-08db5d48a98e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UX+rSzk3SfpsN/vTe2L11jDBcG/JizlQGcpFGpkG3gZzZzzgnAP4ScMgey7l8rUWaSFsT7sYYuR8gD0U4hkmgC4RBw7BXkzp/pjoWh67AyIIlbgOfNBgYglzICVOH0/PhKMrTGP4Ik0aBkMgbzOyTyf5ls5F24xrvYcgnn5f9pm7ntxorIcAGJZhhwa3LB32z1s9yNDuGAQw9vWBzTrmgSZP7dYHMuUSDwd6ohdG5FnpacU3inWsLRcfD+UwHc+yRTzcO0A5lPuRIZ/VnpvuNFah3NPXLBhlxHwzhIlM55JVPAWqROoARp9I8SIwyjvvHCzq16jWoMNmLs5+WsLUFVATPoKaMKZew9RJJpBQNvhs1YuE+RPD46Rvkj28FDNvSbWA7Y6+gOBVh2MFZZWEY0q6vRg7x1mem8ZbHg4RG+LzbX+HwQkJZfyJ0aBwR3EyaBSL0yWtP0KEEJ4HCVOpcZCyyNnJzvlAPWfwinhIcPpGFtgxe+YQD0dqnUIERkjqFA2ggqU+12JL+YJpxp9E0dipX21zeEPnYSk8P5tBvzL9OJlzwHrNBEKMZZ82xIJheVgTuigoGEDBgQBGK0eHqmi8CWUuzdTJZIo7navnZ7SQDEjY3QM3+0GJmTVOJj9GMwA1KubuYQyr1Qo2THmd5g9um5C97YF7i1ky6Sbe7XqHFoEOktF3yV3CXH6/FN5zO1hmTszITIyw+oJeotPPFeL4OyGhlvlqfHjqISkf3c8gIhJCdvSRdNbMgXE9F9GziVhRykPYDQb2DBkaRJ+BDA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199021)(36840700001)(40470700004)(46966006)(81166007)(356005)(8676002)(8936002)(40460700003)(5660300002)(82740400003)(2906002)(47076005)(40480700001)(1076003)(26005)(186003)(83380400001)(426003)(82310400005)(36756003)(2616005)(336012)(86362001)(44832011)(36860700001)(4326008)(316002)(6916009)(70206006)(70586007)(6666004)(54906003)(478600001)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 17:51:26.6317
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b7500e-368c-4be0-af7e-08db5d48a98e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8186

clang doesn't like extern with __attribute__((__used__)):

  ./arch/arm/include/asm/setup.h:171:8: error: 'used' attribute ignored [-Werror,-Wignored-attributes]
  extern DEFINE_BOOT_PAGE_TABLE(boot_pgtable);
         ^
  ./arch/arm/include/asm/lpae.h:273:29: note: expanded from macro 'DEFINE_BOOT_PAGE_TABLE'
  lpae_t __aligned(PAGE_SIZE) __section(".data.page_aligned")                   \
                              ^
  ./include/xen/compiler.h:71:27: note: expanded from macro '__section'
  #define __section(s)      __used __attribute__((__section__(s)))
                            ^
  ./include/xen/compiler.h:104:39: note: expanded from macro '__used'
  #define __used         __attribute__((__used__))
                                        ^

Introduce a new EXTERN_DEFINE_BOOT_PAGE_TABLE macro without
__attribute__((__used__)) and use this for the relevant declarations.

Fixes: 1c78d76b67e1 ("xen/arm64: mm: Introduce helpers to prepare/enable/disable the identity mapping")
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
I tested with clang 12 and clang 16

Here is my make command line:
make -j $(nproc) \
    clang=y \
    CC="clang --target=aarch64-none-linux-gnu -march=armv8a+nocrypto" \
    CXX="clang++ --target=aarch64-none-linux-gnu -march=armv8a+nocrypto" \
    HOSTCC=clang \
    HOSTCXX=clang++ \
    XEN_TARGET_ARCH=arm64 \
    CROSS_COMPILE=aarch64-none-linux-gnu- \
    dist-xen
---
 xen/arch/arm/include/asm/lpae.h  | 4 ++++
 xen/arch/arm/include/asm/setup.h | 8 ++++----
 xen/include/xen/compiler.h       | 1 +
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/include/asm/lpae.h b/xen/arch/arm/include/asm/lpae.h
index 3fdd5d0de28e..294a8aa4bd30 100644
--- a/xen/arch/arm/include/asm/lpae.h
+++ b/xen/arch/arm/include/asm/lpae.h
@@ -273,6 +273,10 @@ lpae_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr);
 lpae_t __aligned(PAGE_SIZE) __section(".data.page_aligned")                   \
     name[XEN_PT_LPAE_ENTRIES]
 
+#define EXTERN_DEFINE_BOOT_PAGE_TABLE(name)                                   \
+extern lpae_t __aligned(PAGE_SIZE) __no_used_section(".data.page_aligned")    \
+    name[XEN_PT_LPAE_ENTRIES]
+
 #define DEFINE_PAGE_TABLES(name, nr)                    \
 lpae_t __aligned(PAGE_SIZE) name[XEN_PT_LPAE_ENTRIES * (nr)]
 
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 38e2ce255fcf..af53e58a6a07 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -168,13 +168,13 @@ u32 device_tree_get_u32(const void *fdt, int node,
 int map_range_to_domain(const struct dt_device_node *dev,
                         u64 addr, u64 len, void *data);
 
-extern DEFINE_BOOT_PAGE_TABLE(boot_pgtable);
+EXTERN_DEFINE_BOOT_PAGE_TABLE(boot_pgtable);
 
 #ifdef CONFIG_ARM_64
-extern DEFINE_BOOT_PAGE_TABLE(boot_first_id);
+EXTERN_DEFINE_BOOT_PAGE_TABLE(boot_first_id);
 #endif
-extern DEFINE_BOOT_PAGE_TABLE(boot_second_id);
-extern DEFINE_BOOT_PAGE_TABLE(boot_third_id);
+EXTERN_DEFINE_BOOT_PAGE_TABLE(boot_second_id);
+EXTERN_DEFINE_BOOT_PAGE_TABLE(boot_third_id);
 
 /* Find where Xen will be residing at runtime and return a PT entry */
 lpae_t pte_of_xenaddr(vaddr_t);
diff --git a/xen/include/xen/compiler.h b/xen/include/xen/compiler.h
index 7d7ae2e5e4d9..70ba563e29c2 100644
--- a/xen/include/xen/compiler.h
+++ b/xen/include/xen/compiler.h
@@ -73,6 +73,7 @@
 #define __section(s)      __attribute__((__section__(s)))
 #endif
 #define __used_section(s) __used __attribute__((__section__(s)))
+#define __no_used_section(s) __attribute__((__section__(s)))
 #define __text_section(s) __attribute__((__section__(s)))
 
 #define __aligned(a) __attribute__((__aligned__(a)))
-- 
2.40.1


