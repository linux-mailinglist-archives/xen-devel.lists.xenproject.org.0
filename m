Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAE216221D
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2020 09:16:36 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3y0S-0000AG-Ne; Tue, 18 Feb 2020 08:13:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zMfY=4G=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1j3y0R-0000AB-N0
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2020 08:13:23 +0000
X-Inumbo-ID: 873b6ac8-5226-11ea-bc8e-bc764e2007e4
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe06::70b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 873b6ac8-5226-11ea-bc8e-bc764e2007e4;
 Tue, 18 Feb 2020 08:13:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b8NziWByMoNTiPkrZGU3t4fun8kBisopOE7PVo4X1Z2CgoyfwiyzjINSPyoqAAKU2utDRWVE32kS8J/Zv/mQ6vtfU+XDAQXBauCrpzMuKlj208oCXhh+v+x9ianUlXTIA1+fo58bujfDshHDvk/OS4Fx+wqVUx80RvXH33wiB8kCXqIZVgvJfbV66fME3N2bRwHqEzsZNXzq3HFqB6A0a8yMBMmfk9IZYNGB+/ygth9O8zPxA3nhoqsewu057AB2i3PSEnQ1wbrr3aJziIJDyfRnn7Y1To2TKz0kL+4d1hZZzUrSP1bI5WaIU4CPekc07VCOiE5hrrS1Ab0151Ru8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWyy3ODH74klqIzbAO4RqYYy3nSRRXHWqK31Rv4tY3M=;
 b=M3iEJ3dGVNJbjnbvHDVRmnpeSmwMZTueV0aGT1DfNUa3tSfVfcx34FNPff8WFkmn6AL3Meta4fnNcNKj+OvtJpI05nAMrGbY3s+l4pKGZ7ea+/zX2zYV5UYzmK7SJd9DrZ/9Hv8UATfC6cUgW1P9cKmGiQ2gntL4TauaB45JeZRaFEWy+nQp0TgoX8N5rQCiuCUNsyenevilI+onHYNuX4LtmdU1DJKhMxHQjdwfsnPlwDiGqZJcHtDlkviAXIAShyTGr+0ytsPGSlnm+FT4k6J1KdUcDpJYxDvW2NhRgGd0FybW4VO3/3SDeCx8y4FctGPutc+ERaR6VhkzhLAq6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DWyy3ODH74klqIzbAO4RqYYy3nSRRXHWqK31Rv4tY3M=;
 b=To+Qus8cOxpaxtPd/Nz0F7AH1E/cbWWv71u4wnNtHi6aZb4YlOziKROT3llta2tBsO1xcCA1UM6vCVB+Vgx6Ipif5gcFBmbP/gVL55aF2+UWvpnd0WYTJfzLy8xoS/+nVKRORIaeLH3lEMNnnrWAgG+Mla0PYZxoDBq1Pmi14b0=
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com (10.170.219.144) by
 DB6PR02MB3128.eurprd02.prod.outlook.com (10.170.221.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.24; Tue, 18 Feb 2020 08:13:20 +0000
Received: from DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f1c2:7dd1:1131:1c1d]) by DB6PR02MB2999.eurprd02.prod.outlook.com
 ([fe80::f1c2:7dd1:1131:1c1d%7]) with mapi id 15.20.2729.032; Tue, 18 Feb 2020
 08:13:20 +0000
Received: from [10.10.195.54] (91.199.104.6) by
 FR2P281CA0001.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.17 via Frontend Transport; Tue, 18 Feb 2020 08:13:19 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH V2] x86/altp2m: Hypercall to set altp2m view visibility
Thread-Index: AQHV124xlaiLFBXa8kCbjgVBTXJ5w6gfiiMAgAEtjQA=
Date: Tue, 18 Feb 2020 08:13:20 +0000
Message-ID: <695f304c-2968-66fe-5a33-14c81d980d18@bitdefender.com>
References: <20200130130649.14538-1-aisaila@bitdefender.com>
 <e20d6574-0e76-acf8-8b33-fb5a4fce7908@suse.com>
In-Reply-To: <e20d6574-0e76-acf8-8b33-fb5a4fce7908@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: FR2P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::11) To DB6PR02MB2999.eurprd02.prod.outlook.com
 (2603:10a6:6:17::16)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d52791e9-1a74-4be7-390b-08d7b44a6a7a
