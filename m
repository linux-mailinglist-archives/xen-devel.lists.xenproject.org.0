Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19261116EE5
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 15:25:30 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieJwg-0008Bu-Vk; Mon, 09 Dec 2019 14:23:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BuSh=Z7=amazon.com=prvs=2393b02c0=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ieJwf-0008Bp-M7
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 14:23:29 +0000
X-Inumbo-ID: 782aa824-1a8f-11ea-87e3-12813bfff9fa
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 782aa824-1a8f-11ea-87e3-12813bfff9fa;
 Mon, 09 Dec 2019 14:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575901409; x=1607437409;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yC7RtTqpzljL0plev7LbEwemCbQXzkF9oOp8/mzR6tQ=;
 b=UPwnWHPe5RbJ5YZN+DdSsyms2bep7fDAJG1Y1iGh4iFOp95U5Us7KtFg
 gjGZjbgCE4sLxYeFyGnl4K7qYoaVsKj5brir1gJglTfDKueGwDpPzqRRt
 0ucOCxfcrX+IdOeE9KNMEdlSPz4HQ/QxnZ+apxIQt+F0VzBGvLuj+jBL/ U=;
IronPort-SDR: TQefqo2jYvovd/dWUkJjd26RhHABL1VmNxac/kOkgjxr+Tne3MW+P9+m1lJls+opd9WKwWpvRn
 4ux1lzpu3XNA==
X-IronPort-AV: E=Sophos;i="5.69,294,1571702400"; 
   d="scan'208";a="6817377"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 09 Dec 2019 14:23:27 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2b-4e24fd92.us-west-2.amazon.com (Postfix) with ESMTPS
 id 891D7A0519; Mon,  9 Dec 2019 14:23:26 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 14:23:25 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 14:23:25 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 9 Dec 2019 14:23:24 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [Xen-devel] [PATCH 2/4] xenbus: limit when state is forced to
 closed
Thread-Index: AQHVq3SCoU35oX1INEGjFwMD1PQM5aexs7UAgAAEWoCAAAHxUIAAAeGAgAAAtoCAABhzAIAABs0QgAAB3ACAAAKyUA==
Date: Mon, 9 Dec 2019 14:23:24 +0000
Message-ID: <380d160eb06c45e5962fe85aedd79ed5@EX13D32EUC003.ant.amazon.com>
References: <20191205140123.3817-1-pdurrant@amazon.com>
 <20191205140123.3817-3-pdurrant@amazon.com>
 <20191209113926.GS980@Air-de-Roger>
 <b8a138ad-5770-65fa-f368-f7b4063702fa@suse.com>
 <3412e42d13224b6786613e58dc189ebf@EX13D32EUC003.ant.amazon.com>
 <8d66e520-3009-cde1-e24c-26d7476e5873@suse.com>
 <63d653a04207451e9041c89acd04f2a2@EX13D32EUC003.ant.amazon.com>
 <2cd2a27e-2bb8-bd9d-45d8-1710038fb97a@suse.com>
 <c86eadaf008f48aeb4bb7140a80b69e6@EX13D32EUC003.ant.amazon.com>
 <1c4c9b3e-31a5-d8b3-01de-3ad84db6390a@suse.com>
