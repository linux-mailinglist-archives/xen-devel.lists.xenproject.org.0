Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F7385B6A
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 09:17:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvcbx-0001vD-RJ; Thu, 08 Aug 2019 07:13:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvcbw-0001v8-SW
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 07:13:20 +0000
X-Inumbo-ID: fffbfabf-b9ab-11e9-8980-bc764e045a96
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fffbfabf-b9ab-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 07:13:20 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  8 Aug 2019 07:13:06 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 8 Aug 2019 07:09:01 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 8 Aug 2019 07:09:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pg04ZYdF+uaB8GX6gFI2gWXtUo3iGJEhIpZK6a7FxQUHxKYIvv9vG9mYVc+7obe7RnE0AJ7jU7OCVyAtS39qLP16eMklEg5YCzqpxkvqAsidno8GIbKDgS5YWGNz3lqk6HBPGq8OJh/WLwdLJVAfKf5Ws33CP4tgDrBUPHdKrU1cnfQi/pt+GwtNvYLH5XXxq2kjNUPmI1f1cpZ5qLrGrAZ9MsMc6dga+Y6Sz4mdYk/m+Hr8Wy2EjgeWwvfxBFq7f67EwW/wVNh/UU9JVeDRi4ghqOwvE2+ykGJ03RJGxTFoDbvWYWONcSJFGzNOUxbbmbOPRZt+aqk7mbDEmKKulw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imu03eqnxs/tH08Tthf1skaCqOwPCRy9ni+BOAlkAv0=;
 b=TQFewt/XIeG6u0xf9y9R3mHj4rwzq+nDE6zZz/fCIFXq+VjyX3/UyTuXGPt5GkuSeVo49ZUp3wQMhV0F4YJtkWFiRCK3w7l4R1FaOpo0/R/SptnLdy630U3BjvxmT5izcWc97GjLZwDcmei/fwpWmkp5ZIaGAJpjTqsCXvtkwd3SIoG+D30KiKyPZQ9zHg/orm2yaqZomsBL496kzceRLXFJKQR77rWDv+zTyxgVhoxZqxMKeI8CEE1EkVh2s860+D5Vicq8vsxtR9RcLDpipZM7FiBJNIxQW/nx8VvYjgcdTm+cqecPswYRrHpzWndiecsoKCSu/QJdY6FzdMIO6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB2957.namprd18.prod.outlook.com (20.179.21.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Thu, 8 Aug 2019 07:09:00 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 07:09:00 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Juergen Gross <JGross@suse.com>
Thread-Topic: [PATCH 3/4] xen: print lock profile info in panic()
Thread-Index: AQHVTSzY4tguuixAZkiEjkiM0DHSHqbw1e8A
Date: Thu, 8 Aug 2019 07:09:00 +0000
Message-ID: <2ac0f92e-8416-7095-5150-edc3acff5364@suse.com>
References: <20190807143119.8360-1-jgross@suse.com>
 <20190807143119.8360-4-jgross@suse.com>
In-Reply-To: <20190807143119.8360-4-jgross@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR04CA0004.eurprd04.prod.outlook.com
 (2603:10a6:208:122::17) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 259ab3fd-eb8a-477f-5323-08d71bcf496d
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB2957; 
x-ms-traffictypediagnostic: MN2PR18MB2957:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR18MB295776CCF216353E3DA46770B3D70@MN2PR18MB2957.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(346002)(366004)(396003)(39860400002)(136003)(199004)(189003)(2906002)(4326008)(446003)(37006003)(11346002)(486006)(229853002)(2616005)(3846002)(6246003)(66946007)(305945005)(476003)(6116002)(66446008)(64756008)(66556008)(66476007)(66066001)(7736002)(6512007)(6436002)(53936002)(86362001)(6862004)(54906003)(6486002)(71190400001)(14444005)(256004)(5660300002)(316002)(71200400001)(8936002)(31696002)(6636002)(81156014)(81166006)(31686004)(102836004)(52116002)(6506007)(76176011)(26005)(186003)(478600001)(53546011)(386003)(99286004)(4744005)(36756003)(80792005)(14454004)(25786009)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB2957;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 5I3UL/odDyEbMJtR9YnvxpQ7bT0M2LBStl+wcZLPt8METL626mCiRVvBk0RsXCHpJAxlgPgNdh9sNQMw7x+kJ+9fNTbh/e+Nyrwe+nRwrji1CpP662R9jHyQ4s0JBqjufmhfXi/98fus5vZD1oYLa2gS4gdRDR7jvl+uKYcowtJhP6PrVTeQjOdmEIfHAPJ5VAf8BZnrow+9heJ86C2eDz2rKfVt7ywDLNiUzVy1sqhQkPkfOJBeiFB2IJgcQ+thU8ARHtNWkHUqD3ejjlp78npy8s5jz007iPpOWD/AUXwjchVxPqjMBU6yPBOevbpU9AGLSFh8b3K/yi0KwS7bbcdjeU0haJpvEm2QJrcF1790N6swYIp6830ysMAAKf6swycOhp65csHnKP/lPLQC1Po/1yVDMfv0awx+9+WrBJE=
Content-ID: <1BD108D9C77B5948A63E7A17DECE2A5D@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 259ab3fd-eb8a-477f-5323-08d71bcf496d
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 07:09:00.3994 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1WIbSmUTvh1dTViknoor25Z8Gnr51VpyiYc8jtQrAwJ6maJts9OikgLR3iZcEanOEleTtxD6octG9vsVXbXw1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2957
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 3/4] xen: print lock profile info in panic()
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien
 Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDcuMDguMjAxOSAxNjozMSwgSnVlcmdlbiBHcm9zcyB3cm90ZToNCj4gLS0tIGEveGVuL0tj
