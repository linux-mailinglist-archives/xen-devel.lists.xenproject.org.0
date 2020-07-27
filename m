Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D3622E9A7
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jul 2020 11:58:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jzztX-0008P5-Ra; Mon, 27 Jul 2020 09:58:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TI7O=BG=amazon.co.uk=prvs=4708ece4a=pdurrant@srs-us1.protection.inumbo.net>)
 id 1jzztW-0008P0-AD
 for xen-devel@lists.xenproject.org; Mon, 27 Jul 2020 09:58:06 +0000
X-Inumbo-ID: aa475c1b-cfef-11ea-8a85-bc764e2007e4
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id aa475c1b-cfef-11ea-8a85-bc764e2007e4;
 Mon, 27 Jul 2020 09:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1595843885; x=1627379885;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=i8avPvn+qNyQlxziY57K/zKc+nExyx4EzSJ6b8bK/VU=;
 b=gNNgE1cYNU9clA0rtroi18AjTDTs0BB0xFPXAx17pcThaXLl27BD81fP
 iuGu240oU45W9t3+ywU8G4vl5IJnf3bR/lmAGQgM1JK6xNCFs9FkM93Yp
 8umsFNB17JNOBEcnzxpN487qzgo8K0m6KAHjK7DxcO3mrlV7Qe1qcsAiP E=;
IronPort-SDR: HuskNuZGOfO8CTCffv5/hpJSUIYqXDgVF6YfOKsC9GSr8FpM5PQOhZIRTmaPMw8hTGv5C7mi1z
 ZfLkmmg0QBWw==
X-IronPort-AV: E=Sophos;i="5.75,402,1589241600"; d="scan'208";a="45665271"
Subject: RE: [PATCH 3/6] iommu: remove iommu_lookup_page() and the
 lookup_page() method...
Thread-Topic: [PATCH 3/6] iommu: remove iommu_lookup_page() and the
 lookup_page() method...
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 27 Jul 2020 09:58:05 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com (Postfix) with ESMTPS
 id 7CF0FA239C; Mon, 27 Jul 2020 09:58:04 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 27 Jul 2020 09:58:04 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 27 Jul 2020 09:58:03 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Mon, 27 Jul 2020 09:58:03 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, "paul@xen.org" <paul@xen.org>
Thread-Index: AQJEvXWV1fglpFS8p501Sb8VALJosQFSVPHsAgBGpZcCc8dadQJMAgC7p/3ofVA=
Date: Mon, 27 Jul 2020 09:58:03 +0000
Message-ID: <35f4099b80b34a20b2d8d86faf990733@EX13D32EUC003.ant.amazon.com>
References: <20200724164619.1245-1-paul@xen.org>
 <20200724164619.1245-4-paul@xen.org>
 <c47710e1-fcb6-3b5d-ff6a-d237a4149b3b@citrix.com>
 <000101d661eb$c68a75a0$539f60e0$@xen.org>
 <35260401-fd2b-2eba-6e9b-a274cb8c057b@suse.com>
In-Reply-To: <35260401-fd2b-2eba-6e9b-a274cb8c057b@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.155]
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
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Kevin
 Tian' <kevin.tian@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI2IEp1bHkgMjAyMCAwOToyOA0KPiBUbzogcGF1bEB4ZW4u
