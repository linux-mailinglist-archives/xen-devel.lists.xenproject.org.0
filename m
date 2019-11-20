Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB2B103936
	for <lists+xen-devel@lfdr.de>; Wed, 20 Nov 2019 12:56:22 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iXOWx-0003uK-2R; Wed, 20 Nov 2019 11:52:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=rUCm=ZM=amazon.com=prvs=220eb40af=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iXOWv-0003uA-8I
 for xen-devel@lists.xenproject.org; Wed, 20 Nov 2019 11:52:17 +0000
X-Inumbo-ID: 32548fd4-0b8c-11ea-9631-bc764e2007e4
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 32548fd4-0b8c-11ea-9631-bc764e2007e4;
 Wed, 20 Nov 2019 11:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1574250736; x=1605786736;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=+VEp/kpgepO9SYWN+jCaf8qv/43bIygLcbWoLE8PCKI=;
 b=txVgYpFyevEDxZroKWG2NYaXagEHo46JMUH8jBiIrRlDdsJAozlD7d3C
 IUnA7znlLU6Z3i86IqNFhc0CnTYwn0qa/SOUqk/Xs24n1s2aMFqhcEQP9
 4UUfNrlkuKaHfUkwy5urfkuOuXMgenyOMJPNoWsWimz5yprUrpD7Lat5H 8=;
IronPort-SDR: PDAaG3njIpc8nvH3br5evACn/xRVT4KGRefwk8zVIT64b6nAliKU3mAFXCpH9bmrjrt0zvEyRr
 35xYxeJLLnyQ==
X-IronPort-AV: E=Sophos;i="5.69,221,1571702400"; 
   d="scan'208";a="242998"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-17c49630.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 20 Nov 2019 11:52:04 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-17c49630.us-east-1.amazon.com (Postfix) with ESMTPS
 id 764CAA259B; Wed, 20 Nov 2019 11:52:03 +0000 (UTC)
Received: from EX13D32EUC001.ant.amazon.com (10.43.164.159) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 20 Nov 2019 11:52:02 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC001.ant.amazon.com (10.43.164.159) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Wed, 20 Nov 2019 11:52:02 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Wed, 20 Nov 2019 11:52:02 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [Xen-devel] grant table size
Thread-Index: AdWfhQwGXUKIxbF7Q62ckygVPo3ZWwABR/+AAAFd68AAAM6kAAAACm4AAAEhiIAAABiKwA==
Date: Wed, 20 Nov 2019 11:52:02 +0000
Message-ID: <506ba074628844a8806f8397e6f17e2c@EX13D32EUC003.ant.amazon.com>
References: <08f386b1d300432384c27ba9a97be697@EX13D32EUC003.ant.amazon.com>
 <20191120100627.GP72134@Air-de-Roger>
 <c823656633fc4cde9fb232809c31c8a2@EX13D32EUC003.ant.amazon.com>
 <a821dd08-3afb-350d-dded-26b7e07df4b1@suse.com>
 <a78709323d7b429c97cdeb652375d601@EX13D32EUC003.ant.amazon.com>
 <7f2af109-d372-ee94-8930-251acdb64402@suse.com>
