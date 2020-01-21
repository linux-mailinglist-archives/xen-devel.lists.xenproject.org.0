Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCDC143D5D
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2020 13:56:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1itt2N-0002Z3-VH; Tue, 21 Jan 2020 12:53:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8osE=3K=bitdefender.com=ppircalabu@srs-us1.protection.inumbo.net>)
 id 1itt2L-0002Yy-UK
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2020 12:53:42 +0000
X-Inumbo-ID: 0c8e3d8a-3c4d-11ea-8e9a-bc764e2007e4
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::727])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0c8e3d8a-3c4d-11ea-8e9a-bc764e2007e4;
 Tue, 21 Jan 2020 12:53:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+V2MQQVUIl2Yo0KCFLENMFUqKOXpz27tk6VO+R0kGnncuuZYZeRW5e6ut4VX5Q9o0Ivo7ADydbbtlxd2sorrys8C0rZSo0NJ9AVTxrxFEVESeA45ztvH5oyPKotM2vmAIBHdaEvuAPr06Y2Qp+QlYsBlCDYtwpR4LJi/Mk6MJpU58TNMw1bbh8BQCG0wPsG23A312o2JZ810HNe73yBc8yTlBxLJxJR4v2udvt88uEeDWgq/RAh70BuMhBP4Yj3+4qhPomJGBfWpP6izCWkOVj8+DBHrjvKM4pIYDhqWiL8q2wPY0J213QoC7NQy1lHM2zPhf/bjpSN1vwfZjlaNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08aZptjhVsDBvcy1n3yacqrDySIUF9LcRdMhCuk48eE=;
 b=SYpVtwf+aok+hubdBMWbSFjgKEu4WOOlq+fILCDE8O1Pg5XPwIgXZBB5aU6AXpe6vPElRkwM9g45fPrYH448mw2JEbYMzFn/2eYiRTZ6H9NasiktuKEssIb9ciHjLVJwVjWJDIQMkkh0KxNZ+mYwUVVkUN5bljcGh+N15oFf7VYGrEBs4BqFVuYwM/BBRJrPc0TAWbWDYq8wq3HGL6mu+PyHmjz/iZNG1HdEI9IUoAqxRmISyg2iHFDp95QJGCV5rPkydxtYtpTQy2Vq5IvQ9yzNj7laSIc8jaMBX6xTl1AkmhwgxRY8pHBIVGkFxrHmoAVxh/5jKOmKfkfgOHz4Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08aZptjhVsDBvcy1n3yacqrDySIUF9LcRdMhCuk48eE=;
 b=BEW3Ii6SHkCs1fK2wOPkQFSvLK3rQfxeHK4TQxEiQrHJqz24zsugs+DGNRhGZ/Cdun4WRqPg+y0kV5vDtcSP8iAzY+9p7XQXBKJrE3X481C1yOtvUyDqX4//fqcLfMihTbNN1sQFmXpZD+CDDidkXBBvl3gP/dnxFIxq/S/wo9k=
Received: from AM6PR02MB5287.eurprd02.prod.outlook.com (20.178.89.79) by
 AM6PR02MB4900.eurprd02.prod.outlook.com (20.177.188.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.25; Tue, 21 Jan 2020 12:53:39 +0000
Received: from AM6PR02MB5287.eurprd02.prod.outlook.com
 ([fe80::85d4:50b7:c862:bc77]) by AM6PR02MB5287.eurprd02.prod.outlook.com
 ([fe80::85d4:50b7:c862:bc77%7]) with mapi id 15.20.2644.027; Tue, 21 Jan 2020
 12:53:39 +0000
Received: from pepi-Latitude-E5570 (91.199.104.6) by
 FR2P281CA0018.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2644.19 via Frontend Transport; Tue, 21 Jan 2020 12:53:38 +0000
From: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH V8 1/4] x86/mm: Add array_index_nospec to guest provided
 index values
