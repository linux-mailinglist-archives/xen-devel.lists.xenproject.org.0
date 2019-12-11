Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16D3011AC15
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 14:31:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1if23U-0006hg-VS; Wed, 11 Dec 2019 13:29:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=j9l2=2B=amazon.com=prvs=241e421da=pdurrant@srs-us1.protection.inumbo.net>)
 id 1if23T-0006hZ-83
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 13:29:27 +0000
X-Inumbo-ID: 4063bd72-1c1a-11ea-b6f1-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4063bd72-1c1a-11ea-b6f1-bc764e2007e4;
 Wed, 11 Dec 2019 13:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576070967; x=1607606967;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ozUHcqTNPTaOybRzSyZ4oX2x7AtDnmHYdNI9KaSA1T8=;
 b=kTNBEIkG9K0kd+tGy8+B2vmMvO3GpUNLcApj3qzfOjK5YEbTZkrU365s
 mDyt3mMa+kUW380rSn3B6jOxFLNXde7L5/JPN5TnfFhx0RP0iihF/FfeH
 kksrGgYPKvIp/6lvCfjX+gz/k1GRYixBAtByLvgpNtLu08vDwk2bp1L1j w=;
IronPort-SDR: hZ2ClO6EapghF5VSv5d2LeZ8/eVRg7o3xn5PTQZKeS31Zqfp9zSWEbZU6BnrrlH3NYqEKW3MZJ
 fepU2Tz8RAGQ==
X-IronPort-AV: E=Sophos;i="5.69,301,1571702400"; d="scan'208";a="12901612"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 11 Dec 2019 13:29:05 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-4e7c8266.us-west-2.amazon.com (Postfix) with ESMTPS
 id B5C54A1DA8; Wed, 11 Dec 2019 13:29:04 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 11 Dec 2019 13:29:04 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 11 Dec 2019 13:29:03 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 11 Dec 2019 13:29:03 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v2 2/4] xenbus: limit when state is forced to
 closed
Thread-Index: AQHVr029Jnf5zy5/UEOnUavFsd58GKe0trGAgAABW5CAAALOAIAANEwg
Date: Wed, 11 Dec 2019 13:29:03 +0000
Message-ID: <7423d11ef396468d94a3630cbc7aaa2b@EX13D32EUC003.ant.amazon.com>
References: <20191210113347.3404-1-pdurrant@amazon.com>
 <20191210113347.3404-3-pdurrant@amazon.com>
 <20191211100627.GI980@Air-de-Roger>
 <86a7d140501047028c49736c43fe547c@EX13D32EUC003.ant.amazon.com>
 <a5506f58-a469-913d-6860-1214fa346089@suse.com>
