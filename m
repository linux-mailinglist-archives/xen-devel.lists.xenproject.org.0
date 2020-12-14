Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 606622D951F
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 10:26:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52036.91055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kok7i-00050o-0I; Mon, 14 Dec 2020 09:26:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52036.91055; Mon, 14 Dec 2020 09:26:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kok7h-00050P-TG; Mon, 14 Dec 2020 09:26:29 +0000
Received: by outflank-mailman (input) for mailman id 52036;
 Mon, 14 Dec 2020 09:26:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WSiX=FS=amazon.com=prvs=61050d9d8=havanur@srs-us1.protection.inumbo.net>)
 id 1kok7g-00050K-E7
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 09:26:28 +0000
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id cc78b409-2c44-4424-990a-ce9bf15fde16;
 Mon, 14 Dec 2020 09:26:27 +0000 (UTC)
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-42f764a0.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 14 Dec 2020 09:26:19 +0000
Received: from EX13D36EUC002.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-1e-42f764a0.us-east-1.amazon.com (Postfix) with ESMTPS
 id 24C42E0E99; Mon, 14 Dec 2020 09:26:19 +0000 (UTC)
Received: from EX13D36EUC004.ant.amazon.com (10.43.164.126) by
 EX13D36EUC002.ant.amazon.com (10.43.164.99) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 14 Dec 2020 09:26:18 +0000
Received: from EX13D36EUC004.ant.amazon.com ([10.43.164.126]) by
 EX13D36EUC004.ant.amazon.com ([10.43.164.126]) with mapi id 15.00.1497.006;
 Mon, 14 Dec 2020 09:26:18 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: cc78b409-2c44-4424-990a-ce9bf15fde16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1607937987; x=1639473987;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version:subject;
  bh=n6clB3GoZQv+CZQo8AmhQkhJkKd7F62DVSjTX3yClHo=;
  b=LV8a1C96Y2XjrGcFYAbQpr4B0Wsk3fFcQWPbsFP5JrZi2e2m0V4kA8FJ
   yOQQynosCkxR1cV6ef6lbnAV9Ubefd/o/EifsNYmypbIZ4h+bIlqrel1Y
   QBVB8wq3eLZGN+hFpxg4oIhKdQZhU+BKpp4s/YJQaJfguNEeAYWM1yLUm
   I=;
X-IronPort-AV: E=Sophos;i="5.78,418,1599523200"; 
   d="scan'208";a="95702571"
Subject: Re: [XEN PATCH v1 1/1] Invalidate cache for cpus affinitized to the domain
Thread-Topic: [XEN PATCH v1 1/1] Invalidate cache for cpus affinitized to the domain
From: "Shamsundara Havanur, Harsha" <havanur@amazon.com>
To: "jbeulich@suse.com" <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Index: AQHWz7MJSRGqvamGtEii6iRZ4MXyYqn2TWsAgAAJiIA=
Date: Mon, 14 Dec 2020 09:26:17 +0000
Message-ID: <81b5d64b0a08d217e0ae53606cd1b8afd59283e4.camel@amazon.com>
References: <cover.1607686878.git.havanur@amazon.com>
	 <aad47c43b7cd7a391492b8be7b881cd37e9764c7.1607686878.git.havanur@amazon.com>
	 <149f7f6e-0ff4-affc-b65d-0f880fa27b13@suse.com>
In-Reply-To: <149f7f6e-0ff4-affc-b65d-0f880fa27b13@suse.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.78]
Content-Type: text/plain; charset="utf-8"
Content-ID: <32E7025488A69E4689051D4A87B5827A@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk

T24gTW9uLCAyMDIwLTEyLTE0IGF0IDA5OjUyICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4g
Q0FVVElPTjogVGhpcyBlbWFpbCBvcmlnaW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0aGUgb3JnYW5p
emF0aW9uLiBEbw0KPiBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3Mg
eW91IGNhbiBjb25maXJtIHRoZSBzZW5kZXINCj4gYW5kIGtub3cgdGhlIGNvbnRlbnQgaXMgc2Fm
ZS4NCj4gDQo+IA0KPiANCj4gT24gMTEuMTIuMjAyMCAxMjo0NCwgSGFyc2hhIFNoYW1zdW5kYXJh
IEhhdmFudXIgd3JvdGU6DQo+ID4gQSBIVk0gZG9tYWluIGZsdXNoZXMgY2FjaGUgb24gYWxsIHRo
ZSBjcHVzIHVzaW5nDQo+ID4gYGZsdXNoX2FsbGAgbWFjcm8gd2hpY2ggdXNlcyBjcHVfb25saW5l
X21hcCwgZHVyaW5nDQo+ID4gaSkgY3JlYXRpb24gb2YgYSBuZXcgZG9tYWluDQo+ID4gaWkpIHdo
ZW4gZGV2aWNlLW1vZGVsIG9wIGlzIHBlcmZvcm1lZA0KPiA+IGlpaSkgd2hlbiBkb21haW4gaXMg
ZGVzdHJ1Y3RlZC4NCj4gPiANCj4gPiBUaGlzIHRyaWdnZXJzIElQSSBvbiBhbGwgdGhlIGNwdXMs
IHRodXMgYWZmZWN0aW5nIG90aGVyDQo+ID4gZG9tYWlucyB0aGF0IGFyZSBwaW5uZWQgdG8gZGlm
ZmVyZW50IHBjcHVzLiBUaGlzIHBhdGNoDQo+ID4gcmVzdHJpY3RzIGNhY2hlIGZsdXNoIHRvIHRo
ZSBzZXQgb2YgY3B1cyBhZmZpbml0aXplZCB0bw0KPiA+IHRoZSBjdXJyZW50IGRvbWFpbiB1c2lu
ZyBgZG9tYWluLT5kaXJ0eV9jcHVtYXNrYC4NCj4gDQo+IEJ1dCB0aGVuIHlvdSBuZWVkIHRvIGVm
ZmVjdCBjYWNoZSBmbHVzaGluZyB3aGVuIGEgQ1BVIGdldHMNCj4gdGFrZW4gb3V0IG9mIGRvbWFp
bi0+ZGlydHlfY3B1bWFzay4gSSBkb24ndCB0aGluayB5b3Uvd2Ugd2FudA0KPiB0byBkbyB0aGF0
Lg0KPiANCklmIHdlIGRvIG5vdCByZXN0cmljdCwgaXQgY291bGQgbGVhZCB0byBEb1MgYXR0YWNr
LCB3aGVyZSBhIG1hbGljaW91cw0KZ3Vlc3QgY291bGQga2VlcCB3cml0aW5nIHRvIE1UUlIgcmVn
aXN0ZXJzIG9yIGRvIGEgY2FjaGUgZmx1c2ggdGhyb3VnaA0KRE0gT3AgYW5kIGtlZXAgc2VuZGlu
ZyBJUElzIHRvIG90aGVyIG5laWdoYm9yaW5nIGd1ZXN0cy4NCg0KLUhhcnNoYQ0KPiBKYW4NCj4g
DQo=

