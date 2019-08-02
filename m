Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B477F82F
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 15:13:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htXKG-0008Hg-TH; Fri, 02 Aug 2019 13:10:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EmiY=V6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1htXKF-0008Ha-9m
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 13:10:27 +0000
X-Inumbo-ID: e2a9cbfe-b526-11e9-b3b6-2f8573476735
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e2a9cbfe-b526-11e9-b3b6-2f8573476735;
 Fri, 02 Aug 2019 13:10:24 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Fri,  2 Aug 2019 13:10:23 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 2 Aug 2019 13:09:45 +0000
Received: from NAM02-CY1-obe.outbound.protection.outlook.com (15.124.72.10) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 2 Aug 2019 13:09:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jfmpxBPp5QUB0dBy5ZQJcc/kw9k2uwbx6bB2RDO1NvRDaRA9rC4Ry5Pj64okX9pnO/U6zbt0Nbu3QL0RPc5YWSPhGeNjl9Mkoypr5q5BZJDmuvtAvTmndFgZ4El7BjrHAYG865sGWvq1dKpUi45noklO80QvIfc7m3BG8Rho8obzv4h59tCyEqotutkJ/6mMCeC0rNR/k9Jj1eY39MDogIVVrlpJNaplc6cOTG/lLMAGbWDtcGsuJnVM14yDc2hGgLG8Z7U4EVr/d7N6fhIgjE002qAn61d7CkEiclgCuXJY0/lj9yoRvBTkOPFvWqnW9UfsaW8gEuv18XBpU2voxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FXMGA8PJ9tktVGuoQm3bDAkUzzk7gqKlPjf/UKum6zA=;
 b=Z+xrrnJe+Frs1UBzrvOKjOV5MOthPnOMT4bvnIKe7COGTDjrsZJOF7g4kcm7Ord2jAaiXuYsjkgUWo65jo8M3DNgKxhOGrMRCWLOz0bejn5SaY1NH9yLumur3qhjxDFNdi9gT1Mr3EN4Lh1q+A+IZhyS5UI2hOw4uBXjmBjtNg0NZKArpKnE3BMA+FnA3JnCjwZyCYqiXGswZ9rHm36ZmHEPveiOJURA0J7ysV1WP6YZ1gnTlL2W+qtMDt5gs/xWE5l8vESOs+zKuyYgdzDpjLfqsHANibPB2wjs1zif5ZRP6Df7V9xLgpBJt+CCueknyc6g4WyEc4gzztfwaIeHtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2666.namprd18.prod.outlook.com (20.179.106.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.13; Fri, 2 Aug 2019 13:09:44 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b%7]) with mapi id 15.20.2115.005; Fri, 2 Aug 2019
 13:09:44 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Roger Pau Monne <roger.pau@citrix.com>, George Dunlap
 <george.dunlap@eu.citrix.com>
Thread-Topic: [Xen-devel] [PATCH] x86/iommu: remove usage of
 {set/clear}_identity_p2m_entry against PV domains
