Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1263120185
	for <lists+xen-devel@lfdr.de>; Mon, 16 Dec 2019 10:52:55 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ign1R-0005FR-6o; Mon, 16 Dec 2019 09:50:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=ILIH=2G=amazon.com=prvs=2465856dc=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ign1Q-0005FM-0X
 for xen-devel@lists.xenproject.org; Mon, 16 Dec 2019 09:50:36 +0000
X-Inumbo-ID: 7c945b9e-1fe9-11ea-a1e1-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7c945b9e-1fe9-11ea-a1e1-bc764e2007e4;
 Mon, 16 Dec 2019 09:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1576489828; x=1608025828;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lknJKdl5QBIx8wtJTIQ7PQWPrNbep8vgv0qGTNdioSE=;
 b=FqmivD6DCGKeL5tJwdZUozEY/mH8vv/MQoGfmLf084IyAox2eSpq4ThK
 N39tuQK9Lah5yRJVwb+Qezk9Pe9/inqRiTw5Ydmhufkem5Ge7yWHgVQOh
 3yDjWQ0Dt8EqUpbgnud+0v5Zyn8C5sa9dO9I5SQ6yfnHDC3mPJfC4bpCB 0=;
IronPort-SDR: 3MN4ymDH4mqSR51aZA/AV6hAgfmBzPUO8xb3UF4FlyYK8gA12I4Y55HJZzw84jo2b7BSJ+J2/l
 MZohKxyqMwHQ==
X-IronPort-AV: E=Sophos;i="5.69,321,1571702400"; d="scan'208";a="15096094"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-27fb8269.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 16 Dec 2019 09:50:16 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-27fb8269.us-east-1.amazon.com (Postfix) with ESMTPS
 id 66385A211F; Mon, 16 Dec 2019 09:50:13 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.82) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 16 Dec 2019 09:50:12 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 16 Dec 2019 09:50:08 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 16 Dec 2019 09:50:07 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: "Durrant, Paul" <pdurrant@amazon.com>, Julien Grall <julien@xen.org>, "Ian
 Jackson" <ian.jackson@citrix.com>
Thread-Topic: [Xen-devel] xen-block: race condition when stopping the device
 (WAS: Re: [xen-4.13-testing test] 144736: regressions - FAIL)
Thread-Index: AQHVs/Q4yStjcUnZ7U2NAaJzAHHBAae8g1VA
Date: Mon, 16 Dec 2019 09:50:07 +0000
Message-ID: <a757db30c7e247cfbf4ae930c4d3926d@EX13D32EUC003.ant.amazon.com>
References: <osstest-144736-mainreport@xen.org>
 <e05a3bc4-2c1d-7e71-af42-d6362c4f6d07@suse.com>
 <6ea2af3c-b277-1118-7c83-ebcb0809d449@xen.org>
 <24051.30893.31444.319978@mariner.uk.xensource.com>
 <7a0ef296-eb50-fbda-63e2-8d890fad5111@xen.org>
 <a65ae7dca64f4f718f116b9174893730@EX13D32EUC003.ant.amazon.com>
 <65df8a75-a658-1a14-6780-66c8706bcc80@xen.org>
 <e49691262df2450aa48522dc38f80657@EX13D32EUC003.ant.amazon.com>
In-Reply-To: <e49691262df2450aa48522dc38f80657@EX13D32EUC003.ant.amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.122]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] xen-block: race condition when stopping the device
 (WAS: Re: [xen-4.13-testing test] 144736: regressions - FAIL)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 osstest service owner <osstest-admin@xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YNCj4gRHVycmFudCwg
