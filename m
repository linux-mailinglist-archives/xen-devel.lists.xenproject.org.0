Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CED14D7EB
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 09:48:21 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix5Si-0001pV-IF; Thu, 30 Jan 2020 08:46:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=EN2q=3T=amazon.co.uk=prvs=29183970d=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ix5Sh-0001pQ-7R
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 08:46:07 +0000
X-Inumbo-ID: f422e02e-433c-11ea-8a1d-12813bfff9fa
Received: from smtp-fw-9101.amazon.com (unknown [207.171.184.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f422e02e-433c-11ea-8a1d-12813bfff9fa;
 Thu, 30 Jan 2020 08:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580373967; x=1611909967;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8c1cSPS6goxKjZnVH69FGut6abXuDRoVkveJomcbOlo=;
 b=uvtntLA+CDpwbiy8jhW1bSt197SHcGNLWAZYxUFN6vnnDMen8lWcHyy+
 Y0SCmBhHzwuJnoHFce0xd6E+w65vALUfLYouY2kI5t4l8T9GwdM+xFxGD
 lDwFJUqolvVHHJDTHoG/sq3i6Y2nUay4Y/sSQx2uroBichkafLlMn3ISF g=;
IronPort-SDR: lP959ihDwfeo5WCcWsBSaQJwD3ilDs7jXZyej92eDl5Ky8Mlg0Z6kD/8sLAosVpm+fnci5wWkH
 zphx7y5HKrHg==
X-IronPort-AV: E=Sophos;i="5.70,381,1574121600"; d="scan'208";a="13580385"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 30 Jan 2020 08:45:54 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-38ae4ad2.us-east-1.amazon.com (Postfix) with ESMTPS
 id 1EF61A20A8; Thu, 30 Jan 2020 08:45:50 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Thu, 30 Jan 2020 08:45:50 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Thu, 30 Jan 2020 08:45:49 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Thu, 30 Jan 2020 08:45:49 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: =?utf-8?B?TWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tp?=
 <marmarek@invisiblethingslab.com>
Thread-Topic: [Xen-devel] [PATCH v4 2/2] docs/designs: Add a design document
 for migration of xenstore data
Thread-Index: AQHV1rL7qel1CZFAGUGnYMvRiAuikKgCJzqAgAC5NNA=
Date: Thu, 30 Jan 2020 08:45:49 +0000
Message-ID: <6ac0ec3ffd1749b79a34c3d96d99ccf4@EX13D32EUC003.ant.amazon.com>
References: <20200129144702.1543-1-pdurrant@amazon.com>
 <20200129144702.1543-3-pdurrant@amazon.com> <20200129212313.GD2995@mail-itl>
In-Reply-To: <20200129212313.GD2995@mail-itl>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.63]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v4 2/2] docs/designs: Add a design document
 for migration of xenstore data
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYXJlayBNYXJjenlrb3dza2kt
R8OzcmVja2kgPG1hcm1hcmVrQGludmlzaWJsZXRoaW5nc2xhYi5jb20+DQo+IFNlbnQ6IDI5IEph
bnVhcnkgMjAyMCAyMToyMw0KPiBUbzogRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNv
LnVrPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnOyBTdGVmYW5vIFN0YWJl
bGxpbmkNCj4gPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+OyBKdWxpZW4gR3JhbGwgPGp1bGllbkB4
ZW4ub3JnPjsgV2VpIExpdQ0KPiA8d2xAeGVuLm9yZz47IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8
a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IEdlb3JnZQ0KPiBEdW5sYXAgPEdlb3JnZS5EdW5sYXBA
ZXUuY2l0cml4LmNvbT47IEFuZHJldyBDb29wZXINCj4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5j
b20+OyBJYW4gSmFja3NvbiA8aWFuLmphY2tzb25AZXUuY2l0cml4LmNvbT4NCj4gU3ViamVjdDog
UmU6IFtYZW4tZGV2ZWxdIFtQQVRDSCB2NCAyLzJdIGRvY3MvZGVzaWduczogQWRkIGEgZGVzaWdu
DQo+IGRvY3VtZW50IGZvciBtaWdyYXRpb24gb2YgeGVuc3RvcmUgZGF0YQ0KPiANCj4gT24gV2Vk
LCBKYW4gMjksIDIwMjAgYXQgMDI6NDc6MDJQTSArMDAwMCwgUGF1bCBEdXJyYW50IHdyb3RlOg0K
PiANCj4gPHNuaXA+DQo+IA0KPiA+ICsqKm5vZGUgZGF0YSoqDQo+ID4gKw0KPiA+ICsNCj4gPiAr
YDxwYXRoPnw8dmFsdWU+fDxwZXJtLWFzLXN0cmluZz58YA0KPiA+ICsNCj4gPiArDQo+ID4gK2A8
cGF0aD5gIGlzIGNvbnNpZGVyZWQgcmVsYXRpdmUgdG8gdGhlIGRvbWFpbiBwYXRoDQo+IGAvbG9j
YWwvZG9tYWluLyRkb21pZGANCj4gPiArYW5kIGhlbmNlIG11c3Qgbm90IGJlZ2luIHdpdGggYC9g
Lg0KPiANCj4gSG93IGJhY2tlbmQgc2V0dGluZ3MgYXJlIGdvaW5nIHRvIGJlIHNlcmlhbGl6ZWQ/
DQoNClRoZXkncmUgbm90IGdvaW5nIHRvIGJlLiBUaGUgdG9vbHN0YWNrIHdpbGwgY29uc3RydWN0
IG5ldyBiYWNrZW5kczsgY28tb3BlcmF0aW9uIHdpbGwgYmUgcmVxdWlyZWQgZnJvbSB0aGVtIGlu
IHRoYXQgdGhleSBtdXN0IHN1cHBvcnQgcmUtYmluZGluZyAod2hpY2ggdGhlIGxhdGVzdCB2ZXJz
aW9ucyBvZiBibGtiYWNrIGFuZCBuZXRiYWNrIGRvKS4gV2Ugd2lsbCBuZWVkIHRvIHdoaXRlLWxp
c3QgYmFja2VuZHMgdGhhdCBhcmUga25vd24gdG8gZG8gdGhpcyBhbmQgcmVmdXNlIG5vbi1jb29w
ZXJhdGl2ZSBtaWdyYXRpb24gaWYgYW55IG90aGVyIGJhY2tlbmQgaXMgdXNlLg0KDQo+IEZvciBl
eGFtcGxlIHZpZiBiYWNrZW5kDQo+IGhhcyBhIGJ1bmNoIG9mIGZlYXR1cmUtKiBlbnRyaWVzLCB3
aGljaCBzaG91bGQgbm90IGNoYW5nZSB1bmRlciB0aGUNCj4gZ3Vlc3QgZmVldCBkdXJpbmcgbm9u
LWNvb3BlcmF0aXZlIG1pZ3JhdGlvbi4NCj4gDQoNClRoZSBmcm9udGVuZCB3aWxsIG5vcm1hbGx5
IGNvbWUgYmFjayBpbiAnY29ubmVjdGVkJyBzdGF0ZSwgaW4gd2hpY2ggY2FzZSBhIGNoYW5nZSBp
biBhbnkgZmVhdHVyZSBmbGFncyB3aWxsIGJlIGlycmVsZXZhbnQgdW50aWwgdGhlIG5leHQgKGlm
IGFueSkgcmUtY29ubmVjdGlvbiAoc2luY2UgdGhlIHByb3RvY29scyBvbmx5IHNhbXBsZSB0aGVt
IGF0IHRoYXQgcG9pbnQpLiBJZiB0aGUgZnJvbnRlbmQgaXMgbm90IGNvbm5lY3RlZCB0aGVuIGl0
IHdpbGwgc2FtcGxlIHRoZSBmZWF0dXJlIGZsYWdzIGluIHRoZSB1c3VhbCB3YXkuIElmIHRoZSBm
cm9udGVuZC9iYWNrZW5kIGFyZSBpbiB0cmFuc2l0aW9uIHRoZW4gdGhlIGxvY2tpbmcgaW4gdGhl
IGJhY2tlbmQgc2hvdWxkIHByZXZlbnQgdGhlICd1bmJpbmQnIGZyb20gY29tcGxldGluZyB1bnRp
bCBzb21lIGxldmVsIG9mIHN0YWJpbGl0eSBoYXMgYmVlbiByZWFjaGVkLg0KDQo+ID4gK2A8cGF0
aD5gIGFuZCBgPHZhbHVlPmAgc2hvdWxkIGJlIHN1aXRhYmxlIHRvIGZvcm11bGF0ZSBhIGBXUklU
RWANCj4gb3BlcmF0aW9uDQo+ID4gK3RvIHRoZSByZWNlaXZpbmcgeGVuc3RvcmUgYW5kIGA8cGVy
bS1hcy1zdHJpbmc+YCBzaG91bGQgYmUgc2ltaWxhcmx5DQo+IHN1aXRhYmxlDQo+ID4gK3RvIGZv
cm11bGF0ZSBhIHN1YnNlcXVlbnQgYFNFVF9QRVJNU2Agb3BlcmF0aW9uLg0KPiA+ICsNCj4gPiAr
Kip3YXRjaCBkYXRhKioNCj4gPiArDQo+ID4gKw0KPiA+ICtgPHBhdGg+fDx0b2tlbj58YA0KPiA+
ICsNCj4gPiArYDxwYXRoPmAgYWdhaW4gaXMgY29uc2lkZXJlZCByZWxhdGl2ZSBhbmQsIHRvZ2V0
aGVyIHdpdGggYDx0b2tlbj5gLA0KPiBzaG91bGQNCj4gPiArYmUgc3VpdGFibGUgdG8gZm9ybXVs
YXRlIGFuIGBBRERfRE9NQUlOX1dBVENIRVNgIG9wZXJhdGlvbiAoc2VlIGJlbG93KS4NCj4gPiAr
DQo+ID4gKw0KPiA+ICsjIyMgUHJvdG9jb2wgRXh0ZW5zaW9uDQo+ID4gKw0KPiA+ICtUaGUgYFdB
VENIYCBvcGVyYXRpb24gZG9lcyBub3QgYWxsb3cgc3BlY2lmaWNhdGlvbiBvZiBhIGA8ZG9taWQ+
YDsgaXQNCj4gaXMNCj4gPiArYXNzdW1lZCB0aGF0IHRoZSB3YXRjaCBwZXJ0YWlucyB0byB0aGUg
ZG9tYWluIHRoYXQgb3ducyB0aGUgc2hhcmVkIHJpbmcNCj4gPiArb3ZlciB3aGljaCB0aGUgb3Bl
cmF0aW9uIGlzIHBhc3NlZC4gSGVuY2UsIGZvciB0aGUgdG9vbC1zdGFjayB0byBiZQ0KPiBhYmxl
DQo+ID4gK3RvIHJlZ2lzdGVyIGEgd2F0Y2ggb24gYmVoYWxmIG9mIGEgZG9tYWluIGEgbmV3IG9w
ZXJhdGlvbiBpcyBuZWVkZWQ6DQo+ID4gKw0KPiA+ICtgYGANCj4gPiArQUREX0RPTUFJTl9XQVRD
SEVTICAgICAgPGRvbWlkPnw8d2F0Y2g+fCsNCj4gPiArDQo+ID4gK0FkZHMgd2F0Y2hlcyBvbiBi
ZWhhbGYgb2YgdGhlIHNwZWNpZmllZCBkb21haW4uDQo+ID4gKw0KPiA+ICs8d2F0Y2g+IGlzIGEg
TlVMIHNlcGFyYXRlZCB0dXBsZSBvZiA8cGF0aD58PHRva2VuPi4gVGhlIHNlbWFudGljcyBvZg0K
PiB0aGlzDQo+ID4gK29wZXJhdGlvbiBhcmUgaWRlbnRpY2FsIHRvIHRoZSBkb21haW4gaXNzdWlu
ZyBXQVRDSCA8cGF0aD58PHRva2VuPnwgZm9yDQo+ID4gK2VhY2ggPHdhdGNoPi4NCj4gPiArYGBg
DQo+IA0KPiBOb3JtYWwgV0FUQ0ggb3BlcmF0aW9uIHRyaWdnZXJzIGFuIGV2ZW50IGltbWVkaWF0
ZWx5LiBJcyBpdCBpbnRlbmRlZCBpbg0KPiB0aGlzIGNhc2UgdG9vPyBPbiB0aGUgb3RoZXIgaGFu
ZCwgZ3Vlc3Qgc2hvdWxkIGNvcGUgd2l0aCBzcHVyaW91cyB3YXRjaA0KPiBldmVudHMsIHNvIHBy
b2JhYmx5IG5vdCBhbiBpc3N1ZS4NCg0KSSBkb24ndCB0aGluayBpdCBtYXR0ZXJzIGlmIG9uZSBp
cyB0cmlnZ2VyZWQgb3Igbm90LiBBcyB5b3Ugc2F5LCB0aGUgd2F0Y2ggcHJvdG9jb2wgYWxsb3dz
IHRoZW0gdG8gc3B1cmlvdXNseSBmaXJlIHNvIHRoZSBndWVzdCBzaG91bGQgY29wZSBlaXRoZXIg
d2F5Lg0KDQo+IA0KPiA+ICtUaGUgd2F0Y2ggaW5mb3JtYXRpb24gZm9yIGEgZG9tYWluIGFsc28g
bmVlZHMgdG8gYmUgZXh0cmFjdGVkIGZyb20gdGhlDQo+ID4gK3NlbmRpbmcgeGVuc3RvcmVkIHNv
IHRoZSBmb2xsb3dpbmcgb3BlcmF0aW9uIGlzIGFsc28gbmVlZGVkOg0KPiA+ICsNCj4gPiArYGBg
DQo+ID4gK0dFVF9ET01BSU5fV0FUQ0hFUyAgICAgIDxkb21pZD58PGluZGV4PiAgIDxnZW5jbnQ+
fDx3YXRjaD58Kg0KPiA+ICsNCj4gPiArR2V0cyB0aGUgbGlzdCBvZiB3YXRjaGVzIHRoYXQgYXJl
IGN1cnJlbnRseSByZWdpc3RlcmVkIGZvciB0aGUgZG9tYWluLg0KPiA+ICsNCj4gPiArPHdhdGNo
PiBpcyBhIE5VTCBzZXBhcmF0ZWQgdHVwbGUgb2YgPHBhdGg+fDx0b2tlbj4uIFRoZSBzdWItbGlz
dA0KPiByZXR1cm5lZA0KPiA+ICt3aWxsIHN0YXJ0IGF0IDxpbmRleD4gaW50byB0aGUgdGhlIG92
ZXJhbGwgbGlzdCBvZiB3YXRjaGVzIGFuZCBtYXkgYmUNCj4gPiArdHJ1bmNhdGVkIHN1Y2ggdGhh
dCB0aGUgcmV0dXJuZWQgZGF0YSBmaXRzIHdpdGhpbiBYRU5TVE9SRV9QQVlMT0FEX01BWC4NCj4g
PiArSWYgPGluZGV4PiBpcyBiZXlvbmQgdGhlIGVuZCBvZiB0aGUgb3ZlcmFsbCBsaXN0IHRoZW4g
dGhlIHJldHVybmVkIHN1Yi0NCj4gPiArbGlzdCB3aWxsIGJlIGVtcHR5LiBJZiB0aGUgdmFsdWUg
b2YgPGdlbmNudD4gY2hhbmdlcyB0aGVuIGl0IGluZGljYXRlcw0KPiA+ICt0aGF0IHRoZSBvdmVy
YWxsIHdhdGNoIGxpc3QgaGFzIGNoYW5nZWQgYW5kIHRodXMgaXQgbWF5IGJlIG5lY2Vzc2FyeQ0K
PiA+ICt0byByZS1pc3N1ZSB0aGUgb3BlcmF0aW9uIGZvciBwcmV2aW91cyB2YWx1ZXMgb2YgPGlu
ZGV4Pi4NCj4gPiArYGBgDQo+IA0KPiBJbiB3aGF0IHVuaXRzIDxpbmRleD4gaXMgZXhwcmVzc2Vk
PyBieXRlcz8gZW50cmllcz8NCg0KSSB0aG91Z2h0IGVudHJpZXMgd2FzIHJlYXNvbmFibHkgd2Vs
bCBpbXBsaWVkIHNpbmNlIEkgcmVmZXIgdG8gYSBsaXN0LCBidXQgSSBjYW4gbWFrZSBpdCBleHBs
aWNpdC4NCg0KPiBDYW4gdGhlIHJlc3BvbnNlIGJlIHRydW5jYXRlZCBhdCBhcmJpdHJhcnkgcGxh
Y2UsIG9yIG9ubHkgYmV0d2Vlbg0KPiByZWNvcmRzPw0KPiANCg0KT25seSBiZXR3ZWVuIHJlY29y
ZHMuIEFnYWluIEknbGwgYWRkIHNvbWUgd29yZHMgdG8gbWFrZSB0aGF0IGNsZWFyLg0KDQogIFBh
dWwNCg0KPiAtLQ0KPiBCZXN0IFJlZ2FyZHMsDQo+IE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNr
aQ0KPiBJbnZpc2libGUgVGhpbmdzIExhYg0KPiBBOiBCZWNhdXNlIGl0IG1lc3NlcyB1cCB0aGUg
b3JkZXIgaW4gd2hpY2ggcGVvcGxlIG5vcm1hbGx5IHJlYWQgdGV4dC4NCj4gUTogV2h5IGlzIHRv
cC1wb3N0aW5nIHN1Y2ggYSBiYWQgdGhpbmc/DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
