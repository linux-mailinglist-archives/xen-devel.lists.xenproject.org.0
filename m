Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B88139279
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 14:47:11 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ir00u-00074o-Qs; Mon, 13 Jan 2020 13:44:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4RDD=3C=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1ir00t-00074a-5L
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 13:44:15 +0000
X-Inumbo-ID: c82829fb-360a-11ea-826c-12813bfff9fa
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.120]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c82829fb-360a-11ea-826c-12813bfff9fa;
 Mon, 13 Jan 2020 13:44:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cTJEhWGTq6w6XAdoBBJxyw650kZRyf3/7EZIrbB2S6BSG/v2Udn9JVAI47L5qqpvQYTTeJB3+ubrWZ6emHLkhDaQoaBXOcdk7390lFkSk0OSe97nXd1y3vfv9aH1pmSbj7UZRv3TqMd7NoAtzWXh18JsTk9pJO2mFF3u0ZRF3T0QeRSAvXNdqE8vIIbnZhwOHl5+4y5bQ07vpRxx//HHzVT+7z3mQMdrICF2FvNFj7jXKarHmZF7Ziei1j0wc4rk3G/Lh9jniiU/Scmb0mbKcD1c1lAa3CzVaKrlG3VuWhHmfFtbRyXLeN4/2857YL9i9JChyFR1I8TCpnEGktbzNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YsqIG8L8/k0RZacIg058OtaCpsViRbYKIKNHM1ife2E=;
 b=QxTDnSRuDbxhmURvzoEpGm4RXA4F+5nmiNNuZ4/+tuSOl1YgbMZkPDJRiKpmFBNnIByWyyTo0BuU90qBqtoE3LfN5B/oilhlhkQeJqwwQmCuEgvVoGMR4wNG3Jp4yZEeHmwknJ7rrCYY36ws8By3ZV7onSEM6GDG9HM+lhoW5xxiCTDozTs/laB+m5WFO6AflqTCn7Rjk7mGF58AqnVXmHVhw4aNhuCX0eOymHvZj3wfBBwR1QsSKoDHKGwNwKASLj4HXhBEcXPR+/MI7rSeBGXP5CrPxpCGgWs0Fppt7d8mKnQzSh6eMydo8AbFfoBwUIldvT9eRC1Bux66y1+0ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YsqIG8L8/k0RZacIg058OtaCpsViRbYKIKNHM1ife2E=;
 b=f1+c/yD/G0uZdjpUB+8uUhBlfSvucSbGFp8EIAqn1ZbxWjbEAAT03N2t7Qw/16zdJPFYojOiwqn8rQPR47wXS6F/igAOLXs0+5GO+kOGHTcWWWJe/OGP39WgQdMk5LzjjFGu63MCSOxBJSmXHGasu11dg7Qgb1LcucfkGWjhTrU=
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com (10.170.219.144) by
 DB6PR02MB3016.eurprd02.prod.outlook.com (10.175.234.27) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.12; Mon, 13 Jan 2020 13:44:12 +0000
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f1c2:7dd1:1131:1c1d]) by DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f1c2:7dd1:1131:1c1d%7]) with mapi id 15.20.2623.015; Mon, 13 Jan 2020
 13:44:12 +0000
Received: from [10.10.195.54] (91.199.104.6) by
 FR2P281CA0012.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2623.9 via Frontend Transport; Mon, 13 Jan 2020 13:44:11 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH V7 2/4] x86/altp2m: Add hypercall to set a
 range of sve bits
Thread-Index: AQHVxi0eW7mND/zIzUWDdK2ePPvUVqfkF1AAgARVogCAACerAIAADhkA
Date: Mon, 13 Jan 2020 13:44:12 +0000
Message-ID: <24efcd3c-04a0-4c91-df49-ab8b8fdc936a@bitdefender.com>
References: <20200108140810.6528-1-aisaila@bitdefender.com>
 <20200108140810.6528-2-aisaila@bitdefender.com>
 <0a73cce3-1c10-dd4a-9380-aa3e9f8a061b@suse.com>
 <d283e08f-161d-5d22-ed02-5068eca0d61e@bitdefender.com>
 <45936d22-8a95-0569-3301-d822873c10b9@suse.com>
