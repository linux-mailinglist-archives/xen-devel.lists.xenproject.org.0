Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D70F55E228
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jul 2019 12:38:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hicbL-0007kH-Qo; Wed, 03 Jul 2019 10:34:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vZpq=VA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hicbK-0007kC-BG
 for xen-devel@lists.xenproject.org; Wed, 03 Jul 2019 10:34:58 +0000
X-Inumbo-ID: 32bd8ab0-9d7e-11e9-a486-a72d5378f64a
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 32bd8ab0-9d7e-11e9-a486-a72d5378f64a;
 Wed, 03 Jul 2019 10:34:56 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Wed,  3 Jul 2019 10:34:35 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 3 Jul 2019 10:34:45 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (15.124.8.14) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 3 Jul 2019 10:34:45 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3329.namprd18.prod.outlook.com (10.255.138.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.16; Wed, 3 Jul 2019 10:34:43 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::2005:4b02:1d60:d1bc%3]) with mapi id 15.20.2052.010; Wed, 3 Jul 2019
 10:34:43 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH v2 2/2] x86/traps: widen condition for logging
 top-of-stack
Thread-Index: AQHVMYkwcjc8Dr6fl02oECpK/6oOhKa4ssEA
Date: Wed, 3 Jul 2019 10:34:43 +0000
Message-ID: <2e2a1d5d-f04e-5400-6817-86a7985b1c9b@suse.com>
References: <5CF0ECE80200007800233D41@prv1-mh.provo.novell.com>
 <5D074AE60200007800238B5E@prv1-mh.provo.novell.com>
 <5D074BA30200007800238B6C@prv1-mh.provo.novell.com>
 <eb44801a-1081-858d-4853-6dc574e0c6d6@citrix.com>
