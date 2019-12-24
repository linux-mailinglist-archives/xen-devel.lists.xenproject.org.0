Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0144A129FA0
	for <lists+xen-devel@lfdr.de>; Tue, 24 Dec 2019 10:07:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijg7j-0001vO-54; Tue, 24 Dec 2019 09:05:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3nNa=2O=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1ijg7h-0001vJ-S9
 for xen-devel@lists.xenproject.org; Tue, 24 Dec 2019 09:05:01 +0000
X-Inumbo-ID: 75d544f0-262c-11ea-88e7-bc764e2007e4
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe09::715])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 75d544f0-262c-11ea-88e7-bc764e2007e4;
 Tue, 24 Dec 2019 09:05:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aeM5RHol1JfwrZ71pq7iAqsP6aBhIIE1DqKWduAV95uLoCUnFdJqO04s7tzUlBJAzdnFbeVmdQ7VAeP1lvkAZVaU3wLMOTC54+cemG8Alr6rDZiK5sObkM3uo6UbbWerSy9x0sj6CarissJ5ta6uICXh08TyUwAyAWOJNkGUlQjwt8N03J6uQc81td2x3eiuZvs2H0B1yVnmlq6GAD1ci/4x4Ljm3cgy5ENI5/o+1rXEwwI1Cmu843Yo89TxPAQXZ3BZsP/lXeuQ7SXRP9Gt6lLZVYhPLu5HyiMdXvlzdmT2Haj2i1svTAe7VQXC7lAk7JrsuxBcIDr93cdyGGu5Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBMN6YdXpZEN8kSnLGcDwH4T8yCWWn/Mkk6aGvWAmuo=;
 b=iL/Moav+2t/VMjzxmGrOVEKDZZilZgKYkkYdBbKT1F+9HSVou8iZT4pb/8Ub7rUKDt7mQBtn9MuBMbrfOPataHY8+r+FbyG7I1Z8iYIN2r7o/YbiKTmtrvExmF2+tn3F+hBg8UvbrmsoUsB5JIAwGi+VhoLcctqi2U2IVSf78mwQoZflPsV2Cb3/9yFF7G5q/WM8XXEBf384fMcdR0EhJd4TTmwOYb91B/d1PVrawb5vIygm9+5HeqLCfXIv689TZ0xiFMj6eKyWNnA/4KqS3K+VlQrN4Op8gu5IY+7P0RApz1hNrvpieMwJ1OLbxlmJ1qvAMsm4/amVHJFq70M6Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBMN6YdXpZEN8kSnLGcDwH4T8yCWWn/Mkk6aGvWAmuo=;
 b=lLO16ZokUzUG2HzkAQxeT3uL8d+Nwf0q+IYRbQQ7U12No55wIOL1AXjgBdELGZRDnolgExYH55mWnMYvdwF/1H0L5J2kByvezYbtS3F7HgVqtTYlLq6vGoauSkY6IEKicVp5+ZHGNGApPnZ45PU8wAh0gDTORpCYQiD8JIa1PTQ=
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com (10.255.30.78) by
 AM0PR02MB5921.eurprd02.prod.outlook.com (52.132.214.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Tue, 24 Dec 2019 09:04:57 +0000
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d]) by AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d%4]) with mapi id 15.20.2559.017; Tue, 24 Dec 2019
 09:04:57 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: George Dunlap <george.dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH V6 2/4] x86/altp2m: Add hypercall to set a
 range of sve bits
Thread-Index: AQHVuZnoQDql7d7Su0+P124sSAtk36fI9bKAgAAmd4D//+FVgIAAAbmA
Date: Tue, 24 Dec 2019 09:04:57 +0000
Message-ID: <7b19e9a8-0c95-e98e-c31b-8ab79da380da@bitdefender.com>
References: <20191223140409.32449-1-aisaila@bitdefender.com>
 <20191223140409.32449-2-aisaila@bitdefender.com>
 <f6cfead2-1c24-9ddf-e323-ceae43756940@citrix.com>
 <8c6b9f51-ca33-31cd-2991-9112bd48ff87@bitdefender.com>
 <7e997533-e143-a344-d58e-bc0cb7e53f70@citrix.com>
In-Reply-To: <7e997533-e143-a344-d58e-bc0cb7e53f70@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: ZR0P278CA0022.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::9) To AM0PR02MB5553.eurprd02.prod.outlook.com
 (2603:10a6:208:160::14)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4a55c8c6-0144-45d4-d3cb-08d78850596e
