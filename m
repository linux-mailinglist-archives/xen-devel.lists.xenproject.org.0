Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0341F85BBCA
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 13:19:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683475.1063022 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcP5k-0001qi-7f; Tue, 20 Feb 2024 12:19:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683475.1063022; Tue, 20 Feb 2024 12:19:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcP5k-0001my-4C; Tue, 20 Feb 2024 12:19:20 +0000
Received: by outflank-mailman (input) for mailman id 683475;
 Tue, 20 Feb 2024 12:19:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J7zC=J5=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1rcP5i-0001mj-Vm
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 12:19:18 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 43c8ef3f-cfea-11ee-8a52-1f161083a0e0;
 Tue, 20 Feb 2024 13:19:17 +0100 (CET)
Received: from DS7PR05CA0022.namprd05.prod.outlook.com (2603:10b6:5:3b9::27)
 by BL0PR12MB4916.namprd12.prod.outlook.com (2603:10b6:208:1ce::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.20; Tue, 20 Feb
 2024 12:19:13 +0000
Received: from CY4PEPF0000EDD5.namprd03.prod.outlook.com
 (2603:10b6:5:3b9:cafe::d1) by DS7PR05CA0022.outlook.office365.com
 (2603:10b6:5:3b9::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.15 via Frontend
 Transport; Tue, 20 Feb 2024 12:19:13 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD5.mail.protection.outlook.com (10.167.241.209) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 20 Feb 2024 12:19:13 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 20 Feb
 2024 06:19:12 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 20 Feb
 2024 06:19:12 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via
 Frontend Transport; Tue, 20 Feb 2024 06:19:11 -0600
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
X-Inumbo-ID: 43c8ef3f-cfea-11ee-8a52-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f0lV63jXy2bt9vgQdON2yGMcaTkCgTFgDhzL+NRNgozQvyh/vsnhHr57xwc1AdvE09XilBHieknXYSTj+FAZpHfdcWPerWlN3LeQGeK4bNd++GeJwQ4eAm78ZWlCukguqmWY0Y+rNgWJA37iFkdQ8EpWseYm0ilwmnOBZiDU8KJZpPOHZMpH59Qq36B3HRzBo9wnLCijG+UgA/lT7MVgqejK00yHcfANKRDSw0P9343UHWvWq+ZVwMrGo0laJMa9vd5UjlYWyA32QV8+AcTSSYEHTAKQ5ldAaLDC0geA3NPU9KTUxMFPKEAkHg7hOIifJ0ta1LxInR1ElODo00X3wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TyheUcKZClDVXN1YlPjAzeLmxnokNyXGDiz7llZyvHQ=;
 b=aUVSLx/hw8NBtHcbgMvjHzeO0ev8HOs9mDverkKEjxz58La/G95x2IbT4v6d30q7tmO/z11WcRxRUPdJtxAjpMxVKCjPlUCpI68pMvNeG0WPrHD6uVmxTcZ3sHgOfQIkwk3H436gasMEalpJvK6JyLgihW+CLm2XXqGyl3mJgTsGouuWJDXdHTW3Y8qWZiuehdZWd9tiYq2/WT+Ike1wKpZtCv2SweAXAHx/6SlyLicZpHwG5jhJYHv/wFywlOR8KH32z1SM8HYV35HWsSGJHClAFpMUbdCYwkmuLKEs1htTDBjEsYTsTEWt0bEdF6ZxbU3RfInB8o/RAK6jR9rcgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TyheUcKZClDVXN1YlPjAzeLmxnokNyXGDiz7llZyvHQ=;
 b=ALLVrMhhNMJfoDkrNLePd/ehOGV6H5/hD46zPfrUDkpfAfHpwlUbir2BD63eQNXZmMPo8CzIas9dvK1Y0aeliYIMQpcN/LMo7EN6azns1f5T8JFtVHnlJkV8wS6hPq69uJX064+CMFxPwbqa832lZnzSa1yUVzzQmRDwF8ChRlM=
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
Subject: [XEN v5 2/3] xen/arm: arm64: Add emulation of Debug Data Transfer Registers
Date: Tue, 20 Feb 2024 12:17:42 +0000
Message-ID: <20240220121743.3680715-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240220121743.3680715-1-ayan.kumar.halder@amd.com>
References: <20240220121743.3680715-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD5:EE_|BL0PR12MB4916:EE_
X-MS-Office365-Filtering-Correlation-Id: c4deb2e0-a812-42fc-e205-08dc320e266b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fgErVotxVtLU/1F9k57JNye2xARh6V9xIOKCdK0h76Uy5Rk5ZlogZ9O46ecKNY+xhC2OmLA6kEavoytjnGonYjnPA4Qh8fxfpEs/g+VGCTKxkppcrkCn57NGECnX9qPVEHL4Q5jeBLYE5y5alCozw7hccMsssk7rrLYqA7br4N0o7dlLwpU4Z7JxMeHOk92RyW0ev/3T9zn1ZRReZV/2uV1/6trR1aWpjNlWewgzI48tmCcmgDPxHpnyrvkv6n2ElrB0Q4yzyecoMtbBZkA7+2wrxj9FPshhuV8gwjDWOcHcQEmvIJ7TauPF0yPCHy0BWS2S7Ax6NdHTMgPI616ZWQrpoLAeEE4bdFUITVncMh+UOM7kR3bUWfVk6+LEbC17G/Up78/duzw1gyv31ksX27Mp6dnwzMjeObQYdiMA2Hg0b6ybHcf4DpVTZOwf/T+cV7CtwEZ1X/AbcpuGOsJyvO5PNNCbFp0uHs3/TYeEfXRYlffByJvIzadE80RDSiuRt5O0XQdYd+LR/xsBal1nVLdYpbtWII9MMbfF5+0keQqQKxbTIn07f+E7uxMv6UDK4lHEcfXSYxBpSz6Fb5gi8Hru93+/c1Bxy7ktA6zCtp/CakzbNi9vXlHoMfO4PXf/Ia/2jfrrA9F6cybK8qDUG4m1RZ/znZZlY/SuqcB9hfM=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(40470700004)(46966006);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 12:19:13.4209
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c4deb2e0-a812-42fc-e205-08dc320e266b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4916

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
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
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

 xen/arch/arm/arm64/vsysreg.c         | 68 +++++++++++++++++++---------
 xen/arch/arm/include/asm/arm64/hsr.h |  3 ++
 2 files changed, 50 insertions(+), 21 deletions(-)

diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
index b5d54c569b..80918bc799 100644
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
@@ -394,26 +422,24 @@ void do_sysreg(struct cpu_user_regs *regs,
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
+
+    gdprintk(XENLOG_ERR,
+             "%s %d, %d, c%d, c%d, %d %s x%d @ 0x%"PRIregister"\n",
+             sysreg.read ? "mrs" : "msr", sysreg.op0, sysreg.op1, sysreg.crn,
+             sysreg.crm, sysreg.op2, sysreg.read ? "=>" : "<=", sysreg.reg,
+             regs->pc);
+    gdprintk(XENLOG_ERR,
+             "unhandled 64-bit sysreg access %#"PRIregister"\n",
+             hsr.bits & HSR_SYSREG_REGS_MASK);
+    inject_undef_exception(regs, hsr);
+    return;
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


