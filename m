Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8448252B5
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 12:23:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662146.1032086 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLiIJ-0003lH-U1; Fri, 05 Jan 2024 11:23:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662146.1032086; Fri, 05 Jan 2024 11:23:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLiIJ-0003ik-R4; Fri, 05 Jan 2024 11:23:19 +0000
Received: by outflank-mailman (input) for mailman id 662146;
 Fri, 05 Jan 2024 11:23:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0BO+=IP=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1rLiII-0002gg-Nj
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 11:23:18 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061f.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::61f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d260058b-abbc-11ee-98ef-6d05b1d4d9a1;
 Fri, 05 Jan 2024 12:23:17 +0100 (CET)
Received: from MW4PR04CA0095.namprd04.prod.outlook.com (2603:10b6:303:83::10)
 by DS0PR12MB7581.namprd12.prod.outlook.com (2603:10b6:8:13d::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Fri, 5 Jan
 2024 11:23:12 +0000
Received: from MWH0EPF000989EB.namprd02.prod.outlook.com
 (2603:10b6:303:83:cafe::b6) by MW4PR04CA0095.outlook.office365.com
 (2603:10b6:303:83::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.15 via Frontend
 Transport; Fri, 5 Jan 2024 11:23:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EB.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7159.9 via Frontend Transport; Fri, 5 Jan 2024 11:23:11 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 5 Jan
 2024 05:23:10 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via
 Frontend Transport; Fri, 5 Jan 2024 05:23:09 -0600
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
X-Inumbo-ID: d260058b-abbc-11ee-98ef-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UsbNK+KauPCj+SXTuxBmem+lKWAkymMrx1NSP3aVAUtE/6M3BBIHRDTxTfXg0lrkaudTH86ruir3mp4eoUe+SoAv71eBDm6HbihMhIkq6j6AcSRkltCyNvbITLW8+r/Eg98ch/8hEuTBZRSM4vDoZ1npW7A4YAZxRgZw17O4kHuwzxOf0LH2wpUwslsRR8rr1hzdzH6/6ehKVOAjeQ4JYQTyx9bJqcSBcs5NuuW35Id4MdyXZkw9SOemD96+3qOdppBzlCFSOkSRBOOSsvfx/JlR4cDrOOBp6BznZ84Xjf0H9fOLf5oMtaDtiXtQTY6/D38hmESDeu43KC4fkITq4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vEYAbR5qQnhqgkIaraifN+bUkAXWzEogvZPRK6DI0Q=;
 b=YqIrW5KnHABjyFpFpHrkaC4tgL2VcF4bf9ti8iaiyxDXd5jpS8qVblc1flX4QRjEHUuRXgTDOMkcl0UfJ/hyPzVdz44PWt/JNsmmgRZXJhH+yS5bi85wxr5J+xM1XJ8Bp0G04+PRnS+8rtkBWfBrSMLT4Y/MD11KqwaocKi9ivWcFcghsQGz9SO3ieJ6VeSGGdKCKD6jkw+GM1pRKi7NkRCR27SHYAo+2WELSLuZLF1OBLO14qGwVmXBDsnGhHdndI5BjBYNMg1AnfNPXpLNj9hOxUKmdfvrFpzzUq8+eoYDFzW+r9T9sZ/2ck1mxkM2YfeeK1KYPAr2bfsw6QKLSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vEYAbR5qQnhqgkIaraifN+bUkAXWzEogvZPRK6DI0Q=;
 b=YmKQd2mOLMqoSZzJs+/HBX7Uih28jQ0BkFKDp7d9mfo+wgvEdf7aMbRLTUJ1G/0dXpewyyZR4LNnq+BC3qA1rjvG78C0poJ53ueXPUhUppGqi+gkSXWVH52+WNERG/lRULNjxteYPddO4DkysZ93jAH0Acn7xvVQ6vsePsWMCQw=
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
Subject: [XEN v3 2/3] xen/arm: arm64: Add emulation of Debug Data Transfer Registers
Date: Fri, 5 Jan 2024 11:21:55 +0000
Message-ID: <20240105112156.154807-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240105112156.154807-1-ayan.kumar.halder@amd.com>
References: <20240105112156.154807-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EB:EE_|DS0PR12MB7581:EE_
X-MS-Office365-Filtering-Correlation-Id: 376ddd6b-b2bc-4c8e-eb23-08dc0de0b3c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	qqLbAVKkBuicqnu6OwiryFDjyXdApzVvXHopdV0aSb4S+rDJPYaI6kJ36vR2CzpHvC0xESqGQZqWcPLiJXHFSPJOjJAf41FxLfctlsIo6lQili7FpPGEn6hO5HYihXJkLaQhq3qX68rgh2D8x/EJFccu6br0ddGPFFkLXqiQXBvIp8kVyBxo5R84kVNU3GF9L0/kekEiSemIxSfZgstK+0xFLTbHgY1PpBIbd+qciuWU0kg5Az8GtVmssWvOjA0X/hg4rcF+/vqY8nmAh6Ej3QmQYAdOAfN9Zb3A53Crt5bhgcVHW9sXUp1r+ZH+6zFBHdhF73eMj0RUiWVv/mS0vHCBQeq7zsw+wPsWfSPcjGyIHOQw6SHIHtEITtKlZEpO3DixcTdNVBvQqvp4kITWSq7pVuzsfYD3waYcEer9XJPuCNmkOXTSSI1wH+gBCyJcQvhc//oAOMgoODfndQ3JrVLOYkgWHJ8DQkzc0nwdm8Bd6vw4KPoxp8JmMGDwitYHRm0Qh6gal6gNXfBIuhlPcqRQhHceWlmDpPT9wctF1INMUgJVMMxqlwXJMK/2OGUL1VCiqObFhxVDEY9LXI/kfglsVSt7n4BTHoE8gRmknrG1+epABce8UBwVIQLAcMsD5PTgX/IeQIAQ8pg5KyxwBm056fTfZahcYHSJG2+wogkeeGzeViNKs2tn7ALTkQtf4yws+NXmTdIaFBF5lDp7rvmwAevKtfDuB5tkNWdrFWfZfdiuFgBjnRRUX4cjcUBkLZNktU3QwmecX0w53BOhlQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(346002)(396003)(136003)(230922051799003)(64100799003)(1800799012)(451199024)(82310400011)(186009)(46966006)(36840700001)(40470700004)(86362001)(103116003)(36756003)(356005)(81166007)(6666004)(478600001)(70586007)(6916009)(316002)(70206006)(26005)(1076003)(336012)(2616005)(426003)(4326008)(2906002)(5660300002)(8936002)(8676002)(54906003)(36860700001)(82740400003)(40480700001)(83380400001)(47076005)(41300700001)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 11:23:11.8092
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 376ddd6b-b2bc-4c8e-eb23-08dc0de0b3c2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989EB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7581

From: Michal Orzel <michal.orzel@amd.com>

Currently if user enables HVC_DCC config option in Linux, it invokes access
to debug data transfer registers (ie DBGDTRTX_EL0 on arm64, DBGDTRTXINT on
arm32). As these registers are not emulated, Xen injects an undefined
exception to the VM and Linux (running as VM) crashes.

We wish to avoid this crash by adding a partial emulation of DBGDTRTX_EL0.
MDCCSR_EL0 is emulated as TXfull.

Refer ARM DDI 0487J.a ID042523, D19.3.8, DBGDTRTX_EL0
"If TXfull is set to 1, set DTRRX and DTRTX to UNKNOWN".

Thus, any OS is expected to read MDCCSR_EL0 and check for TXfull before
using DBGDTRTX_EL0. Linux does it via hvc_dcc_init() ---> hvc_dcc_check(),
it returns -ENODEV. In this way, we are preventing the VM from accessing
DBGDTRTX_EL0 register.

We also emulate DBGDTR[TR]X_EL0 as RAZ/WI.

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

 xen/arch/arm/arm64/vsysreg.c         | 25 +++++++++++++++++++++----
 xen/arch/arm/include/asm/arm64/hsr.h |  3 +++
 2 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/arm64/vsysreg.c b/xen/arch/arm/arm64/vsysreg.c
index b5d54c569b..2f70eea2e5 100644
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
@@ -172,11 +169,31 @@ void do_sysreg(struct cpu_user_regs *regs,
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
+         * is full, we would hint the OS that the DCC is probably not working.
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
+#ifdef CONFIG_PARTIAL_EMULATION
+    case HSR_SYSREG_DBGDTR_EL0:
+    /* DBGDTR[TR]X_EL0 share the same encoding */
+    case HSR_SYSREG_DBGDTRTX_EL0:
+        if ( opt_partial_emulation )
+            return handle_raz_wi(regs, regidx, hsr.sysreg.read, hsr, 0);
+#endif
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
-- 
2.25.1


