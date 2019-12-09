Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE3B117203
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 17:42:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieM3n-0004LD-7d; Mon, 09 Dec 2019 16:38:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BuSh=Z7=amazon.com=prvs=2393b02c0=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ieM3l-0004L8-Od
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 16:38:57 +0000
X-Inumbo-ID: 6514e0e8-1aa2-11ea-b6f1-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6514e0e8-1aa2-11ea-b6f1-bc764e2007e4;
 Mon, 09 Dec 2019 16:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575909537; x=1607445537;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=seCUnC3Ccht6HhiXNa+L08XOaY3OaU3bzWyiNoyyAC0=;
 b=cVp0woY10cor8ak17Vr3hudijR0e/pjIHurhdNeRghf9UglSqwRJL+vg
 ImtvE1Fn6hjf2gCOSVVyQqe/0FihVpPj0qAN24xN2mkM8FvbRBQ4jEaXr
 x8eEw6sRlgSq8Th6aB/YDgJAkFNOeJnzdqC0lXJy2ahAVogL+0W1Lb5/+ E=;
IronPort-SDR: +ky132fkU9oUO03TqJLj1tGr3dOcbjEJGz/yuZhaiubAMblrrSqJ8AAO2HYO7YvkeRYF1heu4w
 MtAmoN6m1s5A==
X-IronPort-AV: E=Sophos;i="5.69,296,1571702400"; 
   d="scan'208";a="8283041"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-9ec21598.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 09 Dec 2019 16:38:48 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-9ec21598.us-east-1.amazon.com (Postfix) with ESMTPS
 id 4B369A1A3C; Mon,  9 Dec 2019 16:38:46 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 16:38:46 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 16:38:45 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 9 Dec 2019 16:38:45 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH 3/4] xen/interface: don't discard pending work in
 FRONT/BACK_RING_ATTACH
Thread-Index: AQHVq3SEQ22T+F2O5E+9q5oO42T5TKex2ayAgAArEUA=
Date: Mon, 9 Dec 2019 16:38:45 +0000
Message-ID: <23a1e955fcaa4e948f5290a7252256fb@EX13D32EUC003.ant.amazon.com>
References: <20191205140123.3817-1-pdurrant@amazon.com>
 <20191205140123.3817-4-pdurrant@amazon.com>
 <8a42e7a2-e1aa-69ff-32a4-f43cc5df10d9@suse.com>
