Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D84C4C8BCE
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 13:40:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281335.479643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP1nz-0006FI-Mr; Tue, 01 Mar 2022 12:40:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281335.479643; Tue, 01 Mar 2022 12:40:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP1nz-0006BL-H5; Tue, 01 Mar 2022 12:40:39 +0000
Received: by outflank-mailman (input) for mailman id 281335;
 Tue, 01 Mar 2022 12:40:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kl2V=TM=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nP1nx-0005sf-SP
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 12:40:37 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e88::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca9644c5-995c-11ec-8eba-a37418f5ba1a;
 Tue, 01 Mar 2022 13:40:37 +0100 (CET)
Received: from SN2PR01CA0002.prod.exchangelabs.com (2603:10b6:804:2::12) by
 BY5PR02MB6740.namprd02.prod.outlook.com (2603:10b6:a03:202::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Tue, 1 Mar
 2022 12:40:32 +0000
Received: from SN1NAM02FT0008.eop-nam02.prod.protection.outlook.com
 (2603:10b6:804:2:cafe::bf) by SN2PR01CA0002.outlook.office365.com
 (2603:10b6:804:2::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14 via Frontend
 Transport; Tue, 1 Mar 2022 12:40:32 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 SN1NAM02FT0008.mail.protection.outlook.com (10.97.5.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5017.22 via Frontend Transport; Tue, 1 Mar 2022 12:40:32 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 1 Mar 2022 12:40:31 +0000
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 1 Mar 2022 12:40:31 +0000
Received: from [10.108.8.223] (port=53852 helo=xcbayankuma41x.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nP1nr-0000Ui-3l; Tue, 01 Mar 2022 12:40:31 +0000
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
X-Inumbo-ID: ca9644c5-995c-11ec-8eba-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gkgVaqNI0yTxHbJyJBQyLB0Ti7GigUfaOGqaFNxbXJQqGXeDMHdUTuSnF9Rpqq1e/TpoRNnCPMW+ZdcCvBCZxS+79eSpI95Sye9HSbNKP1pSS2prZ7z6Xru3mMznaMdHv1uA/IsOB1tzhTm9fwfPHUXqKcK+tcs9ByQ8x/8GCaIDpq6vXhNl9yn5KqzGjOnFHNvakh9WDLJqMbzMqgrpC8zY8z9S8oJbxR+BPiDlXeZ2ccP0pnH6FnYPsr9gsKOURFgBz/IckbzLGK2kcb5DOgU/BfnZe+XiQ9bNlPfrQjCyMdwUzHXGwvwtu3m3gk9zBNQSOaQGtBqOfk+2TZ+moQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oHuuIqCSklM84YJbzg3sQCXYQhhgJ1Du7gvCW1yJRv4=;
 b=e1z1tssqiorsGvXd/sGa9IgseF+W/1oe9ZYUeQjE3gTSVIabo9w6T45rVxR5NCpcU55OgIlKPndf9M0VE6JOsmjJqQWd9DQw+/2riqhY5Bvh6pl6PtK/3pFxql9QNeQgp94iGaieVBuPk6FfyEqRfITvtk8Q9PNJ4E8E6iBu0ziWOn4STgI6oaq0MmpSczGNWwEV3Dw7oEnM0+PPokwfw35Rapg2pwXCe1zW/+3Gyt4/9JyEczer3a/5ZmeqnoGE+PpzRiuoCa5dNO8w5H//KLnns35Jul0XaMU9uYZu3T3hxcytQ2pCM1yiTQvPzR6uz7onUTmQC+zYxy1xOnyEuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oHuuIqCSklM84YJbzg3sQCXYQhhgJ1Du7gvCW1yJRv4=;
 b=FgZYvxMV4nXMWCXOnq81852QJs8j6L2WB4k57FMWUcG/G2VYfeB+FM6xdZDlIABD/lZjKSFov1Z+XNhX8O6PxApSCtqkyDsMfn+8zMt8ivg6g3v7W+F4XAOkahQoSyx6F9DJDOP7WCNWWXhO8F3nUMp15rdZFfkBXvzPwdrVYkU=
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
Subject: [XEN v9 3/4] xen/arm64: io: Handle the abort due to access to stage1 translation table
Date: Tue, 1 Mar 2022 12:40:21 +0000
Message-ID: <20220301124022.10168-4-ayankuma@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220301124022.10168-1-ayankuma@xilinx.com>
References: <20220301124022.10168-1-ayankuma@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 44db705b-959e-4b2f-582d-08d9fb80acde
X-MS-TrafficTypeDiagnostic: BY5PR02MB6740:EE_
X-Microsoft-Antispam-PRVS:
	<BY5PR02MB6740B1AF9A5A3ACA81042844B2029@BY5PR02MB6740.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	d3dPeSJuBeHBOsCj/mVF2L7czXUBSoddBIZD1U7JiFU5r5ewhEu8Fvva/weZ6YQ/CoPZCWmhDzY/dvar0r4GBGbqO5wV458676kT5vrk+8o8/NOnW0qL6qMAzLmJ6Et2z15irNydlVNohKWmU0yzL+u5s4gngqnoeYCphxKWKbO7HQtVCvgWAXYnmPjvg94H00aAflODX5x+JT5jtFz6OkDa1B3/XMLSOPkieAAn3E7as/IitQZhy1fGjMXvPhgHvNsCN1MgYQfNfMT6hPYPbvZ8s8LuKAQZ5N9uUVQOrkuMcscQWeYLzOTLGJZ/3MZBAaYy6qeO/a/hpX92DmW/wq9ABu+cX1kpxuN5TW1nzD1fWJhatQLn7gc+IwwojZVR1OvHh60DGeUV553auX73PMvIwEnADP62HyVwemXh6++vVee5KNmeOx8UMPZ3sLKjiyDzNeAj+xSvlr4oYMLSaB7UDHvzEglkzRBAKRwrueqkXCJ7wDduxpAmyLgGVqB9czk23JAUxQeX+A5yThAggmN3goF1Inx2BmvqmUGa5hhRA3iDWX5gjxBS+S+CJKkvgf4+3eECPQGkxOpPhi6qESMy9L08x8RS1i94PnX+apndORwJsWiki6wUOwwpxuMGDFNIXk9iHlCX+QF80T0l8YaF7HzhAK/DclcM1SbtwMtAcaB0LpoJ072k33D0/Fiwtr+zrDDkVAFbMitku7XA0A==
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(6916009)(54906003)(316002)(8936002)(8676002)(9786002)(4326008)(26005)(1076003)(107886003)(7416002)(36756003)(508600001)(6666004)(70206006)(70586007)(36860700001)(5660300002)(7696005)(356005)(7636003)(2616005)(82310400004)(336012)(47076005)(426003)(186003)(83380400001)(2906002)(102446001)(473944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 12:40:32.1618
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44db705b-959e-4b2f-582d-08d9fb80acde
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0008.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6740

If the abort was caused due to access to stage1 translation table, Xen
will assume that the stage1 translation table is in the non MMIO region.
It will try to resolve the translation fault. If it succeeds, it will
return to the guest to retry the instruction. If not, then it means
that the table is in MMIO region which is not expected by Xen. Thus,
Xen will forward the abort to the guest.

Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
---

Changelog :-

v1..v8 - NA

v9 - 1. Extracted this change from "[XEN v8 2/2] xen/arm64: io: Support
instructions (for which ISS is not..." into a separate patch of its own.
The reason being this is an existing bug in the codebase.

 xen/arch/arm/io.c    | 11 +++++++++++
 xen/arch/arm/traps.c | 12 +++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index bea69ffb08..ebcb8ed548 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -128,6 +128,17 @@ void try_decode_instruction(const struct cpu_user_regs *regs,
         return;
     }
 
+    /*
+     * At this point, we know that the stage1 translation table is in the MMIO
+     * region. This is not expected by Xen and thus it forwards the abort to the
+     * guest.
+     */
+    if ( info->dabt.s1ptw )
+    {
+        info->dabt_instr.state = INSTR_ERROR;
+        return;
+    }
+
     /*
      * Armv8 processor does not provide a valid syndrome for decoding some
      * instructions. So in order to process these instructions, Xen must
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 120c971b0f..e491ca15d7 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1923,6 +1923,7 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
     bool is_data = (hsr.ec == HSR_EC_DATA_ABORT_LOWER_EL);
     mmio_info_t info;
     enum io_state state;
+    bool check_mmio_region = true;
 
     /*
      * If this bit has been set, it means that this stage-2 abort is caused
@@ -1987,7 +1988,16 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
          */
         if ( !is_data || !info.dabt.valid )
         {
-            if ( check_p2m(is_data, gpa) )
+            /*
+             * If the translation fault was caused due to access to stage 1
+             * translation table, then we try to set the translation table entry
+             * for page1 translation table (assuming that it is in the non mmio
+             * region).
+             */
+            if ( xabt.s1ptw )
+                check_mmio_region = false;
+
+            if ( check_p2m((is_data && check_mmio_region), gpa) )
                 return;
 
             /*
-- 
2.17.1


