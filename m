Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C51F6817BFB
	for <lists+xen-devel@lfdr.de>; Mon, 18 Dec 2023 21:33:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656382.1024481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFKIe-0003Fg-AS; Mon, 18 Dec 2023 20:33:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656382.1024481; Mon, 18 Dec 2023 20:33:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFKIe-0003DA-7Z; Mon, 18 Dec 2023 20:33:16 +0000
Received: by outflank-mailman (input) for mailman id 656382;
 Mon, 18 Dec 2023 20:33:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V1dw=H5=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rFKIc-0003D2-OC
 for xen-devel@lists.xenproject.org; Mon, 18 Dec 2023 20:33:14 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8f06cb8-9de4-11ee-9b0f-b553b5be7939;
 Mon, 18 Dec 2023 21:33:12 +0100 (CET)
Received: from CH5P221CA0023.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::25)
 by IA0PR12MB8975.namprd12.prod.outlook.com (2603:10b6:208:48f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 20:33:08 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:610:1f2:cafe::ce) by CH5P221CA0023.outlook.office365.com
 (2603:10b6:610:1f2::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.38 via Frontend
 Transport; Mon, 18 Dec 2023 20:33:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7113.14 via Frontend Transport; Mon, 18 Dec 2023 20:33:07 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 18 Dec
 2023 14:33:02 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via
 Frontend Transport; Mon, 18 Dec 2023 14:33:00 -0600
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
X-Inumbo-ID: a8f06cb8-9de4-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MmIJNx2aAduUVu8CDplXRU1r9CSmC0j7pGsae0b+6i3urGy7dSefOQ8vKl6howTjF5/2Aui16LZCc0Qa3tB6ccMhc8NV/3iujkn3uchattY9OVvtyNNSIWFKbDyOP+EzpcBszyIzN6T52678QZKX1cP9YHBxRt2Vuo+xSkPq0jge0z+aPAaIMudEa1NvKgwTreOmr1Q35cnb2V2GREMzYYgk87T2YMCtg3HZvawxxdBWO4AMgVx+sdViFhGGv4EPjdBkN/t3qmDB8fng/c4D22geOILmjLVF+xJ18EIDz3SX1XTNLwreS7vvyK/lXW2TDvvJB2uipkEixqHOzaSmnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v534rtDojDtHFqs8XoTePK1ktvHssbuLWOgqwn7Byv0=;
 b=bXW6aHPO8Mfw7+E96n9bTpUOxcH1TNmWXpxO1AU5xxKLhYydl6dKtyJk7yYseLTVwB6Upjdr5+4NiB/4xfDgwvsF4IuPoC7TlOpiwuHGz8CGIL5vfvSCZ4NU/XnbuSn9TeBZsZoVrYDDSPAAwUs/Y2g6Feh59Zn6/rkPNKbLYQaJ16p5klaIGSuRl8XNEb+G/OhZoUZLS+B9VgYw2mhlyWHh2Z8LEZIbCUNWcRAQNtVEglqiNn48WTg2pHQKqgdCuYyhZROBwKDXorKJJd/AEjvB2UGYGlO0ly5/NqJ466Toc/6XM5KqwbDeLbw5uyrEZBwytCkny9rlLAf+50B1qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v534rtDojDtHFqs8XoTePK1ktvHssbuLWOgqwn7Byv0=;
 b=LIDRe+mtJubJCY/Lr1mjj+5e2w66L+qalPnVa1OhxCPIg4cNHvjjgd/uQ1HspFLfA/V0isxEpn4Yr9OKxa8AwWKcwlfruSKA8joD3JNRGmMd9W0yltxzATpTDzhWaP2ScWlWZjYiMNxnLZBgxC7RQjkEt4RLbgy/3Xai7HcY32c=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: <michal.orzel@amd.com>
To: <julien@xen.org>, <ayan.kumar.halder@amd.com>, <sstabellini@kernel.org>,
	<bertrand.marquis@arm.com>, <michal.orzel@amd.com>,
	<Volodymyr_Babchuk@epam.com>, <stefano.stabellini@amd.com>
CC: <xen-devel@lists.xenproject.org>
Subject: [PATCH v2 1/3] xen/arm: Add emulation of Debug Data Transfer Registers
Date: Mon, 18 Dec 2023 20:32:42 +0000
Message-ID: <20231218203242.1393268-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|IA0PR12MB8975:EE_
X-MS-Office365-Filtering-Correlation-Id: a378d2f0-30fd-4c90-fcf1-08dc00088b0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hWQLiPH0AXn4BXWtSTtUTM3rDtGYKYL7qWHOkJmWH/eqosq9h/F1DkqGXKHyx7qSHpxaAGBTjsTHeFF4rtwd2pvee4SebTUrWkHRn0BCZSZyTJEWjP+fMIHZGoiF1r4Tkg8DAYslJL0XO2ZNOxdQiaFSE02mreODBrnLCoxCMM2uVkyz5jPJdfj7sLlroESrtMCqTB4eMrakLpZQU/eItZCNUdKZ2O7JY3ATy64rFTE5PLpPe1H7pMf/bVXMvh4dJI/hH7HVHV8sjJtgNdoO5TxAXE83okI2T2CxkTE4AazlcHNRFLPH1M47+f1Y7Yq2dZadiulKcMm9fEf+zEiO2PkbcTX2iaDDO3AYjmNtczhf/cxBDdxPnjDIWxMle8Hu/gm92CYzhfQYm1OowtzOTMDJQmoerci/NiYV0TD44WEBUHJHsSVkPUZ78HN/zUuf3ODTR9X5txzvpgsosyF1EL8nnfRduOqAJ4sYHr5dXd0NdWgefuze+KoT/EQuaY0N0F2UcoOrhyXKvm32ZIUNjxDhfAuFXCbJU2FavkmBL/jVcklpY1sAn8F0H1UAV4dvr4MhjdIK5H2SClnGblR/oJmKtsfFXcytBB7KJhj4XVW6M5JykWoxw3QKW/eSlBvxJZvUSLSx3up0mYW+7OjIP8CRziT/49wTt+C2KrYV5XiAm3mNpioxcGUZ7FsVQ88A/GVsmzJYU5S1A+IshWULREzTohmd6bTMjwTUVOZyfO4FuQspSh+8kMPiEcdGtnBnV/KeNJWouVArgNhRUbd/I8FQWmH3xBfzVLZQI9ADw4KaOS8Rptk7J3F43xA5OzBX
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(136003)(346002)(396003)(230922051799003)(230173577357003)(230273577357003)(186009)(64100799003)(82310400011)(451199024)(1800799012)(46966006)(36840700001)(40470700004)(40480700001)(1076003)(426003)(2616005)(336012)(26005)(40460700003)(356005)(82740400003)(81166007)(47076005)(36756003)(86362001)(5660300002)(36860700001)(8936002)(83380400001)(4326008)(70206006)(316002)(110136005)(6636002)(2876002)(8676002)(70586007)(2906002)(41300700001)(478600001)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 20:33:07.0177
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a378d2f0-30fd-4c90-fcf1-08dc00088b0e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8975

From: Michal Orzel <michal.orzel@amd.com>

Currently if user enables HVC_DCC config option in Linux, it invokes
access to debug data transfer registers (ie MDCCSR_EL0 on arm64,
DBGDTRTXINT on arm32). As these registers are not emulated, Xen injects
an undefined exception to the guest. And Linux crashes.

We wish to avoid this crash by adding a "partial" emulation. DBGDTR_EL0
is emulated as TXfull.
Refer ARM DDI 0487I.a ID081822, D17.3.8, DBGDTRTX_EL0
"If TXfull is set to 1, set DTRRX and DTRTX to UNKNOWN"

Thus, any OS is expected to read DBGDTR_EL0 and check for TXfull
before using DBGDTRTX_EL0. Linux does it via hvc_dcc_init() --->
hvc_dcc_check() , it returns -ENODEV. In this way, we are preventing
the guest to be aborted.

We also emulate DBGDTRTX_EL0 as RAZ/WI.

We have added emulation for AArch32 variant of these registers as well.

Also in the case of AArch32, DBGOSLSR is emulated in the same way as
its AArch64 variant (ie OSLSR_EL1). This is to ensure that
DBGOSLSR.OSLK is 0, thus MDSCR_EL1.TXfull is treated as UNK/SBZP.
Thus only MDCCSR_EL0 can be emulated (which is DBGDTRTXINT on arm32).
So, DBGDTR[TR]XINT is emulated as RAZ/WI.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from 

v1 :- 1. DBGDTR_EL0 does not emulate RXfull. This is to avoid giving the OS any
indication that the RX buffer is full and is waiting to be read.

2. In Arm32, DBGOSLSR is emulated. Also DBGDTRTXINT is emulated at EL0 only.

3. Fixed the commit message and inline code comments.

 xen/arch/arm/arm64/vsysreg.c         | 26 +++++++++++++++----
 xen/arch/arm/include/asm/arm64/hsr.h |  3 +++
 xen/arch/arm/include/asm/cpregs.h    |  2 ++
 xen/arch/arm/include/asm/traps.h     |  4 +++
 xen/arch/arm/traps.c                 | 18 +++++++++++++
 xen/arch/arm/vcpreg.c                | 38 +++++++++++++++++++++++-----
 6 files changed, 79 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
index b5d54c569b..ebeb83dd65 100644
--- a/xen/arch/arm/arm64/vsysreg.c
+++ b/xen/arch/arm/arm64/vsysreg.c
@@ -159,9 +159,6 @@ void do_sysreg(struct cpu_user_regs *regs,
      *
      * Unhandled:
      *    MDCCINT_EL1
-     *    DBGDTR_EL0
-     *    DBGDTRRX_EL0
-     *    DBGDTRTX_EL0
      *    OSDTRRX_EL1
      *    OSDTRTX_EL1
      *    OSECCR_EL1
@@ -172,11 +169,29 @@ void do_sysreg(struct cpu_user_regs *regs,
     case HSR_SYSREG_MDSCR_EL1:
         return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
     case HSR_SYSREG_MDCCSR_EL0:
+    {
         /*
+         * Xen doesn't expose a real (or emulated) Debug Communications Channel
+         * (DCC) to a domain. Yet the Arm ARM implies this is not an optional
+         * feature. So some domains may start to probe it. For instance, the
+         * HVC_DCC driver in Linux (since f377775dc083 and at least up to v6.7),
+         * will try to write some characters and check if the transmit buffer
+         * has emptied. By setting TX status bit to indicate the transmit buffer
+         * is full. This we would hint the OS that the DCC is probably not
+         * working.
+         *
+         * Bit 29: TX full
+         *
          * Accessible at EL0 only if MDSCR_EL1.TDCC is set to 0. We emulate that
          * register as RAZ/WI above. So RO at both EL0 and EL1.
          */
-        return handle_ro_raz(regs, regidx, hsr.sysreg.read, hsr, 0);
+        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 0,
+                                  1U << 29);
+    }
+    case HSR_SYSREG_DBGDTR_EL0:
+    /* DBGDTR[TR]X_EL0 share the same encoding */
+    case HSR_SYSREG_DBGDTRTX_EL0:
+        return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 0);
     HSR_SYSREG_DBG_CASES(DBGBVR):
     HSR_SYSREG_DBG_CASES(DBGBCR):
     HSR_SYSREG_DBG_CASES(DBGWVR):
@@ -393,7 +408,8 @@ void do_sysreg(struct cpu_user_regs *regs,
      *
      * And all other unknown registers.
      */
-    default:
+    default: goto fail;
+    fail:
         {
             const struct hsr_sysreg sysreg = hsr.sysreg;
 
diff --git a/xen/arch/arm/include/asm/arm64/hsr.h b/xen/arch/arm/include/asm/arm64/hsr.h
index e691d41c17..1495ccddea 100644
--- a/xen/arch/arm/include/asm/arm64/hsr.h
+++ b/xen/arch/arm/include/asm/arm64/hsr.h
@@ -47,6 +47,9 @@
 #define HSR_SYSREG_OSDLR_EL1      HSR_SYSREG(2,0,c1,c3,4)
 #define HSR_SYSREG_DBGPRCR_EL1    HSR_SYSREG(2,0,c1,c4,4)
 #define HSR_SYSREG_MDCCSR_EL0     HSR_SYSREG(2,3,c0,c1,0)
+#define HSR_SYSREG_DBGDTR_EL0     HSR_SYSREG(2,3,c0,c4,0)
+#define HSR_SYSREG_DBGDTRTX_EL0   HSR_SYSREG(2,3,c0,c5,0)
+#define HSR_SYSREG_DBGDTRRX_EL0   HSR_SYSREG(2,3,c0,c5,0)
 
 #define HSR_SYSREG_DBGBVRn_EL1(n) HSR_SYSREG(2,0,c0,c##n,4)
 #define HSR_SYSREG_DBGBCRn_EL1(n) HSR_SYSREG(2,0,c0,c##n,5)
diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
index 6b083de204..aec9e8f329 100644
--- a/xen/arch/arm/include/asm/cpregs.h
+++ b/xen/arch/arm/include/asm/cpregs.h
@@ -75,6 +75,8 @@
 #define DBGDIDR         p14,0,c0,c0,0   /* Debug ID Register */
 #define DBGDSCRINT      p14,0,c0,c1,0   /* Debug Status and Control Internal */
 #define DBGDSCREXT      p14,0,c0,c2,2   /* Debug Status and Control External */
+#define DBGDTRRXINT     p14,0,c0,c5,0   /* Debug Data Transfer Register, Receive */
+#define DBGDTRTXINT     p14,0,c0,c5,0   /* Debug Data Transfer Register, Transmit */
 #define DBGVCR          p14,0,c0,c7,0   /* Vector Catch */
 #define DBGBVR0         p14,0,c0,c0,4   /* Breakpoint Value 0 */
 #define DBGBCR0         p14,0,c0,c0,5   /* Breakpoint Control 0 */
diff --git a/xen/arch/arm/include/asm/traps.h b/xen/arch/arm/include/asm/traps.h
index 883dae368e..a2692722d5 100644
--- a/xen/arch/arm/include/asm/traps.h
+++ b/xen/arch/arm/include/asm/traps.h
@@ -56,6 +56,10 @@ void handle_ro_raz(struct cpu_user_regs *regs, int regidx, bool read,
 void handle_ro_read_val(struct cpu_user_regs *regs, int regidx, bool read,
                         const union hsr hsr, int min_el, register_t val);
 
+/* Read only as value provided with 'val' argument, write ignore */
+void handle_read_val_wi(struct cpu_user_regs *regs, int regidx,
+                        const union hsr hsr, int min_el, register_t val);
+
 /* Co-processor registers emulation (see arch/arm/vcpreg.c). */
 void do_cp15_32(struct cpu_user_regs *regs, const union hsr hsr);
 void do_cp15_64(struct cpu_user_regs *regs, const union hsr hsr);
diff --git a/xen/arch/arm/traps.c b/xen/arch/arm/traps.c
index 3784e8276e..f5ab555b19 100644
--- a/xen/arch/arm/traps.c
+++ b/xen/arch/arm/traps.c
@@ -1676,6 +1676,24 @@ void handle_ro_read_val(struct cpu_user_regs *regs,
     advance_pc(regs, hsr);
 }
 
+/* Read as value provided with 'val' argument of this function, write ignore */
+void handle_read_val_wi(struct cpu_user_regs *regs,
+                        int regidx,
+                        const union hsr hsr,
+                        int min_el,
+                        register_t val)
+{
+    ASSERT((min_el == 0) || (min_el == 1));
+
+    if ( min_el > 0 && regs_mode_is_user(regs) )
+        return inject_undef_exception(regs, hsr);
+
+    set_user_reg(regs, regidx, val);
+
+    advance_pc(regs, hsr);
+}
+
+
 /* Read only as read as zero */
 void handle_ro_raz(struct cpu_user_regs *regs,
                    int regidx,
diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
index 39aeda9dab..5087125111 100644
--- a/xen/arch/arm/vcpreg.c
+++ b/xen/arch/arm/vcpreg.c
@@ -549,18 +549,41 @@ void do_cp14_32(struct cpu_user_regs *regs, const union hsr hsr)
     }
 
     case HSR_CPREG32(DBGDSCRINT):
+    {
         /*
-         * Read-only register. Accessible by EL0 if DBGDSCRext.UDCCdis
-         * is set to 0, which we emulated below.
+         * Xen doesn't expose a real (or emulated) Debug Communications Channel
+         * (DCC) to a domain. Yet the Arm ARM implies this is not an optional
+         * feature. So some domains may start to probe it. For instance, the
+         * HVC_DCC driver in Linux (since f377775dc083 and at least up to v6.7),
+         * will try to write some characters and check if the transmit buffer
+         * has emptied. By setting TX status bit to indicate the transmit buffer
+         * is full. This we would hint the OS that the DCC is probably not
+         * working.
+         *
+         * Bit 29: TX full
+         *
+         * Accessible by EL0 if DBGDSCRext.UDCCdis is set to 0, which we emulate
+         * as RAZ/WI in the next case.
          */
-        return handle_ro_raz(regs, regidx, cp32.read, hsr, 1);
+
+        return handle_ro_read_val(regs, regidx, cp32.read, hsr, 0, 1 << 29);
+    }
 
     case HSR_CPREG32(DBGDSCREXT):
+        return handle_raz_wi(regs, regidx, cp32.read, hsr, 1);
+
+    case HSR_CPREG32(DBGOSLSR):
+         return handle_ro_read_val(regs, regidx, cp32.read, hsr, 1, 1 << 3);
+
+    case HSR_CPREG32(DBGDTRTXINT):
+    {
         /*
-         * Implement debug status and control register as RAZ/WI.
-         * The OS won't use Hardware debug if MDBGen not set.
+         * As DBGDSCRINT is emulated which is architecturally mapped to AArch64
+         * register MDCCSR_EL0. MDSCR_EL1 is not emulated. So DBGDTR[TR]XINT can
+         * only be accessed as EL0 level.
          */
-        return handle_raz_wi(regs, regidx, cp32.read, hsr, 1);
+        return handle_raz_wi(regs, regidx, cp32.read, hsr, 0);
+    }
 
     case HSR_CPREG32(DBGVCR):
     case HSR_CPREG32(DBGBVR0):
@@ -590,7 +613,8 @@ void do_cp14_32(struct cpu_user_regs *regs, const union hsr hsr)
      *
      * And all other unknown registers.
      */
-    default:
+    default: goto fail;
+    fail:
         gdprintk(XENLOG_ERR,
                  "%s p14, %d, r%d, cr%d, cr%d, %d @ 0x%"PRIregister"\n",
                   cp32.read ? "mrc" : "mcr",
-- 
2.25.1