In-Reply-To: <8a42e7a2-e1aa-69ff-32a4-f43cc5df10d9@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.211]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 3/4] xen/interface: don't discard pending
 work in FRONT/BACK_RING_ATTACH
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKw7xyZ2VuIEdyb8OfIDxqZ3Jv
c3NAc3VzZS5jb20+DQo+IFNlbnQ6IDA5IERlY2VtYmVyIDIwMTkgMTM6NTUNCj4gVG86IER1cnJh
bnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jb20+OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnOw0KPiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gQ2M6IEJvcmlzIE9zdHJv
dnNreSA8Ym9yaXMub3N0cm92c2t5QG9yYWNsZS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkNCj4g
PHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggMy80XSB4ZW4v
aW50ZXJmYWNlOiBkb24ndCBkaXNjYXJkIHBlbmRpbmcgd29yayBpbg0KPiBGUk9OVC9CQUNLX1JJ
TkdfQVRUQUNIDQo+IA0KPiBPbiAwNS4xMi4xOSAxNTowMSwgUGF1bCBEdXJyYW50IHdyb3RlOg0K
PiA+IEN1cnJlbnRseSB0aGVzZSBtYWNyb3Mgd2lsbCBza2lwIG92ZXIgYW55IHJlcXVlc3RzL3Jl
c3BvbnNlcyB0aGF0IGFyZQ0KPiA+IGFkZGVkIHRvIHRoZSBzaGFyZWQgcmluZyB3aGlsc3QgaXQg
aXMgZGV0YWNoZWQuIFRoaXMsIGluIGdlbmVyYWwsIGlzIG5vdA0KPiA+IGEgZGVzaXJhYmxlIHNl
bWFudGljIHNpbmNlIG1vc3QgZnJvbnRlbmQgaW1wbGVtZW50YXRpb25zIHdpbGwgZXZlbnR1YWxs
eQ0KPiA+IGJsb2NrIHdhaXRpbmcgZm9yIGEgcmVzcG9uc2Ugd2hpY2ggd291bGQgZWl0aGVyIG5l
dmVyIGFwcGVhciBvciBuZXZlciBiZQ0KPiA+IHByb2Nlc3NlZC4NCj4gPg0KPiA+IE5PVEU6IFRo
ZXNlIG1hY3JvcyBhcmUgY3VycmVudGx5IHVudXNlZC4gQkFDS19SSU5HX0FUVEFDSCgpLCBob3dl
dmVyLA0KPiB3aWxsDQo+ID4gICAgICAgIGJlIHVzZWQgaW4gYSBzdWJzZXF1ZW50IHBhdGNoLg0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogUGF1bCBEdXJyYW50IDxwZHVycmFudEBhbWF6b24uY29t
Pg0KPiA+IC0tLQ0KPiA+IENjOiBCb3JpcyBPc3Ryb3Zza3kgPGJvcmlzLm9zdHJvdnNreUBvcmFj
bGUuY29tPg0KPiA+IENjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5jb20+DQo+ID4gQ2M6
IFN0ZWZhbm8gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4NCj4gPiAtLS0NCj4g
PiAgIGluY2x1ZGUveGVuL2ludGVyZmFjZS9pby9yaW5nLmggfCA0ICsrLS0NCj4gPiAgIDEgZmls
ZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS94ZW4vaW50ZXJmYWNlL2lvL3JpbmcuaA0KPiBiL2luY2x1ZGUveGVu
L2ludGVyZmFjZS9pby9yaW5nLmgNCj4gPiBpbmRleCAzZjQwNTAxZmM2MGIuLjQwNWFkZmVkODdl
NiAxMDA2NDQNCj4gPiAtLS0gYS9pbmNsdWRlL3hlbi9pbnRlcmZhY2UvaW8vcmluZy5oDQo+ID4g
KysrIGIvaW5jbHVkZS94ZW4vaW50ZXJmYWNlL2lvL3JpbmcuaA0KPiA+IEBAIC0xNDMsMTQgKzE0
MywxNCBAQCBzdHJ1Y3QgX19uYW1lIyNfYmFja19yaW5nIHsNCj4gCQlcDQo+ID4gICAjZGVmaW5l
IEZST05UX1JJTkdfQVRUQUNIKF9yLCBfcywgX19zaXplKSBkbyB7CQkJCVwNCj4gPiAgICAgICAo
X3IpLT5zcmluZyA9IChfcyk7CQkJCQkJCVwNCj4gPiAgICAgICAoX3IpLT5yZXFfcHJvZF9wdnQg
PSAoX3MpLT5yZXFfcHJvZDsJCQkJXA0KPiA+IC0gICAgKF9yKS0+cnNwX2NvbnMgPSAoX3MpLT5y
c3BfcHJvZDsJCQkJCVwNCj4gPiArICAgIChfciktPnJzcF9jb25zID0gKF9zKS0+cmVxX3Byb2Q7
CQkJCQlcDQo+ID4gICAgICAgKF9yKS0+bnJfZW50cyA9IF9fUklOR19TSVpFKF9zLCBfX3NpemUp
OwkJCQlcDQo+ID4gICB9IHdoaWxlICgwKQ0KPiA+DQo+ID4gICAjZGVmaW5lIEJBQ0tfUklOR19B
VFRBQ0goX3IsIF9zLCBfX3NpemUpIGRvIHsJCQkJXA0KPiA+ICAgICAgIChfciktPnNyaW5nID0g
KF9zKTsJCQkJCQkJXA0KPiA+ICAgICAgIChfciktPnJzcF9wcm9kX3B2dCA9IChfcyktPnJzcF9w
cm9kOwkJCQlcDQo+ID4gLSAgICAoX3IpLT5yZXFfY29ucyA9IChfcyktPnJlcV9wcm9kOwkJCQkJ
XA0KPiA+ICsgICAgKF9yKS0+cmVxX2NvbnMgPSAoX3MpLT5yc3BfcHJvZDsJCQkJCVwNCj4gPiAg
ICAgICAoX3IpLT5ucl9lbnRzID0gX19SSU5HX1NJWkUoX3MsIF9fc2l6ZSk7CQkJCVwNCj4gPiAg
IH0gd2hpbGUgKDApDQo+IA0KPiBMZXRzIGxvb2sgYXQgYWxsIHBvc3NpYmxlIHNjZW5hcmlvcyB3
aGVyZSBCQUNLX1JJTkdfQVRUQUNIKCkNCj4gbWlnaHQgaGFwcGVuOg0KPiANCj4gSW5pdGlhbGx5
IChhZnRlciBbRlJPTlR8QkFDS11fUklOR19JTklUKCksIGxlYXZpbmcgX3B2dCBhd2F5KToNCj4g
cmVxX3Byb2Q9MCwgcnNwX2NvbnM9MCwgcnNwX3Byb2Q9MCwgcmVxX2NvbnM9MA0KPiBVc2luZyBC
QUNLX1JJTkdfQVRUQUNIKCkgaXMgZmluZSAobm8gY2hhbmdlKQ0KPiANCj4gUmVxdWVzdCBxdWV1
ZWQ6DQo+IHJlcV9wcm9kPTEsIHJzcF9jb25zPTAsIHJzcF9wcm9kPTAsIHJlcV9jb25zPTANCj4g
VXNpbmcgQkFDS19SSU5HX0FUVEFDSCgpIGlzIGZpbmUgKG5vIGNoYW5nZSkNCj4gDQo+IGFuZCB0
YWtlbiBieSBiYWNrZW5kOg0KPiByZXFfcHJvZD0xLCByc3BfY29ucz0wLCByc3BfcHJvZD0wLCBy
ZXFfY29ucz0xDQo+IFVzaW5nIEJBQ0tfUklOR19BVFRBQ0goKSBpcyByZXNldHRpbmcgcmVxX2Nv
bnMgdG8gMCwgd2lsbCByZXN1bHQNCj4gaW4gcmVkb2luZyByZXF1ZXN0IChmb3IgYmxrIHRoaXMg
aXMgZmluZSwgb3RoZXIgZGV2aWNlcyBsaWtlIFNDU0kNCj4gdGFwZXMgd2lsbCBoYXZlIGlzc3Vl
cyB3aXRoIHRoYXQpLiBPbmUgcG9zc2libGUgc29sdXRpb24gd291bGQgYmUNCj4gdG8gZW5zdXJl
IGFsbCB0YWtlbiByZXF1ZXN0cyBhcmUgZWl0aGVyIHN0b3BwZWQgb3IgdGhlIHJlc3BvbnNlDQo+
IGlzIHF1ZXVlZCBhbHJlYWR5Lg0KDQpZZXMsIGl0IGlzIHRoZSBhc3N1bXB0aW9uIHRoYXQgYSBi
YWNrZW5kIHdpbGwgZHJhaW4gYW5kIGNvbXBsZXRlIGFueSByZXF1ZXN0cyBpdCBpcyBoYW5kbGlu
ZywgYnV0IGl0IHdpbGwgbm90IGRlYWwgd2l0aCBuZXcgb25lcyBiZWluZyBwb3N0ZWQgYnkgdGhl
IGZyb250ZW5kLiBUaGlzIGRvZXMgYXBwZWFyIHRvIGJlIHRoZSBjYXNlIGZvciBibGtiYWNrLg0K
DQo+IA0KPiBSZXNwb25zZSBxdWV1ZWQ6DQo+IHJlcV9wcm9kPTEsIHJzcF9jb25zPTAsIHJzcF9w
cm9kPTEsIHJlcV9jb25zPTENCj4gVXNpbmcgQkFDS19SSU5HX0FUVEFDSCgpIGlzIGZpbmUgKG5v
IGNoYW5nZSkNCj4gDQo+IFJlc3BvbnNlIHRha2VuOg0KPiByZXFfcHJvZD0xLCByc3BfY29ucz0x
LCByc3BfcHJvZD0xLCByZXFfY29ucz0xDQo+IFVzaW5nIEJBQ0tfUklOR19BVFRBQ0goKSBpcyBm
aW5lIChubyBjaGFuZ2UpDQo+IA0KPiBJbiBnZW5lcmFsIEkgYmVsaWV2ZSB0aGUgW0ZST05UfEJB
Q0tdX1JJTkdfQVRUQUNIKCkgbWFjcm9zIGFyZSBub3QNCj4gZmluZSB0byBiZSB1c2VkIGluIHRo
ZSBjdXJyZW50IHN0YXRlLCBhcyB0aGUgKl9wdnQgZmllbGRzIG5vcm1hbGx5IG5vdA0KPiBhY2Nl
c3NpYmxlIGJ5IHRoZSBvdGhlciBlbmQgYXJlIGluaXRpYWxpemVkIHVzaW5nIHRoZSAocG9zc2li
bHkNCj4gdW50cnVzdGVkKSB2YWx1ZXMgZnJvbSB0aGUgc2hhcmVkIHJpbmcuIFRoZXJlIG5lZWRz
IGF0IGxlYXN0IHRvIGJlIGENCj4gdGVzdCBmb3IgdGhlIHZhbHVlcyB0byBiZSBzYW5lLCBhbmQg
eW91ciBjaGFuZ2Ugc2hvdWxkIG5vdCByZXN1bHQgaW4gdGhlDQo+IHNhbWUgdmFsdWUgdG8gYmUg
cmVhZCB0d2ljZSwgYXMgaXQgY291bGQgaGF2ZSBjaGFuZ2VkIGluIGJldHdlZW4uDQoNCldoYXQg
dGVzdCB3b3VsZCB5b3UgYXBwbHkgdG8gc2FuaXRpemUgdGhlIHZhbHVlIG9mIHRoZSBwdnQgcG9p
bnRlcj8gQW5vdGhlciBvcHRpb24gd291bGQgYmUgdG8gaGF2ZSBhIGJhY2tlbmQgd3JpdGUgaXRz
IHB2dCB2YWx1ZSBpbnRvIHRoZSB4ZW5zdG9yZSBiYWNrZW5kIGFyZWEgd2hlbiB0aGUgcmluZyBp
cyB1bm1hcHBlZCwgc28gdGhhdCBhIG5ldyBpbnN0YW5jZSBkZWZpbml0ZWx5IHJlc3VtZXMgd2hl
cmUgdGhlIG9sZCBvbmUgbGVmdCBvZmYuIFRoZSB2YWx1ZSBvZiByc3BfcHJvZCBjb3VsZCwgb2Yg
Y291cnNlLCBiZSBvdmVyd3JpdHRlbiBieSB0aGUgZ3Vlc3QgYXQgYW55IHRpbWUgYW5kIHNvIHRo
ZXJlJ3MgbGl0dGxlIHBvaW50IGluIGF0dGVtcHRpbmcgc2FuaXRpemUgaXQuDQoNCj4gDQo+IEFz
IHRoaXMgaXMgYW4gZXJyb3Igd2hpY2ggY2FuIGhhcHBlbiBpbiBvdGhlciBPUydzLCB0b28sIEkn
ZCByZWNvbW1lbmQNCj4gdG8gYWRkIHRoZSBhZGFwdGVkIG1hY3JvcyAocGx1cyBhIGNvbW1lbnQg
cmVnYXJkaW5nIHRoZSBwb3NzaWJsZQ0KPiBwcm9ibGVtIG5vdGVkIGFib3ZlIGZvciBzcGVjaWFs
IGRldmljZXMgbGlrZSB0YXBlcykgdG8gdGhlIFhlbiB2YXJpYW50DQo+IG9mIHJpbmcuaC4NCj4g
DQoNCkkgY2FuIGNlcnRhaW5seSBzZW5kIGEgcGF0Y2ggdG8gWGVuIG9uY2Ugd2UgYWdyZWUgb24g
dGhlIGZpbmFsIGRlZmluaXRpb24uDQoNCiAgUGF1bA0KDQo+IA0KPiBKdWVyZ2VuDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
