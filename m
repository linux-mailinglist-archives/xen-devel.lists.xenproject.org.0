Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AF9504E35
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 11:09:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307049.522315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngNNW-0007FV-NL; Mon, 18 Apr 2022 09:09:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307049.522315; Mon, 18 Apr 2022 09:09:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngNNW-0007Cm-Ip; Mon, 18 Apr 2022 09:09:02 +0000
Received: by outflank-mailman (input) for mailman id 307049;
 Mon, 18 Apr 2022 09:09:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mice=U4=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ngNNV-0006ub-EY
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 09:09:01 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur02on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe06::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2f58788e-bef7-11ec-8fbe-03012f2f19d4;
 Mon, 18 Apr 2022 11:09:00 +0200 (CEST)
Received: from AS9PR04CA0057.eurprd04.prod.outlook.com (2603:10a6:20b:46a::17)
 by PAXPR08MB7089.eurprd08.prod.outlook.com (2603:10a6:102:200::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 09:08:58 +0000
Received: from VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:46a:cafe::13) by AS9PR04CA0057.outlook.office365.com
 (2603:10a6:20b:46a::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Mon, 18 Apr 2022 09:08:58 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT045.mail.protection.outlook.com (10.152.19.51) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Mon, 18 Apr 2022 09:08:57 +0000
Received: ("Tessian outbound ac9bb5dd84f6:v118");
 Mon, 18 Apr 2022 09:08:56 +0000
Received: from e904b8361973.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 07049532-8FD6-4FEA-BCB0-EEAFAB37F2F0.1; 
 Mon, 18 Apr 2022 09:08:50 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e904b8361973.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 18 Apr 2022 09:08:50 +0000
Received: from AS8PR04CA0148.eurprd04.prod.outlook.com (2603:10a6:20b:127::33)
 by AM5PR0801MB1972.eurprd08.prod.outlook.com (2603:10a6:203:4b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Mon, 18 Apr
 2022 09:08:48 +0000
Received: from VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:127:cafe::78) by AS8PR04CA0148.outlook.office365.com
 (2603:10a6:20b:127::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Mon, 18 Apr 2022 09:08:48 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT020.mail.protection.outlook.com (10.152.18.242) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5164.19 via Frontend Transport; Mon, 18 Apr 2022 09:08:47 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.27; Mon, 18 Apr
 2022 09:08:46 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.27; Mon, 18
 Apr 2022 09:08:44 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Mon, 18 Apr 2022 09:08:42 +0000
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
X-Inumbo-ID: 2f58788e-bef7-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FIw93tJ3H+SfJwxD5M/sOYcJYzkHITrNvMbzRUuV10w=;
 b=nI5PJ/2apY4zRDuBKuJiTRS5Dlnw6e7il1gzcfWEFnE6UKQ3a+Sjp3IqisvxYNr7Khog7PT/MD3h4tAR1qYjr8BIskaZiehm7FwOTKHa0ZIHatTVJsCSZ3phy7nOWf0+IqYJJBw3vn3S+V2FnpLoFH4aydCxW9JrzUiHIiNcNzI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2363d4b466de078c
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RzoFdnGDJnskow1Ky3YI5yjPDXf7PkzJ4O7gUvM+/onqmxm5RX5xcNPsWjgu5faqpqM7WpWzcsaynu17lXIhnLZxWvKl2TdFJh9VTyNOtSZ5EfI2c4gu+3TTpyGUBnB4qWarQSyzlRP25MSCGFE6S5hYPomUONn0Y4e024X73zKl8U4tOLk42zir66tzIHg/K7jOHse8kfBzF9H/rKrnN6wcK9e7jf3p4x8fU5RLzm8ZxYOuAN10N8MvEDMg0Q1tpGnDoyaAKV/FqugJvMcqH8CfZytH0MLdIDxBeIflpMh1mSSokxCTpr/xbhEzjMB2SUYYRd0RhBDiDeeBQvJ1jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FIw93tJ3H+SfJwxD5M/sOYcJYzkHITrNvMbzRUuV10w=;
 b=b9Hf+f/t5UF9Z1H4gBgpnLVEDhVPWfJtF7srDN659wSrn9bQ81QUbFfqUuTHgxfE7M+vBsCyr62ba/uyiis2xrEulLjbhGYOwt1FdfSmuP+xCbjiGiqFf+P9ac1riVKftkXo+Q0Opv7TdJdEa7Ho0wWK2rSWLujvGaLcnm5YXRKXEw2q8QfKi+ov0Tki5lKBmIe2sFerGcfHTl3g4hfVT7IoNjpt9csT6tZC8KL/a/bIZOKGHI9HAo2jMirSHJhE5VTeaXUhP1TbLeUFDvP4U5xwiKsburwUcaZMX6wq1fTmA4f9r3QXU8AU7BIHLqyS+0x+GBuKDbxhT+vcTvybgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FIw93tJ3H+SfJwxD5M/sOYcJYzkHITrNvMbzRUuV10w=;
 b=nI5PJ/2apY4zRDuBKuJiTRS5Dlnw6e7il1gzcfWEFnE6UKQ3a+Sjp3IqisvxYNr7Khog7PT/MD3h4tAR1qYjr8BIskaZiehm7FwOTKHa0ZIHatTVJsCSZ3phy7nOWf0+IqYJJBw3vn3S+V2FnpLoFH4aydCxW9JrzUiHIiNcNzI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <--to=xen-devel@lists.xenproject.org>, <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v2 01/10] xen/arm: Print a 64-bit number in hex from early uart
Date: Mon, 18 Apr 2022 17:07:26 +0800
Message-ID: <20220418090735.3940393-2-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418090735.3940393-1-wei.chen@arm.com>
References: <20220418090735.3940393-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 212121c3-b22f-43b3-f3c6-08da211b11ee
X-MS-TrafficTypeDiagnostic:
	AM5PR0801MB1972:EE_|VE1EUR03FT045:EE_|PAXPR08MB7089:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB70893862D4D6823979D9CFCF9EF39@PAXPR08MB7089.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 JymwDniJCB3u+g3PmTSrn9f2tp4UHCiROgez7VHxj9XkAA2WRClZLTGZ6zxixnzVJDE2Rmpx+GXv/gjh8LmFMZLDPZhYdDg8O6JK0UFuSaP0XYHBLqVF7DqrWkZboaxY/LXC0rONRzafGyrk19LePpJQ0cwq0QnarEjXsfH6gEH2shsGva9wo2VkCVMk2tdlCBToTPBhUfSgN90khvuUcsJbh1IJT5H71qv4v0qtWHAFVbsbiqdqj3NtJYuG9daN6xyYAKHvNHatLMFhlOW+jhnE6UAveAFcY8lsQkr1ecgYka9NACJBDH3TVH2UhVgVK9ibK6lqDTRU4/Tic/MU1GPMpoxiqtca18kS9XLNAqCQpE/DwijLH8H/RnOeGpTAJ/R6ws1lZGv7RLH7oLsut1FKtYacLczzojyA4WH4EXrRhj9hLbBdvXIzxguXq1GDlgApjC319WCyHCXWCYtNV3Eu+CeGurRKvlmOgZIv8hE6qDa/ydeYFI5d6h1phFwUQVBp594u/4tHbLQMRpJwrc8LKo+ByoNNslO6NErbNTfk8fgDxJ6fvozuVojiWz3yMTuPSinyHhCElfWC0MwfLv+2tPqetlunObLlSEubDyFYZE3zXWnKfPzQaRiNXSPz/wZb0XoGSSHYEm0qrK46QMk1NilXEUmqq/DSE0aSqPFF4uYOzaFSQcRaKXA+xaM0U3yOQ3h934TmdLan5mPGUg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(356005)(8676002)(508600001)(4326008)(40460700003)(70586007)(44832011)(5660300002)(6666004)(81166007)(8936002)(2906002)(83380400001)(426003)(336012)(70206006)(26005)(7696005)(186003)(1076003)(110136005)(54906003)(86362001)(316002)(36756003)(47076005)(82310400005)(36860700001)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1972
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8acaf597-ff42-42ce-0ace-08da211b0c28
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mUEQJTf5bR60qaye7+ufanAlkWIyCjOHO/phoTSP+UiJjdG5FWeRmb3z7y6GVw3BKdnok/HBte/S/cPJZ+PwGPxNtkHdYyT6+DU7FPMavHWQNf1aCYHrXCfbLiyAPGQFunSFDV+JQdExhQ+01R+l6rj/IdwCxqX/TxD2vZVJHOIWGqyxrxOJLczlpDquBmg+XVODq87T8YG2JdlRQ8CSRdOdWxh4JYYvEFt+3QyB74wC9bIXrC7tm35xAO2lJony91JGBTwizKc5whodpxIB9ZCmMwVTNZUcoHvrYssZByuqnZeNjT9C/J/ivN/ZZ28gKrUYFZzbmRU+A2XajqHVqBYWeOh9KukdMHgRTvhmxOqrQVilXzKiFSpcyqPjRqQaPVFpAwiHLPfb0cEALuD52pLtnnNAPZhU1n4RCSsG6TQTviTu24fbIAllQAOMj8LBasVX13ygDdyEHmPdSJuMn6U8xBM4TthAsarSOv/kDeENDBS6ZHdsfC06jd2agnaBlc4Wfzm6LCXYtQmB726xD6NaiCCxqWKTB/LtO52tyXzny+HDmqjzDjmk+tIowiW0O80NqqHihrUchtNLvCmfvoeb6Ht2zR+ICjzEXb2L67LvIHPEiFA5ilzekVNdbI6isxmVlWVdrCadEwVV4UNwSfhs+hkibeAjnQre8z5UHC5qxAflfQcyfp4K4b/tmLCj
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(4326008)(40460700003)(70206006)(70586007)(36756003)(336012)(8936002)(5660300002)(508600001)(1076003)(2616005)(186003)(44832011)(426003)(86362001)(2906002)(8676002)(107886003)(81166007)(47076005)(36860700001)(110136005)(54906003)(316002)(82310400005)(450100002)(6666004)(26005)(7696005)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2022 09:08:57.3490
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 212121c3-b22f-43b3-f3c6-08da211b11ee
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7089

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
 xen/arch/arm/arm64/head.S | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index e62c48ec1c..2bb7906f69 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -866,17 +866,19 @@ puts:
         ret
 ENDPROC(puts)
 
-/* Print a 32-bit number in hex.  Specific to the PL011 UART.
+/*
+ * Print a 64-bit number in hex.
  * x0: Number to print.
  * x23: Early UART base address
- * Clobbers x0-x3 */
+ * Clobbers x0-x3
+ */
 putn:
         adr   x1, hex
-        mov   x3, #8
+        mov   x3, #16
 1:
         early_uart_ready x23, 2
-        and   x2, x0, #0xf0000000    /* Mask off the top nybble */
-        lsr   x2, x2, #28
+        and   x2, x0, #(0xf<<60)     /* Mask off the top nybble */
+        lsr   x2, x2, #60
         ldrb  w2, [x1, x2]           /* Convert to a char */
         early_uart_transmit x23, w2
         lsl   x0, x0, #4             /* Roll it through one nybble at a time */
-- 
2.25.1


