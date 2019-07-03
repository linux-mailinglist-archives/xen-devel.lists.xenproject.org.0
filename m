Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C142E5E1BD
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 12:11:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hicBV-0004pA-Lq; Wed, 03 Jul 2019 10:08:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vZpq=VA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hicBU-0004p0-KL
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 10:08:16 +0000
X-Inumbo-ID: 78a2a914-9d7a-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 78a2a914-9d7a-11e9-8980-bc764e045a96;
 Wed, 03 Jul 2019 10:08:15 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Wed,  3 Jul 2019 10:04:38 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 3 Jul 2019 10:07:27 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 3 Jul 2019 10:07:27 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3379.namprd18.prod.outlook.com (10.255.136.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Wed, 3 Jul 2019 10:07:26 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Wed, 3 Jul 2019
 10:07:26 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <paul.durrant@citrix.com>
Thread-Topic: [PATCH 3/3] xmalloc: add a Kconfig option to poison free pool
 memory
Thread-Index: AQHVMPSuTJM1FEdCsEKYeXW3T8M8M6a4rEiA
Date: Wed, 3 Jul 2019 10:07:26 +0000
Message-ID: <c9b1bae0-1baf-c633-006a-bd223b0f3743@suse.com>
References: <20190702163840.2107-1-paul.durrant@citrix.com>
 <20190702163840.2107-4-paul.durrant@citrix.com>
In-Reply-To: <20190702163840.2107-4-paul.durrant@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0601CA0043.eurprd06.prod.outlook.com
 (2603:10a6:4:17::29) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f54aca04-5b6e-4240-d70b-08d6ff9e3fee
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:BY5PR18MB3379; 
x-ms-traffictypediagnostic: BY5PR18MB3379:
x-microsoft-antispam-prvs: <BY5PR18MB337947A2D0A6F5144212ABCBB3FB0@BY5PR18MB3379.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(136003)(346002)(39860400002)(366004)(376002)(199004)(189003)(2616005)(476003)(4326008)(66066001)(36756003)(99286004)(446003)(11346002)(256004)(486006)(66476007)(66946007)(66556008)(66446008)(6916009)(4744005)(31696002)(86362001)(478600001)(25786009)(71190400001)(5660300002)(6246003)(64756008)(73956011)(2906002)(71200400001)(6116002)(68736007)(6506007)(53546011)(6486002)(102836004)(76176011)(7736002)(8936002)(14454004)(229853002)(6512007)(7416002)(52116002)(53936002)(6436002)(316002)(186003)(81156014)(81166006)(31686004)(26005)(80792005)(54906003)(386003)(3846002)(72206003)(8676002)(305945005);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3379;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lQi4VveqzP4poVRAfArsejvt6ZWT6umx19MpbZGVhWgC2t3fdGZWADP/hfS9sa+b8mmbvNjRJgf+JGgaqFaGG1xlJGAGn/gpj5eucQpk2B2eDQilmpHgIR9xx78DXJQqtRmrY3uWhG8PKlUA/pqzmVCX8MINnwg2g5smHU1eqpnHRhwC++Sg9i3+RvbGHxzWjditfIHTrj6BKp/s/a5RiS1xSD/XmMDjCIpcK6o7ABn02v3cKhavzeLcTFf3RR3YjjicOHrLouMXu6qWemOicfb4nyp8CVJvmtj9UxFCTJdWlS8/7NtaWvS0Ne6/AXCuxGrk2mBCNdo8FSHoDq0agGbaprKt8IVgcxik6jlIJd7RG+HSf5I4XvtfeDjBK30U+4WBMAyAqj0FvfUb7H+Q/ciJd6jPDFi0QSNLkTlfSZ0=
Content-ID: <B632A0EFCA34E74DAD06AFB8020C3BE8@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f54aca04-5b6e-4240-d70b-08d6ff9e3fee
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 10:07:26.4855 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3379
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 3/3] xmalloc: add a Kconfig option to poison
 free pool memory
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei
 Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>, Julien
 Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDcuMjAxOSAxODozOCwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiAtLS0gYS94ZW4vS2Nv
bmZpZy5kZWJ1Zw0KPiArKysgYi94ZW4vS2NvbmZpZy5kZWJ1Zw0KPiBAQCAtMTA1LDYgKzEwNSwx
MyBAQCBjb25maWcgREVCVUdfVFJBQ0UNCj4gICAJICBlaXRoZXIgZGlyZWN0bHkgdG8gdGhlIGNv
bnNvbGUgb3IgYXJlIHByaW50ZWQgdG8gY29uc29sZSBpbiBjYXNlIG9mDQo+ICAgCSAgYSBzeXN0
ZW0gY3Jhc2guDQo+ICAgDQo+ICtjb25maWcgUE9PTF9QT0lTT04NCg0KTWF5IEkgc3VnZ2VzdCB0
aGlzIHRvIGJlY29tZSBYTUVNX1BPT0xfUE9JU09OLCB0byBwYXJhbGxlbCB0aGUgbmFtZXMNCm9m
IHRoZSBpbnZvbHZlZCBmdW5jdGlvbnM/DQoNCj4gQEAgLTI0MCw2ICsyNDQsMTAgQEAgc3RhdGlj
IGlubGluZSB2b2lkIEVYVFJBQ1RfQkxPQ0soc3RydWN0IGJoZHIgKmIsIHN0cnVjdCB4bWVtX3Bv
b2wgKnAsIGludCBmbCwNCj4gICAgICAgICAgIH0NCj4gICAgICAgfQ0KPiAgICAgICBiLT5wdHIu
ZnJlZV9wdHIgPSAoc3RydWN0IGZyZWVfcHRyKSB7TlVMTCwgTlVMTH07DQo+ICsjaWZkZWYgQ09O
RklHX1BPT0xfUE9JU09ODQo+ICsgICAgZm9yICggaSA9IE1JTl9CTE9DS19TSVpFOyBpIDwgKGIt
PnNpemUgJiBCTE9DS19TSVpFX01BU0spOyBpKysgKQ0KPiArICAgICAgICBBU1NFUlQoYi0+cHRy
LmJ1ZmZlcltpXSA9PSAweEFBKTsNCj4gKyNlbmRpZiAvKiBDT05GSUdfUE9PTF9QT0lTT04gKi8N
Cg0KTWF5IEkgZnVydGhlciBzdWdnZXN0IHRoYXQgd2UgY2xvbmUgTGludXgnZXMgbWVtY2hyX2lu
digpIGZvciB0aGlzDQpwdXJwb3NlIChwZXJoYXBzIHdpdGggYSBtb3JlIHNpbXBsaXN0aWMgaW1w
bGVtZW50YXRpb24gYWxvbmcgdGhlDQpsaW5lcyBvZiBtZW1jaHIoKSk/IFdlIHNob3VsZCB0aGVu
IGFsc28gdXNlIGl0IGluIGNoZWNrX29uZV9wYWdlKCkuDQoNCkphbg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
