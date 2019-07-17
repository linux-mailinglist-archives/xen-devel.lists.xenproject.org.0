Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 143F46BDF7
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jul 2019 16:15:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hnkfp-0002Ig-34; Wed, 17 Jul 2019 14:12:49 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Q+i/=VO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hnkfn-0002Ib-4I
 for xen-devel@lists.xenproject.org; Wed, 17 Jul 2019 14:12:47 +0000
X-Inumbo-ID: f2f756ab-a89c-11e9-8980-bc764e045a96
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f2f756ab-a89c-11e9-8980-bc764e045a96;
 Wed, 17 Jul 2019 14:12:45 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa4.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa4.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa4.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: O5TPVBIxfYM64p7IYGwVF7Ej7ETxSMbIUJa1J75aNcmm0dI/IvWKV1tPmD7jPiaVyPDBUJc7Yo
 nWj3HKl0KSuwZqw6N7YVG0awdsCmYjh3ngFAWsO9pUw26r4Kc/dm14IB/QY990nFppmZIWmhF+
 EtzVHZ03g11ljPJQES+qaAwmB5TlI6aCaLBdUm6htS6TNbhg0oh2BTnUotutuAsVMpfvTeu2kd
 5BFbuAGniUPWYCRD9e1HndRxxQdo6I+EZHi3noUjCe6PXRtjaMO4/N71blR5ekWoCiRKrp2h/A
 3H0=
X-SBRS: 2.7
X-MesageID: 3174807
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,274,1559534400"; 
   d="scan'208";a="3174807"
Date: Wed, 17 Jul 2019 16:12:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190717141236.ehbkavyfxifuerna@Air-de-Roger.citrite.net>
References: <0dbf8520-89c7-753e-c10a-13399aec9cd5@suse.com>
 <7e5fba10-b957-81ed-a1d8-d4c7447f0d51@suse.com>
 <20190716142632.zallvho5vor4ug75@Air-de-Roger.citrite.net>
 <97f3e531-6c25-b8fa-c1b0-b68a183365f0@suse.com>
 <20190717102658.psnrdlrjpb5kvm4e@Air-de-Roger.citrite.net>
 <b53a0c6a-b24a-eea6-607d-18cc009dd8ee@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b53a0c6a-b24a-eea6-607d-18cc009dd8ee@suse.com>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
Subject: Re: [Xen-devel] [PATCH v2 3/5] x86/AMD: make C-state handling
 independent of Dom0
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
Cc: AndrewCooper <andrew.cooper3@citrix.com>, Brian Woods <brian.woods@amd.com>,
 Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gV2VkLCBKdWwgMTcsIDIwMTkgYXQgMTI6NDk6NDlQTSArMDAwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gT24gMTcuMDcuMjAxOSAxMjoyNiwgUm9nZXIgUGF1IE1vbm7DqSAgd3JvdGU6Cj4gPiBP
