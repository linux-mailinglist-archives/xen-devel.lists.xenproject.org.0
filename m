Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E27FC89C
	for <lists+xen-devel@lfdr.de>; Thu, 14 Nov 2019 15:15:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iVFr8-0006QU-Oq; Thu, 14 Nov 2019 14:12:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=X+EV=ZG=epam.com=artem_mygaiev@srs-us1.protection.inumbo.net>)
 id 1iVFr7-0006QP-E1
 for xen-devel@lists.xenproject.org; Thu, 14 Nov 2019 14:12:17 +0000
X-Inumbo-ID: c28f9dc6-06e8-11ea-984a-bc764e2007e4
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe02::61c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c28f9dc6-06e8-11ea-984a-bc764e2007e4;
 Thu, 14 Nov 2019 14:12:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BF+CzYws35GSJ10DIUXoQM5EMbn3mPtkcoHGMwCQzzIhevSqqUGY9MQDgKz0FmU2zZetqM8+nRWmWKDnCemMv0OhsZLumsdd9r4J3gLSZAUQM8yrovrceo2KcCZyput7+LQP7U/fHK5l2h3TJaV2zRXYRklLc+mfEt0rDLDATkfeWZXs0O4HBUvAekR0W8gYR4AqT3XaJsC4HhN2enHEGuRXHnSNPhms0WfGIM+SoNfF3YyFCLhlBb2vUBFYYWgD01fQRlH7uPgzcCokP2m7RVDc9Lhd0WD65CeyaPVh/3orjW6hugieFf/Nvtn+J6o7U0a0N2d9bQSwNLY656oN4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KPsKQKBEGD4ozHrTolVGaGlIvikVNIp0SH2iTVuoLjs=;
 b=SrlCmhogPpEeJgTzZCQ0HyHC/h/gVO5sqd8UY5mNGmdEhOI6rICiLZF6K6uLPOA5MRHF751E31QfkcSX9QWxdoUY0CCIQezUlCcosKcA/9tjyVB+YexxjEwo6l4DfVcMqt5ndWjXnQNcnX55F//4KrNZ8/4VFMPUAGKhrzQbNoMRZ0W7Va8EmO9w3q+xJMO9DYOUieWSWLzlEWQI4+OVhSkl5UHI4XFUOlq8E1TLXPUk+RiQ8ih/sq37sF6LhBXHGrabv3ewSU9VmtLRPoMfOskcCJB1h7SHwa7l0s94j7/uKW7GRjmdq2sP+J6q+Wsr6cnMzTHG8bqZwbhLVB53qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KPsKQKBEGD4ozHrTolVGaGlIvikVNIp0SH2iTVuoLjs=;
 b=WwY8R9RiUWA4rjH5IEDnjLTnsgVpZcoaJ+xgmQI20bmokZXeIyFCCv48DmA8Eg323Xg6nxYglZ1XvNfdGPp3AQiMI9672oyOHbs4+C9xy7cbvmRLKPgDbcqVQ2h0L4PgLQcg8LWVGDWvhOtEOAu+L+ygF9XfKUQ3Xix9mgEYJq0=
