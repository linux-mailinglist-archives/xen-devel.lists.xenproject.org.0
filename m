Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A4D2EED69
	for <lists+xen-devel@lfdr.de>; Fri,  8 Jan 2021 07:22:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.63196.112237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxl9l-0002nJ-Ql; Fri, 08 Jan 2021 06:21:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 63196.112237; Fri, 08 Jan 2021 06:21:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxl9l-0002mm-Me; Fri, 08 Jan 2021 06:21:53 +0000
Received: by outflank-mailman (input) for mailman id 63196;
 Fri, 08 Jan 2021 06:21:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=eC+b=GL=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
 id 1kxl9k-0002mL-4w
 for xen-devel@lists.xenproject.org; Fri, 08 Jan 2021 06:21:52 +0000
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (unknown
 [40.107.12.72]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dc77f1ce-6ecf-4842-9e78-a57e2e081512;
 Fri, 08 Jan 2021 06:21:48 +0000 (UTC)
Received: from AM6P194CA0043.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:84::20)
 by PR2PR08MB4667.eurprd08.prod.outlook.com (2603:10a6:101:1a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 06:21:46 +0000
Received: from AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:84:cafe::ba) by AM6P194CA0043.outlook.office365.com
 (2603:10a6:209:84::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend
 Transport; Fri, 8 Jan 2021 06:21:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT041.mail.protection.outlook.com (10.152.17.186) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 06:21:46 +0000
Received: ("Tessian outbound 665ba7fbdfd9:v71");
 Fri, 08 Jan 2021 06:21:45 +0000
Received: from ad95baad56ee.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6AACF2A7-5D86-4016-B37E-1435148F85BD.1; 
 Fri, 08 Jan 2021 06:21:40 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ad95baad56ee.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 08 Jan 2021 06:21:40 +0000
Received: from MR2P264CA0086.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:32::26)
 by DBBPR08MB5978.eurprd08.prod.outlook.com (2603:10a6:10:1f5::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 06:21:38 +0000
Received: from VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:32:cafe::a) by MR2P264CA0086.outlook.office365.com
 (2603:10a6:500:32::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.23 via Frontend
 Transport; Fri, 8 Jan 2021 06:21:38 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT046.mail.protection.outlook.com (10.152.19.226) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 06:21:37 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Fri, 8 Jan 2021
 06:21:35 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2044.4 via Frontend
 Transport; Fri, 8 Jan 2021 06:21:33 +0000
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
X-Inumbo-ID: dc77f1ce-6ecf-4842-9e78-a57e2e081512
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zxoI9ZUAruyYWWVoWUJvSnZ9EKwKkCv5vxVPTgfelWM=;
 b=uKWggf+BUUcADyREv2hNwlLLQyZDe7W4WLuk36n1LbLyxeIHP/x7k4GW1+eMgryu93EZg7n2Q7x8KZBkWZS3DS4cKHPlCZg3f1tfCH2qyRHC3Bh4fp1euXeZlr8ZtM4iZUMme6JrvQf2a7lGLEoTUZiOsn41aBik1BmtY7wblOg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: dabf7319d57d0889
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gMvdf4b+Mh62d6NByigYDFU8P+qTmEkOzhzwY8WpX5Lydwy/5/+tsYzJUBeIYONNjxFG9H5bOu9Xb2RZi5Kbm9s8YsyozQQmBsRKEP2b84jVkXEJqs8aUF7Xq4Ip1sA21chIKTIhcceYq0tQMWQ9LXpl3UVWugL+EfyjrK9GIrvfkRCC0+8sywLmq8h7OQRxJLHwsN73mq0wPhAoKtZbvTFFkQfwv9hM8Oe6nxbbhvcUtVNiaz+81WT588hWxw84DChtq2u5C3nXmM2RbJtPbi0wC1pah4F/oGTsdp6eFUF11nj2sM/QAz/ntkc7bqzAbfaHUXW47luzfCVzV/Du3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zxoI9ZUAruyYWWVoWUJvSnZ9EKwKkCv5vxVPTgfelWM=;
 b=EMY0KiPGuul8a6fQnfBhmdUL5qyNG+SbEohFqB2KoFtl4O/cB+p8lVmEEmC5mfLT+eDwETniTZkv9XfZF0fAupfSWhiZ9qINs5v79/wEWzC073suIYodhy21wV0dy1Yel0Nt6jqIcrRrSj4luPFIjpxIR4JqrANg/JMs1zg0zsg6Qx75+CkOe/uNWNAAkrOVAlWfN9S8ddpOD2YqHGR2v+Y2uOx3rpfqDPEI1hRh6fLsgYecQ7/1ZPoVjqDPM3R6X7QcbeY8W0U/N+1OEi0xLM8oa5dahQ/tYwKd2PkprebmF1er46T8UKDMT53c0yxNbs+y76hZrp0zo7312jnjLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zxoI9ZUAruyYWWVoWUJvSnZ9EKwKkCv5vxVPTgfelWM=;
 b=uKWggf+BUUcADyREv2hNwlLLQyZDe7W4WLuk36n1LbLyxeIHP/x7k4GW1+eMgryu93EZg7n2Q7x8KZBkWZS3DS4cKHPlCZg3f1tfCH2qyRHC3Bh4fp1euXeZlr8ZtM4iZUMme6JrvQf2a7lGLEoTUZiOsn41aBik1BmtY7wblOg=
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
Subject: [PATCH v2 2/2] xen/arm: Add defensive barrier in get_cycles for Arm64
Date: Fri, 8 Jan 2021 14:21:26 +0800
Message-ID: <20210108062126.2335873-2-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210108062126.2335873-1-wei.chen@arm.com>
References: <20210108062126.2335873-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e040b95-5e46-4933-8aee-08d8b39dacb6
X-MS-TrafficTypeDiagnostic: DBBPR08MB5978:|PR2PR08MB4667:
X-Microsoft-Antispam-PRVS:
	<PR2PR08MB46677111BCDF2E82324335EA9EAE0@PR2PR08MB4667.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FyyXIkxoT4sFLrNywUnA5kiJO5z8nGDO4iMZipMwNEe4cnKmfHuV05iLW+hy65EGJt6TIqWaSVdiGpnwcxB5mCJGY3Y+Woxhz4wwHDnmhn3LvzlMTkjtzwHRrA0VLEZ4AmUQgeHy+7Bbdp9rueg6aSPs0LN+23AwSWhwmAGXSnAJExW1N/2+RmgL/KrtmoGOhMKAY1Z/+LXRoxuZdZqKWOJJblo0HqgRBbndEN55Si7aMIV66c/oUo/lrTMG9m6LTDXDJrtNgtF9qSIgu8ted6jc1W8Y2uJcSRB/AT54zNOMmufIHWJruaPYMgrRDW+6kv+mzCmzA1IC3Mt/DlG4HwPYqZfmqE9Qw7sZL3XNaWUD1w7kOJDzKBCd6ipqbTo5n5t9p81qz7f1jGMd59nlQiClMw2lch3oVs27ELIUJ8aySFt6MZpLkCmubn9V2Yv4Mu+FdsEmMnKg5iWkvHfUFmifytyNFF8w+HbFVsgHVMoLS1uLQhIXrbY+iz5y3Ea/FRagc6UgugR1UzLY4TIYu1qcZ42Di9YXSoUtIYB6S8ViczXjzJ2chMSOzd801TttvlOQnRudAtlsnWFdhjLyFqwCipTCO3VAuy98vZ178BE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(46966006)(316002)(110136005)(356005)(478600001)(6666004)(2616005)(36756003)(336012)(426003)(2906002)(1076003)(8936002)(44832011)(8676002)(86362001)(70586007)(70206006)(83380400001)(966005)(7696005)(82740400003)(4326008)(47076005)(186003)(54906003)(81166007)(5660300002)(34020700004)(26005)(82310400003)(87944003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5978
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3215c6e1-3c5a-456f-cfa7-08d8b39da7dd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0bdeh5lFj8bXjDvKBrF8rg6s0Y3T28dqDfOGhiIvox3ecSp5DsqcPIWgBi6Zj0Yka5OT2toc6yzB+lA7y9S92bpkS5Y4qLgyXSIa3LMiVmO527Lk63gSXfwm/HAfHK89DW3nbXdkXNjq1aZnB9zU7m8ezYv0C7WVHxjL3DsEEks9w/AoITHx2d79z2s6DuD2K3AN/3Bqt0+bEf4R26GDZi29fzila5dlWh3uVHHuwpcSxN4sjnN3LsmO20udJAxmFlTzv/MKK25banysN/kjZ2auLzWRhZlnM1HLdH7mlh2cPvYAGConmBYEajMc99+PE9TIAyfjm0mY5jAmPIepfhfuZtNiWzzYMMqc6F5PpbGEx7WUBa9bAP+QvYejJjNBk2zWPVyEu35ZCOR0a2slvBGVKm2VCUkWVQIpvQwaRhN+lhmqSbPjYw04D8QLZHiw/AAOrjRFv1AIj4nNhhTHE/uutxdfDiHqCfeedeXT8yVj3HQvK3UC6VCtKSHozjiOtY3OD583GfQP3i2raMKNXeMXaIxm5oVjj7JNIlcqHteLIXyajRTDaXKa4pnUiNWPWTLqsIZnCerZXLhaeNFqChW44slBW4QC8IGP1uf8giM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(46966006)(966005)(426003)(2906002)(82740400003)(34020700004)(44832011)(2616005)(336012)(5660300002)(81166007)(26005)(8676002)(86362001)(70586007)(7696005)(36756003)(6666004)(83380400001)(70206006)(316002)(54906003)(8936002)(82310400003)(4326008)(110136005)(47076005)(1076003)(478600001)(186003)(87944003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 06:21:46.1197
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e040b95-5e46-4933-8aee-08d8b39dacb6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4667

Per the discussion [1] on the mailing list, we'd better to
have a barrier after reading CNTPCT in get_cycles. If there
is not any barrier there. When get_cycles being used in some
seqlock critical context in the future, the seqlock can be
speculated potentially.

We import Linux commit 75a19a0202db21638a1c2b424afb867e1f9a2376:
    arm64: arch_timer: Ensure counter register reads occur with seqlock held

    When executing clock_gettime(), either in the vDSO or via a system call,
    we need to ensure that the read of the counter register occurs within
    the seqlock reader critical section. This ensures that updates to the
    clocksource parameters (e.g. the multiplier) are consistent with the
    counter value and therefore avoids the situation where time appears to
    go backwards across multiple reads.

    Extend the vDSO logic so that the seqlock critical section covers the
    read of the counter register as well as accesses to the data page. Since
    reads of the counter system registers are not ordered by memory barrier
    instructions, introduce dependency ordering from the counter read to a
    subsequent memory access so that the seqlock memory barriers apply to
    the counter access in both the vDSO and the system call paths.

    Cc: <stable@vger.kernel.org>
    Cc: Marc Zyngier <marc.zyngier@arm.com>
    Tested-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
    Link: https://lore.kernel.org/linux-arm-kernel/alpine.DEB.2.21.1902081950260.1662@nanos.tec.linutronix.de/
    Reported-by: Thomas Gleixner <tglx@linutronix.de>
    Signed-off-by: Will Deacon <will.deacon@arm.com>

While we are not aware of such use in Xen, it would be best to add the
barrier to avoid any suprise.

In order to reduce the impact of new barrier, we perfer to
use enforce order instead of ISB [2].

Currently, enforce order is not applied to arm32 as this is
not done in Linux at the date of this patch. If this is done
in Linux it will need to be also done in Xen.

[1] https://lists.xenproject.org/archives/html/xen-devel/2020-12/msg00181.html
[2] https://lkml.org/lkml/2020/3/13/645

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v1 -> v2:
1. Update commit message to refer Linux commit.
2. Change u64 to uint64_t
---
 xen/include/asm-arm/time.h | 43 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 41 insertions(+), 2 deletions(-)

diff --git a/xen/include/asm-arm/time.h b/xen/include/asm-arm/time.h
index 5c4529ebb5..6b8fd839dd 100644
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
+    uint64_t tmp, _val = (val);                \
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


