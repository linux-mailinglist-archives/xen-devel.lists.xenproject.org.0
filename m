Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 706D8751C0
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2019 16:49:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqf0J-0006sb-Je; Thu, 25 Jul 2019 14:45:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dOpT=VW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqf0H-0006sW-PP
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2019 14:45:57 +0000
X-Inumbo-ID: e76edb19-aeea-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e76edb19-aeea-11e9-8980-bc764e045a96;
 Thu, 25 Jul 2019 14:45:56 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 25 Jul 2019 14:45:50 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 25 Jul 2019 14:31:41 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 25 Jul 2019 14:31:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fvM2EJhx6CgKzUuEI01efVkTs559jAGgO96fyoODsa38h+LXQJvzagP8u5/g9VVe0JtST6NWZ9PCXVuMsRNQPR5PsuNdi5vXv7QYjyTEUbNFZyPVOuMtwDQ/ZXmJrD6zvjzGc6Ig5n8BlMZ/rX4TLRGIvtITxWXfr+tjqzj1XpgZZ8gc8j1sP151NNBM6MTemSIExPP9+BUM/cLZDVVqc8RpcEjJTqlX6NBvovd88Ab2unfsaIBXq2OfNoKbnpNfoXjPqaZSAeteyfgEfAPvDBSu+F4siFnkLylIBXkNTlj8Mkeus4Y9kC2y2vSM7Nm+nYpKc0b8mdOBPxl2DIr+ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qKAqP6aTOFJvOBo0bva2rUZ0by9i6ZGGwYe6BVcTpaY=;
 b=iITtImgLNR+wBdgVWD4op0MHwoSM6AAh0Q5IrQhMQMoPGnFW1//i8kbTpZVTAvgkjou00Bgo1rq/1kx21Qx4cfqL/RwMuziDw/mV2aurwYyoGhadHsytTA7k0Nd9GT6Z4Gx6T1kW9icNAt+ImGnKGkAPdTecuT2mluZd0wVWgPE6pIeLVLBmTa7gMvUMNkRpiMhRNPK2Os/roFZbnHDFjKy3dcplgI1wCugqBfvBfzYHhTGTvtmgbF8T39g4L3xwD1rFRY9RviB00hnOgdGPHQiIczJegmhkM3zgkpAI+hGKJkYtIhynE1+sjPhQamXSr20V4fb3XFIls5nNfocpkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3153.namprd18.prod.outlook.com (10.255.139.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Thu, 25 Jul 2019 14:31:40 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Thu, 25 Jul 2019
 14:31:40 +0000
From: Jan Beulich <JBeulich@suse.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [Xen-devel] CPU frequency throttling based on the temperature
Thread-Index: AQHVQu0HpijgxWKHrUqY6YxdJv9yhqbbWYdZgAAC64CAAAVCp4AAA8MA
Date: Thu, 25 Jul 2019 14:31:40 +0000
Message-ID: <659529bf-beb8-2a11-b21a-03069a66d530@suse.com>
References: <e23a10a75ea7a1bee33a8721d9bee209b736dee8.camel@savoirfairelinux.com>
 <20190724143643.lpg576p6psxqelrg@Air-de-Roger>
 <cc9a1959af91dc812553b700fee308573c5dea5d.camel@savoirfairelinux.com>
 <20190724154118.ourqzsecc6cylypd@Air-de-Roger>
 <40f51e942a4ce5d2f0aa6c557090cba1f0fccb16.camel@savoirfairelinux.com>
 <b9807309-6785-72ae-0a95-998f795fc51b@suse.com>
 <20190725131346.kve55aazhwls2rtb@Air-de-Roger>
 <7e05469ebe82e4564ed3cca3182e7bad41a3f2ed.camel@savoirfairelinux.com>
 <20190725134750.d5hw6dsxjowk4ann@Air-de-Roger>
 <0f520921-51a5-22c3-bd5d-7774f26bac30@suse.com>
 <20190725141734.tkgdcg5zrbefuwzz@Air-de-Roger>
In-Reply-To: <20190725141734.tkgdcg5zrbefuwzz@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB3PR0202CA0002.eurprd02.prod.outlook.com
 (2603:10a6:8:1::15) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e228763d-da53-4f7d-519b-08d7110cce9a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3153; 
