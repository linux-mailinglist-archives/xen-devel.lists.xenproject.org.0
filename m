Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0E5874F4A
	for <lists+xen-devel@lfdr.de>; Thu,  7 Mar 2024 13:40:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.689877.1075306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riD3C-0006p4-8P; Thu, 07 Mar 2024 12:40:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 689877.1075306; Thu, 07 Mar 2024 12:40:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1riD3C-0006lk-53; Thu, 07 Mar 2024 12:40:42 +0000
Received: by outflank-mailman (input) for mailman id 689877;
 Thu, 07 Mar 2024 12:40:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D3qa=KN=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1riD3B-00060p-3c
 for xen-devel@lists.xenproject.org; Thu, 07 Mar 2024 12:40:41 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2418::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e6b5ae22-dc7f-11ee-a1ee-f123f15fe8a2;
 Thu, 07 Mar 2024 13:40:39 +0100 (CET)
Received: from BYAPR01CA0014.prod.exchangelabs.com (2603:10b6:a02:80::27) by
 CY8PR12MB8195.namprd12.prod.outlook.com (2603:10b6:930:77::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7339.39; Thu, 7 Mar 2024 12:40:35 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:a02:80:cafe::63) by BYAPR01CA0014.outlook.office365.com
 (2603:10b6:a02:80::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38 via Frontend
 Transport; Thu, 7 Mar 2024 12:40:35 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7362.11 via Frontend Transport; Thu, 7 Mar 2024 12:40:35 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 7 Mar
 2024 06:40:34 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 7 Mar
 2024 06:40:34 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via
 Frontend Transport; Thu, 7 Mar 2024 06:40:33 -0600
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
X-Inumbo-ID: e6b5ae22-dc7f-11ee-a1ee-f123f15fe8a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YAyXdCV/J4N0JT8gTDwrBJlmEwmiYLfWetPGYHjEsnjjTWHKMx5czvMN4TPnxyvkG0j8Pdw0g/fMJOlhINB80ruIzliCnVbW0VtgMj3NmSFDUb7YIsyG6QPI5bnXbtekaS+EOUEGeOEFbqvFvu0sCAGYVHXesL9avx24QhOQREuMx06SJv9VJ5ST73XWd9yc6Gh+Dosui3ZDAw6qKTwZJMO/m8LXHEJY5ujvyNPCEGOsj0y23IxUVmD2UW37EqUjkYRKZaVBfSMQYOmyaThjIZbD79bHh9DGXwbamuo6anwrE1TaJ3Osh45pcxnmDeGga/37bieb+gfbSjhh+7V+UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXmedK0QVYV/fwcpnxU7YEJJLCulbSQoe7KyRDQYIbc=;
 b=A5FpYE28p1/OmPdw1GyU58E/7kZYec8rSDxJi8+vtjxJZpVpBrn5tMcQy0fkT3onOQ6/39AIh3eLkyFHLMa2k2LReVhl3SCiuIk1BtE8PtWmjz+7rlT+RDwMbMVSEzDm8qRBmSBNVnKzwMKi4QFgXpIM3gSK18RyAEKHzkyGld/unzs5WCBva33ia0Jf57+jG5uwUyKoEN6fb0o+4Pd2Cz1F/C9zLqaiZfHZO9ODRcvoQ9ac1FlwSOE7hUgFwstcecDndK5viB/aVWSzm7Tq+UVDh9/qkfnUwI5XLVSxCg5FKUB9PkysgD59qJJqShiqsi/tcvLgc3H5PqsUcjFTeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXmedK0QVYV/fwcpnxU7YEJJLCulbSQoe7KyRDQYIbc=;
 b=oecZOkyH1Ab1KnnO+55Mds7cfzkAljyfBEmYyLtW2k25sMKzEflEI0xIP3qOH8zxIFco4dmLeqGJ6ZgDYTRDr17UaX5A0jo+JxDP41+1xep9Gh9hMKOO3xGzgTibLlH1a0dr3NM26wHpIT/TV9lbTaEF4yeCXXYL7CSrmFp42IA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefano.stabellini@amd.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [XEN v6 3/3] xen/arm: arm32: Add emulation of Debug Data Transfer Registers
Date: Thu, 7 Mar 2024 12:39:43 +0000
Message-ID: <20240307123943.1991755-4-ayan.kumar.halder@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|CY8PR12MB8195:EE_
X-MS-Office365-Filtering-Correlation-Id: 41aa4874-edf2-44d1-00a1-08dc3ea3c8fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hPnoC1wDIG/EhSH152dotqXoK99hU8fT0/V+facNvujZA1JOsAhGqjHRegtozf/bz0dhuhuzs/4hUMAMSxFGTrlXAO7rOanq1wIJC3H11p5NF/oEfoH8p0z+937nlEJfFUxhSoxnEEK8e+tIieI8wEmFKGxdPe834H0/0oCAgM+KbKFCbkWCQ5uqVA6H4WvK1xLjy4YoKtknL/I3QP6ZBR60AmgyXzXQ+YDZuPjQAcavybVmekIa1qyABOcmvDPwyP6OMKJX1T3aap0rMVXD9hgjXhNwYo1CpZJH/EylQ9RsbC6X78STrA+so85njxKBYyEEA28bmDP+lGpmTJJTkV0+GjUAD+ws/S2w2v4AW6s2lA48pjf5dkIeKxu5dOPsElbrDgEOdwQNjAsVIYb7djNlL16JippRgTQvYposCtmoQSKTsxU5BPz7nSF5qNQGcsnRwCHwk18v6O2CLgtTEmj0/39DEgmVKshW6F5ampNX7iTqieds78rk1j48+iWiOHysGogXZxjddflD4/wRP++jDA37W3vS57eGQqZ0CtlmfaUw0pgD5pXWujRuHvudfOWrmKE+r1c6nU1mRRAfzt2Cz+66Fj/vWcW0YO+btRX97+N1B63KEU65MkH/PnHVLgUA+xmZGs5l8P1nympwAojG/p+Nt6/VhZbDxZh65or5gueyEFpyatiEb+YbT9Eqc4fUfQd6gqG/WAO5Ber/GA8b+lhDgjdpEYCfnt5UEOVcyhx5HZaLqznGEHBTMQTP
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(82310400014)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 12:40:35.1223
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41aa4874-edf2-44d1-00a1-08dc3ea3c8fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8195

When user enables HVC_DCC config option in Linux, it invokes access to debug
transfer register (i.e. DBGDTRTXINT). As this register is not emulated, Xen
injects an undefined exception to the guest and Linux crashes.

To prevent this crash, introduce a partial emulation of DBGDTR[TR]XINT (these
registers share the same encoding) as RAZ/WI and DBGDSCRINT as TXfull.

Refer ARM DDI 0487J.a ID042523, G8.3.19, DBGDTRTXint:
"If TXfull is set to 1, set DTRTX to UNKNOWN".

As a pre-requisite, DBGOSLSR should be emulated in the same way as its AArch64
variant (i.e. OSLSR_EL1). This is to ensure that DBGOSLSR.OSLK is 0, which
allows us to skip the emulation of DBGDSCREXT (TXfull is treated as UNK/SBZP)
and focus on DBGDSCRINT. DBGOSLSR.OSLM[1] is set to 1 to mantain consistency
with Arm64.

Take the opportunity to fix the minimum EL for DBGDSCRINT, which should be 0.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
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

v5 :- 1. Reword the commit message
2. Remove the 'return' at the end of function.

 SUPPORT.md                        |  3 ++
 xen/arch/arm/include/asm/cpregs.h |  2 +
 xen/arch/arm/vcpreg.c             | 62 ++++++++++++++++++++++---------
 3 files changed, 49 insertions(+), 18 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index afbd820084..e0ff30cfe9 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -115,6 +115,9 @@ Only the following system registers are security supported:
     DBGDTR_EL0
     DBGDTRTX_EL0
     DBGDTRRX_EL0
+    DBGDSCRINT
+    DBGDTRTXINT
+    DBGDTRRXINT
 
 ### ARM Scalable Vector Extension (SVE/SVE2)
 
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
index a2d0500704..b203f4a142 100644
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
@@ -591,17 +617,20 @@ void do_cp14_32(struct cpu_user_regs *regs, const union hsr hsr)
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
 }
 
 void do_cp14_64(struct cpu_user_regs *regs, const union hsr hsr)
@@ -659,10 +688,7 @@ void do_cp14_dbg(struct cpu_user_regs *regs, const union hsr hsr)
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


