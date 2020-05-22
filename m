Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 737301DE917
	for <lists+xen-devel@lfdr.de>; Fri, 22 May 2020 16:36:09 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jc8mD-0004eX-MR; Fri, 22 May 2020 14:35:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/N6j=7E=amazon.co.uk=prvs=4046e5fc3=pdurrant@srs-us1.protection.inumbo.net>)
 id 1jc8mB-0004eO-Fi
 for xen-devel@lists.xenproject.org; Fri, 22 May 2020 14:35:55 +0000
X-Inumbo-ID: 8b49f08c-9c39-11ea-9887-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b49f08c-9c39-11ea-9887-bc764e2007e4;
 Fri, 22 May 2020 14:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1590158155; x=1621694155;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=gDmbTZSvOmX+Uj7ZaaaqCdVohExrLwLH2EEgMr0TZ5A=;
 b=PeeyO5xk3KpwKlN1loQwIaOrUqZ62lyebx5V4kFiHV/7OWxkI318d4Iu
 rADxh0tB2qikruH7kek8L9wjh9IP2IdYqAbCKwIWxFflBe4UXJiPWtGIl
 RYv7mHbBklN7LsVceFz4hRYVKAcHWRxcDx6pr/omXMhdMhMNwpphxuiXU E=;
IronPort-SDR: Xo61MzYupChIJvTMlSQqhS1wri8KARmx1nGHZq2cUhSz3cCD1NXAjro2Fp5BJdmuOEHvSzykry
 Z3yjX4BHhgCw==
X-IronPort-AV: E=Sophos;i="5.73,422,1583193600"; d="scan'208";a="31779345"
Subject: RE: [PATCH v5 1/5] xen/common: introduce a new framework for
 save/restore of 'domain' context
Thread-Topic: [PATCH v5 1/5] xen/common: introduce a new framework for
 save/restore of 'domain' context
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 22 May 2020 14:35:42 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com (Postfix) with ESMTPS
 id C295AA22C0; Fri, 22 May 2020 14:35:40 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 22 May 2020 14:35:40 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Fri, 22 May 2020 14:35:39 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Fri, 22 May 2020 14:35:39 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
Thread-Index: AQHWL4wYvpA3OyuRlUmGyLSLdUQhs6i0KlMAgAACDQA=
Date: Fri, 22 May 2020 14:35:39 +0000
Message-ID: <e94b7451bf8d43339a69e1f392a768a6@EX13D32EUC003.ant.amazon.com>
References: <20200521161939.4508-1-paul@xen.org>
 <20200521161939.4508-2-paul@xen.org>
 <62f13c6d-8d5f-7d06-d7e9-d17b960c8264@suse.com>
In-Reply-To: <62f13c6d-8d5f-7d06-d7e9-d17b960c8264@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.198]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien
 Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, George
 Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDIyIE1heSAyMDIwIDE1OjI1DQo+IFRvOiBQYXVsIER1cnJh
