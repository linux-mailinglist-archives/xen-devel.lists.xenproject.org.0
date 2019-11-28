Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C59010CCF8
	for <lists+xen-devel@lfdr.de>; Thu, 28 Nov 2019 17:44:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iaMs7-0002w6-Tl; Thu, 28 Nov 2019 16:42:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=XtxL=ZU=amazon.com=prvs=228fc64b1=pdurrant@srs-us1.protection.inumbo.net>)
 id 1iaMs6-0002vk-1V
 for xen-devel@lists.xenproject.org; Thu, 28 Nov 2019 16:42:26 +0000
X-Inumbo-ID: 0e0b80d8-11fe-11ea-a3d5-12813bfff9fa
Received: from smtp-fw-6001.amazon.com (unknown [52.95.48.154])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e0b80d8-11fe-11ea-a3d5-12813bfff9fa;
 Thu, 28 Nov 2019 16:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
 t=1574959344; x=1606495344;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Hf7G1uak/qQw96Qfg68FBPqoYh/+shUHjAuPl0yYZk4=;
 b=Xg1FCu38enZxjHgUsciz9sGskwM0UIcRZ+pFUh2DTdA0+Ittx/E0JT1N
 H+z27oUnB7pvbyXGMfISAqy9Eym3YzFg6d5zrGAIW7OO51y0MECtkG0zn
 W87pxjfAhOzKm8qYLWrIgLolmDer60QESZLA8Hx7KauxQAnmxPA7z1FQ1 A=;
IronPort-SDR: Q+4anJJFAi95SwHxyAgTdRdymnlOGzOyTDgxHW9dtjtoGd55DxKMwbaEZxs2R4vvAxX0+C4r1q
 EMH/Qh4cpCug==
X-IronPort-AV: E=Sophos;i="5.69,253,1571702400"; 
   d="scan'208";a="6767657"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1a-807d4a99.us-east-1.amazon.com) ([10.124.125.6])
 by smtp-border-fw-out-6001.iad6.amazon.com with ESMTP;
 28 Nov 2019 16:42:24 +0000
Received: from EX13MTAUEA001.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan2.iad.amazon.com [10.40.159.162])
 by email-inbound-relay-1a-807d4a99.us-east-1.amazon.com (Postfix) with ESMTPS
 id B099FA2A6E; Thu, 28 Nov 2019 16:42:19 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA001.ant.amazon.com (10.43.61.243) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 28 Nov 2019 16:42:18 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 28 Nov 2019 16:42:18 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 28 Nov 2019 16:42:17 +0000
From: "Durrant, Paul" <pdurrant@amazon.com>
To: Jan Beulich <jbeulich@suse.com>
Thread-Topic: [PATCH-for-4.13 v4] Rationalize max_grant_frames and
 max_maptrack_frames handling
Thread-Index: AQHVpfPjCfjTFWyjKkeuYYaC1ar4HKegyCkAgAAAj7A=
Date: Thu, 28 Nov 2019 16:42:17 +0000
Message-ID: <96ac078a19ba46a594238e8684d3e0bc@EX13D32EUC003.ant.amazon.com>
References: <20191128135813.8893-1-pdurrant@amazon.com>
 <2fabb6df-0136-d20e-79a5-294f57fae255@suse.com>
In-Reply-To: <2fabb6df-0136-d20e-79a5-294f57fae255@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.244]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH-for-4.13 v4] Rationalize max_grant_frames
 and max_maptrack_frames handling
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
 <marmarek@invisiblethingslab.com>, Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDI4IE5vdmVtYmVyIDIwMTkgMTY6MzcNCj4gVG86IER1cnJh
