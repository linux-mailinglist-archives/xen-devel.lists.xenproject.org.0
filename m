Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CED7B14EB88
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 12:13:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixUBl-0008Rp-VK; Fri, 31 Jan 2020 11:10:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qch3=3U=amazon.co.uk=prvs=292a3fd2f=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ixUBk-0008Rk-St
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 11:10:16 +0000
X-Inumbo-ID: 422e0d88-441a-11ea-8396-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 422e0d88-441a-11ea-8396-bc764e2007e4;
 Fri, 31 Jan 2020 11:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580469016; x=1612005016;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rMeRCjUAZdXgMVZdvucbLjQCxkvSV2256qk/BYOFOD0=;
 b=EZpxvnz9hX3FeSYLmciB0npFRbH8IfKKFHeoolOdxbVl4iFAuj+x2ubX
 lR1qnd3BdsS1rBrHU7JXTz3mehY1HHmBvveXLGbxy7fF7DJdC/+uD0NNn
 6ZXxcqVTDKHriOqBfZIE9RHdRN0U0W4lf/y/MYfWf+6EBavkRFmTnWzWo E=;
IronPort-SDR: vkdC6gBdgxF/y0ZjVavZ1JnX02rJGeFgfc0bO/mdzT0eQz3+FhKDxbB6mVMAw4cwaxhAE6KNMM
 /G33YfaPu2lg==
X-IronPort-AV: E=Sophos;i="5.70,385,1574121600"; d="scan'208";a="13818950"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 31 Jan 2020 11:10:05 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
 by email-inbound-relay-2a-90c42d1d.us-west-2.amazon.com (Postfix) with ESMTPS
 id 7B8F3A2181; Fri, 31 Jan 2020 11:10:04 +0000 (UTC)
Received: from EX13D32EUC002.ant.amazon.com (10.43.164.94) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 31 Jan 2020 11:10:04 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC002.ant.amazon.com (10.43.164.94) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 31 Jan 2020 11:10:03 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 31 Jan 2020 11:10:02 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [Xen-devel] [PATCH v4 1/7] libxl: add definition of
 INVALID_DOMID to the API
Thread-Index: AQHV0TKAfSuQBKGYT06LZ4VCzz55Pqf2xNQAgA3bA5CAAAqegIAAAHtQ
Date: Fri, 31 Jan 2020 11:10:02 +0000
Message-ID: <53287f7ea7984575b91ab388cfe0bee8@EX13D32EUC003.ant.amazon.com>
References: <20200122144446.919-1-pdurrant@amazon.com>
 <20200122144446.919-2-pdurrant@amazon.com>
 <20200122145248.GB57924@desktop-tdan49n.eng.citrite.net>
 <61e9f341fc1b48beaa6266bb90ff2701@EX13D32EUC003.ant.amazon.com>
 <20200131110603.GS4679@Air-de-Roger>
In-Reply-To: <20200131110603.GS4679@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.63]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v4 1/7] libxl: add definition of
 INVALID_DOMID to the API
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Ian
 Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU2VudDogMzEgSmFudWFyeSAyMDIwIDExOjA2DQo+IFRv
OiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24uY28udWs+DQo+IENjOiBBbnRob255IFBF
UkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT47IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmc7IElhbiBKYWNrc29uIDxpYW4uamFja3NvbkBldS5jaXRyaXguY29tPjsgV2Vp
DQo+IExpdSA8d2xAeGVuLm9yZz4NCj4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2
NCAxLzddIGxpYnhsOiBhZGQgZGVmaW5pdGlvbiBvZg0KPiBJTlZBTElEX0RPTUlEIHRvIHRoZSBB
UEkNCj4gDQo+IE9uIEZyaSwgSmFuIDMxLCAyMDIwIGF0IDEwOjMxOjQ5QU0gKzAwMDAsIER1cnJh
bnQsIFBhdWwgd3JvdGU6DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4g
RnJvbTogWGVuLWRldmVsIDx4ZW4tZGV2ZWwtYm91bmNlc0BsaXN0cy54ZW5wcm9qZWN0Lm9yZz4g
T24gQmVoYWxmIE9mDQo+ID4gPiBSb2dlciBQYXUgTW9ubsOpDQo+ID4gPiBTZW50OiAyMiBKYW51
YXJ5IDIwMjAgMTQ6NTMNCj4gPiA+IFRvOiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24u
Y28udWs+DQo+ID4gPiBDYzogQW50aG9ueSBQRVJBUkQgPGFudGhvbnkucGVyYXJkQGNpdHJpeC5j
b20+OyB4ZW4tDQo+ID4gPiBkZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZzsgSWFuIEphY2tzb24g
PGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+Ow0KPiBXZWkNCj4gPiA+IExpdSA8d2xAeGVuLm9y
Zz4NCj4gPiA+IFN1YmplY3Q6IFJlOiBbWGVuLWRldmVsXSBbUEFUQ0ggdjQgMS83XSBsaWJ4bDog
YWRkIGRlZmluaXRpb24gb2YNCj4gPiA+IElOVkFMSURfRE9NSUQgdG8gdGhlIEFQSQ0KPiA+ID4N
Cj4gPiA+IE9uIFdlZCwgSmFuIDIyLCAyMDIwIGF0IDAyOjQ0OjQwUE0gKzAwMDAsIFBhdWwgRHVy
cmFudCB3cm90ZToNCj4gPiA+ID4gQ3VycmVudGx5IGJvdGggeGwgYW5kIGxpYnhsIGhhdmUgaW50
ZXJuYWwgZGVmaW5pdGlvbnMgb2YNCj4gSU5WQUxJRF9ET01JRA0KPiA+ID4gPiB3aGljaCBoYXBw
ZW4gdG8gYmUgaWRlbnRpY2FsLiBIb3dldmVyLCBmb3IgdGhlIHB1cnBvc2VzIG9mDQo+IGRlc2Ny
aWJpbmcNCj4gPiA+IHRoZQ0KPiA+ID4gPiBiZWhhdmlvdXIgb2YgbGlieGxfZG9tYWluX2NyZWF0
ZV9uZXcvcmVzdG9yZSgpIGl0IGlzIHVzZWZ1bCB0byBoYXZlDQo+IGENCj4gPiA+ID4gc3BlY2lm
aWVkIGludmFsaWQgdmFsdWUgZm9yIGEgZG9tYWluIGlkLg0KPiA+ID4gPg0KPiA+ID4gPiBUaGlz
IHBhdGNoIHRoZXJlZm9yZSBtb3ZlcyB0aGUgbGlieGwgZGVmaW5pdGlvbiBmcm9tDQo+IGxpYnhs
X2ludGVybmFsLmggdG8NCj4gPiA+ID4gbGlieGwuaCBhbmQgcmVtb3ZlcyB0aGUgaW50ZXJuYWwg
ZGVmaW5pdGlvbiBmcm9tIHhsX3V0aWxzLmguIFRoZQ0KPiA+ID4gaGFyZGNvZGVkDQo+ID4gPiA+
ICctMScgcGFzc2VkIGJhY2sgdmlhIGRvbWNyZWF0ZV9jb21wbGV0ZSgpIGlzIHRoZW4gdXBkYXRl
ZCB0bw0KPiA+ID4gSU5WQUxJRF9ET01JRA0KPiA+ID4gPiBhbmQgY29tbWVudCBhYm92ZSBsaWJ4
bF9kb21haW5fY3JlYXRlX25ldy9yZXN0b3JlKCkgaXMgYWNjb3JkaW5nbHkNCj4gPiA+ID4gbW9k
aWZpZWQuDQo+ID4gPg0KPiA+ID4gVXJnLCBpdCdzIGtpbmQgb2YgdWdseSB0byBhZGQgYW5vdGhl
ciBkZWZpbml0aW9uIG9mIGludmFsaWQgZG9taWQgd2hlbg0KPiA+ID4gdGhlcmUncyBhbHJlYWR5
IERPTUlEX0lOVkFMSUQgaW4gdGhlIHB1YmxpYyBoZWFkZXJzLiBJIGd1ZXNzIHRoZXJlJ3MgYQ0K
PiA+ID4gcmVhc29uIEknbSBtaXNzaW5nIGZvciBub3QgdXNpbmcgRE9NSURfSU5WQUxJRCBpbnN0
ZWFkIG9mIGludHJvZHVjaW5nDQo+ID4gPiBhIG5ldyB2YWx1ZT8NCj4gPiA+DQo+ID4NCj4gPiBU
QkggSSBkb24ndCBrbm93LiBBcyBmYXIgYXMgeGwvbGlieGwgZ29lcywgZG9taWRzIGFyZSB1aW50
MzJfdHMgc28gbWF5YmUNCj4gRE9NSURfSU5WQUxJRCB3YXMgZm9yIHNvbWUgcmVhc29uIG5vdCBj
b25zaWRlcmVkIGFwcHJvcHJpYXRlPyBCZWFyIGluDQo+IG1pbmQsIHRoaXMgcGF0Y2ggaXMgbm90
IHRydWx5IGludHJvZHVjaW5nIGEgbmV3IHZhbHVlOyBpdCdzIGp1c3QgbWFraW5nDQo+IHNvbWV0
aGluZyB0aGF0IHdhcyBpbnRlcm5hbCBidXQgaWRlbnRpY2FsIGluIGJvdGggeGwgYW5kIGxpYnhs
IHBhcnQgb2YgdGhlDQo+IGludGVyZmFjZS4NCj4gDQo+IEhtLCBPSy4gSXQgc2VlbXMgcXVpdGUg
YSBtZXNzIHRoYXQgbGlieGwgdXNlcyBhIDMyYml0IHZhbHVlIHdoZW4gdGhlDQo+IGh5cGVydmlz
b3IgaXMgdXNpbmcgYSAxNmJpdCBmaWVsZCwgYnV0IEkgZ3Vlc3MgdGhlcmUncyBub3RoaW5nIHRo
YXQNCj4gY2FuIGJlIGRvbmUgYXQgdGhpcyBwb2ludCB0byBmaXggdGhpcy4NCj4gDQo+IFNpbmNl
IHRoaXMgd2lsbCBiZSBwYXJ0IG9mIHRoZSBwdWJsaWMgaW50ZXJmYWNlIG5vdywgaXQgbWlnaHQg
bWFrZQ0KPiBzZW5zZSB0byBkZWZpbmUgaXQgdG8gdGhlIHNhbWUgdmFsdWUgYXMgRE9NSURfSU5W
QUxJRCAoMHg3RkY0KS4gQW5kDQo+IG1ha2Ugc3VyZSBkb21pZCB2YWx1ZXMgcGFzc2VkIHRvIGxp
YnhsIGFyZSB0cnVuY2F0ZWQgdG8gMTZiaXRzLg0KDQpUaGF0IHNvdW5kcyBsaWtlIGZlYXR1cmUg
Y3JlZXAgdGhhdCBJJ2QgcmF0aGVyIG5vdCBnbyBuZWFyIGluIHRoaXMgcGF0Y2guIEkgc3VzcGVj
dCBhIGNhbiBvZiB3b3JtcyBhd2FpdHMuDQoNCj4gDQo+IE1heWJlIGl0J3Mgbm90IHRoYXQgcmVs
ZXZhbnQsIGJ1dCBkb21pZHMgcGFzc2VkIHRvIGxpYnhsIHdvdWxkIG5lZWQgdG8NCj4gYmUgc2Fu
aXRpemVkIGluIG9yZGVyIHRvIG1ha2Ugc3VyZSBYZW4ncyBET01JRF9JTlZBTElEIGlzIG5vdCB0
cmVhdGVkDQo+IGFzIGEgdmFsaWQgZG9taWQgdmFsdWUgZnJvbSBsaWJ4bCdzIFBvVi4gVGhlcmUg
YXJlIGFsc28gb3RoZXIgc3BlY2lhbA0KPiBkb21pZHMgdGhhdCBuZWVkIHRvIGJlIGZpbHRlcmVk
Lg0KDQpUaGVyZSBpcyBhbHJlYWR5IGEgdmFsaWRpdHkgY2hlY2s6IGxpYnhsX2RvbWlkX3ZhbGlk
X2d1ZXN0KCkuDQoNCiAgUGF1bA0KDQo+IA0KPiA+ID4gSWYgc28gY291bGQgdGhpcyBiZSBtZW50
aW9uZWQgaW4gdGhlIGNvbW1pdCBtZXNzYWdlPw0KPiA+ID4NCj4gPg0KPiA+IEknbGwgYWRkIGEg
bm90ZSB0byB0aGUgY29tbWl0IGNvbW1lbnQgdG8gcG9pbnQgb3V0IHRoYXQgdGhpcyBpcyBub3QN
Cj4gY2hhbmdpbmcgYW55IHZhbHVlIHVzZWQgYnkgdGhlIHRvb2xzdGFjay4NCj4gDQo+IFRoYW5r
cyENCj4gDQo+IFJvZ2VyLg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1k
ZXZlbA==
