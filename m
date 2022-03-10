Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3F24D50D6
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 18:45:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288558.489358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSMqm-0002y8-Rg; Thu, 10 Mar 2022 17:45:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288558.489358; Thu, 10 Mar 2022 17:45:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSMqm-0002vf-NN; Thu, 10 Mar 2022 17:45:20 +0000
Received: by outflank-mailman (input) for mailman id 288558;
 Thu, 10 Mar 2022 17:45:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i5Vk=TV=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nSMql-0002fW-7i
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 17:45:19 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20625.outbound.protection.outlook.com
 [2a01:111:f400:7eae::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d8db92ae-a099-11ec-853a-5f4723681683;
 Thu, 10 Mar 2022 18:45:17 +0100 (CET)
Received: from DM5PR18CA0086.namprd18.prod.outlook.com (2603:10b6:3:3::24) by
 DM6PR02MB6619.namprd02.prod.outlook.com (2603:10b6:5:217::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5038.15; Thu, 10 Mar 2022 17:45:15 +0000
Received: from DM3NAM02FT022.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:3:cafe::33) by DM5PR18CA0086.outlook.office365.com
 (2603:10b6:3:3::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22 via Frontend
 Transport; Thu, 10 Mar 2022 17:45:14 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 DM3NAM02FT022.mail.protection.outlook.com (10.13.5.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5061.22 via Frontend Transport; Thu, 10 Mar 2022 17:45:14 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 10 Mar 2022 17:45:13 +0000
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 10 Mar 2022 17:45:13 +0000
Received: from [10.108.8.223] (port=47674 helo=xcbayankuma41x.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nSMqf-00062C-3L; Thu, 10 Mar 2022 17:45:13 +0000
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
X-Inumbo-ID: d8db92ae-a099-11ec-853a-5f4723681683
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GEqoDXRq0PGYOS+xORDtKTIJ+k5Opg4gAO9tXJ/rpuBJt9gvSiqlHh+He+DrOo6pImL9rRn0QOONyBqt0LAGRu1J1nZdmVYIKjN+JXKG14yUfua3IYB7VWm7YhW3jvkamTUgxPnzoTodU8B7d8NR6Gp/QcvhsdHv7qo+6+le0xpbO3Xz+QafdLY2JhrgCt2aGWnxI5KF+7JsvR9uBAkreRzB4xUG40W3M862yt3pNoXuOH923mwWjwKuBljxy0Pryw8MIIDHuwCMtMe6+jKKrUQhqd0scbpG8KqqSGkqPVvuIuGfKZO/+owmw3NEKDz5TsB0L4ETRuo4eiCmRTKRsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Frs8haldHJhErbGXIyYNEdcgB/b9gbBfW73XjCo47n4=;
 b=nSX+Omjfyn0Fx+Qe+cABbQ9uoXe8D/B8zpGioL+ccahEaHKLVRL1mRYUULUahVo/aZ/5ErkdPAL9D2Z4O4QNU/2TRXXvurNWqyEIS2pX4PPO2WfULOfmja/MIE7QuFukcNVTjY+qroOCQyCk0+hW842w5avL4oQuomtzF8tQ/MXALJYXH+rg56/41wWAnNMgE/G9puXIzZNiXundtiCAsD2f9vdQ8MOVC+3tdgyXSwF6yIJY0HEZU2aUq6XGIYo0CErVP3jN/9WgCxwP9B4fCluxqrPX4OZ1w7S/v11uIFedOnb1lez452eYeZQMOr0hCoQ6F/PS0uZTdUpODfvP5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Frs8haldHJhErbGXIyYNEdcgB/b9gbBfW73XjCo47n4=;
 b=nmHDbadIgx1a6vM0Bb9rtwkMIjIsqVOdwTh57nW94fuwr7Nb9/BpBaXvhXSJNjfm3IscYZ7xqRDMn04F2opz4u4JfSkVAXGK2X8LxkYHh/XzTEbDQDlx1trUYA/A1ViDmRn9m+GFEr06OC7E+Y+pkwCgC3VfaFkas0P6D6yVGEQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <paul@xen.org>, <roger.pau@citrix.com>, Ayan Kumar Halder
	<ayankuma@xilinx.com>
Subject: [XEN v10 1/4] xen/arm64: Decode ldr/str post increment operations
Date: Thu, 10 Mar 2022 17:44:58 +0000
Message-ID: <20220310174501.62040-2-ayankuma@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220310174501.62040-1-ayankuma@xilinx.com>
References: <20220310174501.62040-1-ayankuma@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1e0c61c6-b68a-4452-9681-08da02bdbba4
X-MS-TrafficTypeDiagnostic: DM6PR02MB6619:EE_
X-Microsoft-Antispam-PRVS:
	<DM6PR02MB661997980819ED811F2FDE75B20B9@DM6PR02MB6619.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p80tPSOVy/PihOFTDCgwWBYYFG9yw6jw/L9ZBWuORcAQDbm5TkOE1BziyWfpfa/rse6St8JUMH+nlNnfmXlhDN4rxT16H0Cl0WklwKnRZxP7gGLOi1pe098dkf+k7zn0OtDL7nCTZ/0BW6zuwbd/K2D7e+2/KZsGxdvPOTFPh4NAH9xBTtT+5lW8Y53wc5a5A3GHdiqh7Fy+DZmc0JJW+0cizPjFGTqxAQs1Xvt3GgJtIFdVGv3Z0o0uAb3zHXtOdjAVCs7BpO4zhNJWzW2l5XbYQYTL1ugzPKjLigD3qmAWvOM5yDRHC0Z5u7tz6eQUGoywL2d7zVvj1zfwoMMjv3SVcIT5Beq7a/0GBXLotvAGChoL9eXQb3Fbb4chUH5ovFzqiIOWxb3FxSZKFzIInTLfuKvOhDymJCk3RAjgMYaRRZ1pQ57MzyPwrjbUTtEnjz+Kfqes+RLj76uYZbiC3iBTposVSqT0VaufiwwPCDItidshZmEqCYVSdUJReC51DcVJMi1bRROF/gP3sBbccUzRaZUWk0CaXIDDEzXVf14FpwBeYINlIIlCu0HuAwoDDYqqZM766HMsETDKTrCzlNlIwWzS2O2Z0BJZZEqL89nzjsSJpggWpZITgHbREYGVmVitK99eK+jDSQD7sZg9r+MgLFfHb9kl/okStvm3Pu4G4oxVhOurmuxqjDuDYPYK98c6K/EzpGRxKvtwDFkh9A==
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(426003)(1076003)(26005)(336012)(40460700003)(356005)(7636003)(83380400001)(2906002)(8936002)(5660300002)(36756003)(9786002)(7416002)(36860700001)(54906003)(6916009)(186003)(508600001)(107886003)(70586007)(70206006)(6666004)(7696005)(8676002)(2616005)(47076005)(316002)(82310400004)(4326008)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 17:45:14.4203
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e0c61c6-b68a-4452-9681-08da02bdbba4
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT022.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6619

At the moment, Xen does not decode any of the arm64 instructions. This
means that when hsr_dabt.isv == 0, Xen cannot handle those instructions.
This will lead to Xen to abort the guests (from which those instructions
originate).

With this patch, Xen is able to decode ldr/str post indexing instructions.
These are a subset of instructions for which hsr_dabt.isv == 0.

The following instructions are now supported by Xen :-
1.      ldr     x2,    [x1],    #8
2.      ldr     w2,    [x1],    #-4
3.      ldr     x2,    [x1],    #-8
4.      ldr     w2,    [x1],    #4
5.      ldrh    w2,    [x1],    #2
6.      ldrb    w2,    [x1],    #1
7.      str     x2,    [x1],    #8
8.      str     w2,    [x1],    #-4
9.      strh    w2,    [x1],    #2
10.     strb    w2,    [x1],    #1

In the subsequent patch, decode_arm64() will get invoked when
hsr_dabt.isv == 0.

Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
---

Changelog :-

v2..v5 - Mentioned in the cover letter.

v6 - 1. Fixed the code style issues as mentioned in v5.

v7 - No change.

v8 - 1. Removed some un-necessary header files inclusion.
     2. Some style changes pointed out in v7.

v9 - 1. Rebased on top of the master.
     2. Renamed psr_mode_is_32bit to regs_mode_is_32bit.

v10 - 1. No change.

 xen/arch/arm/decode.c           | 79 ++++++++++++++++++++++++++++++++-
 xen/arch/arm/decode.h           | 48 +++++++++++++++++---
 xen/arch/arm/include/asm/mmio.h |  4 ++
 xen/arch/arm/io.c               |  2 +-
 4 files changed, 124 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
index 792c2e92a7..3add87e83a 100644
--- a/xen/arch/arm/decode.c
+++ b/xen/arch/arm/decode.c
@@ -84,6 +84,78 @@ bad_thumb2:
     return 1;
 }
 
+static int decode_arm64(register_t pc, mmio_info_t *info)
+{
+    union instr opcode = {0};
+    struct hsr_dabt *dabt = &info->dabt;
+    struct instr_details *dabt_instr = &info->dabt_instr;
+
+    if ( raw_copy_from_guest(&opcode.value, (void * __user)pc, sizeof (opcode)) )
+    {
+        gprintk(XENLOG_ERR, "Could not copy the instruction from PC\n");
+        return 1;
+    }
+
+    /*
+     * Refer Arm v8 ARM DDI 0487G.b, Page - C6-1107
+     * "Shared decode for all encodings" (under ldr immediate)
+     * If n == t && n != 31, then the return value is implementation defined
+     * (can be WBSUPPRESS, UNKNOWN, UNDEFINED or NOP). Thus, we do not support
+     * this. This holds true for ldrb/ldrh immediate as well.
+     *
+     * Also refer, Page - C6-1384, the above described behaviour is same for
+     * str immediate. This holds true for strb/strh immediate as well
+     */
+    if ( (opcode.ldr_str.rn == opcode.ldr_str.rt) && (opcode.ldr_str.rn != 31) )
+    {
+        gprintk(XENLOG_ERR, "Rn should not be equal to Rt except for r31\n");
+        goto bad_loadstore;
+    }
+
+    /* First, let's check for the fixed values */
+    if ( (opcode.value & POST_INDEX_FIXED_MASK) != POST_INDEX_FIXED_VALUE )
+    {
+        gprintk(XENLOG_ERR,
+                "Decoding instruction 0x%x is not supported\n", opcode.value);
+        goto bad_loadstore;
+    }
+
+    if ( opcode.ldr_str.v != 0 )
+    {
+        gprintk(XENLOG_ERR,
+                "ldr/str post indexing for vector types are not supported\n");
+        goto bad_loadstore;
+    }
+
+    /* Check for STR (immediate) */
+    if ( opcode.ldr_str.opc == 0 )
+        dabt->write = 1;
+    /* Check for LDR (immediate) */
+    else if ( opcode.ldr_str.opc == 1 )
+        dabt->write = 0;
+    else
+    {
+        gprintk(XENLOG_ERR,
+                "Decoding ldr/str post indexing is not supported for this variant\n");
+        goto bad_loadstore;
+    }
+
+    gprintk(XENLOG_INFO,
+            "opcode->ldr_str.rt = 0x%x, opcode->ldr_str.size = 0x%x, opcode->ldr_str.imm9 = %d\n",
+            opcode.ldr_str.rt, opcode.ldr_str.size, opcode.ldr_str.imm9);
+
+    update_dabt(dabt, opcode.ldr_str.rt, opcode.ldr_str.size, false);
+
+    dabt_instr->rn = opcode.ldr_str.rn;
+    dabt_instr->imm9 = opcode.ldr_str.imm9;
+
+    return 0;
+
+ bad_loadstore:
+    gprintk(XENLOG_ERR, "unhandled Arm instruction 0x%x\n", opcode.value);
+    return 1;
+}
+
 static int decode_thumb(register_t pc, struct hsr_dabt *dabt)
 {
     uint16_t instr;
@@ -150,10 +222,13 @@ bad_thumb:
     return 1;
 }
 
-int decode_instruction(const struct cpu_user_regs *regs, struct hsr_dabt *dabt)
+int decode_instruction(const struct cpu_user_regs *regs, mmio_info_t *info)
 {
     if ( is_32bit_domain(current->domain) && regs->cpsr & PSR_THUMB )
-        return decode_thumb(regs->pc, dabt);
+        return decode_thumb(regs->pc, &info->dabt);
+
+    if ( !regs_mode_is_32bit(regs) )
+        return decode_arm64(regs->pc, info);
 
     /* TODO: Handle ARM instruction */
     gprintk(XENLOG_ERR, "unhandled ARM instruction\n");
diff --git a/xen/arch/arm/decode.h b/xen/arch/arm/decode.h
index 4613763bdb..13db8ac968 100644
--- a/xen/arch/arm/decode.h
+++ b/xen/arch/arm/decode.h
@@ -23,19 +23,55 @@
 #include <asm/regs.h>
 #include <asm/processor.h>
 
-/**
+/*
+ * Refer to the ARMv8 ARM (DDI 0487G.b), Section C4.1.4 Loads and Stores
+ * Page 318 specifies the following bit pattern for
+ * "load/store register (immediate post-indexed)".
+ *
+ * 31 30 29  27 26 25  23   21 20              11   9         4       0
+ * ___________________________________________________________________
+ * |size|1 1 1 |V |0 0 |opc |0 |      imm9     |0 1 |  Rn     |  Rt   |
+ * |____|______|__|____|____|__|_______________|____|_________|_______|
+ */
+union instr {
+    uint32_t value;
+    struct {
+        unsigned int rt:5;     /* Rt register */
+        unsigned int rn:5;     /* Rn register */
+        unsigned int fixed1:2; /* value == 01b */
+        signed int imm9:9;     /* imm9 */
+        unsigned int fixed2:1; /* value == 0b */
+        unsigned int opc:2;    /* opc */
+        unsigned int fixed3:2; /* value == 00b */
+        unsigned int v:1;      /* vector */
+        unsigned int fixed4:3; /* value == 111b */
+        unsigned int size:2;   /* size */
+    } ldr_str;
+};
+
+#define POST_INDEX_FIXED_MASK   0x3B200C00
+#define POST_INDEX_FIXED_VALUE  0x38000400
+
+/*
  * Decode an instruction from pc
- * /!\ This function is not intended to fully decode an instruction. It
- * considers that the instruction is valid.
+ * /!\ This function is intended to decode an instruction. It considers that the
+ * instruction is valid.
  *
- * This function will get:
- *  - The transfer register
+ * In case of thumb mode, this function will get:
+ *  - The transfer register (ie Rt)
  *  - Sign bit
  *  - Size
+ *
+ * In case of arm64 mode, this function will get:
+ * - The transfer register (ie Rt)
+ * - The source register (ie Rn)
+ * - Size
+ * - Immediate offset
+ * - Read or write
  */
 
 int decode_instruction(const struct cpu_user_regs *regs,
-                       struct hsr_dabt *dabt);
+                       mmio_info_t *info);
 
 #endif /* __ARCH_ARM_DECODE_H_ */
 
diff --git a/xen/arch/arm/include/asm/mmio.h b/xen/arch/arm/include/asm/mmio.h
index 7ab873cb8f..3354d9c635 100644
--- a/xen/arch/arm/include/asm/mmio.h
+++ b/xen/arch/arm/include/asm/mmio.h
@@ -29,6 +29,10 @@
 typedef struct
 {
     struct hsr_dabt dabt;
+    struct instr_details {
+        unsigned long rn:5;
+        signed int imm9:9;
+    } dabt_instr;
     paddr_t gpa;
 } mmio_info_t;
 
diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index 1a066f9ae5..fad103bdbd 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -141,7 +141,7 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
     {
         int rc;
 
-        rc = decode_instruction(regs, &info.dabt);
+        rc = decode_instruction(regs, &info);
         if ( rc )
         {
             gprintk(XENLOG_DEBUG, "Unable to decode instruction\n");
-- 
2.17.1