In-Reply-To: <1c4c9b3e-31a5-d8b3-01de-3ad84db6390a@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.211]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH 2/4] xenbus: limit when state is forced to
 closed
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
c3NAc3VzZS5jb20+DQo+IFNlbnQ6IDA5IERlY2VtYmVyIDIwMTkgMTQ6MTANCj4gVG86IER1cnJh
bnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jb20+OyBSb2dlciBQYXUgTW9ubsOpDQo+IDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4NCj4gQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IHhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgU3RlZmFubw0KPiBTdGFiZWxsaW5pIDxzc3Rh
YmVsbGluaUBrZXJuZWwub3JnPjsgQm9yaXMgT3N0cm92c2t5DQo+IDxib3Jpcy5vc3Ryb3Zza3lA
b3JhY2xlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCAyLzRdIHhlbmJ1
czogbGltaXQgd2hlbiBzdGF0ZSBpcyBmb3JjZWQgdG8NCj4gY2xvc2VkDQo+IA0KPiBPbiAwOS4x
Mi4xOSAxNTowNiwgRHVycmFudCwgUGF1bCB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gPj4gRnJvbTogSsO8cmdlbiBHcm/DnyA8amdyb3NzQHN1c2UuY29tPg0KPiA+
PiBTZW50OiAwOSBEZWNlbWJlciAyMDE5IDEzOjM5DQo+ID4+IFRvOiBEdXJyYW50LCBQYXVsIDxw
ZHVycmFudEBhbWF6b24uY29tPjsgUm9nZXIgUGF1IE1vbm7DqQ0KPiA+PiA8cm9nZXIucGF1QGNp
dHJpeC5jb20+DQo+ID4+IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyB4ZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7DQo+IFN0ZWZhbm8NCj4gPj4gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz47IEJvcmlzIE9zdHJvdnNreQ0KPiA+PiA8Ym9yaXMub3N0cm92
c2t5QG9yYWNsZS5jb20+DQo+ID4+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggMi80
XSB4ZW5idXM6IGxpbWl0IHdoZW4gc3RhdGUgaXMgZm9yY2VkDQo+IHRvDQo+ID4+IGNsb3NlZA0K
PiA+Pg0KPiA+PiBPbiAwOS4xMi4xOSAxMzoxOSwgRHVycmFudCwgUGF1bCB3cm90ZToNCj4gPj4+
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+IEZyb206IErDvHJnZW4gR3Jvw58g
PGpncm9zc0BzdXNlLmNvbT4NCj4gPj4+PiBTZW50OiAwOSBEZWNlbWJlciAyMDE5IDEyOjA5DQo+
ID4+Pj4gVG86IER1cnJhbnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jb20+OyBSb2dlciBQYXUg
TW9ubsOpDQo+ID4+Pj4gPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiA+Pj4+IENjOiBsaW51eC1r
ZXJuZWxAdmdlci5rZXJuZWwub3JnOyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7DQo+
ID4+IFN0ZWZhbm8NCj4gPj4+PiBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPjsg
Qm9yaXMgT3N0cm92c2t5DQo+ID4+Pj4gPGJvcmlzLm9zdHJvdnNreUBvcmFjbGUuY29tPg0KPiA+
Pj4+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggMi80XSB4ZW5idXM6IGxpbWl0IHdo
ZW4gc3RhdGUgaXMNCj4gZm9yY2VkDQo+ID4+IHRvDQo+ID4+Pj4gY2xvc2VkDQo+ID4+Pj4NCj4g
Pj4+PiBPbiAwOS4xMi4xOSAxMzowMywgRHVycmFudCwgUGF1bCB3cm90ZToNCj4gPj4+Pj4+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4+Pj4+PiBGcm9tOiBKw7xyZ2VuIEdyb8OfIDxq
Z3Jvc3NAc3VzZS5jb20+DQo+ID4+Pj4+PiBTZW50OiAwOSBEZWNlbWJlciAyMDE5IDExOjU1DQo+
ID4+Pj4+PiBUbzogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+OyBEdXJy
YW50LCBQYXVsDQo+ID4+Pj4+PiA8cGR1cnJhbnRAYW1hem9uLmNvbT4NCj4gPj4+Pj4+IENjOiBs
aW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5v
cmc7DQo+ID4+Pj4gU3RlZmFubw0KPiA+Pj4+Pj4gU3RhYmVsbGluaSA8c3N0YWJlbGxpbmlAa2Vy
bmVsLm9yZz47IEJvcmlzIE9zdHJvdnNreQ0KPiA+Pj4+Pj4gPGJvcmlzLm9zdHJvdnNreUBvcmFj
bGUuY29tPg0KPiA+Pj4+Pj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCAyLzRdIHhl
bmJ1czogbGltaXQgd2hlbiBzdGF0ZSBpcw0KPiA+PiBmb3JjZWQNCj4gPj4+PiB0bw0KPiA+Pj4+
Pj4gY2xvc2VkDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gT24gMDkuMTIuMTkgMTI6MzksIFJvZ2VyIFBh
dSBNb25uw6kgd3JvdGU6DQo+ID4+Pj4+Pj4gT24gVGh1LCBEZWMgMDUsIDIwMTkgYXQgMDI6MDE6
MjFQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdyb3RlOg0KPiA+Pj4+Pj4+PiBPbmx5IGZvcmNlIHN0
YXRlIHRvIGNsb3NlZCBpbiB0aGUgY2FzZSB3aGVuIHRoZSB0b29sc3RhY2sgbWF5DQo+IG5lZWQN
Cj4gPj4gdG8NCj4gPj4+Pj4+Pj4gY2xlYW4gdXAuIFRoaXMgY2FuIGJlIGRldGVjdGVkIGJ5IGNo
ZWNraW5nIHdoZXRoZXIgdGhlIHN0YXRlIGluDQo+ID4+Pj4+PiB4ZW5zdG9yZQ0KPiA+Pj4+Pj4+
PiBoYXMgYmVlbiBzZXQgdG8gY2xvc2luZyBwcmlvciB0byBkZXZpY2UgcmVtb3ZhbC4NCj4gPj4+
Pj4+Pg0KPiA+Pj4+Pj4+IEknbSBub3Qgc3VyZSBJIHNlZSB0aGUgcG9pbnQgb2YgdGhpcywgSSB3
b3VsZCBleHBlY3QgdGhhdCBhDQo+IGZhaWx1cmUNCj4gPj4gdG8NCj4gPj4+Pj4+PiBwcm9iZSBv
ciB0aGUgcmVtb3ZhbCBvZiB0aGUgZGV2aWNlIHdvdWxkIGxlYXZlIHRoZSB4ZW5idXMgc3RhdGUg
YXMNCj4gPj4+Pj4+PiBjbG9zZWQsIHdoaWNoIGlzIGNvbnNpc3RlbnQgd2l0aCB0aGUgYWN0dWFs
IGRyaXZlciBzdGF0ZS4NCj4gPj4+Pj4+Pg0KPiA+Pj4+Pj4+IENhbiB5b3UgZXhwbGFpbiB3aGF0
J3MgdGhlIGJlbmVmaXQgb2YgbGVhdmluZyBhIGRldmljZSB3aXRob3V0IGENCj4gPj4+Pj4+PiBk
cml2ZXIgaW4gc3VjaCB1bmtub3duIHN0YXRlPw0KPiA+Pj4+Pj4NCj4gPj4+Pj4+IEFuZCBtb3Jl
IGNvbmNlcm5pbmc6IGRpZCB5b3UgY2hlY2sgdGhhdCBubyBmcm9udGVuZC9iYWNrZW5kIGlzDQo+
ID4+Pj4+PiByZWx5aW5nIG9uIHRoZSBjbG9zZWQgc3RhdGUgdG8gYmUgdmlzaWJsZSB3aXRob3V0
IGNsb3NpbmcgaGF2aW5nDQo+IGJlZW4NCj4gPj4+Pj4+IHNldCBiZWZvcmU/DQo+ID4+Pj4+DQo+
ID4+Pj4+IEJsa2Zyb250IGRvZXNuJ3Qgc2VlbSB0byBtaW5kIGFuZCBJIGJlbGlldmUgdGhlIFdp
bmRvd3MgUFYgZHJpdmVycw0KPiA+PiBjb3BlLA0KPiA+Pj4+IGJ1dCBJIGRvbid0IHJlYWxseSB1
bmRlcnN0YW5kIHRoZSBjb21tZW50IHNpbmNlIHRoaXMgcGF0Y2ggaXMNCj4gYWN0dWFsbHkNCj4g
Pj4+PiByZW1vdmluZyBhIGNhc2Ugd2hlcmUgdGhlIGJhY2tlbmQgdHJhbnNpdGlvbnMgZGlyZWN0
bHkgdG8gY2xvc2VkLg0KPiA+Pj4+DQo+ID4+Pj4gSSdtIG5vdCBzcGVha2luZyBvZiBibGtmcm9u
dC9ibGtiYWNrIG9ubHksIGJ1dCBvZiBuZXQsIHRwbSwgc2NzaSwNCj4gPj4gcHZjYWxsDQo+ID4+
Pj4gZXRjLiBmcm9udGVuZHMvYmFja2VuZHMuIEFmdGVyIGFsbCB5b3UgYXJlIG1vZGlmeWluZyBh
IGZ1bmN0aW9uDQo+IGNvbW1vbg0KPiA+Pj4+IHRvIGFsbCBQViBkcml2ZXIgcGFpcnMuDQo+ID4+
Pj4NCj4gPj4+PiBZb3UgYXJlIHJlbW92aW5nIGEgc3RhdGUgc3dpdGMgdG8gImNsb3NlZCIgaW4g
Y2FzZSB0aGUgc3RhdGUgd2FzDQo+IF9ub3RfDQo+ID4+Pj4gImNsb3NpbmciIGJlZm9yZS4NCj4g
Pj4+DQo+ID4+PiBZZXMsIHdoaWNoIEFGQUlLIGlzIGFnYWluc3QgdGhlIGludGVudGlvbiBvZiB0
aGUgZ2VuZXJpYyBQViBwcm90b2NvbA0KPiA+PiBzdWNoIHRoYXQgaXQgZXZlciBleGlzdGVkIGFu
eXdheS4NCj4gPj4NCj4gPj4gV2hpbGUgdGhpcyBtaWdodCBiZSB0aGUgY2FzZSB3ZSBzaG91bGQg
X25vdF8gYnJlYWsgYW55IGd1ZXN0cw0KPiA+PiBydW5uaW5nIG5vdy4gU28gdGhpcyBraW5kIG9m
IHJlYXNvbmluZyBpcyBkYW5nZXJvdXMuDQo+ID4+DQo+ID4+Pg0KPiA+Pj4+IFNvIGFueSBQViBk
cml2ZXIgcmVhY3RpbmcgdG8gImNsb3NlZCIgb2YgdGhlIG90aGVyIGVuZA0KPiA+Pj4+IGluIGNh
c2UgdGhlIHByZXZpb3VzIHN0YXRlIG1pZ2h0IG5vdCBoYXZlIGJlZW4gImNsb3NpbmciIGJlZm9y
ZSBpcyBhdA0KPiA+Pj4+IHJpc2sgdG8gbWlzYmVoYXZlIHdpdGggeW91ciBwYXRjaC4NCj4gPj4+
DQo+ID4+PiBXZWxsLCB0aGV5IHdpbGwgc2VlIG5vdGhpbmcgbm93LiBJZiB0aGUgc3RhdGUgd2Fz
IG5vdCBjbG9zaW5nLCBpdCBnZXRzDQo+ID4+IGxlZnQgYWxvbmUsIHNvIHRoZSBmcm9udGVuZCBz
aG91bGRuJ3QgZG8gYW55dGhpbmcuIFRoZSBvbmx5IHJpc2sgdGhhdCBJDQo+ID4+IGNhbiBzZWUg
aXMgdGhhdCBzb21lIGZyb250ZW5kL2JhY2tlbmQgcGFpciBuZWVkZWQgYSBkaXJlY3QgNCAtPiA2
DQo+ID4+IHRyYW5zaXRpb24gdG8gc3VwcG9ydCAndW5iaW5kJyBiZWZvcmUgYnV0IEFGQUlLIG5v
dGhpbmcgaGFzIGV2ZXINCj4gc3VwcG9ydGVkDQo+ID4+IHRoYXQsIGFuZCBibGsgYW5kIG5ldCBj
cmFzaCduJ2J1cm4gaWYgeW91IHRyeSB0aGF0IG9uIHVwc3RyZWFtIGFzIGl0DQo+ID4+IHN0YW5k
cy4gQSBjbGVhbiB1bnBsdWcgd291bGQgYWx3YXlzIHNldCBzdGF0ZSB0byA1IGZpcnN0LCBzaW5j
ZSB0aGF0J3MNCj4gPj4gcGFydCBvZiB0aGUgdW5wbHVnIHByb3RvY29sLg0KPiA+Pg0KPiA+PiBU
aGF0IHdhcyBteSBxdWVzdGlvbjogYXJlIHlvdSBzdXJlIGFsbCBjdXJyZW50IGFuZCBwcmV2aW91
cw0KPiA+PiBndWVzdCBmcm9udGVuZHMgYW5kIGJhY2tlbmRzIGFyZSBoYW5kbGluZyB1bnBsdWcg
dGhpcyB3YXk/DQo+ID4+DQo+ID4+IE5vdCAic2hvdWxkIGhhbmRsZSIsIGJ1dCAiZG8gaGFuZGxl
Ii4NCj4gPg0KPiA+IFRoYXQgZGVwZW5kcyBvbiB0aGUgdG9vbHN0YWNrLiBJSVVDIHRoZSBvbmx5
ICdzdXBwb3J0ZWQnIHRvb2xzdGFjayBpcw0KPiB4bC9saWJ4bCwgd2hpY2ggd2lsbCBzZXQgJ3N0
YXRlJyB0byA1IGFuZCAnb25saW5lJyB0byAwIHRvIGluaXRpYXRlIGFuDQo+IHVucGx1Zy4NCj4g
DQo+IEkgZ3Vlc3MgbGlidmlydC9saWJ4bCBpcyBkb2luZyB0aGUgc2FtZT8NCj4gDQoNClRoZSB1
bnBsdWcgbWVjaGFuc2lzbSBpcyBhbGwgaW4gbGlieGwgQUZBSUNULCBzbyBpdCBzaG91bGQgYmUg
aWRlbnRpY2FsLg0KDQo+IEF0IGxlYXN0IGF0IFNVU0Ugd2Ugc3RpbGwgaGF2ZSBzb21lIGN1c3Rv
bWVycyBydW5uaW5nIHhlbmQgYmFzZWQNCj4gWGVuIGluc3RhbGxhdGlvbnMgd2l0aCByZWNlbnQg
TGludXggb3IgV2luZG93cyBndWVzdHMuDQo+IA0KDQpJcyB0aGF0IHNvbWV0aGluZyB0aGUgdXBz
dHJlYW0gY29kZSBjYW4vc2hvdWxkIHN1cHBvcnQgdGhvdWdoPyBJJ2QgYmUgc3VycHJpc2VkIGlm
IHhlbmQgaXMgYWN0dWFsbHkgZG9pbmcgYW55dGhpbmcgZGlmZmVyZW50IHRvIGxpYnhsIHNpbmNl
IEkndmUgYmVlbiBjb2RpbmcgdGhlIFdpbmRvd3MgUFYgZHJpdmVycyB0byB0cmlnZ2VyIG9mZiB0
aGUgY29tYmluZWQgY2xvc2luZy9vbmxpbmUgdHJhbnNpdGlvbiBmb3IgYXMgbG9uZyBhcyBJIGNh
biByZW1lbWJlci4NCg0KICBQYXVsDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5m
by94ZW4tZGV2ZWw=
