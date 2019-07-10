Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A759063F80
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jul 2019 05:07:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hl2vI-0003lJ-Gv; Wed, 10 Jul 2019 03:05:36 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=iTs9=VH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hl2vH-0003lE-8Z
 for xen-devel@lists.xenproject.org; Wed, 10 Jul 2019 03:05:35 +0000
X-Inumbo-ID: 8bc3ad5e-a2bf-11e9-8980-bc764e045a96
Received: from m4a0041g.houston.softwaregrp.com (unknown [15.124.2.87])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8bc3ad5e-a2bf-11e9-8980-bc764e045a96;
 Wed, 10 Jul 2019 03:05:34 +0000 (UTC)
Received: FROM m4a0041g.houston.softwaregrp.com (15.120.17.146) BY
 m4a0041g.houston.softwaregrp.com WITH ESMTP; 
 Wed, 10 Jul 2019 03:05:13 +0000
Received: from M4W0335.microfocus.com (2002:f78:1193::f78:1193) by
 M4W0334.microfocus.com (2002:f78:1192::f78:1192) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Wed, 10 Jul 2019 03:04:39 +0000
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (15.124.8.10) by
 M4W0335.microfocus.com (15.120.17.147) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Wed, 10 Jul 2019 03:04:38 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com (10.255.174.218) by
 DM6PR18MB2810.namprd18.prod.outlook.com (20.179.50.156) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2052.19; Wed, 10 Jul 2019 03:04:37 +0000
Received: from DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7]) by DM6PR18MB3401.namprd18.prod.outlook.com
 ([fe80::1fe:35f6:faf3:78c7%7]) with mapi id 15.20.2052.020; Wed, 10 Jul 2019
 03:04:37 +0000
From: Jan Beulich <JBeulich@suse.com>
To: Norbert Manthey <nmanthey@amazon.de>
Thread-Topic: [PATCH L1TF MDS GT v1 2/3] common/grant_table: harden bound
 accesses
Thread-Index: AQHVNYznzzKh5NhX7k+L3inK3UdaXabDLU6A
Date: Wed, 10 Jul 2019 03:04:37 +0000
Message-ID: <627756a7-7a20-b1ae-31f2-bd7affe0e14d@suse.com>
References: <1558424746-24059-1-git-send-email-nmanthey@amazon.de>
 <1558424746-24059-3-git-send-email-nmanthey@amazon.de>
 <5CE6AB600200007800231BF1@prv1-mh.provo.novell.com>
 <a7c5bda7-0759-5b15-1174-8d9e95ef06c5@amazon.de>
 <5CE7D1410200007800231F86@prv1-mh.provo.novell.com>
 <d1205382-17ff-40ac-d66d-2e6edf59364a@amazon.de>
In-Reply-To: <d1205382-17ff-40ac-d66d-2e6edf59364a@amazon.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: CH2PR05CA0037.namprd05.prod.outlook.com
 (2603:10b6:610:38::14) To DM6PR18MB3401.namprd18.prod.outlook.com
 (2603:10b6:5:1cc::26)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.80.71.101]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1366318-bcb3-4fbc-aa7e-08d704e357a2
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:DM6PR18MB2810; 
x-ms-traffictypediagnostic: DM6PR18MB2810:
x-microsoft-antispam-prvs: <DM6PR18MB2810C385A5DC1F333476D1D9B3F00@DM6PR18MB2810.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0094E3478A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(346002)(39860400002)(376002)(396003)(366004)(136003)(189003)(199004)(99286004)(14454004)(66446008)(25786009)(476003)(6916009)(31686004)(11346002)(6486002)(81166006)(66066001)(81156014)(36756003)(446003)(68736007)(8676002)(6512007)(7416002)(71190400001)(2616005)(229853002)(71200400001)(54906003)(478600001)(305945005)(7736002)(8936002)(486006)(2906002)(256004)(6116002)(386003)(6246003)(53546011)(102836004)(6506007)(186003)(316002)(52116002)(14444005)(76176011)(26005)(80792005)(53936002)(3846002)(66476007)(66556008)(86362001)(64756008)(4326008)(5660300002)(66946007)(6436002)(31696002)(32563001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR18MB2810;
 H:DM6PR18MB3401.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lNEeMpl6ZGYQRLAqBIzIjewNb2jNe8H11Us3sEAEW3fGjGbv/SkmcoP4/2PPvRSYLzAB1wqv1wP86GOqOjaiJpjEpd+iZZLpcwlWHMl3AfpImXgpppT/usuU/NQ5+ed8rM6tbpvezOAX8lwswmtZM7CGGXWaUICgztaTjlZN1WPV75JDbWyaFg/0E95Kxkje4QSHnwL/u9yW4Y/XcYLD1udNKm4YoOOrRBO/y8xzKRrztvHE9fKfCamlAg3xJfGa0Q7CkkDa28JQ7/dPi+7acE96Hnyzmel/W6Gtt44C1dbvzabGKHICgelf6YzzVf8raVhV7tuomf4q7Fv3Wl/F9zmf4SDqh8d+HdC0miRGfeN1xsDpp5vx1CKpSTE4o5y990s+2TQy7IhyJ6gJ33xEchatSMOUUzJrfzwmUtM1tQc=
Content-ID: <BE803FC5A1EAE94D9CCDBC05999D5001@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: a1366318-bcb3-4fbc-aa7e-08d704e357a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2019 03:04:37.1959 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JBeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR18MB2810
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH L1TF MDS GT v1 2/3] common/grant_table:
 harden bound accesses
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
Cc: Juergen Gross <JGross@suse.com>, Tim Deegan <tim@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 KonradRzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 IanJackson <Ian.Jackson@eu.citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Martin Pohlack <mpohlack@amazon.de>, "wipawel@amazon.de" <wipawel@amazon.de>,
 Julien Grall <julien.grall@arm.com>, David Woodhouse <dwmw@amazon.co.uk>,
 "Martin Mazein\(amazein\)" <amazein@amazon.de>,
 xen-devel <xen-devel@lists.xenproject.org>, Bjoern Doebel <doebel@amazon.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDcuMjAxOSAxNDo1OCwgTm9yYmVydCBNYW50aGV5IHdyb3RlOg0KPiBPbiA1LzI0LzE5
IDEzOjEwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+IE9uIDI0LjA1LjE5IGF0IDExOjU0LCA8
bm1hbnRoZXlAYW1hem9uLmRlPiB3cm90ZToNCj4+PiBPbiA1LzIzLzE5IDE2OjE3LCBKYW4gQmV1
bGljaCB3cm90ZToNCj4+Pj4+Pj4gT24gMjEuMDUuMTkgYXQgMDk6NDUsIDxubWFudGhleUBhbWF6
b24uZGU+IHdyb3RlOg0KPj4+Pj4gLS0tIGEveGVuL2NvbW1vbi9ncmFudF90YWJsZS5jDQo+Pj4+
PiArKysgYi94ZW4vY29tbW9uL2dyYW50X3RhYmxlLmMNCj4+Pj4+IEBAIC05ODgsOSArOTg4LDEw
IEBAIG1hcF9ncmFudF9yZWYoDQo+Pj4+PiAgICAgICAgICAgUElOX0ZBSUwodW5sb2NrX291dCwg
R05UU1RfYmFkX2dudHJlZiwgIkJhZCByZWYgJSN4IGZvciBkJWRcbiIsDQo+Pj4+PiAgICAgICAg
ICAgICAgICAgICAgb3AtPnJlZiwgcmd0LT5kb21haW4tPmRvbWFpbl9pZCk7DQo+Pj4+PiAgIA0K
Pj4+Pj4gLSAgICBhY3QgPSBhY3RpdmVfZW50cnlfYWNxdWlyZShyZ3QsIG9wLT5yZWYpOw0KPj4+
Pj4gKyAgICAvKiBUaGlzIGNhbGwgYWxzbyBlbnN1cmVzIHRoZSBhYm92ZSBjaGVjayBjYW5ub3Qg
YmUgcGFzc2VkIHNwZWN1bGF0aXZlbHkgKi8NCj4+Pj4+ICAgICAgIHNoYWggPSBzaGFyZWRfZW50
cnlfaGVhZGVyKHJndCwgb3AtPnJlZik7DQo+Pj4+PiAgICAgICBzdGF0dXMgPSByZ3QtPmd0X3Zl
cnNpb24gPT0gMSA/ICZzaGFoLT5mbGFncyA6ICZzdGF0dXNfZW50cnkocmd0LCBvcC0+cmVmKTsN
Cj4+Pj4+ICsgICAgYWN0ID0gYWN0aXZlX2VudHJ5X2FjcXVpcmUocmd0LCBvcC0+cmVmKTsNCj4+
Pj4gSSBrbm93IHdlJ3ZlIGJlZW4gdGhlcmUgYmVmb3JlLCBidXQgd2hhdCBndWFyYW50ZWVzIHRo
YXQgdGhlDQo+Pj4+IGNvbXBpbGVyIHdvbid0IHJlbG9hZCBvcC0+cmVmIGZyb20gbWVtb3J5IGZv
ciBlaXRoZXIgb2YgdGhlDQo+Pj4+IGxhdHRlciB0d28gYWNjZXNzZXM/IEluIGZhY3QgYWZhaWN0
IGl0IGFsd2F5cyB3aWxsLCBkdWUgdG8gdGhlDQo+Pj4+IG1lbW9yeSBjbG9iYmVyIGluIGFsdGVy
bmF0aXZlKCkuDQo+Pj4gVGhlIGNvbXBpbGVyIGNhbiByZWxvYWQgb3AtPnJlZiBmcm9tIG1lbW9y
eSwgdGhhdCBpcyBmaW5lIGhlcmUsIGFzIHRoZQ0KPj4+IGJvdW5kIGNoZWNrIGhhcHBlbnMgYWJv
dmUsIGFuZCB0aGUgc2hhcmVkX2VudHJ5IGNhbGwgY29tZXMgd2l0aCBhbg0KPj4+IGxmZW5jZSgp
IGJ5IG5vdywgc28gdGhhdCB3ZSB3aWxsIG5vdCBjb250aW51ZSBleGVjdXRpbmcgc3BlY3VsYXRp
dmVseQ0KPj4+IHdpdGggb3AtPnJlZiBiZWluZyBvdXQtb2YtYm91bmRzLCBpbmRlcGVuZGVudGx5
IG9mIHdoZXRoZXIgaXQncyBmcm9tDQo+Pj4gbWVtb3J5IG9yIHJlZ2lzdGVycy4NCj4+IEkgZG9u
J3QgYnV5IHRoaXMgYXJndW1lbnRhdGlvbjogSW4gcGFydGljdWxhciBpZiB0aGUgY2FjaGUgbGlu
ZSBnb3QNCj4+IGZsdXNoZWQgZm9yIHdoYXRldmVyIHJlYXNvbiwgdGhlIGxvYWQgbWF5IHRha2Ug
YWxtb3N0IGFyYml0cmFyaWx5DQo+PiBsb25nLCBvcGVuaW5nIHVwIGEgbGFyZ2Ugc3BlY3VsYXRp
b24gd2luZG93IGFnYWluIHVzaW5nIHRoZQ0KPj4gZGVzdGluYXRpb24gcmVnaXN0ZXIgb2YgdGhl
IGxvYWQgKHdoYXRldmVyIC0gbm90IGJvdW5kcyBjaGVja2VkIC0NCj4+IHZhbHVlIHRoYXQgZW5k
cyB1cCBob2xkaW5nKS4NCj4gSSBhZ3JlZSwgdGhlIGdpdmVuIHByb3RlY3Rpb24gZG9lcyBub3Qg
Zm9yY2UgdGhlIENQVSB0byBwaWNrIHVwIHRoZQ0KPiBmaXhlZCB2YWx1ZS4gQXMgeW91IGFscmVh
ZHkgbm90aWNlZCwgdGhlIHByZXNlbnRlZCBmaXggbWlnaHQgbm90IHdvcmsgaW4NCj4gYWxsIGNh
c2VzLCBidXQgaXMgYW1vbmcgdGhlIHN1aXRhYmxlIHNvbHV0aW9ucyB3ZSBoYXZlIHRvZGF5IHRv
IHByZXZlbnQNCj4gc2ltcGxlIHVzZXIgY29udHJvbGxlZCBvdXQtb2YtYm91bmQgYWNjZXNzZXMg
ZHVyaW5nIHNwZWN1bGF0aW9uLiBSZWx5aW5nDQo+IG9uIHRoZSBzdGFsZSB2YWx1ZSBvZiB0aGUg
cmVnaXN0ZXIgdGhhdCBtaWdodCBiZSB1c2VkIGR1cmluZyBzcGVjdWxhdGlvbg0KPiBtYWtlcyBh
IHBvdGVudGlhbCBvdXQtb2YtYm91bmQgYWNjZXNzIG11Y2ggbW9yZSBkaWZmaWN1bHQuIEhlbmNl
LCB0aGUNCj4gcHJvcG9zZWQgc29sdXRpb24gbG9va3MgZ29vZCBlbm91Z2ggdG8gbWUuDQoNCkJ1
dCB1c2luZyBhIGxvY2FsIHZhcmlhYmxlIGZ1cnRoZXIgcmVkdWNlcyB0aGUgcmlzayBhZmFpY3Q6
IEVpdGhlcg0KdGhlIGNvbXBpbGVyIHB1dHMgaXQgaW50byBhIHJlZ2lzdGVyLCBpbiB3aGljaCBj
YXNlIHdlJ3JlIGVudGlyZWx5DQpmaW5lLiBPciBpdCBwdXRzIGl0IG9uIHRoZSBzdGFjaywgd2hp
Y2ggSSBhc3N1bWUgaXMgbW9yZSBsaWtlbHkgdG8NCnN0YXkgaW4gY2FjaGUgdGhhbiBhIHJlZmVy
ZW5jZSB0byBzb21lIG90aGVyIGRhdGEgc3RydWN0dXJlIChpaXJjDQphbHNvIG9uIHRoZSBzdGFj
aywgYnV0IG5vdCBpbiB0aGUgY3VycmVudCBmcmFtZSkuDQoNCj4+Pj4+IEBAIC0zODYzLDYgKzM4
ODMsOSBAQCBzdGF0aWMgaW50IGdudHRhYl9nZXRfc3RhdHVzX2ZyYW1lX21mbihzdHJ1Y3QgZG9t
YWluICpkLA0KPj4+Pj4gICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4+Pj4+ICAgICAg
IH0NCj4+Pj4+ICAgDQo+Pj4+PiArICAgIC8qIE1ha2Ugc3VyZSBpZHggaXMgYm91bmRlZCB3cnQg
bnJfc3RhdHVzX2ZyYW1lcyAqLw0KPj4+Pj4gKyAgICBibG9ja19zcGVjdWxhdGlvbigpOw0KPj4+
Pj4gKw0KPj4+Pj4gICAgICAgKm1mbiA9IF9tZm4odmlydF90b19tZm4oZ3QtPnN0YXR1c1tpZHhd
KSk7DQo+Pj4+PiAgICAgICByZXR1cm4gMDsNCj4+Pj4+ICAgfQ0KPj4+PiBXaHkgZG9uJ3QgeW91
IHVzZSBhcnJheV9pbmRleF9ub3NwZWMoKSBoZXJlPyBBbmQgaG93IGNvbWUNCj4+PiBUaGVyZSBp
cyBubyBzcGVjaWZpYyByZWFzb24uIEkgd2lsbCBzd2FwLg0KPj4+PiBzcGVjdWxhdGlvbiBpbnRv
IHEoKSBpcyBmaW5lIGEgZmV3IGxpbmVzIGFib3ZlPw0KPj4+IEkgZG8gbm90IHNlZSBhIHJlYXNv
biB3aHkgaXQgd291bGQgYmUgYmFkIHRvIGVudGVyIHRoYXQgZnVuY3Rpb24NCj4+PiBzcGVjdWxh
dGl2ZWx5LiBUaGVyZSBhcmUgbm8gYWNjZXNzZXMgdGhhdCB3b3VsZCBoYXZlIHRvIGJlIHByb3Rl
Y3RlZCBieQ0KPj4+IGV4dHJhIGNoZWNrcywgYWZhaWN0LiBPdGhlcndpc2UsIHRoYXQgZnVuY3Rp
b24gc2hvdWxkIGJlIHByb3RlY3RlZCBieQ0KPj4+IGl0cyBvd24uDQo+PiBXaGljaCBpbiBmYWN0
IGhhcHBlbnMsIGJ1dCBvbmx5IGluIHBhdGNoIDMuIFRoaXMgbWF5IGJlIHdvcnRoIHNheWluZw0K
Pj4gZXhwbGljaXRseSBoZXJlLg0KPiANCj4gRG8geW91IHdhbnQgbWUgdG8gZXhwbGljaXRseSBt
ZW50aW9uIHRoaXMgaW4gdGhlIGNvbW1pdCBtZXNzYWdlLCBvciBhZGQNCj4gYSBjb21tZW50IGhl
cmUsIHdoaWNoIEkgaGF2ZSB0byBkcm9wIGluIHBhdGNoIDMgYWdhaW4/IEZvciBub3csIEknZCBq
dXN0DQo+IGxlYXZlIGl0IGFzIGlzLCBhcyB0aGUgdmVyc2lvbiBiYXNlZCBmaXhlcyBhcmUgaGFu
ZGxlZCBpbiB0aGUgb3RoZXIgY29tbWl0Lg0KDQpBIGNvbW1pdCBtZXNzYWdlIHJlbWFyayB3b3Vs
ZCBib3RoIGhlbHAgdW5kZXJzdGFuZCB0aGluZ3Mgbm93IGFuZA0KaW4gdGhlIGZ1dHVyZSwgYW5k
IGF0IHRoZSBzYW1lIHRpbWUgYXZvaWQgbWUgb3Igc29tZW9uZSBlbHNlIHJlLQ0KcmFpc2luZyB0
aGUgcXVlc3Rpb24gbmV4dCB0aW1lIHJvdW5kLCBub3QgdGhlIGxlYXN0IGJlY2F1c2Ugb2YgdGhl
DQpub3RpY2FibGUgZ2FwcyBiZXR3ZWVuIHZlcnNpb25zLg0KDQpKYW4NCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
