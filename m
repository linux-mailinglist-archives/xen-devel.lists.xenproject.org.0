Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E96CC81C83
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 15:24:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hucva-00045V-JC; Mon, 05 Aug 2019 13:21:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hucvZ-00045Q-IY
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 13:21:29 +0000
X-Inumbo-ID: e67d648e-b783-11e9-9bbd-93d757ece0d7
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e67d648e-b783-11e9-9bbd-93d757ece0d7;
 Mon, 05 Aug 2019 13:21:25 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.147) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  5 Aug 2019 13:21:14 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M4W0335.microfocus.com (2002:f78:1193::f78:1193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 5 Aug 2019 13:19:37 +0000
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (15.124.72.14) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 5 Aug 2019 13:19:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TC8GcKZsKJuj0MUODEkx4q0BbhDpA9vI590KbvokPuuRukcKUdcIu2VNV44t2oYet9gXel0fdiuy6cKlc4RP0QBP/t2Gq/8J2l1QLbnNb0ulc83EWCALCApuzCmMXr7GZIUrWpn8cylofpT8DAzc+2ZO7ytR0LPz1XEow5WR/tZRhddq2qSfW2mznfNQ3XBUfz/fVwswZhgHxudcxOoJj9/N3tYA88j9KM4+m1wWOkHbp/VC2PunogRN1yTt+c3l8i41gEW2fwAvtXwPiR3M72TLtrFtWGUh305IAa+rDjnJqLGq+YC6/6eYvtE896QnbRtAG5uQqn2mPcJX5K1hlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NzB8Z2nBme+bwgG064RFeStFu7OvzGBQgk0v6+nC/Ww=;
 b=HDG4ch7aISW4VJsCPsrk7lG47lt0b6ALIzZNGw8CPk3BG8io3vwVuF9GeCpOluP0TN50i5F8NBksn0CWsoSrApTeddtH0L7j6cdYJGpuMz1Jc64gQ55E+JhJt0YOWR5PDYEB8wngbMdj3yAsCOyL0rv29pDeQv1LQD+4mVBgOOGqmB0faHE2Pv84b9OGtueHX9OEZt5DWyYgJZNBtUvVoSFqKnrMEbD1zmF6+4nQbuuLo/oIA6Eg5ooUUelHymvXtU/g1yJ+XKfs3hLre7dwqQEB2TDhcEb2fQGnu8AwccKYE2pPsZm3GQ2J1Lgv+KPZv+ZZcqvvTV76+9yLHKyYjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB2448.namprd18.prod.outlook.com (20.179.82.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Mon, 5 Aug 2019 13:19:35 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 13:19:35 +0000
From: Jan Beulich <JBeulich@suse.com>
To: George Dunlap <george.dunlap@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v2] CODING_STYLE: document intended usage of
 types
Thread-Index: AQHVS3zWhCjk0U9++E+I/4nSrlmXN6bsk+CA///xMbKAAATGAA==
Date: Mon, 5 Aug 2019 13:19:35 +0000
Message-ID: <72580391-d34e-aaf9-2e41-ab1df5967408@suse.com>
References: <5BFBBD7902000078001FFC9D@prv1-mh.provo.novell.com>
 <1b9eb9f8-1251-1c51-0a7b-4ba4811af205@citrix.com>
 <19e1f42b-04bb-bcf6-86ef-42685e5de263@suse.com>
 <f3ce014d-73c2-a86d-80d2-10f9d8aa34c0@citrix.com>
In-Reply-To: <f3ce014d-73c2-a86d-80d2-10f9d8aa34c0@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR06CA0071.eurprd06.prod.outlook.com
 (2603:10a6:208:aa::48) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1df0b84e-5025-4262-9b53-08d719a78f41
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB2448; 
x-ms-traffictypediagnostic: MN2PR18MB2448:
x-microsoft-antispam-prvs: <MN2PR18MB2448D75F272ACC2171E58BF5B3DA0@MN2PR18MB2448.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(199004)(189003)(52314003)(5660300002)(66476007)(52116002)(66946007)(66446008)(64756008)(66556008)(99286004)(478600001)(31686004)(4326008)(25786009)(66066001)(76176011)(31696002)(316002)(6436002)(7416002)(102836004)(53546011)(6506007)(386003)(6246003)(6512007)(86362001)(54906003)(6916009)(68736007)(305945005)(6486002)(256004)(81166006)(81156014)(2906002)(8936002)(53936002)(3846002)(6116002)(229853002)(8676002)(71200400001)(71190400001)(7736002)(186003)(486006)(26005)(36756003)(2616005)(476003)(80792005)(11346002)(14454004)(446003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB2448;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: L3wYg6iluhILCAexnw2Bu+rOT6JkTDGakp5TJuP6WH54FIS0U+UzOIDGXQdi5S0p1SwfsxdJssUQeKIsusr/UmxY5n1KH7MW5+emRsKoT3XVRbzLQoSMByu8uUKaOCzWg5G5eFkTuXJhaUb4vCyrZWcVFUNazUgV/4nswyfqqy59ETFy8m/GmoFKxENY8p2GhEbVrik1pnZSj+lMWiJpgUW7AwhWuBMOkRP7W36ZlAKOwoz++ytWDw0Kp2wX1uE5Dhue3T+1BnAY+lupOXbXO/VV8SP0HvqK4x+O3amK6e445eAO5j3Ae4YtAiMnhALHRiO8MYKth83dQXVGcjlNoz4e58NkC5+N+51DqGFePINEuyClZfXwATZhSD1i7+u57Cf24cMHx6o8mLfuOWwR5iKi9SdpqNiVjzNN8spU6xc=
Content-ID: <98D400FED334AA4C87DAEB1525D1B75E@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1df0b84e-5025-4262-9b53-08d719a78f41
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 13:19:35.2037 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2448
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2] CODING_STYLE: document intended usage of
 types
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 IanJackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDguMjAxOSAxNTowMSwgR2VvcmdlIER1bmxhcCB3cm90ZToNCj4gT24gOC81LzE5IDEy
OjU1IFBNLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9uIDA1LjA4LjIwMTkgMTI6NTgsIEdlb3Jn
ZSBEdW5sYXAgd3JvdGU6DQo+Pj4gT24gMTEvMjYvMTggOTozMSBBTSwgSmFuIEJldWxpY2ggd3Jv
dGU6DQo+Pj4+ICtGaXhlZCB3aWR0aCB0eXBlcyBzaG91bGQgb25seSBiZSB1c2VkIHdoZW4gYSBm
aXhlZCB3aWR0aCBxdWFudGl0eSBpcw0KPj4+PiArbWVhbnQgKHdoaWNoIGZvciBleGFtcGxlIG1h
eSBiZSBhIHZhbHVlIHJlYWQgZnJvbSBvciB0byBiZSB3cml0dGVuIHRvIGENCj4+Pj4gK3JlZ2lz
dGVyKS4NCj4+Pg0KPj4+IEknbSBoYXZpbmcgdHJvdWJsZSB1bmRlcnN0YW5kaW5nIHRoZSBpbnRl
bnQgLyBpbXBsaWNhdGlvbnMgb2YgdGhpcyBvbmUuDQo+Pj4gICAgQ2FuIHlvdSBnaXZlIG1lIGFu
IGV4YW1wbGUgb2Ygd2hlcmUgeW91J3ZlIHNlZW4gYSBmaXhlZCB3aWR0aCB0eXBlIHVzZWQNCj4+
PiBpbmFwcHJvcHJpYXRlbHk/DQo+Pg0KPj4gR3JlcCB0aGUgY29kZSBiYXNlIGZvciAidWludDMy
X3Qgc2l6ZSIgZm9yIGV4YW1wbGUuIFRoZXNlIHNob3VsZA0KPj4gKGFsbW9zdD8pIGFsbCBiZSB1
bnNpZ25lZCBpbnQgKG9yLCB3aGVyZSBuZWNlc3NhcnksIHNpemVfdCkuDQo+IA0KPiBJbnNpZGUg
dGhlIGh5cGVydmlzb3IgY29kZWJhc2UgYW55d2F5LCBJIHNlZSB0aGVzZSBwYXR0ZXJucyBmb3IN
Cj4gYHVpbnQzMl90IHNpemVgOg0KPiANCj4gMS4gSW5zaWRlIHRyYWNpbmcgc3RydWN0dXJlcywg
d2hlcmUgdGhlIGNvZGUgbWF5IGJlIHVzZWQgZWl0aGVyIGJ5DQo+IDMyLWJpdCBvciA2NC1iaXQg
dXNlcnNwYWNlIHRvb2xzDQoNCkkgc2ltcGx5IGFzc3VtZSBpbiB0aGVzZSBjYXNlcyB1c2Ugb2Yg
Zml4ZWQgd2lkdGggdHlwZXMgaXMNCmludGVuZGVkLg0KDQo+IDIuIEluc2lkZSBoZWFkZXJzIGZv
ciBwdWJsaWMgaW50ZXJmYWNlcyAoc2FtZSByZWFzb24pLg0KDQpIZXJlIGZpeGVkIHdpZHRoIHR5
cGVzIGFyZSBkZWZpbml0ZWx5IHRoZSByaWdodCBjaG9pY2UuDQoNCj4gMy4gSW4gZnVuY3Rpb24g
c2lnbmF0dXJlcyBmb3IgZW11bGF0aW9uIGNvZGUuICBJIGFzc3VtZSB0aGlzIGlzIGJlY2F1c2UN
Cj4gc2l6ZXMgYXJlIGFyY2hpdGVjdHVyYWxseSBkZWZpbmVkLg0KDQpUYWtpbmcgbnVsbF9yZWFk
KCkgYXMgYW4gZXhhbXBsZSAtIG5vLCB0aGVyZSdzIG5vIG5lZWQgZm9yIGEgZml4ZWQNCndpZHRo
IHR5cGUgaGVyZS4gRXZlbiBpZiB0aGUgdmFsdWUgd2FzIHJlYWQgZnJvbSBhIHJlZ2lzdGVyLA0K
cHJvcGFnYXRpbmcgdGhlIHZhbHVlIHN0aWxsIG9ubHkgbmVlZHMgdG8gZ3VhcmFudGVlIG5vIHRy
dW5jYXRpb24uDQpCdXQgdGhlIHZhbHVlIGNhbid0IGNvbWUgZnJvbSBhIHJlZ2lzdGVyIGRpcmVj
dGx5IGFueXdheSwgb3IgZWxzZQ0KdGhlIHR5cGUgd291bGQgbmVlZCB0byBiZSB1aW50NjRfdC4g
VGhlIHR5cGUgImFkZHIiIGlzIHdyb25nbHkNCnVzaW5nIHVpbnQ2NF90IGhlcmUsIHRvbywgaW4g
bXkgb3BpbmlvbjogSXQgc2hvdWxkIGJlIHVuc2lnbmVkIGxvbmcNCm9yIHBhZGRyX3QsIGRlcGVu
ZGluZyBvbiB3aGV0aGVyIHdlJ3JlIHRhbGtpbmcgb2YgbGluZWFyIG9yIHBoeXNpY2FsDQphZGRy
ZXNzZXMgKEkgdGhpbmsgaXQncyB0aGUgbGF0dGVyIGhlcmUpLg0KDQo+IDQuIEluc2lkZSBkZWNv
bXByZXNzaW9uIGNvZGUsIHRvIGludGVyZmFjZSB3aXRoIHB1YmxpYyBzaXplcy4NCg0KSSBkb24n
dCB0aGluayB0aGVyZSdzIGFueSBpbnRlcmZhY2luZyB3aXRoICJwdWJsaWMiIHN0cnVjdHVyZXMN
CnRoZXJlLg0KDQo1LiBzeXNjdGxfY292X29wKCkgc2hvdWxkIGFnYWluIHVzZSB1bnNpZ25lZCBp
bnQNCjYuIHN0cnVjdCBlbGZfc3ltX2hlYWRlciB0b28gc2hvdWxkIHVzZSB1bnNpZ25lZCBpbnQN
CjcuIHN0cnVjdCBodm1fZG9tYWluX2NvbnRleHQgbWF5IHdhbnQgdG8gY29udGludWUgdG8gdXNl
IHVpbnQ4X3QNCiAgICAoYWxiZWl0IHVuc2lnbmVkIGNoYXIgd291bGQgYmUgcXVpdGUgZmluZSBh
cyB3ZWxsKSwgYnV0IGl0cw0KICAgIHR3byB1aW50MzJfdCB1c2VzIGNvdWxkIG9uY2UgYWdhaW4g
YmUgdW5zaWduZWQgaW50DQpldGMNCg0KSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
