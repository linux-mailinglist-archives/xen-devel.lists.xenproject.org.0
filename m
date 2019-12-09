Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4759A116EA4
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 15:09:14 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieJgS-0006C6-7D; Mon, 09 Dec 2019 14:06:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BuSh=Z7=amazon.com=prvs=2393b02c0=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ieJgR-0006Bz-08
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 14:06:43 +0000
X-Inumbo-ID: 2018b268-1a8d-11ea-87df-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2018b268-1a8d-11ea-87df-12813bfff9fa;
 Mon, 09 Dec 2019 14:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575900402; x=1607436402;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=41jmELaG11hZHw4U8xczD25DOq9OviTTVOHkc8ONzyE=;
 b=ddcnGLY55e604IyzZYSMu5SMNpuKZ6P4qaslx/IFAeA1UQ6bz7t0HKDy
 XmqxEXM19SjsqxKhzrsQfguE4rhuenTsNeSGcA6E3vW5DGhdwmmQu3Cn1
 3adJkDjqZk2qxsTfHaGdljMuzn9H1YSyO2PVyuMk1DEfxWXdZ8c++rriF s=;
IronPort-SDR: imq5R0P2YU280qHcvWdfgkiUJ/BfL7klOrcD3bi7AVIesSLnhoIyOuUI2jQt1qUyQggW5MOxmu
 sft4MNIaORfw==
X-IronPort-AV: E=Sophos;i="5.69,294,1571702400"; 
   d="scan'208";a="4028204"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-87a10be6.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 09 Dec 2019 14:06:41 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-87a10be6.us-west-2.amazon.com (Postfix) with ESMTPS
 id 2E2A4A0757; Mon,  9 Dec 2019 14:06:40 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 14:06:40 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 14:06:40 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 9 Dec 2019 14:06:39 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [Xen-devel] [PATCH 2/4] xenbus: limit when state is forced to
 closed
Thread-Index: AQHVq3SCoU35oX1INEGjFwMD1PQM5aexs7UAgAAEWoCAAAHxUIAAAeGAgAAAtoCAABhzAIAABs0Q
Date: Mon, 9 Dec 2019 14:06:39 +0000
Message-ID: <c86eadaf008f48aeb4bb7140a80b69e6@EX13D32EUC003.ant.amazon.com>
References: <20191205140123.3817-1-pdurrant@amazon.com>
 <20191205140123.3817-3-pdurrant@amazon.com>
 <20191209113926.GS980@Air-de-Roger>
 <b8a138ad-5770-65fa-f368-f7b4063702fa@suse.com>
 <3412e42d13224b6786613e58dc189ebf@EX13D32EUC003.ant.amazon.com>
 <8d66e520-3009-cde1-e24c-26d7476e5873@suse.com>
 <63d653a04207451e9041c89acd04f2a2@EX13D32EUC003.ant.amazon.com>
 <2cd2a27e-2bb8-bd9d-45d8-1710038fb97a@suse.com>
In-Reply-To: <2cd2a27e-2bb8-bd9d-45d8-1710038fb97a@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.211]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 2/4] xenbus: limit when state is forced to
 closed
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Stefano
 Stabellini <sstabellini@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKw7xyZ2VuIEdyb8OfIDxqZ3Jv
