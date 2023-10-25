Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C5A7D7201
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 19:04:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623135.970657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvhI4-0008Tv-5R; Wed, 25 Oct 2023 17:03:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623135.970657; Wed, 25 Oct 2023 17:03:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvhI4-0008Rl-2u; Wed, 25 Oct 2023 17:03:32 +0000
Received: by outflank-mailman (input) for mailman id 623135;
 Wed, 25 Oct 2023 17:03:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VHkM=GH=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qvhI2-0008QE-SK
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 17:03:31 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20625.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6a19ce03-7358-11ee-98d5-6d05b1d4d9a1;
 Wed, 25 Oct 2023 19:03:28 +0200 (CEST)
Received: from DM6PR17CA0002.namprd17.prod.outlook.com (2603:10b6:5:1b3::15)
 by SJ0PR12MB7082.namprd12.prod.outlook.com (2603:10b6:a03:4ae::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Wed, 25 Oct
 2023 17:03:21 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:5:1b3:cafe::ad) by DM6PR17CA0002.outlook.office365.com
 (2603:10b6:5:1b3::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.34 via Frontend
 Transport; Wed, 25 Oct 2023 17:03:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Wed, 25 Oct 2023 17:03:19 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 25 Oct
 2023 12:03:18 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via
 Frontend Transport; Wed, 25 Oct 2023 12:03:17 -0500
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
X-Inumbo-ID: 6a19ce03-7358-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M+T2xvm7MkZg1P7j2LocnafgPqfH/ykc+dBYbDklvyBVoxxEN2sCTcq92MFgXtMVg0a0ORCGB+FRMs1d1IDkpBqTENNO7iBh9cMKOlb4OF835+As+lDb9XCfvkTiSrzdO2xFnfxkudZf7D7oMYel9XZOEM9GF80rBW2+ixK7pccDyDFco3p+vGhzqruP5lYfN8oSCP2VSuZqvMrZQJhUIoPZE5GAo3y55ObRAZ9k+Fw0MdVfJBdLzWg1MVZgvIyjr56YmjuVwHA4ScaL6yXJU85RtgBz5TF+BM1HmYXOOwDPhn6TxbJVB4qXbCsJuX7t7k5WlRxpIHchz6YSxP1IYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eyHJM/XB9UyoPZnhX7laqyMoe+H9DU7nM/b3lw43Krw=;
 b=ZgAJ+j842jkDW7S+0tOSAIHkqG99ugLGRXIiTM9Ck9dvikdphVmMwExqPpweDlHeYmIQDzk/nYw9P8ZbQBG3QdxNhgDXb+PQQDsqnW0+ixnLrImYig/9ltwJdDUu93Q6LBAJt/eRKMXBBx0fbIFZ0xp5D20Fmddmg6xr/giaT2hQ4w1dkf0KNxxKbCwWHveudDZiy6WFSPzxzlgJwNfsaxE2LbZD28OcfZe3VJCvDUoYFZ38UWxotX+1kCyZDsAwk8PGGNmyNaDGTezFTpJeFAokv4gLUNkHqiD/4LBUcD9ACx3q3DWFi7l7JO0arbaEOEI51noF866BwYVXVa3T6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eyHJM/XB9UyoPZnhX7laqyMoe+H9DU7nM/b3lw43Krw=;
 b=47S0YALwxJV3TgNaBH+VI53yBTw+oq6/x6BK3osALYblgzuJrkZ+lddS+63SNmq2yKv+js8JolIwT0RKDXaDiZ1OYRrs8evEpeUy09QfWpaALULLgkcTI9hBZ2tAEYptFZamAjLLIJnLRCuyTmtE8njcBjNgcgJhbdLrho14bnc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [XEN] xen/arm: arm32: Use adr_l instead of load_paddr for getting address of symbols
Date: Wed, 25 Oct 2023 18:03:04 +0100
Message-ID: <20231025170304.2331922-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|SJ0PR12MB7082:EE_
X-MS-Office365-Filtering-Correlation-Id: 4384aa27-6df3-4e4e-c323-08dbd57c4a2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9rt82m8kHQe/UsDbPyyXFghDvsyrnpQPfBsNrg1u9rmJEBLsxlxRTbhsSszRp4rCoVJheJPKcOJI0vlEmI3wym8Vmql3XoiYnNDTyg+E4qkeSz1mfdL2ezARTNR6yFDFR1n1Bj/agaYcjxEJRvXUlt1rvGcL+f4WWEPsb4kz6LIJ6OI8vb1RHuW51XdAj//uyl43Tjwmki3JjnWE4F7JJ8q2feCX2v3xJYO1UhjAd4yyCG/U7gGaPBIlxodyAN5x86stVUofNJXxNqlZfFW/1ZzJZQw+4qX+yXYVHwOIusTG6nXbl20S5Z26GKL0jixN38Y2dj8xFoAtwsJM0PSDoQkp8xJL+tnc2Vi6T9V23ndqi1PAb51RFFh2UW+P/cUfL/6tXGM1HKKZLZRZLuzxToQKlrTNE9P1OUQ1S4E7bIq1paQf0Jf0voxPlpRIAVba4nhpCGjiPZ/JsktXAb9POe0JqH3aOocPYkZJj9joiOPiivZDRo470fBCsER46ummGiao2lvVts57ZtpbccmrGUoIDdFgkMOLGmDRxRMC2CDuV6rcXbWsnqf0q5z4QjaQq3kr2QJeDew5A6UQCUIo3prDVPvHBnrqsuvp8FgtAWGbECKrqadKM526QnRJK95jpw/iwi75uML3O0jiHni7ZWt9/p3AvrDH3ZZ54JkGq25HyC3Hw3w89/Qg9DCOT0gE2yt7zpJet4qd2wN2PzmHdoBRnA7TsqA45DsjJDGzNpZdj/ffSelTLbLse5bIoZ4qJbjY/kTjGPlv02LOEyz75A==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(136003)(346002)(39860400002)(396003)(230922051799003)(186009)(64100799003)(1800799009)(82310400011)(451199024)(40470700004)(36840700001)(46966006)(40460700003)(2906002)(2616005)(426003)(316002)(1076003)(356005)(83380400001)(26005)(82740400003)(103116003)(86362001)(70206006)(6666004)(70586007)(478600001)(966005)(47076005)(336012)(81166007)(36860700001)(5660300002)(40480700001)(8676002)(41300700001)(54906003)(36756003)(8936002)(4326008)(6916009)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 17:03:19.9162
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4384aa27-6df3-4e4e-c323-08dbd57c4a2b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7082

Before the MMU is turned on, the address returned for any symbol will always be
physical address. Thus, one can use adr_l instead of load_paddr.

create_table_entry() now takes an extra argument to denote if it is called after
the mmu is turned on or not.  If it is called with mmu on, then it uses
load_paddr to get the physical address of the page table symbol.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Refer https://lists.archive.carbon60.com/xen/devel/682900 for details.

 xen/arch/arm/arm32/head.S | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 33b038e7e0..bf442b0434 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -171,7 +171,7 @@ past_zImage:
 
         /* Using the DTB in the .dtb section? */
 .ifnes CONFIG_DTB_FILE,""
-        load_paddr r8, _sdtb
+        adr_l r8, _sdtb
 .endif
 
         /* Initialize the UART if earlyprintk has been enabled. */
@@ -213,7 +213,7 @@ GLOBAL(init_secondary)
         mrc   CP32(r1, MPIDR)
         bic   r7, r1, #(~MPIDR_HWID_MASK) /* Mask out flags to get CPU ID */
 
-        load_paddr r0, smp_up_cpu
+        adr_l r0, smp_up_cpu
         dsb
 2:      ldr   r1, [r0]
         cmp   r1, r7
@@ -406,6 +406,7 @@ ENDPROC(cpu_init)
  * tbl:     table symbol to point to
  * virt:    virtual address
  * lvl:     page-table level
+ * mmu_on:  is mmu on
  *
  * Preserves \virt
  * Clobbers r1 - r4
@@ -414,10 +415,14 @@ ENDPROC(cpu_init)
  *
  * Note that \virt should be in a register other than r1 - r4
  */
-.macro create_table_entry, ptbl, tbl, virt, lvl
+.macro create_table_entry, ptbl, tbl, virt, lvl, mmu_on
+    .if \mmu_on == 1
         load_paddr r4, \tbl
-        create_table_entry_from_paddr \ptbl, r4, \virt, \lvl
- .endm
+    .else
+        adr_l r4, \tbl
+    .endif
+    create_table_entry_from_paddr \ptbl, r4, \virt, \lvl
+.endm
 
 /*
  * Macro to create a mapping entry in \tbl to \paddr. Only mapping in 3rd
@@ -479,7 +484,7 @@ create_page_tables:
          * create_table_entry_paddr() will clobber the register storing
          * the physical address of the table to point to.
          */
-        load_paddr r5, boot_third
+        adr_l r5, boot_third
         mov_w r4, XEN_VIRT_START
 .rept XEN_NR_ENTRIES(2)
         mov   r0, r5                        /* r0 := paddr(l3 table) */
@@ -522,8 +527,8 @@ create_page_tables:
          * Setup the 1:1 mapping so we can turn the MMU on. Note that
          * only the first page of Xen will be part of the 1:1 mapping.
          */
-        create_table_entry boot_pgtable, boot_second_id, r9, 1
-        create_table_entry boot_second_id, boot_third_id, r9, 2
+        create_table_entry boot_pgtable, boot_second_id, r9, 1, 0
+        create_table_entry boot_second_id, boot_third_id, r9, 2, 0
         create_mapping_entry boot_third_id, r9, r9
 
         /*
@@ -537,7 +542,7 @@ create_page_tables:
         bne   use_temporary_mapping
 
         mov_w r0, XEN_VIRT_START
-        create_table_entry boot_pgtable, boot_second, r0, 1
+        create_table_entry boot_pgtable, boot_second, r0, 1, 0
         mov   r12, #0                /* r12 := temporary mapping not created */
         mov   pc, lr
 
@@ -551,7 +556,7 @@ use_temporary_mapping:
 
         /* Map boot_second (cover Xen mappings) to the temporary 1st slot */
         mov_w r0, TEMPORARY_XEN_VIRT_START
-        create_table_entry boot_pgtable, boot_second, r0, 1
+        create_table_entry boot_pgtable, boot_second, r0, 1, 0
 
         mov   r12, #1                /* r12 := temporary mapping created */
         mov   pc, lr
@@ -578,7 +583,7 @@ enable_mmu:
         flush_xen_tlb_local r0
 
         /* Write Xen's PT's paddr into the HTTBR */
-        load_paddr r0, boot_pgtable
+        adr_l r0, boot_pgtable
         mov   r1, #0                 /* r0:r1 is paddr (boot_pagetable) */
         mcrr  CP64(r0, r1, HTTBR)
         isb
@@ -658,7 +663,7 @@ switch_to_runtime_mapping:
 
         /* Map boot_second into boot_pgtable */
         mov_w r0, XEN_VIRT_START
-        create_table_entry boot_pgtable, boot_second, r0, 1
+        create_table_entry boot_pgtable, boot_second, r0, 1, 1
 
         /* Ensure any page table updates are visible before continuing */
         dsb   nsh
@@ -739,7 +744,7 @@ setup_fixmap:
 #endif
         /* Map fixmap into boot_second */
         mov_w r0, FIXMAP_ADDR(0)
-        create_table_entry boot_second, xen_fixmap, r0, 2
+        create_table_entry boot_second, xen_fixmap, r0, 2, 0
         /* Ensure any page table updates made above have occurred. */
         dsb   nshst
         /*
@@ -897,8 +902,8 @@ ENTRY(lookup_processor_type)
  */
 __lookup_processor_type:
         mrc   CP32(r0, MIDR)                /* r0 := our cpu id */
-        load_paddr r1, __proc_info_start
-        load_paddr r2, __proc_info_end
+        adr_l r1, __proc_info_start
+        adr_l r2, __proc_info_end
 1:      ldr   r3, [r1, #PROCINFO_cpu_mask]
         and   r4, r0, r3                    /* r4 := our cpu id with mask */
         ldr   r3, [r1, #PROCINFO_cpu_val]   /* r3 := cpu val in current proc info */
-- 
2.25.1


