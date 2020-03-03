Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF297177971
	for <lists+xen-devel@lfdr.de>; Tue,  3 Mar 2020 15:47:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j98mM-0000Ok-4T; Tue, 03 Mar 2020 14:44:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=x433=4U=amazon.co.uk=prvs=32428865a=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j98mK-0000Of-Vc
 for xen-devel@lists.xenproject.org; Tue, 03 Mar 2020 14:44:13 +0000
X-Inumbo-ID: 72337822-5d5d-11ea-94a0-bc764e2007e4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 72337822-5d5d-11ea-94a0-bc764e2007e4;
 Tue, 03 Mar 2020 14:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1583246653; x=1614782653;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=s0O5ZbPcX6cCV5tjurX3trNa3fR9j3vA+lgxujysMCg=;
 b=IqAD2VHsKglsXuG6pulNr1w6JIIEWsybNn/rMgbxJjem/Fy5v1CS2ErA
 wB8s6xe0uS4jw8t67DzE2urhosbZL1A+ia5aWgH47KTFUt8r72Mcr6vMN
 2I4GKjSkyL97KxjTo4pu95X91AWxu0x5W81VMDR9IDspPZr93RnIfe03k g=;
IronPort-SDR: CwYD4cYm9BPy6h+FFhp5sC0eGti7ZQofzLHmZspj8j4opuz5TSKfBAVdnP4VwaSFVwo12dBgBe
 qIQkwUCo431Q==
X-IronPort-AV: E=Sophos;i="5.70,511,1574121600"; d="scan'208";a="30265201"
Thread-Topic: [PATCH v5 1/4] x86/HVM: cancel emulation when register state got
 altered
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1e-27fb8269.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 03 Mar 2020 14:44:10 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1e-27fb8269.us-east-1.amazon.com (Postfix) with ESMTPS
 id 33ED7A2DB2; Tue,  3 Mar 2020 14:44:07 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Tue, 3 Mar 2020 14:44:07 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Tue, 3 Mar 2020 14:44:06 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Tue, 3 Mar 2020 14:44:06 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>
Thread-Index: AQHV8Wkv/qeFOBaHw06fC2/Sp89AXag28DGA
Date: Tue, 3 Mar 2020 14:44:06 +0000
Message-ID: <43df2a9116d2448592b27dff7f4792d8@EX13D32EUC003.ant.amazon.com>
References: <1e1ccd2a-526c-631b-7889-35f993b2005e@suse.com>
 <146b8935-2a48-2de7-4c21-8390b6846c05@suse.com>
 <e1293a6fcb0942bda81a5690c20a6771@EX13D32EUC003.ant.amazon.com>
 <2bb05913-2573-4799-aa96-d9d0e2d74f0b@suse.com>
 <bd5988b9966b403991f4059216bfb93e@EX13D32EUC003.ant.amazon.com>
 <e98154a1-425d-028c-bb93-42fa7d6aa75e@suse.com>
