Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E01DD4E6434
	for <lists+xen-devel@lfdr.de>; Thu, 24 Mar 2022 14:37:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294316.500381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXNeQ-0003pE-JW; Thu, 24 Mar 2022 13:37:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294316.500381; Thu, 24 Mar 2022 13:37:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXNeQ-0003mD-F6; Thu, 24 Mar 2022 13:37:18 +0000
Received: by outflank-mailman (input) for mailman id 294316;
 Thu, 24 Mar 2022 13:37:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PRqf=UD=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nXNeP-0003m6-9x
 for xen-devel@lists.xenproject.org; Thu, 24 Mar 2022 13:37:17 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20606.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8362bdda-ab77-11ec-a405-831a346695d4;
 Thu, 24 Mar 2022 14:37:15 +0100 (CET)
Received: from BN0PR04CA0161.namprd04.prod.outlook.com (2603:10b6:408:eb::16)
 by SJ0PR02MB8735.namprd02.prod.outlook.com (2603:10b6:a03:3e2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Thu, 24 Mar
 2022 13:37:09 +0000
Received: from BN1NAM02FT011.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:eb:cafe::e1) by BN0PR04CA0161.outlook.office365.com
 (2603:10b6:408:eb::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17 via Frontend
 Transport; Thu, 24 Mar 2022 13:37:09 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 BN1NAM02FT011.mail.protection.outlook.com (10.13.2.129) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5102.17 via Frontend Transport; Thu, 24 Mar 2022 13:37:08 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 24 Mar 2022 13:37:07 +0000
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 24 Mar 2022 13:37:07 +0000
Received: from [10.108.8.223] (port=27868 helo=xcbayankuma41x.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nXNeF-00022c-ML; Thu, 24 Mar 2022 13:37:07 +0000
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
X-Inumbo-ID: 8362bdda-ab77-11ec-a405-831a346695d4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bd2SWqO61ABUiwR7djLKMmBA9OtUVs/TWhD34CKF7As2+B+7Xy6Y+Hj9Foake8P0q0xQWFoUZ502Ss7cHBIy3/ghw7/euL3zW/3Wc4LcZBlL+o4XB6XsizM++2vtNyatYhhN47pO6X9v2LoBt3oPJhHzXnfPeFTPht470B/+D47NTpXu/HgQBWOAaWUPSqMJpd2vCjJgL7nxkgTSbFPJh5MyJdovS9ZBmihRR0G03BLZIuy7zJZOXqnGPLKZfTVIU3iZw1hnsHlUFlQ2GZiSn/4bkew2MTaNuqbEIuExip25GK6poLk7r71/yliXZPZX07y/vISzU0IjlMEXswiTIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WZjiGYz/x6TAgG5Zc27eATIQID4txiI8Meb8Bc6LqgU=;
 b=bG6SFMtrfKiWh0y/H75OuRITtK/fW6LrrkguTrChsLPqBgvNfccL44ep9sDjFedKvIX2APKo2pJ4TL7/S6K/Gj04kfOwN3DTWpjFYvuvePG8FEBwDrUxE4xmbs0WPIYllLWTlMQa1UKjLAmz3gKZ2TxnReMBuS3H49QSj8lImiDgyKSoXSw3bxIqp7dme1682ENp3u9iY+UkYwMSIvLTz+5QeTIUkjM/JL6K4DxSinkfvEIbqgsfw7J+wXHBHXLM5Vd0EKQDKNaLSCsQ3ZynupmK2nRbroE4vEaw2gnXArDv++NlvX9baJESGpzZ+5HpHkhLL89DqFzKPzo5y16zcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WZjiGYz/x6TAgG5Zc27eATIQID4txiI8Meb8Bc6LqgU=;
 b=ieM9yVmynpIij2k5RtgHoVeqhmULOul4Guu28sn0w+ysF6sMSMezuXOfYA3FAeVh2vF3Qft0eHymhxsE9oM0Xd2J/jwMu/3wbuC8oWcNEyrEHnCzf5rYPguKgFi9lHCwWyWqF+kDQmTvX2DIwLqUvF0MAekM04CPHF/zJSVpSM0=
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
Subject: [PATCH v12] xen/arm64: io: Handle data abort due to cache maintenance instructions
Date: Thu, 24 Mar 2022 13:37:05 +0000
Message-ID: <20220324133705.37882-1-ayankuma@xilinx.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2ec71d98-5a6e-4b7d-4edd-08da0d9b64d8
X-MS-TrafficTypeDiagnostic: SJ0PR02MB8735:EE_
X-Microsoft-Antispam-PRVS:
	<SJ0PR02MB873525AD73BED75AB30106DDB2199@SJ0PR02MB8735.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ctucv+Cs3ZY6CuiGx0s5Hti17/IBjNRphW23tEhbFaWXcjcn91CrZFUjYc+sFxiLUl6Fva8UlxRcPSfeFwhU3d8yl6X2FnDmxG5wAQOtowbvxo//EAYPgb0hibRDqb/jeYEvijlCCM97xIkrRNqMVk+DcKwrK0gceqELWfTHbpWOAkTNeRdO+MRFzE/UVQnlkg5G0sfJ/quMTF7lsyDe8dWCygu2H2ec1IbSgt8y5khjDFtNQ98cXzRzXf4t/2MRxpaNmfAeZNrygseMzzct3aIq1wp40ECawoLRrh311eWinYAi1EexiuzJSaVZSH522W1DrbcRjiVxX5AiYmUghfrwyZjGwlGdkJsJusFcb24mJ5AWypTYRpxHCaCWU5esm23O28TO4TlQH47zc2VRte4nWhFzgfqBTH/HNfvvshkhIVIdaHlI+6h0uWn1wFxCc7NOZRXvXcEHt0+n9bzkVZmKqq80D88srTNT3T623apWgDlB0pM06PsHLdk4OYaM5uhmtBfuV7286b9M7xNjN6LZNf7pIsS6bQ0YEPTs5aOJQKAohRxs9u+Y75tYvfKWNpOr5C8Nr8D0IqncOOwsuGjnWCe+S7KVzlSQDIZj+bfS1YlVA2+UClyq78pgf5/Bx51/iYEBXiY11V5aFe9ckruAfS0+vmDDksPqR31Srtr5VQp9narBSfeNKfv78O//g7QAVnbICcupHv3rqVOBIQ==
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch02.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(336012)(1076003)(2616005)(316002)(83380400001)(107886003)(40460700003)(426003)(82310400004)(36756003)(5660300002)(26005)(508600001)(186003)(6916009)(54906003)(8936002)(9786002)(7636003)(356005)(47076005)(7696005)(2906002)(36860700001)(70586007)(70206006)(4326008)(8676002)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2022 13:37:08.7617
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ec71d98-5a6e-4b7d-4edd-08da0d9b64d8
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1NAM02FT011.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB8735

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

v12 - 1. try_handle_mmio() should assert for "(info->dabt.valid || 
(info->dabt_instr.state == INSTR_CACHE))"
2. In try_fwd_ioserv(), ioreq size should be set to the cache line size
for INSTR_CACHE. Also ioreq data should be set only when ISS is valid.

 xen/arch/arm/include/asm/mmio.h |  1 +
 xen/arch/arm/io.c               | 20 +++++++++++++++++++-
 xen/arch/arm/ioreq.c            | 14 ++++++++++++--
 3 files changed, 32 insertions(+), 3 deletions(-)

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
index 6f458ee7fd..4ce94243aa 100644
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
@@ -161,7 +172,7 @@ enum io_state try_handle_mmio(struct cpu_user_regs *regs,
 
     ASSERT(info->dabt.ec == HSR_EC_DATA_ABORT_LOWER_EL);
 
-    if ( !info->dabt.valid )
+    if ( !(info->dabt.valid || (info->dabt_instr.state == INSTR_CACHE)) )
     {
         ASSERT_UNREACHABLE();
         return IO_ABORT;
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
index 54167aebcb..87a6240f2a 100644
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
@@ -62,7 +62,6 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
          * memory access. So for now, we can safely always set to 0.
          */
         .df = 0,
-        .data = get_user_reg(regs, info->dabt.reg),
         .state = STATE_IOREQ_READY,
     };
     struct ioreq_server *s = NULL;
@@ -74,12 +73,23 @@ enum io_state try_fwd_ioserv(struct cpu_user_regs *regs,
         return IO_ABORT;
     }
 
+    if ( instr.state == INSTR_CACHE )
+        p.size = dcache_line_bytes;
+
     s = ioreq_server_select(v->domain, &p);
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
 
+    p.data = get_user_reg(regs, info->dabt.reg);
     vio->req = p;
     vio->info.dabt_instr = instr;
 
-- 
2.17.1


