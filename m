Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D7D6139C1
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 16:14:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.433025.685863 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opWUM-0000id-98; Mon, 31 Oct 2022 15:14:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 433025.685863; Mon, 31 Oct 2022 15:14:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opWUM-0000fm-5y; Mon, 31 Oct 2022 15:14:10 +0000
Received: by outflank-mailman (input) for mailman id 433025;
 Mon, 31 Oct 2022 15:14:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7CAU=3A=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1opWUK-0008Dn-CJ
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 15:14:08 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2042.outbound.protection.outlook.com [40.107.223.42])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a95c0400-592e-11ed-8fd0-01056ac49cbb;
 Mon, 31 Oct 2022 16:14:07 +0100 (CET)
Received: from MW4P221CA0026.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::31)
 by BL0PR12MB5012.namprd12.prod.outlook.com (2603:10b6:208:1ca::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19; Mon, 31 Oct
 2022 15:14:04 +0000
Received: from CO1NAM11FT099.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8b:cafe::f2) by MW4P221CA0026.outlook.office365.com
 (2603:10b6:303:8b::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19 via Frontend
 Transport; Mon, 31 Oct 2022 15:14:04 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT099.mail.protection.outlook.com (10.13.175.171) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5769.14 via Frontend Transport; Mon, 31 Oct 2022 15:14:03 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 31 Oct
 2022 10:14:01 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 31 Oct
 2022 08:14:01 -0700
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Mon, 31 Oct 2022 10:14:00 -0500
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
X-Inumbo-ID: a95c0400-592e-11ed-8fd0-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W8TX21sAhjP3nW5WV+2hivONUUCVJZPgdpN600/IGnkldEaHcy2IEZUQdnUrJQNIsxzyCeVudLibomhH3WzEU0z6881J4aiqoV33qegj3+NVZzFSVD59PwzsOcqpD4KnCNOHx8ZLenWUftv1n1mlnvpJ+SZm1WxBlePtelodwSBeCY9sbVKIuXPNaFAxSohzCFJyzVy3RjwMBgSOfQq2GmTCgUGIPVgENmdZFjW7bh6+aFg8iFfwhN4hohjSuP/OLTFAQKO8XCKNMT5Is12Lt/Ef+PiRMht/yNEsZVWd1d8KgXF4QP57i6eRgwHUD7SMI+k+q2TRfs3MxNvnuXt2mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6WPKgEE6G5c5YDrP4Py1fTMRs9CpcadylX4kzwc3sLM=;
 b=XzvQc3OF0lJZTdDPAfbMWvtjF8CLNj6bBOZSn1L7EOrMhFAP/1kkzydsta3H3iVzdlrCn8vdcCS8vABpMW0NPz9Y/5UZjc2mv4nmXeLbUv0Ig5FXQvO+sQnw39iIjca5ScVkm13FRsTBfRNs5fXDly7Gd3QP9XI9r/pfVLQpBLj50hiwfeN2hUVY2+A7mUWw4SmCAXBtwt/dWNwgyyQXwjeTIzpAHyGi8Avtnu1NoEF969M16d0BT/Im/MuWieEPyFobLdvJpw3xN7XYjh6WN1s0mx3Beyyp9bVcfcnHtyFK/YGo5Y0Oo/nqc4H9c7pXduRa6khAOeZS1Sy5ww+OBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6WPKgEE6G5c5YDrP4Py1fTMRs9CpcadylX4kzwc3sLM=;
 b=tMwFD+RJmR4xgbBLZWzZqh52y3fjDwpQkLe5blCiCYJlKHo1YPiABeFEZHUVKEE3BHB9NUoia+7uoKQXwm9NZGCaBQ5Wmk8aXue9mTRvazaE7++yHBImlwlnVtQvkXtectMgRoFnvSmPCarueEpA0aRa2KozioppeOdPDYP7Ds4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayankuma@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<burzalodowa@gmail.com>, Ayan Kumar Halder <ayankuma@amd.com>
Subject: [XEN v2 03/12] xen/Arm: vreg: Support vreg_reg64_* helpers on Aarch32
Date: Mon, 31 Oct 2022 15:13:17 +0000
Message-ID: <20221031151326.22634-4-ayankuma@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221031151326.22634-1-ayankuma@amd.com>
References: <20221031151326.22634-1-ayankuma@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT099:EE_|BL0PR12MB5012:EE_
X-MS-Office365-Filtering-Correlation-Id: 585ad06b-5a1c-49df-3bcc-08dabb528c00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AQITzW39YdiiWYAHCrloLC8dKy880ND0vdkY+8xBrifbu1Ag+TzJ98exC3krQ4AyQS5idIFyEX/DjTr2CpDKER3uMOPyaYvPk3jlfjKevy7y69Gj0W/mi6oprsmVqDGnbUitmNBt8WAd1J2ueRUuaEWHDUMy2mGAnCQbD/03WY9P2plp52/CaaQ3DLhL7vtm8xGjm/7hZNiGow5+iCVX+Ok4z3VEmnOVY6iUAdJUaWVuEFS28gsDCBmJ3xegctGEfRs85Jh2uWjXs6hZ4kpw75nGGaVBlQFc9qwgwurdcQ5rhlmVvoomOXQQ5fjb7ERf6X15ctUFzZ+Ig4WijIHl1jq8FYert/cXSu5JCdSU/Mx6hdU/th5KhvE6vWP7sbPBCh3V08fmhp2Dzmq5mXHcrArzmsjqSq8704UEedJMC3DmWrUpA+VPo0smZG5kaaJjLrkCmgkfuldinL/epikE2Mw8P5ak1rksDihmx/W/x7RFZWUl6H/W377Bo2ZmuynjWEjlPWQr1ZvQ7jkGf1sWWt3ZsUiQ09iL0JzE6T6HhRZ+CniKB8d0kFpsp4PW0BZXX5WiDXzzzNZTmsLf9eDiEE9i8+pVWrBvOpJswTL95Q26JTKNf8Cjo4uBA7L6zzqsKsPC6bqhnwwvKXWpxZ5kpgydIDvLVzwe8mHLx6jCtkgJmzQwzT4OA7MZch1E2gJnIjaIaVgZJPz2CYtywNcBs+KHVd/uehs2z8IDYT/xEmk7hhKxKTzd6R6OeMTMis51feixqDLRYX94x/BdMfoZGedqRcq2uEdCFamSu8870ek=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(396003)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(356005)(81166007)(82740400003)(40480700001)(36756003)(2906002)(6666004)(478600001)(70586007)(4326008)(70206006)(316002)(40460700003)(8676002)(5660300002)(6916009)(8936002)(54906003)(41300700001)(82310400005)(36860700001)(186003)(2616005)(26005)(1076003)(47076005)(83380400001)(426003)(336012)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 15:14:03.5322
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 585ad06b-5a1c-49df-3bcc-08dabb528c00
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT099.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5012

In some situations (eg GICR_TYPER), the hypervior may need to emulate
64bit registers in aarch32 mode. In such situations, the hypervisor may
need to read/modify the lower or upper 32 bits of the 64 bit register.

In aarch32, 'unsigned long' is 32 bits. Thus, we cannot use it for 64 bit
registers.

The correct approach is to typecast 'mask' based on the size of register access
(ie uint32_t or uint64_t) instead of using 'unsigned long' as it will not
generate the correct mask for the upper 32 bits of a 64 bit register.
Also, 'val' needs to be typecasted so that it can correctly update the upper/
lower 32 bits of a 64 bit register.

Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
---

Changes from :-
v1 - 1. Remove vreg_reg_extract(), vreg_reg_update(), vreg_reg_setbits() and
vreg_reg_clearbits(). Moved the implementation to  vreg_reg##sz##_*.
'mask' and 'val' is now using uint##sz##_t.

 xen/arch/arm/include/asm/vreg.h | 88 ++++++++-------------------------
 1 file changed, 20 insertions(+), 68 deletions(-)

diff --git a/xen/arch/arm/include/asm/vreg.h b/xen/arch/arm/include/asm/vreg.h
index f26a70d024..122ea79b65 100644
--- a/xen/arch/arm/include/asm/vreg.h
+++ b/xen/arch/arm/include/asm/vreg.h
@@ -89,107 +89,59 @@ static inline bool vreg_emulate_sysreg(struct cpu_user_regs *regs, union hsr hsr
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
-                                                                        \
-    vreg_reg_update(&tmp, val, info->gpa & (offmask),                   \
-                    info->dabt.size);                                   \
+    unsigned int offset = info->gpa & (offmask);                        \
+    uint##sz##_t mask = VREG_REG_MASK(info->dabt.size);                 \
+    int shift = offset * 8;                                             \
                                                                         \
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
+    int shift = offset * 8;                                             \
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
+    unsigned int offset = info->gpa & (offmask);                        \
+    uint##sz##_t mask = VREG_REG_MASK(info->dabt.size);                 \
+    int shift = offset * 8;                                             \
                                                                         \
-    vreg_reg_clearbits(&tmp, bits, info->gpa & (offmask),               \
-                       info->dabt.size);                                \
-                                                                        \
-    *reg = tmp;                                                         \
+    *reg &= ~(((uint##sz##_t)bits & mask) << shift);                    \
 }
 
-/*
- * 64 bits registers are only supported on platform with 64-bit long.
- * This is also allow us to optimize the 32 bit case by using
- * unsigned long rather than uint64_t
- */
-#if BITS_PER_LONG == 64
-VREG_REG_HELPERS(64, 0x7);
-#endif
 VREG_REG_HELPERS(32, 0x3);
+VREG_REG_HELPERS(64, 0x7);
 
 #undef VREG_REG_HELPERS
 
-- 
2.17.1


