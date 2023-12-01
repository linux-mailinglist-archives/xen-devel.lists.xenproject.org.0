Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA91801323
	for <lists+xen-devel@lfdr.de>; Fri,  1 Dec 2023 19:50:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645657.1007889 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r98as-0001Eu-It; Fri, 01 Dec 2023 18:50:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645657.1007889; Fri, 01 Dec 2023 18:50:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r98as-0001Cl-Ex; Fri, 01 Dec 2023 18:50:30 +0000
Received: by outflank-mailman (input) for mailman id 645657;
 Fri, 01 Dec 2023 18:50:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=op0Z=HM=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1r98aq-0000AU-FI
 for xen-devel@lists.xenproject.org; Fri, 01 Dec 2023 18:50:28 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20609.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7d96862f-907a-11ee-98e5-6d05b1d4d9a1;
 Fri, 01 Dec 2023 19:50:27 +0100 (CET)
Received: from DS7PR07CA0020.namprd07.prod.outlook.com (2603:10b6:5:3af::12)
 by DS0PR12MB6656.namprd12.prod.outlook.com (2603:10b6:8:d2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.24; Fri, 1 Dec
 2023 18:50:21 +0000
Received: from DS1PEPF0001709C.namprd05.prod.outlook.com
 (2603:10b6:5:3af:cafe::55) by DS7PR07CA0020.outlook.office365.com
 (2603:10b6:5:3af::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.27 via Frontend
 Transport; Fri, 1 Dec 2023 18:50:21 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0001709C.mail.protection.outlook.com (10.167.18.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7046.17 via Frontend Transport; Fri, 1 Dec 2023 18:50:21 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 1 Dec
 2023 12:50:19 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via
 Frontend Transport; Fri, 1 Dec 2023 12:50:18 -0600
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
X-Inumbo-ID: 7d96862f-907a-11ee-98e5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JXPPkIuWluu9xN6j+dB7XX9oxFbfTZiJg7E0G/qjXoe4/VR271cYGo6pkC3uz/NQAphR6RpFUiqMJhwBd8qp7tSuKTJI75qHzIsio7dxt/MZsxUy0OhMcXEmKoZp1AnUV+XewiH56isckMVAFonPv1WTzmeKucFvjlBFaPKn2SpGz6o6/4TbPvisfb1y/eMBpAPDBsy9teSRwcvwMjbsNXvGo4YqkDK2B8JLZRTYut8jnGKHS34SSd7VaN1duwEOj4cXqZvcJInEfS9sqeZOGTg+OdccFAwqQagPQIcqUsiPMDt5Rbx108b5AYkVwrF0SNTSabZqcx/FIMjSEpKC1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z7C62dUwoR2D2M+t/xzfZcDZ+8Repmw7lnwnu1cSrI4=;
 b=iU26P+MGKkHcogGtDXBMfTC6KdiO5uHvjKJOFOpJ5aNdaW5l+g/1vpygM6RJUInb35WGbqkvcHWG6cmoUuGGNq8I18It9OuIkipkhuCLQHkln93Ve5CySDX7iAGEQ/Sjmh2KhOKRlVThCQ8TiJUFYZTa6h5bhvNq9TX+FUvvtyZm1rxympYdjDy3vo55IhqbQYA3cS+Ae7N6xLEX+FHJaEdRfJ/iIhamby3A5FaUEOzQ2SO/VJLQ6U3r6b1tVtBbD1IYoEWhCooaBC9blRK0nqjFZUno/KgG+ynEEJzVTwE7Z+A6FyjLhs7mzpxPLxr24Pa0AajvHJP6nvzhaXApkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z7C62dUwoR2D2M+t/xzfZcDZ+8Repmw7lnwnu1cSrI4=;
 b=nnSGz0w2tmOg5Qo/AiBd96HOyZVeccCzyuoF1Rj9nfqIbXQZ6KTRiR72MjyVxBcKu4AK+5mGNGBGLiVu/kuOuLZOR14WBJgFZGEajVD5Slv6avBMRaOuR2wp2UG2+21RB+NcxqCuHDSoSFoy60HazS2XKCQHW59gcjsdEOuqBRw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<bertrand.marquis@arm.com>, <michal.orzel@amd.com>,
	<Volodymyr_Babchuk@epam.com>
CC: <xen-devel@lists.xenproject.org>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [RFC PATCH] xen/arm: Add emulation of Debug Data Transfer Registers
Date: Fri, 1 Dec 2023 18:50:09 +0000
Message-ID: <20231201185009.1719183-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709C:EE_|DS0PR12MB6656:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ed39ec6-87ff-4dbc-9b87-08dbf29e5ef5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wuaWRe7rpiAukKhSBF/idFLa3g2Bf/wO2IYkg5TwVJmaakS4tXVlLps2a/aFIHALfVgLWt38B9rRaHLoaZHub8NrpyacAlxB6LJaevoEkt9xB+ERV2/Tl5TiiviNc0IYF/BJFv4czGXls8GI4KoDv0jayS4B2T1P/A8ZyVPDRzIp/qDet+2nUM+552aEgLGh8GxslY8CmkvMcAl+Ci22sOeRZzCvPiOSUQKJ9nyGp0BvPL6SMD994JEAm4arm6AOFAuJ49fcjXgQ+25C4OxW14Ydpwkk7V6dKv89bTIfmeSy9WutW1Grcende1m38/KUb5L4LAfZ7ggXHy43FSjwjWpMS87CN+bi5Wxt81XxOnd/+H+4PlDEfhrZy2dTpMbcnhS+Fh0qG3mp8++Lk+TYEEGg+g74s4MHgwY11MACFx87dwhD0ZJSZFzGZPbM8nDb7WiNfqMI+AzVco6H9WyalXZKJNFQasAMMkND4ZbxTb4OMwRDz9CAC3yq/r1jJrwPm0P5H0Gad07gMpQC317XaCKQ6pqxgd8MsE9vFGiV6vb93fdbZf6lazgMUMlUc+xMDx9dO3oUelc6qN4d+RJ6TpTweMcN/QI1mmHsfI7abIoYpJlo5MUsnX6pgrfvOOTyaSNV4Wd/5aPdwj9LBrRyODTuESU9uhPCXLwt+t+uCDTJJOOhngx+JEOyBecD9pRVhco5j85Xu+ZZzI9r5tc9KMjhc3s6rf8+debMlTcjSO1XCzOMvw0wJERfGGif+j3m74/0I2pzIGqU+Y8/zdB+W6yW2eNXCVmJTeQfcMUxIQKEh1+kCpJDQvg61YGM4RWVQz/pbGe0LxXSPYl7sdOEBg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(396003)(39860400002)(376002)(230273577357003)(230173577357003)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(82310400011)(46966006)(40470700004)(36840700001)(356005)(40460700003)(70206006)(478600001)(8936002)(4326008)(86362001)(54906003)(8676002)(70586007)(110136005)(316002)(41300700001)(36756003)(2906002)(103116003)(5660300002)(36860700001)(81166007)(47076005)(82740400003)(1076003)(2616005)(336012)(6666004)(426003)(83380400001)(26005)(40480700001)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2023 18:50:21.4184
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ed39ec6-87ff-4dbc-9b87-08dbf29e5ef5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001709C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6656

Currently if user enables HVC_DCC config option in Linux, it invokes
access to debug data transfer registers (ie DBGDTRTX_EL0 on arm64,
DBGDTRTXINT on arm32). As these registers are not emulated, Xen injects
an undefined exception to the guest. And Linux crashes.

We wish to avoid this crash by adding a "partial" emulation. DBGDTR_EL0
is emulated as TXfull | RXfull.
Refer ARM DDI 0487I.a ID081822, D17.3.8, DBGDTRTX_EL0
"If TXfull is set to 1, set DTRRX and DTRTX to UNKNOWN"
Also D17.3.7 DBGDTRRX_EL0,
" If RXfull is set to 1, return the last value written to DTRRX."

Thus, any OS is expected to read DBGDTR_EL0 and check for TXfull
before using DBGDTRTX_EL0. Linux does it via hvc_dcc_init() --->
hvc_dcc_check() , it returns -ENODEV. In this way, we are preventing
the guest to be aborted.

We also emulate DBGDTRTX_EL0 as RAZ/WI.

We have added emulation for AArch32 variant of these registers as well.
Also, we have added handle_read_val_wi() to emulate DBGDSCREXT register
to return a specific value (ie TXfull | RXfull) and ignore any writes
to this register.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 xen/arch/arm/arm64/vsysreg.c         | 21 ++++++++++++++----
 xen/arch/arm/include/asm/arm64/hsr.h |  3 +++
 xen/arch/arm/include/asm/cpregs.h    |  2 ++
 xen/arch/arm/include/asm/traps.h     |  4 ++++
 xen/arch/arm/traps.c                 | 18 +++++++++++++++
 xen/arch/arm/vcpreg.c                | 33 +++++++++++++++++++++-------
 6 files changed, 69 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
index b5d54c569b..5082dfb02e 100644
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
@@ -172,11 +169,27 @@ void do_sysreg(struct cpu_user_regs *regs,
     case HSR_SYSREG_MDSCR_EL1:
         return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
     case HSR_SYSREG_MDCCSR_EL0:
+    {
+        /*
+         * Bit 29: TX full, bit 30: RX full
+         * Given that we emulate DCC registers as RAZ/WI, doing the same for
+         * MDCCSR_EL0 would cause a guest to continue using the DCC despite no
+         * real effect. Setting the TX/RX status bits should result in a probe
+         * fail (based on Linux behavior).
+         */
+        register_t guest_reg_value = (1U << 29) | (1U << 30);
+
         /*
          * Accessible at EL0 only if MDSCR_EL1.TDCC is set to 0. We emulate that
          * register as RAZ/WI above. So RO at both EL0 and EL1.
          */
-        return handle_ro_raz(regs, regidx, hsr.sysreg.read, hsr, 0);
+        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 0,
+                                  guest_reg_value);
+    }
+    case HSR_SYSREG_DBGDTR_EL0:
+    /* DBGDTR[TR]X_EL0 share the same encoding */
+    case HSR_SYSREG_DBGDTRTX_EL0:
+        return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 0);
     HSR_SYSREG_DBG_CASES(DBGBVR):
     HSR_SYSREG_DBG_CASES(DBGBCR):
     HSR_SYSREG_DBG_CASES(DBGWVR):
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
index 39aeda9dab..3f1276f96e 100644
--- a/xen/arch/arm/vcpreg.c
+++ b/xen/arch/arm/vcpreg.c
@@ -548,20 +548,37 @@ void do_cp14_32(struct cpu_user_regs *regs, const union hsr hsr)
         break;
     }
 
-    case HSR_CPREG32(DBGDSCRINT):
+    case HSR_CPREG32(DBGDSCREXT):
+    {
         /*
-         * Read-only register. Accessible by EL0 if DBGDSCRext.UDCCdis
-         * is set to 0, which we emulated below.
+         * Bit 29: TX full, bit 30: RX full
+         * Given that we emulate DCC registers as RAZ/WI, doing the same for
+         * DBGDSCRint would cause a guest to continue using the DCC despite no
+         * real effect. Setting the TX/RX status bits should result in a probe
+         * fail (based on Linux behavior).
          */
-        return handle_ro_raz(regs, regidx, cp32.read, hsr, 1);
+        register_t guest_reg_value = (1U << 29) | (1U << 30);
 
-    case HSR_CPREG32(DBGDSCREXT):
+        return handle_read_val_wi(regs, regidx, hsr, 1,
+                                  guest_reg_value);
+    }
+
+    case HSR_CPREG32(DBGDSCRINT):
+    {
         /*
-         * Implement debug status and control register as RAZ/WI.
-         * The OS won't use Hardware debug if MDBGen not set.
+         * Bit 29: TX full, bit 30: RX full
+         * Given that we emulate DCC registers as RAZ/WI, doing the same for
+         * DBGDSCRint would cause a guest to continue using the DCC despite no
+         * real effect. Setting the TX/RX status bits should result in a probe
+         * fail (based on Linux behavior).
          */
-        return handle_raz_wi(regs, regidx, cp32.read, hsr, 1);
+        register_t guest_reg_value = (1U << 29) | (1U << 30);
+
+        return handle_ro_read_val(regs, regidx, cp32.read, hsr, 1,
+                                  guest_reg_value);
+    }
 
+    case HSR_CPREG32(DBGDTRTXINT):
     case HSR_CPREG32(DBGVCR):
     case HSR_CPREG32(DBGBVR0):
     case HSR_CPREG32(DBGBCR0):
-- 
2.25.1


