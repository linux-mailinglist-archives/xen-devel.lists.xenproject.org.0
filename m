Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D4212935
	for <lists+xen-devel@lfdr.de>; Fri,  3 May 2019 09:57:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hMT0Z-0002Ul-2z; Fri, 03 May 2019 07:53:27 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ZHm+=TD=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hMT0Y-0002Ue-2T
 for xen-devel@lists.xenproject.org; Fri, 03 May 2019 07:53:26 +0000
X-Inumbo-ID: 8707109c-6d78-11e9-843c-bc764e045a96
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe1f::712])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8707109c-6d78-11e9-843c-bc764e045a96;
 Fri, 03 May 2019 07:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jLU/2Cf3sAfnKoOUQFUnL4ZgezeGHy+jxwfcrkt2Y08=;
 b=vHIfszN5mLewqMvdGTeKwtoBZJYI3bdrRwhPJDwZUuBEkIPEVZcdZ3Llr/fnoOLT0T9hOPq99KOVOWDg2NlvpNlm2Sqh6XnIfTKoFLjpP8tqosAxlq8XXVqa5CS+HyQoxFOfpdsYUJj7NGbj8l/381qscD3rUIWDIcv38klzNmc=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.103.139) by
 VI1PR0202MB3552.eurprd02.prod.outlook.com (52.134.19.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Fri, 3 May 2019 07:53:21 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::89a9:54d2:cf14:66a7]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::89a9:54d2:cf14:66a7%9]) with mapi id 15.20.1856.012; Fri, 3 May 2019
 07:53:20 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <JBeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>
Thread-Topic: [Xen-devel] [PATCH v1] x86/mm: Make change_type_range return
 error
Thread-Index: AQHU+qnahqk7Qfv5gU6tW7kXrs6RHqZLY84AgAFy0QCADD6WgA==
Date: Fri, 3 May 2019 07:53:20 +0000
Message-ID: <a5ff20d2-2968-9c81-1ee9-1bfee5b2a48f@bitdefender.com>
References: <20190424142718.14721-1-aisaila@bitdefender.com>
 <20190424144658.k4hrjj2rxykh4qd6@Air-de-Roger>
 <5CC1ADF202000078002290E3@prv1-mh.provo.novell.com>
