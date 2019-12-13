Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26D7F11E1B4
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 11:11:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifhs4-0003nj-3N; Fri, 13 Dec 2019 10:08:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=IdtR=2D=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1ifhs2-0003nR-LE
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 10:08:26 +0000
X-Inumbo-ID: 800aa34c-1d90-11ea-a1e1-bc764e2007e4
Received: from EUR03-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe09::731])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 800aa34c-1d90-11ea-a1e1-bc764e2007e4;
 Fri, 13 Dec 2019 10:08:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LiFksfnuW3PN+jIuTXXV4xBJkKNZaiK0PSM4TjLpn4vEXX1eizbIxLPCA8mZdvc9lIXk+TGfNzxBxpDvbsX1VueI+VUYu5wGcfoX7IJzGQThW9Aq8ftBARlzLfLVIiDFpj7E0duQYQj7L1dI68jJ68h0Eqc62HT2qEgdPMRkjhzFWdOZELy2gPF1aPoh4hpKeGKQIMrgPpefLw2W08InKdXc3R6Xdm38WPTd7DYS2jfqIfZ3EJOmZDWBjzs0a8IPYSipGERP5HuwAyyE8GYZ7zFFiGPUZklatKC6gknXuNoQ0qi+jvFwIylowcL+0/pQe2u8FGJeS+9Q4GdOvlxI5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ec2lNNHEifdbodrgQkxufoUwxbWoBV+bmxqmPvjT0uA=;
 b=NitMo3he753EpArRv4TazclYtC79Xjmak794OWGniFIZguikTYiPf8FGWXRyfP0BaS0u+0HKC2eN+xYrhOyUHI1bzZOZCOmHmuZMJCYGqI4m79MdYBSFe8ZBrc9zADa8jWfAcQdWeqoO39o4jINns6QGdtdiQ/LJuXEOazY4ooHHzEGW2KITlOxm3ZwFfLfQdxserTHO4l7NGAb6amXPzxGgo/xZPxRLkl2XouG+boOYXI++auG7fglxoa3Vz9mOpubl+J31A3ixgYlGnBmh8ek4zIxE12YlepH5pm9FKHT3Y5ZPT3Erwk9eJoBuhp12quE2GWsMIZx4sVztO4We+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ec2lNNHEifdbodrgQkxufoUwxbWoBV+bmxqmPvjT0uA=;
 b=rJVng7dQ6O6Ilp6XGrnnANf6cQvMXhzmL8PJvPeoc7/+kL/6Qx2gsFNsC3zXHlCjy8hHmU0OC8xlvz4F8JJyiAubUjQv4p1ep6TDSXUxzGhEs8OwpJ6o0XIosRahPWTVL+QqA3dY56NfWNMYB1ydIsy3paQMzSyDlNrp2G/zii8=
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com (10.255.30.78) by
 AM0PR02MB4099.eurprd02.prod.outlook.com (20.177.110.26) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2538.14; Fri, 13 Dec 2019 10:08:23 +0000
Received: from AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d]) by AM0PR02MB5553.eurprd02.prod.outlook.com
 ([fe80::8cec:7638:734c:89d%4]) with mapi id 15.20.2538.017; Fri, 13 Dec 2019
 10:08:22 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH V3 1/2] x86/altp2m: Add hypercall to set a range of sve
 bits
Thread-Index: AQHVoHyqPG/1qImaik2u7wxoJD4v56eiEDwAgAUNEICAAQUjAIAP1xaA
Date: Fri, 13 Dec 2019 10:08:22 +0000
Message-ID: <739188ef-fc7a-7b07-9deb-8d0663ce71df@bitdefender.com>
References: <20191121150124.15865-1-aisaila@bitdefender.com>
 <f7de5e12-284f-11a8-97ee-b8cd12fa9037@suse.com>
 <4ce33df5-81cf-5cf5-c799-bfda3d3ff48d@bitdefender.com>
 <3f5d21ca-f6c7-821c-20ce-3649f6f20a38@suse.com>
