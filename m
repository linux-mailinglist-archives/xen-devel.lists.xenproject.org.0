Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A70914EF71
	for <lists+xen-devel@lfdr.de>; Fri, 31 Jan 2020 16:21:49 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ixY49-0007yQ-8U; Fri, 31 Jan 2020 15:18:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Qch3=3U=amazon.co.uk=prvs=292a3fd2f=pdurrant@srs-us1.protection.inumbo.net>)
 id 1ixY47-0007yJ-Nj
 for xen-devel@lists.xenproject.org; Fri, 31 Jan 2020 15:18:39 +0000
X-Inumbo-ID: f45eea50-443c-11ea-b211-bc764e2007e4
Received: from smtp-fw-6002.amazon.com (unknown [52.95.49.90])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f45eea50-443c-11ea-b211-bc764e2007e4;
 Fri, 31 Jan 2020 15:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.co.uk; i=@amazon.co.uk; q=dns/txt;
 s=amazon201209; t=1580483917; x=1612019917;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OYZLjEG15AoldxrM/yIrlISuM5n0W3aqRuHwTHeBKUk=;
 b=flCLa8C1EUXl6HOLBlg7RRWaAFaIRqErCJKDOkVvw48SlLNUHMiN9NF0
 u/HVYdKbj+K7v3c63VQSPJ7VZP6DSdu1R1/zoyF5luYue/bg+sl8DkaCM
 udheuBVdnGy2EytnHkBHm+7AbGHm+dCp8ABCrVDujsSUj2piozNcQj1g/ M=;
IronPort-SDR: fAF+n0LFiHVrJg055llvR4IF9aEs+OfwS93PxBIwqAHv3M8HSN+vBHFnnQSWu7K1GVhL9a9lW0
 E1g0TfZuTlDA==
X-IronPort-AV: E=Sophos;i="5.70,386,1574121600"; d="scan'208";a="14196268"
Received: from iad12-co-svc-p1-lb1-vlan3.amazon.com (HELO
 email-inbound-relay-1d-9ec21598.us-east-1.amazon.com) ([10.43.8.6])
 by smtp-border-fw-out-6002.iad6.amazon.com with ESMTP;
 31 Jan 2020 15:18:37 +0000
Received: from EX13MTAUEA002.ant.amazon.com
 (iad55-ws-svc-p15-lb9-vlan3.iad.amazon.com [10.40.159.166])
 by email-inbound-relay-1d-9ec21598.us-east-1.amazon.com (Postfix) with ESMTPS
 id 49CA2A242B; Fri, 31 Jan 2020 15:18:33 +0000 (UTC)
Received: from EX13D32EUC004.ant.amazon.com (10.43.164.121) by
 EX13MTAUEA002.ant.amazon.com (10.43.61.77) with Microsoft SMTP Server (TLS)
 id 15.0.1236.3; Fri, 31 Jan 2020 15:18:33 +0000
Received: from EX13D32EUC003.ant.amazon.com (10.43.164.24) by
 EX13D32EUC004.ant.amazon.com (10.43.164.121) with Microsoft SMTP Server (TLS)
 id 15.0.1367.3; Fri, 31 Jan 2020 15:18:32 +0000
Received: from EX13D32EUC003.ant.amazon.com ([10.43.164.24]) by
 EX13D32EUC003.ant.amazon.com ([10.43.164.24]) with mapi id 15.00.1367.000;
 Fri, 31 Jan 2020 15:18:32 +0000
From: "Durrant, Paul" <pdurrant@amazon.co.uk>
To: Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Thread-Topic: [PATCH v8 2/4] add a domain_tot_pages() helper function
Thread-Index: AQHV132q3dH9I4+EGUirmAaSnjJ2uagEu56AgAAmLUA=
Date: Fri, 31 Jan 2020 15:18:32 +0000
Message-ID: <4b76be790d8345c18a5d1e0b1e41a18d@EX13D32EUC003.ant.amazon.com>
References: <20200130145745.1306-1-pdurrant@amazon.com>
 <20200130145745.1306-3-pdurrant@amazon.com>
 <7395a51b-7c7e-585f-bac1-a395cb5ba520@suse.com>
