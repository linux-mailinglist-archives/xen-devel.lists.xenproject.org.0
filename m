Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E82C57A3F7
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 11:23:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsOK6-0006kK-ON; Tue, 30 Jul 2019 09:21:34 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6ea1=V3=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1hsOK5-0006kC-Bm
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 09:21:33 +0000
X-Inumbo-ID: 6b11777b-b2ab-11e9-8980-bc764e045a96
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6b11777b-b2ab-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 09:21:32 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa2.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83 ~all"
Received-SPF: None (esa2.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa2.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
IronPort-SDR: myYyR12f7R1o6dAudTNLqf5cu49C5r9eIXGmsTGcUEmSTX4G34596vEBTlSVRb1HayqwRf5OHf
 +E9PakEbZCFWE8+KTkkZkctvVHprln8uBn+QfWCSbS2tzj9GylxHtQbytH9EgiselFnhbrN6Dn
 eBt22xq/ugIKiGyN+3rItmhzPkcBZ8Wm27m28KNCPuDJX9ONTsWoyyEIFJh+zSbgm4W4vsxWrm
 4ywmj1IhVJXNUYN5h7Ry6Y1MhY9i1ThYsb4qvz9tLE9wFcOfh90NUK+eFw00udKu4CuQhiV96E
 Qsk=
X-SBRS: 2.7
X-MesageID: 3601504
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.64,326,1559534400"; 
   d="scan'208";a="3601504"
Date: Tue, 30 Jul 2019 11:21:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Roman Shaposhnik <roman@zededa.com>
Message-ID: <20190730092122.dbpfzu7jsznpyksd@Air-de-Roger>
References: <81a7cdc728294e5ca05fd056a87cb21b@AMSPEX02CL03.citrite.net>
 <20190722143953.tkcmv5bb72sdlkql@Air-de-Roger>
 <9f11fd0b6be14ea5a8efbb809df74cc9@AMSPEX02CL03.citrite.net>
 <20190722152152.dvhs4riw2w67rvih@Air-de-Roger>
 <CAMmSBy-P9+00XfK6k2OYqFHNONcxeGuu0V=Qk4peFDC=KOUogA@mail.gmail.com>
 <b5ba8315-ce59-85e6-5bfc-1db4c239eb1c@citrix.com>
 <CAMmSBy-S7nMg-V5DUzV2L2RmK0TnFt+9=C8gE=0FuUOQK3kjQQ@mail.gmail.com>
 <20190724141145.hg4aa5wyg5tsgv5p@Air-de-Roger>
 <CAMmSBy_XRLrxdM-U11pu4JinAKP3fi2TO=VCSo8g_BzMG3X0TA@mail.gmail.com>
 <20190726093545.zwmbt27c24skd3iz@Air-de-Roger>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190726093545.zwmbt27c24skd3iz@Air-de-Roger>
User-Agent: NeoMutt/20180716
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <Paul.Durrant@citrix.com>,
 "jbeulich@suse.com" <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "boris.ostrovsky@oracle.com" <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

UGluZz8KCkl0IHdvdWxkIGJlIHZlcnkgaGVscGZ1bCBmb3IgdXMgaW4gb3JkZXIgdG8gZ2V0IHRo
aXMgc29ydGVkIG91dCBpZiB5b3UKY291bGQgYW5zd2VyIHRoZSBxdWVzdGlvbnMgYmVsb3cgYW5k
IHRyeSB0aGUgbmV3IGRlYnVnIHBhdGNoIDopLgoKT24gRnJpLCBKdWwgMjYsIDIwMTkgYXQgMTE6
MzU6NDVBTSArMDIwMCwgUm9nZXIgUGF1IE1vbm7DqSB3cm90ZToKPiBPbiBUaHUsIEp1bCAyNSwg
MjAxOSBhdCAwNTo0NzoxOVBNIC0wNzAwLCBSb21hbiBTaGFwb3NobmlrIHdyb3RlOgo+ID4gSGkg
Um9nZXIhCj4gPiAKPiA+IFdpdGggeW91ciBwYXRjaCAoYW5kIGJ1aWxkIGFzIGEgZGVidWcgYnVp
bGQpIFhlbiBjcmFzaGVzIG9uIGJvb3QKPiA+ICh3aGljaCBJIGd1ZXNzIHdhcyB0aGUgcG9pbnQg
b2YgeW91ciBCVUdfT04gc3RhdGVtZW50KS4KPiAKPiBZZXMsIHRoYXQncyB2ZXJ5IHdlaXJkLCBz
ZWVtcyBsaWtlIGVudHJpZXMgYXJlIG5vdCBhZGRlZCB0byB0aGUgaW9tbXUKPiBwYWdlIHRhYmxl
cyBidXQgSSBoYXZlIG5vIGlkZWEgd2h5LCBBRkFJQ1QgdGhpcyB3b3JrcyBmaW5lIG9uIG15Cj4g
c3lzdGVtLgo+IAo+IERvIHlvdSBoYXZlIGFueSBwYXRjaGVzIG9uIHRvcCBvZiBSRUxFQVNFLTQu
MTIuMD8KPiAKPiBJIGhhdmUgYW5vdGhlciBwYXRjaCB3aXRoIG1vcmUgdmVyYm9zZSBvdXRwdXQs
IGNvdWxkIHlvdSBnaXZlIGl0IGEKPiB0cnk/IEl0J3MgbWF5YmUgZ29pbmcgdG8gYmUgbW9yZSBj
aGF0dHkgdGhhbiB0aGUgcHJldmlvdXMgb25lLgo+IAo+IEknbSBzb3JyeSB0byBrZWVwIHlvdSB0
ZXN0aW5nIHN0dWZmLCBidXQgc2luY2UgSSBjYW5ub3QgcmVwcm9kdWNlIHRoaXMKPiBsb2NhbGx5
IEkgaGF2ZSB0byByZWx5IG9uIHlvdSB0byBwcm92aWRlIHRoZSBkZWJ1ZyBvdXRwdXQuCj4gCj4g
VGhhbmtzLCBSb2dlci4KPiAtLS04PC0tLQo+IGRpZmYgLS1naXQgYS94ZW4vYXJjaC94ODYvbW0v
cDJtLmMgYi94ZW4vYXJjaC94ODYvbW0vcDJtLmMKPiBpbmRleCBiOWJiYjhmNDg1Li43NWY4MzU5
YTk5IDEwMDY0NAo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9wMm0uYwo+ICsrKyBiL3hlbi9hcmNo
L3g4Ni9tbS9wMm0uYwo+IEBAIC0xMzMxLDcgKzEzMzEsNyBAQCBpbnQgc2V0X2lkZW50aXR5X3Ay
bV9lbnRyeShzdHJ1Y3QgZG9tYWluICpkLCB1bnNpZ25lZCBsb25nIGdmbl9sLAo+ICAKPiAgICAg
IGlmICggIXBhZ2luZ19tb2RlX3RyYW5zbGF0ZShwMm0tPmRvbWFpbikgKQo+ICAgICAgewo+IC0g
ICAgICAgIGlmICggIW5lZWRfaW9tbXVfcHRfc3luYyhkKSApCj4gKyAgICAgICAgaWYgKCAhaGFz
X2lvbW11X3B0KGQpICkKPiAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gICAgICAgICAgcmV0dXJu
IGlvbW11X2xlZ2FjeV9tYXAoZCwgX2RmbihnZm5fbCksIF9tZm4oZ2ZuX2wpLCBQQUdFX09SREVS
XzRLLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIElPTU1VRl9yZWFkYWJsZSB8
IElPTU1VRl93cml0YWJsZSk7Cj4gQEAgLTE0MjIsNyArMTQyMiw3IEBAIGludCBjbGVhcl9pZGVu
dGl0eV9wMm1fZW50cnkoc3RydWN0IGRvbWFpbiAqZCwgdW5zaWduZWQgbG9uZyBnZm5fbCkKPiAg
Cj4gICAgICBpZiAoICFwYWdpbmdfbW9kZV90cmFuc2xhdGUoZCkgKQo+ICAgICAgewo+IC0gICAg
ICAgIGlmICggIW5lZWRfaW9tbXVfcHRfc3luYyhkKSApCj4gKyAgICAgICAgaWYgKCAhaGFzX2lv
bW11X3B0KGQpICkKPiAgICAgICAgICAgICAgcmV0dXJuIDA7Cj4gICAgICAgICAgcmV0dXJuIGlv
bW11X2xlZ2FjeV91bm1hcChkLCBfZGZuKGdmbl9sKSwgUEFHRV9PUkRFUl80Syk7Cj4gICAgICB9
Cj4gZGlmZiAtLWdpdCBhL3hlbi9kcml2ZXJzL3Bhc3N0aHJvdWdoL2lvbW11LmMgYi94ZW4vZHJp
dmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCj4gaW5kZXggMTE3Yjg2OWIwYy4uMjE0YzVkNTE1ZiAx
MDA2NDQKPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC9pb21tdS5jCj4gKysrIGIveGVu
L2RyaXZlcnMvcGFzc3Rocm91Z2gvaW9tbXUuYwo+IEBAIC0yOTEsOCArMjkxLDE4IEBAIGludCBp
b21tdV9tYXAoc3RydWN0IGRvbWFpbiAqZCwgZGZuX3QgZGZuLCBtZm5fdCBtZm4sCj4gICAgICB1
bnNpZ25lZCBsb25nIGk7Cj4gICAgICBpbnQgcmMgPSAwOwo+ICAKPiAraWYgKGRmbl94KGRmbikg
Pj0gMHg4ZDgwMCAmJiBkZm5feChkZm4pIDwgMHg5MDAwMCApCj4gK3sKPiArICAgIHByaW50aygi
PFJNUlI+IGlvbW11X21hcCAlI2x4XG4iLCBkZm5feChkZm4pKTsKPiArICAgIHByb2Nlc3NfcGVu
ZGluZ19zb2Z0aXJxcygpOwo+ICt9Cj4gKwo+ICAgICAgaWYgKCAhaW9tbXVfZW5hYmxlZCB8fCAh
aGQtPnBsYXRmb3JtX29wcyApCj4gK3sKPiArICAgIHByaW50aygiaW9tbXVfZW5hYmxlZDogJWQg
cGxhdGZvcm1fb3BzICVwXG4iLAo+ICsgICAgICAgICAgIGlvbW11X2VuYWJsZWQsIGhkLT5wbGF0
Zm9ybV9vcHMpOwo+ICAgICAgICAgIHJldHVybiAwOwo+ICt9Cj4gIAo+ICAgICAgQVNTRVJUKElT
X0FMSUdORUQoZGZuX3goZGZuKSwgKDF1bCA8PCBwYWdlX29yZGVyKSkpOwo+ICAgICAgQVNTRVJU
KElTX0FMSUdORUQobWZuX3gobWZuKSwgKDF1bCA8PCBwYWdlX29yZGVyKSkpOwo+IGRpZmYgLS1n
aXQgYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYyBiL3hlbi9kcml2ZXJzL3Bh
c3N0aHJvdWdoL3Z0ZC9pb21tdS5jCj4gaW5kZXggNTBhMGUyNTIyNC4uOGMzZmNiNTBhZSAxMDA2
NDQKPiAtLS0gYS94ZW4vZHJpdmVycy9wYXNzdGhyb3VnaC92dGQvaW9tbXUuYwo+ICsrKyBiL3hl
bi9kcml2ZXJzL3Bhc3N0aHJvdWdoL3Z0ZC9pb21tdS5jCj4gQEAgLTIwMDksMTIgKzIwMDksMzMg
QEAgc3RhdGljIGludCBybXJyX2lkZW50aXR5X21hcHBpbmcoc3RydWN0IGRvbWFpbiAqZCwgYm9v
bF90IG1hcCwKPiAgICAgIGlmICggIW1hcCApCj4gICAgICAgICAgcmV0dXJuIC1FTk9FTlQ7Cj4g
IAo+ICtwcmludGsoIjxSTVJSPiBtYXBwaW5nICUjbHggLSAlI2x4XG4iLCBiYXNlX3BmbiwgZW5k
X3Bmbik7Cj4gICAgICB3aGlsZSAoIGJhc2VfcGZuIDwgZW5kX3BmbiApCj4gICAgICB7Cj4gICAg
ICAgICAgaW50IGVyciA9IHNldF9pZGVudGl0eV9wMm1fZW50cnkoZCwgYmFzZV9wZm4sIHAybV9h
Y2Nlc3NfcncsIGZsYWcpOwo+ICsgICAgICAgIG1mbl90IG1mbjsKPiArICAgICAgICB1bnNpZ25l
ZCBpbnQgZjsKPiAgCj4gICAgICAgICAgaWYgKCBlcnIgKQo+ICAgICAgICAgICAgICByZXR1cm4g
ZXJyOwo+ICsKPiArZXJyID0gaW50ZWxfaW9tbXVfbG9va3VwX3BhZ2UoZCwgX2RmbihiYXNlX3Bm
biksICZtZm4sICZmKTsKPiAraWYgKCBlcnIgKQo+ICt7Cj4gKyAgICBwcmludGsoImludGVsX2lv
bW11X2xvb2t1cF9wYWdlIGVycjogJWRcbiIsIGVycik7Cj4gKyAgICBCVUcoKTsKPiArfQo+ICtp
ZiAoIGJhc2VfcGZuICE9IG1mbl94KG1mbikgKQo+ICt7Cj4gKyAgICBwcmludGsoImJhc2VfcGZu
OiAlI2x4IG1mbjogJSNseFxuIiwgYmFzZV9wZm4sIG1mbl94KG1mbikpOwo+ICsgICAgQlVHKCk7
Cj4gK30KPiAraWYgKCBmICE9IChJT01NVUZfcmVhZGFibGUgfCBJT01NVUZfd3JpdGFibGUpICkK
PiArewo+ICsgICAgcHJpbnRrKCJmbGFnczogJSN4XG4iLCBmKTsKPiArICAgIEJVRygpOwo+ICt9
Cj4gKwo+ICAgICAgICAgIGJhc2VfcGZuKys7Cj4gICAgICB9Cj4gIAo+IEBAIC0yMjYzLDYgKzIy
ODQsNyBAQCBzdGF0aWMgdm9pZCBfX2h3ZG9tX2luaXQgc2V0dXBfaHdkb21fcm1ycihzdHJ1Y3Qg
ZG9tYWluICpkKQo+ICAgICAgdTE2IGJkZjsKPiAgICAgIGludCByZXQsIGk7Cj4gIAo+ICtwcmlu
dGsoIjxSTVJSPiBzZXR0aW5nIHVwIHJlZ2lvbnNcbiIpOwo+ICAgICAgcGNpZGV2c19sb2NrKCk7
Cj4gICAgICBmb3JfZWFjaF9ybXJyX2RldmljZSAoIHJtcnIsIGJkZiwgaSApCj4gICAgICB7Cj4g
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Cj4gWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCj4gaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1h
aWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54
ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
