Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6717512B48A
	for <lists+xen-devel@lfdr.de>; Fri, 27 Dec 2019 13:25:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ikocK-0004p3-S5; Fri, 27 Dec 2019 12:21:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=j2i0=2R=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ikocJ-0004oy-At
 for xen-devel@lists.xenproject.org; Fri, 27 Dec 2019 12:21:19 +0000
X-Inumbo-ID: 59605732-28a3-11ea-b6f1-bc764e2007e4
Received: from m9a0013g.houston.softwaregrp.com (unknown [15.124.64.91])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 59605732-28a3-11ea-b6f1-bc764e2007e4;
 Fri, 27 Dec 2019 12:21:08 +0000 (UTC)
Received: FROM m9a0013g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0013g.houston.softwaregrp.com WITH ESMTP; 
 Fri, 27 Dec 2019 12:20:14 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 27 Dec 2019 12:14:56 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 27 Dec 2019 12:14:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HVBxAN4vRRm+RG1/dXNfN+CLpYluJgbPnMHQKQfRDeCG3NNdvAwsZ+OlvFOA07tEhSV+rtZB6FQmJmvN2iOV7vkX3dmeR6HStPYUFBzhnYXmMDYPWTJ5KS9IxX+1g/9mKM0FRLdIUGZLpcGAkG/6XwF/u8KZSr2lm+LuZzwQLfUh8eWmMfT0twN6tsyxmtzArpTmA8TcEuETuTUUsYf3PE1Ut49bi2fweiDpFupZpsZqldBsQC50fvD4hb+12WEGIHqj+gm+HtJqvxWuQ5ZeLJPVj07tQBSTZl6SZhQ+1LM1UJ16K2ddypltfmgdLQLjWO9QxdXVDyNGIxCRWWVbsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9YVw8MXD8Vh2W0JjFyCM5m537qzwAoozQ/Ba6qMQKg=;
 b=RAgqAjapet8a05sS9L2rc4B7RakmWRnCR6oTBGoaeZ1fE/d4XzX3UoQ14UW/AVhjmtNvRERvr2HEltIn0LmTAHAtXl2RIxH70NIwMIHy7FwcYPlqDqx8YUGf2ozGW8OkSd7/GqASCAU6MBU64qelpwx8jg3gczYqP7hQFOcu9oOaLiSzsFRPupsup8AgOIilKjzxRdkYVX4PV1Z4DJ2KR6ch8Ae/IuLy5kaBtdDnIvQJuqxAS0T++sk1KHgZN+Mraa+VII8ckTbXGlriHA4YJb4t306DGoHb0tvsqqpZKvkD2iinWimcwso1HQKV9AnzVSZVBUvHx3JApBuOw9TXUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.237.86) by
 MN2SPR01MB0008.namprd18.prod.outlook.com (20.179.144.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.11; Fri, 27 Dec 2019 12:14:55 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::19f2:b9fd:38db:7461]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::19f2:b9fd:38db:7461%4]) with mapi id 15.20.2581.007; Fri, 27 Dec 2019
 12:14:55 +0000
Received: from [10.156.60.99] (37.24.206.209) by
 LO2P265CA0071.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:60::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2581.11 via Frontend Transport; Fri, 27 Dec 2019 12:14:53 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Julien Grall <julien.grall@gmail.com>
Thread-Topic: [Xen-devel] [PATCH] x86: move vgc_flags to struct pv_vcpu
Thread-Index: AQHVtz0W7fLZmjjTFESLDQs6+XYow6fH/5KAgAWuTICAADUHgIAADUOA
Date: Fri, 27 Dec 2019 12:14:54 +0000
Message-ID: <86f54aec-1120-62e4-dde3-4d49c54a8188@suse.com>
References: <ce92465a-8a54-e8b3-035f-46b695704169@suse.com>
 <7168c5da-c250-a79f-3b11-a4c516a9e220@xen.org>
 <dc927ca7-6072-b89b-70ff-33844b5d3a44@suse.com>
 <CAF3u54A+HJjZ-C=CF3BkAwqebGf_i2MpuTsnkLo+L6ac2DcBWA@mail.gmail.com>
