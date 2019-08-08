Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91119865B9
	for <lists+xen-devel@lfdr.de>; Thu,  8 Aug 2019 17:28:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvkIg-0002it-Mt; Thu, 08 Aug 2019 15:25:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=UoSe=WE=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hvkIf-0002in-3p
 for xen-devel@lists.xenproject.org; Thu, 08 Aug 2019 15:25:57 +0000
X-Inumbo-ID: c3cb8226-b9f0-11e9-a73e-4f79d3f863b9
Received: from m9a0001g.houston.softwaregrp.com (unknown [15.124.64.66])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c3cb8226-b9f0-11e9-a73e-4f79d3f863b9;
 Thu, 08 Aug 2019 15:25:54 +0000 (UTC)
Received: FROM m9a0001g.houston.softwaregrp.com (15.121.0.190) BY
 m9a0001g.houston.softwaregrp.com WITH ESMTP; 
 Thu,  8 Aug 2019 15:25:27 +0000
Received: from M9W0067.microfocus.com (2002:f79:be::f79:be) by
 M9W0067.microfocus.com (2002:f79:be::f79:be) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10; Thu, 8 Aug 2019 15:25:21 +0000
Received: from NAM01-BY2-obe.outbound.protection.outlook.com (15.124.72.12) by
 M9W0067.microfocus.com (15.121.0.190) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1591.10 via Frontend Transport; Thu, 8 Aug 2019 15:25:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G1+V45H1Et/zwWDTrSV2giE7tTD0lhOvC+q6p0NHCFUm3ET/LqaLMmLJ0v2yZhV2TnOf+FJfzbPdURtlg4kpC7Qd+FS3z9ddRecttKM3V6VnBWd7idlFokqnMcjg8cueGdcpFnlPchDLiTMQhp5+hrj8SaYzhIu1xy6KU6nGf+0yNLvYOOBs4opahZ71neCwpFtoRs+casq3YwuS/wsm1D2WvCpnd7VEl5NwYG8Oxhv7n8o/dZOIvHgXo+gDYoK4tSRkYKNMm86wtocQEqOmaqZnSl6Y5OXmfYf4jonSV7cA/eBmCucsQV96KSMtn0Er7kDG4WKmj8h2+itcBj/fzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wz2K3lH0HPQwJ1kv1V0/hSELkRQWtlCQcXHdHXT5d0I=;
 b=b+DZL0tmpKntQ/8oxpdzzCGYeqinSyZsHWHcLOuaPe7KVV9Eyu9togIhooM+dCv54mg4KScNtFYrB0Spw8vhpyR+PJv2tb4QT9y2HhQOCNduAAkY91cyxZDPJr+Bg63q7jgCZhO1xPRlSK4ufGiflD04EHsCgyaFpGmsqZFf3drfhHjIVqckTdGjvEuPmumdaquRjO5xnVa3nThebmsH8egKCrTZzjTm+wztZRyvGFml3RCIFYh0E7rLU0EvPQA7+KePCIVFi1j/PWjY8kOMVSfvxy3XgXNDVMkf7zp3lYBEBH+EY49yeFGT7RzSgBx3QGQrPiO3ZSliny3QSaivbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=suse.com;dmarc=pass action=none header.from=suse.com;dkim=pass
 header.d=suse.com;arc=none
