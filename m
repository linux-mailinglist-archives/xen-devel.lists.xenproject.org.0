Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F4481687
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 12:10:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huZv8-0004sw-CY; Mon, 05 Aug 2019 10:08:50 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1huZv6-0004sp-Qz
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 10:08:48 +0000
X-Inumbo-ID: fd53e70c-b768-11e9-8980-bc764e045a96
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id fd53e70c-b768-11e9-8980-bc764e045a96;
 Mon, 05 Aug 2019 10:08:47 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Mon,  5 Aug 2019 10:08:34 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 5 Aug 2019 10:07:35 +0000
Received: from NAM04-SN1-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 5 Aug 2019 10:07:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BPm2WHD91noE5fsarvrrjq8brMOnqEyQqNf7j4HNTVuVwN7M765S4pAUg0PqxI0xbO4efFR68DydBILpb1Ov9UfdX1YaDR1cAu9qI7VmvB+DFEJ6A7+/2f6kuFgEmKVtgYZUsPCi7C2qnsxJrCVCp1infwzt7MjoTy0a+vTlVRKAI+FSH4/OpW8UsQJcZIK9jaWQS5eWI2NqdeQHVA8lR3BgJds767YimkqyOUUIhJWQJzQtzwY55nUK4DHl1+gKPZeg8+vJYsqYHeYCwf8kkBBuKkFAccIzp8awmZb3XKjwFQGCgkSx7R7ZlMVAv/StJ1/g2pGXAFPxKT9pWPE+mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2iAl66YqPaPW8VsRCTaE5mJsuKjdKsgiiFHWBa6yEfk=;
 b=ZkTQel5YGI78reYyNGfMbAO+HslFgqqx472TKsMUXOeFtJHaWlL6ZEnfndmikGDhxDFNLS3faIUll71vAhX7PGcs0Y+sMH0Lhwjb831WSnFLCibww2uY0dj6q7pIGeRa/ajtp8X9R8LiqViCeu6gTsRN6LmuuH3HYsYuueb28mLv6b8K/X7NusqlpcRaahH4mjQd9EPqgY01XReoswWlCgE8/NYDCUNkYL6SFQ0RvC9hTlNDae0s7t0KZ4f5fj1HJYZy9P9sPyVnz2mO/CrDrkI1WXVSJEDfWXrerboolZetvO/CV4NaZjk+76ijdYS9OtOZJLA500n599RokyPerQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB3328.namprd18.prod.outlook.com (10.255.238.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.17; Mon, 5 Aug 2019 10:07:34 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2136.018; Mon, 5 Aug 2019
 10:07:34 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Julien Grall <julien.grall@arm.com>
Thread-Topic: [PATCH 3/4] xen/public: Document HYPERCALL_console_io()
Thread-Index: AQHVS3HlX+Sguj+jtEyHOttiG5U4NqbsVE8A
Date: Mon, 5 Aug 2019 10:07:34 +0000
Message-ID: <6c0b17c8-2c50-ed56-702f-165bd692699b@suse.com>
References: <20190402164238.1815-1-julien.grall@arm.com>
 <20190402164238.1815-4-julien.grall@arm.com>
 <5CA4AF5E0200007800224462@prv1-mh.provo.novell.com>
 <dc5849f6-4659-49b7-9ebf-8ea27860f28b@arm.com>
 <5CAC85300200007800225C72@prv1-mh.provo.novell.com>
 <231b516e-5d23-167f-92c8-f9dcf717467d@arm.com>
In-Reply-To: <231b516e-5d23-167f-92c8-f9dcf717467d@arm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR08CA0075.eurprd08.prod.outlook.com
 (2603:10a6:205:2::46) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a07d283-fb3f-4ace-da78-08d7198cbc91
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB3328; 
x-ms-traffictypediagnostic: MN2PR18MB3328:
x-microsoft-antispam-prvs: <MN2PR18MB332830867D9D0127206F9452B3DA0@MN2PR18MB3328.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01208B1E18
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(396003)(346002)(39860400002)(376002)(366004)(189003)(199004)(66476007)(53936002)(99286004)(186003)(76176011)(6512007)(68736007)(102836004)(53546011)(386003)(6506007)(5660300002)(52116002)(26005)(66066001)(14444005)(36756003)(256004)(6246003)(14454004)(25786009)(80792005)(478600001)(4326008)(7736002)(81166006)(81156014)(71190400001)(31686004)(305945005)(6116002)(3846002)(54906003)(2906002)(6916009)(71200400001)(8936002)(8676002)(316002)(6436002)(476003)(31696002)(446003)(229853002)(66446008)(486006)(66946007)(2616005)(86362001)(11346002)(64756008)(66556008)(6486002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB3328;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +n/m/SmrPs9Mie9dNgE8YNREFJP6ALQvcEHyFMZt7JE/MOTimB59Vv2qFq+9NDnr1ds/LRVlBJRBnwFKS9MRXLAr6nA562nOqAO6REGpEKUlCEelQjK8EBOGEoScKp8etjz/CSAGsL3//0Yh4EQVpoJzO0vg6JvjbIIeBKZ8omwo1+NqZyzyQWYDAMq1cQbqUvHSWs6KFOtpdGmlDWGFOlz5x8ceqNWdpBU887dRZgKriVknsi9Ckbg4m/2itaJkkM7lozRXcUTKO0g6cD1PpnfyZVOQM35wicngfWpNsE4XE8lyMIHre+ZBNyEIphp42EY7L49dsF5TzmUBtuhZtwwOcFKdSHMMDqPIqwqVA+B4Whhqu9O2DfNotRznW4fEYd8DnzvVL7fYmSmrYzo79iuDzeX+0R9w2zxfatQTWLw=
Content-ID: <E0B9A7796DC9A74BA14AE4AAB2816782@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a07d283-fb3f-4ace-da78-08d7198cbc91
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2019 10:07:34.6965 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB3328
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH 3/4] xen/public: Document
 HYPERCALL_console_io()
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
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDUuMDguMjAxOSAxMTo0MCwgSnVsaWVuIEdyYWxsIHdyb3RlOg0KPiBIaSwNCj4gDQo+IE9u
IDA5LzA0LzIwMTkgMTI6NDIsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+Pj4gT24gMDkuMDQuMTkg
YXQgMTM6MjYsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT4gd3JvdGU6DQo+Pj4gT24gMDMvMDQvMjAx
OSAxNDowNCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+IEFsc28gcGxlYXNlIG5vdGUgdGhlIHF1
b3RhdGlvbiB1c2VkIGJ5IHRoZSBtZW50aW9uZWQNCj4+Pj4gZXhpc3RpbmcgZG9jIGNvbW1lbnRz
LCBhcyB3ZWxsIGFzIGEgZmV3IG90aGVyIGZvcm1hbCBhc3BlY3RzDQo+Pj4+IChsaWtlIHRoZW0g
YWxzbyBtYWtpbmcgY2xlYXIgd2hhdCB0aGUgcmV0dXJuIHR5cGUgaXMpLiBJIHRoaW5rDQo+Pj4+
IHRoYXQncyBhIG1vZGVsIHVzZWQgZWxzZXdoZXJlIGFzIHdlbGwsIHNvIEkgdGhpbmsgeW91IHNo
b3VsZA0KPj4+PiBmb2xsb3cgaXQgaGVyZS4NCj4+Pg0KPj4+IEkgaGF2ZW4ndCByZXBsaWNhdGVk
IHRoZSBgIGJlY2F1c2UgSSBoYXZlIG5vIGlkZWEgd2hhdCB0aGV5IGFyZSB1c2VkIGZvci4gSQ0K
Pj4+IHdvdWxkIGFwcHJlY2lhdGUgaWYgeW91IHByb3ZpZGUgcG9pbnRlciBob3cgdG8gdXNlIHRo
ZW0uDQo+Pg0KPj4gV2VsbCwgSSBjYW4gb25seSBwb2ludCB5b3UgYXQgdGhlIGhpc3Rvcnkgb2Yg
dGhpbmdzLCBlLmcuDQo+PiAyNjJlMTE4YTM3ICJkb2NzL2h0bWwvOiBBbm5vdGF0aW9ucyBmb3Ig
dHdvIGh5cGVyY2FsbHMiLg0KPj4NCj4+Pj4gVGhlIG90aGVyIHRoaW5nIGlzOiBBcyBtZW50aW9u
ZWQgZWxzZXdoZXJlLCBJIGRvbid0IHRoaW5rIHRoZQ0KPj4+PiBmaXJzdCB0d28gcGFyYW1ldGVy
cyBzaG91bGQgYmUgcGxhaW4gaW50LiBJJ20gbm90IGhhcHB5IHRvIHNlZQ0KPj4+PiB0aGlzIHBy
b2xpZmVyYXRlIGludG8gZG9jdW1lbnRhdGlvbiBhcyB3ZWxsLCBpLmUuIEknZCBwcmVmZXIgaWYN
Cj4+Pj4gdGhpcyB3YXMgY29ycmVjdGVkIGJlZm9yZSBhZGRpbmcgZG9jdW1lbnRhdGlvbi4gV291
bGQgeW91DQo+Pj4+IGJlIHdpbGxpbmcgdG8gZG8gdGhpcywgb3Igc2hvdWxkIEkgYWRkIGl0IHRv
IG15IHRvZG8gbGlzdD8NCj4+Pg0KPj4+IFdoaWxlIHN3aXRjaGluZyBmcm9tIGNtZCBmcm9tIHNp
Z25lZCB0byB1bnNpZ25lZCBzaG91bGQgYmUgb2suIFRoaXMgd291bGQNCj4+PiBpbnRyb2R1Y2Ug
YSBkaWZmZXJlbnQgYmVoYXZpb3Igb2YgZm9yIGNvdW50Lg0KPj4NCj4+IFNpbmNlIHRoaXMgcmVt
b3ZlcyBhbiBlcnJvciBjb25kaXRpb24sIEkgdGhpbmsgdGhpcyBpcyBhbiBva2F5IGNoYW5nZQ0K
Pj4gdG8gaGFwcGVuLCB3aXRob3V0IC4uLg0KPj4NCj4+PiBBcmUgd2UgaGFwcHkgd2l0aCB0aGF0
LCBvciBzaGFsbCB3ZSBhZGQgYSBjaGVjayAoKGludCljb3VudCkgPiAwPw0KPj4NCj4+IC4uLiBh
bnkgc3VjaCBleHRyYSBjaGVjay4gVGhpcyBhbHNvIGlzbid0IGdvaW5nIHRvIGludHJvZHVjZSBh
bnkgbmV3DQo+PiByZWFsIHJpc2sgb2YgYSBsb25nIHJ1bm5pbmcgb3BlcmF0aW9uIG9yIHNvbWUg
c3VjaCAtIGlmIDJHYiBvZiBpbnB1dA0KPj4gZGF0YSBhcmUgZmluZSwgSSBjYW4ndCBzZWUgd2h5
IDRHYiB3b3VsZG4ndCBiZSwgdG9vLg0KPiANCj4gQWN0dWFsbHksIGl0IHdpbGwgbm90IGJlIGZp
bmUgYXQgbGVhc3QgZm9yIHRoZSByZWFkIGNhc2UuIFRoZSByZXR1cm4gdmFsdWUgaXMgYSAzMi1i
aXQgdmFsdWUgKG9uIEFBcmNoMzIgYW5kIGlmIHlvdSB3YW50IHRvIGtlZXAgY29tcGF0IGJldHdl
ZW4gNjQtYml0IGFuZCAzMi1iaXQpLiBBIG5lZ2F0aXZlIHZhbHVlIGluZGljYXRlcyBhbiBlcnJv
ci4gQXMgd2UgcmV0dXJuIHRoZSBudW1iZXIgb2YgY2hhcmFjdGVycyByZWFkLCBpdCBtZWFucyB3
ZSBjYW4gb25seSBoYW5kbGUgMkdCLg0KDQpIbW0sIHZhbGlkIHBvaW50Lg0KDQo+IFNvIEkgd291
bGQgcmF0aGVyIGxpbWl0IHRoZSBidWZmZXIgdG8gMkdCIGZvciBldmVyeW9uZS4NCg0KUHJvYmFi
bHkgZmFpciBlbm91Z2ggdGhlbiAoaWYgZXhwbGljaXRseSBzdGF0ZWQpLiBQZXJzb25hbGx5IEkg
d291bGQNCm5ldmVydGhlbGVzcyBhbGxvdyBzaXplcyB1cCB0byA0R2ItNGtiLCBidXQgSSBjYW4g
c2VlIHdoeSB0aGlzIG1heQ0Kbm90IGJlIGxpa2VkIGJ5IGV2ZXJ5b25lLiBJJ2QgbGlrZSB0byBw
b2ludCBvdXQgdGhvdWdoIHRoYXQgdGhlDQpQVFJfRVJSKCkgbWFjaGluZXJ5IHdlJ3ZlIGluaGVy
aXRlZCBmcm9tIExpbnV4IHV0aWxpemVzIGV4YWN0bHkgdGhhdC4NCg0KSmFuDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
