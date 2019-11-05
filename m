Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F62F01C0
	for <lists+xen-devel@lfdr.de>; Tue,  5 Nov 2019 16:43:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iS0x7-0000TF-Ex; Tue, 05 Nov 2019 15:41:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=61et=Y5=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1iS0x5-0000T9-Ut
 for xen-devel@lists.xenproject.org; Tue, 05 Nov 2019 15:41:03 +0000
X-Inumbo-ID: aaaaec19-ffe2-11e9-a19b-12813bfff9fa
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.13.113]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id aaaaec19-ffe2-11e9-a19b-12813bfff9fa;
 Tue, 05 Nov 2019 15:41:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mtH15xxwqaUgTjUgpKDtvDsVlj7evrUQ/+WeqmFOfPqgKVGaT18k4GF4PdKLC+vS08eEZo4ADJsL481ywB0bw/Kg6Ftkih4xKtvUGSSB005SbvKY6mgzCSDmg4OrK8Y5fUTBkN9AeOcd5mJlp8skjpHEAwcURH/3wGof0JAZTZ3HGkWVdV7JVzLhEtFw2mosegVT7d1SpLwvJm3PSb1vTeHYe90ORIdXi43INhE1UAOQfGe8fWcX1sstnw3jt/mR6IGnsZvSlbHO60tjVzz7mkkc8OSuAm59p9He7Q8fbUHOtb42vbf53ysAZMAN0G+QbbC4Hqnt7ypNmjarKStaqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Ipnvk6eo7wJDE6C8vXsPBewCDWtearPjoWScaUMwtQ=;
 b=jWsEDJEeUkGajXpTzyFAsgBDGSrpWHDSTSGoaQUdmnU64TFabdqoqJi+2sc63ycucYtA0Qr4LTf3SIWxe7JkCtq7Nz9vMP8rvyf/rk3gqtaYhTxYo8aukMa7gbCekk/4dj037AfklOmzizxHFl27yGf8DyQ2i901JHnu581uBbjlUbbumZIPFDUh/ejMTZxGzX/ZvcokQDQezUhZs35wH2gJf+0gtAC4uKXIRxBzIwDMIgxbuJyrc94kV9DVhTAgjXWRf8lPLJB6aFM1bef1DUFgIwxq7gFV8vMZ1Aajds19J3GJEbKftYZLrEFgDBzFMDk5Rs0+tFI5rjHkkuhiYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Ipnvk6eo7wJDE6C8vXsPBewCDWtearPjoWScaUMwtQ=;
 b=OEzbW7qqgsiD2rTHoy6AMQVc5LmnYzJt5Wm46/LegTqPxBn2d9bidG80Pmh1Qk2r/ykIyiWFyC45ZO37kXsIw4zfg8cTUrH1Cl+CKhm5yI30WjsDEy+NDkRz/YtExidq3utyFFqyeO1s1EahnanMiLev2VlPQisUAkfsoOJAsI0=
Received: from AM6PR0202MB3413.eurprd02.prod.outlook.com (52.133.30.28) by
 AM6PR0202MB3445.eurprd02.prod.outlook.com (52.133.8.33) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Tue, 5 Nov 2019 15:40:48 +0000
Received: from AM6PR0202MB3413.eurprd02.prod.outlook.com
 ([fe80::a569:5be5:9861:577d]) by AM6PR0202MB3413.eurprd02.prod.outlook.com
 ([fe80::a569:5be5:9861:577d%5]) with mapi id 15.20.2408.024; Tue, 5 Nov 2019
 15:40:48 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: George Dunlap <george.dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH V1 1/2] x86/altp2m: Add hypercall to set a range of sve
 bits
Thread-Index: AQHVk9ao9wGZEUCF0UWADMZln2TA+qd8tdEAgAABSQA=
Date: Tue, 5 Nov 2019 15:40:48 +0000
Message-ID: <72bddc05-1b61-67d0-2680-ee567e4d8760@bitdefender.com>
References: <20191105124332.4380-1-aisaila@bitdefender.com>
 <434f61bf-3d19-a93e-a5b5-90be04b2de1e@citrix.com>
In-Reply-To: <434f61bf-3d19-a93e-a5b5-90be04b2de1e@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR01CA0032.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:69::45) To AM6PR0202MB3413.eurprd02.prod.outlook.com
 (2603:10a6:209:1c::28)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9a6f1c7d-426d-4e2a-2f35-08d76206879b
