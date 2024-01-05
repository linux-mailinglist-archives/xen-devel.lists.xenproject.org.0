Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7F58252B7
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jan 2024 12:23:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.662148.1032097 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLiIP-00044G-BE; Fri, 05 Jan 2024 11:23:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 662148.1032097; Fri, 05 Jan 2024 11:23:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLiIP-00040f-83; Fri, 05 Jan 2024 11:23:25 +0000
Received: by outflank-mailman (input) for mailman id 662148;
 Fri, 05 Jan 2024 11:23:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0BO+=IP=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1rLiIN-0003zp-Te
 for xen-devel@lists.xenproject.org; Fri, 05 Jan 2024 11:23:23 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d45db023-abbc-11ee-9b0f-b553b5be7939;
 Fri, 05 Jan 2024 12:23:21 +0100 (CET)
Received: from BL1PR13CA0257.namprd13.prod.outlook.com (2603:10b6:208:2ba::22)
 by MN2PR12MB4568.namprd12.prod.outlook.com (2603:10b6:208:260::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.17; Fri, 5 Jan
 2024 11:23:16 +0000
Received: from BL02EPF0001A0FF.namprd03.prod.outlook.com
 (2603:10b6:208:2ba:cafe::4) by BL1PR13CA0257.outlook.office365.com
 (2603:10b6:208:2ba::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.10 via Frontend
 Transport; Fri, 5 Jan 2024 11:23:16 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A0FF.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7159.9 via Frontend Transport; Fri, 5 Jan 2024 11:23:16 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 5 Jan
 2024 05:23:16 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Fri, 5 Jan
 2024 03:23:15 -0800
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via
 Frontend Transport; Fri, 5 Jan 2024 05:23:14 -0600
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
X-Inumbo-ID: d45db023-abbc-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ElTwWiiNsKAbSRKwsHoFSxtq2Gbn6MPfnNTfQ5WoMtP7axax7/kX+LD2M7PXOh9vmmiiz0YJhLfdXLrGLiKzd08TBSlTrJeSsKXg3X/w5K0lyh88FZF2ZOpzGPqQLh8R7E6p9sYW0wQdub2Dny7um3FlGrRDD5kj0CTuI/8Dn4QGBk54G1cx81DZTVSrxUF5ad6FBIGlfE/V+hbZkgU5YO96jXajSCRTvu0BBdNDP5wf0KmxU/fD9KLdx2cPtmA5gXSg1kpG/O+eB3cpMLv+0syyPh/zQK3clzkSVKJ6Y8VXMgRc7XrXvX9mntsqpi6K0sPA1Bnma85k4Wrlotm9Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dTZ0gV6JvJaaRc3bSM9b2x61yi4ymB65XMOL+sI8HO0=;
 b=C4pHbam01Q/JHwV1OsKyEM08hN+MYsI6vZlvbcUk+f21zVLeKVhSGfKQcEKMECNqBI+JD8FqRML+ENe2xRqxrREc5L5wwsbFqtxh0vWHKd2a515jD2VxJWpPUex/RHNyLjTKrhQ4KgmeApCc71Pt+V1dXmoxx8uzzyg5TGs2xRxwCmC2TSRGzLuCcbNthAeOzXze72ewPb4Wfq+0/PRziCuAXPuxHLkxyvJZ/mum1PrgWEUUrFev2JjjWIOpAt3WLpBOBEC73Es5oMbtIq2XSFUyViQGr7coGG6YG0iZa+iMjm8c8kqnyTDWPfpYv0ZbwssjPGsjeKCFSqjBIzyRgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dTZ0gV6JvJaaRc3bSM9b2x61yi4ymB65XMOL+sI8HO0=;
 b=Z2urBQHQFMUmmsxYqxsksqYM4xwzd+yi3EYP+VobblCEJhCvEabI1qUbgYQlnDt8bl7MdxanfESz4Yksl2i2i0eTs8kkatf/uaqz07UEDCSofRYI6V8n1GlESno1YtZjIFKlORVXcCx9PUFweKiFKYlWoY+YjSdrnwlXkprIWMk=
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
Subject: [XEN v3 3/3] xen/arm: arm32: Add emulation of Debug Data Transfer Registers
Date: Fri, 5 Jan 2024 11:21:56 +0000
Message-ID: <20240105112156.154807-4-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240105112156.154807-1-ayan.kumar.halder@amd.com>
References: <20240105112156.154807-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FF:EE_|MN2PR12MB4568:EE_
X-MS-Office365-Filtering-Correlation-Id: a28ecb33-580c-4420-b16d-08dc0de0b67c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iMc/GfiAlIpa0utVAqG7GskI5g376XoPxRdmFLg5ufxELDp2zH0jDxO/8T8Sj0jKwSDv9+mq5eFQy72A9L3QIof00qJLZDR5n/LIKGSuvqB09ck7S8SHV0mZC4I5u/JiGPSh1Qq7g6p5+9oW0PfKBmgP3fTpE+CAeXkTAveovMVZhVtfdIlDvHngoun1IQZJU6PS9OQurYcmBdufM3C/0NI618Ltgl37eYljGTNV/bT3SPAJN/+eGRE0+MECdm+bmzfyEexHWHNFrzXYWQ7ry/9O6dgAb/2m7XOrb5uUmwDsrfbFc8XFBSU/qcTmzesogFtZUJ59SfEziuyrqdNC9qZQNcnr0CP0u0LTh0GCsN5fE1y0qE+8Rxsat0seGwj4+1HoX0m5ZW5Y5+0ya9lR3pYBZylk9cUJ4pkrhLJFCDBF3FLe0ak5MJA0dsysA2EWOSopEbsNI0CzhYMsNzXNSj1lFbFUQzQ6ABkmA5mMtXJZvHKlkwlHWu0O1MK0hpKAe58hYsPurH6vVZqa0Onr/HmTUz3jfm1G1oJWrWonyKkLuDKGxz0IbxLb4V7tg+SOMxiSAFe6O+5IuM3whzaeJkSJzLgfZu/2EPacCReEe3eEUNkDBpx6FNGXavMx8zbrRx5qpsFlfLgOC6KObXncVS4DPtq6LeejoRWFPSFqQjDQd5TQ/gLX5Btzj9ar1TnYOVpfetsH1bMhPbYuQG2EvP/LNzYYVoC3Nri+UlpUH0bbyYFgzPxbBZBJwZSCZREU+huTsAebsaQNvqKlhOv15RqfXJwIfhQNqCOzZ3u4XaMaTB30i1I/mYo65yrnvcia
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(136003)(376002)(39860400002)(396003)(230922051799003)(230273577357003)(230173577357003)(82310400011)(186009)(451199024)(1800799012)(64100799003)(46966006)(40470700004)(36840700001)(40460700003)(40480700001)(2616005)(426003)(26005)(1076003)(336012)(6666004)(478600001)(82740400003)(103116003)(36756003)(86362001)(81166007)(356005)(2906002)(41300700001)(36860700001)(47076005)(83380400001)(70586007)(6916009)(54906003)(316002)(70206006)(5660300002)(4326008)(8936002)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 11:23:16.4759
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a28ecb33-580c-4420-b16d-08dc0de0b67c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A0FF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4568

DBGOSLSR is emulated in the same way as its AArch64 variant (ie OSLSR_EL1).
This is to ensure that DBGOSLSR.OSLK is 0, thus MDSCR_EL1.TXfull is treated
as UNK/SBZP.
Thus only MDCCSR_EL0 can be emulated (which is DBGDSCRINT on arm32).
DBGDSCRINT can be accessed at EL0 as DBGDSCREXT is emulated as RAZ (as
DBGOSLSR.OSLK == 0). DBGDSCRINT.TXfull is set to 1.

Refer ARM DDI 0487J.a ID042523, G8.3.19, DBGDTRTXint
"If TXfull is set to 1, set DTRTX to UNKNOWN".
So, DBGDTR[TR]XINT is emulated as RAZ/WI.

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

 xen/arch/arm/include/asm/cpregs.h |  2 ++
 xen/arch/arm/vcpreg.c             | 36 ++++++++++++++++++++++---------
 2 files changed, 28 insertions(+), 10 deletions(-)

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
index a2d0500704..474f872b5f 100644
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
@@ -549,11 +548,24 @@ void do_cp14_32(struct cpu_user_regs *regs, const union hsr hsr)
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
+        return handle_ro_read_val(regs, regidx, cp32.read, hsr, 0, 1U << 29);
+    }
 
     case HSR_CPREG32(DBGDSCREXT):
         /*
@@ -562,6 +574,13 @@ void do_cp14_32(struct cpu_user_regs *regs, const union hsr hsr)
          */
         return handle_raz_wi(regs, regidx, cp32.read, hsr, 1);
 
+#ifdef CONFIG_PARTIAL_EMULATION
+    /* DBGDTR[TR]XINT share the same encoding */
+    case HSR_CPREG32(DBGDTRTXINT):
+        if ( opt_partial_emulation )
+            return handle_raz_wi(regs, regidx, cp32.read, hsr, 0);
+#endif
+
     case HSR_CPREG32(DBGVCR):
     case HSR_CPREG32(DBGBVR0):
     case HSR_CPREG32(DBGBCR0):
@@ -659,10 +678,7 @@ void do_cp14_dbg(struct cpu_user_regs *regs, const union hsr hsr)
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


