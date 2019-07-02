Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0155CA3D
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2019 10:01:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hiDg5-0005Tz-0n; Tue, 02 Jul 2019 07:58:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=oS2Z=U7=bitdefender.com=aisaila@srs-us1.protection.inumbo.net>)
 id 1hiDg2-0005Tc-Ir
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2019 07:58:10 +0000
X-Inumbo-ID: 203a1265-9c9f-11e9-8980-bc764e045a96
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe05::71c])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 203a1265-9c9f-11e9-8980-bc764e045a96;
 Tue, 02 Jul 2019 07:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bitdefender.onmicrosoft.com; s=selector1-bitdefender-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=idlOjpYUX/EFEYI3xECwu99NMXOQpC994y+RdvnUVOU=;
 b=uTENEuk6oByf54oLAtJuPxMB3PZ0YmZwdwJJl1xJzP/O5VJXukZMgRMYv1GzIFE/Mr/MfkaBGb8j6fNEydYSjWPKk2eFrlOo9Z0zH6WkxUvMgSnrqOVPyLnPYP63r7jlYOFsRxqcjSeGOVTo6xR8DVHh+BnHq+cSe5oD9xvnQXA=
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com (10.171.106.11) by
 VI1PR0202MB3376.eurprd02.prod.outlook.com (52.134.16.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2032.20; Tue, 2 Jul 2019 07:58:04 +0000
Received: from VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::dd50:3e97:1d64:5aa3]) by VI1PR0202MB2928.eurprd02.prod.outlook.com
 ([fe80::dd50:3e97:1d64:5aa3%4]) with mapi id 15.20.2032.019; Tue, 2 Jul 2019
 07:58:04 +0000
From: Alexandru Stefan ISAILA <aisaila@bitdefender.com>
To: Jan Beulich <JBeulich@suse.com>
Thread-Topic: [PATCH v5] x86/emulate: Send vm_event from emulate
Thread-Index: AQHVMA7WPzdd4ckrE0m6/AH0OcBhs6a2CYCA///QXACAAD23gP//0oIAgAENioA=
Date: Tue, 2 Jul 2019 07:58:04 +0000
Message-ID: <23adc806-181b-8190-06ed-84e654628424@bitdefender.com>
References: <fb2a4d3e-b477-11a5-7b5e-4a236acd60dd@suse.com>
 <0b12721c-8820-7227-1079-0bd1f5587287@bitdefender.com>
 <3fa5932d-174c-9b57-3cb6-aab4eb6a5238@suse.com>
 <e38967e1-1705-5a3f-9601-a9a4b68f3ead@bitdefender.com>
 <031156bc-936f-79e0-e1ca-3e49a1274c71@suse.com>
