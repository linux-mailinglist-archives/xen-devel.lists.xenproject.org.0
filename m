Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1A12A2D87
	for <lists+xen-devel@lfdr.de>; Mon,  2 Nov 2020 16:02:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.17691.42507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZbKw-0001Cn-KX; Mon, 02 Nov 2020 15:01:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 17691.42507; Mon, 02 Nov 2020 15:01:34 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kZbKw-0001CO-H4; Mon, 02 Nov 2020 15:01:34 +0000
Received: by outflank-mailman (input) for mailman id 17691;
 Mon, 02 Nov 2020 15:01:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qrwO=EI=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kZbKv-0001CJ-Er
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2020 15:01:33 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.14.50]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a7469c7-f9c5-437a-8f77-a208c161ef14;
 Mon, 02 Nov 2020 15:01:29 +0000 (UTC)
Received: from DB6PR07CA0204.eurprd07.prod.outlook.com (2603:10a6:6:42::34) by
 AM0PR08MB5506.eurprd08.prod.outlook.com (2603:10a6:208:17e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Mon, 2 Nov
 2020 15:01:27 +0000
Received: from DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::c8) by DB6PR07CA0204.outlook.office365.com
 (2603:10a6:6:42::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.10 via Frontend
 Transport; Mon, 2 Nov 2020 15:01:27 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT061.mail.protection.outlook.com (10.152.21.234) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Mon, 2 Nov 2020 15:01:27 +0000
Received: ("Tessian outbound ba2270a55485:v64");
 Mon, 02 Nov 2020 15:01:27 +0000
Received: from 7f2b0e6bc2ac.2
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 753343AE-E938-4056-978D-9300F927EBAE.1; 
 Mon, 02 Nov 2020 15:01:03 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7f2b0e6bc2ac.2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 02 Nov 2020 15:01:03 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DBBPR08MB6233.eurprd08.prod.outlook.com (2603:10a6:10:204::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Mon, 2 Nov
 2020 15:01:01 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28%6]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 15:01:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qrwO=EI=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kZbKv-0001CJ-Er
	for xen-devel@lists.xenproject.org; Mon, 02 Nov 2020 15:01:33 +0000
X-Inumbo-ID: 1a7469c7-f9c5-437a-8f77-a208c161ef14
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown [40.107.14.50])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1a7469c7-f9c5-437a-8f77-a208c161ef14;
	Mon, 02 Nov 2020 15:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaEQNjMOgQnE4pUoDXwLH+fGx6hSaobFsJPsMkK+0UQ=;
 b=AeLybA7sIW+4p3EEMEv2YM6Abn/nBLVc+75Abm4kr9zpJFJjEODKtIXCZ+3Ksjs+DhEis2Qa8KzgaeorbYnBoFjSzZwicTfvzCD6KLIcpTRmFnM6GpsB6NnmNjLYcVsKEnAN7ZbcigL+b6dj7lqindb4dQCMurEsbgiOWZrWOlc=
