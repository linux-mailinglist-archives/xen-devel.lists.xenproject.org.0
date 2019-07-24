Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D337332C
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2019 17:55:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hqJYO-00078U-NU; Wed, 24 Jul 2019 15:51:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=9cpT=VV=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hqJYM-00078P-SF
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2019 15:51:42 +0000
X-Inumbo-ID: eb679f3a-ae2a-11e9-827b-373febdcf7f5
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eb679f3a-ae2a-11e9-827b-373febdcf7f5;
 Wed, 24 Jul 2019 15:51:38 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 24 Jul 2019 15:51:25 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 24 Jul 2019 15:51:09 +0000
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 24 Jul 2019 15:51:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aulYHt1M6CxNjE5NvNy8yFmhlxI394Yia/FTAfrWudpP+jq0sOLJGIANdCiuNxDUVOlLFL21MwzQ7tklyOl8sqh9Sd8JJWgivr1AfPYEclNWBIqAGSfboWQzfBt7X7tFdPwoNsOYUMpgRnpfoQ0yrwhTohk12rb3qzNmNyYrBJupw+EaAFx6Jbz1c1Q//ON0Mslqt7f2otLSbPEsk47vllAu2YqxyQyCSuR1SOdsoG/tmDGR9t/mcqX78SR7L2yNG2rvhD048phAyMswH/c/y9M5iqDP71HPYMWloVOw6Ly4j7STYdUONFZrUFYj4ADtFnVxrFWEtwxwv0K9/EnqkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9qPZXh2J1krMD3B2RRzwb9HxBzU68GtYmQvv6mEJYAg=;
 b=Tgl80HK+F3bPzzZHBOfny6Z2ZNMAJthObvSjUNoWIDnRoSAge14yGJBUriE442KUN6gesUyxIMF/Zv+nTdBZCZu/9yGZI3EinclXJ2mTG1D34QjDpg0x1rGdGluQQeW1XG/kZTze3QYXM/jcr80I3eH2mEhp7QUnaagBVG+LKc0hvVSLxUTQqr1BjP+oWxzKW7ioW4PpdXSMNRC08mUjErRQ2TWcoE2cPhZewcSxVQ2/2kO4CyP5OCbCEbvX2Y9WVmTt7d6yNyN60VP/BUksKBwbb2/w0cdTMzi29qTEmoo+ckAC/G/7vFsduTmtzAbT80HqsIM2aoeG1wz3ostiOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from BY5PR18MB3394.namprd18.prod.outlook.com (10.255.139.95) by
 BY5PR18MB3265.namprd18.prod.outlook.com (10.255.138.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.16; Wed, 24 Jul 2019 15:51:07 +0000
Received: from BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b]) by BY5PR18MB3394.namprd18.prod.outlook.com
 ([fe80::a4f0:4f46:c076:f74b%7]) with mapi id 15.20.2094.013; Wed, 24 Jul 2019
 15:51:07 +0000
From: Jan Beulich <JBeulich@suse.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [Xen-devel] CPU frequency throttling based on the temperature
Thread-Index: AQHVQiidALk+x0uDw0GmzsE7VlPwJabZ1pPngAACeACAAA3tToAAA+cA
Date: Wed, 24 Jul 2019 15:51:07 +0000
Message-ID: <d6ad63eb-8171-18a3-2e5a-4ee79b08b7bd@suse.com>
References: <e23a10a75ea7a1bee33a8721d9bee209b736dee8.camel@savoirfairelinux.com>
 <20190724143643.lpg576p6psxqelrg@Air-de-Roger>
 <1f653322-5d4d-5393-5790-c63b07492050@suse.com>
 <20190724153528.xgpzq6ta4vrxpitq@Air-de-Roger>