In-Reply-To: <e98154a1-425d-028c-bb93-42fa7d6aa75e@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.151]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v5 1/4] x86/HVM: cancel emulation when
 register state got altered
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Paul Durrant <paul@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDAzIE1hcmNoIDIwMjAgMTQ6MzQNCj4gVG86IER1cnJhbnQs
IFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jby51az4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZzsgQW5kcmV3IENvb3Blcg0KPiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47
IFJvZ2VyIFBhdSBNb25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgV2VpDQo+IExpdSA8d2xA
eGVuLm9yZz47IFBhdWwgRHVycmFudCA8cGF1bEB4ZW4ub3JnPg0KPiBTdWJqZWN0OiBSRTogW0VY
VEVSTkFMXVtQQVRDSCB2NSAxLzRdIHg4Ni9IVk06IGNhbmNlbCBlbXVsYXRpb24gd2hlbg0KPiBy
ZWdpc3RlciBzdGF0ZSBnb3QgYWx0ZXJlZA0KPiANCj4gQ0FVVElPTjogVGhpcyBlbWFpbCBvcmln
aW5hdGVkIGZyb20gb3V0c2lkZSBvZiB0aGUgb3JnYW5pemF0aW9uLiBEbyBub3QNCj4gY2xpY2sg
bGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGNhbiBjb25maXJtIHRoZSBzZW5k
ZXIgYW5kIGtub3cNCj4gdGhlIGNvbnRlbnQgaXMgc2FmZS4NCj4gDQo+IA0KPiANCj4gT24gMDMu
MDMuMjAyMCAxNToyNSwgRHVycmFudCwgUGF1bCB3cm90ZToNCj4gPj4gLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPg0K
PiA+PiBTZW50OiAwMyBNYXJjaCAyMDIwIDE0OjIxDQo+ID4+IFRvOiBEdXJyYW50LCBQYXVsIDxw
ZHVycmFudEBhbWF6b24uY28udWs+DQo+ID4+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmc7IEFuZHJldyBDb29wZXINCj4gPj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBS
b2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT47DQo+IFdlaQ0KPiA+PiBMaXUg
PHdsQHhlbi5vcmc+OyBQYXVsIER1cnJhbnQgPHBhdWxAeGVuLm9yZz4NCj4gPj4gU3ViamVjdDog
UkU6IFtFWFRFUk5BTF1bWGVuLWRldmVsXSBbUEFUQ0ggdjUgMS80XSB4ODYvSFZNOiBjYW5jZWwN
Cj4gPj4gZW11bGF0aW9uIHdoZW4gcmVnaXN0ZXIgc3RhdGUgZ290IGFsdGVyZWQNCj4gPj4NCj4g
Pj4gT24gMDMuMDMuMjAyMCAxNDoxNiwgRHVycmFudCwgUGF1bCB3cm90ZToNCj4gPj4+PiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+IEZyb206IFhlbi1kZXZlbCA8eGVuLWRldmVs
LWJvdW5jZXNAbGlzdHMueGVucHJvamVjdC5vcmc+IE9uIEJlaGFsZiBPZg0KPiA+PiBKYW4NCj4g
Pj4+PiBCZXVsaWNoDQo+ID4+Pj4gU2VudDogMDMgTWFyY2ggMjAyMCAxMDoxNw0KPiA+Pj4+IFRv
OiB4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcNCj4gPj4+PiBDYzogQW5kcmV3IENvb3Bl
ciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uw6kNCj4gPj4+PiA8
cm9nZXIucGF1QGNpdHJpeC5jb20+OyBXZWkgTGl1IDx3bEB4ZW4ub3JnPjsgUGF1bCBEdXJyYW50
DQo+ID4+IDxwYXVsQHhlbi5vcmc+DQo+ID4+Pj4gU3ViamVjdDogW0VYVEVSTkFMXVtYZW4tZGV2
ZWxdIFtQQVRDSCB2NSAxLzRdIHg4Ni9IVk06IGNhbmNlbA0KPiBlbXVsYXRpb24NCj4gPj4+PiB3
aGVuIHJlZ2lzdGVyIHN0YXRlIGdvdCBhbHRlcmVkDQo+ID4+Pj4NCj4gPj4+PiBSZS1leGVjdXRp
b24gKGFmdGVyIGhhdmluZyByZWNlaXZlZCBkYXRhIGZyb20gYSBkZXZpY2UgbW9kZWwpIHJlbGll
cw0KPiBvbg0KPiA+Pj4+IHRoZSBzYW1lIHJlZ2lzdGVyIHN0YXRlIHN0aWxsIGJlaW5nIGluIHBs
YWNlIGFzIGl0IHdhcyB3aGVuIHRoZQ0KPiByZXF1ZXN0DQo+ID4+Pj4gd2FzIGZpcnN0IHNlbnQg
dG8gdGhlIGRldmljZSBtb2RlbC4gVGhlcmVmb3JlIHZDUFUgc3RhdGUgY2hhbmdlcw0KPiA+Pj4+
IGVmZmVjdGVkIGJ5IHJlbW90ZSBzb3VyY2VzIG5lZWQgdG8gcmVzdWx0IGluIG5vIGF0dGVtcHQg
b2YgcmUtDQo+ID4+IGV4ZWN1dGlvbi4NCj4gPj4+PiBJbnN0ZWFkIHRoZSByZXR1cm5lZCBkYXRh
IGlzIHRvIHNpbXBseSBiZSBpZ25vcmVkLg0KPiA+Pj4+DQo+ID4+Pj4gTm90ZSB0aGF0IGFueSBz
dWNoIGFzeW5jaHJvbm91cyBzdGF0ZSBjaGFuZ2VzIGhhcHBlbiB3aXRoIHRoZSB2Q1BVIGF0DQo+
ID4+Pj4gbGVhc3QgcGF1c2VkIChwb3RlbnRpYWxseSBkb3duIGFuZC9vciBub3QgbWFya2VkIC0+
aXNfaW5pdGlhbGlzZWQpLA0KPiBzbw0KPiA+Pj4+IHRoZXJlJ3Mgbm8gaXNzdWUgd2l0aCBmaWRk
bGluZyB3aXRoIHJlZ2lzdGVyIHN0YXRlIGJlaGluZCB0aGUNCj4gYWN0aXZlbHkNCj4gPj4+PiBy
dW5uaW5nIGVtdWxhdG9yJ3MgYmFjay4gSGVuY2UgdGhlIG5ldyBmdW5jdGlvbiBkb2Vzbid0IG5l
ZWQgdG8NCj4gPj4+PiBzeW5jaHJvbml6ZSB3aXRoIHRoZSBjb3JlIGVtdWxhdGlvbiBsb2dpYy4N
Cj4gPj4+Pg0KPiA+Pj4+IFN1Z2dlc3RlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3Bl
cjNAY2l0cml4LmNvbT4NCj4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+ID4+Pg0KPiA+Pj4gTmVlZCB3ZSBiZSBjb25jZXJuZWQgd2l0aCBhbnkg
cGFnZS1zcGxpdCBJL08gaGVyZT8gVGhhdCBtYXkgbWFuaWZlc3QNCj4gYXMNCj4gPj4+IHR3byBz
ZXBhcmF0ZSBlbXVsYXRpb25zIGFuZCBBRkFJQ1QgaXQgd291bGQgYmUgcG9zc2libGUgZm9yIG9u
bHkgdGhlDQo+ID4+PiBzZWNvbmQgcGFydCB0byBiZSBhYm9ydGVkIGJ5IHRoaXMgY2hhbmdlLg0K
PiA+Pg0KPiA+PiBJJ20gbm90IHN1cmUgd2hldGhlciBlLmcuIElOSVQgaXMgcmVjb2duaXplZCBv
bmx5IG9uIGluc24gYm91bmRhcmllcy4NCj4gPj4gSS5lLiB0aGlzIG1heSBub3QgYmUgdGhhdCBk
aWZmZXJlbnQgZnJvbSByZWFsIGhhcmR3YXJlIGJlaGF2aW9yLiBfSWZfDQo+ID4+IHdlIHdlcmUg
dG8gdGFrZSBjYXJlIG9mIHRoaXMsIGhvdyB3b3VsZCB5b3UgZW52aXNpb24gdW5kb2luZyB0aGUN
Cj4gPj4gZmlyc3QgcGFydCBvZiBzdWNoIGFuIGFjY2VzcywgbW9zdCBub3RhYmx5IHdoZW4gdGhl
IGFjY2VzcyBoYXMgc2lkZQ0KPiA+PiBlZmZlY3RzPw0KPiA+DQo+ID4gSSB3YXNuJ3QgdGhpbmtp
bmcgb2YgdW5kb2luZy4uLiBJIHdhcyBtb3JlIHRoaW5raW5nIHRoYXQgdmNwdV9wYXVzZSgpDQo+
ID4gb3VnaHQgdG8gZGVmZXIgdW50aWwgYW4gaW4tcHJvZ3Jlc3MgZW11bGF0aW9uIGhhcyBmdWxs
eSBjb21wbGV0ZWQuDQo+IA0KPiBIbW0sIGF0IHRoZSBmaXJzdCBnbGFuY2UgdGhpcyBsb29rcyB1
Z2x5L2ZyYWdpbGUgdG8gYXJyYW5nZSBmb3IuIEknbQ0KPiBoYXZpbmcgYSBoYXJkIHRpbWUgdGhp
bmtpbmcgb2YgYSByb3VnaCBza2V0Y2ggb2YgaG93IHN1Y2ggY291bGQgYmUNCj4gbWFkZSB3b3Jr
LCBpbiBwYXJ0aWN1bGFyIHdpdGhvdXQgYmxvY2tpbmcgdGhlIHZjcHVfcGF1c2UoKSBpdHNlbGYN
Cj4gZm9yIHRvbyBsb25nLg0KPiANCg0KSWYgdGhlIHZjcHUgaXMgYXQgdGhlIG1lcmN5IG9mIGFu
IGV4dGVybmFsIGVtdWxhdG9yIGl0IGNvdWxkIHRha2UgYSB3aGlsZS4gSSBjYW4ndCByZWFsbHkg
dGhpbmsgb2YgYSB3YXkgdG8gYXZvaWQgdGhhdCB0aG91Z2guIE1heWJlIHBhdXNpbmcgYXQgYSBu
b24tYXJjaGl0ZWN0dXJhbCBib3VuZGFyeSBpcyBvayBoZXJlIHRob3VnaC4NCg0KICBQYXVsDQoN
Cj4gSmFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
