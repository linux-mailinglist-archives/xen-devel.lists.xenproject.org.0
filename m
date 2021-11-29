Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DD1462039
	for <lists+xen-devel@lfdr.de>; Mon, 29 Nov 2021 20:18:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.234808.407466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrm8z-0004T0-5V; Mon, 29 Nov 2021 19:16:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 234808.407466; Mon, 29 Nov 2021 19:16:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mrm8y-0004QZ-W8; Mon, 29 Nov 2021 19:16:52 +0000
Received: by outflank-mailman (input) for mailman id 234808;
 Mon, 29 Nov 2021 19:16:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=le4t=QQ=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1mrm8x-0004QT-Et
 for xen-devel@lists.xenproject.org; Mon, 29 Nov 2021 19:16:51 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7eab::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5729ba0-5148-11ec-976b-d102b41d0961;
 Mon, 29 Nov 2021 20:16:48 +0100 (CET)
Received: from DM6PR06CA0083.namprd06.prod.outlook.com (2603:10b6:5:336::16)
 by DM6PR02MB4794.namprd02.prod.outlook.com (2603:10b6:5:17::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Mon, 29 Nov
 2021 19:16:44 +0000
Received: from DM3NAM02FT061.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:336:cafe::30) by DM6PR06CA0083.outlook.office365.com
 (2603:10b6:5:336::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.19 via Frontend
 Transport; Mon, 29 Nov 2021 19:16:44 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 DM3NAM02FT061.mail.protection.outlook.com (10.13.4.230) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4734.20 via Frontend Transport; Mon, 29 Nov 2021 19:16:44 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 29 Nov 2021 19:16:42 +0000
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 29 Nov 2021 19:16:42 +0000
Received: from [10.108.8.223] (port=40822 helo=xcbayankuma41x.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1mrm8n-00067u-R4; Mon, 29 Nov 2021 19:16:42 +0000
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
X-Inumbo-ID: e5729ba0-5148-11ec-976b-d102b41d0961
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KnmwO0kEaw9GyVGuiG8umVeoPo3302eZmQWqHXnarw4RBrqHwCkAXAozZBRDRwYM7zWgKbVGjuRk9IwEcOTso/maQKrHbKlnRSOjGxo8VyUV2CrrUtbWRx4N6uYkfsfWLBCG+CDEeBewhwjn5s9LtbXt3CX15VqmK7hRAQ2fnBXtYNNbJffpTc7o6XiOTYGOuFeHAp2StUC+0o01ykGfdnIiPVNUU4mVa83dIiifDSG+uX7ZAJWy5rhbGc3iQuSPH3ApYWsQ2bfyifQfZRY2XdyNwhmHKfd0FW0baM/5mqk+RP+kMR4+jc36ircS0NY6glECJeCrcsFw92ESQ48Rgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1mAyvRmEvgJ+jEOL3aCu6glvVEt/d4ifQ8eMCvViurc=;
 b=PSdluDPQr/vnENxkEPj70h+TKdVLUWQh92M2Lm48p7qnWTRivgzrxSKpdswATrYCfegNN7evSy82ePL/AJGOZUcLYra/2hnlRUf4y8vfi5Da09zoYsD5TT/xu0FVvpCxB8u7HKgrau0btpD+K7luY0FyU+v6vAo7gc9Elo2nrtQDcvD6R7Tbhulmuy8biDvz6UUuM0qNZXh7/QRpzTof0hPi1tiwXlaeuBsOcBGOzl6lKs9UgjzYOXQfU6K9w2vjTg26ji4DXJC/7s7uLeo2paP5KfXgpd8luZrddCy/IvIIqZPbrzZ0kpMoJSKw1b8CkSOqjJ/e/oswAoIq6PHE/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1mAyvRmEvgJ+jEOL3aCu6glvVEt/d4ifQ8eMCvViurc=;
 b=KG6VZ1rTvXi9G2ZEBwP8XqBq1TL/Vb8LScG6q+Bl8t9yCq3OsdbkwSO47kLqG/jcWAZ6EbIbIKMiRuSfEJtu+wDvaWOAVW8MxhI8yqRs6iumta6z8LCiTkVopWa17HLQoFv0LgzolbCacScdIEdkZONsPW4AWVrcGMmSXSI/RYA=
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
	<andre.przywara@arm.com>, <jbeulich@suse.com>, Ayan Kumar Halder
	<ayankuma@xilinx.com>
Subject: [XEN v2] xen/arm64: io: Decode 32-bit ldr/str post-indexing instructions
Date: Mon, 29 Nov 2021 19:16:38 +0000
Message-ID: <20211129191638.19877-1-ayankuma@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 98830770-7562-4825-2884-08d9b36cc80f
X-MS-TrafficTypeDiagnostic: DM6PR02MB4794:
X-Microsoft-Antispam-PRVS:
	<DM6PR02MB47940F43C5770B08A66C5808B2669@DM6PR02MB4794.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	46F+fYslL+Ak+hav5XKF9KrCN3EqrKckzyonLftpblYNc+kbZLAgnPDtvcyemimCFOtK7AxyXg1UUmGiY1C4d/JgA8ycT7oqbeVqhjWGDwo/Oh37X4R7/g8mdUh9T5ak+M7Jc0VFPILfdTtKfuIft3s8VgadiF8PzU0GzdUyejSDAck6yDtNzHyAdBOrC3q8muYWjAwCOpNwPTRj9HcLMAYTTu1cABDJB4jl1v1EWR0i40ZHR8lnqj2jz7LgKOTuDQdlPeiH7pJTVd4Yceg+FVHv8IQwoftAP1Acd1xRTA8lOm7s5P4+dEOO5JlMyYwYF9G1PUHVO9vowWQ0xfuxsQQZJ3aDExHmEU0ToSgo8r+yaM3lldQDU9yo7dNmDECQJZKD+1h7KNhUFnkqoDrNYWCwG1RjBLFuk13wJgDsksXW8gbHQrkGy1PREyTo2TrfNdeV1dIJzb+49T9rK6fzwCLFBTBeBbzR5RoKLuP+5KpKvK25qFp3SIyfR4HzfsOF8LcjWBWhxnLj5xsx+0rte5w9ll1krIWDKOrjh3aHpP3Kp6YIStd+hlQme0FErc8HEBiYCy7DgKzJO15ydZ+vZfB+ztHZgQmD5D1ZwIKZondJLpimJF1AsF4qBOx/QpRC9A+2E5Jaklver7m2yy8A+aV4wqg9rmi16yDHzmby4Um+tznmYQz7R1rj41+YiIyDwCuU7wLjq+l3qgbM8/IEX9nBd1a7CNiv4zUjahv+73U=
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(36840700001)(46966006)(2906002)(36860700001)(83380400001)(82310400004)(7696005)(70586007)(107886003)(4326008)(47076005)(1076003)(54906003)(70206006)(7636003)(2616005)(356005)(186003)(508600001)(5660300002)(9786002)(8936002)(426003)(6666004)(36756003)(6916009)(26005)(316002)(8676002)(336012)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 19:16:44.1693
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 98830770-7562-4825-2884-08d9b36cc80f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT061.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4794

At the moment, Xen is only handling data abort with valid syndrome (i.e.
ISV=0). Unfortunately, this doesn't cover all the instructions a domain
could use to access MMIO regions.

For instance, Xilinx baremetal OS will use:

        volatile u32 *LocalAddr = (volatile u32 *)Addr;
        *LocalAddr = Value;

This leave the compiler to decide which store instructions to use. This
may be a post-index store instruction where the HW will not provide a
valid syndrome.

In order to handle post-indexing store/load instructions, Xen will need
to fetch and decode the instruction.

This patch only cover post-index store/load instructions from AArch64 mode.
For now, this is left unimplemented for trap from AArch32 mode.

Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
---

Changelog :-

v2 :- 1. Updated the rn register after reading from it. (Pointed by Julien,
 Stefano)
2. Used a union to represent the instruction opcode (Suggestd by Bertrand)
3. Fixed coding style issues (Pointed by Julien)
4. In the previous patch, I was updating dabt->sign based on the signedness of
imm9. This was incorrect. As mentioned in ARMv8 ARM  DDI 0487G.b, Page 3221,
SSE indicates the signedness of the data item loaded. In our case, the data item
loaded is always unsigned.

This has been tested for the following cases :-
ldr x2, [x1], #4

ldr w2, [x1], #-4

str x2, [x1], #4

str w2, [x1], #-4

The reason being  I am testing on 32bit MMIO registers only. I don't see a 8bit
or 16bit MMIO register.

 xen/arch/arm/decode.c     | 68 ++++++++++++++++++++++++++++++++++++++-
 xen/arch/arm/decode.h     |  3 +-
 xen/arch/arm/io.c         | 40 +++++++++++++++++++----
 xen/include/asm-arm/hsr.h | 26 +++++++++++++++
 4 files changed, 129 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
index 792c2e92a7..0b3e8fcbc6 100644
--- a/xen/arch/arm/decode.c
+++ b/xen/arch/arm/decode.c
@@ -84,6 +84,66 @@ bad_thumb2:
     return 1;
 }
 
+static int decode_32bit_loadstore_postindexing(register_t pc,
+                                               struct hsr_dabt *dabt,
+                                               union ldr_str_instr_class *instr)
+{
+    if ( raw_copy_from_guest(&instr->value, (void * __user)pc, sizeof (instr)) )
+        return -EFAULT;
+
+    /* First, let's check for the fixed values */
+    if ( !((instr->code.fixed1 == 1) && (instr->code.fixed2 == 0) &&
+         (instr->code.fixed3 == 0) && (instr->code.fixed4 == 7)) )
+    {
+        gprintk(XENLOG_ERR, "Decoding not supported for instructions other than"
+            " ldr/str post indexing\n");
+        goto bad_32bit_loadstore;
+    }
+
+    if ( instr->code.size != 2 )
+    {
+        gprintk(XENLOG_ERR,
+            "ldr/str post indexing is supported for 32 bit variant only\n");
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
+bad_32bit_loadstore:
+    gprintk(XENLOG_ERR, "unhandled 32bit Arm instruction 0x%x\n", instr->value);
+    return 1;
+}
+
 static int decode_thumb(register_t pc, struct hsr_dabt *dabt)
 {
     uint16_t instr;
@@ -150,11 +210,17 @@ bad_thumb:
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
+        return decode_32bit_loadstore_postindexing(regs->pc, dabt, instr);
+    }
+
     /* TODO: Handle ARM instruction */
     gprintk(XENLOG_ERR, "unhandled ARM instruction\n");
 
diff --git a/xen/arch/arm/decode.h b/xen/arch/arm/decode.h
index 4613763bdb..d82fc4a0f6 100644
--- a/xen/arch/arm/decode.h
+++ b/xen/arch/arm/decode.h
@@ -35,7 +35,8 @@
  */
 
 int decode_instruction(const struct cpu_user_regs *regs,
-                       struct hsr_dabt *dabt);
+                       struct hsr_dabt *dabt,
+                       union ldr_str_instr_class *instr);
 
 #endif /* __ARCH_ARM_DECODE_H_ */
 
diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index 729287e37c..0d60754bc4 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -65,6 +65,16 @@ static enum io_state handle_write(const struct mmio_handler *handler,
     return ret ? IO_HANDLED : IO_ABORT;
 }
 
+static void post_incremenet_register(union ldr_str_instr_class *instr)
+{
+    struct cpu_user_regs *regs = guest_cpu_user_regs();
+    unsigned int val;
+
+    val = get_user_reg(regs, instr->code.rn);
+    val += instr->code.imm9;
+    set_user_reg(regs, instr->code.rn, val);
+}
+
 /* This function assumes that mmio regions are not overlapped */
 static int cmp_mmio_handler(const void *key, const void *elem)
 {
@@ -106,14 +116,26 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
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
+            return IO_ABORT;
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
@@ -122,7 +144,7 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
     }
 
     /* All the instructions used on emulated MMIO region should be valid */
-    if ( !dabt.valid )
+    if ( !info.dabt.valid )
         return IO_ABORT;
 
     /*
@@ -134,7 +156,7 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
     {
         int rc;
 
-        rc = decode_instruction(regs, &info.dabt);
+        rc = decode_instruction(regs, &info.dabt, NULL);
         if ( rc )
         {
             gprintk(XENLOG_DEBUG, "Unable to decode instruction\n");
@@ -143,9 +165,15 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
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
+        post_incremenet_register(&instr);
+    }
+    return rc;
 }
 
 void register_mmio_handler(struct domain *d,
diff --git a/xen/include/asm-arm/hsr.h b/xen/include/asm-arm/hsr.h
index 9b91b28c48..72d67d2801 100644
--- a/xen/include/asm-arm/hsr.h
+++ b/xen/include/asm-arm/hsr.h
@@ -15,6 +15,32 @@ enum dabt_size {
     DABT_DOUBLE_WORD = 3,
 };
 
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
+        int imm9:9;            /* imm9 */
+        unsigned int fixed2:1; /* value == 0b */
+        unsigned int opc:2;    /* opc */
+        unsigned int fixed3:2; /* value == 00b */
+        unsigned int v:1;      /* vector */
+        unsigned int fixed4:3; /* value == 111b */
+        unsigned int size:2;   /* size */
+    } code;
+};
+
 union hsr {
     register_t bits;
     struct {
-- 
2.17.1


