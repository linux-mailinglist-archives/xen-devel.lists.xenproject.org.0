Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E8F6CD44
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 13:19:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho4Pj-0006TD-NU; Thu, 18 Jul 2019 11:17:31 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=e8X9=VP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ho4Ph-0006T8-KA
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 11:17:29 +0000
X-Inumbo-ID: 9f201fc5-a94d-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9f201fc5-a94d-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 11:17:27 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 18 Jul 2019 11:17:23 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 18 Jul 2019 11:16:44 +0000
Received: from NAM03-BY2-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 18 Jul 2019 11:16:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SUCS2/70m0ZEXDX0eNQDBhthLH3DetLhvOdprhtd3d8mzosiYz8cLOuM/jiHTIyrySpDVteOu/xxNLiRChw/ku3yzmBsrSzGts4JfP+h2rnkFdTZvpYDCpJBPPdWPaCi5YzeaMA6LlDV1BJwOMlR0GHeCJtAkKsx8LNLXJSHQAD9VrfKlAGDVe4OhFLkFnKbXhymbsRIJYCHDrap1KsfVb/SzS3H8lFOlgtNVr35S34gipdmWMU+VFSwTvlMfPe7mzsUptdtQ42m3a809vNRpy6+lqxNj+M5HQPniMXB0dBrOFAiS8l594MPsAYjM+FhFVmx/mxEy/IY2sM3JjGlOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mypJQDPP1yu5KGApW8KFN9n/0r2JBpoD9oYsnW1JXtk=;
 b=ZP0FD221P3Q4F8Pl/V4FjVJFBYCO4aRBLnX45SKO++7zHyIvkuvlI7WiG95WrtrOGLBYsUk8kjSE2jMKIWCaumMZgxWvFOMvEwalWXBGEpBQbMKvJXcAvvpjRmlA4ls5hbmQKwOEiZBM7FMiQvFy9rpOLHOH9F8FGHJZqZZS3qjOv9auTdJpSM9r5Rini9Ab78WaibXPK0EPmiQZJr+TgW/gFr0JROIkG4cnXLILQnC6hPgGKCUGiK9GoGhYrB+0zUAY54xD8ZlXQWyBgVCWbAC7AJOfpx/c2D7e1z0U4dXHwLwbtX2nC2MLsbJDSmWhkWb9w7iNupuHzkhSsFse7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3210.namprd18.prod.outlook.com (10.255.172.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Thu, 18 Jul 2019 11:16:43 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 11:16:43 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Thread-Topic: [Xen-devel] IOMMU page-tables
Thread-Index: AdU9TCP6x7BzOdjWTRO+l3/aOrPvEAABW2v+AAIs9wA=
Date: Thu, 18 Jul 2019 11:16:43 +0000
Message-ID: <ca9a87de-9eea-5037-ae34-a6c30c48163e@suse.com>
References: <f07114de1c9f440182359a1d7d064fdd@AMSPEX02CL03.citrite.net>
 <3131a159-5f19-64b0-2537-8b944b16ad16@citrix.com>
In-Reply-To: <3131a159-5f19-64b0-2537-8b944b16ad16@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR02CA0019.eurprd02.prod.outlook.com
 (2603:10a6:6:15::32) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0ae7017f-bba8-4fff-49fe-08d70b7169f0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3210; 
x-ms-traffictypediagnostic: DM6PR18MB3210:
x-microsoft-antispam-prvs: <DM6PR18MB3210285A323BAABF5CE000DCB3C80@DM6PR18MB3210.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2201;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(39860400002)(376002)(396003)(136003)(366004)(189003)(199004)(66476007)(66946007)(53936002)(66446008)(66066001)(64756008)(25786009)(3846002)(6916009)(6506007)(5660300002)(6436002)(53546011)(71190400001)(14454004)(386003)(102836004)(68736007)(71200400001)(31696002)(229853002)(86362001)(6512007)(80792005)(476003)(11346002)(14444005)(6246003)(52116002)(478600001)(2906002)(5024004)(446003)(36756003)(26005)(8936002)(186003)(81156014)(6116002)(4326008)(66556008)(6486002)(316002)(2616005)(7736002)(305945005)(486006)(54906003)(99286004)(76176011)(31686004)(8676002)(81166006)(256004);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3210;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: u+RM4/qNUuRAHOlsYjVaNwCRugIIjSTqmGfzi3yIZ0y/ac001VVRTrOnDaFLjPJltPEzlod/yFzlsXm8XNey3XGVPMjSCqkBp8eQtM047/bgAb9HjBGTm+WgoeqMfpNeI0nhjSZnHfcHmM4JrNT9JC5HTK6pGaYn2HfPPKyd8tIt2lxzkU+4MYyr6bmUfsP8cWulEgvwqaNvKSKJRE1tvvz9rgB0W4oB6/oAEXZ9Y9XNjCKQ9iEf0QjQqyK6w3QdzHJjSBQiqJqyP9tU1cPeEqVltc+4lS3wSALlKQT+hfhy8KLGB5I1wTDERPMioUQbAWKdBeVQhvPUxTGOSNEdm70u/kLETd6FvJCyGmMsAF/2YiocLsigugevbLZYAJ6uuADcK8imewF6RA+LLTQItL/m+uoZbD6nq0JPJIiDy9Y=
Content-ID: <DD1A5BD887991C4DB16EB5139B33F5B4@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ae7017f-bba8-4fff-49fe-08d70b7169f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 11:16:43.4278 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3210
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] IOMMU page-tables
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
Cc: "xen-devel\(xen-devel@lists.xenproject.org\)"
 <xen-devel@lists.xenproject.org>, Paul Durrant <Paul.Durrant@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDcuMjAxOSAxMjoxMywgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMTgvMDcvMjAx
