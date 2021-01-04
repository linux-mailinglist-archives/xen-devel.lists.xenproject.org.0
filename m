Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B47D2E928C
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 10:25:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61029.107076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwM6W-0002vo-6b; Mon, 04 Jan 2021 09:24:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61029.107076; Mon, 04 Jan 2021 09:24:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwM6W-0002vP-38; Mon, 04 Jan 2021 09:24:44 +0000
Received: by outflank-mailman (input) for mailman id 61029;
 Mon, 04 Jan 2021 09:11:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AZHm=GH=amazon.com=prvs=631e8c9b0=famzheng@srs-us1.protection.inumbo.net>)
 id 1kwLto-00023f-2E
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 09:11:36 +0000
Received: from smtp-fw-9103.amazon.com (unknown [207.171.188.200])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c77addfb-541c-46ef-9405-334a8c7b3f99;
 Mon, 04 Jan 2021 09:11:34 +0000 (UTC)
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9103.sea19.amazon.com with ESMTP;
 04 Jan 2021 09:11:26 +0000
Received: from EX13D38EUB001.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-1a-e34f1ddc.us-east-1.amazon.com (Postfix) with ESMTPS
 id A6B7CA1BB0; Mon,  4 Jan 2021 09:11:23 +0000 (UTC)
Received: from EX13D38EUB001.ant.amazon.com (10.43.166.110) by
 EX13D38EUB001.ant.amazon.com (10.43.166.110) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 4 Jan 2021 09:11:22 +0000
Received: from EX13D38EUB001.ant.amazon.com ([10.43.166.110]) by
 EX13D38EUB001.ant.amazon.com ([10.43.166.110]) with mapi id 15.00.1497.010;
 Mon, 4 Jan 2021 09:11:22 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: c77addfb-541c-46ef-9405-334a8c7b3f99
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1609751494; x=1641287494;
  h=from:to:cc:date:message-id:references:in-reply-to:
   content-id:content-transfer-encoding:mime-version:subject;
  bh=G/Gk61z/69CmpXuzyeY2pMaAD3csR4rmPw7tEqtA0sI=;
  b=eqT1hcQUuaLTcF8n1o3tgf0cs9YXfAXiZRtscjgPoF4zO2Sd7cZbDwAV
   CU/dnnb4QtqKiw4nQ67iRURSs9DSbxQA9i+AyVZwxn+5wpy5N4w6RfsYY
   9hHbDWeKU2A31P05gF5KNHeGrzY43qGJXiAWTojSEG5G6YoIyCoYEPxZy
   g=;
X-IronPort-AV: E=Sophos;i="5.78,473,1599523200"; 
   d="scan'208";a="907879233"
Subject: Re: [PATCH 0/4] xen: domain-tracked allocations, and fault injection
Thread-Topic: [PATCH 0/4] xen: domain-tracked allocations, and fault injection
From: "Zheng, Fam" <famzheng@amazon.com>
To: "sstabellini@kernel.org" <sstabellini@kernel.org>,
	"andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>
CC: "cardoe@cardoe.com" <cardoe@cardoe.com>, "wl@xen.org" <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	"julien@xen.org" <julien@xen.org>, "Bertrand.Marquis@arm.com"
	<Bertrand.Marquis@arm.com>
Thread-Index: AQHW2VTFCzXmxkCGdUebUXB7tJ/uvaoFFc2AgAAEeQCAAAJygIASI8IA
Date: Mon, 4 Jan 2021 09:11:22 +0000
Message-ID: <b0e0eabd442f910817c74f406af887cf673f6ef9.camel@amazon.com>
References: <160874604800.15699.17952392608790984041@600e7e483b3a>
	 <alpine.DEB.2.21.2012231143430.4040@sstabellini-ThinkPad-T480s>
	 <e7ad4670-7e7e-99f3-1800-b097b6a1695f@citrix.com>
	 <alpine.DEB.2.21.2012231209170.4040@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2012231209170.4040@sstabellini-ThinkPad-T480s>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.204]
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0650CAB7B2AE642B0D6AD4DDB160FF5@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0