x-ms-traffictypediagnostic: AM6PR0202MB3445:|AM6PR0202MB3445:|AM6PR0202MB3445:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR0202MB34458480536DE817FE1D97BDAB7E0@AM6PR0202MB3445.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0212BDE3BE
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(136003)(396003)(376002)(366004)(39860400002)(189003)(199004)(31686004)(102836004)(476003)(6506007)(76176011)(99286004)(52116002)(2616005)(36756003)(186003)(81156014)(8676002)(6246003)(6116002)(8936002)(3846002)(446003)(66556008)(66476007)(256004)(11346002)(26005)(386003)(2501003)(6512007)(71190400001)(71200400001)(14444005)(4326008)(107886003)(229853002)(25786009)(7736002)(7416002)(2906002)(5660300002)(6486002)(14454004)(486006)(6436002)(66946007)(66446008)(64756008)(110136005)(54906003)(31696002)(86362001)(81166006)(316002)(305945005)(66066001)(478600001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR0202MB3445;
 H:AM6PR0202MB3413.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: D+EUVTmkJBx25ubCmBPFr6YkIBY2jQ5tB3ZYtyGBZwMtW38Q4KlZ5htCzRhGtdeYw5k2QT+Gkc6JHaYU4jDHdR7SJ9P5aEb0C5NihOgHIx1LMVoCYJCujivuzGK9Lmj5s5EaN86LODDwWbMvgRn73TQtbJlpCqEPgHavjo7sXWjnC7RbOPmuQLoFhV/uaWCjZcZsi0PYTscjCQZGKyeaU6p+NTfo03QOHWUnJJtuaTGA5dYb/kcmDp+W/Xh8v9XFbdFoHubNu+xn8hcXxw1cUEd9d3zM/cWgjsce+CUNZSwTDtU+DKNEA8PwXrUm/DG7bcoVqIfOXlcbXb4FHo+oPRkojWp6CPtN7YeLP9cJ/w0ajmYlEUuctUIeeK7opJxzg5NnzvW8w8pBBj5dECAWwvBrdU5dafvIWQg7/rbB78NsB4uq83Q1yM6Ot+IEQeIM
Content-ID: <441872166A37AB40AB0BE8C64142158F@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a6f1c7d-426d-4e2a-2f35-08d76206879b
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2019 15:40:48.1843 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3d4QZsnULMtlUuU0gIb4Ee8yFd75CMCRvb/yzhQnSOg2M1vuGvAbL5WWOdpbKIwrQTGIKIcdWnwF7bOwOoM+GG6w+6cUyiP9U8FfQff333s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0202MB3445
Subject: Re: [Xen-devel] [PATCH V1 1/2] x86/altp2m: Add hypercall to set a
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
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "julien@xen.org" <julien@xen.org>, Razvan COJOCARU <rcojocaru@bitdefender.com>,
 "wl@xen.org" <wl@xen.org>, "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQo+PiAgIA0KPj4gKy8qDQo+PiArICogU2V0L2NsZWFyIHRoZSAjVkUgc3VwcHJlc3MgYml0IGZv
ciBtdWx0aXBsZSBwYWdlcy4gIE9ubHkgYXZhaWxhYmxlIG9uIFZNWC4NCj4+ICsgKi8NCj4+ICts
b25nIHAybV9zZXRfc3VwcHJlc3NfdmVfbXVsdGkoc3RydWN0IGRvbWFpbiAqZCwgdWludDMyX3Qg
c3RhcnQsIHVpbnQzMl90IG5yLA0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBi
b29sIHN1cHByZXNzX3ZlLCB1bnNpZ25lZCBpbnQgYWx0cDJtX2lkeCkNCj4+ICt7DQo+PiArICAg
IHN0cnVjdCBwMm1fZG9tYWluICpob3N0X3AybSA9IHAybV9nZXRfaG9zdHAybShkKTsNCj4+ICsg
ICAgc3RydWN0IHAybV9kb21haW4gKmFwMm0gPSBOVUxMOw0KPj4gKyAgICBzdHJ1Y3QgcDJtX2Rv
bWFpbiAqcDJtOw0KPj4gKyAgICBsb25nIHJjID0gMDsNCj4+ICsNCj4+ICsgICAgaWYgKCBhbHRw
Mm1faWR4ID4gMCApDQo+PiArICAgIHsNCj4+ICsgICAgICAgIGlmICggYWx0cDJtX2lkeCA+PSBN
QVhfQUxUUDJNIHx8DQo+PiArICAgICAgICAgICAgIGQtPmFyY2guYWx0cDJtX2VwdHBbYWx0cDJt
X2lkeF0gPT0gbWZuX3goSU5WQUxJRF9NRk4pICkNCj4+ICsgICAgICAgICAgICByZXR1cm4gLUVJ
TlZBTDsNCj4+ICsNCj4+ICsgICAgICAgIHAybSA9IGFwMm0gPSBkLT5hcmNoLmFsdHAybV9wMm1b
YWx0cDJtX2lkeF07DQo+PiArICAgIH0NCj4+ICsgICAgZWxzZQ0KPj4gKyAgICAgICAgcDJtID0g
aG9zdF9wMm07DQo+PiArDQo+PiArICAgIHAybV9sb2NrKGhvc3RfcDJtKTsNCj4+ICsNCj4+ICsg
ICAgaWYgKCBhcDJtICkNCj4+ICsgICAgICAgIHAybV9sb2NrKGFwMm0pOw0KPj4gKw0KPj4gKw0K
Pj4gKyAgICB3aGlsZSAoIHN0YXJ0IDwgbnIgKQ0KPj4gKyAgICB7DQo+PiArICAgICAgICBwMm1f
YWNjZXNzX3QgYTsNCj4+ICsgICAgICAgIHAybV90eXBlX3QgdDsNCj4+ICsgICAgICAgIG1mbl90
IG1mbjsNCj4+ICsNCj4+ICsgICAgICAgIHJjID0gYWx0cDJtX2dldF9lZmZlY3RpdmVfZW50cnko
cDJtLCBfZ2ZuKHN0YXJ0KSwgJm1mbiwgJnQsICZhLCBBUDJNR0VUX3F1ZXJ5KTsNCj4+ICsNCj4+
ICsgICAgICAgIGlmICggcmMgKQ0KPj4gKyAgICAgICAgICAgIGEgPSBwMm0tPmRlZmF1bHRfYWNj
ZXNzOw0KPj4gKw0KPj4gKyAgICAgICAgcmMgPSBwMm0tPnNldF9lbnRyeShwMm0sIF9nZm4oc3Rh
cnQpLCBtZm4sIFBBR0VfT1JERVJfNEssIHQsIGEsIHN1cHByZXNzX3ZlKTsNCj4+ICsNCj4+ICsg
ICAgICAgIC8qIFRyeSBiZXN0IGVmZm9ydCBmb3Igc2V0dGluZyB0aGUgd2hvbGUgcmFuZ2UuICov
DQo+PiArICAgICAgICBpZiAoIHJjICkNCj4+ICsgICAgICAgICAgICBjb250aW51ZTsNCj4+ICsN
Cj4+ICsgICAgICAgIC8qIENoZWNrIGZvciBjb250aW51YXRpb24gaWYgaXQncyBub3QgdGhlIGxh
c3QgaXRlcmF0aW9uLiAqLw0KPj4gKyAgICAgICAgaWYgKCBuciA+ICsrc3RhcnQgJiYgaHlwZXJj
YWxsX3ByZWVtcHRfY2hlY2soKSApDQo+PiArICAgICAgICB7DQo+PiArICAgICAgICAgICAgcmMg
PSBzdGFydDsNCj4+ICsgICAgICAgICAgICBicmVhazsNCj4+ICsgICAgICAgIH0NCj4gDQo+IFdo
YXQncyB0aGUgcG9pbnQgb2YgdGhlICJpZiAoIHJjICkgY29udGludWU7Ij8gIEFsbCBpdCdzIGRv
aW5nIGlzDQo+IHByZXZlbnRpbmcgdGhlIGxvb3AgZnJvbSBiZWluZyBwcmVlbXB0ZWQgYXQgdGhh
dCBwb2ludDsgYnV0IHRoZXJlDQo+IGRvZXNuJ3Qgc2VlbSB0byBiZSBhIGdvb2QgcmVhc29uIGZv
ciB0aGF0LiAgSW4gZmFjdCwgaWYgYW4gYXR0YWNrZXINCj4gY291bGQgZW5naW5lZXIgYSBzaXR1
YXRpb24gd2hlcmUgbGFyZ2Ugc3dhdGhzIGNvdWxkIGZhaWwsIGl0IGNvdWxkIHVzZQ0KPiB0aGlz
IHRvIGxvY2sgdXAgdGhlIGNwdSBmb3IgYW4gdW5yZWFzb25hYmxlIGFtb3VudCBvZiB0aW1lLg0K
DQpZZXMsIHRoYXQgY291bGQgYmUgYW4gaXNzdWUuIEl0IHdpbGwgZ28gaW4gdjINCg0KPiANCg0K
PiBFdmVyeXRoaW5nIGVsc2UgbG9va3MgT0sgdG8gbWUuDQo+IA0KDQpJZiB0aGUgY2hhbmdlcyBy
ZXF1ZXN0ZWQgYnkgVGFtYXMgYXJlIGFsc28gb2sgd2l0aCB5b3UgdGhlbiBJIHdpbGwgaGF2ZSAN
CnRoZW0gYWxsIGdvIGluIHYyLg0KDQpBbGV4DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
