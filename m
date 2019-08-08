Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6E08620F
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 14:42:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvhi2-0004ml-2k; Thu, 08 Aug 2019 12:39:58 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvhi0-0004mZ-42
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 12:39:56 +0000
X-Inumbo-ID: 9d960752-b9d9-11e9-8980-bc764e045a96
Received: from m4a0040g.houston.softwaregrp.com (unknown [15.124.2.86])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9d960752-b9d9-11e9-8980-bc764e045a96;
 Thu, 08 Aug 2019 12:39:54 +0000 (UTC)
Received: FROM m4a0040g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0040g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  8 Aug 2019 12:39:38 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 8 Aug 2019 12:37:42 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 8 Aug 2019 12:37:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dup0oI6fIF3Lmg0pAnZLgh1xPv9Kg60Gri2b5Xer4BpPzZ821HacGe3hfOzSpX0baH+AZyXm/8E8OeopI5jEdlR2nA3n791gCpmMBbXl2D5Z3Juz3k9HPdyvXHtx/iAgTEQLEBzEUD9zAImfAImxgabx7zKWzX7yYJy73Pc80g8aVrRj/9ARAcgICqVZpXkdxAxvuqDFQWhWxyIQ1qm/QA5wuqxSGuK1ajrHtuqY91yuZEsTyUUi2qC2UfNyJWfJYmx1OGbmKBSfr0CkUsRiQUzA31Nz7tx8iUybWzWYKzDSOKjNpTDm4K8C2kp665QQkxUNi2coG0c4G/eCgqHkAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHeDzcc0PnE0SgCRGQ6PROIVjIm8OLKEselFHb18VWw=;
 b=H8nUXkSci1hewU88YZgPxFFZRM9Tky7h0sl0/1AX+I1yGIn8g7ey9i1Y1jpED7zd8p33/+hHb6ydacfASAlmh5RUlcepiVdMxvOcsx1F9P8LKz/TAUENRvQykPgKvJHdvVleH4nricBJpgiWVgsl8BUaTmjWPtY8wAjPHITjWHUcBF70OC3AmVLW2F5P7YfkZtEkQYJwu201FRErKr0dGBnx+WeCclw60C0cd06xndR/VMgrgUboe3tFerIyr1r+Rm1nnsko01DH4oGsYg0f/ktOa9HckYB61z4q5qJ2S14CyF4cuEcgiYNg0oNGy/UvTxOUH78hC37QIbGqYMpeTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB3438.namprd18.prod.outlook.com (10.255.239.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Thu, 8 Aug 2019 12:37:40 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 12:37:40 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH] EFI: add efi=mapbs option and parse efi= early
Thread-Index: AQHVTYDiJDDJv46naU6f+B83HbCEaabw/9UdgAAxRgA=
Date: Thu, 8 Aug 2019 12:37:40 +0000
Message-ID: <aec7bba6-ae10-1ded-5c3f-7d18b73fec0c@suse.com>
References: <20190808003158.5256-1-marmarek@invisiblethingslab.com>
 <22d9c709-129b-d7c9-ba44-72ec930c655a@citrix.com>
