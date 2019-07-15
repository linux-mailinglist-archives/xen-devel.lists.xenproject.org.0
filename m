Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC646907C
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jul 2019 16:22:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hn1pL-0003Lq-Dr; Mon, 15 Jul 2019 14:19:39 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=IBxS=VM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hn1pJ-0003Ld-UZ
 for xen-devel@lists.xenproject.org; Mon, 15 Jul 2019 14:19:37 +0000
X-Inumbo-ID: 8f14fe47-a70b-11e9-8980-bc764e045a96
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8f14fe47-a70b-11e9-8980-bc764e045a96;
 Mon, 15 Jul 2019 14:19:36 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 15 Jul 2019 14:19:28 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 15 Jul 2019 14:19:08 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.124.72.11) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 15 Jul 2019 14:19:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ARPelUuTT+YoaXxJYMYR/L6g+3B6EgsWgF+So1iOY75Ekdm74a2lxZL9c/Mn2/fp/voLuwneFzQjDLxzQzi2uDo9b+C85eIEcUIg+8CxNYhTqb7didm5XJ6ktYBFPLk1a+uDmDBgawNxwXPPLHci69gu34NnLDKf/AVJEbpiiBXJZJV97hyG7NdNUD3j5FBN7XfScsCBf/2QWM0KTZHyvaqVzLH1hVGAME4iHDShHAW4WAOpRsdn8Go/9sW/d8U2njah5axb+nyHn9gldFtS8Z/uW7EcHW0MpPbatAVXGjSr7210sODKQWx98TLHmkjxYcUaU21fxrYfLRaso5y5WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CYyKQJ1g3L0c31d4ozKIE6vP7E7RlE1nVxEVajYRz2c=;
 b=LFAAvn2qRqQZwLk6ZyajCrT55pFMEQnCRa0HPrfbYxrwW3HF2V4rcvgS+mi3fCYX4Z0Iw7mfYQshNLNvcvISFsOvFdXvjGnoNf0RuV0ZQ/NS2aON1QLX6sTFAgAGHygx3tAPcjPbRER5cCaKx0dcPHMq05E3ce+vKwQaRfNh8F05HWx4zna5EGUeHC6QTK3+r6Mq07mvUhaWrJ3daXcPdBiGkEmekZ8kopmYH1pbwfN6LrEM28MSAehQdBBestnqKQNGBdwGY3nP/9j8KNZXumFaDGqqYhVcMPFFlEpd07fu/tNano3rwxPtA4ICK7s/fgmA+RY1PYvNqEWXNB3Tig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2506.namprd18.prod.outlook.com (20.179.105.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Mon, 15 Jul 2019 14:19:07 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Mon, 15 Jul 2019
 14:19:07 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH] x86/dom0-build: fix build with clang5
Thread-Index: AQHVOvj6+Q8sMST8H0euZPd/xzIlP6bLsnl8gAAIFIA=
Date: Mon, 15 Jul 2019 14:19:07 +0000
Message-ID: <f0fdc077-7897-e71d-fd86-cb8e2b389253@suse.com>
References: <ef670212-8257-b960-a3cb-9363cf076033@suse.com>
 <aed92669-d53d-1543-094b-a4c0458f944e@citrix.com>