In-Reply-To: <3f5d21ca-f6c7-821c-20ce-3649f6f20a38@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR05CA0065.eurprd05.prod.outlook.com
 (2603:10a6:208:be::42) To AM0PR02MB5553.eurprd02.prod.outlook.com
 (2603:10a6:208:160::14)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4bac7c8b-7b81-4d2c-bfe8-08d77fb462f9
x-ms-traffictypediagnostic: AM0PR02MB4099:|AM0PR02MB4099:|AM0PR02MB4099:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM0PR02MB4099C8F7E7785E4F37DF3B75AB540@AM0PR02MB4099.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0250B840C1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(39860400002)(376002)(366004)(396003)(136003)(199004)(189003)(6512007)(81156014)(316002)(8936002)(6486002)(7416002)(31696002)(6916009)(2906002)(81166006)(186003)(8676002)(86362001)(31686004)(66946007)(66556008)(64756008)(66476007)(66446008)(54906003)(52116002)(478600001)(53546011)(4326008)(5660300002)(2616005)(36756003)(6506007)(26005)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM0PR02MB4099;
 H:AM0PR02MB5553.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iz8r6+ODq53GdrYAtjj/8rBEVj1xVaTurnuxoliS5voj/Q4wvs0kN3rCvx1OVEW8poMOLoFzISNH+fPKB8Nk/bjc4KUP05t+o5wb2vfamN87sb3DaRDa/4NIZJGPXg4Y0REugobXzsNVn+v2AqKleH9K3EZk5Wjj19HHMAZXP9ImMNDDQ1VIlwPFxGWvTNHZPf0vQ4VYMSSN9tp4MhMLjlC1xLYMYUMLD66Nj9WZMRr8mS3kswbzpe+p78MKZ7+RzWs4pcqshQ2AEjmUtLuS+OmxPpK+wfS3JRUCRWYSAl/Zmh+t+XID3Q6YQ0aQXGaLVoqZ15cxsYkSGFHWb+x3vPZ4cd3bmX30oG3ppf/VWMWFdWw9ZnEjVe0JgWdcVDweMMXZkRXTzezf47c93701Fqv06VwaGFZGVduztOUAaoeWUaL2GGNqjsf1K3WxiV1Y
Content-ID: <DF873D8D87FF9447A2BD552776DE406A@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4bac7c8b-7b81-4d2c-bfe8-08d77fb462f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2019 10:08:22.8499 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hlw2Q9WJWKTJ20sGS7+Xglb0kKAUkeacHY4SGbhc4lCv6r3OD8KplFK586udjdK6vaFies9K8zoCbNYR7Y77z4nabZu7JzsjwP/T/aFx1ww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR02MB4099
Subject: Re: [Xen-devel] [PATCH V3 1/2] x86/altp2m: Add hypercall to set a
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
 Wei Liu <wl@xen.org>, Razvan COJOCARU <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDAzLjEyLjIwMTkgMTA6MTQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwMi4xMi4y
