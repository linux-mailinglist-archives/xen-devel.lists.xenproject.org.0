Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19559146948
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2020 14:38:44 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iucf8-0005mK-56; Thu, 23 Jan 2020 13:36:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=wqmU=3M=amazon.co.uk=prvs=2848fc5af=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iucf6-0005mE-Og
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2020 13:36:44 +0000
X-Inumbo-ID: 65473726-3de5-11ea-9fd7-bc764e2007e4
Received: from smtp-fw-2101.amazon.com (unknown [72.21.196.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 65473726-3de5-11ea-9fd7-bc764e2007e4;
 Thu, 23 Jan 2020 13:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1579786605; x=1611322605;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0qkfzLOSTAWyElOiRCdGoOKG5u707Y47ocd01xKxc88=;
 b=pUtLX/Y7w9nkQBgCukG7pB9YjyrhVbrXn15XmlOBIZ+fkUqY+IRMUvBQ
 K+dOuKGm1yyMZNLtBzjfsXHA5yVCrlSazmCk4JOwOqdnnbu9TjCeI+ThT
 HBAYl0qxlXNnKX8QpLetdRuzBgr3Qd4dC0pSK57OvTn9GclQwuUA5fW2N Q=;
IronPort-SDR: VNi6ccHEsNnZYftY1WsczQH/+Bd8l3KDR/ASHBPgJ73ygmMM9BWQ8NwqZaA5AnVz0xozgF/QVW
 Y3Xu3zVenw/w==
X-IronPort-AV: E=Sophos;i="5.70,354,1574121600"; d="scan'208";a="13849052"
Received: from iad12-co-svc-p1-lb1-vlan2.amazon.com (HELO
 email-inbound-relay-1e-27fb8269.us-east-1.amazon.com) ([10.43.8.2])
 by smtp-border-fw-out-2101.iad2.amazon.com with ESMTP;
 23 Jan 2020 13:36:40 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-27fb8269.us-east-1.amazon.com (Postfix) with ESMTPS
 id 77614A2366; Thu, 23 Jan 2020 13:36:37 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 23 Jan 2020 13:36:36 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 23 Jan 2020 13:36:35 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 23 Jan 2020 13:36:35 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH v2 1/3] x86 / vmx: make apic_access_mfn type-safe
Thread-Index: AQHV0fFF6/HusPbpl0+16s1IpYxjoqf4P3+g
Date: Thu, 23 Jan 2020 13:36:35 +0000
Message-ID: <8d272c34881a479b8d59c7b76b493614@EX13D32EUC003.ant.amazon.com>
References: <20200123122141.1419-1-pdurrant@amazon.com>
 <20200123122141.1419-2-pdurrant@amazon.com>
 <7143d805-b9ae-1bd2-f357-84a3529464cc@suse.com>
 <d01a743d24624e7caf8d0cb19b7184e2@EX13D32EUC003.ant.amazon.com>
 <64239d7c-3c83-dae8-bc79-a7c8b68e4b7c@suse.com>
In-Reply-To: <64239d7c-3c83-dae8-bc79-a7c8b68e4b7c@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.130]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 1/3] x86 / vmx: make apic_access_mfn
 type-safe
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDIzIEphbnVhcnkgMjAyMCAxMzozMA0KPiBUbzogRHVycmFu
dCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPg0KPiBDYzogS2V2aW4gVGlhbiA8a2V2aW4u
dGlhbkBpbnRlbC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgQW5kcmV3IENvb3Blcg0KPiA8
YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IEp1biBOYWthamltYSA8anVuLm5ha2FqaW1hQGlu
dGVsLmNvbT47IHhlbi0NCj4gZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmc7IFJvZ2VyIFBhdSBN
b25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPg0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDEv
M10geDg2IC8gdm14OiBtYWtlIGFwaWNfYWNjZXNzX21mbiB0eXBlLXNhZmUNCj4gDQo+IE9uIDIz
LjAxLjIwMjAgMTQ6MDksIER1cnJhbnQsIFBhdWwgd3JvdGU6DQo+ID4+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+ID4+IEZyb206IFhlbi1kZXZlbCA8eGVuLWRldmVsLWJvdW5jZXNAbGlz
dHMueGVucHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZg0KPiBKYW4NCj4gPj4gQmV1bGljaA0KPiA+
PiBTZW50OiAyMyBKYW51YXJ5IDIwMjAgMTI6NDUNCj4gPj4gVG86IER1cnJhbnQsIFBhdWwgPHBk
dXJyYW50QGFtYXpvbi5jby51az4NCj4gPj4gQ2M6IEtldmluIFRpYW4gPGtldmluLnRpYW5AaW50
ZWwuY29tPjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IEFuZHJldw0KPiBDb29wZXINCj4gPj4gPGFu
ZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBKdW4gTmFrYWppbWEgPGp1bi5uYWthamltYUBpbnRl
bC5jb20+Ow0KPiB4ZW4tDQo+ID4+IGRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBSb2dlciBQ
YXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gPj4gU3ViamVjdDogUmU6IFtYZW4t
ZGV2ZWxdIFtQQVRDSCB2MiAxLzNdIHg4NiAvIHZteDogbWFrZSBhcGljX2FjY2Vzc19tZm4NCj4g
Pj4gdHlwZS1zYWZlDQo+ID4+DQo+ID4+IE9uIDIzLjAxLjIwMjAgMTM6MjEsIFBhdWwgRHVycmFu
dCB3cm90ZToNCj4gPj4+IFVzZSBtZm5fdCByYXRoZXIgdGhhbiB1bnNpZ25lZCBsb25nIGFuZCBj
aGFuZ2UgcHJldmlvdXMgdGVzdHMgYWdhaW5zdA0KPiAwDQo+ID4+IHRvDQo+ID4+PiB0ZXN0cyBh
Z2FpbnN0IElOVkFMSURfTUZOIChhbHNvIGludHJvZHVjaW5nIGluaXRpYWxpemF0aW9uIHRvIHRo
YXQNCj4gPj4gdmFsdWUpLg0KPiA+Pj4NCj4gPj4+IFNpZ25lZC1vZmYtYnk6IFBhdWwgRHVycmFu
dCA8cGR1cnJhbnRAYW1hem9uLmNvbT4NCj4gPj4+IEFja2VkLWJ5OiBLZXZpbiBUaWFuIDxrZXZp
bi50aWFuQGludGVsLmNvbT4NCj4gPj4+IFJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+ID4+DQo+ID4+IE5vLCB0aGlzIGlzbid0IHdoYXQgdGhlIFItYiB3YXMg
Z2l2ZW4gZm9yLg0KPiA+DQo+ID4gT2gsIHNvcnJ5LCBJIG1pc3VuZGVyc3Rvb2Q7IEkgdGhvdWdo
dCB0aGUgUi1iIHdhcyBnb29kIGFzIGxvbmcgYXMNCj4gaWRlbXBvdGVuY3kgd2FzIGVuc3VyZWQu
DQo+ID4NCj4gPj4NCj4gPj4+IHYyOg0KPiA+Pj4gIC0gU2V0IGFwaWNfYWNjZXNzX21mbiB0byBJ
TlZBTElEX01GTiBpbiB2bXhfZnJlZV92bGFwaWNfbWFwcGluZygpIHRvDQo+ID4+IG1ha2UNCj4g
Pj4+ICAgIHRoZSBmdW5jdGlvbiBpZGVtcG90ZW50DQo+ID4+DQo+ID4+IEFuZHJldyBoYWQgc3Vn
Z2VzdGVkIHRvIHVzZSAwIGluc3RlYWQgb2YgSU5WQUxJRF9NRk4uIEkgZG9uJ3Qgc2VlDQo+ID4+
IGhvdyB5b3UgYWNoaWV2ZWQgaWRlbXBvdGVuY3kgd2l0aCB0aGlzIGFkanVzdG1lbnQuIEFpdWkN
Cj4gPj4gdm14X2ZyZWVfdmxhcGljX21hcHBpbmcoKSBpcyBzdXBwb3NlZCB0byBhbHNvIHJ1biBj
b3JyZWN0bHkgaWYNCj4gPj4gdm14X2FsbG9jX3ZsYXBpY19tYXBwaW5nKCkgd2FzIG5ldmVyIGNh
bGxlZC4NCj4gPg0KPiA+IEl0IHdpbGwuIHZteF9kb21haW5faW5pdGlhbGlzZSgpIHdpbGwgc2V0
IGFwaWNfYWNjZXNzX21mbiB0byBJTlZBTElEX01GTg0KPiA+IHNvIHZteF9mcmVlX3ZsYXBpY19t
YXBwaW5nKCkgd2lsbCBkbyBub3RoaW5nLg0KPiANCj4gSSdtIHNvcnJ5LCBpdCB3YXMgaW1wbGll
ZCB0aGF0IGl0IGFsc28gbmVlZHMgdG8gd29yayBpZg0KPiB2bXhfZG9tYWluX2luaXRpYWxpc2Uo
KSB3YXMgbmV2ZXIgY2FsbGVkLiBBbmRyZXcncyBnb2FsIGFmdGVyDQo+IGFsbCBpcywgYWl1aSwg
dG8gYmUgYWJsZSB0byBjYWxsICJkZXN0cm95IiBmdW5jdGlvbnMgb24gZXJyb3INCj4gcGF0aHMg
aXJyZXNwZWN0aXZlIG9mIGhvdyBmYXIgImNyZWF0ZSIgaGFkIG1hbmFnZWQgdG8gcHJvZ3Jlc3Mu
DQo+IA0KDQpPaCwgSSBzZWUuIFRoYXQgaW1wbGljYXRpb24gd2FzIG5vdCBhdCBhbGwgb2J2aW91
cyB0byBtZS4gSSB0aG91Z2h0IGhlIHdhcyBqdXN0IGFmdGVyIGJlaW5nIGFibGUgdG8gJ2Rlc3Ry
b3knIGFzIG1hbnkgdGltZXMgYXMgaXQgdG9vayB0byBmaW5pc2gsIGluIHdoaWNoIGNhc2Ugb3Vy
IGNob2ljZSBmb3IgdGhlIHZhbHVlIG9mIElOVkFMSURfTUZOIGlzIGluZGVlZCB1bmZvcnR1bmF0
ZS4gSWYgdGhhdCdzIHRoZSBnb2FsIEknbGwgc3dpdGNoIHRvIHVzZSBfbWZuKDApIGFzIGEgY29t
cGFyYXRvci4NCg0KICBQYXVsDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnBy
b2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94
ZW4tZGV2ZWw=
