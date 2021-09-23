Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CFA415DBE
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:03:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193816.345282 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNS3-0005w7-Hx; Thu, 23 Sep 2021 12:03:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193816.345282; Thu, 23 Sep 2021 12:03:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNS3-0005tE-Di; Thu, 23 Sep 2021 12:03:43 +0000
Received: by outflank-mailman (input) for mailman id 193816;
 Thu, 23 Sep 2021 12:03:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fewu=ON=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTNS1-0005KP-UE
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:03:41 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.49]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0a1bd4d9-cb2e-4520-945d-6a3fa9f0c920;
 Thu, 23 Sep 2021 12:03:36 +0000 (UTC)
Received: from AS8PR04CA0176.eurprd04.prod.outlook.com (2603:10a6:20b:331::31)
 by DU2PR08MB7255.eurprd08.prod.outlook.com (2603:10a6:10:2d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 12:03:34 +0000
Received: from VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:331:cafe::b6) by AS8PR04CA0176.outlook.office365.com
 (2603:10a6:20b:331::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:34 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by VE1EUR03FT053.mail.protection.outlook.com (10.152.19.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:03:34 +0000
Received: ("Tessian outbound 8b24208353e0:v103");
 Thu, 23 Sep 2021 12:03:30 +0000
Received: from ae303b40b6ee.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4F78024A-3A30-4E5E-9C73-E80203E1249C.1; 
 Thu, 23 Sep 2021 12:03:19 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ae303b40b6ee.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 12:03:19 +0000
Received: from DU2PR04CA0161.eurprd04.prod.outlook.com (2603:10a6:10:2b0::16)
 by PA4PR08MB6016.eurprd08.prod.outlook.com (2603:10a6:102:e3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 23 Sep
 2021 12:03:18 +0000
Received: from DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b0:cafe::82) by DU2PR04CA0161.outlook.office365.com
 (2603:10a6:10:2b0::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:18 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT026.mail.protection.outlook.com (10.152.20.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:03:18 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 12:03:12 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:10 +0000
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
X-Inumbo-ID: 0a1bd4d9-cb2e-4520-945d-6a3fa9f0c920
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYpFnlkmKkWIfrICpF9PJssjdhb8RblMf+bC222jYXo=;
 b=b1dYqPsaLbPvqLviSQLFGXLHi9ft/D1yAetHHVrqVT2Yjcgto5Uqk/Vmxx4o3DwXJ/GrjYesrJdEjhL4DUD5rR8ewwuZjtflaz21WAtgp+a+b+xNXY1Jc0N0JMyP0T7Zl02CGy0UBCqmusSimiEQ1GYU2dby6F589PfyoP6UyaU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4bb2a889a10d83d5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Je0JyCYcCahaXGSrIylgBYfOIHGv7kRCbedNWsePEU3KwaiV7Q2/OmUiTiCxNLMKr2T9vsESnKIiBfca33IfoTeWytocXYHr9jXoLcHupLpRGlTFo6Gm2TQq0NLjO8CAlM/Htr5yHZzz98uTPvIlSsv4/HLQvtSSi9kXjonC3oxmO6OuBzR7Fx3HzE5jf4UTkKnhIAdUuRS8g2/gyXLi9Vrom6xJFQ+6vR5y7HPpvrhDz1UbqChA1B+C/o4UD46TavLgAEoam+U21bTOG5+6VzTq1gu9pe0pw/dinapuVyk2yVIeWhp9Ae7t2riT3kL2WB2yp2HOSbGNBwwOPvdUtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=eYpFnlkmKkWIfrICpF9PJssjdhb8RblMf+bC222jYXo=;
 b=dwnJs9g00gRFCpbil5HynnImfid70D/qOqU02x/+EJ14TSidLGaBhZ8V+wpnIqA3334OHeCmOvkFCrSt8jM9RU6AFXVhJ3me6IV6NAtFHRC9t+axyqrQuet6ARLGBnm99pk1BO78CK4clnSlqzAzwJRzgOohT+XyBEfeGWD6qV1DGrHGJUTn+q0eyVeT/wzFxF35opK/mEUpyKIghXBvqtlUAy2X54NxnS0Q/MJpd6oYMESTUv+U1cwI5mpU6BLDXRjaJpfb9OgqMGH5LLLRbT7rlYWjXJqYAyYgtqi1VkB/xskkcM59Tyh9P4tc2ZOFfAravvQoDUmsrzk3x/wwRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYpFnlkmKkWIfrICpF9PJssjdhb8RblMf+bC222jYXo=;
 b=b1dYqPsaLbPvqLviSQLFGXLHi9ft/D1yAetHHVrqVT2Yjcgto5Uqk/Vmxx4o3DwXJ/GrjYesrJdEjhL4DUD5rR8ewwuZjtflaz21WAtgp+a+b+xNXY1Jc0N0JMyP0T7Zl02CGy0UBCqmusSimiEQ1GYU2dby6F589PfyoP6UyaU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <wei.chen@arm.com>, <xen-devel@lists.xenproject.org>,
	<sstabellini@kernel.org>, <julien@xen.org>
CC: <Bertrand.Marquis@arm.com>
Subject: [PATCH 02/37] xen: introduce a Kconfig option to configure NUMA nodes number
Date: Thu, 23 Sep 2021 20:02:01 +0800
Message-ID: <20210923120236.3692135-3-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923120236.3692135-1-wei.chen@arm.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c18f4d07-b7fc-4990-593b-08d97e8a2afb
X-MS-TrafficTypeDiagnostic: PA4PR08MB6016:|DU2PR08MB7255:
X-Microsoft-Antispam-PRVS:
	<DU2PR08MB7255CFF9D420EF63D9F979859EA39@DU2PR08MB7255.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 F81usdegP21yaQyztrp2wr38GQL4K/hHAit67QRV2UTmp2BIq5CcxIsbTyzGOiGDKUgFVbWZcAHdUxUdyVX7YkqLhfxEy7HAAdm0QwDkK5Q72HI0S5wieAH1ug9uhSNCYw1jDzzRxg0u65y5Mm8Ay8Eo3hzqL20g1WK/EoWs8K5HyCpKjxD4t/4CAKEPCswRtp44tpZ9fjEWO0EQNDYyw0CLPtcWSfoayt60AYIpbO94whGd70QZMjoW5U1OS42rXYSdrUa/kGMryvoWWP3BrCN/PWL2uxj3x3FYwO/VJ1LuQ/uYmk3F+NhyHi2DmHnz9F+VlJApXwVy45QK6mSH7OiNIOrj6yzNhPnUSjfm3YbV91UI3+1VizyuDtVTaDs8UeYnFYqsrQsI7nTBFbsPJbNokSybPrsS8lDwqWyjD8c9r1ERPKz/bBHpf8B4Qsji99lvRlFiUxkuytgPwi18eOUKAIriW4DL/c1pRRHBUr2vWEWevAutDOXxdmDMCsD3t4aQ3zWEGfGtfk57Ac4zS1SvAfrRCZn6jbOFUQ5D9PhIEwDC3GII3ygGV+YPrNAoOILiDg1Hs1lkrSlr6iAJeC7ft1y1ye18qPh2plSR06ogSf9nd+2LICeVSiZT6TwcARbJk7GrFZlTPULkQ4SAvRKj++Gzk7JM7hecPKVRPAFuyp5ohDjjcnmBjiGbVD2EIhrrQKbCBJijWFec4naITnhzPvS0+6w0jlzUoPZbl3Y=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(2616005)(1076003)(26005)(44832011)(81166007)(86362001)(70586007)(4326008)(83380400001)(47076005)(6666004)(36860700001)(508600001)(336012)(82310400003)(356005)(110136005)(426003)(8676002)(8936002)(70206006)(186003)(316002)(5660300002)(36756003)(7696005)(2906002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6016
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	68dccb8a-de2f-41b9-5cc2-08d97e8a216f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5uY23spjg57uWBOSGRStNZnzN64CNb4URXzhjV6cyD9fhUy66RTkZEnr/Vaz2HUKKHsJpOFPKIAymPmvcWjz/Io+/GKZboVaIDhUZ658S1lh0uV70sS2/LGQtGwsqfjp2dSuFKowua+iJXbFKTw/fW7MDp3GG6wMmEWgChrXNTvtwqACumDzlvcBWyBTgznSKtRdRRyN0WRR5pau0ufkjcNR0p9aZNzvD2iNKXM5nTLcgtzJIOnSd3izcKGLoSnT4FNMBNPBMjjjk9bziMeLrJS7aQ2KWpDcYKfOSVV71NHe2qyZQH0bKx3rYc89pr5MoaWU0GUgTS37x4VGzs/qwdvJphf9r45kl9CYeB1XygypYzpwVjr0h9fXWdRlZjMyL/KCULddy1DQBkXkIACOAhZq5RtOwRBTaFj9mPpmtrR3Ur6Lfa/QzbhX2TBw4vDquBLSft8/SU+7bcLOoYTOqlJ9G/e7yjJOkvv9CLQKp7BbNnsYHry9KnF7D1aUOir3HqgEUxBQIpiY9kbljzhuPKfa6ONUUaFOp/K/qPG/2NXy1+QdicqIfvT+1vHc0nA/lSH7Mfu69oXDzFu8uoPyd5PSdBvi2lZNorLt69aZVGhxK4jD6tWLecFM/4Nc6yRu7KdHh+Vz+1i5apRLDdhP0RnaZvPkchyWGznxXwtHtHD6J6L9g5hbvjxto6Pw9W9gflAg2ha4xLtGk9Mya/UxfQ==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(5660300002)(70586007)(81166007)(7696005)(47076005)(2906002)(26005)(8936002)(82310400003)(86362001)(186003)(83380400001)(36756003)(6666004)(8676002)(2616005)(426003)(508600001)(336012)(4326008)(36860700001)(316002)(70206006)(44832011)(1076003)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:03:34.0269
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c18f4d07-b7fc-4990-593b-08d97e8a2afb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7255

Current NUMA nodes number is a hardcode configuration. This
configuration is difficult for an administrator to change
unless changing the code.

So in this patch, we introduce this new Kconfig option for
administrators to change NUMA nodes number conveniently.
Also considering that not all architectures support NUMA,
this Kconfig option only can be visible on NUMA enabled
architectures. Non-NUMA supported architectures can still
use 1 as MAX_NUMNODES.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/Kconfig           | 11 +++++++++++
 xen/include/asm-x86/numa.h |  2 --
 xen/include/xen/numa.h     | 10 +++++-----
 3 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/xen/arch/Kconfig b/xen/arch/Kconfig
index f16eb0df43..8a20da67ed 100644
--- a/xen/arch/Kconfig
+++ b/xen/arch/Kconfig
@@ -17,3 +17,14 @@ config NR_CPUS
 	  For CPU cores which support Simultaneous Multi-Threading or similar
 	  technologies, this the number of logical threads which Xen will
 	  support.
+
+config NR_NUMA_NODES
+	int "Maximum number of NUMA nodes supported"
+	range 1 4095
+	default "64"
+	depends on NUMA
+	help
+	  Controls the build-time size of various arrays and bitmaps
+	  associated with multiple-nodes management. It is the upper bound of
+	  the number of NUMA nodes the scheduler, memory allocation and other
+	  NUMA-aware components can handle.
diff --git a/xen/include/asm-x86/numa.h b/xen/include/asm-x86/numa.h
index bada2c0bb9..3cf26c2def 100644
--- a/xen/include/asm-x86/numa.h
+++ b/xen/include/asm-x86/numa.h
@@ -3,8 +3,6 @@
 
 #include <xen/cpumask.h>
 
-#define NODES_SHIFT 6
-
 typedef u8 nodeid_t;
 
 extern int srat_rev;
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 7aef1a88dc..52950a3150 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -3,14 +3,14 @@
 
 #include <asm/numa.h>
 
-#ifndef NODES_SHIFT
-#define NODES_SHIFT     0
-#endif
-
 #define NUMA_NO_NODE     0xFF
 #define NUMA_NO_DISTANCE 0xFF
 
-#define MAX_NUMNODES    (1 << NODES_SHIFT)
+#ifdef CONFIG_NR_NUMA_NODES
+#define MAX_NUMNODES CONFIG_NR_NUMA_NODES
+#else
+#define MAX_NUMNODES    1
+#endif
 
 #define vcpu_to_node(v) (cpu_to_node((v)->processor))
 
-- 
2.25.1


