Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8142F5CE01
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 12:55:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiGOM-0005Vl-Hl; Tue, 02 Jul 2019 10:52:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=lloE=U7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hiGOL-0005Vg-EI
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 10:52:05 +0000
X-Inumbo-ID: 6b3485f0-9cb7-11e9-a2bf-8f335d32855d
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6b3485f0-9cb7-11e9-a2bf-8f335d32855d;
 Tue, 02 Jul 2019 10:52:02 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Tue,  2 Jul 2019 10:48:25 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 2 Jul 2019 10:50:04 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 2 Jul 2019 10:50:04 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3393.namprd18.prod.outlook.com (10.255.136.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Tue, 2 Jul 2019 10:50:03 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Tue, 2 Jul 2019
 10:50:03 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <Paul.Durrant@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 1/6] x86emul: generalize wbinvd() hook
Thread-Index: AQHVMAP1xO2bNlA31EuKZ0nW6D/01aa3HwAwgAAIvoA=
Date: Tue, 2 Jul 2019 10:50:02 +0000
Message-ID: <106174e9-de40-d41f-94d3-baaf74cd8d7d@suse.com>
References: <2d69ac51-9c4a-96f9-fd37-578658076571@suse.com>
 <3f30c73d-94a7-f9ca-5914-0400f1f98cc3@suse.com>
 <66a6b048ef29468c87138e55eeb68e10@AMSPEX02CL03.citrite.net>
