Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1D5BD80D
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 08:02:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD0JF-0002KJ-5j; Wed, 25 Sep 2019 05:57:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=8RKo=XU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iD0JD-0002KE-Of
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 05:57:51 +0000
X-Inumbo-ID: 665336e6-df59-11e9-962b-12813bfff9fa
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by localhost (Halon) with ESMTPS
 id 665336e6-df59-11e9-962b-12813bfff9fa;
 Wed, 25 Sep 2019 05:57:48 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 25 Sep 2019 05:56:52 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 25 Sep 2019 05:56:42 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 25 Sep 2019 05:56:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=klN0VIx4HQh6VERIs9dV4/LDvc8zj9m6wxBj8/28SNnA3mI5XsWn4qrLK4o4MGq0WGvV1h7VL2BRQMetgAKdwDeFvIHoWEk3Jvw9DwryJPlvoBoanO2SrgbIj5EeIItpG0pUFkXB2vJsCtS+DGy4J/byFaNTsGc7HnHi4INm3Z/LmTkTxhbLWbentNbkrt8H3dID9JMH7H6XZPchBIWOeThHBVOvkp1TGHy638cpDrFUQ0kSUYaLTw7W2ixENsmMGFzhMoPq1CWWa4OU8DTSuzqaUnVO+/FOlPl9jSh+dPyQv7KQvRlxXbiKB03FgwksvzhIw7uBUifN/UzDT8nd3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wodzHuPBNB1ZWZ7YwIqvmi4jF5y38krjQD22ra20jCM=;
 b=XwUBNj39HSmRvpRiLFLVXfXFyja7DFEaB1z9jx+OgSL8Y72M4UfxoCPuzjpw9NOZIQhzf6CslNn3LxAkmu7mMqchhsu4PBZ0EP7rZ0Xp0RaB3SRBbRmB5Am9Wvo6cLJr9IHYn0FR6fMQ+hQFwXCAoGvUkqtczsyQ/APYe+vhXC8vYoMETyJJsRaWsqxfyesT5hIFHhWr5KytB1zyFsvQ88ewjwN1D67q9z1+gpJkeVVAB8ukOOnkBbXZrjwju+IybPtvgaDvRvDbryb91daCqWCiqYz+hSz/RNXae1KUAfX6u/4onhCZ5W+sHvWjD6wgFJBd6FWXY049JRt8QNxqEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB3264.namprd18.prod.outlook.com (10.255.237.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.20; Wed, 25 Sep 2019 05:56:40 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::797c:70cc:ad11:d976]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::797c:70cc:ad11:d976%5]) with mapi id 15.20.2284.023; Wed, 25 Sep 2019
 05:56:40 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH v2] libxc/x86: avoid overflow in CPUID APIC ID adjustments
Thread-Index: AQHVb7rdga0Iv13OHE+wW09XJH/8hqc7JCNCgADIXQA=
Date: Wed, 25 Sep 2019 05:56:40 +0000
Message-ID: <0a816e16-3480-f8a8-428c-effb2f5521b3@suse.com>
References: <c5ffff18-bded-486d-5883-da1f6e091d51@suse.com>
 <7973f866-eb4b-59da-3b51-5530263e94da@citrix.com>
