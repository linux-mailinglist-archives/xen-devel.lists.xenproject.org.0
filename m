Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3C8843F40
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jan 2024 13:14:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673998.1048640 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV9U2-00085C-GV; Wed, 31 Jan 2024 12:14:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673998.1048640; Wed, 31 Jan 2024 12:14:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rV9U2-00083F-DZ; Wed, 31 Jan 2024 12:14:26 +0000
Received: by outflank-mailman (input) for mailman id 673998;
 Wed, 31 Jan 2024 12:14:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HwTD=JJ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1rV9U0-000834-7y
 for xen-devel@lists.xenproject.org; Wed, 31 Jan 2024 12:14:24 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:200a::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 441759fa-c032-11ee-8a43-1f161083a0e0;
 Wed, 31 Jan 2024 13:14:23 +0100 (CET)
Received: from BYAPR07CA0028.namprd07.prod.outlook.com (2603:10b6:a02:bc::41)
 by CH0PR12MB8551.namprd12.prod.outlook.com (2603:10b6:610:186::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.34; Wed, 31 Jan
 2024 12:14:19 +0000
Received: from SJ5PEPF000001D6.namprd05.prod.outlook.com
 (2603:10b6:a02:bc:cafe::23) by BYAPR07CA0028.outlook.office365.com
 (2603:10b6:a02:bc::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24 via Frontend
 Transport; Wed, 31 Jan 2024 12:14:19 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001D6.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Wed, 31 Jan 2024 12:14:18 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 31 Jan
 2024 06:14:17 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 31 Jan
 2024 04:14:17 -0800
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via
 Frontend Transport; Wed, 31 Jan 2024 06:14:16 -0600
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
X-Inumbo-ID: 441759fa-c032-11ee-8a43-1f161083a0e0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=khbnwKU42Meo9RYKtHbiYZZEYD0rmS2YYxCEqJ3LRp0fdNJsxTKip7WJ6oHreCxtXanwk8GSWp2GTIQDQHV3PECdACXJ936KDQNfSGZ2o6pp0V9CPGxyjGrWMTlBhLXhHVspSPjUShc6tkNTUdNgHMyQT2kzmPhXB7Ho9CrR3F3RfUFo5WqiP5P3TLmz48XqjhTJrco8wicYORYLfg8cXRBoylvQ536AmJCfUCcbsNi2WLqWatV/fT1QJZHa7RVUWauIUWrTOtuP+HI89h2ldzSrCjiptZqzBmEnJTCDaG+grJLzheT9ql0yVL7USldfHIEaR7JCa63azuVl0fEQ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKVsyO8xIRiExnyh4ryfpCBXOBzr72XwASsT+kuql3k=;
 b=YZGmoEHBavFux0pKAY0A1lDBVyNzAyACYP476AN6rRvz+NEh4UTxwMPpA9l3MERpap7RrOVGTyToWe7GiqxzEnmIzCo6CAgg/xoyAkMPVcbAFjpiPGgR8efSshSNcFdZ+GeeygBTjNRO+Liung4/DkbW3Kj4QxP9IkHv07FS4z7UYO/YCgmkzZn30o25/FKtISZInAYlLI1b0VHmKItrZq+Xun1FuCI8Zusk87/fT6OIZEt6XImxC62TcUI5ERZUt9gz40At5rmFIWyTAeXhopFMKn/p9vYN2iXDcbOxxzo7sBL1ghkKDa0GG9qkIIwOOs3O2OJB81l+IByvJ0xCMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKVsyO8xIRiExnyh4ryfpCBXOBzr72XwASsT+kuql3k=;
 b=PHO6cn73u4XXCKOllRjdIFMXjbBoA+G2/O7KNpfGmERLR7o5AFJjUgEQIvRvg6+jEBmtVJhVW270G9ymP/Vvs3sef7icpegql/GgbYBpnez7PHLhG+6AW9Yk1xgw0/EJ814Bvcg0Pd66SQUa48MkBpcl4d9HHhrOGNNdXQXrrvU=
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
	<michal.orzel@amd.com>, <luca.fancellu@arm.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [XEN v4 2/3] xen/arm: arm64: Add emulation of Debug Data Transfer Registers
Date: Wed, 31 Jan 2024 12:10:48 +0000
Message-ID: <20240131121049.225044-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240131121049.225044-1-ayan.kumar.halder@amd.com>
References: <20240131121049.225044-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D6:EE_|CH0PR12MB8551:EE_
X-MS-Office365-Filtering-Correlation-Id: ad937851-3f65-4330-8dbe-08dc22562672
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i6EgjIQDpl29VgWpO5SNz8tRbuXyDKXaOcheGEHwR+Y2GHKYABO5SXyfUTBqBrCoeX6PrwYk9YlwAi4umnjmgDBpRnNQkQah/lsmeqJUSsJx3cG4lGMH8nAlFIqbT6M5yCjwCJq05LPC9z6NQB1L1hPwsIEx5Av5riL6PWjuw+n9SzElqtqAvNLVbf8OGOW7XZ8oXuUeSg17aENVwPyI0ztdFtG7n5kSs+dUzTyRgqEKbmTMlfBeIrdBjG5i1Sa+xQ/EIqxdLhJDvpCKKBlP4zoQPjBUV/EBQlI1zgEhWV15AqTVDSzRlzX3KgdmSrwDWn31zUHIFmVAgvmPXP52e3CXMFUrZBAxytClAZpYzZl/1GkXOJaTPeGvmSmvBl/jJHG7G3ISXFfI/MZsAyZCjQDtaGX8SYEKkqlwoQSEFSgwscBmdpRCSJ/cSI/Ho+FqcznQE94VRldJwHn5JHkXGvVQGIsH8QOjTaq5RKmXUW8jkf0imKWEurVTeVfAG46ANqTCY6wJa88nxJA37R/BK6pBlV/8x6IOXrHOW44PHnlWtXhJBG4wtVRablwMN6k5xKuTEVslGY6mGOIZ6NI19jywgeJtReqosA7pHsJfTAF/dQ0lkSPMxY3UdDJZESZlpcQYZUy9DjescWUjezZave7IsAv2NKzp/Jddoxy/hfh2oh8BpyTqnmHhcPdM0RPaNL7k3/uXTVvo+NwZx4Kgy7aaVdhcjnNDdTD2JpNaC7+vbU5/RmkdyOte2vT/zxHWchHWYdu5s+scsAMuwjTEJA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(346002)(376002)(136003)(230922051799003)(64100799003)(186009)(82310400011)(1800799012)(451199024)(46966006)(36840700001)(40470700004)(6916009)(316002)(70206006)(54906003)(478600001)(70586007)(6666004)(8936002)(8676002)(4326008)(1076003)(5660300002)(26005)(426003)(2616005)(336012)(2906002)(83380400001)(47076005)(81166007)(40460700003)(82740400003)(86362001)(40480700001)(41300700001)(36756003)(103116003)(36860700001)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2024 12:14:18.5934
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad937851-3f65-4330-8dbe-08dc22562672
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8551

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

 xen/arch/arm/arm64/vsysreg.c         | 28 ++++++++++++++++++++++++----
 xen/arch/arm/include/asm/arm64/hsr.h |  3 +++
 2 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
index b5d54c569b..94f0a6c384 100644
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
@@ -173,10 +170,32 @@ void do_sysreg(struct cpu_user_regs *regs,
         return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 1);
     case HSR_SYSREG_MDCCSR_EL0:
         /*
+         * Xen doesn't expose a real (or emulated) Debug Communications Channel
+         * (DCC) to a domain. Yet the Arm ARM implies this is not an optional
+         * feature. So some domains may start to probe it. For instance, the
+         * HVC_DCC driver in Linux (since f377775dc083 and at least up to v6.7),
+         * will try to write some characters and check if the transmit buffer
+         * has emptied.
+         *
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
+        if ( !partial_emulation )
+            goto fail;
+        return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 0);
+
     HSR_SYSREG_DBG_CASES(DBGBVR):
     HSR_SYSREG_DBG_CASES(DBGBCR):
     HSR_SYSREG_DBG_CASES(DBGWVR):
@@ -394,6 +413,7 @@ void do_sysreg(struct cpu_user_regs *regs,
      * And all other unknown registers.
      */
     default:
+ fail:
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
-- 
2.25.1