In-Reply-To: <22d9c709-129b-d7c9-ba44-72ec930c655a@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR06CA0045.eurprd06.prod.outlook.com
 (2603:10a6:208:aa::22) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b22841fa-2247-4db7-f09e-08d71bfd33bf
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB3438; 
x-ms-traffictypediagnostic: MN2PR18MB3438:
x-microsoft-antispam-prvs: <MN2PR18MB34384F18440BC2897CB17198B3D70@MN2PR18MB3438.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(346002)(136003)(39860400002)(376002)(366004)(189003)(199004)(7736002)(31696002)(36756003)(66574012)(6486002)(86362001)(66066001)(6436002)(2906002)(305945005)(5660300002)(446003)(229853002)(71200400001)(11346002)(2616005)(14444005)(256004)(186003)(476003)(6512007)(99286004)(486006)(53546011)(53936002)(6506007)(386003)(8676002)(102836004)(80792005)(6116002)(71190400001)(81156014)(14454004)(26005)(6916009)(81166006)(52116002)(54906003)(3846002)(76176011)(478600001)(8936002)(316002)(7416002)(25786009)(66556008)(66476007)(64756008)(66446008)(66946007)(31686004)(6246003)(4326008);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB3438;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1PRb+l9KeKGmuZlLDeRVGoEUzrFF1PqJRi03cotpyTQPxvII4ustDepO5Y595f0/JxNUKTjcVFW24c0cxHC7Z63XRKQCR6LUaOVZYbTSOGWP8DuQGR26UbdcWfbvAHLmjL69axGi7MSno7ZjmZOODQyJ2L/H7bvCA6F9P4hHe8r5MHFCkjVkaqy5MI8sWbqC9aL+TfxfRFeOU+a6C/+n70FfMqQ94x7JZBLEqq3Z90pPaFBvGo6c7ZqWUDXhDReAHpX3dHZ32ZALKp99eT+y1elFd5NNPghnBXjrMgphIa9fmv2sUv+Uwp9twjiGPjNsZSNHZe78djZw/b7vyYSTPHMyAD22GdqC0zFOrIbRwN+ICk/Wiw/L9KhtAJT79ecNGsOwWj7oj80HBW13ZAjq5Z8Vuik3cgphdkD12iQeAVE=
x-ms-exchange-transport-forked: True
Content-ID: <31A8F97A0E021A4BAF57F46E34F0E39C@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b22841fa-2247-4db7-f09e-08d71bfd33bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 12:37:40.6856 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zCh+MWBMAnGOlHc4nFL/Y+8pnfqrA1b6v7yFZzR/aCSE3dumU3WYkguffrS4ifmWCERrGAhbTjjnQ3q7GX9Wvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3438
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] EFI: add efi=mapbs option and parse efi=
 early
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, WeiLiu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
 <marmarek@invisiblethingslab.com>, Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDguMjAxOSAxMTo0MCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMDgvMDgvMjAx
OSAwMTozMSwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyb3RlOg0KPj4gV2hlbiBib290
aW5nIFhlbiB2aWEgeGVuLmVmaSwgdGhlcmUgaXMgL21hcGJzIG9wdGlvbiB0byB3b3JrYXJvdW5k
DQo+PiBjZXJ0YWluIHBsYXRmb3JtIGlzc3VlcyAoYWRkZWQgaW4gZjM2ODg2YmRmNCAiRUZJL2Vh
cmx5OiBhZGQgL21hcGJzIHRvDQo+PiBtYXAgRWZpQm9vdFNlcnZpY2Vze0NvZGUsRGF0YX0iKS4g
QWRkIHN1cHBvcnQgZm9yIGVmaT1tYXBicyBvbiBYZW4NCj4+IGNtZGxpbmUgZm9yIHRoZSBzYW1l
IGVmZmVjdCBhbmQgcGFyc2UgaXQgdmVyeSBlYXJseSBpbiB0aGUNCj4+IG11bHRpYm9vdDIrRUZJ
IGJvb3QgcGF0aC4NCj4+DQo+PiBOb3JtYWxseSBjbWRsaW5lIGlzIHBhcnNlZCBhZnRlciByZWxv
Y2F0aW5nIE1CMiBzdHJ1Y3R1cmUsIHdoaWNoIGhhcHBlbnMNCj4+IHRvbyBsYXRlLiBUbyBoYXZl
IGVmaT0gcGFyc2VkIGVhcmx5IGVub3VnaCwgc2F2ZSBjbWRsaW5lIHBvaW50ZXIgaW4NCj4+IGhl
YWQuUyBhbmQgcGFzcyBpdCBhcyB5ZXQgYW5vdGhlciBhcmd1bWVudCB0byBlZmlfbXVsdGlib290
MigpLiBUaGlzDQo+PiB3YXkgd2UgYXZvaWQgaW50cm9kdWNpbmcgeWV0IGFub3RoZXIgTUIyIHN0
cnVjdHVyZSBwYXJzZXIuDQo+Pg0KPj4gVG8ga2VlcCBjb25zaXN0ZW5jeSwgaGFuZGxlIGVmaT0g
cGFyYW1ldGVyIGVhcmx5IGluIHhlbi5lZmkgdG9vLCBib3RoIGluDQo+PiB4ZW4uZWZpIGNvbW1h
bmQgbGluZSBhbmQgY2ZnIGZpbGUuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogTWFyZWsgTWFyY3p5
a293c2tpLUfDs3JlY2tpIDxtYXJtYXJla0BpbnZpc2libGV0aGluZ3NsYWIuY29tPg0KPiANCj4g
SSdtIHZlcnkgc29ycnkgdG8gZG8gdGhpcyB0byB5b3UsIGJ1dCBJJ20gZ29pbmcgdG8gb2JqZWN0
IHRvIHRoZSBwYXRjaA0KPiAoaW4gcHJpbmNpcGxlLsKgIEkgdGhpbmsgdGhlIGNvbW1hbmQgbGlu
ZSBvcHRpb24gaXRzZWxmIGlzIGZpbmUgYnV0Li4uKQ0KPiANCj4gV2hhdCBkb2VzIExpbnV4IGRv
IGRpZmZlcmVudGx5IGhlcmU/DQo+IA0KPiBJdCBpcyBhY3RpdmVseSBkYW1hZ2luZyB0byB0aGUg
WGVuIGNvbW11bml0eSB0byB1c2VycyB0byBmb3JjZSB1c2Vycw0KPiB0d2VhayBjb21tYW5kIGxp
bmVzIGluIG9yZGVyIHRvIGJvb3QvcmVjb3ZlciB0aGVpciBzeXN0ZW0sIGFuZCBpdCBsb29rcw0K
PiBlc3BlY2lhbGx5IGVtYmFycmFzc2luZyB3aGVuIG90aGVyIE9TZXMgY29wZSBhdXRvbWF0aWNh
bGx5LsKgIFdlIGhhdmUNCj4gY29tcGF0aWJpbGl0eSBmb3IgYWxsIGtpbmRzIG9mIG90aGVyIGZp
cm13YXJlIHNjcmV3LXVwcywgZXhjZXB0IEVGSSBpdA0KPiBzZWVtcywgYW5kIHRoaXMgbmVlZHMg
dG8gY2hhbmdlLg0KPiANCj4gU28gd2hpbGUgSSBoYXZlIG5vIG9iamVjdGlvbiB0byB0aGUgb3B0
aW9uIHBlciBzYXksIEkgZG9uJ3QgdGhpbmsgdGhpcw0KPiBwYXRjaCBpcyByZWFzb25hYmxlIGFz
IGEgImZpeCIgdG8gdGhlIHByb2JsZW0gYXMgZmFyIGFzIGVuZCB1c2VycyBhcmUNCj4gY29uY2Vy
bmVkLg0KDQpBbmQgeW91ciBzdWdnZXN0aW9uIHRoZW4gaXMgdG8gYWx3YXlzIG1hcCAoYW5kIG5v
dCB1c2UpIGFsbCBib290DQpzZXJ2aWNlcyBtZW1vcnksIGNvbnRyYXJ5IHRvIGFsbCBpbnRlbnRp
b25zIG9mIHRoZSBFRkkgc3BlYz8NCg0KQXMgdG8geW91ciBtb3JlIGdlbmVyYWwgcmFudDogSSB0
aGluayBpdCBpcyB3cm9uZyB0byBoYXZlIG1vcmUNCnRoYW4gdmVyeSBzaW1wbGUgYW5kIGxvdyBv
dmVyaGVhZCB3b3JrYXJvdW5kcyBlbmFibGVkICJqdXN0IGluDQpjYXNlIi4gVGhlIHZhc3QgbWFq
b3JpdHkgb2YgdGhlIHdvcmthcm91bmRzIHdlIGhhdmUgaW4gcGxhY2UNCmFyZSBrZXllZCB0byBz
cGVjaWZpYyB2ZXJzaW9ucyBvZiBzb21ldGhpbmcsIG9yIGUuZy4gRE1JDQpwcm9wZXJ0aWVzIG9m
IHN5c3RlbXMuIEkgY2VydGFpbmx5IHdvdWxkbid0IG1pbmQgRE1JIGJhc2VkDQplbmFibGluZyBv
ZiB3b3JrYXJvdW5kcyBsaWtlIHRoZSBvbmUgaGVyZSwgYnV0IEknbSBnb2luZyB0bw0KY29udGlu
dWUgdG8gcHVzaCBiYWNrIG9uIGF0dGVtcHRzIHRvIGNyaXBwbGUgdGhlIEVGSSBjb2RlIGp1c3QN
CmJlY2F1c2UgX3NvbWVfIHN5c3RlbXMgZG9uJ3QgaGF2ZSBhIHNlbnNpYmxlIEVGSSBpbXBsZW1l
bnRhdGlvbi4NCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
