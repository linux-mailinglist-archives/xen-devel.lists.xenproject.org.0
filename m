Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA22C11FEC1
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 08:07:53 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1igkPa-00076U-3M; Mon, 16 Dec 2019 07:03:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wy9o=2G=suse.com=jnwang@srs-us1.protection.inumbo.net>)
 id 1igkPY-00076P-LY
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 07:03:20 +0000
X-Inumbo-ID: 1d5d0b4c-1fd2-11ea-b6f1-bc764e2007e4
Received: from m4a0073g.houston.softwaregrp.com (unknown [15.124.2.131])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1d5d0b4c-1fd2-11ea-b6f1-bc764e2007e4;
 Mon, 16 Dec 2019 07:03:09 +0000 (UTC)
Received: FROM m4a0073g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0073g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 16 Dec 2019 07:01:02 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 16 Dec 2019 07:00:05 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 16 Dec 2019 07:00:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nZBcCd+fkm6tPUIWPIxkHvZAA40a8CIeOKKMNb6PIVDoQPtCbid3s4MykqfEASYwf4rcvn60ac+1LNi6JeVJcFnq3NZ+ktVw5GYfpYTTcItLzFP2zd3/7q13PhgQWHXp4HUSFrMtqB8tXcLt6daotQ1mHMM2i6hAcAGU51oR1L/IjdxEMSD+eNNoyN68HIxT7bb2TGXIvR67YDn5ADmJKTh6ia6CgVWzzJhu1N7kDv/Mli/ry6CoC1WETFfbm5MgBkh9wHJSLQFQQoFknHLOwOons55yecuJ9ApnszNa5MCfwlyAzz9iyjl0ZCzIUq4Myk9mWHQkBdm5V5vqhx1J0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4YvKHRegAf7N+gjcyQA4OfeY1GlwjMAyrF6aRIxvs3I=;
 b=iWqndqjqKHgu5yM88o3omZL48J9cJVoAPvLzL2nr+4xyypLe+jzhOUbh/qZQhd+G5aTFk0GdwuvftN00XC3hPSrpR33x8XRfczIhHZM10t6FCc/c7KED0qJJD/mlWZEOqS++U4BftpPCbht1VIEmYxDlmewpGT5rCNBtGGnsZUkjl6nAgJChJx0LeMMRL0/y8rCw+3eHLtdZE/8QHildjpWcSzuo1C9ZuSU+HhAgPn9MmAwR6L9OJ6vmTuC6ig58vE0DOarDddRW2ZI5vPcpRB5GxLdOyZg4IdORxzz8VcU3lp8QDpMq575UY105Jukab4u0KJ7RjCNYKbpcCuazww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from BY5PR18MB3170.namprd18.prod.outlook.com (10.255.137.144) by
 BY5PR18MB3281.namprd18.prod.outlook.com (10.255.137.15) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.15; Mon, 16 Dec 2019 07:00:03 +0000
Received: from BY5PR18MB3170.namprd18.prod.outlook.com
 ([fe80::5967:dfe8:c14:808e]) by BY5PR18MB3170.namprd18.prod.outlook.com
 ([fe80::5967:dfe8:c14:808e%7]) with mapi id 15.20.2538.019; Mon, 16 Dec 2019
 07:00:03 +0000
