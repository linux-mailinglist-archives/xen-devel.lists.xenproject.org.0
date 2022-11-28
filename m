Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C2063AD1B
	for <lists+xen-devel@lfdr.de>; Mon, 28 Nov 2022 16:58:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.449027.705677 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozgW2-00079u-9m; Mon, 28 Nov 2022 15:57:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 449027.705677; Mon, 28 Nov 2022 15:57:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ozgW2-00076S-53; Mon, 28 Nov 2022 15:57:54 +0000
Received: by outflank-mailman (input) for mailman id 449027;
 Mon, 28 Nov 2022 15:57:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xF6c=34=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1ozgW0-0004G7-6C
 for xen-devel@lists.xenproject.org; Mon, 28 Nov 2022 15:57:52 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20615.outbound.protection.outlook.com
 [2a01:111:f400:fe59::615])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68730767-6f35-11ed-8fd2-01056ac49cbb;
 Mon, 28 Nov 2022 16:57:50 +0100 (CET)
Received: from BN9PR03CA0065.namprd03.prod.outlook.com (2603:10b6:408:fc::10)
 by SA1PR12MB7410.namprd12.prod.outlook.com (2603:10b6:806:2b4::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.22; Mon, 28 Nov
 2022 15:57:47 +0000
Received: from BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fc:cafe::8a) by BN9PR03CA0065.outlook.office365.com
 (2603:10b6:408:fc::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23 via Frontend
 Transport; Mon, 28 Nov 2022 15:57:46 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT067.mail.protection.outlook.com (10.13.177.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5857.22 via Frontend Transport; Mon, 28 Nov 2022 15:57:46 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 28 Nov
 2022 09:57:44 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 28 Nov
 2022 07:57:43 -0800
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 28 Nov 2022 09:57:42 -0600
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
X-Inumbo-ID: 68730767-6f35-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mGFW6cPBE1ZdLsUH1LiW2ryf+Toxv3mECYZ1izfugv93zlpqwibm64QwcAsc/L/bLRw/keRFOKeRJsNQRZs/B3mKpPBKmGMS5yNzSpcatYCOw75PYLbQmY6z3fbv9ImzxUN8Ym0rSzlHW1WZ6Qpuw0tuwq5b0wNnLAfWi2wAM7ZzcTSOPa5J+u0nZNMOnycHtrHgCq+9E64ZHBtgCU6Goqqu2qhuiH6sHmbCmi2yMmq3BLIVHGN1lpg/Tk3f97fd3+TN/GPdSJYVNcgCh/HIAP8WHnwhsg/L0qoyvPsuvJoObxcw2b9mZAPwzNzlEP4CHCQOTaAuIhXDLFNSjkiaHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dqx0a48FA+ehf5uHjfytDEa1WxcEZ3LXfIN0HJxb6Ic=;
 b=I91UICcX+OIQowQBhtum2vez+G4M6qg0rzvR4JXcc/aGtA3YZP832WIY0+waRVek2zNheZ8L4sg+3eDo1j2Icsdb4DrB/DEHr7h085wnyLDkFsUDPOjnNPd7hu6qRd22zLNihLYY+8FL/aMn3IOcM7iuspGlWjS4l/fuWBkLFcY+wGHd4Cva2NfrbHxFi7zdXePbPufLs1ossNa5gd5/VhAZiXIWK1+XZr+qEZZ0BaG/U2hpB1K/e63FKa+FY99ogrum6Y6FseyarlHZpGPSKZZdC7E+UnJyZAI44f1Y3BomFG1PMYjzfnf8aurFDQZjCmJUw5arOgkkyW9it0ea6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dqx0a48FA+ehf5uHjfytDEa1WxcEZ3LXfIN0HJxb6Ic=;
 b=d6BPCxTU7bKWRa3TpoLjWQbzCotxNIZK6sk6PQq9XVLyWBmn+km1wWF1waZEDtZFnxSIH7JezMebsmu+AtfpsyYd3gjo0N3KNm3llwxGxwBStPh34Qyj9AhO5Mgxi/oxPAZBStB0Z7dT4MKTOvkfQG2wv6NY/1Nybo3NiOSCHJ4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <jgrall@amazon.com>, <burzalodowa@gmail.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>
Subject: [XEN v4 07/11] xen/Arm: GICv3: Define ICH_LR<n>_EL2 on AArch32
Date: Mon, 28 Nov 2022 15:56:45 +0000
Message-ID: <20221128155649.31386-8-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221128155649.31386-1-ayan.kumar.halder@amd.com>
References: <20221128155649.31386-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT067:EE_|SA1PR12MB7410:EE_
X-MS-Office365-Filtering-Correlation-Id: 216a4860-0c59-4336-c0d1-08dad1594acd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0eNKKoBQ6wMnC4muG6I58lXc1wxPx4FmHi2O/nnLR0InFtTbS+529uPLeOAKJnrPyP36slvFXhG2IpHhpy+OeJGF0jqbMGMh6bHb/NOKjLw6/LOjbw6KlP0MhQs/to9tpxAuh42yeZnedEP7JlbXB1RsE7CWjIucWxhSKPGZ8UJWcvYYFYtpUGT8/07UEF8POX+Y4fYvOjHsbLDYxNQgLqzEoNmg6bSpjQgXugZOdNJZa1ngMYWq9pqwRT2jgpeXpu4KatN40Kb3u13JF4NYrCnRrf0PN6yRltUZLKb6oUt8dyhotrNVkP4WThNqu73tAKgpF+NFs9cSVA6EWM+EReTWwB6r7/3VRxwgiB5Gkec8mMQ+rf/Gk2JcSRlE/SMvRF2uNQyHuNbRIrvKA8bL+EIhO27bThwCa251I6kNcPoan2NKKspaOu3VUWQAvdhJOxvsHc8MbBx06V+DxtiC5/4euKIWHc7mEuBmMSZWnJ7rxGfZrlmAYc+1ZimUyEh3jc64Vz2Ta+c0ZFjMRckmkZcKhVF6+408EaOZOytcbXZeGG+O61R6Twb73nedd/wvafenBgeJJH69x55jBvL3P5Y/1NCrpzZ9Sb89DvaOsEqDFKMh4gQSX95TGoL1dhnmrda8cRoJO09bh15e7JLgsaXgoTXPRrO6ydTzbcVkgd63V/kb21mDJanx5edb3zX8nUXpDNQ1ll/GCBjKrjN51wRueM4ld2DOqEbvOLh8Ljs=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(396003)(376002)(136003)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(82310400005)(356005)(36756003)(81166007)(40480700001)(478600001)(82740400003)(26005)(41300700001)(70586007)(8676002)(70206006)(40460700003)(86362001)(54906003)(6916009)(4326008)(316002)(30864003)(103116003)(8936002)(5660300002)(426003)(336012)(186003)(2616005)(1076003)(47076005)(83380400001)(2906002)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 15:57:46.3326
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 216a4860-0c59-4336-c0d1-08dad1594acd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7410

Refer "Arm IHI 0069H ID020922", 12.4.6, Interrupt Controller List Registers

AArch64 System register ICH_LR<n>_EL2 bits [31:0] are architecturally
mapped to AArch32 System register ICH_LR<n>[31:0].
AArch64 System register ICH_LR<n>_EL2 bits [63:32] are architecturally
mapped to AArch32 System register ICH_LRC<n>[31:0].

Defined ICH_LR<0...15>_EL2 and ICH_LRC<0...15>_EL2 for AArch32.
For AArch32, the link register is stored as :-
(((uint64_t) ICH_LRC<0...15>_EL2) << 32) | ICH_LR<0...15>_EL2

Also, ICR_LR macros need to be modified as ULL is 64 bits for AArch32 and
AArch64.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---

Changes from :-
v1 - 1. Moved the coproc register definitions to asm/cpregs.h.
2. Use GENMASK(31, 0) to represent 0xFFFFFFFF
3. Use READ_CP32()/WRITE_CP32() instead of READ_SYSREG()/WRITE_SYSREG().
4. Multi-line macro definitions should be enclosed within ({ }).

v2 - 1. Use WRITE_SYSREG_LR(V, R) to make it consistent with before.
2. Defined the register alias.
3. Style issues.

v3 - 1. Addressed style issues.

 xen/arch/arm/gic-v3.c                    | 132 +++++++++++------------
 xen/arch/arm/include/asm/arm32/sysregs.h |  19 ++++
 xen/arch/arm/include/asm/arm64/sysregs.h |   5 +
 xen/arch/arm/include/asm/cpregs.h        |  76 +++++++++++++
 xen/arch/arm/include/asm/gic_v3_defs.h   |   8 +-
 5 files changed, 170 insertions(+), 70 deletions(-)

diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 64a76307dd..6457e7033c 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -73,37 +73,37 @@ static inline void gicv3_save_lrs(struct vcpu *v)
     switch ( gicv3_info.nr_lrs )
     {
     case 16:
-        v->arch.gic.v3.lr[15] = READ_SYSREG(ICH_LR15_EL2);
+        v->arch.gic.v3.lr[15] = READ_SYSREG_LR(15);
     case 15:
-        v->arch.gic.v3.lr[14] = READ_SYSREG(ICH_LR14_EL2);
+        v->arch.gic.v3.lr[14] = READ_SYSREG_LR(14);
     case 14:
-        v->arch.gic.v3.lr[13] = READ_SYSREG(ICH_LR13_EL2);
+        v->arch.gic.v3.lr[13] = READ_SYSREG_LR(13);
     case 13:
-        v->arch.gic.v3.lr[12] = READ_SYSREG(ICH_LR12_EL2);
+        v->arch.gic.v3.lr[12] = READ_SYSREG_LR(12);
     case 12:
-        v->arch.gic.v3.lr[11] = READ_SYSREG(ICH_LR11_EL2);
+        v->arch.gic.v3.lr[11] = READ_SYSREG_LR(11);
     case 11:
-        v->arch.gic.v3.lr[10] = READ_SYSREG(ICH_LR10_EL2);
+        v->arch.gic.v3.lr[10] = READ_SYSREG_LR(10);
     case 10:
-        v->arch.gic.v3.lr[9] = READ_SYSREG(ICH_LR9_EL2);
+        v->arch.gic.v3.lr[9] = READ_SYSREG_LR(9);
     case 9:
-        v->arch.gic.v3.lr[8] = READ_SYSREG(ICH_LR8_EL2);
+        v->arch.gic.v3.lr[8] = READ_SYSREG_LR(8);
     case 8:
-        v->arch.gic.v3.lr[7] = READ_SYSREG(ICH_LR7_EL2);
+        v->arch.gic.v3.lr[7] = READ_SYSREG_LR(7);
     case 7:
-        v->arch.gic.v3.lr[6] = READ_SYSREG(ICH_LR6_EL2);
+        v->arch.gic.v3.lr[6] = READ_SYSREG_LR(6);
     case 6:
-        v->arch.gic.v3.lr[5] = READ_SYSREG(ICH_LR5_EL2);
+        v->arch.gic.v3.lr[5] = READ_SYSREG_LR(5);
     case 5:
-        v->arch.gic.v3.lr[4] = READ_SYSREG(ICH_LR4_EL2);
+        v->arch.gic.v3.lr[4] = READ_SYSREG_LR(4);
     case 4:
-        v->arch.gic.v3.lr[3] = READ_SYSREG(ICH_LR3_EL2);
+        v->arch.gic.v3.lr[3] = READ_SYSREG_LR(3);
     case 3:
-        v->arch.gic.v3.lr[2] = READ_SYSREG(ICH_LR2_EL2);
+        v->arch.gic.v3.lr[2] = READ_SYSREG_LR(2);
     case 2:
-        v->arch.gic.v3.lr[1] = READ_SYSREG(ICH_LR1_EL2);
+        v->arch.gic.v3.lr[1] = READ_SYSREG_LR(1);
     case 1:
-         v->arch.gic.v3.lr[0] = READ_SYSREG(ICH_LR0_EL2);
+         v->arch.gic.v3.lr[0] = READ_SYSREG_LR(0);
          break;
     default:
          BUG();
@@ -120,37 +120,37 @@ static inline void gicv3_restore_lrs(const struct vcpu *v)
     switch ( gicv3_info.nr_lrs )
     {
     case 16:
-        WRITE_SYSREG(v->arch.gic.v3.lr[15], ICH_LR15_EL2);
+        WRITE_SYSREG_LR(v->arch.gic.v3.lr[15], 15);
     case 15:
-        WRITE_SYSREG(v->arch.gic.v3.lr[14], ICH_LR14_EL2);
+        WRITE_SYSREG_LR(v->arch.gic.v3.lr[14], 14);
     case 14:
-        WRITE_SYSREG(v->arch.gic.v3.lr[13], ICH_LR13_EL2);
+        WRITE_SYSREG_LR(v->arch.gic.v3.lr[13], 13);
     case 13:
-        WRITE_SYSREG(v->arch.gic.v3.lr[12], ICH_LR12_EL2);
+        WRITE_SYSREG_LR(v->arch.gic.v3.lr[12], 12);
     case 12:
-        WRITE_SYSREG(v->arch.gic.v3.lr[11], ICH_LR11_EL2);
+        WRITE_SYSREG_LR(v->arch.gic.v3.lr[11], 11);
     case 11:
-        WRITE_SYSREG(v->arch.gic.v3.lr[10], ICH_LR10_EL2);
+        WRITE_SYSREG_LR(v->arch.gic.v3.lr[10], 10);
     case 10:
-        WRITE_SYSREG(v->arch.gic.v3.lr[9], ICH_LR9_EL2);
+        WRITE_SYSREG_LR(v->arch.gic.v3.lr[9], 9);
     case 9:
-        WRITE_SYSREG(v->arch.gic.v3.lr[8], ICH_LR8_EL2);
+        WRITE_SYSREG_LR(v->arch.gic.v3.lr[8], 8);
     case 8:
-        WRITE_SYSREG(v->arch.gic.v3.lr[7], ICH_LR7_EL2);
+        WRITE_SYSREG_LR(v->arch.gic.v3.lr[7], 7);
     case 7:
-        WRITE_SYSREG(v->arch.gic.v3.lr[6], ICH_LR6_EL2);
+        WRITE_SYSREG_LR(v->arch.gic.v3.lr[6], 6);
     case 6:
-        WRITE_SYSREG(v->arch.gic.v3.lr[5], ICH_LR5_EL2);
+        WRITE_SYSREG_LR(v->arch.gic.v3.lr[5], 5);
     case 5:
-        WRITE_SYSREG(v->arch.gic.v3.lr[4], ICH_LR4_EL2);
+        WRITE_SYSREG_LR(v->arch.gic.v3.lr[4], 4);
     case 4:
-        WRITE_SYSREG(v->arch.gic.v3.lr[3], ICH_LR3_EL2);
+        WRITE_SYSREG_LR(v->arch.gic.v3.lr[3], 3);
     case 3:
-        WRITE_SYSREG(v->arch.gic.v3.lr[2], ICH_LR2_EL2);
+        WRITE_SYSREG_LR(v->arch.gic.v3.lr[2], 2);
     case 2:
-        WRITE_SYSREG(v->arch.gic.v3.lr[1], ICH_LR1_EL2);
+        WRITE_SYSREG_LR(v->arch.gic.v3.lr[1], 1);
     case 1:
-        WRITE_SYSREG(v->arch.gic.v3.lr[0], ICH_LR0_EL2);
+        WRITE_SYSREG_LR(v->arch.gic.v3.lr[0], 0);
         break;
     default:
          BUG();
@@ -161,22 +161,22 @@ static uint64_t gicv3_ich_read_lr(int lr)
 {
     switch ( lr )
     {
-    case 0: return READ_SYSREG(ICH_LR0_EL2);
-    case 1: return READ_SYSREG(ICH_LR1_EL2);
-    case 2: return READ_SYSREG(ICH_LR2_EL2);
-    case 3: return READ_SYSREG(ICH_LR3_EL2);
-    case 4: return READ_SYSREG(ICH_LR4_EL2);
-    case 5: return READ_SYSREG(ICH_LR5_EL2);
-    case 6: return READ_SYSREG(ICH_LR6_EL2);
-    case 7: return READ_SYSREG(ICH_LR7_EL2);
-    case 8: return READ_SYSREG(ICH_LR8_EL2);
-    case 9: return READ_SYSREG(ICH_LR9_EL2);
-    case 10: return READ_SYSREG(ICH_LR10_EL2);
-    case 11: return READ_SYSREG(ICH_LR11_EL2);
-    case 12: return READ_SYSREG(ICH_LR12_EL2);
-    case 13: return READ_SYSREG(ICH_LR13_EL2);
-    case 14: return READ_SYSREG(ICH_LR14_EL2);
-    case 15: return READ_SYSREG(ICH_LR15_EL2);
+    case 0: return READ_SYSREG_LR(0);
+    case 1: return READ_SYSREG_LR(1);
+    case 2: return READ_SYSREG_LR(2);
+    case 3: return READ_SYSREG_LR(3);
+    case 4: return READ_SYSREG_LR(4);
+    case 5: return READ_SYSREG_LR(5);
+    case 6: return READ_SYSREG_LR(6);
+    case 7: return READ_SYSREG_LR(7);
+    case 8: return READ_SYSREG_LR(8);
+    case 9: return READ_SYSREG_LR(9);
+    case 10: return READ_SYSREG_LR(10);
+    case 11: return READ_SYSREG_LR(11);
+    case 12: return READ_SYSREG_LR(12);
+    case 13: return READ_SYSREG_LR(13);
+    case 14: return READ_SYSREG_LR(14);
+    case 15: return READ_SYSREG_LR(15);
     default:
         BUG();
     }
@@ -187,52 +187,52 @@ static void gicv3_ich_write_lr(int lr, uint64_t val)
     switch ( lr )
     {
     case 0:
-        WRITE_SYSREG(val, ICH_LR0_EL2);
+        WRITE_SYSREG_LR(val, 0);
         break;
     case 1:
-        WRITE_SYSREG(val, ICH_LR1_EL2);
+        WRITE_SYSREG_LR(val, 1);
         break;
     case 2:
-        WRITE_SYSREG(val, ICH_LR2_EL2);
+        WRITE_SYSREG_LR(val, 2);
         break;
     case 3:
-        WRITE_SYSREG(val, ICH_LR3_EL2);
+        WRITE_SYSREG_LR(val, 3);
         break;
     case 4:
-        WRITE_SYSREG(val, ICH_LR4_EL2);
+        WRITE_SYSREG_LR(val, 4);
         break;
     case 5:
-        WRITE_SYSREG(val, ICH_LR5_EL2);
+        WRITE_SYSREG_LR(val, 5);
         break;
     case 6:
-        WRITE_SYSREG(val, ICH_LR6_EL2);
+        WRITE_SYSREG_LR(val, 6);
         break;
     case 7:
-        WRITE_SYSREG(val, ICH_LR7_EL2);
+        WRITE_SYSREG_LR(val, 7);
         break;
     case 8:
-        WRITE_SYSREG(val, ICH_LR8_EL2);
+        WRITE_SYSREG_LR(val, 8);
         break;
     case 9:
-        WRITE_SYSREG(val, ICH_LR9_EL2);
+        WRITE_SYSREG_LR(val, 9);
         break;
     case 10:
-        WRITE_SYSREG(val, ICH_LR10_EL2);
+        WRITE_SYSREG_LR(val, 10);
         break;
     case 11:
-        WRITE_SYSREG(val, ICH_LR11_EL2);
+        WRITE_SYSREG_LR(val, 11);
         break;
     case 12:
-        WRITE_SYSREG(val, ICH_LR12_EL2);
+        WRITE_SYSREG_LR(val, 12);
         break;
     case 13:
-        WRITE_SYSREG(val, ICH_LR13_EL2);
+        WRITE_SYSREG_LR(val, 13);
         break;
     case 14:
-        WRITE_SYSREG(val, ICH_LR14_EL2);
+        WRITE_SYSREG_LR(val, 14);
         break;
     case 15:
-        WRITE_SYSREG(val, ICH_LR15_EL2);
+        WRITE_SYSREG_LR(val, 15);
         break;
     default:
         return;
@@ -417,12 +417,12 @@ static void gicv3_dump_state(const struct vcpu *v)
     if ( v == current )
     {
         for ( i = 0; i < gicv3_info.nr_lrs; i++ )
-            printk("   HW_LR[%d]=%lx\n", i, gicv3_ich_read_lr(i));
+            printk("   HW_LR[%d]=%" PRIx64 "\n", i, gicv3_ich_read_lr(i));
     }
     else
     {
         for ( i = 0; i < gicv3_info.nr_lrs; i++ )
-            printk("   VCPU_LR[%d]=%lx\n", i, v->arch.gic.v3.lr[i]);
+            printk("   VCPU_LR[%d]=%" PRIx64 "\n", i, v->arch.gic.v3.lr[i]);
     }
 }
 
diff --git a/xen/arch/arm/include/asm/arm32/sysregs.h b/xen/arch/arm/include/asm/arm32/sysregs.h
index 6841d5de43..22871999af 100644
--- a/xen/arch/arm/include/asm/arm32/sysregs.h
+++ b/xen/arch/arm/include/asm/arm32/sysregs.h
@@ -62,6 +62,25 @@
 #define READ_SYSREG(R...)       READ_SYSREG32(R)
 #define WRITE_SYSREG(V, R...)   WRITE_SYSREG32(V, R)
 
+/* Wrappers for accessing interrupt controller list registers. */
+#define ICH_LR_REG(index)       ICH_LR ## index ## _EL2
+#define ICH_LRC_REG(index)      ICH_LRC ## index ## _EL2
+
+#define READ_SYSREG_LR(index) ({                            \
+    uint64_t _val;                                          \
+    uint32_t _lrc = READ_CP32(ICH_LRC_REG(index));          \
+    uint32_t _lr = READ_CP32(ICH_LR_REG(index));            \
+                                                            \
+    _val = ((uint64_t) _lrc << 32) | _lr;                   \
+    _val;                                                   \
+})
+
+#define WRITE_SYSREG_LR(v, index) ({                        \
+    uint64_t _val = (v);                                    \
+    WRITE_CP32(_val & GENMASK(31, 0), ICH_LR_REG(index));   \
+    WRITE_CP32(_val >> 32, ICH_LRC_REG(index));             \
+})
+
 /* MVFR2 is not defined on ARMv7 */
 #define MVFR2_MAYBE_UNDEFINED
 
diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
index 54670084c3..4638999514 100644
--- a/xen/arch/arm/include/asm/arm64/sysregs.h
+++ b/xen/arch/arm/include/asm/arm64/sysregs.h
@@ -472,6 +472,11 @@
 #define READ_SYSREG(name)     READ_SYSREG64(name)
 #define WRITE_SYSREG(v, name) WRITE_SYSREG64(v, name)
 
+/* Wrappers for accessing interrupt controller list registers. */
+#define ICH_LR_REG(index)          ICH_LR ## index ## _EL2
+#define WRITE_SYSREG_LR(v, index)  WRITE_SYSREG(v, ICH_LR_REG(index))
+#define READ_SYSREG_LR(index)      READ_SYSREG(ICH_LR_REG(index))
+
 #endif /* _ASM_ARM_ARM64_SYSREGS_H */
 
 /*
diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
index 6daf2b1a30..b85e811f51 100644
--- a/xen/arch/arm/include/asm/cpregs.h
+++ b/xen/arch/arm/include/asm/cpregs.h
@@ -8,6 +8,8 @@
  * support 32-bit guests.
  */
 
+#define ___CP32(coproc, opc1, crn, crm, opc2) coproc, opc1, crn, crm, opc2
+
 #define __HSR_CPREG_c0  0
 #define __HSR_CPREG_c1  1
 #define __HSR_CPREG_c2  2
@@ -259,6 +261,48 @@
 #define VBAR            p15,0,c12,c0,0  /* Vector Base Address Register */
 #define HVBAR           p15,4,c12,c0,0  /* Hyp. Vector Base Address Register */
 
+/* CP15 CR12: Interrupt Controller List Registers, n = 0 - 15 */
+#define __LR0(x)        ___CP32(p15, 4, c12, c12, x)
+#define __LR8(x)        ___CP32(p15, 4, c12, c13, x)
+
+#define ICH_LR0         __LR0(0)
+#define ICH_LR1         __LR0(1)
+#define ICH_LR2         __LR0(2)
+#define ICH_LR3         __LR0(3)
+#define ICH_LR4         __LR0(4)
+#define ICH_LR5         __LR0(5)
+#define ICH_LR6         __LR0(6)
+#define ICH_LR7         __LR0(7)
+#define ICH_LR8         __LR8(0)
+#define ICH_LR9         __LR8(1)
+#define ICH_LR10        __LR8(2)
+#define ICH_LR11        __LR8(3)
+#define ICH_LR12        __LR8(4)
+#define ICH_LR13        __LR8(5)
+#define ICH_LR14        __LR8(6)
+#define ICH_LR15        __LR8(7)
+
+/* CP15 CR12: Interrupt Controller List Registers, n = 0 - 15 */
+#define __LRC0(x)       ___CP32(p15, 4, c12, c14, x)
+#define __LRC8(x)       ___CP32(p15, 4, c12, c15, x)
+
+#define ICH_LRC0        __LRC0(0)
+#define ICH_LRC1        __LRC0(1)
+#define ICH_LRC2        __LRC0(2)
+#define ICH_LRC3        __LRC0(3)
+#define ICH_LRC4        __LRC0(4)
+#define ICH_LRC5        __LRC0(5)
+#define ICH_LRC6        __LRC0(6)
+#define ICH_LRC7        __LRC0(7)
+#define ICH_LRC8        __LRC8(0)
+#define ICH_LRC9        __LRC8(1)
+#define ICH_LRC10       __LRC8(2)
+#define ICH_LRC11       __LRC8(3)
+#define ICH_LRC12       __LRC8(4)
+#define ICH_LRC13       __LRC8(5)
+#define ICH_LRC14       __LRC8(6)
+#define ICH_LRC15       __LRC8(7)
+
 /* CP15 CR13:  */
 #define FCSEIDR         p15,0,c13,c0,0  /* FCSE Process ID Register */
 #define CONTEXTIDR      p15,0,c13,c0,1  /* Context ID Register */
@@ -317,6 +361,38 @@
 #define HCR_EL2                 HCR
 #define HPFAR_EL2               HPFAR
 #define HSTR_EL2                HSTR
+#define ICH_LR0_EL2             ICH_LR0
+#define ICH_LR1_EL2             ICH_LR1
+#define ICH_LR2_EL2             ICH_LR2
+#define ICH_LR3_EL2             ICH_LR3
+#define ICH_LR4_EL2             ICH_LR4
+#define ICH_LR5_EL2             ICH_LR5
+#define ICH_LR6_EL2             ICH_LR6
+#define ICH_LR7_EL2             ICH_LR7
+#define ICH_LR8_EL2             ICH_LR8
+#define ICH_LR9_EL2             ICH_LR9
+#define ICH_LR10_EL2            ICH_LR10
+#define ICH_LR11_EL2            ICH_LR11
+#define ICH_LR12_EL2            ICH_LR12
+#define ICH_LR13_EL2            ICH_LR13
+#define ICH_LR14_EL2            ICH_LR14
+#define ICH_LR15_EL2            ICH_LR15
+#define ICH_LRC0_EL2            ICH_LRC0
+#define ICH_LRC1_EL2            ICH_LRC1
+#define ICH_LRC2_EL2            ICH_LRC2
+#define ICH_LRC3_EL2            ICH_LRC3
+#define ICH_LRC4_EL2            ICH_LRC4
+#define ICH_LRC5_EL2            ICH_LRC5
+#define ICH_LRC6_EL2            ICH_LRC6
+#define ICH_LRC7_EL2            ICH_LRC7
+#define ICH_LRC8_EL2            ICH_LRC8
+#define ICH_LRC9_EL2            ICH_LRC9
+#define ICH_LRC10_EL2           ICH_LRC10
+#define ICH_LRC11_EL2           ICH_LRC11
+#define ICH_LRC12_EL2           ICH_LRC12
+#define ICH_LRC13_EL2           ICH_LRC13
+#define ICH_LRC14_EL2           ICH_LRC14
+#define ICH_LRC15_EL2           ICH_LRC15
 #define ID_AFR0_EL1             ID_AFR0
 #define ID_DFR0_EL1             ID_DFR0
 #define ID_DFR1_EL1             ID_DFR1
diff --git a/xen/arch/arm/include/asm/gic_v3_defs.h b/xen/arch/arm/include/asm/gic_v3_defs.h
index 48a1bc401e..227533868f 100644
--- a/xen/arch/arm/include/asm/gic_v3_defs.h
+++ b/xen/arch/arm/include/asm/gic_v3_defs.h
@@ -185,9 +185,9 @@
 #define ICH_LR_HW_SHIFT              61
 #define ICH_LR_GRP_MASK              0x1
 #define ICH_LR_GRP_SHIFT             60
-#define ICH_LR_MAINTENANCE_IRQ       (1UL<<41)
-#define ICH_LR_GRP1                  (1UL<<60)
-#define ICH_LR_HW                    (1UL<<61)
+#define ICH_LR_MAINTENANCE_IRQ       (1ULL << 41)
+#define ICH_LR_GRP1                  (1ULL << 60)
+#define ICH_LR_HW                    (1ULL << 61)
 
 #define ICH_VTR_NRLRGS               0x3f
 #define ICH_VTR_PRIBITS_MASK         0x7
@@ -195,7 +195,7 @@
 
 #define ICH_SGI_IRQMODE_SHIFT        40
 #define ICH_SGI_IRQMODE_MASK         0x1
-#define ICH_SGI_TARGET_OTHERS        1UL
+#define ICH_SGI_TARGET_OTHERS        1ULL
 #define ICH_SGI_TARGET_LIST          0
 #define ICH_SGI_IRQ_SHIFT            24
 #define ICH_SGI_IRQ_MASK             0xf
-- 
2.17.1


