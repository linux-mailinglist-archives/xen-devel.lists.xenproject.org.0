Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C5485BBCB
	for <lists+xen-devel@lfdr.de>; Tue, 20 Feb 2024 13:19:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683476.1063031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcP5o-00029Y-Hr; Tue, 20 Feb 2024 12:19:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683476.1063031; Tue, 20 Feb 2024 12:19:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcP5o-00027L-Eo; Tue, 20 Feb 2024 12:19:24 +0000
Received: by outflank-mailman (input) for mailman id 683476;
 Tue, 20 Feb 2024 12:19:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J7zC=J5=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1rcP5m-0001mj-Nr
 for xen-devel@lists.xenproject.org; Tue, 20 Feb 2024 12:19:22 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 468c6110-cfea-11ee-8a52-1f161083a0e0;
 Tue, 20 Feb 2024 13:19:22 +0100 (CET)
Received: from CYZPR11CA0024.namprd11.prod.outlook.com (2603:10b6:930:8d::9)
 by CYYPR12MB8961.namprd12.prod.outlook.com (2603:10b6:930:bf::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.20; Tue, 20 Feb
 2024 12:19:17 +0000
Received: from CY4PEPF0000EDD7.namprd03.prod.outlook.com
 (2603:10b6:930:8d:cafe::64) by CYZPR11CA0024.outlook.office365.com
 (2603:10b6:930:8d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.40 via Frontend
 Transport; Tue, 20 Feb 2024 12:19:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD7.mail.protection.outlook.com (10.167.241.211) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Tue, 20 Feb 2024 12:19:17 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 20 Feb
 2024 06:19:15 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via
 Frontend Transport; Tue, 20 Feb 2024 06:19:14 -0600
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
X-Inumbo-ID: 468c6110-cfea-11ee-8a52-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WSsUIBUGmcyd7LuDyoccMlqiRxnGzGDhK2hU3YOdVzJfr7TvsLcFxemCph24hJZaRDEFW638npeauQKY6esEiJ9oSwFQeTIR2g6+8GB1xBygjf0oq9J8EMYEJ3q7RaVXXO1TspQopaJYnInkJGKSa3O+bOa9zXWcqC9pGA241m5PZtEs4ebaD+VgpKGyA7dBUNOMscm3e5vcjTSyNr/LsqnwnUOe1VT5XQyItr9bd40ICufKG3Qs39dtOCTcakOlLr4594MWWNodAcM72DpnYpK+KTzPqdWQihsvLcK/32U4l487lOBde0O6w4JlEGbZVxUeR/4TyC92ZCvjnE3xtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PhMwKyVo3kV6ClvTBpqbApB6tIudAzmtxwRqsvXdrFs=;
 b=BaMhWqkfMNVLZVPykLAlaaubHTtmeyarrZyNFWGYqf7qLJra9VMOuZ8cxyP34TIVYJ+5KtHpki7CA9Wd72gYP+DgxrPpSaRIQw/YQmipGVcKXwo5+PM8Ty/dB+OdT/W6VyEC89xhvkyMZp6HSvSOW7vZ/TC31h8SvYOnzIBBAGhAKaB7fLSFqXjozU9d7OMOjFqB9YxGadB8stL2Mon0KnHlRMuV4Dm/MDwGyyiFG1PS5MDMOSBdBjtfks/boxk0qo37ayw35jvxG177QRCOHD1HYYse3BtXgKCmaIyq3v9L0JZdY23ikEefn0ReOW7lrExJancaS0cxeuAl4R/S9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PhMwKyVo3kV6ClvTBpqbApB6tIudAzmtxwRqsvXdrFs=;
 b=B1NPj/4rKBQE0tFtJjAHtRy01GR+GmMSoHWNV2mRq2tGOh5bvoMt17iKbfOWR4cSufMvasX1SWXxPTTN/aD+OOwZ7sS7/5PIrUgDWG06jGiOPX7+8+f2Len6wtsDl3a6ivn3e+KaPuzTNPq4ErSW0D75Q8/cTxi5MfOApHe0ywg=
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
Subject: [XEN v5 3/3] xen/arm: arm32: Add emulation of Debug Data Transfer Registers
Date: Tue, 20 Feb 2024 12:17:43 +0000
Message-ID: <20240220121743.3680715-4-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240220121743.3680715-1-ayan.kumar.halder@amd.com>
References: <20240220121743.3680715-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD7:EE_|CYYPR12MB8961:EE_
X-MS-Office365-Filtering-Correlation-Id: 41435a71-6529-419c-ca3c-08dc320e28b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qJxf9g7TyisYRj5LmoWbUfyKbkbQz/mPtUCK72cUQ7jGlA7lbZ8dynYDp+yIp9oRYPWNLRxsmB3iNHkIGR18X1u45vD+55T3kkc2hJQhbXQzOuwBGLx9oUqKyJRgEg7tcFOTrZd6F4sW+qsiVWwDILMU47M4ANN6key9upJBbtQ24mfY/Q64T19I1nZB5p2qNZ9BN84BYiDEx7QES86hboYPmpeBBOX1/g1Guj7VpcvmxTQOWnVX6+0LbFeO3eSWkhgCIBYEcwFX9TopYc4t/paagxc+ejmsSF1yUiyPbYdbG6sMzKh8GIv7nn41Cxo9p5xYyGRreokcawyEBns/4jqdplr/gyF3pdvtnIqLzxirQg4axkvH8Dfo7pGM51hiNXmD9m1k7TYVvVMk0mUgkjSU4DGHEIg7zQ4TU9vIrtXiC7C2mz2evXa4quHWD9Gc9f/Z0HjDhFsy4kOEF5kUjtYxatHoSbGauMSQkQA3u0nQZA0I011ADtqWdrFooMIk032vYl5JJJwiXxr4Tqfq0GcHMNI3s5nJ+VVd3o2xbzDWyGa32RKYZrGHaeDxPMJaIsD2/O7xyGJfb3SRT2Nv+okf+jhuf6204V44TizGcZVEKgCdsbP3yC9kxF/HHczfQwBqrpu5iYvbNaovOqrGXTMB6/R7HwHeYKNQmAaGxPQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(230273577357003)(36860700004)(46966006)(40470700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 12:19:17.2738
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41435a71-6529-419c-ca3c-08dc320e28b7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8961

When user enables HVC_DCC config option in Linux, it invokes access to debug
transfer register (i.e. DBGDTRTXINT). As this register is not emulated, Xen
injects an undefined exception to the guest and Linux crashes.
To prevent this crash, introduce a partial emulation of DBGDTRTXINT as RAZ/WI
and TXfull should be set to 1. So that Linux will see that TXfull is set, and
it will not thereafter access DBGDTRTXINT (it will access it at least once to
later check if TXfull is set).

As a pre-requisite, DBGOSLSR should be emulated in the same way as its AArch64
variant (ie OSLSR_EL1).
This is to ensure that DBGOSLSR.OSLK is 0, thus DBGDSCRINT.TXfull is treated
as UNK/SBZP. DBGOSLSR.OSLM[1] is set to 1 to mantain consistency with OSLSR_EL1.

Only DBGDSCRINT can be emulated. DBGDSCRINT can be accessed at EL0 as DBGDSCREXT
is emulated as RAZ (as DBGOSLSR.OSLK == 0). So, we took the opportunity to fix
the minimum EL for DBGDSCRINT.DBGDSCRINT.TXfull is set to 1.

Refer ARM DDI 0487J.a ID042523, G8.3.19, DBGDTRTXint
"If TXfull is set to 1, set DTRTX to UNKNOWN".
So, DBGDTR[TR]XINT is emulated as RAZ/WI.

Thus, any OS is expected to read DBGDSCRINT and check for TXfull before using
DBGDTRTXINT.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes from

v1 :- 1. DBGDTR_EL0 does not emulate RXfull. This is to avoid giving the OS any
indication that the RX buffer is full and is waiting to be read.

2. In Arm32, DBGOSLSR is emulated. Also DBGDTRTXINT is emulated at EL0 only.

3. Fixed the commit message and inline code comments.

v2 :- 1. Split the patch into two (separate patches for arm64 and arm32).
2. Fixed in line comments and style related issues.
3. Updated commit message to mention DBGDSCRINT handling.

v3 :- 1. The original emulation of DBGDSCRINT is retained when
'partial_emulation' is false.

2. If 'partial_emulation' is false, then access to DBGDTRTXINT will
lead to undefined exception.

v4 :- 1. Invoked "goto fail" from "default:" to ensure compliance with
MISRA 15.3.

 xen/arch/arm/include/asm/cpregs.h |  2 +
 xen/arch/arm/vcpreg.c             | 63 ++++++++++++++++++++++---------
 2 files changed, 47 insertions(+), 18 deletions(-)

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
diff --git a/xen/arch/arm/vcpreg.c b/xen/arch/arm/vcpreg.c
index a2d0500704..1a2d79b818 100644
--- a/xen/arch/arm/vcpreg.c
+++ b/xen/arch/arm/vcpreg.c
@@ -493,11 +493,12 @@ void do_cp14_32(struct cpu_user_regs *regs, const union hsr hsr)
      * ARMv8 (DDI 0487A.d): D1-1509 Table D1-58
      *
      * Unhandled:
-     *    DBGOSLSR
      *    DBGPRCR
      */
     case HSR_CPREG32(DBGOSLAR):
         return handle_wo_wi(regs, regidx, cp32.read, hsr, 1);
+    case HSR_CPREG32(DBGOSLSR):
+        return handle_ro_read_val(regs, regidx, cp32.read, hsr, 1, 1U << 3);
     case HSR_CPREG32(DBGOSDLR):
         return handle_raz_wi(regs, regidx, cp32.read, hsr, 1);
 
@@ -509,8 +510,6 @@ void do_cp14_32(struct cpu_user_regs *regs, const union hsr hsr)
      *
      * Unhandled:
      *    DBGDCCINT
-     *    DBGDTRRXint
-     *    DBGDTRTXint
      *    DBGWFAR
      *    DBGDTRTXext
      *    DBGDTRRXext,
@@ -548,12 +547,27 @@ void do_cp14_32(struct cpu_user_regs *regs, const union hsr hsr)
         break;
     }
 
+    /*
+     * Xen doesn't expose a real (or emulated) Debug Communications Channel
+     * (DCC) to a domain. Yet the Arm ARM implies this is not an optional
+     * feature. So some domains may start to probe it. For instance, the
+     * HVC_DCC driver in Linux (since f377775dc083 and at least up to v6.7),
+     * will try to write some characters and check if the transmit buffer has
+     * emptied.
+     */
     case HSR_CPREG32(DBGDSCRINT):
         /*
-         * Read-only register. Accessible by EL0 if DBGDSCRext.UDCCdis
-         * is set to 0, which we emulated below.
+         * By setting TX status bit (only if partial emulation is enabled) to
+         * indicate the transmit buffer is full, we would hint the OS that the
+         * DCC is probably not working.
+         *
+         * Bit 29: TX full
+         *
+         * Accessible at EL0 only if DBGDSCRext.UDCCdis is set to 0. We emulate
+         * this as RAZ/WI in the next case. So RO at both EL0 and EL1.
          */
-        return handle_ro_raz(regs, regidx, cp32.read, hsr, 1);
+        return handle_ro_read_val(regs, regidx, cp32.read, hsr, 0,
+                                  partial_emulation ? (1U << 29) : 0);
 
     case HSR_CPREG32(DBGDSCREXT):
         /*
@@ -562,6 +576,18 @@ void do_cp14_32(struct cpu_user_regs *regs, const union hsr hsr)
          */
         return handle_raz_wi(regs, regidx, cp32.read, hsr, 1);
 
+    /* DBGDTR[TR]XINT share the same encoding */
+    case HSR_CPREG32(DBGDTRTXINT):
+        /*
+         * Emulate as RAZ/WI (only if partial emulation is enabled) to prevent
+         * injecting undefined exception.
+         * Accessible at EL0 only if DBGDSCREXT is set to 0. We emulate that
+         * register as RAZ/WI.
+         */
+        if ( !partial_emulation )
+            goto fail;
+        return handle_raz_wi(regs, regidx, cp32.read, hsr, 0);
+
     case HSR_CPREG32(DBGVCR):
     case HSR_CPREG32(DBGBVR0):
     case HSR_CPREG32(DBGBCR0):
@@ -591,17 +617,21 @@ void do_cp14_32(struct cpu_user_regs *regs, const union hsr hsr)
      * And all other unknown registers.
      */
     default:
-        gdprintk(XENLOG_ERR,
-                 "%s p14, %d, r%d, cr%d, cr%d, %d @ 0x%"PRIregister"\n",
-                  cp32.read ? "mrc" : "mcr",
-                  cp32.op1, cp32.reg, cp32.crn, cp32.crm, cp32.op2, regs->pc);
-        gdprintk(XENLOG_ERR, "unhandled 32-bit cp14 access %#"PRIregister"\n",
-                 hsr.bits & HSR_CP32_REGS_MASK);
-        inject_undef_exception(regs, hsr);
-        return;
+        goto fail;
     }
 
     advance_pc(regs, hsr);
+    return;
+
+ fail:
+    gdprintk(XENLOG_ERR,
+             "%s p14, %d, r%d, cr%d, cr%d, %d @ 0x%"PRIregister"\n",
+             cp32.read ? "mrc" : "mcr",
+             cp32.op1, cp32.reg, cp32.crn, cp32.crm, cp32.op2, regs->pc);
+    gdprintk(XENLOG_ERR, "unhandled 32-bit cp14 access %#"PRIregister"\n",
+             hsr.bits & HSR_CP32_REGS_MASK);
+    inject_undef_exception(regs, hsr);
+    return;
 }
 
 void do_cp14_64(struct cpu_user_regs *regs, const union hsr hsr)
@@ -659,10 +689,7 @@ void do_cp14_dbg(struct cpu_user_regs *regs, const union hsr hsr)
      * ARMv8 (DDI 0487A.d): D1-1509 Table D1-58
      *
      * Unhandled:
-     *    DBGDTRTXint
-     *    DBGDTRRXint
-     *
-     * And all other unknown registers.
+     * All unknown registers.
      */
     gdprintk(XENLOG_ERR,
              "%s p14, %d, r%d, r%d, cr%d @ 0x%"PRIregister"\n",
-- 
2.25.1


