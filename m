Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC38A1611F6
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2020 13:24:35 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j3fOl-0005qQ-Ux; Mon, 17 Feb 2020 12:21:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=h4oX=4F=amazon.co.uk=prvs=30915cffa=pdurrant@srs-us1.protection.inumbo.net>)
 id 1j3fOk-0005qI-AJ
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2020 12:21:14 +0000
X-Inumbo-ID: fcbb0cce-517f-11ea-b0fd-bc764e2007e4
Received: from smtp-fw-9102.amazon.com (unknown [207.171.184.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id fcbb0cce-517f-11ea-b0fd-bc764e2007e4;
 Mon, 17 Feb 2020 12:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1581942074; x=1613478074;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HBPe/gf1Ts6PN8VulNd8thvV5aovKjmqJYKx4HeJffw=;
 b=d35WdOjF/rTUG0xhqWxQAq/oxB1GZgIrZUqvOuiHZkdlnfAdK/ZrhbgS
 T5Yqo6jz+PQrY/opfEKxVUevI01Cj1kEYijA6w08fp/A4YhZOdNPF4RkJ
 57Lb5EKT4sRvUuHtrgVlKmpmMX69foABMm3hmFmX6qZqWPY7Y69Cyax0D g=;
IronPort-SDR: AZOSN2yjGKegL2v+QBfdghMQej7Wdcn1eFcBUmMOnPREW4RJ7MvRUyT0I1Oweza3uUFN0d8ON9
 e3CaXaHGcS6g==
X-IronPort-AV: E=Sophos;i="5.70,452,1574121600"; d="scan'208";a="25493308"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9102.sea19.amazon.com with ESMTP;
 17 Feb 2020 12:21:12 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2a-f14f4a47.us-west-2.amazon.com (Postfix) with ESMTPS
 id F296DA1806; Mon, 17 Feb 2020 12:21:10 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Mon, 17 Feb 2020 12:21:10 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Mon, 17 Feb 2020 12:21:09 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Mon, 17 Feb 2020 12:21:09 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Thread-Topic: [PATCH v2 2/3] x86/hyperv: skeleton for L0 assisted TLB flush
Thread-Index: AQHV4zM1ogAqmhu8Uk+hk4DrI15YB6ga58mggAReTYCAAAGhgIAABWowgAACU4CAAANjsA==
Date: Mon, 17 Feb 2020 12:21:09 +0000
Message-ID: <f712911e0b344bb1a260652b96260363@EX13D32EUC003.ant.amazon.com>
References: <20200214123430.4942-1-liuwe@microsoft.com>
 <20200214123430.4942-3-liuwe@microsoft.com>
 <b27c6b19151b412aaa2dc33366e71ae7@EX13D32EUC003.ant.amazon.com>
 <20200217113441.c7q2uclargvrleyo@debian> <20200217114031.GF4679@Air-de-Roger>
 <c568cdaedbc346de8d7956796f757ef5@EX13D32EUC003.ant.amazon.com>
 <20200217120813.GH4679@Air-de-Roger>
In-Reply-To: <20200217120813.GH4679@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.60]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v2 2/3] x86/hyperv: skeleton for L0 assisted
 TLB flush
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Wei Liu <liuwe@microsoft.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Michael Kelley <mikelley@microsoft.com>, Jan Beulich <jbeulich@suse.com>,
 Xen Development List <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb2dlciBQYXUgTW9ubsOpIDxy
