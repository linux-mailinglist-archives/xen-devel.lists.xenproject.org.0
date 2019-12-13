Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E55C011E6B4
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2019 16:37:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ifmx4-0002st-NU; Fri, 13 Dec 2019 15:33:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=8pyZ=2D=amazon.com=prvs=24328bf02=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ifmx3-0002sk-2V
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2019 15:33:57 +0000
X-Inumbo-ID: f508f1d0-1dbd-11ea-b6f1-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f508f1d0-1dbd-11ea-b6f1-bc764e2007e4;
 Fri, 13 Dec 2019 15:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576251228; x=1607787228;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6gOpEB+J74FeaYfkU3dpq/1B5sQRZUUrAvAagG19Nqg=;
 b=oFj84BRNJhIrdgtVQB3YWSL+wvcr+K2amPziLuwaVw0VG7LUVDDMJP9r
 +cdyFOWMDXYC9oNRY7AdO0N7gENq+4XWYMfR/3J+pGho4eeJJNBZR1XOL
 qpDboqzgu+0za3L/feQXFIH2CCQ4ppU+wk6daSvgp7Vpvxsi+nN6hfScF A=;
IronPort-SDR: VFyMQywmkTBDNnX3FPrEJV7St7OaiMhYa8xZi78JTxRC6aGSys0E3yX+MLtmFUUIYu1cDm0H0F
 4WvCDStfrvzQ==
X-IronPort-AV: E=Sophos;i="5.69,309,1571702400"; 
   d="scan'208";a="8965670"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-5bdc5131.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 13 Dec 2019 15:33:47 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2b-5bdc5131.us-west-2.amazon.com (Postfix) with ESMTPS
 id F28DAA1CB5; Fri, 13 Dec 2019 15:33:46 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 13 Dec 2019 15:33:46 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 13 Dec 2019 15:33:45 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 13 Dec 2019 15:33:45 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH] public/io/netif.h: document a mechanism to advertise
 carrier state
Thread-Index: AQHVsbWxxnT/OROzMkWhaLrTzZMz8qe4HJmAgAAVLnA=
Date: Fri, 13 Dec 2019 15:33:45 +0000
Message-ID: <05d0405670a14bde8f8fb2123b234b36@EX13D32EUC003.ant.amazon.com>
References: <20191213130316.21085-1-pdurrant@amazon.com>
 <3996087c-3b8c-f7f5-8f93-d2ec85e68b89@suse.com>
In-Reply-To: <3996087c-3b8c-f7f5-8f93-d2ec85e68b89@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.122]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH] public/io/netif.h: document a mechanism to
 advertise carrier state
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKw7xyZ2VuIEdyb8OfIDxqZ3Jv
c3NAc3VzZS5jb20+DQo+IFNlbnQ6IDEzIERlY2VtYmVyIDIwMTkgMTQ6MTcNCj4gVG86IER1cnJh
bnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jb20+OyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcNCj4gQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNv
bT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gcHVibGljL2lvL25ldGlmLmg6IGRvY3VtZW50IGEg
bWVjaGFuaXNtIHRvIGFkdmVydGlzZQ0KPiBjYXJyaWVyIHN0YXRlDQo+IA0KPiBPbiAxMy4xMi4x
OSAxNDowMywgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+IFRoaXMgcGF0Y2ggYWRkcyBhIHNwZWNp
ZmljYXRpb24gZm9yIGEgJ2NhcnJpZXInIG5vZGUgaW4geGVuc3RvcmUgdG8NCj4gYWxsb3cNCj4g
PiBhIGJhY2tlbmQgdG8gbm90aWZ5IGEgZnJvbnRlbmQgb2YgaXQncyB2aXJ0dWFsIGNhcnJpZXIv
bGluayBzdGF0ZS4gRS5nLg0KPiA+IGEgYmFja2VuZCB0aGF0IGlzIHVuYWJsZSB0byBmb3J3YXJk
IHBhY2tldHMgZnJvbSB0aGUgZ3Vlc3QgYmVjYXVzZSBpdCBpcw0KPiA+IG5vdCBhdHRhY2hlZCB0
byBhIGJyaWRnZSBtYXkgd2lzaCB0byBhZHZlcnRpc2UgJ25vIGNhcnJpZXInLg0KPiA+DQo+ID4g
Tk9URTogVGhpcyBpcyBwdXJlbHkgYSBkb2N1bWVudGF0aW9uIHBhdGNoLiBObyBmdW5jdGlvbmFs
IGNoYW5nZS4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFudCA8cGR1cnJhbnRA
YW1hem9uLmNvbT4NCj4gPiAtLS0NCj4gPiBDYzogS29ucmFkIFJ6ZXN6dXRlayBXaWxrIDxrb25y
YWQud2lsa0BvcmFjbGUuY29tPg0KPiA+IENjOiBKdWVyZ2VuIEdyb3NzIDxqZ3Jvc3NAc3VzZS5j
b20+DQo+ID4gLS0tDQo+ID4gICB4ZW4vaW5jbHVkZS9wdWJsaWMvaW8vbmV0aWYuaCB8IDE0ICsr
KysrKysrKysrKysrDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQ0KPiA+
DQo+ID4gZGlmZiAtLWdpdCBhL3hlbi9pbmNsdWRlL3B1YmxpYy9pby9uZXRpZi5oDQo+IGIveGVu
L2luY2x1ZGUvcHVibGljL2lvL25ldGlmLmgNCj4gPiBpbmRleCAyNDU0NDQ4YmFhLi5lNTg3MDU1
ZjY4IDEwMDY0NA0KPiA+IC0tLSBhL3hlbi9pbmNsdWRlL3B1YmxpYy9pby9uZXRpZi5oDQo+ID4g
KysrIGIveGVuL2luY2x1ZGUvcHVibGljL2lvL25ldGlmLmgNCj4gPiBAQCAtMTkwLDYgKzE5MCwy
MCBAQA0KPiA+ICAgICogb3JkZXIgYXMgcmVxdWVzdHMuDQo+ID4gICAgKi8NCj4gPg0KPiA+ICsv
Kg0KPiA+ICsgKiBMaW5rIHN0YXRlDQo+ID4gKyAqID09PT09PT09PT0NCj4gPiArICoNCj4gPiAr
ICogVGhlIGJhY2tlbmQgY2FuIGFkdmVydGlzZSBpdCBpcyBjdXJyZW50IGxpbmsgKGNhcnJpZXIp
IHN0YXRlIHRvIHRoZQ0KPiANCj4gcy9pdCBpcy9pdHMvID8NCj4gDQoNCk9oIHllcy4NCg0KPiA+
ICsgKiBmcm9udGVuZCB1c2luZyB0aGUgL2xvY2FsL2RvbWFpbi9YL2JhY2tlbmQvPGRvbWlkPi88
dmlmPi9jYXJyaWVyDQo+IG5vZGUuDQo+IA0KPiBIbW0sIEkganVzdCByZWFsaXplZCB0aGF0IHRo
ZSBvdGhlciBtZW50aW9uZWQgYmFja2VuZCBwYXRoIGluIHRoaXMgZmlsZQ0KPiBpcyB3cm9uZywg
aXQgc2hvdWxkIGJlOiAvbG9jYWwvZG9tYWluL1gvYmFja2VuZC92aWYvPGRvbWlkPi88dmlmPi8u
Li4NCj4gDQo+IE1pbmQgY29ycmVjdGluZyB0aGF0IGluIHlvdXIgcGF0Y2gsIHRvbz8NCj4gDQoN
ClN1cmUuDQoNCiAgUGF1bA0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
