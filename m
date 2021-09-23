Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9767415DC1
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:03:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193817.345294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNS6-0006Hx-Tw; Thu, 23 Sep 2021 12:03:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193817.345294; Thu, 23 Sep 2021 12:03:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNS6-0006Dp-PI; Thu, 23 Sep 2021 12:03:46 +0000
Received: by outflank-mailman (input) for mailman id 193817;
 Thu, 23 Sep 2021 12:03:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fewu=ON=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTNS5-0005bO-Mq
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:03:45 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.74]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4a5d2a18-1c66-11ec-ba2e-12813bfff9fa;
 Thu, 23 Sep 2021 12:03:40 +0000 (UTC)
Received: from AS8PR04CA0133.eurprd04.prod.outlook.com (2603:10a6:20b:127::18)
 by VI1PR08MB3823.eurprd08.prod.outlook.com (2603:10a6:803:c2::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 12:03:38 +0000
Received: from AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:127:cafe::ad) by AS8PR04CA0133.outlook.office365.com
 (2603:10a6:20b:127::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:38 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by AM5EUR03FT052.mail.protection.outlook.com (10.152.17.161) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:03:38 +0000
Received: ("Tessian outbound ac52c8afb262:v103");
 Thu, 23 Sep 2021 12:03:37 +0000
Received: from 44d92c6500e8.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F6E86E5D-73A2-41B7-8718-11882F6755A2.1; 
 Thu, 23 Sep 2021 12:03:17 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 44d92c6500e8.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 12:03:17 +0000
Received: from DU2PR04CA0164.eurprd04.prod.outlook.com (2603:10a6:10:2b0::19)
 by AS8PR08MB7223.eurprd08.prod.outlook.com (2603:10a6:20b:346::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Thu, 23 Sep
 2021 12:03:16 +0000
Received: from DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b0:cafe::8e) by DU2PR04CA0164.outlook.office365.com
 (2603:10a6:10:2b0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:16 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT026.mail.protection.outlook.com (10.152.20.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:03:16 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 12:03:10 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:08 +0000
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
X-Inumbo-ID: 4a5d2a18-1c66-11ec-ba2e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jvn0ISo/HgoiboBWB5FbYbJTrYAvUyDADUFepjr42Sw=;
 b=6wUCbjwZbgV4QuMhjrJ6LpDOOGTuNUY4epgyn+Wu1jH2gVK3v34enDYKe7T8JgMVSwTOzHKqTiQ6T4QxB69tuNfvjWWS34TyywuxMCYlUrQt0xYN2YCquI5n4xYhEG9SgGZBFRxpPzwUULqA14fl8JdYs8cJKzKMW/TqZsOmKMw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2406da346ef2d9e5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gFvw+C6x1mEYUAyAcypHj6Ny9AHhhQdKsyh58VcmC9A19pZuivMGoBM2oPhTHYGTYkHAEX/JQz95AYvzaAifLyBwA0lPyWAvxKQIBEw/dKihQacyGbPWltZ7cwky2BtN0TeMBBMTA2pgGezwevhYHzGdiJbhx7a67wvKisUi8naeRiXiZMZ3sg277RNDxjuoYK6McD3SD6u9tyC4f58uBw0WXi6fmVy4/Vc3ufStuhGvUlW7RWQWy+mlldsuXdmyOQQxiyS0xXhP29jMrayAKtvZfNgKoSDXt52t74TMki0s9t/QFukFpdqnUZy5PSwyeecKVoeME/STuojWHDsUGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Jvn0ISo/HgoiboBWB5FbYbJTrYAvUyDADUFepjr42Sw=;
 b=cb1BOiI2Kv9ixkOVfDQ79QYSsvmpXzjAuNDDzqYCTxroWBbATu6+P6VIMjc+3sv+EDmYQ7h8zPFQLam8+d9dreZRQ7Ako4xBSUtkwGfW7Yu3+4iYRp3z+cSR0NU5/kypti4XbGpUqnJOdCb1i7fE+/PNp5hno5vnlFb1K02UeDxmkfgROlTJ1jnCaOC6bLhSjYbe3TUCz7bUaRHAlNBnV+KlWmhiZN86HTKbSQz5p4LnRkdKy5tTvdrQBfWhBC5uDxsaoijnnl0uiKCViyE2UVApEf/n+6WekI4Xej6OjtfC7xErWTy5xJ73w2bdwnKkZRg1GhFWbL0xTaMi8CrQ0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jvn0ISo/HgoiboBWB5FbYbJTrYAvUyDADUFepjr42Sw=;
 b=6wUCbjwZbgV4QuMhjrJ6LpDOOGTuNUY4epgyn+Wu1jH2gVK3v34enDYKe7T8JgMVSwTOzHKqTiQ6T4QxB69tuNfvjWWS34TyywuxMCYlUrQt0xYN2YCquI5n4xYhEG9SgGZBFRxpPzwUULqA14fl8JdYs8cJKzKMW/TqZsOmKMw=
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
Subject: [PATCH 01/37] xen/arm: Print a 64-bit number in hex from early uart
Date: Thu, 23 Sep 2021 20:02:00 +0800
Message-ID: <20210923120236.3692135-2-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923120236.3692135-1-wei.chen@arm.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 594b5d82-14c6-47b7-4c70-08d97e8a2d85
X-MS-TrafficTypeDiagnostic: AS8PR08MB7223:|VI1PR08MB3823:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB382377CFFEE72C35A15CB0199EA39@VI1PR08MB3823.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0gk4XAwLeFhtHLi9koYwmYtQP12yf72rkz3Wgz4BoRtum2YEeTav1FwXikW/FwyqJXAmlLPkqUI9LXPAv8BguhbN82q5ZdMcr2SSb/+OG28I1uUH16VMKuVXobeM+otoQbdl2r5X7V0h30FDh02W/riwszgorjFZFdWwFbBZgNtL0XuDiaRdJTdS2XVrV5E+Ko0XHZhRdRojg0HAX7chbqoy/Txw+IYr4OdotnTwCVPqQRdhL8x3nminmfhAuxL3vHhzAU/HmGMPEmWKJIrWO+ZnDPNaSaC0ezIlzqqQP0BomyKMgU5LrOfGmPaRrGzPBm2hQg9TRFEu227WKnbh/HPlXzdA1Ku98I2wFI8GC07hXfHx5CLIxFLS70iMKzoPdXHpjl2uqI3DajfBKuuci2XLETmtRtY6aejLXGY85GVsW+E1K5BAtJBrF6J3gw3W3K2OAqjomJxScf0wbGKgGftKPL8fellex228LK6nM0VaaJ8fJbyeETBvJBM5TbTc5yuzpqUDS6pMafpLMYAYsvTWknN7NU6L+kNcW5Qb+55CPAElbW6RslO7djqWdvNHzngNmzxLfpWTk1Zrf3DAmq2/TvHxvU131UQLWo69K8dZXirtzkrVJPDe33tvkuO4sXHTgz8YQzpVVETGYWj0MJEuSNpfQGvQar9sdlBGEoTL2RLoaCC9QpqBtAy8zu6gOl9bPTw4/86FWFXYAIoencZBxftpQYVVG5XxKkR+0TQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(1076003)(426003)(8936002)(70586007)(70206006)(44832011)(8676002)(26005)(186003)(356005)(2906002)(4326008)(86362001)(2616005)(5660300002)(36756003)(36860700001)(6666004)(82310400003)(336012)(110136005)(316002)(83380400001)(81166007)(508600001)(7696005)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7223
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	85b30f8a-48cd-4e87-0b32-08d97e8a205c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	082+bzUt56zH+f5i0vl1OtSc3EgiB8kJjHTrQ98DreaJ/m8DX3X03+KgyGejeoDC3K0Qz0bVGdFwV8/b1rE1JLxh/Ckjq4AVXMjp4vWQc+zcH2rfmvhsf7YjTUUBOrhPErGGoJwrvddPoD++u2GGvP2b8fAW81L/IHp8/b0UbYnY04mxQgkR7syXpf66tUAIphGvl5l4iC1XYuJKaRnzaeYqnzPDmQaFVEMLvdr9M5y0Ga2c8wu3EEIRPefrX1helxhMp8FR7RgCm/yqhmAGsK6lXp+IadyQn6uFbRBimUNl+uIpgJhsE+M3c/abD+i+PLtztxzhv1xHN8DDADMZrlLwZD4JJnSY/HvQC9aJxomjuSWxldiHtwif4lZsoPYzILgP8kxUZRX4HbH6qyKZI1yfHWNM+i/KZ68U32hj+UJX8p1QkXX7Wjm6m9gsCgOb7+Z1/apxMynR4tkepx6qGOu0rPEWprTmP/Q0yBDpAUF1RRJ1nzT2/6nMWrmIQQC4EWt/GOHufxGpTNqZ9WLa3PDxBz07ATcDso2ZsdGJUuRhW2paUl9KibccxjJ8ekooI3wMTX+02hmo0I5oBgE/R50ROIztSFPPrP2OWXO11zi6aO5LjDwHMkTG/tOUCVpdFKe688EdfECuRgpRQO2xqvFTBaflPXZYme+wR2DMNNaD8Tg9WFJ0uVVb7wPw1wEEnoj9J2NF0eUmanLB5JZpQg==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(70586007)(508600001)(8676002)(83380400001)(6666004)(70206006)(426003)(44832011)(82310400003)(26005)(336012)(7696005)(316002)(110136005)(1076003)(186003)(5660300002)(81166007)(36756003)(4326008)(86362001)(47076005)(36860700001)(2906002)(8936002)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:03:38.3369
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 594b5d82-14c6-47b7-4c70-08d97e8a2d85
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3823

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
Acked-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/arm64/head.S | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index aa1f88c764..d957ea377b 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -862,17 +862,18 @@ puts:
         ret
 ENDPROC(puts)
 
-/* Print a 32-bit number in hex.  Specific to the PL011 UART.
+/* Print a 64-bit number in hex.
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


