Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CAB7C33D
	for <lists+xen-devel@lfdr.de>; Wed, 31 Jul 2019 15:22:08 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsoVc-000373-7E; Wed, 31 Jul 2019 13:19:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=mtD0=V4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hsoVa-00036y-3X
 for xen-devel@lists.xenproject.org; Wed, 31 Jul 2019 13:19:10 +0000
X-Inumbo-ID: 9827cf3d-b395-11e9-8980-bc764e045a96
Received: from m4a0039g.houston.softwaregrp.com (unknown [15.124.2.85])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9827cf3d-b395-11e9-8980-bc764e045a96;
 Wed, 31 Jul 2019 13:19:08 +0000 (UTC)
Received: FROM m4a0039g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0039g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 31 Jul 2019 13:18:33 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 31 Jul 2019 13:09:30 +0000
Received: from NAM01-SN1-obe.outbound.protection.outlook.com (15.124.8.13) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 31 Jul 2019 13:09:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QdW3p2eoT0r+Xe7AUqpPqTTgG78Ers6je1Rs19bBy5ZZGMJC0krp51UFrsEbzxoVqRxbmnJLVnYc9zMC1BtKWZjEnAVDDzw7fQmTV94nlzkh0wICNqywfCKBON9jpoeNTxsUyVr8dtaJTcf+dO01MpW8cSn0k2idIbA/KzV+QlBrKJ7cOR78bPLJzBG4CXxbQNnLoQ13ylQNsaXL5ogDTHmo2IW3tAa+nwHejhuI4zwjpd6w1YA0GL9U6oP2ICYJ7l3ymw+EOTgSapAhCdehrkQaTzhwFZffr3lJCzQx8a3fO1AeimuzArQPTvWcpvreMkMwWNVazJa8aSkXHo+LDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tS1kZ1OgFxaC7HISi/36PmaLDIQZ9cXlLPSKTxCTB6A=;
 b=hF2jbdIQuBp1A6DBcSICJUGLuMZC5hQT/mTRd27p3zmLHZ6pdU5BJrfaVAHWZrb8iSM+QfCfdQgpysAQ3Ycf2ONs7x9kXwM7yYEEJpdaYl43QNmzX2rQRU1lJZum1NNXR21y1PCIBydeX9iPgSo1HDXbR9kgoIJ7atYjJMeX3Sjba4vCrPzJiq+182TChv+Rk1xk8HbvowxJulUpwQRvhU/LI0CsC8uTVa6wIxS6eezDQstAlCMHn/LzwYL4aLBtuK/c7aL8gyljGzRcGDZGuq3GGx6FCGsQ3oAlrgbt1hMN8wUN6RdDY4gXhGfEQGXsCk92a+TIJo7Hm3kdJXVmBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2843.namprd18.prod.outlook.com (20.179.51.220) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.13; Wed, 31 Jul 2019 13:09:30 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::69cc:388:194c:e25b%7]) with mapi id 15.20.2115.005; Wed, 31 Jul 2019
 13:09:29 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Petre Ovidiu PIRCALABU <ppircalabu@bitdefender.com>
Thread-Topic: [PATCH v2 07/10] vm_event: Add vm_event_ng interface
Thread-Index: AQHVO/ja8zGHp8jkY0SwPhMewFAvpabOlq4AgABMy4CAAB8oAIABZ1KAgAAMwoCAFE8+AIAABHQA
Date: Wed, 31 Jul 2019 13:09:29 +0000
Message-ID: <9b579c4e-9fbb-e568-4928-dc097971d0c3@suse.com>
References: <cover.1563293545.git.ppircalabu@bitdefender.com>
 <cover.1563293545.git.ppircalabu@bitdefender.com>
 <79a1e2aebc55c20f58cb8c925320de202b17d8f2.1563293545.git.ppircalabu@bitdefender.com>
 <e1c9a42d-7bde-5749-7cf3-cb5e7b4041e1@suse.com>
 <de42faf2929b0ff0d52949d21dea5f2b30336840.camel@bitdefender.com>
 <20603303-440d-3ac4-8f78-861abaa78d70@suse.com>
 <22abf98c86af08adb0444ffa115bc56b9bd552fc.camel@bitdefender.com>
 <58a8a000-7dff-be57-7d75-f39abbd41f69@suse.com>
 <2f0005b7f2ec4a7e35d6a64348becc4e9628d801.camel@bitdefender.com>
