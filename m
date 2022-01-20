Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FFF49562B
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jan 2022 22:57:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.259180.447166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAfPH-0007oD-A0; Thu, 20 Jan 2022 21:55:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 259180.447166; Thu, 20 Jan 2022 21:55:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nAfPH-0007kz-6J; Thu, 20 Jan 2022 21:55:47 +0000
Received: by outflank-mailman (input) for mailman id 259180;
 Thu, 20 Jan 2022 21:55:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lajj=SE=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nAfPG-0007kt-0q
 for xen-devel@lists.xenproject.org; Thu, 20 Jan 2022 21:55:46 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4fdf69e-7a3b-11ec-bc18-3156f6d857e4;
 Thu, 20 Jan 2022 22:55:41 +0100 (CET)
Received: from DM6PR10CA0032.namprd10.prod.outlook.com (2603:10b6:5:60::45) by
 CO6PR02MB8820.namprd02.prod.outlook.com (2603:10b6:303:144::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Thu, 20 Jan
 2022 21:55:38 +0000
Received: from DM3NAM02FT027.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:60:cafe::91) by DM6PR10CA0032.outlook.office365.com
 (2603:10b6:5:60::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8 via Frontend
 Transport; Thu, 20 Jan 2022 21:55:38 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 DM3NAM02FT027.mail.protection.outlook.com (10.13.5.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.8 via Frontend Transport; Thu, 20 Jan 2022 21:55:37 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 20 Jan 2022 21:55:36 +0000
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 20 Jan 2022 21:55:36 +0000
Received: from [10.108.8.223] (port=27503 helo=xcbayankuma41x.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nAfP5-0005Xs-HG; Thu, 20 Jan 2022 21:55:36 +0000
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
X-Inumbo-ID: b4fdf69e-7a3b-11ec-bc18-3156f6d857e4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bkA9Vk2KDr6z7UnWY/+BMghoKP6AN8s+pf0A2aLC4iq2Nhpv3MtlYkPtzBunSdbF/pzvlLgIZ/9fk4LMRVc8CcHjzSv+I74nLpiXH5eKQUL37Jk6OtvNi8fvusgM5BlKPJoZRp4ZnmqKwHr/h9ecBbfAI0ZfGPXR82VtRos9MxidPkkjRMBLhi06E8stHY2JwI33YpJSYwedB9NG+4lEHF1m8Qs9FobrrkrtRRHopMDjYOr6NNoQ16og/IhW2p3ZJRcRTY7WkBO7/9ffeSuz5eGRr7YBJjkYrHCyoKTbhl+MPofPwb+vjDIzOsXOdigrSEtvQF5iGrCkEtUuZCLbzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmM8bRgExVP0UZZoasHUt/y4YJ1u3xNqvHORmd9LNLA=;
 b=kZR+5HuZekpIPpgn6bbSSGiDBF+UmIfEJKPCfaAdVQ6iKwmjzADkP6ooYjRJcd0YIAeQas12384lkJusu6z95ejFIhxxEZiAQJDeZRgGANNtA4wmgAAo8dOT1g7mHSaelUSWqeqoQ+VOFZPUfVEs6AvbgPAvEmPv16JFQ33+QDSXXyRWpPyiMw/8jjrkYHvSl9g9vFvQWBBgUpA84BpqaH5nrtWICNAECuFHAl4pxbKp27gslcBIN+QFt/963nj9Rs8ADI4unLT6TrmSDfe8wvv25521cFilngM9oavIo2LsDNda0OA4JXld+zdyFkdtHMpkE7320ZZSCvgwrFpYCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmM8bRgExVP0UZZoasHUt/y4YJ1u3xNqvHORmd9LNLA=;
 b=HzInxZSPex3UU9Fnvpo48MDtHVwN/UG3pzUMgSlJ1dPqfTcnFA1b/dZZtIEAjd3VnFWykq6OYDHA+kn9BcZoxA2wShzOgSM0IKK73CJo79tRoVQgeexp+9DjZnOKs+gLKtcd7mrSJWWcCqdE4oVOz9bkhQQ+BXR4gkCFhxgBE2w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch02.xlnx.xilinx.com;
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<andre.przywara@arm.com>, <jbeulich@suse.com>, <wei.chen@arm.com>, "Ayan
 Kumar Halder" <ayankuma@xilinx.com>
Subject: [XEN v3] xen/arm64: io: Decode ldr/str post-indexing instructions
Date: Thu, 20 Jan 2022 21:55:27 +0000
Message-ID: <20220120215527.28138-1-ayankuma@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29d8353d-22dd-4abc-3d30-08d9dc5f97d5
X-MS-TrafficTypeDiagnostic: CO6PR02MB8820:EE_
X-Microsoft-Antispam-PRVS:
	<CO6PR02MB882052B6716C6F6FC158B085B25A9@CO6PR02MB8820.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BheGQWmeefeIopGz3xmde/ww5DC4a/apJWFELGyWIqyyYYIKeGEPmJFU01lppfD1iOcFR/D+ZGrLEhfNU7iu+s1kgR6173T8PzWyOsvmeoGu3pnODoiyhkywq8J/m+szsqA1iQjO5OwtlfSP2BCjg2ztEm/1scH8lMCrk+gVKG/jtiXC0EpthsakOIXYHL0+zTV7sXt968n71YlOCsT1kSBd9SePhaDWiQJ/5b26ssJm3I3gxejKZC4dfSjW9azBy4V1ChJGTQVAJUBthNDdWIjUHM3ZezkqN2IXBkokVZ2BkPJiD6xCeNy36XcV+tmGqhfHHmE8+0aLrkhOwCb7WNg318/OAJQ4k5crT1AmhXC7zTioxUCrT17jreM2kEXU+fhAPp0ZPWPXZhpCljPOjC0kKbXZzru6q2IL1sZd2mIa49I1HxuIOVRr/UQnzB7FDmFJliDuH65LGK0U25wll5fBloeGGQuPCSC2sAg55T4jLpybGaTR4qAg9+NZ9oz2MkdwwKEjdoW4lj4/Y0HbYRcI+KhTJzDv+vNPhZIBse6v404Ved1olVxKd5FmOQ45MibaLnF1OIW5r1gvULaAXlVVc6F/HFn/xTuRAk17zU6HNphTjuUxOU1pgIYH5xo+DAnciyBQfIJyiHv1O5dbkdpL8QJ/9a6xcLN/eILfgnVX6mFrnC9HiwYik/MT5dwlkK+VHyLsmiK9LY9PeSAcaB8i+OKgHESNGX7P1R5Lro+Ct/yQU/ZQ7kdV7rSQ/FrOW7f4XZMI5MhetwvrL2eWng6JxUMHj1UPYNQd5edr+e0bU9KwNiJDYZlcfmZRn3L+LPVAz+b8rF+xtBcjT25YIXFEiOGgI3aKe37kl37lHCA=
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch02.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(6916009)(26005)(8936002)(107886003)(7696005)(9786002)(70206006)(508600001)(336012)(5660300002)(6666004)(966005)(186003)(2616005)(4326008)(7636003)(82310400004)(2906002)(356005)(36756003)(8676002)(316002)(1076003)(54906003)(36860700001)(70586007)(47076005)(83380400001)(426003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2022 21:55:37.4943
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29d8353d-22dd-4abc-3d30-08d9dc5f97d5
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT027.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB8820

At the moment, Xen is only handling data abort with valid syndrome (i.e.
ISV=0). Unfortunately, this doesn't cover all the instructions a domain
could use to access MMIO regions.

For instance, a baremetal OS can use any of the following instructions, where
x1 contains the address of the MMIO region:

1.      ldr     x2,    [x1],    #4
2.      ldr     w2,    [x1],    #-4
3.      ldr     x2,    [x1],    #-8
4.      ldr     w2,    [x1],    #4
5.      ldrh    w2,    [x1],    #8
6.      ldrb    w2,    [x1],    #16
7.      str     x2,    [x1],    #4
8.      str     w2,    [x1],    #-4
9.      strh    w2,    [x1],    #8
10.     strb    w2,    [x1],    #16

In the following two instructions, sp contains the address of the MMIO region:-
11.     ldrb    w2,    [sp],    #16
12.     ldrb    wzr,   [sp],    #16

In order to handle post-indexing store/load instructions (like those mentioned
above), Xen will need to fetch and decode the instruction.

This patch only cover post-index store/load instructions from AArch64 mode.
For now, this is left unimplemented for trap from AArch32 mode.

Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
---

Changelog :-
v2 - 1. Updated the rn register after reading from it. (Pointed by Julien,
        Stefano)
     2. Used a union to represent the instruction opcode (Suggestd by Bertrand)
     3. Fixed coding style issues (Pointed by Julien)
     4. In the previous patch, I was updating dabt->sign based on the signedness
        of imm9. This was incorrect. As mentioned in ARMv8 ARM  DDI 0487G.b,
        Page 3221, SSE indicates the signedness of the data item loaded. In our
        case, the data item loaded is always unsigned.

v3- 1. Handled all the variants of ldr/str (ie 64, 32, 16, 8 bit variants).
       Thus, I have removed the check for "instr->code.opc == 0" (Suggested by
       Andre)
    2. Handled the scenario when rn = SP, rt = XZR (Suggested by Jan, Andre)
    3. Added restriction for "rt != rn" (Suggested by Andre)
    4. Moved union ldr_str_instr_class {} to decode.h. This is the header included
       by io.c and decode.c (where the union is referred). (Suggested by Jan)
    5. Indentation and typo fixes (Suggested by Jan)

Changes suggested but could not be considered due to reasons :-
    1. Using accessor macros instead of bitfields for "ldr_str_instr_class". (Andre)
       Reason - I could not find a simple way to represent 9 bit signed integer
       (ie imm9) without using bitfields. If I use accessor macros, then I need
       to manually calculate two's complement to obtain the value when signed
       bit is present.

    2. I/D cache cohenerncy (Andre)
       Reason :- I could not see any instruction to flush the I cache.
       Refer https://developer.arm.com/documentation/ddi0596/2021-12/Base-Instructions/IC--Instruction-Cache-operation--an-alias-of-SYS-?lang=en#sa_ic_op
       So, this patch assumes that the I/D caches are coherent.

 xen/arch/arm/decode.c | 78 ++++++++++++++++++++++++++++++++++++++++++-
 xen/arch/arm/decode.h | 29 +++++++++++++++-
 xen/arch/arm/io.c     | 66 ++++++++++++++++++++++++++++++++----
 3 files changed, 165 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
index 792c2e92a7..f1c59ddd1a 100644
--- a/xen/arch/arm/decode.c
+++ b/xen/arch/arm/decode.c
@@ -84,6 +84,76 @@ bad_thumb2:
     return 1;
 }
 
+static int decode_loadstore_postindexing(register_t pc,
+                                         struct hsr_dabt *dabt,
+                                         union ldr_str_instr_class *instr)
+{
+    if ( raw_copy_from_guest(&instr->value, (void * __user)pc, sizeof (instr)) )
+        return -EFAULT;
+
+    /*
+     * Rn -ne Rt for ldr/str instruction.
+     * Check https://developer.arm.com/documentation/dui0802/a/CIHGJHED
+     * (Register restrictions)
+     *
+     * The only exception for this is when rn = 31. It denotes SP ("Use of SP")
+     *
+     * And when rt = 31, it denotes wzr/xzr. (Refer
+     * https://developer.arm.com/documentation/den0024/a/ARMv8-Registers/AArch64-special-registers
+     * "There is no register called X31 or W31. Many instructions are encoded
+     * such that the number 31 represents the zero register, ZR (WZR/XZR)."
+     */
+    if ( (instr->code.rn == instr->code.rt) && (instr->code.rn != 31) )
+        return -EINVAL;
+
+    /* First, let's check for the fixed values */
+    if ( !((instr->code.fixed1 == 1) && (instr->code.fixed2 == 0) &&
+         (instr->code.fixed3 == 0) && (instr->code.fixed4 == 7)) )
+    {
+        gprintk(XENLOG_ERR, "Cannot decode instruction 0x%x",instr->value);
+        gprintk(XENLOG_ERR, "Decoding not supported for instructions other than"
+            " ldr/str post indexing\n");
+        goto bad_32bit_loadstore;
+    }
+
+    if ( instr->code.v != 0 )
+    {
+        gprintk(XENLOG_ERR,
+            "ldr/str post indexing for vector types are not supported\n");
+        goto bad_32bit_loadstore;
+    }
+
+    /* Check for STR (immediate) - 32 bit variant */
+    if ( instr->code.opc == 0 )
+    {
+        dabt->write = 1;
+    }
+    /* Check for LDR (immediate) - 32 bit variant */
+    else if ( instr->code.opc == 1 )
+    {
+        dabt->write = 0;
+    }
+    else
+    {
+        gprintk(XENLOG_ERR,
+            "Decoding ldr/str post indexing is not supported for this variant\n");
+        goto bad_32bit_loadstore;
+    }
+
+    gprintk(XENLOG_INFO,
+        "instr->code.rt = 0x%x, instr->code.size = 0x%x, instr->code.imm9 = %d\n",
+        instr->code.rt, instr->code.size, instr->code.imm9);
+
+    update_dabt(dabt, instr->code.rt, instr->code.size, false);
+    dabt->valid = 1;
+
+    return 0;
+
+ bad_32bit_loadstore:
+    gprintk(XENLOG_ERR, "unhandled 32bit Arm instruction 0x%x\n", instr->value);
+    return 1;
+}
+
 static int decode_thumb(register_t pc, struct hsr_dabt *dabt)
 {
     uint16_t instr;
@@ -150,11 +220,17 @@ bad_thumb:
     return 1;
 }
 
-int decode_instruction(const struct cpu_user_regs *regs, struct hsr_dabt *dabt)
+int decode_instruction(const struct cpu_user_regs *regs, struct hsr_dabt *dabt,
+                       union ldr_str_instr_class *instr)
 {
     if ( is_32bit_domain(current->domain) && regs->cpsr & PSR_THUMB )
         return decode_thumb(regs->pc, dabt);
 
+    if ( (is_64bit_domain(current->domain) && !psr_mode_is_32bit(regs)) )
+    {
+        return decode_loadstore_postindexing(regs->pc, dabt, instr);
+    }
+
     /* TODO: Handle ARM instruction */
     gprintk(XENLOG_ERR, "unhandled ARM instruction\n");
 
diff --git a/xen/arch/arm/decode.h b/xen/arch/arm/decode.h
index 4613763bdb..5c918c9bed 100644
--- a/xen/arch/arm/decode.h
+++ b/xen/arch/arm/decode.h
@@ -23,6 +23,32 @@
 #include <asm/regs.h>
 #include <asm/processor.h>
 
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
+union ldr_str_instr_class {
+    uint32_t value;
+    struct ldr_str {
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
+    } code;
+};
+
 /**
  * Decode an instruction from pc
  * /!\ This function is not intended to fully decode an instruction. It
@@ -35,7 +61,8 @@
  */
 
 int decode_instruction(const struct cpu_user_regs *regs,
-                       struct hsr_dabt *dabt);
+                       struct hsr_dabt *dabt,
+                       union ldr_str_instr_class *instr);
 
 #endif /* __ARCH_ARM_DECODE_H_ */
 
diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index 729287e37c..acb483f235 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -65,6 +65,39 @@ static enum io_state handle_write(const struct mmio_handler *handler,
     return ret ? IO_HANDLED : IO_ABORT;
 }
 
+static void post_increment_register(union ldr_str_instr_class *instr)
+{
+    struct cpu_user_regs *regs = guest_cpu_user_regs();
+    unsigned int val;
+
+    /* handle when rn = SP */
+    if ( instr->code.rn == 31 )
+    {
+        if ( (regs->cpsr & PSR_MODE_MASK) == PSR_MODE_EL1h )
+        {
+            val = regs->sp_el1;
+        }
+        else
+        {
+            BUG();
+        }
+    }
+    else
+    {
+        val = get_user_reg(regs, instr->code.rn);
+    }
+    val += instr->code.imm9;
+
+    if ( instr->code.rn == 31 )
+    {
+        regs->sp_el1 = val;
+    }
+    else
+    {
+        set_user_reg(regs, instr->code.rn, val);
+    }
+}
+
 /* This function assumes that mmio regions are not overlapped */
 static int cmp_mmio_handler(const void *key, const void *elem)
 {
@@ -106,14 +139,29 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
         .gpa = gpa,
         .dabt = dabt
     };
+    int rc;
+    union ldr_str_instr_class instr = {0};
 
     ASSERT(hsr.ec == HSR_EC_DATA_ABORT_LOWER_EL);
 
+    /*
+     * Armv8 processor does not provide a valid syndrome for post-indexing
+     * ldr/str instructions. So in order to process these instructions,
+     * Xen must decode them.
+     */
+    if ( !info.dabt.valid )
+    {
+        rc = decode_instruction(regs, &info.dabt, &instr);
+        if ( rc )
+        {
+            gprintk(XENLOG_DEBUG, "Unable to decode instruction\n");
+            return IO_ABORT;
+        }
+    }
+
     handler = find_mmio_handler(v->domain, info.gpa);
     if ( !handler )
     {
-        int rc;
-
         rc = try_fwd_ioserv(regs, v, &info);
         if ( rc == IO_HANDLED )
             return handle_ioserv(regs, v);
@@ -122,7 +170,7 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
     }
 
     /* All the instructions used on emulated MMIO region should be valid */
-    if ( !dabt.valid )
+    if ( !info.dabt.valid )
         return IO_ABORT;
 
     /*
@@ -134,7 +182,7 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
     {
         int rc;
 
-        rc = decode_instruction(regs, &info.dabt);
+        rc = decode_instruction(regs, &info.dabt, NULL);
         if ( rc )
         {
             gprintk(XENLOG_DEBUG, "Unable to decode instruction\n");
@@ -143,9 +191,15 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
     }
 
     if ( info.dabt.write )
-        return handle_write(handler, v, &info);
+        rc = handle_write(handler, v, &info);
     else
-        return handle_read(handler, v, &info);
+        rc = handle_read(handler, v, &info);
+
+    if ( instr.value != 0 )
+    {
+        post_increment_register(&instr);
+    }
+    return rc;
 }
 
 void register_mmio_handler(struct domain *d,
-- 
2.17.1


