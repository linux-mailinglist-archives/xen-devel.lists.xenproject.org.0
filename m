Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 719F6129F7C
	for <lists+xen-devel@lfdr.de>; Tue, 24 Dec 2019 09:52:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ijfrp-00005S-UR; Tue, 24 Dec 2019 08:48:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3nNa=2O=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1ijfro-00005N-2H
 for xen-devel@lists.xenproject.org; Tue, 24 Dec 2019 08:48:36 +0000
X-Inumbo-ID: 2b38c7b6-262a-11ea-88e7-bc764e2007e4
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0c::703])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2b38c7b6-262a-11ea-88e7-bc764e2007e4;
 Tue, 24 Dec 2019 08:48:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dCHO4beVg4U8bo5aYXe+fUBFC3m/6t5QmiD2FfhivZMa3f6VgbTcUCsGxL5VGsu6Lo4MeHrbA1d7AVAxmRGl5/X5XYRHhCTeDnmGl2mTb/aB77o2o88m/wglsVKFyBf6lKx/H7QA3/PNTlMBkpqSq9jAlSVwMv/Ix/L3nZBGHXRq3nxWN08i16kBsacQaCC1wGoCovHDnV3I1jqZEjzcsIZIlZp3cMKWnrwRQhgAjMYvjuTkTkI5zp2D4uf3wryTOdjJYmF+q068q1m3wZbCJyOCw2Yykb+Sdt2qD6UZZbZ9N2Ud6MSc87zAwVs7tPOI0dXkuWpRhE29HVoGG315DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1M66exX9UGCz+p0FSp+eW8UJUbwC/P1yCIKnin4gEDY=;
 b=UnEc8mtXSZF4QqrvNBuLIkK3gZinVC7DOfNf4NfXEerfATz4suCHr+73jsRu3YITG0ZvgyFwHDFrKbBQuXcbDoayq6VtPShVUGLjqJlh8zogB0oDaw0IJfoGrf2i2ToSK3Uih2T5TxYakk3Ywc/Su2QwstL8ozysi27R/7EIYPBueJEo+7+rrluNSAeeC43Ve8dotc9l6czBYzkAL5/vx12ekQJDeZkxBvsxVdnllTgI4iHAM+pDr6Ncy+kY7+A+/cHyl919/aue2E5mrkmsVERnkoqGfY8j7BBAfjdRBqWa7vVbxA7gDSaJXVyDLvQHar/Iyq8E+2B2ComPgh1AbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1M66exX9UGCz+p0FSp+eW8UJUbwC/P1yCIKnin4gEDY=;
 b=LUpITmFtTvE/4i6YkrcvfVyjQuFuDPw8xL8R0R1QZoHwSpZs3IN4L/KPKTz/Zf+Cs11j+lW+XStOdXQBOh2PgWVfIuSC6/iqwJIBuKjA/hCCC9RGfqlxXd7rl7LCtutjmrvKAWz2AE4bCPl/QbTOdVTYYOqMAxW8oAi1Os+Ns4Y=
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com (10.255.30.78) by
 AM0PR02MB3700.eurprd02.prod.outlook.com (52.134.85.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2559.17; Tue, 24 Dec 2019 08:48:33 +0000
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d]) by AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d%4]) with mapi id 15.20.2559.017; Tue, 24 Dec 2019
 08:48:33 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: George Dunlap <george.dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH V6 2/4] x86/altp2m: Add hypercall to set a range of sve
 bits
Thread-Index: AQHVuZnoQDql7d7Su0+P124sSAtk36fI9bKAgAAE8IA=
Date: Tue, 24 Dec 2019 08:48:33 +0000
Message-ID: <8c6b9f51-ca33-31cd-2991-9112bd48ff87@bitdefender.com>
References: <20191223140409.32449-1-aisaila@bitdefender.com>
 <20191223140409.32449-2-aisaila@bitdefender.com>
 <f6cfead2-1c24-9ddf-e323-ceae43756940@citrix.com>
In-Reply-To: <f6cfead2-1c24-9ddf-e323-ceae43756940@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: ZR0P278CA0021.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::8) To AM0PR02MB5553.eurprd02.prod.outlook.com
 (2603:10a6:208:160::14)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5617beb1-07d9-4fda-f9bc-08d7884e0eac
