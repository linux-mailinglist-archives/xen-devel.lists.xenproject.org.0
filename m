Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2105BE75
	for <lists+xen-devel@lfdr.de>; Mon,  1 Jul 2019 16:39:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hhxPk-0003W6-Qx; Mon, 01 Jul 2019 14:36:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YZ94=U6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hhxPj-0003W1-Cg
 for xen-devel@lists.xenproject.org; Mon, 01 Jul 2019 14:36:15 +0000
X-Inumbo-ID: 389da895-9c0d-11e9-8980-bc764e045a96
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 389da895-9c0d-11e9-8980-bc764e045a96;
 Mon, 01 Jul 2019 14:36:14 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  1 Jul 2019 14:33:36 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 1 Jul 2019 14:20:53 +0000
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 1 Jul 2019 14:20:53 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3377.namprd18.prod.outlook.com (10.255.139.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Mon, 1 Jul 2019 14:20:52 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2008.020; Mon, 1 Jul 2019
 14:20:52 +0000
From: Jan Beulich <JBeulich@suse.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [PATCH] xstate: make use_xsave non-init
Thread-Index: AQHVMAGdCquHeScd+UuKxH/O+V4l3Ka1yz2LgAAFEIA=
Date: Mon, 1 Jul 2019 14:20:52 +0000
Message-ID: <3daac2b4-9373-cef5-e9d1-e5aea39c697a@suse.com>
References: <20190701104903.72364-1-roger.pau@citrix.com>
 <addf8b00-6c2e-56e3-d5f8-ec7e52291638@suse.com>
 <20190701140153.uy5frq2kgxijxolr@MacBook-Air-de-Roger.local>
In-Reply-To: <20190701140153.uy5frq2kgxijxolr@MacBook-Air-de-Roger.local>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0802CA0038.eurprd08.prod.outlook.com
 (2603:10a6:4:a3::24) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 20f67ee8-45be-4bca-422f-08d6fe2f5251
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3377; 
x-ms-traffictypediagnostic: BY5PR18MB3377:
x-microsoft-antispam-prvs: <BY5PR18MB33773F4B2A88C2CC02B872F5B3F90@BY5PR18MB3377.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00851CA28B
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(376002)(136003)(366004)(396003)(39860400002)(189003)(199004)(54906003)(36756003)(52116002)(14454004)(316002)(25786009)(6916009)(31686004)(71190400001)(5660300002)(53936002)(229853002)(6436002)(6246003)(72206003)(478600001)(66066001)(6486002)(80792005)(66946007)(256004)(73956011)(81156014)(99286004)(66446008)(305945005)(8676002)(6512007)(186003)(66556008)(4326008)(66476007)(26005)(86362001)(102836004)(31696002)(64756008)(71200400001)(5024004)(8936002)(53546011)(486006)(446003)(81166006)(6116002)(11346002)(476003)(2616005)(76176011)(3846002)(7736002)(2906002)(14444005)(6506007)(68736007)(386003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3377;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qQgL4chXko2dJfpQnCge1nhNONX7pgWtVqQ9cYqF8HFiGeY4S7NY7ycCHywpTeDhrMWuPeELa7NoS4dMMRsBw8fNFvpPdEo0QXgf2Jh8DEyVMjyj6wn+hLiwsTelyHmfVaXi7J9r9lkY3daIZVLv1df/zOynJ/LP5wlINT9NzqJ2qs+NTAQinz/P7KPN8jdSNrf96qtMwXWXLtdFNC5UrPBlGiRVC5tJu/zmxm+GAd+pU6TqhMGeC2BQnDlwLHmVq2UZQQoSDe3+WCOOoTpoUDKyrFVJQgpAW6sMkj426PDAqvyv7xwqtEXqwfvUy3p6l+oOIwNRdSv+kJ+2gZvD8TIniYs0rhv4WamxKWUJ+GBD7u9L9deEybGqkqcJNXhdKGbadlbXLZwZen4iNw7mJm8cnhyak5uRiAniBMuJY5c=
Content-ID: <8E7CCAD44BDDB546B8CF2ECCEE27BA30@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 20f67ee8-45be-4bca-422f-08d6fe2f5251
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2019 14:20:52.0157 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3377
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] xstate: make use_xsave non-init
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
Cc: AndrewCooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMDcuMjAxOSAxNjowMSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6DQo+IE9uIE1vbiwg
SnVsIDAxLCAyMDE5IGF0IDExOjM5OjE2QU0gKzAwMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4g
T24gMDEuMDcuMjAxOSAxMjo0OSwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPj4+IC0tLSBhL3hl
bi9hcmNoL3g4Ni94c3RhdGUuYw0KPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni94c3RhdGUuYw0KPj4+
IEBAIC01NzcsNyArNTc3LDcgQEAgdW5zaWduZWQgaW50IHhzdGF0ZV9jdHh0X3NpemUodTY0IHhj
cjApDQo+Pj4gICAgLyogQ29sbGVjdCB0aGUgaW5mb3JtYXRpb24gb2YgcHJvY2Vzc29yJ3MgZXh0
ZW5kZWQgc3RhdGUgKi8NCj4+PiAgICB2b2lkIHhzdGF0ZV9pbml0KHN0cnVjdCBjcHVpbmZvX3g4
NiAqYykNCj4+PiAgICB7DQo+Pj4gLSAgICBzdGF0aWMgYm9vbCBfX2luaXRkYXRhIHVzZV94c2F2
ZSA9IHRydWU7DQo+Pj4gKyAgICBzdGF0aWMgYm9vbCB1c2VfeHNhdmUgPSB0cnVlOw0KPj4NCj4+
IFBsZWFzZSBhdHRhY2ggYXQgbGVhc3QgYSBicmllZiBjb21tZW50IGhlcmUsIHN1Y2ggdGhhdCBw
ZW9wbGUNCj4+IHdvbid0IGNvbnNpZGVyIHRoZSBfX2luaXRkYXRhIG1pc3NpbmcuDQo+IA0KPiBT
dXJlLg0KPiANCj4+DQo+PiBPZiBjb3Vyc2UgSSdkIGFjdHVhbGx5IHByZWZlciB0aGUgYW5ub3Rh
dGlvbiB0byBzdGF5IGhlcmUgaW4NCj4+IHRoZSBnY2MgY2FzZS4gSWlyYyB0aGVyZSB3YXMgb25l
IG90aGVyIGNhc2Ugd2hlcmUgdGhlcmUgd2FzDQo+PiBzdWNoIGFuIGlzc3VlOyBJIGRvbid0IHJl
Y2FsbCB3aGV0aGVyIHRoZXJlIGl0IHRvbyBnb3QgZGVhbHQNCj4+IHdpdGggYnkgcmVtb3Zpbmcg
YW4gYW5ub3RhdGlvbi4NCj4gDQo+IFllcywgaW4gdGhhdCBvdGhlciBjYXNlIHRoZSBhbm5vdGF0
aW9uIHdhcyBqdXN0IHJlbW92ZWQsIGl0J3MgNDNmYTk1YWUgWzBdDQo+IA0KPj4gSG93IGFib3V0
IHdlIGludHJvZHVjZSBhbg0KPj4gYW5ub3RhdGlvbiB0aGF0IGV4cGFuZHMgdG8gbm90aGluZyBp
biB0aGUgY2xhbmcgY2FzZSwgYnV0DQo+PiBjb250aW51ZXMgdG8gcHJvdmlkZSB0aGUgc2FtZSBm
dW5jdGlvbmFsaXR5IGZvciBnY2M/IFRoYXQNCj4+IHdvdWxkIHRoZW4gYWxzbyBjbGFyaWZ5IHRo
ZSByZWFzb24gZm9yIGl0IGJlaW5nIGluIGFueQ0KPj4gcGFydGljdWxhciBwbGFjZSAoSSBndWVz
cyB0aGVyZSBhcmUgZ29pbmcgdG8gYmUgbW9yZSkgd2l0aG91dA0KPj4gdGhlIG5lZWQgZm9yIGZ1
cnRoZXIgY29tbWVudGFyeS4NCj4gDQo+IElNTyB0aGF0J3MgYSBsaXR0bGUgYml0IGRhbmdlcm91
cywgZnJvbSB0aGUgTExWTSBidWcgcmVwb3J0IGl0IHNlZW1zDQo+IGxpa2UgTExWTSBiZWhhdmlv
dXIgaXMgbm90IGEgYnVnLCBhbmQgaGVuY2UgSSB3b3VsZG4ndCBiZSBzdXJwcmlzZWQgaWYNCj4g
bmV3ZXIgdmVyc2lvbnMgb2YgZ2NjIGFsc28gZXhoaWJpdCB0aGUgc2FtZSBpc3N1ZS4NCg0KT2th
eSwgdGhlbiBsZXQncyBnbyB0aGUgcm91dGUgeW91IHN1Z2dlc3RlZCwganVzdCB3aXRoIGEgY29t
bWVudA0KYWRkZWQgdG8gcHJldmVudCByZS1hZGRpdGlvbiBvZiB0aGUgYW5ub3RhdGlvbi4gSSB3
b25kZXIgd2hldGhlcg0Kd2Ugb3VnaHQgdG8gZG8gYW4gYXVkaXQgb2YgdGhlIGNvZGUgdG8gZmlu
ZCBwb3NzaWJsZSBmdXJ0aGVyDQpvZmZlbmRlcnMuIEl0IGRvZXNuJ3QgbG9vayB2ZXJ5IGRlc2ly
YWJsZSB0byBtZSB0byBmaW5kIHRoZQ0KaW5zdGFuY2VzIG9uZSBieSBvbmUgYnkgc29tZW9uZSBv
YnNlcnZpbmcgY3Jhc2hlcy4NCg0KSG1tLCBoYXZpbmcgbG9va2VkIGF0IHRoZSBvbGRlciBjb21t
aXQgSSdtIGFnYWluIHN0YXJ0aW5nIHRvIHdvbmRlcg0Kd2hldGhlciBkcm9wcGluZyB0aGUgYW5u
b3RhdGlvbnMgaXMgdGhlIHJpZ2h0IGNvdXJzZSBvZiBhY3Rpb24uIERpZA0Kd2UgY29uc2lkZXIg
YWRkaW5nIHZvbGF0aWxlIHRvIHRoZSB2YXJpYWJsZSBiYWNrIHRoZW4/IFRoYXQgc2hvdWxkDQpt
YWtlIHRoZSBjb21waWxlciBub3QgcHVsbCBhaGVhZCB0aGUgbWVtb3J5IGFjY2VzcyhlcyksIGFu
ZCB0aGUNCmRvd25zaWRlcyBvZiB0aGlzIHNob3VsZCBiZSBwcmV0dHkgbGltaXRlZCBmb3IgaW5p
dC1vbmx5IGl0ZW1zLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
