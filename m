Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B66D60741
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jul 2019 16:07:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hjOoj-00006J-6H; Fri, 05 Jul 2019 14:04:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LVWj=VC=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hjOoi-00006E-1j
 for xen-devel@lists.xenproject.org; Fri, 05 Jul 2019 14:04:00 +0000
X-Inumbo-ID: bb52d226-9f2d-11e9-bcd9-976413afae58
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bb52d226-9f2d-11e9-bcd9-976413afae58;
 Fri, 05 Jul 2019 14:03:58 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=Paul.Durrant@citrix.com;
 spf=Pass smtp.mailfrom=Paul.Durrant@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 Paul.Durrant@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Paul.Durrant@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="Paul.Durrant@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Paul.Durrant@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: 7T5HCCi9KQFsvRN9q2xmfG+2NEScCrCIUOeS7oOAx+n1A8zZ6oytBprW6Me5cBiGWmo+tli3M6
 stabTLA1P6J9qnwo5jqHmB253dqWr8cJcHaXLuGQmA9P3jodVgHe0/1iJDNaAF7Yb/+jCdaZsY
 h7Dstxjdm+fssBVa4fVMvFnZW06V5gH27zzrZ9kVKsSkjeIe2Oc640dsaU6xYwVdqvBUl+XdHL
 fAaSv5FYBHMxyercNUypNN/C+7RbNrCFgihXNiaSykA6M+7zD0z8ZUpbASkStLI9NGAXzlC1Xl
 PlI=
X-SBRS: 2.7
X-MesageID: 2632605
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.63,455,1557201600"; 
   d="scan'208";a="2632605"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: 'Jan Beulich' <JBeulich@suse.com>, "xen-devel@lists.xenproject.org"
 <xen-devel@lists.xenproject.org>
Thread-Topic: [PATCH v2 2/2] xmalloc: add a Kconfig option to poison free pool
 memory
Thread-Index: AQHVMxBuAB47ok4/wEaTDCbtgJuGq6a75vKAgAAnQkA=
Date: Fri, 5 Jul 2019 14:03:30 +0000
Message-ID: <c5569c96aa494998a1036c76c4a4775f@AMSPEX02CL03.citrite.net>
References: <20190705090249.1935-1-paul.durrant@citrix.com>
 <20190705090249.1935-3-paul.durrant@citrix.com>
 <ce6dbd96-3a20-36fd-dba0-7f9bd7b3f51d@suse.com>
In-Reply-To: <ce6dbd96-3a20-36fd-dba0-7f9bd7b3f51d@suse.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 2/2] xmalloc: add a Kconfig option to
 poison free pool memory
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>, "Tim \(Xen.org\)" <tim@xen.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien.grall@arm.com>,
 Ian Jackson <Ian.Jackson@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBKYW4gQmV1bGljaCA8SkJldWxp
