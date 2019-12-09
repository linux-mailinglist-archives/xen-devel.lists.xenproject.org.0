Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 79728116D09
	for <lists+xen-devel@lfdr.de>; Mon,  9 Dec 2019 13:22:24 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ieI0m-0004J5-Ju; Mon, 09 Dec 2019 12:19:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=BuSh=Z7=amazon.com=prvs=2393b02c0=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ieI0l-0004Iz-7m
 for xen-devel@lists.xenproject.org; Mon, 09 Dec 2019 12:19:35 +0000
X-Inumbo-ID: 28b461c6-1a7e-11ea-87c8-12813bfff9fa
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 28b461c6-1a7e-11ea-87c8-12813bfff9fa;
 Mon, 09 Dec 2019 12:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1575893975; x=1607429975;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=f1Ulg0wianJOtRmMoMDuC+5+OOThyz9aDKekIAtNX+s=;
 b=VGoXBjEkYyzk47z8WWVBQGa73f8L9PUhSGEEBukQL/sLqtCNGn0Rw8qx
 KtC0zpydrtR25ltJFIrqGXTunIe+rue1YN9HFROIq1sAAELx60YNkleYF
 mVZMCXWSmVU3pDPSlR1pFEquYy1//E12L4lb31FjtsHi3USA156SnXCib k=;
IronPort-SDR: bwHLj0d8dUyvWXkK5BxS0tnj22+Nye7y+w4pv3jOiRujlore5lzM7dgnT41bLZWYsZZYWFsbc0
 WmbohzyEjhLw==
X-IronPort-AV: E=Sophos;i="5.69,294,1571702400"; d="scan'208";a="12419638"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 09 Dec 2019 12:19:20 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com (Postfix) with ESMTPS
 id 9F5A0A2468; Mon,  9 Dec 2019 12:19:19 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 12:19:19 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 9 Dec 2019 12:19:18 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 9 Dec 2019 12:19:18 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [Xen-devel] [PATCH 2/4] xenbus: limit when state is forced to
 closed
Thread-Index: AQHVq3SCoU35oX1INEGjFwMD1PQM5aexs7UAgAAEWoCAAAHxUIAAAeGAgAAAtoA=
Date: Mon, 9 Dec 2019 12:19:18 +0000
Message-ID: <63d653a04207451e9041c89acd04f2a2@EX13D32EUC003.ant.amazon.com>
References: <20191205140123.3817-1-pdurrant@amazon.com>
 <20191205140123.3817-3-pdurrant@amazon.com>
 <20191209113926.GS980@Air-de-Roger>
 <b8a138ad-5770-65fa-f368-f7b4063702fa@suse.com>
 <3412e42d13224b6786613e58dc189ebf@EX13D32EUC003.ant.amazon.com>
 <8d66e520-3009-cde1-e24c-26d7476e5873@suse.com>
