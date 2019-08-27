Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9F29EC96
	for <lists+xen-devel@lfdr.de>; Tue, 27 Aug 2019 17:27:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i2dJq-00066g-Fi; Tue, 27 Aug 2019 15:23:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=72vU=WX=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i2dJo-00066b-PB
 for xen-devel@lists.xenproject.org; Tue, 27 Aug 2019 15:23:36 +0000
X-Inumbo-ID: a2d8277a-c8de-11e9-ac23-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a2d8277a-c8de-11e9-ac23-bc764e2007e4;
 Tue, 27 Aug 2019 15:23:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AF7D0AEBF;
 Tue, 27 Aug 2019 15:23:34 +0000 (UTC)
To: "Tian, Kevin" <kevin.tian@intel.com>,
 Roger Pau Monne <roger.pau@citrix.com>
References: <20190820153745.40103-1-roger.pau@citrix.com>
 <AADFC41AFE54684AB9EE6CBC0274A5D19D545BBD@SHSMSX104.ccr.corp.intel.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <824ee21b-d9d9-434b-2125-25420cadfcea@suse.com>
Date: Tue, 27 Aug 2019 17:23:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <AADFC41AFE54684AB9EE6CBC0274A5D19D545BBD@SHSMSX104.ccr.corp.intel.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH] p2m/ept: pass correct level to
 atomic_write_ept_entry in ept_invalidate_emt
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
Cc: Sergey Dyasli <sergey.dyasli@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <paul.durrant@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjMuMDguMjAxOSAwNzo1OCwgIFRpYW4sIEtldmluICB3cm90ZToKPj4gRnJvbTogUm9nZXIg
UGF1IE1vbm5lIFttYWlsdG86cm9nZXIucGF1QGNpdHJpeC5jb21dCj4+IFNlbnQ6IFR1ZXNkYXks
IEF1Z3VzdCAyMCwgMjAxOSAxMTozOCBQTQo+Pgo+PiBUaGUgbGV2ZWwgcGFzc2VkIHRvIGVwdF9p
bnZhbGlkYXRlX2VtdCBjb3JyZXNwb25kcyB0byB0aGUgRVBUIGVudHJ5Cj4+IHBhc3NlZCBhcyB0
aGUgbWZuIHBhcmFtZXRlciwgd2hpY2ggaXMgYSBwb2ludGVyIHRvIGFuIEVQVCBwYWdlIHRhYmxl
LAo+PiBoZW5jZSB0aGUgZW50cmllcyBpbiB0aGF0IHBhZ2UgdGFibGUgd2lsbCBoYXZlIG9uZSBs
ZXZlbCBsZXNzIHRoYW4gdGhlCj4+IHBhcmVudC4KPj4KPj4gRml4IHRoZSBjYWxsIHRvIGF0b21p
Y193cml0ZV9lcHRfZW50cnkgdG8gcGFzcyB0aGUgY29ycmVjdCBsZXZlbCwgaWU6Cj4+IG9uZSBs
ZXZlbCBsZXNzIHRoYW4gdGhlIHBhcmVudC4KPj4KPj4gRml4ZXM6IDUwZmU2ZTczNzA1ICgncHZo
IGRvbTA6IGFkZCBhbmQgcmVtb3ZlIGZvcmVpZ24gcGFnZXMnKQo+PiBTaWduZWQtb2ZmLWJ5OiBS
b2dlciBQYXUgTW9ubsOpIDxyb2dlci5wYXVAY2l0cml4LmNvbT4KPj4gLS0tCj4+IENjOiBKdW4g
TmFrYWppbWEgPGp1bi5uYWthamltYUBpbnRlbC5jb20+Cj4+IENjOiBLZXZpbiBUaWFuIDxrZXZp
bi50aWFuQGludGVsLmNvbT4KPj4gQ2M6IEdlb3JnZSBEdW5sYXAgPGdlb3JnZS5kdW5sYXBAZXUu
Y2l0cml4LmNvbT4KPj4gQ2M6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPj4gQ2M6
IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+Cj4+IENjOiBXZWkgTGl1
IDx3bEB4ZW4ub3JnPgo+PiBDYzogU2VyZ2V5IER5YXNsaSA8c2VyZ2V5LmR5YXNsaUBjaXRyaXgu
Y29tPgo+PiBDYzogUGF1bCBEdXJyYW50IDxwYXVsLmR1cnJhbnRAY2l0cml4LmNvbT4KPj4gLS0t
Cj4+ICAgeGVuL2FyY2gveDg2L21tL3AybS1lcHQuYyB8IDIgKy0KPj4gICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL3hlbi9h
cmNoL3g4Ni9tbS9wMm0tZXB0LmMgYi94ZW4vYXJjaC94ODYvbW0vcDJtLWVwdC5jCj4+IGluZGV4
IDZiODQ2OGM3OTMuLjIzYWU2ZTlkYTMgMTAwNjQ0Cj4+IC0tLSBhL3hlbi9hcmNoL3g4Ni9tbS9w
Mm0tZXB0LmMKPj4gKysrIGIveGVuL2FyY2gveDg2L21tL3AybS1lcHQuYwo+PiBAQCAtMzY3LDcg
KzM2Nyw3IEBAIHN0YXRpYyBib29sX3QgZXB0X2ludmFsaWRhdGVfZW10KHN0cnVjdCBwMm1fZG9t
YWluCj4+ICpwMm0sIG1mbl90IG1mbiwKPj4gICAgICAgICAgIGUuZW10ID0gTVRSUl9OVU1fVFlQ
RVM7Cj4+ICAgICAgICAgICBpZiAoIHJlY2FsYyApCj4+ICAgICAgICAgICAgICAgZS5yZWNhbGMg
PSAxOwo+PiAtICAgICAgICByYyA9IGF0b21pY193cml0ZV9lcHRfZW50cnkocDJtLCAmZXB0ZVtp
XSwgZSwgbGV2ZWwpOwo+PiArICAgICAgICByYyA9IGF0b21pY193cml0ZV9lcHRfZW50cnkocDJt
LCAmZXB0ZVtpXSwgZSwgbGV2ZWwgLSAxKTsKPj4gICAgICAgICAgIEFTU0VSVChyYyA9PSAwKTsK
Pj4gICAgICAgICAgIGNoYW5nZWQgPSAxOwo+PiAgICAgICB9Cj4gCj4gUmV2aWV3ZWQtYnk6IEtl
dmluIFRpYW4gPGtldmluLnRpYW5AaW50ZWwuY29tPi4KPiAKPiBPbmUgc21hbGwgY29tbWVudCBh
Ym91dCByZWFkYWJpbGl0eS4gV2hhdCBhYm91dCByZW5hbWluZyAnbGV2ZWwnCj4gdG8gJ3BhcmVu
dF9sZXZlbCcgaW4gdGhpcyBmdW5jdGlvbj8KCkFuZCBhbHNvIHRha2luZyB0aGUgb3Bwb3J0dW5p
dHkgYW5kIG1ha2luZyBpdCB1bnNpZ25lZCBpbnQ/CgpKYW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRl
dmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFp
bG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