In-Reply-To: <20190724153528.xgpzq6ta4vrxpitq@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB7PR05CA0070.eurprd05.prod.outlook.com
 (2603:10a6:10:2e::47) To BY5PR18MB3394.namprd18.prod.outlook.com
 (2603:10b6:a03:194::31)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7289e6dd-35bc-45ee-a9fb-08d7104ebd9e
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:BY5PR18MB3265; 
x-ms-traffictypediagnostic: BY5PR18MB3265:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <BY5PR18MB3265F0A94C71452FA337318EB3C60@BY5PR18MB3265.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0108A997B2
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(346002)(39860400002)(396003)(366004)(376002)(52314003)(199004)(189003)(446003)(71190400001)(71200400001)(6916009)(6246003)(7736002)(305945005)(53546011)(6506007)(386003)(186003)(4326008)(3846002)(6116002)(229853002)(6512007)(256004)(6486002)(6306002)(2616005)(476003)(11346002)(486006)(81156014)(81166006)(68736007)(76176011)(478600001)(8936002)(86362001)(80792005)(31686004)(66066001)(54906003)(36756003)(316002)(25786009)(5660300002)(99286004)(66476007)(66556008)(64756008)(66446008)(66946007)(31696002)(26005)(6436002)(2906002)(102836004)(53936002)(8676002)(14454004)(966005)(52116002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR18MB3265;
 H:BY5PR18MB3394.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4L98nB+jh0HdJ/i4e9eW6zzeY8ah3WaplvnHoE+I8SjwNRxmcSokf0gJByBLrheyW3mH8sl5wm+UQjtzOLq+nWMJ0k57Xw7R52MDfZZ8Mv/ziWAjUTrxuVdFFqbyMXdWRmos2osude0RDAZhgKFDIaHWDOWbdoH6kLLWwpjYvJyuanMtJ0FjEF3lDL2z0vYSlC6yJCJGxevzIwBE8jqVfN1riQaqMWPi4GT04Y+2QdJsCgQx7KpkeVQTj95j5Zpc533eEveeqyTdBr/YpDp6thls9gweghUmkMP9oyglnUIdyw6cxmxgZ81uFle9ey//gDfeVWOOPsW0puGTjrAceLuf2ve6olj96z9aOcIa2u2FM/TTVX/6ZWkZ90+T0rjFDJ/DNXbwEF/tijns1JniYUe/bhZ6e5FR+3pkozPbBGk=
Content-ID: <010B845BAE3CF44EB30B1967B6FC708A@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7289e6dd-35bc-45ee-a9fb-08d7104ebd9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jul 2019 15:51:07.3818 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR18MB3265
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
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjQuMDcuMjAxOSAxNzozNSwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6DQo+IE9uIFdlZCwg
SnVsIDI0LCAyMDE5IGF0IDAyOjQ3OjE5UE0gKzAwMDAsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4g
T24gMjQuMDcuMjAxOSAxNjozNiwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6DQo+Pj4gT24gV2Vk
LCBKdWwgMjQsIDIwMTkgYXQgMTA6MDE6NDBBTSAtMDQwMCwgRnJlZHkgUC4gd3JvdGU6DQo+Pj4+
IE15IG9iamVjdGl2ZSBpcyB0byBnZXQgQ1BVIGZyZXF1ZW5jeSB0aHJvdHRsaW5nIGJhc2VkIG9u
IHRoZQ0KPj4+PiB0ZW1wZXJhdHVyZSBpbiBhIFhlbi9PcGVuV1JUKGRvbTApIHN5c3RlbS4NCj4+
Pj4NCj4+Pj4gQWZ0ZXIgdG8gZXhwZW5kIGhvdXJzIHJlYWRpbmcgWGVuJ3Mgd2lraSwgbWFpbGlu
ZyBsaXN0IGFyY2hpdmVzLA0KPj4+PiBjb21taXRzLCBnb29nbGluZyBhbmQgYXNraW5nIGluIHRo
ZSBJUkMgY2hhbm5lbCBJJ20gY29taW5nIGhlcmUgYXNraW5nDQo+Pj4+IGZvciBoZWxwIGJlY2F1
c2UgSSBob3BlIHRoZXJlIGlzIHNvbWV0aGluZyBJIG1pc3MgYW5kIHlvdSBjb3VsZCBwb2ludA0K
Pj4+PiBpdC4NCj4+Pg0KPj4+IFRoYXQgc2VlbXMgbGlrZSBhbiBpbnRlcmVzdGluZyBwcm9qZWN0
LCBJIGd1ZXNzIHlvdXIgZm9jdXMgaXMgc29tZQ0KPj4+IGtpbmQgb2YgbG93LXBvd2VyIGRldmlj
ZT8gKG5vdCB0aGF0IGl0IG1hdHRlcnMgbXVjaCBmb3IgdGhlIGNvbnRleHQgb2YNCj4+PiB0aGUg
cXVlc3Rpb24pLg0KPj4+DQo+Pj4gQW55d2F5LCB0aGFua3MgZm9yIHlvdXIgaW50ZXJlc3Qgb24g
WGVuIGFuZCB3YXlzIHRvIGltcHJvdmUgaXQhDQo+Pj4NCj4+Pj4gTXkgZmlyc3QgcXVlc3Rpb24g
aXMsIHRoZXJlIGlzIGFueSB3YXkgdG8gZG8gQ1BVIGZyZXF1ZW5jeSB0aHJvdHRsaW5nDQo+Pj4+
IGJhc2VkIG9uIHRoZSB0ZW1wZXJhdHVyZT8NCj4+Pg0KPj4+IEkgZG9uJ3QgdGhpbmsgdGhlcmUn
cyBzdWNoIGdvdmVybm9yIEFUTSBpbXBsZW1lbnRlZCBpbiBYZW4sIHRoZSBtb3JlDQo+Pj4gdGhh
dCBJIHRoaW5rIGFsbCBmcmVxdWVuY3kgdGhyb3R0bGluZyBpcyBzdXBwb3NlZCB0byBiZSBkb25l
IGJ5IGRvbTANCj4+PiB1c2luZyB4ZW5wbSwgYnV0IG5vdCBYZW4gaXRzZWxmPw0KPj4NCj4+IFRo
ZSBvcmlnaW5hbCBhdXRob3JzIG9mIFAtIGFuZCBDLXN0YXRlIGhhbmRsaW5nIGxvb2sgdG8gaGF2
ZQ0KPj4gYXNzdW1lZCB0aGF0IFQtc3RhdGUgaGFuZGxpbmcgc2hvdWxkIHdvcmsgc2ltaWxhcmx5
LCBpLmUuIGJ5DQo+PiBEb20wIHVwbG9hZGluZyByZWxldmFudCBkYXRhLiBTZWUgcHVibGljL3Bs
YXRmb3JtLmggc3RhcnRpbmcgYXQNCj4+DQo+PiAjZGVmaW5lIFhFTlBGX3NldF9wcm9jZXNzb3Jf
cG1pbmZvICAgICAgNTQNCj4+DQo+PiB3aGVyZSBpbiBwYXJ0aWN1bGFyIHlvdSdsbCBmaW5kDQo+
Pg0KPj4gI2RlZmluZSBYRU5fUE1fVFggICAyDQo+IA0KPiBPSywgSSBhc3N1bWVkIHRoZSBxdWVz
dGlvbiB3YXMgYWJvdXQgcmVhZGluZyB0aGUgQ1BVIHRlbXBlcmF0dXJlIGFuZA0KPiB0aGVuIGNo
YW5naW5nIHRoZSBmcmVxdWVuY3kgb2YgdGhlIENQVSwgYnV0IG5vdCByZWxhdGVkIHRvIFQtc3Rh
dGVzLg0KDQpXZWxsLCBleGNlcHQgdGhhdCBpaXJjIFQtc3RhdGVzIGFyZSAod2VyZSkgYSBtZWFu
cyB0byBjb250cm9sIHRoaXMgdmlhDQpzb21lIGdvdmVybm9yLCByYXRoZXIgdGhhbiAibWFudWFs
bHkiLg0KDQpPYnRhaW5pbmcgdGhlIENQVSB0ZW1wZXJhdHVyZSBzaG91bGQgd29yayAocGVyaGFw
cyB3aXRoIHNvbWUgdHdlYWtzKQ0KdGhlIHNhbWUgd2F5IHVuZGVyIFhlbiBvciBvbiBiYXJlIGhh
cmR3YXJlLiBJIGFsc28gZG9uJ3QgdGhpbmsgaHdtb24NCmRldmljZXMgZ2V0IHVuaW50ZW50aW9u
YWxseSAidW5leHBvc2VkIiB3aGVuIHJ1bm5pbmcgdW5kZXIgWGVuLiBUaGVpcg0KZHJpdmVycyBt
YXkgYmUgd3JpdHRlbiBpbiB3YXlzIHRoYXQgbWFrZSB0aGVtIG5vdCB3b3JrIHByb3Blcmx5IHdo
ZW4NCnJ1biB1bmRlciBYZW4sIHRob3VnaC4NCg0KPiBGV0lXLCB0aGVyZSdzIGFuIEludGVsIGFy
dGljbGUgYWJvdXQgVC1zdGF0ZXMgZnJvbSAyMDEzOg0KPiANCj4gaHR0cHM6Ly9zb2Z0d2FyZS5p
bnRlbC5jb20vZW4tdXMvYmxvZ3MvMjAxMy8xMC8xNS9jLXN0YXRlcy1wLXN0YXRlcy13aGVyZS10
aGUtaGVjay1hcmUtdGhvc2UtdC1zdGF0ZXMNCj4gDQo+IFRoYXQgY2xhaW1zIFQtc3RhdGVzIGFy
ZSBiYXNpY2FsbHkgZGVhZCwgYW5kIG5vIG1vZGVybiBwcm9jZXNzb3JzDQo+IHN1cHBvcnQgdGhl
bS4NCg0KSW50ZXJlc3Rpbmc7IEkgd2Fzbid0IGF3YXJlIG9mIHRoaXMuDQoNCkphbg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxp
bmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5w
cm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