In-Reply-To: <eb44801a-1081-858d-4853-6dc574e0c6d6@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0501CA0014.eurprd05.prod.outlook.com
 (2603:10a6:4:8f::24) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c80b2db7-807f-4460-bab8-08d6ffa20fab
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3329; 
x-ms-traffictypediagnostic: BY5PR18MB3329:
x-microsoft-antispam-prvs: <BY5PR18MB3329A44F0D73B84993D5EB10B3FB0@BY5PR18MB3329.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00872B689F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(136003)(39860400002)(376002)(346002)(396003)(199004)(189003)(66946007)(73956011)(66446008)(64756008)(66556008)(66476007)(6916009)(99286004)(102836004)(8676002)(6246003)(81166006)(8936002)(66066001)(81156014)(76176011)(256004)(5660300002)(2906002)(80792005)(53936002)(186003)(26005)(7736002)(52116002)(68736007)(71200400001)(86362001)(31696002)(36756003)(561944003)(305945005)(6116002)(71190400001)(31686004)(478600001)(72206003)(476003)(6512007)(6486002)(2616005)(25786009)(6436002)(486006)(11346002)(4326008)(446003)(386003)(54906003)(6506007)(14454004)(53546011)(229853002)(316002)(3846002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3329;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: TaFHCWQ/ZgtCvH99Svqlx5lX9PKYtaxzQHrnHtFbfPra+M0VNdRHVthvJxfDnwbgteccVDHmukNm4Ul6ZPfqtoe0MrXOIWsB8b1rl95iP9cjx/lFpyskeIw+u4BcsvsLPQ6g6MGHVNQ8l2yM4vigs5kECIgbSA314PbAJWkzR2f2BHs1O94QGl+2NDHKvzhthTwRPFL3FtflkG1NESJyzCIMHnhoZs/yrnx3nYn0yyUZX5e3sRVE+/1DvC0fJ+zK7F2J4lqblrbiuHZIFOt8flZMBWfyEqIF2NsHYkXfMo8qi/tq2gMD7tHtfvUKJJH14IM3q1+YO7y0sxHvp1WQyXxB9PpjTM40gPV9NcKKVnjBwU0qUI6LM5ClbQQLCgMo5+g/aoicLl1h6k6syQ8WqbAOfmlrEEHOATCifUnJ5zI=
Content-ID: <DA5738F1AFF2E44CACD130C1482806DB@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c80b2db7-807f-4460-bab8-08d6ffa20fab
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2019 10:34:43.4330 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3329
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 2/2] x86/traps: widen condition for
 logging top-of-stack
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, WeiLiu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDMuMDcuMjAxOSAxMjoyMSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMTcvMDYvMjAx
OSAwOToxMywgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBEZXNwaXRlIC1mbm8tb21pdC1mcmFtZS1w
b2ludGVyIHRoZSBjb21waWxlciBtYXkgb21pdCB0aGUgZnJhbWUgcG9pbnRlciwNCj4+IG9mdGVu
IGZvciByZWxhdGl2ZWx5IHNpbXBsZSBsZWFmIGZ1bmN0aW9ucy4NCj4gDQo+IEFjdHVhbGx5LCB0
aGUgcHJvYmxlbSBpcyBtb3JlIHdpZGVzcHJlYWQgdGhhbiB0aGlzLsKgIEZvciBldmVyeSBmdW5j
dGlvbiwNCj4gdGhlcmUgaXMgYSBub24temVybyBxdWFudGl0eSBvZiB0aW1lIGJldHdlZW4gdGhl
IGZ1bmN0aW9uIHN0YXJ0aW5nIGFuZA0KPiB0aGUgZnJhbWUgcG9pbnRlciBiZWluZyBzZXQgdXAu
DQo+IA0KPiBIb3dldmVyLCBoYWxmIG9mIHRoaXMgdGltZSBpcyBzcGVudCB3aXRoIHRoZSBvbGQg
JXJicCBvbiB0aGUgdG9wIG9mIHRoZQ0KPiBzdGFjaywgc28gd29uJ3QgYmVuZWZpdCBmcm9tIHRo
ZXNlIGNoYW5nZXMuDQoNCkkgdGhpbmsgdGhlIGNvbXBpbGVyIHR5cGljYWxseSBwYWlycyBwdXNo
ICVyYnAgYW5kIG1vdiAlcnNwLCAlcmJwLA0KYnV0IHRoaXMgcGFpciBtYXkgbm90IHNpdCBhdCB0
aGUgYmVnaW5uaW5nIG9mIHRoZSBmdW5jdGlvbi4gQW5kIGl0J3MNCnRoYXQgb3RoZXIgY29kZSB0
aGF0J3MgcHJvbmUgdG8gY3Jhc2guIFRoZSBwdXNoICVyYnAgbWF5IGFsc28gZmF1bHQNCihtb3N0
IG5vdGFibHkgZHVlIHRvIHN0YWNrIG92ZXJydW4pLCBidXQgdGhhdCB3b3VsZCB0aGVuIHN0aWxs
IGhhdmUNCnRoZSB0b3Agb2Ygc3RhY2sgY292ZXJlZCBieSB0aGUgY2hhbmdlIGhlcmUuIFRoZSBt
b3YgJXJzcCwgJXJicCwNCm90b2gsIHdvbid0IHBsYXVzaWJseSBmYXVsdC4gSU9XIEkgdGhpbmsg
aXQncyBmYXIgbW9yZSB0aGFuICJoYWxmIG9mDQp0aGUgdGltZSIgdGhhdCB0aGlzIGNoYW5nZSBo
ZWxwcy4NCg0KPj4gKFRvIGdpdmUgYSBzcGVjaWZpYyBleGFtcGxlLA0KPj4gdGhlIGNhc2UgSSd2
ZSBydW4gaW50byB0aGlzIHdpdGggaXMgX3BjaV9oaWRlX2RldmljZSgpIGFuZCBnY2MgOC4NCj4+
IEludGVyZXN0aW5nbHkgdGhlIGV2ZW4gbW9yZSBzaW1wbGUgbmVpZ2hib3JpbmcgaW9tbXVfaGFz
X2ZlYXR1cmUoKSBkb2VzDQo+PiBnZXQgYSBmcmFtZSBwb2ludGVyIHNldCB1cCwgYXJvdW5kIGp1
c3QgYSBzaW5nbGUgaW5zdHJ1Y3Rpb24uIEJ1dCB0aGlzDQo+PiBtYXkgYmUgYSByZXN1bHQgb2Yg
dGhlIHNpemUtb2YtYXNtKCkgZWZmZWN0cyBkaXNjdXNzZWQgZWxzZXdoZXJlLikNCj4+DQo+PiBM
b2cgdGhlIHRvcC1vZi1zdGFjayB2YWx1ZSBpZiBpdCBsb29rcyB2YWxpZCBfb3JfIGlmIFJJUCBs
b29rcyBpbnZhbGlkLg0KPiANCj4gVGhpcyBmYXIsIEknbSBoYXBweSB3aXRoLg0KPiANCj4+IEFs
c28gYW5ub3RhdGUgbm9uLWZyYW1lLXBvaW50ZXItYmFzZWQgc3RhY2sgdHJhY2UgZW50cmllcyB3
aXRoIGENCj4+IHF1ZXN0aW9uIG1hcmssIHRvIHNpZ25hbCBjbGVhcmx5IHRoYXQgYW55IG9uZSBv
ZiB0aGVtIG1heSBub3QgYWN0dWFsbHkNCj4+IGJlIHBhcnQgb2YgdGhlIGNhbGwgc3RhY2suDQo+
IA0KPiBJJ20gc3RpbGwgb3Bwb3NlZCB0byB0aGlzLsKgIFRoZSBpbnRyb2R1Y3Rpb24gb2YgPyBk
b2VzIG1vcmUgaGFybSB0aGFuDQo+IGdvb2QgSU1PLCBiZWNhdXNlIGl0IHNpbXBseSBjYW4ndCBi
ZSB0cnVzdGVkLg0KPiANCj4gU3RhY2sgdHJhY2VzIGFyZSBub3QgZ3VhcmFudGVlZC1hY2N1cmF0
ZSwgZXZlbiB3aXRoIGZyYW1lIHBvaW50ZXJzDQo+IGVuYWJsZWQuwqAgVGhlIG9ubHkgdGhpbmcg
d2UgY2FuIHNheSBmb3IgY2VydGFpbiBpbiBhbnkgdHJhY2UgaXMgd2hlcmUNCj4gJXJpcCBwb2lu
dHMuDQoNClllcywgSSByZWFsaXplIHlvdSBzdGlsbCBkb24ndCBsaWtlIHRoaXMuIEJ1dCBzaW1p
bGFybHkgdG8gdGhlDQpvdGhlciBwYXRjaCBzZXQgLSBvbiB0aGUgdjEgZGlzY3Vzc2lvbiBoZXJl
IEkgd2FzIGxhY2tpbmcNCmZlZWRiYWNrLCBhbmQgaGVuY2UgSSBldmVudHVhbGx5IHRpbWVkIG91
dCBhbmQgc2VudCB2Mi4gVGhlDQpxdWVzdGlvbiBpcyAtIHdoYXQgaXMgeW91ciBhbHRlcm5hdGl2
ZSBwcm9wb3NhbCB0byBkaXN0aW5ndWlzaA0KdGhlIHRydWx5IGd1ZXNzZWQgZW50cnkgbG9nZ2Vk
IGhlcmUgZnJvbSB0aGUgbW9yZSByZWxpYWJsZQ0Kb25lcz8gQW5kIHRoZW4gc2ltaWxhcmx5IGhv
dyB0byBkaXN0aW5ndWlzaCB0aGUgbGVzcyByZWxpYWJsZQ0Kb25lcyBwcm9kdWNlZCBieSB0aGUg
IUNPTkZJR19GUkFNRV9QT0lOVEVSIHZhcmlhbnQgb2YNCl9zaG93X3RyYWNlKCkgZnJvbSB0aGVp
ciBtb3JlIHJlbGlhYmxlIGNvdW50ZXJwYXJ0cz8NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
