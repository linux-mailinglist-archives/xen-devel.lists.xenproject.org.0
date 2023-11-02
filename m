Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7018F7DFB15
	for <lists+xen-devel@lfdr.de>; Thu,  2 Nov 2023 20:47:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626972.977749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qydem-0004Vk-Eh; Thu, 02 Nov 2023 19:47:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626972.977749; Thu, 02 Nov 2023 19:47:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qydem-0004TH-C1; Thu, 02 Nov 2023 19:47:08 +0000
Received: by outflank-mailman (input) for mailman id 626972;
 Thu, 02 Nov 2023 19:47:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NU+V=GP=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qydel-0004TB-ES
 for xen-devel@lists.xenproject.org; Thu, 02 Nov 2023 19:47:07 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e83::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97e09686-79b8-11ee-9b0e-b553b5be7939;
 Thu, 02 Nov 2023 20:47:03 +0100 (CET)
Received: from DM6PR08CA0040.namprd08.prod.outlook.com (2603:10b6:5:1e0::14)
 by IA1PR12MB8285.namprd12.prod.outlook.com (2603:10b6:208:3f6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.30; Thu, 2 Nov
 2023 19:46:59 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:5:1e0:cafe::a3) by DM6PR08CA0040.outlook.office365.com
 (2603:10b6:5:1e0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19 via Frontend
 Transport; Thu, 2 Nov 2023 19:46:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6954.19 via Frontend Transport; Thu, 2 Nov 2023 19:46:58 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 2 Nov
 2023 14:46:58 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Thu, 2 Nov
 2023 14:46:57 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via
 Frontend Transport; Thu, 2 Nov 2023 14:46:56 -0500
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
X-Inumbo-ID: 97e09686-79b8-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eMCNcE+G6LGyIdQDLn/PaXsBDhdqjwcOGRUl67RjWIqcx7NS0vf4Kv1H9sPQYJbaaiQZK24PZ0aTTmA5xSL+HPdR58JzvHtoZcG+SeFkyaa3WjjHPAoEp0jAbaCw3zwbwfhUTjqywTb6X/+8TVbgN6yzML8IsPIWCmOMw/6kyT5A6AHZentoK2FjaoLBO7uFHJ6TO9zL/t+acWh7TM2IjKnXLel2fMUfTNWzPhkbNntW3R0lXOO14PYETtaF4+1uhKsE5/wZxuX0UN8zyEm4EQqfN2fM+QDntbCOSjwJPa17JtQekzNZXO6s0bPoYNfXazt/+y4n0TP3su/Oq+PO8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tNzcROT9UhTBzRLICl/1JgHtAA3AmFH6QDOoVTcUgss=;
 b=HVSr5DrWOA+C38nOxvLBnLJt4gKvPmQIGBMLLdN2HISZwvI3NuCAYQ+kzFHX5XRGJ3YwSoNO9TsQLI5BA1wtC/8TK+duaUPzWOYeQytpP1hsNOava/s1vk4eFtK0V+JzamdJt/jCpqDMX7I4CxFAhWUG9yPzYdF39FbB6dpeCBsHqqf12mBjBAphevK1ESArlzRiIfhfU6qcCspATbO+0dl8pKdVuGxjGBjgB0zuPYnH80xVDoG8Zpe2ihFqnS1dERJpfHW+/y1ln55Kk3IUYVQiFUuw27dpAzo5AVt0tNKgRKF/T5uiHvAE0F3J96CwDdPyNDn5ApVnME6dknje7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tNzcROT9UhTBzRLICl/1JgHtAA3AmFH6QDOoVTcUgss=;
 b=Am3vmeO2ubFzkRjM9LojURFcRg21TIST/pCGxgk6CX/VeXMUIblpToubiYwWk+3FsaFrWvBbME9S9bGoHh/MPBy91QwRG8lYbBbkP2AwIq6PX4RFeiGtd+ARrJx00q7h3dQOzLJk/6o8fSEScViReJoxkL5uMBcaM0m0PE89Ovc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [XEN v4] xen/arm32: head: Replace load_paddr with adr_l when they are equivalent
Date: Thu, 2 Nov 2023 19:46:49 +0000
Message-ID: <20231102194649.3385653-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|IA1PR12MB8285:EE_
X-MS-Office365-Filtering-Correlation-Id: e679e545-ce70-415b-7deb-08dbdbdc7a13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	w6NmNmwMLbP8rOUe8PgopovY6AlL0uLma6sHyYew+eneoaSEGnxbwKyExmnqFxGF048lTbL5NTxva3WolvkuglgNNcIxL35d8pxoChTmUBlx7taTrjcPgp2MDtnPppvYcFZFnP0EeRkBt4/Sdu0wf9btonRPGubqopP5f7PKKkkZK4I0Mt5xryEB2/Ia7zFY2wI6VwgAYRd54MigajVwl7jPaZEhBZdHpR4N0A4joYkzLMOjiWftMMCNDtvdfwn7uUdJbMD3kdJ/oNbauILsriqT+fVyo0NEoGudzGDIVCnjL2oHFazedsMjXnRccEyy1rw6lYXLe1/RP4Cw/zwuwhcD07vcLx+aDHIAq4QKLw38kNK6RbU92Mexay7vTP6RksoU7Aod/UmtfSdL9eP/FTAFRe08X1FxO1Ye7kIXfFhi1QJjZ1b0dIMrumQBfCe3wFj0QdYL7mQQJgu6PyJ2edCr5wXbfg3qRwPB/NGDP1RcQ3A43tbJYxHXfyhYFk3dxhMSpxHwp10cehsuc0XBQlA6msDIeUkpFVvQlAO9hDfLP/yB2Ot8qMT30ElLeiTJszfCbKiyjBvSV3NLlhTaAM3KkEd1BP+fOT3oXCIxcq+J2Opxo1XWc3C6DCiVwW4nA6SbUQ04iwVePK/dwFXXZB0vSxOK9GZ7WWA9Zc/s1Fyjz3Nuqsx6n6gKxPbq/W/60wQIJhJ3qJGMCJZVKxFS1MjRiA8QsPGw1lZO2zYl4O2kwr7deZCFsZL6McnDPHK9dGiN4bN9KTCI+Lf+CVRJxA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(396003)(346002)(376002)(230922051799003)(451199024)(82310400011)(186009)(1800799009)(64100799003)(46966006)(36840700001)(40470700004)(6666004)(478600001)(40460700003)(40480700001)(1076003)(2616005)(426003)(86362001)(26005)(336012)(82740400003)(966005)(83380400001)(47076005)(81166007)(36756003)(356005)(103116003)(36860700001)(41300700001)(70586007)(70206006)(54906003)(316002)(6916009)(5660300002)(8936002)(4326008)(8676002)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 19:46:58.7786
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e679e545-ce70-415b-7deb-08dbdbdc7a13
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8285

Before the MMU is turned on, PC uses physical address. Thus, one can use adr_l
instead of load_paddr to obtain the physical address of a symbol.

The only exception (for this replacement) is create_table_entry() which is
called before and after MMU is turned on.

Also, in lookup_processor_type() "r10" is no longer used. The reason being
__lookup_processor_type uses adr_l (thus r10 is no longer used to obtain the
physical address offset). Consequently, there is no need to save/restore r10.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---

Refer https://lists.archive.carbon60.com/xen/devel/682900 for details.

Changes from :-

v1 :- 1. No need to modify create_table_entry().
2. Remove "mov   r10, #0 " in lookup_processor_type().

v2 :- 1. No need to save/restore r10 in lookup_processor_type().
2. Update the commit message title.

v3 :- 1. In __lookup_processor_type(), update the comment.
Add Michal's R-b.

 xen/arch/arm/arm32/head.S | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 33b038e7e0..20e92bdb61 100644
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
@@ -876,19 +876,14 @@ putn:   mov   pc, lr
 
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
- * supported processor list. Note that we can't use the absolute addresses for
- * the __proc_info lists since we aren't running with the MMU on (and therefore,
- * we are not in correct address space). We have to calculate the offset.
- *
- * r10: offset between virt&phys
+ * supported processor list.
  *
  * Returns:
  * r0: CPUID
@@ -897,8 +892,8 @@ ENTRY(lookup_processor_type)
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


