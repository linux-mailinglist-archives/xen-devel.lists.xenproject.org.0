Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 610AC6D03B
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jul 2019 16:48:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ho7ej-0007rJ-Oa; Thu, 18 Jul 2019 14:45:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=e8X9=VP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ho7eh-0007rC-CI
 for xen-devel@lists.xenproject.org; Thu, 18 Jul 2019 14:45:11 +0000
X-Inumbo-ID: 9a0bd429-a96a-11e9-8980-bc764e045a96
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9a0bd429-a96a-11e9-8980-bc764e045a96;
 Thu, 18 Jul 2019 14:45:09 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Thu, 18 Jul 2019 14:44:55 +0000
Received: from M9W0068.microfocus.com (2002:f79:bf::f79:bf) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 18 Jul 2019 14:44:41 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (15.124.72.13) by
 M9W0068.microfocus.com (15.121.0.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 18 Jul 2019 14:44:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SgZiuIz6pZ0jMR1uY1oitO/wV78oFsH2ctGgl437/b8pvbE+dKwRf2MiHKuP5gkHSugfh78lo9vL03rR9+HpceaK80IGzwu2WrkxcfwugBz9EIl/bRyA0JAGiMyOGuj6xnC3mHUSyep/rFmsCv11YCB0VLGlttC5i8pKTZbrZyxXpQjEusLbRNzU6Q4ZkXpkkceH5NMUEE96WbLLrZbZW4JgOGKVekhY7cA7MI5DJzneGCnYEUylM4Rxm1NNO5HjtLBLRz5+WYhHacYsC6Ru6PaVi0TqvXPgD0Vty4MaeBd7IkFrH3fCKX2idz3Z1zPGKHV4elyURRheu2X0fYFIog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6TjpiFamkyYRyzpo0PS+SnS7ZBH/hr9m4nxg4SvTLDc=;
 b=YlaNopYgh46cJ/YJBQDrF+n2vJZv2sEHKxdLqxs78g72tLKT/OmkOsK6mljgcc+bodypNZmz4s5PDVbItgHGjAqDS32lRhkPF4JpdKFDOkJ0gxchfMl8cTIxirreoX84xBJoSYOCnfiwe2/r86Tfz0t4fPFQUaKzuVXaURwtoAWnQyma3bcG0ftBvCXS4nGNJNhvEko2qXBAo3wRNCWtmdjGrBAxGjdzs/piP00mjePL4kGr9XGo9qgcdmpLsbLebnzhHXPWVTdaT7y3ErgMGDGqG5MRTrd38hFdSIqy7YdQAAJHWUQhOrziij6iRYQaTyaSo4PJ8oZ2uMuA/WMoMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2396.namprd18.prod.outlook.com (20.179.71.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.11; Thu, 18 Jul 2019 14:44:39 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 14:44:39 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
Thread-Topic: [PATCH v2 07/10] vm_event: Add vm_event_ng interface
Thread-Index: AQHVO/ja8zGHp8jkY0SwPhMewFAvpabOlq4AgABMy4CAAB8oAIABZ1KAgAAMvYA=
Date: Thu, 18 Jul 2019 14:44:39 +0000
Message-ID: <58a8a000-7dff-be57-7d75-f39abbd41f69@suse.com>
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
 <cover.1563293545.git.ppircalabu@bitdefender.com>
 <79a1e2aebc55c20f58cb8c925320de202b17d8f2.1563293545.git.ppircalabu@bitdefender.com>
 <e1c9a42d-7bde-5749-7cf3-cb5e7b4041e1@suse.com>
 <de42faf2929b0ff0d52949d21dea5f2b30336840.camel@bitdefender.com>
 <20603303-440d-3ac4-8f78-861abaa78d70@suse.com>
 <22abf98c86af08adb0444ffa115bc56b9bd552fc.camel@bitdefender.com>
In-Reply-To: <22abf98c86af08adb0444ffa115bc56b9bd552fc.camel@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR06CA0031.eurprd06.prod.outlook.com (2603:10a6:6:1::44)
 To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 14878027-8a78-44fd-09f2-08d70b8e7670
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2396; 
x-ms-traffictypediagnostic: DM6PR18MB2396:
x-microsoft-antispam-prvs: <DM6PR18MB2396EB79A2C4B0BAF9FB1240B3C80@DM6PR18MB2396.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(136003)(346002)(396003)(39860400002)(376002)(366004)(189003)(199004)(6246003)(4326008)(7736002)(6916009)(80792005)(66476007)(31686004)(478600001)(66066001)(66556008)(5660300002)(81166006)(66946007)(66446008)(305945005)(71190400001)(229853002)(7416002)(71200400001)(8936002)(102836004)(2616005)(14444005)(31696002)(53546011)(3846002)(256004)(8676002)(446003)(11346002)(81156014)(2906002)(476003)(53936002)(186003)(76176011)(99286004)(486006)(6506007)(386003)(68736007)(26005)(86362001)(36756003)(14454004)(25786009)(316002)(6116002)(6512007)(64756008)(52116002)(6436002)(6486002)(54906003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2396;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: eGYMoV98Kz47/fegJ+HAC0gsmtuwHtai1Gh2qIA+YD/qoQDx4ND6LTVuPhAT6odzkKT+yFwAExhg6mtONfpYJ02O2FkYrVj76oGRSgyt9Toj9hVQlaYsnEfZn4WuM40w/CFNRH+Tf1BzF/bs2qhmhchGW3ZIcUI1EgCixJz6ima1RxF622+MrZ4UM41hYzgYR1gzmFPn9hjCA0N5jgOpdLt1OG3oG14bpxha2oQ2cA5mY4512o4jQ/9QKWsSBkveA6ZEoQ11EHknKmxvyipEvrZuE1kn0iwzavh3Fg7+JJ2uQgglwvePy4nYHAY4pGI1j2G4Cx9v3MrF0crxV5ehD8gV89IVWXVNuOm+iKVdFAuIwteq8QL5KqbQ61B7l8s1TDUqLgu5PT8MppDY0a0Hq+a/BUwZsaS41H8Q3VjDPso=
Content-ID: <933690E9CCFF304392DB144585ED7B4B@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 14878027-8a78-44fd-09f2-08d70b8e7670
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 14:44:39.8389 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2396
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 JulienGrall <julien.grall@arm.com>, Paul Durrant <Paul.Durrant@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTguMDcuMjAxOSAxNTo1OSwgUGV0cmUgT3ZpZGl1IFBJUkNBTEFCVSB3cm90ZToNCj4gQmVm
b3JlIHVzaW5nIHhlbmZvcmVpZ25tZW1vcnlfbWFwX3Jlc291cmNlIEkgaW52ZXN0aWdhdGVkIHNl
dmVyYWwNCj4gZGlmZmVyZW50IGFwcHJvYWNoZXM6DQo+IC0gQWxsb2NhdGUgdGhlIG1lbW9yeSBp
biBoeXBlcnZpc29yIGFuZCB4Y19tYXBfZm9yZWlnbl9wYWdlcyAoZG9lc24ndA0KPiB3b3JrIGJl
Y2F1c2UgeW91IGNhbm5vdCAiZm9yZWlnbm1hcCIgcGFnZXMgb2YgeW91ciBvd24gZG9tYWluLg0K
PiAtIEFsbG9jYXRlIHRoZSBtZW1vcnkgaW4gZ3Vlc3QsIGFuZCBtYXAgdGhlIGFsbG9jYXRlZCBw
YWdlcyBpbiBYRU4uIFRvDQo+IG15IGtub3dsZWRnZSB0aGVyZSBpcyBubyBzdWNoIEFQSSBpbiBs
aW51eCB0byBkbyB0aGlzIGFuZCB0aGUgbW9uaXRvcg0KPiBhcHBsaWNhdGlvbiwgYXMgYW4gdXNl
cnNwYWNlIHByb2dyYW0sIGlzIG5vdCBhd2FyZSBvZiB0aGUgYWN0dWFsIGdmbnMNCj4gZm9yIGFu
IGFsbG9jYXRlZCBtZW1vcnkgYXJlYS4NCj4gDQo+IFNvLCBhdCB0aGlzIHBvaW50IHRoZSBtb3N0
IHByb21pc2luZyBzb2x1dGlvbiBpcyBhbGxvY2F0aW5nIHRoZSBtZW1vcnkNCj4gaW4gWEVOLCBz
aGFyaW5nIGl0IHdpdGggSUQgdXNpbmcgc2hhcmVfeGVuX3BhZ2Vfd2l0aF9ndWVzdCwgYW5kIG1h
cHBpbmcNCj4gaXQgd2l0aCB4ZW5mb3JlaWdubWVtb3J5X21hcF9yZXNvdXJjZSAod2l0aCB0aGUg
ZmxhZw0KPiBYRU5NRU1fcnNyY19hY3FfY2FsbGVyX293bmVkIHNldCkNCg0KV2hpY2ggaXMgZmlu
ZSAtIHRoYXQncyB3aHkgUGF1bCBoYWQgaW50cm9kdWNlZCB0aGUgZ2VuZXJpYyBpbnRlcmZhY2Uu
DQoNCj4gVG8gbXkgdW5kZXJzdGFuZGluZyB0aGUgY2xlYW51cCBzZXF1ZW5jZSBmcm9tDQo+IGdu
dHRhYl91bnBvcHVsYXRlX3N0YXR1c19mcmFtZXMgYmFzaWNhbGx5IGJvaWxzIGRvd24gdG86DQo+
IDEuIGd1ZXN0X3BoeXNtYXBfcmVtb3ZlX3BhZ2UNCj4gMi4gaWYgKCB0ZXN0X2FuZF9jbGVhcl9i
aXQoX1BHQ19hbGxvY2F0ZWQsICZwZy0+Y291bnRfaW5mbykgKQ0KPiAgICAgICAgIHB1dF9wYWdl
KHBnKTsNCj4gMy4gZnJlZV94ZW5oZWFwX3BhZ2UNCg0KWW91J3JlIG1pc3NpbmcgdGhlIGNydWNp
YWwgcGFydCBvZiB1bmRvaW5nIHN0ZXAgMiBpZiB5b3UgZmluZA0KdGhhdCB0aGVyZSBhcmUgc3Rp
bGwgcmVmZXJlbmNlcyBsZWZ0IHRvIHRoZSBwYWdlLg0KDQpBbmQgdGhlbiwgYmVjYXVzZSBvZiB5
b3VyIHVzZSBvZiB2emFsbG9jKCksIHlvdSBjYW4ndCB1c2UNCmZyZWVfeGVuaGVhcF9wYWdlcygp
LCBhcyB0aGF0IHRha2VzIGEgKGRpcmVjdCBtYXApIGxpbmVhciBhZGRyZXNzDQphcyBpbnB1dC4g
SXQgaGFzIHRvIGJlIGZyZWVfZG9taGVhcF9wYWdlcygpIGluIHlvdXIgY2FzZS4NCg0KPiBNeSBj
dXJyZW50IGltcGxlbWVudGF0aW9uIHVzZXMgdnphbGxvYyBpbnN0ZWFkIG9mIGFsbG9jX3hlbmhl
YXBfcGFnZXMNCj4gYW5kIHRoYXQncyB3aHkgSSBhc3N1bWVkIHZ1bm1hcCBhbmQgZnJlZV9kb21o
ZWFwX3BhZ2VzIHdpbGwgc3VmZmljZSAoSQ0KPiB3b3VsZCBoYXZlIGNhbGxlZCB2ZnJlZSBkaXJl
Y3RseSwgYnV0IHRoZSB0ZW1wb3JhcnkgbGlua2VkIGxpc3QgdGhhdCBpcw0KPiB1c2VkIHRvIGhv
bGQgdGhlIHBhZ2UgcmVmZXJlbmNlcyBjYXVzZXMgZnJlZV9kb21oZWFwX3BhZ2VzIHRvIGNyYXNo
KQ0KPiANCj4gRG8gSSBhbHNvIGhhdmUgdG8gY2FsbCBndWVzdF9waHlzbWFwX3JlbW92ZV9wYWdl
IGFuZCBwdXRfcGFnZT8gKHN0ZXBzDQo+IDEuIGFuZCAyLikNCg0KZ3Vlc3RfcGh5c21hcF9yZW1v
dmVfcGFnZSgpIG5lZWRzIHRvIGJlIGNhbGxlZCBmb3IgdHJhbnNsYXRlZCBwYWdlLQ0Kb3duaW5n
IGRvbWFpbnMgaWYgdGhlIHBhZ2Ugd2FzIGV2ZXIgYWRkZWQgdG8gdGhlaXIgcGh5c21hcC4gQXMg
bG9uZw0KYXMgeW91IGF2b2lkIGFkZGluZywgeW91IGFsc28gZG9uJ3QgbmVlZCB0byByZW1vdmUu
IEkgZG9uJ3QgcmVjYWxsDQp0aG91Z2ggd2hldGhlciBhIHRyYW5zbGF0ZWQgZG9tYWluIGNhbiBh
Y2Nlc3MgYSByZXNvdXJjZSB3aXRob3V0IGl0DQpoYXZpbmcgYSByZXByZXNlbnRhdGlvbiBpbiBp
dHMgR0ZOIHNwYWNlLg0KDQpZb3UgZGVmaW5pdGVseSBuZWVkIHRvIGRvIHN0ZXAgMiAod2hpY2gg
aXMgdG8gdW5kbyB0aGUgcmVzcGVjdGl2ZQ0KcGFydCBvZiBzaGFyZV94ZW5fcGFnZV93aXRoX2d1
ZXN0KCksIGFuZCB5b3UgX2Fsc29fIG5lZWQgdG8gY2xlYXINCnRoZSBwYWdlIG93bmVyICh1bmRv
aW5nIHRoZSBvdGhlciBwYXJ0IG9mIHdoYXQgdGhhdCBmdW5jdGlvbiBoYXMNCmRvbmUpLiBBbmQg
dGhlbiwgYXMgc2FpZCBhYm92ZSwgeW91IG5lZWQgdG8gY2hlY2sgdGhhdCB0aGUgcGFnZQ0KaGFz
IG5vIHJlZmVyZW5jZXMgbGVmdCBvbiBpdCwgYW5kIGNvcnJlY3RseSBkZWFsIHdpdGggdGhlIGNh
c2Ugd2hlbg0KaXQgc3RpbGwgaGFzIHNvbWUuDQoNCk9uIHRoZSB3aG9sZSBnbnR0YWJfdW5wb3B1
bGF0ZV9zdGF0dXNfZnJhbWVzKCkgaXMgdmVyeSB1bmZvcnR1bmF0ZQ0KdG8gaGF2ZSB0aGUgd2F5
IGl0IGlzLCBpbmNsdWRpbmcgdGhlIHZhcmlvdXMgZG9tYWluX2NyYXNoKCktZXMuIEl0DQp3YXMg
bWVyZWx5IHRoZSBvbmx5IHdheSB3ZSBjb3VsZCBzZWUgd2hlbiBkZWFsaW5nIHdpdGggWFNBLTI1
NS4gSQ0Kd291bGQgc3Ryb25nbHkgcmVjb21tZW5kIGFnYWluc3QgbmV3IGNvZGUgdHJ5aW5nIHRv
IGdvIHRoaXMgc2FtZQ0Kcm91dGUsIHVubGVzcyB3ZSBpbnRyb2R1Y2UgYSBnZW5lcmljIGFuZCBj
bGVhbi9zYWZlIGZ1bmN0aW9uDQppbnZlcnRpbmcgc2hhcmVfeGVuX3BhZ2Vfd2l0aF9ndWVzdCgp
ICh3aGljaCBJJ3ZlIHRyaWVkIGluIHRoZSBwYXN0DQphbmQgZmFpbGVkKS4NCg0KSmFuDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