x-ms-traffictypediagnostic: DB6PR02MB3128:|DB6PR02MB3128:
x-microsoft-antispam-prvs: <DB6PR02MB3128D7D73DDB2A71125FC64CAB110@DB6PR02MB3128.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 031763BCAF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39850400004)(396003)(376002)(136003)(346002)(199004)(189003)(31686004)(2906002)(52116002)(6916009)(54906003)(316002)(71200400001)(6666004)(16576012)(31696002)(26005)(53546011)(86362001)(16526019)(6486002)(186003)(478600001)(8676002)(4326008)(2616005)(8936002)(66946007)(66556008)(66446008)(81166006)(81156014)(36756003)(5660300002)(7416002)(66476007)(956004)(64756008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DB6PR02MB3128;
 H:DB6PR02MB2999.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: F3bkzcPu+i/cNbExOs4sEXsQOprc/OpPvN+A940DsOSQbUCVQYjIL+QMhbKMRAyH5AQ9KGZYwFMOfvx64ns6QuNaeBt+bI7cX1t06lgg52OCSEfai+KIE2HQzl4cPoN1sm9+1FbjWnDyzYVUST2m0pC4qMtwecMSPb88ehl3RHtCE56rGBpVmvcOhBWpHK603zm24Tgnw8bzPGmF3G1lmmsapc6Awz8pUYspvqi7o2xZZ7/oASIToojWYX7JILazYvn81PY+Pdqpolb/IMGrQsDxqT+h5gdjLr/Cn7DwIRG89SoVioMHlqPqfx/eRxMhUEzJRM2yb8OAHO8n9AS87NUIa1OMN2cpIPI/qB2mZXiz9EEnLS45z91NJCisVoodPHbKDNgGkWibF2FYa2tS0nIdkg5X0axPUtCFQOEQvySP/DbkVxM/5hpSFNzBGrD3
x-ms-exchange-antispam-messagedata: 4k7feU+J/X2GaWCOHCZyLZnUwW7uAV6v+Xxhor/BFsBCMnGS43F50ZZYOvaYcKtQpDWUxPQDE47BBRGUg0KjGNu2HiWXmTokeZV7xD8SsuqjCNfHDkxg2Opc5j89hgIUJkbFpyRQctCByJ6FICzfyQ==
x-ms-exchange-transport-forked: True
Content-ID: <A9F4DCBC7BC04A4BB7AAE7F72CB75456@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d52791e9-1a74-4be7-390b-08d7b44a6a7a
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2020 08:13:20.4897 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jLlyYXoBQmZrNYusN3XjsnPuZVJ1EUI2z4kGCJCapfDnDGk7EnmqT09lrUkU0Mr4fM8a5bNTDY+mynXDGByAquswYr6YHO84UaK352UqqvE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR02MB3128
Subject: Re: [Xen-devel] [PATCH V2] x86/altp2m: Hypercall to set altp2m view
 visibility
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDE3LjAyLjIwMjAgMTY6MTQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAzMC4wMS4y
MDIwIDE0OjA3LCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+IEBAIC00ODE0LDYg
KzQ4MTUsMzAgQEAgc3RhdGljIGludCBkb19hbHRwMm1fb3AoDQo+PiAgICAgICAgICAgYnJlYWs7
DQo+PiAgICAgICB9DQo+PiAgIA0KPj4gKyAgICBjYXNlIEhWTU9QX2FsdHAybV9zZXRfdmlzaWJp
bGl0eToNCj4+ICsgICAgew0KPj4gKyAgICAgICAgdWludDE2X3QgYWx0cDJtX2lkeCA9IGEudS5z
ZXRfdmlzaWJpbGl0eS5hbHRwMm1faWR4Ow0KPj4gKw0KPj4gKyAgICAgICAgaWYgKCBhLnUuc2V0
X3Zpc2liaWxpdHkucGFkIHx8IGEudS5zZXRfdmlzaWJpbGl0eS5wYWQyICkNCj4+ICsgICAgICAg
ICAgICByYyA9IC1FSU5WQUw7DQo+PiArICAgICAgICBlbHNlDQo+PiArICAgICAgICB7DQo+PiAr
ICAgICAgICAgICAgaWYgKCAhYWx0cDJtX2FjdGl2ZShkKSB8fCAhaGFwX2VuYWJsZWQoZCkgKQ0K
PiANCj4gRG9lc24ndCBhbHRwMm1fYWN0aXZlKCkgaW1wbHkgaGFwX2VuYWJsZWQoKT8gQXQgdGhl
IHZlcnkgbGVhc3QNCj4gdGhlcmUncyBubyBvdGhlciB1c2Ugb2YgaGFwX2VuYWJsZWQoKSBpbiBk
b19hbHRwMm1fb3AoKS4NCg0KWWVzLCB0aGUgaGFwX2VuYWJsZWQgY2FuIGJlIGRyb3BwZWQuDQoN
Cj4gDQo+PiArICAgICAgICAgICAgew0KPj4gKyAgICAgICAgICAgICAgICByYyA9IC1FT1BOT1RT
VVBQOw0KPj4gKyAgICAgICAgICAgICAgICBicmVhazsNCj4+ICsgICAgICAgICAgICB9DQo+PiAr
DQo+PiArICAgICAgICAgICAgaWYgKCBhLnUuc2V0X3Zpc2liaWxpdHkudmlzaWJsZSApDQo+PiAr
ICAgICAgICAgICAgICAgIGQtPmFyY2guYWx0cDJtX3dvcmtpbmdfZXB0cFthbHRwMm1faWR4XSA9
DQo+PiArICAgICAgICAgICAgICAgIGQtPmFyY2guYWx0cDJtX2VwdHBbYWx0cDJtX2lkeF07DQo+
PiArICAgICAgICAgICAgZWxzZQ0KPj4gKyAgICAgICAgICAgICAgICBkLT5hcmNoLmFsdHAybV93
b3JraW5nX2VwdHBbYWx0cDJtX2lkeF0gPQ0KPj4gKyAgICAgICAgICAgICAgICBtZm5feChJTlZB
TElEX01GTik7DQo+PiArICAgICAgICB9DQo+PiArICAgICAgICBicmVhazsNCj4gDQo+IEFsc28g
dGhlIGNvZGUgaGVyZSBsZW5kcyBpdHNlbGYgdG8gcmVkdWN0aW9uIG9mIGluZGVudGF0aW9uDQo+
IGRlcHRoOg0KPiANCj4gICAgICBjYXNlIEhWTU9QX2FsdHAybV9zZXRfdmlzaWJpbGl0eToNCj4g
ICAgICB7DQo+ICAgICAgICAgIHVpbnQxNl90IGFsdHAybV9pZHggPSBhLnUuc2V0X3Zpc2liaWxp
dHkuYWx0cDJtX2lkeDsNCj4gDQo+ICAgICAgICAgIGlmICggYS51LnNldF92aXNpYmlsaXR5LnBh
ZCB8fCBhLnUuc2V0X3Zpc2liaWxpdHkucGFkMiApDQo+ICAgICAgICAgICAgICByYyA9IC1FSU5W
QUw7DQo+ICAgICAgICAgIGVsc2UgaWYgKCAhYWx0cDJtX2FjdGl2ZShkKSB8fCAhaGFwX2VuYWJs
ZWQoZCkgKQ0KPiAgICAgICAgICAgICAgICAgIHJjID0gLUVPUE5PVFNVUFA7DQo+ICAgICAgICAg
IGVsc2UgaWYgKCBhLnUuc2V0X3Zpc2liaWxpdHkudmlzaWJsZSApDQo+ICAgICAgICAgICAgICBk
LT5hcmNoLmFsdHAybV93b3JraW5nX2VwdHBbYWx0cDJtX2lkeF0gPQ0KPiAgICAgICAgICAgICAg
ICAgIGQtPmFyY2guYWx0cDJtX2VwdHBbYWx0cDJtX2lkeF07DQo+ICAgICAgICAgIGVsc2UNCj4g
ICAgICAgICAgICAgIGQtPmFyY2guYWx0cDJtX3dvcmtpbmdfZXB0cFthbHRwMm1faWR4XSA9DQo+
ICAgICAgICAgICAgICAgICAgbWZuX3goSU5WQUxJRF9NRk4pOw0KPiANCj4gICAgICAgICAgYnJl
YWs7DQo+ICAgICAgfQ0KPiANCj4gDQo+IEFsc28gbm90ZSB0aGUgYWx0ZXJlZCBpbmRlbnRhdGlv
biBvZiB0aGUgYXNzaWdubWVudHMuDQoNCkkgd2lsbCBmaXggdGhlIGVsc2UgaWYgYWxpZ25tZW50
IGFzIHdlbGwgYXMgdGhlIGluZGVudGF0aW9uIGZvciB0aGUgDQphc3NpZ25tZW50cy4NCg0KPiAN
Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9oYXAvaGFwLmMNCj4+ICsrKyBiL3hlbi9hcmNoL3g4
Ni9tbS9oYXAvaGFwLmMNCj4+IEBAIC00ODgsOCArNDg4LDE3IEBAIGludCBoYXBfZW5hYmxlKHN0
cnVjdCBkb21haW4gKmQsIHUzMiBtb2RlKQ0KPj4gICAgICAgICAgICAgICBnb3RvIG91dDsNCj4+
ICAgICAgICAgICB9DQo+PiAgIA0KPj4gKyAgICAgICAgaWYgKCAoZC0+YXJjaC5hbHRwMm1fd29y
a2luZ19lcHRwID0gYWxsb2NfeGVuaGVhcF9wYWdlKCkpID09IE5VTEwgKQ0KPj4gKyAgICAgICAg
ew0KPj4gKyAgICAgICAgICAgIHJ2ID0gLUVOT01FTTsNCj4+ICsgICAgICAgICAgICBnb3RvIG91
dDsNCj4+ICsgICAgICAgIH0NCj4gDQo+IElzbid0IHRoZXJlIGEgcHJlLWV4aXN0aW5nIGVycm9y
IGhhbmRsaW5nIGlzc3VlIGhlcmUgd2hpY2ggeW91DQo+IHdpZGVuLCBpbiB0aGF0IGxhdGVyIGVu
Y291bnRlcmVkIGVycm9ycyBkb24ndCBjYXVzZSBjbGVhbiB1cA0KPiBvZiB3aGF0IGhhZCBhbHJl
YWR5IHN1Y2NlZWRlZCBiZWZvcmU/DQoNCkl0IHNlZW1zIG5vbiBvZiB0aGUgZXJyb3JzIHBlcmZv
cm0gYSBjbGVhbnVwLiBJdCBtaWdodCBiZSBiZXR0ZXIgdG8gaGF2ZSANCmEgZ2VuZXJhbCBjbGVh
bnVwIGRvbmUgYXQgIm91dDoiIGlmICggIXJ2ICkgYW5kIHRoZW4gY2hlY2sgd2hhdCBzaG91bGQg
DQpiZSAicDJtX3RlYXJkb3duKCkiIG9yICJmcmVlX3hlbmhlYXBfcGFnZSgpIi4NCg0KPiANCj4+
IEBAIC0yNjUxLDYgKzI2NTIsOCBAQCBpbnQgcDJtX2Rlc3Ryb3lfYWx0cDJtX2J5X2lkKHN0cnVj
dCBkb21haW4gKmQsIHVuc2lnbmVkIGludCBpZHgpDQo+PiAgICAgICAgICAgICAgIHAybV9yZXNl
dF9hbHRwMm0oZCwgaWR4LCBBTFRQMk1fREVBQ1RJVkFURSk7DQo+PiAgICAgICAgICAgICAgIGQt
PmFyY2guYWx0cDJtX2VwdHBbYXJyYXlfaW5kZXhfbm9zcGVjKGlkeCwgTUFYX0VQVFApXSA9DQo+
PiAgICAgICAgICAgICAgIG1mbl94KElOVkFMSURfTUZOKTsNCj4+ICsgICAgICAgICAgICBkLT5h
cmNoLmFsdHAybV93b3JraW5nX2VwdHBbYXJyYXlfaW5kZXhfbm9zcGVjKGlkeCwgTUFYX0VQVFAp
XSA9DQo+PiArICAgICAgICAgICAgbWZuX3goSU5WQUxJRF9NRk4pOw0KPiANCj4gTGlrZSBhYm92
ZSwgYW5kIGlycmVzcGVjdGl2ZSBvZiB5b3UgY2xvbmluZyBleGlzdGluZyBjb2RlIC0NCj4gaW5k
ZW50YXRpb24gb2YgdGhlIDJuZCBsaW5lIGlzIHdyb25nIGhlcmUuDQo+IA0KPj4gLS0tIGEveGVu
L2luY2x1ZGUvcHVibGljL2h2bS9odm1fb3AuaA0KPj4gKysrIGIveGVuL2luY2x1ZGUvcHVibGlj
L2h2bS9odm1fb3AuaA0KPj4gQEAgLTMxNyw2ICszMTcsMTMgQEAgc3RydWN0IHhlbl9odm1fYWx0
cDJtX2dldF92Y3B1X3AybV9pZHggew0KPj4gICAgICAgdWludDE2X3QgYWx0cDJtX2lkeDsNCj4+
ICAgfTsNCj4+ICAgDQo+PiArc3RydWN0IHhlbl9odm1fYWx0cDJtX3NldF92aXNpYmlsaXR5IHsN
Cj4+ICsgICAgdWludDE2X3QgYWx0cDJtX2lkeDsNCj4+ICsgICAgdWludDhfdCB2aXNpYmxlOw0K
Pj4gKyAgICB1aW50OF90IHBhZDsNCj4+ICsgICAgdWludDMyX3QgcGFkMjsNCj4+ICt9Ow0KPiAN
Cj4gV2hhdCBpcyBwYWQyIGdvb2QvaW50ZW5kZWQgZm9yPyAzMi1iaXQgcGFkZGluZyBmaWVsZHMg
aW4gc29tZQ0KPiBvdGhlciBzdHJ1Y3R1cmVzIGFyZSBuZWVkZWQgYmVjYXVzZSBvbmUgb3IgbW9y
ZSB1aW50NjRfdA0KPiBmaWVsZHMgZm9sbG93LCBidXQgdGhpcyBpc24ndCB0aGUgY2FzZSBoZXJl
Lg0KDQpSaWdodCwgcGFkMiBjYW4gYmUgZHJvcHBlZC4NCg0KDQpBbGV4DQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
