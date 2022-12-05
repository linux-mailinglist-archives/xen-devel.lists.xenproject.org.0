Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30518642ABF
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 15:55:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453838.711460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2CsA-0006KZ-Pa; Mon, 05 Dec 2022 14:55:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453838.711460; Mon, 05 Dec 2022 14:55:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2CsA-0006IC-Mc; Mon, 05 Dec 2022 14:55:10 +0000
Received: by outflank-mailman (input) for mailman id 453838;
 Mon, 05 Dec 2022 14:55:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NO0Y=4D=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p2Cs9-0006I4-Dv
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 14:55:09 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20612.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce740ee0-74ac-11ed-8fd2-01056ac49cbb;
 Mon, 05 Dec 2022 15:55:07 +0100 (CET)
Received: from BN9PR03CA0970.namprd03.prod.outlook.com (2603:10b6:408:109::15)
 by PH8PR12MB6962.namprd12.prod.outlook.com (2603:10b6:510:1bd::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Mon, 5 Dec
 2022 14:55:03 +0000
Received: from BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:109:cafe::3e) by BN9PR03CA0970.outlook.office365.com
 (2603:10b6:408:109::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Mon, 5 Dec 2022 14:55:03 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT058.mail.protection.outlook.com (10.13.177.58) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.14 via Frontend Transport; Mon, 5 Dec 2022 14:55:03 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Dec
 2022 07:28:13 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Dec
 2022 05:28:12 -0800
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 5 Dec 2022 07:28:11 -0600
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
X-Inumbo-ID: ce740ee0-74ac-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KgGwLNd5/+YSv5n0K32vNNJ0Sgp4XXj367FieZbFQF9QAYIciIE6PBh6QDLBHUoh3dbj7YFvQYUyLcXNbTsPmgn4XHLSi3MA2Nm+eBPmugigAg1n9iZ159veL5fB95P9Xu/2SnAov5ehKBrIQ9hHrjZoaXq/49fRBct8XcmNrI1ctu67bSFPWLardnlcao+kLG0ZJo3+NGIC4E9ajqgdI8sEj5//o/IKR0WGhYPHdObKb/mNc+sO3zr2X23btG6dj4cxS16G6Ad6Y/OLC8vLOeucy/dIlLXxsBAZOh2JEg8x9bmWlgo+KkSVlyAUMiUXUTnWLEH8eY/jrZ0TcyyYpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pitUdhtGNwCL78oKiSmhss6QoDqvkOn2pEZ1iZlgPEI=;
 b=Q1Lgog1PcEixEH+vX2q5M7hm50jkXWFVMLqz4b5PVRu+gSd7cb5wvW4zwCK9c5Cr8BHHz89V3k3bl6UX7vOyOrzQ3JWXWo2s6ZgAfGPhVDTv+rAQ3NdjmafGpDztSdeA4dJRZYxgNMfzezSwEzqJXWaq7gtrO6T2mvLDYQpiNjLCvo8y5JaEU7WwA4vLEiyO1FiE/wDymjDEt6G3eD7cdTla4cBQnTXgq0Qlg2KY2FWcW9t3Yf6IXyO0lWxVlTCFmEXJRYKVFzezzxXePKOeJXvkwbETwPfBDMlOFzDPy+/jufVOEEfdidzkL7S4K9yP9eMPc/DDZZ9JQJW9qesnKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pitUdhtGNwCL78oKiSmhss6QoDqvkOn2pEZ1iZlgPEI=;
 b=oZeof0KwOH9GZCbU0hTebZOsfU9KVzIdkJi+1wVnC1gKGiUqremkZfxJk/l/U1uepuRS2PUELOWIPaDosi0zR2MGUYK49eaxkktVP1htXwj8N0WIYmtuZCTbeUDeChPxSVFiYCpqkEikarN/Fz0OzVC6URkYRBCxTqBrZc0gUp8=
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
Subject: [XEN v5 07/11] xen/Arm: GICv3: Define ICH_LR<n>_EL2 on AArch32
Date: Mon, 5 Dec 2022 13:26:33 +0000
Message-ID: <20221205132637.26775-8-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221205132637.26775-1-ayan.kumar.halder@amd.com>
References: <20221205132637.26775-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT058:EE_|PH8PR12MB6962:EE_
X-MS-Office365-Filtering-Correlation-Id: 276fce4d-0e2b-426b-f189-08dad6d0b0fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zgcFa0pJxBzws6aenglcOYyaZOa2t7GjdWYTh7+KpBRRUdRz6IvFcABSsA8xEJ7weF9CGSpYYoYyaqH+XU/Ywpr9TKH46jrxO4v9zIEcVFIghsRM/zEkmY/SYbvBRPXZdywDpMdOb8VadylygpAz0KS7pBMdaQTshqInhWBqrW+rF8nkJT6T34UQKWsXfk1AGq5Ps3P7Gl4om/nlg2PfblrNokBDRwGXgZ7gaYVSg9BGl1PXCXKwOeBF1/9Sn0lw15P7BSoGLxSJUoS/lL5fvpODQadaLEK2oPGjD7pw/okWIfN1MI883ERZ2GRvhew+5I2vDlyLWoNAJ4O0SlkZ8HBs7O46HyC5y2Mq/+CL2wL6AQgUqG3ls/j+xD8CmaAQgdhbo1qESIbaH6rNy5FAUyp91rw3jSMhoej2AftcQBxXG3CKFD9eFtVTYr/skn7DTr0YI9SyYV2r6oJDbYukpaik70T9HAJ9B5UHqxoLN+NMzWezkcfaJ16/hrBFjnn6fUzAeFfUvAdYuwqRwTaMbHeHboUs4hW+mP1ibROCj/juqRPaaAh/Pg6/52asJGs1rUBU9d8n/jToVNKMu1B5hapkaFPuhnWsw1ZjmhSxU9zkrp/Vo60h/qnvoRj73tZjWdKoXH6wapfPDE9x8MuXUNsO4sPmZWplt1wke3AAchaVnWWU6bn9w8uFlMVeG/POqb5BORV15d1xtyDNmzFoyr32s1mhGn4BZ/4s3x9L2rE=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(136003)(396003)(451199015)(36840700001)(40470700004)(46966006)(82310400005)(36756003)(40480700001)(316002)(426003)(83380400001)(186003)(336012)(6916009)(1076003)(26005)(54906003)(6666004)(47076005)(86362001)(2906002)(103116003)(8676002)(70586007)(4326008)(36860700001)(70206006)(81166007)(82740400003)(40460700003)(478600001)(2616005)(356005)(30864003)(5660300002)(8936002)(41300700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 14:55:03.6655
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 276fce4d-0e2b-426b-f189-08dad6d0b0fa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6962

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

v4 - 1. Replaces ___CP32(foo) with foo.
2. Removed the definition of ___CP32().

 xen/arch/arm/gic-v3.c                    | 132 +++++++++++------------
 xen/arch/arm/include/asm/arm32/sysregs.h |  19 ++++
 xen/arch/arm/include/asm/arm64/sysregs.h |   5 +
 xen/arch/arm/include/asm/cpregs.h        |  74 +++++++++++++
 xen/arch/arm/include/asm/gic_v3_defs.h   |   8 +-
 5 files changed, 168 insertions(+), 70 deletions(-)

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
index 6daf2b1a30..7550fb25f5 100644
--- a/xen/arch/arm/include/asm/cpregs.h
+++ b/xen/arch/arm/include/asm/cpregs.h
@@ -259,6 +259,48 @@
 #define VBAR            p15,0,c12,c0,0  /* Vector Base Address Register */
 #define HVBAR           p15,4,c12,c0,0  /* Hyp. Vector Base Address Register */
 
+/* CP15 CR12: Interrupt Controller List Registers, n = 0 - 15 */
+#define __LR0(x)        p15, 4, c12, c12, x
+#define __LR8(x)        p15, 4, c12, c13, x
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
+#define __LRC0(x)       p15, 4, c12, c14, x
+#define __LRC8(x)       p15, 4, c12, c15, x
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
@@ -317,6 +359,38 @@
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