In-Reply-To: <CAF3u54A+HJjZ-C=CF3BkAwqebGf_i2MpuTsnkLo+L6ac2DcBWA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0071.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:60::35) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:166::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b841fbd7-eb6a-4bb5-9b08-08d78ac661eb
x-ms-traffictypediagnostic: MN2SPR01MB0008:
x-microsoft-antispam-prvs: <MN2SPR01MB00083CE86A3D3A1967E7D53DB32A0@MN2SPR01MB0008.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0264FEA5C3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(189003)(199004)(66476007)(66556008)(66946007)(53546011)(71200400001)(4326008)(52116002)(64756008)(31686004)(478600001)(31696002)(86362001)(66446008)(36756003)(316002)(16576012)(2616005)(956004)(6486002)(81156014)(2906002)(16526019)(5660300002)(54906003)(26005)(186003)(81166006)(8936002)(6916009)(8676002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2SPR01MB0008;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Bznq+jobqYyzMYyK+CZrT58l/xCdifoQX9zXj5GX2ADu5HLNXNs0a0VmSodMORF3GdpZLWct+hcOiOZ61hg49g72IMhAljMMZAvoTFc4njfLBBw4hn3Uy84scVM/28ukwhN2dy1jwWcfVWYfpocFrU02RN2oCHXKYEB3C+yTw26n/EMsiaWxptaHNvObTP1uJMRlJBw1frWHtq48R2NwJjPeosFOt99R+/+Udg2173L49sXkKhMZYnFCV7GY4rHp8t9VsxJmbyBf8P65iP0f7c8sA1fDsUVQS0GNrVO4kvdpevaytFHZhsmQK4SpeASqcHmALD2dtUtCL2Ymj+0GvEOpmQ7PBL67fxLOQbszqrw19IXsdl7YvlEIUhjHtrO0hf9oYahdsxqz2EBC+yxVDthcqJ3raQ4juHd0O2yG8PIycpa2jnXCVDpdzVaX10/8
x-ms-exchange-transport-forked: True
Content-ID: <F3F8DBB72BD24B4BAE50B3D69084884D@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: b841fbd7-eb6a-4bb5-9b08-08d78ac661eb
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Dec 2019 12:14:55.0201 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: PH0ElWOocS7vsS0oGNO+3tsQ6iLZ1HP7e9idtAcqWkT9cEil8aZtXJ9R+hgAtNNfdcBny5kCC1YGkzSulJbBZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2SPR01MB0008
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] x86: move vgc_flags to struct pv_vcpu
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjcuMTIuMjAxOSAxMjoyNywgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBIaSBKYW4sDQo+IA0K
PiBPbiBGcmksIDI3IERlYyAyMDE5LCAwOToyMiBKYW4gQmV1bGljaCwgPEpCZXVsaWNoQHN1c2Uu
Y29tPiB3cm90ZToNCj4gDQo+PiBPbiAyMy4xMi4yMDE5IDE4OjMzLCBKdWxpZW4gR3JhbGwgd3Jv
dGU6DQo+Pj4gSGkgSmFuLA0KPj4+DQo+Pj4gT24gMjAvMTIvMjAxOSAxNDo1NSwgSmFuIEJldWxp
Y2ggd3JvdGU6DQo+Pj4+IFRoZXJlJ3MgYmVlbiBlZmZlY3RpdmVseSBubyB1c2Ugb2YgdGhlIGZp
ZWxkIGZvciBIVk0uDQo+Pj4+DQo+Pj4+IEFsc28gc2hyaW5rIHRoZSBmaWVsZCB0byB1bnNpZ25l
ZCBpbnQsIGV2ZW4gaWYgdGhpcyBkb2Vzbid0IGltbWVkaWF0ZWx5DQo+Pj4+IHlpZWxkIGFueSBz
cGFjZSBiZW5lZml0IGZvciB0aGUgc3RydWN0dXJlIGl0c2VsZi4gVGhlIHJlc3VsdGluZyAzMi1i
aXQNCj4+Pj4gcGFkZGluZyBzbG90IGNhbiBldmVudHVhbGx5IGJlIHVzZWQgZm9yIHNvbWUgb3Ro
ZXIgZmllbGQuIFRoZSBjaGFuZ2UgaW4NCj4+Pj4gc2l6ZSBtYWtlcyBhY2Nlc3NlcyBzbGlnaHRs
eSBtb3JlIGVmZmljaWVudCB0aG91Z2gsIGFzIG5vIFJFWC5XIHByZWZpeA0KPj4+PiBpcyBnb2lu
ZyB0byBiZSBuZWVkZWQgYW55bW9yZSBvbiB0aGUgcmVzcGVjdGl2ZSBpbnNucy4NCj4+Pj4NCj4+
Pj4gTWlycm9yIHRoZSBIVk0gc2lkZSBjaGFuZ2UgaGVyZSAoZHJvcHBpbmcgb2Ygc2V0dGluZyB0
aGUgZmllbGQgdG8NCj4+Pj4gVkdDRl9vbmxpbmUpIGFsc28gdG8gQXJtLCBvbiB0aGUgYXNzdW1w
dGlvbiB0aGF0IGl0IHdhcyBjbG9uZWQgbGlrZQ0KPj4+PiB0aGlzIG9yaWdpbmFsbHkuIFZHQ0Zf
b25saW5lIHJlYWxseSBzaG91bGQgc2ltcGx5IGFuZCBjb25zaXN0ZW50bHkgYmUNCj4+Pj4gdGhl
IGd1ZXN0IHZpZXcgb2YgdGhlIGludmVyc2Ugb2YgVlBGX2Rvd24sIGFuZCBoZW5jZSBuZWVkcyBy
ZXByZXNlbnRpbmcNCj4+Pj4gb25seSBpbiB0aGUgZ2V0L3NldCB2Q1BVIGNvbnRleHQgaW50ZXJm
YWNlcy4NCj4+Pg0KPj4+IEJ1dCB2UFNDSSBpcyBqdXN0IGEgd3JhcHBlciB0byBnZXQvc2V0IHZD
UFUgY29udGV4dCBpbnRlcmZhY2VzLiBZb3VyDQo+Pj4gY2hhbmdlcyBiZWxvdyB3aWxsIGNsZWFy
bHkgYnJlYWsgYnJpbmctdXAgb2Ygc2Vjb25kYXJ5IHZDUFVzIG9uIEFybS4NCj4+Pg0KPj4+IFRo
aXMgaXMgYmVjYXVzZSBhcmNoX3NldF9ndWVzdF9pbmZvKCkgd2lsbCByZWx5IG9uIHRoaXMgZmxh
ZyB0bw0KPj4+IGNsZWFyL3NldCBWUEZfZG93biBpbiB0aGUgcGF1c2UgZmxhZ3MuDQo+Pj4NCj4+
PiBTbyBJIHRoaW5rIHRoZSBsaW5lIGluIGFybS92cHNjaS5jIHNob3VsZCBiZSBsZWZ0IGFsb25l
Lg0KPj4NCj4+IE9oLCBJIHNlZSAtIEkgZGlkbid0IG5vdGljZSB0aGlzIChhYil1c2UgZGVzcGl0
ZSAuLi4NCj4+DQo+IA0KPiBPdXQgb2YgSW50ZXJlc3QsIHdoeSBkbyB5b3UgdGhpbmsgaXQgaXMg
YW4gYWJ1c2UgaGVyZSBhbmQgbm90IGluIHRoZQ0KPiB0b29sc3RhY2s/DQo+IA0KPiBIb3cgZG8g
eW91IHN1Z2dlc3QgdG8gaW1wcm92ZSBpdD8gSSBjYW4gYWRkIGl0IGluIG15IGltcHJvdmVtZW50
IGxpc3QgZm9yDQo+IEFybS4NCg0KT2gsICJhYnVzZSIgd2FzIGFib3V0IHRoZSBhcmNoX3NldF9n
dWVzdF9pbmZvKCkgdXNlLCBub3QgdGhlIHVzZSBvZg0KdGhlIGZsYWcgYnkgdGhlIHRvb2wgc3Rh
Y2suDQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
