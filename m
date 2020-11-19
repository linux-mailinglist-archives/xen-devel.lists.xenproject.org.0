Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 367DA2B9A74
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 19:17:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.31278.61658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfoUC-00081F-L4; Thu, 19 Nov 2020 18:16:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 31278.61658; Thu, 19 Nov 2020 18:16:48 +0000
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
	id 1kfoUC-00080h-HN; Thu, 19 Nov 2020 18:16:48 +0000
Received: by outflank-mailman (input) for mailman id 31278;
 Thu, 19 Nov 2020 18:16:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zZym=EZ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1kfoUA-0007zG-B6
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 18:16:46 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.49]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8cf81dd-9269-4f3d-8e3f-64eb7cea07b1;
 Thu, 19 Nov 2020 18:16:44 +0000 (UTC)
Received: from DB6PR0301CA0078.eurprd03.prod.outlook.com (2603:10a6:6:30::25)
 by VI1PR08MB4032.eurprd08.prod.outlook.com (2603:10a6:803:e2::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Thu, 19 Nov
 2020 18:16:41 +0000
Received: from DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::6d) by DB6PR0301CA0078.outlook.office365.com
 (2603:10a6:6:30::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Thu, 19 Nov 2020 18:16:40 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT048.mail.protection.outlook.com (10.152.21.28) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Thu, 19 Nov 2020 18:16:40 +0000
Received: ("Tessian outbound fcd5bc555ddc:v71");
 Thu, 19 Nov 2020 18:16:40 +0000
Received: from 5fddd674a043.3
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 710755C2-4B53-4FEE-8287-6CE18D68A128.1; 
 Thu, 19 Nov 2020 18:16:34 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5fddd674a043.3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 19 Nov 2020 18:16:34 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4538.eurprd08.prod.outlook.com (2603:10a6:10:d2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Thu, 19 Nov
 2020 18:16:31 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737%7]) with mapi id 15.20.3564.028; Thu, 19 Nov 2020
 18:16:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=zZym=EZ=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
	id 1kfoUA-0007zG-B6
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 18:16:46 +0000
X-Inumbo-ID: d8cf81dd-9269-4f3d-8e3f-64eb7cea07b1
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown [40.107.2.49])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d8cf81dd-9269-4f3d-8e3f-64eb7cea07b1;
	Thu, 19 Nov 2020 18:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1gDaQBXj71zio6oakGrC5v+bim1fumny6+u3JxWrjeI=;
 b=2NwyS5zsx+nNAQpRTILIlBXZHbyUzLBnI77dVCZCNx/qH68ndcSt4FZwr98d3pEHGN2I5DQtdVXwPlXYqzEOT4Pg+hcbrjyyXaRqYRzakBl9KRRmByETAvkhQy8zPK+F21BFT5VNCiRiMlMRiDXcsjzoK7rejFwkNlKwODEjlC0=
