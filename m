Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 020A8601F9
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 10:14:18 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjJK1-0000qV-9Q; Fri, 05 Jul 2019 08:11:57 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hVvi=VC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hjJK0-0000qQ-7I
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 08:11:56 +0000
X-Inumbo-ID: 8b518f80-9efc-11e9-a635-5ff99afd3c96
Received: from m9a0003g.houston.softwaregrp.com (unknown [15.124.64.68])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8b518f80-9efc-11e9-a635-5ff99afd3c96;
 Fri, 05 Jul 2019 08:11:52 +0000 (UTC)
Received: FROM m9a0003g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0003g.houston.softwaregrp.com WITH ESMTP; 
 Fri,  5 Jul 2019 08:11:51 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Fri, 5 Jul 2019 08:10:50 +0000
Received: from NAM03-DM3-obe.outbound.protection.outlook.com (15.124.8.12) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Fri, 5 Jul 2019 08:10:50 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB3227.namprd18.prod.outlook.com (10.255.173.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.18; Fri, 5 Jul 2019 08:10:49 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2052.019; Fri, 5 Jul 2019
 08:10:49 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v9 11/23] x86emul: support of AVX512* population count
 insns
Thread-Index: AQHVL/8+w7wOwPiMakCGalDz/ydOwKa6jtGDgAAB+QCAAD6Oa4AA4vaA
Date: Fri, 5 Jul 2019 08:10:49 +0000
Message-ID: <1c931e01-7925-7a39-3bf5-5037c54555b1@suse.com>
References: <f69ca82f-e2db-e85e-ff98-2060a8dc28a5@suse.com>
 <745c685a-a614-6067-946d-c89fe98cb589@suse.com>
 <3240eb2e-ff32-bfc6-fa49-0cc8bb84582d@citrix.com>
 <e95d1c2c-feea-b8cc-0fca-a005668f269f@suse.com>
 <40ac52b4-7d97-2106-3065-22dd810be5c4@citrix.com>
