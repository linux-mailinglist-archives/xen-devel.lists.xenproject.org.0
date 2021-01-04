Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6922E93BA
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 11:54:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61114.107264 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwNUw-0003jf-Bl; Mon, 04 Jan 2021 10:54:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61114.107264; Mon, 04 Jan 2021 10:54:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwNUw-0003jK-8J; Mon, 04 Jan 2021 10:54:02 +0000
Received: by outflank-mailman (input) for mailman id 61114;
 Mon, 04 Jan 2021 10:54:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AZHm=GH=amazon.com=prvs=631e8c9b0=famzheng@srs-us1.protection.inumbo.net>)
 id 1kwNUu-0003jC-Vf
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 10:54:01 +0000
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5c1ed5d-037d-4aab-b0cf-5100a90981e0;
 Mon, 04 Jan 2021 10:54:00 +0000 (UTC)
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 04 Jan 2021 10:53:53 +0000
Received: from EX13D38EUB001.ant.amazon.com
 (iad12-ws-svc-p26-lb9-vlan2.iad.amazon.com [10.40.163.34])
 by email-inbound-relay-1d-74cf8b49.us-east-1.amazon.com (Postfix) with ESMTPS
 id D6542C07E3; Mon,  4 Jan 2021 10:53:49 +0000 (UTC)
Received: from EX13D38EUB001.ant.amazon.com (10.43.166.110) by
 EX13D38EUB001.ant.amazon.com (10.43.166.110) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Mon, 4 Jan 2021 10:53:48 +0000
Received: from EX13D38EUB001.ant.amazon.com ([10.43.166.110]) by
 EX13D38EUB001.ant.amazon.com ([10.43.166.110]) with mapi id 15.00.1497.010;
 Mon, 4 Jan 2021 10:53:48 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: d5c1ed5d-037d-4aab-b0cf-5100a90981e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1609757641; x=1641293641;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ESSKooXLRbIbEzCOjGjQLFz9302kdRCRh0qSilXQmAY=;
  b=NrERQfJuOfm2I4qW2pjIeBkiFLHoqVgHYQDpzt4RJzwy2u3VqDKLH2Cd
   owiggglGM3EOH/QWVXAF/1Vbp7w2iKjSFzk4X6q7j+qLY4EWyURDG4jUm
   L11ebf4DqeGWHrT0bk03XAPyK5ZLM+nzbCbd7TeJgKxSR+GbYPQQiYl7Z
   Q=;
X-IronPort-AV: E=Sophos;i="5.78,473,1599523200"; 
   d="scan'208";a="109246400"
From: "Zheng, Fam" <famzheng@amazon.com>
To: "roger.pau@citrix.com" <roger.pau@citrix.com>, "sstabellini@kernel.org"
	<sstabellini@kernel.org>
CC: "julien@xen.org" <julien@xen.org>, "cardoe@cardoe.com"
	<cardoe@cardoe.com>, "wl@xen.org" <wl@xen.org>, "andrew.cooper3@citrix.com"
	<andrew.cooper3@citrix.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>, "Bertrand.Marquis@arm.com"
	<Bertrand.Marquis@arm.com>
Subject: Re: [PATCH 0/4] xen: domain-tracked allocations, and fault injection
Thread-Topic: [PATCH 0/4] xen: domain-tracked allocations, and fault injection
Thread-Index: AQHW4ofhGP7lHz+ZS0mPaP0LvUNf8g==
Date: Mon, 4 Jan 2021 10:53:48 +0000
Message-ID: <42a74737f4f04d3f0ee21c299193a268b60f6fc8.camel@amazon.com>
References: <160874604800.15699.17952392608790984041@600e7e483b3a>
	 <alpine.DEB.2.21.2012231143430.4040@sstabellini-ThinkPad-T480s>
	 <e7ad4670-7e7e-99f3-1800-b097b6a1695f@citrix.com>
	 <alpine.DEB.2.21.2012231209170.4040@sstabellini-ThinkPad-T480s>
	 <20210104093839.2tjtxyjhu4e6okra@Air-de-Roger>
