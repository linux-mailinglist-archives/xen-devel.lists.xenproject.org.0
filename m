Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E26E4F4C
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2019 16:38:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iO0hF-0002R7-LV; Fri, 25 Oct 2019 14:36:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZZIQ=YS=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1iO0hE-0002R2-Nr
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2019 14:36:08 +0000
X-Inumbo-ID: c761faec-f734-11e9-a531-bc764e2007e4
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe0e::731])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c761faec-f734-11e9-a531-bc764e2007e4;
 Fri, 25 Oct 2019 14:36:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZur2ieWysxbGDyUAz4hNbyQ5BU6V0aEveSZuiE/EhCTrXxFAs0bdah3UpCjHJATJZANHEEeZqQoPQHs252eVgYsOyp5bdPQrw/dZfM73iv+3PXGIdbWFSt05gePKQDnJHG6+ne1YRv/T4bBMi0kEUueKdxaOL2COOKH7LMmLnuaoIzTv64Vpmiv9PQjriw5rCN7zFRnwb888tR22lv6bWkKIa1XXAeFCMvEpL1cyoRyZSPOxfQ8SsnFbzSPQSEj31K4RfucssbMx4zhwY4Z645Aqove0lj5qVH4tIA248VS5KTiSeladH9HfXfmwcS6cxRkKaGuMWAjE1L4PNiDYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EnxbktykX0WWrv/HiqQa1vm+2TcYDB5nDUFmAlcSAZA=;
 b=la5NN/WNpDmgyejKJ95lOzH7PNaXRQmZr/IWYpd0m1UiHB5dPlBPmHh7IFfa+3XqAwjgvVm2tiwwwMp3DsbmT8NvCRPppXsl3uCeaffN2b6eik5iBBQQCztUPlQDVr6kIzHuKGMluHFh/tw0jIu1OZyZWph5e9hK2ZkYiCN8fe1pFkwq4krJVTkfAMf30Aj7nYw/VEBhSu30p7McOANTg/BMpYNHv7G0KOk2SNYIhWBK+aI5Z+p7cHmKKknPI+D7P3ZBV+kvLXs3s6HSJAKUTcJJPQHfb3uaa/Z2/oKXiZgcyDpCt+6R49Ntats1iyIOkhkVAb+9LEYEZGBcRXgoYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bitdefender.com; dmarc=pass action=none
 header.from=bitdefender.com; dkim=pass header.d=bitdefender.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector2-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EnxbktykX0WWrv/HiqQa1vm+2TcYDB5nDUFmAlcSAZA=;
 b=AIFCNz8pIR6fewdmX5FtzlRP09UOHdt7GaOkFdlwsTzY3OaC3+7CgHVy14+EWGgiDrqynBLX77v65t0GLzwtYpoMzKFTEF0h1DLfS8JPCsAGm8sScYAFZNzYpsj5OJxYxdpqP3Pp81VKRUaSazPLMRe6/2q8DG+6HNAbt365CV0=
Received: from AM6PR0202MB3413.eurprd02.prod.outlook.com (52.133.30.28) by
 AM6PR0202MB3494.eurprd02.prod.outlook.com (52.133.27.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2387.24; Fri, 25 Oct 2019 14:36:05 +0000
Received: from AM6PR0202MB3413.eurprd02.prod.outlook.com
 ([fe80::f0d8:e3a6:48ce:4b0]) by AM6PR0202MB3413.eurprd02.prod.outlook.com
 ([fe80::f0d8:e3a6:48ce:4b0%5]) with mapi id 15.20.2387.023; Fri, 25 Oct 2019
 14:36:05 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v1] x86/altp2m: Add hypercall to create a new
 view and set sve bits
Thread-Index: AQHVYWYIdb/r2yKq9kGUPnrK2APIqqcaHHgAgAAZmgCATj09AP///F+AgANQk4A=
Date: Fri, 25 Oct 2019 14:36:05 +0000
Message-ID: <050b1ecd-8c3e-ae4a-60a9-f9b36340f749@bitdefender.com>
References: <20190902081118.31001-1-aisaila@bitdefender.com>
 <71f44ba3-b436-128e-8585-62c731feb7f3@suse.com>
 <CABfawhmYs4SBJZ6u4b7+ymdrTtLzLC+VMQwHovSVDNtw3c7vHg@mail.gmail.com>
 <41a47abf-ec6f-1b19-8803-099b7d54b5bd@bitdefender.com>
 <20191023115715.GR17494@Air-de-Roger>