In-Reply-To: <031156bc-936f-79e0-e1ca-3e49a1274c71@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: PR1PR01CA0022.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::35) To VI1PR0202MB2928.eurprd02.prod.outlook.com
 (2603:10a6:800:e3::11)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=aisaila@bitdefender.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [91.199.104.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2464e5c5-1017-46ce-47be-08d6fec302c1
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:VI1PR0202MB3376; 
x-ms-traffictypediagnostic: VI1PR0202MB3376:|VI1PR0202MB3376:
x-microsoft-antispam-prvs: <VI1PR0202MB3376B8DF04628FB13E08979FABF80@VI1PR0202MB3376.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 008663486A
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(136003)(396003)(39860400002)(346002)(366004)(189003)(199004)(6436002)(6512007)(53936002)(7416002)(4326008)(3846002)(6116002)(31686004)(316002)(54906003)(229853002)(2906002)(53546011)(6486002)(6506007)(386003)(68736007)(256004)(14444005)(66066001)(102836004)(76176011)(446003)(476003)(486006)(26005)(64756008)(66446008)(66556008)(66476007)(73956011)(66946007)(71190400001)(71200400001)(36756003)(5660300002)(52116002)(7736002)(11346002)(186003)(2616005)(86362001)(305945005)(81156014)(81166006)(8936002)(31696002)(99286004)(6916009)(6246003)(14454004)(478600001)(8676002)(25786009);
 DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0202MB3376;
 H:VI1PR0202MB2928.eurprd02.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: bitdefender.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OcspMu0Yrhg6IGKcQOA/zpVyXN0TPm6NoQSySHK/haXurpSnJfeXeiAHLP/Vnd2YqhxVtwqZvGOIF06jj1MIceXvtuGgaR/hQZHg6jSa1X7Pphjxl9HgEDA2wOh+ClePccILHLqRBa1nUtC1xIJp9tAuKJ15u0qi1aNeXn0lZL/CFYNJed7yMBV9KN9DjcFnRryNZcc1+BTnxFijRfT0VyzzvfWr6T/w+Mw2Rst/yIHMdsg7Ov0I2KgRlmklmKJBIF4HqoF72PjtLx3tzHxLMQJ+/yW6lHv94SKcAuZjnNTPtQDFO7EU9ITPr3XseFESh351scN02GHS6ja+UsdxKeCtuvK7zzi++C82nwg6kobF3QzDEk+aZfIULOsHcUyr2WQNWYfElQExGVr6S6+dIRsLU0ADL42ho8mSKKbcPKI=
Content-ID: <B22AFAF7CB1E9B4299C8A2B3C609F88C@eurprd02.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: bitdefender.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2464e5c5-1017-46ce-47be-08d6fec302c1
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jul 2019 07:58:04.1205 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 487baf29-f1da-469a-9221-243f830c36f3
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aisaila@bbu.bitdefender.biz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0202MB3376
Subject: Re: [Xen-devel] [PATCH v5] x86/emulate: Send vm_event from emulate
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
Cc: Wei Liu <wl@xen.org>, "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "tamas@tklengyel.com" <tamas@tklengyel.com>,
 "jun.nakajima@intel.com" <jun.nakajima@intel.com>,
 "rcojocaru@bitdefender.com" <rcojocaru@bitdefender.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 PaulDurrant <Paul.Durrant@citrix.com>,
 "suravee.suthikulpanit@amd.com" <suravee.suthikulpanit@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 "brian.woods@amd.com" <brian.woods@amd.com>,
 Roger PauMonne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

DQoNCk9uIDAxLjA3LjIwMTkgMTg6NTMsIEphbiBCZXVsaWNoIHdyb3RlOg0KPiBPbiAwMS4wNy4y
MDE5IDE3OjM2LCBBbGV4YW5kcnUgU3RlZmFuIElTQUlMQSB3cm90ZToNCj4+IE9uIDAxLjA3LjIw
MTkgMTc6NTUsIEphbiBCZXVsaWNoIHdyb3RlOg0KPj4+IE9uIDAxLjA3LjIwMTkgMTY6NDUsIEFs
ZXhhbmRydSBTdGVmYW4gSVNBSUxBIHdyb3RlOg0KPj4+PiBPbiAwMS4wNy4yMDE5IDE2OjEzLCBK
YW4gQmV1bGljaCB3cm90ZToNCj4+Pj4+Pj4+IE9uIDA0LjA2LjE5IGF0IDEzOjQ5LCA8YWlzYWls
YUBiaXRkZWZlbmRlci5jb20+IHdyb3RlOg0KPj4+Pj4+ICsgICAgaWYgKCAhcmVxLnUubWVtX2Fj
Y2Vzcy5mbGFncyApDQo+Pj4+Pj4gKyAgICAgICAgcmV0dXJuIGZhbHNlOyAvKiBubyB2aW9sYXRp
b24gKi8NCj4+Pj4+DQo+Pj4+PiBIb3cgaXMgdGhlICJmYWxzZSIgaGVyZSAoSSB0aGluayB0aGlz
IGlzIHRoZSBvbmUgdGhlIGRlc2NyaXB0aW9uIHRhbGtzDQo+Pj4+PiBhYm91dCkgbWF0Y2hpbmcg
dXAgd2l0aCB0aGUgdmFyaW91cyBvdGhlciBvbmVzIGluIHRoZSBmdW5jdGlvbj8NCj4+Pj4NCj4+
Pj4gVGhlcmUgc2hvdWxkIGJlIG5vIGV2ZW50IGlmIHRoZXJlIGlzIG5vIGFjY2VzcyB2aW9sYXRp
b24uIFNvIGluIHRoaXMNCj4+Pj4gY2FzZSB0aGUgZW11bGF0aW9uIGlzIGNvbnRpbnVlZCBhcyBl
eHBlY3RlZC4NCj4+Pg0KPj4+IEJ1dCB0aGlzIGRvZXNuJ3QgYW5zd2VyIG15IHF1ZXN0aW9uOiBZ
b3UgdXNlICJmYWxzZSIgYXMgcmV0dXJuIHZhbHVlDQo+Pj4gdG8gaW5kaWNhdGUgZGlmZmVyZW50
IHRoaW5ncy4gT25seSB0aGUgb25lIGhlcmUgbWVhbnMgIm5vIGFjY2Vzcw0KPj4+IHZpb2xhdGlv
biIuDQo+Pg0KPj4gU29ycnkgYWJvdXQgdGhhdCwgc2luY2UgdGhpcyB3aWxsIHJlbWFpbiB0aGUg
b25seSByZXR1cm4gZmFsc2UgYXBhcnQNCj4+IGZvcm0gdGhlIG1haW4gb25lIChyZXR1cm4gbW9u
aXRvcl90cmFwcygpKSwgZmFsc2UgID0gZXZlbnQgd2FzIG5vdCBzZW50DQo+PiBhbmQgdHJ1ZSA9
IGV2ZW50IHdhcyBzZW50Lg0KPj4NCj4+IEkgdW5kZXJzdGFuZCB0aGF0IHlvdSBhcmUgYXNraW5n
IGFib3V0IHRoZSBzY2VuYXJpbyB3aGVuIHRoZXJlIHdhcyBhDQo+PiB2aW9sYXRpb24gYW5kIHRo
ZSBldmVudCB3YXMgbm90IHNlbnQuIFRoZW4gSSBjYW4gaXNzdWUgYSBkb21haW5fY3Jhc2goKQ0K
Pj4gYXMgdGhhdCBpcyBwb3RlbnRpYWxseSBhIGJpZyBpc3N1ZS4NCj4+DQo+PiBJIGhvcGUgSSBn
b3QgdGhhdCBjb3JyZWN0bHkuDQo+IA0KPiBJIGRvbid0IGdldCB0aGUgaW1wcmVzc2lvbiB0aGF0
IHlvdSBkaWQuIEkgY291bnQgYSB0b3RhbCBvZiBmb3VyDQo+ICJyZXR1cm4gZmFsc2UiIGluIHRo
ZSBmdW5jdGlvbiwgb25seSBvbmUgb2Ygd2hpY2ggZXhwbGljaXRseSBtZWFucw0KPiAibm8gYWNj
ZXNzIHZpb2xhdGlvbiIgKG90aGVycyBtYXkgaGF2ZSB0aGF0IG1lYW5pbmcgaW1wbGljaXRseSku
IExldCdzDQo+IHRha2UgdGhlIHAybV9nZXRfbWVtX2FjY2VzcygpIGZhaWx1cmUgY2FzZSBhcyBh
biBleGFtcGxlOiBXaGF0IEkgZG9uJ3QNCj4gdW5kZXJzdGFuZCBpcyB3aHkgdGhpcyBjYXNlIGFu
ZCB0aGUgIm5vIGFjY2VzcyB2aW9sYXRpb24iIG9uZSBhcmUgYm90aA0KPiBtZWFudCB0byBiZSB0
cmVhdGVkIHRoZSBzYW1lLg0KDQpSaWdodCwgYXQgdGhlIG1vbWVudCwgZmFsc2UgbWVhbnMgdGhh
dCBlbXVsYXRpb24gc2hvdWxkIGNvbnRpbnVlIGFuZCANCnRydWUgbWVhbnMgdGhhdCBlbXVsYXRp
b24gc2hvdWxkIHN0b3AuIElmIGl0IGlzIGEgbXVzdCB0aGF0IEkgcmV0dXJuIA0KZGlmZmVyZW50
IGVycm9ycyBJIHdpbGwgY2hhbmdlIHRoYXQgaW4gdGhlIG5leHQgdmVyc2lvbiBidXQgaW4gdGhl
IHdheSANCnRoYXQgdGhlIGNvZGUgaXMgcmlnaHQgbm93IHRoZXkgd2lsbCBiZSB0cmVhdGVkIHRo
ZSBzYW1lIHdheS4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
