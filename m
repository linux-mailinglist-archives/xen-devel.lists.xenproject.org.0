Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D051B2B155
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2019 11:31:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVBvO-0002H1-0g; Mon, 27 May 2019 09:28:10 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=7auh=T3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hVBvM-0002Gt-MB
 for xen-devel@lists.xenproject.org; Mon, 27 May 2019 09:28:08 +0000
X-Inumbo-ID: bc08dab8-8061-11e9-8980-bc764e045a96
Received: from prv1-mh.provo.novell.com (unknown [137.65.248.33])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bc08dab8-8061-11e9-8980-bc764e045a96;
 Mon, 27 May 2019 09:28:07 +0000 (UTC)
Received: from INET-PRV1-MTA by prv1-mh.provo.novell.com
 with Novell_GroupWise; Mon, 27 May 2019 03:28:06 -0600
Message-Id: <5CEBADA20200007800232B72@prv1-mh.provo.novell.com>
X-Mailer: Novell GroupWise Internet Agent 18.1.1 
Date: Mon, 27 May 2019 03:28:02 -0600
From: "Jan Beulich" <JBeulich@suse.com>
To: "Andrew Cooper" <andrew.cooper3@citrix.com>
References: <5CA35DE90200007800223E5A@prv1-mh.provo.novell.com>
 <5CA35DE902000000001041B1@prv1-mh.provo.novell.com>
 <5CA35DE90200007800232A87@prv1-mh.provo.novell.com>
