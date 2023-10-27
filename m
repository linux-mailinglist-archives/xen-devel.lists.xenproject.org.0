Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A27D7D9F65
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 20:09:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624613.973192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwRF8-0000sp-Ic; Fri, 27 Oct 2023 18:07:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624613.973192; Fri, 27 Oct 2023 18:07:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwRF8-0000pU-Fj; Fri, 27 Oct 2023 18:07:34 +0000
Received: by outflank-mailman (input) for mailman id 624613;
 Fri, 27 Oct 2023 18:07:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cQhv=GJ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qwRF6-0000pO-V7
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 18:07:33 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20627.outbound.protection.outlook.com
 [2a01:111:f400:7e88::627])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b112321a-74f3-11ee-98d6-6d05b1d4d9a1;
 Fri, 27 Oct 2023 20:07:30 +0200 (CEST)
Received: from CY8P222CA0022.NAMP222.PROD.OUTLOOK.COM (2603:10b6:930:6b::15)
 by IA0PR12MB7652.namprd12.prod.outlook.com (2603:10b6:208:434::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.47; Fri, 27 Oct
 2023 18:07:26 +0000
Received: from CY4PEPF0000E9D2.namprd03.prod.outlook.com
 (2603:10b6:930:6b:cafe::d6) by CY8P222CA0022.outlook.office365.com
 (2603:10b6:930:6b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.24 via Frontend
 Transport; Fri, 27 Oct 2023 18:07:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D2.mail.protection.outlook.com (10.167.241.145) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6933.19 via Frontend Transport; Fri, 27 Oct 2023 18:07:25 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 27 Oct
 2023 13:07:25 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 27 Oct
 2023 13:07:24 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via
 Frontend Transport; Fri, 27 Oct 2023 13:07:24 -0500
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
X-Inumbo-ID: b112321a-74f3-11ee-98d6-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P59YC14NHj4UDf9tMuTJbqdUABQTq1rFJReBnkqg1dC9flHpGTT8HQDjPvkhHNDx6IOI0KUCaK4CsjypnSJ1VolO+XDKncvKK7Tg8djxOE515ikIXXbMA76I4tJ3uIdvyaztvcSyCBcJK7IFBRJEhBDg8M8kCdt0FwMBFegD6nRsiCZl94FB0qaBRNAljKHx/BsM9EsA8PzOqIkee9fN+X6d5ZHvo8yb7iCyMIYBpjDL/BQAAdclL77y0PBA7/E6U/kUHZ7NJNuJKt7C5sqo9rAxksxTH2YoXsxGT0lpzpwNB4wwT5U8pReBtIRRKYGtKeUuj7IAllwfnj4IFgsltQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=83quyAosQOtu5va1SRSOx1l+J26kwo4vlcwl/4hDc3s=;
 b=KBSFHfiCYV9KPZiukPROlsw0Bgs0x/I0GXpKS/wm6giWWk70/1IJe6bAT354cBkyJC+ULWoIsHKEvyQZ7hsswCakZySzgVkqa6jGFyKE0PHUlWlCPXeSMDM6r8+ALUiXOsX3WbUz3X2urs0fNBYG2xMzZJ+Zga+axb8upMimOSTENElrXb1S8jjgH41XwE6541yPZAUIsJmRkv7KiXFTukJwuT9ltgpk2rH0MNIv8JQVfJhuvGtyhB2ftTeTTCgV1qj4L1tCbkqOKsQfNe5ixg6twgUX5n6VZgMBg38GVDFlievMVwUQvb+ORmyRaZbKXUnvha/66aVCb+lSOu3jBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=83quyAosQOtu5va1SRSOx1l+J26kwo4vlcwl/4hDc3s=;
 b=joVgM6DXcbWzZOOkrHVn1iFQIsauuLr1gjtg2fgUjlL7K4f6S9gZefXDGgfQm5EEcctyBEn6V2mOILQXH4bqvOH02Oc3xBIBKdUS37q0ZwGwzDZr3J6d0iDcANYTOJaO4ohKLu9NwnDK+YmMZWE5//WcbLCE/f84D6awmerzMqw=
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
Subject: [XEN v3] xen/arm32: head: Replace load_paddr with adr_l when they are equivalent
Date: Fri, 27 Oct 2023 19:07:15 +0100
Message-ID: <20231027180715.3484439-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D2:EE_|IA0PR12MB7652:EE_
X-MS-Office365-Filtering-Correlation-Id: 8352d35c-ca49-4801-0274-08dbd7179342
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HZw8qShpUzfTv8OLCs+bElsonVOTXgbSu5iCRAZa4/wjgTgcbiY9gTQt/vQVOJZ1KHzDtwciJ+kc3K2AjRWfxtHipYzcbXbwEzA6Won5wX2Mp/fvSsAZxS1/YjRM+MuoyF4nKwZWlx7C/s4UgPkv4LR9dAtb7ZSy4R6NV65LXxBertM+77Ndi9Iz1JQbZPqZwCzpzczVIdT+M0n2I7lu7oktacBnf1dE5vITAqQiJzekHtA94k/mbYKYr8ZPGrEVZ/gYMCyk+atXYL3aA7ZgI3ZjrTGh6uvWjakliRG+2QLMlM/AOZpJ3obUDoAixNMyHTwz3xmcMI5MDXXewwq/2T3N6qWIFzRPEkhmq6SsBQV8e+c/D0Gp9kjtiSV/lAHv3CImJIhzjGRThlem0dHryTQbd10cA3zcx91XcG00+427rhy67mwkViRndZx+oufXekT0q7hMj8G38v69J9myjQdnZiGFxvdh54ZGlO+MZ9/eIk5cSeDG5jxqYbJvxtSzEXYD0V8nz8ucZOoe23/BUV5alcobyH0wW+iHm3CbBmIv3ZuVcgiNzknqcUBDuHCnxgr7rB9QWtReGCk0GtOm+9fpoAVMtF+74foNU8D8T5HM8AkpCDQMsxO2ySvJ3804OVuDwPxwTk1afHyk+sql3ktANZhHfPHsOLIUjds+Pf3SXpEQFPENZ25qORN85nsVclYQmLQN1s8K9KNFe8WmOL7H438O/qPMlnIl32CVjsxEEghpE9RWdm3eQZHaJrtaZVpbcqNEGv7vmOKS+i/UOmAyenLqPTcneZ9JMMyvBy2Z7s4QLmf3FY86j7f8Ckop
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(346002)(376002)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(82310400011)(40470700004)(46966006)(36840700001)(70206006)(40460700003)(86362001)(47076005)(36860700001)(336012)(6666004)(1076003)(54906003)(83380400001)(26005)(4326008)(426003)(316002)(8676002)(478600001)(70586007)(2906002)(5660300002)(966005)(8936002)(356005)(6916009)(81166007)(82740400003)(41300700001)(40480700001)(2616005)(103116003)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2023 18:07:25.6603
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8352d35c-ca49-4801-0274-08dbd7179342
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7652

Before the MMU is turned on, PC uses physical address. Thus, one can use adr_l
instead of load_paddr to obtain the physical address of a symbol.

The only exception (for this replacement) is create_table_entry() which is
called before and after MMU is turned on.

Also, in lookup_processor_type() "r10" is no longer used. The reason being
__lookup_processor_type uses adr_l (thus r10 is no longer used to obtain the
physical address offset). Consequently, there is no need to save/restore r10.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Refer https://lists.archive.carbon60.com/xen/devel/682900 for details.

Changes from :-

v1 :- 1. No need to modify create_table_entry().
2. Remove "mov   r10, #0 " in lookup_processor_type().

v2 :- 1. No need to save/restore r10 in lookup_processor_type().
2. Update the commit message title.

 xen/arch/arm/arm32/head.S | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 33b038e7e0..1fcc6f745e 100644
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
@@ -876,11 +876,10 @@ putn:   mov   pc, lr
 
 /* This provides a C-API version of __lookup_processor_type */
 ENTRY(lookup_processor_type)
-        stmfd sp!, {r4, r10, lr}
-        mov   r10, #0                   /* r10 := offset between virt&phys */
+        stmfd sp!, {r4, lr}
         bl    __lookup_processor_type
         mov r0, r1
-        ldmfd sp!, {r4, r10, pc}
+        ldmfd sp!, {r4, pc}
 
 /*
  *  Read processor ID register (CP#15, CR0), and Look up in the linker-built
@@ -888,8 +887,6 @@ ENTRY(lookup_processor_type)
  * the __proc_info lists since we aren't running with the MMU on (and therefore,
  * we are not in correct address space). We have to calculate the offset.
  *
- * r10: offset between virt&phys
- *
  * Returns:
  * r0: CPUID
  * r1: proc_info pointer
@@ -897,8 +894,8 @@ ENTRY(lookup_processor_type)
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


