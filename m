Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 659E812B489
	for <lists+xen-devel@lfdr.de>; Fri, 27 Dec 2019 13:25:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ikodt-0004uS-8C; Fri, 27 Dec 2019 12:22:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j2i0=2R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ikods-0004uJ-BO
 for xen-devel@lists.xenproject.org; Fri, 27 Dec 2019 12:22:56 +0000
X-Inumbo-ID: 96b8897e-28a3-11ea-88e7-bc764e2007e4
Received: from m4a0072g.houston.softwaregrp.com (unknown [15.124.2.130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96b8897e-28a3-11ea-88e7-bc764e2007e4;
 Fri, 27 Dec 2019 12:22:46 +0000 (UTC)
Received: FROM m4a0072g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0072g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 27 Dec 2019 12:21:44 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 27 Dec 2019 12:17:53 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 27 Dec 2019 12:17:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NXIDXuAgpTRiyCU8yhIUoCl7zhQqLQAOmEeAc2vgGjxI1PXhNCh5zLWu7n7iAWnLMlTE/0PJNMzBIxzRSeCi625fVHD9D7HgZHSSmUTpfT6XkDbMUpQLN2oa2l1/WG1/qO/FnKiPiK14UbEuRJxkF+tRdjW1LdLv4klKs1AfjgqFlBLQT5yF/u3gfdJzT6XE+kf7Ak7Anir2XusUsCWQ5W6hfrAc4oRyc22Ey++VjOXrVVI8xPGt1PYDRcBcI69pjoVnRO/7++Fu++0t1Um9Zb3Zovz3sU3UeoIVrmD8F8NnMZqN2t5Kc444iU6e0BSWsqng6VTcvkHYbi1oae7gvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5wDG0IYy+7nIYfoeAbT/V9uCWBZKopwFjVn39I8fyU=;
 b=Ez+Z4kzDof5+MrMQVL/DCxC0+DfqWxNmLJIQQq7M8pYSf0hU+jSnhl8pcdFt1Ha/XOkVo0TxCtNX1NeprlA1eeFLuTyirRHHABtV1CLwKsPEBgvlIQk1sHs3WmbESWNwpdOuYuDXoMCERY6lDg2kiqgwaAYwKiQmuWhyjZKFCWuxtJpna5m/1FFCzvc8R0A5kLHb/gNfVWvbjX0N2msZ++CqcfWNY0xtPfyRiK6ju659bk/mj6C8pg6GlVSrW0q/79bVzByDM8qRAvaKjKNOmn4D6dRe4AbNHcmnkLAuYJTvg850iSMU+FBSEofB4VLzW/q6Npx1imRGhWTiYbJLJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.237.86) by
 MN2PR18MB3407.namprd18.prod.outlook.com (10.255.238.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.12; Fri, 27 Dec 2019 12:17:52 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::19f2:b9fd:38db:7461]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::19f2:b9fd:38db:7461%4]) with mapi id 15.20.2581.007; Fri, 27 Dec 2019
 12:17:52 +0000
Received: from [10.156.60.99] (37.24.206.209) by
 LNXP123CA0003.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:d2::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.11 via Frontend Transport; Fri, 27 Dec 2019 12:17:50 +0000
From: Jan Beulich <JBeulich@suse.com>
To: George Dunlap <george.dunlap@citrix.com>
Thread-Topic: [PATCH V6 1/4] x86/mm: Add array_index_nospec to guest provided
 index values
Thread-Index: AQHVuZnmK7OgfjFiuE29BC4XwHoq4afIBKEAgAWfkACAADAxgIAAF9+A
Date: Fri, 27 Dec 2019 12:17:52 +0000
Message-ID: <2bcb3b04-7c94-2b90-37d8-5ffeac182b14@suse.com>
References: <20191223140409.32449-1-aisaila@bitdefender.com>
 <1e097c0e-1a99-2251-68f7-72f99f64c3bd@citrix.com>
 <1b5be15d-f93d-f2c4-736d-bba2fdd5bfb6@suse.com>
 <18cc8266-999b-37a1-ade9-fb6f23c89f1c@citrix.com>
