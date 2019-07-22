Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D096FADE
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 10:03:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpTF1-0000fD-2w; Mon, 22 Jul 2019 08:00:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=wXcs=VT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hpTF0-0000f7-2x
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 08:00:14 +0000
X-Inumbo-ID: af59426e-ac56-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id af59426e-ac56-11e9-8980-bc764e045a96;
 Mon, 22 Jul 2019 08:00:12 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.191) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Mon, 22 Jul 2019 07:59:49 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M9W0068.microfocus.com (2002:f79:bf::f79:bf) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Mon, 22 Jul 2019 07:59:21 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Mon, 22 Jul 2019 07:59:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OZmsEfj2JVSfQJQYCVX5Ia500g6dPJRPouM4usWIQc/tRa5uG/NYWsrHhg4aA81OhX7BBIqja7lxhKYi9IdRnSBCsyLWInXq8LCdbS4MQWv8TBy4CtVC5Wo4DAz+G1Xru/sgqawIgj/kJSt3QHg5Ls2ninOTaUtmEj5KUtKssfr23SpMUNJci7OlUopRjMEzmYGDFhLlIS7711hp12FqPTf2H0g/DxxK1B4cgXQT9MGv6WuFc5tkXSUaN1rw4w3a3IyWdMuxgU5U8lzyXVj4L1BYwuVKSrTEv1dBkOgLtTZdHyxnLZDNthyHgBWbdOc75TdP84CU10KgRwXOD5Dlfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=USzBcrQDavAaiCoz3C3QhWEuJ9lwjQ0fuWxdjnV0aNs=;
 b=ZEPoP32U+G1dwlwqpG3t9qLusZD0JkaRtKCYgdKdIeu8iIWMdQ/byNr7k7VWDACEyeFTZGFKYCneRAbEWjHj3ieJezd+qpRx0KF2SfwKsrRULUIUh00JeoL2wx2mYRLtZdpyNlDj6buEOZGxNlLZlUiFTo3Gzn6UWTII7qvK+1ntAVXLWhI2XmWZRAKoxvttoOZdTMlEbJurVbJiX980J3DG8IcvYxjVQWvZ3etpOC0Mt2GSFYmpKVMDi0RKMl3DCx9W0VnKwqAoS/71CqvBPemJraXkTS62TzOpL3d72rXKGAD7zHM2JHCbTe0hGgkF9CvTW5TpWLHTPp1Tz6tVFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2937.namprd18.prod.outlook.com (20.179.52.151) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.14; Mon, 22 Jul 2019 07:59:20 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Mon, 22 Jul 2019
 07:59:20 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>, Andrew Cooper
 <Andrew.Cooper3@citrix.com>, Paul Durrant <Paul.Durrant@citrix.com>
Thread-Topic: [PATCH v2 07/10] vm_event: Add vm_event_ng interface
Thread-Index: AQHVO/ja8zGHp8jkY0SwPhMewFAvpabOlq4AgABMy4CAAB8oAIABZ1KAgAEtDgCAAAdBAIAAAR2AgAAxiYCAAA10AIAABbYAgAABeACAAAYkAIAATloAgAQUuAA=
Date: Mon, 22 Jul 2019 07:59:20 +0000
Message-ID: <954f247d-fff0-3a73-42e8-b8b64e126bc3@suse.com>
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
 <cover.1563293545.git.ppircalabu@bitdefender.com>
 <79a1e2aebc55c20f58cb8c925320de202b17d8f2.1563293545.git.ppircalabu@bitdefender.com>
 <e1c9a42d-7bde-5749-7cf3-cb5e7b4041e1@suse.com>
 <de42faf2929b0ff0d52949d21dea5f2b30336840.camel@bitdefender.com>
 <20603303-440d-3ac4-8f78-861abaa78d70@suse.com>
 <22abf98c86af08adb0444ffa115bc56b9bd552fc.camel@bitdefender.com>
 <d73a2d9ba0b5407390ae9a635314f6d4@AMSPEX02CL03.citrite.net>
 <014491cd-8ee7-26ff-5619-6c5d54c51b3c@suse.com>
 <ebe52ee6d8a9483b87f21d01c5f2c435@AMSPEX02CL03.citrite.net>
 <bf1c57019b77fd6b79f86957477862ae81db5678.camel@bitdefender.com>
 <875eb41c92654f5a85625f0cc08994b5@AMSPEX02CL03.citrite.net>
 <88cd6480-cda4-5e9b-2e9a-aa1e275832cb@suse.com>
 <24e346edb9604148b5790369b4fce384@AMSPEX02CL03.citrite.net>
 <96e2ece1-5460-52d5-d2a5-8123d8148441@suse.com>
 <34f0c5f2d55c5318b1a922d2aec2aa70ef23010e.camel@bitdefender.com>
