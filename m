Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C73832005BF
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 11:51:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmDgG-0005Ux-Lh; Fri, 19 Jun 2020 09:51:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iBT4=AA=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jmDgF-0005Ur-OE
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 09:51:27 +0000
X-Inumbo-ID: 712063fa-b212-11ea-bca7-bc764e2007e4
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.64]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 712063fa-b212-11ea-bca7-bc764e2007e4;
 Fri, 19 Jun 2020 09:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67N7wh8pm8mWPLGueulx1BLDlYEeFxKYrKUdpBlS9IM=;
 b=nWzqtrxjrmjNVPlao0npaRQUgTjgQA5/G6nImBMa1uY3C72CJuddOXRm2hXpkNU3f6AQjROKQnPkhsj71iAwCU8O+8XoNIaoLxQ/KqTfTcrHvhgt4hA7BoMnj1Pkww7oSCQy8RdbF7deMfFZB0Hn/rLvXuAfyqoL4cBy7Souu2Y=
Received: from AM6P195CA0099.EURP195.PROD.OUTLOOK.COM (2603:10a6:209:86::40)
 by DB7PR08MB3036.eurprd08.prod.outlook.com (2603:10a6:5:18::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Fri, 19 Jun
 2020 09:51:24 +0000
Received: from AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:86:cafe::dd) by AM6P195CA0099.outlook.office365.com
 (2603:10a6:209:86::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Fri, 19 Jun 2020 09:51:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT016.mail.protection.outlook.com (10.152.16.142) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Fri, 19 Jun 2020 09:51:24 +0000
Received: ("Tessian outbound 68e1a9769289:v59");
 Fri, 19 Jun 2020 09:51:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9a41cddaf6276a12
X-CR-MTA-TID: 64aa7808
Received: from 1420850e6021.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D7496F23-2D61-4B01-92DC-985F571FD7B8.1; 
 Fri, 19 Jun 2020 09:51:18 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1420850e6021.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 19 Jun 2020 09:51:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hJtulr51eP/pVJqFnwDfdtqj5zUooD/iFu4huUM78rttb8p2d5/xuRA9y7uC9UTtPG95LY89gGspe9jzBDWRyO/DxIHVrwCiQutB0ldnmTt6HVWZdZzAl5cFOUdjErBMp6lwXB6ym42mufwVxCBCuItzS4KSIAAOEoiXbEhBTi5nss9leX6X5BExwmCwHHrsKgOgh+6sAc0E07NYd4ZGltNiXnhhjrUitTOgsEVj/35DNEqNxEg4NjP2gkWXUH/X4tCmfitKUIpL+hcGzleOfj6oc5LHL/F0e13r/KFxA5GgW0OltpVgCCiXGOt576BUxs/raiPlGXa8Q9Rys2BTIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67N7wh8pm8mWPLGueulx1BLDlYEeFxKYrKUdpBlS9IM=;
 b=cdkxXw0OE9o/mtynRD88x3va6tsz31MNvb+UR3s6S033XbgP2ojuAl9tybNGn3SdkvAxJxiA8qsEQAQHGvftJhIMCMub7iacId6lbIHO4fM/gy/DopUnBK7fyMTfUeUtk+GgPtMrjH4hqC3MjUjLplCGUNDm7v2Yx9KlzT8JGhYTMpWThad/grp2JI64GPpzqDstjnV1H/E4GZ/S7Qqo1MJ0H1PUazl2AbVuDB5foRL2/lk+pj1bZRhFnGkT5/3IbgpM3ctx8m5/zvnxFbhnqbyWHeHFvQil5KEwJ/tNyksxouyYcIp2Yg8HC0XNtTih/qu4C0Fl02/PMsXIvocG6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=67N7wh8pm8mWPLGueulx1BLDlYEeFxKYrKUdpBlS9IM=;
 b=nWzqtrxjrmjNVPlao0npaRQUgTjgQA5/G6nImBMa1uY3C72CJuddOXRm2hXpkNU3f6AQjROKQnPkhsj71iAwCU8O+8XoNIaoLxQ/KqTfTcrHvhgt4hA7BoMnj1Pkww7oSCQy8RdbF7deMfFZB0Hn/rLvXuAfyqoL4cBy7Souu2Y=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3483.eurprd08.prod.outlook.com (2603:10a6:10:4a::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Fri, 19 Jun
 2020 09:51:17 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3109.021; Fri, 19 Jun 2020
 09:51:17 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Volodymyr Babchuk <vlad.babchuk@gmail.com>
Subject: Re: [Tee-dev] TEE with XEN
Thread-Topic: [Tee-dev] TEE with XEN
Thread-Index: AdZCuN8SyGfGPx9hRva/eeajiUtqpQAw/zsAAIeJWwAAHsEHgAAAD3awAABi1QAAADlWUAAAQEIAAAFd4QA=
Date: Fri, 19 Jun 2020 09:51:17 +0000
Message-ID: <90E7B0D3-669E-4776-9936-9890E923C5B8@arm.com>
References: <DB6PR0402MB276091802866E8CB878A8130889C0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <CAOcqxo2B4cnJdqERr81rVzJKb=Rj=kmotd7Cui9nOMy52wVKmg@mail.gmail.com>
 <8a6ba53e-59c8-0c18-00e9-2902b6edaf39@xen.org>
 <68572FBC-8AE3-44A4-A815-1A9A7FFFA098@arm.com>
 <DB6PR0402MB27606AA43E7A95B3CB2D228588980@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <CE6D09B1-18C4-46FA-BC1A-F45E28B2FA36@arm.com>
 <DB6PR0402MB2760C3BF7140E02A6ECA572488980@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <CAOcqxo0Y4fgQjigQj2nDkiQETN7EEhjvOujkTxmiQtG3OBGieA@mail.gmail.com>
In-Reply-To: <CAOcqxo0Y4fgQjigQj2nDkiQETN7EEhjvOujkTxmiQtG3OBGieA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [82.24.250.194]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: ed396778-fe63-48ef-9df6-08d814365428
x-ms-traffictypediagnostic: DB7PR08MB3483:|DB7PR08MB3036:
X-Microsoft-Antispam-PRVS: <DB7PR08MB303661627CBA9B900EEC79989D980@DB7PR08MB3036.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 0439571D1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: +hgAOPnxg3I1EGPJRQGR5fopY6i999fOajEAYIJxS9DhzCR5Zj3wtEc8/eeQU7JKuElc5fyQXfz/CrcVf0U6yZQo8MentHi1JYDbq3W3yT2Yyyyy0KY+Q9dOwoEsTzmTQUmFPPlZ8Y481hc7DiBCSFmcGfjjIho9kb0iKvPHyP8WGjvGGfz601hXdWqeaWgjErnBfyvMnJnJznBWC3zAvXhnMsopkKf4KCNcnqEK+0hEHE28/pPykuUFZR2uTDgYQE84hdVELKK1DOKj2zKK1I2MwlpRIIiRC0QWN+rUIBrW83jYNbW31QNqTTv+NPsCQf78O+v++fUCGCJGGWWQGA==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(2616005)(66446008)(64756008)(66556008)(4326008)(71200400001)(76116006)(91956017)(478600001)(6486002)(5660300002)(66946007)(66476007)(54906003)(8936002)(26005)(6506007)(53546011)(86362001)(83380400001)(8676002)(36756003)(186003)(2906002)(6916009)(33656002)(316002)(6512007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 40kmGwirTJOkAO++lV8IIN6+HMfZUlGJGAUyGyIGXIAmS0Lh8x8anwmGFZ8YA/qqDhqBqwbqrVQvMPSR+0x+2dcGYaVQsW3DZX3rwSXa+HYuOa1z6GnFxEosAsXTHFRAlaahnl0gjkN1gcX6BOmVMQCCOXxrsRaXTAHVjFmBkvbE0kUntkWGBQZ5APgNRSj4Ri6Zg4iRuSVET6XvBQaGaXkg4QDPcSTF9Fuxs10W/kApQcKQmHyPjVIfF1V53m6CFkIg/wzezAM/2MMS5USjtYBXSJ01bY8P02zk+GnFSg4UBcRLJ7ZMXDt/JdPnFYfkg7te6Osal5H8ArEJpJIxWaq85Gvjp9IIloA437g4tyulewkpeDpZg/Pw/2tysHGkeQt7GNwPKd8KK+7NpUdQUkfEiMcGvx4MjXm1HyeAM4l8kjNcKJQHSGsK59GEr5IjKdftjmDOTTEnhW+7dYZvmroAei0FEOYLdUXy1rCkG/S3iH2hrBozoIWiMHYe7gPe
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <7A649AC5375C7943B99301BBEEEC080B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3483
Original-Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(376002)(136003)(396003)(346002)(46966005)(6862004)(4326008)(36756003)(83380400001)(86362001)(5660300002)(6486002)(8676002)(2906002)(82310400002)(2616005)(8936002)(356005)(336012)(6506007)(47076004)(81166007)(53546011)(33656002)(70586007)(478600001)(26005)(186003)(6512007)(316002)(36906005)(70206006)(54906003)(82740400003);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: dbe80fef-793b-4671-bed2-08d814364fcd
X-Forefront-PRVS: 0439571D1D
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fcbO1sMoDach/4+L9sIKL+fL/0U462hqWut4l5ncTvuq4qCjfhkKxwbR5oczT6YazOXG3guFheH4Jxg8znxnr3ecucIRVl2l7smHWdxcECXuXmqPWXxMHsEBWjuKqsPB+znhD5qAmbmPADkn6ubFAq0YAw0/iqK/YZ/ULJibA5DJ0bvsrG5GsYN7QahTdUt5B3aVKrxqtokVmsnUmu4mx1ZvIhj17TNOS6bzFsB9/X5CuMcpHzuBz4ZtLY4/lu8Q9+2os+veEdMHif5zrMJ8AGN3aB5JfwnXlz8Nww7VcCsuuCWYIM0aoWacDymBxrL6skgrfJQo3OvIJpmxRJQRveurYPtLJMK4HpA6sMOOllzwyAK1WMjIfilbYIO1pgExngOWsfGg2y6cFFhpb7TTCA==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2020 09:51:24.4853 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed396778-fe63-48ef-9df6-08d814365428
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3036
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
Cc: Peng Fan <peng.fan@nxp.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Jens Wiklander <jens.wiklander@linaro.org>, Stefano Babic <sbabic@denx.de>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gMTkgSnVuIDIwMjAsIGF0IDEwOjEyLCBWb2xvZHlteXIgQmFiY2h1ayA8dmxhZC5i
YWJjaHVrQGdtYWlsLmNvbT4gd3JvdGU6DQo+IA0KPiBIaSBQZW5nLA0KPiANCj4gT24gRnJpLCAx
OSBKdW4gMjAyMCBhdCAxMjowNiwgUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+IHdyb3RlOg0K
Pj4gDQo+Pj4gU3ViamVjdDogUmU6IFtUZWUtZGV2XSBURUUgd2l0aCBYRU4NCj4+PiANCj4+PiAN
Cj4+PiANCj4+Pj4gT24gMTkgSnVuIDIwMjAsIGF0IDA5OjUyLCBQZW5nIEZhbiA8cGVuZy5mYW5A
bnhwLmNvbT4gd3JvdGU6DQo+Pj4+IA0KPj4+PiBIaSBCZXJ0cmFuZCwNCj4+Pj4gDQo+Pj4+PiBT
dWJqZWN0OiBSZTogW1RlZS1kZXZdIFRFRSB3aXRoIFhFTg0KPj4+Pj4gDQo+Pj4+PiBIaSwNCj4+
Pj4+IA0KPj4+Pj4+IE9uIDE4IEp1biAyMDIwLCBhdCAxOTowNSwgSnVsaWVuIEdyYWxsIDxqdWxp
ZW5AeGVuLm9yZz4gd3JvdGU6DQo+Pj4+Pj4gDQo+Pj4+Pj4gK0JlcnRyYW5kIGFuZCBTdGVmYW5v
DQo+Pj4+Pj4gDQo+Pj4+Pj4gT24gMTYvMDYvMjAyMCAwMjoyNCwgVm9sb2R5bXlyIEJhYmNodWsg
d3JvdGU6DQo+Pj4+Pj4+IEhpIFBlbmcsDQo+Pj4+Pj4+IE9uIE1vbiwgMTUgSnVuIDIwMjAgYXQg
MDU6MDcsIFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPiB3cm90ZToNCj4+Pj4+Pj4+IA0KPj4+
Pj4+Pj4gSGkgQWxsLA0KPj4+Pj4+Pj4gDQo+Pj4+Pj4+PiBXaGlsZSBlbmFibGluZyB0cnVzdHkg
b3Mgd2l0aCB4ZW4sIEkgdG9vayBzYW1lIGFwcHJvYWNoIGFzIE9QLVRFRSwNCj4+Pj4+Pj4+IHdp
dGggT1AtVEVFIHJ1bm5pbmcgaW4gc2VjdXJlIHdvcmxkLiBCdXQgSSBhbSBhbHNvIHRoaW5raW5n
IHRoaXMNCj4+Pj4+Pj4+IG1pZ2h0IGludHJvZHVjZSBwb3RlbnRpYWwgaXNzdWUgaXMgdGhhdCBz
ZWN1cmUgd29ybGQgT1MNCj4+Pj4+Pj4+IGNvbW11bmljYXRlIHdpdGgNCj4+Pj4+IERvbVUuDQo+
Pj4+Pj4+PiBJZiB0aGVyZSBhcmUgc29tZSBtaXNiZWhhdmlvciBpbiBzZWN1cmUgd29ybGQgT1Ms
IGl0IG1pZ2h0IGxldCBYRU4NCj4+Pj4+Pj4+IGh5cGVydmlzb3Igbm90IHdvcmsgcHJvcGVyLg0K
Pj4+Pj4+Pj4gDQo+Pj4+Pj4+PiBJbiBteSBzZXR1cCwgdHJ1c3R5IG9zIHNvbWV0aW1lcyBwYW5p
YyBpbiBzZWN1cmUgd29ybGQsIHhlbiB3aWxsDQo+Pj4+Pj4+PiBub3QgYWJsZSB0byBjb250cm9s
IHRoZSBwYW5pYyBjb3JlIGFueW1vcmUuDQo+Pj4+Pj4gDQo+Pj4+Pj4gTWF5IEkgYXNrIGluIHdo
aWNoIGNhc2UgVHJ1c3R5IGlzIHBhbmlja2luZz8NCj4+Pj4+IA0KPj4+Pj4gSW4gYW55IGNhc2Us
IG9wdGVlIHNob3VsZCBwcm90ZWN0IGl0c2VsZiBhZ2FpbnN0IHRoaXMgYW5kIGl0IHNob3VsZA0K
Pj4+Pj4gYmUgY29uc2lkZXJlZCB0aGF0IG9wdGVlIGlzIG1vcmUgcHJpdmlsZWRnZWQgdGhlbiBY
ZW4uDQo+Pj4+PiBTbyBpZiBvcHRlZSBpcyBjcmFzaGluZyB3ZSBjYW5ub3QgZXhwZWN0IHRoYXQg
WGVuIGNhbiByZWNvdmVyIG9yIGZpeCBpdC4NCj4+Pj4+IA0KPj4+Pj4gSSB3b3VsZCBtb3JlIGNv
bnNpZGVyIHRoaXMgYXMgYSBidWcgdGhhdCBvcHRlZSBuZWVkcyB0byBiZSByb2J1c3QgYWdhaW5z
dC4NCj4+Pj4gDQo+Pj4+IG9rLiBJIGFtIG5vdCB1c2luZyBPUC1URUUsIGN1cnJlbnRseSBJIHVz
ZSBnb29nbGUgdHJ1c3R5IE9TLg0KPj4+IA0KPj4+IFNvcnJ5IGkgc2hvdWxkIGhhdmUgYmVlbiBt
b3JlIGdlbmVyaWMuDQo+Pj4gUGxlYXNlIHJlYWQgdGhpcyBhcyDigJxBbnl0aGluZyBydW5uaW5n
IGluIHNlY3VyZSB3b3JsZOKAnSwgYmVpbmcgb3B0ZWUgb3IgdHJ1c3R5Lg0KPj4+IA0KPj4+PiAN
Cj4+Pj4gSSBoYXZlIHR3byBPUywgRG9tMCBsaW51eCArIERvbVUgYW5kcm9pZCBhdXRvLg0KPj4+
PiANCj4+Pj4gRG9tVSBhbmRyb2lkIGF1dG8gbmVlZHMgdHJ1c3R5IE9TLCBEb20wIExpbnV4IG5v
dCBuZWVkIHRoYXQuDQo+Pj4gDQo+Pj4gQnV0IGkgd291bGQgZ3Vlc3MgeW91ciBEb20wIGlzIG1v
cmUg4oCcY3JpdGljYWzigJ0gdGhlbiB5b3VyIERvbVUuDQo+Pj4gSW4gdGhpcyBjYXNlIHlvdSBt
dXN0IG1ha2Ugc3VyZSB0aGF0IGFueSByZXNvdXJjZSBnaXZlbiB0byB5b3VyIERvbVUgY2Fubm90
DQo+Pj4gYWZmZWN0IHlvdXIgRG9tMC4NCj4+PiBGb3IgZXhhbXBsZTogaWYgdGhlIERvbVUgaXMg
c3RhcnRpbmcgYSB2ZXJ5IGhlYXZ5IG9wZXJhdGlvbiBpbiBibG9ja2VkIGluDQo+Pj4gdHJ1c3R5
LCBhbnkgaW50ZXJydXB0IGZvciBub24tc2VjdXJlIGNvdWxkIGJlIGJsb2NrZWQsIHRodXMgYWZm
ZWN0aW5nIHRoZSBhYmlsaXR5DQo+Pj4gb2YgeW91ciBEb20wLg0KPj4+IA0KPj4+PiANCj4+Pj4g
SSBub3Qgd2FubmEgdHJ1c3R5IE9TIGZvciBEb21VIGNvdWxkIGJyaW5nIGFueSBkZXRlY3QgdG8g
RG9tMCBvciB4ZW4uDQo+Pj4+IA0KPj4+PiBPbmUgbW9yZSBjYXNlIGlzIGlmIGRvbTAgbGludXgg
bmVlZHMgT1AtVEVFLCBEb21VIG5lZWRzIGdvb2dsZSB0cnVzdHksDQo+Pj4+IGhvdyB3ZSBoYW5k
bGUgdGhpcyBpbiBvbmUgU29DPw0KPj4+IA0KPj4+IFlvdSBoYXZlIGEgc2hhcmVkIHJlc291cmNl
IGluIHRoaXMgY2FzZSwgc29tZW9uZSBtb3JlIG9yIGFzIHRydXN0ZWQgYXMgdGhlDQo+Pj4gY2xp
ZW50cyBuZWVkcyB0byBkZWNpZGUgaG93IHRoZSByZXNvdXJjZSBjYW4gYmUgc2hhcmVkLg0KPj4+
IEluIHRoaXMgY2FzZSBjb3VsZCBiZSBEb20wIG9yIFhlbiBvciBUcnVzdHkgb3Igb3AtVGVlIChp
ZiBpIHNob3VsZCBtYWtlIGFuDQo+Pj4gb3JkZXIpLg0KPj4+IA0KPj4+PiANCj4+Pj4+IA0KPj4+
Pj4+IA0KPj4+Pj4+Pj4gDQo+Pj4+Pj4+PiBTbyBJIGFtIHRoaW5raW5nIHdoZXRoZXIgd2UgbmVl
ZCB0byBlbXVsYXRpbmcgc2VjdXJlIHdvcmxkIGluIGENCj4+Pj4+Pj4+IFhFTiBWTSB3aGljaCBp
cyB0aGUgVk0gcnVubmluZyBEb21VLiBKdXN0IGxpa2Ugd2hhdCBBQ1JOIGRpZCB0bw0KPj4+Pj4+
Pj4gcnVuIHRydXN0eSBvcy4NCj4+Pj4+Pj4gV2VsbCwgaXQgZGVwZW5kcyBvbiB3aG9tIHlvdSBh
cmUgdHJ1c3RpbmcgbW9yZS4gQm90aCBYRU4gYW5kIFRFRQ0KPj4+Pj4+PiBhcmUgbWluaW1hbCBP
UyBpbXBsZW1lbnRhdGlvbnMgd2l0aCBhaW0gYXQgc2VjdXJpdHkuIEknbSBzcGVha2luZw0KPj4+
Pj4+PiBhYm91dCBnZW5lcmljIFRFRSBPUywgbm90IGFib3V0IHBhcnRpY3VsYXIgT1MgbGlrZSBP
UC1URUUgb3IgVHJ1c3R5Lg0KPj4+Pj4+PiBQcm9ibGVtIGlzIHRoYXQsIGlmIFRFRSBpcyBydW5u
aW5nIGluc2lkZSBWTSwgaXQgd2lsbCBiZQ0KPj4+Pj4+PiBzdXNjZXB0aWJsZSB0byBhIGh5cGVy
dmlzb3IgbWlzYmVoYXZpb3VyLiBZb3UgbmVlZCB0byB1bmRlcnN0YW5kDQo+Pj4+Pj4+IHRoYXQg
WGVuIGFuZCBwcml2aWxlZ2VkIGRvbWFpbiAoZG9tMCwgbW9zdGx5KSBjYW4gYWNjZXNzIG1lbW9y
eSBvZg0KPj4+IGFueSBndWVzdC4NCj4+Pj4+Pj4gQXQgbGVhc3QsIGluIGRlZmF1bHQgY29uZmln
dXJhdGlvbi4gVGhlcmUgYXJlIG1lYW5zIHRvIGhhcmRlbiB0aGlzDQo+Pj4+Pj4+IHNldHVwLiBC
dXQgYW55d2F5cywgWGVuIGNhbid0IGJlIHN0b3BwZWQgZnJvbSByZWFkaW5nIFRFRSdzIHNlY3Jl
dHMuDQo+Pj4+Pj4gDQo+Pj4+Pj4gSUlSQywgd2UgZGlzY3Vzc2VkIHRoaXMgYXBwcm9hY2ggZm9y
IE9QLVRFRSBpbiB0aGUgcGFzdC4gVGhlcmUgd2FzDQo+Pj4+Pj4gb3RoZXINCj4+Pj4+IHBvdGVu
dGlhbCBwaXRmYWxscyB3aXRoIGl0LiBGb3IgaW5zdGFuY2UsIHlvdSB3b3VsZG4ndCBiZSBhYmxl
IHRvDQo+Pj4+PiBkaXJlY3RseSBhY2Nlc3MgYW55IHNlY3VyZSBkZXZpY2UgZnJvbSB0aGF0IGd1
ZXN0IChpdCBpcyBydW5uaW5nIGluDQo+Pj4gbm9uLXNlY3VyZSB3b3JsZCkuDQo+Pj4+Pj4gDQo+
Pj4+Pj4gVGhlcmUgYXJlIGFsc28gaXNzdWVzIGluIHRlcm0gb2YgbGF0ZW5jeSBhcyB5b3UgbWF5
IGhhdmUgdGhlDQo+Pj4+Pj4gZm9sbG93aW5nDQo+Pj4+PiBtb2RlbDoNCj4+Pj4+PiANCj4+Pj4+
PiBkb21VIC0+IFhlbiAtPiBkb21VIFRFRSAtPiAoWGVuIC0+IGhvc3QgVEVFIC0+IFhlbiAtPiBk
b21VIFRFRSkgLT4NCj4+Pj4+PiBYZW4gLT4NCj4+Pj4+IGRvbVUuDQo+Pj4+Pj4gDQo+Pj4+Pj4g
VGhlIGJpdCBpbiAoKSBpcyBpZiB5b3UgcmVxdWlyZSB0byBjYWxsIHRoZSBob3N0IFRFRS4NCj4+
Pj4+PiANCj4+Pj4+PiBPbmUgcG9zc2liaWxpdHkgd291bGQgYmUgdG8gdXNlIFNlY3VyZS1FTDIg
Zm9yIHlvdXIgVHJ1c3R5IE9TLiBCdXQgSQ0KPj4+Pj4+IGRvbid0DQo+Pj4+PiBrbm93IHdoZXRo
ZXIgeW91ciBwbGF0Zm9ybSBzdXBwb3J0cyBpdC4NCj4+Pj4+PiANCj4+Pj4+PiBEZXBlbmRpbmcg
b24gd2hldGhlciB5b3UgY2FuIG1vZGlmeSBUcnVzdHkgT1MsIGFsdGVybmF0aXZlIHdvdWxkIGJl
DQo+Pj4+Pj4gdG8NCj4+Pj4+IG1ha2UgaXR2aXJ0dWFsaXphdGlvbiBhd2FyZSBhcyBPUC1URUUg
ZGlkLiBUaGUgY29yZSB3b3VsZCBuZWVkIHRvIGJlDQo+Pj4+PiByZXNpbGllbnQgYW5kIHRoZSBw
YW5pYyBvbmx5IGFmZmVjdCBhIGdpdmVuIGNsaWVudC4NCj4+Pj4+IA0KPj4+Pj4gSSBkbyBub3Qg
aGF2ZSByaWdodCBhIGNsZWFyIGlkZWEgb2Ygd2hhdCBpcyB0aGUgc3RhdHVzIG9mIG9wdGVlIGFu
ZA0KPj4+Pj4geGVuIGJ1dCBpbiB0aGVvcnkgSSB3b3VsZCBzZWUgMiBwb3NzaWJsZSB3YXlzIHRv
IGhhbmRsZSB0aGlzOg0KPj4+Pj4gLSB3aXRob3V0IG9wdGVlIG1vZGlmaWNhdGlvbiwgc29tZXRo
aW5nIGluIGEgZ3Vlc3QgKERvbTAgb3IgYW4gb3RoZXINCj4+Pj4+IHByaXZpbGVkZ2VkIG9uZSkg
bmVlZHMgdG8gaGF2ZSBhY2Nlc3MgdG8gb3B0ZWUgYW5kIGVtdWxhdGUgb3B0ZWUNCj4+Pj4+IGFj
Y2VzcyBmb3Igb3RoZXJzLg0KPj4+Pj4gLSB3aXRoIG9wdGVlIG1vZGlmaWNhdGlvbnMsIG9wdGVl
IG5lZWRzIHRvIGhhdmUgYSBjb25jZXB0IG9mIGNsaWVudA0KPj4+Pj4gYW5kIFhlbiB3b3VsZCBu
ZWVkIHRvIHBhc3N0aHJvdWdoIG9wdGVlIHJlcXVlc3RzIGJ1dCBiZWluZw0KPj4+Pj4gcmVzcG9u
c2libGUgb2YgYWRkaW5nIGEg4oCcY2xpZW504oCdIGlkZW50aWZpZXIuIE1heWJlIGFsc28gaW5m
b3JtaW5nDQo+Pj4+PiBPcHRlZSB3aGVuIGEgbmV3IGNsaWVudCBpcyBjcmVhdGVkL3JlbW92ZWQu
DQo+Pj4+PiANCj4+Pj4+IFRoZSBzZWNvbmQgc2NlbmFyaW8gY291bGQgdGhlbiBiZSBzb21laG93
IHNwbGl0dGVkIGluIHRoZSBwcmV2aW91cw0KPj4+Pj4gb25lIGZyb20gSnVsaWVuIGlmIHNvbWUg
cGFydHMgd291bGQgbmVlZCB0byBiZSBlbXVsYXRlZCBzb21ld2hlcmUgaW4NCj4+Pj4+IHNvbWUg
a2luZCBvZiBjb21iaW5hdGlvbiBvZiB0aGUgMiBtb2RlbHMuDQo+Pj4+PiANCj4+Pj4+IEluIGFu
eSBjYXNlIGkgd291bGQgYWx3YXlzIGNvbnNpZGVyIHRoYXQgYW55dGhpbmcgcnVubmluZyBvbiBv
cHRlZQ0KPj4+Pj4gKG9yIGluIGdlbmVyYWwgaW4gdGhlIHNlY3VyZSB3b3JsZCkgaXMgbW9yZSB0
cnVzdGVkIHRoZW4gWGVuLg0KPj4+PiANCj4+Pj4gT2ssIHRoaXMgbWVhbnMgb3B0ZWUgcnVucyBv
biBhbGwgY29yZXMgaW4gc2VjdXJlIHdvcmxkLCBidXQgdGhpcyB3b3VsZA0KPj4+PiBub3Qgd29y
ayB3aGVuIHdlIG5lZWQgdG8gc3VwcG9ydCBtdWx0aXBsZSBPU2VzIHdpdGggdGhlaXIgb3duIFRF
RS4NCj4+PiANCj4+PiBJIHdvdWxkIHRoaW5rIHlvdSBoYXZlIG9uZSBURUUgcnVubmluZyBvbiBh
bGwgY29yZXMgKG9yIHJ1bm5hYmxlIGluIHRoaXMgY2FzZSkuDQo+Pj4gU28gdGhlIFRlZSBuZWVk
cyB0byBoYW5kbGUgc2V2ZXJhbCBjb250ZXh0cyBvciBzb21lb25lIG5lZWRzIHRvIHZpcnR1YWxp
emUgaXQuDQo+PiANCj4+IFRoaXMgYmFjayB0byBteSBvcmlnaW5hbCBxdWVzdGlvbiwgc2hvdWxk
IEkgdmlydHVhbGl6ZSBURUUgaW4gYSBYRU4gZGVkaWNhdGVkIFZNPw0KPj4gb3IgSSBuZWVkIHRv
IGVtdWxhdGUgc2VjdXJlIHdvcmxkIHRvIGxldCBvbmUgVk0gY291bGQgaGF2ZSBzZWN1cmUgYW5k
IG5vbi1zZWN1cmUNCj4+IHdvcmxkPw0KPj4gDQo+IA0KPiBXZWxsLCBJIHRoaW5rIHRoYXQgdGhl
IGJlc3QgYXBwcm9hY2ggaXMgdGhhdCB3ZSBkaWQgaW4gdGhlIE9QLVRFRTogbWFrZSBUcnVzdHkN
Cj4gdmlydHVhbGl6YXRpb24tYXdhcmUsIHNvIGl0IGNhbiBoYW5kbGUgbXVsdGlwbGUgVk1zLg0K
PiANCj4gVGhpbmdzIGFyZSBtb3JlIGZ1bm55IGlmIHlvdSB3YW50IHRvIHVzZSBtdWx0aXBsZSBk
aWZmZXJlbnQgVEVFcyAobGlrZQ0KPiBPUC1URUUgYW5kIFRydXN0eSkNCj4gYXQgdGhlIHNhbWUg
dGltZS4gSWYgdGhpcyBpcyB5b3VyIGNhc2UsIHRoZW4gdGhlIGJlc3QgYXBwcm9hY2ggaXMgdG8g
aW1wbGVtZW50DQo+IHNvbWV0aGluZyBsaWtlIHBhcmEtdmlydHVhbGl6YXRpb24gaW4gdGhlIFNl
Y3VyZSBXb3JsZC4gQnV0IHRoaXMgd291bGQgcmVxdWlyZQ0KPiBxdWl0ZSBiaWcgZWZmb3J0cywg
b2YgY291cnNlLg0KDQpJIGFncmVlIHRoaXMgaXMgdGhlIGJlc3QgYXBwcm9hY2ggdG8gbWFrZSBz
ZWN1cmUgd29ybGQgaGFuZGxlIHNldmVyYWwgY2xpZW50cy4NCkJ1dCBpdCBtaWdodCBiZSB0aGUg
bW9zdCBjb21wbGV4IG9uZSB0aG91Z2guDQoNClVzaW5nIGEgVk0gZm9yIGl0IG1pZ2h0IGJlIGVh
c2llciBidXQgeW91IG5lZWQgdG8gY2hlY2sgdGhhdCBpdCBhY2hpZXZpbmcgdGhlIGxldmVsIG9m
IHRydXN0IHRoYXQgeW91IG5lZWQuDQpZb3UgY291bGQgaGF2ZSBhIFZNIGFjdGluZyBhcyBhIG11
eGVyL2NoZWNrZXIgYW5kIHBhc3NpbmcgZG93biByZXF1ZXN0cyB0byB0aGUgc2VjdXJlIHdvcmxk
DQoNClRoZSBkZWZpbml0aXZlIGFuc3dlciByZWFsbHkgZGVwZW5kcyBvbiB0aGUgYW1vdW50IG9m
IGVmZm9ydCwgdGhlIGxldmVsIG9mIHNlY3VyaXR5IGFuZCB5b3VyIGdlbmVyYWwgc3lzdGVtIG5l
ZWRzLg0KDQpCZXJ0cmFuZA0KDQo=

