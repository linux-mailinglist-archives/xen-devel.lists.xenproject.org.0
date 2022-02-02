Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 131084A76E3
	for <lists+xen-devel@lfdr.de>; Wed,  2 Feb 2022 18:31:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.264369.457478 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFJSk-0006AY-Vw; Wed, 02 Feb 2022 17:30:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 264369.457478; Wed, 02 Feb 2022 17:30:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nFJSk-00067X-Qt; Wed, 02 Feb 2022 17:30:34 +0000
Received: by outflank-mailman (input) for mailman id 264369;
 Wed, 02 Feb 2022 17:30:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FkQ0=SR=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nFJSj-0005L1-85
 for xen-devel@lists.xenproject.org; Wed, 02 Feb 2022 17:30:33 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20619.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d15def38-844d-11ec-8eb8-a37418f5ba1a;
 Wed, 02 Feb 2022 18:30:31 +0100 (CET)
Received: from BN6PR17CA0019.namprd17.prod.outlook.com (2603:10b6:404:65::29)
 by MW2PR02MB3723.namprd02.prod.outlook.com (2603:10b6:907:2::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 2 Feb
 2022 17:30:27 +0000
Received: from BN1NAM02FT059.eop-nam02.prod.protection.outlook.com
 (2603:10b6:404:65:cafe::55) by BN6PR17CA0019.outlook.office365.com
 (2603:10b6:404:65::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12 via Frontend
 Transport; Wed, 2 Feb 2022 17:30:26 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 BN1NAM02FT059.mail.protection.outlook.com (10.13.2.167) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4951.12 via Frontend Transport; Wed, 2 Feb 2022 17:30:26 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 2 Feb 2022 17:30:25 +0000
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 2 Feb 2022 17:30:25 +0000
Received: from [10.108.8.223] (port=56994 helo=xcbayankuma41x.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nFJSb-0004a1-40; Wed, 02 Feb 2022 17:30:25 +0000
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
X-Inumbo-ID: d15def38-844d-11ec-8eb8-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K/xXI7VBDuHNUcEW09Pw1ZV/ca2/buIrkWbnM/kAEGyegdmLNjEbqrZwAp+aHnpJlWI1Pp0D5HHXfLHQNuxlBm9eQ12u0a3gsUbrZZvrDT43H1E8ZcIh/4sSSPFy7fm+ybuC4Bz4T99oGXSEokIihXTwLCwO3EesdV2mfVzpWuLauLI56QQDt1qIsSsolG51HRhleXS9fr6RrLXDpMegIEmVAnOXrQfC4Gbh7Q3KCQxIIMYM2dN4hNfjZstaRL22v1R3L6KpdB9GvYfb5t3nVS1UEXCiG1uyTOdkTlbNYpjuRV7c2d0UHJMHKdvfz7vMGrbwaMIbJhuLk8LD2J0c7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tbCuvUCFusZf+eCXK+aysJFXbfAHB5vy5OzbqrLtyaI=;
 b=PO9UHz0QMO5H08b7doM1oo1RdfsFCRCYrk/w8LAwTnveuV5ueY5ca3Wcg89kBFB2raC0FlmFEZ70DZOXe/dh7mZqnrjMXhqX0ir/SHtrLRtFQfXtywXSImjjGZR7yGlmu8SUo0IpAHdiCM/9QlJcS89VQbMoMHXwI7n1CKD5T4eczBFPHVRI6wPwXj8vmCiTSqzRYM3fTCRGjOKtKFdDDlCCEMThwOWSxxj+jK2EgHmt9WeyvHeHG+zmEdJLXXVbU8JSFXCaFhAaxgRuiV0eYvEy7YgwA2QBKlEtM1K9/EOXnVFgDC8OQrvhFP6Hz5AD9hY5jRNGhTBe6LtMyD1JJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tbCuvUCFusZf+eCXK+aysJFXbfAHB5vy5OzbqrLtyaI=;
 b=SMxxHNGZRLH06eLu1RF9MiSdrY2tQ3XpRzYwjRNtMskpSnn6uV+gxwlOaNAdQmo1QrE3jdRJFTH2+Ubk3GU8tvjo/KOACnob9MGArRSRJ6sqzFtVlhiEetIvYnGSzq+zk/aOG5dwu5UkHpJEGOfvnSQIA76Dfjpx815ttQsirq8=
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
Subject: [XEN v6 3/3] xen/arm64: io: Support instructions (for which ISS is not valid) on emulated MMIO region using ioreq handler
Date: Wed, 2 Feb 2022 17:30:17 +0000
Message-ID: <20220202173017.48463-4-ayankuma@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220202173017.48463-1-ayankuma@xilinx.com>
References: <20220202173017.48463-1-ayankuma@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ccfdd79-e2d4-4e90-5ac6-08d9e671b360
X-MS-TrafficTypeDiagnostic: MW2PR02MB3723:EE_
X-Microsoft-Antispam-PRVS:
	<MW2PR02MB3723B59FB274AC04A6D085E0B2279@MW2PR02MB3723.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wd1Ryo6gPBmRpXWngbYO46x8ZFXKawG6/21eIeZqz+toOQrbWs24X9o2N3nP+l1RzWIKy8llJ36y+D0V5JYZuFtelPg7pFwQSjgg2jfBCiAe5MdY661Va9w148ARP/r/I5qCweZ33uKNCXYq+H+6eun888CM5NVnEKTzB8NKbshD3pBCNBHCbYxp4C/hVbIL9rwUKhwYkDh/MDd5uGS9owyX7MeBqj2R5nXsF0JL8A3TPXQNtU0xtb5dxJoR061NgtC1i4stSzrbTHFcK1QcSpblZhVYmP723oern1Ma+o/vYYgWoLykqjTE8gAq8fBWNes1002L6Pxb+Sq0m+KO2lA/Fy16pMaFXLtsUjUfCy9o2AThKhP+qxpdnvM0v6jajsSpncvhyMHBhcPqQKWgYTLH4YTWWALspxW1DQ24JZ74ueAu98HuVpq2qJa0vPhg/1bI1EZUmBxi3aZSLUEIu2geKO/la8kRCdJLcH6+C4uHhQph4Dxe1pc3n4QZ1O+y1CTYf9WPFZSaddMEurFNByvCn96NTzAlsVxWTx4tMETTLts1LN/5z8CHR8og6tuDt7cAdE7Bs9tvYFHIa9+xPkSHXXlv2Ml/6s34yD7sNOfdFPY+O0ilSIYGkgfCxc6GwkDVtkRKzn4qZL/3ksDo2zX+Bdl+RWKP6eeVGzGMRFuVp0jQxNQncwCmJ2emWJZn9AC59hWCrBwc6N55Pyy+lg==
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(7636003)(82310400004)(2906002)(356005)(7696005)(6666004)(5660300002)(2616005)(9786002)(36860700001)(336012)(107886003)(47076005)(83380400001)(70586007)(70206006)(1076003)(8936002)(8676002)(54906003)(36756003)(4326008)(6916009)(426003)(186003)(316002)(26005)(30864003)(508600001)(102446001)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2022 17:30:26.3046
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ccfdd79-e2d4-4e90-5ac6-08d9e671b360
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT059.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR02MB3723

When an instruction is trapped in Xen due to translation fault, Xen checks if
the ISS is valid. If not, Xen tries to resolve the translation fault using
p2m page tables. In case if it is a data abort, Xen will try to map the mmio
region to the guest (ie tries to emulate the mmio region).

If it is not successfull, then it tries to decode the instruction.
It saves the decoding state, rn and imm9 to ioreq. Whenever the vcpu handles
the ioreq successfully, it will read the decoding state to determine if the
instruction decoded was a ldr/str post indexing (ie INSTR_LDR_STR_POSTINDEXING).
If so, it uses these details to post increment rn.

Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
---

Changelog :-

v2..v5 - Provided in cover letter.

v6 - 1. Introduced a new field('enum instr_decode_state state') inside
'struct instr_details'. This holds the decoding state of the instruction.
This is later read by the post_increment_register() to determine if rn needs to
be incremented. Also, this is read by the callers of try_decode_instruction()
to determine if the instruction was valid or ignored or to be retried or
error or decoded successfully.

2. Also stored 'instr_details' inside 'struct ioreq'. This enables
arch_ioreq_complete_mmio() to invoke post_increment_register() without decoding
the instruction again.

3. Check hsr.dabt.valid in do_trap_stage2_abort_guest(). If it is not valid,
then decode the instruction. This ensures that try_handle_mmio() is invoked only
when the instruction is either valid or decoded successfully.

4. Inside do_trap_stage2_abort_guest(), if hsr.dabt.valid is not set, then
resolve the translation fault before trying to decode the instruction. If
translation fault is resolved, then return to the guest to execute the instruction
again.

 xen/arch/arm/arm64/traps.c      |  4 +++
 xen/arch/arm/decode.c           |  1 +
 xen/arch/arm/decode.h           |  9 ------
 xen/arch/arm/include/asm/mmio.h | 13 ++++++++
 xen/arch/arm/io.c               | 56 ++++++++++-----------------------
 xen/arch/arm/ioreq.c            | 13 +++++---
 xen/arch/arm/traps.c            | 56 +++++++++++++++++++++++++++++++--
 xen/include/public/hvm/ioreq.h  | 19 +++++------
 8 files changed, 108 insertions(+), 63 deletions(-)

diff --git a/xen/arch/arm/arm64/traps.c b/xen/arch/arm/arm64/traps.c
index 4de2206801..505a843b07 100644
--- a/xen/arch/arm/arm64/traps.c
+++ b/xen/arch/arm/arm64/traps.c
@@ -52,6 +52,10 @@ void post_increment_register(const struct instr_details *instr)
     struct cpu_user_regs *regs = guest_cpu_user_regs();
     register_t val;
 
+    /* Currently, we handle only ldr/str post indexing instructions */
+    if ( instr->state != INSTR_LDR_STR_POSTINDEXING )
+        return;
+
     /*
      * Handle when rn = SP
      * Refer ArmV8 ARM DDI 0487G.b, Page - D1-2463 "Stack pointer register selection"
diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
index 3f2d2a3f62..0a4d9d2772 100644
--- a/xen/arch/arm/decode.c
+++ b/xen/arch/arm/decode.c
@@ -147,6 +147,7 @@ static int decode_arm64(register_t pc, mmio_info_t *info)
 
     update_dabt(dabt, opcode.ldr_str.rt, opcode.ldr_str.size, false);
 
+    dabt_instr->state = INSTR_LDR_STR_POSTINDEXING;
     dabt_instr->rn = opcode.ldr_str.rn;
     dabt_instr->imm9 = opcode.ldr_str.imm9;
 
diff --git a/xen/arch/arm/decode.h b/xen/arch/arm/decode.h
index 5efd72405e..6a09b07b46 100644
--- a/xen/arch/arm/decode.h
+++ b/xen/arch/arm/decode.h
@@ -52,15 +52,6 @@ union instr {
 #define POST_INDEX_FIXED_MASK   0x3B200C00
 #define POST_INDEX_FIXED_VALUE  0x38000400
 
-enum instr_decode_state
-{
-    INSTR_ERROR, /* Error encountered while decoding the instruction */
-    INSTR_VALID, /* ISS is valid, so there is no need to decode */
-    INSTR_SUCCESS, /* Instruction is decoded successfully */
-    INSTR_IGNORE, /* Instruction is to be ignored (similar to NOP) */
-    INSTR_RETRY /* Instruction is to be retried */
-};
-
 /*
  * Decode an instruction from pc
  * /!\ This function is intended to decode an instruction. It considers that the
diff --git a/xen/arch/arm/include/asm/mmio.h b/xen/arch/arm/include/asm/mmio.h
index 3354d9c635..f7cdf66a5b 100644
--- a/xen/arch/arm/include/asm/mmio.h
+++ b/xen/arch/arm/include/asm/mmio.h
@@ -26,12 +26,23 @@
 
 #define MAX_IO_HANDLER  16
 
+enum instr_decode_state
+{
+    INSTR_ERROR,                    /* Error encountered while decoding the instruction */
+    INSTR_VALID,                    /* ISS is valid, so there is no need to decode */
+    INSTR_LDR_STR_POSTINDEXING,     /* Instruction is decoded successfully.
+                                       It is ldr/str post indexing */
+    INSTR_IGNORE,                   /* Instruction is to be ignored (similar to NOP) */
+    INSTR_RETRY                     /* Instruction is to be retried */
+};
+
 typedef struct
 {
     struct hsr_dabt dabt;
     struct instr_details {
         unsigned long rn:5;
         signed int imm9:9;
+        enum instr_decode_state state;
     } dabt_instr;
     paddr_t gpa;
 } mmio_info_t;
@@ -77,6 +88,8 @@ void register_mmio_handler(struct domain *d,
 int domain_io_init(struct domain *d, int max_count);
 void domain_io_free(struct domain *d);
 
+void try_decode_instruction(const struct cpu_user_regs *regs,
+                            mmio_info_t *info);
 
 #endif  /* __ASM_ARM_MMIO_H__ */
 
diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index 1011327058..46726637c6 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -95,8 +95,8 @@ static const struct mmio_handler *find_mmio_handler(struct domain *d,
     return handler;
 }
 
-enum instr_decode_state try_decode_instruction(const struct cpu_user_regs *regs,
-                                               mmio_info_t *info)
+void try_decode_instruction(const struct cpu_user_regs *regs,
+                            mmio_info_t *info)
 {
     int rc;
 
@@ -111,27 +111,37 @@ enum instr_decode_state try_decode_instruction(const struct cpu_user_regs *regs,
         if ( rc )
         {
             gprintk(XENLOG_DEBUG, "Unable to decode instruction\n");
-            return INSTR_ERROR;
+            info->dabt_instr.state = INSTR_ERROR;
+            return;
         }
     }
 
     /* If ISS is valid, then no need to decode the instruction any further */
     if (info->dabt.valid)
-        return INSTR_VALID;
+    {
+        info->dabt_instr.state = INSTR_VALID;
+        return;
+    }
 
     /*
      * Xen should not decode the instruction when it was trapped due to
      * translation fault.
      */
     if ( info->dabt.s1ptw )
-        return INSTR_RETRY;
+    {
+        info->dabt_instr.state = INSTR_RETRY;
+        return;
+    }
 
     /*
      * If the fault occurred due to cache maintenance or address translation
      * instructions, then Xen needs to ignore these instructions.
      */
     if ( info->dabt.cache )
-        return INSTR_IGNORE;
+    {
+        info->dabt_instr.state = INSTR_IGNORE;
+        return;
+    }
 
     /*
      * Armv8 processor does not provide a valid syndrome for decoding some
@@ -142,10 +152,8 @@ enum instr_decode_state try_decode_instruction(const struct cpu_user_regs *regs,
     if ( rc )
     {
         gprintk(XENLOG_ERR, "Unable to decode instruction\n");
-        return INSTR_ERROR;
+        info->dabt_instr.state = INSTR_ERROR;
     }
-    else
-        return INSTR_SUCCESS;
 }
 
 enum io_state try_handle_mmio(struct cpu_user_regs *regs,
@@ -160,7 +168,6 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
         .dabt = dabt
     };
     int rc;
-    enum instr_decode_state state;
 
     ASSERT(hsr.ec == HSR_EC_DATA_ABORT_LOWER_EL);
 
@@ -174,25 +181,6 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
         return rc;
     }
 
-    state = try_decode_instruction(regs, &info);
-
-    /*
-     * If the instruction was to be ignored by Xen, then it should return to the
-     * caller which will increment the PC, so that the guest can execute the
-     * next instruction.
-     */
-    if ( state == INSTR_IGNORE )
-        return IO_HANDLED;
-    /*
-     * If Xen could not decode the instruction for any reason, then it should
-     * ask the caller to abort the guest.
-     */
-    else if ( state == INSTR_ERROR )
-        return IO_ABORT;
-    /* When the instruction needs to be retried by the guest */
-    else if ( state == INSTR_RETRY )
-        return IO_UNHANDLED;
-
     /*
      * At this point, we know that the instruction is either valid or has been
      * decoded successfully. Thus, Xen should be allowed to execute the
@@ -203,16 +191,6 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
     else
         rc = handle_read(handler, v, &info);
 
-    /*
-     * If the instruction was decoded and has executed successfully on the MMIO
-     * region, then Xen should execute the next part of the instruction. (for eg
-     * increment the rn if it is a post-indexing instruction.
-     */
-    if ( (rc == IO_HANDLED) && (state == INSTR_SUCCESS) )
-    {
-        post_increment_register(&info.dabt_instr);
-    }
-
     return rc;
 }
 
diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
index 308650b400..d8909aa903 100644
--- a/xen/arch/arm/ioreq.c
+++ b/xen/arch/arm/ioreq.c
@@ -23,10 +23,13 @@
 
 #include <public/hvm/ioreq.h>
 
+#include "decode.h"
+
 enum io_state handle_ioserv(struct cpu_user_regs *regs, struct vcpu *v)
 {
     const union hsr hsr = { .bits = regs->hsr };
-    const struct hsr_dabt dabt = hsr.dabt;
+    struct hsr_dabt dabt = hsr.dabt;
+
     /* Code is similar to handle_read */
     register_t r = v->io.req.data;
 
@@ -61,10 +64,13 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
          */
         .df = 0,
         .data = get_user_reg(regs, info->dabt.reg),
+        .dabt_instr = &info->dabt_instr,
         .state = STATE_IOREQ_READY,
     };
     struct ioreq_server *s = NULL;
     enum io_state rc;
+    bool instr_decoded = false;
+    const union hsr hsr = { .bits = regs->hsr };
 
     if ( vio->req.state != STATE_IOREQ_NONE )
     {
@@ -76,9 +82,6 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
     if ( !s )
         return IO_UNHANDLED;
 
-    if ( !info->dabt.valid )
-        return IO_ABORT;
-
     vio->req = p;
 
     rc = ioreq_send(s, &p, 0);
@@ -95,6 +98,7 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
 bool arch_ioreq_complete_mmio(void)
 {
     struct vcpu *v = current;
+    struct instr_details *dabt_instr = v->io.req.dabt_instr;
     struct cpu_user_regs *regs = guest_cpu_user_regs();
     const union hsr hsr = { .bits = regs->hsr };
 
@@ -106,6 +110,7 @@ bool arch_ioreq_complete_mmio(void)
 
     if ( handle_ioserv(regs, v) == IO_HANDLED )
     {
+        post_increment_register(dabt_instr);
         advance_pc(regs, hsr);
         return true;
     }
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 9339d12f58..6cce2379fa 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1906,6 +1906,7 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
     paddr_t gpa;
     uint8_t fsc = xabt.fsc & ~FSC_LL_MASK;
     bool is_data = (hsr.ec == HSR_EC_DATA_ABORT_LOWER_EL);
+    mmio_info_t info;
 
     /*
      * If this bit has been set, it means that this stage-2 abort is caused
@@ -1959,6 +1960,51 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
         return;
     }
     case FSC_FLT_TRANS:
+
+        info.gpa = gpa;
+        info.dabt = hsr.dabt;
+
+        /* Check if the ISS is valid. */
+        if ( !hsr.dabt.valid )
+        {
+
+            /*
+             * Assumption :- Most of the times when we get a translation fault
+             * and the ISS is invalid, the underlying cause is that the page
+             * tables have not been set up correctly.
+             * First check if the translation fault can be resolved by the
+             * P2M subsystem. If that's the case nothing else to do.
+             */
+            if ( p2m_resolve_translation_fault(current->domain,
+                                           gaddr_to_gfn(gpa)) )
+                return;
+
+            if ( is_data && try_map_mmio(gaddr_to_gfn(gpa)) )
+                return;
+
+            try_decode_instruction(regs, &info);
+
+            /*
+             * If the instruction was to be ignored by Xen, then it should return to the
+             * caller which will increment the PC, so that the guest can execute the
+             * next instruction.
+             */
+            if ( info.dabt_instr.state == INSTR_IGNORE )
+            {
+                advance_pc(regs, hsr);
+                return;
+            }
+            /*
+             * If Xen could not decode the instruction for any reason, then it should
+             * ask the caller to abort the guest.
+             */
+            else if ( info.dabt_instr.state == INSTR_ERROR )
+                goto inject_abt;
+            /* When the instruction needs to be retried by the guest */
+            else if ( info.dabt_instr.state == INSTR_RETRY )
+                return;
+        }
+
         /*
          * Attempt first to emulate the MMIO as the data abort will
          * likely happen in an emulated region.
@@ -1975,6 +2021,13 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
                 goto inject_abt;
             case IO_HANDLED:
                 advance_pc(regs, hsr);
+                /*
+                 * If the instruction was decoded and has executed successfully
+                 * on the MMIO region, then Xen should execute the next part of
+                 * the instruction. (for eg increment the rn if it is a
+                 * post-indexing instruction.
+                 */
+                post_increment_register(&info.dabt_instr);
                 return;
             case IO_RETRY:
                 /* finish later */
@@ -1985,8 +2038,7 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
             }
         }
 
-        /*
-         * First check if the translation fault can be resolved by the
+        /* First check if the translation fault can be resolved by the
          * P2M subsystem. If that's the case nothing else to do.
          */
         if ( p2m_resolve_translation_fault(current->domain,
diff --git a/xen/include/public/hvm/ioreq.h b/xen/include/public/hvm/ioreq.h
index c511fae8e7..e4183960d8 100644
--- a/xen/include/public/hvm/ioreq.h
+++ b/xen/include/public/hvm/ioreq.h
@@ -50,19 +50,20 @@
  * SEGMENT |BUS   |DEV   |FN    |OFFSET
  */
 struct ioreq {
-    uint64_t addr;          /* physical address */
-    uint64_t data;          /* data (or paddr of data) */
-    uint32_t count;         /* for rep prefixes */
-    uint32_t size;          /* size in bytes */
-    uint32_t vp_eport;      /* evtchn for notifications to/from device model */
+    uint64_t addr;                   /* physical address */
+    uint64_t data;                   /* data (or paddr of data) */
+    uint32_t count;                  /* for rep prefixes */
+    uint32_t size;                   /* size in bytes */
+    uint32_t vp_eport;               /* evtchn for notifications to/from device model */
     uint16_t _pad0;
     uint8_t state:4;
-    uint8_t data_is_ptr:1;  /* if 1, data above is the guest paddr
-                             * of the real data to use. */
-    uint8_t dir:1;          /* 1=read, 0=write */
+    uint8_t data_is_ptr:1;           /* if 1, data above is the guest paddr
+                                      * of the real data to use. */
+    uint8_t dir:1;                   /* 1=read, 0=write */
     uint8_t df:1;
     uint8_t _pad1:1;
-    uint8_t type;           /* I/O type */
+    uint8_t type;                     /* I/O type */
+    struct instr_details *dabt_instr; /* when the instruction is decoded */
 };
 typedef struct ioreq ioreq_t;
 
-- 
2.17.1


