Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40145457377
	for <lists+xen-devel@lfdr.de>; Fri, 19 Nov 2021 17:52:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.228129.394669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo77o-0006ib-4P; Fri, 19 Nov 2021 16:52:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 228129.394669; Fri, 19 Nov 2021 16:52:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mo77o-0006fc-0f; Fri, 19 Nov 2021 16:52:32 +0000
Received: by outflank-mailman (input) for mailman id 228129;
 Fri, 19 Nov 2021 16:52:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hxJH=QG=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1mo77m-0006fW-BT
 for xen-devel@lists.xenproject.org; Fri, 19 Nov 2021 16:52:30 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20605.outbound.protection.outlook.com
 [2a01:111:f400:7eab::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14076754-4959-11ec-9787-a32c541c8605;
 Fri, 19 Nov 2021 17:52:28 +0100 (CET)
Received: from SN6PR2101CA0015.namprd21.prod.outlook.com
 (2603:10b6:805:106::25) by SA2PR02MB7628.namprd02.prod.outlook.com
 (2603:10b6:806:136::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Fri, 19 Nov
 2021 16:52:24 +0000
Received: from SN1NAM02FT0015.eop-nam02.prod.protection.outlook.com
 (2603:10b6:805:106:cafe::d0) by SN6PR2101CA0015.outlook.office365.com
 (2603:10b6:805:106::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.11 via Frontend
 Transport; Fri, 19 Nov 2021 16:52:24 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 SN1NAM02FT0015.mail.protection.outlook.com (10.97.5.180) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Fri, 19 Nov 2021 16:52:23 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 19 Nov 2021 16:52:22 +0000
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 19 Nov 2021 16:52:22 +0000
Received: from [10.108.8.223] (port=42001 helo=xcbayankuma41x.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1mo77S-0001bR-4n; Fri, 19 Nov 2021 16:52:17 +0000
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
X-Inumbo-ID: 14076754-4959-11ec-9787-a32c541c8605
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VijbQ5In2bjagNkAJb26AQhEWFnebJvL17Cxx01mUOIwqwKgdvfWvzFjku6MQXhBkUkwkLNM8CX+Ng16rIZ7riQ1Y7gPv5UBeLCqcR8T4DGCN0775xB8Nolj0/Slv4OhFvmK4yM3W6TRgVZGOGW6BIEw44GlaZdf+mM8DCWznbmFEjEhzNuEcozmaBNBeISKzzIxUtXsddAUN1kg+seJOEFyk9bFc3m2eyMORAuK3wfFfVRvo8nd2A/JlKL1S3xklWSZPdvk7q5tzk+eS4W4Cd2Ed4RBAavGVMpzzpnC4PhgRaVSZR5ssShHpVS3J7fyaCfpohOMO7HyVCetr4Lgsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s7AFil2/NAILKTxKK9oRf8FnqF44xYUIO+RAbt3GnTU=;
 b=EqYEFiKZ3LDMXSJ1YUvOIqHlaeiI2cXq0E9tQhE1ZGLaKa23fgzaP1RVOhDWKsSnlKZBX8pD3fLh/uqief3FieT4mC27sXUwxJqnlrahkqjyTFRAhfdOUmaPLBdfUwUL9im+c+2v6wve4o1ih2gK4OyAtDBqamYUHOMPq/0vquYLGvC+7s7ME8IYisT96bK0+ITt18QthlQXCyuRlBIQCkKOvPzJMihO3x2Fa9QP5Ee4qIhqR7M02roF4Nhcr18oJ0jiZxOo+iE2d9wSiIEaDEPRC4ZQx7+Z0Gr0mSFXO0MKrm0yEvWCzzTBx4EHA6XMZz6CbnCx9SRCEY3/Ushv0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s7AFil2/NAILKTxKK9oRf8FnqF44xYUIO+RAbt3GnTU=;
 b=plVWlqYNq8EARAk6vkZf/qCQz6WjZdhLgmEOlxasTYhjRl59BoVCSejwNK6vdNxdTLkd4JVdD9lQo3J71atHHgpRGWtmzMVWsUwIpg5qdYU3Z6V/EUu7wMoxekHSGxmjB5CHrb9fqIJAgNGfSQroqy5ykZ9MePmSBsjdDz5qP/U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
From: Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@xilinx.com>,
	<julien@xen.org>, <Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<rahul.singh@arm.com>, <ayankuma@xilinx.com>
Subject: [RFC PATCH] Added the logic to decode 32 bit ldr/str post-indexing instructions
Date: Fri, 19 Nov 2021 16:52:02 +0000
Message-ID: <20211119165202.42442-1-ayankuma@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6dc964f8-cacf-4309-c5c6-08d9ab7cf5d8
X-MS-TrafficTypeDiagnostic: SA2PR02MB7628:
X-Microsoft-Antispam-PRVS:
	<SA2PR02MB762817A4CA3AF1AC95F6CB60B29C9@SA2PR02MB7628.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DQmWPXPxYavONw7py42DGNdVPmOoZgNMNIAZwGnSW2Fx7LuQBIdYl97HGepsXn6NBccciS7yj+zMrKH1xNuvKJp7M892jLkt0eHhA9ZHGPXt39e/YreuZRlA769o0Jo7YxNFdZeRQXk5yHBKTop+AH4KC++wOlN9GJ+2CeXhrP17LWbugAZtsZNpb0M/ZuSqH9MyPBXjawq2CICfUlVtTgH+cVkNw6Nuk9oWFZzrLRLV2hCfMELHpZkAdny17N/L806ER5prKeXtRSg1VrI4aXD5ue+qfWO6k/0XR2WQRQ0ed7DQNPZuv0/JewoZlvziEWlooZT4u6yz+pYN8aThYuv/U6Qf53eX5GgJfetL8J1cw/4nfGm46akUHdHw1C0Po1miz8TTjpBGsR88JgsYBaamQ4jETEVBNnqKAFeUlun1O7qVj6RypfPQ3Rs6VEOU+k34uFiFT/JE1PzSn+tMgKf5wmkSfmRSSYqawmgA9tPnKUy9eeQCQX9Y8atSD9X7Kn9odwVOx+dHOfsK6VTUChNIqdrK2mQgOCQJ+KFOBlietOt55Pfl0NzpULHCJWBFO2wdZE5mAbMl+C7HaH3em0Xc3D66wRAOv7JQUpVF8xkPHQaphH0ZkGBZN32QVDh+2mWRCdWO5Kn2x33BG6HcaZRZQsu2ZvF7uiz0a29D1mbLBsWTkAdmOCDBU86qNmACE5gX5711bDItkEr8ImL6QqaExqAxtQ4tn/Bg+c7ni+3JmbncYGMeZtwIbvememDnNlg5/FjbqR1r3XgybVSMN5yZH6dPme6wVXYjsNfbkiWSCJaZkwSt34Hx45peSRac
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(36840700001)(46966006)(1076003)(316002)(36906005)(426003)(54906003)(186003)(336012)(36756003)(2906002)(2616005)(70206006)(36860700001)(6916009)(82310400003)(70586007)(107886003)(26005)(4326008)(9786002)(7696005)(8936002)(966005)(6666004)(5660300002)(508600001)(83380400001)(8676002)(7636003)(47076005)(356005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 16:52:23.5755
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dc964f8-cacf-4309-c5c6-08d9ab7cf5d8
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0015.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7628

At present, post indexing instructions are not emulated by Xen.
When Xen gets the exception, EL2_ESR.ISV bit not set. Thus as a
result, data abort is triggered.

Added the logic to decode ldr/str post indexing instructions.
With this, Xen can decode instructions like these:-
ldr w2, [x1], #4
Thus, domU can read ioreg with post indexing instructions.

Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
---
Note to reviewer:-
This patch is based on an issue discussed in 
https://lists.xenproject.org/archives/html/xen-devel/2021-11/msg00969.html
"Xen/ARM - Query about a data abort seen while reading GICD registers"


 xen/arch/arm/decode.c | 77 +++++++++++++++++++++++++++++++++++++++++++
 xen/arch/arm/io.c     | 14 ++++++--
 2 files changed, 88 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/decode.c b/xen/arch/arm/decode.c
index 792c2e92a7..7b60bedbc5 100644
--- a/xen/arch/arm/decode.c
+++ b/xen/arch/arm/decode.c
@@ -84,6 +84,80 @@ bad_thumb2:
     return 1;
 }
 
+static inline int32_t extract32(uint32_t value, int start, int length)
+{
+    int32_t ret;
+
+    if ( !(start >= 0 && length > 0 && length <= 32 - start) )
+        return -EINVAL;
+
+    ret = (value >> start) & (~0U >> (32 - length));
+
+    return ret;
+}
+
+static int decode_64bit_loadstore_postindexing(register_t pc, struct hsr_dabt *dabt)
+{
+    uint32_t instr;
+    int size;
+    int v;
+    int opc;
+    int rt;
+    int imm9;
+
+    /* For details on decoding, refer to Armv8 Architecture reference manual
+     * Section - "Load/store register (immediate post-indexed)", Pg 318
+    */
+    if ( raw_copy_from_guest(&instr, (void * __user)pc, sizeof (instr)) )
+        return -EFAULT;
+
+    /* First, let's check for the fixed values */
+
+    /*  As per the "Encoding table for the Loads and Stores group", Pg 299
+     * op4 = 1 - Load/store register (immediate post-indexed)
+     */
+    if ( extract32(instr, 10, 2) != 1 )
+        goto bad_64bit_loadstore;
+
+    /* For the following, refer to "Load/store register (immediate post-indexed)"
+     * to get the fixed values at various bit positions.
+     */
+    if ( extract32(instr, 21, 1) != 0 )
+        goto bad_64bit_loadstore;
+
+    if ( extract32(instr, 24, 2) != 0 )
+        goto bad_64bit_loadstore;
+
+    if ( extract32(instr, 27, 3) != 7 )
+        goto bad_64bit_loadstore;
+
+    size = extract32(instr, 30, 2);
+    v = extract32(instr, 26, 1);
+    opc = extract32(instr, 22, 1);
+
+    /* At the moment, we support STR(immediate) - 32 bit variant and
+     * LDR(immediate) - 32 bit variant only.
+     */
+    if (!((size==2) && (v==0) && ((opc==0) || (opc==1))))
+        goto bad_64bit_loadstore;
+
+    rt = extract32(instr, 0, 5);
+    imm9 = extract32(instr, 12, 9);
+
+    if ( imm9 < 0 )
+        update_dabt(dabt, rt, size, true);
+    else
+        update_dabt(dabt, rt, size, false);
+
+    dabt->valid = 1;
+
+
+    return 0;
+bad_64bit_loadstore:
+    gprintk(XENLOG_ERR, "unhandled 64bit instruction 0x%x\n", instr);
+    return 1;
+}
+
 static int decode_thumb(register_t pc, struct hsr_dabt *dabt)
 {
     uint16_t instr;
@@ -155,6 +229,9 @@ int decode_instruction(const struct cpu_user_regs *regs, struct hsr_dabt *dabt)
     if ( is_32bit_domain(current->domain) && regs->cpsr & PSR_THUMB )
         return decode_thumb(regs->pc, dabt);
 
+    if ( is_64bit_domain(current->domain) )
+        return decode_64bit_loadstore_postindexing(regs->pc, dabt);
+
     /* TODO: Handle ARM instruction */
     gprintk(XENLOG_ERR, "unhandled ARM instruction\n");
 
diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index 729287e37c..49e80358c0 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -106,14 +106,13 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
         .gpa = gpa,
         .dabt = dabt
     };
+    int rc;
 
     ASSERT(hsr.ec == HSR_EC_DATA_ABORT_LOWER_EL);
 
     handler = find_mmio_handler(v->domain, info.gpa);
     if ( !handler )
     {
-        int rc;
-
         rc = try_fwd_ioserv(regs, v, &info);
         if ( rc == IO_HANDLED )
             return handle_ioserv(regs, v);
@@ -123,7 +122,16 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
 
     /* All the instructions used on emulated MMIO region should be valid */
     if ( !dabt.valid )
-        return IO_ABORT;
+    {
+        /*
+         * Post indexing ldr/str instructions are not emulated by Xen. So, the
+         * ISS is invalid. In such a scenario, we try to manually decode the
+         * instruction from the program counter.
+         */
+        rc = decode_instruction(regs, &info.dabt);
+        if ( rc )
+            return IO_ABORT;
+    }
 
     /*
      * Erratum 766422: Thumb store translation fault to Hypervisor may
-- 
2.17.1


