Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDCA4D50D2
	for <lists+xen-devel@lfdr.de>; Thu, 10 Mar 2022 18:45:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288561.489391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSMqw-0003sC-RJ; Thu, 10 Mar 2022 17:45:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288561.489391; Thu, 10 Mar 2022 17:45:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSMqw-0003qI-Lr; Thu, 10 Mar 2022 17:45:30 +0000
Received: by outflank-mailman (input) for mailman id 288561;
 Thu, 10 Mar 2022 17:45:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i5Vk=TV=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nSMqu-0002fW-Jx
 for xen-devel@lists.xenproject.org; Thu, 10 Mar 2022 17:45:28 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f400:7eab::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dda620cb-a099-11ec-853a-5f4723681683;
 Thu, 10 Mar 2022 18:45:26 +0100 (CET)
Received: from DM5PR2001CA0023.namprd20.prod.outlook.com (2603:10b6:4:16::33)
 by MN2PR02MB6222.namprd02.prod.outlook.com (2603:10b6:208:186::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.15; Thu, 10 Mar
 2022 17:45:23 +0000
Received: from DM3NAM02FT053.eop-nam02.prod.protection.outlook.com
 (2603:10b6:4:16:cafe::c6) by DM5PR2001CA0023.outlook.office365.com
 (2603:10b6:4:16::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.23 via Frontend
 Transport; Thu, 10 Mar 2022 17:45:23 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 DM3NAM02FT053.mail.protection.outlook.com (10.13.5.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5061.22 via Frontend Transport; Thu, 10 Mar 2022 17:45:22 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 10 Mar 2022 17:45:21 +0000
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 10 Mar 2022 17:45:21 +0000
Received: from [10.108.8.223] (port=47674 helo=xcbayankuma41x.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nSMqn-00062C-5M; Thu, 10 Mar 2022 17:45:21 +0000
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
X-Inumbo-ID: dda620cb-a099-11ec-853a-5f4723681683
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l9rW8e3nlyxAPZhmTZO2hZmr5KYrg7E9eC+v0/xzN/uvkIKEMDNyAeFy77NryyT+nDbn2F5dB4szITsXv27pL3DBueUyLgvxXqzEuhRCcMHrnUsOCwC/GeFQk+DhuOEUF7TCKs/btZD9tYfdUKrNsTZgvTaVDoKyd5dma0qgjwdXStVIyMvHmR3eN7h4X/9SuJ8yZWaSNzyi5wXczbhLii9H+JyoeYd3WQBmLfSWSJHJ2T9NGPmveIBRCNNly4B9DPa+eumfGIXxAXTAuaIIQhPekpLCS73uWmK3nL9AYBpt9gPSek+WtgXbjoWNhdGZ898dBp/L5uEjOdxlQL3AwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+xhAyzOJKcFQjR6pp7HDy+csplKGaoofhTDl9R0cDo8=;
 b=YBihvOkKUEXYjuRKLNWgDc+oWC3y7rj2dU395NdaRgSelO4sn8bm4pLR3NzvZd/QBVfN5bzAVRN/uejqsuobZMDCbx8IwRpeDIiyJNeLPL2VxWMTuUz2RLQA0sDyV+yuUv9DlvEmmeZqOnctHrdHnzX6FsN9a/u7UeBI9pd15Jb/UMxh2oDHyr6aru3tgKIZTFlbnzQDMC1Ip0E9Fm7hQtxr5WA+LLmyPuPwWpqk+38SybGqNYh9l0c4B3b0Je9TZw5Vk0rATijx8CT9mlndP8yYVzsZQciBLp8pE8GEYbgZTuDuwAPCAXwsxpf5uEAC0rfcN8Hh++NDsc0Sas7vKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+xhAyzOJKcFQjR6pp7HDy+csplKGaoofhTDl9R0cDo8=;
 b=GU8uyhQwohfsXpme0ENnovUH9p0KHEmxqk/Hk+CuK5SMcfvJ37Ae4/Hqa0KdoKUmdqDmE1Q0Jwugm/8pgedGAVzT4kEJj4weDrKMdlThlr8BtYSaNenCyxvjA4c6IV/ARNxhzMJHLieQMXPe5V7vnZfn+v6qN0DyzIl2cim0pIY=
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
Subject: [XEN v10 4/4] xen/arm64: io: Handle data abort due to cache maintenance instructions
Date: Thu, 10 Mar 2022 17:45:01 +0000
Message-ID: <20220310174501.62040-5-ayankuma@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220310174501.62040-1-ayankuma@xilinx.com>
References: <20220310174501.62040-1-ayankuma@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eb30c7df-e11e-4db7-119e-08da02bdc091
X-MS-TrafficTypeDiagnostic: MN2PR02MB6222:EE_
X-Microsoft-Antispam-PRVS:
	<MN2PR02MB6222A916D39C8E3C4EC6AFDFB20B9@MN2PR02MB6222.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ExoxggTiO7rgoSABqSfQs3O16Fe8pG3pV41IAMWktr/yL5PMbgpv4DeZqCIvQ8KJvNK+SmVOCc8UYWZ8nOilGA+TunM4gI6kqCdyioVF/xI61P6s+ddg6nqoHByKqIftVrKDzIjNWb4Er8CKnzrlrYrz+LyQzo9pdfOdRQkkYe0vaFkoG2byLSYHsJhgGbAATa4GYCcB/YLXhLoFW/C5wr/8qhZx+eJNkv02r29ngobzmTZpc1kmhK7mtIrd2FBl+iCwFSA1ATP0QBEiQeeSZo5f4Obhgv0T4y9+Yki5tVjt7FJVnBvmNkhaCYSos56zGMbl9CPRCBKJm9vemgGC+/LXHHQXn+/NTnkJOTKydT9JCksKdEO1SYT+bqQPgMK2Bewvb2lmEc6M35Ug7X/yB6J4s9amUanFxyVRaySjgvh9KIfDPH4JGTbhvPz8eVIRgHArPsGLrMmrPFhAedgB7Yvbo87OJ9Gu/7x5lDzKjaypRkm5V42NlPSPPKSB0fo4DJPmGLHMiPqd3H4XZcNywHHrCjm6pQK9KSJnf2PpKLe6bfEbtsLiQeXUGqITwNK0gUSWzwtlWSb6xy6GBawHcC+1D3Gw67UDmuUMQ/1idNLojz12fs13oZ70Z0LnIqWEAD05s6E39AA5bKM4QAMN2ev8fFUBvFCtsHvGAH8TIgvhLl3RsVScYmhJaMd41PTI2fzAnCpLckgS3VsIWcTD9A==
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(6666004)(7636003)(40460700003)(4326008)(7696005)(356005)(70586007)(70206006)(8676002)(508600001)(2906002)(7416002)(82310400004)(2616005)(186003)(83380400001)(36860700001)(8936002)(9786002)(47076005)(1076003)(107886003)(5660300002)(36756003)(26005)(336012)(426003)(54906003)(316002)(6916009)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 17:45:22.6185
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb30c7df-e11e-4db7-119e-08da02bdc091
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM3NAM02FT053.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR02MB6222

When the data abort is caused due to cache maintenance for an address,
there are three scenarios:-

1. Address belonging to a non emulated region - For this, Xen should
set the corresponding bit in the translation table entry to valid and
return to the guest to retry the instruction. This can happen sometimes
as Xen need to set the translation table entry to invalid. (for eg
'Break-Before-Make' sequence). Xen returns to the guest to retry the
instruction.

2. Address belongs to an emulated region - Xen should ignore the
instruction (ie increment the PC) and return to the guest.

3. Address is invalid - Xen should forward the data abort to the guest.

Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
---

Changelog:-

v1...v8 - NA

v9 - Extracted this change from "[XEN v7 2/2] xen/arm64: io: Support
instructions (for which ISS is not ..." into a separate patch of its
own. The reason being this addresses an existing bug in the codebase.

v10 - 1. To check if the address belongs to an emulated region, one
needs to check if it has a mmio handler or an ioreq server. In this
case, Xen should increment the PC
2. If the address is invalid (niether emulated MMIO nor the translation
could be resolved via p2m or mapping the MMIO region), then Xen should
forward the abort to the guest.

 xen/arch/arm/include/asm/mmio.h |  1 +
 xen/arch/arm/io.c               | 20 ++++++++++++++++++++
 xen/arch/arm/ioreq.c            | 15 ++++++++++++++-
 3 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/mmio.h b/xen/arch/arm/include/asm/mmio.h
index ca259a79c2..79e64d9af8 100644
--- a/xen/arch/arm/include/asm/mmio.h
+++ b/xen/arch/arm/include/asm/mmio.h
@@ -35,6 +35,7 @@ enum instr_decode_state
      * instruction.
      */
     INSTR_LDR_STR_POSTINDEXING,
+    INSTR_CACHE,                    /* Cache Maintenance instr */
 };
 
 typedef struct
diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index e6c77e16bf..c5b2980a5f 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -139,6 +139,17 @@ void try_decode_instruction(const struct cpu_user_regs *regs,
         return;
     }
 
+    /*
+     * When the data abort is caused due to cache maintenance, Xen should check
+     * if the address belongs to an emulated MMIO region or not. The behavior
+     * will differ accordingly.
+     */
+    if ( info->dabt.cache )
+    {
+        info->dabt_instr.state = INSTR_CACHE;
+        return;
+    }
+
     /*
      * Armv8 processor does not provide a valid syndrome for decoding some
      * instructions. So in order to process these instructions, Xen must
@@ -177,6 +188,15 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
         return rc;
     }
 
+    /*
+     * When the data abort is caused due to cache maintenance and the address
+     * belongs to an emulated region, Xen should ignore this instruction.
+     */
+    if ( info->dabt_instr.state == INSTR_CACHE )
+    {
+        return IO_HANDLED;
+    }
+
     /*
      * At this point, we know that the instruction is either valid or has been
      * decoded successfully. Thus, Xen should be allowed to execute the
diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
index cc9bf23213..0dd2d452f7 100644
--- a/xen/arch/arm/ioreq.c
+++ b/xen/arch/arm/ioreq.c
@@ -29,10 +29,14 @@ enum io_state handle_ioserv(struct cpu_user_regs *regs, struct vcpu *v)
     const struct hsr_dabt dabt = hsr.dabt;
     /* Code is similar to handle_read */
     register_t r = v->io.req.data;
+    const struct instr_details instr = v->io.info.dabt_instr;
 
     /* We are done with the IO */
     v->io.req.state = STATE_IOREQ_NONE;
 
+    if ( instr.state == INSTR_CACHE )
+        return IO_HANDLED;
+
     if ( dabt.write )
         return IO_HANDLED;
 
@@ -47,7 +51,7 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
                              struct vcpu *v, mmio_info_t *info)
 {
     struct vcpu_io *vio = &v->io;
-    struct instr_details instr = info->dabt_instr;
+    const struct instr_details instr = info->dabt_instr;
     struct hsr_dabt dabt = info->dabt;
     ioreq_t p = {
         .type = IOREQ_TYPE_COPY,
@@ -78,6 +82,15 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
     if ( !s )
         return IO_UNHANDLED;
 
+    /*
+     * When the data abort is caused due to cache maintenance and the address
+     * belongs to an emulated region, Xen should ignore this instruction.
+     */
+    if ( instr.state == INSTR_CACHE )
+    {
+        return IO_HANDLED;
+    }
+
     ASSERT(dabt.valid);
 
     vio->req = p;
-- 
2.17.1


