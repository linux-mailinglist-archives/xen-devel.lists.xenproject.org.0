Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C46B349BDC9
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jan 2022 22:19:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.260557.450254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCTCp-0005kI-9B; Tue, 25 Jan 2022 21:18:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 260557.450254; Tue, 25 Jan 2022 21:18:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCTCp-0005if-5Z; Tue, 25 Jan 2022 21:18:23 +0000
Received: by outflank-mailman (input) for mailman id 260557;
 Tue, 25 Jan 2022 21:18:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B39K=SJ=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nCTCo-0005iW-23
 for xen-devel@lists.xenproject.org; Tue, 25 Jan 2022 21:18:22 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20602.outbound.protection.outlook.com
 [2a01:111:f400:7e89::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50a8697c-7e24-11ec-8eb8-a37418f5ba1a;
 Tue, 25 Jan 2022 22:18:19 +0100 (CET)
Received: from SA0PR11CA0112.namprd11.prod.outlook.com (2603:10b6:806:d1::27)
 by CY4PR02MB2583.namprd02.prod.outlook.com (2603:10b6:903:71::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7; Tue, 25 Jan
 2022 21:18:15 +0000
Received: from SN1NAM02FT0032.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:d1:cafe::d8) by SA0PR11CA0112.outlook.office365.com
 (2603:10b6:806:d1::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8 via Frontend
 Transport; Tue, 25 Jan 2022 21:18:15 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 SN1NAM02FT0032.mail.protection.outlook.com (10.97.5.58) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Tue, 25 Jan 2022 21:18:14 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 25 Jan 2022 21:18:13 +0000
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 25 Jan 2022 21:18:13 +0000
Received: from [10.108.8.223] (port=2814 helo=xcbayankuma41x.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nCTCe-0001wB-6x; Tue, 25 Jan 2022 21:18:12 +0000
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
X-Inumbo-ID: 50a8697c-7e24-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QtTXgxTKzVfDlcY/x+2ZPdYYHQouJpKk1kSzqGRdCZlhXICDvyuEUMopBnJWAlIotL3NdFdKaHNIuR750tCVtnGlcIfqE8RRZF5j84PRz/ExL1m4HYmxd3vHkfG6816waN8rYkZEdG0vHiMjG1j+2r33Kq+rwkzzAVucYTiabtpUd4IVEqP9A2idSSaEW8TXeeA3xmKS0aBA9g6u4vHLhbkRUSeuZjwVDqadxckRADaW2kduO0buVRqHPEhByci9uCSWtxgrFiN98it6Yb3yNcssYwVW0V8p4EACMesuj0TFYTxzExCJHIa7erSQDvfZcgiB87vI0ZJ1ey0oykLG6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlOtHTjTSKPaqF8xW3WDN2lUvu0FX8Ji+ST8iM9BdtE=;
 b=f4m9ap8859+M2rFm8gwBhlUcfJ3+CcBYLsi4DV92XoApIasly6RM5/75QDc+Jr5+4d4arvplNFF6CnKMdGRQvM56hwLP/V6t6LwjZJiSTNvB33ZdXP+TNXJsE2lEsLl8LZiFSui9oPWl24bq+NqoPZKVSZ90k0b8594pNcu+fN0An+vP3LgrYVXo1H1pJjhQNXwf4WJff1vXY5MYvXP59fLjsEV1srLQBIZLOdHVph+U8wP3hKaxtJwPEK1jMD1sXe2EaRCphrUBElQaQGx/kpdt8lEKsPTM4SrDeU1ky/Ag60fEzYgxjMWyem61JiuDpb8GgZlIYOpxulHmRW0ofw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlOtHTjTSKPaqF8xW3WDN2lUvu0FX8Ji+ST8iM9BdtE=;
 b=GhANOL4Cs5txgONueIQTSOSyBOnIKh4mcX3zPPz2Hspf/KwcvTFIsIXi1hOA+Mjw7pQIWNs3YzYs8/wrGdcIi52mgx2fZ6k5mwM9YBOC2NzrdbHMdGIyK7aslhhwnVKlEsEkd486vc0MlWIRnPMqsVaph4ASxP+d9CbD6KWGe34=
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
	<andre.przywara@arm.com>, <jbeulich@suse.com>, <wei.chen@arm.com>, "Ayan
 Kumar Halder" <ayankuma@xilinx.com>
Subject: [XEN v4] xen/arm64: io: Decode ldr/str post-indexing instructions
Date: Tue, 25 Jan 2022 21:18:08 +0000
Message-ID: <20220125211808.23810-1-ayankuma@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 52cac653-2b89-441b-74a2-08d9e04832f2
X-MS-TrafficTypeDiagnostic: CY4PR02MB2583:EE_
X-Microsoft-Antispam-PRVS:
	<CY4PR02MB25838FB26D2FCA7C44886711B25F9@CY4PR02MB2583.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YT9mgZ9sdPTW/8yZ3r35a1v3d700xlk2wa88GLnjnBFI1UPy5l4DDkZcL+8yko5SPDyUTGrVOQ7PdE1hxQXTJjlDmzFKYdRQkFU06ImJmvBXEU4r9gPEkCN0a/7jLutaU0ZX/AWJN6nGbKnzpQjx5u1u+sqac+jqOqitEL6RMuXju8fODrphtzZIBy2ZVC3wM/Wu43gDT0icAr4RGPPthT15Awf+72tJrQjgcCz1DN8f7Of0BdleaS/UhkpKNIu10i4qSgKTlvFzuZw+llum/mY0undY/NU/Du9G01FsLvNCyHKOS45Qs01z2fGfJYmQINpXlorn+1i/AiHQX1qxftZUhUKob4Xyc+0GZIXeW9gsTqSwy/YNf/7VOgQbq4g+oeT49YtGAR7mM1tedPgR1YEZWwpKvn5aad240WdxUqgW4GQL9cfcwAnSgYmPItM7/QM+LHl+ClzLtuI84H2nf3ulC6CYF334ZJoMWR2uyHnC6RS4Gv9mnYzhBDHqsL+CtbCQeCpl4pAQMJIX+l+dGu4QlkZPj5N5qzgIvDDYJOkSsn5qMQVYmc0CCzzUz0ALDihRu/vacP3d4KzuHk1Xggec+gDb5h1Ou9ZkzfSJ15xZglyRdY8sOnat4cV0WyieuO9iQNxLwIm43w9dqc+UgbowK0bKIGEM5tPP6SmyhnAs6ijhO0dH4qzps1drofOqSjVXvph7rCD4OLNrUZF3qneUYn7m7PlrcKpP8WhkVAO401LeZAY3zraxq4qvmcUPq8slclwa5kRtNO3tSTG2KML2ioTxbQskRC4TL93ZXqyF1SrgUZ0Ovp2H2EQdUG2ZLjIMgcMsQLwhaKrc/J/8+XlS8Ctu9RMpn8+AOfz6rFQqn++iPSKOc4/DO9UPwO0Cc2qpTgp6pNYmV/F21tap2rCtJBsYN1KQrDgKyV8ziRY=
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(4636009)(36840700001)(40470700004)(46966006)(2906002)(26005)(356005)(966005)(83380400001)(7696005)(7636003)(9786002)(8936002)(508600001)(6916009)(4326008)(82310400004)(186003)(70206006)(8676002)(30864003)(107886003)(2616005)(6666004)(5660300002)(54906003)(426003)(47076005)(36860700001)(36756003)(70586007)(316002)(1076003)(336012)(40460700003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2022 21:18:14.3841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52cac653-2b89-441b-74a2-08d9e04832f2
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0032.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2583

At the moment, Xen is only handling data abort with valid syndrome (i.e.
ISV=0). Unfortunately, this doesn't cover all the instructions a domain
could use to access MMIO regions.

For instance, a baremetal OS can use any of the following instructions, where
x1 contains the address of the MMIO region:

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

In the following two instructions, Rn could theoretically be stack pointer which
might contain the address of the MMIO region:-
11.     ldrb    w2,    [Rn],    #1
12.     ldrb    wzr,   [Rn],    #1

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

v4- 1. Fixed the patch as per Stefano's comments on v3. They are as follows :-
        1.1 Use macros to determine the fixed values in the instruction opcode
        1.2 Checked if instr != NULL
        1.3 Changed some data types and added #define ARM_64 for AArch64 specific
            code 
        1.4 Moved post_increment_register() to decode.c so that the decoding
            logic is confined to a single file.
        1.5 Moved some checks from post_increment_register() to
            decode_loadstore_postindexing()
        1.6 Removed a duplicate check
    2. Updated the commit message as per Andre's comments.
    3. Changed the names of a label and some comments. *32bit* was erroneously
       mentioned in a label and comments in decode_loadstore_postindexing()
       although the function handled all variants of ldr/str post indexing.

 xen/arch/arm/decode.c | 124 +++++++++++++++++++++++++++++++++++++++++-
 xen/arch/arm/decode.h |  41 +++++++++++++-
 xen/arch/arm/io.c     |  41 +++++++++++---
 3 files changed, 195 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
index 792c2e92a7..0c12af7afa 100644
--- a/xen/arch/arm/decode.c
+++ b/xen/arch/arm/decode.c
@@ -84,6 +84,101 @@ bad_thumb2:
     return 1;
 }
 
+static int decode_loadstore_postindexing(register_t pc,
+                                         struct hsr_dabt *dabt,
+                                         union ldr_str_instr_class *instr)
+{
+    struct cpu_user_regs *regs = guest_cpu_user_regs();
+
+    if ( instr == NULL )
+    {
+        gprintk(XENLOG_ERR, "instr should not be NULL\n");
+        return -EINVAL;
+    }
+
+    if ( raw_copy_from_guest(&instr->value, (void * __user)pc, sizeof (instr)) )
+    {
+        gprintk(XENLOG_ERR, "Could not copy the instruction from PC\n");
+        return -EFAULT;
+    }
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
+    {
+        gprintk(XENLOG_ERR, "Rn should not be equal to Rt except for r31\n");
+        return -EINVAL;
+    }
+
+    /* First, let's check for the fixed values */
+    if ( (instr->value & POST_INDEX_FIXED_MASK) != POST_INDEX_FIXED_VALUE )
+    {
+        gprintk(XENLOG_ERR, "Cannot decode instruction 0x%x",instr->value);
+        gprintk(XENLOG_ERR, "Decoding not supported for instructions other than"
+            " ldr/str post indexing\n");
+        goto bad_loadstore;
+    }
+
+    /*
+     * Handle when rn = SP
+     * Refer ArmV8 ARM DDI 0487G.b, Page - D1-2463 "Stack pointer register selection"
+     * As we are interested in handling exceptions only from EL1 in AArch64 state,
+     * thus M[3:0] == EL1h (Page - C5-480 "When exception taken from AArch64 state:")
+     */
+    if ( (instr->code.rn == 31) && ((regs->cpsr & PSR_MODE_MASK) != PSR_MODE_EL1h) )
+    {
+        gprintk(XENLOG_ERR, "SP is valid only for EL1h\n");
+        goto bad_loadstore;
+    }
+
+    if ( instr->code.v != 0 )
+    {
+        gprintk(XENLOG_ERR,
+            "ldr/str post indexing for vector types are not supported\n");
+        goto bad_loadstore;
+    }
+
+    /* Check for STR (immediate) */
+    if ( instr->code.opc == 0 )
+    {
+        dabt->write = 1;
+    }
+    /* Check for LDR (immediate) */
+    else if ( instr->code.opc == 1 )
+    {
+        dabt->write = 0;
+    }
+    else
+    {
+        gprintk(XENLOG_ERR,
+            "Decoding ldr/str post indexing is not supported for this variant\n");
+        goto bad_loadstore;
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
+ bad_loadstore:
+    gprintk(XENLOG_ERR, "unhandled Arm instruction 0x%x\n", instr->value);
+    return 1;
+}
+
 static int decode_thumb(register_t pc, struct hsr_dabt *dabt)
 {
     uint16_t instr;
@@ -150,17 +245,44 @@ bad_thumb:
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
 
     return 1;
 }
 
+#if CONFIG_ARM_64
+void post_increment_register(union ldr_str_instr_class *instr)
+{
+    struct cpu_user_regs *regs = guest_cpu_user_regs();
+    register_t val;
+
+    /* handle when rn = SP */
+    if ( instr->code.rn == 31 )
+        val = regs->sp_el1;
+    else
+        val = get_user_reg(regs, instr->code.rn);
+
+    val += instr->code.imm9;
+
+    if ( instr->code.rn == 31 )
+        regs->sp_el1 = val;
+    else
+        set_user_reg(regs, instr->code.rn, val);
+}
+#endif
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/decode.h b/xen/arch/arm/decode.h
index 4613763bdb..511cd4a05f 100644
--- a/xen/arch/arm/decode.h
+++ b/xen/arch/arm/decode.h
@@ -23,6 +23,35 @@
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
+#define POST_INDEX_FIXED_MASK   0x3B200C00
+#define POST_INDEX_FIXED_VALUE  0x38000400
+
 /**
  * Decode an instruction from pc
  * /!\ This function is not intended to fully decode an instruction. It
@@ -35,8 +64,18 @@
  */
 
 int decode_instruction(const struct cpu_user_regs *regs,
-                       struct hsr_dabt *dabt);
+                       struct hsr_dabt *dabt,
+                       union ldr_str_instr_class *instr);
 
+/**
+ * Update the register value for Rn
+ * /!\ This function is used to update the register value for Rn when a
+ * post indexing ldr/str instruction is decoded.
+ *
+ * This function will get:
+ * - The post indexing ldr/str instruction opcode
+ */
+void post_increment_register(union ldr_str_instr_class *instr);
 #endif /* __ARCH_ARM_DECODE_H_ */
 
 /*
diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index 729287e37c..b9c15e1fe7 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -106,14 +106,29 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
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
@@ -121,10 +136,6 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
         return rc;
     }
 
-    /* All the instructions used on emulated MMIO region should be valid */
-    if ( !dabt.valid )
-        return IO_ABORT;
-
     /*
      * Erratum 766422: Thumb store translation fault to Hypervisor may
      * not have correct HSR Rt value.
@@ -134,7 +145,7 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
     {
         int rc;
 
-        rc = decode_instruction(regs, &info.dabt);
+        rc = decode_instruction(regs, &info.dabt, NULL);
         if ( rc )
         {
             gprintk(XENLOG_DEBUG, "Unable to decode instruction\n");
@@ -143,9 +154,21 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
     }
 
     if ( info.dabt.write )
-        return handle_write(handler, v, &info);
+        rc = handle_write(handler, v, &info);
     else
-        return handle_read(handler, v, &info);
+        rc = handle_read(handler, v, &info);
+
+#if CONFIG_ARM_64
+    if ( (is_64bit_domain(current->domain) && !psr_mode_is_32bit(regs)) )
+    {
+        if ( instr.value != 0 )
+        {
+            post_increment_register(&instr);
+        }
+    }
+#endif
+
+    return rc;
 }
 
 void register_mmio_handler(struct domain *d,
-- 
2.17.1