biBXZWQsIEp1bCAxNywgMjAxOSBhdCAwOTowNDo1NUFNICswMDAwLCBKYW4gQmV1bGljaCB3cm90
ZToKPiA+PiBPbiAxNi4wNy4yMDE5IDE2OjI2LCBSb2dlciBQYXUgTW9ubsOpICB3cm90ZToKPiA+
Pj4gT24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDE6MDE6NDhQTSArMDAwMCwgSmFuIEJldWxpY2gg
d3JvdGU6Cj4gPj4+PiAtLS0gYS94ZW4vYXJjaC94ODYvYWNwaS9jcHVfaWRsZS5jCj4gPj4+PiAr
KysgYi94ZW4vYXJjaC94ODYvYWNwaS9jcHVfaWRsZS5jCj4gPj4+PiBAQCAtMTEwLDYgKzExMCw4
IEBAIGJvb2xlYW5fcGFyYW0oImxhcGljX3RpbWVyX2MyX29rIiwgbG9jYWwKPiA+Pj4+ICAgICAK
PiA+Pj4+ICAgICBzdHJ1Y3QgYWNwaV9wcm9jZXNzb3JfcG93ZXIgKl9fcmVhZF9tb3N0bHkgcHJv
Y2Vzc29yX3Bvd2Vyc1tOUl9DUFVTXTsKPiA+Pj4+ICAgICAKPiA+Pj4+ICtzdGF0aWMgaW50OF90
IF9fcmVhZF9tb3N0bHkgdmVuZG9yX292ZXJyaWRlOwo+ID4+Pgo+ID4+PiBBRkFJQ1QgZnJvbSB0
aGUgY29kZSBiZWxvdyB0aGlzIGlzIGEgdHJpLXN0YXRlICgtMSwgMCwgMSkuIENvdWxkIGl0Cj4g
Pj4+IG1heWJlIGJlIHR1cm5lZCBpbnRvIGFuIGVudW0gd2l0aCBkZWZpbml0aW9ucyBvZiB0aGUg
ZGlmZmVyZW50Cj4gPj4+IHN0YXRlcz8KPiA+Pj4KPiA+Pj4gSSB0aGluayBpdCB3b3VsZCBtYWtl
IHRoZSB1c2FnZSBjbGVhcmVyLgo+ID4+Cj4gPj4gV2VsbCwgcGVyc29uYWxseSBJIHByZWZlciBk
b2luZyBpdCB0aGlzIHdheSBmb3IgdHJpc3RhdGVzLiBJJ2xsCj4gPj4gd2FpdCB0byBzZWUgd2hh
dCBvdGhlcnMgdGhpbmsuCj4gPiAKPiA+IEFjaywgSSB0aGluayB0aGUgY29kZSBpcyBjb3JyZWN0
IGhlbmNlOgo+ID4gCj4gPiBSZXZpZXdlZC1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1
QGNpdHJpeC5jb20+Cj4gCj4gVGhhbmtzLgo+IAo+ID4gQnV0IEkgcGVyc29uYWxseSB3b3VsZCBw
cmVmZXIgYW4gZW51bSBvciBhdCBsZWFzdCBhIGRlc2NyaXB0aW9uIG9mCj4gPiB0aGUgbWVhbmlu
ZyBvZiB0aGUgdmFsdWVzIHZlbmRvcl9vdmVycmlkZSBjYW4gdGFrZS4gSU1PIGl0IHdvdWxkIGhl
bHAKPiA+IHVuZGVyc3RhbmRpbmcgdGhlIGNvZGUsIHNpbmNlIGl0J3Mgbm90IG9idmlvdXMgdG8g
bWUgYXQgZmlyc3Qgc2lnaHQuCj4gCj4gSSd2ZSBhZGRlZAoKVGhhbmtzISBJJ20gaGFwcHkgd2l0
aCB0aGlzLgoKPiAvKgo+ICAgKiBUaGlzIGZpZWxkIHN0YXJ0cyBvdXQgYXMgemVybywgYW5kIGNh
biBiZSBzZXQgdG8gLTEganVzdCB0byBzaWduYWwgaXQgaGFzCj4gICAqIGJlZW4gc2V0IChhbmQg
dGhhdCB2ZW5kb3Igc3BlY2lmaWMgbG9naWMgaGFzIGZhaWxlZCwgYW5kIHNob3VsZG4ndCBiZQo+
ICAgKiB0cmllZCBhZ2FpbiksIG9yIHRvICsxIHRvIGlnbm9yZSBEb20wIHNpZGUgdXBsb2FkcyBv
ZiBDLXN0YXRlIEFDUEkgZGF0YS4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4gc2ln
bmFsIHZlbmRvciBzcGVjaWZpYyBzZXR1cCBoYXMKICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgc3VjY2VlZCBhbmQgZG9tMCBzaWRlIHVwbG9hZHMgb2YKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgQy1zdGF0ZSBBQ1BJIGRhdGEgc2hvdWxkIGJlIGlnbm9yZWQuCgpJIHRo
aW5rIGlzIGV2ZW4gY2xlYXJlciwgYnV0IG1pZ2h0IGJlIHRvIHZlcmJvc2U/IEFueXdheSwgSSBk
b24ndApoYXZlIGEgc3Ryb25nIG9waW5pb24sIGFuZCB5b3VyIHRleHQgaXMgY2VydGFpbmx5IGZp
bmUuCgpSb2dlci4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
