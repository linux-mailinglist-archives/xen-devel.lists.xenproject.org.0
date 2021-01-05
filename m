Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C93B2EA5D6
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 08:21:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61744.108752 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwgdx-0006M0-2G; Tue, 05 Jan 2021 07:20:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61744.108752; Tue, 05 Jan 2021 07:20:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwgdw-0006LQ-TM; Tue, 05 Jan 2021 07:20:36 +0000
Received: by outflank-mailman (input) for mailman id 61744;
 Tue, 05 Jan 2021 07:20:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PMne=GI=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
 id 1kwgdu-0006Ky-W7
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 07:20:35 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.78]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b20d0647-4758-435b-adc7-0e86d1f077f1;
 Tue, 05 Jan 2021 07:20:32 +0000 (UTC)
Received: from DB6PR07CA0019.eurprd07.prod.outlook.com (2603:10a6:6:2d::29) by
 AM0PR08MB4177.eurprd08.prod.outlook.com (2603:10a6:208:132::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Tue, 5 Jan
 2021 07:20:30 +0000
Received: from DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2d:cafe::9f) by DB6PR07CA0019.outlook.office365.com
 (2603:10a6:6:2d::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.2 via Frontend
 Transport; Tue, 5 Jan 2021 07:20:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT057.mail.protection.outlook.com (10.152.20.235) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.21 via Frontend Transport; Tue, 5 Jan 2021 07:20:29 +0000
Received: ("Tessian outbound fc5cc0046d61:v71");
 Tue, 05 Jan 2021 07:20:29 +0000
Received: from f5756446b793.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 868CF6E0-E7D9-42DB-BA9F-C8CAFF6460F8.1; 
 Tue, 05 Jan 2021 07:20:14 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f5756446b793.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 05 Jan 2021 07:20:14 +0000
Received: from AM8P189CA0016.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:218::21)
 by DB7PR08MB3755.eurprd08.prod.outlook.com (2603:10a6:10:77::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19; Tue, 5 Jan
 2021 07:20:13 +0000
Received: from AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:218:cafe::e2) by AM8P189CA0016.outlook.office365.com
 (2603:10a6:20b:218::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20 via Frontend
 Transport; Tue, 5 Jan 2021 07:20:12 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT024.mail.protection.outlook.com (10.152.16.175) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3721.21 via Frontend Transport; Tue, 5 Jan 2021 07:20:11 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 5 Jan 2021
 07:20:00 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2044.4 via Frontend
 Transport; Tue, 5 Jan 2021 07:19:57 +0000
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
X-Inumbo-ID: b20d0647-4758-435b-adc7-0e86d1f077f1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3senGGhHMGiySIHILlSB+Z4Hs/Io4eSyk8AgHdDNgVI=;
 b=EvH7Tg9+qUOn4wweyzGQpESl349/rew1fn+KPkg8V4DlVrmoLKS43jrZty+j06pB3a5HwrND+B8SQcWca84L8yMLpzaqFkCOj0QLjhNFxXL40hDRLsSd464Cle0ivAJ5xzOYzfhFVOwF0flykLKZrX2sUCGSCIdyHUJE3nq/RRA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9c8db5e51b9a233d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=miFAdZR3rUTVJtwkV3m/iRktQftKU1W95PnXvv4w7+KKEVIWirT+Ev2BooTqu2UGKDiohdWyzxZUUJOngcw1E80FthMcoFMiepqk1TxBdiKzn4KPF3uU3O68a0Egd3OYp/R4/jYKC3ZavHntIkefb65No5xLY1OghFN8A6Ao2oCKM3NpoYO4dgL95YsJIGg2HwCDX8OWezsizCjSutIzufouGxrODfoupZKx0RGoW0DQDqC/7mYOe0FuXdUaTaFfi7CSk9Kk/PrCL8bCAzQOiFBMakEFUIZdg3l8NkPPOBxdElophWsa55kNYNvQ8sKdqgFQXN7Xmab6OmqgmZ9Faw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3senGGhHMGiySIHILlSB+Z4Hs/Io4eSyk8AgHdDNgVI=;
 b=ABSd/DgXMlXyQjMGcTFEMMMX8z63AacWBetncdKspz28Q3YZKeeZVTuMZYWQ/kcgLxPc3PbFzicBso09JhxZ0lLJOpQDwhWeZDBhAfRmaWyjvuFA0BpmyDpM2/Yg1/KaIXIwEHnyfg3y7+pcQDKfY0SdqeDpYh8HKH+b5fJIK3wXzAEs5Fl5jBvHE2WEG7UMVDudf8/X+CtDVL4xWA3ajXjk2UqVdOoXbY55JeKMgV2QbZ8Xyj2E2UyY0ZOHwKwovlVDbiqAXAVPnDAR2UPq6uvHV7u2ymh5QW+3s6dx4eB7NFUZQ0tgN3xDCHvcpdw03h5oiBQyRT4Mp2pzGYWNWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3senGGhHMGiySIHILlSB+Z4Hs/Io4eSyk8AgHdDNgVI=;
 b=EvH7Tg9+qUOn4wweyzGQpESl349/rew1fn+KPkg8V4DlVrmoLKS43jrZty+j06pB3a5HwrND+B8SQcWca84L8yMLpzaqFkCOj0QLjhNFxXL40hDRLsSd464Cle0ivAJ5xzOYzfhFVOwF0flykLKZrX2sUCGSCIdyHUJE3nq/RRA=
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
CC: <Bertrand.Marquis@arm.com>, <Penny.Zheng@arm.com>, <Jiamei.Xie@arm.com>,
	<nd@arm.com>
Subject: [PATCH 2/2] xen/arm: Add defensive barrier in get_cycles for Arm64
Date: Tue, 5 Jan 2021 15:19:46 +0800
Message-ID: <20210105071946.1971229-2-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105071946.1971229-1-wei.chen@arm.com>
References: <20210105071946.1971229-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6834fc4-a55c-4a43-8b80-08d8b14a61c9
X-MS-TrafficTypeDiagnostic: DB7PR08MB3755:|AM0PR08MB4177:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB4177BC179A40C3EC5D964F859ED10@AM0PR08MB4177.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 QVPTEJE8VxSYzOG6x4ilLk9s7CFLRdUzMwjnLHlGsmAhbuCHnmak/Xe/itXjCZSzSqBBCldF2O43RfQmF5S5hCaLGU5MiAAYpCMgTxNYdNBkYJzgMOYNbG+o3rB0fVQFNQlagMczRBtTXRH4igcQmP7KzUyi0BZZwOdP2xfLCrpx2xnBgVQMH9OdHGv3KuydAPsQudiuRdi1kps8KGzKRX7ovpzZlEwWK+DCpuPSc/BGmH3MCTuNgpvJ/PKPWzM9Z7Z4cmrkUOcdVUh/TVEYfiIwhsA3wiLakrmh8i4YkrhZotUA1/Cyy6FRoA/A/2M8rCOpjR62Svykz0JqCmZOhBayap9fTzCnTbBbgXSygc50yht7iMnFfm3jnkLPDZkDMilrEfiEQJ4LtTVHZ8THpI2zudCXrG15OuRnIcXyzBYj/A19zErmPi2YWtXjCm8LGUhqxQXpnjCDWPqel2FYTGLUF3HskjKgS4JxcMOqqGe5M0fQBLECixm5ns4NCbXHQ850GZkrDLO+6WKriH9YULkqlMo88Kd2mVK7MBnK+X8m2UeD/T6VDaXtl3fsGXse
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(136003)(376002)(39860400002)(346002)(46966006)(26005)(2616005)(186003)(82310400003)(83380400001)(336012)(426003)(5660300002)(82740400003)(7696005)(36756003)(47076005)(44832011)(966005)(110136005)(8676002)(86362001)(4326008)(54906003)(70206006)(6666004)(316002)(8936002)(2906002)(478600001)(70586007)(81166007)(1076003)(356005)(87944003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3755
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4a32642a-4c80-4171-1502-08d8b14a569b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	XIDflIA17vHTyoFJZQr60MWSZlI3Z5DaKBEor3zhT1ldyw0gORPdMWOr+qqax416viv7pObvf+/72zLB1efNmmwNzNMeo+Jr/hzUjHeFs01j01gV/0/CfZhWEK7Phntz14e/ooOWTGH0dYdDWgFQrvnZiRPq/5omK70/hojiCgQ06m42LscC/jjKLTJzyzavWg/l5HgEcB70JU6CgN2CaBjXRcsfiJvUvrGk1bdp/x6vLMG0WQ9eOeCJdPv3lHWpCa0I4KtP/Jjr+WUx4foNWmb1oYuLS8GfHsL7j2MRxTLxl/nvJ1P6BQwkubtfSXQJOvBzbyN0fAoujkuiyOxPwio2cCSyV7SNypw491G3uh3cYA947YZ2GjcMQNIk9WDV9fYnl1tN2Pz1kkWKznevRECktPzB1HyfFW8UAdwoNO258Lkm0V4oE2uP28CqrB3/CENQrCsm/kGSLY92c3B0djSDX5TaXft+B1YhdchJPzX4wqog/oK4WFzw9afO62tX4U8ovBIkhu57y7szqtTiJH1rb9WN5erNwl0uwFZDKPjb4Xa/3q1PnxGKgut/GjkR
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(39860400002)(396003)(46966006)(36756003)(86362001)(478600001)(44832011)(110136005)(54906003)(966005)(2616005)(426003)(5660300002)(1076003)(7696005)(8936002)(2906002)(8676002)(4326008)(6666004)(83380400001)(336012)(316002)(70586007)(70206006)(47076005)(186003)(81166007)(82740400003)(82310400003)(26005)(87944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2021 07:20:29.9095
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6834fc4-a55c-4a43-8b80-08d8b14a61c9
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT057.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4177

As the dicsussion [1] in mailing list. We'd better to have
a barrier after reading CNTPCT in get_cycles. If there is
not any barrier there. When get_cycles being used in some
seqlock critical context in the future, the seqlock can be
speculated potentially.

In order to reduce the impact of new barrier, we perfer to
use enforce order instead of ISB [2].

Currently, enforce order is not applied to arm32 as this is
not done in Linux at the date of this patch. If this is done
in Linux it will need to be also done in Xen.

[1] https://lists.xenproject.org/archives/html/xen-devel/2020-12/msg00181.html
[2] https://lkml.org/lkml/2020/3/13/645

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/include/asm-arm/time.h | 43 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/xen/include/asm-arm/time.h b/xen/include/asm-arm/time.h
index 5c4529ebb5..3ef4e7cd3d 100644
--- a/xen/include/asm-arm/time.h
+++ b/xen/include/asm-arm/time.h
@@ -11,9 +11,26 @@
 
 typedef uint64_t cycles_t;
 
-static inline cycles_t get_cycles(void)
+/*
+ * Ensure that reads of the counter are treated the same as memory reads
+ * for the purposes of ordering by subsequent memory barriers.
+ */
+#if defined(CONFIG_ARM_64)
+#define read_cntpct_enforce_ordering(val) do { \
+    u64 tmp, _val = (val);                     \
+                                               \
+    asm volatile(                              \
+    "eor %0, %1, %1\n"                         \
+    "add %0, sp, %0\n"                         \
+    "ldr xzr, [%0]"                            \
+    : "=r" (tmp) : "r" (_val));                \
+} while (0)
+#else
+#define read_cntpct_enforce_ordering(val) do {} while (0)
+#endif
+
+static inline cycles_t read_cntpct_stable(void)
 {
-    isb();
     /*
      * ARM_WORKAROUND_858921: Cortex-A73 (all versions) counter read
      * can return a wrong value when the counter crosses a 32bit boundary.
@@ -36,6 +53,28 @@ static inline cycles_t get_cycles(void)
     }
 }
 
+static inline cycles_t get_cycles(void)
+{
+    cycles_t cnt;
+
+    isb();
+    cnt = read_cntpct_stable();
+
+    /*
+     * If there is not any barrier here. When get_cycles being used in
+     * some seqlock critical context in the future, the seqlock can be
+     * speculated potentially.
+     *
+     * To prevent seqlock from being speculated silently, we add a barrier
+     * here defensively. Normally, we just need an ISB here is enough, but
+     * considering the minimum performance cost. We prefer to use enforce
+     * order here.
+     */
+    read_cntpct_enforce_ordering(cnt);
+
+    return cnt;
+}
+
 /* List of timer's IRQ */
 enum timer_ppi
 {
-- 
2.25.1