In-Reply-To: <7f2af109-d372-ee94-8930-251acdb64402@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.128]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] grant table size
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
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDIwIE5vdmVtYmVyIDIwMTkgMTI6NDINCj4gVG86IER1cnJh
bnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jb20+DQo+IENjOiBSb2dlciBQYXUgTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZw0KPiBT
dWJqZWN0OiBSZTogW1hlbi1kZXZlbF0gZ3JhbnQgdGFibGUgc2l6ZQ0KPiANCj4gT24gMjAuMTEu
MjAxOSAxMjoxOCwgIER1cnJhbnQsIFBhdWwgIHdyb3RlOg0KPiA+PiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPiA+PiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+DQo+
ID4+IFNlbnQ6IDIwIE5vdmVtYmVyIDIwMTkgMTI6MDkNCj4gPj4gVG86IER1cnJhbnQsIFBhdWwg
PHBkdXJyYW50QGFtYXpvbi5jb20+DQo+ID4+IENjOiBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT47IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gPj4g
U3ViamVjdDogUmU6IFtYZW4tZGV2ZWxdIGdyYW50IHRhYmxlIHNpemUNCj4gPj4NCj4gPj4gT24g
MjAuMTEuMjAxOSAxMTo0OSwgIER1cnJhbnQsIFBhdWwgIHdyb3RlOg0KPiA+Pj4+IEZyb206IFJv
Z2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiA+Pj4+IFNlbnQ6IDIwIE5v
dmVtYmVyIDIwMTkgMTE6MDYNCj4gPj4+Pg0KPiA+Pj4+IERvIHlvdSBoYXZlIGluIG1pbmQgdG8g
c2lnbmFsIHRoaXMgc29tZWhvdyB0byBndWVzdHMsIG9yIHRoZQ0KPiA+Pj4+IGV4cGVjdGF0aW9u
IGlzIHRoYXQgdGhlIGd1ZXN0IHdpbGwgaGF2ZSB0byBwb2xsIEdOVFRBQk9QX3F1ZXJ5X3NpemUN
Cj4gPj4+PiBhbmQgYXQgc29tZSBwb2ludCB0aGUgc2l6ZSB3aWxsIGluY3JlYXNlPw0KPiA+Pj4N
Cj4gPj4+IEkgZG9uJ3QgdGhpbmsgdGhlIGd1ZXN0IG5lZWQgY2FyZSB1bnRpbCBpdHMgZ3JhbnQg
dGFibGUgZ3Jvd3MgdG8gdGhlDQo+ID4+PiBtYXguIEF0IHRoYXQgcG9pbnQsIHJhdGhlciB0aGFu
IGdpdmluZyB1cCwgdGhlIGd1ZXN0IHdvdWxkIHJlLXF1ZXJ5DQo+ID4+PiB0aGUgbWF4IHZhbHVl
IHRvIHNlZSBpZiB0aGVyZSBpcyBub3cgbW9yZSBoZWFkcm9vbSBhbmQgdGhlbiByZS1zaXplDQo+
ID4+PiBpdHMgaW50ZXJuYWwgZGF0YSBzdHJ1Y3R1cmVzIGFjY29yZGluZ2x5Lg0KPiA+Pg0KPiA+
PiBJZiB3ZSBjb25zaWRlciBkeW5hbWljIGFkanVzdG1lbnRzLCB3aGF0IGFib3V0IHNocmlua2lu
ZyBvZiB0aGUNCj4gPj4gdGFibGU/IFRoaXMgd291bGQgb2YgY291cnNlIHJlcXVpcmUgc29tZSBm
b3JtIG9mIGd1ZXN0IGNvbnNlbnQsDQo+ID4+IGJ1dCBpdCB3b3VsZCBiZSBuaWNlIGlmIHRoZSBv
cHRpb24gd291bGQgYXQgbGVhc3QgYmUgYWNjb3VudGVkDQo+ID4+IGZvciB3aGVuIHdvcmtpbmcg
b3V0IGhvdyBhbGwgb2YgdGhpcyBzaG91bGQgYmVoYXZlLCBldmVuIGlmIHRoZQ0KPiA+PiBjYXNl
IG1heSBub3QgZ2V0IGhhbmRsZWQgcmlnaHQgbm93Lg0KPiA+Pg0KPiA+DQo+ID4gV2VsbCwgcGVy
aGFwcyB3ZSBjb3VsZCBoYXZlIGEgc2V0X3NpemUgZ250dGFiIG9wIHdoZXJlIGEgZ3Vlc3Qgd291
bGQNCj4gPiBiZSBhbGxvd2VkIHRvIGNhbGwgaXQgd2l0aCBhIHZhbHVlIGxlc3MgdGhhbiAob3Ig
ZXF1YWwgdG8pIGl0cyBjdXJyZW50DQo+ID4gbWF4LCBzbyB0aGF0IGl0IGNhbiB2b2x1bnRhcmls
eSB5aWVsZCBpdHMgaGVhZHJvb20sIGJ1dCBvbmx5IGENCj4gPiBwcml2aWxlZ2VkIGd1ZXN0IHdv
dWxkIGJlIGFsbG93ZWQgdG8gY2FsbCBpdCB3aXRoIGFuIGluY3JlYXNlZCBtYXgNCj4gPiB2YWx1
ZT8NCj4gDQo+IEFoIHllcywgdGhpcyBzb3VuZHMgZ29vZC4NCj4gDQo+ID4gSSdtIG5vdCBzdXJl
IHdoYXQgbWVjaGFuaXNtIHdvdWxkIGJlIGJlc3QgZm9yIHJlcXVlc3RpbmcgYSBndWVzdA0KPiA+
IHJlZHVjdGlvbiB0aG91Z2gsIEkgZ3Vlc3MgcHJvYmFibHkgeGVuc3RvcmUuLi4gc29tZXRoaW5n
IGFraW4gdG8NCj4gPiBiYWxsb29uIHRhcmdldCBwYWdlcz8NCj4gDQo+IFBlcmhhcHMuDQo+IA0K
PiA+IEEgZ3Vlc3QgcmVkdWN0aW9uIG9mIG1heCBpcyBvZiBwcmV0dHkgbGltaXRlZCB2YWx1ZSB0
aG91Z2ggQUZBSUNUIGFzDQo+ID4gb25seSBpbi11c2UgZnJhbWVzIHJlYWxseSB1c2UgYW55IG1l
bW9yeS4gVGhlIChhY3RpdmUvc2hhcmVkL3N0YXR1cykNCj4gPiBhcnJheXMgY291bGQsIG9mIGNv
dXJzZSwgYmUgcmVkdWNlZCBpbiBzaXplIGJ1dCB0aGF0IG9ubHkgZ2V0cyB5b3UgYQ0KPiA+IGZl
dyBieXRlcyBiYWNrLg0KPiANCj4gV2VsbCwgaWYgdGhpcyByZWFsbHkgd2FzIGFib3V0IGp1c3Qg
ImEgZmV3IGJ5dGVzIiwgd2h5IHdvdWxkbid0IHdlDQo+IGFsbG93IGFyYml0cmFyeSBzaXplIGdy
YW50IHRhYmxlcyB0byBiZWdpbiB3aXRoPw0KPiANCg0KV2VsbCwgYW5vdGhlciBvcHRpb24gd291
bGQgYmUgdG8gYWx3YXlzIHNldCB0aGUgdmFsdWUgb2YgbWF4IHNlZW4gYnkgdGhlIGd1ZXN0IHRv
IGJlIHNvbWUgcmVhbGx5IGxhcmdlIHZhbHVlIGJ1dCBhY3R1YWxseSBhcHBseSBhIGxvd2VyIGxp
bWl0IGluIFhlbiwgd2hpY2ggY291bGQgdGhlbiBiZSBpbmNyZWFzZWQgYnkgdGhlIHRvb2xzdGFj
ay4gSSBkb24ndCBiZWxpZXZlIHRoYXQgd291bGQgcmVxdWlyZSBhbnkgZ3Vlc3Qtc2lkZSBtb2Rp
ZmljYXRpb24gZWl0aGVyLg0KDQogIFBhdWwgDQoNCj4gSmFuDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1k
ZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21h
aWxtYW4vbGlzdGluZm8veGVuLWRldmVs