In-Reply-To: <2f0005b7f2ec4a7e35d6a64348becc4e9628d801.camel@bitdefender.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6PR07CA0133.eurprd07.prod.outlook.com
 (2603:10a6:6:16::26) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [87.234.252.170]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1720ff14-7773-41d2-920e-08d715b85259
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2843; 
x-ms-traffictypediagnostic: DM6PR18MB2843:
x-microsoft-antispam-prvs: <DM6PR18MB28434D9D7AC407005407FCDCB3DF0@DM6PR18MB2843.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 011579F31F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(39860400002)(396003)(366004)(136003)(346002)(376002)(189003)(199004)(14454004)(7736002)(66446008)(66066001)(99286004)(229853002)(305945005)(81166006)(81156014)(53936002)(102836004)(478600001)(6486002)(54906003)(316002)(8936002)(6506007)(26005)(6436002)(386003)(186003)(52116002)(5660300002)(6512007)(66946007)(66476007)(66556008)(76176011)(64756008)(8676002)(7416002)(25786009)(6916009)(256004)(71190400001)(2616005)(53546011)(14444005)(476003)(2906002)(486006)(446003)(68736007)(86362001)(6246003)(6116002)(31696002)(36756003)(31686004)(80792005)(4326008)(3846002)(11346002)(71200400001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2843;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JMIgDKhgWP5NN+GOnGInkLdUq6GEciKnmJo7pRpUTbuQG1sp5uCW9Ko4EKHb72zEs9po5K4U2fVIyLGHpleUJl0JbC2eIn7ad1+hFCcKuvjvdmzi7J7IAU7gHpC0qLKBXs7J0UhwVkrYLKPGkw/V6gVHYiIPpN/HMxt5R1LNkEaBD7dfMDCzPF+FfUb5eEPL0TK8lork5Vc09HszA6QA16cnkbCGoNfg6pd26nMfV/ws32MyYuZFm4DWRNlg0M3LLgAOeyCmyz2LJ4IYiyVOM3RiHHgSJ9Zmdhp0+5C9beJp0dHUC9fFq8K/LlccPQbaNJLgPyDcjjSXF+k5LrpTwNwWNqjzchzeaEiGSLpmhqNmRn8xUJxGZFbpFc6Hh3G67nq5dIB+89JoL3oIt0R+w0KJoCjihikwIp+6n5Yw7js=
Content-ID: <6A83355D5738F441B6BA9F3ED7764A68@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1720ff14-7773-41d2-920e-08d715b85259
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2019 13:09:29.8200 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2843
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
 IanJackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 JulienGrall <julien.grall@arm.com>, Paul Durrant <Paul.Durrant@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Stefan ISAILA <aisaila@bitdefender.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMzEuMDcuMjAxOSAxNDo1MywgUGV0cmUgT3ZpZGl1IFBJUkNBTEFCVSB3cm90ZToNCj4gT24g
VGh1LCAyMDE5LTA3LTE4IGF0IDE0OjQ0ICswMDAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+IE9u
IDE4LjA3LjIwMTkgMTU6NTksIFBldHJlIE92aWRpdSBQSVJDQUxBQlUgd3JvdGU6DQo+Pj4gQmVm
b3JlIHVzaW5nIHhlbmZvcmVpZ25tZW1vcnlfbWFwX3Jlc291cmNlIEkgaW52ZXN0aWdhdGVkIHNl
dmVyYWwNCj4+PiBkaWZmZXJlbnQgYXBwcm9hY2hlczoNCj4+PiAtIEFsbG9jYXRlIHRoZSBtZW1v
cnkgaW4gaHlwZXJ2aXNvciBhbmQgeGNfbWFwX2ZvcmVpZ25fcGFnZXMNCj4+PiAoZG9lc24ndA0K
Pj4+IHdvcmsgYmVjYXVzZSB5b3UgY2Fubm90ICJmb3JlaWdubWFwIiBwYWdlcyBvZiB5b3VyIG93
biBkb21haW4uDQo+Pj4gLSBBbGxvY2F0ZSB0aGUgbWVtb3J5IGluIGd1ZXN0LCBhbmQgbWFwIHRo
ZSBhbGxvY2F0ZWQgcGFnZXMgaW4gWEVOLg0KPj4+IFRvDQo+Pj4gbXkga25vd2xlZGdlIHRoZXJl
IGlzIG5vIHN1Y2ggQVBJIGluIGxpbnV4IHRvIGRvIHRoaXMgYW5kIHRoZQ0KPj4+IG1vbml0b3IN
Cj4+PiBhcHBsaWNhdGlvbiwgYXMgYW4gdXNlcnNwYWNlIHByb2dyYW0sIGlzIG5vdCBhd2FyZSBv
ZiB0aGUgYWN0dWFsDQo+Pj4gZ2Zucw0KPj4+IGZvciBhbiBhbGxvY2F0ZWQgbWVtb3J5IGFyZWEu
DQo+Pj4NCj4+PiBTbywgYXQgdGhpcyBwb2ludCB0aGUgbW9zdCBwcm9taXNpbmcgc29sdXRpb24g
aXMgYWxsb2NhdGluZyB0aGUNCj4+PiBtZW1vcnkNCj4+PiBpbiBYRU4sIHNoYXJpbmcgaXQgd2l0
aCBJRCB1c2luZyBzaGFyZV94ZW5fcGFnZV93aXRoX2d1ZXN0LCBhbmQNCj4+PiBtYXBwaW5nDQo+
Pj4gaXQgd2l0aCB4ZW5mb3JlaWdubWVtb3J5X21hcF9yZXNvdXJjZSAod2l0aCB0aGUgZmxhZw0K
Pj4+IFhFTk1FTV9yc3JjX2FjcV9jYWxsZXJfb3duZWQgc2V0KQ0KPj4NCj4+IFdoaWNoIGlzIGZp
bmUgLSB0aGF0J3Mgd2h5IFBhdWwgaGFkIGludHJvZHVjZWQgdGhlIGdlbmVyaWMgaW50ZXJmYWNl
Lg0KPj4NCj4+PiBUbyBteSB1bmRlcnN0YW5kaW5nIHRoZSBjbGVhbnVwIHNlcXVlbmNlIGZyb20N
Cj4+PiBnbnR0YWJfdW5wb3B1bGF0ZV9zdGF0dXNfZnJhbWVzIGJhc2ljYWxseSBib2lscyBkb3du
IHRvOg0KPj4+IDEuIGd1ZXN0X3BoeXNtYXBfcmVtb3ZlX3BhZ2UNCj4+PiAyLiBpZiAoIHRlc3Rf
YW5kX2NsZWFyX2JpdChfUEdDX2FsbG9jYXRlZCwgJnBnLT5jb3VudF9pbmZvKSApDQo+Pj4gICAg
ICAgICAgcHV0X3BhZ2UocGcpOw0KPj4+IDMuIGZyZWVfeGVuaGVhcF9wYWdlDQo+Pg0KPj4gWW91
J3JlIG1pc3NpbmcgdGhlIGNydWNpYWwgcGFydCBvZiB1bmRvaW5nIHN0ZXAgMiBpZiB5b3UgZmlu
ZA0KPj4gdGhhdCB0aGVyZSBhcmUgc3RpbGwgcmVmZXJlbmNlcyBsZWZ0IHRvIHRoZSBwYWdlLg0K
Pj4NCj4+IEFuZCB0aGVuLCBiZWNhdXNlIG9mIHlvdXIgdXNlIG9mIHZ6YWxsb2MoKSwgeW91IGNh
bid0IHVzZQ0KPj4gZnJlZV94ZW5oZWFwX3BhZ2VzKCksIGFzIHRoYXQgdGFrZXMgYSAoZGlyZWN0
IG1hcCkgbGluZWFyIGFkZHJlc3MNCj4+IGFzIGlucHV0LiBJdCBoYXMgdG8gYmUgZnJlZV9kb21o
ZWFwX3BhZ2VzKCkgaW4geW91ciBjYXNlLg0KPj4NCj4+PiBNeSBjdXJyZW50IGltcGxlbWVudGF0
aW9uIHVzZXMgdnphbGxvYyBpbnN0ZWFkIG9mDQo+Pj4gYWxsb2NfeGVuaGVhcF9wYWdlcw0KPj4+
IGFuZCB0aGF0J3Mgd2h5IEkgYXNzdW1lZCB2dW5tYXAgYW5kIGZyZWVfZG9taGVhcF9wYWdlcyB3
aWxsIHN1ZmZpY2UNCj4+PiAoSQ0KPj4+IHdvdWxkIGhhdmUgY2FsbGVkIHZmcmVlIGRpcmVjdGx5
LCBidXQgdGhlIHRlbXBvcmFyeSBsaW5rZWQgbGlzdA0KPj4+IHRoYXQgaXMNCj4+PiB1c2VkIHRv
IGhvbGQgdGhlIHBhZ2UgcmVmZXJlbmNlcyBjYXVzZXMgZnJlZV9kb21oZWFwX3BhZ2VzIHRvDQo+
Pj4gY3Jhc2gpDQo+Pj4NCj4+PiBEbyBJIGFsc28gaGF2ZSB0byBjYWxsIGd1ZXN0X3BoeXNtYXBf
cmVtb3ZlX3BhZ2UgYW5kIHB1dF9wYWdlPw0KPj4+IChzdGVwcw0KPj4+IDEuIGFuZCAyLikNCj4+
DQo+PiBndWVzdF9waHlzbWFwX3JlbW92ZV9wYWdlKCkgbmVlZHMgdG8gYmUgY2FsbGVkIGZvciB0
cmFuc2xhdGVkIHBhZ2UtDQo+PiBvd25pbmcgZG9tYWlucyBpZiB0aGUgcGFnZSB3YXMgZXZlciBh
ZGRlZCB0byB0aGVpciBwaHlzbWFwLiBBcyBsb25nDQo+PiBhcyB5b3UgYXZvaWQgYWRkaW5nLCB5
b3UgYWxzbyBkb24ndCBuZWVkIHRvIHJlbW92ZS4gSSBkb24ndCByZWNhbGwNCj4+IHRob3VnaCB3
aGV0aGVyIGEgdHJhbnNsYXRlZCBkb21haW4gY2FuIGFjY2VzcyBhIHJlc291cmNlIHdpdGhvdXQg
aXQNCj4+IGhhdmluZyBhIHJlcHJlc2VudGF0aW9uIGluIGl0cyBHRk4gc3BhY2UuDQo+Pg0KPiBJ
J3ZlIHRyYWNlZCB0aGUgR0ZOIHZhbHVlIGZvciB0aGUgc2hhcmVkIE1GTiBhbmQgaXQncyBpbnZh
bGlkLiBJdCdzIHNldA0KPiB0byBJTlZBTElEX00yUF9FTlRSWSBpbiBzaGFyZV94ZW5fcGFnZV93
aXRoX2d1ZXN0LCBidXQgSSB3YXMgZXhwZWN0aW5nDQo+IGl0IHRvIGJlIHNldCB0byB2YWxpZCB2
YWx1ZSBsYXRlciBvbiAoZS5nLiB4ZW5tZW1fYWRkX3RvX3BoeXNtYXApLg0KPiBBbSBJIG1pc3Np
bmcgc29tZXRoaW5nPw0KDQpCeSAidHJhY2VkIiBkbyB5b3UgbWVhbiAib2JzZXJ2ZWQiIChlLmcu
IGJ5IHdheSBvZiBsb2dnaW5nKSBvciAiZ29uZQ0KdGhyb3VnaCB0aGUgY29kZSB0byB2ZXJpZnkg
aXQgY2FuJ3QgZXZlciBiZWNvbWUgdmFsaWQiPyBJbiB0aGUgbGF0dGVyDQpjYXNlIHlvdSdkIGhh
dmUgcHJvdmVuIHdoYXQgeW91IHdhbnQvbmVlZC4gVGhpbmtpbmcgYWJvdXQgaXQgdGhvdWdoLA0K
c2VlaW5nIGhvdyB4ZW5tZW1fYWRkX3RvX3BoeXNtYXBfb25lKCkgd29ya3MgYW5kIGFzc3VtaW5n
IHlvdSBpbmRlZWQNCmRvbid0IGFkZCB0aGUgcGFnZSBieSBvdGhlciBtZWFucywgaXQgbG9va3Mg
dG8gbWUgYXMgaWYgeW91J3ZlIGRvbmUNCm1vcmUgdGhhbiBpcyBuZWVkZWQsIGFzIEkndmUgc2Fp
ZCBhbHJlYWR5IHRoYXQgeW91IG5lZWQgdG8gcmVtb3ZlIHRoZQ0KcGFnZSBvbmx5IGlmIGl0IGhh
ZCBiZWVuIGFkZGVkLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
