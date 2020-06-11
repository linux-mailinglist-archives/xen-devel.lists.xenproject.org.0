Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 333791F6A6E
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 16:57:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjOdw-0000B4-U4; Thu, 11 Jun 2020 14:57:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=muN5=7Y=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jjOdv-0000Az-Qq
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 14:57:24 +0000
X-Inumbo-ID: da0f706a-abf3-11ea-b7bb-bc764e2007e4
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.65]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id da0f706a-abf3-11ea-b7bb-bc764e2007e4;
 Thu, 11 Jun 2020 14:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o21j4grUq0CEt7eJMFmJH+mE6EuCug1cz5ERDZSRn9k=;
 b=wFOlqBRuBOSMSEkB68yVCR8kUdlws5gmrPLMHK3Mi59ziMhwE4n7SxlOVsQhE85So3J9/884WVMy7rnCOCw1WNYNiF6Ao+2ilQ6SZA8fqOyGGrVOOqpEkoLHCoz9WeDXrhaUbf1ix96qmYp10tihKdCtqwnf6VQwm72jIBVY8+s=
Received: from AM6PR08CA0047.eurprd08.prod.outlook.com (2603:10a6:20b:c0::35)
 by AM0PR08MB3281.eurprd08.prod.outlook.com (2603:10a6:208:5f::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.18; Thu, 11 Jun
 2020 14:57:19 +0000
Received: from AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::84) by AM6PR08CA0047.outlook.office365.com
 (2603:10a6:20b:c0::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.19 via Frontend
 Transport; Thu, 11 Jun 2020 14:57:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT041.mail.protection.outlook.com (10.152.17.186) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18 via Frontend Transport; Thu, 11 Jun 2020 14:57:19 +0000
Received: ("Tessian outbound 8bb15bb571b3:v59");
 Thu, 11 Jun 2020 14:57:19 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4736139319df25ef
X-CR-MTA-TID: 64aa7808
Received: from f2cfa4f47421.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BA2A719C-2408-45DC-818B-B18181D31712.1; 
 Thu, 11 Jun 2020 14:57:14 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f2cfa4f47421.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 11 Jun 2020 14:57:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=et+/+Iy5/c0pmw5FynFzcT8JDnrGYEAYHrqkyFd+kTG6ITB6Z/OqjYoRgovkwu3r+5g16dfCMtRjK7XkmaB50i83MrnFllcv6PSMbmeUU0tPASgC3zX2+B0QFrK0Qo2Oz+hT2b7y1giM7pZX6vhnaZL74MBrIMNdBHvVJkwlt0tIzwXGV2l7PEdwrcAliFezxK24yyu55iKd/84AzLOsPiqbzTFXLjuNFWV6J0OEopWvGxqqExJqsy4GodvNprnJQVRwpajLs3TDfic00nSF8kgElAeyWLeMGi8DXjtgjKZa7PyQHJFSiwmklVhkWOqNTyVjktmIMGW5B3Fhs9d+mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o21j4grUq0CEt7eJMFmJH+mE6EuCug1cz5ERDZSRn9k=;
 b=cNmlACgFSgPt+s+g1z14RTTq9RhCxTUeWfx+6131poL9XiN9dzj4PU0n8p6p6XLhtzsGaPCTtwbksERZ5S8eK90Skqb4QFtfkS5ogpRVTJw7DReCiVvrV0n7fzRQ49RP2pRrl1cJrX3926/BoLPOY8One1Nw3hbmy1SiiugirAhdpRsbQnUkF54RN7c5pI+FFdCsyt1uJN95RzhAO6UPBOUJbTKNg/BfsEdvGMOYfcCKqNf4MFdwe+EG2jwjrsBOq/eNZ5yWb8kt5fg9w/1epd2wtWSi6jn3WDwbjrWpL0LrnoV6/q+Fm2YQ/QR4iHrJI/hOKOpubD3WZwVkgPkVkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o21j4grUq0CEt7eJMFmJH+mE6EuCug1cz5ERDZSRn9k=;
 b=wFOlqBRuBOSMSEkB68yVCR8kUdlws5gmrPLMHK3Mi59ziMhwE4n7SxlOVsQhE85So3J9/884WVMy7rnCOCw1WNYNiF6Ao+2ilQ6SZA8fqOyGGrVOOqpEkoLHCoz9WeDXrhaUbf1ix96qmYp10tihKdCtqwnf6VQwm72jIBVY8+s=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3308.eurprd08.prod.outlook.com (2603:10a6:5:20::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.22; Thu, 11 Jun
 2020 14:57:13 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3088.021; Thu, 11 Jun 2020
 14:57:13 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Julien Grall <julien@xen.org>
Subject: Re: [PATCH] xen/arm: Add arm Neoverse N1 processor
Thread-Topic: [PATCH] xen/arm: Add arm Neoverse N1 processor
Thread-Index: AQHWP+cmqt4USPzdykyBGMvq9NIs/ajTY2eAgAAd9wA=
Date: Thu, 11 Jun 2020 14:57:13 +0000
Message-ID: <AE44373F-7DF4-468A-810D-9EE7FB3465C4@arm.com>
References: <5d99ae7a1432152e25d063c634e1e7292ab988aa.1591806668.git.bertrand.marquis@arm.com>
 <6f4cf5ec-8a7e-ca82-d305-d57a083af915@xen.org>
In-Reply-To: <6f4cf5ec-8a7e-ca82-d305-d57a083af915@xen.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 44a0f428-1b40-4f69-6e25-08d80e17bd4c
x-ms-traffictypediagnostic: DB7PR08MB3308:|AM0PR08MB3281:
X-Microsoft-Antispam-PRVS: <AM0PR08MB328118748B7150425455C8369D800@AM0PR08MB3281.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:8882;OLM:8882;
x-forefront-prvs: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: mElVo6FKM1PphUOxAFJVslhfrX4YvcUHbKVlH9y6npOJM6Phlv0lo3jGMpeBt1U5UGceIoD/+ey+zkDdQksi1NsxPvB/0dfey8iKuU3tRwlLm8xaozCHn4qRNqWaRM3CgYL85oNqMQNQsD1NcPfcJiGanddUGttXfEzUbM3RNJSiSOYZbTD3ot74ZTrupnTRqALFzwq6+PZy3PyvEB4eTT4UdBQBA3nMe26qjZAawT/IKqDcSTx/BGWVpXJ9Q5VFSOt6maA4RMApyDzQkBpzRe64beoTA08zX11SH8IrnxEqIR5INzOXgzHHzifAZBJVreNJKNVfn2CbPGNhwjAldQ==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(346002)(136003)(376002)(39860400002)(366004)(396003)(8676002)(2906002)(8936002)(5660300002)(4744005)(86362001)(71200400001)(36756003)(33656002)(2616005)(91956017)(6916009)(316002)(66476007)(4326008)(54906003)(64756008)(66556008)(66446008)(66946007)(186003)(478600001)(26005)(6512007)(53546011)(76116006)(6486002)(6506007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: liTQGoTccC3w0303FBl6zWjo+Lf5SCbrocfOKrscDR5HwsCJR/+jDXkSb7VkF67ZbaVbKxJ3MqEeReVlnzm0HDQed7eSC7URqRa8Y6nJMJdPEl778aiWWL/UPaGQqsKW+ucRpp0twjBw32S/myVa0eVfkc5QtEfVJ+u0yN2EpfuE8WqT8fgJsDRLK0cI7RmgNYYWSUnm0FaPGF+EbHs9tb0zOHaBOPlICriKmGiiy/EXHR+8rSlgr1bfraqUxi4KEjVsHgGLcYUa/Nl425Zxt/DqB9jv7guX2y22eJn2NAl6x3UkO/PtI4mi8YszSy7xS+/NYY72L5vbArocvxNi02rQz6zL0qPEosyLgX5td7KJYhJzbv36QJ9LF+B+BU9LzdJOBQkZmsJVyJ5H0uoDRQBStr9n6yK436rwCGlD5wv6CIKHOt12SJ/17tIqj/iaa8c7aGiaP8aXT4mIwZXX4iA8xkQjC6fu26XOvMHW/L9KSLJ/cX/EfVHftvLHYZj6
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-ID: <B9539E36DCB26E48878BAC051D67B3FC@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3308
Original-Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT041.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(39860400002)(136003)(346002)(376002)(46966005)(82740400003)(54906003)(186003)(6862004)(36906005)(336012)(316002)(6486002)(4326008)(8936002)(107886003)(6512007)(478600001)(2906002)(2616005)(8676002)(356005)(82310400002)(26005)(81166007)(36756003)(47076004)(5660300002)(86362001)(53546011)(6506007)(70206006)(70586007)(33656002)(4744005);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 40884ec9-ebf1-4da2-acd9-08d80e17b98f
X-Forefront-PRVS: 0431F981D8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BG9LJL+Cl1aRy3tu0uTMSrcr/hzKtA2swsgHbm8aK/whqF9wWz0UySi3hOsMKtivbLdFk6+UTbil0YnQ4KWKtr2gJW7lmCMxcLzh9wOTH2bEl85M/GSvIxzLam0cZlcJsieuMdoVrkvuCQh6EjO4ENSBTBIaDQUaQjHliFXDjdh2Qr3p5P1PaVdSbNFsroL9vNbacl4ZKCNfWxxZPuGItFTOo/D6gQXHVnyQFBYjjX+SZHM2GkSkXlElY8uCgAa0Afc0Y3bzvUUH2yotrTNC8KOaXlsuFk55k/oIyCYdMgk/ivIgMaxcZNxcoTWDy7kIWHyItPNbrTKSH373a5ZFAlj6svK4i/Z/0uihl/NbHDwAR0ucYUQIHYpgCa6kY7MHu73UcTZKBqoKg/n41dZyww==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 14:57:19.5214 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44a0f428-1b40-4f69-6e25-08d80e17bd4c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3281
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 nd <nd@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



> On 11 Jun 2020, at 14:09, Julien Grall <julien@xen.org> wrote:
>=20
> Hi Bertrand,
>=20
> On 11/06/2020 12:54, Bertrand Marquis wrote:
>> Add MIDR and CPU part numbers for Arm Neoverse N1 processor
>=20
> The MIDR and CPU part listed are only there because we need to use them f=
or errata. This is not the list of processors we support :).
>=20
> So I would prefer to introduce the new macro when there is an actual use =
of it.

Understood.

Cheers
Bertrand