Received: from DB6PR0301CA0078.eurprd03.prod.outlook.com (2603:10a6:6:30::25)
 by VI1PR08MB4032.eurprd08.prod.outlook.com (2603:10a6:803:e2::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Thu, 19 Nov
 2020 18:16:41 +0000
Received: from DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::6d) by DB6PR0301CA0078.outlook.office365.com
 (2603:10a6:6:30::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.20 via Frontend
 Transport; Thu, 19 Nov 2020 18:16:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT048.mail.protection.outlook.com (10.152.21.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3589.20 via Frontend Transport; Thu, 19 Nov 2020 18:16:40 +0000
Received: ("Tessian outbound fcd5bc555ddc:v71"); Thu, 19 Nov 2020 18:16:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9b30b564a70646c8
X-CR-MTA-TID: 64aa7808
Received: from 5fddd674a043.3
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 710755C2-4B53-4FEE-8287-6CE18D68A128.1;
	Thu, 19 Nov 2020 18:16:34 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5fddd674a043.3
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 19 Nov 2020 18:16:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zoo1P756vqIA4oNYx4B04EBBJ3LjLVjVxnwlsXKUP7KcVCSv2VVuXGX9elHMySE7NHMZowgoLdgIFKotghYBla2BfHkTc5drZcdOnsTIKCm2Nhci/rwfxxp4TqTC4ppvduydYUQBXaRzcCerIBKQqsQMzESZyYk6weIrYNzqw2K8Pt3QIHf08mSmz3liVUOlCvX0bF2XYUM3WjJwxWhacN6UWg26BnJ2+0LRoWHkEfayTTh4j4AGnc7pm1UxWPxNn5P0TohLn5W/OnPycj+GGf9ePDp0Pmjssv+mdg/1UJZ5vNU7iKFUMfP0teFPBFLNiqPslhI/qwTMoi1GT7V0KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1gDaQBXj71zio6oakGrC5v+bim1fumny6+u3JxWrjeI=;
 b=DqMSdc4tbjwh7owLg454pfao96Gukt+Hj0pd4JueZwZVEHmH+k/Oc6w0MbndW7xkVr7z80OHVaAAbEPXZe30NOLXbhI8pAwssXzKQStRaDy0sw+s7eiHR3yuNTK9v6PHTM8bZHyW+suk5BdxNGBPMEwFXsftfIWnRXfXPqk5Nt1cKC90ohaGLaxLTOhsJF4WL/0CeCrJR1FkdotdzgPek/Cj/t4hSEBbmkPkCVEih1KlgZAxeJlLxykHP8IH4j1rjhpW6+GD2SOp6ydcta8ZdTtmLdxI/YwIyECCstrQQ7/X5QcBdeVJkILFVd0cRHNdja3An4ClH3sG3AeaI1VUDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1gDaQBXj71zio6oakGrC5v+bim1fumny6+u3JxWrjeI=;
 b=2NwyS5zsx+nNAQpRTILIlBXZHbyUzLBnI77dVCZCNx/qH68ndcSt4FZwr98d3pEHGN2I5DQtdVXwPlXYqzEOT4Pg+hcbrjyyXaRqYRzakBl9KRRmByETAvkhQy8zPK+F21BFT5VNCiRiMlMRiDXcsjzoK7rejFwkNlKwODEjlC0=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DBBPR08MB4538.eurprd08.prod.outlook.com (2603:10a6:10:d2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3564.28; Thu, 19 Nov
 2020 18:16:31 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::39b7:6f9f:d046:e737%7]) with mapi id 15.20.3564.028; Thu, 19 Nov 2020
 18:16:31 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
CC: "open list:X86" <xen-devel@lists.xenproject.org>, "alex.bennee@linaro.org"
	<alex.bennee@linaro.org>, Andre Przywara <Andre.Przywara@arm.com>, Rahul
 Singh <Rahul.Singh@arm.com>, Julien Grall <Julien.Grall@arm.com>, Julien
 Grall <jgrall@amazon.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v4 3/3] xen/arm: acpi: Allow Xen to boot with ACPI 5.1
Thread-Topic: [PATCH v4 3/3] xen/arm: acpi: Allow Xen to boot with ACPI 5.1
Thread-Index: AQHWvpapKLofsEj7tESNWS0wcJnqO6nPwwiA
Date: Thu, 19 Nov 2020 18:16:31 +0000
Message-ID: <24299314-EDE1-451C-89E5-CDEEB5A6614F@arm.com>
References: <20201119170829.9923-1-julien@xen.org>
 <20201119170829.9923-4-julien@xen.org>
In-Reply-To: <20201119170829.9923-4-julien@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-mailer: Apple Mail (2.3608.120.23.2.4)
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.9.225.195]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 137bb62f-6c65-48bb-aebb-08d88cb74320
x-ms-traffictypediagnostic: DBBPR08MB4538:|VI1PR08MB4032:
x-ms-exchange-transport-forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB4032202F4B9AE7F0854512359DE00@VI1PR08MB4032.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 UBAgCyygn8zbyKmeDmkGhNVv1UGoPL3SF7+8ZzIUIZAgHSe6V3UT4DZSPT+vyZR+RAAkMaXYyv76dJE8m268Rm7r6z1/1yVOemjQtvdCcMcLp4YbvWYI5Uq5iidE0xaDsSmOtqXHsuXl6Z5WXNK/KP3K+dw4B4yOxZmfn3Pu7MI9mnAMSxkBFMkfH0gFQMnNFalWHHelCszU+/9zrNDbbaYqJIm3+puq4zouhtaKMS8tPq6hMESH6EZ3hxCrOMJho3zVyBzMdHK89MJI9Rn5uxBx0JdA/emO1QshrGSzp8cD69BQUq5W3V0eZC9AKy9kGG9MOCRgWXsKM+sHjvaAvA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3689.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(39860400002)(346002)(366004)(396003)(2906002)(66446008)(66556008)(66476007)(6916009)(66946007)(8676002)(8936002)(71200400001)(6486002)(86362001)(76116006)(91956017)(36756003)(5660300002)(6512007)(33656002)(4326008)(54906003)(53546011)(6506007)(26005)(64756008)(186003)(2616005)(478600001)(83380400001)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata:
 QJrF/7XYENpfM/Ymd1ctPe4QcVimVbG/e6tgeXOGjGtfA82xTMIfUoXxC/UZIomKBNKYLVt9Rj5d7X/oiJe4xjoxpx5KkOpyML3jNn5N0ZtcEGC5LXztoXJe5XXq0/CanQYIlSJ+Pe1wUHz1cLdD8/RsKz5KNoT4vCQ3Owgl1uvXvM/muPg+Hb0/6S52yfi57DQ97us91LugwnID2MQldY4ZFPuIOryLrfTOQZReLWi+UXhMTvOFAHIT0J+3FWWkk2S/W7F2IOJrN2gjfFcXLRGvKEuy1m/VN4hn8W1A2eb1ZhE2sG/fhUpYXGPnGT3rJIzZ9yJ+mTWYmGacO0Hdhg5XDbzrQlk9WgI2usJelZJ1RoKBUQ+xs9tUBKv6PJKfhTz7nFQMvt3MaBa10Drsuw7xmWbrw9BxHPqkdSyBl48QvO7Nht3HbCB8n+U08qRrfargwFLuFVhGimhtYQ7zUOq0DbVCgkLWBfx6uhlG9Lfjx81FxNIFkPa85kd7X4A2sMBPj+/QMBbeG7mSY5hOfciiurfxvR1vMRyU2IVktCWwsKOUi8ZSIz0h72y+5p1v27a+H/GXqzYaTRcE4OLHMgraQR1cr45QA8gpn4NgR7mf0gNiuId4FWaq05eD7CrQtIvTHI7G+ltmdySJgxHKCw==