From: Jin Nan Wang <jnwang@suse.com>
To: "Tian, Kevin" <kevin.tian@intel.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] Xen missing prompt log when exec-sp=off
Thread-Index: AQHVs9RYvDJGD9d8eEizxnHO4Wu686e8RwQQgAAOIgA=
Date: Mon, 16 Dec 2019 07:00:02 +0000
Message-ID: <3d853f5b-e13b-f647-2093-48efd974b9de@suse.com>
References: <20191216054728.12845-1-jnwang@suse.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D642FF9@SHSMSX104.ccr.corp.intel.com>
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D642FF9@SHSMSX104.ccr.corp.intel.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: MA1PR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:1::13) To BY5PR18MB3170.namprd18.prod.outlook.com
 (2603:10b6:a03:1a9::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=jnwang@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [45.122.156.254]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5d72cc7d-dc10-4bfb-c842-08d781f5927e
x-ms-traffictypediagnostic: BY5PR18MB3281:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR18MB32817C2395AD7A15CF791D52BE510@BY5PR18MB3281.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 02530BD3AA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(189003)(199004)(186003)(66946007)(66556008)(54906003)(110136005)(64756008)(71200400001)(31696002)(26005)(316002)(66446008)(52116002)(81156014)(81166006)(4326008)(2906002)(478600001)(36756003)(31686004)(8676002)(8936002)(86362001)(5660300002)(6512007)(2616005)(6486002)(53546011)(6506007)(66476007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3281;
 H:BY5PR18MB3170.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZxhdPeF28yvXwlfnZ6542m4ASiYoZDPJXmIlG+2P2OTDlcsS0q+SDSV2nSam9lc/3XzvIUkMttlI81tWRlvc5kjibgU4V2PO0K6AJ+F0ZphTJp4j3odNXBauu1fXaJw6hRptI4hqLxBA7p88WObaHmWmCztXFGsm4aFyFoV/Ht5BGjI+nMzDSYrMD7Sg64RlQhDJh1RVJJlWIzZnhbokEvdUaKd4L9hDABuv2lBc/ysK44BYfmaAsF4iz24VDUgx+DFV6Hc72g/RZUCVr9FIArcc4lIidMqETjPzmXnTde4v9JEHxrMAa+muH/D1jo83IglxSs/rLqlqym9Z+wk7x6MRNYQI0W5q9CyyDFk4MX4K+HEoJAMlo3VQt9RGfHI1XAKVoff4UoFWQeiuG2nl4WUQah0XThKg43dSBmPZxo0fQENqlWVww+N/XZUBTSl1
Content-ID: <561FC0561318CF48AD24E0AAD54A08A7@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d72cc7d-dc10-4bfb-c842-08d781f5927e
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2019 07:00:02.7533 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fKcMDp8NceAhlBkED3OT4gwHnnBVY4Zwy+M/qZrD1cheRMolvItmR5yIksyskvZ0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3281
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] Xen missing prompt log when exec-sp=off
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>, "Nakajima, Jun" <jun.nakajima@intel.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQpPbiAxNi8xMi8yMDE5IDI6MTcgcG0sIFRpYW4sIEtldmluIHdyb3RlOg0KPj4gRnJvbTogSmlu
IE5hbiBXYW5nIDxqbndhbmdAc3VzZS5jb20+DQo+PiBTZW50OiBNb25kYXksIERlY2VtYmVyIDE2
LCAyMDE5IDE6NDggUE0NCj4+DQo+PiBGaXggYSBpc3N1ZSB3aGVuIHVzZXIgZGlzYWJsZSBFVFAg
ZXhlYy1zcCwgeGVuIG1pc3NlZCBhIHByb21wdA0KPj4gbG9nIGluIGRtZXNnLg0KPj4NCj4+IFNp
Z25lZC1vZmYtYnk6IEphbWVzIFdhbmcgPGpud2FuZ0BzdXNlLmNvbT4NCj4+IC0tLQ0KPj4gICB4
ZW4vYXJjaC94ODYvaHZtL3ZteC92bXguYyB8IDQgKysrLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL3g4Ni9odm0vdm14L3ZteC5jIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMNCj4+IGlu
ZGV4IDc5NzBiYTkzZTEuLjljMWYwZjY0NWQgMTAwNjQ0DQo+PiAtLS0gYS94ZW4vYXJjaC94ODYv
aHZtL3ZteC92bXguYw0KPj4gKysrIGIveGVuL2FyY2gveDg2L2h2bS92bXgvdm14LmMNCj4+IEBA
IC0yNDk5LDcgKzI0OTksOSBAQCBjb25zdCBzdHJ1Y3QgaHZtX2Z1bmN0aW9uX3RhYmxlICogX19p
bml0DQo+PiBzdGFydF92bXgodm9pZCkNCj4+ICAgICAgICAgICB7DQo+PiAgICAgICAgICAgICAg
IC8qIERlZmF1bHQgdG8gbm9uLWV4ZWN1dGFibGUgc3VwZXJwYWdlcyBvbiB2dWxuZXJhYmxlIGhh
cmR3YXJlLiAqLw0KPj4gICAgICAgICAgICAgICBvcHRfZXB0X2V4ZWNfc3AgPSAhY3B1X2hhc19i
dWdfcHNjaGFuZ2VfbWM7DQo+PiAtDQo+PiArICAgICAgICB9DQo+IG5vIHBhcmVudGhlc2lzIHRo
ZW4uIEp1c3QgbW92ZSB0aGUgY29tbWVudCBiZWZvcmUgdGhlIGVhcmxpZXIgY29uZGl0aW9uDQo+
IGNoZWNrDQpHb3QgaXQuDQo+PiArICAgICAgICBpZiAob3B0X2VwdF9leGVjX3NwID09IGZhbHNl
KQ0KPj4gKyAgICAgICAgew0KPj4gICAgICAgICAgICAgICBpZiAoIGNwdV9oYXNfYnVnX3BzY2hh
bmdlX21jICkNCj4+ICAgICAgICAgICAgICAgICAgIHByaW50aygiVk1YOiBEaXNhYmxpbmcgZXhl
Y3V0YWJsZSBFUFQgc3VwZXJwYWdlcyBkdWUgdG8gQ1ZFLQ0KPj4gMjAxOC0xMjIwN1xuIik7DQo+
PiAgICAgICAgICAgfQ0KPiBDYW4gd2UgZG8gaXQgYW5vdGhlciB3YXk/IEFsd2F5cyB0aHJvdyBv
dXQgYSB3YXJuaW5nIGlmIHRoZSBoYXJkd2FyZQ0KPiBpcyB2dWxuZXJhYmxlLCBwbHVzIGl0cyBl
bmFibGluZyBzdGF0dXM/DQpPSy4gTGV0IG1lIHRyeS4NCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
