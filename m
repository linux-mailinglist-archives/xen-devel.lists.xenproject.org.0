Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC1817C160
	for <lists+xen-devel@lfdr.de>; Fri,  6 Mar 2020 16:11:38 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jAEaG-0005ju-Dh; Fri, 06 Mar 2020 15:08:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FvQx=4X=amazon.co.uk=prvs=32702b987=pdurrant@srs-us1.protection.inumbo.net>)
 id 1jAEaE-0005jp-2U
 for xen-devel@lists.xenproject.org; Fri, 06 Mar 2020 15:08:14 +0000
X-Inumbo-ID: 4caf3c10-5fbc-11ea-b74d-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4caf3c10-5fbc-11ea-b74d-bc764e2007e4;
 Fri, 06 Mar 2020 15:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1583507293; x=1615043293;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DtSO0BkNky79hQDhWPBeOoORU+w3ep+Lu+8VRBydYrI=;
 b=JVEYV/kHKAMaFA4ra03Lr0WTg7D/c68lsi3ZT8bxo4NwR0jU0mRg3Ky8
 yAu1xzQDOPVaShrbCtw/FbNhaxDr8Bu53GDsWwTNavgNRhHpW+DDH5H++
 1vVETmCOtVPENqhzDCthWLGBu9cprAcB1BFaPtXWY4huBUVlIi+iEtJsP 4=;
IronPort-SDR: hrdsfvH6dR/fN5UpjP1ikiNpGP8yd19eXG5OVivSA7HPHOPRADg+ur494ylAExczI0JB5leW/V
 iHSndAg+MbDg==
X-IronPort-AV: E=Sophos;i="5.70,522,1574121600"; d="scan'208";a="19930575"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 06 Mar 2020 15:08:00 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-303d0b0e.us-east-1.amazon.com (Postfix) with ESMTPS
 id 4E8CBA0575; Fri,  6 Mar 2020 15:07:58 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 6 Mar 2020 15:07:58 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 6 Mar 2020 15:07:57 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 6 Mar 2020 15:07:57 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>, Jan Beulich <jbeulich@suse.com>, 
 "Gautam, Varad" <vrd@amazon.de>
Thread-Topic: [Xen-devel] [PATCH v3] x86: irq: Do not BUG_ON multiple unbind
 calls for shared pirqs
Thread-Index: AQJ8SDT59uyhxucSdGy6HcZhZ44orwIWBJeGAvYgMkUCPRnjTAFKFuYKpqpjaVA=
Date: Fri, 6 Mar 2020 15:07:57 +0000
Message-ID: <99fe65f9bf354b73b35c0cedffe5aa79@EX13D32EUC003.ant.amazon.com>
References: <1580290087-20636-1-git-send-email-vrd@amazon.de>
 <20200129103050.GV57924@desktop-tdan49n.eng.citrite.net>
 <9bb58eaf-bb85-f0f2-b626-3442532305ac@suse.com>
 <708d6906-455f-108f-3733-e8cf5367deec@suse.com>
 <1179b523b5b94eb29d76d7822031b4a8@EX13D32EUC003.ant.amazon.com>
