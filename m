Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEB75E5E3
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 15:59:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiflA-0001M9-LE; Wed, 03 Jul 2019 13:57:20 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vZpq=VA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hifl9-0001M4-J0
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 13:57:19 +0000
X-Inumbo-ID: 75cb164e-9d9a-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 75cb164e-9d9a-11e9-8980-bc764e045a96;
 Wed, 03 Jul 2019 13:57:18 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Wed,  3 Jul 2019 13:53:39 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 3 Jul 2019 13:56:41 +0000
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 3 Jul 2019 13:56:41 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3361.namprd18.prod.outlook.com (10.255.138.13) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Wed, 3 Jul 2019 13:56:39 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Wed, 3 Jul 2019
 13:56:39 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
Thread-Topic: [PATCH v2 1/5] x86/cpuidle: switch to uniform meaning of
 "max_cstate="
Thread-Index: AQHVMaciOCm3K0qOuEGofNQ0Mi96Tw==
Date: Wed, 3 Jul 2019 13:56:39 +0000
Message-ID: <3466381c-9c86-5166-95f0-8a77b392bfa7@suse.com>
References: <0dbf8520-89c7-753e-c10a-13399aec9cd5@suse.com>
 <0f8bb5dd-718c-7226-db4c-b57ee7089735@suse.com>
 <e735f34e-f8b2-ff15-ea3f-943efc83b23a@bitdefender.com>
 <d6778530-3f10-9ab1-cddf-c46786680d63@suse.com>
 <6a40c5fc-85a9-b91b-e2ee-95cee279d77b@bitdefender.com>