UGF1bA0KPiBTZW50OiAxNiBEZWNlbWJlciAyMDE5IDA5OjM0DQo+IFRvOiBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPjsgSWFuIEphY2tzb24gPGlhbi5qYWNrc29uQGNpdHJpeC5jb20+DQo+
IENjOiBKw7xyZ2VuIEdyb8OfIDxqZ3Jvc3NAc3VzZS5jb20+OyBTdGVmYW5vIFN0YWJlbGxpbmkN
Cj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBxZW11LWRldmVsQG5vbmdudS5vcmc7IG9zc3Rl
c3Qgc2VydmljZSBvd25lcg0KPiA8b3NzdGVzdC1hZG1pbkB4ZW5wcm9qZWN0Lm9yZz47IEFudGhv
bnkgUGVyYXJkDQo+IDxhbnRob255LnBlcmFyZEBjaXRyaXguY29tPjsgeGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnDQo+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSB4ZW4tYmxvY2s6IHJh
Y2UgY29uZGl0aW9uIHdoZW4gc3RvcHBpbmcgdGhlDQo+IGRldmljZSAoV0FTOiBSZTogW3hlbi00
LjEzLXRlc3RpbmcgdGVzdF0gMTQ0NzM2OiByZWdyZXNzaW9ucyAtIEZBSUwpDQo+IA0KPiA+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IFtzbmlwXQ0KPiA+ID4+DQo+ID4gPj4gVGhpcyBm
ZWVscyBsaWtlIGEgcmFjZSBjb25kaXRpb24gYmV0d2VlbiB0aGUgaW5pdC9mcmVlIGNvZGUgd2l0
aA0KPiA+ID4+IGhhbmRsZXIuIEFudGhvbnksIGRvZXMgaXQgcmluZyBhbnkgYmVsbD8NCj4gPiA+
Pg0KPiA+ID4NCj4gPiA+ICBGcm9tIHRoYXQgc3RhY2sgYnQgaXQgbG9va3MgbGlrZSBhbiBpb3Ro
cmVhZCBtYW5hZ2VkIHRvIHJ1biBhZnRlciB0aGUNCj4gPiBzcmluZyB3YXMgTlVMTGVkLiBUaGlz
IHNob3VsZCBub3QgYmUgYWJsZSBoYXBwZW4gYXMgdGhlIGRhdGFwbGFuZSBzaG91bGQNCj4gPiBo
YXZlIGJlZW4gbW92ZWQgYmFjayBvbnRvIFFFTVUncyBtYWluIHRocmVhZCBjb250ZXh0IGJlZm9y
ZSB0aGUgcmluZyBpcw0KPiA+IHVubWFwcGVkLg0KPiA+DQo+ID4gTXkga25vd2xlZGdlIG9mIHRo
aXMgY29kZSBpcyBmYWlybHkgbGltaXRlZCwgc28gY29ycmVjdCBtZSBpZiBJIGFtDQo+IHdyb25n
Lg0KPiA+DQo+ID4gYmxrX3NldF9haW9fY29udGV4dCgpIHdvdWxkIHNldCB0aGUgY29udGV4dCBm
b3IgdGhlIGJsb2NrIGFpby4gQUZBSUNULA0KPiA+IHRoZSBvbmx5IGFpbyBmb3IgdGhlIGJsb2Nr
IGlzIHhlbl9ibG9ja19jb21wbGV0ZV9haW8oKS4NCj4gDQo+IE5vdCBxdWl0ZS4geGVuX2Jsb2Nr
X2RhdGFwbGFuZV9zdGFydCgpIGNhbGxzDQo+IHhlbl9kZXZpY2VfYmluZF9ldmVudF9jaGFubmVs
KCkgYW5kIHRoYXQgd2lsbCBhZGQgYW4gZXZlbnQgY2hhbm5lbCBmZCBpbnRvDQo+IHRoZSBhaW8g
Y29udGV4dCwgc28gdGhlIHNoYXJlZCByaW5nIGlzIHBvbGxlZCBieSB0aGUgaW90aHJlYWQgYXMg
d2VsbCBhcw0KPiBibG9jayBpL28gY29tcGxldGlvbi4NCj4gDQo+ID4NCj4gPiBJbiB0aGUgc3Rh
Y2sgYWJvdmUsIHdlIGFyZSBub3QgZGVhbGluZyB3aXRoIGEgYmxvY2sgYWlvIGJ1dCBhbiBhaW8g
dGllDQo+ID4gdG8gdGhlIGV2ZW50IGNoYW5uZWwgKHNlZSB0aGUgY2FsbCBmcm9tIHhlbl9kZXZp
Y2VfcG9sbCkuIFNvIEkgZG9uJ3QNCj4gPiB0aGluayB0aGUgYmxrX3NldF9haW9fY29udGV4dCgp
IHdvdWxkIGFmZmVjdCB0aGUgYWlvLg0KPiA+DQo+IA0KPiBGb3IgdGhlIHJlYXNvbiBJIG91dGxp
bmUgYWJvdmUsIGl0IGRvZXMuDQo+IA0KPiA+IFNvIGl0IHdvdWxkIGJlIHBvc3NpYmxlIHRvIGdl
dCB0aGUgaW90aHJlYWQgcnVubmluZyBiZWNhdXNlIHdlIHJlY2VpdmVkDQo+ID4gYSBub3RpZmlj
YXRpb24gb24gdGhlIGV2ZW50IGNoYW5uZWwgd2hpbGUgd2UgYXJlIHN0b3BwaW5nIHRoZSBibG9j
ayAoaS5lDQo+ID4geGVuX2Jsb2NrX2RhdGFwbGFuZV9zdG9wKCkpLg0KPiA+DQo+IA0KPiBXZSBz
aG91bGQgYXNzdW1lIGFuIGlvdGhyZWFkIGNhbiBlc3NlbnRpYWxseSBydW4gYXQgYW55IHRpbWUs
IGFzIGl0IGlzIGENCj4gcG9sbGluZyBlbnRpdHkuIEl0IHNob3VsZCBldmVudHVhbGx5IGJsb2Nr
IHBvbGxpbmcgb24gZmRzIGFzc2lnbiB0byBpdHMNCj4gYWlvIGNvbnRleHQgYnV0IEkgZG9uJ3Qg
dGhpbmsgdGhlIGFic3RyYWN0aW9uIGd1YXJhbnRlZXMgdGhhdCBpdCBjYW5ub3QgYmUNCj4gYXdv
a2VuIGZvciBvdGhlciByZWFzb25zIChlLmcuIG9mZiBhIHRpbWVvdXQpLiBIb3dldmVyIGFuZCBl
dmVudCBmcm9tIHRoZQ0KPiBmcm9udGVuZCB3aWxsIGNlcnRhaW5seSBjYXVzZSB0aGUgZXZ0Y2hu
IGZkIHBvbGwgdG8gd2FrZSB1cC4NCj4gDQo+ID4gSWYgeGVuX2Jsb2NrX2RhdGFwbGFuZV9zdG9w
KCkgZ3JhYiB0aGUgY29udGV4dCBsb2NrIGZpcnN0LCB0aGVuIHRoZQ0KPiA+IGlvdGhyZWFkIGRl
YWxpbmcgd2l0aCB0aGUgZXZlbnQgbWF5IHdhaXQgb24gdGhlIGxvY2sgdW50aWwgaXRzIHJlbGVh
c2VkLg0KPiA+DQo+ID4gQnkgdGhlIHRpbWUgdGhlIGxvY2sgaXMgZ3JhYmJlZCwgd2UgbWF5IGhh
dmUgZnJlZSBhbGwgdGhlIHJlc291cmNlcw0KPiA+IChpbmNsdWRpbmcgc3JpbmdzKS4gU28gdGhl
IGV2ZW50IGlvdGhyZWFkIHdpbGwgZW5kIHVwIHRvIGRlcmVmZXJlbmNlIGENCj4gPiBOVUxMIHBv
aW50ZXIuDQo+ID4NCj4gDQo+IEkgdGhpbmsgdGhlIHByb2JsZW0gbWF5IGFjdHVhbGx5IGJlIHRo
YXQgeGVuX2Jsb2NrX2RhdGFwbGFuZV9ldmVudCgpIGRvZXMNCj4gbm90IGFjcXVpcmUgdGhlIGNv
bnRleHQgYW5kIHRodXMgaXMgbm90IHN5bmNocm9uaXplZCB3aXRoDQo+IHhlbl9ibG9ja19kYXRh
cGxhbmVfc3RvcCgpLiBUaGUgZG9jdW1lbnRhdGlvbiBpbiBtdWx0aXBsZS1pb3RocmVhZHMudHh0
IGlzDQo+IG5vdCBjbGVhciB3aGV0aGVyIGEgcG9sbCBoYW5kbGVyIGNhbGxlZCBieSBhbiBpb3Ro
cmVhZCBuZWVkcyB0byBhY3F1aXJlDQo+IHRoZSBjb250ZXh0IHRob3VnaDsgVEJIIEkgd291bGQg
bm90IGhhdmUgdGhvdWdodCBpdCBuZWNlc3NhcnkuDQo+IA0KPiA+IEl0IGZlZWxzIHRvIG1lIHdl
IG5lZWQgYSB3YXkgdG8gcXVpZXNjZSBhbGwgdGhlIGlvdGhyZWFkcyAoYmxrLA0KPiA+IGV2ZW50
LC4uLikgYmVmb3JlIGNvbnRpbnVpbmcuIEJ1dCBJIGFtIGEgYml0IHVuc3VyZSBob3cgdG8gZG8g
dGhpcyBpbg0KPiA+IFFFTVUuDQo+ID4NCj4gDQo+IExvb2tpbmcgYXQgdmlydGlvLWJsay5jIEkg
c2VlIHRoYXQgaXQgZG9lcyBzZWVtIHRvIGNsb3NlIG9mZiBpdHMgZXZ0Y2huDQo+IGVxdWl2YWxl
bnQgZnJvbSBpb3RocmVhZCBjb250ZXh0IHZpYSBhaW9fd2FpdF9iaF9vbmVzaG90KCkuIFNvIEkg
d29uZGVyDQo+IHdoZXRoZXIgdGhlICdyaWdodCcgdGhpbmcgdG8gZG8gaXMgdG8gY2FsbA0KPiB4
ZW5fZGV2aWNlX3VuYmluZF9ldmVudF9jaGFubmVsKCkgdXNpbmcgdGhlIHNhbWUgbWVjaGFuaXNt
IHRvIGVuc3VyZQ0KPiB4ZW5fYmxvY2tfZGF0YXBsYW5lX2V2ZW50KCkgY2FuJ3QgcmFjZS4NCg0K
RGlnZ2luZyBhcm91bmQgdGhlIHZpcnRpby1ibGsgaGlzdG9yeSBJIHNlZToNCg0KY29tbWl0IDEw
MTBjYWRmNjIzMzIwMTc2NDhhYmVlMGQ3YTNkYzdmMmVlZjk2MzINCkF1dGhvcjogU3RlZmFuIEhh
am5vY3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPg0KRGF0ZTogICBXZWQgTWFyIDcgMTQ6NDI6MDMg
MjAxOCArMDAwMA0KDQogICAgdmlydGlvLWJsazogZml4IHJhY2UgYmV0d2VlbiAuaW9ldmVudGZk
X3N0b3AoKSBhbmQgdnEgaGFuZGxlcg0KDQogICAgSWYgdGhlIG1haW4gbG9vcCB0aHJlYWQgaW52
b2tlcyAuaW9ldmVudGZkX3N0b3AoKSBqdXN0IGFzIHRoZSB2cSBoYW5kbGVyDQogICAgZnVuY3Rp
b24gYmVnaW5zIGluIHRoZSBJT1RocmVhZCB0aGVuIHRoZSBoYW5kbGVyIG1heSBsb3NlIHRoZSBy
YWNlIGZvcg0KICAgIHRoZSBBaW9Db250ZXh0IGxvY2suICBCeSB0aGUgdGltZSB0aGUgdnEgaGFu
ZGxlciBpcyBhYmxlIHRvIGFjcXVpcmUgdGhlDQogICAgQWlvQ29udGV4dCBsb2NrIHRoZSBpb2V2
ZW50ZmQgaGFzIGFscmVhZHkgYmVlbiByZW1vdmVkIGFuZCB0aGUgaGFuZGxlcg0KICAgIGlzbid0
IHN1cHBvc2VkIHRvIHJ1biBhbnltb3JlIQ0KDQogICAgVXNlIHRoZSBuZXcgYWlvX3dhaXRfYmhf
b25lc2hvdCgpIGZ1bmN0aW9uIHRvIHBlcmZvcm0gaW9ldmVudGZkIHJlbW92YWwNCiAgICBmcm9t
IHdpdGhpbiB0aGUgSU9UaHJlYWQuICBUaGlzIHdheSBubyByYWNlcyB3aXRoIHRoZSB2cSBoYW5k
bGVyIGFyZQ0KICAgIHBvc3NpYmxlLg0KDQogICAgU2lnbmVkLW9mZi1ieTogU3RlZmFuIEhham5v
Y3ppIDxzdGVmYW5oYUByZWRoYXQuY29tPg0KICAgIFJldmlld2VkLWJ5OiBGYW0gWmhlbmcgPGZh
bXpAcmVkaGF0LmNvbT4NCiAgICBBY2tlZC1ieTogUGFvbG8gQm9uemluaSA8cGJvbnppbmlAcmVk
aGF0LmNvbT4NCiAgICBNZXNzYWdlLWlkOiAyMDE4MDMwNzE0NDIwNS4yMDYxOS0zLXN0ZWZhbmhh
QHJlZGhhdC5jb20NCiAgICBTaWduZWQtb2ZmLWJ5OiBTdGVmYW4gSGFqbm9jemkgPHN0ZWZhbmhh
QHJlZGhhdC5jb20+DQoNCi4uLnNvIEkgdGhpbmsgeGVuLWJsb2NrIGhhcyBleGFjdGx5IHRoZSBz
YW1lIHByb2JsZW0uIEkgdGhpbmsgd2UgbWF5IGFsc28gYmUgbWlzc2luZyBhIHFlbXVfYmhfY2Fu
Y2VsKCkgdG8gbWFrZSBzdXJlIGJsb2NrIGFpbyBjb21wbGV0aW9ucyBhcmUgc3RvcHBlZC4gSSds
bCBwcmVwIGEgcGF0Y2guDQoNCiAgUGF1bA0KDQo+IA0KPiAgIFBhdWwNCj4gDQo+ID4gQ2hlZXJz
LA0KPiA+DQo+ID4gLS0NCj4gPiBKdWxpZW4gR3JhbGwNCj4gX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18NCj4gWGVuLWRldmVsIG1haWxpbmcgbGlzdA0KPiBY
ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxA
bGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL3hlbi1kZXZlbA==