In-Reply-To: <20191023115715.GR17494@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM0PR05CA0021.eurprd05.prod.outlook.com
 (2603:10a6:208:55::34) To AM6PR0202MB3413.eurprd02.prod.outlook.com
 (2603:10a6:209:1c::28)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 30bfb26b-a9d4-475a-c0b5-08d75958aa9a
x-ms-traffictypediagnostic: AM6PR0202MB3494:|AM6PR0202MB3494:|AM6PR0202MB3494:
x-microsoft-antispam-prvs: <AM6PR0202MB3494E1461AD1CF0AEBA48EB6AB650@AM6PR0202MB3494.eurprd02.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 02015246A9
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(366004)(396003)(346002)(136003)(39860400002)(199004)(189003)(51444003)(66556008)(64756008)(66446008)(66946007)(66476007)(316002)(54906003)(26005)(25786009)(2906002)(386003)(478600001)(99286004)(7416002)(6506007)(5660300002)(71200400001)(71190400001)(53546011)(446003)(6512007)(6916009)(6116002)(31696002)(4326008)(52116002)(31686004)(76176011)(476003)(3846002)(14454004)(14444005)(256004)(186003)(86362001)(2616005)(36756003)(305945005)(7736002)(486006)(6246003)(66066001)(102836004)(8936002)(81166006)(81156014)(8676002)(6486002)(6436002)(229853002)(11346002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:AM6PR0202MB3494;
 H:AM6PR0202MB3413.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0wWikUw9RsfIoArR+CTVyPX7Q/0PmcEQlVALPiWsHs07yd1E4vLcEEop1f8bNCbn9cvNOqpOB/YkelimMf51GIIAeBvIw25bzngwT9w4FQPw8w2/Ra83fiSqdO47lqWT/FwkLLXSOpyXN8oCpk18jGOl39UPODqNOO5/Dc7StyFIuxXObi57Ux2sUwptszunjQktbikeXBAb7MnRXB6HuQD97afS62y76wwBKhK8zNLlSvjahrZGDjKGeZ3zz1j/tjd5R67dzw1ljqnMNL5TMSsWhuwc3zNDInVMIffEupN5Ib9wS7vUeA8NlOVwyPnB6N3CuG/arsQq+mDX2iFL+d5ILKH/nUoSDHA6LxdO8fLs9ENvNoeQv6deJpYn5TvEfmrxN6EAzXuWNMKJfTdXs3ghRjAv3hNhcvnQIpJn/B2JgcvEGp7ZD3wn5e32yqAO
Content-ID: <DF993ADC5C12A544896ADE7EB6EF3544@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30bfb26b-a9d4-475a-c0b5-08d75958aa9a
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2019 14:36:05.2576 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3IbjPvKCoqg7M7MNrzNbusm9iLdD3mDoQBTT7pZy77rSY1dKUG+eOu+3YBF7NGpwPeLVxDOaV/FmSdX7MTxM05s1RgwnrcEqun9gTiNFRIc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR0202MB3494
Subject: Re: [Xen-devel] [PATCH v1] x86/altp2m: Add hypercall to create a
 new view and set sve bits
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
Cc: "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "jun.nakajima@intel.com" <jun.nakajima@intel.com>, "wl@xen.org" <wl@xen.org>,
 "konrad.wilk@oracle.com" <konrad.wilk@oracle.com>,
 "george.dunlap@eu.citrix.com" <george.dunlap@eu.citrix.com>,
 Tamas K Lengyel <tamas.k.lengyel@gmail.com>,
 "ian.jackson@eu.citrix.com" <ian.jackson@eu.citrix.com>,
 "tim@xen.org" <tim@xen.org>, "julien.grall@arm.com" <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDIzLjEwLjIwMTkgMTQ6NTgsIFJvZ2VyIFBhdSBNb25uw6kgd3JvdGU6DQo+IE9uIFdl
ZCwgT2N0IDIzLCAyMDE5IGF0IDA5OjExOjU0QU0gKzAwMDAsIEFsZXhhbmRydSBTdGVmYW4gSVNB
SUxBIHdyb3RlOg0KPj4NCj4+DQo+PiBPbiAwMy4wOS4yMDE5IDIwOjI0LCBUYW1hcyBLIExlbmd5
ZWwgd3JvdGU6DQo+Pj4gT24gVHVlLCBTZXAgMywgMjAxOSBhdCA5OjUzIEFNIEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4gd3JvdGU6DQo+Pj4+DQo+Pj4+IE9uIDAyLjA5LjIwMTkgMTA6
MTEsIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOg0KPj4+Pj4gLS0tIGEveGVuL2luY2x1
ZGUvcHVibGljL2h2bS9odm1fb3AuaA0KPj4+Pj4gKysrIGIveGVuL2luY2x1ZGUvcHVibGljL2h2
bS9odm1fb3AuaA0KPj4+Pj4gQEAgLTI0NCw2ICsyNDQsNyBAQCBzdHJ1Y3QgeGVuX2h2bV9hbHRw
Mm1fdmlldyB7DQo+Pj4+PiAgICAgICAgLyogQ3JlYXRlIHZpZXcgb25seTogZGVmYXVsdCBhY2Nl
c3MgdHlwZQ0KPj4+Pj4gICAgICAgICAqIE5PVEU6IGN1cnJlbnRseSBpZ25vcmVkICovDQo+Pj4+
PiAgICAgICAgdWludDE2X3QgaHZtbWVtX2RlZmF1bHRfYWNjZXNzOyAvKiB4ZW5tZW1fYWNjZXNz
X3QgKi8NCj4+Pj4+ICsgICAgdWludDhfdCBzZXRfc3ZlOyAvKiBib29sIHZhbHVlICovDQo+Pj4+
PiAgICB9Ow0KPj4+Pg0KPj4+PiBUaGlzIGludGVyZmFjZSBpcywgZ2l2ZW4gdGhlIHJpZ2h0IGNv
bmZpZ3VyYXRpb24sIGF2YWlsYWJsZSB0bw0KPj4+PiBndWVzdHMuIEhlbmNlIHlvdSBjYW4ndCBz
aW1wbHkgYWRkIGEgZmllbGQgaGVyZS4gSnVzdCBjb25zaWRlcg0KPj4+PiB3aGF0IGhhcHBlbnMg
Zm9yIGFuIGV4aXN0aW5nIGNhbGxlciB3aGVuIHRoZXJlIGlzIHJhbmRvbSBkYXRhDQo+Pj4+IGlu
IHRoZSBmaWVsZCB5b3Ugbm93IGFzc2lnbiBhIG1lYW5pbmcuDQo+Pj4NCj4+PiBQZXJoYXBzIGlu
c3RlYWQgb2YgZXh0ZW5kaW5nIHRoZSBIVk1PUCBpdCB3b3VsZCBtYWtlIG1vcmUgc2Vuc2UgdG8N
Cj4+PiBqdXN0IGFkZCBhIHhsIGNvbmZpZyBvcHRpb24gdGhhdCBkZWZpbmVzIHRoZSAiZGVmYXVs
dCIgc3ZlIGJpdCBmb3INCj4+PiBhbHRwMm0gdmlld3MgaW4gdGhlIGRvbWFpbj8NCj4+Pg0KPj4N
Cj4+IEFkZGluZyBhIHhsIGNvbmZpZyBvcHRpb24gd2lsbCBub3Qgd29yayBmb3Igc3lzdGVtcyB0
aGF0IGRvIHVzZSB4bC4NCj4+IFRoZXJlIGlzIGEgbmVlZCB0aGF0IHRoaXMgd2lsbCB3b3JrIGlu
IGFsbCBjYXNlcy4NCj4gDQo+IEkgYXNzdW1lIHRoYXQgc3VjaCBvcHRpb24gd291bGQgYmUgaW1w
bGVtZW50ZWQgdXNpbmcgYSBET01DVEwsIHdoaWNoDQo+IGNhbiBhbHNvIGJlIHVzZWQgYnkgb3Ro
ZXIgdG9vbHN0YWNrcy4gSSBob3dldmVyIGhhdmUgbm8gaWRlYSB3aGV0aGVyDQo+IHRoaXMgaXMg
YSBzdWl0YWJsZSBpbnRlcmZhY2Ugb3Igbm90IGZvciB0aGlzIGZlYXR1cmUuDQo+IA0KDQpJIHRo
aW5rIHRoYXQgaGF2aW5nIGEgSFZNT1BfYWx0cDJtX2dldF9zdXBwcmVzc192ZV9tdWx0aSBhbmQg
bGV0dGluZyB0aGUgDQpjYWxsZXIgcHJvdmlkZSB0aGUgc3RhcnQgZ2ZuIGFuZCB0aGUgbnIgb2Yg
cGFnZXMgdG8gaGF2ZSB0aGUgc3ZlIGJpdHMgDQpzZXQgd2lsbCBwcm92aWRlIGEgZ29vZCBzb2x1
dGlvbiBmb3IgaW5pdCBhbiBkZm9yIGZ1cnRoZXIgZGV2ZWxvcG1lbnQuDQoNCkkgd2lsbCBnbyBv
biB0aGlzIHdheSBmb3IgdmVyc2lvbiAyIGlmIGV2ZXJ5b25lIGlzIG9rIHdpdGggdGhpcy4NCg0K
VGhhbmtzLA0KQWxleA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