T24gV2VkLCAyMDIwLTEyLTIzIGF0IDEyOjEwIC0wODAwLCBTdGVmYW5vIFN0YWJlbGxpbmkgd3Jv
dGU6DQo+IENBVVRJT046IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhl
IG9yZ2FuaXphdGlvbi4gRG8NCj4gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMg
dW5sZXNzIHlvdSBjYW4gY29uZmlybSB0aGUgc2VuZGVyDQo+IGFuZCBrbm93IHRoZSBjb250ZW50
IGlzIHNhZmUuDQo+IA0KPiANCj4gDQo+IE9uIFdlZCwgMjMgRGVjIDIwMjAsIEFuZHJldyBDb29w
ZXIgd3JvdGU6DQo+ID4gT24gMjMvMTIvMjAyMCAxOTo0NSwgU3RlZmFubyBTdGFiZWxsaW5pIHdy
b3RlOg0KPiA+ID4gT24gV2VkLCAyMyBEZWMgMjAyMCwgbm8tcmVwbHlAcGF0Y2hldy5vcmcgd3Jv
dGU6DQo+ID4gPiA+IEhpLA0KPiA+ID4gPiANCj4gPiA+ID4gUGF0Y2hldyBhdXRvbWF0aWNhbGx5
IHJhbiBnaXRsYWItY2kgcGlwZWxpbmUgd2l0aCB0aGlzIHBhdGNoDQo+ID4gPiA+IChzZXJpZXMp
IGFwcGxpZWQsIGJ1dCB0aGUgam9iIGZhaWxlZC4gTWF5YmUgdGhlcmUncyBhIGJ1ZyBpbg0KPiA+
ID4gPiB0aGUgcGF0Y2hlcz8NCj4gPiA+ID4gDQo+ID4gPiA+IFlvdSBjYW4gZmluZCB0aGUgbGlu
ayB0byB0aGUgcGlwZWxpbmUgbmVhciB0aGUgZW5kIG9mIHRoZQ0KPiA+ID4gPiByZXBvcnQgYmVs
b3c6DQo+ID4gPiA+IA0KPiA+ID4gPiBUeXBlOiBzZXJpZXMNCj4gPiA+ID4gTWVzc2FnZS1pZDog
MjAyMDEyMjMxNjM0NDIuODg0MC0xLWFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20NCj4gPiA+ID4g
U3ViamVjdDogW1BBVENIIDAvNF0geGVuOiBkb21haW4tdHJhY2tlZCBhbGxvY2F0aW9ucywgYW5k
IGZhdWx0DQo+ID4gPiA+IGluamVjdGlvbg0KPiA+ID4gPiANCj4gPiA+ID4gPT09IFRFU1QgU0NS
SVBUIEJFR0lOID09PQ0KPiA+ID4gPiAjIS9iaW4vYmFzaA0KPiA+ID4gPiBzbGVlcCAxMA0KPiA+
ID4gPiBwYXRjaGV3IGdpdGxhYi1waXBlbGluZS1jaGVjayAtcCB4ZW4tcHJvamVjdC9wYXRjaGV3
L3hlbg0KPiA+ID4gPiA9PT0gVEVTVCBTQ1JJUFQgRU5EID09PQ0KPiA+ID4gDQo+ID4gPiBbLi4u
XQ0KPiA+ID4gDQo+ID4gPiA+ID09PSBPVVRQVVQgQkVHSU4gPT09DQo+ID4gPiA+IFsyMDIwLTEy
LTIzIDE2OjM4OjQzXSBMb29raW5nIHVwIHBpcGVsaW5lLi4uDQo+ID4gPiA+IFsyMDIwLTEyLTIz
IDE2OjM4OjQzXSBGb3VuZCBwaXBlbGluZSAyMzM4ODk3NjM6DQo+ID4gPiA+IA0KPiA+ID4gPiAN
Cmh0dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9wYXRjaGV3L3hlbi8tL3BpcGVsaW5lcy8y
MzM4ODk3NjMNCj4gPiA+IA0KPiA+ID4gVGhpcyBzZWVtcyB0byBiZSBhIGdlbnVpbmUgZmFpbHVy
ZS4gTG9va2luZyBhdCB0aGUgYWxwaW5lLTMuMTItDQo+ID4gPiBnY2MtYXJtNjQNCj4gPiA+IGJ1
aWxkIHRlc3QsIHRoZSBidWlsZCBlcnJvciBpcyBhcHBlbmRlZCBiZWxvdy4gVGhpcyBpcyBhIGxp
bmsgdG8NCj4gPiA+IHRoZQ0KPiA+ID4gZmFpbGVkIGpvYjogDQo+ID4gPiBodHRwczovL2dpdGxh
Yi5jb20veGVuLXByb2plY3QvcGF0Y2hldy94ZW4vLS9qb2JzLzkyOTg0MjYyOA0KPiA+ID4gDQo+
ID4gPiANCj4gPiA+IA0KPiA+ID4gZ2NjICAtREJVSUxEX0lEIC1mbm8tc3RyaWN0LWFsaWFzaW5n
IC1zdGQ9Z251OTkgLVdhbGwgLVdzdHJpY3QtDQo+ID4gPiBwcm90b3R5cGVzIC1XZGVjbGFyYXRp
b24tYWZ0ZXItc3RhdGVtZW50IC1Xbm8tdW51c2VkLWJ1dC1zZXQtDQo+ID4gPiB2YXJpYWJsZSAt
V25vLXVudXNlZC1sb2NhbC10eXBlZGVmcyAgIC1PMiAtZm9taXQtZnJhbWUtcG9pbnRlcg0KPiA+
ID4gLURfX1hFTl9JTlRFUkZBQ0VfVkVSU0lPTl9fPV9fWEVOX0xBVEVTVF9JTlRFUkZBQ0VfVkVS
U0lPTl9fIC1NTUQNCj4gPiA+IC1NUCAtTUYgLnhlbi1kaWFnLm8uZCAtRF9MQVJHRUZJTEVfU09V
UkNFDQo+ID4gPiAtRF9MQVJHRUZJTEU2NF9TT1VSQ0UgICAtV2Vycm9yIC1pbmNsdWRlIC9idWls
ZHMveGVuLQ0KPiA+ID4gcHJvamVjdC9wYXRjaGV3L3hlbi90b29scy9taXNjLy4uLy4uL3Rvb2xz
L2NvbmZpZy5oDQo+ID4gPiAtSS9idWlsZHMveGVuLXByb2plY3QvcGF0Y2hldy94ZW4vdG9vbHMv
bWlzYy8uLi8uLi90b29scy9pbmNsdWRlDQo+ID4gPiAtSS9idWlsZHMveGVuLXByb2plY3QvcGF0
Y2hldy94ZW4vdG9vbHMvbWlzYy8uLi8uLi90b29scy9pbmNsdWRlDQo+ID4gPiAtRF9fWEVOX1RP
T0xTX18gLUkvYnVpbGRzL3hlbi0NCj4gPiA+IHByb2plY3QvcGF0Y2hldy94ZW4vdG9vbHMvbWlz
Yy8uLi8uLi90b29scy9pbmNsdWRlIC1JL2J1aWxkcy94ZW4tDQo+ID4gPiBwcm9qZWN0L3BhdGNo
ZXcveGVuL3Rvb2xzL21pc2MvLi4vLi4vdG9vbHMvaW5jbHVkZSAtSS9idWlsZHMveGVuLQ0KPiA+
ID4gcHJvamVjdC9wYXRjaGV3L3hlbi90b29scy9taXNjLy4uLy4uL3Rvb2xzL2luY2x1ZGUgLVdu
by0NCj4gPiA+IGRlY2xhcmF0aW9uLWFmdGVyLXN0YXRlbWVudCAgLWMgLW8geGVuLWRpYWcubyB4
ZW4tZGlhZy5jDQo+ID4gPiB4ZW4tZmF1bHQtdHRsLmM6IEluIGZ1bmN0aW9uICdtYWluJzoNCj4g
PiA+IHhlbi1mYXVsdC10dGwuYzoyNToxNDogZXJyb3I6ICdzdHJ1Y3QgeGVuX2FyY2hfZG9tYWlu
Y29uZmlnJyBoYXMNCj4gPiA+IG5vIG1lbWJlciBuYW1lZCAnZW11bGF0aW9uX2ZsYWdzJw0KPiA+
ID4gICAgMjUgfCAgICAgICAgICAgICAuZW11bGF0aW9uX2ZsYWdzID0gWEVOX1g4Nl9FTVVfTEFQ
SUMsDQo+ID4gPiAgICAgICB8ICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn4NCj4gPiA+IHhl
bi1mYXVsdC10dGwuYzoyNTozMjogZXJyb3I6ICdYRU5fWDg2X0VNVV9MQVBJQycgdW5kZWNsYXJl
ZA0KPiA+ID4gKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKQ0KPiA+ID4gICAgMjUgfCAgICAg
ICAgICAgICAuZW11bGF0aW9uX2ZsYWdzID0gWEVOX1g4Nl9FTVVfTEFQSUMsDQo+ID4gPiAgICAg
ICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fg0KPiA+
ID4geGVuLWZhdWx0LXR0bC5jOjI1OjMyOiBub3RlOiBlYWNoIHVuZGVjbGFyZWQgaWRlbnRpZmll
ciBpcw0KPiA+ID4gcmVwb3J0ZWQgb25seSBvbmNlIGZvciBlYWNoIGZ1bmN0aW9uIGl0IGFwcGVh
cnMgaW4NCj4gPiA+IG1ha2VbNF06ICoqKiBbL2J1aWxkcy94ZW4tDQo+ID4gPiBwcm9qZWN0L3Bh
dGNoZXcveGVuL3Rvb2xzL21pc2MvLi4vLi4vdG9vbHMvUnVsZXMubWs6MTQ0OiB4ZW4tDQo+ID4g
PiBmYXVsdC10dGwub10gRXJyb3IgMQ0KPiA+ID4gbWFrZVs0XTogKioqIFdhaXRpbmcgZm9yIHVu
ZmluaXNoZWQgam9icy4uLi4NCj4gPiA+IG1ha2VbNF06IExlYXZpbmcgZGlyZWN0b3J5ICcvYnVp
bGRzL3hlbi0NCj4gPiA+IHByb2plY3QvcGF0Y2hldy94ZW4vdG9vbHMvbWlzYycNCj4gPiA+IG1h
a2VbM106ICoqKiBbL2J1aWxkcy94ZW4tDQo+ID4gPiBwcm9qZWN0L3BhdGNoZXcveGVuL3Rvb2xz
Ly4uL3Rvb2xzL1J1bGVzLm1rOjE2MDogc3ViZGlyLWluc3RhbGwtDQo+ID4gPiBtaXNjXSBFcnJv
ciAyDQo+ID4gPiBtYWtlWzNdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL2J1aWxkcy94ZW4tDQo+ID4g
PiBwcm9qZWN0L3BhdGNoZXcveGVuL3Rvb2xzJw0KPiA+ID4gbWFrZVsyXTogKioqIFsvYnVpbGRz
L3hlbi0NCj4gPiA+IHByb2plY3QvcGF0Y2hldy94ZW4vdG9vbHMvLi4vdG9vbHMvUnVsZXMubWs6
MTU1OiBzdWJkaXJzLWluc3RhbGxdIA0KPiA+ID4gRXJyb3IgMg0KPiA+ID4gbWFrZVsyXTogTGVh
dmluZyBkaXJlY3RvcnkgJy9idWlsZHMveGVuLQ0KPiA+ID4gcHJvamVjdC9wYXRjaGV3L3hlbi90
b29scycNCj4gPiA+IG1ha2VbMV06ICoqKiBbTWFrZWZpbGU6Njc6IGluc3RhbGxdIEVycm9yIDIN
Cj4gPiA+IG1ha2VbMV06IExlYXZpbmcgZGlyZWN0b3J5ICcvYnVpbGRzL3hlbi0NCj4gPiA+IHBy
b2plY3QvcGF0Y2hldy94ZW4vdG9vbHMnDQo+ID4gPiBtYWtlOiAqKiogW01ha2VmaWxlOjEzNDog
aW5zdGFsbC10b29sc10gRXJyb3IgMg0KPiA+IA0KPiA+IFllYWggLSB0aGF0IGlzIGEgcmVhbCBm
YWlsdXJlLCB3aGljaCBjYW4gYmUgZml4ZWQgd2l0aCBhIGxpdHRsZSBiaXQNCj4gPiBvZg0KPiA+
IGlmZGVmLWFyeS4gIEknbSBjb25mdXNlZCBhcyB0byB3aHkgSSBkaWRuJ3QgZ2V0IHRoYXQgZW1h
aWwNCj4gPiBkaXJlY3RseS4NCj4gDQo+IEl0IGxvb2tzIGxpa2UgcGF0Y2hldyBkb2Vzbid0IHll
dCBDQyB0aGUgb3JpZ2luYWwgYXV0aG9yPw0KPiANCj4gQWxzbyBub3Qgc3VyZSB3aHkgeW91IHdl
cmVuJ3QgcGFydCBvZiB0aGUgZGVmYXVsdCBDQyBncm91cCBhbnl3YXkuDQoNCkkndmUgYWRkZWQg
QW5kcmV3IHRvIHRoZSBkZWZhdWx0IENjIGxpc3Qgbm93Lg0KDQpGYW0NCg==

