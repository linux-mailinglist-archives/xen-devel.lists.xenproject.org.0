Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BD1AEB05
	for <lists+xen-devel@lfdr.de>; Tue, 10 Sep 2019 15:03:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7fkc-0005cH-8Y; Tue, 10 Sep 2019 13:00:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=M1KC=XF=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1i7fka-0005Qa-Cr
 for xen-devel@lists.xenproject.org; Tue, 10 Sep 2019 13:00:04 +0000
X-Inumbo-ID: e6e6cd12-d3ca-11e9-b76c-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e6e6cd12-d3ca-11e9-b76c-bc764e2007e4;
 Tue, 10 Sep 2019 13:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1568120403;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kVzE/aGEt8l3SzVKZyxS2UpLOULrOhOlj09kVPSED6s=;
 b=MXggRw/Yorzy64v7iRMtziVFSsg1XGlwIO9rbQ98fAXjX7FfIouiQw4J
 hJ4m9iawn6QNhzIUZyFQ2zydudV07dyhUKi52RKznDvHBX7Behu5iU2Pf
 2A8ZVKa/xSUiW7JJNcErWSyGJ6W9zfqN7iQP2/Fu+n+dxXNUmpuyu7Yrx 0=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: qIl+2ilokyBnFTk7e47s3jFy+tp7zw1ZW8T2wZhy0QnHG5IIw0f/0ICtivLjddUyTgDMt9/BEl
 ed5uodkNb69X52JbsIh2NKXEBbwVaeuLJC/pnlEvhf/ZGi4dQJOJTw0i6H9903t3OA6VxW/fFj
 k36k/QKeLlNKJTmfXA33jFzUElzDo33FnOYIDaYed/wwgMAqcBDuXYt6hzauEWlu0Fu71KHClp
 INKaRVjFYS+fvahN7VGfxzyjQdLOMSnbqC3KkSQ+58jzNcSay8NB497tf39Lk7jw621tEpcAG5
 uoc=
X-SBRS: 2.7
X-MesageID: 5368029
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,489,1559534400"; 
   d="scan'208";a="5368029"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 05/11] ioreq: add internal ioreq initialization support
Thread-Index: AQHVYnK2oKxcpVD8uUiJJhtdNoUtKqck5f9w
Date: Tue, 10 Sep 2019 12:59:57 +0000
Message-ID: <133e6d6e83f846638ebdd9f66cef279b@AMSPEX02CL03.citrite.net>
References: <20190903161428.7159-1-roger.pau@citrix.com>
 <20190903161428.7159-6-roger.pau@citrix.com>
