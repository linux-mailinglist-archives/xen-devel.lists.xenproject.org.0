Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A72D8EDD90
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2019 12:16:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iRaJ1-0001eL-69; Mon, 04 Nov 2019 11:13:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=jKzH=Y4=amazon.com=prvs=2041709ad=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iRaIz-0001eG-Gn
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2019 11:13:53 +0000
X-Inumbo-ID: 2ee027ae-fef4-11e9-b678-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ee027ae-fef4-11e9-b678-bc764e2007e4;
 Mon, 04 Nov 2019 11:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1572866033; x=1604402033;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=v6fKBLwfKskXhn+2iuHrEsopYqzXwzF4S0Hs9XRH/LM=;
 b=RKatYv7QxM+7cDOjGdyQ3LcMYEOW9Tmch1NgJbfNDrWAfN5fSa6mGjhs
 5C6NmpIau+maAMuGST1BeU9bA4c8qgihNHaGIgaCXGap9zj3OJNp/0ghb
 vj+RGH/qi/OeDM20+AlSOVm0Tnk46z+X/+2xBUyAZO1kwBBOXVz/Vft6+ o=;
IronPort-SDR: CcpYgtER+Im4yxNuNiFsGdgV/xZrvxIIrQOzLPKhVWZw8VOC8pSxHIOBFO1jcXwJyH6Exhz1Pj
 38gsaRT+iZVw==
X-IronPort-AV: E=Sophos;i="5.68,267,1569283200"; 
   d="scan'208";a="3481296"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 04 Nov 2019 11:13:51 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com (Postfix) with ESMTPS
 id 488ACA1E9B; Mon,  4 Nov 2019 11:13:50 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 4 Nov 2019 11:13:49 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 4 Nov 2019 11:13:49 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 4 Nov 2019 11:13:48 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [Xen-devel] [PATCH for-4.13 v2] passthrough: simplify locking
 and logging
Thread-Index: AQHVkOIsGbqhkhQ+JkOVwwPA8eZvZ6d6smTAgAArkoCAAAG8IA==
Date: Mon, 4 Nov 2019 11:13:48 +0000
Message-ID: <91a26b3802f44d0cbd9dfef227557780@EX13D32EUC003.ant.amazon.com>
References: <1572632881-9050-1-git-send-email-igor.druzhinin@citrix.com>
 <901b33296f1a4ee489da04d79932127b@EX13D32EUC003.ant.amazon.com>
 <105f4eda-14e0-33b9-e364-1f8a71dce9d9@citrix.com>
In-Reply-To: <105f4eda-14e0-33b9-e364-1f8a71dce9d9@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.139]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH for-4.13 v2] passthrough: simplify locking
 and logging
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: "jgross@suse.com" <jgross@suse.com>,
 Igor Druzhinin <igor.druzhinin@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBBbmRyZXcgQ29vcGVyIDxhbmRy
ZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTZW50OiAwNCBOb3ZlbWJlciAyMDE5IDExOjA2DQo+
IFRvOiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY29tPjsgeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnDQo+IENjOiBJZ29yIERydXpoaW5pbiA8aWdvci5kcnV6aGluaW5AY2l0
cml4LmNvbT47IGpncm9zc0BzdXNlLmNvbTsNCj4gamJldWxpY2hAc3VzZS5jb20NCj4gU3ViamVj
dDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCBmb3ItNC4xMyB2Ml0gcGFzc3Rocm91Z2g6IHNpbXBs
aWZ5IGxvY2tpbmcNCj4gYW5kIGxvZ2dpbmcNCj4gDQo+IE9uIDA0LzExLzIwMTkgMDg6MzEsIER1
cnJhbnQsIFBhdWwgd3JvdGU6DQo+ID4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+
IEZyb206IElnb3IgRHJ1emhpbmluIDxpZ29yLmRydXpoaW5pbkBjaXRyaXguY29tPg0KPiA+PiBT
ZW50OiAwMSBOb3ZlbWJlciAyMDE5IDE5OjI4DQo+ID4+IFRvOiB4ZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmcNCj4gPj4gQ2M6IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jb20+
OyBqYmV1bGljaEBzdXNlLmNvbTsNCj4gPj4gamdyb3NzQHN1c2UuY29tDQo+ID4+IFN1YmplY3Q6
IFtQQVRDSCBmb3ItNC4xMyB2Ml0gcGFzc3Rocm91Z2g6IHNpbXBsaWZ5IGxvY2tpbmcgYW5kIGxv
Z2dpbmcNCj4gPj4NCj4gPj4gRnJvbTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29t
Pg0KPiA+Pg0KPiA+PiBEcm9wcGluZyB0aGUgcGNpZGV2cyBsb2NrIGJldHdlZW4gY2FsbGluZyBk
ZXZpY2VfYXNzaWduZWQoKSBhbmQNCj4gPj4gYXNzaWduX2RldmljZSgpIG1lYW5zIHRoYXQgdGhl
IGxhdHRlciBoYXMgdG8gZG8gdGhlIHNhbWUgY2hlY2sgYXMgdGhlDQo+ID4+IGZvcm1lciBmb3Ig
bm8gb2J2aW91cyBnYWluLiBBbHNvLCBzaW5jZSBsb25nIHJ1bm5pbmcgb3BlcmF0aW9ucyB1bmRl
cg0KPiA+PiBwY2lkZXZzIGxvY2sgYWxyZWFkeSBkcm9wIHRoZSBsb2NrIGFuZCByZXR1cm4gLUVS
RVNUQVJUIHBlcmlvZGljYWxseQ0KPiB0aGVyZQ0KPiA+PiBpcyBsaXR0bGUgcG9pbnQgaW4gaW1t
ZWRpYXRlbHkgZmFpbGluZyBhbiBhc3NpZ25tZW50IG9wZXJhdGlvbiB3aXRoDQo+ID4+IC1FUkVT
VEFSVCBqdXN0IGJlY2F1c2UgdGhlIHBjaWRldnMgbG9jayBjb3VsZCBub3QgYmUgYWNxdWlyZWQg
KGZvciB0aGUNCj4gPj4gc2Vjb25kIHRpbWUsIGhhdmluZyBhbHJlYWR5IGJsb2NrZWQgb24gYWNx
dWlyaW5nIHRoZSBsb2NrIGluDQo+ID4+IGRldmljZV9hc3NpZ25lZCgpKS4NCj4gPj4NCj4gPj4g
VGhpcyBwYXRjaCBpbnN0ZWFkIGFjcXVpcmVzIHRoZSBsb2NrIG9uY2UgZm9yIGFzc2lnbm1lbnQg
KG9yIHRlc3QNCj4gYXNzaWduKQ0KPiA+PiBvcGVyYXRpb25zIGRpcmVjdGx5IGluIGlvbW11X2Rv
X3BjaV9kb21jdGwoKSBhbmQgdGh1cyBjYW4gcmVtb3ZlIHRoZQ0KPiA+PiBkdXBsaWNhdGUgZG9t
YWluIG93bmVyc2hpcCBjaGVjayBpbiBhc3NpZ25fZGV2aWNlKCkuIFdoaWxzdCBpbiB0aGUNCj4g
Pj4gbmVpZ2hib3VyaG9vZCwgdGhlIHBhdGNoIGFsc28gcmVtb3ZlcyBzb21lIGRlYnVnIGxvZ2dp
bmcgZnJvbQ0KPiA+PiBhc3NpZ25fZGV2aWNlKCkgYW5kIGRlYXNzaWduX2RldmljZSgpIGFuZCBy
ZXBsYWNlcyBpdCB3aXRoIHByb3BlciBlcnJvcg0KPiA+PiBsb2dnaW5nLCB3aGljaCBhbGxvd3Mg
ZXJyb3IgbG9nZ2luZyBpbiBpb21tdV9kb19wY2lfZG9tY3RsKCkgdG8gYmUNCj4gPj4gcmVtb3Zl
ZC4gQWxzbywgc2luY2UgZGV2aWNlX2Fzc2lnbmVkKCkgY2FuIHRlbGwgdGhlIGRpZmZlcmVuY2Ug
YmV0d2Vlbg0KPiBhDQo+ID4+IGd1ZXN0IGFzc2lnbmVkIGRldmljZSBhbmQgYSBub24tZXhpc3Rl
bnQgb25lLCBsb2cgdGhlIGFjdHVhbCBlcnJvcg0KPiA+PiBjb25kaXRpb24gcmF0aGVyIHRoZW4g
YmVpbmcgYW1iaWd1b3VzIGZvciB0aGUgc2FrZSBhIGZldyBleHRyYSBsaW5lcyBvZg0KPiA+PiBj
b2RlLg0KPiA+Pg0KPiA+PiBTaWduZWQtb2ZmLWJ5OiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFt
YXpvbi5jb20+DQo+ID4+IC0tLQ0KPiA+Pg0KPiA+PiBUaGlzIGlzIFhTQS0zMDIgZm9sbG93dXAg
YW5kIGNvbnRhaW5zIHNvbWUgY2hhbmdlcyBpbXBvcnRhbnQgZm9yDQo+ID4+IFhlblNlcnZlci4N
Cj4gPj4gSnVlcmdlbiwgY291bGQgdGhpcyBiZSBjb25zaWRlcmVkIGZvciA0LjEzIGluY2x1c2lv
bj8NCj4gPj4NCj4gPj4gdjI6IHVwZGF0ZWQgUGF1bCdzIGVtYWlsIGFkZHJlc3MNCj4gDQo+IFRo
aXMgd2FzIHdvcmsgeW91IGRpZCBhdCBDaXRyaXgsIHllcz8NCj4gDQo+ID4gUmV2aWV3ZWQtYnk6
IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4NCj4gDQo+IFNvQiBhbmQgUi1ieT8N
Cg0KSSBkaWQgZG8gdGhlIHdvcmsgd2hpbGUgSSB3YXMgYXQgQ2l0cml4LCBidXQgc3VyZWx5IHRo
ZSBTb0IgbXVzdCBiZSB1cGRhdGVkIHNpbmNlIHRoZSBwYXRjaCBpcyBvbmx5IG5vdyBiZWluZyBw
b3N0ZWQ/IEFzIGZvciB0aGUgUi1iLCB3aHkgc2hvdWxkIHRoYXQgYmUgaGlzdG9yaWM/DQoNCiAg
UGF1bA0KDQo+IA0KPiB+QW5kcmV3DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
