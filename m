Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9C3C15021E
	for <lists+xen-devel@lfdr.de>; Mon,  3 Feb 2020 08:53:41 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iyWUu-00087q-F4; Mon, 03 Feb 2020 07:50:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Z8sP=3X=amazon.co.uk=prvs=29554d7b7=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iyWUs-00087l-Rr
 for xen-devel@lists.xenproject.org; Mon, 03 Feb 2020 07:50:18 +0000
X-Inumbo-ID: d2755a86-4659-11ea-ad98-bc764e2007e4
Received: from smtp-fw-4101.amazon.com (unknown [72.21.198.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d2755a86-4659-11ea-ad98-bc764e2007e4;
 Mon, 03 Feb 2020 07:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580716218; x=1612252218;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=t9H1BptUvZ4Ou0+TUP5DPXoW3FEb0bu95EHFix3N26g=;
 b=pfgjz/xKL4l3YzaZT6YwULPU1V83Pck1gLOaZxE8nshHSaJ0ZWJSfnuV
 V3vObJRSCP/M0Q8OEbo+8PKgH/RtMsy4f3vkteqejX5ZHYAIjpzRurHKp
 a8Rc0uWTNvgwgfAOWWs9sPMnnxiTnhzcb7Dxu8m1EUsF+3cbxEo5ZuvGJ w=;
IronPort-SDR: 2UW2bDxCupzPnPY1/U+xhsvRHwXShxe1PZq2IIX/Y3YNDv7RGENh569Op/Vkoa/8N7dvgNj+0g
 7gjWJnV+gmkQ==
X-IronPort-AV: E=Sophos;i="5.70,397,1574121600"; d="scan'208";a="15273687"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-4101.iad4.amazon.com with ESMTP;
 03 Feb 2020 07:50:17 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1d-474bcd9f.us-east-1.amazon.com (Postfix) with ESMTPS
 id 4D18BA1C8B; Mon,  3 Feb 2020 07:50:13 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 3 Feb 2020 07:50:13 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 3 Feb 2020 07:50:12 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 3 Feb 2020 07:50:12 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: "jandryuk@gmail.com" <jandryuk@gmail.com>
Thread-Topic: [PATCH v5 5/7] libxl: allow creation of domains with a specified
 or random domid
Thread-Index: AQHV2EdkLYnXyHJB5UGgi2AWokWodagFBYoAgAQWaFA=
Date: Mon, 3 Feb 2020 07:50:12 +0000
Message-ID: <17b6cfb84d5e4fdd8ac65b004a1bd599@EX13D32EUC003.ant.amazon.com>
References: <20200131150149.2008-1-pdurrant@amazon.com>
 <20200131150149.2008-6-pdurrant@amazon.com>
 <CAKf6xpsEzxVnnOn8G2bz=JQm1vwvKYtgy3UBLyp8B1CS8rPnUA@mail.gmail.com>
In-Reply-To: <CAKf6xpsEzxVnnOn8G2bz=JQm1vwvKYtgy3UBLyp8B1CS8rPnUA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.173]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v5 5/7] libxl: allow creation of domains
 with a specified or random domid
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Anthony PERARD <anthony.perard@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBqYW5kcnl1a0BnbWFpbC5jb20g
PGphbmRyeXVrQGdtYWlsLmNvbT4NCj4gU2VudDogMzEgSmFudWFyeSAyMDIwIDE3OjIzDQo+IFRv
OiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY28udWs+DQo+IENjOiB4ZW4tZGV2ZWwg
PHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZz47IElhbiBKYWNrc29uDQo+IDxpYW4uamFj
a3NvbkBldS5jaXRyaXguY29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IEFudGhvbnkgUEVSQVJE
DQo+IDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPjsgQW5kcmV3IENvb3BlciA8YW5kcmV3LmNv
b3BlcjNAY2l0cml4LmNvbT47DQo+IEdlb3JnZSBEdW5sYXAgPEdlb3JnZS5EdW5sYXBAZXUuY2l0
cml4LmNvbT47IEphbiBCZXVsaWNoDQo+IDxqYmV1bGljaEBzdXNlLmNvbT47IEp1bGllbiBHcmFs
bCA8anVsaWVuQHhlbi5vcmc+OyBLb25yYWQgUnplc3p1dGVrIFdpbGsNCj4gPGtvbnJhZC53aWxr
QG9yYWNsZS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjUgNS83XSBsaWJ4bDogYWxsb3cgY3JlYXRpb24gb2Yg
ZG9tYWlucyB3aXRoIGENCj4gc3BlY2lmaWVkIG9yIHJhbmRvbSBkb21pZA0KPiANCj4gT24gRnJp
LCBKYW4gMzEsIDIwMjAgYXQgMTA6MDIgQU0gUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24u
Y29tPiB3cm90ZToNCj4gPg0KPiA+IFRoaXMgcGF0Y2ggYWRkcyBhICdkb21pZCcgZmllbGQgdG8g
bGlieGxfZG9tYWluX2NyZWF0ZV9pbmZvIGFuZCB0aGVuDQo+ID4gbW9kaWZpZXMgbGlieGxfX2Rv
bWFpbl9tYWtlKCkgdG8gaGF2ZSBYZW4gdXNlIHRoYXQgdmFsdWUgaWYgaXQgaXMgdmFsaWQuDQo+
ID4gSWYgdGhlIGRvbWlkIHZhbHVlIGlzIGludmFsaWQgdGhlbiBYZW4gd2lsbCBjaG9vc2UgdGhl
IGRvbWlkLCBhcyBiZWZvcmUsDQo+ID4gdW5sZXNzIHRoZSB2YWx1ZSBpcyB0aGUgbmV3IHNwZWNp
YWwgUkFORE9NX0RPTUlEIHZhbHVlIGFkZGVkIHRvIHRoZSBBUEkuDQo+ID4gVGhpcyB2YWx1ZSBp
bnN0cnVjdHMgbGlieGxfX2RvbWFpbl9tYWtlKCkgdG8gY2hvb3NlIGEgcmFuZG9tIGRvbWlkIHZh
bHVlDQo+ID4gZm9yIFhlbiB0byB1c2UuDQo+ID4NCj4gPiBJZiBYZW4gZGV0ZXJtaW5lcyB0aGF0
IGEgZG9taWQgc3BlY2lmaWVkIHRvIG9yIGNob3NlbiBieQ0KPiA+IGxpYnhsX19kb21haW5fbWFr
ZSgpIGNvLWluY2lkZXMgd2l0aCBhbiBleGlzdGluZyBkb21haW4gdGhlbiB0aGUgY3JlYXRlDQo+
ID4gb3BlcmF0aW9uIHdpbGwgZmFpbC4gSW4gdGhpcyBjYXNlLCBpZiBSQU5ET01fRE9NSUQgd2Fz
IHNwZWNpZmllZCB0bw0KPiA+IGxpYnhsX19kb21haW5fbWFrZSgpIHRoZW4gYSBuZXcgcmFuZG9t
IHZhbHVlIHdpbGwgYmUgY2hvc2VuIGFuZCB0aGUNCj4gY3JlYXRlDQo+ID4gb3BlcmF0aW9uIHdp
bGwgYmUgcmUtdHJpZWQsIG90aGVyd2lzZSBsaWJ4bF9fZG9tYWluX21ha2UoKSB3aWxsIGZhaWwu
DQo+ID4NCj4gPiBBZnRlciBYZW4gaGFzIHN1Y2Nlc3NmdWxseSBjcmVhdGVkIGEgbmV3IGRvbWFp
biwgbGlieGxfX2RvbWFpbl9tYWtlKCkNCj4gd2lsbA0KPiA+IGNoZWNrIHdoZXRoZXIgaXRzIGRv
bWlkIG1hdGNoZXMgYW55IHJlY2VudGx5IHVzZWQgZG9taWQgdmFsdWVzLiBJZiBpdA0KPiBkb2Vz
DQo+ID4gdGhlbiB0aGUgZG9tYWluIHdpbGwgYmUgZGVzdHJveWVkLiBJZiB0aGUgZG9taWQgdXNl
ZCBpbiBjcmVhdGlvbiB3YXMNCj4gPiBzcGVjaWZpZWQgdG8gbGlieGxfX2RvbWFpbl9tYWtlKCkg
dGhlbiBpdCB3aWxsIGZhaWwgYXQgdGhpcyBwb2ludCwNCj4gPiBvdGhlcndpc2UgdGhlIGNyZWF0
ZSBvcGVyYXRpb24gd2lsbCBiZSByZS10cmllZCB3aXRoIGVpdGhlciBhIG5ldyByYW5kb20NCj4g
PiBvciBYZW4tc2VsZWN0ZWQgZG9taWQgdmFsdWUuDQo+ID4NCj4gPiBOT1RFOiBsaWJ4bF9fbG9n
digpIGlzIGFsc28gbW9kaWZpZWQgdG8gb25seSBsb2cgdmFsaWQgZG9taWQgdmFsdWVzIGluDQo+
ID4gICAgICAgbWVzc2FnZXMgcmF0aGVyIHRoYW4gYW55IGRvbWlkLCB2YWxpZCBvciBvdGhlcndp
c2UsIHRoYXQgaXMgbm90DQo+ID4gICAgICAgSU5WQUxJRF9ET01JRC4NCj4gPg0KPiA+IFNpZ25l
ZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRAYW1hem9uLmNvbT4NCj4gDQo+IExvb2tz
IGdvb2QsIHdpdGggb25lIHN1Z2dlc3Rpb24gYmVsb3cuDQo+IA0KPiBSZXZpZXdlZC1ieTogSmFz
b24gQW5kcnl1ayA8amFuZHJ5dWtAZ21haWwuY29tPg0KPiANCg0KVGhhbmtzLg0KDQo+IDxzbmlw
Pg0KPiANCj4gPiArDQo+ID4gKyAgICAgICAgICAgIC8qIFRyeSB0byBkZXN0cm95IHRoZSBkb21h
aW4gYWdhaW4gYXMgd2UgY2FuJ3QgdXNlIGl0ICovDQo+ID4gKyAgICAgICAgICAgIHJldCA9IHhj
X2RvbWFpbl9kZXN0cm95KGN0eC0+eGNoLCAqZG9taWQpOw0KPiA+ICsgICAgICAgICAgICBpZiAo
cmV0IDwgMCkgew0KPiA+ICsgICAgICAgICAgICAgICAgTE9HRUQoRVJST1IsICpkb21pZCwgImRv
bWFpbiBkZXN0cm95IGZhaWwiKTsNCj4gDQo+IE1heWJlICJkZXN0cm95IHJlY2VudGx5IHVzZWQg
ZG9tYWluIGlkIGZhaWxlZCI/DQo+IA0KDQpQcm9iYWJseSBkb2Vzbid0IGFjdHVhbGx5IG1hdHRl
ci4gQSBkZXN0cm95IGZhaWx1cmUgZHVyaW5nIGRvbWFpbiBjcmVhdGlvbiB3b3VsZCBiZSBhbiB1
bnVzdWFsIGNpcmN1bXN0YW5jZSwgYnV0IGlmIEkgaGF2ZSB0byBwb3N0IGEgdjYgSSdsbCBjaGFu
Z2UgdGhlIG1lc3NhZ2Ugd2hpbGUgSSdtIGF0IGl0Lg0KDQogIFBhdWwNCg0KPiA+ICsgICAgICAg
ICAgICAgICAgKmRvbWlkID0gSU5WQUxJRF9ET01JRDsNCj4gPiArICAgICAgICAgICAgICAgIHJj
ID0gRVJST1JfRkFJTDsNCj4gPiArICAgICAgICAgICAgICAgIGdvdG8gb3V0Ow0KPiA+ICsgICAg
ICAgICAgICB9DQo+ID4gICAgICAgICAgfQ0KPiA+DQo+ID4gICAgICAgICAgcmMgPSBsaWJ4bF9f
YXJjaF9kb21haW5fc2F2ZV9jb25maWcoZ2MsIGRfY29uZmlnLCBzdGF0ZSwNCj4gJmNyZWF0ZSk7
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2
ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xp
c3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
