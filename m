Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FED4DC836
	for <lists+xen-devel@lfdr.de>; Thu, 17 Mar 2022 15:01:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.291589.495015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUqgg-0001fo-DO; Thu, 17 Mar 2022 14:01:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 291589.495015; Thu, 17 Mar 2022 14:01:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUqgg-0001cw-9x; Thu, 17 Mar 2022 14:01:10 +0000
Received: by outflank-mailman (input) for mailman id 291589;
 Thu, 17 Mar 2022 14:01:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zfHd=T4=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nUqge-0000hx-AT
 for xen-devel@lists.xenproject.org; Thu, 17 Mar 2022 14:01:08 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on20630.outbound.protection.outlook.com
 [2a01:111:f400:7e8b::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b0520852-a5fa-11ec-853c-5f4723681683;
 Thu, 17 Mar 2022 15:01:07 +0100 (CET)
Received: from BN9P222CA0021.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::26)
 by MW2PR02MB3721.namprd02.prod.outlook.com (2603:10b6:907:5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Thu, 17 Mar
 2022 14:01:02 +0000
Received: from BN1NAM02FT023.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:10c:cafe::b8) by BN9P222CA0021.outlook.office365.com
 (2603:10b6:408:10c::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17 via Frontend
 Transport; Thu, 17 Mar 2022 14:01:01 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 BN1NAM02FT023.mail.protection.outlook.com (10.13.2.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5081.14 via Frontend Transport; Thu, 17 Mar 2022 14:01:01 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 17 Mar 2022 14:01:00 +0000
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 17 Mar 2022 14:01:00 +0000
Received: from [10.108.8.223] (port=9027 helo=xcbayankuma41x.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nUqgW-0004ME-Dj; Thu, 17 Mar 2022 14:01:00 +0000
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
X-Inumbo-ID: b0520852-a5fa-11ec-853c-5f4723681683
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YNr5o6Jp307jTd7YaK84GFaDXVvV+7HiBoXgg32i0mmrvb0DH+PwYvtgI0KDzcOmWKJCM1Tx5d47pCKZ1/qlToKZ+9SIp28Cf2vvQBUQNgtWiJnfUFWlMEcj7/KB0DPhtSPgtOK0026a4TV/D/5+pl/7FKmKj3p5Ht9GeiiMtUeyc7L7bWix83cIVECxMozM8Xa/2MkO4cS9Jdqd9PW6aZdebT26ioeL6E8STcoZdgbfEGrCdaRe8QDKHwcrkO00aTQFNKOR4lzSp0ovdf0KUqPI1mgfgpXmW1Yi425GyiZsqbuW+DHaiwy63k3L6i7VnZsv+AjNYzLHuNyHQ7uZoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EuZSr4OnTkPqeU+88TbJg/rqeEcbd/7sbQO3H+wXl3w=;
 b=HPf1ERMLw2ynSQ7ho+LhqRrXmJ1A7I26gx30irVdIrNqjOSEohosG+rbnom79vGsl6rdzJ3z2GUv9Ks6Lr6CZJ+kE1v/mO0i7g+3EUEsnqhgMAlHTxJDGLyxJId5I41JjqMDvFx154Qo/NuujOPPInB5r/AI9BfX48OdFXWHO0q+fBL5o4KaLx1Ie5BXy8Hoo4SDZTVybg+arxzJ9gVRavtwnE9YcrE79dGkR0ANGvTcvCq5lpHzJTeIWQ8hZLw0FGVYxK7uoneG95TOGyJKAYtPPBfSYXSSlbpzPIbkshnkdsay2uaUl99C9WKBoIffgWZv2dFBvEckjkYDjWPX7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EuZSr4OnTkPqeU+88TbJg/rqeEcbd/7sbQO3H+wXl3w=;
 b=XBbWxIe7R7HT66LO2mem3MjIFYj2nmRLUDZ+iFQ2yAJL2BS1xjpCOJDB4M7X/N13IY6cFTapBlj03sK9k0KPxIyMa36qmE8oMwlsWodbyo9nCAA1OcUPDW7UhIjChruEfdV3IS9QJsvRjUoIk8QLjhdQzh7HfdTRQD0gZEuADOE=
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
	<andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>, <jbeulich@suse.com>,
	<wl@xen.org>, <paul@xen.org>, <roger.pau@citrix.com>, Ayan Kumar Halder
	<ayankuma@xilinx.com>
Subject: [PATCH v11 3/3] xen/arm64: io: Handle data abort due to cache maintenance instructions
Date: Thu, 17 Mar 2022 14:00:46 +0000
Message-ID: <20220317140046.64563-4-ayankuma@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220317140046.64563-1-ayankuma@xilinx.com>
References: <20220317140046.64563-1-ayankuma@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1f586b4e-0cfa-4b0b-6290-08da081e91ed
X-MS-TrafficTypeDiagnostic: MW2PR02MB3721:EE_
X-Microsoft-Antispam-PRVS:
	<MW2PR02MB3721EB414FFF2B9E9EC32925B2129@MW2PR02MB3721.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iHSQ0We/XIFnbHgIhl0lFvPpCMNMYVJ8LYNuzOlIiZcpkOrtvpsz9RxrSwfY/YdxvJGyjU4aaQgVOF99oUrteoJNNODcGpN/+AmQ+wvBAxsM2XKtJoQ0kTTSx9pB4orGoDdLOJ3jY5BwFy52zW4bkJIoLUcwdIov6KLXM3fIhMaUaEk3ZMeMMvtSB4PHGMMSlULgXvD8DEC66djmID1Mn5zXfPjd32g9AyGbPVgvjSq+M5tUfZoZ9ZFlyKBt3uSo74QqoGwKXsoD+STpCvxbqiaC8zTOew7UVhHM63VBXCinHA6X1s4uw21JtcJqQQ7FCQDQNQIwqPcA6iz0QhDOHUzkMyiW6XOJjzzUojtoKdDbUMUsQCLH3+jey4MBsgeCjAZrX7dXqU+88L+YieIocQQ9pQYtt66rYf76gEh0Aj69VPtPLDZeY9tlx54HdteloJUYglf3pYorSK1eEFqMRZe9JwGIxKMzfkc5wxzgph7l4niuU9MCn9EUjBeERfLyER7dmXli90b/AVhytj8qcGVrsZ8UTm2zm1TJ5t/L5O2Vc2f/CBzu6Ibo3O7Vwfr5Ft8vs5NomoVGVgnAO5geHaNfug1HrZhzDke885c4Cbxpjv6bKh6ybdGjNw4wGEC/8GKUHJV/cDTJqwhZPbjoVjIaUb4fNBDyDRo4xmbS4rn+tx1TAqjErXXm/oDHmm8he9IrTEbUPRTVLNUur91neA==
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch02.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(36756003)(8676002)(5660300002)(4326008)(70586007)(6916009)(54906003)(47076005)(70206006)(316002)(2906002)(82310400004)(83380400001)(6666004)(508600001)(8936002)(7636003)(9786002)(26005)(186003)(7696005)(7416002)(2616005)(107886003)(40460700003)(356005)(36860700001)(336012)(426003)(1076003)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 14:01:01.5078
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f586b4e-0cfa-4b0b-6290-08da081e91ed
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT023.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW2PR02MB3721

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

v11 - 1. Removed the un-necessary check "( instr.state == INSTR_CACHE )"
in handle_ioserv(). The reason being the ioserv request is not forwarded
by try_fwd_ioserv() when instr.state == INSTR_CACHE.

 xen/arch/arm/include/asm/mmio.h |  1 +
 xen/arch/arm/io.c               | 18 ++++++++++++++++++
 xen/arch/arm/ioreq.c            |  9 ++++++++-
 3 files changed, 27 insertions(+), 1 deletion(-)

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
index 6f458ee7fd..26c716b4a5 100644
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
@@ -177,6 +188,13 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
         return rc;
     }
 
+    /*
+     * When the data abort is caused due to cache maintenance and the address
+     * belongs to an emulated region, Xen should ignore this instruction.
+     */
+    if ( info->dabt_instr.state == INSTR_CACHE )
+        return IO_HANDLED;
+
     /*
      * At this point, we know that the instruction is either valid or has been
      * decoded successfully. Thus, Xen should be allowed to execute the
diff --git a/xen/arch/arm/ioreq.c b/xen/arch/arm/ioreq.c
index 54167aebcb..cc66713386 100644
--- a/xen/arch/arm/ioreq.c
+++ b/xen/arch/arm/ioreq.c
@@ -47,7 +47,7 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
                              struct vcpu *v, mmio_info_t *info)
 {
     struct vcpu_io *vio = &v->io;
-    struct instr_details instr = info->dabt_instr;
+    const struct instr_details instr = info->dabt_instr;
     struct hsr_dabt dabt = info->dabt;
     ioreq_t p = {
         .type = IOREQ_TYPE_COPY,
@@ -78,6 +78,13 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
     if ( !s )
         return IO_UNHANDLED;
 
+    /*
+     * When the data abort is caused due to cache maintenance and the address
+     * belongs to an emulated region, Xen should ignore this instruction.
+     */
+    if ( instr.state == INSTR_CACHE )
+        return IO_HANDLED;
+
     ASSERT(dabt.valid);
 
     vio->req = p;
-- 
2.17.1


