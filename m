Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8783E8E87
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:25:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165615.302636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlPv-0000Vj-Q7; Wed, 11 Aug 2021 10:24:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165615.302636; Wed, 11 Aug 2021 10:24:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlPv-0000TP-Mq; Wed, 11 Aug 2021 10:24:59 +0000
Received: by outflank-mailman (input) for mailman id 165615;
 Wed, 11 Aug 2021 10:24:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9qiF=NC=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDlPu-0000BQ-B7
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:24:58 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.40]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f5c7161-3a04-4805-b4d6-964518a0af21;
 Wed, 11 Aug 2021 10:24:51 +0000 (UTC)
Received: from DB8P191CA0030.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::40)
 by AM7PR08MB5495.eurprd08.prod.outlook.com (2603:10a6:20b:104::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15; Wed, 11 Aug
 2021 10:24:49 +0000
Received: from DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:130:cafe::e2) by DB8P191CA0030.outlook.office365.com
 (2603:10a6:10:130::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:24:49 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT031.mail.protection.outlook.com (10.152.20.142) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:24:49 +0000
Received: ("Tessian outbound 8529ae990a93:v101");
 Wed, 11 Aug 2021 10:24:49 +0000
Received: from 8e0975189f47.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3D8231B4-607E-4028-B13D-4B85FBF13773.1; 
 Wed, 11 Aug 2021 10:24:42 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 8e0975189f47.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Aug 2021 10:24:42 +0000
Received: from AM7PR04CA0027.eurprd04.prod.outlook.com (2603:10a6:20b:110::37)
 by AM5PR0802MB2498.eurprd08.prod.outlook.com (2603:10a6:203:98::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Wed, 11 Aug
 2021 10:24:41 +0000
Received: from AM5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::94) by AM7PR04CA0027.outlook.office365.com
 (2603:10a6:20b:110::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13 via Frontend
 Transport; Wed, 11 Aug 2021 10:24:41 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT015.mail.protection.outlook.com (10.152.16.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.14 via Frontend Transport; Wed, 11 Aug 2021 10:24:41 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:24:36 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:24:34 +0000
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
X-Inumbo-ID: 8f5c7161-3a04-4805-b4d6-964518a0af21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=REMC2JEWc6kSwOzQOPs+cm02/cp1lLy6vZpviwordBA=;
 b=7Fa1EHXx6y6ZVDYimGP9CjNnAfbWmLQedvHR9rWKlVusXTObKOpYKfbXmzMi+Wk+zeBhERdxhGuxAK+OgTkXraSIKH+2/yDX1D23PAoiK601X4AvCAHf89voRSTE85cPbta/RDXnWEAMkNl4DGmR58CO1ncSdN8tPBNb3JkaaFM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 79bdd4d3dd8a0002
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KyR9PAoWjBH1QOpJv24cx0CTZ0nsvLnei7loTdDZkI/2ooKNX7eKwSxVItY9SZV5r4t1vpencp1WfvID/87FHtwT6IU/LV30FFRczeQ5bmPVWhueapwi5PupJqArHqjMKdvUmMHRniV7oXDhda2KFRJOxv+16dr0/93jQs1sE+ppqK06KAqTsQbOjdiBMoFohpC0atXkWTY0Dopw7bGSGwup8dVLxY01mcW7QBWmVNZuCJePatYDmg7K8v0NSSSKOGQumgeWQYYuwAuYFQi04VKr1nceRBSrfOIelG06xGP5aLlSJk+479tVFwbUDe2kNdA7SKo7d2DOxEgaect3zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=REMC2JEWc6kSwOzQOPs+cm02/cp1lLy6vZpviwordBA=;
 b=HbsT3iP8XfP/33R/jCMp/Jknsz4XHjudjpaF2bpvVsv5YNOKx4AsRIjmKnlxxT7TkyPDEtYHzL+0Qd2W1KkbgiauhE0b26gkQUFjjvSMvRpT1HsOJTGcBmrYIftRiAbMliN3Nuj+cpx1X7A+zNqHrBOictAqrWGtzz0I4ABrn1hIhFjjYqfK6bTGAa35bxRHZNrzAmtCaHlkmr5mhNj/b8LRrnRwhwgTtEHleBkhA0zCkY42JRyxR0c1AcmxYHQ9o0EXbmRrFMZThTftvuVr7t/drWCEroa3kqyv40pLcoTpKnNMSSffhV86frTSrVnDzHNduECKmHz8eykQqyc7gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=REMC2JEWc6kSwOzQOPs+cm02/cp1lLy6vZpviwordBA=;
 b=7Fa1EHXx6y6ZVDYimGP9CjNnAfbWmLQedvHR9rWKlVusXTObKOpYKfbXmzMi+Wk+zeBhERdxhGuxAK+OgTkXraSIKH+2/yDX1D23PAoiK601X4AvCAHf89voRSTE85cPbta/RDXnWEAMkNl4DGmR58CO1ncSdN8tPBNb3JkaaFM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <wei.chen@arm.com>, <xen-devel@lists.xenproject.org>,
	<sstabellini@kernel.org>, <julien@xen.org>, <jbeulich@suse.com>
CC: <Bertrand.Marquis@arm.com>
Subject: [XEN RFC PATCH 02/40] xen/arm: Print a 64-bit number in hex from early uart
Date: Wed, 11 Aug 2021 18:23:45 +0800
Message-ID: <20210811102423.28908-3-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dccde90d-4c81-49be-6fcc-08d95cb24001
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2498:|AM7PR08MB5495:
X-Microsoft-Antispam-PRVS:
	<AM7PR08MB549587F86F2764CA89409C569EF89@AM7PR08MB5495.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Z7rKeOpcgWYGZmqWbwZEIhrwp1+skqduyinj4OlfYPkWOdJJMX/Rc53dcJq/r5oaUGtVjwkZXpN1kcJj+gZV3zar86FuSIf5jPA5hN/l4M/D/KVvxt5LVOHD83xqIXyTvVS+0ZMSzgjYuzn+3lLdxTgMTq86VksZ4pIFiIhySCb12X0uksWiez9xNppji1UBKLU5L9B+6M1XFMF6OkKiLljsyqsttKBujdiGmd0W0is3LIUi6YLC2f/GcYk3Uf1t9L84S32NhdxlxYLjGjenwpyiDxzS0GHYRFYVSey4tCk/uiq0CxapZ6ES3MYwunrrsrqVTsIXn67vrc6DY9JXm3F2NHszn3l04zV1nE/HauMFfqyWfNrIKHt0XB8r0r32OClT1ZvZGUK5SZ7vhK0IAvD5avSUQIyGtPGXbIBh30VAd3tXyNElz+ufPssvCg6rpdyzY2xvEUvVvfXWTphN5V5BGN5+cYpLL/Ry6D9OkSQv64WIf5bgM1X1cad5qgzC2IZCvRJBKIVQfjuWQF8msaobiVpjeyg4LZZf6qxOAcYTmFajt0RKmdDO2JhfC7C5AN2flkc1Y6yAHiIFkLE9FbVgpoJhd1LwgF1ugD0mQBHfX1TrGwhKKAZSMapxxaVQii3mRaonoG4TGp4xqFUrM+UpV61uuwbpvRL8zNbZULgbGFCLqiWR9Ehz0R61CWTQbMaPr5y1LMew5esGUejptCV3OdYldbYBQ2Fb7GSLEn293nszL5T0z0ryZ5fSHtDoLlpwnnNoi1whV1rJcrd5gJmExMJ3GBnkwzzKAzNjkrU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(376002)(39850400004)(46966006)(36840700001)(83380400001)(356005)(2906002)(7696005)(36756003)(2616005)(426003)(5660300002)(86362001)(336012)(4326008)(82310400003)(44832011)(47076005)(34070700002)(36860700001)(478600001)(82740400003)(8676002)(81166007)(1076003)(186003)(70586007)(70206006)(110136005)(6666004)(26005)(316002)(8936002)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2498
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9185d0b8-baf8-4708-cee9-08d95cb23aee
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eLXFvQErm9udb2DXQwfUR+BCa5Ld3qX+ktyO4VOYTQ+qxbRMFkIWKa+8/SZUi6wg3ZU+SdIGR5J9Br4kMKyDJxmf+FbvfpT8YHaJJNuDVw0Ei1vDmWUzu4gJ/RDR0NjPj07aY5K8brwTAB4FWgZI9Kv2B3+oExCkmo+rUeCjDzPmWEFfcvx5/akjc5oIGPKoEpwi+bvnu9nDNBm2mY7SYtYCif3P79hFjTG3NzhKcsd1KRhF/GWqA/Pfr/qOkZSbw2SWxYb/JG+JI4yIsGY6QOg4MXtu8Tifwnk3hfl1QOfLL9laGrThPn5/n53ngFxhDk8j+2/OU4Qohadk0fD0+rE3fhpDobxzn1emXkx8LzMHPTZgHdEVBpwvKz/EMFfdRzgAgovtbr77MvLVeacjKKy/Lm/3aGZk4SdZkpL+UUzC5mLEzDNDCw6onWLTEmM7NKYpBVW5k4RK8Jw0HM8DKbxDz8o0Z6HyUbdiadd34yPuvJjHxU9OA5dee3FAAFiITOvXS3hJICQYkL+Q13zE6Ro24VFUP6UB+EPd9yeBYqv93f/bTNBFyi4QD29UgdLU/9s0x8KDlBFFPFHBYl4+czMuFJoJuO5Wh8aaW8MNHWji+eU15u8YZOm/uIzg0AIZG7ajG+TXk/GTxXX0Flel8U6cSBbeXOqOaJnjmtrV9c/u+Gq5ZLSRjX4gpg7eP8Ejge79ChE2Y6sKo8nguJHkjrZAa8DbgTSgEvqtMVDW4FU=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(2616005)(336012)(83380400001)(86362001)(186003)(2906002)(36860700001)(1076003)(47076005)(7696005)(5660300002)(36756003)(82310400003)(4326008)(70586007)(70206006)(44832011)(8936002)(8676002)(26005)(426003)(508600001)(81166007)(316002)(110136005)(6666004)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:24:49.7325
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dccde90d-4c81-49be-6fcc-08d95cb24001
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5495

Current putn function that is using for early print
only can print low 32-bit of AArch64 register. This
will lose some important messages while debugging
with early console. For example:
(XEN) Bringing up CPU5
- CPU 0000000100000100 booting -
Will be truncated to
(XEN) Bringing up CPU5
- CPU 00000100 booting -

In this patch, we increased the print loops and shift
bits to make putn print 64-bit number.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/arm64/head.S | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index aa1f88c764..b32639d7d6 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -862,17 +862,18 @@ puts:
         ret
 ENDPROC(puts)
 
-/* Print a 32-bit number in hex.  Specific to the PL011 UART.
+/* Print a 64-bit number in hex.  Specific to the PL011 UART.
  * x0: Number to print.
  * x23: Early UART base address
  * Clobbers x0-x3 */
+#define PRINT_MASK 0xf000000000000000
 putn:
         adr   x1, hex
-        mov   x3, #8
+        mov   x3, #16
 1:
         early_uart_ready x23, 2
-        and   x2, x0, #0xf0000000    /* Mask off the top nybble */
-        lsr   x2, x2, #28
+        and   x2, x0, #PRINT_MASK    /* Mask off the top nybble */
+        lsr   x2, x2, #60
         ldrb  w2, [x1, x2]           /* Convert to a char */
         early_uart_transmit x23, w2
         lsl   x0, x0, #4             /* Roll it through one nybble at a time */
-- 
2.25.1


