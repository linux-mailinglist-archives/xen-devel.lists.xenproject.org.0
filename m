Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0159D4A76E2
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 18:31:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264367.457455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFJSi-0005cX-4c; Wed, 02 Feb 2022 17:30:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264367.457455; Wed, 02 Feb 2022 17:30:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFJSi-0005ak-1A; Wed, 02 Feb 2022 17:30:32 +0000
Received: by outflank-mailman (input) for mailman id 264367;
 Wed, 02 Feb 2022 17:30:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FkQ0=SR=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nFJSg-0005L1-0u
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 17:30:30 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060e.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf6604af-844d-11ec-8eb8-a37418f5ba1a;
 Wed, 02 Feb 2022 18:30:27 +0100 (CET)
Received: from BN6PR1401CA0022.namprd14.prod.outlook.com
 (2603:10b6:405:4b::32) by MN2PR02MB6047.namprd02.prod.outlook.com
 (2603:10b6:208:186::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.18; Wed, 2 Feb
 2022 17:30:23 +0000
Received: from BN1NAM02FT016.eop-nam02.prod.protection.outlook.com
 (2603:10b6:405:4b:cafe::1b) by BN6PR1401CA0022.outlook.office365.com
 (2603:10b6:405:4b::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Wed, 2 Feb 2022 17:30:23 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 BN1NAM02FT016.mail.protection.outlook.com (10.13.2.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Wed, 2 Feb 2022 17:30:23 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 2 Feb 2022 17:30:22 +0000
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 2 Feb 2022 17:30:22 +0000
Received: from [10.108.8.223] (port=56994 helo=xcbayankuma41x.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nFJSX-0004a1-Pg; Wed, 02 Feb 2022 17:30:21 +0000
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
X-Inumbo-ID: cf6604af-844d-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RLXFXSiieKmMTa5slGorqqR7bhw0nLW01YbH1O4Nzp5ZoYzM+1jRUnVwCsdBMhUg0aTsY7PO6aCO29pBkBFNFzqq631vmU+ahy8O5rMvruPYmChJr9spOECrxLYj4bBU53dUWs3ldUTNKzbAln3UZpsX95bbOdj7AWrXwtnuYMnRoJdRd/musX+ReoeEZWkctutT5l4sG3a4oLj/RwbEog5279C8ht6NZY2+/WuQhNudB1gjNmTVjWwWCnDBQU2OL2iRitJfMspDR7CBt4P7VOmXXAaNFEAex23FU0jjLCX7wzpwfZPWBPMvNGKq087Nw0/Sm4Hh4IMj/IehQmD29g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iHcAHp3QwX/xhztHCNTGGIUaHDk5FJxGg7bcpcAGof4=;
 b=Tq5EQI0tKGqtgLQe14UYJoWp3txg/Jp8waHRMZu2lIzuDxo9SuZt+SJGwbKfOWaDH/gpk6DlLVMKQ5JzsdKWW0zvbp/A6CJ2opssqCFsUz49e7/j3vP13Jj/ZNMmW/16noyc4mJOvxt0RQMiPhSYhCa/lqAJwPtFPckRHLruuiWaUlpC3XNx5fXfBhrCR4LpAagDt3F//j3H7EXF0PZO1aLCMvozorFQgjGxIIRwSzg8mRmCcqeNVY55PbN8F00YwyPBWhkY+WWqb06hki5FJNL21MfUFjg5JNFbZqZVMUa03KQCXiI+YOYW9GImIFEQDy4FKR4r8WJkOovHqldQlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHcAHp3QwX/xhztHCNTGGIUaHDk5FJxGg7bcpcAGof4=;
 b=PI1hjXZL34e3DBVVYNRqnbr7HklYqk+0t9v5MxSHi0McK865EPpi1iCqHb0gPzQI+ly3nzoGC9G8i0nefHcNJ4o12BW6uvoLMo6YVddG2/2JDlZ1BZFSlVRKJqe+HElKbtTZTpFu8s4w7S9roI+uyr+lmD0EAilVU8OGOgPhlKQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, Ayan Kumar Halder
	<ayankuma@xilinx.com>
Subject: [XEN v6 1/3] xen/arm64: Decode ldr/str post increment operations
Date: Wed, 2 Feb 2022 17:30:15 +0000
Message-ID: <20220202173017.48463-2-ayankuma@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220202173017.48463-1-ayankuma@xilinx.com>
References: <20220202173017.48463-1-ayankuma@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0f04e706-26ab-4a20-21be-08d9e671b1a9
X-MS-TrafficTypeDiagnostic: MN2PR02MB6047:EE_
X-Microsoft-Antispam-PRVS:
	<MN2PR02MB604798173E39ED48130AC3B2B2279@MN2PR02MB6047.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pp/qUUdgAi7skKAeTWLv0CX0i9P/+CsvvoZHkLFkvNFh5IY3yXw/lEHFAH4gWI3p/MoTL2xhRBuiEQdPaMn0J2WvU6eU8AJuRdtVNM/lQ6D3DiuUS0oYY7QqOxkM77N2pgcD4buvHraXHOdiy0b0JJ5ygyEl/wg2ia7ZNY6OPCaWMt8mQmnvQfkn9P105V1kWddmhGA9PZJ5G1vnkeWI4HVxyo/HpwKoCDf/x142ru6GkOWNZztCXnctdu9bSRYecmpta/KC3PwJe7JF2KiGAQKXKU2p+S7ijUDmts5cdhe5DvKUdYWhzupB2iS0uUtYGSEpMne3XFaqtcnNOBaA0w+0XvdCCnxjzQBEkr4yGj5TYy5ZU3TwBczGQCrZ99mSEGlzbeiWkLARAp0+7EW86a+x7CtN+Q/oSh87s+aDvGkAWezR3H3nw14LW/01/zHX25XKF+ZBEn7ipC43/+vzqGWfkgi5+ByKjSwZHKgN4zeNAvZ8gqPPDaQ83UlHsAA59Hwnc2Qm1my7zuZkbDSFbdB3QU3vqlc4J9nSGmMIiR8xjwN56Tkx0W6tX+7q2Q4a4mIeQ6VVwmLMByNUidhBWbDbZqDB+aw4hOfanZBKR+Ll5ro6cPOLKY0q19gzMNTkN+HttyLS4hEoW++fOrkJOvdMzED1efFZYowc0S0jSRid4og+dS4HD6vrP4hP/MrU
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(83380400001)(7696005)(426003)(36756003)(2906002)(316002)(26005)(336012)(54906003)(6916009)(2616005)(186003)(1076003)(356005)(107886003)(36860700001)(7636003)(70206006)(47076005)(5660300002)(8676002)(82310400004)(4326008)(8936002)(9786002)(508600001)(70586007)(6666004)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 17:30:23.4261
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f04e706-26ab-4a20-21be-08d9e671b1a9
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT016.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6047

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


