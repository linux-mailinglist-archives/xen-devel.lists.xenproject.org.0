Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F35642AA2
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 15:48:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453790.711384 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Cky-0000qb-A7; Mon, 05 Dec 2022 14:47:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453790.711384; Mon, 05 Dec 2022 14:47:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2Cky-0000op-6w; Mon, 05 Dec 2022 14:47:44 +0000
Received: by outflank-mailman (input) for mailman id 453790;
 Mon, 05 Dec 2022 14:47:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NO0Y=4D=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p2Ckw-0000oh-K1
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 14:47:42 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20601.outbound.protection.outlook.com
 [2a01:111:f400:7eae::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4507d18-74ab-11ed-8fd2-01056ac49cbb;
 Mon, 05 Dec 2022 15:47:41 +0100 (CET)
Received: from BN0PR08CA0021.namprd08.prod.outlook.com (2603:10b6:408:142::16)
 by SA1PR12MB6797.namprd12.prod.outlook.com (2603:10b6:806:259::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.13; Mon, 5 Dec
 2022 14:47:37 +0000
Received: from BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:142:cafe::ff) by BN0PR08CA0021.outlook.office365.com
 (2603:10b6:408:142::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Mon, 5 Dec 2022 14:47:37 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT086.mail.protection.outlook.com (10.13.176.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.13 via Frontend Transport; Mon, 5 Dec 2022 14:47:37 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Dec
 2022 07:27:02 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 5 Dec 2022 07:27:00 -0600
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
X-Inumbo-ID: c4507d18-74ab-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I8aBEn4sTthDS7VfhuyWdxo/1YCfOTWnj6fG3CcW6qPw/UFlIdGj06Nac/8DMfmwumfk+vU1rmGg9Dk2DclmL23FYymJ4hKN4cVdDPJyyR/6a3mfdLm3mYpUHeTECPbJbCxib0ICANJqSIpltRtluG3UKIV+l1pO1UmVbRYmwBhjHtSQjZjVULO63OOjf1X3xRZ/CoCy1lNjTkpWVHs6gKdZ/631a31EbTYEFZwnjkapJQsGfAqUIr7HwRtFJnA491A4f8eaxYwFtc8ILHDQaHsFbR2V63vu/8Lhq4PtyERrVWAV1v6ruafKmXwfuE7PtZjLm87dHFXoVWypiaBKrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7jRyeelaoFeHR1J25tVrU6dQKXjWC8IP5yvkiKz9nw=;
 b=davqFUNXXFRTngJt3K791MuPfa2vvdeIfP8viV6e9No+w59Gt37UT/pWKTMe6M6+M+lEsIq/Ue5C+xTBp4CwpXkrHyRlZkRTDS8f8Mj9DeK9vAnMBTNA/uPJgASznqkdqEM5nN+6etZrczrwy2izEjYcHxdAxRNurXH/Mr0gbnsuZhz3cSiH6siIcqNb5AiVMOmptfkymGDvXZw1FlKjz3/MrNmuWOwlyVOwb2PS62cVG34J04qh9dEvhr9ndu3J55UGsM4DUJsiBa2bNCExYbi0v55i8LJtRiALLAvsldvOmSslP8p0uJnX4yHXyAbudKJMzDZt1LSPoS8iTd4aGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7jRyeelaoFeHR1J25tVrU6dQKXjWC8IP5yvkiKz9nw=;
 b=oRuMlW0N0Aa5v1gs/DTlJwPC/DY7+BkP3fdtY4jpRAfxavcd6WMYNeAD4d4amgEXvjuoCQ+41f0hyygVY/H0Moir+Ttq+VcvK5fLk662z4PE53gKzLpieQipgYkAsGr27qso4SAxjQJvF8F+3byiR2T63AZbnaVtSymCYBl0A1k=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <jgrall@amazon.com>, <burzalodowa@gmail.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>
Subject: [XEN v5 03/11] xen/Arm: vreg: Support vreg_reg64_* helpers on AArch32
Date: Mon, 5 Dec 2022 13:26:29 +0000
Message-ID: <20221205132637.26775-4-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221205132637.26775-1-ayan.kumar.halder@amd.com>
References: <20221205132637.26775-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT086:EE_|SA1PR12MB6797:EE_
X-MS-Office365-Filtering-Correlation-Id: 952e0f3f-7674-4d46-a662-08dad6cfa6c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rePy4W4OS3UHnJVU7148FOn6w+2bW+1P4BBDSar2WgE3TUrHK/lIcWeD8UCGIveSzcQn/FQvhSi/mMzmp/dmdT8GMs6l0aDQUtQ85fcUu/+/VXH6Azz9ZEtQtHqXiz2ExbovF2mz9dlhPdqjgfmbuEKJ6Obj4FSO+MqG9JAnFC3b1v13XCx2UPol7FUTpOb+uKyRt6MVu7aPPwSy2cQIcbHiT9oC20pFxn5RLDtjm0ynwPpa9ZiDrx5x9RkRJKFWh8/ia2IVM3gBELu0PhZdVSSIYjk9XvwIAjVW3oj6UlLmlcah10nVNmAp4dgxan2v8aCeDgx3UWGr1YL0X5jEKVHu2+ktrrAMsqxbi05WGc9dsgX1/5Yu9N14Qqdq01LMncRK17mg32EgzxpqfqTZuGAifXe28YQ3h/okHQmtG5wdG5VQOPM2J+29JteTDP77Ns4/k/063+CqzoZM6EqQicM51lD1rPIP+4v6oiYMEDdt6sPfQpA54cAHPdfLFKvEUZHow6obkEBrqQf1b+PW/94g7qdnzEdRkgBs8EB5wZfA/LoDtK2iFuVMF7IdX5zMk/8zTZdmCJyVQuzbc4/20+15zA4Il0dukWQBhM7nWf2fFkFKnqOV4dsiPCHuglM3Dp/AQKJpcc++D10GYiCdEzDAs9kMGfso35ZerhOVKi5Xkcjvkxr5Z6WqY6Vh/baLPVrKD8LRwRb/5tEYQLzJs1VMQwZH9kXJcDV0sOP5jm8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(136003)(39860400002)(346002)(451199015)(46966006)(36840700001)(40470700004)(36860700001)(356005)(2906002)(82740400003)(5660300002)(336012)(103116003)(47076005)(86362001)(81166007)(40460700003)(426003)(83380400001)(26005)(1076003)(186003)(478600001)(6666004)(54906003)(6916009)(8676002)(40480700001)(4326008)(316002)(8936002)(41300700001)(70206006)(2616005)(36756003)(70586007)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 14:47:37.0292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 952e0f3f-7674-4d46-a662-08dad6cfa6c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT086.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6797

In some situations (e.g. GICR_TYPER), the hypervior may need to emulate
64bit registers in AArch32 mode. In such situations, the hypervisor may
need to read/modify the lower or upper 32 bits of the 64 bit register.

In AArch32, 'unsigned long' is 32 bits. Thus, we cannot use it for 64 bit
registers.

While we could replace 'unsigned long' by 'uint64_t', it is not entirely clear
whether a 32-bit compiler would not allocate register for the upper 32-bit.
Therefore fold vreg_reg_* helper in the size specific one and use the
appropriate type based on the size requested.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Julien Grall <julien@xen.org>
---
Changes from -

v1 - 1. Remove vreg_reg_extract(), vreg_reg_update(), vreg_reg_setbits() and
vreg_reg_clearbits(). Moved the implementation to  vreg_reg##sz##_*.
'mask' and 'val' is now using uint##sz##_t.

v2 - 1. Use 'unsigned int' for 'shift' variable.
2. Updated the commit message.

v3 - 1. No changes. Added Rb and Ack.

v4 - 1. No changes.

 xen/arch/arm/include/asm/vreg.h | 86 ++++++++-------------------------
 1 file changed, 19 insertions(+), 67 deletions(-)

diff --git a/xen/arch/arm/include/asm/vreg.h b/xen/arch/arm/include/asm/vreg.h
index f26a70d024..d92450017b 100644
--- a/xen/arch/arm/include/asm/vreg.h
+++ b/xen/arch/arm/include/asm/vreg.h
@@ -89,106 +89,58 @@ static inline bool vreg_emulate_sysreg(struct cpu_user_regs *regs, union hsr hsr
  * The check on the size supported by the register has to be done by
  * the caller of vreg_regN_*.
  *
- * vreg_reg_* should never be called directly. Instead use the vreg_regN_*
- * according to size of the emulated register
- *
  * Note that the alignment fault will always be taken in the guest
  * (see B3.12.7 DDI0406.b).
  */
-static inline register_t vreg_reg_extract(unsigned long reg,
-                                          unsigned int offset,
-                                          enum dabt_size size)
-{
-    reg >>= 8 * offset;
-    reg &= VREG_REG_MASK(size);
-
-    return reg;
-}
-
-static inline void vreg_reg_update(unsigned long *reg, register_t val,
-                                   unsigned int offset,
-                                   enum dabt_size size)
-{
-    unsigned long mask = VREG_REG_MASK(size);
-    int shift = offset * 8;
-
-    *reg &= ~(mask << shift);
-    *reg |= ((unsigned long)val & mask) << shift;
-}
-
-static inline void vreg_reg_setbits(unsigned long *reg, register_t bits,
-                                    unsigned int offset,
-                                    enum dabt_size size)
-{
-    unsigned long mask = VREG_REG_MASK(size);
-    int shift = offset * 8;
-
-    *reg |= ((unsigned long)bits & mask) << shift;
-}
-
-static inline void vreg_reg_clearbits(unsigned long *reg, register_t bits,
-                                      unsigned int offset,
-                                      enum dabt_size size)
-{
-    unsigned long mask = VREG_REG_MASK(size);
-    int shift = offset * 8;
-
-    *reg &= ~(((unsigned long)bits & mask) << shift);
-}
 
 /* N-bit register helpers */
 #define VREG_REG_HELPERS(sz, offmask)                                   \
 static inline register_t vreg_reg##sz##_extract(uint##sz##_t reg,       \
                                                 const mmio_info_t *info)\
 {                                                                       \
-    return vreg_reg_extract(reg, info->gpa & (offmask),                 \
-                            info->dabt.size);                           \
+    unsigned int offset = info->gpa & (offmask);                        \
+                                                                        \
+    reg >>= 8 * offset;                                                 \
+    reg &= VREG_REG_MASK(info->dabt.size);                              \
+                                                                        \
+    return reg;                                                         \
 }                                                                       \
                                                                         \
 static inline void vreg_reg##sz##_update(uint##sz##_t *reg,             \
                                          register_t val,                \
                                          const mmio_info_t *info)       \
 {                                                                       \
-    unsigned long tmp = *reg;                                           \
+    unsigned int offset = info->gpa & (offmask);                        \
+    uint##sz##_t mask = VREG_REG_MASK(info->dabt.size);                 \
+    unsigned int shift = offset * 8;                                    \
                                                                         \
-    vreg_reg_update(&tmp, val, info->gpa & (offmask),                   \
-                    info->dabt.size);                                   \
-                                                                        \
-    *reg = tmp;                                                         \
+    *reg &= ~(mask << shift);                                           \
+    *reg |= ((uint##sz##_t)val & mask) << shift;                        \
 }                                                                       \
                                                                         \
 static inline void vreg_reg##sz##_setbits(uint##sz##_t *reg,            \
                                           register_t bits,              \
                                           const mmio_info_t *info)      \
 {                                                                       \
-    unsigned long tmp = *reg;                                           \
-                                                                        \
-    vreg_reg_setbits(&tmp, bits, info->gpa & (offmask),                 \
-                     info->dabt.size);                                  \
+    unsigned int offset = info->gpa & (offmask);                        \
+    uint##sz##_t mask = VREG_REG_MASK(info->dabt.size);                 \
+    unsigned int shift = offset * 8;                                    \
                                                                         \
-    *reg = tmp;                                                         \
+    *reg |= ((uint##sz##_t)bits & mask) << shift;                       \
 }                                                                       \
                                                                         \
 static inline void vreg_reg##sz##_clearbits(uint##sz##_t *reg,          \
                                             register_t bits,            \
                                             const mmio_info_t *info)    \
 {                                                                       \
-    unsigned long tmp = *reg;                                           \
-                                                                        \
-    vreg_reg_clearbits(&tmp, bits, info->gpa & (offmask),               \
-                       info->dabt.size);                                \
+    unsigned int offset = info->gpa & (offmask);                        \
+    uint##sz##_t mask = VREG_REG_MASK(info->dabt.size);                 \
+    unsigned int shift = offset * 8;                                    \
                                                                         \
-    *reg = tmp;                                                         \
+    *reg &= ~(((uint##sz##_t)bits & mask) << shift);                    \
 }
 
-/*
- * 64 bits registers are only supported on platform with 64-bit long.
- * This is also allow us to optimize the 32 bit case by using
- * unsigned long rather than uint64_t
- */
-#if BITS_PER_LONG == 64
 VREG_REG_HELPERS(64, 0x7);
-#endif
 VREG_REG_HELPERS(32, 0x3);
 
 #undef VREG_REG_HELPERS
-- 
2.17.1


