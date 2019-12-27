Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A40512B285
	for <lists+xen-devel@lfdr.de>; Fri, 27 Dec 2019 09:04:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ikkYM-0000aD-H9; Fri, 27 Dec 2019 08:00:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j2i0=2R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ikkYL-0000a8-DR
 for xen-devel@lists.xenproject.org; Fri, 27 Dec 2019 08:00:57 +0000
X-Inumbo-ID: 0251d3c2-287f-11ea-9b94-12813bfff9fa
Received: from m4a0073g.houston.softwaregrp.com (unknown [15.124.2.131])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0251d3c2-287f-11ea-9b94-12813bfff9fa;
 Fri, 27 Dec 2019 08:00:56 +0000 (UTC)
Received: FROM m4a0073g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0073g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 27 Dec 2019 07:58:49 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 27 Dec 2019 07:59:58 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 27 Dec 2019 07:59:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AK/WrlZy22P5cXIHvpATw3PwXUEhxTS8Nx1LEVBJwI2XvIuL9BVJj54FGcGL1TgdqLCamL+1l0ShD/dTggrfY982oTQsF2q1kGvyvvNiy9r9sTHewfAEm6Fx8eqHwNrgteyiuXFEy0UmI7ho6GKd8vWuPcFxcMWxnUk3uXUfOVUJcnEFuxen8x91QAj73o9Dc8j0cfAeQNRv5/njq+XJ5ldoyRuUuPodaLQ+yCSPlZJnZrOSdk/dgm9cykwl1EeGIGG3YltLxF97Ukm2HINtmXXPUaLJEHOjvjwtoVI7DafX/yw2pJXNThqt9vjJtbIyvVfNTd2ftqtgFAi1Uw01vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KqB1LUKcEs1vNnq0js4IMqyIzx2tZG13xXeyEBBTgmo=;
 b=LOQCP2XTxU+rVq6+LA/phyAXQx56g4acDDsFuNbT1aA2P0FrohxBAtVLWk64n+1RpEv7y+ic0+TWoJrE+1W6Iik31pzWftl2fy2DXJ40u/XvwKrG6RbClJP+bGq6J1DyLzTGsuIs3NZnkpN9oc1j7loyQr36nMf0/Z50gAJpT6H5JEX1gC/18Rgxp7BWuk+0bpqMSdT403ERFIcEAzWFoRObF+SrsRtfP0+NwwkXOtV0teLFo1vaRoNXrYnApSiz+kFfMng/zVeIUvvLv1dCAIjTQIZYVtp+YLd3VftepM5/IVhPIxk9ZyZ2ME5PwE+RfnJ4BRu+87dfZlW61r50yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.237.86) by
 MN2PR18MB2624.namprd18.prod.outlook.com (20.179.83.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.11; Fri, 27 Dec 2019 07:59:57 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::19f2:b9fd:38db:7461]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::19f2:b9fd:38db:7461%4]) with mapi id 15.20.2581.007; Fri, 27 Dec 2019
 07:59:57 +0000
Received: from [10.156.60.99] (37.24.206.209) by
 LO2P265CA0042.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:61::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.11 via Frontend Transport; Fri, 27 Dec 2019 07:59:55 +0000
From: Jan Beulich <JBeulich@suse.com>
To: George Dunlap <george.dunlap@citrix.com>
Thread-Topic: [PATCH V6 1/4] x86/mm: Add array_index_nospec to guest provided
 index values
Thread-Index: AQHVuZnmK7OgfjFiuE29BC4XwHoq4afIBKEAgAWfkAA=
Date: Fri, 27 Dec 2019 07:59:56 +0000
Message-ID: <1b5be15d-f93d-f2c4-736d-bba2fdd5bfb6@suse.com>
References: <20191223140409.32449-1-aisaila@bitdefender.com>
 <1e097c0e-1a99-2251-68f7-72f99f64c3bd@citrix.com>