Received: from MN2PR18MB3405.namprd18.prod.outlook.com (10.255.238.214) by
 MN2PR18MB2413.namprd18.prod.outlook.com (20.179.83.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.14; Thu, 8 Aug 2019 15:25:19 +0000
Received: from MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081]) by MN2PR18MB3405.namprd18.prod.outlook.com
 ([fe80::a543:ed3c:6c3:2081%7]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 15:25:19 +0000
From: Jan Beulich <JBeulich@suse.com>
To: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
 <marmarek@invisiblethingslab.com>
Thread-Topic: [PATCH] EFI: add efi=mapbs option and parse efi= early
Thread-Index: AQHVTYDiJDDJv46naU6f+B83HbCEaabxCy2A///vXyCAAGVmgA==
Date: Thu, 8 Aug 2019 15:25:19 +0000
Message-ID: <4d5cdd7d-c73f-88f6-0680-97a67506f095@suse.com>
References: <20190808003158.5256-1-marmarek@invisiblethingslab.com>
 <fc039376-dfc6-b281-c00d-3d1d263744c6@suse.com>
 <20190808092154.GG3257@mail-itl>
In-Reply-To: <20190808092154.GG3257@mail-itl>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR0102CA0066.eurprd01.prod.exchangelabs.com
 (2603:10a6:208::43) To MN2PR18MB3405.namprd18.prod.outlook.com
 (2603:10b6:208:16c::22)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=JBeulich@suse.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [37.24.206.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 81b07c01-1e10-4f4d-51dc-08d71c149f59
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:MN2PR18MB2413; 
x-ms-traffictypediagnostic: MN2PR18MB2413:
x-microsoft-antispam-prvs: <MN2PR18MB241388BBE9BFD6E05736A58FB3D70@MN2PR18MB2413.namprd18.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(4636009)(366004)(189003)(199004)(52314003)(66946007)(66574012)(66476007)(31696002)(3846002)(64756008)(66556008)(66446008)(2906002)(256004)(229853002)(6116002)(5660300002)(80792005)(86362001)(99286004)(66066001)(36756003)(54906003)(71200400001)(305945005)(52116002)(498600001)(6436002)(6916009)(6512007)(186003)(53936002)(71190400001)(76176011)(26005)(6506007)(14454004)(386003)(102836004)(446003)(53546011)(11346002)(2616005)(476003)(31686004)(486006)(6486002)(6246003)(7736002)(8936002)(7416002)(8676002)(4326008)(25786009)(81166006)(81156014);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR18MB2413;
 H:MN2PR18MB3405.namprd18.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: suse.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: iDfcLg/hNKvXBuy1nxiARdZDi96uubedU/a9hXPVcCtwQZkMYU1SmtZw3lYyT66IlqGtf/8dQ76kDaIJSVJuDAlqNW9Qhn8ifhU454/DugN2tMotINqKak3NdUgkb75srTBHpiCRflSyLBZrdQFr8jDvcI3/9DKSTb666N9TLKGEDpLoUFCZkPJoHEUrS7/VoWpZwvAnujtMyY+a52jwIifvhNb/Ib8GRAfP1Fc9gPlefX3uH/mJD0ZYzCNZWYO0ja2JoED/XnvtPCO1K0TY5Dta8MUPaDJvJwS59NB+KwwOmBNAEEMvBIdrn+0Q94VefnC7I8Wmqx5WQf84tTBdaeYA9tyuIe8UfFXNQH/dh4UKEGUWWz+pLO2WJuKpSL2PlHhOV2Af8rS4Q8NeNkl5WlyAvD2nItfFah8xijImrQw=
Content-ID: <CFF537C410F7D44BB1993136B840C12A@namprd18.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 81b07c01-1e10-4f4d-51dc-08d71c149f59
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 15:25:19.6208 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 856b813c-16e5-49a5-85ec-6f081e13b527
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wxOeRUainl/6YeSe6wr4l0h6Wvcui546wH2h2rIHtqsq8lSSvs81FlakigV5kRwXDYe1bqSxzhY2vRd/KhVcqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR18MB2413
X-OriginatorOrg: suse.com
Subject: Re: [Xen-devel] [PATCH] EFI: add efi=mapbs option and parse efi=
 early
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
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMDguMDguMjAxOSAxMToyMSwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpICB3cm90ZToN
Cj4gT24gVGh1LCBBdWcgMDgsIDIwMTkgYXQgMDg6MjE6NTRBTSArMDAwMCwgSmFuIEJldWxpY2gg
d3JvdGU6DQo+PiBPbiAwOC4wOC4yMDE5IDAyOjMxLCBNYXJlayBNYXJjenlrb3dza2ktR8OzcmVj
a2kgIHdyb3RlOg0KPj4+IFdoZW4gYm9vdGluZyBYZW4gdmlhIHhlbi5lZmksIHRoZXJlIGlzIC9t
YXBicyBvcHRpb24gdG8gd29ya2Fyb3VuZA0KPj4+IGNlcnRhaW4gcGxhdGZvcm0gaXNzdWVzIChh
ZGRlZCBpbiBmMzY4ODZiZGY0ICJFRkkvZWFybHk6IGFkZCAvbWFwYnMgdG8NCj4+PiBtYXAgRWZp
Qm9vdFNlcnZpY2Vze0NvZGUsRGF0YX0iKS4gQWRkIHN1cHBvcnQgZm9yIGVmaT1tYXBicyBvbiBY
ZW4NCj4+PiBjbWRsaW5lIGZvciB0aGUgc2FtZSBlZmZlY3QgYW5kIHBhcnNlIGl0IHZlcnkgZWFy
bHkgaW4gdGhlDQo+Pj4gbXVsdGlib290MitFRkkgYm9vdCBwYXRoLg0KPj4+DQo+Pj4gTm9ybWFs
bHkgY21kbGluZSBpcyBwYXJzZWQgYWZ0ZXIgcmVsb2NhdGluZyBNQjIgc3RydWN0dXJlLCB3aGlj
aCBoYXBwZW5zDQo+Pj4gdG9vIGxhdGUuIFRvIGhhdmUgZWZpPSBwYXJzZWQgZWFybHkgZW5vdWdo
LCBzYXZlIGNtZGxpbmUgcG9pbnRlciBpbg0KPj4+IGhlYWQuUyBhbmQgcGFzcyBpdCBhcyB5ZXQg
YW5vdGhlciBhcmd1bWVudCB0byBlZmlfbXVsdGlib290MigpLiBUaGlzDQo+Pj4gd2F5IHdlIGF2
b2lkIGludHJvZHVjaW5nIHlldCBhbm90aGVyIE1CMiBzdHJ1Y3R1cmUgcGFyc2VyLg0KPj4NCj4+
IEkgY2FuIHdoZXJlIHlvdSdyZSBjb21pbmcgZnJvbSBoZXJlLCBidXQgSSdtIG5vdCBhdCBhbGwg
aGFwcHkgdG8NCj4+IHNlZSB0aGUgYW1vdW50IG9mIGFzc2VtYmx5IGNvZGUgZnVydGhlciBncm93
Lg0KPiANCj4gSSBuZWVkIHRvIGFkZCBzb21lIGFueXdheSwgYmVjYXVzZSBvdGhlcndpc2UgZWZp
X211bHRpYm9vdDIoKSBkb24ndCBoYXZlDQo+IHBvaW50ZXIgdG8gTUIyIHN0cnVjdHVyZS4gQnV0
IHllcywgaXQgd291bGQgcHJvYmFibHkgYmUgbGVzcyBuZXcgYXNtDQo+IGNvZGUuIEp1c3QgdG8g
YmUgY2xlYXI6IGRvIHlvdSBwcmVmZXIgdGhpcmQgTUIyIHBhcnNlciBpbnN0ZWFkIG9mIGFkZGlu
Zw0KPiB0aGlzIGludG8gdGhlIG9uZSBpbiBoZWFkLlM/DQoNCk5vLCBJIGRvbid0LiBJJ20gbm90
IGhhcHB5IGFib3V0IGVpdGhlciB2YXJpYW50LiBMb29raW5nIGF0IHRoZQ0KY29kZSBJIGNhbid0
IGhlbHAgdGhpbmtpbmcgdGhhdCBpdCBzaG91bGRuJ3QgYmUgb3Zlcmx5IGRpZmZpY3VsdA0KdG8g
aGF2ZSBtYmlfcmVsb2MyKCkgcGVlayBpbnRvIHRoZSBjb21tYW5kIGxpbmUgYXMgaXQgcmVsb2Nh
dGVzDQppdC4gaGVhZC5TIHdvdWxkIHNpbXBseSBuZWVkIHRvIHBhc3MgaW4gdGhlIGFkZHJlc3Mg
b2Ygb3B0X21hcF9icw0KKG9yIGEgc3VpdGFibGUgaW50ZXJtZWRpYXRlIHZhcmlhYmxlIC8gc3Ry
dWN0dXJlKSBhcyBpdCBzZWVtcy4NCg0KPj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9lZmkvZWZpLWJv
b3QuaA0KPj4+ICsrKyBiL3hlbi9hcmNoL3g4Ni9lZmkvZWZpLWJvb3QuaA0KPj4+IEBAIC0zMTUs
OCArMzE1LDEwIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBlZmlfYXJjaF9oYW5kbGVfY21kbGluZShD
SEFSMTYgKmltYWdlX25hbWUsDQo+Pj4gICAgICAgICAgICBuYW1lLnMgPSAieGVuIjsNCj4+PiAg
ICAgICAgcGxhY2Vfc3RyaW5nKCZtYmkuY21kbGluZSwgbmFtZS5zKTsNCj4+PiAgICANCj4+PiAt
ICAgIGlmICggbWJpLmNtZGxpbmUgKQ0KPj4+ICsgICAgaWYgKCBtYmkuY21kbGluZSApIHsNCj4+
PiAgICAgICAgICAgIG1iaS5mbGFncyB8PSBNQklfQ01ETElORTsNCj4+PiArICAgICAgICBlZmlf
ZWFybHlfcGFyc2VfY21kbGluZShtYmkuY21kbGluZSk7DQo+Pj4gKyAgICB9DQo+Pg0KPj4gV2h5
PyBUaGlzIGlzIHRoZSB4ZW4uZWZpIGJvb3QgcGF0aCwgaXNuJ3QgaXQ/DQo+IA0KPiBZZXMsIGFz
IGV4cGxhaW5lZCBpbiBjb21taXQgbWVzc2FnZSwgdGhpcyBpcyB0byBtYWtlIGl0IGxlc3MgY29u
ZnVzaW5nDQo+IHdoYXQgb3B0aW9uIGNhbiBiZSB1c2VkIHdoZW4uIFRvIHNheSAiZWZpPW1hcGJz
IGRvZXMgWCIgaW5zdGVhZCBvZg0KPiAiZWZpPW1hcGJzIGRvZXMgWCwgYnV0IG9ubHkgaWYgWSwg
WiBhbmQgSyIuDQoNCk90b2ggaXQgaXMgZ29pbmcgdG8gYmUgY29uZnVzaW5nIHdoeSB0aGVyZSBh
cmUgdHdvIHdheXMgb2Ygc2V0dGluZw0KdGhpcyB3aXRoIHhlbi5lZmkuDQoNCj4+PiBAQCAtMTQx
MiwxNiArMTQxNywzMiBAQCBzdGF0aWMgaW50IF9faW5pdCBwYXJzZV9lZmlfcGFyYW0oY29uc3Qg
Y2hhciAqcykNCj4+PiAgICAgICAgICAgICAgIGVsc2UNCj4+PiAgICAgICAgICAgICAgICAgICBy
YyA9IC1FSU5WQUw7DQo+Pj4gICAgICAgICAgIH0NCj4+PiArICAgICAgICBlbHNlIGlmICggKHZh
bCA9IHBhcnNlX2Jvb2xlYW4oIm1hcGJzIiwgcywgc3MpKSA+PSAwICkNCj4+PiArICAgICAgICB7
DQo+Pj4gKyAgICAgICAgICAgIG1hcF9icyA9IHZhbDsNCj4+PiArICAgICAgICB9DQo+Pg0KPj4g
VGhpcyBtYXkgX25vdF8gYmUgYWNjZXB0ZWQgd2hlbiBjYWxsZWQgdGhlICJub3JtYWwiIHdheSwg
c2luY2UgaXQNCj4+IHdvdWxkIHRoZW4gZmFpbCB0byBhZmZlY3QgZWZpX2FyY2hfcHJvY2Vzc19t
ZW1vcnlfbWFwKCksIGJ1dCBpdA0KPj4gd291bGQgYWZmZWN0IGVmaV9pbml0X21lbW9yeSgpLg0K
PiANCj4gV2hhdCBkbyB5b3UgbWVhbj8gSGF2ZSBJIG1pc3NlZCBzb21lIEVGSSBib290IGNvZGUg
cGF0aD8gV2hlcmUgaXQgd291bGQNCj4gbWlzcyB0byBhZmZlY3QgZWZpX2FyY2hfcHJvY2Vzc19t
ZW1vcnlfbWFwKCkgPw0KDQpJJ20gaW1wbHlpbmcgdGhlIGNoYW5nZSB0byBlZmlfYXJjaF9oYW5k
bGVfY21kbGluZSgpIGFib3ZlIHRvDQpub3QgYmUgdGhlcmUuIEFuZCBJJ20gYWxzbyBjb25zaWRl
cmluZyB0aGUgY2FzZSB3aGVyZSwgZHVlIHRvDQpzb21lIG92ZXJzaWdodCAobGlrZSBpcyB0aGUg
Y2FzZSBoZXJlIGFzIG1lbnRpb25lZCBpbiBvdGhlcg0KcGxhY2VzKSwgdGhlIHR3byBjb21tYW5k
IGxpbmUgcHJvY2Vzc2luZyBzdGVwcyBwb3RlbnRpYWxseQ0KcHJvZHVjZSBkaWZmZXJlbnQgcmVz
dWx0cyAodGhlIGV4YW1wbGUgd2l0aCB0aGUgY3VycmVudCBjb2RlDQp3b3VsZCBiZSAiZWZpPW5v
LXJzIGVmaT1tYXBicyIpLg0KDQpKYW4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