In-Reply-To: <aed92669-d53d-1543-094b-a4c0458f944e@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR0601CA0005.eurprd06.prod.outlook.com
 (2603:10a6:4:7b::15) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f561af04-9a39-4d81-280a-08d7092f65fa
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2506; 
x-ms-traffictypediagnostic: DM6PR18MB2506:
x-microsoft-antispam-prvs: <DM6PR18MB250691F341B0E6C5DBB0A640B3CF0@DM6PR18MB2506.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 00997889E7
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(136003)(346002)(376002)(366004)(396003)(199004)(189003)(26005)(80792005)(3846002)(6116002)(229853002)(6916009)(66066001)(31696002)(66476007)(64756008)(6512007)(68736007)(86362001)(36756003)(186003)(71190400001)(71200400001)(53936002)(66556008)(66446008)(5660300002)(25786009)(66946007)(446003)(6486002)(6436002)(2906002)(31686004)(76176011)(14454004)(478600001)(14444005)(8936002)(6246003)(256004)(486006)(6506007)(53546011)(99286004)(102836004)(11346002)(2616005)(7736002)(386003)(305945005)(476003)(4326008)(52116002)(81156014)(8676002)(316002)(54906003)(81166006);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2506;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 3fowkh2lL9YXhZ+2NoaKBoCu1PEC6NUwYxO1o3ZVjUcirFh5ELbTNlAlyTVeMu/OC3uAdm+CXPyEhcabkfdCY08AKT0JtYJ5Pj9gb3Na+UhcvGeSKBSZEHcRdTQaX0Uknx58YrvMJPPk7cl2uEH4WuqmYmsVw32vlz+Z4fEfYQtDi4+3xL6fjpX9kDVXX5M+hNpVc7RT7CMJZw54H3NGoPPpxroO3Pzk579W5ob9NOycEw9PnD5zFMwQojYfhD/F2AGbaIlhaRNQTb5y93YrakZhSqhZr45/+8ZD/ANsIJFnlBO+YQ7A/WuztHEiJFbmzP1/F8gw83gZhsa6G1OjvaGRX3E/Rcnm/J+AxWyY49pIPTlRCMOkilj5sui6dTlmG1nG2r5S3IBhpkDJhedp/r4A3SQC2ZJ0wOKfX13PX70=
Content-ID: <3E8EE11365F6BA4BAEDCAA77044C2924@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: f561af04-9a39-4d81-280a-08d7092f65fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2019 14:19:07.8018 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2506
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] x86/dom0-build: fix build with clang5
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTUuMDcuMjAxOSAxNTo0OSwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMTUvMDcvMjAx
OSAxMTozNSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBXaXRoIG5vbi1lbXB0eSBDT05GSUdfRE9N
MF9NRU0gY2xhbmc1IHByb2R1Y2VzDQo+Pg0KPj4gZG9tMF9idWlsZC5jOjM0NDoyNDogZXJyb3I6
IHVzZSBvZiBsb2dpY2FsICcmJicgd2l0aCBjb25zdGFudCBvcGVyYW5kIFstV2Vycm9yLC1XY29u
c3RhbnQtbG9naWNhbC1vcGVyYW5kXQ0KPj4gICAgICAgaWYgKCAhZG9tMF9tZW1fc2V0ICYmIENP
TkZJR19ET00wX01FTVswXSApDQo+PiAgICAgICAgICAgICAgICAgICAgICAgICAgXiAgfn5+fn5+
fn5+fn5+fn5+fn5+DQo+PiBkb20wX2J1aWxkLmM6MzQ0OjI0OiBub3RlOiB1c2UgJyYnIGZvciBh
IGJpdHdpc2Ugb3BlcmF0aW9uDQo+PiAgICAgICBpZiAoICFkb20wX21lbV9zZXQgJiYgQ09ORklH
X0RPTTBfTUVNWzBdICkNCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBefg0KPj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICYNCj4+IGRvbTBfYnVpbGQuYzozNDQ6MjQ6IG5vdGU6IHJlbW92
ZSBjb25zdGFudCB0byBzaWxlbmNlIHRoaXMgd2FybmluZw0KPj4gICAgICAgaWYgKCAhZG9tMF9t
ZW1fc2V0ICYmIENPTkZJR19ET00wX01FTVswXSApDQo+PiAgICAgICAgICAgICAgICAgICAgICAg
ICB+Xn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+PiAxIGVycm9yIGdlbmVyYXRlZC4NCj4+DQo+PiBP
YnZpb3VzbHkgbmVpdGhlciBvZiB0aGUgdHdvIHN1Z2dlc3Rpb25zIGFyZSBhbiBvcHRpb24gaGVy
ZS4gT2RkbHkNCj4+IGVub3VnaCBzd2FwcGluZyB0aGUgb3BlcmFuZHMgb2YgdGhlICYmIGhlbHBz
LCB3aGlsZSBlLmcuIGNhc3Rpbmcgb3INCj4+IHBhcmVudGhlc2l6aW5nIGRvZXNuJ3QuIEFub3Ro
ZXIgd29ya2FibGUgdmFyaWFudCBsb29rcyB0byBiZSB0aGUgdXNlIG9mDQo+PiAhISBvbiB0aGUg
Y29uc3RhbnQuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPg0KPj4gLS0tDQo+PiBJJ20gb3BlbiB0byBnb2luZyB0aGUgISEgb3IgeWV0IHNvbWUg
ZGlmZmVyZW50IHJvdXRlLiBObyBtYXR0ZXIgd2hpY2gNCj4+IG9uZSB3ZSBjaG9vc2UsIEknbSBh
ZnJhaWQgaXQgaXMgZ29pbmcgdG8gcmVtYWluIGd1ZXNzd29yayB3aGF0IG5ld2VyDQo+PiAoYW5k
IGZ1dHVyZSkgdmVyc2lvbnMgb2YgY2xhbmcgd2lsbCBjaG9rZSBvbi4NCj4+DQo+PiAtLS0gYS94
ZW4vYXJjaC94ODYvZG9tMF9idWlsZC5jDQo+PiArKysgYi94ZW4vYXJjaC94ODYvZG9tMF9idWls
ZC5jDQo+PiBAQCAtMzQxLDcgKzM0MSw3IEBAIHVuc2lnbmVkIGxvbmcgX19pbml0IGRvbTBfY29t
cHV0ZV9ucl9wYWcNCj4+ICAgICAgICB1bnNpZ25lZCBsb25nIGF2YWlsID0gMCwgbnJfcGFnZXMs
IG1pbl9wYWdlcywgbWF4X3BhZ2VzOw0KPj4gICAgICAgIGJvb2wgbmVlZF9wYWdpbmc7DQo+PiAg
ICANCj4+IC0gICAgaWYgKCAhZG9tMF9tZW1fc2V0ICYmIENPTkZJR19ET00wX01FTVswXSApDQo+
PiArICAgIGlmICggQ09ORklHX0RPTTBfTUVNWzBdICYmICFkb20wX21lbV9zZXQgKQ0KPj4gICAg
ICAgICAgICBwYXJzZV9kb20wX21lbShDT05GSUdfRE9NMF9NRU0pOw0KPiANCj4gRmlyc3QgYW5k
IGZvcmVtb3N0LCB0aGVyZSBpcyBhbiBpZGVudGljYWwgY29uc3RydWN0IG9uIHRoZSBBUk0gc2lk
ZSwNCj4gd2hpY2ggd2FudHMgYW4gZXF1aXZhbGVudCBhZGp1c3RtZW50Lg0KDQpPaCwgaW5kZWVk
LiBJIHNob3VsZCBoYXZlIHJlbWVtYmVyZWQgLi4uDQoNCj4gQXMgdG8gdGhlIGNoYW5nZSwgSSdt
IGdvaW5nIHRvIHN1Z2dlc3Qgd2hhdCBJIHN1Z2dlc3RlZCBpbnN0ZWFkIG9mIHRoaXMNCj4gdGhl
IGZpcnN0IHRpbWUgYXJvdW5kLCB3aGljaCBpcyBzdHJsZW4oQ09ORklHX0RPTTBfTUVNKSB0byBt
YWtlIHRoZQ0KPiBsb2dpYyBlYXNpZXIgdG8gZm9sbG93Lg0KDQpIb3cgZG9lcyB1c2Ugb2Ygc3Ry
bGVuKCkgbWFrZSBhbnl0aGluZyBlYXNpZXI/IEkgdGhpbmsgaXQgaXMgYSBwcmV0dHkNCmNvbW1v
biBwYXR0ZXJuIHRvIGNoZWNrIHRoZSBmaXJzdCBjaGFyYWN0ZXIgZm9yIG51bCBpZiBhbGwgb25l
IGlzDQphZnRlciBpcyB0byBrbm93IHdoZXRoZXIgYSBzdHJpbmcgaXMgZW1wdHkuDQoNCkphbg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