In-Reply-To: <18cc8266-999b-37a1-ade9-fb6f23c89f1c@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP123CA0003.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:d2::15) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:166::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c795646b-cc59-423a-61b6-08d78ac6cb69
x-ms-traffictypediagnostic: MN2PR18MB3407:
x-microsoft-antispam-prvs: <MN2PR18MB3407FB739D43448A872E0905B32A0@MN2PR18MB3407.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0264FEA5C3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(346002)(366004)(376002)(39860400002)(136003)(189003)(199004)(2616005)(956004)(186003)(16526019)(71200400001)(6486002)(16576012)(316002)(52116002)(66446008)(66556008)(53546011)(86362001)(26005)(6916009)(66946007)(64756008)(66476007)(8936002)(7416002)(81166006)(8676002)(81156014)(54906003)(4326008)(36756003)(2906002)(478600001)(31696002)(31686004)(5660300002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB3407;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: fikpXHKAeLZ3C/uDAYGV/bH/29606aeWg0W1h2SxjAVCPkqwDrV6hFjbBTPJnX97JRnsGRdsRTrgndwlbV4LynTQqVhcluMgGNRfGudyKfdULIyM1JwV/oF1WQJJRQI5RwnRRWH46znVzak3Se1OCJjZw9mEeqtMVtmF3auen8ast0pYdp3k09bbUPlRQKUBcoOk+q5oDkBUbu5zWqeVEtFeIbbbeXrdcdoeaCjym1QHVYlqejJP8W68Du/3qHLF+zPcfm6anJCvD2kjUsN6cHMq9h5fng+dKquaFiOW3ZgDIOOBZc83XPEs69AvMADq9MROp1whmQhIvEuGJ0UGXL6akBxmayFmlRUsjlylNS+uM5l0CrBcG/BI8Khm1FIszIPUnu9lvIrZqnm94P9z0BMeHYTXbCw9KO7oZM3AzZ6iyEwna0RQStNz2MH3MLOW
x-ms-exchange-transport-forked: True
Content-ID: <A5E61972B6169143A23472982C7C5149@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c795646b-cc59-423a-61b6-08d78ac6cb69
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Dec 2019 12:17:52.3769 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: y/YCz2E3ewEnzseJWb1eFDNPbicJFhicLA4Ytt4CnYbdKL550IfDBL54zWmqSBU5jr2Y3gQ3hJhX1I8rhL2saA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3407
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

T24gMjcuMTIuMjAxOSAxMTo1MiwgR2VvcmdlIER1bmxhcCB3cm90ZToNCj4gT24gMTIvMjcvMTkg
Nzo1OSBBTSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAyMy4xMi4yMDE5IDE5OjA4LCBHZW9y
Z2UgRHVubGFwIHdyb3RlOg0KPj4+IFdoYXQgYWJvdXQgdGhlIGF0dGFjaGVkIHNlcmllcyBvZiBw
YXRjaGVzIChjb21waWxlLXRlc3RlZCBvbmx5KT8NCj4+DQo+PiBUaGlzIC4uLg0KPj4NCj4+PiAr
I2RlZmluZSBub3NwZWNfY2xpcChpbmRleCwgc2l6ZSkgICAgICAgICAgICAgICAgIFwNCj4+PiAr
ICAgICh7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4+PiAr
ICAgICAgICBib29sIGNsaXBwZWQgPSAoaW5kZXggPj0gc2l6ZSk7ICAgICAgICAgIFwNCj4+PiAr
ICAgICAgICBpbmRleCA9IGFycmF5X2luZGV4X25vc3BlYyhpbmRleCwgc2l6ZSk7IFwNCj4+PiAr
ICAgICAgICBjbGlwcGVkOyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4+PiAr
ICAgIH0pDQo+Pg0KPj4gLi4uIGluIHBhcnRpY3VsYXIgbWF5IG1pc2d1aWRlIHBlb3BsZSBvbiBp
dHMgdXNlOiBJZiB0aGUgY2xpcHBlZA0KPj4gImluZGV4IiBnZXRzIHN0b3JlZCBpbiBhIHJlZ2lz
dGVyLCBhbGwgaXMgZ29pbmcgdG8gYmUgZmluZSAoYWZhaWN0KSwNCj4+IGJ1dCBpZiBpdCBlbmRz
IHVwIGluIG1lbW9yeSwgdGhlcmUncyBiZSBuZXcgKG1pcy0pc3BlY3VsYXRpb24NCj4+IG9wcG9y
dHVuaXRpZXMuDQo+IA0KPiBUaGF0IG1ha2VzIHNlbnNlOyBidXQgaW4gdGhhdCBjYXNlIGNvZGUg
bGlrZSB0aGlzOg0KPiANCj4+ICsgICAgaWR4ID0gYXJyYXlfaW5kZXhfbm9zcGVjKGlkeCwgTUFY
X0FMVFAyTSk7DQo+PiArDQo+IA0KPiAuLi5jb3VsZCBlbmQgdXAgc3RvcmVkIG9uIHRoZSBzdGFj
ayBhbmQgcmUtcmVhZCwgY291bGRuJ3QgaXQ/ICBJIG1lYW4NCj4geWVzLCBpdCdzICp2ZXJ5IGxp
a2VseSogZ29pbmcgdG8gc3RheSBpbiBhIHJlZ2lzdGVyLCBidXQgdGhlcmUncyBubyB3YXkNCj4g
dG8gYWN0dWFsbHkgZ3VhcmFudGVlIGl0LCBpcyB0aGVyZT8NCg0KSW5kZWVkIC0gaGVuY2UgbXkg
IlNvbWUgb2YgdGhlIGNsaXBwaW5nIGRvbmUgaW4gdGhlIHBhdGNoZXMgaXMNCmFscmVhZHkgbm90
IGZ1bGx5IHNhZmUgYWdhaW5zdCB0aGlzIiBpbiB0aGUgcHJpb3IgcmVzcG9uc2UgKCJ0aGUNCnBh
dGNoZXMiIG1lYW5pbmcgQWxleGFuZHJ1J3MsIG5vdCB5b3VycywgYW5kIGl0IHdvdWxkIHByb2Jh
Ymx5DQpiZXR0ZXIgaGF2ZSBiZWVuIHNpbmd1bGFyKS4NCg0KSmFuDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