Received: from DB6PR07CA0204.eurprd07.prod.outlook.com (2603:10a6:6:42::34) by
 AM0PR08MB5506.eurprd08.prod.outlook.com (2603:10a6:208:17e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Mon, 2 Nov
 2020 15:01:27 +0000
Received: from DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:42:cafe::c8) by DB6PR07CA0204.outlook.office365.com
 (2603:10a6:6:42::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.10 via Frontend
 Transport; Mon, 2 Nov 2020 15:01:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT061.mail.protection.outlook.com (10.152.21.234) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3520.15 via Frontend Transport; Mon, 2 Nov 2020 15:01:27 +0000
Received: ("Tessian outbound ba2270a55485:v64"); Mon, 02 Nov 2020 15:01:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c41971efbfeabcda
X-CR-MTA-TID: 64aa7808
Received: from 7f2b0e6bc2ac.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 753343AE-E938-4056-978D-9300F927EBAE.1;
	Mon, 02 Nov 2020 15:01:03 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7f2b0e6bc2ac.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 02 Nov 2020 15:01:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VHgSWPIlnMpWLdIQHsToT3LPjEkJdDTz9a77yeozOqCGwvs1h2GxjuOs68us+gVVbPPDsE54oprzyB3j/SLwH/8dkm5fBrLgiZ5O1pCQ1Ico2gFnhO82sUaQD6qTrwu6TLLlbIB6lCSINaWOIMn4ASBrpqscrF4EKq+FNXvfzxEEVjv0WLEcEZaBC/21mMOoBMHPnGamvzBAPSOu2vBjNiTLtxxV8/hrw2JjL9B2hzzcYCCcD/+DFo4L9A2msS7Ex72zGB0vTS8btFMG0oc4OFEPbHGDv+/fWXGbIo2IUFPPSKG/rcGtpk4yCRtXwuYMs778jxl9z73e86F7J1znRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaEQNjMOgQnE4pUoDXwLH+fGx6hSaobFsJPsMkK+0UQ=;
 b=a7W2LOIV1/wirexUAfd6xnZtNTMSvuhvzalW3UQWeMvHl2Gcs3VrtiAhZYLOKPh8HLU6LQ5k1rfQ8OfrRUf7o6Q4/4kt2dli3vx2DiPqkOJoB5eUIzwr+9wlPasPF7Klb/QqBQlQHNWvFePBdfK7+qUiDyAFiWRRnuzE9tRT5nIMBCNhfKNPGKtGdXTsN4rWZd3qFzyYreRzQ/KTGENcULTqokE6wJvtaHkdStJ2QcesfrLSSvf25lGmmtZt1ZrazadsMQtTJEupnZF1bqkIzXksDmytBUguOiFL2Pur19JSBG2enpuub8JQnRxds68moUMcns/pqDur3UI9moDIQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AaEQNjMOgQnE4pUoDXwLH+fGx6hSaobFsJPsMkK+0UQ=;
 b=AeLybA7sIW+4p3EEMEv2YM6Abn/nBLVc+75Abm4kr9zpJFJjEODKtIXCZ+3Ksjs+DhEis2Qa8KzgaeorbYnBoFjSzZwicTfvzCD6KLIcpTRmFnM6GpsB6NnmNjLYcVsKEnAN7ZbcigL+b6dj7lqindb4dQCMurEsbgiOWZrWOlc=
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com (2603:10a6:10:49::10)
 by DBBPR08MB6233.eurprd08.prod.outlook.com (2603:10a6:10:204::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.29; Mon, 2 Nov
 2020 15:01:01 +0000
Received: from DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28]) by DB7PR08MB3500.eurprd08.prod.outlook.com
 ([fe80::e089:1ed3:63a0:2f28%6]) with mapi id 15.20.3499.030; Mon, 2 Nov 2020
 15:01:01 +0000
From: Rahul Singh <Rahul.Singh@arm.com>
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>, Oleksandr Andrushchenko
	<andr2000@gmail.com>, Julien Grall <julien@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Jan
 Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Topic: [XEN PATCH v1] xen/arm : Add support for SMMUv3 driver
Thread-Index:
 AQHWoVvrkmJwOYERdUOadvid1OghFamwEIWAgABuPwCAA/gngIAAQvMAgAAErACAAFCygA==
Date: Mon, 2 Nov 2020 15:01:01 +0000
Message-ID: <932EA344-D673-49A0-B919-F505EB43F211@arm.com>
References:
 <b085e894773842ac320b818aa6f84289d0a128ed.1602591365.git.rahul.singh@arm.com>
 <09cfc160-3490-0aeb-f872-04fb4ce04364@epam.com>
 <76593217-c7e2-2963-9cbe-d6cc38830710@xen.org>
 <d83f6859-6737-0da8-7c1d-a236e8313869@gmail.com>
 <B8E54A16-8FD4-48E4-82D5-2205EEEB5D2C@arm.com>
 <1001ace5-c6a2-4a81-ba3d-edabeeea9336@epam.com>
