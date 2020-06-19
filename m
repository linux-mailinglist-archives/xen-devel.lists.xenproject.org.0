Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A780B20047D
	for <lists+xen-devel@lfdr.de>; Fri, 19 Jun 2020 10:59:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jmCrH-0008RL-5t; Fri, 19 Jun 2020 08:58:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iBT4=AA=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jmCrF-0008RG-UF
 for xen-devel@lists.xenproject.org; Fri, 19 Jun 2020 08:58:45 +0000
X-Inumbo-ID: 14617d5e-b20b-11ea-b7bb-bc764e2007e4
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe02::626])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 14617d5e-b20b-11ea-b7bb-bc764e2007e4;
 Fri, 19 Jun 2020 08:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9mMM7QI/Wb+lHb3XyzTsLYOckaGqklUKgi8N/ybm6i0=;
 b=LYnFy7hwdyGNgDFC/c88cNozHyarpsnJ5QeCAfbUXmFBAlAO/8eid8Le38rSGM1pBQ4vWZHi6P3es/v+bXAi+6WqjmbV+jmkjckcTbM0kkA78REL7eeiEw2yFNwcEpPHIlZX0kFA3Nq8LnaxXGEgnJpyhKRVd8AhR1uIl8TxuNs=
Received: from DB6PR0501CA0017.eurprd05.prod.outlook.com (2603:10a6:4:8f::27)
 by VI1PR08MB2894.eurprd08.prod.outlook.com (2603:10a6:802:1c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Fri, 19 Jun
 2020 08:58:42 +0000
Received: from DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:8f:cafe::55) by DB6PR0501CA0017.outlook.office365.com
 (2603:10a6:4:8f::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Fri, 19 Jun 2020 08:58:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT055.mail.protection.outlook.com (10.152.21.30) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3109.22 via Frontend Transport; Fri, 19 Jun 2020 08:58:42 +0000
Received: ("Tessian outbound 68e1a9769289:v59");
 Fri, 19 Jun 2020 08:58:42 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 199589257879c1ff
X-CR-MTA-TID: 64aa7808
Received: from d335e21db9a4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B29E9C24-906D-4329-8ADD-08E4BD054966.1; 
 Fri, 19 Jun 2020 08:58:35 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d335e21db9a4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 19 Jun 2020 08:58:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I4fC7l80IemMWKrtFJ74emDYDp61TM9wLgZ+cqKPQCL16iX6LDSdN7cMvWCD++2uCevKJ2ActzYy3zg/dAWJarsXXDTivs9gttKXUmtV3cam+DweeK2M7SBh2mahTpzJtVKuVoRg6L31Tbjp+evtxxtg+ubbagDdJPYxRkdWPOW9H+/WQ2KcMlwSw2L0Ae3mWRXGtME5RE8xLIzEBHOX8hlgqn55+H+0fQV7Djzz5tafkH6jqKtZ/M4/K4UaFzwIDe+8llW14ktr6sk+OwUvGv1PzdMk6+5M4J1ShYC8sIlBg5XmJiDsR6+m7VIl3GAwFTrY7Lyzh+57SLRJoQAY5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9mMM7QI/Wb+lHb3XyzTsLYOckaGqklUKgi8N/ybm6i0=;
 b=ofnnTE3V2ROc6xBzRNyzklxBnAJjRKAd1h1GC9Z8mDyUG7dNAxUpD/vVZqt+DBszwsGR0XT790D4EbA+joTFlIkKCQeZkU4GzjoXEF8AyejLW3USGNRdDxigGpC6BKdbJUTSuQCIT+VdcIzSR3DstosaSlTxqHmVrhb+VIAVwV2SyaQXfIe29+6ISqhyvz5zXAHzmzw6/9ZEerkR0Fahig5ZK9Ry3c9bs7mRi5Ntz6TXvpB+vGJpZzyN8/iG8KBPbzbOhYDvyo4+16QxuX8lrZ5Io1Y++X/d9ebm3fMM1kQyCfHqCc141Ye6xDPaXlxm8v1m3S7D0dMMKjtTrkuNrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9mMM7QI/Wb+lHb3XyzTsLYOckaGqklUKgi8N/ybm6i0=;
 b=LYnFy7hwdyGNgDFC/c88cNozHyarpsnJ5QeCAfbUXmFBAlAO/8eid8Le38rSGM1pBQ4vWZHi6P3es/v+bXAi+6WqjmbV+jmkjckcTbM0kkA78REL7eeiEw2yFNwcEpPHIlZX0kFA3Nq8LnaxXGEgnJpyhKRVd8AhR1uIl8TxuNs=
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3100.eurprd08.prod.outlook.com (2603:10a6:5:28::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Fri, 19 Jun
 2020 08:58:33 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3109.021; Fri, 19 Jun 2020
 08:58:33 +0000
From: Bertrand Marquis <Bertrand.Marquis@arm.com>
To: Peng Fan <peng.fan@nxp.com>
Subject: Re: [Tee-dev] TEE with XEN
Thread-Topic: [Tee-dev] TEE with XEN
Thread-Index: AdZCuN8SyGfGPx9hRva/eeajiUtqpQAw/zsAAIeJWwAAHsEHgAAAD3awAABi1QA=
Date: Fri, 19 Jun 2020 08:58:33 +0000
Message-ID: <CE6D09B1-18C4-46FA-BC1A-F45E28B2FA36@arm.com>
References: <DB6PR0402MB276091802866E8CB878A8130889C0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <CAOcqxo2B4cnJdqERr81rVzJKb=Rj=kmotd7Cui9nOMy52wVKmg@mail.gmail.com>
 <8a6ba53e-59c8-0c18-00e9-2902b6edaf39@xen.org>
 <68572FBC-8AE3-44A4-A815-1A9A7FFFA098@arm.com>
 <DB6PR0402MB27606AA43E7A95B3CB2D228588980@DB6PR0402MB2760.eurprd04.prod.outlook.com>
In-Reply-To: <DB6PR0402MB27606AA43E7A95B3CB2D228588980@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=arm.com;
x-originating-ip: [217.140.99.251]
x-ms-publictraffictype: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: b9dcbe00-b644-4cf8-f819-08d8142ef773
x-ms-traffictypediagnostic: DB7PR08MB3100:|VI1PR08MB2894:
X-Microsoft-Antispam-PRVS: <VI1PR08MB28944E0ABA0121E675AF0E819D980@VI1PR08MB2894.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
x-ms-oob-tlc-oobclassifiers: OLM:10000;OLM:10000;
x-forefront-prvs: 0439571D1D
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: YOeRlQJTcErTMLxSlaLBwgOq8nKiRaag7yYulIlyuhVyxDtaWhX74hgadSdQZQCEsT+Yr5jsXFeDhb/XjB5Vx2a5Tsx8VOIW0HaGKlosyjaw8A8I2tCKVdkg0FxlK+eWzeH9Eyi+uce5dWascpFyZCmmaLxgaXBd039S8sSwiYZo32RtLcIadufpfJ39nTUNyGsu7b4HWbSTWxkwUy00C8iKuk52LwOlJmzu43eeqdccTMn8mDzDibqhIb48RPVbwnVW5q0jNUBV6Z4qejnDiCerhEVdFyPQUKLpsc9UiJb4Oe6o7mughELNFLqb6Sz+4uBO7V1dR79Bb+hjp9mZ6w==
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(396003)(136003)(346002)(376002)(39860400002)(366004)(2906002)(83380400001)(6512007)(86362001)(8936002)(6486002)(478600001)(5660300002)(8676002)(36756003)(4326008)(2616005)(186003)(6916009)(66446008)(64756008)(54906003)(53546011)(33656002)(66476007)(6506007)(66946007)(76116006)(316002)(91956017)(66556008)(71200400001)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: 9dlKpWlcyi2oISL31t8rOh0cgUyI3/W/dqXjQEiMpz8fN0jX1oYWGztMyZy4hYO411B+/E6giVDvYhczNFWfVk+pn2trJsL+nTLhi7Oq+VZHyqgyblS1lJ7TG/mz2DlX/7cACgyOW1oMfrPOomGSV3HFlZRRIFdxaK1Kq+Fd7Kkur6r1CelnUIGTuYq5xvnBjENFNhUnZRKaLf2ITs1fwM1OvXF2PxejWbMNXvK3I0yfoNO0DllMjyFXlSBr3UAhqvhoKNB638K1zM0iJKbHDhVtKMKj0TStg0TArHoWUE4IVN92MxLvuJFXhdtSCDJoq4mCqliLshd2opM2v7wihOAaUafyf6XrX6j2eSgjF7lbRV0eRv47H+RCull+L7obb4mj9jYOSBwaO+rw1dl3U0Aa2+3iu1RbjjVZhMJzeIlia+I0rAfllFi1HocRHncm4jPmsgPYxR/4Ksw1sKHTxayKyeo9lRQFFGI6YUp/SKiwz8H9599C1iEbSYF4xaZ6
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <3897C35E78AF24409A79598AE2140EF1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3100
Original-Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(46966005)(70586007)(70206006)(26005)(33656002)(83380400001)(6862004)(54906003)(336012)(2616005)(186003)(82310400002)(86362001)(82740400003)(81166007)(316002)(356005)(53546011)(47076004)(6506007)(8936002)(478600001)(6486002)(8676002)(5660300002)(2906002)(36756003)(4326008)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 7abced8d-006f-4231-f6f0-08d8142ef1ea
X-Forefront-PRVS: 0439571D1D
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BtlNH9HExLWuN/mIlkxTvDZT2CtzFXWqDW1zgOTp793IeYYr+sJS0NqQtuACP8F92c57fja5ZDk32emTiBqG9a/rn8pJUMorjD0cm9bK2nRhkOnMKhtXU27rMnHuNiE3mzXmNzhZYKCN4OuXNojb7K6Djt93PsAWZsSb1Z46pKyaeH+FXgsIr6kz7rK6csBiYWEPwbdTYb6h2fH/BIDPITABAbBvgUcRdaCrvttXHrlVTAwXkKAG0Z2cWnacUTwurCCAXaIrMEC4j7qdszaIFkxoZQRvXIieNp2Z2kuaYkqGEf+1CAryctghFKbeVfvGFy1jf7afTBKa6tuy8HkVsydDjXS+3SNyFrz+g0IIBKQMeDL8lKr/QyZPSPDAQZ8Yepovecr8pRTlGJAzWMAxYQ==
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2020 08:58:42.5315 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9dcbe00-b644-4cf8-f819-08d8142ef773
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2894
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Volodymyr Babchuk <vlad.babchuk@gmail.com>,
 "tee-dev@lists.linaro.org" <tee-dev@lists.linaro.org>,
 Xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Jens Wiklander <jens.wiklander@linaro.org>, Stefano Babic <sbabic@denx.de>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCj4gT24gMTkgSnVuIDIwMjAsIGF0IDA5OjUyLCBQZW5nIEZhbiA8cGVuZy5mYW5AbnhwLmNv
bT4gd3JvdGU6DQo+IA0KPiBIaSBCZXJ0cmFuZCwNCj4gDQo+PiBTdWJqZWN0OiBSZTogW1RlZS1k
ZXZdIFRFRSB3aXRoIFhFTg0KPj4gDQo+PiBIaSwNCj4+IA0KPj4+IE9uIDE4IEp1biAyMDIwLCBh
dCAxOTowNSwgSnVsaWVuIEdyYWxsIDxqdWxpZW5AeGVuLm9yZz4gd3JvdGU6DQo+Pj4gDQo+Pj4g
K0JlcnRyYW5kIGFuZCBTdGVmYW5vDQo+Pj4gDQo+Pj4gT24gMTYvMDYvMjAyMCAwMjoyNCwgVm9s
b2R5bXlyIEJhYmNodWsgd3JvdGU6DQo+Pj4+IEhpIFBlbmcsDQo+Pj4+IE9uIE1vbiwgMTUgSnVu
IDIwMjAgYXQgMDU6MDcsIFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPiB3cm90ZToNCj4+Pj4+
IA0KPj4+Pj4gSGkgQWxsLA0KPj4+Pj4gDQo+Pj4+PiBXaGlsZSBlbmFibGluZyB0cnVzdHkgb3Mg
d2l0aCB4ZW4sIEkgdG9vayBzYW1lIGFwcHJvYWNoIGFzIE9QLVRFRSwNCj4+Pj4+IHdpdGggT1At
VEVFIHJ1bm5pbmcgaW4gc2VjdXJlIHdvcmxkLiBCdXQgSSBhbSBhbHNvIHRoaW5raW5nIHRoaXMN
Cj4+Pj4+IG1pZ2h0IGludHJvZHVjZSBwb3RlbnRpYWwgaXNzdWUgaXMgdGhhdCBzZWN1cmUgd29y
bGQgT1MgY29tbXVuaWNhdGUgd2l0aA0KPj4gRG9tVS4NCj4+Pj4+IElmIHRoZXJlIGFyZSBzb21l
IG1pc2JlaGF2aW9yIGluIHNlY3VyZSB3b3JsZCBPUywgaXQgbWlnaHQgbGV0IFhFTg0KPj4+Pj4g
aHlwZXJ2aXNvciBub3Qgd29yayBwcm9wZXIuDQo+Pj4+PiANCj4+Pj4+IEluIG15IHNldHVwLCB0
cnVzdHkgb3Mgc29tZXRpbWVzIHBhbmljIGluIHNlY3VyZSB3b3JsZCwgeGVuIHdpbGwgbm90DQo+
Pj4+PiBhYmxlIHRvIGNvbnRyb2wgdGhlIHBhbmljIGNvcmUgYW55bW9yZS4NCj4+PiANCj4+PiBN
YXkgSSBhc2sgaW4gd2hpY2ggY2FzZSBUcnVzdHkgaXMgcGFuaWNraW5nPw0KPj4gDQo+PiBJbiBh
bnkgY2FzZSwgb3B0ZWUgc2hvdWxkIHByb3RlY3QgaXRzZWxmIGFnYWluc3QgdGhpcyBhbmQgaXQg
c2hvdWxkIGJlDQo+PiBjb25zaWRlcmVkIHRoYXQgb3B0ZWUgaXMgbW9yZSBwcml2aWxlZGdlZCB0
aGVuIFhlbi4NCj4+IFNvIGlmIG9wdGVlIGlzIGNyYXNoaW5nIHdlIGNhbm5vdCBleHBlY3QgdGhh
dCBYZW4gY2FuIHJlY292ZXIgb3IgZml4IGl0Lg0KPj4gDQo+PiBJIHdvdWxkIG1vcmUgY29uc2lk
ZXIgdGhpcyBhcyBhIGJ1ZyB0aGF0IG9wdGVlIG5lZWRzIHRvIGJlIHJvYnVzdCBhZ2FpbnN0Lg0K
PiANCj4gb2suIEkgYW0gbm90IHVzaW5nIE9QLVRFRSwgY3VycmVudGx5IEkgdXNlIGdvb2dsZSB0
cnVzdHkgT1MuDQoNClNvcnJ5IGkgc2hvdWxkIGhhdmUgYmVlbiBtb3JlIGdlbmVyaWMuDQpQbGVh
c2UgcmVhZCB0aGlzIGFzIOKAnEFueXRoaW5nIHJ1bm5pbmcgaW4gc2VjdXJlIHdvcmxk4oCdLCBi
ZWluZyBvcHRlZSBvciB0cnVzdHkuDQoNCj4gDQo+IEkgaGF2ZSB0d28gT1MsIERvbTAgbGludXgg
KyBEb21VIGFuZHJvaWQgYXV0by4NCj4gDQo+IERvbVUgYW5kcm9pZCBhdXRvIG5lZWRzIHRydXN0
eSBPUywgRG9tMCBMaW51eCBub3QgbmVlZCB0aGF0Lg0KDQpCdXQgaSB3b3VsZCBndWVzcyB5b3Vy
IERvbTAgaXMgbW9yZSDigJxjcml0aWNhbOKAnSB0aGVuIHlvdXIgRG9tVS4NCkluIHRoaXMgY2Fz
ZSB5b3UgbXVzdCBtYWtlIHN1cmUgdGhhdCBhbnkgcmVzb3VyY2UgZ2l2ZW4gdG8geW91ciBEb21V
IGNhbm5vdCBhZmZlY3QgeW91ciBEb20wLg0KRm9yIGV4YW1wbGU6IGlmIHRoZSBEb21VIGlzIHN0
YXJ0aW5nIGEgdmVyeSBoZWF2eSBvcGVyYXRpb24gaW4gYmxvY2tlZCBpbiB0cnVzdHksIGFueSBp
bnRlcnJ1cHQgZm9yIG5vbi1zZWN1cmUgY291bGQgYmUgYmxvY2tlZCwgdGh1cyBhZmZlY3Rpbmcg
dGhlIGFiaWxpdHkgb2YgeW91ciBEb20wLg0KDQo+IA0KPiBJIG5vdCB3YW5uYSB0cnVzdHkgT1Mg
Zm9yIERvbVUgY291bGQgYnJpbmcgYW55IGRldGVjdCB0byBEb20wIG9yIHhlbi4NCj4gDQo+IE9u
ZSBtb3JlIGNhc2UgaXMgaWYgZG9tMCBsaW51eCBuZWVkcyBPUC1URUUsIERvbVUgbmVlZHMgZ29v
Z2xlIHRydXN0eSwNCj4gaG93IHdlIGhhbmRsZSB0aGlzIGluIG9uZSBTb0M/DQoNCllvdSBoYXZl
IGEgc2hhcmVkIHJlc291cmNlIGluIHRoaXMgY2FzZSwgc29tZW9uZSBtb3JlIG9yIGFzIHRydXN0
ZWQgYXMgdGhlIGNsaWVudHMgbmVlZHMgdG8gZGVjaWRlIGhvdyB0aGUgcmVzb3VyY2UgY2FuIGJl
IHNoYXJlZC4NCkluIHRoaXMgY2FzZSBjb3VsZCBiZSBEb20wIG9yIFhlbiBvciBUcnVzdHkgb3Ig
b3AtVGVlIChpZiBpIHNob3VsZCBtYWtlIGFuIG9yZGVyKS4NCg0KPiANCj4+IA0KPj4+IA0KPj4+
Pj4gDQo+Pj4+PiBTbyBJIGFtIHRoaW5raW5nIHdoZXRoZXIgd2UgbmVlZCB0byBlbXVsYXRpbmcg
c2VjdXJlIHdvcmxkIGluIGEgWEVODQo+Pj4+PiBWTSB3aGljaCBpcyB0aGUgVk0gcnVubmluZyBE
b21VLiBKdXN0IGxpa2Ugd2hhdCBBQ1JOIGRpZCB0byBydW4NCj4+Pj4+IHRydXN0eSBvcy4NCj4+
Pj4gV2VsbCwgaXQgZGVwZW5kcyBvbiB3aG9tIHlvdSBhcmUgdHJ1c3RpbmcgbW9yZS4gQm90aCBY
RU4gYW5kIFRFRSBhcmUNCj4+Pj4gbWluaW1hbCBPUyBpbXBsZW1lbnRhdGlvbnMgd2l0aCBhaW0g
YXQgc2VjdXJpdHkuIEknbSBzcGVha2luZyBhYm91dA0KPj4+PiBnZW5lcmljIFRFRSBPUywgbm90
IGFib3V0IHBhcnRpY3VsYXIgT1MgbGlrZSBPUC1URUUgb3IgVHJ1c3R5Lg0KPj4+PiBQcm9ibGVt
IGlzIHRoYXQsIGlmIFRFRSBpcyBydW5uaW5nIGluc2lkZSBWTSwgaXQgd2lsbCBiZSBzdXNjZXB0
aWJsZQ0KPj4+PiB0byBhIGh5cGVydmlzb3IgbWlzYmVoYXZpb3VyLiBZb3UgbmVlZCB0byB1bmRl
cnN0YW5kIHRoYXQgWGVuIGFuZA0KPj4+PiBwcml2aWxlZ2VkIGRvbWFpbiAoZG9tMCwgbW9zdGx5
KSBjYW4gYWNjZXNzIG1lbW9yeSBvZiBhbnkgZ3Vlc3QuDQo+Pj4+IEF0IGxlYXN0LCBpbiBkZWZh
dWx0IGNvbmZpZ3VyYXRpb24uIFRoZXJlIGFyZSBtZWFucyB0byBoYXJkZW4gdGhpcw0KPj4+PiBz
ZXR1cC4gQnV0IGFueXdheXMsIFhlbiBjYW4ndCBiZSBzdG9wcGVkIGZyb20gcmVhZGluZyBURUUn
cyBzZWNyZXRzLg0KPj4+IA0KPj4+IElJUkMsIHdlIGRpc2N1c3NlZCB0aGlzIGFwcHJvYWNoIGZv
ciBPUC1URUUgaW4gdGhlIHBhc3QuIFRoZXJlIHdhcyBvdGhlcg0KPj4gcG90ZW50aWFsIHBpdGZh
bGxzIHdpdGggaXQuIEZvciBpbnN0YW5jZSwgeW91IHdvdWxkbid0IGJlIGFibGUgdG8gZGlyZWN0
bHkgYWNjZXNzDQo+PiBhbnkgc2VjdXJlIGRldmljZSBmcm9tIHRoYXQgZ3Vlc3QgKGl0IGlzIHJ1
bm5pbmcgaW4gbm9uLXNlY3VyZSB3b3JsZCkuDQo+Pj4gDQo+Pj4gVGhlcmUgYXJlIGFsc28gaXNz
dWVzIGluIHRlcm0gb2YgbGF0ZW5jeSBhcyB5b3UgbWF5IGhhdmUgdGhlIGZvbGxvd2luZw0KPj4g
bW9kZWw6DQo+Pj4gDQo+Pj4gZG9tVSAtPiBYZW4gLT4gZG9tVSBURUUgLT4gKFhlbiAtPiBob3N0
IFRFRSAtPiBYZW4gLT4gZG9tVSBURUUpIC0+IFhlbiAtPg0KPj4gZG9tVS4NCj4+PiANCj4+PiBU
aGUgYml0IGluICgpIGlzIGlmIHlvdSByZXF1aXJlIHRvIGNhbGwgdGhlIGhvc3QgVEVFLg0KPj4+
IA0KPj4+IE9uZSBwb3NzaWJpbGl0eSB3b3VsZCBiZSB0byB1c2UgU2VjdXJlLUVMMiBmb3IgeW91
ciBUcnVzdHkgT1MuIEJ1dCBJIGRvbid0DQo+PiBrbm93IHdoZXRoZXIgeW91ciBwbGF0Zm9ybSBz
dXBwb3J0cyBpdC4NCj4+PiANCj4+PiBEZXBlbmRpbmcgb24gd2hldGhlciB5b3UgY2FuIG1vZGlm
eSBUcnVzdHkgT1MsIGFsdGVybmF0aXZlIHdvdWxkIGJlIHRvDQo+PiBtYWtlIGl0dmlydHVhbGl6
YXRpb24gYXdhcmUgYXMgT1AtVEVFIGRpZC4gVGhlIGNvcmUgd291bGQgbmVlZCB0byBiZQ0KPj4g
cmVzaWxpZW50IGFuZCB0aGUgcGFuaWMgb25seSBhZmZlY3QgYSBnaXZlbiBjbGllbnQuDQo+PiAN
Cj4+IEkgZG8gbm90IGhhdmUgcmlnaHQgYSBjbGVhciBpZGVhIG9mIHdoYXQgaXMgdGhlIHN0YXR1
cyBvZiBvcHRlZSBhbmQgeGVuIGJ1dCBpbg0KPj4gdGhlb3J5IEkgd291bGQgc2VlIDIgcG9zc2li
bGUgd2F5cyB0byBoYW5kbGUgdGhpczoNCj4+IC0gd2l0aG91dCBvcHRlZSBtb2RpZmljYXRpb24s
IHNvbWV0aGluZyBpbiBhIGd1ZXN0IChEb20wIG9yIGFuIG90aGVyDQo+PiBwcml2aWxlZGdlZCBv
bmUpIG5lZWRzIHRvIGhhdmUgYWNjZXNzIHRvIG9wdGVlIGFuZCBlbXVsYXRlIG9wdGVlIGFjY2Vz
cyBmb3INCj4+IG90aGVycy4NCj4+IC0gd2l0aCBvcHRlZSBtb2RpZmljYXRpb25zLCBvcHRlZSBu
ZWVkcyB0byBoYXZlIGEgY29uY2VwdCBvZiBjbGllbnQgYW5kIFhlbg0KPj4gd291bGQgbmVlZCB0
byBwYXNzdGhyb3VnaCBvcHRlZSByZXF1ZXN0cyBidXQgYmVpbmcgcmVzcG9uc2libGUgb2YgYWRk
aW5nIGENCj4+IOKAnGNsaWVudOKAnSBpZGVudGlmaWVyLiBNYXliZSBhbHNvIGluZm9ybWluZyBP
cHRlZSB3aGVuIGEgbmV3IGNsaWVudCBpcw0KPj4gY3JlYXRlZC9yZW1vdmVkLg0KPj4gDQo+PiBU
aGUgc2Vjb25kIHNjZW5hcmlvIGNvdWxkIHRoZW4gYmUgc29tZWhvdyBzcGxpdHRlZCBpbiB0aGUg
cHJldmlvdXMgb25lIGZyb20NCj4+IEp1bGllbiBpZiBzb21lIHBhcnRzIHdvdWxkIG5lZWQgdG8g
YmUgZW11bGF0ZWQgc29tZXdoZXJlIGluIHNvbWUga2luZCBvZg0KPj4gY29tYmluYXRpb24gb2Yg
dGhlIDIgbW9kZWxzLg0KPj4gDQo+PiBJbiBhbnkgY2FzZSBpIHdvdWxkIGFsd2F5cyBjb25zaWRl
ciB0aGF0IGFueXRoaW5nIHJ1bm5pbmcgb24gb3B0ZWUgKG9yIGluDQo+PiBnZW5lcmFsIGluIHRo
ZSBzZWN1cmUgd29ybGQpIGlzIG1vcmUgdHJ1c3RlZCB0aGVuIFhlbi4NCj4gDQo+IE9rLCB0aGlz
IG1lYW5zIG9wdGVlIHJ1bnMgb24gYWxsIGNvcmVzIGluIHNlY3VyZSB3b3JsZCwgYnV0IHRoaXMg
d291bGQgbm90DQo+IHdvcmsgd2hlbiB3ZSBuZWVkIHRvIHN1cHBvcnQgbXVsdGlwbGUgT1NlcyB3
aXRoIHRoZWlyIG93biBURUUuDQoNCkkgd291bGQgdGhpbmsgeW91IGhhdmUgb25lIFRFRSBydW5u
aW5nIG9uIGFsbCBjb3JlcyAob3IgcnVubmFibGUgaW4gdGhpcyBjYXNlKS4NClNvIHRoZSBUZWUg
bmVlZHMgdG8gaGFuZGxlIHNldmVyYWwgY29udGV4dHMgb3Igc29tZW9uZSBuZWVkcyB0byB2aXJ0
dWFsaXplIGl0Lg0KDQpSZWdhcmRzDQpCZXJ0cmFuZA0KDQo=

