Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 660A1100097
	for <lists+xen-devel@lfdr.de>; Mon, 18 Nov 2019 09:41:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iWcXu-0005mp-VE; Mon, 18 Nov 2019 08:38:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=nFnZ=ZK=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1iWcXt-0005mk-NQ
 for xen-devel@lists.xenproject.org; Mon, 18 Nov 2019 08:38:05 +0000
X-Inumbo-ID: bc77944a-09de-11ea-9631-bc764e2007e4
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.95]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc77944a-09de-11ea-9631-bc764e2007e4;
 Mon, 18 Nov 2019 08:38:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YHeLZGBq4QsiCwFDgk9vo2ZECusvZa92elTc06gO0PYpPXbthwLFyDmXj/XNoNvOctEfcHpvzeTxp7+5LHxrqQ400ovDi0rDd7YawRKH5Jezq/1VtCa0nZrw/wDqCK//grtA/os2E82Jy87ezJSX8C0WFVdZtZqGph4eoVdF/t6l3M+eRFJqCye+w49ZSggviRyWmFwgJu5I02h0G6EvvMvqFBN2M+JXp4+dDiiFUwE5bHyb+o52hCi/JTi98H4IWzdUqXXXgMRS0RGPTXNZ2T577P0Wk0bjA//m7KBDL1SiiHAe5AES6WBQ/oT4QbbUPN18wIOzMjxqG5Y+IKAV0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=llf+/EIdsUjxyKe+gpW0K0IFxofjx4rY6yE5Pa9v8bY=;
 b=E8wI9WMsHEJtSlovdpwfUintFkVziGL81x9cLVZgwsKY7b6JJO5C5e7Z5mKDIGw6pNqyV03L4+zHZ/Erc4qOi5pQvycYFPGzhT12+6PAs/6aZGosUMQSQ92cDL3ZyAT1zikggyzokrBjHwvpiV5mDBCYn8bbpjPeT2x+a+z9TCEkO5qiAlNDNaiU22Jz+Rn2JrXR22cPOqQcjd2jH8EKKYDJSwlO7kC13IxR7Ujk47frmsFTyX6dJ3ygT4RXsZVsics9w7KLD5EQ9JsJxgHZM+8An03xpTC37ytH70c/TUJKf+0xCkz/ihjxD/3x4HFogWsZPAIIM6wp4mktWDOdgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=llf+/EIdsUjxyKe+gpW0K0IFxofjx4rY6yE5Pa9v8bY=;
 b=ZgUwNhS5wp1FZrUsJa1HqjQGgm+Z1Ir+iWWg3A+unNrRVxZ0IA/7pK34/hGqcPnpDL1fC9EEgqFSJqJ21aFue8L3k3P6oH0o1inrVdvrIp0iQKa+GRMCKonDdCLFZ/csl94zcc9gMV2d+u1Y2Hw/+U9o/PZ/U4ktsvTuu5fgdhU=
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com (10.255.30.78) by
 AM0PR02MB3634.eurprd02.prod.outlook.com (52.134.82.18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.23; Mon, 18 Nov 2019 08:38:02 +0000
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::64a3:6278:eb96:26e0]) by AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::64a3:6278:eb96:26e0%4]) with mapi id 15.20.2451.029; Mon, 18 Nov 2019
 08:38:02 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [Xen-devel] [PATCH V2 2/2] x86/mm: Make use of the default
 access param from xc_altp2m_create_view
Thread-Index: AQHVlLfDr+RM8TY7GUOAeWVMyfSIGKeHeLoAgAk0yoA=
Date: Mon, 18 Nov 2019 08:38:02 +0000
Message-ID: <d2502775-1e48-50c7-3f43-13e1683d2272@bitdefender.com>
References: <20191106153442.12776-1-aisaila@bitdefender.com>
 <20191106153442.12776-2-aisaila@bitdefender.com>
 <60fdf6d4-d43b-f1aa-99e7-9f1818513904@suse.com>