b3JnDQo+IENjOiAnQW5kcmV3IENvb3BlcicgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyB4
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IER1cnJhbnQsIFBhdWwNCj4gPHBkdXJyYW50
QGFtYXpvbi5jby51az47ICdLZXZpbiBUaWFuJyA8a2V2aW4udGlhbkBpbnRlbC5jb20+DQo+IFN1
YmplY3Q6IFJFOiBbRVhURVJOQUxdIFtQQVRDSCAzLzZdIGlvbW11OiByZW1vdmUgaW9tbXVfbG9v
a3VwX3BhZ2UoKSBhbmQgdGhlIGxvb2t1cF9wYWdlKCkgbWV0aG9kLi4uDQo+IA0KPiBDQVVUSU9O
OiBUaGlzIGVtYWlsIG9yaWdpbmF0ZWQgZnJvbSBvdXRzaWRlIG9mIHRoZSBvcmdhbml6YXRpb24u
IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuDQo+IGF0dGFjaG1lbnRzIHVubGVzcyB5b3UgY2Fu
IGNvbmZpcm0gdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KPiANCj4g
DQo+IA0KPiBPbiAyNC4wNy4yMDIwIDIwOjUzLCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+ID4+IEZy
b206IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+DQo+ID4+IFNlbnQ6
IDI0IEp1bHkgMjAyMCAxOTozOQ0KPiA+Pg0KPiA+PiBPbiAyNC8wNy8yMDIwIDE3OjQ2LCBQYXVs
IER1cnJhbnQgd3JvdGU6DQo+ID4+PiBGcm9tOiBQYXVsIER1cnJhbnQgPHBkdXJyYW50QGFtYXpv
bi5jb20+DQo+ID4+Pg0KPiA+Pj4gLi4uIGZyb20gaW9tbXVfb3BzLg0KPiA+Pj4NCj4gPj4+IFRo
aXMgcGF0Y2ggaXMgZXNzZW50aWFsbHkgYSByZXZlcnNpb24gb2YgZGQ5M2Q1NGYgInZ0ZDogYWRk
IGxvb2t1cF9wYWdlIG1ldGhvZA0KPiA+Pj4gdG8gaW9tbXVfb3BzIi4gVGhlIGNvZGUgd2FzIGlu
dGVuZGVkIHRvIGJlIHVzZWQgYnkgYSBwYXRjaCB0aGF0IGhhcyBsb25nLQ0KPiA+Pj4gc2luY2Ug
YmVlbiBhYmFuZG9uZWQuIFRoZXJlZm9yZSBpdCBpcyBkZWFkIGNvZGUgYW5kIGNhbiBiZSByZW1v
dmVkLg0KPiA+Pg0KPiA+PiBBbmQgYnkgdGhpcywgeW91IG1lYW4gdGhlIHdvcmsgdGhhdCB5b3Ug
b25seSBwYXJ0aWFsIHVuc3RyZWFtZWQsIHdpdGgNCj4gPj4gdGhlIHJlbWFpbmRlciBvZiB0aGUg
ZmVhdHVyZSBzdGlsbCB2ZXJ5IG11Y2ggaW4gdXNlIGJ5IFhlblNlcnZlcj8NCj4gPj4NCj4gPg0K
PiA+IEkgdGhvdWdodCB3ZSBiYXNpY2FsbHkgZGVjaWRlZCB0byBiaW4gdGhlIG9yaWdpbmFsIFBW
IElPTU1VIGlkZWEgdGhvdWdoPw0KPiANCj4gRGlkIHdlPyBJdCdzIHRoZSBmaXJzdCB0aW1lIEkg
aGVhciBvZiBpdCwgSSB0aGluay4NCj4gDQoNCkkgY2lyY3VsYXRlZCBhIGRvYy4gYWdlcyBhZ28s
IHdoaWxlIEkgd2FzIHN0aWxsIGF0IENpdHJpeDogaHR0cHM6Ly9kb2NzLmdvb2dsZS5jb20vZG9j
dW1lbnQvZC8xMi16NkpENDFKX29OckNnX2MweUF4R1dnNUFEQlE4X2JTaVBfTkg2SHF3by9lZGl0
P3VzcD1zaGFyaW5nDQoNCkluIHRoZXJlIEkgcHJvcG9zZSB0aGF0IHdlIGRvbid0IGZvbGxvdyB0
aGUgb3JpZ2luYWwgaWRlYSBvZiBrZWVwaW5nIGEgc2luZ2xlIHNldCBvZiBwZXItZG9tYWluIHRh
YmxlcyBidXQgaW5zdGVhZCBoYXZlIGEgc2V0IG9mIHRhYmxlcyAob3IgSU9NTVUgY29udGV4dHMp
IGZvciBncm91cHMgb2YgZGV2aWNlcy4gJ0NvbnRleHQgMCcgaXMgdGhlIGN1cnJlbnQgc2V0IG9m
IHN0YXRpYyAxOjEgdGFibGVzIGJ1dCBvdGhlciBjb250ZXh0cyBhcmUgbWFuaXB1bGF0ZWQgYnkg
aHlwZXJjYWxsIHNvLCBpbiB0aGlzIHBsYW4sIEkgZG9uJ3QgZW52aXNhZ2UgdGhlIG5lZWQgdG8g
bG9vayB1cCBtYXBwaW5ncyBpbiB0aGUgdGFibGVzIGluIHRoaXMgd2F5Li4uIGJ1dCBJIGd1ZXNz
IEkgY2FuJ3QgcnVsZSBpdCBvdXQuDQoNCiBQYXVsIA0KDQo=

