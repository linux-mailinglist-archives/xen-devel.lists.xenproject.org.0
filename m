Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A53731277C6
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2019 10:12:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iiEHi-0007yO-Eb; Fri, 20 Dec 2019 09:09:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=KLOa=2K=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1iiEHg-0007yJ-N5
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2019 09:09:20 +0000
X-Inumbo-ID: 675e1e0a-2308-11ea-a914-bc764e2007e4
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe05::704])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 675e1e0a-2308-11ea-a914-bc764e2007e4;
 Fri, 20 Dec 2019 09:09:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UwDKRcYptpQkMFnqWH5IvY0o76ltdCFDDihnyIpzeQ7AjcQVQiicQ5a3VuBQ7cBij1jT4P4VOLkaQd+wHvU0bqwUts/fo3QdSSDC+NdRmYa+Y/4nYkGMIdEecTusgi7P67kYLyK8WDzDDedBK2dgIaDfMUbzQVnE2Z+TTIcMz10N/QUeXFUMJIjfdCZs1vaCzcpqeH9VxdiKiR8GYunkqG4D8Sefj9LeB6/elvd02AlTx572o1rMCLRT4J5f/ReMAvj7+NPbYVVR7LHJGlaiTfxqokolxyT1+OOFAgPVkhGDRG6q2dX/IbOO0zhJPUXh+oUHcw/Mu1t85+oN3Ev3tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X3/XmNoph0au7WlfGN8UItE6S2pMPARsSsrkW6sVfNQ=;
 b=UZJW63VzOU+nHqLJz+K1T4QekHUC597UE2Manl+4fnree7cZ5sL1zpB+RO3jD5PBKvUrRBPejg6sULPWV72r9ry6l2/cXjNw70wHaqQZRne9G6rLHlSFcBG8lvBfHujUg4tK1w33OL4sJY32j18wwzpXpdtOYm8P7kkfjulquysKUFsYIHkoBU+DuWPtPqP9Ve4ewc+5dyjJmJebb4DHvV2KrfAMYQWNt50feM2tpvhMabRreNgFrKPmUVv4jZlF+nFflJ1N1lH7O6iTh8PN/KDPUHSczhtONbcLydIJJsmOpbLelvlYIBnCE6RFNDxQIovIzMCUlp1CQLZ/Y3qOtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X3/XmNoph0au7WlfGN8UItE6S2pMPARsSsrkW6sVfNQ=;
 b=q87jB59BC7vdU/UyWmb4w/vnH+MfEgULvjregRu/CU2skZbMayYsCq1RxuSnp2QJzxrLsyZG4h/czXTjy+vb264s5WSXNwLtPg1tGZgmS5SzMq2hwlIpK1RJ+bIJXLHBN9wKPMPI08q8L9ArOi0c5CaPbFT5vZpEJqgEkKoP2j4=
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com (10.255.30.78) by
 AM0PR02MB4963.eurprd02.prod.outlook.com (20.178.22.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.14; Fri, 20 Dec 2019 09:09:17 +0000
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d]) by AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d%4]) with mapi id 15.20.2559.015; Fri, 20 Dec 2019
 09:09:17 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH V5 1/4] x86/mm: Add array_index_nospec to guest provided
 index values
Thread-Index: AQHVtlCv9fBx8h7blUeN6Fd8ih9YqafBRckAgAF344A=
Date: Fri, 20 Dec 2019 09:09:17 +0000
Message-ID: <9f1b936d-8a3c-8ef3-a184-c0846b01d250@bitdefender.com>
References: <20191219094236.22002-1-aisaila@bitdefender.com>
 <b37fe84e-fe6f-9db4-ac5d-3dfbf7811470@suse.com>
In-Reply-To: <b37fe84e-fe6f-9db4-ac5d-3dfbf7811470@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR01CA0002.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:69::15) To AM0PR02MB5553.eurprd02.prod.outlook.com
 (2603:10a6:208:160::14)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 56d4b044-d23e-4267-1c37-08d7852c4a9b
