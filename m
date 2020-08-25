Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF16251647
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 12:09:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAVtN-0001cs-M5; Tue, 25 Aug 2020 10:09:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=BGsN=CD=arm.com=wei.chen@srs-us1.protection.inumbo.net>)
 id 1kAVtL-0001cn-UZ
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 10:09:24 +0000
X-Inumbo-ID: 9f1a0cbb-cd8e-44ff-a295-db5b795ae3e8
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe02::622])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9f1a0cbb-cd8e-44ff-a295-db5b795ae3e8;
 Tue, 25 Aug 2020 10:09:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5ZR/LjBGBY1rKi+kfmowQr0nL4cU+Hyz8aX0ZP8Lk4=;
 b=9SzsHoEsUPLeqAQsnftZLDHGgouL+MDaiE5yQucBGYs6w22vtIC5RKgjY/IT1gNrO/K2RzjBpfSJJhNf9uCFdtAuiuNwnAWbinlF7vqJNCHg1OokUzp+8xGLrveDfwCb/zXir7QiSS+fhPRn7vYKnXi6NRH1yFmPNQSWySrEMX8=
Received: from AM6P193CA0053.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::30)
 by AM0PR08MB4051.eurprd08.prod.outlook.com (2603:10a6:208:125::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Tue, 25 Aug
 2020 10:09:19 +0000
Received: from AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8e:cafe::6d) by AM6P193CA0053.outlook.office365.com
 (2603:10a6:209:8e::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25 via Frontend
 Transport; Tue, 25 Aug 2020 10:09:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT046.mail.protection.outlook.com (10.152.16.164) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Tue, 25 Aug 2020 10:09:16 +0000
Received: ("Tessian outbound a0bffebca527:v64");
 Tue, 25 Aug 2020 10:09:16 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 56798a219ec75b2a
X-CR-MTA-TID: 64aa7808
Received: from 4b000a6bc82d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E4039A0F-7FE2-49BB-B948-5F46DEA427D9.1; 
 Tue, 25 Aug 2020 10:09:11 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4b000a6bc82d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 25 Aug 2020 10:09:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J1oDgl9oZnGlXtUJzlRnPJpZq+deDEWgTTwhDZqOmkgD/DCUw88uJ6UR3nnYRUtnKFff9+evPjOk2RdK2RaRzlAPHGHcvlPlGWjiRiPRqoP5Zm/PQKikJOqJFhKs3qLgRrYmVLnPgDxiZCUEmzzF5Y1hK4hBu5a/TzVOuFBBI9fBednCyLs+LQC7opsGp0Y2mh2wsvu54i1qkMyJF9KTpyHF8hIMvkuAU0E1OrtZ/zZv88mgnAoH8KJFfRCmJ8Wd8Q/KjxRC8MRg1L23zQ+O12IBc9uuH7gmUB7K+A0e92rFpJsVurQIIsn/u2MytjLPkQbfcPPC0K+aRsBaY7hdmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5ZR/LjBGBY1rKi+kfmowQr0nL4cU+Hyz8aX0ZP8Lk4=;
 b=N5RX1x4XiG1Opvlhylnxxq/oFJ+xnZ+AQGt8PZnP7gW/dNO5MME2hMSsqDU4drmA4qVeAsnwQ6YzoevrwZTmXWJi2HhO4jMen1SYYLo5y8G35TYFCJPC3uiJKyt4FllmBNKGwiQ+Vul85Ag1w6XYunCt6AuIK8WvPj/Pg8yvHbmhvDtNe8QiWZTxRoZdeX8SNKdYXN1mvGXmFbRpGpOdK2DYkVkaARCCuxUIcQnzCiqUvKLStl/VFlhWXgsJ1x8QYYJoCtx0TbBUZ/sETKig9b4MCfWyvrRpbURHDR9ttBcpMZlvuMM8Q1LzZqhZuA7Z1hdEIqh7eLzSUXHmAgPbTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=bestguesspass action=none header.from=arm.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5ZR/LjBGBY1rKi+kfmowQr0nL4cU+Hyz8aX0ZP8Lk4=;
 b=9SzsHoEsUPLeqAQsnftZLDHGgouL+MDaiE5yQucBGYs6w22vtIC5RKgjY/IT1gNrO/K2RzjBpfSJJhNf9uCFdtAuiuNwnAWbinlF7vqJNCHg1OokUzp+8xGLrveDfwCb/zXir7QiSS+fhPRn7vYKnXi6NRH1yFmPNQSWySrEMX8=
Received: from MRXP264CA0011.FRAP264.PROD.OUTLOOK.COM (2603:10a6:500:15::23)
 by VI1PR0801MB2063.eurprd08.prod.outlook.com (2603:10a6:800:8c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.26; Tue, 25 Aug
 2020 10:09:10 +0000
Received: from VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:500:15:cafe::7b) by MRXP264CA0011.outlook.office365.com
 (2603:10a6:500:15::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend
 Transport; Tue, 25 Aug 2020 10:09:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=bestguesspass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT022.mail.protection.outlook.com (10.152.18.64) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3305.24 via Frontend Transport; Tue, 25 Aug 2020 10:09:09 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 25 Aug
 2020 10:09:02 +0000
Received: from localhost.localdomain (10.169.214.112) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2044.4 via Frontend
 Transport; Tue, 25 Aug 2020 10:09:00 +0000
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
 <julien@xen.org>
CC: <Andre.Przywara@arm.com>, <Bertrand.Marquis@arm.com>,
 <Penny.Zheng@arm.com>, <Kaly.Xin@arm.com>, <nd@arm.com>
Subject: [PATCH v3 0/2] Fix Guest random crash on Cortex-N1/A76/A75 cores
Date: Tue, 25 Aug 2020 10:08:45 +0000
Message-ID: <20200825100847.27988-1-wei.chen@arm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce4b8b92-522e-4447-d654-08d848deed19
X-MS-TrafficTypeDiagnostic: VI1PR0801MB2063:|AM0PR08MB4051:
X-Microsoft-Antispam-PRVS: <AM0PR08MB40511AA3C7635E0EC3683B739E570@AM0PR08MB4051.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: +xqr2HtsmMNE+4R8pUFCYHN1bUuww894nff9os8UEJvVGcWPOFiprEVKo57wbK1I2xsFUT4nSAFtQSLRzDgcfUazt+XoBdbu9Fl9mkKNLxbfd58ab2stWPBJTUG1MqNGwjapGS6TzYYudSdiFH+xkp0b9L+5ekUJQMQ+74VzofF3mK4gy3edk3z8Sby7UDtemIxOreUC0Ei4SjTDXrNN5qZLEsKZB+CgC3Z6lynyhD3qFPSFi+bMxVztx/1QiN6u4GaWY4vb+0/taJRNcTD4F1uN8R3kPyfnk5GL8MeShlNvtaDAkufmHAzV4iomMg/KjyQ+y7erSJH7CBeEiT4CWxlMyc/FmzSc/KUaGqFpWVW19hyI+ZVHNc4zjo4qt54aOXXDUGl5ue58k4SzaWAKAVUtITM5P7f5c4YJTVH0rLF2MjGpEvcnutYCnMXYVac9DdQV/A2IAyBPYAtgoKi3XcTqChe2KlCZc7SQY/R9KeE=
X-Forefront-Antispam-Report-Untrusted: CIP:40.67.248.234; CTRY:IE; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:nebula.arm.com; PTR:InfoDomainNonexistent;
 CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(46966005)(6666004)(2616005)(47076004)(4326008)(8676002)(8936002)(5660300002)(186003)(478600001)(336012)(426003)(36756003)(4744005)(110136005)(26005)(316002)(966005)(54906003)(356005)(82740400003)(70586007)(81166007)(70206006)(82310400002)(86362001)(1076003)(2906002)(83380400001)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB2063
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 932c37e9-7e03-4d6a-d8d5-08d848dee895
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xnTTBxYKtMpCuKNkCwvdS9s08URH+ZAEgjiV7qxY0ExBIu8XFXo2AqTgdod4dnmW1lp02VhQleL18Zky5SHbAkURoa4hJxg2WrFBpoMMJ21plJjfzcIH59kg+0LISBRGbpxS4RBpbC4UNzzKdNPdZKVhlhtXY7addpUR4fETZukFPJjlW8lwn2crH+a58kkbWlP3a+fFTfUSVLECLx/BiYrsDab7f9TdH7y9M3uF8SGBbMp7GVBwgWDlbbIFXCd2e4XmriJmMOsYM4clzXGEf98naKd5OvXNcSGjIkAR3H2dT2uBNxV7PAHQjfJ3IgLqa0mJFqoqU0pySSNNzRsCiEQoVsob141v81OUpPX+PrIX0OwGPSOOwQ69iCkkPyzITXAlrl2A0UU+8jD1ZwFNv3CEpsJTCFIyNWpgRHmrdqJjOfBLlnT17tnwh4ORzlwrigiS4dp8u3Vwiij94RmaZcNeJ1VlwhXdMcRC8xOctXU=
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(39860400002)(346002)(46966005)(54906003)(478600001)(966005)(426003)(4744005)(8936002)(8676002)(336012)(4326008)(6666004)(86362001)(1076003)(36756003)(47076004)(2906002)(26005)(83380400001)(316002)(36906005)(2616005)(110136005)(70586007)(82740400003)(5660300002)(70206006)(82310400002)(81166007)(44832011)(186003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2020 10:09:16.9808 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce4b8b92-522e-4447-d654-08d848deed19
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4051
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On latest Arm Cortex-N1/A76/A75 cores, Xen guests will encouter random
crash when they have wordloads. It's because Xen will ignore FP/SIMD
registers in vCPU context switch (see patch#1 for more details).

This patch set fix guest random crash on these new cores, and throw
messages when Xen detects known FP/SIMD features.

---
 v2 --> v3:
  1. Improve the warning messages to give clear meanings
  2. Fix typos

 v1 --> v2:
  1. Use "< 8" instead of "<= 1" to detect FP/SIMD features.
  2. Give messages for unknown FP/SIMD features.
  3. Fix typos.
 
 v1:
  https://lists.xenproject.org/archives/html/xen-devel/2020-08/msg00857.html


Wei Chen (2):
  xen/arm: Missing N1/A76/A75 FP registers in vCPU context switch
  xen/arm: Throw messages for unknown FP/SIMD implement ID

 xen/arch/arm/setup.c             | 12 ++++++++++++
 xen/include/asm-arm/cpufeature.h |  6 ++++--
 2 files changed, 16 insertions(+), 2 deletions(-)

-- 
2.17.1


