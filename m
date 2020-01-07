Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB86E13278F
	for <lists+xen-devel@lfdr.de>; Tue,  7 Jan 2020 14:28:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ioorr-00056b-CR; Tue, 07 Jan 2020 13:25:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=P5Cd=24=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1ioorp-00056W-BL
 for xen-devel@lists.xenproject.org; Tue, 07 Jan 2020 13:25:53 +0000
X-Inumbo-ID: 3924ce06-3151-11ea-bf56-bc764e2007e4
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe06::716])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3924ce06-3151-11ea-bf56-bc764e2007e4;
 Tue, 07 Jan 2020 13:25:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lc79ElkcKPR9SffqIJfBJ7m5Ms1DTpjsOzJ2hry4BoH7aKSUOfFd40A+WEevs1gqc/Xt7sg/EPaAFczw4BpeQLw71TbCDzY+m9KPVLzkU2WRdlZc//gOP8wpieaJJEHsfDzVpBNBUO+BpmWOhS9ampOXvLsH+QMOy4bfLEYyofCcC2jsZ7wKNU0iY5qE/vHEfUQQ4g1gBnNwQEgqwEDY3Be5EXpgC59QxnA5b5uNYycJickD+SBVpP0yzNb6KAj6+vUwpiT8w/BSkHvJrFfmRU0ejlpFtFyNCnGYM5q7jClitq72wrk47o4+ZOOPLfLNBYA6LtnoGo8adKWsD/ejew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y0zDnPFwDNV//qdhq1Di5CsqVxKT5/2FDSjMBZYp4PU=;
 b=V9dGRLxG6xWw4Yu3Hn0AJCCyEUgFI3FNcU4l35vNCcWWRtq9VBhmowXKWxW+OW9Xf5z05oCWZJUBgcr8ncRe8PtVhCJzyStkL03CaJHeYr7ylnxDXQlMtCLYHc1VL4FTvz9M4YDl8Lxmdz5TUaCJpNNY2mcl90TpmPPM43HoaFrwW1/hYq+LqRIaL/PTCl3km/1Z536r2zJ/XAY9edEiWTSHXRlxiZpY107o/N7u1LtptWDjh5gV5pypbz/4IYwGq0EfmQPfM7dgMdcaOhR4IU4tVuIBYgf3idF3cUC5T63PNmIMSj2t3CBwYpwTEnJJsYv9i4F4GQfOMlssYAnkpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y0zDnPFwDNV//qdhq1Di5CsqVxKT5/2FDSjMBZYp4PU=;
 b=BAlzPmfiWg8mSvmvstsFnkx/EjK8VXuzpNV4jWWs0nbKe3kDNIy+oHt+xZHdjeRx78wIMLF0O3KuBj6532d3FJBGgKvGx+IAh3nfaNhcLzTFdzjTp+zZETgLnBlPy3q8YG7DqBQoVq3MtfudwOrxAoXCpUacTt+8TomyRuxc3mc=
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com (10.170.219.144) by
 DB6PR02MB3077.eurprd02.prod.outlook.com (10.175.233.143) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.15; Tue, 7 Jan 2020 13:25:49 +0000
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f1c2:7dd1:1131:1c1d]) by DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f1c2:7dd1:1131:1c1d%7]) with mapi id 15.20.2623.008; Tue, 7 Jan 2020
 13:25:49 +0000
Received: from [10.10.195.54] (91.199.104.6) by
 ZR0P278CA0009.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:16::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2602.12 via Frontend Transport; Tue, 7 Jan 2020 13:25:48 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH V6 1/4] x86/mm: Add array_index_nospec to guest provided
 index values
Thread-Index: AQHVuZnmK7OgfjFiuE29BC4XwHoq4afNpKMAgBGkGoA=
Date: Tue, 7 Jan 2020 13:25:49 +0000
Message-ID: <f82b7198-e7c3-df69-f53a-06c436e3ecd6@bitdefender.com>
References: <20191223140409.32449-1-aisaila@bitdefender.com>
 <39338776-edcd-0b5d-5c39-7d3ef7706525@suse.com>