b25maWcuZGVidWcNCj4gKysrIGIveGVuL0tjb25maWcuZGVidWcNCj4gQEAgLTUzLDYgKzUzLDcg
QEAgY29uZmlnIFNQSU5MT0NLX0RFQlVHDQo+ICAgDQo+ICAgY29uZmlnIExPQ0tfUFJPRklMRQ0K
PiAgIAlib29sICJMb2NrIFByb2ZpbGluZyINCj4gKwlzZWxlY3QgU1BJTkxPQ0tfREVCVUcNCj4g
ICAJLS0taGVscC0tLQ0KPiAgIAkgIExvY2sgcHJvZmlsaW5nIGFsbG93cyB5b3UgdG8gc2VlIGhv
dyBvZnRlbiBsb2NrcyBhcmUgdGFrZW4gYW5kIGJsb2NrZWQuDQo+ICAgCSAgWW91IGNhbiB1c2Ug
c2VyaWFsIGNvbnNvbGUgdG8gcHJpbnQgKGFuZCByZXNldCkgdXNpbmcgJ2wnIGFuZCAnTCcNCg0K
SW4gd2hpY2ggY2FzZSwgZm9yIHNlbnNpYmxlIHVzZXIgZXhwZXJpZW5jZSwgdGhlIHNlbGVjdGVk
DQpvcHRpb24gc2hvdWxkIGNvbWUgYWZ0ZXIgdGhpcyBvbmUuIFRoZSB3YXkgaXQgaXMgbm93IGFm
YWljdA0KdGhlcmUnbGwgYmUgYSBwcm9tcHQgZm9yIFNQSU5MT0NLX0RFQlVHLCB0aGUgdXNlciBt
YXkgc2F5DQoibm8iLCBqdXN0IHRvIGZpbmQgdGhhdCBiZWNhdXNlIG9mIHNheWluZyAieWVzIiBo
ZXJlIGl0J2xsDQpiZSB0dXJuZWQgb24gYW55d2F5LiBXaGVyZWFzIHdpdGggc3dpdGNoZWQgb3Jk
ZXJpbmcgdGhlcmUnbGwNCmJlIG5vIHByb21wdCBmb3IgdGhlIGRlYnVnIG9wdGlvbiBhdCBhbGwg
KGFnYWluIGFmYWljdCkgaWYNCnRoZSBwcm9maWxpbmcgb3B0aW9uIHdhcyBzZXQgdG8gInllcyIu
DQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