Received: from DB7PR03MB3705.eurprd03.prod.outlook.com (52.134.98.14) by
 DB7PR03MB3644.eurprd03.prod.outlook.com (52.134.98.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.22; Thu, 14 Nov 2019 14:12:14 +0000
Received: from DB7PR03MB3705.eurprd03.prod.outlook.com
 ([fe80::c9af:8f5b:c86b:c330]) by DB7PR03MB3705.eurprd03.prod.outlook.com
 ([fe80::c9af:8f5b:c86b:c330%6]) with mapi id 15.20.2430.028; Thu, 14 Nov 2019
 14:12:14 +0000
From: Artem Mygaiev <Artem_Mygaiev@epam.com>
To: "julien.grall.oss@gmail.com" <julien.grall.oss@gmail.com>
Thread-Topic: [Xen-devel] [RFC 2/7] WIP: Compilation with ARM DS-6 compiler
Thread-Index: AQHVlINpq/WqWBMLtEGyFFz1SWBMp6d+RJSAgABv4gCAAJ06AIAKEU4AgABltgCAAPlcAA==
Date: Thu, 14 Nov 2019 14:12:14 +0000
Message-ID: <91c78b4f4cc2e2934717e827bf3ce80be775b127.camel@epam.com>
References: <1573031953-12894-1-git-send-email-andrii.anisov@gmail.com>
 <1573031953-12894-3-git-send-email-andrii.anisov@gmail.com>
 <7d3b0692-11e1-ad70-618b-c17318a2f257@suse.com>
 <CAJwc6KsiYYFEjV=My+J1mrFCEYO-gS-SH9oqSwj7nzWjn4C-kA@mail.gmail.com>
 <0c7cefd6-9169-8a91-de32-3d63dfdc1ab0@suse.com>
 <8337bf4b07903b75a6690880e58ca117e9c08a47.camel@epam.com>
 <CAJ=z9a3FrBOF=3wKp53U8rGWSVJCC4JCurTpyOMPvc6FNcadcA@mail.gmail.com>
In-Reply-To: <CAJ=z9a3FrBOF=3wKp53U8rGWSVJCC4JCurTpyOMPvc6FNcadcA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Artem_Mygaiev@epam.com; 
x-originating-ip: [85.223.141.74]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2c6987df-cf6e-434f-b375-08d7690ca62e
x-ms-traffictypediagnostic: DB7PR03MB3644:|DB7PR03MB3644:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB7PR03MB36447F9E217164467DBCB430F4710@DB7PR03MB3644.eurprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 02213C82F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(366004)(376002)(39860400002)(396003)(136003)(189003)(199004)(5640700003)(25786009)(256004)(26005)(229853002)(81156014)(478600001)(81166006)(186003)(6436002)(71190400001)(6486002)(118296001)(14454004)(8936002)(2906002)(36756003)(76176011)(6506007)(55236004)(102836004)(8676002)(53546011)(54906003)(1361003)(71200400001)(316002)(6246003)(5660300002)(86362001)(4326008)(4001150100001)(80792005)(64756008)(66556008)(66446008)(66476007)(99286004)(14444005)(2501003)(66946007)(6512007)(7736002)(305945005)(76116006)(91956017)(2351001)(446003)(486006)(2616005)(476003)(6116002)(3846002)(11346002)(66066001)(6916009)(7416002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DB7PR03MB3644;
 H:DB7PR03MB3705.eurprd03.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: epam.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: k0rQRnllBmu8uSq95W9MCBpsz2oBoxi13C4rO/jgLBxthMi2CJ925hhzSGSVuElgQG1DyClomI0JEXEvM72vR7+85gcM+JN3FJCloUidXY2N6KJyM2pG9Lr10mmXNaNqa4pCnYvkeRxVMX9Ak2w8qdeeRjjnc6hNVzFhxGb9ggwjkeZll8PocXKBrwDJnuI0tWk3L2vOL6X9rexsRU9yzYcmh3dIY2fve0XhzBiXU4w502SY70akkC3GZjno+mv2wDCRHz+D7QVPWLOkkSAwKnrT/gbLHZLd1nD+217vrGi1BmUzLcsHKGrA/tpD6V85iO1KOplc9Y78ZMgjPl7JjoUu9YP4q7FKUjPnIdMYMkAO5rCw44E9zy9TIV0K0VRbRwGEBQeFOOWtQ+mVB7jDtzM/NRSqkQ62/Uthz9w7J3QTEES9J5t8W3GpQuQbmx2A
Content-ID: <517B00DC3D305F4A833CE0937592B793@eurprd03.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c6987df-cf6e-434f-b375-08d7690ca62e
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2019 14:12:14.3787 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iEp4Kh2RF6KqcF+ElTTw9DpyPX++CZPat9hWMRg8sbxexBc5hGxl+sJGWvdxgBSb4xOD9qDJ8tWwKjUYX6UGZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB3644
Subject: Re: [Xen-devel] [RFC 2/7] WIP: Compilation with ARM DS-6 compiler
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
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "wl@xen.org" <wl@xen.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "andrii.anisov@gmail.com" <andrii.anisov@gmail.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "joculator@gmail.com" <joculator@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

SGVsbG8gSnVsaWVuDQoNCk9uIFRodSwgMjAxOS0xMS0xNCBhdCAwODoxOSArMDkwMCwgSnVsaWVu
IEdyYWxsIHdyb3RlOg0KPiANCj4gDQo+IE9uIFRodSwgMTQgTm92IDIwMTksIDAyOjE1IEFydGVt
IE15Z2FpZXYsIDwNCj4gQXJ0ZW1fTXlnYWlldkBlcGFtLmNvbT4gd3JvdGU6DQo+ID4gSGkgSmFu
LA0KPiA+IA0KPiA+IFNvcnJ5IGZvciBkZWxheWVkIHJlcGx5DQo+ID4gDQo+ID4gT24gVGh1LCAy
MDE5LTExLTA3IGF0IDA4OjMxICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4gPiA+IE9uIDA2
LjExLjIwMTkgMjM6MDgsIEFydGVtIE15Z2FpZXYgd3JvdGU6DQo+ID4gPiA+IE9uIFdlZCwgTm92
IDYsIDIwMTkgYXQgNDoyOCBQTSBKYW4gQmV1bGljaCA8DQo+ID4gPiA+IGpiZXVsaWNoQHN1c2Uu
Y29tDQo+ID4gPiA+ID4gd3JvdGU6DQo+ID4gPiA+ID4gT24gMDYuMTEuMjAxOSAxMDoxOSwgQW5k
cmlpIEFuaXNvdiB3cm90ZToNCj4gPiA+ID4gPiA+IC0tLSBhL0NvbmZpZy5taw0KPiA+ID4gPiA+
ID4gKysrIGIvQ29uZmlnLm1rDQo+ID4gPiA+ID4gPiBAQCAtMjIxLDcgKzIyMSw5IEBAIENGTEFH
UyArPSAtV2FsbCAtV3N0cmljdC1wcm90b3R5cGVzDQo+ID4gPiA+ID4gPiANCj4gPiA+ID4gPiA+
ICAkKGNhbGwgY2Mtb3B0aW9uLWFkZCxIT1NUQ0ZMQUdTLEhPU1RDQywtV2RlY2xhcmF0aW9uLQ0K
PiA+IGFmdGVyLQ0KPiA+ID4gPiA+ID4gc3RhdGVtZW50KQ0KPiA+ID4gPiA+ID4gICQoY2FsbCBj
Yy1vcHRpb24tYWRkLENGTEFHUyxDQywtV2RlY2xhcmF0aW9uLWFmdGVyLQ0KPiA+IHN0YXRlbWVu
dCkNCj4gPiA+ID4gPiA+ICtpZm5lcSAoJChhcm1kcykseSkNCj4gPiA+ID4gPiA+ICAkKGNhbGwg
Y2Mtb3B0aW9uLWFkZCxDRkxBR1MsQ0MsLVduby11bnVzZWQtYnV0LXNldC0NCj4gPiB2YXJpYWJs
ZSkNCj4gPiA+ID4gPiA+ICtlbmRpZg0KPiA+ID4gPiA+ID4gICQoY2FsbCBjYy1vcHRpb24tYWRk
LENGTEFHUyxDQywtV25vLXVudXNlZC1sb2NhbC10eXBlZGVmcykNCj4gPiA+ID4gPiA+IA0KPiA+
ID4gPiA+ID4gIExERkxBR1MgKz0gJChmb3JlYWNoIGksICQoRVhUUkFfTElCKSwgLUwkKGkpKQ0K
PiA+ID4gPiA+IA0KPiA+ID4gPiA+IC4uLiB0aGlzIHdvdWxkIGJlIG5lY2Vzc2FyeS4NCj4gPiA+
ID4gDQo+ID4gPiA+IEkgYW0gdmVyeSBzb3JyeSwgdGhpcyBwYXRjaCBkb2VzIG5vdCBoYXZlIGEg
cHJvcGVyIGRlc2NyaXB0aW9uDQo+ID4gPiA+IGluZGVlZC4NCj4gPiA+ID4gDQo+ID4gPiA+IEZv
ciB0aGlzIHBhcnRpY3VsYXIgY2hhbmdlIC0gYXJtIGNsYW5nIGRvZXMgbm90IHVuZGVzdGFuZA0K
PiA+ID4gPiAtV25vLXVudXNlZC1idXQtc2V0LXZhcmlhYmxlDQo+ID4gPiA+IG9wdGlvbiBhdCBh
bGwsIHRoYXQgaXMgd2h5IGl0IGlzIHVuZGVyICEkKGFybWRzKQ0KPiA+ID4gDQo+ID4gPiBCdXQg
YXZvaWRpbmcgdG8gYWRkIG9wdGlvbnMgd2hpY2ggdGhlIGNvbXBpbGVyIGRvZXNuJ3QgdW5kZXJz
dGFuZA0KPiA+ID4gaXMgdGhlIHB1cnBvc2Ugb2YgdXNpbmcgY2Mtb3B0aW9uLWFkZCwgcmF0aGVy
IHRoYW4gYmxpbmRseQ0KPiA+ID4gYWRkaW5nDQo+ID4gPiB0aGVtIHRvIENGTEFHUy4gV2hhdCBh
bSBJIG1pc3NpbmcgaGVyZT8NCj4gPiANCj4gPiBZb3UgYXJlIHJpZ2h0LCB0aGUgc2NyaXB0IHNo
YWxsIGNoZWNrIHRoZSBjb21waWxlciBvcHRpb24gYW5kIGF2b2lkDQo+ID4gaW5jbHVkaW5nIGl0
IHRvIENGTEFHUy4gQnV0IGFybWNsYW5nIHJlcXVpcmUgJy0tdGFyZ2V0PS4uLicgdG8gYmUNCj4g
PiBzcGVjaWZpZWQgaW4gb3JkZXIgdG8gb3BlcmF0ZSBwcm9wZXJseSwgYW5kIHRoZSBwcm9wZXIg
Zml4IHNoYWxsIGJlDQo+ID4gc29tZXRoaW5nIGxpa2UgdGhpcyAoaW5zdGVhZCBvZiAnaWZuZXEn
IGhhY2sgYWJvdmUpOg0KPiA+IA0KPiA+IGRpZmYgLS1naXQgYS9Db25maWcubWsgYi9Db25maWcu
bWsNCj4gPiBpbmRleCAwMTQ4N2E3Li5hYmU4ZTQ0IDEwMDY0NA0KPiA+IC0tLSBhL0NvbmZpZy5t
aw0KPiA+ICsrKyBiL0NvbmZpZy5taw0KPiA+IEBAIC0xMDcsNyArMTA3LDcgQEAgY2Mtb3B0aW9u
ID0gJChzaGVsbCBpZiB0ZXN0IC16ICJgZWNobw0KPiA+ICd2b2lkKnA9MTsnIHwgXA0KPiA+ICAj
IFVzYWdlOiAkKGNhbGwgY2Mtb3B0aW9uLWFkZCBDRkxBR1MsQ0MsLW1hcmNoPXdpbmNoaXAtYzYp
DQo+ID4gIGNjLW9wdGlvbi1hZGQgPSAkKGV2YWwgJChjYWxsIGNjLW9wdGlvbi1hZGQtDQo+ID4g
Y2xvc3VyZSwkKDEpLCQoMiksJCgzKSkpDQo+ID4gIGRlZmluZSBjYy1vcHRpb24tYWRkLWNsb3N1
cmUNCj4gPiAtICAgIGlmbmVxICgkJChjYWxsIGNjLW9wdGlvbiwkJCgkKDIpKSwkKDMpLG4pLG4p
DQo+ID4gKyAgICBpZm5lcSAoJCQoY2FsbCBjYy1vcHRpb24sJCQoJCgyKSAkKDEpKSwkKDMpLG4p
LG4pDQo+ID4gICAgICAgICAgJCgxKSArPSAkKDMpDQo+ID4gICAgICBlbmRpZg0KPiA+ICBlbmRl
Zg0KPiA+IA0KPiA+IHNvIHRoYXQgQ0ZMQUdTIHRoYXQgYXJlIGFscmVhZHkgZGVmaW5lZCBhbmQg
aW5jbHVkZSAnLS10YXJnZXQ9Li4uJw0KPiA+IG9wdGlvbiBmcm9tIGNvbmZpZy9hcm0qLm1rIGFy
ZSBwYXNzZWQgdG8gY29tcGlsZXIgdG8gbWFrZSBpdCBoYXBweS4NCj4gPiBJDQo+ID4gYW0gbm90
IHN1cmUgaWYgdGhpcyBicmVha3MgYW55dGhpbmcgZWxzZSBzbyBkZWNpZGVkIHRvIGdvIHdpdGgg
dWdseQ0KPiA+ICdpZm5lcScgaGFjayBhbmQgY2hlY2sgaG93IHRoaXMgY2FuIGJlIHNvbHZlZCBs
YXRlciBvbi4NCj4gDQo+IA0KPiBXaHkgbm90IGluY2x1ZGluZyAtLXRhcmdldCBpbiBDQyB2YXJp
YWJsZSBhcyB0aGlzIHdhcyBzdWdnZXN0ZWQgZm9yDQo+IGNsYW5nPw0KDQpJbiBjYXNlIG9mIGFy
bWNsYW5nIC0tdGFyZ2V0IGlzIG5vdCB0aGUgc2FtZSBhcyBDUk9TU19DT01QSUxFLCB3ZSB3b3Vs
ZA0KbmVlZCB0byBpbnRyb2R1Y2UgYW4gZXh0cmEgdmFyaWFibGUgaW5zdGVhZCBvZiBDRkxBR1Mg
YW5kIHRoZW4gcGFzcyBpdA0KdG8gdGhlIGNvbXBpbGVyIGluIHNpbWlsYXIgd2F5IC10YXJnZXQg
cGFzc2VkIHRvIGNsYW5nOg0KDQpkaWZmIC0tZ2l0IGEvY29uZmlnL1N0ZEdOVS5tayBiL2NvbmZp
Zy9TdGRHTlUubWsNCmluZGV4IDNiZjM0NjIuLjRiY2ZjNTggMTAwNjQ0DQotLS0gYS9jb25maWcv
U3RkR05VLm1rDQorKysgYi9jb25maWcvU3RkR05VLm1rDQpAQCAtMyw4ICszLDggQEAgQVIgICAg
ICAgICA9ICQoQ1JPU1NfQ09NUElMRSlhcg0KIExEICAgICAgICAgPSAkKENST1NTX0NPTVBJTEUp
bGQNCiBpZmVxICgkKGNsYW5nKSx5KQ0KIGlmZXEgKCQoYXJtZHMpLHkpDQotQ0MgICAgICAgICA9
IGFybWNsYW5nDQotQ1hYICAgICAgICA9IGFybWNsYW5nDQorQ0MgICAgICAgICA9IGFybWNsYW5n
IC0tdGFyZ2V0PSQoQVJNRFNfVEFSR0VUKQ0KK0NYWCAgICAgICAgPSBhcm1jbGFuZyAtLXRhcmdl
dD0kKEFSTURTX1RBUkdFVCkNCiBMRF9MVE8gICAgID0gYXJtbGluayAtLXZlcmJvc2UgLS1ub19z
Y2FubGliDQogTEQgICAgICAgICA9IGFybWxpbmsgLS12ZXJib3NlIC0tbm9fc2NhbmxpYg0KIEFT
ICAgICAgICAgPSBhcm1hc20NCmRpZmYgLS1naXQgYS9jb25maWcvYXJtMzIubWsgYi9jb25maWcv
YXJtMzIubWsNCmluZGV4IDVhZmVkMDcuLmI0YzhmYjEgMTAwNjQ0DQotLS0gYS9jb25maWcvYXJt
MzIubWsNCisrKyBiL2NvbmZpZy9hcm0zMi5taw0KQEAgLTQsMTAgKzQsMTIgQEAgQ09ORklHX0FS
TV8kKFhFTl9PUykgOj0geQ0KIA0KIENPTkZJR19YRU5fSU5TVEFMTF9TVUZGSVggOj0NCiANCitB
Uk1EU19UQVJHRVQgOj0gYXJtLWFybS1ub25lLWVhYmkNCisNCiAjIEV4cGxpY2l0bHkgc3BlY2lm
aXkgMzItYml0IEFSTSBJU0Egc2luY2UgdG9vbGNoYWluIGRlZmF1bHQgY2FuIGJlDQotbXRodW1i
Og0KIGlmZXEgKCQoYXJtZHMpLHkpDQogIyBWRSBuZWVkZWQNCi1DRkxBR1MgKz0gLS10YXJnZXQ9
YXJtLWFybS1ub25lLWVhYmkgLW1hcmNoPWFybXY3LWENCitDRkxBR1MgKz0gLW1hcmNoPWFybXY3
LWENCiBlbHNlDQogQ0ZMQUdTICs9IC1tYXJtICMgLW1hcmNoPSAtbWNwdT0NCiAjIFVzZSBvbmx5
IGlmIGNhbGxpbmcgJChMRCkgZGlyZWN0bHkuDQpkaWZmIC0tZ2l0IGEvY29uZmlnL2FybTY0Lm1r
IGIvY29uZmlnL2FybTY0Lm1rDQppbmRleCA0NmIyMDNkLi41N2E3MzM1IDEwMDY0NA0KLS0tIGEv
Y29uZmlnL2FybTY0Lm1rDQorKysgYi9jb25maWcvYXJtNjQubWsNCkBAIC00LDkgKzQsMTEgQEAg
Q09ORklHX0FSTV8kKFhFTl9PUykgOj0geQ0KIA0KIENPTkZJR19YRU5fSU5TVEFMTF9TVUZGSVgg
Oj0NCiANCitBUk1EU19UQVJHRVQgOj0gYWFyY2g2NC1hcm0tbm9uZS1lYWJpDQorDQogaWZlcSAo
JChhcm1kcykseSkNCiAjIFZFIG5lZWRlZA0KLUNGTEFHUyArPSAtLXRhcmdldD1hYXJjaDY0LWFy
bS1ub25lLWVhYmkgLW1hcmNoPWFybXY4LjEtYStub2ZwK25vc2ltZA0KK0NGTEFHUyArPSAtbWFy
Y2g9YXJtdjguMS1hK25vZnArbm9zaW1kDQogZWxzZQ0KIENGTEFHUyArPSAjLW1hcm0gLW1hcmNo
PSAtbWNwdT0gZXRjDQogIyBVc2Ugb25seSBpZiBjYWxsaW5nICQoTEQpIGRpcmVjdGx5Lg0KDQpC
dXQgcGVyc29uYWxseSwgSSByZWFsbHkgZG8gbm90IHdhbnQgdG8gYWRkIG1vcmUgYnVpbGQgdmFy
aWFibGVzIGFuZA0KZmxhZ3MgKHdvdWxkIGFsc28gZHJvcCB0aGUgJ2FybWRzJyBpZiBJIGZpbmQg
YSB3YXkgaG93KS4gSW5zdGVhZCwgSSdkDQpwcmVmZXIgdGhlIGlkZWEgb2YgcmUtdXNpbmcga25v
d24gQ0ZMQUdTIGR1cmluZyB0aGUgY2Mtb3B0aW9uIHRlc3RzLA0KYnV0LCBhcyBJIHdyb3RlIGFi
b3ZlLCB3YXNuJ3Qgc3VyZSBpZiB0aGlzIGlzIGEgcmlnaHQvc2FmZSB0aGluZyB0byBkbywNCnNv
IHdoaWxlIHdvcmtpbmcgb24gaXQgSSBqdXN0IHF1aWNrbHkgaGFja2VkIG91dCB0aGUgb3B0aW9u
IGNhdXNpbmcNCmlzc3VlcyBsaW1pdGluZyBhbW91bnQgb2YgY2hhbmdlcy4NCg0KPiANCj4gQ2hl
ZXJzLA0KPiANCj4gLS0gDQo+IEp1bGllbiBHcmFsbA0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