x-ms-traffictypediagnostic: BY5PR18MB3153:
x-microsoft-antispam-prvs: <BY5PR18MB3153CCF52B4925DA746D33ABB3C10@BY5PR18MB3153.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0109D382B0
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(346002)(39860400002)(396003)(376002)(136003)(199004)(189003)(66066001)(256004)(14454004)(76176011)(4326008)(316002)(31696002)(386003)(99286004)(53546011)(86362001)(71190400001)(6506007)(66946007)(5660300002)(80792005)(102836004)(66476007)(54906003)(68736007)(229853002)(6246003)(64756008)(66446008)(52116002)(66556008)(3846002)(31686004)(446003)(478600001)(81156014)(6116002)(36756003)(2906002)(11346002)(81166006)(71200400001)(2616005)(53936002)(6512007)(25786009)(26005)(7736002)(305945005)(6916009)(186003)(6486002)(8936002)(6436002)(476003)(486006)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3153;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: VfQu2j8uBFPjks4Sv5tRo4p1JAUl3p9siy/hvDjnME8aoPpdy9BAN06jUdMfDs/80dDNAhQNeDgVekXU79vWvxeVNHjfNoB7d+uJm3LW5aIUXZ3osv4UGmeCK6N6JBFI7Z76ZixLgptRg9mxnCRj6FkNWLwb+uD22uizYNfXHzP8pbOGNO11j2gmG4h0xvg+Lnuxv2YgQWMmXW7IwecsTlyjorAvWuKNsP/voMGOp2lsRVfv2uuAiE+09qNrtQGsTF0LgrkafnplGPBAE6WpftNIGvVfod274f9Q3MpwpOrw3e2XavIvD+FsUXVDtBRsChKKO0wrLJcqgkJgpxyBi1rYM9toFgOxaDmYosi6r1fjJanV+O3yHa4iQ3bxHSYOicHk1pKRVP+AejIjDibyAuMwJXYLnJ10Eafkp74Rfz0=
Content-ID: <1F60513C68F6D74A98017F5AB62E55D2@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e228763d-da53-4f7d-519b-08d7110cce9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2019 14:31:40.2182 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3153
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] CPU frequency throttling based on the temperature
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
Cc: "Fredy P." <fredy.pulido@savoirfairelinux.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjUuMDcuMjAxOSAxNjoxNywgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6DQo+IE9uIFRodSwg
SnVsIDI1LCAyMDE5IGF0IDAxOjU5OjIyUE0gKzAwMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4g
T24gMjUuMDcuMjAxOSAxNTo0NywgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6DQo+Pj4gT24gVGh1
LCBKdWwgMjUsIDIwMTkgYXQgMDk6Mjk6MDFBTSAtMDQwMCwgRnJlZHkgUC4gd3JvdGU6DQo+Pj4+
IE9uIFRodSwgMjAxOS0wNy0yNSBhdCAxNToxMyArMDIwMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90
ZToNCj4+Pj4+IE9uIFRodSwgSnVsIDI1LCAyMDE5IGF0IDEyOjU0OjQ2UE0gKzAwMDAsIEphbiBC
ZXVsaWNoIHdyb3RlOg0KPj4+Pj4+IE9uIDI1LjA3LjIwMTkgMTQ6NDQsICBGcmVkeSBQLiAgd3Jv
dGU6DQo+Pj4+Pj4+IE9uIFdlZCwgMjAxOS0wNy0yNCBhdCAxNzo0MSArMDIwMCwgUm9nZXIgUGF1
IE1vbm7DqSB3cm90ZToNCj4+Pj4+Pj4+Pj4gV2hhdCBoYXJkd2FyZSBpbnRlcmZhY2UgZG9lcyB0
aGVybWFsZCAob3IgdGhlIGRyaXZlciBpbg0KPj4+Pj4+Pj4+PiBMaW51eCBpZg0KPj4+Pj4+Pj4+
PiB0aGVyZSdzIG9uZSkgdXNlIHRvIGdldCB0aGUgdGVtcGVyYXR1cmUgZGF0YT8NCj4+Pj4+Pj4N
Cj4+Pj4+Pj4gSW4gb3VyIGluaXRpYWwgUE9DIHVzaW5nIFhlbiA0LjgueCB3ZSB3aGVyZSB1c2lu
ZyBMaW51eCBjb3JldGVtcA0KPj4+Pj4+PiBkcml2ZXINCj4+Pj4+Pj4gcmVhZGluZyBieSBleGFt
cGxlIC9jbGFzcy9zeXMvaHdtb24vaHdtb24wL3RlbXAzX2lucHV0IGJ1dCBpdCBnb3QNCj4+Pj4+
Pj4gZGVwcmVjYXRlZCBhdCBjb21taXQgNzJlMDM4NDUwZDNkNWRlMWEzOWYwY2ZhMmQyYjBmOWIz
ZDQzYzZjNg0KPj4+Pj4+DQo+Pj4+Pj4gSG1tLCBJIHdvdWxkbid0IGNhbGwgdGhpcyBkZXByZWNh
dGlvbiwgYnV0IGEgcmVncmVzc2lvbi4gSSB3b3VsZA0KPj4+Pj4+IHNheSB3ZSB3YW50IHRvIHJl
LWV4cG9zZSB0aGlzIGxlYWYgdG8gRG9tMCwgdGhlIG1vcmUgdGhhdCB0aGUNCj4+Pj4+PiBjb21t
aXQgYWxzbyBvbmx5IG1lbnRpb25zIHVucHJpdmlsZWdlZCBkb21haW5zLiBBbmRyZXc/DQo+Pj4+
Pg0KPj4+Pj4gQUZBSUNUIGZyb20gdGhlIGRvY3VtZW50cyBwcm92aWRlZCBieSBGcmVkeSB0aGUg
dGVtcGVyYXR1cmUgaXMgcmVhZA0KPj4+Pj4gZnJvbSBhIE1TUiB0aGF0IHJlcG9ydHMgdGhlIGN1
cnJlbnQgdGVtcGVyYXR1cmUgb2YgdGhlIGNvcmUgb24gd2hpY2gNCj4+Pj4+IHRoZSBNU1IgaXMg
cmVhZCBmcm9tLiBXaGVuIHJ1bm5pbmcgb24gWGVuIHRoaXMgd2lsbCBvbmx5IHdvcmsNCj4+Pj4+
IGNvcnJlY3RseSBpZiBkb20wIGlzIGdpdmVuIHRoZSBzYW1lIHZDUFVzIGFzIHBDUFVzIGFuZCB0
aG9zZSBhcmUNCj4+Pj4+IGlkZW50aXR5IHBpbm5lZC4NCj4+Pj4NCj4+Pj4gSSBqdXN0IHdhbnQg
dG8gYmUgc3VyZSBJIGdvdCBpdCBjb3JyZWN0bHksIGJ5IHNheWluZyAiV2hlbiBydW5uaW5nIG9u
DQo+Pj4+IFhlbiB0aGlzIHdpbGwgb25seSB3b3JrIGNvcnJlY3RseSBpZiAuLi4iIG1lYW5zIGlu
IGEgZnV0dXJlDQo+Pj4+IGltcGxlbWVudGF0aW9uIG9yIHRoYXQgcmlnaHQgbm93IGNvdWxkIHdv
cmsgaWYgSSBwaW4gdGhpcyB2L3BDUFVTPw0KPj4+DQo+Pj4gTm8sIHJpZ2h0IG5vdyB0aGVyZSdz
IG5vIHdheSB0byBnZXQgdGhpcyBkYXRhIGZyb20gZG9tMCwgcmVnYXJkbGVzcyBvZg0KPj4+IHRo
ZSBwaW5uaW5nLg0KPj4NCj4+IE9mIGNvdXJzZSB5b3UgY2FuLCB1c2luZyB0aGUgTVNSICJkZXZp
Y2UiIExpbnV4IG9wdGlvbmFsbHkNCj4+IHByb3ZpZGVzIChwbHVzIHBlcmhhcHMgdGhlIHJkbXNy
IHV0aWxpdHkgZnJvbSB0aGUgbXNyLXRvb2xzDQo+PiBwYWNrYWdlKS4NCj4gDQo+IEJ1dCB5b3Ug
d29uJ3QgZ2V0IGNvaGVyZW50IHJlc3VsdHMsIHNpbmNlIHRoZSB2Q1BVIG1pZ2h0IGJlIGp1bXBp
bmcNCj4gZnJvbSBwQ1BVIHRvIHBDUFUsIHRodXMgcmV0dXJuaW5nIHZhbHVlcyBmcm9tIG11bHRp
cGxlIGRpZmZlcmVudCBwQ1BVcw0KPiByZWdhcmRsZXNzIG9mIHdoZXRoZXIgYWxsIHJkbXNyIGhh
dmUgYmVlbiBleGVjdXRlZCBmcm9tIHRoZSBzYW1lIHZDUFUNCj4gZnJvbSBkb20wIFBvVi4NCg0K
SSBkb24ndCB1bmRlcnN0YW5kLiBFYXJsaWVyIHlvdSBzYWlkICJyZWdhcmRsZXNzIG9mIHRoZSBw
aW5uaW5nIi4NClRoYXQncyB3aGF0IG15IHJlc3BvbnNlIHdhcyB0bywgaS5lLiBJIHdhcyBpbXBs
eWluZyB2Q1BVLXMgdG8gYmUNCnBpbm5lZC4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
