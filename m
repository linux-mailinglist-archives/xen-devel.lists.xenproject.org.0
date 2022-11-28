Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 962DE63AD15
	for <lists+xen-devel@lfdr.de>; Mon, 28 Nov 2022 16:57:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449013.705632 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozgVe-0004wY-PP; Mon, 28 Nov 2022 15:57:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449013.705632; Mon, 28 Nov 2022 15:57:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozgVe-0004tJ-M0; Mon, 28 Nov 2022 15:57:30 +0000
Received: by outflank-mailman (input) for mailman id 449013;
 Mon, 28 Nov 2022 15:57:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xF6c=34=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1ozgVc-00040T-KA
 for xen-devel@lists.xenproject.org; Mon, 28 Nov 2022 15:57:28 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7e89::60d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a816de2-6f35-11ed-91b6-6bf2151ebd3b;
 Mon, 28 Nov 2022 16:57:27 +0100 (CET)
Received: from DM6PR06CA0090.namprd06.prod.outlook.com (2603:10b6:5:336::23)
 by SJ1PR12MB6193.namprd12.prod.outlook.com (2603:10b6:a03:459::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.22; Mon, 28 Nov
 2022 15:57:23 +0000
Received: from DM6NAM11FT105.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:336:cafe::4d) by DM6PR06CA0090.outlook.office365.com
 (2603:10b6:5:336::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23 via Frontend
 Transport; Mon, 28 Nov 2022 15:57:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT105.mail.protection.outlook.com (10.13.173.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5857.18 via Frontend Transport; Mon, 28 Nov 2022 15:57:21 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 28 Nov
 2022 09:57:21 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 28 Nov
 2022 07:57:20 -0800
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 28 Nov 2022 09:57:19 -0600
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
X-Inumbo-ID: 5a816de2-6f35-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QV9RBHR5CCEwDJ5Ez3NA6enHDWUZEuhv56RtzPzGpYjVHPXmr09igoNL4SMmgF2lSAQaYpFW8RNJ7Rlt8z0JV6pErbWqZOcjAsoCoFNF6QzH88R3NWqW/ZzMk6xX5Tp0rop1mzH0CIz2tE59zVclhdn33nVu7oDM2qSzQLddlUuVeifns9ucQgs7A3V4kB+X9gZDaiqdXFDi7WYRFxm7D/CmMqVQZckjaE0G5+67BU6xC1+YJRGXukYgOjQMMJ72Z8Gxqs9kP9vIEziE4dogNSdWC97TJjsJm5YXzhQYfJCZLXde4VmPKx14Xzovwdm5ZY/L5Lknys8fCHz8VvCqcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wo2+sVo6LtAt5RMJpKRO/GdQYNQZj2Z4JvovHOpUzxI=;
 b=aYvc1Snsv/vCgvpMPP+OYWdEcjdvE85gSo6bIpvpgml4Z/CpiIwMh+/0mUfupETuxmhWBKW6PXuWajcQOFA8a3Ol0Sd7CUSaTW1KgUI1gGmlDkuVwWVxoQ3MMF4705skm2Bvs/Fh7OCNDUV+yonYB8xJTZ+zXtqHpA/Nb98PN6/S+nJbq+mpmrUKbULvrZEjaDhztkIDs7rW/KoDxL/bZ1cNmjDXWJo/K0W9+V1eeg/MmNSBPlrj2zvsVetAhpQNuTFJhdreUvQRrCXPuNceRLC277ETQh24N0pfHD0wN1nxc6pPw/QqgaI3NHfTRCF/6+aRrXKTikk9CEiU8CmS7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wo2+sVo6LtAt5RMJpKRO/GdQYNQZj2Z4JvovHOpUzxI=;
 b=p448bisrsPbOSTEnV1H8Ws314UgIryCzGL6Fqu6/ka2/53EGMCbSTKv5DxMX+CHVE8ZD4zzxIyiGEJE5W1mJ3U4uG/LO9NGuut1Vxe4/57QEltJk2GnSJzk1MABzm7Ujeap4pzQ0oyXr5hy1OigsFNf5qDuxcRvmWM+50DPar5c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <jgrall@amazon.com>, <burzalodowa@gmail.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>
Subject: [XEN v4 03/11] xen/Arm: vreg: Support vreg_reg64_* helpers on AArch32
Date: Mon, 28 Nov 2022 15:56:41 +0000
Message-ID: <20221128155649.31386-4-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221128155649.31386-1-ayan.kumar.halder@amd.com>
References: <20221128155649.31386-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT105:EE_|SJ1PR12MB6193:EE_
X-MS-Office365-Filtering-Correlation-Id: c8bc0b8d-d4c3-4046-db0d-08dad1593c42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NfG6yuKSlD3RysAjcQjOa9ReUPytDgLoiXSmyD6USL34nFcj9R7fX0g1s5dOtP5e225IkCyJTFYLpBgJBLQjdUygkXglOQssczrj4Z89vPbrNPr8cmwD7RQfwYi49XuRGAaMZCQLFkLbL0y8j1+urLl1sFXC0E2Z/8NIF4s1R+Nwj9wIqdZlSgDXV0oot5naaIbQ6eGW7lrvHYREgaRc1+Lj+zYRJg2c1T8dJNx6Rpp0mRtGFKBS2zMTB12ETrnlpLgDqKYYwVeAwDtCQRL/0awgGXZx+udHee82c+PvTNF9GklnOnKe0Jh0U3NiJXyKfWYzZI1pHZfVy54QetwEUr++J/5zgaPokCHjQ/3UL1y+uZt2qVlVfpGDud1M9p9aKKGsz+s1Wtb/w1Rhz5+ZR8VigyOyVZuGF7ZQaz2QxdtW+cf+SkpTKZeg485ZguOFb8p11FBCw+BxARtRdnB6pEGaBh1KzJuwOEm5/UWAc/eKnbH7ZqdRJ3m8VbvWkC6OJasns+MNE973DnLAOuPTz4Rky4GQZgoolFwdANDSGWLCXN5xuap4Jdf57u9KI7RCGsSsoBeIA+R1aHkbZsQ/5UL2TAmyTVzK22X9kg6USzglhRlUzt4fLVhtcvdntwcziFWUUcFmm7r/EPR1lxQt2OdeDlN1vXrjXOHpgaye2MlDC+kYcPrswwYPPgWkJJ75TsJCk4h0xeGbI6auW3kpb+jk9IUaqFP5Gas2eXAhK9w=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(376002)(396003)(346002)(451199015)(40470700004)(36840700001)(46966006)(1076003)(2616005)(41300700001)(6666004)(86362001)(26005)(36756003)(40460700003)(316002)(6916009)(70206006)(8676002)(54906003)(40480700001)(70586007)(4326008)(103116003)(82740400003)(2906002)(83380400001)(5660300002)(336012)(8936002)(186003)(36860700001)(356005)(478600001)(82310400005)(426003)(47076005)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 15:57:21.8874
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8bc0b8d-d4c3-4046-db0d-08dad1593c42
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT105.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6193

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