x-ms-traffictypediagnostic: AM0PR02MB4963:|AM0PR02MB4963:|AM0PR02MB4963:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR02MB4963A8914C322AFA841C8364AB2D0@AM0PR02MB4963.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 025796F161
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(396003)(366004)(136003)(376002)(346002)(199004)(189003)(186003)(71200400001)(316002)(6486002)(53546011)(66946007)(81156014)(66476007)(66556008)(31686004)(8936002)(6506007)(81166006)(26005)(64756008)(66446008)(52116002)(5660300002)(2616005)(6916009)(8676002)(54906003)(6512007)(36756003)(86362001)(2906002)(478600001)(31696002)(4326008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB4963;
 H:AM0PR02MB5553.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AVX7jKPVC0VWjDuDuPFpm3p4bki68u177QqQrIwYuIWkKZOE6/jDDGEGx9MusNEZR93oQsHPjSOfJnU18pniPORCrywe8dv7XXuvtWTc0nv3fJSMRjVSs0x2trOgazxakk9N9WcevSUYJb1ajRnuyajsrQXPgohd1mia//LKYBo3ps72KKk1d8M/gym6ZFPtD0hP/ZAykhF+Vv3YhIIPxiwYLAyKKpYrjCZpTvWyM/Hm3kKbKIz6NLVwgdZk1XlQgj0S5P3ECiCiudqK42innSTVXp1C3HVOBh3S6Ji1XNVU0j4LKkzVcBKQlf6zgu1gGV0yh7AXaEH89Gd448U2ca9L6r+y5FOdauGZwmEI6S9HdIimA5pDZfXI5YMGavv5S/3tCLLV+j+W6qm8KFMals5QiIsz/JL8Y1I1xByoSRvy29UOFBd/t11WNhPFYq5o
Content-ID: <96EF7D7E8E9E7245BBAE70D48BFBBDC5@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d4b044-d23e-4267-1c37-08d7852c4a9b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2019 09:09:17.4168 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZIL4e6ikCg/7cfP1L/9HhsVAkIRiNbeChEbp2nWrPEJYTvr+lLVmcyH7Rri3D2TN0e3NmzJZsiZ80vs2L61OxebHgGzs+qTLDVgXUTkZOks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB4963
Subject: Re: [Xen-devel] [PATCH V5 1/4] x86/mm: Add array_index_nospec to
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

DQoNCk9uIDE5LjEyLjIwMTkgMTI6NDMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAxOS4xMi4y
MDE5IDEwOjQyLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+IFRoaXMgcGF0Y2gg
YWltcyB0byBzYW5pdGl6ZSBpbmRleGVzLCBwb3RlbnRpYWxseSBndWVzdCBwcm92aWRlZA0KPj4g
dmFsdWVzLCBmb3IgYWx0cDJtX2VwdHBbXSBhbmQgYWx0cDJtX3AybVtdIGFycmF5cy4NCj4+DQo+
PiBSZXF1ZXN0ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4+IFNpZ25l
ZC1vZmYtYnk6IEFsZXhhbmRydSBJc2FpbGEgPGFpc2FpbGFAYml0ZGVmZW5kZXIuY29tPg0KPj4g
LS0tDQo+PiBDQzogUmF6dmFuIENvam9jYXJ1IDxyY29qb2NhcnVAYml0ZGVmZW5kZXIuY29tPg0K
Pj4gQ0M6IFRhbWFzIEsgTGVuZ3llbCA8dGFtYXNAdGtsZW5neWVsLmNvbT4NCj4+IENDOiBQZXRy
ZSBQaXJjYWxhYnUgPHBwaXJjYWxhYnVAYml0ZGVmZW5kZXIuY29tPg0KPj4gQ0M6IEdlb3JnZSBE
dW5sYXAgPGdlb3JnZS5kdW5sYXBAZXUuY2l0cml4LmNvbT4NCj4+IENDOiBKYW4gQmV1bGljaCA8
amJldWxpY2hAc3VzZS5jb20+DQo+PiBDQzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4NCj4+IENDOiBXZWkgTGl1IDx3bEB4ZW4ub3JnPg0KPj4gQ0M6ICJSb2dlciBQ
YXUgTW9ubsOpIiA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+PiBDQzogSnVuIE5ha2FqaW1hIDxq
dW4ubmFrYWppbWFAaW50ZWwuY29tPg0KPj4gQ0M6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50
ZWwuY29tPg0KPj4gLS0tDQo+PiBDaGFuZ2VzIHNpbmNlIFY0Og0KPj4gCS0gQ2hhbmdlIGJvdW5k
cyBjaGVjayBmcm9tIE1BWF9FUFRQIHRvIE1BWF9BTFRQMk0NCj4+IAktIE1vdmUgYXJyYXlfaW5k
ZXhfbm9zcGVjKCkgY2xvc2VyIHRvIHRoZSBib3VuZHMgY2hlY2suDQo+PiAtLS0NCj4+ICAgeGVu
L2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYyB8IDE1ICsrKysrKysrKy0tLS0tLQ0KPj4gICB4ZW4v
YXJjaC94ODYvbW0vcDJtLmMgICAgICAgIHwgMjAgKysrKysrKysrKysrKystLS0tLS0NCj4+ICAg
MiBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkNCj4+DQo+
PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL21lbV9hY2Nlc3MuYyBiL3hlbi9hcmNoL3g4
Ni9tbS9tZW1fYWNjZXNzLmMNCj4+IGluZGV4IDMyMGI5ZmU2MjEuLjMzZTM3OWRiOGYgMTAwNjQ0
DQo+PiAtLS0gYS94ZW4vYXJjaC94ODYvbW0vbWVtX2FjY2Vzcy5jDQo+PiArKysgYi94ZW4vYXJj
aC94ODYvbW0vbWVtX2FjY2Vzcy5jDQo+PiBAQCAtMzY3LDEwICszNjcsMTEgQEAgbG9uZyBwMm1f
c2V0X21lbV9hY2Nlc3Moc3RydWN0IGRvbWFpbiAqZCwgZ2ZuX3QgZ2ZuLCB1aW50MzJfdCBuciwN
Cj4+ICAgICAgIGlmICggYWx0cDJtX2lkeCApDQo+PiAgICAgICB7DQo+PiAgICAgICAgICAgaWYg
KCBhbHRwMm1faWR4ID49IE1BWF9BTFRQMk0gfHwNCg0KT2ssIHNvIGhhdmUgaWYgKCBhbHRwMm1f
aWR4ID49ICBtaW4oQVJSQVlfU0laRShkLT5hcmNoLmFsdHAybV9lcHRwKSwgDQpNQVhfRVBUUCkg
fHwNCmhlcmUgYW5kIHRoZW4uLi4NCg0KPj4gLSAgICAgICAgICAgICBkLT5hcmNoLmFsdHAybV9l
cHRwW2FsdHAybV9pZHhdID09IG1mbl94KElOVkFMSURfTUZOKSApDQo+PiArICAgICAgICAgICAg
IGQtPmFyY2guYWx0cDJtX2VwdHBbYXJyYXlfaW5kZXhfbm9zcGVjKGFsdHAybV9pZHgsIE1BWF9B
TFRQMk0pXSA9PQ0KDQpoYXZlIE1BWF9FUFRQIGhlcmUgYW5kIC4uLg0KDQo+IA0KPiBBcyBpbXBs
aWVkIGJ5IGEgcmVwbHkgdG8gdjQsIHRoaXMgaXMgc3RpbGwgbGF0ZW50bHkgYnVnZ3k6IFRoZXJl
J3MNCj4gbm8gZ3VhcmFudGVlIGFueW9uZSB3aWxsIG5vdGljZSB0aGUgaXNzdWUgaGVyZSB3aGVu
IGJ1bXBpbmcNCj4gTUFYX0FMVFAyTSBwYXN0IE1BWF9FUFRQLiBUaGUgb25seSBmdXR1cmUgcHJv
b2YgdGhpbmcgdG8gZG8gaGVyZQ0KPiBpcywgYXMgc3VnZ2VzdGVkLCB1c2luZyBzb21lIGZvcm0g
b2YgbWluKE1BWF9BTFRQMk0sIE1BWF9FUFRQKSBpbg0KPiB0aGUgYWN0dWFsIGJvdW5kcyBjaGVj
ay4gVGhlbiBlYWNoIGFycmF5IGFjY2VzcyBpdHNlbGYgY2FuIGJlIG1hZGUNCj4gdXNlIHRoZSBj
b3JyZWN0IGJvdW5kLiBJbiBmYWN0IHlvdSdkIHByb2JhYmx5IGhhdmUgbm90aWNlZCB0aGlzIGlm
DQo+IHlvdSBoYWQgbWFkZSB1c2Ugb2YgYXJyYXlfYWNjZXNzX25vc3BlYygpIHdoZXJlIHBvc3Np
YmxlICh3aGljaA0KPiBhbHNvIHdvdWxkIGhlbHAgcmVhZGFiaWxpdHkpIC0gYXBwYXJlbnRseSBu
b3QgaGVyZSwgYnV0IC4uLiA+DQo+PiArICAgICAgICAgICAgIG1mbl94KElOVkFMSURfTUZOKSAp
DQo+PiAgICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPj4gICANCj4+IC0gICAgICAgIGFw
Mm0gPSBkLT5hcmNoLmFsdHAybV9wMm1bYWx0cDJtX2lkeF07DQo+PiArICAgICAgICBhcDJtID0g
ZC0+YXJjaC5hbHRwMm1fcDJtW2FycmF5X2luZGV4X25vc3BlYyhhbHRwMm1faWR4LCBNQVhfQUxU
UDJNKV07DQoNCk1BWF9BTFRQMk0gaGVyZSA/DQoNCg0KQWxleA0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