Thread-Index: AQHVzTpq9xGBjBauhkySgHgyCm4sbaf1GSOA
Date: Tue, 21 Jan 2020 12:53:39 +0000
Message-ID: <50ac9bc4769bbb5d21499e3bcc5806cd32042af9.camel@bitdefender.com>
References: <20200117133059.14602-1-aisaila@bitdefender.com>
In-Reply-To: <20200117133059.14602-1-aisaila@bitdefender.com>
Accept-Language: ro-RO, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: FR2P281CA0018.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::28) To AM6PR02MB5287.eurprd02.prod.outlook.com
 (2603:10a6:20b:86::15)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ppircalabu@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 046893c5-594f-4820-4fba-08d79e70efdd
x-ms-traffictypediagnostic: AM6PR02MB4900:|AM6PR02MB4900:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR02MB490025BCA17F4816BE2C0C35D60D0@AM6PR02MB4900.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3513;
x-forefront-prvs: 0289B6431E
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(136003)(39850400004)(396003)(346002)(376002)(199004)(189003)(36756003)(66946007)(66556008)(66446008)(26005)(64756008)(66476007)(6496006)(5660300002)(4744005)(52116002)(86362001)(478600001)(316002)(8676002)(2616005)(71200400001)(4326008)(6486002)(16526019)(186003)(2906002)(956004)(110136005)(54906003)(81166006)(81156014)(8936002)(99106002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR02MB4900;
 H:AM6PR02MB5287.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LnE0Eyex1GzEW0yYSZVHzo6Xag/hgNsZcBqkcw50RLe2uwLzGoZGftTBKgp2vkoei0KS0WTz428p6utG9kudjygsUKtqkNHwzVuCp6q/Up0R3EH6V02DYwzQlqVTPh/bnNp2yXMusA1gdelqkqFZ9KuAd/9xlHCfj72vUvVSQbS3USga10LRM7HEgx4lZVSX1pgCZbfUuaIKVslXn38pzAqqoghMcGEURsTUxZbEC/J0cTSL6vvicx4Lk3sqwy1Ul3BTaW6lZ6SQpI30CTeyHGtBpryoxZH/RXeNiLgp/eCRsQxjT8vgcwEeDYiEyZNxP3Qk1mAPgKbe6FZkDZx6S56FTRmVeruT1IM0nBiMAej6/Vwd0eWMoa+HEWgKqogjcYBgauxqRbSqpI5kmNIc7PGfxx/jX6HNzdS8KbJbeQu6AMDiFK9o9HFsCjg9IjQZ+eMLCa3akg9XWesIxHHveXxKWUkocnusbtVKdb9hbTg=
Content-ID: <04CF552BB1E5A24E85682B8E7B1D0072@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 046893c5-594f-4820-4fba-08d79e70efdd
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2020 12:53:39.5747 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o9kLpyy4jjsa2jOIam0DyZGu2RMYUPTvaD952R1VY9WNki1hC7tms4VDL3k5IOzOZcCNaZccjGaAj3fTE+PdF66rv2WTZ8okknyA9M2NuWg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR02MB4900
Subject: Re: [Xen-devel] [PATCH V8 1/4] x86/mm: Add array_index_nospec to
 guest provided index values
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gRnJpLCAyMDIwLTAxLTE3IGF0IDE1OjMxICswMjAwLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlM
QSB3cm90ZToNCj4gVGhpcyBwYXRjaCBhaW1zIHRvIHNhbml0aXplIGluZGV4ZXMsIHBvdGVudGlh
bGx5IGd1ZXN0IHByb3ZpZGVkDQo+IHZhbHVlcywgZm9yIGFsdHAybV9lcHRwW10gYW5kIGFsdHAy
bV9wMm1bXSBhcnJheXMuDQo+IA0KPiBSZXF1ZXN0ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGlj
aEBzdXNlLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IElzYWlsYSA8YWlzYWlsYUBi
aXRkZWZlbmRlci5jb20+DQo+IEFja2VkLWJ5OiBUYW1hcyBLIExlbmd5ZWwgPHRhbWFzQHRrbGVu
Z3llbC5jb20+DQo+IA0KUmV2aWV3ZWQtYnk6IFBldHJlIFBpcmNhbGFidSA8cHBpcmNhbGFidUBi
aXRkZWZlbmRlci5jb20+DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
