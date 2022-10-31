Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7263D6139C4
	for <lists+xen-devel@lfdr.de>; Mon, 31 Oct 2022 16:14:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.433030.685908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opWUU-00023N-Ma; Mon, 31 Oct 2022 15:14:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 433030.685908; Mon, 31 Oct 2022 15:14:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1opWUU-0001zw-I5; Mon, 31 Oct 2022 15:14:18 +0000
Received: by outflank-mailman (input) for mailman id 433030;
 Mon, 31 Oct 2022 15:14:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7CAU=3A=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1opWUT-0001KF-7l
 for xen-devel@lists.xenproject.org; Mon, 31 Oct 2022 15:14:17 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id aec69855-592e-11ed-91b5-6bf2151ebd3b;
 Mon, 31 Oct 2022 16:14:16 +0100 (CET)
Received: from MW4PR04CA0059.namprd04.prod.outlook.com (2603:10b6:303:6a::34)
 by MN2PR12MB4269.namprd12.prod.outlook.com (2603:10b6:208:1d4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Mon, 31 Oct
 2022 15:14:13 +0000
Received: from CO1NAM11FT083.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6a:cafe::f6) by MW4PR04CA0059.outlook.office365.com
 (2603:10b6:303:6a::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.19 via Frontend
 Transport; Mon, 31 Oct 2022 15:14:13 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT083.mail.protection.outlook.com (10.13.174.92) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5769.14 via Frontend Transport; Mon, 31 Oct 2022 15:14:12 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 31 Oct
 2022 10:14:12 -0500
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Mon, 31 Oct 2022 10:14:10 -0500
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
X-Inumbo-ID: aec69855-592e-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a383IlnrjGROp5pgfaCK9jSVQJebHe9cCg7QlBvm/R0+gnLgwAT+nOvWikdgx7aqkcGIVdTSc/9XeD86BhiNcMUAnS0tI2RoOBFynxEkDG7bVgcV21mcLXXX6QDXUCPFSZq93bC1vHv/B5eVaKAQhhhm3JhE8T4Ce6KnBc82xz+EciPwFO5tJ9k4q19U0+NhDjFYMSDX15uVJTHy6v3sPU66L+r5tsmudj+9m6gXtTSEucupk1ew2D3lK7y4z4aVeBte8GdDbTvKjBMGTqSiV7i3JPzEb3btwUUCI3SPKBJ/7o89iikYXNt6VOppF/SnPCGuWbJwrpCYjXLSxbVY+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jlEwmM1DJQevh7CK2V8wbq196nWQmioDOKQj3/Ylp8c=;
 b=GvUKvXmlBmi+WHAf606cj3tYuiG3zi2NfTcaEH1ms98KBxABuNN4wuBfcVQBCbEKRV1Lv73mWoRARjdff0cOXuncYbEpEi353EwDWNP2LJKTWVO7JKe2ztLclf29tcTo6h9gTfCRiOx15i8As9/dS3z7pKdv3wlo7sE2bfzQWDw2kNccqKXPy4ojHST2Nbk0VPkWIuYIYMd2iENn7aEtAT9mW+n8wuPTJXybZcekWhKLyAB1WouY+6Ge9eA2Sd/3wQ9JjLVjZScb/5QGY31l2QaA/SKMjookbFwRMFaoIOs8styLZdM63MG5kU66H49niI7NL3TqaJFzUnWczr7ktg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jlEwmM1DJQevh7CK2V8wbq196nWQmioDOKQj3/Ylp8c=;
 b=up8JLIApAe+Ewr+aTNh+ZMoexY/op7TmOhTAznQbAr193RNwVDaj3sZGmCEZ3/QrP14sJ9mrr0viBOwY3gU2tQwnIL9yvh8EEsdW32cAXUW8eVJNO11+0wiUOmCz007X9YyzQbiH2Mq9HPNs2iJt3vD7lq1+FFhFfIVmmelmSzo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayankuma@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<burzalodowa@gmail.com>, Ayan Kumar Halder <ayankuma@amd.com>
Subject: [XEN v2 08/12] xen/Arm: GICv3: Define ICH_AP0R<n> and ICH_AP1R<n> for AArch32
Date: Mon, 31 Oct 2022 15:13:22 +0000
Message-ID: <20221031151326.22634-9-ayankuma@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221031151326.22634-1-ayankuma@amd.com>
References: <20221031151326.22634-1-ayankuma@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT083:EE_|MN2PR12MB4269:EE_
X-MS-Office365-Filtering-Correlation-Id: 41a2843c-d5d2-4c25-76c8-08dabb52919b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LUy5XsyIYlw1JIDWF55/M47+iXBehf3BfeMvc22vii0DQSz4tplkBrcaVchEQnBlVxRdt8XS+tJZutIfSHy6nLyhHV9VScfWRwxQZq9kySd0Xp90pKQVuki+kFf3h1j1um13VQ3nqiInFw7tUjX1T8ilQ84iIoBaBsONcLbiM4CdB1jYLMZI0B1y9JXGTblh6od9wov1QLNscxbfIkNERdal/qiAsXIYef4NrbND+AzGhoHP0gQbw8X3djtytoHaUhnUyDQRwxt0hrgUoYnyeuMNDW4IkzXTulLxXqG7KcieX/CxZpggXKs+EJ2EJ/5n3Rp8moy/1NbSxnEWw3r2xMPdDJjaN3zt0M7sod0N8rRbm74wCba8i1Ke3ja7TJfz0+v/x88NOWjRhD29dlJ2RYVUmdBj8q+4TCH6t84MwuVtY4qw/wFJAQvBTuoE634WNFbko7r0DezHHk5YwmGxIt8hOf9xoCV+ulZPv8cyNjfRNF7OrZMZaNDDE1WV9vWWR8QAAHtt/Wd+8vbyQgic0M1OMqhBK/cEpYTZdZcJBeMFEP8Elvay0Hu5KXOUOaPqtjN/nEgT7/TGYZ7nzP/SpTr+AqVZqCEqEeNSlZ/JB5b8U9EqPeMMMQOAvKTocfClO46+XPr2adLfKJNoBausCCX64lKef3lQVWoxqQtQuzyJAl66KkJ7qHF2cdOkiTfuLlfKTFjNHzBr0RF4i5CXb8F1PUxGeyZaO9UnLGs0g4XMc5QvNSewU2s3d9soiVKdCKHALC8buEwBFzYdb09sJsW0+LeVjHkZWmj//yVIRLAtnEQPhX3guqeuxKEpeCO0
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199015)(40470700004)(46966006)(36840700001)(478600001)(6666004)(82310400005)(316002)(54906003)(26005)(6916009)(40480700001)(36860700001)(82740400003)(47076005)(2616005)(336012)(186003)(1076003)(36756003)(83380400001)(356005)(81166007)(40460700003)(426003)(2906002)(4326008)(8676002)(70586007)(70206006)(41300700001)(8936002)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2022 15:14:12.9381
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a2843c-d5d2-4c25-76c8-08dabb52919b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT083.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4269