b2dlci5wYXVAY2l0cml4LmNvbT4NCj4gU2VudDogMTcgRmVicnVhcnkgMjAyMCAxMjowOA0KPiBU
bzogRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPg0KPiBDYzogV2VpIExpdSA8
d2xAeGVuLm9yZz47IFhlbiBEZXZlbG9wbWVudCBMaXN0IDx4ZW4tDQo+IGRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnPjsgTWljaGFlbCBLZWxsZXkgPG1pa2VsbGV5QG1pY3Jvc29mdC5jb20+OyBX
ZWkNCj4gTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPjsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1
c2UuY29tPjsgQW5kcmV3IENvb3Blcg0KPiA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4NCj4g
U3ViamVjdDogUmU6IFtQQVRDSCB2MiAyLzNdIHg4Ni9oeXBlcnY6IHNrZWxldG9uIGZvciBMMCBh
c3Npc3RlZCBUTEIgZmx1c2gNCj4gDQo+IE9uIE1vbiwgRmViIDE3LCAyMDIwIGF0IDEyOjAxOjIz
UE0gKzAwMDAsIER1cnJhbnQsIFBhdWwgd3JvdGU6DQo+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KPiA+ID4gRnJvbTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5j
b20+DQo+ID4gPiBTZW50OiAxNyBGZWJydWFyeSAyMDIwIDExOjQxDQo+ID4gPiBUbzogV2VpIExp
dSA8d2xAeGVuLm9yZz4NCj4gPiA+IENjOiBEdXJyYW50LCBQYXVsIDxwZHVycmFudEBhbWF6b24u
Y28udWs+OyBYZW4gRGV2ZWxvcG1lbnQgTGlzdCA8eGVuLQ0KPiA+ID4gZGV2ZWxAbGlzdHMueGVu
cHJvamVjdC5vcmc+OyBNaWNoYWVsIEtlbGxleSA8bWlrZWxsZXlAbWljcm9zb2Z0LmNvbT47DQo+
IFdlaQ0KPiA+ID4gTGl1IDxsaXV3ZUBtaWNyb3NvZnQuY29tPjsgSmFuIEJldWxpY2ggPGpiZXVs
aWNoQHN1c2UuY29tPjsgQW5kcmV3DQo+IENvb3Blcg0KPiA+ID4gPGFuZHJldy5jb29wZXIzQGNp
dHJpeC5jb20+DQo+ID4gPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDIvM10geDg2L2h5cGVydjog
c2tlbGV0b24gZm9yIEwwIGFzc2lzdGVkIFRMQg0KPiBmbHVzaA0KPiA+ID4NCj4gPiA+IE9uIE1v
biwgRmViIDE3LCAyMDIwIGF0IDExOjM0OjQxQU0gKzAwMDAsIFdlaSBMaXUgd3JvdGU6DQo+ID4g
PiA+IE9uIEZyaSwgRmViIDE0LCAyMDIwIGF0IDA0OjU1OjQ0UE0gKzAwMDAsIER1cnJhbnQsIFBh
dWwgd3JvdGU6DQo+ID4gPiA+ID4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4g
PiA+ID4gRnJvbTogV2VpIExpdSA8d2VpLmxpdS54ZW5AZ21haWwuY29tPiBPbiBCZWhhbGYgT2Yg
V2VpIExpdQ0KPiA+ID4gPiA+ID4gU2VudDogMTQgRmVicnVhcnkgMjAyMCAxMzozNA0KPiA+ID4g
PiA+ID4gVG86IFhlbiBEZXZlbG9wbWVudCBMaXN0IDx4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVj
dC5vcmc+DQo+ID4gPiA+ID4gPiBDYzogTWljaGFlbCBLZWxsZXkgPG1pa2VsbGV5QG1pY3Jvc29m
dC5jb20+OyBEdXJyYW50LCBQYXVsDQo+ID4gPiA+ID4gPiA8cGR1cnJhbnRAYW1hem9uLmNvLnVr
PjsgV2VpIExpdSA8bGl1d2VAbWljcm9zb2Z0LmNvbT47IFdlaSBMaXUNCj4gPiA+ID4gPiA+IDx3
bEB4ZW4ub3JnPjsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsgQW5kcmV3IENvb3Bl
cg0KPiA+ID4gPiA+ID4gPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+OyBSb2dlciBQYXUgTW9u
bsOpDQo+IDxyb2dlci5wYXVAY2l0cml4LmNvbT4NCj4gPiA+ID4gPiA+IFN1YmplY3Q6IFtQQVRD
SCB2MiAyLzNdIHg4Ni9oeXBlcnY6IHNrZWxldG9uIGZvciBMMCBhc3Npc3RlZCBUTEINCj4gPiA+
IGZsdXNoDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gSW1wbGVtZW50IGEgYmFzaWMgaG9vayBm
b3IgTDAgYXNzaXN0ZWQgVExCIGZsdXNoLiBUaGUgaG9vayBuZWVkcw0KPiB0bw0KPiA+ID4gPiA+
ID4gY2hlY2sgaWYgcHJlcmVxdWlzaXRlcyBhcmUgbWV0LiBJZiB0aGV5IGFyZSBub3QgbWV0LCBp
dCByZXR1cm5zDQo+IGFuDQo+ID4gPiBlcnJvcg0KPiA+ID4gPiA+ID4gbnVtYmVyIHRvIGZhbGwg
YmFjayB0byBuYXRpdmUgZmx1c2hlcy4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBJbnRyb2R1
Y2UgYSBuZXcgdmFyaWFibGUgdG8gaW5kaWNhdGUgaWYgaHlwZXJjYWxsIHBhZ2UgaXMgcmVhZHku
DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogV2VpIExpdSA8bGl1d2VA
bWljcm9zb2Z0LmNvbT4NCj4gPiA+ID4gPiA+IC0tLQ0KPiA+ID4gPiA+ID4gIHhlbi9hcmNoL3g4
Ni9ndWVzdC9oeXBlcnYvTWFrZWZpbGUgIHwgIDEgKw0KPiA+ID4gPiA+ID4gIHhlbi9hcmNoL3g4
Ni9ndWVzdC9oeXBlcnYvaHlwZXJ2LmMgIHwgMTcgKysrKysrKysrKysrDQo+ID4gPiA+ID4gPiAg
eGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9wcml2YXRlLmggfCAgNCArKysNCj4gPiA+ID4gPiA+
ICB4ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L3RsYi5jICAgICB8IDQxDQo+ID4gPiArKysrKysr
KysrKysrKysrKysrKysrKysrKysrKw0KPiA+ID4gPiA+ID4gIDQgZmlsZXMgY2hhbmdlZCwgNjMg
aW5zZXJ0aW9ucygrKQ0KPiA+ID4gPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB4ZW4vYXJjaC94
ODYvZ3Vlc3QvaHlwZXJ2L3RsYi5jDQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gZGlmZiAtLWdp
dCBhL3hlbi9hcmNoL3g4Ni9ndWVzdC9oeXBlcnYvTWFrZWZpbGUNCj4gPiA+ID4gPiA+IGIveGVu
L2FyY2gveDg2L2d1ZXN0L2h5cGVydi9NYWtlZmlsZQ0KPiA+ID4gPiA+ID4gaW5kZXggNjgxNzAx
MDlhOS4uMTg5MDJjMzNlOSAxMDA2NDQNCj4gPiA+ID4gPiA+IC0tLSBhL3hlbi9hcmNoL3g4Ni9n
dWVzdC9oeXBlcnYvTWFrZWZpbGUNCj4gPiA+ID4gPiA+ICsrKyBiL3hlbi9hcmNoL3g4Ni9ndWVz
dC9oeXBlcnYvTWFrZWZpbGUNCj4gPiA+ID4gPiA+IEBAIC0xICsxLDIgQEANCj4gPiA+ID4gPiA+
ICBvYmoteSArPSBoeXBlcnYubw0KPiA+ID4gPiA+ID4gK29iai15ICs9IHRsYi5vDQo+ID4gPiA+
ID4gPiBkaWZmIC0tZ2l0IGEveGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYw0KPiA+
ID4gPiA+ID4gYi94ZW4vYXJjaC94ODYvZ3Vlc3QvaHlwZXJ2L2h5cGVydi5jDQo+ID4gPiA+ID4g
PiBpbmRleCA3MGY0Y2Q1YWUwLi5mOWQxZjExYWUzIDEwMDY0NA0KPiA+ID4gPiA+ID4gLS0tIGEv
eGVuL2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYw0KPiA+ID4gPiA+ID4gKysrIGIveGVu
L2FyY2gveDg2L2d1ZXN0L2h5cGVydi9oeXBlcnYuYw0KPiA+ID4gPiA+ID4gQEAgLTMzLDYgKzMz
LDggQEAgREVGSU5FX1BFUl9DUFVfUkVBRF9NT1NUTFkodm9pZCAqLA0KPiBodl9pbnB1dF9wYWdl
KTsNCj4gPiA+ID4gPiA+ICBERUZJTkVfUEVSX0NQVV9SRUFEX01PU1RMWSh2b2lkICosIGh2X3Zw
X2Fzc2lzdCk7DQo+ID4gPiA+ID4gPiAgREVGSU5FX1BFUl9DUFVfUkVBRF9NT1NUTFkodW5zaWdu
ZWQgaW50LCBodl92cF9pbmRleCk7DQo+ID4gPiA+ID4gPg0KPiA+ID4gPiA+ID4gK3N0YXRpYyBi
b29sIF9fcmVhZF9tb3N0bHkgaHZfaGNhbGxfcGFnZV9yZWFkeTsNCj4gPiA+ID4gPiA+ICsNCj4g
PiA+ID4gPiA+ICBzdGF0aWMgdWludDY0X3QgZ2VuZXJhdGVfZ3Vlc3RfaWQodm9pZCkNCj4gPiA+
ID4gPiA+ICB7DQo+ID4gPiA+ID4gPiAgICAgIHVuaW9uIGh2X2d1ZXN0X29zX2lkIGlkID0ge307
DQo+ID4gPiA+ID4gPiBAQCAtMTE5LDYgKzEyMSw4IEBAIHN0YXRpYyB2b2lkIF9faW5pdA0KPiBz
ZXR1cF9oeXBlcmNhbGxfcGFnZSh2b2lkKQ0KPiA+ID4gPiA+ID4gICAgICBCVUdfT04oIWh5cGVy
Y2FsbF9tc3IuZW5hYmxlKTsNCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiAgICAgIHNldF9maXht
YXBfeChGSVhfWF9IWVBFUlZfSENBTEwsIG1mbiA8PCBQQUdFX1NISUZUKTsNCj4gPiA+ID4gPg0K
PiA+ID4gPiA+IFNob3VsZG4ndCB0aGlzIGhhdmUgYXQgbGVhc3QgYSBjb21waWxlciBiYXJyaWVy
IGhlcmU/DQo+ID4gPiA+ID4NCj4gPiA+ID4NCj4gPiA+ID4gT0suIEkgd2lsbCBhZGQgYSB3cml0
ZSBiYXJyaWVyIGhlcmUuDQo+ID4gPg0KPiA+ID4gSG0sIHNob3VsZG4ndCBzdWNoIGJhcnJpZXIg
YmUgcGFydCBvZiBzZXRfZml4bWFwX3ggaXRzZWxmPw0KPiA+ID4NCj4gPg0KPiA+IE5vdCByZWFs
bHksIGZvciB0aGUgcHVycG9zZSBJIGhhZCBpbiBtaW5kLiBUaGUgaHZfaGNhbGxfcGFnZV9yZWFk
eQ0KPiBnbG9iYWwgaXMgc3BlY2lmaWMgdG8gdGhpcyBjb2RlIGFuZCB3ZSBuZWVkIHRvIG1ha2Ug
c3VyZSB0aGUgcGFnZSBpcw0KPiBhY3R1YWxseSByZWFkeSBiZWZvcmUgdGhlIGNvZGUgc2F5cyBp
dCBpcy4NCj4gDQo+IEJ1dCBhbnl0aGluZyB0aGF0IG1vZGlmaWVzIHRoZSBwYWdlIHRhYmxlcyBz
aG91bGQgYWxyZWFkeSBoYXZlIGENCj4gYmFycmllciBpZiByZXF1aXJlZCBpbiBvcmRlciB0byBw
cmV2ZW50IGFjY2Vzc2VzIGZyb20gYmVpbmcgbW92ZWQNCj4gYWhlYWQgb2YgaXQsIG9yIGVsc2Ug
dGhpbmdzIHdvdWxkIGNlcnRhaW5seSBnbyB3cm9uZyBpbiBtYW55IG90aGVyDQo+IHBsYWNlcz8N
Cg0KT2guIEknbSBub3Qgc2F5aW5nIHRoYXQgd2UgZG9uJ3QgbmVlZCBhIGJhcnJpZXIgdGhlcmUg
dG9vIChhbmQgbW9yZSB0aGFuIGEgY29tcGlsZXIgb25lIGluIHRoYXQgY2FzZSkuDQoNCiAgUGF1
bA0KDQo+IA0KPiBSb2dlci4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
