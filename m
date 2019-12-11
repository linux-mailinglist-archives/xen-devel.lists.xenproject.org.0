Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A19711B8D1
	for <lists+xen-devel@lfdr.de>; Wed, 11 Dec 2019 17:31:57 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1if4qN-0007cA-Pr; Wed, 11 Dec 2019 16:28:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=SbsP=2B=amazon.com=prvs=241424563=hongyxia@srs-us1.protection.inumbo.net>)
 id 1if4qM-0007c5-5O
 for xen-devel@lists.xenproject.org; Wed, 11 Dec 2019 16:28:06 +0000
X-Inumbo-ID: 30266c70-1c33-11ea-a1e1-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30266c70-1c33-11ea-a1e1-bc764e2007e4;
 Wed, 11 Dec 2019 16:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576081677; x=1607617677;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=KOlnAHxtWg9z6o7fERTOB+zEN+hvl6P+3yVrqmi3aho=;
 b=DEYm4mdovc6h6cboM96bCNEPzc4oOxZB14/7IOQpMQYHyKWupoZR4Nb/
 vfGX13lNotDDEf8e15pveE6Gj4wmSErPytgWhVXERCUNNCKkXL1d9ID1D
 aFb1aLPZVYNhxPNxafNvGALXb1qFRLP/QGM0D4F4ZLwaL85ZPCE3TRcTw k=;
IronPort-SDR: An3cuZprMgZHaoEj4hruVPb0yFmAF3d4t6QbfFnkEmRzPBAFM628FQ3wCkzDNiNYkbkSiRxcQS
 Xzr5jkfNRcOQ==
X-IronPort-AV: E=Sophos;i="5.69,301,1571702400"; d="scan'208";a="14315356"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-67b371d8.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 11 Dec 2019 16:27:37 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1a-67b371d8.us-east-1.amazon.com (Postfix) with ESMTPS
 id 8A7AAA1CF9; Wed, 11 Dec 2019 16:27:36 +0000 (UTC)
Received: from EX13D37EUA004.ant.amazon.com (10.43.165.124) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 11 Dec 2019 16:27:35 +0000
Received: from EX13D37EUA003.ant.amazon.com (10.43.165.7) by
 EX13D37EUA004.ant.amazon.com (10.43.165.124) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 11 Dec 2019 16:27:35 +0000
Received: from EX13D37EUA003.ant.amazon.com ([10.43.165.7]) by
 EX13D37EUA003.ant.amazon.com ([10.43.165.7]) with mapi id 15.00.1367.000;
 Wed, 11 Dec 2019 16:27:35 +0000
From: "Xia, Hongyan" <hongyxia@amazon.com>
To: "jbeulich@suse.com" <jbeulich@suse.com>
Thread-Topic: [PATCH v3 1/2] x86/mm: factor out the code for shattering an l3
 PTE
Thread-Index: AQHVsDgrsQLIl7LOq0GrXc7rnuB2iKe1H1gA
Date: Wed, 11 Dec 2019 16:27:35 +0000
Message-ID: <9abd6bc8c4d77e8653da6d451ecaa4d122c94b35.camel@amazon.com>
References: <cover.1576061451.git.hongyxia@amazon.com>
 <caf43a60c79fd8380efe0bc178c6b31e040c179c.1576061451.git.hongyxia@amazon.com>
 <1dedbe02-b4de-baca-d444-fda4f3711e28@suse.com>
In-Reply-To: <1dedbe02-b4de-baca-d444-fda4f3711e28@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.172]
Content-ID: <94654941B0B6984884BE1C4CFD233C89@amazon.com>
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v3 1/2] x86/mm: factor out the code for
 shattering an l3 PTE
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "Grall,
 Julien" <jgrall@amazon.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "wl@xen.org" <wl@xen.org>, "roger.pau@citrix.com" <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCAyMDE5LTEyLTExIGF0IDE2OjMyICswMTAwLCBKYW4gQmV1bGljaCB3cm90ZToNCj4g
T24gMTEuMTIuMjAxOSAxMTo1OCwgSG9uZ3lhbiBYaWEgd3JvdGU6DQo+ID4gQEAgLTU1NzgsMjcg
KzU1OTcsOCBAQCBpbnQgbW9kaWZ5X3hlbl9tYXBwaW5ncyh1bnNpZ25lZCBsb25nIHMsDQo+ID4g
dW5zaWduZWQgbG9uZyBlLCB1bnNpZ25lZCBpbnQgbmYpDQo+ID4gICAgICAgICAgICAgIH0NCj4g
PiAgDQo+ID4gICAgICAgICAgICAgIC8qIFBBR0UxR0I6IHNoYXR0ZXIgdGhlIHN1cGVycGFnZSBh
bmQgZmFsbCB0aHJvdWdoLiAqLw0KPiA+IC0gICAgICAgICAgICBwbDJlID0gYWxsb2NfeGVuX3Bh
Z2V0YWJsZSgpOw0KPiA+IC0gICAgICAgICAgICBpZiAoICFwbDJlICkNCj4gPiArICAgICAgICAg
ICAgaWYgKCBzaGF0dGVyX2wzZShwbDNlLCAwLCBsb2NraW5nKSApDQo+ID4gICAgICAgICAgICAg
ICAgICByZXR1cm4gLUVOT01FTTsNCj4gDQo+IEhtbSwgSSBkaWRuJ3QgZXhwZWN0IEknZCBuZWVk
IHRvIGNvbW1lbnQgb24gdGhpcyBhZ2FpbjogQXMgcGVyDQo+IG15IHYyIHJlcGx5LCB5b3Ugc2hv
dWxkIGhhbmQgb24gdGhlIHJldHVybiB2YWx1ZSBmcm9tIHRoZQ0KPiBmdW5jdGlvbiwgbm90IG1h
a2UgdXAgeW91ciBvd24uIFRoaXMgaXMgc28gdGhhdCBpbiBjYXNlIHRoZQ0KPiBmdW5jdGlvbiBn
YWlucyBhbm90aGVyIGVycm9yIHBhdGggd2l0aCBhIGRpZmZlcmVudCBlcnJvciBjb2RlLA0KPiBp
dCB3b3VsZG4ndCBiZWNvbWUgaW5kaXN0aW5ndWlzaGFibGUgdG8gY2FsbGVycyBmdXJ0aGVyIHVw
Lg0KPiANCg0KSSB3YXMgYmFzaWNhbGx5IHRoaW5raW5nIGFib3V0IHRoZSBjb252ZXJzYXRpb24g
d2UgaGFkIHRoYXQgRU5PTUVNIGlzDQpwcm9iYWJseSB0aGUgb25seSBlcnJvciB2YWx1ZSBtYXBf
cGFnZXNfdG9feGVuIHdvdWxkIHJldHVybiBldmVyLCBhbmQNCml0IGlzIHVubGlrZWx5IHRvIGdh
aW4gYW5vdGhlciByZXR1cm4gdmFsdWUgaW4gdGhlIGZ1dHVyZSwgc28gaW5pdGlhbGx5DQpJIGp1
c3QgbGV0IHNoYXR0ZXIgcmV0dXJuIC0xIGFuZCB0aGUgY2FsbGVyIHJldHVybiAtRU5PTUVNLiBU
aGVyZSBpcyBubw0KcHJvYmxlbSBmb3IgbWUgaWYgd2Ugd2FudCB0byBjaGFuZ2UgaXQgdG8gaGFu
ZGxlIGRpZmZlcmVudCBlcnJvcg0KdmFsdWVzLg0KDQpIb25neWFuDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3Jn
L21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
