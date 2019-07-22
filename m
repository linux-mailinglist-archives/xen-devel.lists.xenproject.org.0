Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB8B4701E1
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jul 2019 16:07:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hpYuu-0002mP-W1; Mon, 22 Jul 2019 14:03:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=+VRc=VT=citrix.com=paul.durrant@srs-us1.protection.inumbo.net>)
 id 1hpYut-0002mK-IZ
 for xen-devel@lists.xenproject.org; Mon, 22 Jul 2019 14:03:51 +0000
X-Inumbo-ID: 86a9840c-ac89-11e9-8bd6-9f9e45ca603c
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 86a9840c-ac89-11e9-8bd6-9f9e45ca603c;
 Mon, 22 Jul 2019 14:03:48 +0000 (UTC)
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
IronPort-SDR: 0C5YZnxd0rs2c14yTizC4S1NpCOCgODfbvLy3IwxIwTrCnt+LYqGJbDwzdux/7Pya0snzFNYCH
 SQddpv6y2QLnS68M15WKm1d2nE9tBomwK4+bvvx+ybtiuQv9RvmJY3Iv63YPD2+UlzPTXYCCQO
 LbRkxtAut1XKWQhatMtK5i5uUKN/JBAM4rWvrlJ2mf1aH4tk8Ofp6Uuv2UL6TQlm5gb9SFYevX
 SX1sPs7iMqjX8zGsQgsZwhlbQ351FP29xAC/kzyGvpbVv6ebKwq/MF5/LhitW1V5E0RKkJbIig
 Bic=
X-SBRS: 2.7
X-MesageID: 3281356
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,295,1559534400"; 
   d="scan'208";a="3281356"
From: Paul Durrant <Paul.Durrant@citrix.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Thread-Topic: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
Thread-Index: AQHVPmzkQranvSB3QkuFJWZsoolqxKbWTmUwgAAaH4CAACIW8P///zuAgAAjM0A=
Date: Mon, 22 Jul 2019 14:03:44 +0000
Message-ID: <81a7cdc728294e5ca05fd056a87cb21b@AMSPEX02CL03.citrite.net>
References: <CAMmSBy9g-QFHTXhpHK6=xDFiBDj4LpnJ=cXj405MMmA1rJaOUg@mail.gmail.com>
 <CAMmSBy8CcG08-+-F6fvwmH1oEKpsV8OGEco94g04dZcyyFWKbw@mail.gmail.com>
 <b2e4ed0b178e41ebbc8f1db622ecae95@AMSPEX02CL03.citrite.net>
 <20190722114859.dtm4w5ff75uedu24@Air-de-Roger>
 <9238bf1a297c42f38dccc1cfb50bd144@AMSPEX02CL03.citrite.net>
 <20190722134813.c7fedaqtrbo6ojvo@Air-de-Roger>
In-Reply-To: <20190722134813.c7fedaqtrbo6ojvo@Air-de-Roger>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
MIME-Version: 1.0
Subject: Re: [Xen-devel] [BUG] After upgrade to Xen 4.12.0 iommu=no-igfx
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
Cc: "jgross@suse.com" <jgross@suse.com>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>,
 'Roman Shaposhnik' <roman@zededa.com>, "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQpbc25pcF0KPiA+ID4gZGlmZiAtLWdpdCBhL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9p