In-Reply-To: <1e097c0e-1a99-2251-68f7-72f99f64c3bd@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0042.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::30) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:166::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 00431a1b-5d88-4047-7167-08d78aa2c3ae
x-ms-traffictypediagnostic: MN2PR18MB2624:
x-microsoft-antispam-prvs: <MN2PR18MB26243AE3FAAE5DD01AAE7F5EB32A0@MN2PR18MB2624.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0264FEA5C3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(396003)(136003)(376002)(366004)(39860400002)(189003)(199004)(4744005)(66946007)(186003)(16526019)(26005)(66446008)(64756008)(66476007)(478600001)(6916009)(8936002)(52116002)(4326008)(66556008)(31686004)(31696002)(2616005)(956004)(86362001)(16576012)(316002)(5660300002)(2906002)(53546011)(54906003)(81166006)(71200400001)(6486002)(7416002)(8676002)(36756003)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB2624;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 09I6zuRP+EhIV4BD2zMVaPYJlqaKN0EzHBsoM4hj5uthn+lY9tjGtVZroNuhB65aj/C3tWJNdcxQdCRyy5dHnIuPzROmRlS6qI1YWXTY3WK/ORW3m8cebTJ1V5jqMWf+JIwSUE0UVfAF4dYNMpqudA2ptJfZSGT9tskgySbAhcI9ixDjolkVemAFYrWjm6beI78RTywTktEstd7gONhJkIzZ60/dvVvGqgZkWjDaTOW7Xk8nYSkRwFmW7daYyje5HbUDrP2sr4iEP8kzwMOp71XEU+QeVmwwioQZAVvly8CQRUmGFkraR+FKMoZcR07duie6sjWi6kFO93e4rLCf6+id7AArdLXj4FYGJq6zQo2eh8c2ujhb6IGGMUb2DYrAwfDnx5NwM9jTzyztYKDpsgh279FMqbKuRcwZptFtluQJRsPAgSRnM5+OklWidUoa
x-ms-exchange-transport-forked: True
Content-ID: <5E81679417E5C240BC0A2DC6935467C0@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 00431a1b-5d88-4047-7167-08d78aa2c3ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Dec 2019 07:59:56.9918 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SMFW3L0f886SREtHI+NNFzV5kPNhPajkLD6Qph9s6VBCe3OR/Rz2R/QhBE9BFx3OMXnwlscQVOn2CBisia9kXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2624
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH V6 1/4] x86/mm: Add array_index_nospec to
 guest provided index values
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
Cc: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>,
 Kevin Tian <kevin.tian@intel.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Wei Liu <wl@xen.org>, Razvan COJOCARU <rcojocaru@bitdefender.com>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMTIuMjAxOSAxOTowOCwgR2VvcmdlIER1bmxhcCB3cm90ZToNCj4gV2hhdCBhYm91dCB0
aGUgYXR0YWNoZWQgc2VyaWVzIG9mIHBhdGNoZXMgKGNvbXBpbGUtdGVzdGVkIG9ubHkpPw0KDQpU
aGlzIC4uLg0KDQo+KyNkZWZpbmUgbm9zcGVjX2NsaXAoaW5kZXgsIHNpemUpICAgICAgICAgICAg
ICAgICBcDQo+KyAgICAoeyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcDQo+KyAgICAgICAgYm9vbCBjbGlwcGVkID0gKGluZGV4ID49IHNpemUpOyAgICAgICAgICBc
DQo+KyAgICAgICAgaW5kZXggPSBhcnJheV9pbmRleF9ub3NwZWMoaW5kZXgsIHNpemUpOyBcDQo+
KyAgICAgICAgY2xpcHBlZDsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+KyAg
ICB9KQ0KDQouLi4gaW4gcGFydGljdWxhciBtYXkgbWlzZ3VpZGUgcGVvcGxlIG9uIGl0cyB1c2U6
IElmIHRoZSBjbGlwcGVkDQoiaW5kZXgiIGdldHMgc3RvcmVkIGluIGEgcmVnaXN0ZXIsIGFsbCBp
cyBnb2luZyB0byBiZSBmaW5lIChhZmFpY3QpLA0KYnV0IGlmIGl0IGVuZHMgdXAgaW4gbWVtb3J5
LCB0aGVyZSdzIGJlIG5ldyAobWlzLSlzcGVjdWxhdGlvbg0Kb3Bwb3J0dW5pdGllcy4gU29tZSBv
ZiB0aGUgY2xpcHBpbmcgZG9uZSBpbiB0aGUgcGF0Y2hlcyBpcyBhbHJlYWR5DQpub3QgZnVsbHkg
c2FmZSBhZ2FpbnN0IHRoaXMsIGJ1dCBpbiBzb21lIG90aGVyIGNhc2VzIChlc3BlY2lhbGx5DQpv
bmNlIGFycmF5X2FjY2Vzc19ub3NwZWMoKSB3b3VsZCBiZSB1c2VkIHdoZXJlIHBvc3NpYmxlKSB3
b3VsZCBhdA0KbGVhc3QgbWFrZSB0aGluZ3MgYXMgc2FmZSBhcyB0aGV5IGNhbiBiZSBtYWRlIHdp
dGhvdXQgY29tcGlsZXIgYWlkLg0KDQooQXMgYW4gYXNpZGUsIHRoZSBzdWdnZXN0ZWQgbWFjcm8s
IGlmIHdlIHdlcmUgdG8gcHV0IGl0IGluLCB3b3VsZA0KbmVlZCBwcm9wZXIgcGFyZW50aGVzaXph
dGlvbiBvZiB0aGUgbWFjcm8gcGFyYW1ldGVyIHVzZXMuKQ0KDQpKYW4NCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