MDE5IDE1OjQwLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+IE9uIDI5LjExLjIw
MTkgMTM6MzEsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDIxLjExLjIwMTkgMTY6MDIsIEFs
ZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOg0KPj4+PiBAQCAtNDcxMSw2ICs0NzEyLDE4IEBA
IHN0YXRpYyBpbnQgZG9fYWx0cDJtX29wKA0KPj4+PiAgICAgICAgICAgIH0NCj4+Pj4gICAgICAg
ICAgICBicmVhazsNCj4+Pj4gICAgDQo+Pj4+ICsgICAgY2FzZSBIVk1PUF9hbHRwMm1fc2V0X3N1
cHByZXNzX3ZlX211bHRpOg0KPj4+PiArICAgICAgICBpZiAoIGEudS5zdXBwcmVzc192ZV9tdWx0
aS5wYWQxIHx8ICFhLnUuc3VwcHJlc3NfdmVfbXVsdGkucGFkMiApDQo+Pj4+ICsgICAgICAgICAg
ICByYyA9IC1FSU5WQUw7DQo+Pj4+ICsgICAgICAgIGVsc2UNCj4+Pj4gKyAgICAgICAgew0KPj4+
PiArICAgICAgICAgICAgcmMgPSBwMm1fc2V0X3N1cHByZXNzX3ZlX211bHRpKGQsICZhLnUuc3Vw
cHJlc3NfdmVfbXVsdGkpOw0KPj4+PiArDQo+Pj4+ICsgICAgICAgICAgICBpZiAoIF9fY29weV90
b19ndWVzdChhcmcsICZhLCAxKSApDQo+Pj4+ICsgICAgICAgICAgICAgICAgcmMgPSAtRUZBVUxU
Ow0KPj4+DQo+Pj4gRG8geW91IHJlYWxseSB3YW50IHRvIHJlcGxhY2UgYSBwb3NzaWJsZSBwcmlv
ciBlcnJvciBoZXJlPw0KPj4NCj4+IEkgdGhvdWdodCBhYm91dCB0aGlzIGFuZCB0aGUgb25seSBl
cnJvciB0aGF0IGNhbiBiZSByZXBsYWNlZCBoZXJlIGlzDQo+PiBFSU5WQUwuIEEgZXJyb3Igb24g
X19jb3B5X3RvX2d1ZXN0IGhhcyBhIGdyYXRlciBpbXBvcnRhbmNlIGlmIHRoaXMgZmFpbHMuDQo+
IA0KPiBJJ20gYWZyYWlkIEkgZG9uJ3QgdW5kZXJzdGFuZCB0aGUgcmVmZXJlbmNlIHRvIEVJTlZB
TC4NCj4gDQo+IEFzIHRvICJncmVhdGVyIGltcG9ydGFuY2UiIC0gSSdtIG5vdCBzdXJlIEkgZm9s
bG93LiBQbGVhc2UgdGFrZSBhDQo+IGxvb2sgYXQgZS5nLiBkb19ldmVudF9jaGFubmVsX29wKCks
IGJ1dCB0aGVyZSBhcmUgbnVtZXJvdXMgb3RoZXINCj4gZXhhbXBsZXMgdGhyb3VnaG91dCB0aGUg
dHJlZS4gVGhlIHBhdHRlcm4gdGhlcmUgaXMgYSBjb21tb24gb24sDQo+IGFuZCB3aGF0IHlvdSBk
byBoZXJlIGRvZXNuJ3QgbWF0Y2ggdGhhdC4NCg0KSSB3aWxsIGZvbGxvdyB0aGF0IHBhdHRlcm4u
DQoNCg0KPiANCj4+Pj4gKyAgICB3aGlsZSAoIHN2ZS0+bGFzdF9nZm4gPj0gc3RhcnQgKQ0KPj4+
DQo+Pj4gVGhlcmUgYXJlIG5vIGNoZWNrcyBvbiAtPmxhc3RfZ2ZuLCAtPmZpcnN0X2dmbiwgb3Ig
LT5vcGFxdWUuDQo+Pj4gQXQgdGhlIHZlcnkgbGVhc3QgYSBib2d1cyAtPm9wYXF1ZSBzaG91bGQg
cmVzdWx0IGluIGFuIGVycm9yLg0KPj4+IEkgd29uZGVyIHRob3VnaCB3aHkgeW91IGRvbid0IHNp
bXBseSB1cGRhdGUgLT5maXJzdF9nZm4sDQo+Pj4gb21pdHRpbmcgdGhlIG5lZWQgZm9yIC0+b3Bh
cXVlLiBBbGwgdGhpcyB3b3VsZCBuZWVkIGlzIGENCj4+PiBjb21tZW50IGluIHRoZSBwdWJsaWMg
aGVhZGVyIGNsYXJpZnlpbmcgdGhhdCBjYWxsZXJzIHNob3VsZA0KPj4+IGV4cGVjdCB0aGUgdmFs
dWVzIHRvIGNoYW5nZS4NCj4+DQo+PiBJIHdhcyBmb2xsb3dpbmcgdGhlIHBhdHRlcm4gZnJvbSBy
YW5nZV9zaGFyZSgpIGFmdGVyIFRhbWFzIHJlcXVlc3RlZCB0aGUNCj4+IG9wYXF1ZSBmaWVsZC4g
SSBhZ3JlZSB0aGF0IGl0IHdvdWxkIGJlIHNpbXBsZXIgdG8gaGF2ZSAtPmZpcnN0X2dmbg0KPj4g
dXBkYXRlIGFuZCBJIGNhbiBjaGFuZ2UgdG8gdGhhdCBpbiB0aGUgbmV4dCB2ZXJzaW9uLg0KPj4N
Cj4+PiBGdXJ0aGVybW9yZSBJIHRoaW5rIGl0IHdvdWxkIGJlIGhlbHBmdWwgdG8gYmFpbCBvbiBl
bnRpcmVseQ0KPj4+IG91dCBvZiByYW5nZSAtPmZpcnN0X2dmbi4gVGhpcyBiZWluZyBhIDY0LWJp
dCBmaWVsZCwgb25seQ0KPj4+IDQwIG9mIHRoZSBiaXRzIGFyZSBhY3R1YWxseSB1c2FibGUgZnJv
bSBhbiBhcmNoaXRlY3R1cmUgcG92DQo+Pj4gKGluIHJlYWxpdHkgaXQgbWF5IGJlIGV2ZW4gbGVz
cykuIE90aGVyd2lzZSB5b3UgcG90ZW50aWFsbHkNCj4+PiBpbnZva2UgcDJtX2VwdF9zZXRfZW50
cnkoKSBwZXJoYXBzIHRyaWxsaW9ucyBvZiB0aW1lcyBqdXN0DQo+Pj4gZm9yIGl0IHRvIHJldHVy
biAtRUlOVkFMIGZyb20gaXRzIGZpcnN0IGlmKCkuDQo+Pg0KPj4gRG8geW91IG1lYW4gdG8gY2hl
Y2sgLT5maXJzdF9nZm4odGhhdCB3aWxsIGJlIHVwZGF0ZWQgaW4gdGhlIG5leHQNCj4+IHZlcnNp
b24pIGFnYWluc3QgZG9tYWluX2dldF9tYXhpbXVtX2dwZm4oKSBhbmQgYmFpbCBhZnRlciB0aGF0
IHJhbmdlPw0KPiANCj4gVGhpcyBtYXkgYmUgb25lIHBvc3NpYmlsaXR5IChkZXBlbmRpbmcgb24g
d2hhdCB0aGUgaW50ZW5lZGVkDQo+IGJlaGF2aW9yIGZvciBHRk5zIGFib3ZlIHRoaXMgdmFsdWUg
aXMpLiBBbm90aGVyIHdvdWxkIGJlIHRvDQo+IHNpbXBseSBqdWRnZSBmcm9tIHRoZSBndWVzdCdz
IENQVUlEIHNldHRpbmcgZm9yIHRoZSBudW1iZXIgb2YNCj4gcGh5c2ljYWwgYWRkcmVzcyBiaXRz
Lg0KPiANCg0KSSB3aWxsIGNoZWNrIC0+Zmlyc3RfZ2ZuIGFnYWluc3QgZC0+YXJjaC5jcHVpZC0+
ZXh0ZC5tYXhwaHlzYWRkciBhbmQgDQpiYWlsIG91dCBvbiBvdXQgb2YgcmFuZ2UuDQoNClRoYW5r
cywNCkFsZXgNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
