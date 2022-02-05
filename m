Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3C84AACF0
	for <lists+xen-devel@lfdr.de>; Sat,  5 Feb 2022 23:59:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266160.459854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGU0k-0007Or-G0; Sat, 05 Feb 2022 22:58:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266160.459854; Sat, 05 Feb 2022 22:58:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGU0k-0007Mx-CS; Sat, 05 Feb 2022 22:58:30 +0000
Received: by outflank-mailman (input) for mailman id 266160;
 Sat, 05 Feb 2022 22:58:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pZml=SU=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nGU0i-0007Ml-DY
 for xen-devel@lists.xenproject.org; Sat, 05 Feb 2022 22:58:28 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20608.outbound.protection.outlook.com
 [2a01:111:f400:7eae::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ef6dd0e-86d7-11ec-8eb8-a37418f5ba1a;
 Sat, 05 Feb 2022 23:58:25 +0100 (CET)
Received: from SN6PR08CA0005.namprd08.prod.outlook.com (2603:10b6:805:66::18)
 by SN4PR0201MB8742.namprd02.prod.outlook.com (2603:10b6:806:1e9::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.11; Sat, 5 Feb
 2022 22:58:22 +0000
Received: from SN1NAM02FT0054.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:66:cafe::f9) by SN6PR08CA0005.outlook.office365.com
 (2603:10b6:805:66::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Sat, 5 Feb 2022 22:58:22 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 SN1NAM02FT0054.mail.protection.outlook.com (10.97.4.242) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Sat, 5 Feb 2022 22:58:21 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Sat, 5 Feb 2022 22:58:20 +0000
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Sat, 5 Feb 2022 22:58:20 +0000
Received: from [10.108.8.223] (port=45840 helo=xcbayankuma41x.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nGU0a-0005LJ-F4; Sat, 05 Feb 2022 22:58:20 +0000
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
X-Inumbo-ID: 1ef6dd0e-86d7-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LILh+it+5vqBhG2eIFkc/OvQhZxCiiWxTnfUyRu1lHrtIllcx3qhLQM736BI+rnVzuhtDKjZJxwglIy8KuXtsf20u2s7x4x0xdviTT+4kc87zRPUdJRq9YMCeRIdNBpjF+u/m902btQoxIdgzNwx/9zd3Bt7r8N2MA6Y28q2UrsNsx3niyHWEk/HIF1ZKH3gonVIuW5MojWO9i4cks3iU/GqRnQo0ofOmXu6ECzsVEj8k1nbUCc7uaWU//hr5iCqqxcTmBNBht2hqOyyaT7piafZ22l2ECe0w9m8sDJCZy7NIdXT07h2nZE8NsTa+Ee6FaRzthIP03csG8rZLQZZKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kz2Ce14/b/jlMByaBpB+zZOHlM5iXKOu5ov6OIoPRIA=;
 b=PkNGmyMKpZocBb2ARUQ0Vtoh8pwMM3VcHTbCN5r2RsYKaYaTHD5fcDBXT4tzjwBuWBwXl6JSdHAwjqcxwr6hl7RWfwotBVv79tGn4eEtvC+YPjYyRHYJ+FvPigiFl+SyWdwIfv8GMS+4+z3gby/Xi5trcJP5MyuWriEWjZx+JQ0AS+yyJZRp7t8a4Fa42rgjacS9NyuXPak/4ehHom4yOEn/aolgker4marDT8cfRlF6gN3EtbwZ+Csl2cDN/vgO1vSoSjDjwL64WYSsIw4uQqqasYhyNYfRuLOZ5hWHqlZ8S6R+pbrVtlThAEz3ZSutv6l3s7RAK6JHUDc0Yg5YAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kz2Ce14/b/jlMByaBpB+zZOHlM5iXKOu5ov6OIoPRIA=;
 b=g3Gcye5+NjCrrp7lxBjdreRySHQb+9f0Alp8PFsJeKQngk1mLbSwfM/YXX/tGiENnhBvIoJ4DFVzuOLtn4NDxCtGAUPmnhYuhTxM9fdJR0j10ZeKB15U1oAv+piKYY09khUISxKty1yuO+rp74iHOGy9+Az5ea/CqNASD4etDMw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch02.xlnx.xilinx.com;
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
To: <xen-devel@lists.xenproject.org>, <ayankuma@xilinx.com>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>
Subject: [XEN v7 1/2] xen/arm64: Decode ldr/str post increment operations
Date: Sat, 5 Feb 2022 22:58:15 +0000
Message-ID: <20220205225816.5952-2-ayankuma@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220205225816.5952-1-ayankuma@xilinx.com>
References: <20220205225816.5952-1-ayankuma@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fa08bafe-6aac-4926-4860-08d9e8fb022f
X-MS-TrafficTypeDiagnostic: SN4PR0201MB8742:EE_
X-Microsoft-Antispam-PRVS:
	<SN4PR0201MB874204B2B0887264F924233EB22A9@SN4PR0201MB8742.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MO2MVIzKe4fTnmMu48J+Nmmyxl8RpyNTIuo0lxjmKaSHavKcW2p66ovS5yyInUrh8jlVd5RjVmH5fEKn0vOyWfkdoTFYHDzNVZ35Cr+WQ/1rqyyBakqazg9lGUavZMRz54q/V7+UolGkxPaFzEWlcERlFodTLIh6ne9jAzHHNWlhS5RMo0tFFTV3QNCjsWrNadlNveVevddv3OqJxNS9ZDpt0E2YW4k1DoanOMknmvoaDb/WuzZzxZ/GDuHHGrCs4gwUdOHfjVZpRwNnePECyrKVrw/eRGHwT2ntOMrqJWo7epX5+RLtNhC6Aq4TrGsftNSTHTLtwIUXbjzH9qkl53xZSzuP8V+3FKC5W2Nfrbgirshs8XWKp6qv25NWwU0/ym1CRdYzV3uWBd4sVh3hg2R4UvbFA8OYbBlaD4b/hhYBIgmTedDlPaIN3mOrqqw/HYrzFepv9pm//o88Zx3MJHjUrTy7HspoTLL+7WSqjx0v3JxiRRo4rX8cEk8/Ape0yiOcarXKF0v8SIqiotVeF2q3u9euW5TclmCkUxXmpER+cFPXBmG2wGSq4aQWLP6cnmxusF7MxiS+jy2SMEOYfcrOiR0gCLyJ3c4WoTcf0tBQM4Qae3uh3QJX19vfe/eKAz1lc793hH3kxu1D/QkE7EQ4Z0V3VJyRRCsrWiLci053NwOgLezls7FkZjt2IfFl
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch02.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(316002)(70206006)(83380400001)(2906002)(6666004)(36860700001)(7696005)(47076005)(4326008)(70586007)(508600001)(8936002)(9786002)(7049001)(5660300002)(36756003)(8676002)(110136005)(356005)(7636003)(426003)(54906003)(1076003)(186003)(26005)(336012)(2616005)(82310400004)(6636002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Feb 2022 22:58:21.8068
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa08bafe-6aac-4926-4860-08d9e8fb022f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0054.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB8742

At the moment, Xen does not decode any of the arm64 instructions. This
means that hsr_dabt.isv = 0, Xen cannot handle those instructions. This
will lead to Xen abort the guests (from which those instructions
originated).

With this patch, Xen is able to decode ldr/str post indexing instructions.
These are a subset of instructions for which hsr_dabt.isv = 0

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

In the subsequent patches, decode_arm64() will get invoked when
hsr_dabt.isv=0.

Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
---

Changelog :-

v2..v5 - Mentioned in the cover letter.

v6 - 1. Fixed the code style issues as mentioned in v5.

v7 - No change.

 xen/arch/arm/decode.c           | 80 ++++++++++++++++++++++++++++++++-
 xen/arch/arm/decode.h           | 49 +++++++++++++++++---
 xen/arch/arm/include/asm/mmio.h |  4 ++
 xen/arch/arm/io.c               |  2 +-
 4 files changed, 125 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
index 792c2e92a7..3f2d2a3f62 100644
--- a/xen/arch/arm/decode.c
+++ b/xen/arch/arm/decode.c
@@ -23,6 +23,7 @@
 #include <xen/types.h>
 
 #include <asm/current.h>
+#include <asm/mmio.h>
 
 #include "decode.h"
 
@@ -84,6 +85,78 @@ bad_thumb2:
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
+        goto bad_loadstore;
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
+                "Decoding instruction 0x%x is not supported", opcode.value);
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
@@ -150,10 +223,13 @@ bad_thumb:
     return 1;
 }
 
-int decode_instruction(const struct cpu_user_regs *regs, struct hsr_dabt *dabt)
+int decode_instruction(const struct cpu_user_regs *regs, mmio_info_t *info)
 {
     if ( is_32bit_domain(current->domain) && regs->cpsr & PSR_THUMB )
-        return decode_thumb(regs->pc, dabt);
+        return decode_thumb(regs->pc, &info->dabt);
+
+    if ( !psr_mode_is_32bit(regs) )
+        return decode_arm64(regs->pc, info);
 
     /* TODO: Handle ARM instruction */
     gprintk(XENLOG_ERR, "unhandled ARM instruction\n");
diff --git a/xen/arch/arm/decode.h b/xen/arch/arm/decode.h
index 4613763bdb..fe7512a053 100644
--- a/xen/arch/arm/decode.h
+++ b/xen/arch/arm/decode.h
@@ -23,19 +23,54 @@
 #include <asm/regs.h>
 #include <asm/processor.h>
 
-/**
- * Decode an instruction from pc
- * /!\ This function is not intended to fully decode an instruction. It
- * considers that the instruction is valid.
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
+        signed int imm9:9;            /* imm9 */
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
+/* Decode an instruction from pc
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
index 729287e37c..a289d393f9 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -134,7 +134,7 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
     {
         int rc;
 
-        rc = decode_instruction(regs, &info.dabt);
+        rc = decode_instruction(regs, &info);
         if ( rc )
         {
             gprintk(XENLOG_DEBUG, "Unable to decode instruction\n");
-- 
2.17.1