In-Reply-To: <7395a51b-7c7e-585f-bac1-a395cb5ba520@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.43.165.63]
MIME-Version: 1.0
Precedence: Bulk
Subject: Re: [Xen-devel] [PATCH v8 2/4] add a domain_tot_pages() helper
 function
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 Tim Deegan <tim@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDMxIEphbnVhcnkgMjAyMCAxMjo1Mw0KPiBUbzogRHVycmFu
dCwgUGF1bCA8cGR1cnJhbnRAYW1hem9uLmNvLnVrPg0KPiBDYzogeGVuLWRldmVsQGxpc3RzLnhl
bnByb2plY3Qub3JnOyBBbmRyZXcgQ29vcGVyDQo+IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29t
PjsgV2VpIExpdSA8d2xAeGVuLm9yZz47IFJvZ2VyIFBhdSBNb25uw6kNCj4gPHJvZ2VyLnBhdUBj
aXRyaXguY29tPjsgR2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPjsg
SWFuDQo+IEphY2tzb24gPGlhbi5qYWNrc29uQGV1LmNpdHJpeC5jb20+OyBKdWxpZW4gR3JhbGwg
PGp1bGllbkB4ZW4ub3JnPjsgS29ucmFkDQo+IFJ6ZXN6dXRlayBXaWxrIDxrb25yYWQud2lsa0Bv
cmFjbGUuY29tPjsgU3RlZmFubyBTdGFiZWxsaW5pDQo+IDxzc3RhYmVsbGluaUBrZXJuZWwub3Jn
PjsgVGltIERlZWdhbiA8dGltQHhlbi5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjggMi80
XSBhZGQgYSBkb21haW5fdG90X3BhZ2VzKCkgaGVscGVyIGZ1bmN0aW9uDQo+IA0KPiBPbiAzMC4w
MS4yMDIwIDE1OjU3LCBQYXVsIER1cnJhbnQgd3JvdGU6DQo+ID4gdjg6DQo+ID4gIC0gTmV3IGlu
IHY4DQo+ID4gLS0tDQo+ID4gIHhlbi9hcmNoL3g4Ni9kb21haW4uYyAgICAgICAgICAgfCAgMiAr
LQ0KPiA+ICB4ZW4vYXJjaC94ODYvbW0uYyAgICAgICAgICAgICAgIHwgIDYgKysrLS0tDQo+ID4g
IHhlbi9hcmNoL3g4Ni9tbS9wMm0tcG9kLmMgICAgICAgfCAxMCArKysrKy0tLS0tDQo+ID4gIHhl
bi9hcmNoL3g4Ni9tbS9zaGFkb3cvY29tbW9uLmMgfCAgMiArLQ0KPiA+ICB4ZW4vYXJjaC94ODYv
bXNpLmMgICAgICAgICAgICAgIHwgIDIgKy0NCj4gPiAgeGVuL2FyY2gveDg2L251bWEuYyAgICAg
ICAgICAgICB8ICAyICstDQo+ID4gIHhlbi9hcmNoL3g4Ni9wdi9kb20wX2J1aWxkLmMgICAgfCAy
NSArKysrKysrKysrKysrLS0tLS0tLS0tLS0tDQo+ID4gIHhlbi9hcmNoL3g4Ni9wdi9kb21haW4u
YyAgICAgICAgfCAgMiArLQ0KPiA+ICB4ZW4vY29tbW9uL2RvbWN0bC5jICAgICAgICAgICAgIHwg
IDIgKy0NCj4gPiAgeGVuL2NvbW1vbi9ncmFudF90YWJsZS5jICAgICAgICB8ICA0ICsrLS0NCj4g
PiAgeGVuL2NvbW1vbi9rZXloYW5kbGVyLmMgICAgICAgICB8ICAyICstDQo+ID4gIHhlbi9jb21t
b24vbWVtb3J5LmMgICAgICAgICAgICAgfCAgNCArKy0tDQo+ID4gIHhlbi9jb21tb24vcGFnZV9h
bGxvYy5jICAgICAgICAgfCAxNSArKysrKysrKy0tLS0tLS0NCj4gPiAgeGVuL2luY2x1ZGUvcHVi
bGljL21lbW9yeS5oICAgICB8ICA0ICsrLS0NCj4gPiAgeGVuL2luY2x1ZGUveGVuL3NjaGVkLmgg
ICAgICAgICB8IDI0ICsrKysrKysrKysrKysrKysrKy0tLS0tLQ0KPiA+ICAxNSBmaWxlcyBjaGFu
Z2VkLCA2MCBpbnNlcnRpb25zKCspLCA0NiBkZWxldGlvbnMoLSkNCj4gDQo+IEZyb20gdGhpcywg
d2l0aCB0aGUgY29tbWVudCB5b3UgYWRkIG5leHQgdG8gdGhlIHN0cnVjdCBmaWVsZCwgYW5kDQo+
IHdpdGggeW91ciByZXBseSB5ZXN0ZXJkYXksIHdoYXQgYWJvdXQgdGhlIHVzZXMgaW4NCj4gLSBh
cmNoL2FybS9hcm02NC9kb21jdGwuYzpzd2l0Y2hfbW9kZSgpLA0KDQpUQkggSSdtIG5vdCBzdXJl
IHdpdGggdGhhdCBvbmUuIEl0IGxvb2tzIHRvIG1lIGxpa2UgaXQgbmVlZHMgdG8gY2hlY2sgd2hl
dGhlciB0aGUgZG9tYWluIGhhcyAqYW55KiBtZW1vcnkgYXNzaWduZWQuIFBlcmhhcHMgY2hlY2tp
bmcgcGFnZV9saXN0IHdvdWxkIGJlIG1vcmUgYXBwcm9wcmlhdGUuIFBlcmhhcHMgSnVsaWVuIGNh
biBjb21tZW50Pw0KDQo+IC0gYXJjaC94ODYvcHYvc2hpbS5jOnB2X3NoaW1fc2V0dXBfZG9tKCks
DQo+IC0gYXJjaC94ODYvcHYvc2hpbS5jOndyaXRlX3N0YXJ0X2luZm8oKT8NCg0KSXQgbG9va3Mg
bGlrZSBib3RoIG9mIHRob3NlIHNob3VsZCBiZSBjaGFuZ2VkLg0KDQo+IA0KPiA+IC0tLSBhL3hl
bi9hcmNoL3g4Ni9tbS5jDQo+ID4gKysrIGIveGVuL2FyY2gveDg2L21tLmMNCj4gPiBAQCAtNDE5
NCw4ICs0MTk0LDggQEAgbG9uZyBkb19tbXVfdXBkYXRlKA0KPiA+ICAgKiAtIHBhZ2UgY2FjaGlu
ZyBhdHRyaWJ1dGVzIGNsZWFuZWQgdXANCj4gPiAgICogLSByZW1vdmVkIGZyb20gdGhlIGRvbWFp
bidzIHBhZ2VfbGlzdA0KPiA+ICAgKg0KPiA+IC0gKiBJZiBNRU1GX25vX3JlZmNvdW50IGlzIG5v
dCBzZXQsIHRoZSBkb21haW4ncyB0b3RfcGFnZXMgd2lsbCBiZQ0KPiA+IC0gKiBhZGp1c3RlZC4g
IElmIHRoaXMgcmVzdWx0cyBpbiB0aGUgcGFnZSBjb3VudCBmYWxsaW5nIHRvIDAsDQo+ID4gKyAq
IElmIE1FTUZfbm9fcmVmY291bnQgaXMgbm90IHNldCwgdGhlIGRvbWFpbl9hZGp1c3RfdG90X3Bh
Z2VzKCkgd2lsbA0KPiA+ICsgKiBiZSBjYWxsZWQuICBJZiB0aGlzIHJlc3VsdHMgaW4gdGhlIHBh
Z2UgY291bnQgZmFsbGluZyB0byAwLA0KPiA+ICAgKiBwdXRfZG9tYWluKCkgd2lsbCBiZSBjYWxs
ZWQuDQo+IA0KPiBJZiB5b3UgZmlkZGxlIHdpdGggdGhpcyBjb21tZW50LCBwbGVhc2UgYWxzbyBk
cm9wIHRoZSAidGhlIiBhaGVhZA0KPiBvZiB0aGUgZnVuY3Rpb24gbmFtZS4gVW5sZXNzIHlvdSBh
cyBhIG5hdGl2ZSBzcGVha2VyIHdvdWxkIGNvbmZpcm0NCj4gaXQncyBhcHByb3ByaWF0ZSB0aGVy
ZSAoaXQgZG9lc24ndCBzZWVtIHNvIHRvIG1lKS4gT2YgY291cnNlIEkNCj4gYWxzbyB3b3VsZG4n
dCBtaW5kIGxlYXZpbmcgdGhpcyB1bnRvdWNoZWQgYWx0b2dldGhlci4NCj4gDQoNCk9rLCBJJ2xs
IGRyb3AgdGhhdCBodW5rLg0KDQo+ID4gLS0tIGEveGVuL2NvbW1vbi9tZW1vcnkuYw0KPiA+ICsr
KyBiL3hlbi9jb21tb24vbWVtb3J5LmMNCj4gPiBAQCAtNzE3LDcgKzcxNyw3IEBAIHN0YXRpYyBs
b25nDQo+IG1lbW9yeV9leGNoYW5nZShYRU5fR1VFU1RfSEFORExFX1BBUkFNKHhlbl9tZW1vcnlf
ZXhjaGFuZ2VfdCkgYXJnKQ0KPiA+DQo+ID4gICAgICAgICAgICAgICAgICAvKg0KPiA+ICAgICAg
ICAgICAgICAgICAgICogUGFnZXMgaW4gaW5fY2h1bmtfbGlzdCBpcyBzdG9sZW4gd2l0aG91dA0K
PiA+IC0gICAgICAgICAgICAgICAgICogZGVjcmVhc2luZyB0aGUgdG90X3BhZ2VzLiBJZiB0aGUg
ZG9tYWluIGlzIGR5aW5nDQo+IHdoZW4NCj4gPiArICAgICAgICAgICAgICAgICAqIGRlY3JlYXNp
bmcgZG9tYWluX3RvdF9wYWdlcygpLiBJZiB0aGUgZG9tYWluIGlzDQo+IGR5aW5nIHdoZW4NCj4g
DQo+IEknZCBsZWF2ZSB0aGlzIGNvbW1lbnQgYWxvbmUsIG9yIGF0IGxlYXN0IG5vdCB1c2UgdGhl
IGZ1bmN0aW9uDQo+IG5hbWUuIE1heWJlIGRvIGFzIHlvdSBkaWQgaW4gdGhlIHB1YmxpYyBoZWFk
ZXI/DQo+IA0KDQpPSyBJJ2xsIGxlYXZlIHRoaXMgYWxvbmUgdG9vLg0KDQo+ID4gLS0tIGEveGVu
L2luY2x1ZGUveGVuL3NjaGVkLmgNCj4gPiArKysgYi94ZW4vaW5jbHVkZS94ZW4vc2NoZWQuaA0K
PiA+IEBAIC0zNjQsMTIgKzM2NCwxOCBAQCBzdHJ1Y3QgZG9tYWluDQo+ID4gICAgICBzcGlubG9j
a190ICAgICAgIHBhZ2VfYWxsb2NfbG9jazsgLyogcHJvdGVjdHMgYWxsIHRoZSBmb2xsb3dpbmcN
Cj4gZmllbGRzICAqLw0KPiA+ICAgICAgc3RydWN0IHBhZ2VfbGlzdF9oZWFkIHBhZ2VfbGlzdDsg
IC8qIGxpbmtlZCBsaXN0ICovDQo+ID4gICAgICBzdHJ1Y3QgcGFnZV9saXN0X2hlYWQgeGVucGFn
ZV9saXN0OyAvKiBsaW5rZWQgbGlzdCAoc2l6ZQ0KPiB4ZW5oZWFwX3BhZ2VzKSAqLw0KPiA+IC0g
ICAgdW5zaWduZWQgaW50ICAgICB0b3RfcGFnZXM7ICAgICAgIC8qIG51bWJlciBvZiBwYWdlcyBj
dXJyZW50bHkNCj4gcG9zc2VzZWQgKi8NCj4gPiAtICAgIHVuc2lnbmVkIGludCAgICAgeGVuaGVh
cF9wYWdlczsgICAvKiAjIHBhZ2VzIGFsbG9jYXRlZCBmcm9tIFhlbg0KPiBoZWFwICAgICovDQo+
ID4gLSAgICB1bnNpZ25lZCBpbnQgICAgIG91dHN0YW5kaW5nX3BhZ2VzOyAvKiBwYWdlcyBjbGFp
bWVkIGJ1dCBub3QNCj4gcG9zc2Vzc2VkICAqLw0KPiA+IC0gICAgdW5zaWduZWQgaW50ICAgICBt
YXhfcGFnZXM7ICAgICAgIC8qIG1heGltdW0gdmFsdWUgZm9yIHRvdF9wYWdlcw0KPiAqLw0KPiA+
IC0gICAgYXRvbWljX3QgICAgICAgICBzaHJfcGFnZXM7ICAgICAgIC8qIG51bWJlciBvZiBzaGFy
ZWQgcGFnZXMNCj4gKi8NCj4gPiAtICAgIGF0b21pY190ICAgICAgICAgcGFnZWRfcGFnZXM7ICAg
ICAvKiBudW1iZXIgb2YgcGFnZWQtb3V0IHBhZ2VzDQo+ICovDQo+ID4gKw0KPiA+ICsgICAgLyoN
Cj4gPiArICAgICAqIFRoaXMgZmllbGQgc2hvdWxkIG9ubHkgYmUgZGlyZWN0bHkgYWNjZXNzZWQg
YnkNCj4gZG9tYWluX2FkanVzdF90b3RfcGFnZXMoKQ0KPiA+ICsgICAgICogYW5kIHRoZSBkb21h
aW5fdG90X3BhZ2VzKCkgaGVscGVyIGZ1bmN0aW9uIGRlZmluZWQgYmVsb3cuDQo+ID4gKyAgICAg
Ki8NCj4gPiArICAgIHVuc2lnbmVkIGludCAgICAgdG90X3BhZ2VzOw0KPiANCj4gSWYgdGhlIHRo
cmVlIG1pc3Npbmcgb25lcyBnb3QgdGFrZW4gY2FyZSBvZiwgd2l0aCB0aGVyZSBiZWluZyBhcmd1
bWVudHMNCj4gYm90aCBwcm8gYW5kIGNvbiB5b3VyIGNoYW5nZSB0byBkdW1wX3BhZ2VmcmFtZV9p
bmZvKCksIEknZCBiZSBva2F5IHdpdGgNCj4gaXQgZ2V0dGluZyBjaGFuZ2VkIGFzIHlvdSBkbywg
dG8gbm90IHJlbmRlciB0aGlzIGNvbW1lbnQgcGFydGlhbGx5DQo+IHdyb25nLg0KDQpPay4NCg0K
ICBQYXVsDQoNCj4gDQo+IEphbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