Y2hAc3VzZS5jb20+DQo+IFNlbnQ6IDA1IEp1bHkgMjAxOSAxNDo0MQ0KPiBUbzogUGF1bCBEdXJy
YW50IDxQYXVsLkR1cnJhbnRAY2l0cml4LmNvbT47IHhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZw0KPiBDYzogSnVsaWVuIEdyYWxsIDxqdWxpZW4uZ3JhbGxAYXJtLmNvbT47IEFuZHJldyBD
b29wZXIgPEFuZHJldy5Db29wZXIzQGNpdHJpeC5jb20+OyBHZW9yZ2UgRHVubGFwDQo+IDxHZW9y
Z2UuRHVubGFwQGNpdHJpeC5jb20+OyBJYW4gSmFja3NvbiA8SWFuLkphY2tzb25AY2l0cml4LmNv
bT47IFN0ZWZhbm8gU3RhYmVsbGluaQ0KPiA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz47IEtvbnJh
ZCBSemVzenV0ZWsgV2lsayA8a29ucmFkLndpbGtAb3JhY2xlLmNvbT47IFRpbSAoWGVuLm9yZykg
PHRpbUB4ZW4ub3JnPjsNCj4gV2VpIExpdSA8d2xAeGVuLm9yZz4NCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2MiAyLzJdIHhtYWxsb2M6IGFkZCBhIEtjb25maWcgb3B0aW9uIHRvIHBvaXNvbiBmcmVl
IHBvb2wgbWVtb3J5DQo+IA0KPiBPbiAwNS4wNy4yMDE5IDExOjAyLCBQYXVsIER1cnJhbnQgd3Jv
dGU6DQo+ID4gLS0tIGEveGVuL0tjb25maWcuZGVidWcNCj4gPiArKysgYi94ZW4vS2NvbmZpZy5k
ZWJ1Zw0KPiA+IEBAIC0xMDUsNiArMTA1LDEzIEBAIGNvbmZpZyBERUJVR19UUkFDRQ0KPiA+ICAg
CSAgZWl0aGVyIGRpcmVjdGx5IHRvIHRoZSBjb25zb2xlIG9yIGFyZSBwcmludGVkIHRvIGNvbnNv
bGUgaW4gY2FzZSBvZg0KPiA+ICAgCSAgYSBzeXN0ZW0gY3Jhc2guDQo+ID4NCj4gPiArY29uZmln
IFhNRU1fUE9PTF9QT0lTT04NCj4gPiArICAgICAgIGJvb2wgIlBvaXNvbiBmcmVlIHhlbnBvb2wg
YmxvY2tzIg0KPiA+ICsgICAgICAgZGVmYXVsdCBERUJVRw0KPiA+ICsgICAgICAgLS0taGVscC0t
LQ0KPiA+ICsJIFBvaXNvbiBmcmVlIGJsb2NrcyB3aXRoIDB4QUEgYnl0ZXMgYW5kIHZlcmlmeSB0
aGVtIHdoZW4gYSBibG9jayBpcw0KPiA+ICsJIGFsbG9jYXRlZCBpbiBvcmRlciB0byBzcG90IHVz
ZS1hZnRlci1mcmVlIGlzc3Vlcy4NCj4gDQo+IFRoZXJlIGxvb2tzIHRvIGJlIGEgc3BhY2VzIHZz
IHRhYnMgcHJvYmxlbSBoZXJlOiBPbmx5IHRoZSBoZWxwDQo+IHRleHQgaGFzIHRhYnMgZm9yIGlu
aXRpYWwgaW5kZW50YXRpb24uDQoNCk9oIHllcy4gSSdsbCBmaXggdGhhdC4NCg0KPiANCj4gPiAt
LS0gYS94ZW4vY29tbW9uL3htYWxsb2NfdGxzZi5jDQo+ID4gKysrIGIveGVuL2NvbW1vbi94bWFs
bG9jX3Rsc2YuYw0KPiA+IEBAIC0yMzgsNiArMjM4LDExIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBF
WFRSQUNUX0JMT0NLKHN0cnVjdCBiaGRyICpiLCBzdHJ1Y3QgeG1lbV9wb29sICpwLCBpbnQgZmws
DQo+ID4gICAgICAgICAgIH0NCj4gPiAgICAgICB9DQo+ID4gICAgICAgYi0+cHRyLmZyZWVfcHRy
ID0gKHN0cnVjdCBmcmVlX3B0cikge05VTEwsIE5VTEx9Ow0KPiA+ICsjaWZkZWYgQ09ORklHX1hN
RU1fUE9PTF9QT0lTT04NCj4gPiArICAgIGlmICggKGItPnNpemUgJiBCTE9DS19TSVpFX01BU0sp
ID4gTUlOX0JMT0NLX1NJWkUgKQ0KPiA+ICsgICAgICAgIEFTU0VSVCghbWVtY2hyX2ludihiLT5w
dHIuYnVmZmVyICsgTUlOX0JMT0NLX1NJWkUsIDB4QUEsDQo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgIChiLT5zaXplICYgQkxPQ0tfU0laRV9NQVNLKSAtIE1JTl9CTE9DS19TSVpFKSk7
DQo+ID4gKyNlbmRpZiAvKiBDT05GSUdfWE1FTV9QT09MX1BPSVNPTiAqLw0KPiA+ICAgfQ0KPiA+
DQo+ID4gICAvKioNCj4gPiBAQCAtMjQ1LDYgKzI1MCwxMSBAQCBzdGF0aWMgaW5saW5lIHZvaWQg
RVhUUkFDVF9CTE9DSyhzdHJ1Y3QgYmhkciAqYiwgc3RydWN0IHhtZW1fcG9vbCAqcCwgaW50IGZs
LA0KPiA+ICAgICovDQo+ID4gICBzdGF0aWMgaW5saW5lIHZvaWQgSU5TRVJUX0JMT0NLKHN0cnVj
dCBiaGRyICpiLCBzdHJ1Y3QgeG1lbV9wb29sICpwLCBpbnQgZmwsIGludCBzbCkNCj4gPiAgIHsN
Cj4gPiArI2lmZGVmIENPTkZJR19YTUVNX1BPT0xfUE9JU09ODQo+ID4gKyAgICBpZiAoIChiLT5z
aXplICYgQkxPQ0tfU0laRV9NQVNLKSA+IE1JTl9CTE9DS19TSVpFICkNCj4gPiArICAgICAgICBt
ZW1zZXQoYi0+cHRyLmJ1ZmZlciArIE1JTl9CTE9DS19TSVpFLCAweEFBLA0KPiA+ICsgICAgICAg
ICAgICAgICAoYi0+c2l6ZSAmIEJMT0NLX1NJWkVfTUFTSykgLSBNSU5fQkxPQ0tfU0laRSk7DQo+
ID4gKyNlbmRpZiAvKiBDT05GSUdfWE1FTV9QT09MX1BPSVNPTiAqLw0KPiANCj4gQ2FuIHlvdSB0
aWUgdG9nZXRoZXIgdGhlIHR3byBpbnN0YW5jZXMgb2YgMHhBQSB2aWEgYSAjZGVmaW5lLA0KPiBw
bGVhc2U/DQo+IA0KDQpPaywgc3VyZS4NCg0KPiBJdCB3b3VsZCBhbHNvIGJlIG5pY2UgaWYgYm90
aCAjaWZkZWYgYmxvY2tzIHdlcmUgc2VwYXJhdGVkIGZyb20NCj4gdGhlaXIgbmVpZ2hib3Jpbmcg
Y29kZSBieSBhIGJsYW5rIGxpbmUsIGRlc3BpdGUgdGhlIGZpbGUgdXNpbmcNCj4gYmxhbmsgbGlu
ZXMgcmF0aGVyIHNwYXJpbmdseSBzbyBmYXIuDQo+IA0KPiBXaXRoIHRoZSBhZGp1c3RtZW50cyBo
ZXJlIEkgdGhpbmsgaXQgd291bGQgYmUgYmVzdCBpZiB5b3UgY291bGQNCj4gYWxzbyByZXNlbmQg
cGF0Y2ggMSB3aXRoIHRoZSBzbGlnaHRseSBhZGp1c3RlZCBjb21taXQgbWVzc2FnZS4NCg0KQWxy
aWdodCwgd2lsbCBkby4NCg0KICBQYXVsDQoNCj4gDQo+IEphbg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
