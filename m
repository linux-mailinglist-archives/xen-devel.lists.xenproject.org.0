Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F2F25E88A
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 18:15:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hihqr-0005bF-0y; Wed, 03 Jul 2019 16:11:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vZpq=VA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hihqp-0005ai-LX
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 16:11:19 +0000
X-Inumbo-ID: 2cf7d736-9dad-11e9-8980-bc764e045a96
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 2cf7d736-9dad-11e9-8980-bc764e045a96;
 Wed, 03 Jul 2019 16:11:18 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Wed,  3 Jul 2019 16:10:51 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 3 Jul 2019 16:05:41 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 3 Jul 2019 16:05:41 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3139.namprd18.prod.outlook.com (10.255.136.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.16; Wed, 3 Jul 2019 16:05:39 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Wed, 3 Jul 2019
 16:05:39 +0000
From: Jan Beulich <JBeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v9 00/23] x86emul: remaining AVX512 support
Thread-Index: AQHVL/4BusDdmQSOHUaMCbTXiIXEsKa5Ek2A
Date: Wed, 3 Jul 2019 16:05:39 +0000
Message-ID: <190177bc-7b63-ce7c-2f29-bd37eeee43a9@suse.com>
References: <f69ca82f-e2db-e85e-ff98-2060a8dc28a5@suse.com>
In-Reply-To: <f69ca82f-e2db-e85e-ff98-2060a8dc28a5@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB7PR05CA0033.eurprd05.prod.outlook.com
 (2603:10a6:10:36::46) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ad94c46c-bd44-4a22-bbdd-08d6ffd04ab7
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3139; 
x-ms-traffictypediagnostic: BY5PR18MB3139:
x-microsoft-antispam-prvs: <BY5PR18MB313990BEF77DA6A77FCAB1BCB3FB0@BY5PR18MB3139.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(376002)(39860400002)(396003)(346002)(366004)(189003)(199004)(316002)(256004)(229853002)(186003)(99286004)(52116002)(14444005)(76176011)(102836004)(68736007)(14454004)(81156014)(31696002)(71190400001)(478600001)(81166006)(86362001)(71200400001)(2906002)(66446008)(66476007)(64756008)(72206003)(66556008)(5660300002)(8676002)(66066001)(2501003)(26005)(73956011)(66946007)(80792005)(6246003)(8936002)(4326008)(25786009)(31686004)(7736002)(305945005)(3846002)(6116002)(2351001)(54906003)(11346002)(446003)(2616005)(476003)(6916009)(486006)(36756003)(6436002)(6486002)(386003)(6506007)(53546011)(5640700003)(6512007)(53936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3139;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: BBSwOlcJaex1YGZ37WfXyLanx+dsTJKBFhBxKkniny34fjxVRW8uVmfIa/ZRMlfqO8bNO0e2HJbme3hVdTHKZN0ikLelJ4DG3NB4ZGVMVzpR/r0M/k55WkOK7p73jTfmbme0ySnnc7HjgEeN4X1LkhPdKE5UgjszZ4Hv1qPbLv1ymcbwTxGPQQolgfsLul1/WmJOD90RidhhzSaSTubPAQ8glxH7EE1MIjmjMNFj3tbmjcDzm9GVmdr/igYOixq2wCpTJzkkgMo0Ek9sSVxVzqbVLNqgkoCZs+mclZmiOGIRgWnF7ZWfmeo2NjRTil9Qhzrt2KUVPRpwcwsMWYWgnyDpmPVd/tumae///c3OBfYvtQIThq0DZy9q6DG/Eujc9ehPHb2gAN2meb2hh8Z3I1BBBw2icx2/eWkYOkeSRP0=
Content-ID: <D1DF93780B15074B92AC81AF7EEF8A18@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ad94c46c-bd44-4a22-bbdd-08d6ffd04ab7
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 16:05:39.6026 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3139
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v9 00/23] x86emul: remaining AVX512 support
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 RogerPau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDEuMDcuMjAxOSAxMzoxMywgSmFuIEJldWxpY2ggd3JvdGU6DQo+IFRoaXMgZ29lcyBvbiB0
b3Agb2YgIng4NmVtdWw6IGF2b2lkIHNwZWN1bGF0aXZlIG91dCBvZiBib3VuZHMNCj4gYWNjZXNz
ZXMiLCBvciBlbHNlIHRoZXJlJ3MgYSBjb25mbGljdCBpbiBhdCBsZWFzdCB0aGUgImdhdGhlciIg
cGF0Y2gNCj4gaGVyZS4NCj4gDQo+IDAxOiBzdXBwb3J0IEFWWDUxMntGLF9WQk1JMn0gY29tcHJl
c3MvZXhwYW5kIGluc25zDQo+IDAyOiBzdXBwb3J0IHJlbWFpbmluZyBtaXNjIEFWWDUxMntGLEJX
fSBpbnNucw0KPiAwMzogcHJlcGFyZSBmb3IgQVZYNTEyRiBTL0cgaW5zbnMNCj4gMDQ6IHRlc3Qg
aGFybmVzcyBhZGp1c3RtZW50cyBmb3IgQVZYNTEyRiBTL0cgaW5zbnMNCj4gMDU6IHN1cHBvcnQg
QVZYNTEyRiBnYXRoZXIgaW5zbnMNCj4gMDY6IGFkZCBoaWdoIHJlZ2lzdGVyIFMvRyB0ZXN0IGNh
c2VzDQo+IDA3OiBzdXBwb3J0IEFWWDUxMkYgc2NhdHRlciBpbnNucw0KPiAwODogc3VwcG9ydCBB
Vlg1MTJQRiBpbnNucw0KPiAwOTogc3VwcG9ydCBBVlg1MTJDRCBpbnNucw0KPiAxMDogY29tcGxl
dGUgc3VwcG9ydCBvZiBBVlg1MTJfVkJNSSBpbnNucw0KPiAxMTogc3VwcG9ydCBvZiBBVlg1MTIq
IHBvcHVsYXRpb24gY291bnQgaW5zbnMNCj4gMTI6IHN1cHBvcnQgb2YgQVZYNTEyX0lGTUEgaW5z
bnMNCj4gMTM6IHN1cHBvcnQgcmVtYWluaW5nIEFWWDUxMl9WQk1JMiBpbnNucw0KPiAxNDogc3Vw
cG9ydCBBVlg1MTJfNEZNQVBTIGluc25zDQo+IDE1OiBzdXBwb3J0IEFWWDUxMl80Vk5OSVcgaW5z
bnMNCj4gMTY6IHN1cHBvcnQgQVZYNTEyX1ZOTkkgaW5zbnMNCj4gMTc6IHN1cHBvcnQgVlBDTE1V
TFFEUSBpbnNucw0KPiAxODogc3VwcG9ydCBWQUVTIGluc25zDQo+IDE5OiBzdXBwb3J0IEdGTkkg
aW5zbnMNCj4gMjA6IHJlc3RvcmUgb3JkZXJpbmcgd2l0aGluIG1haW4gc3dpdGNoIHN0YXRlbWVu
dA0KPiAyMTogYWRkIGFuIEFFUy9WQUVTIHRlc3QgY2FzZSB0byB0aGUgaGFybmVzcw0KPiAyMjog
YWRkIGEgU0hBIHRlc3QgY2FzZSB0byB0aGUgaGFybmVzcw0KPiAyMzogYWRkIGEgUENMTVVML1ZQ
Q0xNVUwgdGVzdCBjYXNlIHRvIHRoZSBoYXJuZXNzDQoNCkkgcmVhbGl6ZSBJJ3ZlIHNlbnQgcGF0
Y2ggMTcgYSBzZWNvbmQgdGltZSBpbnN0ZWFkIG9mIHRoZSBjb3JyZWN0DQpwYXRjaCAyMy4gSSds
bCBzZW5kIHRoZSBjb3JyZWN0IG9uZSBpbiBhIG1pbnV0ZS4NCg0KSmFuDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0
Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qu
b3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
