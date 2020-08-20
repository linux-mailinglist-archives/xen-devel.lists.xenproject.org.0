Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDA024B72A
	for <lists+xen-devel@lfdr.de>; Thu, 20 Aug 2020 12:48:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k8i6l-0005RK-1i; Thu, 20 Aug 2020 10:47:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WowR=B6=arm.com=diego.sueiro@srs-us1.protection.inumbo.net>)
 id 1k8i6j-0005RF-Db
 for xen-devel@lists.xenproject.org; Thu, 20 Aug 2020 10:47:45 +0000
X-Inumbo-ID: c9e5ea84-83bf-48a5-af18-9c284a47e5e8
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.58]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c9e5ea84-83bf-48a5-af18-9c284a47e5e8;
 Thu, 20 Aug 2020 10:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZpCkk+t0O1+/fDGWt4Akfs3tDNz6wzlxduszvt3SXk=;
 b=JuWyv5OOEM1+9nm/PBLsk+CSCJ7Uda9s4s4EOjt5BNi4fsA54FfJMHQot2RbJREmi+AezUFvvJmpbhgV9FiqaofF5fQI5d20T7I9TWDdRV/vxvzU/2AKEkWgS6uaO4bIvH308IPtxRoojK7YYoIHGUm8VF5eS8IsXb9rPIhOBUA=
Received: from DBBPR09CA0029.eurprd09.prod.outlook.com (2603:10a6:10:d4::17)
 by DB6PR0801MB1832.eurprd08.prod.outlook.com (2603:10a6:4:3c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.22; Thu, 20 Aug
 2020 10:47:41 +0000
Received: from DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:d4:cafe::f0) by DBBPR09CA0029.outlook.office365.com
 (2603:10a6:10:d4::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.24 via Frontend
 Transport; Thu, 20 Aug 2020 10:47:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT022.mail.protection.outlook.com (10.152.20.171) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3305.24 via Frontend Transport; Thu, 20 Aug 2020 10:47:40 +0000
Received: ("Tessian outbound bac899b43a54:v64");
 Thu, 20 Aug 2020 10:47:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d4e3161648d2aa11
X-CR-MTA-TID: 64aa7808
Received: from 4c3a486f8f79.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 DB0B4DF8-AD5D-46D4-A3ED-B34EA273CAAB.1; 
 Thu, 20 Aug 2020 10:47:11 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4c3a486f8f79.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 20 Aug 2020 10:47:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hGRgb2/cZUX0CFpwbNAGDB4XO5+PJufuuumQMee4eYj1q+uVbTLakYoI9XcQtW7oXx2QNENrTUy9cXxnJpXwoQkKHR0gyp8E+J/0JXsaQbP4zq3718vslXu6evtW0EJYkuIdqoi6u1K5MKI09BExPraBvuxtGpPs0fEEdVnxx8MsEbyITJlEjFYa60HUfpamTUZ/JEx1DblfhiDUnt8hvGSFQtYsiI6ivqztthnBhscHU0nZZ4oD76E3FiGF1TVyrBnw0r3QVbwsFPlRDKNS1SfiwM6QV5iF3c4dm8CGDe9EJ9lUM7KPIUhLVePxAR1zayZxGa447kCTEvsQwP9NgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZpCkk+t0O1+/fDGWt4Akfs3tDNz6wzlxduszvt3SXk=;
 b=BouUpWwJDsgHFSEk2EWIa0WYbJMXl3ZEEe2FraYJuDyX2kXak+Xy5B4+ONkOwHUO69wg0hgKPMdAaJTBF1H7AiNssoUmPLBjFAWOXnTOrzQtnjZ/VGN4QeWrrgqj2ssgbnN05BIu9ntvSpvCBguCEkIkERPWqNjs4iv08BiKwBpmZY8vd4WXIBJkCIxPKOWkvoQZyHF83Zh86q6Qg5HU4Se3g71JPuS49/ZFHMQ+b/r1Hw6nQ+gAwjonJH537DG5qUcXZnj7aPSZUvONKXPOiWhttdAR7h6Mvo+IWTSq1gbHc7HlL3KKLfVEo8tv1VDdMSosKBlourunKhLt8IGFxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AZpCkk+t0O1+/fDGWt4Akfs3tDNz6wzlxduszvt3SXk=;
 b=JuWyv5OOEM1+9nm/PBLsk+CSCJ7Uda9s4s4EOjt5BNi4fsA54FfJMHQot2RbJREmi+AezUFvvJmpbhgV9FiqaofF5fQI5d20T7I9TWDdRV/vxvzU/2AKEkWgS6uaO4bIvH308IPtxRoojK7YYoIHGUm8VF5eS8IsXb9rPIhOBUA=
Authentication-Results-Original: lists.xenproject.org; dkim=none (message not
 signed) header.d=none; lists.xenproject.org;
 dmarc=none action=none header.from=arm.com;
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com (2603:10a6:20b:47::28)
 by AM6PR08MB4182.eurprd08.prod.outlook.com (2603:10a6:20b:ae::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3305.25; Thu, 20 Aug
 2020 10:47:10 +0000
Received: from AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255]) by AM6PR08MB3461.eurprd08.prod.outlook.com
 ([fe80::8016:e0c:484c:4255%4]) with mapi id 15.20.3305.024; Thu, 20 Aug 2020
 10:47:10 +0000