In-Reply-To: <40ac52b4-7d97-2106-3065-22dd810be5c4@citrix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB3PR0202CA0005.eurprd02.prod.outlook.com
 (2603:10a6:8:1::18) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6938bb99-d722-4300-60be-08d701204a29
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB3227; 
x-ms-traffictypediagnostic: DM6PR18MB3227:
x-microsoft-antispam-prvs: <DM6PR18MB32278A457C95B63D450CC988B3F50@DM6PR18MB3227.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 008960E8EC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(376002)(136003)(366004)(346002)(39860400002)(396003)(199004)(189003)(256004)(11346002)(446003)(2616005)(53936002)(14444005)(6246003)(6512007)(5660300002)(86362001)(80792005)(305945005)(36756003)(7736002)(31696002)(64756008)(66446008)(66556008)(66946007)(486006)(3846002)(229853002)(6436002)(6506007)(2501003)(66476007)(73956011)(6116002)(68736007)(476003)(6486002)(52116002)(110136005)(54906003)(66066001)(316002)(4326008)(8676002)(71200400001)(8936002)(81156014)(99286004)(81166006)(71190400001)(26005)(31686004)(53546011)(14454004)(102836004)(76176011)(72206003)(386003)(186003)(478600001)(2906002)(25786009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB3227;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Y4xDmH9oy2oClC2HgKHshP52S8coXFlL720QmEFr4uG5kpCXkb4ekmvc078+ZICdFGEcMK3w8I4ygNycbWeAUliHCJsMPCgGIj/9DbV2kvqgX1GLLz0XrfsLK9LEsUOpPfErwbnn+VAfcnLIM4Esgm2GC0jyzfsLuniQh89hynS5KBaRHETWowZv/CMn0hX9S59PzMzlW8Mk0PoeCzGmgkJtZZPSlY+Y1SiEPavzdDUCvnDI1+kj5p0qg5CzZAo9Ta01hRGJlmy5V5fRz3bjdlQYINey1M0Y0O6eWxViziNyCyi5/l0EU/RxevojvL+nYnkfa0pBKnXcg1V8i/4ePDwbZ8cRz2fb2rmQbiokgGT/r6Mu5AMggGGks/M4/fMqt0RAsp+QwyDSL7B3R2t2CswG4CGX7sOzpGkJ8P62e6c=
Content-ID: <B46C855AEB7CE44C94A1D8F4DB0CB777@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 6938bb99-d722-4300-60be-08d701204a29
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jul 2019 08:10:49.3959 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB3227
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH v9 11/23] x86emul: support of AVX512*
 population count insns
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
Cc: Wei Liu <wl@xen.org>, RogerPau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDQuMDcuMjAxOSAyMDozOCwgQW5kcmV3IENvb3BlciB3cm90ZToNCj4gT24gMDQvMDcvMjAx
OSAxNTo1NCwgSmFuIEJldWxpY2ggd3JvdGU6DQo+PiBPbiAwNC4wNy4yMDE5IDE2OjQ3LCBBbmRy
ZXcgQ29vcGVyIHdyb3RlOg0KPj4+IE9uIDAxLzA3LzIwMTkgMTI6MjIsIEphbiBCZXVsaWNoIHdy
b3RlOg0KPj4+PiAtLS0gYS94ZW4vdG9vbHMvZ2VuLWNwdWlkLnB5DQo+Pj4+ICsrKyBiL3hlbi90
b29scy9nZW4tY3B1aWQucHkNCj4+Pj4gQEAgLTI2OCw3ICsyNjgsNyBAQCBkZWYgY3J1bmNoX251
bWJlcnMoc3RhdGUpOg0KPj4+PiAgICAgICAgICAgICAjIEFWWDUxMiBleHRlbnNpb25zIGFjdGlu
ZyBvbiB2ZWN0b3JzIG9mIGJ5dGVzL3dvcmRzIGFyZSBtYWRlDQo+Pj4+ICAgICAgICAgICAgICMg
ZGVwZW5kZW50cyBvZiBBVlg1MTJCVyAoYXMgdG8gcmVxdWlyaW5nIHdpZGVyIHRoYW4gMTYtYml0
IG1hc2sNCj4+Pj4gICAgICAgICAgICAgIyByZWdpc3RlcnMpLCBkZXNwaXRlIHRoZSBTRE0gbm90
IGZvcm1hbGx5IG1ha2luZyB0aGlzIGNvbm5lY3Rpb24uDQo+Pj4+IC0gICAgICAgIEFWWDUxMkJX
OiBbQVZYNTEyX0JGMTYsIEFWWDUxMl9WQk1JLCBBVlg1MTJfVkJNSTJdLA0KPj4+PiArICAgICAg
ICBBVlg1MTJCVzogW0FWWDUxMl9CRjE2LCBBVlg1MTJfQklUQUxHLCBBVlg1MTJfVkJNSSwgQVZY
NTEyX1ZCTUkyXSwNCj4+PiBCSVRBTEcgc2hvdWxkIGJlIGFmdGVyIFZCTUkyLCBiZWNhdXNlIGV2
ZXJ5dGhpbmcgaW4gdGhpcyB0YWJsZSBpcw0KPj4+IG9yZGVyZWQgYnkgYml0IG51bWJlci4NCj4+
IEFzIHNhaWQgYmVmb3JlIC0gdGhlcmUncyBubyBvcmRlcmluZyBieSBiaXQgbnVtYmVyIHBvc3Np
YmxlIGhlcmUuDQo+IA0KPiBJdHMgcGVyZmVjdGx5IGVhc3kuwqAgRWFjaCBmZWF0dXJlIGhhcyBh
IHVuaXF1ZSBudW1iZXIuDQoNCldlbGwsIG9rYXksIGZvciBzdWItbGVhdmVzIG9mIHRoZSBzYW1l
IG1haW4gbGVhZiBJIGNhbiBhY2NlcHQNCnRoaXMuIEJ1dCB3aGF0IHNvcnRpbmcgZG8geW91IHN1
Z2dlc3QgYmV0d2VlbiBiYXNpYyBhbmQgZXh0ZW5kZWQNCmxlYXZlcz8NCg0KPj4gVGhlIGluZGl2
aWR1YWwgZmVhdHVyZXMgbWF5IGxpdmUgb24gZGlmZmVyZW50IChzdWIpbGVhdmVzLiBCeQ0KPj4g
d2hhdCB5b3Ugc2F5IEJGMTYgc2hvdWxkbid0IGJlIGZpcnN0LiBUaGUgbGlzdCBoZXJlIGNsZWFy
bHkgaXMNCj4+IHNvcnRlZCBhbHBoYWJldGljYWxseSwgYW5kIGltbyB0aGF0J3MgdGhlIG9ubHkg
ZnV0dXJlIHByb29mIHNvcnRpbmcNCj4+IHBvc3NpYmxlIChhbmQgYWxzbyBmb3IgQVZYNTEyRiwg
d2hlcmUgSSBoYWQgcHJldmlvdXNseSBvZmZlcmVkIHRvDQo+PiBwdXQgdG9nZXRoZXIgYSBwYXRj
aCB0byBzd2l0Y2ggdG8gYWxwaGFiZXRpY2FsIG9yZGVyaW5nLCBpZiBvbmx5IHdlDQo+PiBjb3Vs
ZCBhZ3JlZSBvbiB0aGF0KS4NCj4gDQo+IEluIHdoaWNoIGNhc2UgSSBtaXNzZWQgaXQgZHVyaW5n
IHJldmlldy4NCj4gDQo+IFRoaXMgZmVhdHVyZSBtYXRyaXggaXMgZGVsaWJlcmF0ZWx5IHNvcnRl
ZCBieSBmZWF0dXJlIG51bWJlciBpbiBhbg0KPiBlZmZvcnQgdG8gcHJlc2VydmUgY2hyb25vbG9n
eSwgd2hpY2ggaXMgYSBtdWNoIG1vcmUgdXNlZnVsIHdheSBvZg0KPiByZWFzb25pbmcgYWJvdXQg
ZmVhdHVyZSBkZXBlbmRlbmNpZXMuDQoNCkV4Y2VwdCB0aGF0IGJpdCBudW1iZXJzIGFyZSBvZnRl
biwgYnV0IG5vdCBhbHdheXMgYW4gaW5kaWNhdGlvbiBvZg0KY2hyb25vbG9naWNhbCBvcmRlci4N
Cg0KV2hpbGUgSSBjbGVhcmx5IGRpc2FncmVlLCBmb3IgdGhlcmUgdG8gYmUgcHJvZ3Jlc3MgaGVy
ZSwgZG8geW91DQpleHBlY3QgbWUgdG8gcmUtYXJyYW5nZSB0aGUgZGVwZW5kZW5jeSBsaXN0IGFi
b3ZlLCBpLmUuIGdvaW5nDQpiZXlvbmQgeW91ciBpbml0aWFsIHJlcXVlc3Q/IEkgY2VydGFpbmx5
IG9iamVjdCB0byBkb2luZyBfanVzdF8NCnRoZSBvcmlnaW5hbGx5IHJlcXVlc3RlZCBhZGp1c3Rt
ZW50IC4uLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