In-Reply-To: <60fdf6d4-d43b-f1aa-99e7-9f1818513904@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR04CA0025.eurprd04.prod.outlook.com
 (2603:10a6:208:122::38) To AM0PR02MB5553.eurprd02.prod.outlook.com
 (2603:10a6:208:160::14)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bba5cb8a-c4c2-4e5e-0d51-08d76c029f93
x-ms-traffictypediagnostic: AM0PR02MB3634:|AM0PR02MB3634:|AM0PR02MB3634:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR02MB363410E67B4770C0C62505FDAB4D0@AM0PR02MB3634.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0225B0D5BC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(136003)(39860400002)(366004)(396003)(199004)(189003)(66066001)(25786009)(66476007)(54906003)(6512007)(6436002)(8936002)(4326008)(71190400001)(71200400001)(64756008)(316002)(256004)(478600001)(14454004)(14444005)(26005)(6246003)(31686004)(186003)(66446008)(3846002)(31696002)(6116002)(76176011)(52116002)(2906002)(102836004)(6506007)(53546011)(7416002)(66556008)(2616005)(476003)(386003)(6916009)(486006)(11346002)(446003)(36756003)(229853002)(8676002)(6486002)(5660300002)(99286004)(86362001)(305945005)(7736002)(81166006)(81156014)(66946007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB3634;
 H:AM0PR02MB5553.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e9336Ey4t15zFjHqhgEM41bM6eCBHTCeUl0nDJO0bqpuD4twCsXwivPTDocO+3sag7A0Nsq1xXdb20yvaKg2x+eRly97e05BZqinrY6k+ef2BSPd8viycPwl8fvrutYj2vRnzCMROKBACuOPdhMq1Vkza6+NZP3Ezi2SZAh8C/dNCHYXS5iO38WlNUIMS2RaAcYQHD47uRyxF6Kj/5DLz0FfSi84qDcaQ6P2INp968xs10KstWKvf+DhuoNAhNJr/ynRLGvJhpyl+w8DrQ76QEe1yfLKywq8bAd4kqgAJhIZcVaNgODuXe5U4XukrARc3HTy6NeWkeBbOFN9qG6DorzpcNMA55hIAEW9ZH10wa1OJffkjGAYloF4manHUmEM7uJgO0XXjEQzMcOvaT/ypRvEVoj1OuglWwOnn0IPTOXKoqoN9UAO1LurcJMDtDfd
Content-ID: <E8B58738FA4F8A479E72A51A62AD959D@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bba5cb8a-c4c2-4e5e-0d51-08d76c029f93
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2019 08:38:02.0872 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Fa17fmH5FExbxHFxO09G3VMgdrNgxHeZpHtSzAQu/8IWkJfYJSJYtOXrPxtzivo9hIjaoercIYwvuJLMFaAcv+Jt9huqR76xicmCoAkIiI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB3634
Subject: Re: [Xen-devel] [PATCH V2 2/2] x86/mm: Make use of the default
 access param from xc_altp2m_create_view
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
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, "wl@xen.org" <wl@xen.org>,
 Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDEyLjExLjIwMTkgMTQ6MDIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwNi4xMS4y
MDE5IDE2OjM1LCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9tbS9wMm0tZXB0LmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9tbS9wMm0tZXB0LmMN
Cj4+IEBAIC0xMzQ1LDEzICsxMzQ1LDE0IEBAIHZvaWQgc2V0dXBfZXB0X2R1bXAodm9pZCkNCj4+
ICAgICAgIHJlZ2lzdGVyX2tleWhhbmRsZXIoJ0QnLCBlcHRfZHVtcF9wMm1fdGFibGUsICJkdW1w
IFZULXggRVBUIHRhYmxlcyIsIDApOw0KPj4gICB9DQo+PiAgIA0KPj4gLXZvaWQgcDJtX2luaXRf
YWx0cDJtX2VwdChzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgaSkNCj4+ICt2b2lkIHAy
bV9pbml0X2FsdHAybV9lcHQoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgaW50IGksDQo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgIHAybV9hY2Nlc3NfdCBkZWZhdWx0X2FjY2VzcykNCj4+
ICAgew0KPj4gICAgICAgc3RydWN0IHAybV9kb21haW4gKnAybSA9IGQtPmFyY2guYWx0cDJtX3Ay
bVtpXTsNCj4+ICAgICAgIHN0cnVjdCBwMm1fZG9tYWluICpob3N0cDJtID0gcDJtX2dldF9ob3N0
cDJtKGQpOw0KPj4gICAgICAgc3RydWN0IGVwdF9kYXRhICplcHQ7DQo+PiAgIA0KPj4gLSAgICBw
Mm0tPmRlZmF1bHRfYWNjZXNzID0gaG9zdHAybS0+ZGVmYXVsdF9hY2Nlc3M7DQo+PiArICAgIHAy
bS0+ZGVmYXVsdF9hY2Nlc3MgPSBkZWZhdWx0X2FjY2VzczsNCj4+ICAgICAgIHAybS0+ZG9tYWlu
ID0gaG9zdHAybS0+ZG9tYWluOw0KPj4gICANCj4+ICAgICAgIHAybS0+Z2xvYmFsX2xvZ2RpcnR5
ID0gaG9zdHAybS0+Z2xvYmFsX2xvZ2RpcnR5Ow0KPiANCj4gQWxsIG9mIHRoaXMgaXMgbm90IEVQ
VC1zcGVjaWZpYy4gQmVmb3JlIGFkZGluZyBtb3JlIGluZnJhc3RydWN0dXJlIHRvDQo+IGNvdmVy
IGZvciB0aGlzIChoZXJlOiBhbm90aGVyIGZ1bmN0aW9uIHBhcmFtZXRlciksIGhvdyBhYm91dCBt
b3ZpbmcNCj4gdGhlc2UgcGFydHMgaW50byB2ZW5kb3ItaW5kZXBlbmRlbnQgY29kZT8NCg0KT2ss
IEkgd2lsbCBtb3ZlIHRoZSBub24gZXB0IGNvZGUgaW4gcDJtX2FjdGl2YXRlX2FsdHAybSgpLg0K
DQo+IA0KPj4gQEAgLTI1NzIsMTcgKzI1NzQsMzYgQEAgaW50IHAybV9pbml0X2FsdHAybV9ieV9p
ZChzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBpbnQgaWR4KQ0KPj4gICAgICAgYWx0cDJtX2xp
c3RfbG9jayhkKTsNCj4+ICAgDQo+PiAgICAgICBpZiAoIGQtPmFyY2guYWx0cDJtX2VwdHBbaWR4
XSA9PSBtZm5feChJTlZBTElEX01GTikgKQ0KPj4gLSAgICAgICAgcmMgPSBwMm1fYWN0aXZhdGVf
YWx0cDJtKGQsIGlkeCk7DQo+PiArICAgICAgICByYyA9IHAybV9hY3RpdmF0ZV9hbHRwMm0oZCwg
aWR4LCBob3N0cDJtLT5kZWZhdWx0X2FjY2Vzcyk7DQo+PiAgIA0KPj4gICAgICAgYWx0cDJtX2xp
c3RfdW5sb2NrKGQpOw0KPj4gICAgICAgcmV0dXJuIHJjOw0KPj4gICB9DQo+PiAgIA0KPj4gLWlu
dCBwMm1faW5pdF9uZXh0X2FsdHAybShzdHJ1Y3QgZG9tYWluICpkLCB1aW50MTZfdCAqaWR4KQ0K
Pj4gK2ludCBwMm1faW5pdF9uZXh0X2FsdHAybShzdHJ1Y3QgZG9tYWluICpkLCB1aW50MTZfdCAq
aWR4LA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICB1aW50MTZfdCBodm1tZW1fZGVmYXVs
dF9hY2Nlc3MpDQo+PiAgIHsNCj4+ICAgICAgIGludCByYyA9IC1FSU5WQUw7DQo+PiAgICAgICB1
bnNpZ25lZCBpbnQgaTsNCj4+ICAgDQo+PiArICAgIHN0YXRpYyBjb25zdCBwMm1fYWNjZXNzX3Qg
bWVtYWNjZXNzW10gPSB7DQo+PiArI2RlZmluZSBBQ0NFU1MoYWMpIFtYRU5NRU1fYWNjZXNzXyMj
YWNdID0gcDJtX2FjY2Vzc18jI2FjDQo+PiArICAgICAgICBBQ0NFU1MobiksDQo+PiArICAgICAg
ICBBQ0NFU1MociksDQo+PiArICAgICAgICBBQ0NFU1ModyksDQo+PiArICAgICAgICBBQ0NFU1Mo
cncpLA0KPj4gKyAgICAgICAgQUNDRVNTKHgpLA0KPj4gKyAgICAgICAgQUNDRVNTKHJ4KSwNCj4+
ICsgICAgICAgIEFDQ0VTUyh3eCksDQo+PiArICAgICAgICBBQ0NFU1Mocnd4KSwNCj4+ICsgICAg
ICAgIEFDQ0VTUyhyeDJydyksDQo+PiArICAgICAgICBBQ0NFU1MobjJyd3gpLA0KPj4gKyN1bmRl
ZiBBQ0NFU1MNCj4+ICsgICAgfTsNCj4+ICsNCj4+ICsgICAgaWYgKCBodm1tZW1fZGVmYXVsdF9h
Y2Nlc3MgPiBYRU5NRU1fYWNjZXNzX2RlZmF1bHQgKQ0KPj4gKyAgICAgICAgcmV0dXJuIHJjOw0K
Pj4gKw0KPj4gICAgICAgYWx0cDJtX2xpc3RfbG9jayhkKTsNCj4+ICAgDQo+PiAgICAgICBmb3Ig
KCBpID0gMDsgaSA8IE1BWF9BTFRQMk07IGkrKyApDQo+PiBAQCAtMjU5MCw3ICsyNjExLDcgQEAg
aW50IHAybV9pbml0X25leHRfYWx0cDJtKHN0cnVjdCBkb21haW4gKmQsIHVpbnQxNl90ICppZHgp
DQo+PiAgICAgICAgICAgaWYgKCBkLT5hcmNoLmFsdHAybV9lcHRwW2ldICE9IG1mbl94KElOVkFM
SURfTUZOKSApDQo+PiAgICAgICAgICAgICAgIGNvbnRpbnVlOw0KPj4gICANCj4+IC0gICAgICAg
IHJjID0gcDJtX2FjdGl2YXRlX2FsdHAybShkLCBpKTsNCj4+ICsgICAgICAgIHJjID0gcDJtX2Fj
dGl2YXRlX2FsdHAybShkLCBpLCBtZW1hY2Nlc3NbaHZtbWVtX2RlZmF1bHRfYWNjZXNzXSk7DQo+
IA0KPiBBcmVuJ3QgeW91IG9wZW4tY29kaW5nIHhlbm1lbV9hY2Nlc3NfdG9fcDJtX2FjY2Vzcygp
IGhlcmU/IEluDQo+IG5vIGV2ZW50IHNob3VsZCB0aGVyZSBiZSB0d28gaW5zdGFuY2VzIG9mIHRo
ZSBzYW1lIHN0YXRpYyBhcnJheS4NCg0KSSBkaWQgdGhpcyBiZWNhdXNlIHhlbm1lbV9hY2Nlc3Nf
dG9fcDJtX2FjY2VzcygpIGlzIGRlZmluZWQgc3RhdGljIGluIA0KeDg2L21tL21lbV9hY2Nlc3Mu
Yy4gSWYgaXQncyBvayB0byBoYXZlIGl0IGRlZmluZWQgaW4gbWVtX2FjY2Vzcy5oIHRoZW4gDQpJ
IGNhbiBnbyB3aXRoIHRoYXQgYW5kIGRyb3AgdGhpcyBwYXJ0IG9mIHRoZSBjb2RlLg0KDQpBbGV4
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