c3NAc3VzZS5jb20+DQo+IFNlbnQ6IDA5IERlY2VtYmVyIDIwMTkgMTM6MzkNCj4gVG86IER1cnJh
bnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jb20+OyBSb2dlciBQYXUgTW9ubsOpDQo+IDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4NCj4gQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IHhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgU3RlZmFubw0KPiBTdGFiZWxsaW5pIDxzc3Rh
YmVsbGluaUBrZXJuZWwub3JnPjsgQm9yaXMgT3N0cm92c2t5DQo+IDxib3Jpcy5vc3Ryb3Zza3lA
b3JhY2xlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCAyLzRdIHhlbmJ1
czogbGltaXQgd2hlbiBzdGF0ZSBpcyBmb3JjZWQgdG8NCj4gY2xvc2VkDQo+IA0KPiBPbiAwOS4x
Mi4xOSAxMzoxOSwgRHVycmFudCwgUGF1bCB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gPj4gRnJvbTogSsO8cmdlbiBHcm/DnyA8amdyb3NzQHN1c2UuY29tPg0KPiA+
PiBTZW50OiAwOSBEZWNlbWJlciAyMDE5IDEyOjA5DQo+ID4+IFRvOiBEdXJyYW50LCBQYXVsIDxw
ZHVycmFudEBhbWF6b24uY29tPjsgUm9nZXIgUGF1IE1vbm7DqQ0KPiA+PiA8cm9nZXIucGF1QGNp
dHJpeC5jb20+DQo+ID4+IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyB4ZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7DQo+IFN0ZWZhbm8NCj4gPj4gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz47IEJvcmlzIE9zdHJvdnNreQ0KPiA+PiA8Ym9yaXMub3N0cm92
c2t5QG9yYWNsZS5jb20+DQo+ID4+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggMi80
XSB4ZW5idXM6IGxpbWl0IHdoZW4gc3RhdGUgaXMgZm9yY2VkDQo+IHRvDQo+ID4+IGNsb3NlZA0K
PiA+Pg0KPiA+PiBPbiAwOS4xMi4xOSAxMzowMywgRHVycmFudCwgUGF1bCB3cm90ZToNCj4gPj4+
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+IEZyb206IErDvHJnZW4gR3Jvw58g
PGpncm9zc0BzdXNlLmNvbT4NCj4gPj4+PiBTZW50OiAwOSBEZWNlbWJlciAyMDE5IDExOjU1DQo+
ID4+Pj4gVG86IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgRHVycmFu
dCwgUGF1bA0KPiA+Pj4+IDxwZHVycmFudEBhbWF6b24uY29tPg0KPiA+Pj4+IENjOiBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnOyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7DQo+
ID4+IFN0ZWZhbm8NCj4gPj4+PiBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsg
Qm9yaXMgT3N0cm92c2t5DQo+ID4+Pj4gPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPg0KPiA+
Pj4+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggMi80XSB4ZW5idXM6IGxpbWl0IHdo
ZW4gc3RhdGUgaXMNCj4gZm9yY2VkDQo+ID4+IHRvDQo+ID4+Pj4gY2xvc2VkDQo+ID4+Pj4NCj4g
Pj4+PiBPbiAwOS4xMi4xOSAxMjozOSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4gPj4+Pj4g
T24gVGh1LCBEZWMgMDUsIDIwMTkgYXQgMDI6MDE6MjFQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdy
b3RlOg0KPiA+Pj4+Pj4gT25seSBmb3JjZSBzdGF0ZSB0byBjbG9zZWQgaW4gdGhlIGNhc2Ugd2hl
biB0aGUgdG9vbHN0YWNrIG1heSBuZWVkDQo+IHRvDQo+ID4+Pj4+PiBjbGVhbiB1cC4gVGhpcyBj
YW4gYmUgZGV0ZWN0ZWQgYnkgY2hlY2tpbmcgd2hldGhlciB0aGUgc3RhdGUgaW4NCj4gPj4+PiB4
ZW5zdG9yZQ0KPiA+Pj4+Pj4gaGFzIGJlZW4gc2V0IHRvIGNsb3NpbmcgcHJpb3IgdG8gZGV2aWNl
IHJlbW92YWwuDQo+ID4+Pj4+DQo+ID4+Pj4+IEknbSBub3Qgc3VyZSBJIHNlZSB0aGUgcG9pbnQg
b2YgdGhpcywgSSB3b3VsZCBleHBlY3QgdGhhdCBhIGZhaWx1cmUNCj4gdG8NCj4gPj4+Pj4gcHJv
YmUgb3IgdGhlIHJlbW92YWwgb2YgdGhlIGRldmljZSB3b3VsZCBsZWF2ZSB0aGUgeGVuYnVzIHN0
YXRlIGFzDQo+ID4+Pj4+IGNsb3NlZCwgd2hpY2ggaXMgY29uc2lzdGVudCB3aXRoIHRoZSBhY3R1
YWwgZHJpdmVyIHN0YXRlLg0KPiA+Pj4+Pg0KPiA+Pj4+PiBDYW4geW91IGV4cGxhaW4gd2hhdCdz
IHRoZSBiZW5lZml0IG9mIGxlYXZpbmcgYSBkZXZpY2Ugd2l0aG91dCBhDQo+ID4+Pj4+IGRyaXZl
ciBpbiBzdWNoIHVua25vd24gc3RhdGU/DQo+ID4+Pj4NCj4gPj4+PiBBbmQgbW9yZSBjb25jZXJu
aW5nOiBkaWQgeW91IGNoZWNrIHRoYXQgbm8gZnJvbnRlbmQvYmFja2VuZCBpcw0KPiA+Pj4+IHJl
bHlpbmcgb24gdGhlIGNsb3NlZCBzdGF0ZSB0byBiZSB2aXNpYmxlIHdpdGhvdXQgY2xvc2luZyBo
YXZpbmcgYmVlbg0KPiA+Pj4+IHNldCBiZWZvcmU/DQo+ID4+Pg0KPiA+Pj4gQmxrZnJvbnQgZG9l
c24ndCBzZWVtIHRvIG1pbmQgYW5kIEkgYmVsaWV2ZSB0aGUgV2luZG93cyBQViBkcml2ZXJzDQo+
IGNvcGUsDQo+ID4+IGJ1dCBJIGRvbid0IHJlYWxseSB1bmRlcnN0YW5kIHRoZSBjb21tZW50IHNp
bmNlIHRoaXMgcGF0Y2ggaXMgYWN0dWFsbHkNCj4gPj4gcmVtb3ZpbmcgYSBjYXNlIHdoZXJlIHRo
ZSBiYWNrZW5kIHRyYW5zaXRpb25zIGRpcmVjdGx5IHRvIGNsb3NlZC4NCj4gPj4NCj4gPj4gSSdt
IG5vdCBzcGVha2luZyBvZiBibGtmcm9udC9ibGtiYWNrIG9ubHksIGJ1dCBvZiBuZXQsIHRwbSwg
c2NzaSwNCj4gcHZjYWxsDQo+ID4+IGV0Yy4gZnJvbnRlbmRzL2JhY2tlbmRzLiBBZnRlciBhbGwg
eW91IGFyZSBtb2RpZnlpbmcgYSBmdW5jdGlvbiBjb21tb24NCj4gPj4gdG8gYWxsIFBWIGRyaXZl
ciBwYWlycy4NCj4gPj4NCj4gPj4gWW91IGFyZSByZW1vdmluZyBhIHN0YXRlIHN3aXRjIHRvICJj
bG9zZWQiIGluIGNhc2UgdGhlIHN0YXRlIHdhcyBfbm90Xw0KPiA+PiAiY2xvc2luZyIgYmVmb3Jl
Lg0KPiA+DQo+ID4gWWVzLCB3aGljaCBBRkFJSyBpcyBhZ2FpbnN0IHRoZSBpbnRlbnRpb24gb2Yg
dGhlIGdlbmVyaWMgUFYgcHJvdG9jb2wNCj4gc3VjaCB0aGF0IGl0IGV2ZXIgZXhpc3RlZCBhbnl3
YXkuDQo+IA0KPiBXaGlsZSB0aGlzIG1pZ2h0IGJlIHRoZSBjYXNlIHdlIHNob3VsZCBfbm90XyBi
cmVhayBhbnkgZ3Vlc3RzDQo+IHJ1bm5pbmcgbm93LiBTbyB0aGlzIGtpbmQgb2YgcmVhc29uaW5n
IGlzIGRhbmdlcm91cy4NCj4gDQo+ID4NCj4gPj4gU28gYW55IFBWIGRyaXZlciByZWFjdGluZyB0
byAiY2xvc2VkIiBvZiB0aGUgb3RoZXIgZW5kDQo+ID4+IGluIGNhc2UgdGhlIHByZXZpb3VzIHN0
YXRlIG1pZ2h0IG5vdCBoYXZlIGJlZW4gImNsb3NpbmciIGJlZm9yZSBpcyBhdA0KPiA+PiByaXNr
IHRvIG1pc2JlaGF2ZSB3aXRoIHlvdXIgcGF0Y2guDQo+ID4NCj4gPiBXZWxsLCB0aGV5IHdpbGwg
c2VlIG5vdGhpbmcgbm93LiBJZiB0aGUgc3RhdGUgd2FzIG5vdCBjbG9zaW5nLCBpdCBnZXRzDQo+
IGxlZnQgYWxvbmUsIHNvIHRoZSBmcm9udGVuZCBzaG91bGRuJ3QgZG8gYW55dGhpbmcuIFRoZSBv
bmx5IHJpc2sgdGhhdCBJDQo+IGNhbiBzZWUgaXMgdGhhdCBzb21lIGZyb250ZW5kL2JhY2tlbmQg
cGFpciBuZWVkZWQgYSBkaXJlY3QgNCAtPiA2DQo+IHRyYW5zaXRpb24gdG8gc3VwcG9ydCAndW5i
aW5kJyBiZWZvcmUgYnV0IEFGQUlLIG5vdGhpbmcgaGFzIGV2ZXIgc3VwcG9ydGVkDQo+IHRoYXQs
IGFuZCBibGsgYW5kIG5ldCBjcmFzaCduJ2J1cm4gaWYgeW91IHRyeSB0aGF0IG9uIHVwc3RyZWFt
IGFzIGl0DQo+IHN0YW5kcy4gQSBjbGVhbiB1bnBsdWcgd291bGQgYWx3YXlzIHNldCBzdGF0ZSB0
byA1IGZpcnN0LCBzaW5jZSB0aGF0J3MNCj4gcGFydCBvZiB0aGUgdW5wbHVnIHByb3RvY29sLg0K
PiANCj4gVGhhdCB3YXMgbXkgcXVlc3Rpb246IGFyZSB5b3Ugc3VyZSBhbGwgY3VycmVudCBhbmQg
cHJldmlvdXMNCj4gZ3Vlc3QgZnJvbnRlbmRzIGFuZCBiYWNrZW5kcyBhcmUgaGFuZGxpbmcgdW5w
bHVnIHRoaXMgd2F5Pw0KPiANCj4gTm90ICJzaG91bGQgaGFuZGxlIiwgYnV0ICJkbyBoYW5kbGUi
Lg0KDQpUaGF0IGRlcGVuZHMgb24gdGhlIHRvb2xzdGFjay4gSUlVQyB0aGUgb25seSAnc3VwcG9y
dGVkJyB0b29sc3RhY2sgaXMgeGwvbGlieGwsIHdoaWNoIHdpbGwgc2V0ICdzdGF0ZScgdG8gNSBh
bmQgJ29ubGluZScgdG8gMCB0byBpbml0aWF0ZSBhbiB1bnBsdWcuDQoNCiAgUGF1bA0KDQo+IA0K
PiANCj4gSnVlcmdlbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZl
bA==