x-ms-traffictypediagnostic: AM0PR02MB3700:|AM0PR02MB3700:|AM0PR02MB3700:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR02MB3700203A647B6B1B7EB637CCAB290@AM0PR02MB3700.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0261CCEEDF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(376002)(366004)(396003)(346002)(136003)(199004)(189003)(6506007)(2906002)(6486002)(110136005)(31686004)(186003)(316002)(54906003)(2616005)(26005)(5660300002)(53546011)(52116002)(7416002)(4326008)(107886003)(8936002)(478600001)(66476007)(81156014)(81166006)(31696002)(36756003)(66446008)(66556008)(71200400001)(8676002)(64756008)(86362001)(6512007)(66946007);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB3700;
 H:AM0PR02MB5553.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SCaxFd65B6aBm1pEMq+42qYKj3cUJLpIPvMDkPbpylWtMOJQ3i/aAXuouZfWHzHAcKldgeJfehpMAw70WaezZDGxHqVMIUjnBmIwWSTgqEIxvZMnFBVOagbtk5hjcn+nNA6VIkZAPZduazSqmyfFJD83qDxOkX/vYXYFLRokc80OKlUVKFjUxuZbqLAR9J4tMBxP9UH/D/3oPOHvPbw6R1GjAUEUr05liuN2ALjbo+E4XNB0CHulqWideygw/XUtQH4Q5EZfhfd6JZz1LBG2/EXMmgA5mbXfq3ae1DYJ31ybQ6Uq8ANgoFsWfLizzUaODCp89odjZg9iwsJMRoPmzGm2Otb14Rt8w35PGiq3OWisHn65LSQ6ANmiuo9qS6YTs+2IyqgKRfemMURtml5ADv1LWLFmuTPZ1y/d6d0KkZqXBVlImVVci0iqQp5GwMT5
Content-ID: <D0F0A0A321001C488F7DF40C504C721D@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5617beb1-07d9-4fda-f9bc-08d7884e0eac
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Dec 2019 08:48:33.3287 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tjfmShcgj4OuNegRnD4f4Xmaq2DO/M76NMg2WN1add/LT+NSwymSfIitqh2iCEtSTDRXl6XnoL/khPKxJiHPBiXH2CQ+6s+5jKhuYWCAhGw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB3700
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

