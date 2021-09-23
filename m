Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4662415E28
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:18:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193997.345689 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNfn-0003LE-VI; Thu, 23 Sep 2021 12:17:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193997.345689; Thu, 23 Sep 2021 12:17:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNfn-0003Fe-Jo; Thu, 23 Sep 2021 12:17:55 +0000
Received: by outflank-mailman (input) for mailman id 193997;
 Thu, 23 Sep 2021 12:17:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fewu=ON=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTNWx-0005KP-8f
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:08:47 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7d00::62a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bee594a9-9cb3-4904-b90c-9dc8498d15a9;
 Thu, 23 Sep 2021 12:05:05 +0000 (UTC)
Received: from PR3P251CA0016.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::8) by
 PAXPR08MB7296.eurprd08.prod.outlook.com (2603:10a6:102:217::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 12:05:03 +0000
Received: from VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:102:b5:cafe::d4) by PR3P251CA0016.outlook.office365.com
 (2603:10a6:102:b5::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:05:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT031.mail.protection.outlook.com (10.152.18.69) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:05:02 +0000
Received: ("Tessian outbound 78bf72cc015a:v103");
 Thu, 23 Sep 2021 12:05:01 +0000
Received: from 6b4712ded5e1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 EBBC38B5-AEE2-4B0F-B1F1-0EBEA0BA195B.1; 
 Thu, 23 Sep 2021 12:04:44 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6b4712ded5e1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 12:04:44 +0000
Received: from AM6P193CA0139.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::44)
 by PA4PR08MB6046.eurprd08.prod.outlook.com (2603:10a6:102:e4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 23 Sep
 2021 12:04:42 +0000
Received: from VE1EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:85:cafe::a9) by AM6P193CA0139.outlook.office365.com
 (2603:10a6:209:85::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:42 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT058.mail.protection.outlook.com (10.152.19.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:04:42 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 12:04:29 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 23
 Sep 2021 12:04:27 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:26 +0000
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
X-Inumbo-ID: bee594a9-9cb3-4904-b90c-9dc8498d15a9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+rO+v6pBMqEKBz+SCDWANix+90+cnJn/n9KVtjiQo0=;
 b=2MOS5p1UyWvqnIuwlV79Ydp9CxmTOibh2arjPKx5k/B7ue5keJEiQeB6Mp9sKOWGSPR5Ac3WMem77r0WxY67YCUwTIrueh4DeN9yXgYCZB0Q2WOg0/X8ASZyU1AV773Hnf8XwHhWlQxSG4IZcB1ryoXAFgJsQt+R/kgJ8Nn+cO0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9b7fb2e8a8847eb2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=APOBonax8lrawm65/Zr9s2OdC15waGv8jn1G9Fpf94ySafllh3yw3fwYmZcucoFxoJeqpyWuOl0ln+4723I7aJWFUUIERxspuRw5S47tk1kAzUI3hqVy6zqv+YJNe7+ondutGUVpx+/SedaZi6gHfsOqCBtju0PuEdTrDTSYus+2zb+uZdM7MU0dzuj0ZNy1QI5FRe+QSDMvcbVPYRTd6AAZsCT1b0bxHsJwJPaS6Q1hBkaPcPtQ9ldaR0i8nD2hmH6TWSxHi7Xb0KeRbHvgZOESTC1WBYlWa18/LZh2wUdTtlauy+dYOFMF8xFluk0g7s2OP9dNswR1eyEf5Xsg4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=m+rO+v6pBMqEKBz+SCDWANix+90+cnJn/n9KVtjiQo0=;
 b=X4Ub9wlYfEAiyxgXGE6jEea0hMhLgm5UnB1WZw+gCRfl1XmkAZTVT8OgIbT8omuUtL24toBodBkxMYKhLr/c/ptsDY0btomrGIR55bjPIm87fbXam+QIxev/2o6OmsgFjFpSR2m3h7FIkEu2ODAoAMUsSymzFeb9h9rAzeIrjzWa130/3yR1D5Hw1bxOQPD17Kt/AFnteG1qDViA7AWQ7qNZIYfFgi2mebqZ/RNNUMY2+zE0dJaGH7DYG9VdcCIRPuRgX45JSU5OYo3Ruf9tmabi4h9WOY3+tryV2qnw2X6o0ziZoNIEDT3Zy1Nw3fLviiXjd9Hl9A7dsrOSpo7/ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m+rO+v6pBMqEKBz+SCDWANix+90+cnJn/n9KVtjiQo0=;
 b=2MOS5p1UyWvqnIuwlV79Ydp9CxmTOibh2arjPKx5k/B7ue5keJEiQeB6Mp9sKOWGSPR5Ac3WMem77r0WxY67YCUwTIrueh4DeN9yXgYCZB0Q2WOg0/X8ASZyU1AV773Hnf8XwHhWlQxSG4IZcB1ryoXAFgJsQt+R/kgJ8Nn+cO0=
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
Subject: [PATCH 36/37] xen/arm: Provide Kconfig options for Arm to enable NUMA
Date: Thu, 23 Sep 2021 20:02:35 +0800
Message-ID: <20210923120236.3692135-37-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923120236.3692135-1-wei.chen@arm.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2e9168a5-217d-4c96-fd69-08d97e8a5ff7
X-MS-TrafficTypeDiagnostic: PA4PR08MB6046:|PAXPR08MB7296:
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB729652596DA96F6B3BF1971E9EA39@PAXPR08MB7296.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FWyQ/diQKU/Q8pt8an7uk40O23+6zpoDoIHpzG9wgrk26CgfBxnbGcBgpgdltepkMRpuHgRRfky7V3GF9qV8jZtWTXJJ4wsGbTITKx4g4gFtXAkJnJKWqSyGkjtHTdhI//Se9xaC4pDmRJBzyfww+iJgt6tqJ8HzZT7AowVIc7ZgX9hIJh/tDemF1z3jQFGcNgDV4KxxVFyU0wdpFK82Kr7ZE6FUo3Y0V6Iv4HqhHq4HWPo0i61HC/Y4+Mg9o+pUbNn7ToYTLrk2sse4rPsm2JClWzdlFuMvth57fqbxrb9tcos99nlZElOowfwUewiGHfDtXbkmeLnnHPtWS+k+IREs81O2mGSxczVcNfgzB3kwjf56hNZb7N/K4XxQXonX31A+mXJ5Rzw5Iqya0iXIAqzLqi5txLB2Ufl3Hg2W5ufmmY/0yMYbiXteM+fxqjR8ReAJO/Ld6ACEtWNGcICr8JlKl6ogKCojocG/cvCubcisZ78gjiYWTNDbqOsK9jcPvgw+3f/8Vh45o0atx7+zpIv1hQogRXh/2sAJQkQyj1JSNRcDpPyxL7RVLfPir5jDWtjpstYmeVwpDdXNn+yPaiXJO7yKpNnbEv17DDRQfTpw0J5u6YF4lATQQvODGX0pkiVjWLrvdPft2s5WhQt56ioyMfxkg183jYSO3YRhTHASv0Mw0a3s2AyKaYX7lsGsdEuJ+MzTNp7TYzU7bIEu6exNqk4ZDjgOmivkDc4MbrE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(186003)(36756003)(4326008)(26005)(8676002)(7696005)(6666004)(82310400003)(44832011)(426003)(2906002)(336012)(83380400001)(86362001)(508600001)(81166007)(1076003)(5660300002)(70586007)(2616005)(36860700001)(8936002)(316002)(70206006)(356005)(47076005)(110136005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6046
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7561502b-0e89-4ab2-bb09-08d97e8a53b6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5sHuN9u5bXOmyvJOyj/s0kEhsUsin2fcEWhDSP6nbkmfCsLFJqlNqCPJ9bKGhZq23oWyEyUJjmli3u5/B7pgn+PmY8jf7ylkDVRb7SueK7La/y8lId3P5hTpkKwV7NumhD+SFJfxbXPz+jnIYc8i/iCJUPxf1fXY5SCiouxhQfCeXnyqaP9cO4mhPMJJWQiF7meG+aRFIxRwBY+mH2FIrMT5FMt3/rWNd4h0rileNLeldgFV629sYAKht1QR1oBHKQr94Sy0xLStx/UM5stgnRI8yNiAjCYFN682dVL8uUXWXVUKt2ZJrRJgJoG/+O5wjp8VkvF1UOxkeh9UCAZnDhS2S4PR7IWLJSTfLN1z7ngR1/HWAc8jI/6S14X6+NpIQV3gMpGprWD9BN8Tw4BZPs2XG6nhXL2dZZyWSbctRuav7bR9c7zVSBZy/YOxIEb6RZifQ/BufDhwaL8nx+TnRJoryv6boP8pklBP+6mKBqtNVjD8nBlRF6TfxIUwK3fqu921I580K/r9/FJLOMwwSggAf4Wnf5iYIUj78GXd4v/5cr2AMxIaLyBcA9ywdx29CvI8i3e7/Ha0iYwjzVvmLm1/4nytbw6StGDGHICFinmGj+JQK6o6cqTxHXFCKRJxkyrah4faHyNxWUHBbL1tQ3W5STY+vt9z96THr2rshkaVSUWewBAJM2NZcunEYmFeGRNCshI+MUndoreHqecXYw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(1076003)(36756003)(2906002)(83380400001)(26005)(7696005)(6666004)(36860700001)(2616005)(316002)(81166007)(336012)(44832011)(70586007)(8676002)(47076005)(82310400003)(86362001)(426003)(508600001)(186003)(5660300002)(4326008)(70206006)(8936002)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:05:02.9250
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e9168a5-217d-4c96-fd69-08d97e8a5ff7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7296

Arm platforms support both ACPI and device tree. We don't
want users to select device tree NUMA or ACPI NUMA manually.
We hope usrs can just enable NUMA for Arm, and device tree
NUMA and ACPI NUMA can be selected depends on device tree
feature and ACPI feature status automatically. In this case,
these two kinds of NUMA support code can be co-exist in one
Xen binary. Xen can check feature flags to decide using
device tree or ACPI as NUMA based firmware.

So in this patch, we introduce a generic option:
CONFIG_ARM_NUMA for user to enable NUMA for Arm.
And one CONFIG_DEVICE_TREE_NUMA option for ARM_NUMA
to select when HAS_DEVICE_TREE option is enabled.
Once when ACPI NUMA for Arm is supported, ACPI_NUMA
can be selected here too.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/Kconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 865ad83a89..ded94ebd37 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -34,6 +34,17 @@ config ACPI
 	  Advanced Configuration and Power Interface (ACPI) support for Xen is
 	  an alternative to device tree on ARM64.
 
+ config DEVICE_TREE_NUMA
+	def_bool n
+	select NUMA
+
+config ARM_NUMA
+	bool "Arm NUMA (Non-Uniform Memory Access) Support (UNSUPPORTED)" if UNSUPPORTED
+	select DEVICE_TREE_NUMA if HAS_DEVICE_TREE
+	---help---
+
+	  Enable Non-Uniform Memory Access (NUMA) for Arm architecutres
+
 config GICV3
 	bool "GICv3 driver"
 	depends on ARM_64 && !NEW_VGIC
-- 
2.25.1