In-Reply-To: <8d66e520-3009-cde1-e24c-26d7476e5873@suse.com>
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
c3NAc3VzZS5jb20+DQo+IFNlbnQ6IDA5IERlY2VtYmVyIDIwMTkgMTI6MDkNCj4gVG86IER1cnJh
bnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jb20+OyBSb2dlciBQYXUgTW9ubsOpDQo+IDxyb2dl
ci5wYXVAY2l0cml4LmNvbT4NCj4gQ2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IHhl
bi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgU3RlZmFubw0KPiBTdGFiZWxsaW5pIDxzc3Rh
YmVsbGluaUBrZXJuZWwub3JnPjsgQm9yaXMgT3N0cm92c2t5DQo+IDxib3Jpcy5vc3Ryb3Zza3lA
b3JhY2xlLmNvbT4NCj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCAyLzRdIHhlbmJ1
czogbGltaXQgd2hlbiBzdGF0ZSBpcyBmb3JjZWQgdG8NCj4gY2xvc2VkDQo+IA0KPiBPbiAwOS4x
Mi4xOSAxMzowMywgRHVycmFudCwgUGF1bCB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gPj4gRnJvbTogSsO8cmdlbiBHcm/DnyA8amdyb3NzQHN1c2UuY29tPg0KPiA+
PiBTZW50OiAwOSBEZWNlbWJlciAyMDE5IDExOjU1DQo+ID4+IFRvOiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT47IER1cnJhbnQsIFBhdWwNCj4gPj4gPHBkdXJyYW50QGFt
YXpvbi5jb20+DQo+ID4+IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyB4ZW4tZGV2
ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7DQo+IFN0ZWZhbm8NCj4gPj4gU3RhYmVsbGluaSA8c3N0
YWJlbGxpbmlAa2VybmVsLm9yZz47IEJvcmlzIE9zdHJvdnNreQ0KPiA+PiA8Ym9yaXMub3N0cm92
c2t5QG9yYWNsZS5jb20+DQo+ID4+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggMi80
XSB4ZW5idXM6IGxpbWl0IHdoZW4gc3RhdGUgaXMgZm9yY2VkDQo+IHRvDQo+ID4+IGNsb3NlZA0K
PiA+Pg0KPiA+PiBPbiAwOS4xMi4xOSAxMjozOSwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToNCj4g
Pj4+IE9uIFRodSwgRGVjIDA1LCAyMDE5IGF0IDAyOjAxOjIxUE0gKzAwMDAsIFBhdWwgRHVycmFu
dCB3cm90ZToNCj4gPj4+PiBPbmx5IGZvcmNlIHN0YXRlIHRvIGNsb3NlZCBpbiB0aGUgY2FzZSB3
aGVuIHRoZSB0b29sc3RhY2sgbWF5IG5lZWQgdG8NCj4gPj4+PiBjbGVhbiB1cC4gVGhpcyBjYW4g
YmUgZGV0ZWN0ZWQgYnkgY2hlY2tpbmcgd2hldGhlciB0aGUgc3RhdGUgaW4NCj4gPj4geGVuc3Rv
cmUNCj4gPj4+PiBoYXMgYmVlbiBzZXQgdG8gY2xvc2luZyBwcmlvciB0byBkZXZpY2UgcmVtb3Zh
bC4NCj4gPj4+DQo+ID4+PiBJJ20gbm90IHN1cmUgSSBzZWUgdGhlIHBvaW50IG9mIHRoaXMsIEkg
d291bGQgZXhwZWN0IHRoYXQgYSBmYWlsdXJlIHRvDQo+ID4+PiBwcm9iZSBvciB0aGUgcmVtb3Zh
bCBvZiB0aGUgZGV2aWNlIHdvdWxkIGxlYXZlIHRoZSB4ZW5idXMgc3RhdGUgYXMNCj4gPj4+IGNs
b3NlZCwgd2hpY2ggaXMgY29uc2lzdGVudCB3aXRoIHRoZSBhY3R1YWwgZHJpdmVyIHN0YXRlLg0K
PiA+Pj4NCj4gPj4+IENhbiB5b3UgZXhwbGFpbiB3aGF0J3MgdGhlIGJlbmVmaXQgb2YgbGVhdmlu
ZyBhIGRldmljZSB3aXRob3V0IGENCj4gPj4+IGRyaXZlciBpbiBzdWNoIHVua25vd24gc3RhdGU/
DQo+ID4+DQo+ID4+IEFuZCBtb3JlIGNvbmNlcm5pbmc6IGRpZCB5b3UgY2hlY2sgdGhhdCBubyBm
cm9udGVuZC9iYWNrZW5kIGlzDQo+ID4+IHJlbHlpbmcgb24gdGhlIGNsb3NlZCBzdGF0ZSB0byBi
ZSB2aXNpYmxlIHdpdGhvdXQgY2xvc2luZyBoYXZpbmcgYmVlbg0KPiA+PiBzZXQgYmVmb3JlPw0K
PiA+DQo+ID4gQmxrZnJvbnQgZG9lc24ndCBzZWVtIHRvIG1pbmQgYW5kIEkgYmVsaWV2ZSB0aGUg
V2luZG93cyBQViBkcml2ZXJzIGNvcGUsDQo+IGJ1dCBJIGRvbid0IHJlYWxseSB1bmRlcnN0YW5k
IHRoZSBjb21tZW50IHNpbmNlIHRoaXMgcGF0Y2ggaXMgYWN0dWFsbHkNCj4gcmVtb3ZpbmcgYSBj
YXNlIHdoZXJlIHRoZSBiYWNrZW5kIHRyYW5zaXRpb25zIGRpcmVjdGx5IHRvIGNsb3NlZC4NCj4g
DQo+IEknbSBub3Qgc3BlYWtpbmcgb2YgYmxrZnJvbnQvYmxrYmFjayBvbmx5LCBidXQgb2YgbmV0
LCB0cG0sIHNjc2ksIHB2Y2FsbA0KPiBldGMuIGZyb250ZW5kcy9iYWNrZW5kcy4gQWZ0ZXIgYWxs
IHlvdSBhcmUgbW9kaWZ5aW5nIGEgZnVuY3Rpb24gY29tbW9uDQo+IHRvIGFsbCBQViBkcml2ZXIg
cGFpcnMuDQo+IA0KPiBZb3UgYXJlIHJlbW92aW5nIGEgc3RhdGUgc3dpdGMgdG8gImNsb3NlZCIg
aW4gY2FzZSB0aGUgc3RhdGUgd2FzIF9ub3RfDQo+ICJjbG9zaW5nIiBiZWZvcmUuDQoNClllcywg
d2hpY2ggQUZBSUsgaXMgYWdhaW5zdCB0aGUgaW50ZW50aW9uIG9mIHRoZSBnZW5lcmljIFBWIHBy
b3RvY29sIHN1Y2ggdGhhdCBpdCBldmVyIGV4aXN0ZWQgYW55d2F5Lg0KDQo+IFNvIGFueSBQViBk
cml2ZXIgcmVhY3RpbmcgdG8gImNsb3NlZCIgb2YgdGhlIG90aGVyIGVuZA0KPiBpbiBjYXNlIHRo
ZSBwcmV2aW91cyBzdGF0ZSBtaWdodCBub3QgaGF2ZSBiZWVuICJjbG9zaW5nIiBiZWZvcmUgaXMg
YXQNCj4gcmlzayB0byBtaXNiZWhhdmUgd2l0aCB5b3VyIHBhdGNoLg0KDQpXZWxsLCB0aGV5IHdp
bGwgc2VlIG5vdGhpbmcgbm93LiBJZiB0aGUgc3RhdGUgd2FzIG5vdCBjbG9zaW5nLCBpdCBnZXRz
IGxlZnQgYWxvbmUsIHNvIHRoZSBmcm9udGVuZCBzaG91bGRuJ3QgZG8gYW55dGhpbmcuIFRoZSBv
bmx5IHJpc2sgdGhhdCBJIGNhbiBzZWUgaXMgdGhhdCBzb21lIGZyb250ZW5kL2JhY2tlbmQgcGFp
ciBuZWVkZWQgYSBkaXJlY3QgNCAtPiA2IHRyYW5zaXRpb24gdG8gc3VwcG9ydCAndW5iaW5kJyBi
ZWZvcmUgYnV0IEFGQUlLIG5vdGhpbmcgaGFzIGV2ZXIgc3VwcG9ydGVkIHRoYXQsIGFuZCBibGsg
YW5kIG5ldCBjcmFzaCduJ2J1cm4gaWYgeW91IHRyeSB0aGF0IG9uIHVwc3RyZWFtIGFzIGl0IHN0
YW5kcy4gQSBjbGVhbiB1bnBsdWcgd291bGQgYWx3YXlzIHNldCBzdGF0ZSB0byA1IGZpcnN0LCBz
aW5jZSB0aGF0J3MgcGFydCBvZiB0aGUgdW5wbHVnIHByb3RvY29sLg0KDQogIFBhdWwNCg0KPiAN
Cj4gSnVlcmdlbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcK
aHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