In-Reply-To: <1001ace5-c6a2-4a81-ba3d-edabeeea9336@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
Authentication-Results-Original: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 93bcbb26-2cc7-4ec2-a40b-08d87f402c65
x-ms-traffictypediagnostic: DBBPR08MB6233:|AM0PR08MB5506:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB5506CD6023F1EF7920F0B526FC100@AM0PR08MB5506.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 W0LownhjIfRiMhQPH6IVUFKTAdz/BMFAV2JJgIEAFiXHt3Gddhq4eYRsdXdLvq6+v93rroqMdf1WXlu1RSGnIV+hAnpLa6uFuZXFjUjALW0y06PaCWpw4/vfMfTIVQ6Qq1qLVzdO15J7snDA8BbI5EkX5D2B3eQs9iQwqjH5mZSLcyqk5wDKII4YXBdWWRi361jdtwJ/lh+Uya2wpIxrSHfWKqZio3JLZ5XmQDmWbRhQxqce98KlIPi4NlwiSYUwVe8MiY5YQJ5ZYpx1zfhGOMjcpgXYO+c42dF1YzHPQ/i1VNYB2lRoY0T0VN+Dc8GesLoEMKvxxU3GTvO5OeJmoA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3500.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(8936002)(8676002)(4326008)(33656002)(54906003)(6512007)(36756003)(26005)(86362001)(6506007)(2906002)(186003)(6486002)(2616005)(53546011)(478600001)(6916009)(64756008)(66556008)(5660300002)(91956017)(71200400001)(316002)(76116006)(66446008)(66476007)(66946007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 BRnlfceNR/mRMNKR5ptNAzfZZPZjkabWzh6cbIYf0Q7pWYDmmv3xHN48Jyd4TZsi/cJdx/wDfuMvyJQdqnU8/LeL3oY+J/p1eiRCbJvZsoQHLnHjj1H/CadzqjAtIBh87znUUHDFf5gcySrWjSjp5X4jdCmLwGHeAGDHXoJGgJlYPXgPZCa3Xh2g495aAbPxOu4kRTMLOdM+wmLutIp8Qr8Hyzy3DyL9lqh2r+xSycbZL+r5P51pNoSOtACk+TBEDdcfLkz1TQC8dGUB0uD51LZnJyGqY1Le4b3ZF570LXKnkAbZYSqqiX0Ey9wOcahQI0ZC37cPmdEF8Wg+8a4T6P98J4dOJR4MshjYQwvdXb1MjYR3EbJoZ0tn/NUp20F5RgwEH7cye9kZkmaSmf90CXa0bRwk6QXnnez4mZC+1wd0uKLyeteEnw4RGSrIo2O0JTsRfvAyIWspuSsNhYgnoaYMj9xfktcbo7yy6gTmL+tZq1igdSz2D6H6Om1lFwPA0HGlG6VkeQ15nr/uDF8AsN9BBMVs5uGcKdOncAL/KNAp1hSu3iyUoqJ4IDWcdS1sqQoApN4lGkzLwTn46N4Y+vweUdV6EHi3tMy9CLh1AWzV/mS111zuckR33iUF9OF6wlEaify8NxbQU+6vgeJNAg==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <CABC18CC94F24B4EAA06A3BCF71F4262@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6233
Original-Authentication-Results: epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	fd225763-bc09-44e9-4d43-08d87f401d3f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	LA9WjY8hZnOHIkF2SoZSn15IFHO19qM14fRe5ZYVsG7bl9hiHE/k2S5s/UIT8ag/SEGPOM4r8sSKUcrlnnzZyPxaNo2FeK6ceUYBrrmulHAmEYm8J+h5QP1ssyWBqD7L1IrucrjV60ihHaaGMzbY4pz1qeGxVoIjSjnriYQNgY5RN3n230qLqkCbZPgmEIpuB58AEuceM+hzxosI+TV7uFtRemPG6nsedv9XtJhz/HCwCPG0rfaaitkb/uXppKB/JEoz9zr9v6c/HBEeXfcsRJrk8sElTfEDLKwvQ5IwQwGr3mSkaZkysV00NiTfpLVgJLB4T4EAtzEoXfdK0jsueBoYaQGxhyou9GsqAb65Y6rdL5IWZAdY4jwjXWgwYKSvUaU/rqv5RP0T1sLaKHkUxA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(346002)(396003)(46966005)(81166007)(70206006)(26005)(82740400003)(47076004)(8936002)(82310400003)(336012)(2616005)(6862004)(5660300002)(6512007)(6506007)(53546011)(8676002)(4326008)(316002)(6486002)(186003)(36756003)(86362001)(478600001)(107886003)(70586007)(2906002)(356005)(33656002)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2020 15:01:27.2348
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93bcbb26-2cc7-4ec2-a40b-08d87f402c65
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT061.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5506

Hello Oleksandr,

> On 2 Nov 2020, at 10:12 am, Oleksandr Andrushchenko <Oleksandr_Andrushche=
nko@epam.com> wrote:
>=20
> Hi,
>=20
> On 11/2/20 11:55 AM, Bertrand Marquis wrote:
>> Hi,
>>=20
>>> On 2 Nov 2020, at 05:55, Oleksandr Andrushchenko <andr2000@gmail.com> w=
rote:
>>>=20
>>> Hi, Julien!
>>>=20
>>> On 10/30/20 7:18 PM, Julien Grall wrote:
>>>> Hi Oleksandr,
>>>>=20
>>>> On 30/10/2020 10:44, Oleksandr Andrushchenko wrote:
>>>>> On 10/20/20 6:25 PM, Rahul Singh wrote:
>>>>>> Add support for ARM architected SMMUv3 implementations. It is based =
on
>>>>>> the Linux SMMUv3 driver.
>>>>>>=20
>>>>>> Major differences between the Linux driver are as follows:
>>>>>> 1. Only Stage-2 translation is supported as compared to the Linux dr=
iver
>>>>>>      that supports both Stage-1 and Stage-2 translations.
>>>>> First of all thank you for the efforts!
>>>>>=20
>>>>> I tried the patch with QEMU and would like to know if my understandin=
g correct
>>>>>=20
>>>>> that this combination will not work as of now:
>>>>>=20
>>>>> (XEN) SMMUv3: /smmuv3@9050000: SMMUv3: DT value =3D eventq
>>>>> (XEN) Data Abort Trap. Syndrome=3D0x1940010
>>>>> (XEN) Walking Hypervisor VA 0x40031000 on CPU0 via TTBR 0x00000000b84=
69000
>>>>> (XEN) 0TH[0x0] =3D 0x00000000b8468f7f
>>>>>=20
>>>>> [snip]
>>>>>=20
>>>>> If this is expected then is there any plan to make QEMU work as well?
>>>>>=20
>>>>> I see [1] says that "Only stage 1 and AArch64 PTW are supported." on =
QEMU side.
>>>> Just for clarication, you are trying to boot Xen on QEMU, right?
>>> Exactly
>>>> You might be able to use the stage-1 page-tables to isolate each devic=
e in Xen. However, I don't think you will be able to share the P2M because =
the page-tables layout between stage-1 and stage-2 is different.
>>> So, it is even more work then
>> Overall it would make more sense to spend some time adding proper suppor=
t in Qemu then trying to modify the driver to support Qemu right now.
>>=20
>>>>>=20
>>>>> We are interested in QEMU/SMMUv3 as a flexible platform for PCI passt=
hrough
>>>>>=20
>>>>> implementation, so it could allow testing different setups and config=
urations with QEMU.
>>>> I would recommend to get the SMMU supporting supporting stage-2 page-t=
ables.
>>> You mean in QEMU?
>> See before.
>>=20
>>>> Regardless that, I think Xen should be able to say the SMMU is not sup=
ported rather than crashing.
>>> Yes, that would be nice
>> Fully agree and we will look into that.
>>=20
>> Anything you could share so that we could quickly reproduce your setup w=
ould be more then great.
>=20
> Nothing special,
>=20
> qemu/aarch64-softmmu/qemu-system-aarch64 -machine type=3Dvirt -machine vi=
rt,gic-version=3D2 \
>=20
> -machine virtualization=3Dtrue -cpu cortex-a57 -smp 4 -m 2048 -nic user,h=
ostfwd=3Dtcp:127.0.0.1:2222-:22 \
>=20
> -nographic -serial mon:stdio [..snip..]
>=20
> I also set iommu to smmuv3 in my tests, QEMU emulator version 4.2.1

Thanks for sharing the information. I will also try to reproduce the issue =
and will let you know the results.

>=20
>>=20
>> Regards
>> Bertrand
>>=20
>>>> Cheers,
>>>>=20
>>> Thank you,
>>>=20
>>> Oleksandr

Regards,
Rahul


