Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34E92843F41
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 13:14:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673999.1048650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV9U6-0008Kn-Ne; Wed, 31 Jan 2024 12:14:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673999.1048650; Wed, 31 Jan 2024 12:14:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV9U6-0008J8-KT; Wed, 31 Jan 2024 12:14:30 +0000
Received: by outflank-mailman (input) for mailman id 673999;
 Wed, 31 Jan 2024 12:14:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HwTD=JJ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1rV9U5-000834-F8
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 12:14:29 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20600.outbound.protection.outlook.com
 [2a01:111:f403:2009::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 482d427c-c032-11ee-8a43-1f161083a0e0;
 Wed, 31 Jan 2024 13:14:28 +0100 (CET)
Received: from PA7P264CA0371.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:37c::12)
 by MN2PR12MB4080.namprd12.prod.outlook.com (2603:10b6:208:1d9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22; Wed, 31 Jan
 2024 12:14:25 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10a6:102:37c:cafe::57) by PA7P264CA0371.outlook.office365.com
 (2603:10a6:102:37c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34 via Frontend
 Transport; Wed, 31 Jan 2024 12:14:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Wed, 31 Jan 2024 12:14:23 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 31 Jan
 2024 06:14:23 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 31 Jan
 2024 06:14:22 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via
 Frontend Transport; Wed, 31 Jan 2024 06:14:21 -0600
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
X-Inumbo-ID: 482d427c-c032-11ee-8a43-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i4Vu+XK72uXA4D/ubeboL8vudYH23k0zoTjwNMAwhLBm+elh2hVjfrCYAbAJ/RhWF2aaCd2HtLTcILE90q+rV2US7WGdnNZyvMFq/wG66lDCNKGXhTeinLzELlvod/bGIP96ubCwnUjBtps8WUiXgGEpLqezvIRoxTxqfwBWVBiZBIhB4xej9etqqheTJLaqv/+89zjgd9GuP93cTnvVZ0jIFyWd4Z6xz0AVfvzlg0CWeZ13XMEzBPuV3yPf7VSSuwfCsgUrQjv2izDZg1on1J+y00TxDCp24tj2bBQ51wlu/41xXDndDLqOZvMo6ZOmmX9zKDCyEZK8FKuILrk9Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bWN5n85Dx3hu7zn/5LPwLV3qgP3PSpBmLZ4KywQ45kA=;
 b=KgWpVDxJMEO2YQa3VUqUaiRmim2WU6MYJCl4/vtVnBoB2qyECPo7u0SYoVxq9CfWW5PPM4IS3IjshJ5YVsrU/vkVWO2bOlOAktxCTRkHBS6iXF+AkvWRkLu3VGqc1FwS+JgCHEWuu6ezlr35iqk0evyvalx2T3S39QaIhxNlt0VShnUmzxKm5SEH50FNpe6u6vQdQnhj4ci/nU6wQ9PatSbEj5vIrJrP9MsY7tgbEkSGS/inJXaS4v+1qKRNfP9xYJiHbJzQdyztd1R9lQAnbopNnvkYgJD+pmiEYPtboGJfEHkiAJ+aUEouZhv4AZrPJ3ctr8yL1T0VKwga6u778g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bWN5n85Dx3hu7zn/5LPwLV3qgP3PSpBmLZ4KywQ45kA=;
 b=dVwUyM3aWq443cgKnZPjmkLVJF9zp/2oet7hnvgJMp6SqNOFscL3+ey2E1gDj5QHTGlgQLJCyV80+QFQo5blr5xZs5zULg4AqZKSu7I+YpWy2d/Wbj41ilsESMO+VK44nC2hPm/3bfJrrUbVDdpa8U9TfJoilU8+tFz/0d3jGH8=
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
	<michal.orzel@amd.com>, <luca.fancellu@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v4 3/3] xen/arm: arm32: Add emulation of Debug Data Transfer Registers
Date: Wed, 31 Jan 2024 12:10:49 +0000
Message-ID: <20240131121049.225044-4-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240131121049.225044-1-ayan.kumar.halder@amd.com>
References: <20240131121049.225044-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|MN2PR12MB4080:EE_
X-MS-Office365-Filtering-Correlation-Id: 37afa499-6c6f-43a9-6e3e-08dc2256295d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GgKKE7MgDDokxtKY1pIa1Xe66vunda2GsUik9y+U1UwTusTRwiesDyNwA0dmpmETFSAZl0TGdqgd7Tiu1KUafmRfJE3sx2Yu5ATaYTiqikkk1PkPLUhlJQ13qT4NttNM/GaSWl7N7vLVfAeOJY+e5soup8YKUN1DPHd3PrMQ9Fe1eiyiP5TzIaYLtRwOXlIEvFwBD7I22s+++Cpbul72ELBh/XleXIlb0Kf+/g/c8EJjRflCSEarRFyjT1lNu8XGqkWcGOlT0UslELQLmemV61YYR8u+Y2K/8vgcYm3JdqrjKMKtin6hyiwoVOmHofrJVxBLeKOcodKbZBsoNpGx6Bo6BB4Gb/a9j8Xp+Clc5wronDz1+0ujf/m5gHKvSWOMbPfnrWntlTkf6zcFwdTJrpRwRfH62dMngha6KfiN0OpPHut/wGanWpcR9kxnmi7ddLWsBwVBPeIq4Zp3mqOmMEI8CYEiwjF4XKszJ0PXEueTnkpGee1J5RzPHxPXdKtOj9/M43PgyYtce27KRcNHCC/i9popsN5AGONzauemvI3jkdQIWulirzq2TRma8vNQXE9uW7b8JrFK/ii260r/5DIwbccU9lI2s/CDW5YOlpUlmQDClj3kj+/hDhr8ukqAtkQfHeZeyjSRuEizomA4a2nekKggXjn3dGO7EZ+IHhnkOh/DM9ZiYCsmUW52Kp3dMouInFRrrtUyv4fKha1jHZLnY7Q6p9J1wNd7MeMF3MtQegeN6Z171iRiiPouweg/A23SFxo5MPV3iQdnueaA5qkBtPi2EN/t9wlhb9Er+vcD7qXdjhOjsyxvr+zdNihj
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(346002)(376002)(136003)(230273577357003)(230173577357003)(230922051799003)(64100799003)(186009)(82310400011)(1800799012)(451199024)(46966006)(36840700001)(40470700004)(6916009)(316002)(70206006)(54906003)(478600001)(70586007)(6666004)(8936002)(8676002)(4326008)(1076003)(5660300002)(26005)(426003)(2616005)(336012)(2906002)(83380400001)(47076005)(81166007)(40460700003)(82740400003)(86362001)(40480700001)(41300700001)(36756003)(103116003)(36860700001)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 12:14:23.5507
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37afa499-6c6f-43a9-6e3e-08dc2256295d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4080