b21tdS5jCj4gPiA+IGluZGV4IDc5ZWM2NzE5ZjUuLjlkOTFmMGQ2MzMgMTAwNjQ0Cj4gPiA+IC0t
LSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMKPiA+ID4gKysrIGIveGVuL2RyaXZl
cnMvcGFzc3Rocm91Z2gvaW9tbXUuYwo+ID4gPiBAQCAtMTg1LDcgKzE4NSw3IEBAIHZvaWQgX19o
d2RvbV9pbml0IGlvbW11X2h3ZG9tX2luaXQoc3RydWN0IGRvbWFpbiAqZCkKPiA+ID4gICAgICBy
ZWdpc3Rlcl9rZXloYW5kbGVyKCdvJywgJmlvbW11X2R1bXBfcDJtX3RhYmxlLCAiZHVtcCBpb21t
dSBwMm0gdGFibGUiLCAwKTsKPiA+ID4KPiA+ID4gICAgICBoZC0+c3RhdHVzID0gSU9NTVVfU1RB
VFVTX2luaXRpYWxpemluZzsKPiA+ID4gLSAgICBoZC0+bmVlZF9zeW5jID0gaW9tbXVfaHdkb21f
c3RyaWN0ICYmICFpb21tdV91c2VfaGFwX3B0KGQpOwo+ID4gPiArICAgIGhkLT5uZWVkX3N5bmMg
PSAhaW9tbXVfdXNlX2hhcF9wdChkKTsKPiA+Cj4gPiBCdXQgdGhpcyBpcyBnb2luZyB0byBtZWFu
IHRoZSBpZigpIGJlbG93IGlzIHRydWUgZm9yIG5vbi1zdHJpY3QgZG9tMCwgd2hpY2ggbWVhbnMg
aXQgcG9pbnRsZXNzbHkKPiBtYXBzIHRoZSBkb20wIHBhZ2UgbGlzdCB3aGVuIGh3ZG9tX2lvbW11
X21hcCgpIHNob3VsZCBoYXZlIGFscmVhZHkgbWFwcGVkIGFsbCBjb252ZW50aW9uYWwgUkFNLgo+
IAo+IFJpZ2h0LCB0aGlzIGFsbCBzZWVtcyBxdWl0ZSBicm9rZW4uIE5vbi10cmFuc2xhdGVkIGd1
ZXN0cyAoaWU6IFBWKQo+IHdvdWxkIGFsd2F5cyBuZWVkIGlvbW11IHBhZ2UtdGFibGUgc3luYywg
YnV0IHNldF9pZGVudGl0eV9wMm1fZW50cnkKPiBjb250YWlucyB0aGUgZm9sbG93aW5nOgo+IAo+
IGlmICggIXBhZ2luZ19tb2RlX3RyYW5zbGF0ZShwMm0tPmRvbWFpbikgKQo+IHsKPiAgICAgaWYg
KCAhbmVlZF9pb21tdV9wdF9zeW5jKGQpICkKPiAgICAgICAgIHJldHVybiAwOwo+ICAgICByZXR1
cm4gaW9tbXVfbGVnYWN5X21hcChkLCBfZGZuKGdmbl9sKSwgX21mbihnZm5fbCksIFBBR0VfT1JE
RVJfNEssCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIElPTU1VRl9yZWFkYWJsZSB8IElP
TU1VRl93cml0YWJsZSk7Cj4gfQo+IAo+IEkgd29uZGVyIHdoZXRoZXIgdGhlIHVzYWdlIG9mIG5l
ZWRfaW9tbXVfcHRfc3luYyBpcyB3cm9uZyB0aGVyZSwgYW5kCj4gc2hvdWxkIGluc3RlYWQgYmUg
IWhhc19pb21tdV9wdChkKSwgc2luY2Ugbm9uLXRyYW5zbGF0ZWQgZG9tYWlucyB3b3VsZAo+IG5l
dmVyIHNoYXJlIHRoZSBpb21tdSBwYWdlLXRhYmxlcyBhbnl3YXkuCgpZb3Ugd2FudCBzeW5jaW5n
IGlmIHRoZSBkb21haW4gaGFzIElPTU1VIHBhZ2UgdGFibGVzIGFuZCBzaGFyZWQgRVBUIGlzIG5v
dCBpbiB1c2UsIHNvIHRoaXMgbG9naWMganVzdCBzZWVtcyB3cm9uZy4KCj4gCj4gSW4gYW55IGNh
c2UsIEkgdGhpbmsgbmVlZF9zeW5jIG11c3QgYmUgc2V0IHdoZW4gdGhlIGlvbW11IHBhZ2UgdGFi
bGVzCj4gYXJlIG5vdCBzaGFyZWQsIGFuZCBnYXRpbmcgaXQgb24gaW9tbXVfaHdkb21fc3RyaWN0
IHNlZW1zIHdyb25nIHRvIG1lLAo+IHRoZSBzdHJpY3RuZXNzIG9mIHRoZSBpb21tdSBkb2Vzbid0
IGFmZmVjdCB3aGV0aGVyIGEgc3luYyBpcyBuZWVkIG9yCj4gbm90LgoKSSB0aGluayBuZWVkX3N5
bmMgaXMgZ2F0ZWQgb24gc3RyaWN0IG1vZGUgYmVjYXVzZSwgaW4gJ3JlbGF4ZWQnIG1vZGUsIHRo
ZSBtYXBwaW5ncyB0aGF0IGFyZSBzZXQgdXAgd2hlbiBkb20wIGlzIHN0YXJ0ZWQgYXJlIHN1cHBv
c2VkIHRvIGJlIHN0YXRpYyAobW9kdWxvIGhvdHBsdWcgUkFNKS4uLiBzbyBtb2RpZmljYXRpb25z
IHRvIHRoZSBkb21haW4ncyBwYWdlIGxpc3QgYXJlIG5vdCBzdXBwb3NlZCB0byBoYXZlIGFueSBl
ZmZlY3QsIGFuZCBzbyBubyBzeW5jaHJvbml6YXRpb24gbmVlZCBiZSBkb25lLgoKPiAKPiBJJ3Zl
IHVwZGF0ZWQgdGhlIHBhdGNoIHRvIGF2b2lkIHRoZSBwb2ludGxlc3MgbWFwcGluZyBvZiBkb20w
IHBhZ2UKPiBsaXN0LCBidXQgSSBoYXZlbid0IGluY2x1ZGVkIHRoZSBjaGFuZ2UgdG8gc2V0X2lk
ZW50aXR5X3AybV9lbnRyeS4KPiAKClNvLCBJIHRoaW5rIHRoZSBhbGJlaXQgb2RkIGxvb2tpbmcg
bG9naWMgaW4gaW9tbXVfaHdkb21faW5pdCgpIHdhcyBhY3R1YWxseSBjb3JyZWN0LCBidXQgdGhl
IGNvZGUgaW4gc2V0X2lkZW50aXR5X3AybV9lbnRyeSgpIGlzIHdyb25nLgoKICBQYXVsCgo+IFRo
YW5rcywgUm9nZXIuCj4gLS0tODwtLS0KPiBkaWZmIC0tZ2l0IGEveGVuL2RyaXZlcnMvcGFzc3Ro
cm91Z2gvaW9tbXUuYyBiL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMKPiBpbmRleCA3
OWVjNjcxOWY1Li5hYmY5ZTM4NjA3IDEwMDY0NAo+IC0tLSBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJv
dWdoL2lvbW11LmMKPiArKysgYi94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCj4gQEAg
LTE4NSw4ICsxODUsOCBAQCB2b2lkIF9faHdkb21faW5pdCBpb21tdV9od2RvbV9pbml0KHN0cnVj
dCBkb21haW4gKmQpCj4gICAgICByZWdpc3Rlcl9rZXloYW5kbGVyKCdvJywgJmlvbW11X2R1bXBf
cDJtX3RhYmxlLCAiZHVtcCBpb21tdSBwMm0gdGFibGUiLCAwKTsKPiAKPiAgICAgIGhkLT5zdGF0
dXMgPSBJT01NVV9TVEFUVVNfaW5pdGlhbGl6aW5nOwo+IC0gICAgaGQtPm5lZWRfc3luYyA9IGlv
bW11X2h3ZG9tX3N0cmljdCAmJiAhaW9tbXVfdXNlX2hhcF9wdChkKTsKPiAtICAgIGlmICggbmVl
ZF9pb21tdV9wdF9zeW5jKGQpICkKPiArICAgIGhkLT5uZWVkX3N5bmMgPSAhaW9tbXVfdXNlX2hh
cF9wdChkKTsKPiArICAgIGlmICggaW9tbXVfaHdkb21fc3RyaWN0ICYmIG5lZWRfaW9tbXVfcHRf
c3luYyhkKSApCj4gICAgICB7Cj4gICAgICAgICAgc3RydWN0IHBhZ2VfaW5mbyAqcGFnZTsKPiAg
ICAgICAgICB1bnNpZ25lZCBpbnQgaSA9IDAsIGZsdXNoX2ZsYWdzID0gMDsKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBs
aXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2pl
Y3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
