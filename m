Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B39BE76BFD
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2019 16:48:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hr1RG-0005tR-Eq; Fri, 26 Jul 2019 14:43:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YaH9=VX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hr1RE-0005tF-Vi
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2019 14:43:17 +0000
X-Inumbo-ID: b1f29c98-afb3-11e9-80f5-e741df808383
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b1f29c98-afb3-11e9-80f5-e741df808383;
 Fri, 26 Jul 2019 14:43:15 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 26 Jul 2019 14:43:01 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 26 Jul 2019 14:34:14 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 26 Jul 2019 14:34:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZFRbsCtWgKvb+nSc2jQ5Yn8m2rEb1m0J6N/mV9PYFJ2PDTNTnUdzz7spWwlSvXFBx+Msix4afESI122rJ6z5S4/C/UQvo+RsUth8ckZanK9h80AyM78iFDwdRITKRwKL47BEJ2ixaaeiaISely0rAROElpBgB0nLemXd5HY7sR9tNVMFRaQ374mAa4yC95gnNYSlJ8BLaw0imeyITli4YbjNGP8trIQWWk3qYq7eIABh/QOtRSijT+MREWUJd8JPcdfIouzKVQ5J3qlsKuAUkXtoqwRW6dmGvLPHHWJ0Sxs65O27IY9h5jL1y4DrBx+bWcaZd2fNGkzI6YEb1AnWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ByPYSZ4Xb/IlW4Fk1MRxJAa2nt5dPjsMmQKLXuy1pzU=;
 b=Jgh5vIkVH+NFreZxeMb0mMKRtFBp+Mwutb/BKVsjETzgXsGQRL+TZuqQJSnIdliSkrgY55cZYhbM8Q9h7pU6VZOZLcT7s4UbXUItqxTNbni+dFo6cS6R5TPHrbAZWAZJJN7GGmT/oQ14xEH4B0R4HY/VkM8S51R0ceZ7dR3iVYfX3p6xfNzxiHvHJwh5+wvWedQd9EiItXmYbdx1Iw/nW9XLno4pRyXy36rniqKCvXgoMhoQ59zZHTSe9sp1+ET2/OZkg3I7hXAQ5ovnO3Fnge1UDLMiHcE0cYYBrHU3fhCzat2HZvUxZ1We54pTww0EzEzMhs3erRApzz1752Zajg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3313.namprd18.prod.outlook.com (10.255.137.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2115.10; Fri, 26 Jul 2019 14:34:13 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2115.005; Fri, 26 Jul 2019
 14:34:13 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Paul Durrant <Paul.Durrant@citrix.com>
Thread-Topic: [Xen-devel] per-domain passthrough/iommu options
Thread-Index: AdVDqy2gdS3slVvQRuCN/iB10JmJ2gABnjsAAAD6vMAAAUXLgAAASpcAAADXF4A=
Date: Fri, 26 Jul 2019 14:34:13 +0000
Message-ID: <73c71fa0-9eb9-c126-726d-114ff9f464af@suse.com>
References: <a65d176f8912458c8576367597613de9@AMSPEX02CL03.citrite.net>
 <8fff2485-bf0a-5b98-dfbc-4679c39b9ed0@suse.com>
 <3cd2057e69bc4bdbb87f53c97ffe765c@AMSPEX02CL03.citrite.net>
 <82fc3e28-353a-44fb-0d6b-ec2913610c2f@suse.com>
 <fa7e8a34bedc43de8a62d8a8480d171e@AMSPEX02CL03.citrite.net>
In-Reply-To: <fa7e8a34bedc43de8a62d8a8480d171e@AMSPEX02CL03.citrite.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR01CA0039.eurprd01.prod.exchangelabs.com
 (2603:10a6:6:46::16) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3687c314-1238-41fc-532d-08d711d65472
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3313; 
x-ms-traffictypediagnostic: BY5PR18MB3313:
x-microsoft-antispam-prvs: <BY5PR18MB33131A480BD7366CE1C89352B3C00@BY5PR18MB3313.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01106E96F6
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(136003)(39860400002)(376002)(366004)(396003)(189003)(199004)(86362001)(31696002)(3846002)(6916009)(25786009)(68736007)(6116002)(14444005)(256004)(6246003)(486006)(6436002)(6486002)(4326008)(229853002)(305945005)(7736002)(66066001)(5660300002)(99286004)(14454004)(76176011)(31686004)(478600001)(66946007)(446003)(66446008)(64756008)(6512007)(316002)(8936002)(8676002)(52116002)(53936002)(80792005)(186003)(11346002)(66556008)(66476007)(26005)(36756003)(71200400001)(2906002)(6506007)(476003)(386003)(53546011)(102836004)(2616005)(71190400001)(81166006)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3313;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: plFj9dDTZ5E2lp5RG4YDzp0IkVvzXBbU6KtUBGauEIGUonyvERMhl4bMEvk1zktrerSRYOT86K+n88tn+OI3Xdz6Za/9VQ3G9wd3TdgbMLqqapjx2xVhvGx9clhbNxnBF2yAAKUsBAmEpUocTvZt0OoUEffz1HxiSeBh1F8Du8rz3COJmPJkElLlXHV6z8o0pPbNYFymSkMXNOKsyy1XljHqFEjtI8LlMuJXPnoFzv2UcY0ZFQgdl9KrXED62gkQkM2METhTGTe6Dq73qfx9awSOedOVjnkZXwIU8AisgZYALZo8AfqXLfL89LSr5RyijVuhZJ07rH5+8e86BLAtwfimUxnklT5exyyJoqOOWT1IBYn5ka8DfjB5nsklwXo3ln2pGuu0qcn5Htjm6f+N4T2xkVv9j6Od161cmBjWVCo=
Content-ID: <61EEE30E2049324CAF388FEDA6CAE9B1@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3687c314-1238-41fc-532d-08d711d65472
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2019 14:34:13.5685 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3313
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] per-domain passthrough/iommu options
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
Cc: "xen-devel \(xen-devel@lists.xenproject.org\)"
 <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMDcuMjAxOSAxNjoyNiwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPj4gRnJvbTogSmFuIEJl
dWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPg0KPj4gU2VudDogMjYgSnVseSAyMDE5IDE1OjAyDQo+
Pg0KPj4gT24gMjYuMDcuMjAxOSAxNTozOSwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPj4+ID8gSSBk
b24ndCB0aGluayAncHJpdmF0ZS1wdCcgb3IgJ3NlcGFyYXRlLXB0JyByZWFsbHkgY2FwdHVyZSB0
aGUgZmFjdCB0aGF0IHRoZSBwYWdlIHRhYmxlcyBtYXRjaCB0aGUNCj4+IFAyTS4gVGhleSBjb3Vs
ZCBqdXN0IGFzIGVhc2lseSBiZSB0YWtlbiB0byBtZWFuIHRoYXQgdGhleSBhcmUgcG9wdWxhdGVk
IHVzaW5nIHNvbWUgb3RoZXIgcG9saWN5Lg0KPj4NCj4+IEJ1dCBoYXZlbid0IHdlIHJlY2VudGx5
IHNlZW4gdGhhdCB0aGlzIGZ1bGx5IGxvY2stc3RlcCBwb3B1bGF0aW9uDQo+PiBvZiBwYWdlIHRh
YmxlcyBpc24ndCBhbHdheXMgY29ycmVjdCAob3IgYXQgbGVhc3QgZGVzaXJhYmxlKT8gSQ0KPj4g
dmFndWVseSByZWNhbGwgb3RoZXIgY29tbWVudHMgdG8gdGhhdCBlZmZlY3QgdG9vLCBmcm9tIGxv
bmcgYWdvLg0KPj4gSSdkIHNwZWNpZmljYWxseSB3YW50IHRvIGF2b2lkIGVuY29kaW5nIGludG8g
dGhlIGludGVyZmFjZSBoZXJlDQo+PiB0aGF0IHRoZSB0d28gYXJlIGV4YWN0IG1pcnJvcnMgb2Yg
b25lIGFub3RoZXIsIG5vdyBhbmQgZm9yZXZlci4NCj4gDQo+IEhvdyBkbyB5b3UgdGhpbmsgd2Ug
c2hvdWxkIGV4cHJlc3MgaXQuIEkgYWdyZWUgdGhhdCBpdCdzIGEgYml0IGF3a3dhcmQgYmVjYXVz
ZSBvZiB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIEhWTSBhbmQgUFYgZG9tYWlucywgYnV0IGFsbCB3
ZSBjYW4gZG8gdGhlcmUgcmVhbGx5IGlzIGRvY3VtZW50IGl0IEkgdGhpbmssIHNvIHBlcmhhcHMg
dGhlIG1hbnBhZ2UgY291bGQgaGF2ZSBzb21ldGhpbmcgbGlrZToNCg0KU291bmRzIHJlYXNvbmFi
bGUgLSBpdCBhdCBsZWFzdCBhdm9pZHMgbWFraW5nIHRoZSBiZWhhdmlvciB0b28NCm11Y2ggc3Bl
bGxlZCBvdXQgd2l0aCByZWdhcmQgdG8gdGhlIHNpbWlsYXJpdHkgb2YgbWFwcGluZ3MgYmV0d2Vl
bg0KSU9NTVUgcGFnZSB0YWJsZXMgYW5kIFAyTS4gVGhlcmUncyBvbmUgaXNzdWUgdGhvdWdoOg0K
DQo+ICdvZmYnDQo+IA0KPiBJT01NVSBtYXBwaW5ncyBhcmUgZGlzYWJsZWQgZm9yIHRoZSBkb21h
aW4gYW5kIHNvIGhhcmR3YXJlIG1heSBub3QgYmUgcGFzc2VkIHRocm91Z2guDQo+IA0KPiAnc3lu
Yy1wdCcNCj4gDQo+IEZvciBhIFBWIGRvbWFpbiwgYWxsIHdyaXRhYmxlIHBhZ2VzIGFzc2lnbmVk
IHRvIHRoZSBkb21haW4gYXJlIGlkZW50aXR5IG1hcHBlZCBieSBNRk4gaW4gdGhlIElPTU1VIHBh
Z2UgdGFibGVzLiBUaHVzIGEgZGV2aWNlIGRyaXZlciBydW5uaW5nIGluIHRoZSBkb21haW4gbWF5
IHByb2dyYW0gcGFzc3Rocm91Z2ggaGFyZHdhcmUgZm9yIERNQSB1c2luZyBNRk4gdmFsdWVzIChp
LmUuIGhvc3QvbWFjaGluZSBmcmFtZSBudW1iZXJzKSBsb29rZWQgdXAgaW4gaXRzIFAyTS4NCj4g
Rm9yIGFuIEhWTSBkb21haW4sIGFsbCBub24tZm9yZWlnbiBSQU0gcGFnZXMgcHJlc2VudCBpbiB0
aGUgUDJNIHdpbGwgYmUgaWRlbnRpdHkgbWFwcGVkIGJ5IEdGTg0KDQpXaHkgImlkZW50aXR5IG1h
cHBlZCIgaGVyZT8gSXQncyBhIEdGTiAtPiBNRk4gbWFwcGluZ20sIGlzbid0IGl0Pw0KDQpKYW4N
Cg0KPiBpbiB0aGUgSU9NTVUgcGFnZSB0YWJsZXMuIFRodXMgYSBkZXZpY2UgZHJpdmVyIHJ1bm5p
bmcgaW4gdGhlIGRvbWFpbiBtYXkgcHJvZ3JhbSBwYXNzdGhyb3VnaCBoYXJkd2FyZSB1c2luZyBH
Rk4gdmFsdWVzIChpLmUuIGd1ZXN0IHBoeXNpY2FsIGZyYW1lIG51bWJlcnMpIHdpdGhvdXQgYW55
IGZ1cnRoZXIgdHJhbnNsYXRpb24uDQo+IA0KPiAnc2hhcmUtcHQnDQo+IA0KPiBUaGlzIGlzIHVu
YXZhaWxhYmxlIGZvciBhIFBWIGRvbWFpbi4gRm9yIGFuIEhWTSBkb21haW4sIHRoaXMgb3B0aW9u
IG1lYW5zIHRoYXQgdGhlIElPTU1VIHdpbGwgYmUgcHJvZ3JhbW1lZCB0byBkaXJlY3RseSByZWZl
cmVuY2UgdGhlIFAyTSBhcyBpdHMgcGFnZSB0YWJsZXMuIFRoaXMgYXZhaWxhYmlsaXR5IG9mIHRo
aXMgb3B0aW9uIGlzIGhhcmR3YXJlIHNwZWNpZmljIGFuZCB0aHVzLCBpZiBpdCBpcyBzcGVjaWZp
ZWQgZm9yIGEgZG9tYWluIHJ1bm5pbmcgb24gaGFyZHdhcmUgdGhhdCBkb2VzIG5vdCBhbGxvdyBp
dCwgJ3N5bmMtcHQnIHdpbGwgYmUgdXNlZCBpbnN0ZWFkLg0KPiANCj4gPw0KPiANCj4gICAgUGF1
bA0KPiANCj4+DQo+PiBKYW4NCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