In-Reply-To: <6a40c5fc-85a9-b91b-e2ee-95cee279d77b@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0011.eurprd07.prod.outlook.com
 (2603:10a6:6:2d::21) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b3db773b-fcdd-4c97-c55f-08d6ffbe454b
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3361; 
x-ms-traffictypediagnostic: BY5PR18MB3361:
x-microsoft-antispam-prvs: <BY5PR18MB3361B11086BA8CDADCBD8A27B3FB0@BY5PR18MB3361.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(346002)(136003)(376002)(366004)(39860400002)(199004)(189003)(486006)(80792005)(25786009)(14454004)(54906003)(31686004)(6116002)(3846002)(68736007)(66476007)(66556008)(64756008)(66446008)(256004)(316002)(72206003)(66946007)(5660300002)(73956011)(478600001)(6436002)(26005)(386003)(7736002)(6506007)(53546011)(476003)(36756003)(229853002)(102836004)(11346002)(2906002)(6486002)(2616005)(66066001)(446003)(186003)(52116002)(6246003)(86362001)(8936002)(6916009)(4326008)(81166006)(81156014)(76176011)(71200400001)(6512007)(71190400001)(8676002)(53936002)(99286004)(305945005)(31696002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3361;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uebHnQLLCAEXfZN0d5ANLVSdz4Vxi3zwo+Y13tGFtParlTmIgGp6tonr5eyStnDOFNXEsghKT+nfWVcpwFmLyuLVB46+s5K79TqZZMRIuOxUugB2oGoWCTvOCDqvV5R1UJPCAxwNSWAgyYyfwPsT4JZ7B84Nkihxe6dVhZP3Zfkdr/HDAdelkAM+pwc2lpvcfDLAJh6ucdBzV/8dVurZZBrB51K+WWMNd+ObybbWr5hNba+5VvKvbQRWegE1IVY76bXtCO526mPOy6Rbdh/nQRi37iCsbuvQ+8aHyONetRbeBfUzPVHbf3CdjxnwR6/eDcjjsHoouou1NIrheR/WewD7hlSTs5pz1FcHZtTD7sPXg4KYtxAQDI+i24ZHAsNZt80Uoj0GiqSb3w3sd3df0ulD3JPnHFLzHkcMxxS3PnA=
Content-ID: <1CD60E4D36211742A21D86E2B96417AE@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b3db773b-fcdd-4c97-c55f-08d6ffbe454b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 13:56:39.3005 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3361
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 1/5] x86/cpuidle: switch to uniform
 meaning of "max_cstate="
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Ian Jackson <ian.jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDcuMjAxOSAxNTozNSwgQWxleGFuZHJ1IFN0ZWZhbiBJU0FJTEEgd3JvdGU6DQo+IA0K
PiANCj4gT24gMDMuMDcuMjAxOSAxNjoyNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAwMy4w
Ny4yMDE5IDE1OjIyLCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+Pj4gLS0tIGEv
eGVuL2FyY2gveDg2L2NwdS9td2FpdC1pZGxlLmMNCj4+Pj4gKysrIGIveGVuL2FyY2gveDg2L2Nw
dS9td2FpdC1pZGxlLmMNCj4+Pj4gQEAgLTczMSw3ICs3MzEsOCBAQCBzdGF0aWMgdm9pZCBtd2Fp
dF9pZGxlKHZvaWQpDQo+Pj4+ICAgICAgIAkJfSB3aGlsZSAoY3gtPnR5cGUgPiBtYXhfY3N0YXRl
ICYmIC0tbmV4dF9zdGF0ZSk7DQo+Pj4+ICAgICAgIAkJaWYgKCFuZXh0X3N0YXRlKQ0KPj4+PiAg
ICAgICAJCQljeCA9IE5VTEw7DQo+Pj4+IC0JCW1lbnVfZ2V0X3RyYWNlX2RhdGEoJmV4cCwgJnBy
ZWQpOw0KPj4+PiArCQllbHNlIGlmICh0Yl9pbml0X2RvbmUpDQo+Pj4+ICsJCQltZW51X2dldF90
cmFjZV9kYXRhKCZleHAsICZwcmVkKTsNCj4+Pg0KPj4+IFN0eWxlID8/DQo+Pg0KPj4gSSBkb24n
dCBzZWUgYW55IHN0eWxlIHZpb2xhdGlvbiBoZXJlLCBjb21wYXJpbmcgd2l0aCBuZWlnaGJvcmlu
Zw0KPj4gY29kZS4gUGxlYXNlIGNsYXJpZnkuDQo+Pg0KPiANCj4gSSBzYXcgdGhhdCB0aGF0IGZp
bGUgaGFzIGEgZGlmZmVyZW50IHNwYWNpbmcgb24gaWYvd2hpbGUgYnV0IEkgbG9va2VkIGluDQo+
IHRoZSBkaXJlY3RvcnkgKGFyY2gvOHg2L2NwdSkgYW5kIHRoZXJlIGlzIGEgc3R5bGUgbWl4IGxp
a2UgaW4NCj4gdnBtdS5jL3NoYW5naGFpLmMvdnBtdV9hbWQuYy92bXB1X2ludGVsLmMgdnMgdGhl
IHJlc3QuIEkgd2FzIHRoaW5raW5nDQo+IHRoYXQgdGhlIG5ldyBjb2RlIHNob3VsZCBiZSB3aXRo
IHRoZSBuZXcgcnVsZXMuDQoNClN1Y2ggc3R5bGUgY29uc2lkZXJhdGlvbiBpcyBnZW5lcmFsbHkg
dG8gYmUgYXBwbGllZCBwZXItZmlsZS4gVGhlcmUNCmFyZSBiYWQgZXhhbXBsZXMgd2hlcmUgc3R5
bGVzIGFyZSBldmVuIG1peGVkIHdpdGhpbiBhIGZpbGUsIHllcy4gSW4NCnRoZSBjYXNlIGhlcmUg
dGhvdWdoIHRoZSBMaW51eCBzdHlsZSB3YXMgcmV0YWluZWQgdG8gZWFzZSB0aGUgcG9ydGluZw0K
b3ZlciBvZiBMaW51eCBzaWRlIGNoYW5nZXMuDQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
