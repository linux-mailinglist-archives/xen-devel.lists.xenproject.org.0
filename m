Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B8D242A1D
	for <lists+xen-devel@lfdr.de>; Wed, 12 Aug 2020 15:13:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k5qZB-0001DJ-Tu; Wed, 12 Aug 2020 13:13:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dpjx=BW=amazon.co.uk=prvs=486a7bc87=pdurrant@srs-us1.protection.inumbo.net>)
 id 1k5qZB-0001DE-5F
 for xen-devel@lists.xenproject.org; Wed, 12 Aug 2020 13:13:17 +0000
X-Inumbo-ID: facaf343-3568-46a7-ba01-d98cc07b18c4
Received: from smtp-fw-33001.amazon.com (unknown [207.171.190.10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id facaf343-3568-46a7-ba01-d98cc07b18c4;
 Wed, 12 Aug 2020 13:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1597237996; x=1628773996;
 h=from:to:cc:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version:subject;
 bh=KR1dw/z3VMqsksNB4TUzgZI2zHzBF5uczeE6OxnLUC8=;
 b=UGcXseI09oxUaKbHri+rlIVQ5W22uH0EvTexNE5b7qFzyUFpuo/Z2YEm
 uSBO7raoeZLtEAu6uAp97NUWBgW9zdsY4XF8IhbQdz5r94Dp6gaaBnGgb
 Qfh3/1GmNQ4POzZeUaRrEeVymI5qTEkOOOY3YCYM0fnjHQ99BiD1c8qMx U=;
IronPort-SDR: bcZZmDlDe5ZfhXwdrTdxbBpc7trr2VB/Rfq83WSSbEB61olvJofY48mdRXo+55g46IpYh4cVSE
 Ycsr80aORWvQ==
X-IronPort-AV: E=Sophos;i="5.76,304,1592870400"; d="scan'208";a="66228441"
Subject: RE: [PATCH v4 12/14] vtd: use a bit field for root_entry
Thread-Topic: [PATCH v4 12/14] vtd: use a bit field for root_entry
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2c-87a10be6.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP;
 12 Aug 2020 13:13:09 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (pdx4-ws-svc-p6-lb7-vlan2.pdx.amazon.com [10.170.41.162])
 by email-inbound-relay-2c-87a10be6.us-west-2.amazon.com (Postfix) with ESMTPS
 id D7BA3A223F; Wed, 12 Aug 2020 13:13:07 +0000 (UTC)
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 12 Aug 2020 13:13:07 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC003.ant.amazon.com (10.43.164.24) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Wed, 12 Aug 2020 13:13:06 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1497.006;
 Wed, 12 Aug 2020 13:13:06 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Kevin
 Tian" <kevin.tian@intel.com>
Thread-Index: AQGtxlp5X/CuH2IzEhv/FXA8KDRK/wL9MkfgATBJZE2pZFZ5MA==
Date: Wed, 12 Aug 2020 13:13:06 +0000
Message-ID: <c50aa58c4d774caf911fbf08837d11a8@EX13D32EUC003.ant.amazon.com>
References: <20200804134209.8717-1-paul@xen.org>
 <20200804134209.8717-13-paul@xen.org>
 <71e1a4a9-eac0-5aae-f2d5-fa33ca8b6036@suse.com>
In-Reply-To: <71e1a4a9-eac0-5aae-f2d5-fa33ca8b6036@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.166.209]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: Bulk
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDA2IEF1Z3VzdCAyMDIwIDEzOjM0DQo+IFRvOiBQYXVsIER1
cnJhbnQgPHBhdWxAeGVuLm9yZz4NCj4gQ2M6IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZzsgRHVycmFudCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPjsgS2V2aW4gVGlhbg0KPiA8
a2V2aW4udGlhbkBpbnRlbC5jb20+DQo+IFN1YmplY3Q6IFJFOiBbRVhURVJOQUxdIFtQQVRDSCB2
NCAxMi8xNF0gdnRkOiB1c2UgYSBiaXQgZmllbGQgZm9yIHJvb3RfZW50cnkNCj4gDQo+IENBVVRJ
T046IFRoaXMgZW1haWwgb3JpZ2luYXRlZCBmcm9tIG91dHNpZGUgb2YgdGhlIG9yZ2FuaXphdGlv
bi4gRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4NCj4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBj
YW4gY29uZmlybSB0aGUgc2VuZGVyIGFuZCBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUuDQo+IA0K
PiANCj4gDQo+IE9uIDA0LjA4LjIwMjAgMTU6NDIsIFBhdWwgRHVycmFudCB3cm90ZToNCj4gPiAt
LS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuaA0KPiA+ICsrKyBiL3hlbi9k
cml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5oDQo+ID4gQEAgLTE4NCwyMSArMTg0LDI4IEBA
DQo+ID4gICNkZWZpbmUgZG1hX2ZyY2Rfc291cmNlX2lkKGMpIChjICYgMHhmZmZmKQ0KPiA+ICAj
ZGVmaW5lIGRtYV9mcmNkX3BhZ2VfYWRkcihkKSAoZCAmICgoKHU2NCktMSkgPDwgMTIpKSAvKiBs
b3cgNjQgYml0ICovDQo+ID4NCj4gPiAtLyoNCj4gPiAtICogMDogUHJlc2VudA0KPiA+IC0gKiAx
LTExOiBSZXNlcnZlZA0KPiA+IC0gKiAxMi02MzogQ29udGV4dCBQdHIgKDEyIC0gKGhhdy0xKSkN
Cj4gPiAtICogNjQtMTI3OiBSZXNlcnZlZA0KPiA+IC0gKi8NCj4gPiAgc3RydWN0IHJvb3RfZW50
cnkgew0KPiA+IC0gICAgdTY0ICAgIHZhbDsNCj4gPiAtICAgIHU2NCAgICByc3ZkMTsNCj4gPiAr
ICAgIHVuaW9uIHsNCj4gPiArICAgICAgICBfX3VpbnQxMjhfdCB2YWw7DQo+IA0KPiBJIGNvdWxk
bid0IGZpbmQgYSB1c2Ugb2YgdGhpcyBmaWVsZCwgYW5kIEkgYWxzbyBjYW4ndCBmb3Jlc2VlIGFu
eS4NCj4gQ291bGQgaXQgYmUgbGVmdCBvdXQ/DQoNClllcywgcHJvYmFibHkuDQoNCj4gDQo+ID4g
KyAgICAgICAgc3RydWN0IHsgdWludDY0X3QgbG8sIGhpOyB9Ow0KPiA+ICsgICAgICAgIHN0cnVj
dCB7DQo+ID4gKyAgICAgICAgICAgIC8qIDAgLSA2MyAqLw0KPiA+ICsgICAgICAgICAgICB1aW50
NjRfdCBwOjE7DQo+IA0KPiBib29sPw0KPiANCg0KSSdkIHByZWZlciBub3QgdG8uIE9uZSBvZiB0
aGUgcG9pbnRzIG9mIHVzaW5nIGEgYml0IGZpZWxkIChhdCBsZWFzdCBmcm9tIG15IFBvVikgaXMg
dGhhdCBpdCBtYWtlcyByZWZlcnJpbmcgYmFjayB0byB0aGUgc3BlYy4gbXVjaCBlYXNpZXIsIGJ5
IHVzaW5nIHVpbnQ2NF90IHR5cGVzIGNvbnNpc3RlbnRseSBhbmQgaGVuY2UgdXNpbmcgYml0IHdp
ZHRocyB0aGF0IGNhbiBiZSBzdHJhaWdodGZvcndhcmRseSBzdW1tZWQgdG8gZ2l2ZSB0aGUgYml0
IG9mZnNldHMgc3RhdGVkIGluIHRoZSBzcGVjLg0KDQo+ID4gKyAgICAgICAgICAgIHVpbnQ2NF90
IHJlc2VydmVkMDoxMTsNCj4gPiArICAgICAgICAgICAgdWludDY0X3QgY3RwOjUyOw0KPiA+ICsN
Cj4gPiArICAgICAgICAgICAgLyogNjQgLSAxMjcgKi8NCj4gPiArICAgICAgICAgICAgdWludDY0
X3QgcmVzZXJ2ZWQxOw0KPiA+ICsgICAgICAgIH07DQo+ID4gKyAgICB9Ow0KPiA+ICB9Ow0KPiA+
IC0jZGVmaW5lIHJvb3RfcHJlc2VudChyb290KSAgICAoKHJvb3QpLnZhbCAmIDEpDQo+ID4gLSNk
ZWZpbmUgc2V0X3Jvb3RfcHJlc2VudChyb290KSBkbyB7KHJvb3QpLnZhbCB8PSAxO30gd2hpbGUo
MCkNCj4gPiAtI2RlZmluZSBnZXRfY29udGV4dF9hZGRyKHJvb3QpICgocm9vdCkudmFsICYgUEFH
RV9NQVNLXzRLKQ0KPiA+IC0jZGVmaW5lIHNldF9yb290X3ZhbHVlKHJvb3QsIHZhbHVlKSBcDQo+
ID4gLSAgICBkbyB7KHJvb3QpLnZhbCB8PSAoKHZhbHVlKSAmIFBBR0VfTUFTS180Syk7fSB3aGls
ZSgwKQ0KPiA+ICsNCj4gPiArI2RlZmluZSByb290X3ByZXNlbnQocikgKHIpLnANCj4gPiArI2Rl
ZmluZSBzZXRfcm9vdF9wcmVzZW50KHIpIGRvIHsgKHIpLnAgPSAxOyB9IHdoaWxlICgwKQ0KPiAN
Cj4gQW5kIHRoZW4gInRydWUiIGhlcmU/DQo+IA0KPiA+ICsjZGVmaW5lIHJvb3RfY3RwKHIpICgo
cikuY3RwIDw8IFBBR0VfU0hJRlRfNEspDQo+ID4gKyNkZWZpbmUgc2V0X3Jvb3RfY3RwKHIsIHZh
bCkgXA0KPiA+ICsgICAgZG8geyAocikuY3RwID0gKCh2YWwpID4+IFBBR0VfU0hJRlRfNEspOyB9
IHdoaWxlICgwKQ0KPiANCj4gRm9yIGRvY3VtZW50YXRpb24gcHVycG9zZXMsIGNhbiB0aGUgMm5k
IG1hY3JvIHBhcmFtIGJlIG5hbWVkIG1hZGRyDQo+IG9yIHNvbWUgc3VjaD8NCj4gDQoNClN1cmUu
DQoNCj4gPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQveDg2L2F0cy5jDQo+ID4g
KysrIGIveGVuL2RyaXZlcnMvcGFzc3Rocm91Z2gvdnRkL3g4Ni9hdHMuYw0KPiA+IEBAIC03NCw4
ICs3NCw4IEBAIGludCBhdHNfZGV2aWNlKGNvbnN0IHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBjb25z
dCBzdHJ1Y3QgYWNwaV9kcmhkX3VuaXQgKmRyaGQpDQo+ID4gIHN0YXRpYyBib29sIGRldmljZV9p
bl9kb21haW4oY29uc3Qgc3RydWN0IHZ0ZF9pb21tdSAqaW9tbXUsDQo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgY29uc3Qgc3RydWN0IHBjaV9kZXYgKnBkZXYsIHVpbnQxNl90IGRp
ZCkNCj4gPiAgew0KPiA+IC0gICAgc3RydWN0IHJvb3RfZW50cnkgKnJvb3RfZW50cnk7DQo+ID4g
LSAgICBzdHJ1Y3QgY29udGV4dF9lbnRyeSAqY3R4dF9lbnRyeSA9IE5VTEw7DQo+ID4gKyAgICBz
dHJ1Y3Qgcm9vdF9lbnRyeSAqcm9vdF9lbnRyeSwgKnJvb3RfZW50cmllcyA9IE5VTEw7DQo+ID4g
KyAgICBzdHJ1Y3QgY29udGV4dF9lbnRyeSAqY29udGV4dF9lbnRyeSwgKmNvbnRleHRfZW50cmll
cyA9IE5VTEw7DQo+IA0KPiBKdXN0IGxpa2Ugcm9vdF9lbnRyeSwgcm9vdF9lbnRyaWVzIGRvZXNu
J3QgbG9vayB0byBuZWVkIGFuIGluaXRpYWxpemVyLg0KPiBJJ20gdW5jb252aW5jZWQgYW55d2F5
IHRoYXQgeW91IG5vdyBuZWVkIHR3byB2YXJpYWJsZXMgZWFjaDoNCj4gdW5tYXBfdnRkX2RvbWFp
bl9wYWdlKCkgZG9lcyBxdWl0ZSBmaW5lIHdpdGggdGhlIGxvdyAxMiBiaXRzIG5vdCBhbGwNCj4g
YmVpbmcgemVybywgYWZhaWN0Lg0KDQpOb3QgcGFzc2luZyBhIHBhZ2UgYWxpZ25lZCBhZGRyZXNz
IGludG8gc29tZXRoaW5nIHRoYXQgdW5tYXBzIGEgcGFnZSBzZWVtcyBhIGxpdHRsZSBiaXQgZnJh
Z2lsZSB0aG91Z2gsIGUuZy4gaWYgc29tZW9uZSBoYXBwZW5lZCB0byBhZGQgYSBjaGVjayBpbiBm
dXR1cmUuIEknbGwgc2VlIGlmIEkgY2FuIGRyb3AgdGhlIGluaXRpYWxpemVyIHRob3VnaC4NCg0K
ICBQYXVsDQoNCj4gDQo+IEphbg0K