In-Reply-To: <7973f866-eb4b-59da-3b51-5530263e94da@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR0P264CA0109.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:19::25) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [2003:ca:b712:5537:2cd9:44e2:cf9b:b565]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bca392de-181f-4a5f-7b00-08d7417d22a9
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MN2PR18MB3264; 
x-ms-traffictypediagnostic: MN2PR18MB3264:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR18MB326420A3603ACF0E319278D6B3870@MN2PR18MB3264.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5516;
x-forefront-prvs: 01713B2841
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(396003)(346002)(376002)(136003)(39860400002)(199004)(189003)(305945005)(14444005)(11346002)(4326008)(14454004)(76176011)(52116002)(478600001)(46003)(229853002)(6486002)(8936002)(31686004)(186003)(99286004)(80792005)(6506007)(64756008)(316002)(6116002)(5660300002)(386003)(102836004)(6916009)(36756003)(81156014)(66946007)(81166006)(6246003)(66476007)(66556008)(66446008)(6512007)(476003)(31696002)(486006)(8676002)(256004)(86362001)(25786009)(71200400001)(2616005)(6436002)(53546011)(446003)(2906002)(7736002)(54906003)(71190400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB3264;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hXmVFbj/CcA0ACwfujZ5EGXNmSP8r5O1+NtVXACPr3euwzbaT48RKFSaYyliXvsVacB/2xf9GJBtCB27Ibyh9T7OoLjaF6smN38KcBjtadJgx8Nm1A5jbB4gC+4OBl9UxwiLtDol9vFzrHqKPiGAwvJjHZ8Zqccyg/vP6jt6dGQBYoyoWDaMRzucfyzb2KHe8IGEfSC47/2mXtogdN2FdV2etxsRGjh+EifAdZELNYunDLfy+ypjprmPoY6krso5skd3igiFN6fBbkhSuelBQamQH32zeC26eenOjTjNTdXuHFSnVradFhN2fV2CAl2mTGUSpKu6Iim1YWyekero7gedt6fFmDSp7xEEkrmBYzKHguwu34Ob7Pj0kUU88Z5IoO5XleAJYQ1+eOYs/GueO+3tMitWFQKNNHZFQdwQruE=
Content-ID: <BB1319D0948B134BAB29262C0AF03DEA@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: bca392de-181f-4a5f-7b00-08d7417d22a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2019 05:56:40.7372 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E7fxvuu/bJ1NsK50/ZGFLeeM2I4Wa1MQnMLCsAAIEbGRSjqo5q1yp/kp5fwgmhvMr7dkuOuLuTFgLCOwe8blsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3264
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2] libxc/x86: avoid overflow in CPUID APIC
 ID adjustments
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
Cc: Juergen Gross <JGross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDkuMjAxOSAxOTo1OCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMjAvMDkvMjAx
OSAxNDo1NCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBAQCAtMzk1LDExICszOTUsMjAgQEAgc3Rh
dGljIHZvaWQgYW1kX3hjX2NwdWlkX3BvbGljeShjb25zdCBzdA0KPj4gICANCj4+ICAgICAgIGNh
c2UgMHg4MDAwMDAwODoNCj4+ICAgICAgICAgICAvKg0KPj4gLSAgICAgICAgICogRUNYWzE1OjEy
XSBpcyBBcGljSWRDb3JlU2l6ZTogRUNYWzc6MF0gaXMgTnVtYmVyT2ZDb3JlcyAobWludXMgb25l
KS4NCj4+IC0gICAgICAgICAqIFVwZGF0ZSB0byByZWZsZWN0IHZMQVBJQ19JRCA9IHZDUFVfSUQg
KiAyLg0KPj4gKyAgICAgICAgICogRUNYWzE1OjEyXSBpcyBBcGljSWRDb3JlU2l6ZS4NCj4+ICsg
ICAgICAgICAqIEVDWFs3OjBdIGlzIE51bWJlck9mQ29yZXMgKG1pbnVzIG9uZSkuDQo+PiArICAg
ICAgICAgKiBVcGRhdGUgdG8gcmVmbGVjdCB2TEFQSUNfSUQgPSB2Q1BVX0lEICogMi4gIEJ1dCBt
YWtlIHN1cmUgdG8gYXZvaWQNCj4+ICsgICAgICAgICAqIC0gb3ZlcmZsb3csDQo+PiArICAgICAg
ICAgKiAtIGdvaW5nIG91dCBvZiBzeW5jIHdpdGggbGVhZiAxIEVCWFsyMzoxNl0sDQo+PiArICAg
ICAgICAgKiAtIGluY3JlbWVudGluZyBBcGljSWRDb3JlU2l6ZSB3aGVuIGl0J3MgemVybyAod2hp
Y2ggY2hhbmdlcyB0aGUNCj4+ICsgICAgICAgICAqICAgbWVhbmluZyBvZiBiaXRzIDc6MCkuDQo+
PiAgICAgICAgICAgICovDQo+PiAtICAgICAgICByZWdzWzJdID0gKChyZWdzWzJdICsgKDF1IDw8
IDEyKSkgJiAweGYwMDB1KSB8DQo+PiAtICAgICAgICAgICAgICAgICAgKChyZWdzWzJdICYgMHhm
ZnUpIDw8IDEpIHwgMXU7DQo+PiArICAgICAgICBpZiAoIChyZWdzWzJdICYgMHg3ZnUpIDwgMHg3
ZnUgKQ0KPiANCj4gSW4gYXR0ZW1wdGluZyB0byByZWJhc2UgbXkgc2VyaWVzLCB0aGVyZSBpcyBh
IGJ1ZyBoZXJlLsKgIEl0IHNob3VsZCBiZSAmDQo+IDB4ZmYgb3RoZXJ3aXNlIHRoZSB0b3AgYml0
IGlzbid0IGluY2x1ZGVkIGluIHRoZSBjb21wYXJpc29uLCBhbmQgYSB2YWx1ZQ0KPiBvZiAxMjgg
d2lsbCBzdGlsbCBiZSBkb3VibGVkLg0KDQpPaCwgaW5kZWVkLCB0aGFua3MgZm9yIHNwb3R0aW5n
LiBXaWxsIHNlbmQgYSBmaXh1cCBwYXRjaCBvbmNlIGluIHRoZSANCm9mZmljZSwgdW5sZXNzIHlv
dSBkaWQgc28gYWxyZWFkeS4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