In-Reply-To: <20210104093839.2tjtxyjhu4e6okra@Air-de-Roger>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.164.204]
Content-Type: text/plain; charset="utf-8"
Content-ID: <4DB34206E340BF4E90401CEE9429B0FF@amazon.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk

T24gTW9uLCAyMDIxLTAxLTA0IGF0IDEwOjM4ICswMTAwLCBSb2dlciBQYXUgTW9ubsOpIHdyb3Rl
Og0KPiBPbiBXZWQsIERlYyAyMywgMjAyMCBhdCAxMjoxMDo0M1BNIC0wODAwLCBTdGVmYW5vIFN0
YWJlbGxpbmkgd3JvdGU6DQo+ID4gT24gV2VkLCAyMyBEZWMgMjAyMCwgQW5kcmV3IENvb3BlciB3
cm90ZToNCj4gPiA+IE9uIDIzLzEyLzIwMjAgMTk6NDUsIFN0ZWZhbm8gU3RhYmVsbGluaSB3cm90
ZToNCj4gPiA+ID4gT24gV2VkLCAyMyBEZWMgMjAyMCwgbm8tcmVwbHlAcGF0Y2hldy5vcmcgd3Jv
dGU6DQo+ID4gPiA+ID4gSGksDQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gUGF0Y2hldyBhdXRvbWF0
aWNhbGx5IHJhbiBnaXRsYWItY2kgcGlwZWxpbmUgd2l0aCB0aGlzIHBhdGNoDQo+ID4gPiA+ID4g
KHNlcmllcykgYXBwbGllZCwgYnV0IHRoZSBqb2IgZmFpbGVkLiBNYXliZSB0aGVyZSdzIGEgYnVn
IGluDQo+ID4gPiA+ID4gdGhlIHBhdGNoZXM/DQo+ID4gPiA+ID4gDQo+ID4gPiA+ID4gWW91IGNh
biBmaW5kIHRoZSBsaW5rIHRvIHRoZSBwaXBlbGluZSBuZWFyIHRoZSBlbmQgb2YgdGhlDQo+ID4g
PiA+ID4gcmVwb3J0IGJlbG93Og0KPiA+ID4gPiA+IA0KPiA+ID4gPiA+IFR5cGU6IHNlcmllcw0K
PiA+ID4gPiA+IE1lc3NhZ2UtaWQ6IDIwMjAxMjIzMTYzNDQyLjg4NDAtMS1hbmRyZXcuY29vcGVy
M0BjaXRyaXguY29tDQo+ID4gPiA+ID4gU3ViamVjdDogW1BBVENIIDAvNF0geGVuOiBkb21haW4t
dHJhY2tlZCBhbGxvY2F0aW9ucywgYW5kDQo+ID4gPiA+ID4gZmF1bHQgaW5qZWN0aW9uDQo+ID4g
PiA+ID4gDQo+ID4gPiA+ID4gPT09IFRFU1QgU0NSSVBUIEJFR0lOID09PQ0KPiA+ID4gPiA+ICMh
L2Jpbi9iYXNoDQo+ID4gPiA+ID4gc2xlZXAgMTANCj4gPiA+ID4gPiBwYXRjaGV3IGdpdGxhYi1w
aXBlbGluZS1jaGVjayAtcCB4ZW4tcHJvamVjdC9wYXRjaGV3L3hlbg0KPiA+ID4gPiA+ID09PSBU
RVNUIFNDUklQVCBFTkQgPT09DQo+ID4gPiA+IA0KPiA+ID4gPiBbLi4uXQ0KPiA+ID4gPiANCj4g
PiA+ID4gPiA9PT0gT1VUUFVUIEJFR0lOID09PQ0KPiA+ID4gPiA+IFsyMDIwLTEyLTIzIDE2OjM4
OjQzXSBMb29raW5nIHVwIHBpcGVsaW5lLi4uDQo+ID4gPiA+ID4gWzIwMjAtMTItMjMgMTY6Mzg6
NDNdIEZvdW5kIHBpcGVsaW5lIDIzMzg4OTc2MzoNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiANCmh0
dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9wYXRjaGV3L3hlbi8tL3BpcGVsaW5lcy8yMzM4
ODk3NjMNCj4gPiA+ID4gDQo+ID4gPiA+IFRoaXMgc2VlbXMgdG8gYmUgYSBnZW51aW5lIGZhaWx1
cmUuIExvb2tpbmcgYXQgdGhlIGFscGluZS0zLjEyLQ0KPiA+ID4gPiBnY2MtYXJtNjQNCj4gPiA+
ID4gYnVpbGQgdGVzdCwgdGhlIGJ1aWxkIGVycm9yIGlzIGFwcGVuZGVkIGJlbG93LiBUaGlzIGlz
IGEgbGluaw0KPiA+ID4gPiB0byB0aGUNCj4gPiA+ID4gZmFpbGVkIGpvYjogDQo+ID4gPiA+IGh0
dHBzOi8vZ2l0bGFiLmNvbS94ZW4tcHJvamVjdC9wYXRjaGV3L3hlbi8tL2pvYnMvOTI5ODQyNjI4
DQo+ID4gPiA+IA0KPiA+ID4gPiANCj4gPiA+ID4gDQo+ID4gPiA+IGdjYyAgLURCVUlMRF9JRCAt
Zm5vLXN0cmljdC1hbGlhc2luZyAtc3RkPWdudTk5IC1XYWxsIC1Xc3RyaWN0LQ0KPiA+ID4gPiBw
cm90b3R5cGVzIC1XZGVjbGFyYXRpb24tYWZ0ZXItc3RhdGVtZW50IC1Xbm8tdW51c2VkLWJ1dC1z
ZXQtDQo+ID4gPiA+IHZhcmlhYmxlIC1Xbm8tdW51c2VkLWxvY2FsLXR5cGVkZWZzICAgLU8yIC1m
b21pdC1mcmFtZS1wb2ludGVyDQo+ID4gPiA+IC1EX19YRU5fSU5URVJGQUNFX1ZFUlNJT05fXz1f
X1hFTl9MQVRFU1RfSU5URVJGQUNFX1ZFUlNJT05fXw0KPiA+ID4gPiAtTU1EIC1NUCAtTUYgLnhl
bi1kaWFnLm8uZCAtRF9MQVJHRUZJTEVfU09VUkNFDQo+ID4gPiA+IC1EX0xBUkdFRklMRTY0X1NP
VVJDRSAgIC1XZXJyb3IgLWluY2x1ZGUgL2J1aWxkcy94ZW4tDQo+ID4gPiA+IHByb2plY3QvcGF0
Y2hldy94ZW4vdG9vbHMvbWlzYy8uLi8uLi90b29scy9jb25maWcuaA0KPiA+ID4gPiAtSS9idWls
ZHMveGVuLQ0KPiA+ID4gPiBwcm9qZWN0L3BhdGNoZXcveGVuL3Rvb2xzL21pc2MvLi4vLi4vdG9v
bHMvaW5jbHVkZQ0KPiA+ID4gPiAtSS9idWlsZHMveGVuLQ0KPiA+ID4gPiBwcm9qZWN0L3BhdGNo
ZXcveGVuL3Rvb2xzL21pc2MvLi4vLi4vdG9vbHMvaW5jbHVkZQ0KPiA+ID4gPiAtRF9fWEVOX1RP
T0xTX18gLUkvYnVpbGRzL3hlbi0NCj4gPiA+ID4gcHJvamVjdC9wYXRjaGV3L3hlbi90b29scy9t
aXNjLy4uLy4uL3Rvb2xzL2luY2x1ZGUNCj4gPiA+ID4gLUkvYnVpbGRzL3hlbi0NCj4gPiA+ID4g
cHJvamVjdC9wYXRjaGV3L3hlbi90b29scy9taXNjLy4uLy4uL3Rvb2xzL2luY2x1ZGUNCj4gPiA+
ID4gLUkvYnVpbGRzL3hlbi0NCj4gPiA+ID4gcHJvamVjdC9wYXRjaGV3L3hlbi90b29scy9taXNj
Ly4uLy4uL3Rvb2xzL2luY2x1ZGUgLVduby0NCj4gPiA+ID4gZGVjbGFyYXRpb24tYWZ0ZXItc3Rh
dGVtZW50ICAtYyAtbyB4ZW4tZGlhZy5vIHhlbi1kaWFnLmMgDQo+ID4gPiA+IHhlbi1mYXVsdC10
dGwuYzogSW4gZnVuY3Rpb24gJ21haW4nOg0KPiA+ID4gPiB4ZW4tZmF1bHQtdHRsLmM6MjU6MTQ6
IGVycm9yOiAnc3RydWN0IHhlbl9hcmNoX2RvbWFpbmNvbmZpZycNCj4gPiA+ID4gaGFzIG5vIG1l
bWJlciBuYW1lZCAnZW11bGF0aW9uX2ZsYWdzJw0KPiA+ID4gPiAgICAyNSB8ICAgICAgICAgICAg
IC5lbXVsYXRpb25fZmxhZ3MgPSBYRU5fWDg2X0VNVV9MQVBJQywNCj4gPiA+ID4gICAgICAgfCAg
ICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+DQo+ID4gPiA+IHhlbi1mYXVsdC10dGwuYzoyNToz
MjogZXJyb3I6ICdYRU5fWDg2X0VNVV9MQVBJQycgdW5kZWNsYXJlZA0KPiA+ID4gPiAoZmlyc3Qg
dXNlIGluIHRoaXMgZnVuY3Rpb24pDQo+ID4gPiA+ICAgIDI1IHwgICAgICAgICAgICAgLmVtdWxh
dGlvbl9mbGFncyA9IFhFTl9YODZfRU1VX0xBUElDLA0KPiA+ID4gPiAgICAgICB8ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBefn5+fn5+fn5+fn5+fn5+fg0KPiA+ID4gPiB4ZW4tZmF1
bHQtdHRsLmM6MjU6MzI6IG5vdGU6IGVhY2ggdW5kZWNsYXJlZCBpZGVudGlmaWVyIGlzDQo+ID4g
PiA+IHJlcG9ydGVkIG9ubHkgb25jZSBmb3IgZWFjaCBmdW5jdGlvbiBpdCBhcHBlYXJzIGluDQo+
ID4gPiA+IG1ha2VbNF06ICoqKiBbL2J1aWxkcy94ZW4tDQo+ID4gPiA+IHByb2plY3QvcGF0Y2hl
dy94ZW4vdG9vbHMvbWlzYy8uLi8uLi90b29scy9SdWxlcy5tazoxNDQ6IHhlbi0NCj4gPiA+ID4g
ZmF1bHQtdHRsLm9dIEVycm9yIDENCj4gPiA+ID4gbWFrZVs0XTogKioqIFdhaXRpbmcgZm9yIHVu
ZmluaXNoZWQgam9icy4uLi4NCj4gPiA+ID4gbWFrZVs0XTogTGVhdmluZyBkaXJlY3RvcnkgJy9i
dWlsZHMveGVuLQ0KPiA+ID4gPiBwcm9qZWN0L3BhdGNoZXcveGVuL3Rvb2xzL21pc2MnDQo+ID4g
PiA+IG1ha2VbM106ICoqKiBbL2J1aWxkcy94ZW4tDQo+ID4gPiA+IHByb2plY3QvcGF0Y2hldy94
ZW4vdG9vbHMvLi4vdG9vbHMvUnVsZXMubWs6MTYwOiBzdWJkaXItDQo+ID4gPiA+IGluc3RhbGwt
bWlzY10gRXJyb3IgMg0KPiA+ID4gPiBtYWtlWzNdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL2J1aWxk
cy94ZW4tDQo+ID4gPiA+IHByb2plY3QvcGF0Y2hldy94ZW4vdG9vbHMnDQo+ID4gPiA+IG1ha2Vb
Ml06ICoqKiBbL2J1aWxkcy94ZW4tDQo+ID4gPiA+IHByb2plY3QvcGF0Y2hldy94ZW4vdG9vbHMv
Li4vdG9vbHMvUnVsZXMubWs6MTU1OiBzdWJkaXJzLQ0KPiA+ID4gPiBpbnN0YWxsXSBFcnJvciAy
DQo+ID4gPiA+IG1ha2VbMl06IExlYXZpbmcgZGlyZWN0b3J5ICcvYnVpbGRzL3hlbi0NCj4gPiA+
ID4gcHJvamVjdC9wYXRjaGV3L3hlbi90b29scycNCj4gPiA+ID4gbWFrZVsxXTogKioqIFtNYWtl
ZmlsZTo2NzogaW5zdGFsbF0gRXJyb3IgMg0KPiA+ID4gPiBtYWtlWzFdOiBMZWF2aW5nIGRpcmVj
dG9yeSAnL2J1aWxkcy94ZW4tDQo+ID4gPiA+IHByb2plY3QvcGF0Y2hldy94ZW4vdG9vbHMnDQo+
ID4gPiA+IG1ha2U6ICoqKiBbTWFrZWZpbGU6MTM0OiBpbnN0YWxsLXRvb2xzXSBFcnJvciAyDQo+
ID4gPiANCj4gPiA+IFllYWggLSB0aGF0IGlzIGEgcmVhbCBmYWlsdXJlLCB3aGljaCBjYW4gYmUg
Zml4ZWQgd2l0aCBhIGxpdHRsZQ0KPiA+ID4gYml0IG9mDQo+ID4gPiBpZmRlZi1hcnkuICBJJ20g
Y29uZnVzZWQgYXMgdG8gd2h5IEkgZGlkbid0IGdldCB0aGF0IGVtYWlsDQo+ID4gPiBkaXJlY3Rs
eS4NCj4gPiANCj4gPiBJdCBsb29rcyBsaWtlIHBhdGNoZXcgZG9lc24ndCB5ZXQgQ0MgdGhlIG9y
aWdpbmFsIGF1dGhvcj8NCj4gDQo+IFdoZXJlIGRvIHBhdGNoZXcgZW1haWxzIGdvPyBJIGhhdmVu
J3Qgc2VlbiBhbnkgb2YgdGhlbSwgYW5kIHRoZXkNCj4gZG9uJ3QNCj4gc2VlbSB0byBnbyB0byB4
ZW4tZGV2ZWwuDQoNCkl0J3MgdG8gbGltaXQgdGhlIG5vaXNlIGxldmVsLiBXZSBpbnRlbmQgdG8g
c3RhYmxpemUgdGhlIHdvcmtmbG93IGENCmxpdHRsZSBtb3JlIGVzcC4gd3J0IGZhbHNlIHBvc2l0
aXZlcyBiZWZvcmUgbWFraW5nIGV2ZXJ5IHJlcGx5IGdvIHRvDQp4ZW4tZGV2ZWwuIFRoZXJlJ3Mg
YSBmZXcgdGhpbmdzIHRvIHR3ZWFrIGluIHBhdGNoZXcuDQoNClRoZSBuZXh0IGxvZ2ljYWwgc3Rl
cCBzaG91bGQgYmUgaW5jbHVkaW5nIHRoZSBwYXRjaCBhdXRob3IgaW4gdGhlIGxvb3ANCkkgdGhp
bmsuDQoNCkZhbQ0KDQo+IA0KPiBUaGFua3MsIFJvZ2VyLg0KPiANCg==