OSAxMDo0OSwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPj4gSGksDQo+Pg0KPj4gICAgQmVmb3JlIEkg
Z2V0IHRvbyBmYXIgaW50byB0aGlzIEkgd2FudCB0byBnZXQgc29tZSBvcGluaW9ucyBmcm9tIHRo
ZSB3aWRlciBjb21tdW5pdHkuLi4NCj4+DQo+PiAgICBBdCB0aGUgbW9tZW50IHdoZW4gdGhlIGZp
cnN0IFBDSSBkZXZpY2UgaXMgYXNzaWduZWQgdG8gYSBkb21haW4gKGkuZS4gcGFzc2VkIHRocm91
Z2gpIHRoaXMgd2lsbCB0cmlnZ2VyIGNvbnN0cnVjdGlvbiBvZiBJT01NVSBwYWdlIHRhYmxlcyBm
b3IgdGhhdCBkb21haW4uIFNpbWlsYXJseSB3aGVuIHRoZSBsYXN0IFBDSSBkZXZpY2UgaXMgZGUt
YXNzaWduZWQgdGhlIHRhYmxlcyBhcmUgdG9ybiBkb3duIGFnYWluLiBCb3RoIG9mIHRoZXNlIG9w
ZXJhdGlvbnMgY2FuIGJlIHF1aXRlIGV4cGVuc2l2ZSBpZiB0aGUgZG9tYWluIGlzIGEgbGFyZ2Ug
YW1vdW50IGZvciBSQU0sIGFuZCBpZiB0aGUgSU9NTVUgZG9lcyBub3Qgc3VwcG9ydCBzaGFyaW5n
IHRoZSBzZWNvbmQgbGV2ZWwgQ1BVIHBhZ2UgdGFibGVzIChvciB0aGUgZG9tYWluIGlzIFBWKS4g
TW9yZW92ZXIsIHRoZSBndWVzdCBjb3VsZCBzaW11bHRhbmVvdXNseSBiZSBiYWxsb29uaW5nIG9y
IGRvaW5nIG90aGVyIG9wZXJhdGlvbnMgdGhhdCBhZmZlY3QgaXRzIHBhZ2UgdHlwZXMgYW5kIHNv
IHRoZSBwcm9jZXNzIG9mIGJ1aWxkaW5nIHRoZSB0YWJsZXMgaGFzIHRvIHRha2UgaW50byBhY2Nv
dW50IHN1Y2ggcmFjZXMuDQo+PiAgICBJZiB3ZSB3ZXJlIGluc3RlYWQgdG8gc2F5IHRoYXQgZ2l2
aW5nIGEgZG9tYWluIElPTU1VIHBhZ2UgdGFibGVzIGlzIGFuIG9wdGlvbiB0aGF0IG5lZWRzIHRv
IGJlIHNlbGVjdGVkIGF0IGRvbWFpbiBjcmVhdGUgdGltZSB0aGVuIGl0IG1ha2VzIHRoZSBjb2Rl
IHNpZ25pZmljYW50bHkgc2ltcGxlciBhbmQgdGhlcmUgaXMgbm8gbmVlZCB0byBkZWFsIHdpdGgg
cGFnZSB0eXBlIGNoYW5nZS9iYWxsb29uaW5nIHJhY2VzIGFueSBtb3JlLiBJIGhhY2tlZCB0b2dl
dGhlciBhIHRlc3QgcGF0Y2ggYW5kIGl0IGdldHMgcmlkIG9mIHJvdWdobHkgMjAwIGxpbmVzIG9m
IGNvZGUgKGFuZCB0aGVyZSBtYXkgYmUgbW9yZSB0aGF0IEkgbWlzc2VkKS4NCj4+ICAgIERvZXMg
YW55b25lIHRoaW5rIHRoYXQgZGVjaWRpbmcgd2hldGhlciBhIGRvbWFpbiBzaG91bGQgZ2V0IElP
TU1VIHBhZ2UgdGFibGVzIGlzIG5vdCBhIHJlYXNvbmFibGUgdGhpbmcgdG8gaGF2ZSB0byBkbyBh
dCBjcmVhdGUgdGltZT8NCj4gDQo+IFRvIGJlIGFic29sdXRlbHkgY2xlYXIgaGVyZSwgSSBkb24n
dCBzZWUgYW55IGV2aWRlbmNlIGZvciB0aGUgY3VycmVudA0KPiBiZWhhdmlvdXIgdG8gYmUgYSBj
b21tb25seSB1c2VkIGZlYXR1cmUgaW4gcHJhY3RpY2UuDQo+IA0KPiBJZiBhbnlvbmUgaGFzIGEg
Y291bnRlcmV4YW1wbGUsIHBsZWFzZSBzcGVhayB1cCB1cmdlbnRseS4NCg0KSSBkb24ndCBoYXZl
IGEgY291bnRlcmV4YW1wbGUsIG5vciBhbSBJIG91dHJpZ2h0IG9wcG9zZWQgdG8gdGhlDQpzdWdn
ZXN0ZWQgY2hhbmdlLiBOZXZlcnRoZWxlc3MgSSdkIGxpa2UgdG8gcG9pbnQgb3V0IHRoYXQgImp1
c3QNCmluIGNhc2UiIHNldHRpbmcgdG8gSU9NTVUtZW5hYmxlZCBvZiBhIGRvbWFpbiBpcyBhIHdh
c3RlIG9mDQptZW1vcnkgaWYgbm8gZGV2aWNlIGV2ZXIgZ2V0cyBhc3NpZ25lZCB0byBpdC4gQW5k
IGlmIHRoZXJlIGFyZQ0KcGVvcGxlIHJlbHlpbmcgb24gYmVpbmcgYWJsZSB0byBhdHRhY2ggYSBk
ZXZpY2Ugb24gZGVtYW5kLCB0aGVuDQp0aGV5IG1heSBiZSBjYXVnaHQgYnkgc3VycHJpc2Ugd2hl
biB0aGV5IHVwZ3JhZGUgKGFuZCB3ZSBhbGwNCmtub3cgaG93IG11Y2ggZG9jdW1lbnRhdGlvbiBw
ZW9wbGUgcmVhZCB3aGVuIHRoZXkgdGhpbmsgdGhleQ0Ka25vdyB3aGF0IHRoZXkncmUgZG9pbmcs
IHdoaWNoIGlzIHRvIHNheTogQWRkaW5nIGEgcmVzcGVjdGl2ZQ0Kbm90ZSB0byB0aGUgcmVsZWFz
ZSBub3RlcyBpcyBub3QgdmVyeSBsaWtlbHkgdG8gaGVscC4pLg0KDQo+IEZ1cnRoZXJtb3JlLCB0
aGUgY29tcGxleGl0eSBhbmQgKGJlc3Qtd2UtY2FuLW1hbmFnZS1zZWN1cml0eS13aXNlKQ0KPiBs
aXZlbG9ja3MgaW4gdGhlIGh5cGVydmlzb3IvdG9vbHN0YWNrIGlzIGp1c3RpZmljYXRpb24gYWxv
bmUgdG8NCj4gc2VyaW91c2x5IGNvbnNpZGVyIGRyb3BwaW5nIGl0IG1vdmluZyBmb3J3YXJkcy7C
oCBUaGUgY29tcGxleGl0eSBpbg0KPiBwYXJ0aWN1bGFyIGlzIGFuIGltcGVkaW1lbnQgdG8gc2V2
ZXJhbCBhc3BlY3RzIG9mIElPTU1VIGRldmVsb3BtZW50IHdvcmsNCj4gd2hpY2ggYXJlIGluIHBy
b2dyZXNzLg0KPiANCj4gSW4gcGFydGljdWxhciwgSSBkbyBub3Qgc2VlIGl0IGFzIGFuIHVucmVh
c29uYWJsZSBidXJkZW4gZm9yDQo+IGFkbWlucy9ndWVzdHMgdG8gc3BlY2lmeSB3aGV0aGVyIHRo
ZXkgd2FudCBhbiBJT01NVSBhdCBkb21haW4gY3JlYXRpb24NCj4gdGltZS7CoCBJIGV4cGVjdCB0
aGF0IHRoZSBvdmVyd2hlbG1pbmcgbWFqb3JpdHkgb2YgY2FzZXMgYWxyZWFkeSBrbm93IGF0DQo+
IGNyZWF0aW9uIHRpbWUgd2hpY2ggUENJIGRldmljZXMgd2FudCBhc3NpZ25pbmcuDQo+IA0KPiBB
cyBmYXIgYXMgSSdtIGNvbmNlcm5lZCwgdGhpcyBmZWF0dXJlL2Nvcm5lciBjYXNlIHdhbnRzIHJp
cHBpbmcgb3V0Lg0KPiBXaGF0ZXZlciB0aGUgb3JpZ2luYWwgaW50ZW50aW9uLCBoaW5kc2lnaHQg
aGFzIGRlbW9uc3RyYXRlZCB0aGF0IGl0DQo+IHJlYWxseSBpc24ndCBjbGV2ZXIgaWRlYS4NCg0K
RkFPRCAtIEkgYWdyZWUgd2l0aCBhbGwgdGhlIHRlY2huaWNhbCBhc3BlY3RzIGhlcmUuDQoNCkph
bg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
