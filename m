Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C9F2EA5D5
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 08:21:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61743.108740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwgdq-0006KL-Mk; Tue, 05 Jan 2021 07:20:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61743.108740; Tue, 05 Jan 2021 07:20:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwgdq-0006Jw-J7; Tue, 05 Jan 2021 07:20:30 +0000
Received: by outflank-mailman (input) for mailman id 61743;
 Tue, 05 Jan 2021 07:20:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PMne=GI=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
 id 1kwgdo-0006Jr-Rb
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 07:20:29 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.59]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 580a5848-eb1e-4845-8432-98dde192fab0;
 Tue, 05 Jan 2021 07:20:26 +0000 (UTC)
Received: from AM6PR0202CA0044.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::21) by DB7PR08MB3899.eurprd08.prod.outlook.com
 (2603:10a6:10:7f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.21; Tue, 5 Jan
 2021 07:20:23 +0000
Received: from VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:3a:cafe::6) by AM6PR0202CA0044.outlook.office365.com
 (2603:10a6:20b:3a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20 via Frontend
 Transport; Tue, 5 Jan 2021 07:20:23 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT036.mail.protection.outlook.com (10.152.19.204) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3721.21 via Frontend Transport; Tue, 5 Jan 2021 07:20:22 +0000
Received: ("Tessian outbound 6af064f543d4:v71");
 Tue, 05 Jan 2021 07:20:19 +0000
Received: from 014545ea30bd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5613694E-6481-4AFE-90DF-AAD2DB36A674.1; 
 Tue, 05 Jan 2021 07:20:03 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 014545ea30bd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 05 Jan 2021 07:20:03 +0000
Received: from AM6P195CA0015.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:81::28)
 by VI1PR08MB4303.eurprd08.prod.outlook.com (2603:10a6:803:f6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.19; Tue, 5 Jan
 2021 07:20:02 +0000
Received: from AM5EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:81:cafe::1a) by AM6P195CA0015.outlook.office365.com
 (2603:10a6:209:81::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20 via Frontend
 Transport; Tue, 5 Jan 2021 07:20:01 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT018.mail.protection.outlook.com (10.152.16.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3721.21 via Frontend Transport; Tue, 5 Jan 2021 07:20:01 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 5 Jan 2021
 07:19:57 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2044.4 via Frontend
 Transport; Tue, 5 Jan 2021 07:19:55 +0000
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
X-Inumbo-ID: 580a5848-eb1e-4845-8432-98dde192fab0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ZBzzxGzKpaz/jymkQKpqP+oHhtY7DR0dss6B4Pcejk=;
 b=rRS0H7vjLxIkQXd3nhLr9F5ZGfJKXtk4pchGM4m+0DebV8Y97W6p6H1yecqgEvTm7yN78UPF83bIbvwP9Jc6xVYTrEPCeIOpsXhHZ26rwLWPvXyDjiOkhpyNWW7qvOB1gzVHx/bYjBk34pXo5vt0uE+Bv3lo/lNAKzaCTqOWA/0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 32e45b872d299242
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GDEI9MbGRSYo1NZkw4gCX64rSJDgMCkxv0WZrky+CrLH7tP2ujrPHgnXkdyi4utoEIQHI2CLC1BmGwLCkjQsGvzhaqDV18TZsJgMTF0cfO21cPauWWMebm2zZOfNokP+zNss+q3fhi/EbiiWxEH33lKoVjUhIRlMUtLAbfXwY1m/yDmmmUUjPnkSSiUHWrwscfiys+dGmYIiNe/h+Jyv/JsVZ/pjLSLJ/aGsWPrDbEr3FN9cN9OFnTUvgQI3VY51IYLAS8a6NoIzkn3QQGDL6nkkMzNa9JVjXKOZWMzb5GduC4Wfb/VSMGJ61v9XXbctU9wvBZc5U40QudIHcbTPqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ZBzzxGzKpaz/jymkQKpqP+oHhtY7DR0dss6B4Pcejk=;
 b=VgZU3RD2R4XbTEOicKi7dRKXvNlDkFa7iSCmWWRoPWSlABhqBMbEC/lrUUYKbc0ZHzfnj5j7Z+a7A3OZOhucg6KW6pQ2LKVZ0hyr8jPvNQQ3tzY0gpJaWCf69w1KVlhY22He6FRS9f3m8Ir7rfOE/HB4H0KydIejVaMfuO2uyrNR9DFx49l0LlZxAm4y2tuuBAWZ0lHV0Yhm8/APG52pJoOeiXQJ/mVd2WXH5f2TAai40CXbjGZwMNfwrzmMkWO/3ISshnHeFNbB6sc7B9CeLEtaoYJa9VmnVaSfQdvi3ouKRHHTfOTqlJ6QC9vNgKBIfqxejBXi/QDBhH6iw4nBkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ZBzzxGzKpaz/jymkQKpqP+oHhtY7DR0dss6B4Pcejk=;
 b=rRS0H7vjLxIkQXd3nhLr9F5ZGfJKXtk4pchGM4m+0DebV8Y97W6p6H1yecqgEvTm7yN78UPF83bIbvwP9Jc6xVYTrEPCeIOpsXhHZ26rwLWPvXyDjiOkhpyNWW7qvOB1gzVHx/bYjBk34pXo5vt0uE+Bv3lo/lNAKzaCTqOWA/0=
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
Subject: [PATCH 1/2] xen/arm: Correct the coding style of get_cycles
Date: Tue, 5 Jan 2021 15:19:45 +0800
Message-ID: <20210105071946.1971229-1-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 232595d9-597f-494a-4bd6-08d8b14a5d34
X-MS-TrafficTypeDiagnostic: VI1PR08MB4303:|DB7PR08MB3899:
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB38992F122C5551B7F7B31BA79ED10@DB7PR08MB3899.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Tv8CDYRKhOdMyInAc+BVhmIB+bl9JjjvstiCQA0tBV2Y5W8cVcwzTf+os+FSUKQJZVEygqVpkDvwL0eDOOrHu9zoWaFopfi46QM8rj1E/FHXEZkpFXPeNOGPzxGsRxAe7bfo9M0Hgbu+WSkdKgi9TXG9tKbuirJvn/QvAkoMn0lxLrw0mn94DhzCKF1nY+ftdAKurWxdIR2Zdm+cYzjbuBhacio6MS1IU3rTLzkMMdZw21UZcse8nfvz9MzE2h5Ra3kd4a/Z9xQ0Yc1cCVtdaceSmgTjYco7+etDoeRnE+mgJyRpxji6avTpesyIhIQNsOHc2zd+6e04mLvX1wmomxRTdyEU5ZCc1MrFTD1RvBXdpAFFk+tOtzLGL09/A9m6CtjhsCOSO6CZEgQcFJbq1CJXqYxrIirymkqkPep8GvSkjsjkfU8R8Of/yl5YRj2oHkL7CHkt4yEr58jD/rcs2Q==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39860400002)(346002)(136003)(396003)(376002)(46966006)(54906003)(110136005)(4326008)(316002)(8676002)(86362001)(1076003)(356005)(8936002)(81166007)(2906002)(70586007)(478600001)(6666004)(70206006)(82740400003)(426003)(83380400001)(44832011)(336012)(26005)(186003)(82310400003)(2616005)(47076005)(36756003)(5660300002)(7696005);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4303
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	93ae2a8d-12dc-45e0-adb3-08d8b14a50c2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eDhxJC1YKZd02XwilrEdGUg8mG/blz0D6M+CkhaApmf3JyXGjfY1Mggfpukuwf5AV36B/lYBqTfKv+GWsUJYp2ZmoiLcDuDQzAnaPxYOOovF57TfO8P7ZDxe4wiouJUCvhajI4v1r9GB+okaa3DTvAoGGi1WSlk1wHmB43gpa3qcntuhxhcXXfVEakcX3/zWP14giss7KPp027mAsieZfouNvm70itTCoFC5l5l7O8MZe7MFTLzQQZwQbKfb17m4vceMUrEGksOkXtk28FAL5Rul8aDwGXJYvqKcWwfFoY+n7DiyZxH0xK+XF7+LgfZikn4FSN5AV7jcg9aEz56jgTGsE+UEXlEVZD+oSRtQc+z3fNwsfvpBYgz2TmBQMuWebNAz2IXq6Yy6AJYuHc4va3Wwfm/Vno5uav+kCoV0uiyX1lL2XZ2Abz90iEvf/N7rjawpZ2vq8RtZ5lLuJFuoHQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(376002)(396003)(46966006)(5660300002)(86362001)(426003)(6666004)(7696005)(83380400001)(2616005)(70586007)(70206006)(36756003)(82740400003)(82310400003)(478600001)(110136005)(47076005)(54906003)(44832011)(1076003)(316002)(81166007)(8936002)(4326008)(2906002)(186003)(26005)(336012)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2021 07:20:22.1060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 232595d9-597f-494a-4bd6-08d8b14a5d34
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT036.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3899

It seems the arm inline function get_cycles has used 8 spaces for
line indent since 2012. This patch correct them to 4 spaces and
remove extra space between function name and bracket.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/include/asm-arm/time.h | 40 +++++++++++++++++++-------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/xen/include/asm-arm/time.h b/xen/include/asm-arm/time.h
index 1b2c13614b..5c4529ebb5 100644
--- a/xen/include/asm-arm/time.h
+++ b/xen/include/asm-arm/time.h
@@ -11,29 +11,29 @@
 
 typedef uint64_t cycles_t;
 
-static inline cycles_t get_cycles (void)
+static inline cycles_t get_cycles(void)
 {
-        isb();
+    isb();
+    /*
+     * ARM_WORKAROUND_858921: Cortex-A73 (all versions) counter read
+     * can return a wrong value when the counter crosses a 32bit boundary.
+     */
+    if ( !check_workaround_858921() )
+        return READ_SYSREG64(CNTPCT_EL0);
+    else
+    {
         /*
-         * ARM_WORKAROUND_858921: Cortex-A73 (all versions) counter read
-         * can return a wrong value when the counter crosses a 32bit boundary.
+         * A recommended workaround for erratum 858921 is to:
+         *  1- Read twice CNTPCT.
+         *  2- Compare bit[32] of the two read values.
+         *      - If bit[32] is different, keep the old value.
+         *      - If bit[32] is the same, keep the new value.
          */
-        if ( !check_workaround_858921() )
-            return READ_SYSREG64(CNTPCT_EL0);
-        else
-        {
-            /*
-             * A recommended workaround for erratum 858921 is to:
-             *  1- Read twice CNTPCT.
-             *  2- Compare bit[32] of the two read values.
-             *      - If bit[32] is different, keep the old value.
-             *      - If bit[32] is the same, keep the new value.
-             */
-            cycles_t old, new;
-            old = READ_SYSREG64(CNTPCT_EL0);
-            new = READ_SYSREG64(CNTPCT_EL0);
-            return (((old ^ new) >> 32) & 1) ? old : new;
-        }
+        cycles_t old, new;
+        old = READ_SYSREG64(CNTPCT_EL0);
+        new = READ_SYSREG64(CNTPCT_EL0);
+        return (((old ^ new) >> 32) & 1) ? old : new;
+    }
 }
 
 /* List of timer's IRQ */
-- 
2.25.1