In-Reply-To: <39338776-edcd-0b5d-5c39-7d3ef7706525@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: ZR0P278CA0009.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::19) To DB6PR02MB2999.eurprd02.prod.outlook.com
 (2603:10a6:6:17::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6c4e9a7a-b2a6-450e-dc94-08d793751c7d
x-ms-traffictypediagnostic: DB6PR02MB3077:|DB6PR02MB3077:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DB6PR02MB30775574ED9D1F4BF518576AAB3F0@DB6PR02MB3077.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 027578BB13
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(346002)(376002)(136003)(396003)(39860400002)(189003)(199004)(81166006)(8936002)(81156014)(86362001)(31696002)(71200400001)(5660300002)(6916009)(8676002)(6486002)(316002)(54906003)(31686004)(36756003)(16576012)(66446008)(64756008)(26005)(53546011)(4326008)(186003)(66556008)(66476007)(16526019)(52116002)(2906002)(956004)(66946007)(478600001)(2616005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR02MB3077;
 H:DB6PR02MB2999.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YJnvBqUZLL126pFBPp/4uY/oW4iwV5oFIPcblvUQHJIW5d7r05YNAmtmBStY1i4We4ubdy3fW4RI20q26f8h78Pr8GabT4mkLDgLC5FawwanyPN3sV9LfNr+XhNIa/MWmAfzzQ4vle3lvclnpC0miJSRVUeicFPQvydvM+SVZI3x1p+I2m8tkBQbAjd8AjE6ZEpkpuV3+WdhbE6qwouHFdF68IJuCc058qtl67QD31xyXikW8K/dF1ZW00s0dpNuYo6Ch7gHifMYHpMOKOsRbJo7zvlltpKGtKQXJ6jZKw8l5DqoJTBNnHHsivVaiBRm7Gc3CsXbzDNNBdkWz/bRU31aerRFRvF3kfcyHYHiKPG8lJC/Fm3Cd2Mgm/8R1g4HHb5ForDHsJ2jf7ip1wTwQjSAHAXzjrav0usjYZhLO1d2aXotqcNYnFqeW+nn7fRRoGUypjqbAIwph5bTQRqueWAWCmzlg9KmeNnuUl04FY8G3HJ6q+zvWC8OLuOPWdbQITc+Bl6GLTWlWOJyqnFqwA==
Content-ID: <7528170E73502E4294FB7EFF963A6315@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c4e9a7a-b2a6-450e-dc94-08d793751c7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jan 2020 13:25:49.5960 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VbbEKO7xKuD1HEt3+Fb+ccYubmXThceLk5cdQKm3zXp3zU4Uom5wfZHzX7z2Jw3iwhzmkqU0cI0pq+imN6aJVnjvDSJ8TKWeVg8J0IRTu3s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR02MB3077
Subject: Re: [Xen-devel] [PATCH V6 1/4] x86/mm: Add array_index_nospec to
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Wei Liu <wl@xen.org>, Razvan COJOCARU <rcojocaru@bitdefender.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDI3LjEyLjIwMTkgMTA6MDEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiAocmUtc2VuZGlu
ZywgYXMgSSBzdGlsbCBkb24ndCBzZWUgdGhlIG1haWwgaGF2aW5nIGFwcGVhcmVkIG9uIHRoZSBs
aXN0KQ0KPiANCj4gT24gMjMuMTIuMjAxOSAxNTowNCwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEg
d3JvdGU6DQo+PiBDaGFuZ2VzIHNpbmNlIFY1Og0KPj4gCS0gQWRkIGJsYWNrIGxpbmVzDQo+IA0K
PiBMdWNraWx5IG5vIGNvbG9yIGNvbWVzIHRocm91Z2ggaW4gcGxhaW4gdGV4dCBtYWlscyA7LSkN
Cj4gDQo+PiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jDQo+PiArKysgYi94ZW4v
YXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jDQo+PiBAQCAtMzY2LDExICszNjYsMTIgQEAgbG9uZyBw
Mm1fc2V0X21lbV9hY2Nlc3Moc3RydWN0IGRvbWFpbiAqZCwgZ2ZuX3QgZ2ZuLCB1aW50MzJfdCBu
ciwNCj4+ICAgI2lmZGVmIENPTkZJR19IVk0NCj4+ICAgICAgIGlmICggYWx0cDJtX2lkeCApDQo+
PiAgICAgICB7DQo+PiAtICAgICAgICBpZiAoIGFsdHAybV9pZHggPj0gTUFYX0FMVFAyTSB8fA0K
Pj4gLSAgICAgICAgICAgICBkLT5hcmNoLmFsdHAybV9lcHRwW2FsdHAybV9pZHhdID09IG1mbl94
KElOVkFMSURfTUZOKSApDQo+PiArICAgICAgICBpZiAoIGFsdHAybV9pZHggPj0gIG1pbihBUlJB
WV9TSVpFKGQtPmFyY2guYWx0cDJtX3AybSksIE1BWF9FUFRQKSB8fA0KPiANCj4gU3RyYXkgYmxh
bmsgYWZ0ZXIgPj0gLg0KPiANCj4+ICsgICAgICAgICAgICAgZC0+YXJjaC5hbHRwMm1fZXB0cFth
cnJheV9pbmRleF9ub3NwZWMoYWx0cDJtX2lkeCwgTUFYX0VQVFApXSA9PQ0KPiANCj4gSSBhY2Nl
cHQgeW91IGNhbid0IChjdXJyZW50bHkpIHVzZSBhcnJheV9hY2Nlc3Nfbm9zcGVjKCkgaGVyZSwN
Cj4gYnV0IC4uLg0KPiANCj4+ICsgICAgICAgICAgICAgbWZuX3goSU5WQUxJRF9NRk4pICkNCj4+
ICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+PiAgIA0KPj4gLSAgICAgICAgYXAybSA9
IGQtPmFyY2guYWx0cDJtX3AybVthbHRwMm1faWR4XTsNCj4+ICsgICAgICAgIGFwMm0gPSBkLT5h
cmNoLmFsdHAybV9wMm1bYXJyYXlfaW5kZXhfbm9zcGVjKGFsdHAybV9pZHgsIE1BWF9BTFRQMk0p
XTsNCj4gDQo+IC4uLiBJIGRvbid0IHNlZSB3aHkgeW91IHN0aWxsIGVmZmVjdGl2ZWx5IG9wZW4t
Y29kZSBpdCBoZXJlLg0KDQpJIGFtIG5vdCBzdXJlIEkgZm9sbG93IHlvdSBoZXJlLCB0aGF0IGlz
IHdoYXQgd2UgYWdyZWVkIGluIHY1IA0KKGh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvYXJj
aGl2ZXMvaHRtbC94ZW4tZGV2ZWwvMjAxOS0xMi9tc2cwMTcwNC5odG1sKS4gDQpEaWQgSSBtaXNz
IHNvbWV0aGluZz8NCg0KDQo+IA0KPj4gQEAgLTQyNSwxMSArNDI2LDEyIEBAIGxvbmcgcDJtX3Nl
dF9tZW1fYWNjZXNzX211bHRpKHN0cnVjdCBkb21haW4gKmQsDQo+PiAgICNpZmRlZiBDT05GSUdf
SFZNDQo+PiAgICAgICBpZiAoIGFsdHAybV9pZHggKQ0KPj4gICAgICAgew0KPj4gLSAgICAgICAg
aWYgKCBhbHRwMm1faWR4ID49IE1BWF9BTFRQMk0gfHwNCj4+IC0gICAgICAgICAgICAgZC0+YXJj
aC5hbHRwMm1fZXB0cFthbHRwMm1faWR4XSA9PSBtZm5feChJTlZBTElEX01GTikgKQ0KPj4gKyAg
ICAgICAgaWYgKCBhbHRwMm1faWR4ID49ICBtaW4oQVJSQVlfU0laRShkLT5hcmNoLmFsdHAybV9w
Mm0pLCBNQVhfRVBUUCkgfHwNCj4+ICsgICAgICAgICAgICAgZC0+YXJjaC5hbHRwMm1fZXB0cFth
cnJheV9pbmRleF9ub3NwZWMoYWx0cDJtX2lkeCwgTUFYX0VQVFApXSA9PQ0KPj4gKyAgICAgICAg
ICAgICBtZm5feChJTlZBTElEX01GTikgKQ0KPj4gICAgICAgICAgICAgICByZXR1cm4gLUVJTlZB
TDsNCj4+ICAgDQo+PiAtICAgICAgICBhcDJtID0gZC0+YXJjaC5hbHRwMm1fcDJtW2FsdHAybV9p
ZHhdOw0KPj4gKyAgICAgICAgYXAybSA9IGQtPmFyY2guYWx0cDJtX3AybVthcnJheV9pbmRleF9u
b3NwZWMoYWx0cDJtX2lkeCwgTUFYX0FMVFAyTSldOw0KPiANCj4gU2FtZSB0d28gcmVtYXJrcyBo
ZXJlIHRoZW4sIGFuZCBhZ2FpbiBmdXJ0aGVyIGRvd24uDQo+IA0KPj4gLS0tIGEveGVuL2FyY2gv
eDg2L21tL3AybS5jDQo+PiArKysgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMNCj4+IEBAIC0yNTc3
LDYgKzI1NzcsOCBAQCBpbnQgcDJtX2luaXRfYWx0cDJtX2J5X2lkKHN0cnVjdCBkb21haW4gKmQs
IHVuc2lnbmVkIGludCBpZHgpDQo+PiAgICAgICBpZiAoIGlkeCA+PSBNQVhfQUxUUDJNICkNCj4+
ICAgICAgICAgICByZXR1cm4gcmM7DQo+PiAgIA0KPj4gKyAgICBpZHggPSBhcnJheV9pbmRleF9u
b3NwZWMoaWR4LCBNQVhfQUxUUDJNKTsNCj4+ICsNCj4+ICAgICAgIGFsdHAybV9saXN0X2xvY2so
ZCk7DQo+PiAgIA0KPj4gICAgICAgaWYgKCBkLT5hcmNoLmFsdHAybV9lcHRwW2lkeF0gPT0gbWZu
X3goSU5WQUxJRF9NRk4pICkNCj4gDQo+IFdoYXQgYWJvdXQgdGhpcyBhcnJheSBhY2Nlc3M/DQo+
IA0KPj4gQEAgLTI2MTgsNiArMjYyMCw4IEBAIGludCBwMm1fZGVzdHJveV9hbHRwMm1fYnlfaWQo
c3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IGlkeCkNCj4+ICAgICAgIGlmICggIWlkeCB8
fCBpZHggPj0gTUFYX0FMVFAyTSApDQo+PiAgICAgICAgICAgcmV0dXJuIHJjOw0KPj4gICANCj4+
ICsgICAgaWR4ID0gYXJyYXlfaW5kZXhfbm9zcGVjKGlkeCwgTUFYX0FMVFAyTSk7DQo+IA0KPiBU
aGVyZSdzIGEgZC0+YXJjaC5hbHRwMm1fZXB0cFtdIGFjY2VzcyBkb3duIGZyb20gaGVyZSB0b28u
IEknbSBub3QNCj4gZ29pbmcgdG8gbG9vayBmdXJ0aGVyLiBQbGVhc2UgZ2V0IHRoaW5ncyBpbnRv
IGNvbnNpc3RlbnQgc2hhcGUgd2hpbGUNCj4geW91IGRvIHRoaXMgdHJhbnNmb3JtYXRpb24uDQo+
IA0KDQpJIHdpbGwgY2hhbmdlIHRoZSBpZHggcGFydCBpbiBwMm1faW5pdF9hbHRwMm1fYnlfaWQo
KSBhbmQgDQpwMm1fZGVzdHJveV9hbHRwMm1fYnlfaWQoKSBzbyB0aGV5IG1hdGNoIHRoZSByZXN0
IG9mIHRoZSBjaGVja3M6DQoiaWYgKCBpZHggPj0gIG1pbihBUlJBWV9TSVpFKGQtPmFyY2guYWx0
cDJtX3AybSksIE1BWF9FUFRQKSkuLi4iLCBkcm9wIA0KdGhlIGlkeCA9IGFycmF5X2luZGV4X25v
c3BlYyhpZHgsIE1BWF9BTFRQMk0pOyBhbmQgaGF2ZSANCmFycmF5X2luZGV4X25vc3BlYygpIGlu
dG8gcGxhY2UuDQoNCg0KQWxleA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