When user enables HVC_DCC config option in Linux, it invokes access to debug
transfer register (i.e. DBGDTRTXINT). As this register is not emulated, Xen
injects an undefined exception to the guest and Linux crashes.
To prevent this crash, introduce a partial emulation of DBGDTRTXINT as RAZ/WI
and TXfull should be set to 1. So that Linux will see that TXfull is set, and
it will not access DBGDTRTXINT.

As a pre-requisite, DBGOSLSR should be emulated in the same way as its AArch64
variant (ie OSLSR_EL1).
This is to ensure that DBGOSLSR.OSLK is 0, thus MDSCR_EL1.TXfull is treated
as UNK/SBZP.
Only MDCCSR_EL0 can be emulated (which is DBGDSCRINT on arm32). DBGDSCRINT
can be accessed at EL0 as DBGDSCREXT is emulated as RAZ (as DBGOSLSR.OSLK
== 0). So, we tool the opportunity to fix the minimum EL for DBGDSCRINT.
 DBGDSCRINT.TXfull is set to 1.

Refer ARM DDI 0487J.a ID042523, G8.3.19, DBGDTRTXint
"If TXfull is set to 1, set DTRTX to UNKNOWN".
So, DBGDTR[TR]XINT is emulated as RAZ/WI.

Thus, any OS is expected to read DBGDSCRINT and check for TXfull before using
DBGDTRTXINT.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
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

 xen/arch/arm/include/asm/cpregs.h |  2 ++
 xen/arch/arm/vcpreg.c             | 35 ++++++++++++++++++++++---------
 2 files changed, 27 insertions(+), 10 deletions(-)

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
index a2d0500704..87df4bd238 100644
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
@@ -550,10 +549,22 @@ void do_cp14_32(struct cpu_user_regs *regs, const union hsr hsr)
 
     case HSR_CPREG32(DBGDSCRINT):
         /*
-         * Read-only register. Accessible by EL0 if DBGDSCRext.UDCCdis
-         * is set to 0, which we emulated below.
+         * Xen doesn't expose a real (or emulated) Debug Communications
+         * Channel (DCC) to a domain. Yet the Arm ARM implies this is not an
+         * optional feature. So some domains may start to probe it. For
+         * instance, the HVC_DCC driver in Linux (since f377775dc083 and at
+         * least up to v6.7), will try to write some characters and check if
+         * the transmit buffer has emptied. By setting TX status bit to
+         * indicate the transmit buffer is full. This we would hint the OS
+         * that the DCC is probably not working.
+         *
+         * Bit 29: TX full
+         *
+         * Accessible by EL0 if DBGDSCRext.UDCCdis is set to 0, which we
+         * emulate as RAZ/WI in the next case.
          */
-        return handle_ro_raz(regs, regidx, cp32.read, hsr, 1);
+        return handle_ro_read_val(regs, regidx, cp32.read, hsr, 0,
+                                  partial_emulation ? (1U << 29) : 0);
 
     case HSR_CPREG32(DBGDSCREXT):
         /*
@@ -562,6 +573,12 @@ void do_cp14_32(struct cpu_user_regs *regs, const union hsr hsr)
          */
         return handle_raz_wi(regs, regidx, cp32.read, hsr, 1);
 
+    /* DBGDTR[TR]XINT share the same encoding */
+    case HSR_CPREG32(DBGDTRTXINT):
+        if ( !partial_emulation )
+            goto fail;
+        return handle_raz_wi(regs, regidx, cp32.read, hsr, 0);
+
     case HSR_CPREG32(DBGVCR):
     case HSR_CPREG32(DBGBVR0):
     case HSR_CPREG32(DBGBCR0):
@@ -591,6 +608,7 @@ void do_cp14_32(struct cpu_user_regs *regs, const union hsr hsr)
      * And all other unknown registers.
      */
     default:
+ fail:
         gdprintk(XENLOG_ERR,
                  "%s p14, %d, r%d, cr%d, cr%d, %d @ 0x%"PRIregister"\n",
                   cp32.read ? "mrc" : "mcr",
@@ -659,10 +677,7 @@ void do_cp14_dbg(struct cpu_user_regs *regs, const union hsr hsr)
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