Thread-Index: AQHVSRQDW2EdzX2lDkO70Tmpo913oabn1O0A
Date: Fri, 2 Aug 2019 13:09:44 +0000
Message-ID: <2c748455-bcb1-cebd-f8e1-68ca988977a5@suse.com>
References: <20190802092227.43058-1-roger.pau@citrix.com>
In-Reply-To: <20190802092227.43058-1-roger.pau@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR06CA0026.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::39) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 060cd045-37a3-4d91-f0dc-08d7174aafde
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2666; 
x-ms-traffictypediagnostic: DM6PR18MB2666:
x-microsoft-antispam-prvs: <DM6PR18MB26667AB64119965BDCE772FEB3D90@DM6PR18MB2666.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 011787B9DD
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(136003)(396003)(366004)(376002)(346002)(43544003)(189003)(199004)(66066001)(5660300002)(53936002)(486006)(8936002)(11346002)(476003)(446003)(6512007)(66446008)(81156014)(64756008)(36756003)(66556008)(229853002)(71200400001)(71190400001)(6436002)(66946007)(2616005)(6486002)(478600001)(81166006)(66476007)(31686004)(305945005)(7736002)(316002)(6116002)(3846002)(76176011)(25786009)(8676002)(99286004)(186003)(53546011)(386003)(6246003)(6506007)(68736007)(4326008)(110136005)(102836004)(80792005)(54906003)(31696002)(26005)(86362001)(14444005)(256004)(2906002)(52116002)(14454004)(70780200001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2666;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +34Chivkt+UFtEB5MtXH4TMWuqttQpqO2F/sQtwPVqpfYC2LxJ4fvVdPwee9H+qO6y3CrccxjfycwH0I5R29sD+jKg8FYECeKp11ZKTwvi9gRN3SLHz0YSRZXCFdElF5vufELLsNHQYIntj5cFpgYOnnjDmkl0C2hHKVgwyO+K11KbqLWR9Hu1sUjhSnaRDvLztQj1dK4RKU2gWuD7iTYjy1lLPOs8jeZ15DJQmBuNVVekYbigWmlG6Mmu9I36sHTLEu/8iN1t7tG4gMMhiQRS8lavSsZF2rvNfXORdn7krJfY+pQWZBDmnidoYZuHdrZNN6rkM1bOpXKGmmyYfMXiRG547zPxao1FALqGHlmofe4L3cGopI0l+4jPPtryS9d/84+jtji9JQtqfA7uscbyhvH7zq+wFD1OUfM5rv1yw=
Content-ID: <5ECB87FFA9C4EF4DA2774E35F855DC4A@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 060cd045-37a3-4d91-f0dc-08d7174aafde
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Aug 2019 13:09:44.3965 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2666
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] x86/iommu: remove usage of
 {set/clear}_identity_p2m_entry against PV domains
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Roman Shaposhnik <roman@zededa.com>,
 Paul Durrant <paul.durrant@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDIuMDguMjAxOSAxMToyMiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOg0KPiBTd2l0Y2ggcm1y