In-Reply-To: <1179b523b5b94eb29d76d7822031b4a8@EX13D32EUC003.ant.amazon.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.87]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v3] x86: irq: Do not BUG_ON multiple unbind
 calls for shared pirqs
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBYZW4tZGV2ZWwgPHhlbi1kZXZl
bC1ib3VuY2VzQGxpc3RzLnhlbnByb2plY3Qub3JnPiBPbiBCZWhhbGYgT2YgRHVycmFudCwgUGF1
bA0KPiBTZW50OiAwNSBNYXJjaCAyMDIwIDE3OjM3DQo+IFRvOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+OyBHYXV0YW0sIFZhcmFkIDx2cmRAYW1hem9uLmRlPg0KPiBDYzogeGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0
cml4LmNvbT47IEp1bGllbiBHcmFsbA0KPiA8anVsaWVuQHhlbi5vcmc+OyBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPg0KPiBTdWJqZWN0OiBSZTogW1hlbi1kZXZlbF0g
W1BBVENIIHYzXSB4ODY6IGlycTogRG8gbm90IEJVR19PTiBtdWx0aXBsZSB1bmJpbmQgY2FsbHMg
Zm9yIHNoYXJlZCBwaXJxcw0KPiANCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+
IEZyb206IFhlbi1kZXZlbCA8eGVuLWRldmVsLWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+
IE9uIEJlaGFsZiBPZiBKYW4gQmV1bGljaA0KPiA+IFNlbnQ6IDA1IE1hcmNoIDIwMjAgMDk6MzcN
Cj4gPiBUbzogR2F1dGFtLCBWYXJhZCA8dnJkQGFtYXpvbi5kZT4NCj4gPiBDYzogeGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnOyBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRy
aXguY29tPjsgSnVsaWVuIEdyYWxsDQo+ID4gPGp1bGllbkB4ZW4ub3JnPjsgUm9nZXIgUGF1IE1v
bm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+ID4gU3ViamVjdDogUmU6IFtYZW4tZGV2ZWxd
IFtQQVRDSCB2M10geDg2OiBpcnE6IERvIG5vdCBCVUdfT04gbXVsdGlwbGUgdW5iaW5kIGNhbGxz
IGZvciBzaGFyZWQgcGlycXMNCj4gPg0KPiA+IE9uIDI5LjAxLjIwMjAgMTI6NDcsIEphbiBCZXVs
aWNoIHdyb3RlOg0KPiA+ID4gT24gMjkuMDEuMjAyMCAxMTozMCwgUm9nZXIgUGF1IE1vbm7DqSB3
cm90ZToNCj4gPiA+PiBIZWxsbywNCj4gPiA+Pg0KPiA+ID4+IFRoYW5rcyBmb3IgdGhlIHBhdGNo
ISBOZXh0IHRpbWUgY291bGQgeW91IHBsZWFzZSB0cnkgdG8gcmVwbHkgdG8gdGhlDQo+ID4gPj4g
cHJldmlvdXMgcXVlc3Rpb25zIGJlZm9yZSBzZW5kaW5nIGEgbmV3IHZlcnNpb246DQo+ID4gPj4N
Cj4gPiA+PiBodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL2FyY2hpdmVzL2h0bWwveGVuLWRl
dmVsLzIwMTktMDcvbXNnMDAyNTcuaHRtbA0KPiA+ID4+DQo+ID4gPj4gT24gV2VkLCBKYW4gMjks
IDIwMjAgYXQgMTA6Mjg6MDdBTSArMDEwMCwgVmFyYWQgR2F1dGFtIHdyb3RlOg0KPiA+ID4+PiBY
RU5fRE9NQ1RMX2Rlc3Ryb3lkb21haW4gY3JlYXRlcyBhIGNvbnRpbnVhdGlvbiBpZiBkb21haW5f
a2lsbCAtRVJFU1RBUlRTLg0KPiA+ID4+PiBJbiB0aGF0IHNjZW5hcmlvLCBpdCBpcyBwb3NzaWJs
ZSB0byByZWNlaXZlIG11bHRpcGxlIF9waXJxX2d1ZXN0X3VuYmluZA0KPiA+ID4+PiBjYWxscyBm
b3IgdGhlIHNhbWUgcGlycSBmcm9tIGRvbWFpbl9raWxsLCBpZiB0aGUgcGlycSBoYXMgbm90IHll
dCBiZWVuDQo+ID4gPj4+IHJlbW92ZWQgZnJvbSB0aGUgZG9tYWluJ3MgcGlycV90cmVlLCBhczoN
Cj4gPiA+Pj4gICBkb21haW5fa2lsbCgpDQo+ID4gPj4+ICAgICAtPiBkb21haW5fcmVsaW5xdWlz
aF9yZXNvdXJjZXMoKQ0KPiA+ID4+PiAgICAgICAtPiBwY2lfcmVsZWFzZV9kZXZpY2VzKCkNCj4g
PiA+Pj4gICAgICAgICAtPiBwY2lfY2xlYW5fZHBjaV9pcnEoKQ0KPiA+ID4+PiAgICAgICAgICAg
LT4gcGlycV9ndWVzdF91bmJpbmQoKQ0KPiA+ID4+PiAgICAgICAgICAgICAtPiBfX3BpcnFfZ3Vl
c3RfdW5iaW5kKCkNCj4gPiA+Pj4NCj4gPiA+Pj4gRm9yIGEgc2hhcmVkIHBpcnEgKG5yX2d1ZXN0
cyA+IDEpLCB0aGUgZmlyc3QgY2FsbCB3b3VsZCB6YXAgdGhlIGN1cnJlbnQNCj4gPiA+Pj4gZG9t
YWluIGZyb20gdGhlIHBpcnEncyBndWVzdHNbXSBsaXN0LCBidXQgdGhlIGFjdGlvbiBoYW5kbGVy
IGlzIG5ldmVyIGZyZWVkDQo+ID4gPj4+IGFzIHRoZXJlIGFyZSBvdGhlciBndWVzdHMgdXNpbmcg
dGhpcyBwaXJxLiBBcyBhIHJlc3VsdCwgb24gdGhlIHNlY29uZCBjYWxsLA0KPiA+ID4+PiBfX3Bp
cnFfZ3Vlc3RfdW5iaW5kIHNlYXJjaGVzIGZvciB0aGUgY3VycmVudCBkb21haW4gd2hpY2ggaGFz
IGJlZW4gcmVtb3ZlZA0KPiA+ID4+PiBmcm9tIHRoZSBndWVzdHNbXSBsaXN0LCBhbmQgaGl0cyBh
IEJVR19PTi4NCj4gPiA+Pj4NCj4gPiA+Pj4gTWFrZSBfX3BpcnFfZ3Vlc3RfdW5iaW5kIHNhZmUg
dG8gYmUgY2FsbGVkIG11bHRpcGxlIHRpbWVzIGJ5IGxldHRpbmcgeGVuDQo+ID4gPj4+IGNvbnRp
bnVlIGlmIGEgc2hhcmVkIHBpcnEgaGFzIGFscmVhZHkgYmVlbiB1bmJvdW5kIGZyb20gdGhpcyBn
dWVzdC4gVGhlDQo+ID4gPj4+IFBJUlEgd2lsbCBiZSBjbGVhbmVkIHVwIGZyb20gdGhlIGRvbWFp
bidzIHBpcnFfdHJlZSBkdXJpbmcgdGhlIGRlc3RydWN0aW9uDQo+ID4gPj4+IGluIGNvbXBsZXRl
X2RvbWFpbl9kZXN0cm95IGFueXdheXMuDQo+ID4gPj4NCj4gPiA+PiBTbyBBRkFJQ1QgdGhpcyBp
cyBiZWNhdXNlIHB0X3BpcnFfc29mdGlycV9hY3RpdmUoKSByZXR1cm5zIHRydWUgaW4NCj4gPiA+
PiBwY2lfY2xlYW5fZHBjaV9pcnEoKSBhbmQgaGVuY2UgdGhlIGl0ZXJhdGlvbiBpcyBzdG9wcGVk
IGFuZA0KPiA+ID4+IGh2bV9kb21haW5faXJxKGQpLT5kcGNpIGlzIG5vdCBzZXQgdG8gTlVMTC4N
Cj4gPiA+Pg0KPiA+ID4+IFdvdWxkIGl0IGJlIHBvc3NpYmxlIHRvIGNsZWFuIHRoZSBhbHJlYWR5
IHByb2Nlc3NlZCBJUlFzIGZyb20gdGhlDQo+ID4gPj4gZG9tYWluIHBpcnFfdHJlZT8NCj4gPiA+
DQo+ID4gPiBUaGlzIG1pZ2h0IHdvcmssIHBlcmhhcHMgYnkgd2F5IG9mIGludm9raW5nIHVubWFw
X2RvbWFpbl9waXJxKCkNCj4gPiA+IHJpZ2h0IGFmdGVyIHBpcnFfZ3Vlc3RfdW5iaW5kKCksIGFz
IGxvbmcgYXMgaHZtX2RpcnFfYXNzaXN0KCkgKGFzDQo+ID4gPiBjYWxsZWQgZnJvbSBkcGNpX3Nv
ZnRpcnEoKSkgY2FuIGJlIG1hZGUgc2tpcCBhbGwgYWN0dWFsIHdvcmsgaXQNCj4gPiA+IG1lYW5z
IHRvIGRvIGluIHN1Y2ggYSBjYXNlLiBVbmZvcnR1bmF0ZWx5IHRoZSB0d28gLT5tYXNrZWQgZmll
bGRzDQo+ID4gPiBhY3RlZCB1cG9uIGFyZSBkaWZmZXJlbnQgYmV0d2VlbiBfX3BpcnFfZ3Vlc3Rf
dW5iaW5kKCkgYW5kDQo+ID4gPiBodm1fZGlycV9hc3Npc3QoKS4NCj4gPg0KPiA+IFBpbmc/IFVu
bGVzcyBJIGhlYXIgYmFjayBzb29uLCBJJ20gYWZyYWlkIEknbSBnb2luZyB0byBkcm9wIHRoaXMN
Cj4gPiBwYXRjaCBmcm9tIG15ICJwZW5kaW5nIiBtYWlsIGZvbGRlciwgYXMgbm90IGJlaW5nIGFn
cmVlZCB3aGV0aGVyDQo+ID4gdG8gc3RpY2sgdG8gdGhlIGN1cnJlbnQgdmVyc2lvbiBvciB3aGV0
aGVyIHRvIGdvIHRoaXMgYWx0ZXJuYXRpdmUNCj4gPiByb3V0ZS4gQSBtb3JlICJuYXR1cmFsIiBh
cHByb2FjaCB0byBmaXhpbmcgdGhlIGlzc3VlIHdvdWxkIGJlDQo+ID4gcXVpdGUgbmljZSwgYWZ0
ZXIgYWxsLg0KPiANCj4gSSdsbCB0cnkgdG8gcGljayB0aGlzIHVwIHRvbW9ycm93IGFzIEkgaGVs
cGVkIGRpYWdub3NlIHRoZSBwcm9ibGVtIGJlaW5nIGZpeGVkLg0KPiANCg0KSSdtIGxvb2tpbmcg
YXQgdGhpcyBub3cgYW5kIEkgYW0gZmluZGluZyB0aGUgY29kZSB2ZXJ5IGNvbmZ1c2luZywgYnV0
IEkgdGhpbmsgd2UgY291bGQgYWNoaWV2ZSB0aGUgY2xlYW51cCBieSBwYXNzaW5nIGJhY2sgdGhl
IGlycSBpbmRleCBvdXQgb2YgX19waXJxX2d1ZXN0X3VuYmluZCgpIHN1Y2ggdGhhdCBwaXJxX2d1
ZXN0X3VuYmluZCgpIGNhbiBjYWxsIGNsZWFuX2RvbWFpbl9pcnFfcGlycSgpLiBJIHN0aWxsIGhh
dmVuJ3QgZ290IG11Y2ggb2YgYSBjbHVlIGFzIHRvIGhvdyBhbGwgdGhlIGRhdGEgc3RydWN0dXJl
cyBoYW5nIHRvZ2V0aGVyIHRob3VnaC4NCg0KICBQYXVsDQoNCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
