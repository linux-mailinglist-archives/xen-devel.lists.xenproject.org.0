Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8877713C7
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2019 10:18:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hppxO-0006v9-RR; Tue, 23 Jul 2019 08:15:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Gy5X=VU=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hppxN-0006v4-P2
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2019 08:15:33 +0000
X-Inumbo-ID: 051adf82-ad22-11e9-bbe7-37edb880ebbe
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 051adf82-ad22-11e9-bbe7-37edb880ebbe;
 Tue, 23 Jul 2019 08:15:28 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Tue, 23 Jul 2019 08:15:15 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Tue, 23 Jul 2019 08:13:42 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Tue, 23 Jul 2019 08:13:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZmaVsYS4rS6qUaR+a/YSJM/WpQcw5M+hN/0xgmTNKKEnmIYrhaGE9yi4sc+NU94GKDtgJCPOMga2HLfEpCDcwEgvIiQqgBpA9YbiAODWy3JmfPEgh8pUv8qSA6oZENoH4tamgmWzpniJORwj9xjK3+QjEdWk2NJMwFP88/QqRbr++uteh/JH9EjQxq05MxQPi6s+Yrxw2IraZHQdvhDqow1r4r6/FktbsMuLkMmbBoObPUO1ab3mgZVj1FQwuK04qLfd1wkDV7smy5BGSI2LLotoyY3eU3AuQP6QVfj2c0nb/o8XAtFNhlNKQ/ixXgeYMaq4tgAR24WcDrg/iy6Q0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0iy4Q/NB8dgcFCiZsOhT5OJ8jG3ETeVT2SmCnNBJy3E=;
 b=Pg3l8kHD2VCeFqhJoOYnuF/i/H4hTcmfJ5F7LRYFi1qfYr45KKh57gVq0cGEB6EALIorHHN+yxGjfZpEEyyPJmbMW7DsENp+QjfPZYgMdQznYvt6bVYsFA0lea9rjtN6pBjUbWJxkBuuE6RJ+GHIxnmrVkDa+RtbjVkS/az1t41HzJGVeKG4qf5jVpxPlcI9cou1FQATDu9AnNUb19wfA5jhC6N6Ske2ovgEFtFrh9z/VVq1IqX1r+5uZTm2kCrym9SrFOH62MA+mKyjXXQUAsV4JijdYDHGNj08+y5S96VfDASEPd/8EHtBnikf/BhjcG6nVSZoVFkiMHYBA936Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2683.namprd18.prod.outlook.com (20.179.107.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.17; Tue, 23 Jul 2019 08:13:40 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Tue, 23 Jul 2019
 08:13:40 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [PATCH v3 08/14] AMD/IOMMU: introduce 128-bit IRTE
 non-guest-APIC IRTE format
Thread-Index: AQHVO/TlAPsnkpqPo0+X2y95y9fr6KbSNr9CgARDQ4CAADOwm4AAFvIAgAAMdA+AARQJAA==
Date: Tue, 23 Jul 2019 08:13:40 +0000
Message-ID: <4266c118-7a89-ed64-6196-52a82ec6e42a@suse.com>
References: <6272c301-a905-38cf-dd1a-645f3d703241@suse.com>
 <94c28919-81cd-e6fa-aa43-e05dfea7cbed@suse.com>
 <9612f97f-904d-7b72-cff9-ead2e8590ffc@citrix.com>
 <9c6a7b4b-af52-c93d-480f-f34334de868a@suse.com>
 <aeb53abe-af9e-37ba-9f25-90b6b30192fc@citrix.com>
 <dc1481ff-4c18-cf0b-cff7-1f2866b6ad40@suse.com>
 <c25f432f-5408-83ce-26f4-fe9a0edf4e46@citrix.com>
In-Reply-To: <c25f432f-5408-83ce-26f4-fe9a0edf4e46@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LNXP265CA0089.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::29) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 44887f11-c877-4a8a-a2f0-08d70f45abc8
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2683; 
x-ms-traffictypediagnostic: DM6PR18MB2683:
x-microsoft-antispam-prvs: <DM6PR18MB26830746C61E51142B54C061B3C70@DM6PR18MB2683.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0107098B6C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(376002)(396003)(366004)(346002)(39860400002)(199004)(189003)(305945005)(99286004)(316002)(4326008)(11346002)(81166006)(66476007)(26005)(81156014)(64756008)(186003)(446003)(14454004)(6916009)(476003)(14444005)(229853002)(66446008)(66946007)(71200400001)(54906003)(8676002)(6246003)(86362001)(7736002)(256004)(5660300002)(31696002)(66556008)(36756003)(71190400001)(80792005)(2906002)(486006)(53936002)(6512007)(6486002)(66066001)(25786009)(68736007)(53546011)(6506007)(386003)(2616005)(478600001)(6116002)(102836004)(52116002)(76176011)(6436002)(3846002)(31686004)(8936002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2683;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QFVKxYFofz/y2BWUsPw5/iwqLAvea15iyz44/yO2AqJEEQMndYDwcHLJPjA4M3JLViklQU9E0S2161F1UZmXzVueqVJpJXK0weBcRcr4z7iJiJ/LKuzrdhDKmxEAx60B5+jOAn0UB4/CqGyoIVC3n9kXOGWPdWrjkedplt94sk/Bw7t0haLKFLUYMQB0U6+KxPnAsPflysPGc9rS6ifALx233eiwCcFF6WJnu6L+5pviwBjD0ogmPk599nF0VWS3jmN8vgExZaFgMxwnSY39KsRrlnDxPpQNkSHXbzukApG8+I3dZdR0XihtVQFim3AFZgQ76K1LKg98riyi4C9AaiZ9xzrgEPDSLKxVb0osgRzzC1R69vzF5j0bT+PkPOrB4yxuL9HlGZz4DzPivPb+H17PQUktM1FcXLYsIht8Og4=
Content-ID: <039D85D7445FE74FA7D244C8F38AE126@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 44887f11-c877-4a8a-a2f0-08d70f45abc8
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2019 08:13:40.7306 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2683
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v3 08/14] AMD/IOMMU: introduce 128-bit IRTE
 non-guest-APIC IRTE format
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
 BrianWoods <brian.woods@amd.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjIuMDcuMjAxOSAxNzo0MywgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMjIvMDcvMjAx
OSAxNjowMSwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAyMi4wNy4yMDE5IDE1OjM2LCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOg0KPj4+IE9uIDIyLzA3LzIwMTkgMDk6MzQsIEphbiBCZXVsaWNoIHdy
b3RlOg0KPj4+PiBPbiAxOS4wNy4yMDE5IDE5OjI3LCBBbmRyZXcgQ29vcGVyIHdyb3RlOg0KPj4+
Pj4gT24gMTYvMDcvMjAxOSAxNzozOCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+Pj4+Pj4gQEAgLTE0
Miw3ICsxNzgsMTUgQEAgc3RhdGljIHZvaWQgZnJlZV9pbnRyZW1hcF9lbnRyeShjb25zdCBzdA0K
Pj4+Pj4+ICAgICAgew0KPj4+Pj4+ICAgICAgICAgIHVuaW9uIGlydGVfcHRyIGVudHJ5ID0gZ2V0
X2ludHJlbWFwX2VudHJ5KGlvbW11LCBiZGYsIGluZGV4KTsNCj4+Pj4+PiAgICAgIA0KPj4+Pj4+
IC0gICAgQUNDRVNTX09OQ0UoZW50cnkucHRyMzItPnJhd1swXSkgPSAwOw0KPj4+Pj4+ICsgICAg
aWYgKCBpb21tdS0+Y3RybC5nYV9lbiApDQo+Pj4+Pj4gKyAgICB7DQo+Pj4+Pj4gKyAgICAgICAg
QUNDRVNTX09OQ0UoZW50cnkucHRyMTI4LT5yYXdbMF0pID0gMDsNCj4+Pj4+PiArICAgICAgICAv
KiBMb3cgaGFsZiAoY29udGFpbmluZyBSZW1hcEVuKSBuZWVkcyB0byBiZSBjbGVhcmVkIGZpcnN0
LiAqLw0KPj4+Pj4+ICsgICAgICAgIGJhcnJpZXIoKTsNCj4+Pj4+IFdoaWxlIHRoaXMgd2lsbCBm
dW5jdGlvbiBvbiB4ODYsIEkgc3RpbGwgY29uc2lkZXIgdGhpcyBidWdneS7CoCBGcm9tIGENCj4+
Pj4+IGNvbmNlcHR1YWwgcG9pbnQgb2YgdmlldywgYmFycmllcigpIGlzIG5vdCB0aGUgY29ycmVj
dCBjb25zdHJ1Y3Rpb24gdG8NCj4+Pj4+IHVzZSwgd2hlcmVhcyBzbXBfd21iKCkgaXMuDQo+Pj4+
IEkgdGhpbmsgaXQncyB0aGUgM3JkIHRpbWUgbm93IHRoYXQgSSByZXNwb25kIHNheWluZyB0aGF0
IGJhcnJpZXIoKSBpcw0KPj4+PiBhcyBnb29kIG9yIGFzIGJhZCBhcyBzbXBfd21iKCksIGp1c3Qg
Zm9yIGRpZmZlcmVudCByZWFzb25zLg0KPj4+IGJhcnJpZXIoKSBhbmQgc21wX3dtYigpIGFyZSBk
aWZmZXJlbnQgY29uc3RydWN0cywgd2l0aCBzcGVjaWZpYywNCj4+PiAqZGlmZmVyZW50KiBtZWFu
aW5ncy7CoCBGcm9tIGEgcHJvZ3JhbW1lcnMgcG9pbnQgb2YgdmlldywgdGhleSBzaG91bGQgYmUN
Cj4+PiBjb25zaWRlcmVkIGJsYWNrIGJveGVzIG9mIGZ1bmN0aW9uYWxpdHkuDQo+Pj4NCj4+PiBi
YXJyaWVyKCkgaXMgZm9yIGZvcmNpbmcgdGhlIGNvbXBpbGVyIHRvIG5vdCByZW9yZGVyIHRoaW5n
cy4NCj4+Pg0KPj4+IHNtcF93bWIoKSBpcyBhYm91dCB0aGUgZXh0ZXJuYWwgdmlzaWJpbGl0eSBv
ZiB3cml0ZXMsIGFzIG9ic2VydmVkIGJ5IGENCj4+PiBkaWZmZXJlbnQgZW50aXR5IG9uIGEgY29o
ZXJlbnQgZmFicmljLg0KPj4gSSdtIGFmcmFpZCBJIGRpc2FncmVlIGhlcmU6IFRoZSAic21wIiBp
biBpdHMgbmFtZSBtZWFucyAiQ1BVIiwgbm90DQo+PiAiZW50aXR5IiBpbiB5b3VyIHNlbnRlbmNl
Lg0KPiANCj4gQ2l0YXRpb24gZGVmaW5pdGVseSBuZWVkZWQuDQoNCldoaWNoIEkgZGlkIHByb3Zp
ZGUgaW4gdGhlIGVhcmxpZXIgcmVwbHk6IElmIHdoYXQgeW91IHNheSB3YXMNCmludGVuZGVkIHRv
IGJlIHRoYXQgd2F5LCB0aGUgIUNPTkZJR19TTVAgZGVmaW5pdGlvbnMgaW4gTGludXggd2VyZQ0K
d3JvbmcsIGFuZCAuLi4NCg0KPiBUaGUgdGVybSBTTVAgbWVhbnMgU3ltbWV0cmljIE11bHRpUHJv
Y2Vzc2luZywgYnV0IG5vIGNvbXB1dGVyIHRoZXNlIGRheXMNCj4gbWF0Y2hlcyBhbnkgb2YgdGhl
IHRyYWRpdGlvbmFsIGRlZmluaXRpb25zLsKgIFlvdSBjYW4gdGhhbmsgdGhlIGZhY3Qgd2UNCj4g
YXJlIG9uZSBvZiB0aGUgZmFzdGVzdCBldm9sdmluZyBpbmR1c3RyaWVzIGluIHRoZSB3b3JsZCwg
YW5kIHRoYXQgdGhlDQo+IHRlcm0geW91J3JlIHVzaW5nIGlzIG1vcmUgdGhhbiAyMCB5ZWFycyBv
bGQuDQoNCi4uLiB3b3VsZCBoYXZlIGJlZW4gZm9yIGEgbG9uZyB0aW1lLg0KDQo+IEluIHBhcnRp
Y3VsYXIsIGl0IHByZWRhdGVzIGNhY2hlLWNvaGVyZW50IHVuY29yZSBkZXZpY2VzLg0KPiBDYWNo
ZS1jb2hlcmVudCBkZXZpY2VzIGJ5IGRlZmluaXRpb24gaGF2ZSB0aGUgc2FtZSBvcmRlcmluZyBw
cm9wZXJ0aWVzDQo+IGFuZCBjb25zdHJhaW50cyBhcyBjcHVzLCBiZWNhdXNlIHRoZXkgYXJlIHBh
cnQgb2Ygb25lIHNoYXJlZCAob3IgZGFyZSBJDQo+IHNheSwgc3ltbWV0cmljKSwgY2FjaGUtY29o
ZXJlbnQgZG9tYWluLg0KPiANCj4gSG93IHdvdWxkIHlvdXIgYXJndW1lbnQgY2hhbmdlIGlmIHRo
ZSBJT01NVSB3YXMgYSByZWFsIENQVSBydW5uaW5nIHJlYWwNCj4geDg2IGNvZGU/wqAgSXRzIGlu
dGVyZmFjZSB0byB0aGUgcmVzdCBvZiB0aGUgc3lzdGVtIHdvdWxkIGJlIGlkZW50aWNhbCwNCj4g
YW5kIGluIHRoYXQgY2FzZSwgaXQgd291bGQgb2J2aW91c2x5IG5lZWQgYW4gc21wX3tyLHd9bWIo
KSBwYWlyIGZvcg0KPiBjb3JyZWN0bmVzcyByZWFzb25zLsKgIFRoaXMgaXMgd2h5IHNtcF93bWIo
KSBpcyB0aGUgb25seSBhcHByb3ByaWF0ZQ0KPiBjb25zdHJ1Y3QgdG8gdXNlLg0KDQpJdCB3b3Vs
ZG4ndCBjaGFuZ2UgYXQgYWxsLiBXaGF0IG1hdHRlcnMgKGFzIHBlciBhYm92ZSkgaXMgdGhlDQp1
bmRlcnN0YW5kaW5nIHRoZSBPUyBoYXMsIGkuZS4gd2hhdCBpcyBiZWluZyBzdXJmYWNlZCB0byBp
dCBhcyBDUFUuDQoNCkphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