In-Reply-To: <20190903161428.7159-6-roger.pau@citrix.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 05/11] ioreq: add internal ioreq
 initialization support
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBSb2dlciBQYXUgTW9ubmUgPHJv
Z2VyLnBhdUBjaXRyaXguY29tPg0KPiBTZW50OiAwMyBTZXB0ZW1iZXIgMjAxOSAxNzoxNA0KPiBU
bzogeGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnDQo+IENjOiBSb2dlciBQYXUgTW9ubmUg
PHJvZ2VyLnBhdUBjaXRyaXguY29tPjsgSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPjsg
QW5kcmV3IENvb3Blcg0KPiA8QW5kcmV3LkNvb3BlcjNAY2l0cml4LmNvbT47IFdlaSBMaXUgPHds
QHhlbi5vcmc+OyBQYXVsIER1cnJhbnQgPFBhdWwuRHVycmFudEBjaXRyaXguY29tPg0KPiBTdWJq
ZWN0OiBbUEFUQ0ggdjIgMDUvMTFdIGlvcmVxOiBhZGQgaW50ZXJuYWwgaW9yZXEgaW5pdGlhbGl6
YXRpb24gc3VwcG9ydA0KPiANCj4gQWRkIHN1cHBvcnQgZm9yIGludGVybmFsIGlvcmVxIHNlcnZl
cnMgdG8gaW5pdGlhbGl6YXRpb24gYW5kDQo+IGRlaW5pdGlhbGl6YXRpb24gcm91dGluZXMsIHBy
ZXZlbnQgc29tZSBmdW5jdGlvbnMgZnJvbSBiZWluZyBleGVjdXRlZA0KPiBhZ2FpbnN0IGludGVy
bmFsIGlvcmVxIHNlcnZlcnMgYW5kIGFkZCBndWFyZHMgdG8gb25seSBhbGxvdyBpbnRlcm5hbA0K
PiBjYWxsZXJzIHRvIG1vZGlmeSBpbnRlcm5hbCBpb3JlcSBzZXJ2ZXJzLiBFeHRlcm5hbCBjYWxs
ZXJzIChpZTogZnJvbQ0KPiBoeXBlcmNhbGxzKSBhcmUgb25seSBhbGxvd2VkIHRvIGRlYWwgd2l0
aCBleHRlcm5hbCBpb3JlcSBzZXJ2ZXJzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1
IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJpeC5jb20+DQo+IC0tLQ0KPiBDaGFuZ2VzIHNpbmNlIHYx
Og0KPiAgLSBEbyBub3QgcGFzcyBhbiAnaW50ZXJuYWwnIHBhcmFtZXRlciB0byBtb3N0IGZ1bmN0
aW9ucywgYW5kIGluc3RlYWQNCj4gICAgdXNlIHRoZSBpZCB0byBrZXkgd2hldGhlciBhbiBpb3Jl
cSBzZXJ2ZXIgaXMgaW50ZXJuYWwgb3IgZXh0ZXJuYWwuDQo+ICAtIFByZXZlbnQgZW5hYmxpbmcg
YW4gaW50ZXJuYWwgc2VydmVyIHdpdGhvdXQgYSBoYW5kbGVyLg0KPiAtLS0NCj4gIHhlbi9hcmNo
L3g4Ni9odm0vZG0uYyAgICAgICAgICAgIHwgIDE3ICsrLQ0KPiAgeGVuL2FyY2gveDg2L2h2bS9p
b3JlcS5jICAgICAgICAgfCAxNzMgKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLQ0KPiAg
eGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0vZG9tYWluLmggfCAgIDUgKy0NCj4gIHhlbi9pbmNsdWRl
L2FzbS14ODYvaHZtL2lvcmVxLmggIHwgICA4ICstDQo+ICA0IGZpbGVzIGNoYW5nZWQsIDEzNSBp
bnNlcnRpb25zKCspLCA2OCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS94ZW4vYXJj
aC94ODYvaHZtL2RtLmMgYi94ZW4vYXJjaC94ODYvaHZtL2RtLmMNCj4gaW5kZXggYzJmY2E5Zjcy
OS4uNmEzNjgyZTU4YyAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9kbS5jDQo+ICsr
KyBiL3hlbi9hcmNoL3g4Ni9odm0vZG0uYw0KPiBAQCAtNDE3LDcgKzQxNyw3IEBAIHN0YXRpYyBp
bnQgZG1fb3AoY29uc3Qgc3RydWN0IGRtb3BfYXJncyAqb3BfYXJncykNCj4gICAgICAgICAgICAg
IGJyZWFrOw0KPiANCj4gICAgICAgICAgcmMgPSBodm1fY3JlYXRlX2lvcmVxX3NlcnZlcihkLCBk
YXRhLT5oYW5kbGVfYnVmaW9yZXEsDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgJmRhdGEtPmlkKTsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAmZGF0YS0+aWQsIGZhbHNlKTsNCj4gICAgICAgICAgYnJlYWs7DQo+ICAgICAgfQ0KPiANCj4g
QEAgLTQ1MCw2ICs0NTAsOSBAQCBzdGF0aWMgaW50IGRtX29wKGNvbnN0IHN0cnVjdCBkbW9wX2Fy
Z3MgKm9wX2FyZ3MpDQo+ICAgICAgICAgIHJjID0gLUVJTlZBTDsNCj4gICAgICAgICAgaWYgKCBk
YXRhLT5wYWQgKQ0KPiAgICAgICAgICAgICAgYnJlYWs7DQo+ICsgICAgICAgIHJjID0gLUVQRVJN
Ow0KPiArICAgICAgICBpZiAoIGh2bV9pb3JlcV9pc19pbnRlcm5hbChkYXRhLT5pZCkgKQ0KPiAr
ICAgICAgICAgICAgYnJlYWs7DQo+IA0KPiAgICAgICAgICByYyA9IGh2bV9tYXBfaW9fcmFuZ2Vf
dG9faW9yZXFfc2VydmVyKGQsIGRhdGEtPmlkLCBkYXRhLT50eXBlLA0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRhdGEtPnN0YXJ0LCBkYXRhLT5lbmQp
Ow0KPiBAQCAtNDY0LDYgKzQ2Nyw5IEBAIHN0YXRpYyBpbnQgZG1fb3AoY29uc3Qgc3RydWN0IGRt
b3BfYXJncyAqb3BfYXJncykNCj4gICAgICAgICAgcmMgPSAtRUlOVkFMOw0KPiAgICAgICAgICBp
ZiAoIGRhdGEtPnBhZCApDQo+ICAgICAgICAgICAgICBicmVhazsNCj4gKyAgICAgICAgcmMgPSAt
RVBFUk07DQo+ICsgICAgICAgIGlmICggaHZtX2lvcmVxX2lzX2ludGVybmFsKGRhdGEtPmlkKSAp
DQo+ICsgICAgICAgICAgICBicmVhazsNCj4gDQo+ICAgICAgICAgIHJjID0gaHZtX3VubWFwX2lv
X3JhbmdlX2Zyb21faW9yZXFfc2VydmVyKGQsIGRhdGEtPmlkLCBkYXRhLT50eXBlLA0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBkYXRhLT5zdGFy
dCwgZGF0YS0+ZW5kKTsNCj4gQEAgLTQ4MSw2ICs0ODcsOSBAQCBzdGF0aWMgaW50IGRtX29wKGNv
bnN0IHN0cnVjdCBkbW9wX2FyZ3MgKm9wX2FyZ3MpDQo+ICAgICAgICAgIHJjID0gLUVPUE5PVFNV
UFA7DQo+ICAgICAgICAgIGlmICggIWhhcF9lbmFibGVkKGQpICkNCj4gICAgICAgICAgICAgIGJy
ZWFrOw0KPiArICAgICAgICByYyA9IC1FUEVSTTsNCj4gKyAgICAgICAgaWYgKCBodm1faW9yZXFf
aXNfaW50ZXJuYWwoZGF0YS0+aWQpICkNCj4gKyAgICAgICAgICAgIGJyZWFrOw0KPiANCj4gICAg
ICAgICAgaWYgKCBmaXJzdF9nZm4gPT0gMCApDQo+ICAgICAgICAgICAgICByYyA9IGh2bV9tYXBf
bWVtX3R5cGVfdG9faW9yZXFfc2VydmVyKGQsIGRhdGEtPmlkLA0KPiBAQCAtNTI4LDYgKzUzNyw5
IEBAIHN0YXRpYyBpbnQgZG1fb3AoY29uc3Qgc3RydWN0IGRtb3BfYXJncyAqb3BfYXJncykNCj4g
ICAgICAgICAgcmMgPSAtRUlOVkFMOw0KPiAgICAgICAgICBpZiAoIGRhdGEtPnBhZCApDQo+ICAg
ICAgICAgICAgICBicmVhazsNCj4gKyAgICAgICAgcmMgPSAtRVBFUk07DQo+ICsgICAgICAgIGlm
ICggaHZtX2lvcmVxX2lzX2ludGVybmFsKGRhdGEtPmlkKSApDQo+ICsgICAgICAgICAgICBicmVh
azsNCj4gDQo+ICAgICAgICAgIHJjID0gaHZtX3NldF9pb3JlcV9zZXJ2ZXJfc3RhdGUoZCwgZGF0
YS0+aWQsICEhZGF0YS0+ZW5hYmxlZCk7DQo+ICAgICAgICAgIGJyZWFrOw0KPiBAQCAtNTQxLDYg
KzU1Myw5IEBAIHN0YXRpYyBpbnQgZG1fb3AoY29uc3Qgc3RydWN0IGRtb3BfYXJncyAqb3BfYXJn
cykNCj4gICAgICAgICAgcmMgPSAtRUlOVkFMOw0KPiAgICAgICAgICBpZiAoIGRhdGEtPnBhZCAp
DQo+ICAgICAgICAgICAgICBicmVhazsNCj4gKyAgICAgICAgcmMgPSAtRVBFUk07DQo+ICsgICAg
ICAgIGlmICggaHZtX2lvcmVxX2lzX2ludGVybmFsKGRhdGEtPmlkKSApDQo+ICsgICAgICAgICAg
ICBicmVhazsNCj4gDQo+ICAgICAgICAgIHJjID0gaHZtX2Rlc3Ryb3lfaW9yZXFfc2VydmVyKGQs
IGRhdGEtPmlkKTsNCj4gICAgICAgICAgYnJlYWs7DQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94
ODYvaHZtL2lvcmVxLmMgYi94ZW4vYXJjaC94ODYvaHZtL2lvcmVxLmMNCj4gaW5kZXggOTU0OTJi
YzExMS4uZGJjNWU2YjRjNSAxMDA2NDQNCj4gLS0tIGEveGVuL2FyY2gveDg2L2h2bS9pb3JlcS5j
DQo+ICsrKyBiL3hlbi9hcmNoL3g4Ni9odm0vaW9yZXEuYw0KPiBAQCAtNTksMTAgKzU5LDExIEBA
IHN0YXRpYyBzdHJ1Y3QgaHZtX2lvcmVxX3NlcnZlciAqZ2V0X2lvcmVxX3NlcnZlcihjb25zdCBz
dHJ1Y3QgZG9tYWluICpkLA0KPiAgLyoNCj4gICAqIEl0ZXJhdGUgb3ZlciBhbGwgcG9zc2libGUg
aW9yZXEgc2VydmVycy4NCj4gICAqDQo+IC0gKiBOT1RFOiBUaGUgaXRlcmF0aW9uIGlzIGJhY2t3
YXJkcyBzdWNoIHRoYXQgbW9yZSByZWNlbnRseSBjcmVhdGVkDQo+IC0gKiAgICAgICBpb3JlcSBz
ZXJ2ZXJzIGFyZSBmYXZvdXJlZCBpbiBodm1fc2VsZWN0X2lvcmVxX3NlcnZlcigpLg0KPiAtICog
ICAgICAgVGhpcyBpcyBhIHNlbWFudGljIHRoYXQgcHJldmlvdXNseSBleGlzdGVkIHdoZW4gaW9y
ZXEgc2VydmVycw0KPiAtICogICAgICAgd2VyZSBoZWxkIGluIGEgbGlua2VkIGxpc3QuDQo+ICsg
KiBOT1RFOiBUaGUgaXRlcmF0aW9uIGlzIGJhY2t3YXJkcyBzdWNoIHRoYXQgaW50ZXJuYWwgYW5k
IG1vcmUgcmVjZW50bHkNCj4gKyAqICAgICAgIGNyZWF0ZWQgZXh0ZXJuYWwgaW9yZXEgc2VydmVy
cyBhcmUgZmF2b3VyZWQgaW4NCj4gKyAqICAgICAgIGh2bV9zZWxlY3RfaW9yZXFfc2VydmVyKCku
DQo+ICsgKiAgICAgICBUaGlzIGlzIGEgc2VtYW50aWMgdGhhdCBwcmV2aW91c2x5IGV4aXN0ZWQg
Zm9yIGV4dGVybmFsIHNlcnZlcnMgd2hlbg0KPiArICogICAgICAgaW9yZXEgc2VydmVycyB3ZXJl
IGhlbGQgaW4gYSBsaW5rZWQgbGlzdC4NCj4gICAqLw0KPiAgI2RlZmluZSBGT1JfRUFDSF9JT1JF
UV9TRVJWRVIoZCwgaWQsIHMpIFwNCj4gICAgICBmb3IgKCAoaWQpID0gTUFYX05SX0lPUkVRX1NF
UlZFUlM7IChpZCkgIT0gMDsgKSBcDQo+IEBAIC03MCw2ICs3MSwxMiBAQCBzdGF0aWMgc3RydWN0
IGh2bV9pb3JlcV9zZXJ2ZXIgKmdldF9pb3JlcV9zZXJ2ZXIoY29uc3Qgc3RydWN0IGRvbWFpbiAq
ZCwNCj4gICAgICAgICAgICAgIGNvbnRpbnVlOyBcDQo+ICAgICAgICAgIGVsc2UNCj4gDQo+ICsj
ZGVmaW5lIEZPUl9FQUNIX0VYVEVSTkFMX0lPUkVRX1NFUlZFUihkLCBpZCwgcykgXA0KPiArICAg
IGZvciAoIChpZCkgPSBNQVhfTlJfRVhURVJOQUxfSU9SRVFfU0VSVkVSUzsgKGlkKSAhPSAwOyAp
IFwNCj4gKyAgICAgICAgaWYgKCAhKHMgPSBHRVRfSU9SRVFfU0VSVkVSKGQsIC0tKGlkKSkpICkg
XA0KPiArICAgICAgICAgICAgY29udGludWU7IFwNCj4gKyAgICAgICAgZWxzZQ0KPiArDQo+ICBz
dGF0aWMgaW9yZXFfdCAqZ2V0X2lvcmVxKHN0cnVjdCBodm1faW9yZXFfc2VydmVyICpzLCBzdHJ1
Y3QgdmNwdSAqdikNCj4gIHsNCj4gICAgICBzaGFyZWRfaW9wYWdlX3QgKnAgPSBzLT5pb3JlcS52
YTsNCj4gQEAgLTg2LDcgKzkzLDcgQEAgYm9vbCBodm1faW9fcGVuZGluZyhzdHJ1Y3QgdmNwdSAq
dikNCj4gICAgICBzdHJ1Y3QgaHZtX2lvcmVxX3NlcnZlciAqczsNCj4gICAgICB1bnNpZ25lZCBp
bnQgaWQ7DQo+IA0KPiAtICAgIEZPUl9FQUNIX0lPUkVRX1NFUlZFUihkLCBpZCwgcykNCj4gKyAg
ICBGT1JfRUFDSF9FWFRFUk5BTF9JT1JFUV9TRVJWRVIoZCwgaWQsIHMpDQo+ICAgICAgew0KPiAg
ICAgICAgICBzdHJ1Y3QgaHZtX2lvcmVxX3ZjcHUgKnN2Ow0KPiANCj4gQEAgLTE5MCw3ICsxOTcs
NyBAQCBib29sIGhhbmRsZV9odm1faW9fY29tcGxldGlvbihzdHJ1Y3QgdmNwdSAqdikNCj4gICAg
ICAgICAgcmV0dXJuIGZhbHNlOw0KPiAgICAgIH0NCj4gDQo+IC0gICAgRk9SX0VBQ0hfSU9SRVFf
U0VSVkVSKGQsIGlkLCBzKQ0KPiArICAgIEZPUl9FQUNIX0VYVEVSTkFMX0lPUkVRX1NFUlZFUihk
LCBpZCwgcykNCj4gICAgICB7DQo+ICAgICAgICAgIHN0cnVjdCBodm1faW9yZXFfdmNwdSAqc3Y7
DQo+IA0KPiBAQCAtNDMwLDcgKzQzNyw3IEBAIGJvb2wgaXNfaW9yZXFfc2VydmVyX3BhZ2Uoc3Ry
dWN0IGRvbWFpbiAqZCwgY29uc3Qgc3RydWN0IHBhZ2VfaW5mbyAqcGFnZSkNCj4gDQo+ICAgICAg
c3Bpbl9sb2NrX3JlY3Vyc2l2ZSgmZC0+YXJjaC5odm0uaW9yZXFfc2VydmVyLmxvY2spOw0KPiAN
Cj4gLSAgICBGT1JfRUFDSF9JT1JFUV9TRVJWRVIoZCwgaWQsIHMpDQo+ICsgICAgRk9SX0VBQ0hf
RVhURVJOQUxfSU9SRVFfU0VSVkVSKGQsIGlkLCBzKQ0KPiAgICAgIHsNCj4gICAgICAgICAgaWYg
KCAocy0+aW9yZXEucGFnZSA9PSBwYWdlKSB8fCAocy0+YnVmaW9yZXEucGFnZSA9PSBwYWdlKSAp
DQo+ICAgICAgICAgIHsNCj4gQEAgLTY4OCw3ICs2OTUsNyBAQCBzdGF0aWMgaW50IGh2bV9pb3Jl
cV9zZXJ2ZXJfYWxsb2NfcmFuZ2VzZXRzKHN0cnVjdCBodm1faW9yZXFfc2VydmVyICpzLA0KPiAg
ICAgIHJldHVybiByYzsNCj4gIH0NCj4gDQo+IC1zdGF0aWMgdm9pZCBodm1faW9yZXFfc2VydmVy
X2VuYWJsZShzdHJ1Y3QgaHZtX2lvcmVxX3NlcnZlciAqcykNCj4gK3N0YXRpYyB2b2lkIGh2bV9p
b3JlcV9zZXJ2ZXJfZW5hYmxlKHN0cnVjdCBodm1faW9yZXFfc2VydmVyICpzLCBib29sIGludGVy
bmFsKQ0KPiAgew0KPiAgICAgIHN0cnVjdCBodm1faW9yZXFfdmNwdSAqc3Y7DQo+IA0KPiBAQCAt
Njk3LDI5ICs3MDQsNDAgQEAgc3RhdGljIHZvaWQgaHZtX2lvcmVxX3NlcnZlcl9lbmFibGUoc3Ry
dWN0IGh2bV9pb3JlcV9zZXJ2ZXIgKnMpDQo+ICAgICAgaWYgKCBzLT5lbmFibGVkICkNCj4gICAg
ICAgICAgZ290byBkb25lOw0KPiANCj4gLSAgICBodm1fcmVtb3ZlX2lvcmVxX2dmbihzLCBmYWxz
ZSk7DQo+IC0gICAgaHZtX3JlbW92ZV9pb3JlcV9nZm4ocywgdHJ1ZSk7DQo+ICsgICAgaWYgKCAh
aW50ZXJuYWwgKQ0KPiArICAgIHsNCj4gKyAgICAgICAgaHZtX3JlbW92ZV9pb3JlcV9nZm4ocywg
ZmFsc2UpOw0KPiArICAgICAgICBodm1fcmVtb3ZlX2lvcmVxX2dmbihzLCB0cnVlKTsNCj4gDQo+
IC0gICAgcy0+ZW5hYmxlZCA9IHRydWU7DQo+ICsgICAgICAgIGxpc3RfZm9yX2VhY2hfZW50cnkg
KCBzdiwNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICZzLT5pb3JlcV92Y3B1X2xp
c3QsDQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsaXN0X2VudHJ5ICkNCj4gKyAg
ICAgICAgICAgIGh2bV91cGRhdGVfaW9yZXFfZXZ0Y2huKHMsIHN2KTsNCj4gKyAgICB9DQo+ICsg
ICAgZWxzZSBpZiAoICFzLT5oYW5kbGVyICkNCj4gKyAgICB7DQo+ICsgICAgICAgIEFTU0VSVF9V
TlJFQUNIQUJMRSgpOw0KPiArICAgICAgICBnb3RvIGRvbmU7DQo+ICsgICAgfQ0KPiANCj4gLSAg
ICBsaXN0X2Zvcl9lYWNoX2VudHJ5ICggc3YsDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICZzLT5pb3JlcV92Y3B1X2xpc3QsDQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgIGxpc3Rf
ZW50cnkgKQ0KPiAtICAgICAgICBodm1fdXBkYXRlX2lvcmVxX2V2dGNobihzLCBzdik7DQo+ICsg
ICAgcy0+ZW5hYmxlZCA9IHRydWU7DQo+IA0KPiAgICBkb25lOg0KPiAgICAgIHNwaW5fdW5sb2Nr
KCZzLT5sb2NrKTsNCj4gIH0NCj4gDQo+IC1zdGF0aWMgdm9pZCBodm1faW9yZXFfc2VydmVyX2Rp
c2FibGUoc3RydWN0IGh2bV9pb3JlcV9zZXJ2ZXIgKnMpDQo+ICtzdGF0aWMgdm9pZCBodm1faW9y
ZXFfc2VydmVyX2Rpc2FibGUoc3RydWN0IGh2bV9pb3JlcV9zZXJ2ZXIgKnMsIGJvb2wgaW50ZXJu
YWwpDQo+ICB7DQo+ICAgICAgc3Bpbl9sb2NrKCZzLT5sb2NrKTsNCj4gDQo+ICAgICAgaWYgKCAh
cy0+ZW5hYmxlZCApDQo+ICAgICAgICAgIGdvdG8gZG9uZTsNCj4gDQo+IC0gICAgaHZtX2FkZF9p
b3JlcV9nZm4ocywgdHJ1ZSk7DQo+IC0gICAgaHZtX2FkZF9pb3JlcV9nZm4ocywgZmFsc2UpOw0K
PiArICAgIGlmICggIWludGVybmFsICkNCj4gKyAgICB7DQo+ICsgICAgICAgIGh2bV9hZGRfaW9y
ZXFfZ2ZuKHMsIHRydWUpOw0KPiArICAgICAgICBodm1fYWRkX2lvcmVxX2dmbihzLCBmYWxzZSk7
DQo+ICsgICAgfQ0KPiANCj4gICAgICBzLT5lbmFibGVkID0gZmFsc2U7DQo+IA0KPiBAQCAtNzM2
LDMzICs3NTQsMzkgQEAgc3RhdGljIGludCBodm1faW9yZXFfc2VydmVyX2luaXQoc3RydWN0IGh2
bV9pb3JlcV9zZXJ2ZXIgKnMsDQo+ICAgICAgaW50IHJjOw0KPiANCj4gICAgICBzLT50YXJnZXQg
PSBkOw0KPiAtDQo+IC0gICAgZ2V0X2tub3duYWxpdmVfZG9tYWluKGN1cnJkKTsNCj4gLSAgICBz
LT5lbXVsYXRvciA9IGN1cnJkOw0KPiAtDQo+ICAgICAgc3Bpbl9sb2NrX2luaXQoJnMtPmxvY2sp
Ow0KPiAtICAgIElOSVRfTElTVF9IRUFEKCZzLT5pb3JlcV92Y3B1X2xpc3QpOw0KPiAtICAgIHNw
aW5fbG9ja19pbml0KCZzLT5idWZpb3JlcV9sb2NrKTsNCj4gLQ0KPiAtICAgIHMtPmlvcmVxLmdm
biA9IElOVkFMSURfR0ZOOw0KPiAtICAgIHMtPmJ1ZmlvcmVxLmdmbiA9IElOVkFMSURfR0ZOOw0K
PiANCj4gICAgICByYyA9IGh2bV9pb3JlcV9zZXJ2ZXJfYWxsb2NfcmFuZ2VzZXRzKHMsIGlkKTsN
Cj4gICAgICBpZiAoIHJjICkNCj4gICAgICAgICAgcmV0dXJuIHJjOw0KPiANCj4gLSAgICBzLT5i
dWZpb3JlcV9oYW5kbGluZyA9IGJ1ZmlvcmVxX2hhbmRsaW5nOw0KPiAtDQo+IC0gICAgZm9yX2Vh
Y2hfdmNwdSAoIGQsIHYgKQ0KPiArICAgIGlmICggIWh2bV9pb3JlcV9pc19pbnRlcm5hbChpZCkg
KQ0KPiAgICAgIHsNCj4gLSAgICAgICAgcmMgPSBodm1faW9yZXFfc2VydmVyX2FkZF92Y3B1KHMs
IHYpOw0KPiAtICAgICAgICBpZiAoIHJjICkNCj4gLSAgICAgICAgICAgIGdvdG8gZmFpbF9hZGQ7
DQo+ICsgICAgICAgIGdldF9rbm93bmFsaXZlX2RvbWFpbihjdXJyZCk7DQo+ICsNCj4gKyAgICAg
ICAgcy0+ZW11bGF0b3IgPSBjdXJyZDsNCj4gKyAgICAgICAgSU5JVF9MSVNUX0hFQUQoJnMtPmlv
cmVxX3ZjcHVfbGlzdCk7DQo+ICsgICAgICAgIHNwaW5fbG9ja19pbml0KCZzLT5idWZpb3JlcV9s
b2NrKTsNCj4gKw0KPiArICAgICAgICBzLT5pb3JlcS5nZm4gPSBJTlZBTElEX0dGTjsNCj4gKyAg
ICAgICAgcy0+YnVmaW9yZXEuZ2ZuID0gSU5WQUxJRF9HRk47DQo+ICsNCj4gKyAgICAgICAgcy0+
YnVmaW9yZXFfaGFuZGxpbmcgPSBidWZpb3JlcV9oYW5kbGluZzsNCj4gKw0KPiArICAgICAgICBm
b3JfZWFjaF92Y3B1ICggZCwgdiApDQo+ICsgICAgICAgIHsNCj4gKyAgICAgICAgICAgIHJjID0g
aHZtX2lvcmVxX3NlcnZlcl9hZGRfdmNwdShzLCB2KTsNCj4gKyAgICAgICAgICAgIGlmICggcmMg
KQ0KPiArICAgICAgICAgICAgICAgIGdvdG8gZmFpbF9hZGQ7DQo+ICsgICAgICAgIH0NCj4gICAg
ICB9DQo+ICsgICAgZWxzZQ0KPiArICAgICAgICBzLT5oYW5kbGVyID0gTlVMTDsNCg0KVGhlIHN0
cnVjdCBpcyB6ZXJvZWQgb3V0IHNvIGluaXRpYWxpemluZyB0aGUgaGFuZGxlciBpcyBub3QgbmVj
ZXNzYXJ5Lg0KDQo+IA0KPiAgICAgIHJldHVybiAwOw0KPiANCj4gICBmYWlsX2FkZDoNCj4gKyAg
ICBBU1NFUlQoIWh2bV9pb3JlcV9pc19pbnRlcm5hbChpZCkpOw0KPiAgICAgIGh2bV9pb3JlcV9z
ZXJ2ZXJfcmVtb3ZlX2FsbF92Y3B1cyhzKTsNCj4gICAgICBodm1faW9yZXFfc2VydmVyX3VubWFw
X3BhZ2VzKHMpOw0KPiANCg0KSSB0aGluayBpdCB3b3VsZCBiZSB3b3J0aHdoaWxlIGhhdmluZyB0
aGF0IEFTU0VSVCByZXBlYXRlZCBpbiB0aGUgY2FsbGVkIGZ1bmN0aW9ucywgYW5kIG90aGVyIGZ1
bmN0aW9ucyB0aGF0IG9ubHkgb3BlcmF0ZSBvbiBleHRlcm5hbCBpb3JlcSBzZXJ2ZXJzIGUuZy4g
aHZtX2lvcmVxX3NlcnZlcl9hZGRfdmNwdSgpLCBodm1faW9yZXFfc2VydmVyX21hcF9wYWdlcygp
LCBldGMuIA0KDQo+IEBAIC03NzIsMzAgKzc5NiwzNCBAQCBzdGF0aWMgaW50IGh2bV9pb3JlcV9z
ZXJ2ZXJfaW5pdChzdHJ1Y3QgaHZtX2lvcmVxX3NlcnZlciAqcywNCj4gICAgICByZXR1cm4gcmM7
DQo+ICB9DQo+IA0KPiAtc3RhdGljIHZvaWQgaHZtX2lvcmVxX3NlcnZlcl9kZWluaXQoc3RydWN0
IGh2bV9pb3JlcV9zZXJ2ZXIgKnMpDQo+ICtzdGF0aWMgdm9pZCBodm1faW9yZXFfc2VydmVyX2Rl
aW5pdChzdHJ1Y3QgaHZtX2lvcmVxX3NlcnZlciAqcywgYm9vbCBpbnRlcm5hbCkNCj4gIHsNCj4g
ICAgICBBU1NFUlQoIXMtPmVuYWJsZWQpOw0KPiAtICAgIGh2bV9pb3JlcV9zZXJ2ZXJfcmVtb3Zl
X2FsbF92Y3B1cyhzKTsNCj4gLQ0KPiAtICAgIC8qDQo+IC0gICAgICogTk9URTogSXQgaXMgc2Fm
ZSB0byBjYWxsIGJvdGggaHZtX2lvcmVxX3NlcnZlcl91bm1hcF9wYWdlcygpIGFuZA0KPiAtICAg
ICAqICAgICAgIGh2bV9pb3JlcV9zZXJ2ZXJfZnJlZV9wYWdlcygpIGluIHRoYXQgb3JkZXIuDQo+
IC0gICAgICogICAgICAgVGhpcyBpcyBiZWNhdXNlIHRoZSBmb3JtZXIgd2lsbCBkbyBub3RoaW5n
IGlmIHRoZSBwYWdlcw0KPiAtICAgICAqICAgICAgIGFyZSBub3QgbWFwcGVkLCBsZWF2aW5nIHRo
ZSBwYWdlIHRvIGJlIGZyZWVkIGJ5IHRoZSBsYXR0ZXIuDQo+IC0gICAgICogICAgICAgSG93ZXZl
ciBpZiB0aGUgcGFnZXMgYXJlIG1hcHBlZCB0aGVuIHRoZSBmb3JtZXIgd2lsbCBzZXQNCj4gLSAg
ICAgKiAgICAgICB0aGUgcGFnZV9pbmZvIHBvaW50ZXIgdG8gTlVMTCwgbWVhbmluZyB0aGUgbGF0
dGVyIHdpbGwgZG8NCj4gLSAgICAgKiAgICAgICBub3RoaW5nLg0KPiAtICAgICAqLw0KPiAtICAg
IGh2bV9pb3JlcV9zZXJ2ZXJfdW5tYXBfcGFnZXMocyk7DQo+IC0gICAgaHZtX2lvcmVxX3NlcnZl
cl9mcmVlX3BhZ2VzKHMpOw0KPiANCj4gICAgICBodm1faW9yZXFfc2VydmVyX2ZyZWVfcmFuZ2Vz
ZXRzKHMpOw0KPiANCj4gLSAgICBwdXRfZG9tYWluKHMtPmVtdWxhdG9yKTsNCj4gKyAgICBpZiAo
ICFpbnRlcm5hbCApDQoNClBlcmhhcHMgJ2lmICggaW50ZXJuYWwgKSByZXR1cm47JyBzbyBhcyB0
byBhdm9pZCBpbmRlbnRpbmcgdGhlIGNvZGUgYmVsb3cgYW5kIHRodXMgc2hyaW5rIHRoZSBkaWZm
Lg0KDQo+ICsgICAgew0KPiArICAgICAgICBodm1faW9yZXFfc2VydmVyX3JlbW92ZV9hbGxfdmNw
dXMocyk7DQo+ICsNCj4gKyAgICAgICAgLyoNCj4gKyAgICAgICAgICogTk9URTogSXQgaXMgc2Fm
ZSB0byBjYWxsIGJvdGggaHZtX2lvcmVxX3NlcnZlcl91bm1hcF9wYWdlcygpIGFuZA0KPiArICAg
ICAgICAgKiAgICAgICBodm1faW9yZXFfc2VydmVyX2ZyZWVfcGFnZXMoKSBpbiB0aGF0IG9yZGVy
Lg0KPiArICAgICAgICAgKiAgICAgICBUaGlzIGlzIGJlY2F1c2UgdGhlIGZvcm1lciB3aWxsIGRv
IG5vdGhpbmcgaWYgdGhlIHBhZ2VzDQo+ICsgICAgICAgICAqICAgICAgIGFyZSBub3QgbWFwcGVk
LCBsZWF2aW5nIHRoZSBwYWdlIHRvIGJlIGZyZWVkIGJ5IHRoZSBsYXR0ZXIuDQo+ICsgICAgICAg
ICAqICAgICAgIEhvd2V2ZXIgaWYgdGhlIHBhZ2VzIGFyZSBtYXBwZWQgdGhlbiB0aGUgZm9ybWVy
IHdpbGwgc2V0DQo+ICsgICAgICAgICAqICAgICAgIHRoZSBwYWdlX2luZm8gcG9pbnRlciB0byBO
VUxMLCBtZWFuaW5nIHRoZSBsYXR0ZXIgd2lsbCBkbw0KPiArICAgICAgICAgKiAgICAgICBub3Ro
aW5nLg0KPiArICAgICAgICAgKi8NCj4gKyAgICAgICAgaHZtX2lvcmVxX3NlcnZlcl91bm1hcF9w
YWdlcyhzKTsNCj4gKyAgICAgICAgaHZtX2lvcmVxX3NlcnZlcl9mcmVlX3BhZ2VzKHMpOw0KPiAr
DQo+ICsgICAgICAgIHB1dF9kb21haW4ocy0+ZW11bGF0b3IpOw0KPiArICAgIH0NCj4gIH0NCj4g
DQo+ICBpbnQgaHZtX2NyZWF0ZV9pb3JlcV9zZXJ2ZXIoc3RydWN0IGRvbWFpbiAqZCwgaW50IGJ1
ZmlvcmVxX2hhbmRsaW5nLA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlvc2Vydmlk
X3QgKmlkKQ0KPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlvc2VydmlkX3QgKmlkLCBi
b29sIGludGVybmFsKQ0KPiAgew0KPiAgICAgIHN0cnVjdCBodm1faW9yZXFfc2VydmVyICpzOw0K
PiAgICAgIHVuc2lnbmVkIGludCBpOw0KPiBAQCAtODExLDcgKzgzOSw5IEBAIGludCBodm1fY3Jl
YXRlX2lvcmVxX3NlcnZlcihzdHJ1Y3QgZG9tYWluICpkLCBpbnQgYnVmaW9yZXFfaGFuZGxpbmcs
DQo+ICAgICAgZG9tYWluX3BhdXNlKGQpOw0KPiAgICAgIHNwaW5fbG9ja19yZWN1cnNpdmUoJmQt
PmFyY2guaHZtLmlvcmVxX3NlcnZlci5sb2NrKTsNCj4gDQo+IC0gICAgZm9yICggaSA9IDA7IGkg
PCBNQVhfTlJfSU9SRVFfU0VSVkVSUzsgaSsrICkNCj4gKyAgICBmb3IgKCBpID0gKGludGVybmFs
ID8gTUFYX05SX0VYVEVSTkFMX0lPUkVRX1NFUlZFUlMgOiAwKTsNCj4gKyAgICAgICAgICBpIDwg
KGludGVybmFsID8gTUFYX05SX0lPUkVRX1NFUlZFUlMgOiBNQVhfTlJfRVhURVJOQUxfSU9SRVFf
U0VSVkVSUyk7DQo+ICsgICAgICAgICAgaSsrICkNCj4gICAgICB7DQo+ICAgICAgICAgIGlmICgg
IUdFVF9JT1JFUV9TRVJWRVIoZCwgaSkgKQ0KPiAgICAgICAgICAgICAgYnJlYWs7DQo+IEBAIC04
MjEsNiArODUxLDkgQEAgaW50IGh2bV9jcmVhdGVfaW9yZXFfc2VydmVyKHN0cnVjdCBkb21haW4g
KmQsIGludCBidWZpb3JlcV9oYW5kbGluZywNCj4gICAgICBpZiAoIGkgPj0gTUFYX05SX0lPUkVR
X1NFUlZFUlMgKQ0KPiAgICAgICAgICBnb3RvIGZhaWw7DQo+IA0KPiArICAgIEFTU0VSVCgoaW50
ZXJuYWwgJiYNCj4gKyAgICAgICAgICAgIGkgPj0gTUFYX05SX0VYVEVSTkFMX0lPUkVRX1NFUlZF
UlMgJiYgaSA8IE1BWF9OUl9JT1JFUV9TRVJWRVJTKSB8fA0KPiArICAgICAgICAgICAoIWludGVy
bmFsICYmIGkgPCBNQVhfTlJfRVhURVJOQUxfSU9SRVFfU0VSVkVSUykpOw0KPiAgICAgIC8qDQo+
ICAgICAgICogSXQgaXMgc2FmZSB0byBjYWxsIHNldF9pb3JlcV9zZXJ2ZXIoKSBwcmlvciB0bw0K
PiAgICAgICAqIGh2bV9pb3JlcV9zZXJ2ZXJfaW5pdCgpIHNpbmNlIHRoZSB0YXJnZXQgZG9tYWlu
IGlzIHBhdXNlZC4NCj4gQEAgLTg2NCwyMCArODk3LDIxIEBAIGludCBodm1fZGVzdHJveV9pb3Jl
cV9zZXJ2ZXIoc3RydWN0IGRvbWFpbiAqZCwgaW9zZXJ2aWRfdCBpZCkNCj4gICAgICAgICAgZ290
byBvdXQ7DQo+IA0KPiAgICAgIHJjID0gLUVQRVJNOw0KPiAtICAgIGlmICggcy0+ZW11bGF0b3Ig
IT0gY3VycmVudC0+ZG9tYWluICkNCj4gKyAgICAvKiBOQjogaW50ZXJuYWwgc2VydmVycyBjYW5u
b3QgYmUgZGVzdHJveWVkLiAqLw0KPiArICAgIGlmICggaHZtX2lvcmVxX2lzX2ludGVybmFsKGlk
KSB8fCBzLT5lbXVsYXRvciAhPSBjdXJyZW50LT5kb21haW4gKQ0KDQpTaG91bGRuJ3QgdGhlIHRl
c3Qgb2YgaHZtX2lvcmVxX2lzX2ludGVybmFsKGlkKSBzaW1wbHkgYmUgYW4gQVNTRVJUPyBUaGlz
IGZ1bmN0aW9uIHNob3VsZCBvbmx5IGJlIGNhbGxlZCBmcm9tIGEgZG1fb3AoKSwgcmlnaHQ/DQoN
Cj4gICAgICAgICAgZ290byBvdXQ7DQo+IA0KPiAgICAgIGRvbWFpbl9wYXVzZShkKTsNCj4gDQo+
ICAgICAgcDJtX3NldF9pb3JlcV9zZXJ2ZXIoZCwgMCwgaWQpOw0KPiANCj4gLSAgICBodm1faW9y
ZXFfc2VydmVyX2Rpc2FibGUocyk7DQo+ICsgICAgaHZtX2lvcmVxX3NlcnZlcl9kaXNhYmxlKHMs
IGh2bV9pb3JlcV9pc19pbnRlcm5hbChpZCkpOw0KPiANCj4gICAgICAvKg0KPiAgICAgICAqIEl0
IGlzIHNhZmUgdG8gY2FsbCBodm1faW9yZXFfc2VydmVyX2RlaW5pdCgpIHByaW9yIHRvDQo+ICAg
ICAgICogc2V0X2lvcmVxX3NlcnZlcigpIHNpbmNlIHRoZSB0YXJnZXQgZG9tYWluIGlzIHBhdXNl
ZC4NCj4gICAgICAgKi8NCj4gLSAgICBodm1faW9yZXFfc2VydmVyX2RlaW5pdChzKTsNCj4gKyAg
ICBodm1faW9yZXFfc2VydmVyX2RlaW5pdChzLCBodm1faW9yZXFfaXNfaW50ZXJuYWwoaWQpKTsN
Cj4gICAgICBzZXRfaW9yZXFfc2VydmVyKGQsIGlkLCBOVUxMKTsNCj4gDQo+ICAgICAgZG9tYWlu
X3VucGF1c2UoZCk7DQo+IEBAIC05MDksNyArOTQzLDggQEAgaW50IGh2bV9nZXRfaW9yZXFfc2Vy
dmVyX2luZm8oc3RydWN0IGRvbWFpbiAqZCwgaW9zZXJ2aWRfdCBpZCwNCj4gICAgICAgICAgZ290
byBvdXQ7DQo+IA0KPiAgICAgIHJjID0gLUVQRVJNOw0KPiAtICAgIGlmICggcy0+ZW11bGF0b3Ig
IT0gY3VycmVudC0+ZG9tYWluICkNCj4gKyAgICAvKiBOQjogZG9uJ3QgYWxsb3cgZmV0Y2hpbmcg
aW5mb3JtYXRpb24gZnJvbSBpbnRlcm5hbCBpb3JlcSBzZXJ2ZXJzLiAqLw0KPiArICAgIGlmICgg
aHZtX2lvcmVxX2lzX2ludGVybmFsKGlkKSB8fCBzLT5lbXVsYXRvciAhPSBjdXJyZW50LT5kb21h
aW4gKQ0KDQpBZ2FpbiBoZXJlLCBhbmQgc2V2ZXJhbCBwbGFjZXMgYmVsb3cuDQoNCiAgUGF1bA0K
DQo+ICAgICAgICAgIGdvdG8gb3V0Ow0KPiANCj4gICAgICBpZiAoIGlvcmVxX2dmbiB8fCBidWZp
b3JlcV9nZm4gKQ0KPiBAQCAtOTU2LDcgKzk5MSw3IEBAIGludCBodm1fZ2V0X2lvcmVxX3NlcnZl
cl9mcmFtZShzdHJ1Y3QgZG9tYWluICpkLCBpb3NlcnZpZF90IGlkLA0KPiAgICAgICAgICBnb3Rv
IG91dDsNCj4gDQo+ICAgICAgcmMgPSAtRVBFUk07DQo+IC0gICAgaWYgKCBzLT5lbXVsYXRvciAh
PSBjdXJyZW50LT5kb21haW4gKQ0KPiArICAgIGlmICggaHZtX2lvcmVxX2lzX2ludGVybmFsKGlk
KSB8fCBzLT5lbXVsYXRvciAhPSBjdXJyZW50LT5kb21haW4gKQ0KPiAgICAgICAgICBnb3RvIG91
dDsNCj4gDQo+ICAgICAgcmMgPSBodm1faW9yZXFfc2VydmVyX2FsbG9jX3BhZ2VzKHMpOw0KPiBA
QCAtMTAxMCw3ICsxMDQ1LDcgQEAgaW50IGh2bV9tYXBfaW9fcmFuZ2VfdG9faW9yZXFfc2VydmVy
KHN0cnVjdCBkb21haW4gKmQsIGlvc2VydmlkX3QgaWQsDQo+ICAgICAgICAgIGdvdG8gb3V0Ow0K
PiANCj4gICAgICByYyA9IC1FUEVSTTsNCj4gLSAgICBpZiAoIHMtPmVtdWxhdG9yICE9IGN1cnJl
bnQtPmRvbWFpbiApDQo+ICsgICAgaWYgKCAhaHZtX2lvcmVxX2lzX2ludGVybmFsKGlkKSAmJiBz
LT5lbXVsYXRvciAhPSBjdXJyZW50LT5kb21haW4gKQ0KPiAgICAgICAgICBnb3RvIG91dDsNCj4g
DQo+ICAgICAgc3dpdGNoICggdHlwZSApDQo+IEBAIC0xMDY4LDcgKzExMDMsNyBAQCBpbnQgaHZt
X3VubWFwX2lvX3JhbmdlX2Zyb21faW9yZXFfc2VydmVyKHN0cnVjdCBkb21haW4gKmQsIGlvc2Vy
dmlkX3QgaWQsDQo+ICAgICAgICAgIGdvdG8gb3V0Ow0KPiANCj4gICAgICByYyA9IC1FUEVSTTsN
Cj4gLSAgICBpZiAoIHMtPmVtdWxhdG9yICE9IGN1cnJlbnQtPmRvbWFpbiApDQo+ICsgICAgaWYg
KCAhaHZtX2lvcmVxX2lzX2ludGVybmFsKGlkKSAmJiBzLT5lbXVsYXRvciAhPSBjdXJyZW50LT5k
b21haW4gKQ0KPiAgICAgICAgICBnb3RvIG91dDsNCj4gDQo+ICAgICAgc3dpdGNoICggdHlwZSAp
DQo+IEBAIC0xMTI4LDYgKzExNjMsMTQgQEAgaW50IGh2bV9tYXBfbWVtX3R5cGVfdG9faW9yZXFf
c2VydmVyKHN0cnVjdCBkb21haW4gKmQsIGlvc2VydmlkX3QgaWQsDQo+ICAgICAgaWYgKCAhcyAp
DQo+ICAgICAgICAgIGdvdG8gb3V0Ow0KPiANCj4gKyAgICAvKg0KPiArICAgICAqIE5COiBkbyBu
b3Qgc3VwcG9ydCBtYXBwaW5nIGludGVybmFsIGlvcmVxIHNlcnZlcnMgdG8gbWVtb3J5IHR5cGVz
LCBhcw0KPiArICAgICAqIHRoZSBjdXJyZW50IGludGVybmFsIGlvcmVxIHNlcnZlcnMgZG9uJ3Qg
bmVlZCB0aGlzIGZlYXR1cmUgYW5kIGl0J3Mgbm90DQo+ICsgICAgICogYmVlbiB0ZXN0ZWQuDQo+
ICsgICAgICovDQo+ICsgICAgcmMgPSAtRUlOVkFMOw0KPiArICAgIGlmICggaHZtX2lvcmVxX2lz
X2ludGVybmFsKGlkKSApDQo+ICsgICAgICAgIGdvdG8gb3V0Ow0KPiAgICAgIHJjID0gLUVQRVJN
Ow0KPiAgICAgIGlmICggcy0+ZW11bGF0b3IgIT0gY3VycmVudC0+ZG9tYWluICkNCj4gICAgICAg
ICAgZ290byBvdXQ7DQo+IEBAIC0xMTYzLDE1ICsxMjA2LDE1IEBAIGludCBodm1fc2V0X2lvcmVx
X3NlcnZlcl9zdGF0ZShzdHJ1Y3QgZG9tYWluICpkLCBpb3NlcnZpZF90IGlkLA0KPiAgICAgICAg
ICBnb3RvIG91dDsNCj4gDQo+ICAgICAgcmMgPSAtRVBFUk07DQo+IC0gICAgaWYgKCBzLT5lbXVs
YXRvciAhPSBjdXJyZW50LT5kb21haW4gKQ0KPiArICAgIGlmICggIWh2bV9pb3JlcV9pc19pbnRl
cm5hbChpZCkgJiYgcy0+ZW11bGF0b3IgIT0gY3VycmVudC0+ZG9tYWluICkNCj4gICAgICAgICAg
Z290byBvdXQ7DQo+IA0KPiAgICAgIGRvbWFpbl9wYXVzZShkKTsNCj4gDQo+ICAgICAgaWYgKCBl
bmFibGVkICkNCj4gLSAgICAgICAgaHZtX2lvcmVxX3NlcnZlcl9lbmFibGUocyk7DQo+ICsgICAg
ICAgIGh2bV9pb3JlcV9zZXJ2ZXJfZW5hYmxlKHMsIGh2bV9pb3JlcV9pc19pbnRlcm5hbChpZCkp
Ow0KPiAgICAgIGVsc2UNCj4gLSAgICAgICAgaHZtX2lvcmVxX3NlcnZlcl9kaXNhYmxlKHMpOw0K
PiArICAgICAgICBodm1faW9yZXFfc2VydmVyX2Rpc2FibGUocywgaHZtX2lvcmVxX2lzX2ludGVy
bmFsKGlkKSk7DQo+IA0KPiAgICAgIGRvbWFpbl91bnBhdXNlKGQpOw0KPiANCj4gQEAgLTExOTAs
NyArMTIzMyw3IEBAIGludCBodm1fYWxsX2lvcmVxX3NlcnZlcnNfYWRkX3ZjcHUoc3RydWN0IGRv
bWFpbiAqZCwgc3RydWN0IHZjcHUgKnYpDQo+IA0KPiAgICAgIHNwaW5fbG9ja19yZWN1cnNpdmUo
JmQtPmFyY2guaHZtLmlvcmVxX3NlcnZlci5sb2NrKTsNCj4gDQo+IC0gICAgRk9SX0VBQ0hfSU9S
RVFfU0VSVkVSKGQsIGlkLCBzKQ0KPiArICAgIEZPUl9FQUNIX0VYVEVSTkFMX0lPUkVRX1NFUlZF
UihkLCBpZCwgcykNCj4gICAgICB7DQo+ICAgICAgICAgIHJjID0gaHZtX2lvcmVxX3NlcnZlcl9h
ZGRfdmNwdShzLCB2KTsNCj4gICAgICAgICAgaWYgKCByYyApDQo+IEBAIC0xMjAyLDcgKzEyNDUs
NyBAQCBpbnQgaHZtX2FsbF9pb3JlcV9zZXJ2ZXJzX2FkZF92Y3B1KHN0cnVjdCBkb21haW4gKmQs
IHN0cnVjdCB2Y3B1ICp2KQ0KPiAgICAgIHJldHVybiAwOw0KPiANCj4gICBmYWlsOg0KPiAtICAg
IHdoaWxlICggaWQrKyAhPSBNQVhfTlJfSU9SRVFfU0VSVkVSUyApDQo+ICsgICAgd2hpbGUgKCBp
ZCsrICE9IE1BWF9OUl9FWFRFUk5BTF9JT1JFUV9TRVJWRVJTICkNCj4gICAgICB7DQo+ICAgICAg
ICAgIHMgPSBHRVRfSU9SRVFfU0VSVkVSKGQsIGlkKTsNCj4gDQo+IEBAIC0xMjI0LDcgKzEyNjcs
NyBAQCB2b2lkIGh2bV9hbGxfaW9yZXFfc2VydmVyc19yZW1vdmVfdmNwdShzdHJ1Y3QgZG9tYWlu
ICpkLCBzdHJ1Y3QgdmNwdSAqdikNCj4gDQo+ICAgICAgc3Bpbl9sb2NrX3JlY3Vyc2l2ZSgmZC0+
YXJjaC5odm0uaW9yZXFfc2VydmVyLmxvY2spOw0KPiANCj4gLSAgICBGT1JfRUFDSF9JT1JFUV9T
RVJWRVIoZCwgaWQsIHMpDQo+ICsgICAgRk9SX0VBQ0hfRVhURVJOQUxfSU9SRVFfU0VSVkVSKGQs
IGlkLCBzKQ0KPiAgICAgICAgICBodm1faW9yZXFfc2VydmVyX3JlbW92ZV92Y3B1KHMsIHYpOw0K
PiANCj4gICAgICBzcGluX3VubG9ja19yZWN1cnNpdmUoJmQtPmFyY2guaHZtLmlvcmVxX3NlcnZl
ci5sb2NrKTsNCj4gQEAgLTEyNDEsMTMgKzEyODQsMTMgQEAgdm9pZCBodm1fZGVzdHJveV9hbGxf
aW9yZXFfc2VydmVycyhzdHJ1Y3QgZG9tYWluICpkKQ0KPiANCj4gICAgICBGT1JfRUFDSF9JT1JF
UV9TRVJWRVIoZCwgaWQsIHMpDQo+ICAgICAgew0KPiAtICAgICAgICBodm1faW9yZXFfc2VydmVy
X2Rpc2FibGUocyk7DQo+ICsgICAgICAgIGh2bV9pb3JlcV9zZXJ2ZXJfZGlzYWJsZShzLCBodm1f
aW9yZXFfaXNfaW50ZXJuYWwoaWQpKTsNCj4gDQo+ICAgICAgICAgIC8qDQo+ICAgICAgICAgICAq
IEl0IGlzIHNhZmUgdG8gY2FsbCBodm1faW9yZXFfc2VydmVyX2RlaW5pdCgpIHByaW9yIHRvDQo+
ICAgICAgICAgICAqIHNldF9pb3JlcV9zZXJ2ZXIoKSBzaW5jZSB0aGUgdGFyZ2V0IGRvbWFpbiBp
cyBiZWluZyBkZXN0cm95ZWQuDQo+ICAgICAgICAgICAqLw0KPiAtICAgICAgICBodm1faW9yZXFf
c2VydmVyX2RlaW5pdChzKTsNCj4gKyAgICAgICAgaHZtX2lvcmVxX3NlcnZlcl9kZWluaXQocywg
aHZtX2lvcmVxX2lzX2ludGVybmFsKGlkKSk7DQo+ICAgICAgICAgIHNldF9pb3JlcV9zZXJ2ZXIo
ZCwgaWQsIE5VTEwpOw0KPiANCj4gICAgICAgICAgeGZyZWUocyk7DQo+IGRpZmYgLS1naXQgYS94
ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9kb21haW4uaCBiL3hlbi9pbmNsdWRlL2FzbS14ODYvaHZt
L2RvbWFpbi5oDQo+IGluZGV4IDlmYmU4M2Y0NWEuLjlmOTI4MzhiNmUgMTAwNjQ0DQo+IC0tLSBh
L3hlbi9pbmNsdWRlL2FzbS14ODYvaHZtL2RvbWFpbi5oDQo+ICsrKyBiL3hlbi9pbmNsdWRlL2Fz
bS14ODYvaHZtL2RvbWFpbi5oDQo+IEBAIC05Nyw3ICs5NywxMCBAQCBzdHJ1Y3QgaHZtX3BpX29w
cyB7DQo+ICAgICAgdm9pZCAoKnZjcHVfYmxvY2spKHN0cnVjdCB2Y3B1ICopOw0KPiAgfTsNCj4g
DQo+IC0jZGVmaW5lIE1BWF9OUl9JT1JFUV9TRVJWRVJTIDgNCj4gKyNkZWZpbmUgTUFYX05SX0VY
VEVSTkFMX0lPUkVRX1NFUlZFUlMgOA0KPiArI2RlZmluZSBNQVhfTlJfSU5URVJOQUxfSU9SRVFf
U0VSVkVSUyAxDQo+ICsjZGVmaW5lIE1BWF9OUl9JT1JFUV9TRVJWRVJTIFwNCj4gKyAgICAoTUFY
X05SX0VYVEVSTkFMX0lPUkVRX1NFUlZFUlMgKyBNQVhfTlJfSU5URVJOQUxfSU9SRVFfU0VSVkVS
UykNCj4gDQo+ICBzdHJ1Y3QgaHZtX2RvbWFpbiB7DQo+ICAgICAgLyogR3Vlc3QgcGFnZSByYW5n
ZSB1c2VkIGZvciBub24tZGVmYXVsdCBpb3JlcSBzZXJ2ZXJzICovDQo+IGRpZmYgLS1naXQgYS94
ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9pb3JlcS5oIGIveGVuL2luY2x1ZGUvYXNtLXg4Ni9odm0v
aW9yZXEuaA0KPiBpbmRleCA2NTQ5MWM0OGQyLi5jMzkxN2FhNzRkIDEwMDY0NA0KPiAtLS0gYS94
ZW4vaW5jbHVkZS9hc20teDg2L2h2bS9pb3JlcS5oDQo+ICsrKyBiL3hlbi9pbmNsdWRlL2FzbS14
ODYvaHZtL2lvcmVxLmgNCj4gQEAgLTI0LDcgKzI0LDcgQEAgYm9vbCBoYW5kbGVfaHZtX2lvX2Nv
bXBsZXRpb24oc3RydWN0IHZjcHUgKnYpOw0KPiAgYm9vbCBpc19pb3JlcV9zZXJ2ZXJfcGFnZShz
dHJ1Y3QgZG9tYWluICpkLCBjb25zdCBzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlKTsNCj4gDQo+ICBp
bnQgaHZtX2NyZWF0ZV9pb3JlcV9zZXJ2ZXIoc3RydWN0IGRvbWFpbiAqZCwgaW50IGJ1ZmlvcmVx
X2hhbmRsaW5nLA0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlvc2VydmlkX3QgKmlk
KTsNCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICBpb3NlcnZpZF90ICppZCwgYm9vbCBp
bnRlcm5hbCk7DQo+ICBpbnQgaHZtX2Rlc3Ryb3lfaW9yZXFfc2VydmVyKHN0cnVjdCBkb21haW4g
KmQsIGlvc2VydmlkX3QgaWQpOw0KPiAgaW50IGh2bV9nZXRfaW9yZXFfc2VydmVyX2luZm8oc3Ry
dWN0IGRvbWFpbiAqZCwgaW9zZXJ2aWRfdCBpZCwNCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHVuc2lnbmVkIGxvbmcgKmlvcmVxX2dmbiwNCj4gQEAgLTU0LDYgKzU0LDEyIEBAIHVu
c2lnbmVkIGludCBodm1fYnJvYWRjYXN0X2lvcmVxKGlvcmVxX3QgKnAsIGJvb2wgYnVmZmVyZWQp
Ow0KPiANCj4gIHZvaWQgaHZtX2lvcmVxX2luaXQoc3RydWN0IGRvbWFpbiAqZCk7DQo+IA0KPiAr
c3RhdGljIGlubGluZSBib29sIGh2bV9pb3JlcV9pc19pbnRlcm5hbCh1bnNpZ25lZCBpbnQgaWQp
DQo+ICt7DQo+ICsgICAgQVNTRVJUKGlkIDwgTUFYX05SX0lPUkVRX1NFUlZFUlMpOw0KPiArICAg
IHJldHVybiBpZCA+PSBNQVhfTlJfRVhURVJOQUxfSU9SRVFfU0VSVkVSUzsNCj4gK30NCj4gKw0K
PiAgI2VuZGlmIC8qIF9fQVNNX1g4Nl9IVk1fSU9SRVFfSF9fICovDQo+IA0KPiAgLyoNCj4gLS0N
Cj4gMi4yMi4wDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