bnQgPHBhdWxAeGVuLm9yZz4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsg
RHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPjsgSnVsaWVuIEdyYWxsDQo+IDxq
dWxpZW5AeGVuLm9yZz47IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
OyBHZW9yZ2UgRHVubGFwIDxnZW9yZ2UuZHVubGFwQGNpdHJpeC5jb20+Ow0KPiBJYW4gSmFja3Nv
biA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT47IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJl
bGxpbmlAa2VybmVsLm9yZz47IFdlaSBMaXUNCj4gPHdsQHhlbi5vcmc+OyBWb2xvZHlteXIgQmFi
Y2h1ayA8Vm9sb2R5bXlyX0JhYmNodWtAZXBhbS5jb20+OyBSb2dlciBQYXUgTW9ubsOpIDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4NCj4gU3ViamVjdDogUkU6IFtFWFRFUk5BTF0gW1BBVENIIHY1IDEv
NV0geGVuL2NvbW1vbjogaW50cm9kdWNlIGEgbmV3IGZyYW1ld29yayBmb3Igc2F2ZS9yZXN0b3Jl
IG9mDQo+ICdkb21haW4nIGNvbnRleHQNCj4gDQo+IENBVVRJT046IFRoaXMgZW1haWwgb3JpZ2lu
YXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlvbi4gRG8gbm90IGNsaWNrIGxpbmtz
IG9yIG9wZW4NCj4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBjYW4gY29uZmlybSB0aGUgc2VuZGVy
IGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+IA0KPiANCj4gDQo+IE9uIDIxLjA1LjIw
MjAgMTg6MTksIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPiBUbyBhbGxvdyBlbmxpZ2h0ZW5lZCBI
Vk0gZ3Vlc3RzIChpLmUuIHRob3NlIHRoYXQgaGF2ZSBQViBkcml2ZXJzKSB0byBiZQ0KPiA+IG1p
Z3JhdGVkIHdpdGhvdXQgdGhlaXIgY28tb3BlcmF0aW9uIGl0IHdpbGwgYmUgbmVjZXNzYXJ5IHRv
IHRyYW5zZmVyICdQVicNCj4gPiBzdGF0ZSBzdWNoIGFzIGV2ZW50IGNoYW5uZWwgc3RhdGUsIGdy
YW50IGVudHJ5IHN0YXRlLCBldGMuDQo+ID4NCj4gPiBDdXJyZW50bHkgdGhlcmUgaXMgYSBmcmFt
ZXdvcmsgKGVudGVyZWQgdmlhIHRoZSBodm1fc2F2ZS9sb2FkKCkgZnVuY3Rpb25zKQ0KPiA+IHRo
YXQgYWxsb3dzIGEgZG9tYWluJ3MgJ0hWTScgKGFyY2hpdGVjdHVyYWwpIHN0YXRlIHRvIGJlIHRy
YW5zZmVycmVkIGJ1dA0KPiA+ICdQVicgc3RhdGUgaXMgYWxzbyBjb21tb24gd2l0aCBwdXJlIFBW
IGd1ZXN0cyBhbmQgc28gdGhpcyBmcmFtZXdvcmsgaXMgbm90DQo+ID4gcmVhbGx5IHN1aXRhYmxl
Lg0KPiA+DQo+ID4gVGhpcyBwYXRjaCBhZGRzIHRoZSBuZXcgcHVibGljIGhlYWRlciBhbmQgbG93
IGxldmVsIGltcGxlbWVudGF0aW9uIG9mIGEgbmV3DQo+ID4gY29tbW9uIGZyYW1ld29yaywgZW50
ZXJlZCB2aWEgdGhlIGRvbWFpbl9zYXZlL2xvYWQoKSBmdW5jdGlvbnMuIFN1YnNlcXVlbnQNCj4g
PiBwYXRjaGVzIHdpbGwgaW50cm9kdWNlIG90aGVyIHBhcnRzIG9mIHRoZSBmcmFtZXdvcmssIGFu
ZCBjb2RlIHRoYXQgd2lsbA0KPiA+IG1ha2UgdXNlIG9mIGl0IHdpdGhpbiB0aGUgY3VycmVudCB2
ZXJzaW9uIG9mIHRoZSBsaWJ4YyBtaWdyYXRpb24gc3RyZWFtLg0KPiA+DQo+ID4gVGhpcyBwYXRj
aCBhbHNvIG1hcmtzIHRoZSBIVk0tb25seSBmcmFtZXdvcmsgYXMgZGVwcmVjYXRlZCBpbiBmYXZv
dXIgb2YgdGhlDQo+ID4gbmV3IGZyYW1ld29yay4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBh
dWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4NCj4gPiBBY2tlZC1ieTogSnVsaWVuIEdy
YWxsIDxqdWxpZW5AeGVuLm9yZz4NCj4gDQo+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+DQoNClRoYW5rcy4NCg0KPiB3aXRoIG9uZSByZW1hcms6DQo+IA0KPiA+
ICtpbnQgZG9tYWluX2xvYWRfZW5kKHN0cnVjdCBkb21haW5fY29udGV4dCAqYykNCj4gPiArew0K
PiA+ICsgICAgc3RydWN0IGRvbWFpbiAqZCA9IGMtPmRvbWFpbjsNCj4gPiArICAgIHNpemVfdCBs
ZW4gPSBjLT5kZXNjLmxlbmd0aCAtIGMtPmxlbjsNCj4gPiArDQo+ID4gKyAgICB3aGlsZSAoIGMt
PmxlbiAhPSBjLT5kZXNjLmxlbmd0aCApIC8qIHVuY29uc3VtZWQgZGF0YSBvciBwYWQgKi8NCj4g
PiArICAgIHsNCj4gPiArICAgICAgICB1aW50OF90IHBhZDsNCj4gPiArICAgICAgICBpbnQgcmMg
PSBkb21haW5fbG9hZF9kYXRhKGMsICZwYWQsIHNpemVvZihwYWQpKTsNCj4gPiArDQo+ID4gKyAg
ICAgICAgaWYgKCByYyApDQo+ID4gKyAgICAgICAgICAgIHJldHVybiByYzsNCj4gPiArDQo+ID4g
KyAgICAgICAgaWYgKCBwYWQgKQ0KPiA+ICsgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4g
PiArICAgIH0NCj4gPiArDQo+ID4gKyAgICBnZHByaW50ayhYRU5MT0dfSU5GTywgIiVwZCBsb2Fk
OiAlc1sldV0gKyV6dSAoLSV6dSlcbiIsIGQsIGMtPm5hbWUsDQo+ID4gKyAgICAgICAgICAgICBj
LT5kZXNjLmluc3RhbmNlLCBjLT5sZW4sIGxlbik7DQo+IA0KPiBVbmxpa2Ugb24gdGhlIHNhdmUg
c2lkZSB5b3UgYXNzdW1lIGMtPm5hbWUgdG8gYmUgbm9uLU5VTEwgaGVyZS4NCj4gV2UncmUgbm90
IGdvaW5nIHRvIGNyYXNoIGJlY2F1c2Ugb2YgdGhpcywgYnV0IGl0IGZlZWxzIGEgbGl0dGxlDQo+
IG9kZCBhbnl3YXksIHNwZWNpZmljYWxseSB3aXRoIHRoZSBmdW5jdGlvbiBiZWluZyBub24tc3Rh
dGljDQo+IChhbGJlaXQgb24gdGhlIHBvc2l0aXZlIHNpZGUgd2UgaGF2ZSB0aGUgdHlwZSBiZWlu
ZyBwcml2YXRlIHRvDQo+IHRoaXMgZmlsZSkuDQoNClllcywgSSBkaWRuJ3QgdGhpbmsgaXQgd2Fz
IHdvcnRoIHRoZSB0ZXN0IHNpbmNlIGl0IGlzIHN1cHBvc2VkIHRvIGJlIGEgImNhbid0IGhhcHBl
biIgY2FzZS4gSWYgd2UncmUgd29ycmllZCBhYm91dCB0aGUgbG9hZCBoYW5kbGVyIGNhbGxpbmcg
aW4gd2l0aCBhIGJhZCB2YWx1ZSBvZiBjIHRoZW4gd2UgY291bGQgYWRkIGEgbWFnaWMgbnVtYmVy
IGludG8gdGhlIHN0cnVjdCBhbmQgQVNTRVJUIGl0IGlzIGNvcnJlY3QgaW4gZG9tYWluX1tzYXZl
fGxvYWRdX1tiZWdpbnxkYXRhfGVuZF0uDQoNCiAgUGF1bA0KDQo+IA0KPiBKYW4NCg==

