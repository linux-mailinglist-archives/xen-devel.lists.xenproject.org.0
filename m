Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD78874F4B
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 13:41:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689876.1075296 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riD3A-0006Z9-07; Thu, 07 Mar 2024 12:40:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689876.1075296; Thu, 07 Mar 2024 12:40:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riD39-0006Vy-Sn; Thu, 07 Mar 2024 12:40:39 +0000
Received: by outflank-mailman (input) for mailman id 689876;
 Thu, 07 Mar 2024 12:40:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D3qa=KN=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1riD38-00060p-Uw
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 12:40:38 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2418::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e54450b4-dc7f-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 13:40:37 +0100 (CET)
Received: from MW2PR16CA0066.namprd16.prod.outlook.com (2603:10b6:907:1::43)
 by PH7PR12MB9104.namprd12.prod.outlook.com (2603:10b6:510:2f3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Thu, 7 Mar
 2024 12:40:33 +0000
Received: from CO1PEPF000042A8.namprd03.prod.outlook.com
 (2603:10b6:907:1:cafe::49) by MW2PR16CA0066.outlook.office365.com
 (2603:10b6:907:1::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26 via Frontend
 Transport; Thu, 7 Mar 2024 12:40:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042A8.mail.protection.outlook.com (10.167.243.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Thu, 7 Mar 2024 12:40:32 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 7 Mar
 2024 06:40:31 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 7 Mar
 2024 06:40:31 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via
 Frontend Transport; Thu, 7 Mar 2024 06:40:30 -0600
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
X-Inumbo-ID: e54450b4-dc7f-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADEsEXqDv97laYcPccBjgvytDiQ7J6hxu6acZpQlc30abBFTvXcH0MD9DBT/JufTtqvujVYTaZdsXRPAaV9v1sNPeba0qXBLACoqYOZ5dxoUAQEy5x/L9PzPAH5D3EwS1a0eToVEdrbtaWnHyVY9IWszbBipc3sjs14NCufIiEpWRPFSQcBQF7TmOLOyzF8U5MfrTCZnyhHgWDwIdWsp1VlqupgdGuniQ63lwpTNYci1LHcKlH8N8DpjIvsa5ghZakWwrQbBSVVbZi17nZqChInMpNGy1gi2AhbMzgBkV0NVJX3xwUl1VSDa5yVy8ym2THEnIi+A0wIhaVqWqHzgKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WA09ySjvIBLO6YzmcvJCT2DSUP4qszeYzbwIgvcjmgo=;
 b=dWWt/OQDrpxXpc3I8+3dh4Zbu1ykD61CpE6f54nmTOQH5rY6StWtdiwglLcyC4jysBTrMMDTN7RS6gOPgOdpBRuAb8YKsyh1LA1Zhbcgo0WwLcT3bmB+kBWKFrn/A+GojdVNEl0/g7cNLuGgBiaQ8OTGoMBrfIMXPpr/nqz89xUKCrdswfFHrGHSdkAaBpxnGGR9Ey7WwqNxCX3CJ30yPLbqjHMHU/FurH+qJHgRTVN+x6YKL3uYp/9SVhaYCLxIpU4J16B5ZnKeTxb0BS/Qfu2mzoWtzfL2QLSw+enIw+KOmdhYShzpMaRSx35+OMnkaL4kCjlZCxiZOBXWC4RwEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WA09ySjvIBLO6YzmcvJCT2DSUP4qszeYzbwIgvcjmgo=;
 b=U7ElEWWhOTreyUpZ1SEopPHCKqKwFpog543aYqem8H3QI05kJ2k+fgxXpJF3niDn/xVwi4ilkxkGj2FjhiaBTGFnd8dMv5zDu7HadZxnZOyaslczDDN491TzQ7b6qh+dZC7SMCjAj4SRfkmQJzd4oB5GwbMvU4Ojt5WrTsErWMk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [XEN v6 2/3] xen/arm: arm64: Add emulation of Debug Data Transfer Registers
Date: Thu, 7 Mar 2024 12:39:42 +0000
Message-ID: <20240307123943.1991755-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240307123943.1991755-1-ayan.kumar.halder@amd.com>
References: <20240307123943.1991755-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A8:EE_|PH7PR12MB9104:EE_
X-MS-Office365-Filtering-Correlation-Id: 77b989ad-e3b1-4ad5-2e4e-08dc3ea3c785
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HrSmHpLnOl/0Yr5QPRBQkGykp7CFCTk/GuxNmWxoZxBik91Hvj/lpod08yF1DugowsLV8d+DwW2J9kb0RJhNUSufZtKoJ8Fk9WNl5O3b59Ci77YasLh8QYNNLBNr+u0IOsJOaYoyXfyYpqZLbSXdJ0yiu9aBIzK3Fz1Trr49xHfCqtS9Ug91MfxVGMu+Nj39l3ulbNo0Ok21/1vJwlsFWA9QWUUu5WDgBqbNRPIfGoD85ykGQ31AU6SVvEupl9ShyD5sTUWEa9+4CUvptbCmmtTIVoKKwPBc6TVhNrDHwbNeNXLShAjdnxhWe3T8Ex99mpwiQmgOe+5jlHe+/ZoVllrnzrSw47DBLtlAC53n1LY0fwDu4kWMJssOkYEEJT69fBvruiOMpHWGmfy45d6wzLScouqoBMx1fVAPy84aUA1/yotxNNzfQEp99FPf7sRMcvXEuWpAN5wgKFyg6EeOKoJvqlr9nEqYKkCzTeIqeItkyDXUk5YO4kPy031rzcqvd8vL+45E8C25EhyIzh3bKwEjAP+EQn9YBdiBTrOvqWdWpkSXB8kRC1dpdruVE0P42hLBHEvfD2nud1ZsjzreuAMnr+lYdtCPKjK19Q2UtNI40GbZPoyL9JgtDhQDiRLFuksxtkVslHseKBURQ8dE0TWwKVSHtpvnd5kSUTam/1YqcTnVbg8dWTWm8fLFfP63XQTkgG9MjpWn5P5PLctJHhu6FfrbZ1d12ITICXjocbV3A21LmaEm8V5n+hU9C/vz
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 12:40:32.6190
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77b989ad-e3b1-4ad5-2e4e-08dc3ea3c785
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9104

From: Michal Orzel <michal.orzel@amd.com>

Currently, if user enables HVC_DCC config option in Linux, it invokes access
to debug data transfer registers (i.e. DBGDTRTX_EL0 on arm64, DBGDTRTXINT on
arm32). As these registers are not emulated, Xen injects an undefined
exception to the guest and Linux crashes.

To prevent this crash, introduce a partial emulation of DBGDTR[TR]X_EL0
(these registers share the same encoding) as RAZ/WI and MDCCSR_EL0 as TXfull.

Refer ARM DDI 0487J.a ID042523, D19.3.8, DBGDTRTX_EL0
"If TXfull is set to 1, set DTRRX and DTRTX to UNKNOWN".

Thus, any OS is expected to read MDCCSR_EL0 and check for TXfull before
using DBGDTRTX_EL0. Linux does it via hvc_dcc_init() ---> hvc_dcc_check(),
and returns -ENODEV in case TXfull bit is still set after writing a test
character. This way we prevent the guest from making use of HVC DCC as a
console.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from

v1 :- 1. DBGDTR_EL0 does not emulate RXfull. This is to avoid giving the OS any
indication that the RX buffer is full and is waiting to be read.

2. In Arm32, DBGOSLSR is emulated. Also DBGDTRTXINT is emulated at EL0 only.

3. Fixed the commit message and inline code comments.

v2 :- 1. Split the patch into two (separate patches for arm64 and arm32).
2. Removed the "fail" label.
3. Fixed the commit message.

v3 :- 1. "HSR_SYSREG_MDCCSR_EL0" emulation differs based on whether 
partial_emulation_enabled is true or not.

2. If partial_emulation_enabled is false, then access to HSR_SYSREG_DBGDTR_EL0,
HSR_SYSREG_DBGDTRTX_EL0 would lead to undefined exception. 

v4 :- 1. Invoked "goto fail" from "default:" to ensure compliance with
MISRA 15.3.

v5 :- 1. Fixed style issues.
2. Removed R-b.
3. Removed HSR_SYSREG_ prefixes from registers.

 SUPPORT.md                           |  5 ++
 xen/arch/arm/arm64/vsysreg.c         | 69 +++++++++++++++++++---------
 xen/arch/arm/include/asm/arm64/hsr.h |  3 ++
 3 files changed, 56 insertions(+), 21 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index b49da114ab..afbd820084 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -111,6 +111,11 @@ that would normally trigger a fault injection.
 
 Only the following system registers are security supported:
 
+    MDCCSR_EL0
+    DBGDTR_EL0
+    DBGDTRTX_EL0
+    DBGDTRRX_EL0
+
 ### ARM Scalable Vector Extension (SVE/SVE2)
 
 Arm64 domains can use Scalable Vector Extension (SVE/SVE2).
diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
index b5d54c569b..c73b2c95ce 100644
--- a/xen/arch/arm/arm64/vsysreg.c
+++ b/xen/arch/arm/arm64/vsysreg.c
@@ -82,6 +82,7 @@ TVM_REG(CONTEXTIDR_EL1)
 void do_sysreg(struct cpu_user_regs *regs,
                const union hsr hsr)
 {
+    const struct hsr_sysreg sysreg = hsr.sysreg;
     int regidx = hsr.sysreg.reg;
     struct vcpu *v = current;
 
@@ -159,9 +160,6 @@ void do_sysreg(struct cpu_user_regs *regs,
      *
      * Unhandled:
      *    MDCCINT_EL1
-     *    DBGDTR_EL0
-     *    DBGDTRRX_EL0
-     *    DBGDTRTX_EL0
      *    OSDTRRX_EL1
      *    OSDTRTX_EL1
      *    OSECCR_EL1
@@ -171,12 +169,42 @@ void do_sysreg(struct cpu_user_regs *regs,
      */
     case HSR_SYSREG_MDSCR_EL1:
         return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
+
+    /*
+     * Xen doesn't expose a real (or emulated) Debug Communications Channel
+     * (DCC) to a domain. Yet the Arm ARM implies this is not an optional
+     * feature. So some domains may start to probe it. For instance, the
+     * HVC_DCC driver in Linux (since f377775dc083 and at least up to v6.7),
+     * will try to write some characters and check if the transmit buffer
+     * has emptied.
+     */
     case HSR_SYSREG_MDCCSR_EL0:
         /*
+         * By setting TX status bit (only if partial emulation is enabled) to
+         * indicate the transmit buffer is full, we would hint the OS that the
+         * DCC is probably not working.
+         *
+         * Bit 29: TX full
+         *
          * Accessible at EL0 only if MDSCR_EL1.TDCC is set to 0. We emulate that
          * register as RAZ/WI above. So RO at both EL0 and EL1.
          */
-        return handle_ro_raz(regs, regidx, hsr.sysreg.read, hsr, 0);
+        return handle_ro_read_val(regs, regidx, hsr.sysreg.read, hsr, 0,
+                                  partial_emulation ? (1U << 29) : 0);
+
+    case HSR_SYSREG_DBGDTR_EL0:
+    /* DBGDTR[TR]X_EL0 share the same encoding */
+    case HSR_SYSREG_DBGDTRTX_EL0:
+        /*
+         * Emulate as RAZ/WI (only if partial emulation is enabled) to prevent
+         * injecting undefined exception.
+         * Accessible at EL0 only if MDSCR_EL1.TDCC is set to 0. We emulate that
+         * register as RAZ/WI.
+         */
+        if ( !partial_emulation )
+            goto fail;
+        return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 0);
+
     HSR_SYSREG_DBG_CASES(DBGBVR):
     HSR_SYSREG_DBG_CASES(DBGBCR):
     HSR_SYSREG_DBG_CASES(DBGWVR):
@@ -394,26 +422,25 @@ void do_sysreg(struct cpu_user_regs *regs,
      * And all other unknown registers.
      */
     default:
-        {
-            const struct hsr_sysreg sysreg = hsr.sysreg;
-
-            gdprintk(XENLOG_ERR,
-                     "%s %d, %d, c%d, c%d, %d %s x%d @ 0x%"PRIregister"\n",
-                     sysreg.read ? "mrs" : "msr",
-                     sysreg.op0, sysreg.op1,
-                     sysreg.crn, sysreg.crm,
-                     sysreg.op2,
-                     sysreg.read ? "=>" : "<=",
-                     sysreg.reg, regs->pc);
-            gdprintk(XENLOG_ERR,
-                     "unhandled 64-bit sysreg access %#"PRIregister"\n",
-                     hsr.bits & HSR_SYSREG_REGS_MASK);
-            inject_undef_exception(regs, hsr);
-            return;
-        }
+        goto fail;
     }
 
     regs->pc += 4;
+    return;
+
+ fail:
+    gdprintk(XENLOG_ERR,
+             "%s %d, %d, c%d, c%d, %d %s x%d @ 0x%"PRIregister"\n",
+             sysreg.read ? "mrs" : "msr",
+             sysreg.op0, sysreg.op1,
+             sysreg.crn, sysreg.crm,
+             sysreg.op2,
+             sysreg.read ? "=>" : "<=",
+             sysreg.reg, regs->pc);
+    gdprintk(XENLOG_ERR,
+             "unhandled 64-bit sysreg access %#"PRIregister"\n",
+             hsr.bits & HSR_SYSREG_REGS_MASK);
+    inject_undef_exception(regs, hsr);
 }
 
 /*
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
-- 
2.25.1


