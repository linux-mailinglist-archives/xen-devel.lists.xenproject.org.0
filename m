Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 864746BFB7
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 18:37:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnmtJ-0004VP-3S; Wed, 17 Jul 2019 16:34:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=H7Ci=VO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hnmtH-0004Ut-9p
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 16:34:51 +0000
X-Inumbo-ID: b9c2ce48-a8b0-11e9-aaa5-03a846007b4e
Received: from m9a0002g.houston.softwaregrp.com (unknown [15.124.64.67])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b9c2ce48-a8b0-11e9-aaa5-03a846007b4e;
 Wed, 17 Jul 2019 16:34:47 +0000 (UTC)
Received: FROM m9a0002g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0002g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 17 Jul 2019 16:34:25 +0000
Received: from M4W0334.microfocus.com (2002:f78:1192::f78:1192) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 17 Jul 2019 16:32:57 +0000
Received: from NAM05-DM3-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0334.microfocus.com (15.120.17.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 17 Jul 2019 16:32:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mPPbrTZNgsFWCaCzcKfl4IGMnoqWaLmS6nJyjDt+SbwnJndCtbhOhTJEzPgy/wc+DOtzaH6JeSSEZ8K4maSHXL8VpCLE0QuLZ56MQmr63owyV1lzv2NWWMrKdoWliELsdv30RZMs4d6tc+ACV33p1DkPaGe7GlM44nL2yfVsM/Imo+r/Snp3EyKOBE0778y8IwPuO6NIQnqveSYuREgiLAYfQbYh3gfX+lmVcaaon4EHtJbO/Tmdb9VUWzwKs4EhIiLkPOuJzhtgl4YE0qCtFellJ23HeOsPenQVdBzf/CEHA5Q3YnJUNflQ/+eQvb02UXkwqORcPuil9qXp4DHxLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lsgbUbDUf87DmcnISCDo6oO6Q7lCAYNuQzuGEfnHNzk=;
 b=QynFEMAGoCDWGwobZT5+ZzuMd53gojfJDyPt1ctZMAjo9/14Q4pWuIVBWvvJuTWQ0XXbrO69CgsLT1SdmFkonkHdypPudf/2OCYI3ZrMinwghEGGwU0Ju0WTriVTiE+2qF/4iP5faH6uyopNHnLUZLXyUkkDyPjTl/faHH3NLXob14pT683B2bmU8MssmR0fGdZF3xrNNkPy72k4kBwZFCC6N+4QKDHw5yNds67CdSzFtRX4GlqrXW1QvXVImcYzWFeFR8UuD+T5W+AAmDaq30vzCIXuMk0D8CzPjcdUM1f78uez7XiDp9LfWT2hU2nY33RuIIg7oaHtgngbnxfmpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2555.namprd18.prod.outlook.com (20.179.105.219) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.11; Wed, 17 Jul 2019 16:32:56 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Wed, 17 Jul 2019
 16:32:56 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>, Paul Durrant
 <Paul.Durrant@citrix.com>
Thread-Topic: [PATCH v2 07/10] vm_event: Add vm_event_ng interface
Thread-Index: AQHVO/ja8zGHp8jkY0SwPhMewFAvpabOlq4AgABMy4CAAB8hAA==
Date: Wed, 17 Jul 2019 16:32:56 +0000
Message-ID: <20603303-440d-3ac4-8f78-861abaa78d70@suse.com>
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
 <cover.1563293545.git.ppircalabu@bitdefender.com>
 <79a1e2aebc55c20f58cb8c925320de202b17d8f2.1563293545.git.ppircalabu@bitdefender.com>
 <e1c9a42d-7bde-5749-7cf3-cb5e7b4041e1@suse.com>
 <de42faf2929b0ff0d52949d21dea5f2b30336840.camel@bitdefender.com>
In-Reply-To: <de42faf2929b0ff0d52949d21dea5f2b30336840.camel@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P189CA0029.EURP189.PROD.OUTLOOK.COM (2603:10a6:6:2e::42)
 To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7dc8e244-2abb-4428-9056-08d70ad46c66
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2555; 
x-ms-traffictypediagnostic: DM6PR18MB2555:
x-microsoft-antispam-prvs: <DM6PR18MB2555877F3C6150612C816091B3C90@DM6PR18MB2555.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01018CB5B3
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(396003)(376002)(136003)(39860400002)(366004)(199004)(189003)(305945005)(66946007)(14454004)(5660300002)(2906002)(66446008)(446003)(2616005)(476003)(66556008)(7736002)(11346002)(54906003)(110136005)(31696002)(6246003)(86362001)(4326008)(66476007)(486006)(14444005)(31686004)(64756008)(256004)(3846002)(66066001)(80792005)(6116002)(53546011)(186003)(8676002)(7416002)(6506007)(99286004)(76176011)(52116002)(71200400001)(68736007)(71190400001)(53936002)(386003)(8936002)(6512007)(81156014)(81166006)(6436002)(25786009)(478600001)(102836004)(229853002)(6486002)(26005)(316002)(36756003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2555;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: WE1DTWaCoJ+IoBkHiWjuSNooQ1pecQHLsCIIHJx6qBhv1nB02isDn0Qvy3iq27jF+51xaxvIOu80dPd2oMm/dF8+yfNCzKdndWqJhCxbu0qxwaflP1hgrY8kF8qcrJ7yE7FmkYurqNyk3/MsLUyYZnKUtWdVvzRIsWnX0W49DZXDwiXg3gVzdC49/S8D4UOt0DKY/wKGBpnPeyiN4YEK90f7cDRyc1xt377EB+ac16C6pa3tO4gdAv+4ikeonKEsDZYvedAbuoiFgiuB1O+XCLNEqr79lM5xgmJxfC14tijk2hhYGIJvMW7Lalw2kQS37BfAygMJr+X7V4ydRMgYLaqf/0reSLd/RX88tu+jzL+bFpgbiI/7CZljX19cnWOR8J6Sb2ULPLWnOQUjoMM2QQWioyp2WU1CJrGSXItMna8=
Content-ID: <34869FDCAA357D4E87A2EBE2A7B9A561@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 7dc8e244-2abb-4428-9056-08d70ad46c66
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jul 2019 16:32:56.5169 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2555
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v2 07/10] vm_event: Add vm_event_ng interface
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
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 JulienGrall <julien.grall@arm.com>, Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTcuMDcuMjAxOSAxNjo0MSwgUGV0cmUgT3ZpZGl1IFBJUkNBTEFCVSB3cm90ZToNCj4gT24g
V2VkLCAyMDE5LTA3LTE3IGF0IDEwOjA2ICswMDAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9u
IDE2LjA3LjIwMTkgMTk6MDYsIFBldHJlIFBpcmNhbGFidSB3cm90ZToNCj4+PiArc3RhdGljIHZv
aWQgdm1fZXZlbnRfY2hhbm5lbHNfZnJlZV9idWZmZXIoc3RydWN0DQo+Pj4gdm1fZXZlbnRfY2hh
bm5lbHNfZG9tYWluICppbXBsKQ0KPj4+ICAgIHsNCj4+PiAtICAgIHZtX2V2ZW50X3JpbmdfcmVz
dW1lKHRvX3Jpbmcodi0+ZG9tYWluLT52bV9ldmVudF9tb25pdG9yKSk7DQo+Pj4gKyAgICBpbnQg
aTsNCj4+PiArDQo+Pj4gKyAgICB2dW5tYXAoaW1wbC0+c2xvdHMpOw0KPj4+ICsgICAgaW1wbC0+
c2xvdHMgPSBOVUxMOw0KPj4+ICsNCj4+PiArICAgIGZvciAoIGkgPSAwOyBpIDwgaW1wbC0+bnJf
ZnJhbWVzOyBpKysgKQ0KPj4+ICsgICAgICAgIGZyZWVfZG9taGVhcF9wYWdlKG1mbl90b19wYWdl
KGltcGwtPm1mbltpXSkpOw0KPj4+ICAgIH0NCj4+DQo+PiBXaGF0IGd1YXJhbnRlZXMgdGhhdCB0
aGVyZSBhcmUgbm8gbWFwcGluZ3MgbGVmdCBvZiB0aGUgcGFnZXMgeW91IGZyZWUNCj4+IGhlcmU/
IFNoYXJpbmcgcGFnZXMgd2l0aCBndWVzdHMgaXMgKHNvIGZhcikgYW4gKGFsbW9zdCkgaXJyZXZl
cnNpYmxlDQo+PiBhY3Rpb24sIGkuZS4gdGhleSBtYXkgZ2VuZXJhbGx5IG9ubHkgYmUgZnJlZWQg
dXBvbiBkb21haW4NCj4+IGRlc3RydWN0aW9uLg0KPj4gU2VlIGdudHRhYl91bnBvcHVsYXRlX3N0
YXR1c19mcmFtZXMoKSBmb3IgYSBjYXNlIHdoZXJlIHdlIGFjdHVhbGx5DQo+PiBtYWtlIGFuIGF0
dGVtcHQgYXQgZnJlZWluZyBzdWNoIHBhZ2VzIChidXQgd2hlcmUgd2UgZmFpbCB0aGUgcmVxdWVz
dA0KPj4gaW4gY2FzZSByZWZlcmVuY2VzIGFyZSBsZWZ0IGluIHBsYWNlKS4NCj4+DQo+IEkndmUg
dGVzdGVkIG1hbnVhbGx5IDIgY2FzZXMgYW5kIHRoZXkgYm90aCB3b3JrIChubyBjcmFzaGVzKToN
Cj4gMTogaW50cm9zcGVjdGVkIGRvbWFpbiBzdGFydHMgLT4gbW9uaXRvciBzdGFydHMgLT4gbW9u
aXRvciBzdG9wcyAtPg0KPiBkb21haW4gc3RvcHMNCj4gMjogaW50cm9zcGVjdGVkIGRvbWFpbiBz
dGFydHMgLT4gbW9uaXRvciBzdGFydHMgLT4gZG9tYWluIHN0b3BzIC0+DQo+IG1vbml0b3Igc3Rv
cHMuDQoNCldlbGwsIHRlc3RpbmcgaXMgaW1wb3J0YW50LCBidXQgZG9pbmcgdGVzdHMgbGlrZSB5
b3UgZGVzY3JpYmUgd29uJ3QNCmNhdGNoIGFueSBtaXNiZWhhdmluZyBvciBtYWxpY2lvdXMgbW9u
aXRvciBkb21haW4uDQoNCj4gSG93ZXZlciwgSSB3aWxsIHRha2UgYSBjbG9zZXIgbG9vayBhdCBn
bnR0YWJfdW5wb3B1bGF0ZV9zdGF0dXNfZnJhbWVzDQo+IGFuZCBwb3N0IGEgZm9sbG93IHVwIGVt
YWlsLg0KDQpUaGFua3MuDQoNCj4+IEZ1cnRoZXJtb3JlLCBpcyB0aGVyZSBhbnkgZ3VhcmFudGVl
IHRoYXQgdGhlIHBhZ2VzIHlvdSBmcmVlIGhlcmUNCj4+IHdlcmUgYWN0dWFsbHkgYWxsb2NhdGVk
PyAtPm5yX2ZyYW1lcyBnZXRzIHNldCBhaGVhZCBvZiB0aGUgYWN0dWFsDQo+PiBhbGxvY2F0aW9u
Lg0KPj4NCj4gdm1fZXZlbnRfY2hhbm5lbHNfZnJlZV9idWZmZXIgaXMgY2FsbGVkIG9ubHkgZnJv
bQ0KPiB2bV9ldmVudF9jaGFubmVsc19kaXNhYmxlLiBUaGUgbGF0dGVyIGlzIGNhbGxlZCBvbmx5
IGlmIHZtX2V2ZW50X2NoZWNrDQo+IHN1Y2NlZWRzICggdm1fZXZlbnRfY2xlYW51cCBhbmQgdm1f
ZXZlbnRfZG9tY3RsL1ZNX0VWRU5UX0RJU0FCTEUpLg0KPiB2bV9ldmVudF9jaGVjayB3aWxsIG9u
bHkgcmV0dXJuIHRydWUgaWYgdm1fZXZlbnRfZW5hYmxlIHN1Y2NlZWRzLg0KDQpIbW0sIGxvb2tz
IGxpa2UgSSB3YXMgbWlzbGVhZCB0byBiZWxpZXZlIHRoZSBmcmVlaW5nIGZ1bmN0aW9uDQp3b3Vs
ZCBiZSBjYWxsZWQgYnkgdm1fZXZlbnRfY2hhbm5lbHNfZW5hYmxlKCkgbm90IGl0c2VsZiBmcmVl
aW5nDQp3aGF0IGl0IG1pZ2h0IGhhdmUgYWxsb2NhdGVkIHVwb24gZXJyb3IuIFNvIHBlcmhhcHMg
dGhlIGJ1ZyBpcw0KdGhlcmUsIG5vdCB3aGVyZSBJIHRob3VnaHQgaXQgd291bGQgYmUuDQoNCj4+
PiAraW50IHZtX2V2ZW50X25nX2dldF9mcmFtZXMoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQg
aW50IGlkLA0KPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGZy
YW1lLCB1bnNpZ25lZCBpbnQNCj4+PiBucl9mcmFtZXMsDQo+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHhlbl9wZm5fdCBtZm5fbGlzdFtdKQ0KPj4+ICt7DQo+Pj4gKyAgICBzdHJ1Y3Qg
dm1fZXZlbnRfZG9tYWluICp2ZWQ7DQo+Pj4gKyAgICBpbnQgaTsNCj4+PiArDQo+Pj4gKyAgICBz
d2l0Y2ggKGlkICkNCj4+PiArICAgIHsNCj4+PiArICAgIGNhc2UgWEVOX1ZNX0VWRU5UX1RZUEVf
TU9OSVRPUjoNCj4+PiArICAgICAgICB2ZWQgPSBkLT52bV9ldmVudF9tb25pdG9yOw0KPj4+ICsg
ICAgICAgIGJyZWFrOw0KPj4+ICsNCj4+PiArICAgIGRlZmF1bHQ6DQo+Pj4gKyAgICAgICAgcmV0
dXJuIC1FTk9TWVM7DQo+Pg0KPj4gVmFyaW91cyBvdGhlciBlcnJvciBjb2RlcyBtaWdodCBiZSBm
aW5lIGhlcmUsIGJ1dCBFTk9TWVMgaXMgbm90DQo+PiAoZGVzcGl0ZSBwcmUtZXhpc3RpbmcgbWlz
dXNlIGVsc2V3aGVyZSBpbiB0aGUgdHJlZSkuDQo+IA0KPiB2bV9ldmVudF9kb21jdGwgYWxzbyBy
ZXR1cm5zIC1FTk9TWVMgaWYgdGhlIHR5cGUgaXMgbmVpdGhlcg0KPiBYRU5fVk1fRVZFTlRfVFlQ
RV9QQUdJTkcsIFhFTl9WTV9FVkVOVF9UWVBFX01PTklUT1IsIG5vcg0KPiBYRU5fVk1fRVZFTlRf
VFlQRV9TSEFSSU5HLiBJJ3ZlIGp1c3QgZm9sbG93ZWQgdGhlIGV4aXN0aW5nIGNvbnZlbnRpb24u
DQoNClJpZ2h0IC0gdGhhdCdzIG9uZSBvZiB0aGUgcHJlLWV4aXN0aW5nIG1pc3VzZXMgdGhhdCBJ
IHdhcyByZWZlcnJpbmcNCnRvLg0KDQo+Pj4gKyAgICB9DQo+Pj4gKw0KPj4+ICsgICAgaWYgKCAh
dm1fZXZlbnRfY2hlY2sodmVkKSApDQo+Pj4gKyAgICAgICAgcmV0dXJuIC1FSU5WQUw7DQo+Pj4g
Kw0KPj4+ICsgICAgaWYgKCBmcmFtZSAhPSAwIHx8IG5yX2ZyYW1lcyAhPSB0b19jaGFubmVscyh2
ZWQpLT5ucl9mcmFtZXMgKQ0KPj4+ICsgICAgICAgIHJldHVybiAtRUlOVkFMOw0KPj4NCj4+IElz
IHRoZXJlIGEgcGFydGljdWxhciByZWFzb24gZm9yIHRoaXMgYWxsLW9yLW5vdGhpbmcgbW9kZWw/
DQo+IA0KPiBJJ3ZlIGFkZGVkIHRoaXMgZXh0cmEgY2hlY2sgZHVlIHRvIHRoZSB3YXkgYWNxdWly
ZV9yZXNvdXJjZSBpbnRlcmZhY2UNCj4gaXMgZGVzaWduZWQuIEluIG91ciBjYXNlLCB0aGUgbWVt
b3J5IGlzIGFsbG9jYXRlZCBmcm9tDQo+IFhFTl9WTV9FVkVOVF9FTkFCTEUgYW5kIHRoZSBzaXpl
IGlzIGtub3duIGJlZm9yZWhhbmQ6IHRoZSBudW1iZXIgb2YNCj4gcGFnZXMgbmVlZGVkIHRvIHN0
b3JlICh2Y3B1c19jb3VudCAqIHNpemVvZiB2bV9ldmVudF9zbG90KSBieXRlcy4NCj4gSG93ZXZl
ciB0aGUgYWNxdWlyZV9yZXNvdXJjZSBuZWVkcyBhICJucl9mcmFtZXMiIHBhcmFtZXRlciB3aGlj
aCBpcw0KPiBjb21wdXRlZCBpbiBhIHNpbWlsYXIgbWFubmVyIGluIHRoZSBsaWJ4YyB3cmFwcGVy
Lg0KDQpIbW0sIG1heWJlIEknbSBub3QgdXAgdG8gZGF0ZSBoZXJlOiBQYXVsLCBpcyB0aGUgZ2Vu
ZXJhbCByZXNvdXJjZQ0Kb2J0YWluaW5nL21hcHBpbmcgbG9naWMgaW5kZWVkIG1lYW50IHRvIGJl
IGFuIGFsbC1vci1ub3RoaW5nIHRoaW5nDQpvbmx5Pw0KDQpKYW4NCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVu
LWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcv
bWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