In-Reply-To: <5CC1ADF202000078002290E3@prv1-mh.provo.novell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: AM4PR05CA0030.eurprd05.prod.outlook.com (2603:10a6:205::43)
 To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:de::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 492d9447-5a54-40de-bf5a-08d6cf9c6915
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:VI1PR0202MB3552; 
x-ms-traffictypediagnostic: VI1PR0202MB3552:|VI1PR0202MB3552:
x-microsoft-antispam-prvs: <VI1PR0202MB355221D209FA9E2DA561D878AB350@VI1PR0202MB3552.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0026334A56
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(396003)(376002)(346002)(39860400002)(136003)(189003)(199004)(229853002)(5660300002)(99286004)(81166006)(64756008)(66446008)(81156014)(66556008)(66476007)(6246003)(6512007)(8676002)(8936002)(73956011)(66946007)(54906003)(68736007)(52116002)(478600001)(6436002)(6506007)(76176011)(386003)(53546011)(26005)(14444005)(256004)(446003)(11346002)(86362001)(31696002)(4326008)(2906002)(66066001)(71190400001)(31686004)(486006)(186003)(71200400001)(14454004)(53936002)(305945005)(110136005)(102836004)(6486002)(476003)(316002)(2616005)(25786009)(36756003)(7736002)(6116002)(3846002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB3552;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: vGrSviZIQOAOANdF09b7ndS4AohVmQQjBXLnChJbpPKZ5/Z/GDF/9PlUtE+3rWXzccWpQzGtQ/lGwUUfthlHc8bZNXXXXAIWWVMnSZP5KOTpYhi0WeS8NNyaV+CzjH4edDp42/L/ZQaxI2wok9kL5xfdTvLwzjw8Gfyc+KGENlEbSN4SyiuJZ9HIFkSwo3am9zVRoQYmZvnJBA4v63sKKMokv4850evHaaOUuAJ9JBkFyeXi5z9GqWgp7MWJFij4nuhSlTBDscW/YAOdQD4Nr2irnYFtk43U3s+lVz9wXvP7Jvq098KRBriDFE6RFZW1pMTFp2sd99k3vUyZEONhBNgOFCOWUxu8/d0bkNWRAbiM3vcdUvILjj3pw9dDK5wP0QBP9ZYXuS02zTivFYLYTupJem9WjduracFI+/ymEC0=
Content-ID: <7D4A27A403ED9049939EB9EF471C6DE1@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 492d9447-5a54-40de-bf5a-08d6cf9c6915
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 May 2019 07:53:20.8047 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB3552
Subject: Re: [Xen-devel] [PATCH v1] x86/mm: Make change_type_range return
 error
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDI1LjA0LjIwMTkgMTU6NTQsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+PiBPbiAyNC4w
NC4xOSBhdCAxNjo0NiwgPHJvZ2VyLnBhdUBjaXRyaXguY29tPiB3cm90ZToNCj4+IE9uIFdlZCwg
QXByIDI0LCAyMDE5IGF0IDAyOjI3OjMyUE0gKzAwMDAsIEFsZXhhbmRydSBTdGVmYW4gSVNBSUxB
IHdyb3RlOg0KPj4+IEBAIC0xMDUzLDE1ICsxMDUzLDExIEBAIHN0YXRpYyB2b2lkIGNoYW5nZV90
eXBlX3JhbmdlKHN0cnVjdCBwMm1fZG9tYWluICpwMm0sDQo+Pj4gICAgICAgICogVGhpcyBzaG91
bGQgYmUgcmV2aXNpdGVkIGxhdGVyLCBidXQgZm9yIG5vdyBwb3N0IGEgd2FybmluZy4NCj4+PiAg
ICAgICAgKi8NCj4+PiAgICAgICBpZiAoIHVubGlrZWx5KGVuZCA+IGhvc3RfbWF4X3BmbikgKQ0K
Pj4+IC0gICAgew0KPj4+IC0gICAgICAgIHByaW50ayhYRU5MT0dfR19XQVJOSU5HICJEb20lZCBs
b2dkaXJ0eSByYW5nZXNldCBjbGlwcGVkIHRvIG1heF9tYXBwZWRfcGZuXG4iLA0KPj4+IC0gICAg
ICAgICAgICAgICBkLT5kb21haW5faWQpOw0KPj4+IC0gICAgICAgIGVuZCA9IGludmFsaWRhdGVf
ZW5kID0gaG9zdF9tYXhfcGZuOw0KPj4+IC0gICAgfQ0KPj4+ICsgICAgICAgIHJldHVybiAtRUlO
VkFMOw0KPj4+ICAgDQo+Pj4gICAgICAgLyogSWYgdGhlIHJlcXVlc3RlZCByYW5nZSBpcyBvdXQg
b2Ygc2NvcGUsIHJldHVybiBkb2luZyBub3RoaW5nLiAqLw0KPj4+ICAgICAgIGlmICggc3RhcnQg
PiBlbmQgKQ0KPj4+IC0gICAgICAgIHJldHVybjsNCj4+PiArICAgICAgICByZXR1cm4gMDsNCj4+
DQo+PiBTaW5jZSB5b3UgYXJlIGFscmVhZHkgY2hhbmdpbmcgdGhlIGJlaGF2aW9yIG9mIHRoZSBm
dW5jdGlvbiBhYm92ZSB0aGlzDQo+PiBzaG91bGQgYWxzbyByZXR1cm4gRUlOVkFMIElNTy4NCj4g
DQo+IEkgZG9uJ3QgdGhpbmsgSSBhZ3JlZS4gUXVpdGUgdGhlIG90aGVyIHdheSBhcm91bmQ6IElu
IHRoZSBsYXR0ZXINCj4gY2FzZSBpdCdzIHNpbXBseSBhbiBlbXB0eSByYW5nZSB0aGF0IGdldHMg
cmVxdWVzdGVkLCB3aGljaCBpcyBhDQo+IG5vLW9wIChhbmQgaGVuY2Ugbm8gcmVhc29uIHRvIGZh
aWwpLiBBdm9pZGluZyBlbXB0eSByYW5nZXMgaW4NCj4gdGhlIGNhbGxlcnMgbWF5IHJlc3VsdCBp
biBsZXNzIHJlYWRhYmxlIGNvZGUgdGhlcmUuDQo+IA0KPiBFdmVuIGluIHRoZSBmb3JtZXIgY2Fz
ZSBJIGRvbid0IHRoaW5rIHJldHVybmluZyBhbiBlcnJvciBpcw0KPiBhcHByb3ByaWF0ZSwgdGhl
IG1vcmUgdGhhdCB0aGUgY29tbWVudCB0aGVyZSBzYXlzIHRoaXMgaXMNCj4gcHJvYmFibHkgbm90
IHRoZSByaWdodCBiZWhhdmlvci4gSSB0aGluayBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8NCj4gbGVh
dmUgdGhpcyBhbG9uZSB1bnRpbCB3ZSBoYXZlIHNldHRsZWQgb24gd2hhdCB0aGUgcmlnaHQNCj4g
YmVoYXZpb3IgaGVyZSBpcy4gDQoNCkkgZ3Vlc3MgR2VvcmdlIG1heSBoYXZlIGEgc2F5IGhlcmUg
dG8gY2xhcmlmeSB0aGUgcmlnaHQgYmVoYXZpb3IuDQoNCj4gSXQgaXMgYW4gaXNzdWUgYW55d2F5
IHRoYXQgYSBjaGFuZ2UgaXMNCj4gbWFkZSB3aXRob3V0IHNheWluZyB3aHkgdGhlIG5ldyBiZWhh
dmlvciBwcmVmZXJhYmxlIG92ZXINCj4gdGhlIGN1cnJlbnQgb25lLg0KDQpTbyBpcyB0aGVyZSBh
IHdheSB0byBjb250aW51ZSB3aXRoIHRoaXM/DQoNCj4gDQo+IEluIGFueSBldmVudCB0aGUgY29t
bWVudCB0aGVyZSB3b3VsZCBiZWNvbWUgc3RhbGUgd2l0aCB0aGUNCj4gcmVtb3ZhbCBvZiB0aGUg
cHJpbnRrKCkuDQoNCkkgd2lsbCBjaGFuZ2UgdGhlIGNvbW1lbnQuDQoNCkFsZXgNCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