Content-Type: text/plain; charset="us-ascii"
Content-ID: <BB3A8AF1FD0E1B4FAD9F9D93690DF41C@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4538
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c3b596f8-2dbd-480b-e564-08d88cb73da1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UmtRRLEb2WdEMmHRfE2UF1V3tzH6ncv9hYD5pmF/WuE2AOmEPrZLFUdiKHsyOi2oixyUuBkIlMfjBCUffLh+13yaMErcsPTvwhXeZhbKObRZ1XrfNuvsLCkBZ7q3Fjx3el0ZD3ZyIKRzTzCdqaEfJ+/oqlPCQR9sh1id1kBf7/xxPy6XX/kYXlsp1q6xhiAZMppjcwosSPbhyKQuhqkTNvREQtv0iX/kPHeaSC5dmXTnhuF/10JkuD4wyKI34BcwyPWrDkXPpvytnF77P10CWfxC5e6sed5S1xqTkGk+AYvhu2sbgELeVeJTFef0ru7zxq56aukK1p62AZQgXBwRTQFSNg6RrbOt6dtJTh7JlnQdlCT39QWnr9zmGD6KTz/RkZQN1CwjmB//bReVZZt80A==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(39860400002)(396003)(376002)(346002)(46966005)(86362001)(2906002)(33656002)(8676002)(82740400003)(47076004)(5660300002)(81166007)(70206006)(83380400001)(53546011)(356005)(70586007)(82310400003)(316002)(336012)(26005)(2616005)(478600001)(186003)(4326008)(6506007)(6512007)(107886003)(6486002)(8936002)(54906003)(36756003)(6862004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2020 18:16:40.5964
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 137bb62f-6c65-48bb-aebb-08d88cb74320
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4032

Hi,

> On 19 Nov 2020, at 17:08, Julien Grall <julien@xen.org> wrote:
>=20
> From: Julien Grall <julien.grall@arm.com>
>=20
> At the moment Xen requires the FADT ACPI table to be at least version
> 6.0, apparently because of some reliance on other ACPI v6.0 features.
>=20
> But actually this is overzealous, and Xen works now fine with ACPI v5.1.
>=20
> Let's relax the version check for the FADT table to allow QEMU to
> run the hypervisor with ACPI.
>=20
> Signed-off-by: Julien Grall <julien.grall@arm.com>
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>

Cheers
Bertrand

>=20
> ---
>    Changes in v3:
>        - Add Stefano's acked-by
>=20
>    Changes in v2:
>        - Patch added
> ---
> xen/arch/arm/acpi/boot.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/arch/arm/acpi/boot.c b/xen/arch/arm/acpi/boot.c
> index 55c3e5cbc834..7ea2990cb82c 100644
> --- a/xen/arch/arm/acpi/boot.c
> +++ b/xen/arch/arm/acpi/boot.c
> @@ -181,8 +181,8 @@ static int __init acpi_parse_fadt(struct acpi_table_h=
eader *table)
>      * we only deal with ACPI 6.0 or newer revision to get GIC and SMP
>      * boot protocol configuration data, or we will disable ACPI.
>      */
> -    if ( table->revision > 6
> -         || (table->revision =3D=3D 6 && fadt->minor_revision >=3D 0) )
> +    if ( table->revision > 5
> +         || (table->revision =3D=3D 5 && fadt->minor_revision >=3D 1) )
>         return 0;
>=20
>     printk("Unsupported FADT revision %d.%d, should be 6.0+, will disable=
 ACPI\n",
> --=20
> 2.17.1
>=20