In-Reply-To: <34f0c5f2d55c5318b1a922d2aec2aa70ef23010e.camel@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0415.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a0::19) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 32c62306-7945-437c-5f97-08d70e7a8096
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2937; 
x-ms-traffictypediagnostic: DM6PR18MB2937:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM6PR18MB2937D81417FB82072AB7C472B3C40@DM6PR18MB2937.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01068D0A20
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(39860400002)(376002)(366004)(136003)(396003)(199004)(13464003)(189003)(6116002)(2616005)(476003)(31686004)(81166006)(81156014)(486006)(446003)(305945005)(7736002)(6436002)(316002)(14454004)(6246003)(5660300002)(11346002)(3846002)(6306002)(36756003)(80792005)(68736007)(4326008)(102836004)(6512007)(99286004)(53936002)(26005)(6486002)(66946007)(2906002)(186003)(66446008)(66556008)(64756008)(52116002)(66476007)(256004)(8676002)(54906003)(110136005)(7416002)(8936002)(31696002)(53546011)(6506007)(386003)(86362001)(966005)(71190400001)(71200400001)(229853002)(25786009)(66066001)(478600001)(76176011);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2937;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OuhdX6S6geEGAGmJEq5Eg9hD9kyS1opmIU/B3QGTTlDqHIloxZh4Ljc01he05BzwVX5Xf1TOmVYATgbZiM9WNLeUOKY1H5ls/TYzvJigGm6pQF1Qwawho1G0FPtrgOQukNj1K0V0mVsEZlOfot14hcfycvBvAhcBO12aO8TWmp9XOqCRDlBvKRnqGl4zO2mRxZH/6f/VsSCVYFOmMuFa2eK3HhfP8uMDAFym3RhG0NvO8TH7yYM4Z390e5bj+e6UDzZR4nmaWPz9yQZjbKrVYDazwNYYX2OwJEoaYT7FF2TmWPKGR2UXGAbVP5eGfthv/rV9Wb/2I/kzShGkQ05c4bg0jug1KUAj6oSUVv7O3hFNjq1zM09hXe87+JemKeBON8ZpSNAYQzrTViD29jusfktPb199qzAdk+URBhhNPF4=
Content-ID: <252F01655D5D2F41BF99CAAD9DF012C6@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 32c62306-7945-437c-5f97-08d70e7a8096
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jul 2019 07:59:20.5280 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2937
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
Cc: StefanoStabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Razvan Cojocaru <rcojocaru@bitdefender.com>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>, "Tim\(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, JulienGrall <julien.grall@arm.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 IanJackson <Ian.Jackson@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDcuMjAxOSAxOTo0MCwgUGV0cmUgT3ZpZGl1IFBJUkNBTEFCVSB3cm90ZToNCj4gT24g
RnJpLCAyMDE5LTA3LTE5IGF0IDEyOjU5ICswMDAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9u
IDE5LjA3LjIwMTkgMTQ6MzcsIFBhdWwgRHVycmFudCB3cm90ZToNCj4+Pj4gRnJvbTogSmFuIEJl
dWxpY2ggPEpCZXVsaWNoQHN1c2UuY29tPg0KPj4+PiBTZW50OiAxOSBKdWx5IDIwMTkgMTM6MzIN
Cj4+Pj4NCj4+Pj4gT24gMTkuMDcuMjAxOSAxNDoxMSwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPj4+
Pj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+Pj4+Pj4gRnJvbTogUGV0cmUgT3ZpZGl1
IFBJUkNBTEFCVSA8cHBpcmNhbGFidUBiaXRkZWZlbmRlci5jb20+DQo+Pj4+Pj4gU2VudDogMTkg
SnVseSAyMDE5IDEyOjI0DQo+Pj4+Pj4NCj4+Pj4+PiBTb3JyeSwgbXkgbWlzdGFrZS4gSSBtZWFu
dCB0byBzYXkgaXQncyBzaGFyZWQgd2l0aCBNRC4NCj4+Pj4+Pg0KPj4+Pj4+IE1hbnkgdGhhbmtz
IGZvciB5b3VyIHN1cHBvcnQsDQo+Pj4+Pg0KPj4+Pj4gT2ssIGluIHRoYXQgY2FzZSBwbGVhc2Ug
c2hhcmUgd2l0aCB0aGUgSUQgaW5zdGVhZC4NCj4+Pj4NCj4+Pj4gQnV0IHRoYXQncyBleGFjdGx5
IHdoYXQgd2Ugd2FudCB0byBhdm9pZDogSWYgc2hhcmluZyBhdCBhbGwsIHRoZW4NCj4+Pj4gcGxl
YXNlIHdpdGggdGhlIG1vcmUgcHJpdmlsZWdlZCBlbnRpdHkuDQo+Pj4NCj4+PiBXaHk/IFdlJ3Jl
IHRhbGtpbmcgSFZNIGd1ZXN0cyBvbmx5IGhlcmUgSUlVQyBzbyB0aGlzIGlzIGVxdWl2YWxlbnQN
Cj4+PiB0byBJT1JFUSBzZXJ2ZXIuLi4NCj4+DQo+PiBOb3Qgc3VyZTogVGhlIG1haW4gdm1fZXZl
bnQuYyBmaWxlcyBsaXZlIGluIGNvbW1vbi8gYW5kIGFyY2gveDg2Lw0KPj4gcmVzcGVjdGl2ZWx5
LCBzbyBJIHRob3VnaHQgYXQgbGVhc3QgYXJjaGl0ZWN0dXJhbGx5IFZNIGV2ZW50cyB3ZXJlDQo+
PiBwb3NzaWJsZSBmb3IgUFYgYXMgd2VsbC4gSWYgaXQncyBpbmRlZWQgSFZNLW9ubHksIHRoZW4g
Zm9sbG93aW5nDQo+PiB0aGUgSU9SRVEgc2VydmVyIG1vZGVsIGluIGl0cyBlbnRpcmV0eSB3b3Vs
ZCBvZiBjb3Vyc2UgYmUgZmluZS4NCj4gDQo+IEluIG9uZSBvZiB0aGUgcHJldmlvdXMgdmVyc2lv
biBvZiB0aGUgcGF0Y2hzZXQgdGhlcmUgd2FzIGEgc3VnZ2VzdGlvbg0KPiB0byBpbXBsZW1lbnQg
dGhlIG5ldyB2bV9ldmVudCB0cmFuc3BvcnQgdXNpbmcgSU9SRVEsIGJ1dCBpdCB3YXMgZHJvcHBl
ZA0KPiAuDQo+IA0KPiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwv
eGVuLWRldmVsLzIwMTktMDQvbXNnMDAxNzMuaHRtbA0KDQpBbmQgdmFsaWRseSBzbyAoaW1vKSwg
bm90IHRoZSBsZWFzdCBiZWNhdXNlIG9mIGFsc28gYmVpbmcgSFZNIHNwZWNpZmljLg0KDQo+IEFs
c28sIHVubGVzcyB0aGVyZSBpc24ndCBhIHByb3BlciB3YXkgYWxsb2NhdGUgdGhlIG5lY2Vzc2Fy
eSBwYWdlcywgSQ0KPiB3b3VsZG4ndCBpbnRyb2R1Y2UgYSBIVk0tb25seSBsaW1pdGF0aW9uIGJl
Y2F1c2UsIG90aGVyIHRoYW4gdGhlIEhWTQ0KPiBwYXJhbSB1c2VkIHRvIGtlZXAgdHJhY2sgb2Yg
dGhlIHJpbmcgcGZuLCB0aGUgdm1fZXZlbnQgbWVjaGFuaXNtIGlzDQo+IHF1aXRlIGdlbmVyaWMu
DQoNCkJ5ICJ3b3VsZG4ndCBpbnRyb2R1Y2UiIGRvIHlvdSBtZWFuICJ3b3VsZG4ndCB3YW50IHRv
IGludHJvZHVjZSIgb3IgZG8NCnlvdSBtZWFuIHRvIHNheSB5b3UgaW4gZmFjdCB3b3VsZG4ndCBh
bmQgSSdtIG5vdCBzZWVpbmcgd2h5IHRoYXQgaXM/DQoNCkphbg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