In-Reply-To: <66a6b048ef29468c87138e55eeb68e10@AMSPEX02CL03.citrite.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB7PR03CA0002.eurprd03.prod.outlook.com (2603:10a6:5::15)
 To BY5PR18MB3394.namprd18.prod.outlook.com (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0bbb22e7-5110-463f-a8b3-08d6fedb0965
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3393; 
x-ms-traffictypediagnostic: BY5PR18MB3393:
x-microsoft-antispam-prvs: <BY5PR18MB339312758F9FD60511ACD10CB3F80@BY5PR18MB3393.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(346002)(396003)(136003)(376002)(366004)(189003)(199004)(6512007)(6246003)(316002)(110136005)(71200400001)(71190400001)(476003)(36756003)(72206003)(486006)(14454004)(76176011)(2501003)(80792005)(446003)(4326008)(53936002)(54906003)(14444005)(256004)(11346002)(25786009)(99286004)(26005)(5660300002)(186003)(2616005)(52116002)(305945005)(68736007)(31686004)(6506007)(53546011)(2906002)(66556008)(64756008)(66476007)(73956011)(66066001)(66446008)(81166006)(6486002)(8676002)(229853002)(6436002)(386003)(81156014)(478600001)(31696002)(8936002)(102836004)(66946007)(3846002)(7736002)(86362001)(6116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3393;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BnjHSfe3O64R0qdLzqsnkj8BBmrDbgF1g+dlg1nNPpWQ4ggIxujFDFvi1PvGH4Byh0pyyNCUlw4u+aDObIw5knlt/1SZ3fU9OTq6lEhXBs8M3+fSTg5f81zuqr62AxXpHdT9BDRnpTO+HBsMLb7LkPRC9Jm/meRyN5zhrCTIcmmSTG1pnEz+lfD+NcxxyHbmdaom0UE02rj1tqcFumseoJ900lwdUHO7Do+JeFoejYHLVE+KnK8MBWhDISNZLGUTC948BWyJP8Y9bjBd7VvSkSFb1zcp6gcGNe2ytkpoUu6uNW3e7D5DO22uUfEaabPHQLweaWMMy5JsEhJR/JlZf5+qgDbK5qBoBPZWnDC+Npysge4VkgpjF354RK1pnhWfzfQixXZ8IC4rn8o17qJzaPH8V4rEaBHK8dtPtigDv+k=
Content-ID: <3FE5BC66A2C87841B484DE29DA02A269@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bbb22e7-5110-463f-a8b3-08d6fedb0965
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 10:50:02.9813 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3393
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 1/6] x86emul: generalize wbinvd() hook
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDcuMjAxOSAxMjoyMiwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPj4gRnJvbTogSmFuIEJl
dWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPg0KPj4gU2VudDogMDEgSnVseSAyMDE5IDEyOjU2DQo+
Pg0KPj4gQEAgLTIxNDksMTAgKzIxNDcsNjUgQEAgc3RhdGljIGludCBodm1lbXVsX3dyaXRlX21z
cigNCj4+ICAgICAgICByZXR1cm4gcmM7DQo+PiAgICB9DQo+Pg0KPj4gLXN0YXRpYyBpbnQgaHZt
ZW11bF93YmludmQoDQo+PiArc3RhdGljIGludCBodm1lbXVsX2NhY2hlX29wKA0KPj4gKyAgICBl
bnVtIHg4NmVtdWxfY2FjaGVfb3Agb3AsDQo+PiArICAgIGVudW0geDg2X3NlZ21lbnQgc2VnLA0K
Pj4gKyAgICB1bnNpZ25lZCBsb25nIG9mZnNldCwNCj4+ICAgICAgICBzdHJ1Y3QgeDg2X2VtdWxh
dGVfY3R4dCAqY3R4dCkNCj4+ICAgIHsNCj4+IC0gICAgYWx0ZXJuYXRpdmVfdmNhbGwoaHZtX2Z1
bmNzLndiaW52ZF9pbnRlcmNlcHQpOw0KPj4gKyAgICBzdHJ1Y3QgaHZtX2VtdWxhdGVfY3R4dCAq
aHZtZW11bF9jdHh0ID0NCj4+ICsgICAgICAgIGNvbnRhaW5lcl9vZihjdHh0LCBzdHJ1Y3QgaHZt
X2VtdWxhdGVfY3R4dCwgY3R4dCk7DQo+PiArICAgIHVuc2lnbmVkIGxvbmcgYWRkciwgcmVwcyA9
IDE7DQo+PiArICAgIHVpbnQzMl90IHBmZWMgPSBQRkVDX3BhZ2VfcHJlc2VudDsNCj4+ICsgICAg
aW50IHJjOw0KPj4gKyAgICB2b2lkICptYXBwaW5nOw0KPj4gKw0KPj4gKyAgICBpZiAoICFjYWNo
ZV9mbHVzaF9wZXJtaXR0ZWQoY3VycmVudC0+ZG9tYWluKSApDQo+PiArICAgICAgICByZXR1cm4g
WDg2RU1VTF9PS0FZOw0KPj4gKw0KPj4gKyAgICBzd2l0Y2ggKCBvcCApDQo+PiArICAgIHsNCj4+
ICsgICAgY2FzZSB4ODZlbXVsX2NsZmx1c2g6DQo+PiArICAgIGNhc2UgeDg2ZW11bF9jbGZsdXNo
b3B0Og0KPj4gKyAgICBjYXNlIHg4NmVtdWxfY2x3YjoNCj4+ICsgICAgICAgIEFTU0VSVCghaXNf
eDg2X3N5c3RlbV9zZWdtZW50KHNlZykpOw0KPj4gKw0KPj4gKyAgICAgICAgcmMgPSBodm1lbXVs
X3ZpcnR1YWxfdG9fbGluZWFyKHNlZywgb2Zmc2V0LCAwLCAmcmVwcywNCj4+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBodm1fYWNjZXNzX3JlYWQsIGh2bWVtdWxfY3R4
dCwgJmFkZHIpOw0KPj4gKyAgICAgICAgaWYgKCByYyAhPSBYODZFTVVMX09LQVkgKQ0KPj4gKyAg
ICAgICAgICAgIGJyZWFrOw0KPj4gKw0KPj4gKyAgICAgICAgaWYgKCBodm1lbXVsX2N0eHQtPnNl
Z19yZWdbeDg2X3NlZ19zc10uZHBsID09IDMgKQ0KPj4gKyAgICAgICAgICAgIHBmZWMgfD0gUEZF
Q191c2VyX21vZGU7DQo+PiArDQo+PiArICAgICAgICBtYXBwaW5nID0gaHZtZW11bF9tYXBfbGlu
ZWFyX2FkZHIoYWRkciwgMCwgcGZlYywgaHZtZW11bF9jdHh0LA0KPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGN1cnJlbnQtPmFyY2guaHZtLmRhdGFfY2FjaGUp
Ow0KPj4gKyAgICAgICAgaWYgKCBtYXBwaW5nID09IEVSUl9QVFIoflg4NkVNVUxfRVhDRVBUSU9O
KSApDQo+PiArICAgICAgICAgICAgcmV0dXJuIFg4NkVNVUxfRVhDRVBUSU9OOw0KDQpUaGlzIHJl
dHVybiAuLi4NCg0KPj4gKyAgICAgICAgaWYgKCBJU19FUlJfT1JfTlVMTChtYXBwaW5nKSApDQo+
PiArICAgICAgICAgICAgYnJlYWs7DQo+PiArDQo+PiArICAgICAgICBpZiAoIGNwdV9oYXNfY2xm
bHVzaCApDQo+PiArICAgICAgICB7DQo+PiArICAgICAgICAgICAgaWYgKCBvcCA9PSB4ODZlbXVs
X2Nsd2IgJiYgY3B1X2hhc19jbHdiICkNCj4+ICsgICAgICAgICAgICAgICAgY2x3YihtYXBwaW5n
KTsNCj4+ICsgICAgICAgICAgICBlbHNlIGlmICggb3AgPT0geDg2ZW11bF9jbGZsdXNob3B0ICYm
IGNwdV9oYXNfY2xmbHVzaG9wdCApDQo+PiArICAgICAgICAgICAgICAgIGNsZmx1c2hvcHQobWFw
cGluZyk7DQo+PiArICAgICAgICAgICAgZWxzZQ0KPj4gKyAgICAgICAgICAgICAgICBjbGZsdXNo
KG1hcHBpbmcpOw0KPj4gKw0KPj4gKyAgICAgICAgICAgIGh2bWVtdWxfdW5tYXBfbGluZWFyX2Fk
ZHIobWFwcGluZywgYWRkciwgMCwgaHZtZW11bF9jdHh0KTsNCj4+ICsgICAgICAgICAgICBicmVh
azsNCj4+ICsgICAgICAgIH0NCj4+ICsNCj4+ICsgICAgICAgIGh2bWVtdWxfdW5tYXBfbGluZWFy
X2FkZHIobWFwcGluZywgYWRkciwgMCwgaHZtZW11bF9jdHh0KTsNCj4gDQo+IFNpbmNlIHRoZSBt
YXBwaW5nIGlzIGRpdGNoZWQgaGVyZSwgd2h5IGJvdGhlciBnZXR0aW5nIG9uZSBhdCBhbGwgaW4g
dGhlDQo+ICFjcHVfaGFzX2NsZmx1c2ggY2FzZT8gQXJlIHlvdSB0cnlpbmcgdG8gZmx1c2ggb3V0
IGFuIGVycm9yIGNvbmRpdGlvbj4gdGhhdCB3YXMgcHJldmlvdXNseSBtaXNzZWQ/DQoNCi4uLiBp
cyB3aGF0IEknbSBhZnRlcjogV2Ugd2FudCBleGNlcHRpb24gYmVoYXZpb3IgdG8gYmUgY29ycmVj
dC4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpo
dHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
