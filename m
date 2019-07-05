Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63923605CB
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 14:15:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjN5d-0005oa-Ug; Fri, 05 Jul 2019 12:13:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hVvi=VC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hjN5c-0005oV-3C
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 12:13:20 +0000
X-Inumbo-ID: 44fb761e-9f1e-11e9-a937-abcca36b5004
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 44fb761e-9f1e-11e9-a937-abcca36b5004;
 Fri, 05 Jul 2019 12:13:17 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Fri,  5 Jul 2019 12:12:53 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 5 Jul 2019 12:12:10 +0000
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 5 Jul 2019 12:12:10 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3411.namprd18.prod.outlook.com (10.255.139.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Fri, 5 Jul 2019 12:12:09 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.019; Fri, 5 Jul 2019
 12:12:09 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <paul.durrant@citrix.com>
Thread-Topic: [PATCH v2 1/2] xmalloc: remove struct xmem_pool init_region
Thread-Index: AQHVMxBz28IggZ2JQEOAds0i1oN8iaa775SA
Date: Fri, 5 Jul 2019 12:12:09 +0000
Message-ID: <3f8e7d14-e0b7-6d4b-6fd4-aabffc644257@suse.com>
References: <20190705090249.1935-1-paul.durrant@citrix.com>
 <20190705090249.1935-2-paul.durrant@citrix.com>
In-Reply-To: <20190705090249.1935-2-paul.durrant@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0202CA0029.eurprd02.prod.outlook.com
 (2603:10a6:4:a5::15) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 37419a42-53bc-427f-c8d4-08d7014200f0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3411; 
x-ms-traffictypediagnostic: BY5PR18MB3411:
x-microsoft-antispam-prvs: <BY5PR18MB3411734BA63AD4D02EEAA893B3F50@BY5PR18MB3411.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 008960E8EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(136003)(366004)(396003)(346002)(376002)(189003)(199004)(36756003)(7416002)(14444005)(68736007)(446003)(53936002)(478600001)(8936002)(81156014)(81166006)(6436002)(6512007)(8676002)(66446008)(66556008)(2616005)(64756008)(11346002)(5660300002)(476003)(66476007)(486006)(80792005)(66946007)(2906002)(73956011)(256004)(86362001)(31696002)(386003)(99286004)(52116002)(53546011)(6506007)(26005)(102836004)(6246003)(186003)(54906003)(316002)(71190400001)(71200400001)(76176011)(7736002)(66066001)(25786009)(229853002)(6116002)(14454004)(6486002)(72206003)(305945005)(31686004)(6916009)(3846002)(4326008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3411;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tHhRPj7LuMGeYqw4vAEfQLjlRX1yJd3niI9LuSaXf+jhNXwK+Wj8YL7FkizaGa4pkNZPp5v9Y87ZEXYNjXNue2Lc2Jp4kVIhDw+qv123fKRgVBoCnAw8KVJ5zV5aWovten14Bg5NTLCHfoR784T2Mf/3EzHKtX2ZKeb8yMZuWOwQjkzQJ/bgcKiAvvxLirph/DQPFQ0h9GZHHf6HBILb7bwKqHPxPqvznqb2nrtFyZ8ocXAT1tHRNhDJ4zAwfTbEObvCO7NjPYd9uht+DLLdcFEn180x7nf9QfcDQmM6vQn1wuHKdEuC4HFpplmXoogcKgDYIDvxRti3zqrh5ZqMr11YcqEq+TVLb5Yqo04bAgAmFqf75uHM/l7mBi+W/zlhFm1yJ8ww5FZKdrynlH9wz3WOAOls7s3K3S57a9wlYi0=
Content-ID: <68E9D680AB3212489A3315AED04049BF@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 37419a42-53bc-427f-c8d4-08d7014200f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2019 12:12:09.3612 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3411
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 1/2] xmalloc: remove struct xmem_pool
 init_region
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

T24gMDUuMDcuMjAxOSAxMTowMiwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiBUaGlzIHBhdGNoIGRp
c3BlbnNlcyB3aXRoIHRoZSBpbml0X3JlZ2lvbi4gSXQncyBzaW1wbHkgbm90IG5lY2Vzc2FyeQ0K
PiAocG9vbHMgd2lsbCBzdGlsbCBoYXBwaWx5IGdyb3cgYW5kIHNocmluayBvbiBkZW1hbmQgaW4g
aXRzIGFic2VuY2UpIGFuZCB0aGUNCj4gY29kZSBjYW4gYmUgc2hvcnRlbmRlZCBieSByZW1vdmlu
ZyBpdC4gSXQgYWxzbyBhdm9pZHMgdGhlIHNvbGUgZXZhbHVhdGlvbg0KPiBvZiBBRERfUkVHSU9O
IHdpdGhvdXQgaG9sZGluZyB0aGUgcG9vbCBsb2NrICh3aGljaCBpcyB1bnNhZmUpLg0KDQpPaCwg
c28geW91J3ZlIGZpZ3VyZWQgdGhlcmUgY2FuIGJlIGV2ZW4gbW9yZSBjb2RlIHJlbW92ZWQgdGhh
bg0Kd2UgZmlyc3QgdGhvdWdodC4gTmljZS4NCg0KPiBAQCAtMzUyLDEzICszNDMsNiBAQCB2b2lk
IHhtZW1fcG9vbF9kZXN0cm95KHN0cnVjdCB4bWVtX3Bvb2wgKnBvb2wpDQo+ICAgICAgIGlmICgg
cG9vbCA9PSBOVUxMICkNCj4gICAgICAgICAgIHJldHVybjsNCj4gICANCj4gLSAgICAvKiBVc2Vy
IGlzIGRlc3Ryb3lpbmcgd2l0aG91dCBldmVyIGFsbG9jYXRpbmcgZnJvbSB0aGlzIHBvb2wgKi8N
Cj4gLSAgICBpZiAoIHhtZW1fcG9vbF9nZXRfdXNlZF9zaXplKHBvb2wpID09IEJIRFJfT1ZFUkhF
QUQgKQ0KPiAtICAgIHsNCj4gLSAgICAgICAgQVNTRVJUKCFwb29sLT5pbml0X3JlZ2lvbik7DQo+
IC0gICAgICAgIHBvb2wtPnVzZWRfc2l6ZSAtPSBCSERSX09WRVJIRUFEOw0KPiAtICAgIH0NCg0K
SSBjYW4gc2VlIHRoYXQgdGhlIEFTU0VSVCgpIGNhbiAoYW5kIG5lZWRzIHRvKSBnbyBhd2F5LiBC
dXQgSQ0KZG9uJ3QgdGhpbmsgeW91J3ZlIGNoYW5nZWQgYW55dGhpbmcgZWxzZXdoZXJlIHRoYXQg
d291bGQgYWxzbw0KYWxsb3cgdGhlIGVudGlyZSBpZigpIHRvIGdvIGF3YXkuDQoNCj4gQEAgLTM4
MCwxNCArMzY0LDYgQEAgdm9pZCAqeG1lbV9wb29sX2FsbG9jKHVuc2lnbmVkIGxvbmcgc2l6ZSwg
c3RydWN0IHhtZW1fcG9vbCAqcG9vbCkNCj4gICAgICAgaW50IGZsLCBzbDsNCj4gICAgICAgdW5z
aWduZWQgbG9uZyB0bXBfc2l6ZTsNCj4gICANCj4gLSAgICBpZiAoIHBvb2wtPmluaXRfcmVnaW9u
ID09IE5VTEwgKQ0KPiAtICAgIHsNCj4gLSAgICAgICAgaWYgKCAocmVnaW9uID0gcG9vbC0+Z2V0
X21lbShwb29sLT5pbml0X3NpemUpKSA9PSBOVUxMICkNCj4gLSAgICAgICAgICAgIGdvdG8gb3V0
Ow0KPiAtICAgICAgICBBRERfUkVHSU9OKHJlZ2lvbiwgcG9vbC0+aW5pdF9zaXplLCBwb29sKTsN
Cj4gLSAgICAgICAgcG9vbC0+aW5pdF9yZWdpb24gPSByZWdpb247DQo+IC0gICAgfQ0KDQpJLmUu
IHRoZSBjb2RlIGZ1cnRoZXIgZG93biBpbiB0aGlzIGZ1bmN0aW9uIHR1cm5lZCBvdXQgdG8gbm90
DQpkZXBlbmQgb24gdGhlcmUgYmVpbmcgYXQgbGVhc3Qgb25lIHJlZ2lvbiBpbiB0aGUgcG9vbCwg
b3RoZXINCnRoYW4gSSB3YXMgYWZyYWlkIGl0IHdvdWxkLiBHb29kIC0gZXZlbiBtb3JlIHByZXR0
eSBhIGNoYW5nZS4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9q
ZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVu
LWRldmVs