bnQsIFBhdWwgPHBkdXJyYW50QGFtYXpvbi5jb20+DQo+IENjOiB4ZW4tZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmc7IEFuZHJldyBDb29wZXINCj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
OyBBbnRob255IFBFUkFSRCA8YW50aG9ueS5wZXJhcmRAY2l0cml4LmNvbT47DQo+IEdlb3JnZSBE
dW5sYXAgPGdlb3JnZS5kdW5sYXBAY2l0cml4LmNvbT47IFJvZ2VyIFBhdSBNb25uw6kNCj4gPHJv
Z2VyLnBhdUBjaXRyaXguY29tPjsgVm9sb2R5bXlyIEJhYmNodWsgPFZvbG9keW15cl9CYWJjaHVr
QGVwYW0uY29tPjsNCj4gR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29t
PjsgSWFuIEphY2tzb24NCj4gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+OyBNYXJlayBNYXJj
enlrb3dza2ktR8OzcmVja2kNCj4gPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+OyBT
dGVmYW5vIFN0YWJlbGxpbmkNCj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBLb25yYWQgUnpl
c3p1dGVrIFdpbGsgPGtvbnJhZC53aWxrQG9yYWNsZS5jb20+Ow0KPiBKdWxpZW4gR3JhbGwgPGp1
bGllbkB4ZW4ub3JnPjsgV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQQVRD
SC1mb3ItNC4xMyB2NF0gUmF0aW9uYWxpemUgbWF4X2dyYW50X2ZyYW1lcyBhbmQNCj4gbWF4X21h
cHRyYWNrX2ZyYW1lcyBoYW5kbGluZw0KPiANCj4gT24gMjguMTEuMjAxOSAxNDo1OCwgUGF1bCBE
dXJyYW50IHdyb3RlOg0KPiA+IC0tLSBhL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYw0KPiA+ICsr
KyBiL3hlbi9jb21tb24vZ3JhbnRfdGFibGUuYw0KPiA+IEBAIC04NCwxMSArODQsNDMgQEAgc3Ry
dWN0IGdyYW50X3RhYmxlIHsNCj4gPiAgICAgIHN0cnVjdCBncmFudF90YWJsZV9hcmNoIGFyY2g7
DQo+ID4gIH07DQo+ID4NCj4gPiArc3RhdGljIGludCBfX2luaXQgcGFyc2VfZ250dGFiX2xpbWl0
KGNvbnN0IGNoYXIgKnBhcmFtLCBjb25zdCBjaGFyDQo+ICphcmcsDQo+IA0KPiBObyBfX2luaXQg
cGxlYXNlIGhlcmUgYW5kIGJlbG93LCBmb3IgdGhpcyBiZWluZyBydW50aW1lIG9wdGlvbg0KPiBw
YXJzaW5nIGZ1bmN0aW9ucy4NCj4gDQoNClNvcnJ5LCB5ZXMuLi4gZm9yZ290IGFib3V0IHRoZSBy
dW50aW1lIHBhcnQuDQoNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHVuc2lnbmVkIGludCAqdmFscCkNCj4gPiArew0KPiA+ICsgICAgY29uc3QgY2hhciAqZTsNCj4g
PiArICAgIHVuc2lnbmVkIGxvbmcgdmFsOw0KPiA+ICsNCj4gPiArICAgIHZhbCA9IHNpbXBsZV9z
dHJ0b3VsKGFyZywgJmUsIDApOw0KPiA+ICsgICAgaWYgKCAqZSApDQo+ID4gKyAgICAgICAgcmV0
dXJuIC1FSU5WQUw7DQo+ID4gKw0KPiA+ICsgICAgaWYgKCB2YWwgPD0gSU5UX01BWCApDQo+ID4g
KyAgICAgICAgKnZhbHAgPSB2YWw7DQo+ID4gKyAgICBlbHNlDQo+ID4gKyAgICAgICAgcHJpbnRr
KCJwYXJhbWV0ZXIgXCIlc1wiIHZhbHVlIFwiJXNcIiBpcyBvdXQgb2YgcmFuZ2U7IHVzaW5nDQo+
IHZhbHVlIFwiJXVcIlxuIiwNCj4gPiArICAgICAgICAgICAgICAgcGFyYW0sIGFyZywgKnZhbHAp
Ow0KPiANCj4gQmV0dGVyIHN0b3JlIElOVF9NQVggaW4gdGhpcyBjYXNlIHJhdGhlciB0aGFuIGxl
YXZpbmcgdGhlIHZhbHVlDQo+IHVuY2hhbmdlZD8gT3Igb3RoZXJ3aXNlIC4uLg0KPiANCj4gPiAr
ICAgIHJldHVybiAwOw0KPiANCj4gLi4uIGF0IGxlYXN0IGRvbid0IHJldHVybiBzdWNjZXNzPw0K
DQpUQkggSSB3YXNuJ3Qgc3VyZSB3aGF0IHRoZSBiZXN0IHRoaW5nIHRvIGRvIHdhcy4gSW4gdGhl
IGVuZCBJIG9wdGVkIGZvciB0aGUgd2FybmluZyBhbmQgYSBzdWNjZXNzZnVsIGNvbXBsZXRpb24g
YXMgSSB0aG91Z2h0IGEgZmFpbHVyZSB3b3VsZCBiZSBsYXJnZWx5IHVuaGVscGZ1bC4gSSBjYW4g
Y2hhbmdlIHRoaXMgaW50byBhbiBlcnJvciB0aG91Z2guDQoNCj4gDQo+ID4gK30NCj4gPiArDQo+
ID4gIHVuc2lnbmVkIGludCBfX3JlYWRfbW9zdGx5IG9wdF9tYXhfZ3JhbnRfZnJhbWVzID0gNjQ7
DQo+ID4gLWludGVnZXJfcnVudGltZV9wYXJhbSgiZ250dGFiX21heF9mcmFtZXMiLCBvcHRfbWF4
X2dyYW50X2ZyYW1lcyk7DQo+ID4gKw0KPiA+ICtzdGF0aWMgaW50IF9faW5pdCBwYXJzZV9nbnR0
YWJfbWF4X2ZyYW1lcyhjb25zdCBjaGFyICphcmcpDQo+ID4gK3sNCj4gPiArICAgIHJldHVybiBw
YXJzZV9nbnR0YWJfbGltaXQoImdudHRhYl9tYXhfZnJhbWVzIiwgYXJnLA0KPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAmb3B0X21heF9ncmFudF9mcmFtZXMpOw0KPiA+ICt9DQo+
ID4gK2N1c3RvbV9ydW50aW1lX3BhcmFtKCJnbnR0YWJfbWF4X2ZyYW1lcyIsIHBhcnNlX2dudHRh
Yl9tYXhfZnJhbWVzKTsNCj4gPg0KPiA+ICB1bnNpZ25lZCBpbnQgX19yZWFkX21vc3RseSBvcHRf
bWF4X21hcHRyYWNrX2ZyYW1lcyA9IDEwMjQ7DQo+IA0KPiBBcyBpbmRpY2F0ZWQgdGhpcyB3YW50
cyB0byBiZWNvbWUgc3RhdGljIG5vdy4NCg0KU29ycnkgSSBmb3Jnb3QgYWJvdXQgdGhhdC4NCg0K
ICBQYXVsDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpY
ZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRw
czovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