In-Reply-To: <a5506f58-a469-913d-6860-1214fa346089@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.172]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 2/4] xenbus: limit when state is forced
 to closed
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
c3NAc3VzZS5jb20+DQo+IFNlbnQ6IDExIERlY2VtYmVyIDIwMTkgMTA6MjENCj4gVG86IER1cnJh
bnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jb20+OyBSb2dlciBQYXUgTW9ubsOpDQo+IDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsg
bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgU3RlZmFubw0KPiBTdGFiZWxsaW5pIDxzc3Rh
YmVsbGluaUBrZXJuZWwub3JnPjsgQm9yaXMgT3N0cm92c2t5DQo+IDxib3Jpcy5vc3Ryb3Zza3lA
b3JhY2xlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2MiAyLzRdIHhl
bmJ1czogbGltaXQgd2hlbiBzdGF0ZSBpcyBmb3JjZWQNCj4gdG8gY2xvc2VkDQo+IA0KPiBPbiAx
MS4xMi4xOSAxMToxNCwgRHVycmFudCwgUGF1bCB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+DQo+ID4+IFNlbnQ6IDExIERlY2VtYmVyIDIwMTkgMTA6MDYNCj4gPj4gVG86IER1cnJh
bnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jb20+DQo+ID4+IENjOiB4ZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IEp1ZXJnZW4N
Cj4gPj4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz47DQo+ID4+IEJvcmlzIE9zdHJvdnNreSA8Ym9yaXMub3N0cm92c2t5
QG9yYWNsZS5jb20+DQo+ID4+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggdjIgMi80
XSB4ZW5idXM6IGxpbWl0IHdoZW4gc3RhdGUgaXMNCj4gZm9yY2VkDQo+ID4+IHRvIGNsb3NlZA0K
PiA+Pg0KPiA+PiBPbiBUdWUsIERlYyAxMCwgMjAxOSBhdCAxMTozMzo0NUFNICswMDAwLCBQYXVs
IER1cnJhbnQgd3JvdGU6DQo+ID4+PiBJZiBhIGRyaXZlciBwcm9iZSgpIGZhaWxzIHRoZW4gbGVh
dmUgdGhlIHhlbnN0b3JlIHN0YXRlIGFsb25lLiBUaGVyZQ0KPiBpcw0KPiA+PiBubw0KPiA+Pj4g
cmVhc29uIHRvIG1vZGlmeSBpdCBhcyB0aGUgZmFpbHVyZSBtYXkgYmUgZHVlIHRvIHRyYW5zaWVu
dCByZXNvdXJjZQ0KPiA+Pj4gYWxsb2NhdGlvbiBpc3N1ZXMgYW5kIGhlbmNlIGEgc3Vic2VxdWVu
dCBwcm9iZSgpIG1heSBzdWNjZWVkLg0KPiA+Pj4NCj4gPj4+IElmIHRoZSBkcml2ZXIgc3VwcG9y
dHMgcmUtYmluZGluZyB0aGVuIG9ubHkgZm9yY2Ugc3RhdGUgdG8gY2xvc2VkDQo+IGR1cmluZw0K
PiA+Pj4gcmVtb3ZlKCkgb25seSBpbiB0aGUgY2FzZSB3aGVuIHRoZSB0b29sc3RhY2sgbWF5IG5l
ZWQgdG8gY2xlYW4gdXAuDQo+IFRoaXMNCj4gPj4gY2FuDQo+ID4+PiBiZSBkZXRlY3RlZCBieSBj
aGVja2luZyB3aGV0aGVyIHRoZSBzdGF0ZSBpbiB4ZW5zdG9yZSBoYXMgYmVlbiBzZXQgdG8NCj4g
Pj4+IGNsb3NpbmcgcHJpb3IgdG8gZGV2aWNlIHJlbW92YWwuDQo+ID4+Pg0KPiA+Pj4gTk9URTog
UmUtYmluZCBzdXBwb3J0IGlzIGluZGljYXRlZCBieSBuZXcgYm9vbGVhbiBpbiBzdHJ1Y3QNCj4g
Pj4geGVuYnVzX2RyaXZlciwNCj4gPj4+ICAgICAgICB3aGljaCBkZWZhdWx0cyB0byBmYWxzZS4g
U3Vic2VxdWVudCBwYXRjaGVzIHdpbGwgYWRkIHN1cHBvcnQgdG8NCj4gPj4+ICAgICAgICBzb21l
IGJhY2tlbmQgZHJpdmVycy4NCj4gPj4NCj4gPj4gTXkgaW50ZW50aW9uIHdhcyB0byBzcGVjaWZ5
IHdoZXRoZXIgeW91IHdhbnQgdG8gY2xvc2UgdGhlDQo+ID4+IGJhY2tlbmRzIG9uIHVuYmluZCBp
biBzeXNmcywgc28gdGhhdCBhbiB1c2VyIGNhbiBkZWNpZGUgYXQgcnVudGltZSwNCj4gPj4gcmF0
aGVyIHRoYW4gaGF2aW5nIGEgaGFyZGNvZGVkIHZhbHVlIGluIHRoZSBkcml2ZXIuDQo+ID4+DQo+
ID4+IEFueXdheSwgSSdtIGxlc3Mgc3VyZSB3aGV0aGVyIHN1Y2ggcnVudGltZSB0dW5hYmxlIGlz
IHVzZWZ1bCBhdCBhbGwsDQo+ID4+IHNvIGxldCdzIGxlYXZlIGl0IG91dCBhbmQgY2FuIGFsd2F5
cyBiZSBhZGRlZCBhZnRlcndhcmRzLiBBdCB0aGUgZW5kDQo+ID4+IG9mIGRheSBhIHVzZXIgd3Jv
bmdseSBkb2luZyBhIHJtbW9kIGJsa2JhY2sgY2FuIGFsd2F5cyByZWNvdmVyDQo+ID4+IGdyYWNl
ZnVsbHkgYnkgbG9hZGluZyBibGtiYWNrIGFnYWluIHdpdGggeW91ciBwcm9wb3NlZCBhcHByb2Fj
aCB0bw0KPiA+PiBsZWF2ZSBjb25uZWN0aW9ucyBvcGVuIG9uIG1vZHVsZSByZW1vdmFsLg0KPiA+
Pg0KPiA+PiBTb3JyeSBmb3IgdGhlIGV4dHJhIHdvcmsuDQo+ID4+DQo+ID4NCj4gPiBEb2VzIHRo
aXMgbWVhbiB5b3UgZG9uJ3QgdGhpbmsgdGhlIGV4dHJhIGRyaXZlciBmbGFnIGlzIG5lY2Vzc2Fy
eSBhbnkNCj4gbW9yZT8gTkI6IG5vdyB0aGF0IHhlbmJ1cyBhY3R1YWxseSB0YWtlcyBtb2R1bGUg
cmVmZXJlbmNlcyB5b3UgY2FuJ3QNCj4gYWNjaWRlbnRhbGx5IHJtbW9kIGFueSBtb3JlIDotKQ0K
PiANCj4gSSdkIGxpa2UgaXQgdG8gYmUga2VwdCwgcGxlYXNlLg0KPiANCg0KT2suIEknbGwgbGVh
dmUgdGhpcyBwYXRjaCBhbG9uZSB0aGVuLg0KDQogIFBhdWwNCg0KPiBKdWVyZ2VuDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
