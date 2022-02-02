Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 900A04A76E4
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 18:31:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264368.457462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFJSi-0005io-Gz; Wed, 02 Feb 2022 17:30:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264368.457462; Wed, 02 Feb 2022 17:30:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFJSi-0005ck-Aj; Wed, 02 Feb 2022 17:30:32 +0000
Received: by outflank-mailman (input) for mailman id 264368;
 Wed, 02 Feb 2022 17:30:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FkQ0=SR=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nFJSg-0005L1-KN
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 17:30:30 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20602.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf8c5d90-844d-11ec-8eb8-a37418f5ba1a;
 Wed, 02 Feb 2022 18:30:28 +0100 (CET)
Received: from BN1PR10CA0024.namprd10.prod.outlook.com (2603:10b6:408:e0::29)
 by BY5PR02MB7059.namprd02.prod.outlook.com (2603:10b6:a03:235::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 2 Feb
 2022 17:30:25 +0000
Received: from BN1NAM02FT032.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:e0:cafe::fc) by BN1PR10CA0024.outlook.office365.com
 (2603:10b6:408:e0::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Wed, 2 Feb 2022 17:30:24 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 BN1NAM02FT032.mail.protection.outlook.com (10.13.3.192) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Wed, 2 Feb 2022 17:30:24 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 2 Feb 2022 17:30:23 +0000
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 2 Feb 2022 17:30:23 +0000
Received: from [10.108.8.223] (port=56994 helo=xcbayankuma41x.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nFJSZ-0004a1-Ex; Wed, 02 Feb 2022 17:30:23 +0000
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
X-Inumbo-ID: cf8c5d90-844d-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ecr0UWO4SyOlSiknVVcc+mMeSm6YDy1WGbIqZTjCsehAUh1NZmzu8zC2WtroeeEvk0c+JFSDQ6YxLyZWnINnz30EyxxPzns+o6JHv3+Amr8X9i/CbikJJcct+PL0yeyFDr4LuClyJidy9D7oIGNbV7+o14fHpaZ+PscH3e5/qhwK+wuPG2pJQ6NcENBIYFKHlV1vH32txKjj0xIhgvG3jGsUwIz6zwJyKWN/RVGs0DzSdpvWPlzSaM0t1yYj1AnxPZrlB8abbpnflXb7MZwoKhOkKYnbqGihDegDx/c5MuWrc30k4dM08/9jRAnLM3HiFYdE/qmn5rnEjXg1khs8kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4YH8/TrWz9r2OfPhgV0o4hdK3ZeJHqkEfhXElLsPw90=;
 b=AQxsYg+UT8wU6xAxwV+mJS5VVWhMpfYJAJrROWe8u8pTxbbSTtzxk155kTe4p3OvF9Vk8LqoWvnqUnOncNk/Z8byyvoe6+wjk2VYLbi56cKltcT0sP5ugmLWawwNPhjhpgafaQ/+eGfdpoARYYPPHtjvSj4xejLG+TaSZ+on7+2u9AS0476mTpn973GJQ5Uy94q5uPbsBGBArWcutbSpPYrAiTrRBjRE8s+Db5nitZPbpcY1e77OGfcAw7HgiKcFaH47dGLvgsBYMC8aYcZ1m2B8RB47WbKxbn0ZjjJ9EDVzEYupY2G/hFyZsspN25xQcePw0CKdIWDaEEXuafDYoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4YH8/TrWz9r2OfPhgV0o4hdK3ZeJHqkEfhXElLsPw90=;
 b=o3Dfco2M8+r0G5do2elLljl/5DAg8rHmrxK4/2v/H/lyGuEOMNN15/E4I/qyVF/mwmXafWOqYmMj18aIaqv9NFsJ7he4BPPGTfffVmz85EgcX3sO9cYn4QJNJPd2HuNeAJbktmna2er7ooK586YKsDnVMnE9VC42FiVJOxO6J20=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch02.xlnx.xilinx.com;
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>, Ayan Kumar Halder
	<ayankuma@xilinx.com>
Subject: [XEN v6 2/3] xen/arm64: io: Support instructions (for which ISS is not valid) on emulated MMIO region using MMIO handler
Date: Wed, 2 Feb 2022 17:30:16 +0000
Message-ID: <20220202173017.48463-3-ayankuma@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220202173017.48463-1-ayankuma@xilinx.com>
References: <20220202173017.48463-1-ayankuma@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f3963ef-38f8-40c3-ddbc-08d9e671b249
X-MS-TrafficTypeDiagnostic: BY5PR02MB7059:EE_
X-Microsoft-Antispam-PRVS:
	<BY5PR02MB70592840D48237728856B050B2279@BY5PR02MB7059.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J53F8qZaLUKi8WWrGKTSjg1Nnids8JVZDRyDH+E+DwlqdDXXW/yJR4uroenFaCayNSCy6v91NZoHUdSr4QHx+2QXnqs0VbYdE4mKT5IEeyZuAv7R4sSaskx53cmOXa5Kclm1LeEZmlu30xeJ7+BUBUkhtpdiZ97C33VFxs/t3HBfnBLlQyRz+V+xMBJc1zb870glpgKlwJ9mrMiKsvAomXitQkZbDUlz17Wel2Sn7tSBuU+84vfthgi6Meabh86YG+MUXN95R+avMthc7g9DVzcKv86w57pscouy8g8NkR1yS/OOqSZWp96Do/jqPlCGAT/vn7CfNGnyvGohPlrUVo8pREau3lzigyvloMTQJ5f1/RIhfBhA/iWhCrKLqptedocooewktJhli6zqhHwEjZYNv+MR9TdjT8l1OBstvdIRVQr7cnOia+gNhdZTtChQlNjDPC+g17bK3gPkhEyo1iEmooP8kL7FoAq6tF2Zz4UAneUEqQ6DhxW3/rCDPQox3DvxEBN1y8pCya17D8GMosVCOGPK33RTBwb2itwsPsw/Q9ch39gp5739lqUPdDw+V7nQafEScSUFEkAs+8XSGzUUJ/9G/nB3CETjjdN6VPURrqGEKaMXLhAbDl6CwVlC5qLhD/sramyP9XFjbD+d8Kdbq6HPVl3t8YjHPJkIs12y/ceIFPhAbQPKLLpJ5BBU4/R4Ke1FUaFSifDy5W0C9g==
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch02.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(2616005)(2906002)(36756003)(6666004)(36860700001)(508600001)(26005)(186003)(1076003)(6916009)(107886003)(7696005)(316002)(54906003)(426003)(83380400001)(7636003)(47076005)(70206006)(70586007)(4326008)(8936002)(8676002)(82310400004)(336012)(356005)(5660300002)(9786002)(102446001)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 17:30:24.4795
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f3963ef-38f8-40c3-ddbc-08d9e671b249
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT032.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB7059

For instructions on MMIO regions emulated by Xen, Xen reads the
remaining bits of the HSR. It determines if the instruction is to be
ignored, retried or decoded. If it gets an error while decoding the
instruction, then it sends an abort to the guest.

If the instruction is valid or successfully decoded, Xen tries to
execute the instruction for the emulated MMIO region. If the instruction
was successfully executed, then Xen determines if the instruction needs
further processing. For eg:- In case of ldr/str post indexing on arm64,
the rn register needs to be updated.

Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
---

Changelog :-

v2..v5 - Mentioned in the cover letter.

v6 - 1. Mantained the decoding state of the instruction. This is used by the
caller to either abort the guest or retry or ignore or perform read/write on
the mmio region.

2. try_decode() invokes decoding for both aarch64 and thumb state. (Previously
it used to invoke decoding only for aarch64 state). Thus, it handles all the
checking of the registers before invoking any decoding of instruction.
try_decode_instruction_invalid_iss() has thus been removed.

 xen/arch/arm/arm32/traps.c       |   6 ++
 xen/arch/arm/arm64/traps.c       |  41 ++++++++++++
 xen/arch/arm/decode.h            |  12 +++-
 xen/arch/arm/include/asm/traps.h |   2 +
 xen/arch/arm/io.c                | 108 +++++++++++++++++++++++++------
 5 files changed, 148 insertions(+), 21 deletions(-)

diff --git a/xen/arch/arm/arm32/traps.c b/xen/arch/arm/arm32/traps.c
index 9c9790a6d1..6ad9a31499 100644
--- a/xen/arch/arm/arm32/traps.c
+++ b/xen/arch/arm/arm32/traps.c
@@ -21,6 +21,7 @@
 
 #include <public/xen.h>
 
+#include <asm/mmio.h>
 #include <asm/processor.h>
 #include <asm/traps.h>
 
@@ -82,6 +83,11 @@ void do_trap_data_abort(struct cpu_user_regs *regs)
         do_unexpected_trap("Data Abort", regs);
 }
 
+void post_increment_register(const struct instr_details *instr)
+{
+    ASSERT_UNREACHABLE();
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/arm64/traps.c b/xen/arch/arm/arm64/traps.c
index 9113a15c7a..4de2206801 100644
--- a/xen/arch/arm/arm64/traps.c
+++ b/xen/arch/arm/arm64/traps.c
@@ -18,9 +18,12 @@
 
 #include <xen/lib.h>
 
+#include <asm/current.h>
 #include <asm/hsr.h>
+#include <asm/mmio.h>
 #include <asm/system.h>
 #include <asm/processor.h>
+#include <asm/regs.h>
 
 #include <public/xen.h>
 
@@ -44,6 +47,44 @@ void do_bad_mode(struct cpu_user_regs *regs, int reason)
     panic("bad mode\n");
 }
 
+void post_increment_register(const struct instr_details *instr)
+{
+    struct cpu_user_regs *regs = guest_cpu_user_regs();
+    register_t val;
+
+    /*
+     * Handle when rn = SP
+     * Refer ArmV8 ARM DDI 0487G.b, Page - D1-2463 "Stack pointer register selection"
+     * t = SP_EL0
+     * h = SP_ELx
+     * and M[3:0] (Page - C5-474 "When exception taken from AArch64 state:")
+     */
+    if (instr->rn == 31 )
+    {
+        if ( (regs->cpsr & PSR_MODE_MASK) == PSR_MODE_EL1h )
+            val = regs->sp_el1;
+        else if ( ((regs->cpsr & PSR_MODE_MASK) == PSR_MODE_EL1t) ||
+                    ((regs->cpsr & PSR_MODE_MASK) == PSR_MODE_EL0t) )
+            val = regs->sp_el0;
+        else
+            ASSERT_UNREACHABLE();
+    }
+    else
+        val = get_user_reg(regs, instr->rn);
+
+    val += instr->imm9;
+
+    if ( instr->rn == 31 )
+    {
+        if ( (regs->cpsr & PSR_MODE_MASK) == PSR_MODE_EL1h )
+            regs->sp_el1 = val;
+        else
+            regs->sp_el0 = val;
+    }
+    else
+        set_user_reg(regs, instr->rn, val);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/decode.h b/xen/arch/arm/decode.h
index fe7512a053..5efd72405e 100644
--- a/xen/arch/arm/decode.h
+++ b/xen/arch/arm/decode.h
@@ -52,7 +52,17 @@ union instr {
 #define POST_INDEX_FIXED_MASK   0x3B200C00
 #define POST_INDEX_FIXED_VALUE  0x38000400
 
-/* Decode an instruction from pc
+enum instr_decode_state
+{
+    INSTR_ERROR, /* Error encountered while decoding the instruction */
+    INSTR_VALID, /* ISS is valid, so there is no need to decode */
+    INSTR_SUCCESS, /* Instruction is decoded successfully */
+    INSTR_IGNORE, /* Instruction is to be ignored (similar to NOP) */
+    INSTR_RETRY /* Instruction is to be retried */
+};
+
+/*
+ * Decode an instruction from pc
  * /!\ This function is intended to decode an instruction. It considers that the
  * instruction is valid.
  *
diff --git a/xen/arch/arm/include/asm/traps.h b/xen/arch/arm/include/asm/traps.h
index 2ed2b85c6f..95c46ad391 100644
--- a/xen/arch/arm/include/asm/traps.h
+++ b/xen/arch/arm/include/asm/traps.h
@@ -109,6 +109,8 @@ static inline register_t sign_extend(const struct hsr_dabt dabt, register_t r)
     return r;
 }
 
+void post_increment_register(const struct instr_details *instr);
+
 #endif /* __ASM_ARM_TRAPS__ */
 /*
  * Local variables:
diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index a289d393f9..1011327058 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -95,6 +95,59 @@ static const struct mmio_handler *find_mmio_handler(struct domain *d,
     return handler;
 }
 
+enum instr_decode_state try_decode_instruction(const struct cpu_user_regs *regs,
+                                               mmio_info_t *info)
+{
+    int rc;
+
+    /*
+     * Erratum 766422: Thumb store translation fault to Hypervisor may
+     * not have correct HSR Rt value.
+     */
+    if ( check_workaround_766422() && (regs->cpsr & PSR_THUMB) &&
+         info->dabt.write )
+    {
+        rc = decode_instruction(regs, info);
+        if ( rc )
+        {
+            gprintk(XENLOG_DEBUG, "Unable to decode instruction\n");
+            return INSTR_ERROR;
+        }
+    }
+
+    /* If ISS is valid, then no need to decode the instruction any further */
+    if (info->dabt.valid)
+        return INSTR_VALID;
+
+    /*
+     * Xen should not decode the instruction when it was trapped due to
+     * translation fault.
+     */
+    if ( info->dabt.s1ptw )
+        return INSTR_RETRY;
+
+    /*
+     * If the fault occurred due to cache maintenance or address translation
+     * instructions, then Xen needs to ignore these instructions.
+     */
+    if ( info->dabt.cache )
+        return INSTR_IGNORE;
+
+    /*
+     * Armv8 processor does not provide a valid syndrome for decoding some
+     * instructions. So in order to process these instructions, Xen must
+     * decode them.
+     */
+    rc = decode_instruction(regs, info);
+    if ( rc )
+    {
+        gprintk(XENLOG_ERR, "Unable to decode instruction\n");
+        return INSTR_ERROR;
+    }
+    else
+        return INSTR_SUCCESS;
+}
+
 enum io_state try_handle_mmio(struct cpu_user_regs *regs,
                               const union hsr hsr,
                               paddr_t gpa)
@@ -106,14 +159,14 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
         .gpa = gpa,
         .dabt = dabt
     };