Refer "Arm IHI 0069H ID020922",
12.7.1 - Interrupt Controller Hyp Active Priorities Group0 Registers 0-3
12.7.2 - Interrupt Controller Hyp Active Priorities Group1 Registers 0-3

Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
---

Changes from :-
v1 - 1. Moved coproc register definition to asm/cpregs.h.

 xen/arch/arm/include/asm/arm32/sysregs.h |  1 -
 xen/arch/arm/include/asm/cpregs.h        | 11 +++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/arm32/sysregs.h b/xen/arch/arm/include/asm/arm32/sysregs.h
index 8a9a014bef..1b2915a526 100644
--- a/xen/arch/arm/include/asm/arm32/sysregs.h
+++ b/xen/arch/arm/include/asm/arm32/sysregs.h
@@ -81,7 +81,6 @@
 
 /* MVFR2 is not defined on ARMv7 */
 #define MVFR2_MAYBE_UNDEFINED
-
 #endif /* __ASSEMBLY__ */
 
 #endif /* __ASM_ARM_ARM32_SYSREGS_H */
diff --git a/xen/arch/arm/include/asm/cpregs.h b/xen/arch/arm/include/asm/cpregs.h
index 4421dd49ac..bfabee0bc3 100644
--- a/xen/arch/arm/include/asm/cpregs.h
+++ b/xen/arch/arm/include/asm/cpregs.h
@@ -404,6 +404,17 @@
 #define ICH_LRC14_EL2              __LRC8_EL2(6)
 #define ICH_LRC15_EL2              __LRC8_EL2(7)
 
+#define __AP0Rx_EL2(x)            ___CP32(p15,4,c12,c8,x)
+#define ICH_AP0R0_EL2             __AP0Rx_EL2(0)
+#define ICH_AP0R1_EL2             __AP0Rx_EL2(1)
+#define ICH_AP0R2_EL2             __AP0Rx_EL2(2)
+#define ICH_AP0R3_EL2             __AP0Rx_EL2(3)
+
+#define __AP1Rx_EL2(x)            ___CP32(p15,4,c12,c9,x)
+#define ICH_AP1R0_EL2             __AP1Rx_EL2(0)
+#define ICH_AP1R1_EL2             __AP1Rx_EL2(1)
+#define ICH_AP1R2_EL2             __AP1Rx_EL2(2)
+#define ICH_AP1R3_EL2             __AP1Rx_EL2(3)
 #endif
 
 #endif
-- 
2.17.1