In-Reply-To: <45936d22-8a95-0569-3301-d822873c10b9@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: FR2P281CA0012.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::22) To DB6PR02MB2999.eurprd02.prod.outlook.com
 (2603:10a6:6:17::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7f3461a6-df1c-4cb6-7321-08d7982eac5c
x-ms-traffictypediagnostic: DB6PR02MB3016:|DB6PR02MB3016:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR02MB3016BF0C1D541B1412F16522AB350@DB6PR02MB3016.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 028166BF91
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(376002)(136003)(396003)(346002)(39850400004)(199004)(189003)(5660300002)(86362001)(66946007)(66476007)(66556008)(64756008)(66446008)(478600001)(31686004)(31696002)(8936002)(4326008)(316002)(16576012)(52116002)(54906003)(2906002)(53546011)(6486002)(36756003)(7416002)(81166006)(956004)(71200400001)(16526019)(186003)(2616005)(6916009)(8676002)(81156014)(26005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR02MB3016;
 H:DB6PR02MB2999.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RbvsJn9sm+LRUeOroUPhlfQLKp66PaH0Qw2j1SqM5R3u04pf6wVpSi7ldOqL6a336/tW7QpcyJNiUD9PqrZaP2AOT8YK728GnNFZR0r9sgtJXnxegovofZ0Hb5VUothkUz4o7W41c87eaMqVYCs/MOn5ZhEBdLciijeCFFSRQFoR8dUtpIXX17ObvucbiE9g+SKDe8S8shucrUA9mgb+xpvnh5SdvYkwdPZ61NBmMOTo1Kc3+HNUzCeSejZ+KaLeaY8wrtARaPL1XvgaslU6gM1pmpTCUubwZgUrtxFwP5FbeqiOAFoHVW6Ki2DHRwc3O8E67JHjEeFRXWxXos5uvFvDPHYiyzU74HCt5rktzJvR9+dy/IQv2JyjE7JSE+WHXF9l6SBzas+1y61Plr2ktVJpfJYvsi+gv0M70LJMEW65QyC6kkl4/w1CZOj+HWt5
Content-ID: <9F199EFEF030F240BB444C68C4E264FA@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f3461a6-df1c-4cb6-7321-08d7982eac5c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jan 2020 13:44:12.6900 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PhiKljJPtBqVCWDh8VSgRhCHetkgnYLngYIuwrw0o7Lf0cDZYvlexhZ0c056AVZ9P/WB9okfKf08m737SilcQ+siFF6lv1ZOjQm+7agqWfk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR02MB3016
Subject: Re: [Xen-devel] [PATCH V7 2/4] x86/altp2m: Add hypercall to set a
 range of sve bits
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDEzLjAxLjIwMjAgMTQ6NTMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxMy4wMS4y
MDIwIDExOjMyLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+IE9uIDEwLjAxLjIw
MjAgMTg6MjAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDA4LjAxLjIwMjAgMTU6MDgsIEFs
ZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOg0KPj4+PiArICAgIGlmICggIShyYyA9IHAybV9z
ZXRfc3VwcHJlc3NfdmVfbXVsdGkoZCwgJnN2ZSkpICYmIHN2ZS5maXJzdF9lcnJvciApDQo+Pj4+
ICsgICAgICAgIHJjID0gc3ZlLmZpcnN0X2Vycm9yOw0KPj4+DQo+Pj4gV2h5IHRoZSByaWdodCBz
aWRlIG9mIHRoZSAmJiA/DQo+Pg0KPj4gVGhpcyBpcyBpbnRlbmRlZCB0byBoYXZlIHAybV9zZXRf
c3VwcHJlc3NfdmUoKSBjYWxsDQo+PiBwMm1fc2V0X3N1cHByZXNzX3ZlX211bHRpKCkuIFNvIGhl
cmUgZmlyc3QgSSBjYWxsIHRoZSBfbXVsdGkgdmVyc2lvbiBhbmQNCj4+IHRoZSBjaGVjayBpZiB0
aGVyZSB3YXMgYW55IGVycm9yIGZyb20gdGhlIHNldC9nZXQgKHRoYXQgaXMgd2hhdA0KPj4gcDJt
X3NldF9zdXBwcmVzc192ZSBkaWQgYmVmb3JlKS4NCj4gDQo+IFRvIHB1dCBteSBvcmlnaW5hbCBx
dWVzdGlvbiBkaWZmZXJlbnRseTogZnJvbSBhIGZ1bmN0aW9uYWxpdHkgcG92LA0KPiBob3cgd291
bGQNCj4gDQo+ICAgICAgaWYgKCAhKHJjID0gcDJtX3NldF9zdXBwcmVzc192ZV9tdWx0aShkLCAm
c3ZlKSkgKQ0KPiAgICAgICAgICByYyA9IHN2ZS5maXJzdF9lcnJvcjsgPg0KPiBiZSBkaWZmZXJl
bnQgZnJvbSB5b3VyIHZhcmlhbnQgKGFzIGxvbmcgYXMgdGhlIGZpZWxkIGluZGVlZCBzdGFydHMN
Cj4gb3V0IGFzIHplcm8pPw0KDQpJdCB3aWxsIGJlIHRoZSBzYW1lIGluIHRoaXMgY2FzZSBhbmQg
aXQgY2FuIGJlIGRyb3BwZWQuDQoNCj4gDQo+PiBJIGRvbid0IGtub3cgd2h5IGdpdCBtYWRlIHRo
ZSBwYXRjaCBzbyB1Z2x5Lg0KPiANCj4gSSBoYXZlIG5vIGlkZWEgd2hhdCB1Z2xpbmVzcyB5b3Ug
cmVmZXIgdG8gaGVyZS4NCj4gDQoNCkkgd2FzIHRhbGtpbmcgYWJvdXQgdGhlIGZhY3QgdGhhdCB0
aGUgY2hhbmdlcyBpbiBwMm1fc2V0X3N1cHByZXNzX3ZlKCkgDQpnb3QgbWl4ZWQgd2l0aCB0aGUg
b25lcyBpbiBwMm1fc2V0X3N1cHByZXNzX3ZlX211bHRpKCkuDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