+    int rc;
+    enum instr_decode_state state;
 
     ASSERT(hsr.ec == HSR_EC_DATA_ABORT_LOWER_EL);
 
     handler = find_mmio_handler(v->domain, info.gpa);
     if ( !handler )
     {
-        int rc;
-
         rc = try_fwd_ioserv(regs, v, &info);
         if ( rc == IO_HANDLED )
             return handle_ioserv(regs, v);
@@ -121,31 +174,46 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
         return rc;
     }
 
-    /* All the instructions used on emulated MMIO region should be valid */
-    if ( !dabt.valid )
+    state = try_decode_instruction(regs, &info);
+
+    /*
+     * If the instruction was to be ignored by Xen, then it should return to the
+     * caller which will increment the PC, so that the guest can execute the
+     * next instruction.
+     */
+    if ( state == INSTR_IGNORE )
+        return IO_HANDLED;
+    /*
+     * If Xen could not decode the instruction for any reason, then it should
+     * ask the caller to abort the guest.
+     */
+    else if ( state == INSTR_ERROR )
         return IO_ABORT;
+    /* When the instruction needs to be retried by the guest */
+    else if ( state == INSTR_RETRY )
+        return IO_UNHANDLED;
 
     /*
-     * Erratum 766422: Thumb store translation fault to Hypervisor may
-     * not have correct HSR Rt value.
+     * At this point, we know that the instruction is either valid or has been
+     * decoded successfully. Thus, Xen should be allowed to execute the
+     * instruction on the emulated MMIO region.
      */
-    if ( check_workaround_766422() && (regs->cpsr & PSR_THUMB) &&
-         dabt.write )
-    {
-        int rc;
+    if ( info.dabt.write )
+        rc = handle_write(handler, v, &info);
+    else
+        rc = handle_read(handler, v, &info);
 
-        rc = decode_instruction(regs, &info);
-        if ( rc )
-        {
-            gprintk(XENLOG_DEBUG, "Unable to decode instruction\n");
-            return IO_ABORT;
-        }
+    /*
+     * If the instruction was decoded and has executed successfully on the MMIO
+     * region, then Xen should execute the next part of the instruction. (for eg
+     * increment the rn if it is a post-indexing instruction.
+     */
+    if ( (rc == IO_HANDLED) && (state == INSTR_SUCCESS) )
+    {
+        post_increment_register(&info.dabt_instr);
     }
 
-    if ( info.dabt.write )
-        return handle_write(handler, v, &info);
-    else
-        return handle_read(handler, v, &info);
+    return rc;
 }
 
 void register_mmio_handler(struct domain *d,
-- 
2.17.1


