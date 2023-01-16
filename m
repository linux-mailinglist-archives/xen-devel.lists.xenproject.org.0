Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8B066C28D
	for <lists+xen-devel@lfdr.de>; Mon, 16 Jan 2023 15:45:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.478741.742118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQjZ-0003lU-LQ; Mon, 16 Jan 2023 14:45:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 478741.742118; Mon, 16 Jan 2023 14:45:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHQjZ-0003jr-Fr; Mon, 16 Jan 2023 14:45:13 +0000
Received: by outflank-mailman (input) for mailman id 478741;
 Mon, 16 Jan 2023 14:45:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wx/b=5N=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pHQfj-0006p7-8c
 for xen-devel@lists.xenproject.org; Mon, 16 Jan 2023 14:41:15 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2085.outbound.protection.outlook.com [40.107.94.85])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d20b8972-95ab-11ed-91b6-6bf2151ebd3b;
 Mon, 16 Jan 2023 15:41:12 +0100 (CET)
Received: from BN6PR17CA0057.namprd17.prod.outlook.com (2603:10b6:405:75::46)
 by BL3PR12MB6402.namprd12.prod.outlook.com (2603:10b6:208:3b2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 14:41:09 +0000
Received: from BN8NAM11FT092.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:75:cafe::dd) by BN6PR17CA0057.outlook.office365.com
 (2603:10b6:405:75::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.20 via Frontend
 Transport; Mon, 16 Jan 2023 14:41:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT092.mail.protection.outlook.com (10.13.176.180) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.13 via Frontend Transport; Mon, 16 Jan 2023 14:41:09 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 16 Jan
 2023 08:41:08 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 16 Jan
 2023 08:41:07 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 16 Jan 2023 08:41:07 -0600
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
X-Inumbo-ID: d20b8972-95ab-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L53WMuAg/YNQ1/alwxGdi6ZP12q2W0fPqQFJoSManfCAw3mc7J8D0bFnbOJNsuCfMw2vAswkH/kejETGHgazCHmkZyVeuhCUwbqeg8G9HBrpKT/+nXhE2PCUlSq3TOgr0WvrMdCpqvoQhpfcDKNHo6oOZLHFGRJF/WOizesjzDbqb0ZcGLBiBbef5XS4+UeR5Kgeg7raXJlsEttvS8Hh6/TZ4wBczljuuq7ivGCHO/HEbB3SWg7tlShIdIhyNzR6b6nOfs/55BDefJ/IDNpT97JHvf+I4I2SMbRvF3rfRkvqBQQooQA62TSF1AY6UumBm5Yrv04+B+sbIuUQdTxHtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0JHRey8jQegVPl/scg0qC1Q1cBu4AxiKMGjEWCu71uc=;
 b=fk21255Pq3+nt8CKWDh+naXhovWsn/7W2a1n+7tEY0QI0FoQM80y8c5ScK5/iKBBzcBsfwc/h+0RGF9a/Hy24uTM43J2kaReBSxCVxCERmYZ2XhH5uDhn3ZtMbQuoJlXS9yay4Imf/AUIe3jNdGiodAY+cElCGXy+jgSY52TtgqdsrdT4vYGV7/G/8EDQZEh6LS4pJYFocy+IRH1m4ZM6/I4SKb4ZAiEwH2c8luZs5gyoW6R9HAAaEaQjIvyzfC+1P6Xp2E8FCwpPHsZgcnsnoGQOVI2b5SMnnVT/SXJAPYzhKohYgCjIeE4lQDVLplCbF9/CS9dOZnSZZYa8PJxow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0JHRey8jQegVPl/scg0qC1Q1cBu4AxiKMGjEWCu71uc=;
 b=FSFassEGCaxEreBnzXEGo9PdyRwx8aeBEGnzBPNrp5D2T9Vj0RqupvywN0g1P//X4ik1zEkz+iW2G79JHeJ++7pTi0Djnvh8u6/UkTByDO1U0NBTklYyGGYRIi7ANVgYhKM1jXT07UZ/qvdlerKj1qEPEIvTRyVFNgRJc0cMcNc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: Harden setup_frametable_mappings
Date: Mon, 16 Jan 2023 15:41:05 +0100
Message-ID: <20230116144106.12544-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT092:EE_|BL3PR12MB6402:EE_
X-MS-Office365-Filtering-Correlation-Id: 952691d1-0517-421d-80d2-08daf7cfb4f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	4WJd9MhNBHkYqLa9OK5OaYoSytrdIDf18prXwvLBNDWwSVrIqSiVJXMfUXWQw7IH1yKQfJPsXzGkWlhGKh4GEhzTLfWkccux47GSiMozU2/CadOkLBc42ZyvtDODXz2RNZKXURlqBq7p8U5vFXgEuAvd99SNu7N8l0wq0gR2D7DsnvtyoBsmgRZ9m2U9JyU20/PEjrVLKv473a+4rsIy+4qbgIHaQL36wandES15yK9XdquPEnnRSrWn7dORdKMGATPcEbhLsxf04xiIfX0fnymZrkwR3ewEyUfKjOKnGbDQ/LFJMd7k8tDcxlcZuLyQ5wjGwaz2EdPeLhb2pgBotxUZ8DHJp5y/VGz91nQipQIkoyURuhucRD65naZnL0Y0Wz15pr9AFK2EbPLT0F+ajep9gCmmqvbypxZ3Gbl6EJRsaMTsxAwMnnfhPaUvrXUY95RpXef0Gm3RIDjyzA4ukFAQEwW9aD7DCB+OFtkn2cftzAiUKsjXMxNi1WWrs6q3o1DzJYENifGh++qkyVCsBCn3f+nFrjbFsaN/AAOaG7GzDUhLM33H3vX0BtiqlTscCAUB4tLeSCF474yYlsUrmT+MNbCbK1ltEYyFjrdJ9VKP7QCqpXMXWdbinyJf1UBCcQ8p3GgXXRqDJoQlcs14eZJamcTRDPucc9Qw2A0BgOZTxF2Oe4UIkNW1UaDwQbjn4sM2bn0OvyEmZ7D4LeDd8o5lsfNQj5idBJI/BVA86Do=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(376002)(136003)(396003)(451199015)(40470700004)(46966006)(36840700001)(82310400005)(70206006)(426003)(70586007)(41300700001)(2616005)(47076005)(26005)(186003)(8676002)(4326008)(6916009)(86362001)(36756003)(83380400001)(36860700001)(5660300002)(82740400003)(336012)(8936002)(54906003)(478600001)(316002)(40480700001)(1076003)(81166007)(2906002)(356005)(40460700003)(44832011)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 14:41:09.1179
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 952691d1-0517-421d-80d2-08daf7cfb4f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT092.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6402

The amount of supported physical memory depends on the frametable size
and the number of struct page_info entries that can fit into it. Define
a macro PAGE_INFO_SIZE to store the current size of the struct page_info
(i.e. 56B for arm64 and 32B for arm32) and add a sanity check in
setup_frametable_mappings to be notified whenever the size of the
structure changes. Also call a panic if the calculated frametable_size
exceeds the limit defined by FRAMETABLE_SIZE macro.

Update the comments regarding the frametable in asm/config.h and take
the opportunity to remove unused macro FRAMETABLE_VIRT_END on arm32.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/include/asm/config.h |  5 ++---
 xen/arch/arm/include/asm/mm.h     | 11 +++++++++++
 xen/arch/arm/mm.c                 |  5 +++++
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index 16213c8b677f..d8f99776986f 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -82,7 +82,7 @@
  * ARM32 layout:
  *   0  -  12M   <COMMON>
  *
- *  32M - 128M   Frametable: 24 bytes per page for 16GB of RAM
+ *  32M - 128M   Frametable: 32 bytes per page for 12GB of RAM
  * 256M -   1G   VMAP: ioremap and early_ioremap use this virtual address
  *                    space
  *
@@ -95,7 +95,7 @@
  *
  *   1G -   2G   VMAP: ioremap and early_ioremap
  *
- *  32G -  64G   Frametable: 24 bytes per page for 5.3TB of RAM
+ *  32G -  64G   Frametable: 56 bytes per page for 2TB of RAM
  *
  * 0x0000008000000000 - 0x00007fffffffffff (127.5TB, L0 slots [1..255])
  *  Unused
@@ -127,7 +127,6 @@
 #define FRAMETABLE_VIRT_START  _AT(vaddr_t,0x02000000)
 #define FRAMETABLE_SIZE        MB(128-32)
 #define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
-#define FRAMETABLE_VIRT_END    (FRAMETABLE_VIRT_START + FRAMETABLE_SIZE - 1)
 
 #define VMAP_VIRT_START        _AT(vaddr_t,0x10000000)
 #define VMAP_VIRT_SIZE         _AT(vaddr_t, GB(1) - MB(256))
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 68adcac9fa8d..23dec574eb31 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -26,6 +26,17 @@
  */
 #define PFN_ORDER(_pfn) ((_pfn)->v.free.order)
 
+/*
+ * The size of struct page_info impacts the number of entries that can fit
+ * into the frametable area and thus it affects the amount of physical memory
+ * we claim to support. Define PAGE_INFO_SIZE to be used for sanity checking.
+*/
+#ifdef CONFIG_ARM_64
+#define PAGE_INFO_SIZE 56
+#else
+#define PAGE_INFO_SIZE 32
+#endif
+
 struct page_info
 {
     /* Each frame can be threaded onto a doubly-linked list. */
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 0fc6f2992dd1..a8c28fa5b768 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -676,6 +676,11 @@ void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
     const unsigned long mapping_size = frametable_size < MB(32) ? MB(2) : MB(32);
     int rc;
 
+    BUILD_BUG_ON(sizeof(struct page_info) != PAGE_INFO_SIZE);
+
+    if ( frametable_size > FRAMETABLE_SIZE )
+        panic("RAM size is too big to fit in a frametable area\n");
+
     frametable_base_pdx = mfn_to_pdx(maddr_to_mfn(ps));
     /* Round up to 2M or 32M boundary, as appropriate. */
     frametable_size = ROUNDUP(frametable_size, mapping_size);
-- 
2.25.1