DQoNCk9uIDI0LjEyLjIwMTkgMTA6MzAsIEdlb3JnZSBEdW5sYXAgd3JvdGU6DQo+IE9uIDEyLzIz
LzE5IDI6MDQgUE0sIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOg0KPj4gQnkgZGVmYXVs
dCB0aGUgc3ZlIGJpdHMgYXJlIG5vdCBzZXQuDQo+PiBUaGlzIHBhdGNoIGFkZHMgYSBuZXcgaHlw
ZXJjYWxsLCB4Y19hbHRwMm1fc2V0X3N1cHJlc3NfdmVfbXVsdGkoKSwNCj4+IHRvIHNldCBhIHJh
bmdlIG9mIHN2ZSBiaXRzLg0KPj4gVGhlIGNvcmUgZnVuY3Rpb24sIHAybV9zZXRfc3VwcHJlc3Nf
dmVfbXVsdGkoKSwgZG9lcyBub3QgYnJha2UgaW4gY2FzZQ0KPiANCj4gKmJyZWFrDQoNClNvcnJ5
IGZvciB0aGUgdHlwby4NCg0KPiANCj4+IG9mIGEgZXJyb3IgYW5kIGl0IGlzIGRvaW5nIGEgYmVz
dCBlZmZvcnQgZm9yIHNldHRpbmcgdGhlIGJpdHMgaW4gdGhlDQo+PiBnaXZlbiByYW5nZS4gQSBj
aGVjayBmb3IgY29udGludWF0aW9uIGlzIG1hZGUgaW4gb3JkZXIgdG8gaGF2ZQ0KPj4gcHJlZW1w
dGlvbiBvbiBiaWcgcmFuZ2VzLg0KPiANCj4gV2VpcmQgRW5nbGlzaCBxdWlyazogdGhpcyBzaG91
bGQgYmUgImxhcmdlIi4gICgiQmlnIiBhbmQgImxhcmdlIiBhcmUNCj4gYm90aCBhZGplY3RpdmVz
LCBhbmQgInJhbmdlcyIgaXMgYSBub3VuLCBzbyB0aGVvcmV0aWNhbGx5IGl0IHNob3VsZCBiZQ0K
PiBPSzsgYnV0IGlmIHlvdSBhc2sgYWxtb3N0IGFueSBuYXRpdmUgRW5nbGlzaCBzcGVha2VyIHRo
ZXknbGwgc2F5IHRoYXQNCj4gImJpZyIgc291bmRzIHdyb25nIGluIHRoaXMgY2FzZS4gIE5vIHJl
YWwgaWRlYSB3aHkuKQ0KPiANCj4gQm90aCBvZiB0aGVzZSBjb3VsZCBiZSBmaXhlZCBvbiBjaGVj
ay1pbi4NCj4gDQo+PiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L21tL3AybS5jIGIveGVuL2Fy
Y2gveDg2L21tL3AybS5jDQo+PiBpbmRleCA0ZmM5MTlhOWM1Li5kZTgzMmRjYzZkIDEwMDY0NA0K
Pj4gLS0tIGEveGVuL2FyY2gveDg2L21tL3AybS5jDQo+PiArKysgYi94ZW4vYXJjaC94ODYvbW0v
cDJtLmMNCj4+IEBAIC0zMDcwLDYgKzMwNzAsNzAgQEAgb3V0Og0KPj4gICAgICAgcmV0dXJuIHJj
Ow0KPj4gICB9DQo+PiAgIA0KPj4gKy8qDQo+PiArICogU2V0L2NsZWFyIHRoZSAjVkUgc3VwcHJl
c3MgYml0IGZvciBtdWx0aXBsZSBwYWdlcy4gIE9ubHkgYXZhaWxhYmxlIG9uIFZNWC4NCj4+ICsg
Ki8NCj4+ICtpbnQgcDJtX3NldF9zdXBwcmVzc192ZV9tdWx0aShzdHJ1Y3QgZG9tYWluICpkLA0K
Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB4ZW5faHZtX2FsdHAybV9z
dXBwcmVzc192ZV9tdWx0aSAqc3ZlKQ0KPj4gK3sNCj4+ICsgICAgc3RydWN0IHAybV9kb21haW4g
Kmhvc3RfcDJtID0gcDJtX2dldF9ob3N0cDJtKGQpOw0KPj4gKyAgICBzdHJ1Y3QgcDJtX2RvbWFp
biAqYXAybSA9IE5VTEw7DQo+PiArICAgIHN0cnVjdCBwMm1fZG9tYWluICpwMm0gPSBob3N0X3Ay
bTsNCj4+ICsgICAgdWludDY0X3Qgc3RhcnQgPSBzdmUtPmZpcnN0X2dmbjsNCj4+ICsgICAgaW50
IHJjID0gMDsNCj4+ICsNCj4+ICsgICAgaWYgKCBzdmUtPnZpZXcgPiAwICkNCj4+ICsgICAgew0K
Pj4gKyAgICAgICAgaWYgKCBzdmUtPnZpZXcgPj0gTUFYX0FMVFAyTSB8fA0KPj4gKyAgICAgICAg
ICAgICBkLT5hcmNoLmFsdHAybV9lcHRwW2FycmF5X2luZGV4X25vc3BlYyhzdmUtPnZpZXcsIE1B
WF9BTFRQMk0pXSA9PQ0KPj4gKyAgICAgICAgICAgICBtZm5feChJTlZBTElEX01GTikgKQ0KPj4g
KyAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPj4gKw0KPj4gKyAgICAgICAgcDJtID0gYXAy
bSA9IGQtPmFyY2guYWx0cDJtX3AybVthcnJheV9pbmRleF9ub3NwZWMoc3ZlLT52aWV3LA0KPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgTUFYX0FMVFAyTSldOw0KPj4gKyAgICB9DQo+PiArDQo+PiArICAgIHAybV9sb2NrKGhvc3Rf
cDJtKTsNCj4+ICsNCj4+ICsgICAgaWYgKCBhcDJtICkNCj4+ICsgICAgICAgIHAybV9sb2NrKGFw
Mm0pOw0KPj4gKw0KPj4gKyAgICB3aGlsZSAoIHN2ZS0+bGFzdF9nZm4gPj0gc3RhcnQgKQ0KPj4g
KyAgICB7DQo+PiArICAgICAgICBwMm1fYWNjZXNzX3QgYTsNCj4+ICsgICAgICAgIHAybV90eXBl
X3QgdDsNCj4+ICsgICAgICAgIG1mbl90IG1mbjsNCj4+ICsgICAgICAgIGludCBlcnIgPSAwOw0K
Pj4gKw0KPj4gKyAgICAgICAgaWYgKCBhbHRwMm1fZ2V0X2VmZmVjdGl2ZV9lbnRyeShwMm0sIF9n
Zm4oc3RhcnQpLCAmbWZuLCAmdCwgJmEsIEFQMk1HRVRfcXVlcnkpICkNCj4+ICsgICAgICAgICAg
ICBhID0gcDJtLT5kZWZhdWx0X2FjY2VzczsNCj4gDQo+IFNvIGluIHRoZSBzaW5nbGUtZW50cnkg
dmVyc2lvbiwgaWYgYWx0cDJtX2dldF9lZmZlY3RpdmVfZW50cnkoKSByZXR1cm5zDQo+IGFuIGVy
cm9yLCB5b3UgcGFzcyB0aGF0IGVycm9yIHVwIHRoZSBzdGFjazsgYnV0IGluIHRoZSBtdWx0aXBs
ZS1lbnRyeQ0KPiB2ZXJzaW9uLCB5b3UgaWdub3JlIHRoZSBlcnJvciBhbmQgc2ltcGx5IHNldCB0
aGUgYWNjZXNzIHRvDQo+IGRlZmF1bHRfYWNjZXNzPyAgSSBkb24ndCB0aGluayB0aGF0IGNhbiBi
ZSByaWdodC4gIElmIGl0IGlzIHJpZ2h0LCB0aGVuDQo+IGl0IGRlZmluaXRlbHkgbmVlZHMgYSBj
b21tZW50Lg0KPiANCg0KVGhlIGlkZWEgYmVoaW5kIHRoaXMgd2FzIHRvIGhhdmUgYSBiZXN0IGVm
Zm9ydCB0cnkgYW5kIHNpZ25hbCB0aGUgZmlyc3QgDQplcnJvci4gSWYgdGhlIGdldF9lbnRyeSBm
YWlscyB0aGVuIHRoZSBiZXN0IHdheSB0byBnbyBpcyB3aXRoIA0KZGVmYXVsdF9hY2Nlc3MgYnV0
IHRoaXMgaXMgb3BlbiBmb3IgZGViYXRlLg0KDQpBbm90aGVyIHdheSB0byBzb2x2ZSB0aGlzIGlz
IHRvIHVwZGF0ZSB0aGUgZmlyc3RfZXJyb3JfZ2ZuL2ZpcnN0X2Vycm9yIA0KYW5kIHRoZW4gY29u
dGludWUuIEkgdGhpbmsgdGhpcyBjYSBiZSB1c2VkIHRvIG1ha2UgcDJtX3NldF9zdXBwcmVzc192
ZSgpIA0KY2FsbCBwMm1fc2V0X3N1cHByZXNzX3ZlX211bHRpLg0KDQo+IFRoaXMgcG9pbnRzIG91
dCBhbm90aGVyIGlzc3VlOiBpbXBsZW1lbnRpbmcgdGhpcyBmdW5jdGlvbmFsaXR5IHR3aWNlDQo+
IHJpc2tzIGhhdmluZyB0aGlzIHNvcnQgb2YgZHJpZnQgYmV0d2VlbiB0aGUgc2luZ2xlLWVudHJ5
IHZlcnNpb24gYW5kIHRoZQ0KPiBtdWx0aXBsZS1lbnRyeSB2ZXJzaW9uLiAgV291bGQgaXQgbWFr
ZSBzZW5zZSBpbnN0ZWFkIHRvIGltcGxlbWVudCB0aGUNCj4gc2luZ2xlLWVudHJ5IHZlcnNpb24g
aHlwZXJjYWxsIHVzaW5nIHAybV9zZXRfc3VwcHJlc3NfdmVfbXVsdGk/DQo+IA0KDQpJbiB0aGUg
c2luZ2xlIHZlcnNpb24gdGhlcmUgaXMgbm8gYmVzdC1lZmZvcnQgaWRlYSBiZWNhdXNlIHRoZSB1
c2VyIGNhbiANCm1ha2UgdXNlIG9mIGV2ZXJ5IHNpbmdsZSBlcnJvci4NCg0KQWxleA0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
