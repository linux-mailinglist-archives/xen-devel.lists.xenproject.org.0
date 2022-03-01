Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC2E4C8BD1
	for <lists+xen-devel@lfdr.de>; Tue,  1 Mar 2022 13:40:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.281337.479670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP1o1-0006tQ-J1; Tue, 01 Mar 2022 12:40:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 281337.479670; Tue, 01 Mar 2022 12:40:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nP1o1-0006o8-Ce; Tue, 01 Mar 2022 12:40:41 +0000
Received: by outflank-mailman (input) for mailman id 281337;
 Tue, 01 Mar 2022 12:40:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kl2V=TM=xilinx.com=ayankuma@srs-se1.protection.inumbo.net>)
 id 1nP1nz-0005sf-ER
 for xen-devel@lists.xenproject.org; Tue, 01 Mar 2022 12:40:39 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060b.outbound.protection.outlook.com
 [2a01:111:f400:fe59::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb8ae4f1-995c-11ec-8eba-a37418f5ba1a;
 Tue, 01 Mar 2022 13:40:38 +0100 (CET)
Received: from SN4PR0501CA0065.namprd05.prod.outlook.com
 (2603:10b6:803:41::42) by SA2PR02MB7595.namprd02.prod.outlook.com
 (2603:10b6:806:146::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.24; Tue, 1 Mar
 2022 12:40:35 +0000
Received: from SN1NAM02FT0034.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:41:cafe::26) by SN4PR0501CA0065.outlook.office365.com
 (2603:10b6:803:41::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.9 via Frontend
 Transport; Tue, 1 Mar 2022 12:40:35 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 SN1NAM02FT0034.mail.protection.outlook.com (10.97.5.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5017.22 via Frontend Transport; Tue, 1 Mar 2022 12:40:35 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 1 Mar 2022 12:40:33 +0000
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 1 Mar 2022 12:40:33 +0000
Received: from [10.108.8.223] (port=53852 helo=xcbayankuma41x.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <ayan.kumar.halder@xilinx.com>)
 id 1nP1nt-0000Ui-HL; Tue, 01 Mar 2022 12:40:33 +0000
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
X-Inumbo-ID: cb8ae4f1-995c-11ec-8eba-a37418f5ba1a
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QBvOPPiNoDnbGzOmbH3T4GREgxfOa85ijjKj9CEo9jmIYlk4NqUW8WSGNA/m0fU6jJKfEupNgW+jvMov6BMGOUhbhst/vU+i88+LUNkeDxh5FjCyonWV/EAFttSqOK3X+FO/wt6Gm7/bkkN5DI/si7faEZWHzWBkfT1uZzZkuxyDIEObuJpEjAlseZYezfzB+dGDha0lupIfUVG/Sk8927p942CH66DIzvKid4jmBS0lfy1jqtiU09KmbQcZqtEv50aUJ8epQGLvThVZdL4ZvpSmek5MMOG6gNo2aaX++kRk4fK92sjj9YieSRlrPNTgAKzmW6l/MuyY3kgLD7UtjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uK2cUyN9RFSxW7UNMQ2w1UgKi3QyK4ZDqHMa9YicuXc=;
 b=akzf4FL2nbMYuDrXnkR9SnsFVLduGBFgX0wm1MoKMOSMeLw6Hzx8wuMtx3Tf09sT3819/AM3coQ8n8P39aPUJ/uW6lp2JIgQnz9TaRxZPQuv5VdgZpNufw9HErybXexx1Lw6GrbNJvOcoG3B8wkXzR22Hv3uG/ArS49XlVyLvUSKJVP5neUvOUnQ133UTh2h/jyTYHwc52kILXiIVpCF2qhtU3L4R109gW6aV0wl3rXbLgIoPtpq7D8hqSldbfpZ9T84rqn7S8KpliRZrgjXAjtb4xyyqwNeGFYpcnW3EKzIorPrZzcc2xn+Pi243v5lX4tdqC70/9QnWulOhxssRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=xilinx.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uK2cUyN9RFSxW7UNMQ2w1UgKi3QyK4ZDqHMa9YicuXc=;
 b=dPvGtKI9WPAbWoyyyCSs+KTyFQBd2odKMPnh852RvpsbzThUVjM1KWiAA95Yd7tGlKahc5aQ/ay/uY1cNctQjybOn7sK5RTZZpAYXoi3x3NjF64s73DODmVWenuj4o8GlvVbRZqgEf4vfKx96+FI7WtA0tQf1i+OAAyxYTy44kg=
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
Subject: [XEN v9 4/4] xen/arm64: io: Handle data abort due to cache maintenance instructions
Date: Tue, 1 Mar 2022 12:40:22 +0000
Message-ID: <20220301124022.10168-5-ayankuma@xilinx.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220301124022.10168-1-ayankuma@xilinx.com>
References: <20220301124022.10168-1-ayankuma@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 085d2622-7828-4709-ca18-08d9fb80ae8f
X-MS-TrafficTypeDiagnostic: SA2PR02MB7595:EE_
X-Microsoft-Antispam-PRVS:
	<SA2PR02MB7595DAEF266E3F8BA2326957B2029@SA2PR02MB7595.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BtoEydReEZTQidQ1DtzbCrBExAzj0TMjUIm/3AEjIcSCmyY7yRfIMD9b2L1XP7j+QLya5LZ7jR3aRffjGvMaDLOICNS+flXkuBVlX49O3h0s2u0aOCuLhc15wT2YWwzx+M3USMW3MZxCA3RuU9T1X0NcShhvMmPITeQJcHJfaHIKzUYYftto09PkWjALgPauukb86Lcipnw29sdfSXnu3leRStRo7qJCViDbyeuJnYX3QVlQ0nxrrHJFnR6TSGAKLM7Vy84h6yW8YGSW7sHdk1qcPJ0zADDHEi2nI8ZVtfmdLcP1Hmo+avuVsIDA7v5GNmpdssaWe5b2cneVFJHWRfCnwT6zJ/ZCm9TF+OnjcYfweSolkphT4PIv0iwBw/bCHD3I7SvKe08qFLeh3d1L+bjgK4fg5eTDgTh2rZ6T4oi097hNzjOjAuKOwzxPIwIKoNTObpVd6fSpbJaObK+ul+x7cDv06Y9PwTALXo0j5SVTfffC5lhhkKvgN31CsOWkFo/52xYXDkR0gCrsdJZdq1G1IV9DAWNPFHhs64M9dVY/EzigmvoDpWg62YLOIRq8oDpVfiKfM9dreVddlocnlLfuv2CZMVHVlLy/sGTZyxGNkdeu3Pd0YUe8z81fDpuPvEHZ/cfdqeR9xeBQvzdsROajKoM3+JzZ8h70guf98xVuKE1yywimkUY/lP3wZ4HZ2IzuOBgxGuZWkBucSQAFpw==
X-Forefront-Antispam-Report:
	CIP:149.199.80.198;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:xir-pvapexch01.xlnx.xilinx.com;PTR:unknown-80-198.xilinx.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(316002)(1076003)(5660300002)(7416002)(40460700003)(8676002)(70586007)(70206006)(82310400004)(4326008)(2906002)(186003)(26005)(426003)(9786002)(107886003)(2616005)(36756003)(356005)(7636003)(7696005)(6666004)(8936002)(83380400001)(6916009)(508600001)(336012)(54906003)(36860700001)(47076005)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2022 12:40:35.0024
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 085d2622-7828-4709-ca18-08d9fb80ae8f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.80.198];Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1NAM02FT0034.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7595

When the data abort is caused due to cache maintenance for an address,
there are two scenarios:-

1. Address belonging to a non emulated region - For this, Xen should
set the corresponding bit in the translation table entry to valid and
return to the guest to retry the instruction. This can happen sometimes
as Xen need to set the translation table entry to invalid. (for eg
'Break-Before-Make' sequence).

2. Address belongs to an emulated region - Xen should ignore the
instruction (ie increment the PC) and return to the guest.

We try to deal with scenario#1, by invoking check_p2m(). If this is
unsuccessful, then we assume scenario#2.

Signed-off-by: Ayan Kumar Halder <ayankuma@xilinx.com>
---

Changelog:-

v1...v8 - NA

v9 - Extracted this change from "[XEN v7 2/2] xen/arm64: io: Support
instructions (for which ISS is not ..." into a separate patch of its
own. The reason being this addresses an existing bug in the codebase.

 xen/arch/arm/include/asm/mmio.h |  3 ++-
 xen/arch/arm/io.c               | 11 +++++++++++
 xen/arch/arm/traps.c            |  6 ++++++
 3 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/mmio.h b/xen/arch/arm/include/asm/mmio.h
index ef2c57a2d5..75d362d5f5 100644
--- a/xen/arch/arm/include/asm/mmio.h
+++ b/xen/arch/arm/include/asm/mmio.h
@@ -34,7 +34,8 @@ enum instr_decode_state
      * Instruction is decoded successfully. It is a ldr/str post indexing
      * instruction.
      */
-    INSTR_LDR_STR_POSTINDEXING
+    INSTR_LDR_STR_POSTINDEXING,
+    INSTR_IGNORE                    /* Instruction is ignored */
 };
 
 typedef struct
diff --git a/xen/arch/arm/io.c b/xen/arch/arm/io.c
index ebcb8ed548..7e9dd4bb08 100644
--- a/xen/arch/arm/io.c
+++ b/xen/arch/arm/io.c
@@ -139,6 +139,17 @@ void try_decode_instruction(const struct cpu_user_regs *regs,
         return;
     }
 
+    /*
+     * When the data abort is caused due to cache maintenance, Xen should ignore
+     * this instruction as the cache maintenance was caused on an address belonging
+     * to the emulated region.
+     */
+    if ( info->dabt.cache )
+    {
+        info->dabt_instr.state = INSTR_IGNORE;
+        return;
+    }
+
     /*
      * Armv8 processor does not provide a valid syndrome for decoding some
      * instructions. So in order to process these instructions, Xen must
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index e491ca15d7..5879640b73 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -2011,6 +2011,12 @@ static void do_trap_stage2_abort_guest(struct cpu_user_regs *regs,
 
         try_decode_instruction(regs, &info);
 
+        if ( info.dabt_instr.state == INSTR_IGNORE )
+        {
+            advance_pc(regs, hsr);
+            return;
+        }
+
         /*
          * If Xen could not decode the instruction or encountered an error
          * while decoding, then it should forward the abort to the guest.
-- 
2.17.1