In-Reply-To: <5CA35DE90200007800232A87@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [Xen-devel] Ping: [PATCH] x86/IO-APIC: dump full destination ID in
 x2APIC mode
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
Cc: xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Pj4+IE9uIDAyLjA0LjE5IGF0IDE1OjA0LCAgd3JvdGU6Cj4gSW4geDJBUElDIG1vZGUgaXQgaXMg
MzIgYml0cyB3aWRlLgo+IAo+IEluIF9fcHJpbnRfSU9fQVBJQygpIGRyb3AgbG9nZ2luZyBvZiBi
b3RoIHBoeXNpY2FsIGFuZCBsb2dpY2FsIElEczoKPiBUaGUgbGF0dGVyIGNvdmVycyBhIHN1cGVy
c2V0IG9mIHRoZSBiaXRzIG9mIHRoZSBmb3JtZXIgaW4gdGhlIFJURSwgYW5kCj4gd2Ugd3JpdGUg
ZnVsbCA4LWJpdCB2YWx1ZXMgYW55d2F5IGV2ZW4gaW4gcGh5c2ljYWwgbW9kZSBmb3IgYWxsIG9y
ZGluYXJ5Cj4gaW50ZXJydXB0cywgcmVnYXJkbGVzcyBvZiBJTlRfREVTVF9NT0RFIChzZWUgdGhl
IHVzZXJzIG9mIFNFVF9ERVNUKCkpLgo+IAo+IEFkanVzdCBvdGhlciBjb2x1bW4gYXJyYW5nZW1l
bnQgKGFuZCBoZWFkaW5nKSBhIGxpdHRsZSBhcyB3ZWxsLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEph
biBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiAtLS0KPiBJJ20gc3VyZSBJIGhhZCBmb3Vu
ZCBzb21lIHBsYWNlIHdoZXJlIHRoZSB3aWRlciBkZXN0aW5hdGlvbiBJRCBpcwo+IGRvY3VtZW50
ZWQgZm9yIHBoeXNpY2FsIG1vZGUsIGJ1dCBJIHdhc24ndCBhYmxlIHRvIGZpbmQgaXQgYWdhaW4g
d2hlbiBJCj4gc2VhcmNoZWQgbm93LiBBbGwgSW50ZWwgY2hpcHNldCBkb2NzIEkndmUgbG9va2Vk
IGF0IGNsYWltIGl0J3Mgb25seSA0Cj4gYml0cyB0aGF0IGFyZSB1c2VkIC8gc3VwcG9zZWQgdG8g
YmUgc3RvcmVkLgo+IAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9pb19hcGljLmMKPiArKysgYi94ZW4v
YXJjaC94ODYvaW9fYXBpYy5jCj4gQEAgLTExOTEsMjEgKzExOTEsMjEgQEAgc3RhdGljIHZvaWQg
LypfX2luaXQqLyBfX3ByaW50X0lPX0FQSUMoYgo+ICAKPiAgCXByaW50ayhLRVJOX0RFQlVHICIu
Li4uIElSUSByZWRpcmVjdGlvbiB0YWJsZTpcbiIpOwo+ICAKPiAtCXByaW50ayhLRVJOX0RFQlVH
ICIgTlIgTG9nIFBoeSBNYXNrIFRyaWcgSVJSIFBvbCIKPiAtICAgICAgICAgICAgICAgIiBTdGF0
IERlc3QgRGVsaSBWZWN0OiAgIFxuIik7Cj4gKwlwcmludGsoS0VSTl9ERUJVRyAiIE5SICVzIE1z
ayBUcmcgSVJSIFBvbCBTdGF0IERzdE0gRGVsTSBWZWNcbiIsCj4gKyAgICAgICAgICAgICAgIHgy
YXBpY19lbmFibGVkID8gIiBEZXN0SUQiIDogIkRzdCIpOwo+ICAKPiAgCWZvciAoaSA9IDA7IGkg
PD0gcmVnXzAxLmJpdHMuZW50cmllczsgaSsrKSB7Cj4gICAgICAgICAgICAgIHN0cnVjdCBJT19B
UElDX3JvdXRlX2VudHJ5IGVudHJ5Owo+ICAKPiAgICAgICAgICAgICAgZW50cnkgPSBpb2FwaWNf
cmVhZF9lbnRyeShhcGljLCBpLCAwKTsKPiAgCj4gLSAgICAgICAgICAgIHByaW50ayhLRVJOX0RF
QlVHICIgJTAyeCAlMDNYICUwMlggICIsCj4gLSAgICAgICAgICAgICAgICAgICBpLAo+IC0gICAg
ICAgICAgICAgICAgICAgZW50cnkuZGVzdC5sb2dpY2FsLmxvZ2ljYWxfZGVzdCwKPiAtICAgICAg
ICAgICAgICAgICAgIGVudHJ5LmRlc3QucGh5c2ljYWwucGh5c2ljYWxfZGVzdAo+IC0JCSk7Cj4g
KyAgICAgICAgICAgIGlmICggeDJhcGljX2VuYWJsZWQgKQo+ICsgICAgICAgICAgICAgICAgcHJp
bnRrKEtFUk5fREVCVUcgIiAlMDJ4ICUwOHgiLCBpLCBlbnRyeS5kZXN0LmRlc3QzMik7Cj4gKyAg
ICAgICAgICAgIGVsc2UKPiArICAgICAgICAgICAgICAgIHByaW50ayhLRVJOX0RFQlVHICIgJTAy
eCAgJTAyeCAiLCBpLAo+ICsgICAgICAgICAgICAgICAgICAgICAgIGVudHJ5LmRlc3QubG9naWNh
bC5sb2dpY2FsX2Rlc3QpOwo+ICAKPiAtICAgICAgICAgICAgcHJpbnRrKCIlMWQgICAgJTFkICAg
ICUxZCAgICUxZCAgICUxZCAgICAlMWQgICAgJTFkICAgICUwMlhcbiIsCj4gKyAgICAgICAgICAg
IHByaW50aygiICVkICAgJWQgICAlZCAgICVkICAgJWQgICAgJWQgICAgJWQgICAgJTAyWFxuIiwK
PiAgICAgICAgICAgICAgICAgICAgIGVudHJ5Lm1hc2ssCj4gICAgICAgICAgICAgICAgICAgICBl
bnRyeS50cmlnZ2VyLAo+ICAgICAgICAgICAgICAgICAgICAgZW50cnkuaXJyLAo+IEBAIC0yNDgx
LDEyICsyNDgxLDE0IEBAIHZvaWQgZHVtcF9pb2FwaWNfaXJxX2luZm8odm9pZCkKPiAgICAgICAg
ICAgICAgcnRlID0gaW9hcGljX3JlYWRfZW50cnkoZW50cnktPmFwaWMsIHBpbiwgMCk7Cj4gIAo+
ICAgICAgICAgICAgICBwcmludGsoInZlYz0lMDJ4IGRlbGl2ZXJ5PSUtNXMgZGVzdD0lYyBzdGF0
dXM9JWQgIgo+IC0gICAgICAgICAgICAgICAgICAgInBvbGFyaXR5PSVkIGlycj0lZCB0cmlnPSVj
IG1hc2s9JWQgZGVzdF9pZDolZFxuIiwKPiArICAgICAgICAgICAgICAgICAgICJwb2xhcml0eT0l
ZCBpcnI9JWQgdHJpZz0lYyBtYXNrPSVkIGRlc3RfaWQ6JTAqeFxuIiwKPiAgICAgICAgICAgICAg
ICAgICAgIHJ0ZS52ZWN0b3IsIGRlbGl2ZXJ5X21vZGVfMl9zdHIocnRlLmRlbGl2ZXJ5X21vZGUp
LAo+ICAgICAgICAgICAgICAgICAgICAgcnRlLmRlc3RfbW9kZSA/ICdMJyA6ICdQJywKPiAgICAg
ICAgICAgICAgICAgICAgIHJ0ZS5kZWxpdmVyeV9zdGF0dXMsIHJ0ZS5wb2xhcml0eSwgcnRlLmly
ciwKPiAgICAgICAgICAgICAgICAgICAgIHJ0ZS50cmlnZ2VyID8gJ0wnIDogJ0UnLCBydGUubWFz
aywKPiAtICAgICAgICAgICAgICAgICAgIHJ0ZS5kZXN0LmxvZ2ljYWwubG9naWNhbF9kZXN0KTsK
PiArICAgICAgICAgICAgICAgICAgIHgyYXBpY19lbmFibGVkID8gOCA6IDIsCj4gKyAgICAgICAg
ICAgICAgICAgICB4MmFwaWNfZW5hYmxlZCA/IHJ0ZS5kZXN0LmRlc3QzMgo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgOiBydGUuZGVzdC5sb2dpY2FsLmxvZ2ljYWxfZGVzdCk7
Cj4gIAo+ICAgICAgICAgICAgICBpZiAoIGVudHJ5LT5uZXh0ID09IDAgKQo+ICAgICAgICAgICAg
ICAgICAgYnJlYWs7Cj4gCj4gCj4gCj4gCgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