x-ms-traffictypediagnostic: AM0PR02MB5921:|AM0PR02MB5921:|AM0PR02MB5921:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR02MB59216140199E0FC62B573F70AB290@AM0PR02MB5921.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0261CCEEDF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(396003)(376002)(346002)(136003)(366004)(199004)(189003)(186003)(66946007)(31686004)(81156014)(81166006)(316002)(66446008)(64756008)(66556008)(54906003)(110136005)(5660300002)(31696002)(52116002)(66476007)(26005)(36756003)(478600001)(8676002)(8936002)(86362001)(6486002)(7416002)(2616005)(71200400001)(2906002)(4326008)(6506007)(6512007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB5921;
 H:AM0PR02MB5553.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: By9++LOE/koFKi/Xn1Qz4QeS1GeWi94/BwcElIKbA96/K++vF+bNx5FLHAyTMVag24J5WgHauJrWx2PVsagYMrNrLtaIQbrO1iJ/Sv+pGTBAeIcEl95AusV8gL93g3iT5KK7rVu5ehqxal8Sh7/+RitT19jNsbycGtoj2tTtcq5dmfT4czgBPR36qdnF2eKbsXLe17RF5LTNw3hPdO7c0veMW8blj1YwCf8Eiksfa5+iDPbgieeAcSTVtzdSkR8ze4Scbf2zrviAuIA0kJ5Pzzj1jGqfP3VMstNa/RbB4dDH6P0Y5maELbjIqNPV+NZo9yYE/Q7/mQOTCpG0ygGplYoAGzt1fOJ79M/xEl4stEmdLDfGrKPgONZmjWtExufoJGBktydDFR0MNAkptfDulWEIdeAwd57otcjSQiVOxFoNT2p7tI1dvyRXTuXvnR2Z
Content-ID: <32B0B22C93684141B87F7F41E86F27E6@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a55c8c6-0144-45d4-d3cb-08d78850596e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2019 09:04:57.6610 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +HFqWu8VlOciqB7OlRYR2XrjTrrLv6BviAJiJu4MZ9XwL7M31bYDPwKGt3JhR4VOMcukuG4lrYC/sMsXOBYLbGSj9VM2gfV8RuCc5Bc0VP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB5921
Subject: Re: [Xen-devel] [PATCH V6 2/4] x86/altp2m: Add hypercall to set a
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
 Jan Beulich <jbeulich@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+PiArLyoNCj4+Pj4gKyAqIFNldC9jbGVhciB0aGUgI1ZFIHN1cHByZXNzIGJpdCBmb3IgbXVs
dGlwbGUgcGFnZXMuICBPbmx5IGF2YWlsYWJsZSBvbiBWTVguDQo+Pj4+ICsgKi8NCj4+Pj4gK2lu
dCBwMm1fc2V0X3N1cHByZXNzX3ZlX211bHRpKHN0cnVjdCBkb21haW4gKmQsDQo+Pj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgeGVuX2h2bV9hbHRwMm1fc3VwcHJlc3Nf
dmVfbXVsdGkgKnN2ZSkNCj4+Pj4gK3sNCj4+Pj4gKyAgICBzdHJ1Y3QgcDJtX2RvbWFpbiAqaG9z
dF9wMm0gPSBwMm1fZ2V0X2hvc3RwMm0oZCk7DQo+Pj4+ICsgICAgc3RydWN0IHAybV9kb21haW4g
KmFwMm0gPSBOVUxMOw0KPj4+PiArICAgIHN0cnVjdCBwMm1fZG9tYWluICpwMm0gPSBob3N0X3Ay
bTsNCj4+Pj4gKyAgICB1aW50NjRfdCBzdGFydCA9IHN2ZS0+Zmlyc3RfZ2ZuOw0KPj4+PiArICAg
IGludCByYyA9IDA7DQo+Pj4+ICsNCj4+Pj4gKyAgICBpZiAoIHN2ZS0+dmlldyA+IDAgKQ0KPj4+
PiArICAgIHsNCj4+Pj4gKyAgICAgICAgaWYgKCBzdmUtPnZpZXcgPj0gTUFYX0FMVFAyTSB8fA0K
Pj4+PiArICAgICAgICAgICAgIGQtPmFyY2guYWx0cDJtX2VwdHBbYXJyYXlfaW5kZXhfbm9zcGVj
KHN2ZS0+dmlldywgTUFYX0FMVFAyTSldID09DQo+Pj4+ICsgICAgICAgICAgICAgbWZuX3goSU5W
QUxJRF9NRk4pICkNCj4+Pj4gKyAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPj4+PiArDQo+
Pj4+ICsgICAgICAgIHAybSA9IGFwMm0gPSBkLT5hcmNoLmFsdHAybV9wMm1bYXJyYXlfaW5kZXhf
bm9zcGVjKHN2ZS0+dmlldywNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgTUFYX0FMVFAyTSldOw0KPj4+PiArICAgIH0NCj4+
Pj4gKw0KPj4+PiArICAgIHAybV9sb2NrKGhvc3RfcDJtKTsNCj4+Pj4gKw0KPj4+PiArICAgIGlm
ICggYXAybSApDQo+Pj4+ICsgICAgICAgIHAybV9sb2NrKGFwMm0pOw0KPj4+PiArDQo+Pj4+ICsg
ICAgd2hpbGUgKCBzdmUtPmxhc3RfZ2ZuID49IHN0YXJ0ICkNCj4+Pj4gKyAgICB7DQo+Pj4+ICsg
ICAgICAgIHAybV9hY2Nlc3NfdCBhOw0KPj4+PiArICAgICAgICBwMm1fdHlwZV90IHQ7DQo+Pj4+
ICsgICAgICAgIG1mbl90IG1mbjsNCj4+Pj4gKyAgICAgICAgaW50IGVyciA9IDA7DQo+Pj4+ICsN
Cj4+Pj4gKyAgICAgICAgaWYgKCBhbHRwMm1fZ2V0X2VmZmVjdGl2ZV9lbnRyeShwMm0sIF9nZm4o
c3RhcnQpLCAmbWZuLCAmdCwgJmEsIEFQMk1HRVRfcXVlcnkpICkNCj4+Pj4gKyAgICAgICAgICAg
IGEgPSBwMm0tPmRlZmF1bHRfYWNjZXNzOw0KPj4+DQo+Pj4gU28gaW4gdGhlIHNpbmdsZS1lbnRy
eSB2ZXJzaW9uLCBpZiBhbHRwMm1fZ2V0X2VmZmVjdGl2ZV9lbnRyeSgpIHJldHVybnMNCj4+PiBh
biBlcnJvciwgeW91IHBhc3MgdGhhdCBlcnJvciB1cCB0aGUgc3RhY2s7IGJ1dCBpbiB0aGUgbXVs
dGlwbGUtZW50cnkNCj4+PiB2ZXJzaW9uLCB5b3UgaWdub3JlIHRoZSBlcnJvciBhbmQgc2ltcGx5
IHNldCB0aGUgYWNjZXNzIHRvDQo+Pj4gZGVmYXVsdF9hY2Nlc3M/ICBJIGRvbid0IHRoaW5rIHRo
YXQgY2FuIGJlIHJpZ2h0LiAgSWYgaXQgaXMgcmlnaHQsIHRoZW4NCj4+PiBpdCBkZWZpbml0ZWx5
IG5lZWRzIGEgY29tbWVudC4NCj4+Pg0KPj4NCj4+IFRoZSBpZGVhIGJlaGluZCB0aGlzIHdhcyB0
byBoYXZlIGEgYmVzdCBlZmZvcnQgdHJ5IGFuZCBzaWduYWwgdGhlIGZpcnN0DQo+PiBlcnJvci4g
SWYgdGhlIGdldF9lbnRyeSBmYWlscyB0aGVuIHRoZSBiZXN0IHdheSB0byBnbyBpcyB3aXRoDQo+
PiBkZWZhdWx0X2FjY2VzcyBidXQgdGhpcyBpcyBvcGVuIGZvciBkZWJhdGUuDQo+IA0KPiBJIGRv
bid0IHNlZSBob3cgaXQncyBhIGdvb2QgaWRlYSBhdCBhbGwuIElmIGdldF9lZmZlY3RpdmVfZW50
cnkgZmFpbHMsDQo+IHRoZW4gbWZuIGFuZCB0IG1heSBib3RoIGJlIHVuaW5pdGlhbGl6ZWQuICBJ
ZiBhbiBhdHRhY2tlciBjYW4gYXJyYW5nZQ0KPiBmb3IgdGhvc2UgdG8gaGF2ZSB0aGUgdmFsdWVz
IHNoZSB3YW50cywgc2hlIGNvdWxkIHVzZSB0aGlzIHRvIHRha2Ugb3Zlcg0KPiB0aGUgc3lzdGVt
Lg0KPiANCj4+IEFub3RoZXIgd2F5IHRvIHNvbHZlIHRoaXMgaXMgdG8gdXBkYXRlIHRoZSBmaXJz
dF9lcnJvcl9nZm4vZmlyc3RfZXJyb3INCj4+IGFuZCB0aGVuIGNvbnRpbnVlLiBJIHRoaW5rIHRo
aXMgY2EgYmUgdXNlZCB0byBtYWtlIHAybV9zZXRfc3VwcHJlc3NfdmUoKQ0KPj4gY2FsbCBwMm1f
c2V0X3N1cHByZXNzX3ZlX211bHRpLg0KPiANCj4gSXNuJ3QgdGhhdCBleGFjdGx5IHRoZSBzZW1h
bnRpY3MgeW91IHdhbnQgLS0gdHJ5IGdmbiBOLCBpZiB0aGF0IGZhaWxzLA0KPiByZWNvcmQgaXQg
YW5kIG1vdmUgb24gdG8gdGhlIG5leHQgb25lPyAgV2h5IHdvdWxkICJ3cml0ZSBhbiBlbnRyeSB3
aXRoDQo+IHJhbmRvbSB2YWx1ZXMgZm9yIG1mbiBhbmQgdHlwZSwgYnV0IHdpdGggdGhlIGRlZmF1
bHQgYWNjZXNzIiBiZSBhIGJldHRlcg0KPiByZXNwb25zZT8NCj4gDQoNClRoYXQgaXMgcmlnaHQs
IEknbGwgZ28gd2l0aCB0aGlzIGZvciB0aGUgbmV4dCB2ZXJzaW9uLiBTaG91bGQgSSBoYXZlIHRo
ZSANCnNpbmdsZSB2ZXJzaW9uIGNhbGwgdGhlIF9tdWx0aSB2ZXJzaW9uIGFmdGVyIHRoaXMgY2hh
bmdlPw0KDQpBbGV4DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
