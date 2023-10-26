Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5DE7D8195
	for <lists+xen-devel@lfdr.de>; Thu, 26 Oct 2023 13:12:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.623710.971813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvyI5-0001hd-TU; Thu, 26 Oct 2023 11:12:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 623710.971813; Thu, 26 Oct 2023 11:12:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvyI5-0001fI-QZ; Thu, 26 Oct 2023 11:12:41 +0000
Received: by outflank-mailman (input) for mailman id 623710;
 Thu, 26 Oct 2023 11:12:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=v+j7=GI=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qvyI4-0001fC-Ac
 for xen-devel@lists.xenproject.org; Thu, 26 Oct 2023 11:12:40 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20603.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91edd35c-73f0-11ee-9b0e-b553b5be7939;
 Thu, 26 Oct 2023 13:12:37 +0200 (CEST)
Received: from MN2PR10CA0032.namprd10.prod.outlook.com (2603:10b6:208:120::45)
 by DS7PR12MB5766.namprd12.prod.outlook.com (2603:10b6:8:75::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.25; Thu, 26 Oct
 2023 11:12:33 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:208:120:cafe::5d) by MN2PR10CA0032.outlook.office365.com
 (2603:10b6:208:120::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19 via Frontend
 Transport; Thu, 26 Oct 2023 11:12:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.15 via Frontend Transport; Thu, 26 Oct 2023 11:12:32 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 26 Oct
 2023 06:12:31 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via
 Frontend Transport; Thu, 26 Oct 2023 06:12:30 -0500
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
X-Inumbo-ID: 91edd35c-73f0-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nvFAc0wxZ6J6qzcPFP5+sU7gv0xivSCIBy1B583Yg16dI42AlwWDwvNagLlSlpxiBQNZwbxbQvgmUCPnwrqc+FYAUuqxyXNjVZddprvKsoZaDM6mtGC5YJVOlkC2724coZGZYnGp8gyz2kKF7x0BZ2rwOP5AV3PU7D0hHTclQuTSx1q9BKXnCkjhgl7k3HkpPdZxR/p6Fb+9An+lx1BfVxcMkWo/iqV5fT2byQwg+dP216jPXDV72Pr3S/GVHifNj6ELB9/mfThYnas+ALIXaEKv5zIAGZ7qmsDbqqJqMQtFGdR88s4KiKSR9H6Ic1Z1C6kpqOcj2JCuWU8x4MuJyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bu0XMjhxMP6timxPh7gDT0on9fDPrVaAmCnLeZEdkGk=;
 b=HRtLOpWKKUMQcRj5TwQ1M5AlTtTQrPjGnYwPHNsoo56/jZINnbuEqbX1/+QggV7p3ICgKFax+KwbEI/fq/Dn2AmQG9MqBMQDtdVy2laHPTypil4z9EtH7sb164k3CdBOx9L2yC9kZm9GLdQgsyB/eRN8bvG3aSWru7udXMqgb2Jf9kDayUv8/dIuWIjBrkfdYqI13q52MRx/ffcca2w1RwFkc+qhxzRohw+7ZAUp3hqBeAQ/n0Wb7vDPBIKgCeBkjDHQtaYPUgDqpDmuBBaxQPoTEgSqb4x/LAiOvF/c4IlhEDD7Zl710deCk9B304kFJtPM+W5+ukuP4iHTtMb+qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bu0XMjhxMP6timxPh7gDT0on9fDPrVaAmCnLeZEdkGk=;
 b=OyQTXACynKHO/Lse9cLu26gGXKN+3au3GlQbZAJKe8wjn0Oe8PuP2GrLIIjtwdE8snBN6Fha36Ousnnpa4WFq89IhSR51elQQp32L9SwvJAk1S2tiXI7IBAJxdHUis7RWSr3eY5YVlvpurCfVHjYhAsODpiPmd7cDOkfOjujDNA=
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
Subject: [XEN v2] xen/arm: arm32: Use adr_l instead of load_paddr for getting address of symbols
Date: Thu, 26 Oct 2023 12:12:28 +0100
Message-ID: <20231026111228.2724962-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|DS7PR12MB5766:EE_
X-MS-Office365-Filtering-Correlation-Id: 823291fa-515e-49cd-6a86-08dbd6147374
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	M3XcwFTrulEdy7YTVEZiT6LkaI07lQLMHVdwnLVzt5E/Skqu5NYcv0bHFhvUrw8z1/N7yG5o4/GigKjtmskz7c1Xte/UT4E6GW6jfayOmIPmbYmVe2+urmojjfPUgqD46lsMIt2x1nLHHyVwqRyw25/CyTSWGaLPy3HLvFEhSvm6tkIPU1VcLS7k1y8fMTmei+XjHqm13M1zYBGHLqS3xuMswTQC5wBzmezGLWkAtAEbQQ+OyIifqDrk8jVjcJCIyzEvr5Dj6SLbyfYog06E/hl/26EjijchLRUSQllznZJk0P6S2+fFuc76iDqNJZmDQPHqTbg1CJFcNNBCLBDovtdRUCJ4HlqXHrxXDW+UWdB5rm3DS6Ee6L+pO27ODE0ofXWp8BmbI7sanbM48GdcOTk6EsRwp7v1ZAm2SCQn7yXwu15Ywj7m554J2J1hrkFtROywT9lMFGpZBjO01CHNcuZa965SGWYNFOMg8G5/P+/Fbr5LsJF95MQJYKqq9NAg3isgWMn2c4Rqdm9uJrHXbaMimTYHFVXON9kq8TmEkNyPNOW0LXVmMX9+MCDtBk37MdAVE7j9oePKahAz3djo0craWyaC5ZAwaTcDUK+82/nXWpT7jJIFRsLfKIZr5IDT76LgphpIefq/IiK83X0/Ii3+FMkX8K4V7E1zuUUOyyxDxywBJKS/rgxS3o2gZJQElZtJZvJljgZgve+KiOsIENc6KadifQo+Lte8THmzHjyPfeJXkDuk1sBCvO61B78tVIp4nhANZqHCD5WW37m75g==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(346002)(136003)(39860400002)(230922051799003)(1800799009)(64100799003)(186009)(82310400011)(451199024)(46966006)(40470700004)(36840700001)(40480700001)(40460700003)(356005)(966005)(70206006)(81166007)(478600001)(316002)(82740400003)(70586007)(6916009)(36756003)(8676002)(103116003)(54906003)(83380400001)(2906002)(47076005)(8936002)(336012)(36860700001)(4326008)(426003)(5660300002)(41300700001)(2616005)(26005)(1076003)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2023 11:12:32.7287
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 823291fa-515e-49cd-6a86-08dbd6147374
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5766

Before the MMU is turned on, PC uses physical address. Thus, one can use adr_l
instead of load_paddr to obtain the physical address of a symbol.

The only exception (for this replacement) is create_table_entry() which is
called before and after MMU is turned on.

Also, in lookup_processor_type() "r10" is no longer used. The reason being
__lookup_processor_type uses adr_l (thus r10 is no longer used to obtain the
physical address offset).

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Refer https://lists.archive.carbon60.com/xen/devel/682900 for details.

Changes from :-

v1 :- 1. No need to modify create_table_entry().
2. Remove "mov   r10, #0 " in lookup_processor_type().

 xen/arch/arm/arm32/head.S | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 33b038e7e0..e0ff46e92f 100644
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
@@ -479,7 +479,7 @@ create_page_tables:
          * create_table_entry_paddr() will clobber the register storing
          * the physical address of the table to point to.
          */
-        load_paddr r5, boot_third
+        adr_l r5, boot_third
         mov_w r4, XEN_VIRT_START
 .rept XEN_NR_ENTRIES(2)
         mov   r0, r5                        /* r0 := paddr(l3 table) */
@@ -578,7 +578,7 @@ enable_mmu:
         flush_xen_tlb_local r0
 
         /* Write Xen's PT's paddr into the HTTBR */
-        load_paddr r0, boot_pgtable
+        adr_l r0, boot_pgtable
         mov   r1, #0                 /* r0:r1 is paddr (boot_pagetable) */
         mcrr  CP64(r0, r1, HTTBR)
         isb
@@ -877,7 +877,6 @@ putn:   mov   pc, lr
 /* This provides a C-API version of __lookup_processor_type */
 ENTRY(lookup_processor_type)
         stmfd sp!, {r4, r10, lr}
-        mov   r10, #0                   /* r10 := offset between virt&phys */
         bl    __lookup_processor_type
         mov r0, r1
         ldmfd sp!, {r4, r10, pc}
@@ -897,8 +896,8 @@ ENTRY(lookup_processor_type)
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