From: Diego Sueiro <diego.sueiro@arm.com>
To: xen-devel@lists.xenproject.org
Cc: nd@arm.com, Diego Sueiro <diego.sueiro@arm.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 0/3] tools/hotplug: Fixes to vif-nat
Date: Thu, 20 Aug 2020 11:46:40 +0100
Message-Id: <cover.1597920095.git.diego.sueiro@arm.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: LO3P265CA0009.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:bb::14) To AM6PR08MB3461.eurprd08.prod.outlook.com
 (2603:10a6:20b:47::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e120809-lin.cambridge.arm.com (217.140.106.54) by
 LO3P265CA0009.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:bb::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3305.24 via Frontend Transport; Thu, 20 Aug 2020 10:47:09 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [217.140.106.54]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9878a33c-5d1c-4a5e-e31a-08d844f67642
X-MS-TrafficTypeDiagnostic: AM6PR08MB4182:|DB6PR0801MB1832:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB6PR0801MB183231C653E69C207DF78A7D925A0@DB6PR0801MB1832.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: Gv+2RMa/evqg2d6gigb6ic105gGos4vXmCzbYrw+s4lDDjH/t8lLJjkvSLVMm3B3zI3oVU1FoWV7x1ibROXA1QtVF0+4BKc/VLZA/GYtCNSZiLyltGl8aJ/VzT+8xoc/3ckhpo8BKudo3UwvnED8QC1B91waYSoeKdhcPeZMFot1g9P8MWFocKlFLtdE7oha7G6izICTo5TJF9+OM1MqXkpsI+uOJsovyRJVaax0Igm44AzPZyzn+lK+Gg2JpHtZ3cT4DNA2pK3XtrvylOHXfvBsSIkufuKxWOSod60JmXavk1ivopIP7ijGaMbBDFQWYXIqQFaA8tP9empAQZMPBFCqzYyvtKN827Jm7xoOK6x47maNs8Cvz124+viOhjLR
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM6PR08MB3461.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(376002)(39860400002)(396003)(6666004)(4326008)(83380400001)(8676002)(36756003)(8936002)(956004)(2616005)(6916009)(44832011)(4744005)(6486002)(316002)(5660300002)(52116002)(186003)(478600001)(66946007)(26005)(7696005)(54906003)(2906002)(86362001)(66476007)(16526019)(66556008)(136400200001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 1wDveLVKhzhYQ+7VxSkfgkl7Ucwucr1mNoHgISMH368JWQiYaT14SzDNocjL9Jg+TuuYuHu+WKnjeYl6ve5aB0ugMCYUEOPZmPpbL6CDn5pLJj2z8irV55NSecjeM9sacyLq35KPZuZb3R9w4zSxBwh4DCaK4UIyhORRA0GgneS10tUezF9qMjGk3KI4IXKJ6Cxev5f00qJpA+wPTqe3fyvhR2yl7KLKsue4pRloyr60y9jdLCFNY0aH8H3WQ3jvfBEqtCpyWNsMPgeK1ONtWV4RmGAC+wRKcbk9GPaFq3kpiwRihDmawq062Npus0sQPm1tnAxzYKp3A1y7vvO/pE4k827oayKiUxnYzKVQfiJAM2KtdsB0LrGDqMq2he/cjOAjCnbPT/pBzz2z8VsyuCYIqAACzaEvF4UNP11gU1OAV1rkM3YmyodkXZcWYgl7kG81Al7sySOxqEz3ubvrwX5j73zmSgVeKdN7sbjM9uQibdTvNii02JI9RS5r145hzGqJtoELAcp9pDf1y0mNP7QeDkOKs2fbAyRJty10TbVQctW1kHnYoTbHXFdBE9LljNl5P+etDFpse8uTOOAe8nA4qUizsCugV0MhxA8pHB0wslmBcDarrs3wTGfo+puwGFtVGzVx/wjYBUo1QnhScg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4182
Original-Authentication-Results: lists.xenproject.org;
 dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: d4517d0e-2506-4e66-9f04-08d844f663bd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JEkk+iTU/IrzRrX9xezv8Yn0YlTH1Q+ZaklGg/T2kNGW9GpcQkdT76podbdu+/ntP92IbYV8lwaZGhMu+rMTRl22v998+uzFtsGvnubvWjVx7HptyTK0PMt2AxrOsYkGGfNMt3717T6q4CDHgjsCc2fd2u9wofCmcOkAsOovwV1UETQVCf458NBqXoLOPZ2uG1eclCXNeJ3xyiKqqoDMj0UZp7bBCvvVtPYOP7rEugoPW2t6pLz7cLlwHof5Vpy2cJS/2Bk54E027B22qO+cqSBZGeJU9z9gF4ZyFe89pd8BNwGXg5hiYZCIWpxYnNbH6UCryTgkHKupFYxbNlVAa6+sHgHSW2lGVttSX5K5IiFAYShD6S+xoIgwzko3qM+wl640MPVdeZ4KCkTZQiatjLf3fJINJCzY8CjmhaMD/voc6Rdg8ELtWvGFDq5Gw+9c
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(346002)(39860400002)(46966005)(478600001)(8676002)(82310400002)(47076004)(82740400003)(2906002)(70206006)(6486002)(26005)(336012)(8936002)(7696005)(70586007)(316002)(54906003)(44832011)(2616005)(4744005)(86362001)(81166007)(83380400001)(5660300002)(356005)(6666004)(36756003)(956004)(4326008)(186003)(6916009)(16526019)(136400200001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2020 10:47:40.9593 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9878a33c-5d1c-4a5e-e31a-08d844f67642
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1832
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

This patch series fixes issues around the vif-nat script when
setting up the vif interface and dhcp server in dom0.

It has been validated and used in Yocto and meta-arm-autonomy

Diego Sueiro (3):
  tools/hotplug: Fix hostname setting in vif-nat
  tools/hotplug: Fix dhcpd symlink removal in vif-nat
  tools/hotplug: Extend dhcpd conf, init and arg files search

 tools/hotplug/Linux/vif-nat               | 14 ++++++++------
 tools/hotplug/Linux/xen-network-common.sh |  6 +++---
 2 files changed, 11 insertions(+), 9 deletions(-)

-- 
2.7.4


