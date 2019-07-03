Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75DA55E2DB
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 13:36:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hidWA-0004U3-Vs; Wed, 03 Jul 2019 11:33:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vZpq=VA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hidW9-0004Ty-L8
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 11:33:41 +0000
X-Inumbo-ID: 6667ceea-9d86-11e9-bb4a-8b1e508ad258
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6667ceea-9d86-11e9-bb4a-8b1e508ad258;
 Wed, 03 Jul 2019 11:33:38 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Wed,  3 Jul 2019 11:33:35 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 3 Jul 2019 11:29:34 +0000
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 3 Jul 2019 11:29:34 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3315.namprd18.prod.outlook.com (10.255.139.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.18; Wed, 3 Jul 2019 11:29:33 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Wed, 3 Jul 2019
 11:29:33 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: =?utf-8?B?UGluZ8KyOiBbUEFUQ0ggMS8yXSBjb3JlLXBhcmtpbmc6IGludGVyYWN0IHdp?=
 =?utf-8?Q?th_runtime_SMT-disabling?=
Thread-Index: AQHVMZKWlpt1i1ivn0Sb2EdBXebWCQ==
Date: Wed, 3 Jul 2019 11:29:33 +0000
Message-ID: <1ec72a90-76d1-2c81-8d6e-c585ba9ce238@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB8PR09CA0010.eurprd09.prod.outlook.com
 (2603:10a6:10:a0::23) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 87479303-be85-4672-1fc7-08d6ffa9b89a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3315; 
x-ms-traffictypediagnostic: BY5PR18MB3315:
x-microsoft-antispam-prvs: <BY5PR18MB3315E90B82079BD3ED66C258B3FB0@BY5PR18MB3315.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(376002)(346002)(396003)(366004)(39860400002)(189003)(199004)(256004)(476003)(54906003)(486006)(6436002)(2906002)(53546011)(6506007)(2616005)(6486002)(386003)(68736007)(26005)(14444005)(99286004)(52116002)(102836004)(53936002)(3846002)(81156014)(81166006)(316002)(71190400001)(6916009)(14454004)(71200400001)(36756003)(8936002)(31686004)(6512007)(6116002)(186003)(86362001)(7736002)(31696002)(66066001)(305945005)(66946007)(66446008)(80792005)(66556008)(66476007)(64756008)(25786009)(4326008)(73956011)(5660300002)(72206003)(478600001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3315;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3kpoT4ZEYAiJ1BafgQbZA8xji0rGbfrP6ZLc388ZJmzc5ZnotT960tZ6qyVF/kITWRsDwLBvDnVUhDfCo0Bz9nDUFOQVxi5m4REt6Fypz2P0EJ4apBV7wJsVYTu3KFL54kfy16rQ5NLITRMzNYlvbNFh66j4ZWiODqUXggeivFGzRlTuCN25ZIt8TgijzzhER3eMm+MQNBO3k+Sa0uy4qvJnfz72vkM9awlF2oGwHcZIjBiFl4XIGElkKDhQ6frmq5NU7EOWBqK7s8CA6uwmWYIX2qHAjmJeYmMQM3bVVZltPUYFHdOEmofTsitMsOgRd+v7s6mnMMcAOq5TIce7touwHssEWcLP9I6TaNYb1E+2PZuUuj7UUsFKmNXy+rkwqbM7g9Ykow+k1qPNTKy2kTmUk5CHs4Fxb6AE346R26c=
Content-ID: <75B165DFB8EBB845A60361B336C6A0EA@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 87479303-be85-4672-1fc7-08d6ffa9b89a
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 11:29:33.4686 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3315
X-OriginatorOrg: suse.com
Subject: [Xen-devel] =?utf-8?q?Ping=C2=B2=3A_=5BPATCH_1/2=5D_core-parking?=
 =?utf-8?q?=3A_interact_with_runtime_SMT-disabling?=
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien
 Grall <julien.grall@arm.com>, Ian Jackson <ian.jackson@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDI3LjA1LjE5IGF0IDExOjM2LCAgd3JvdGU6DQo+Pj4+IE9uIDEyLjA0LjE5IGF0IDEz
OjQxLCAgd3JvdGU6DQo+ID4+Pj4gT24gMTEuMDQuMTkgYXQgMjE6MDYsIDxhbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tPiB3cm90ZToNCj4gPiA+IE9uIDExLzA0LzIwMTkgMTM6NDUsIEphbiBCZXVs
aWNoIHdyb3RlOg0KPiA+ID4+IFdoZW4gZGlzYWJsaW5nIFNNVCBhdCBydW50aW1lLCBzZWNvbmRh
cnkgdGhyZWFkcyBzaG91bGQgbm8gbG9uZ2VyIGJlDQo+ID4gPj4gY2FuZGlkYXRlcyBmb3IgYnJp
bmdpbmcgYmFjayB1cCBpbiByZXNwb25zZSB0byBfUFVEIEFDUEkgZXZlbnRzLiBQdXJnZQ0KPiA+
ID4+IHRoZW0gZnJvbSB0aGUgdHJhY2tpbmcgYXJyYXkuDQo+ID4gPj4NCj4gPiA+PiBEb2luZyBz
byBpbnZvbHZlcyBhZGRpbmcgbG9ja2luZyB0byBndWFyZCBhY2NvdW50aW5nIGRhdGEgaW4gdGhl
IGNvcmUNCj4gPiA+PiBwYXJraW5nIGNvZGUuIFdoaWxlIGFkZGluZyB0aGUgZGVjbGFyYXRpb24g
Zm9yIHRoZSBsb2NrIHRha2UgdGhlIGxpYmVydHkNCj4gPiA+PiB0byBkcm9wIHR3byB1bm5lY2Vz
c2FyeSBmb3J3YXJkIGZ1bmN0aW9uIGRlY2xhcmF0aW9ucy4NCj4gPiA+Pg0KPiA+ID4+IFNpZ25l
ZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4NCj4gPiA+IA0KPiA+ID4g
SSBjYW4gY2VydGFpbmx5IGFwcHJlY2lhdGUgdGhlc2UgYXJndW1lbnRzLCBidXQgc3VyZWx5IHRo
ZSBjb252ZXJzZSBpcw0KPiA+ID4gdHJ1ZS4gIFdoZW4gU01ULWVuYWJsZSBpcyB1c2VkLCB0aGUg
bmV3bHktb25saW5lZCB0aHJlYWRzIGFyZSBub3cNCj4gPiA+IGVsaWdpYmxlIHRvIGJlIHBhcmtl
ZC4NCj4gPiANCj4gPiBBbmQgbm90aGluZyB3aWxsIGtlZXAgdGhlbSBmcm9tIGdldHRpbmcgcGFy
a2VkLg0KPiA+IA0KPiA+ID4gQXQgdGhlIG1vbWVudCwgdGhpcyBsb29rcyBhc3ltZXRyaWMuDQo+
ID4gDQo+ID4gSXQgZG9lcywgYnV0IHRoYXQncyBhIHJlc3VsdCBvZiBjb3JlX3BhcmtpbmcuYyBv
bmx5IHJlY29yZGluZyBDUFVzDQo+ID4gaXQgaGFzIHBhcmtlZCwgbm90IG9uZXMgaXQgY291bGQg
cGFyay4NCj4gDQo+IERpZCBteSByZXNwb25zZXMgYWRkcmVzcyB5b3VyIGNvbmNlcm5zPw0KPiAN
Cj4gSmFuDQo+IA0KPiANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