cl9pZGVudGl0eV9tYXBwaW5nIHRvIHVzZSBpb21tdV97dW59bWFwIGluIG9yZGVyIHRvDQo+IGVz
dGFibGlzaCBSTVJSIG1hcHBpbmdzIGZvciBQViBkb21haW5zLCBsaWtlIGl0J3MgZG9uZSBpbg0K
PiBhcmNoX2lvbW11X2h3ZG9tX2luaXQuIFRoaXMgc29sdmVzIHRoZSBpc3N1ZSBvZiBhIFBWIGhh
cmR3YXJlIGRvbWFpbg0KPiBub3QgZ2V0dGluZyBSTVJSIG1hcHBpbmdzIGJlY2F1c2Uge3NldC9j
bGVhcn1faWRlbnRpdHlfcDJtX2VudHJ5IHdhcw0KPiBub3QgcHJvcGVybHkgdXBkYXRpbmcgdGhl
IGlvbW11IHBhZ2UgdGFibGVzLg0KDQpJbiB3aGljaCB3YXMgdGhpcyB3YXMgbm90IGhhcHBlbmlu
ZyBwcm9wZXJseSBpcyBzdGlsbCBub3QgcmVhbGx5DQp1bmRlcnN0b29kLCB5ZXQgSSB0aGluayB0
aGlzIChvciBhdCBsZWFzdCBhIHBsYXVzaWJsZSB0aGVvcnkpIGlzDQphIHByZXJlcSBmb3IgYW55
IGtpbmQgb2YgZml4LiBUaGUgY29kZSBwYXRocyBmb3IgUFYgYW5kIEhWTSBhcmUNCnByb2JhYmx5
IGRpZmZlcmVudCBlbm91Z2ggc3VjaCB0aGF0IHdlIGRvbid0IG5lZWQgdG8gYmUgYWZyYWlkDQpv
ZiB0aGVyZSBiZWluZyBhIHNpbWlsYXIgcHJvYmxlbSBvbiB0aGUgSFZNIHNpZGUsIGJ1dCB3aGF0
IGlmDQp0aGVyZSdzIGEgbW9yZSBnZW5lcmFsIHByb2JsZW0gdGhhdCB3ZSB3b3VsZCBiZXR0ZXIg
dGFrZSBjYXJlIG9mLA0KcmF0aGVyIHBlcmhhcHMgdGhhbiBnZXR0aW5nIGludG8gYSBzaW1pbGFy
bHkgcHV6emxpbmcgc2l0dWF0aW9uDQphZ2FpbiBsYXRlciBvbi4NCg0KPiBBcyBybXJyX2lkZW50
aXR5X21hcHBpbmcgd2FzIHRoZSBsYXN0IHVzZXIgb2YNCj4ge3NldC9jbGVhcn1faWRlbnRpdHlf
cDJtX2VudHJ5IGFnYWluc3QgUFYgZG9tYWlucyBtb2RpZnkgdGhlIGZ1bmN0aW9uDQo+IHNvIGl0
J3Mgb25seSB1c2FibGUgYWdhaW5zdCB0cmFuc2xhdGVkIGRvbWFpbnMsIGFzIHRoZSBvdGhlciBw
Mm0NCj4gcmVsYXRlZCBmdW5jdGlvbnMuDQoNCkxvb2tpbmcgYXQgdGhlIHJlc3VsdGluZyBjb2Rl
IEknbSBhY3R1YWxseSBub3QgY29udmluY2VkIHRoYXQNCnRoaXMgaXMgYSBnb29kIG1vdmUuIEkg
d291bGQsIGhvd2V2ZXIsIHNwZWNpZmljYWxseSBsaWtlIHRvDQpoZWFyIEdlb3JnZSdzIG9waW5p
b24gaGVyZS4NCg0KPiBAQCAtMTk5NSwxMyArMTk5NiwyMCBAQCBzdGF0aWMgaW50IHJtcnJfaWRl
bnRpdHlfbWFwcGluZyhzdHJ1Y3QgZG9tYWluICpkLCBib29sX3QgbWFwLA0KPiAgIA0KPiAgICAg
ICAgICAgICAgIHdoaWxlICggYmFzZV9wZm4gPCBlbmRfcGZuICkNCj4gICAgICAgICAgICAgICB7
DQo+IC0gICAgICAgICAgICAgICAgaWYgKCBjbGVhcl9pZGVudGl0eV9wMm1fZW50cnkoZCwgYmFz
ZV9wZm4pICkNCj4gLSAgICAgICAgICAgICAgICAgICAgcmV0ID0gLUVOWElPOw0KPiArICAgICAg
ICAgICAgICAgIGlmICggcGFnaW5nX21vZGVfdHJhbnNsYXRlKGQpICkNCj4gKyAgICAgICAgICAg
ICAgICAgICAgcmV0ID0gY2xlYXJfaWRlbnRpdHlfcDJtX2VudHJ5KGQsIGJhc2VfcGZuKTsNCj4g
KyAgICAgICAgICAgICAgICBlbHNlDQo+ICsgICAgICAgICAgICAgICAgICAgIHJldCA9IGlvbW11
X3VubWFwKGQsIF9kZm4oYmFzZV9wZm4pLCBQQUdFX09SREVSXzRLLA0KPiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAmZmx1c2hfZmxhZ3MpOw0KPiAgICAgICAgICAgICAg
ICAgICBiYXNlX3BmbisrOw0KPiAgICAgICAgICAgICAgIH0NCj4gICANCj4gICAgICAgICAgICAg
ICBsaXN0X2RlbCgmbXJtcnItPmxpc3QpOw0KPiAgICAgICAgICAgICAgIHhmcmVlKG1ybXJyKTsN
Cj4gKyAgICAgICAgICAgIC8qIEtlZXAgdGhlIHByZXZpb3VzIGVycm9yIGNvZGUgaWYgdGhlcmUn
cyBvbmUuICovDQo+ICsgICAgICAgICAgICBlcnIgPSBpb21tdV9pb3RsYl9mbHVzaF9hbGwoZCwg
Zmx1c2hfZmxhZ3MpOw0KPiArICAgICAgICAgICAgaWYgKCAhcmV0ICkNCj4gKyAgICAgICAgICAg
ICAgICByZXQgPSBlcnI7DQo+ICAgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4gICAgICAgICAg
IH0NCj4gICAgICAgfQ0KPiBAQCAtMjAxMSw4ICsyMDE5LDEzIEBAIHN0YXRpYyBpbnQgcm1ycl9p
ZGVudGl0eV9tYXBwaW5nKHN0cnVjdCBkb21haW4gKmQsIGJvb2xfdCBtYXAsDQo+ICAgDQo+ICAg
ICAgIHdoaWxlICggYmFzZV9wZm4gPCBlbmRfcGZuICkNCj4gICAgICAgew0KPiAtICAgICAgICBp
bnQgZXJyID0gc2V0X2lkZW50aXR5X3AybV9lbnRyeShkLCBiYXNlX3BmbiwgcDJtX2FjY2Vzc19y
dywgZmxhZyk7DQo+ICsgICAgICAgIGludCBlcnI7DQo+ICAgDQo+ICsgICAgICAgIGlmICggcGFn
aW5nX21vZGVfdHJhbnNsYXRlKGQpICkNCj4gKyAgICAgICAgICAgIGVyciA9IHNldF9pZGVudGl0
eV9wMm1fZW50cnkoZCwgYmFzZV9wZm4sIHAybV9hY2Nlc3NfcncsIGZsYWcpOw0KPiArICAgICAg
ICBlbHNlDQo+ICsgICAgICAgICAgICBlcnIgPSBpb21tdV9tYXAoZCwgX2RmbihiYXNlX3Bmbiks
IF9tZm4oYmFzZV9wZm4pLCBQQUdFX09SREVSXzRLLA0KPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIElPTU1VRl9yZWFkYWJsZSB8IElPTU1VRl93cml0YWJsZSwgJmZsdXNoX2ZsYWdzKTsN
Cj4gICAgICAgICAgIGlmICggZXJyICkNCj4gICAgICAgICAgICAgICByZXR1cm4gZXJyOw0KPiAg
ICAgICAgICAgYmFzZV9wZm4rKzsNCj4gQEAgLTIwMjYsNyArMjAzOSw3IEBAIHN0YXRpYyBpbnQg
cm1ycl9pZGVudGl0eV9tYXBwaW5nKHN0cnVjdCBkb21haW4gKmQsIGJvb2xfdCBtYXAsDQo+ICAg
ICAgIG1ybXJyLT5jb3VudCA9IDE7DQo+ICAgICAgIGxpc3RfYWRkX3RhaWwoJm1ybXJyLT5saXN0
LCAmaGQtPmFyY2gubWFwcGVkX3JtcnJzKTsNCj4gICANCj4gLSAgICByZXR1cm4gMDsNCj4gKyAg
ICByZXR1cm4gaW9tbXVfaW90bGJfZmx1c2hfYWxsKGQsIGZsdXNoX2ZsYWdzKTsNCg0KVGhpcyBp
cyBWVC1kIGNvZGUgLSBpcyB0aGVyZSBhIHBhcnRpY3VsYXIgcmVhc29uIHdoeSB5b3UgZ28gdGhy
b3VnaA0KdGhlIGdlbmVyaWMgY29kZSB3cmFwcGVycyBldmVyeXdoZXJlIGhlcmU/DQoNCkphbg0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
