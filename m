Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE38A1F81
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2019 17:44:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i3MXq-0000AS-NH; Thu, 29 Aug 2019 15:41:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=C/xl=WZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1i3MXo-0000AN-Uw
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2019 15:41:04 +0000
X-Inumbo-ID: 681916a8-ca73-11e9-8980-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 681916a8-ca73-11e9-8980-bc764e2007e4;
 Thu, 29 Aug 2019 15:41:03 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 07BA5ADFB;
 Thu, 29 Aug 2019 15:41:02 +0000 (UTC)
To: Julien Grall <julien.grall@arm.com>
References: <20190819142651.11058-1-julien.grall@arm.com>
 <20190819142651.11058-2-julien.grall@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b6a7932f-69c3-334b-52d9-efbeb441156b@suse.com>
Date: Thu, 29 Aug 2019 17:41:02 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190819142651.11058-2-julien.grall@arm.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH v4 1/2] xen: Switch parameter in
 get_page_from_gfn to use typesafe gfn
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Paul Durrant <paul.durrant@citrix.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMTkuMDguMjAxOSAxNjoyNiwgSnVsaWVuIEdyYWxsIHdyb3RlOgo+IE5vIGZ1bmN0aW9uYWwg
Y2hhbmdlIGludGVuZGVkLgo+IAo+IE9ubHkgcmVhc29uYWJsZSBjbGVhbi11cHMgYXJlIGRvbmUg
aW4gdGhpcyBwYXRjaC4gVGhlIHJlc3Qgd2lsbCB1c2UgX2dmbgo+IGZvciB0aGUgdGltZSBiZWlu
Zy4KPiAKPiBUaGUgY29kZSBpbiBnZXRfcGFnZV9mcm9tX2dmbiBpcyBzbGlnaHRseSByZXdvcmtl
ZCB0byBhbHNvIGhhbmRsZSBhIGJhZAo+IGJlaGF2aW9yIGJlY2F1c2UgaXQgaXMgbm90IHNhZmUg
dG8gdXNlIG1mbl90b19wYWdlKC4uLikgYmVjYXVzZQo+IG1mbl92YWxpZCguLi4pIHN1Y2NlZWRz
LgoKSSBndWVzcyB0aGUgMm5kICJiZWNhdXNlIiBpcyBtZWFudCB0byBiZSAiYmVmb3JlIiwgYnV0
IGV2ZW4gdGhlbiBJCmRvbid0IHRoaW5rIEkgY2FuIGVhc2lseSBhZ3JlZTogbWZuX3RvX3BhZ2Uo
KSBpcyBqdXN0IGNhbGN1bGF0aW9ucywKbm8gZGVyZWZlcmVuY2UuCgo+IC0tLSBhL3hlbi9hcmNo
L3g4Ni9odm0vZG9tYWluLmMKPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2RvbWFpbi5jCj4gQEAg
LTI5Niw4ICsyOTYsMTAgQEAgaW50IGFyY2hfc2V0X2luZm9faHZtX2d1ZXN0KHN0cnVjdCB2Y3B1
ICp2LCBjb25zdCB2Y3B1X2h2bV9jb250ZXh0X3QgKmN0eCkKPiAgICAgIGlmICggaHZtX3BhZ2lu
Z19lbmFibGVkKHYpICYmICFwYWdpbmdfbW9kZV9oYXAodi0+ZG9tYWluKSApCj4gICAgICB7Cj4g
ICAgICAgICAgLyogU2hhZG93LW1vZGUgQ1IzIGNoYW5nZS4gQ2hlY2sgUERCUiBhbmQgdXBkYXRl
IHJlZmNvdW50cy4gKi8KPiAtICAgICAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwYWdlID0gZ2V0X3Bh
Z2VfZnJvbV9nZm4odi0+ZG9tYWluLAo+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB2LT5hcmNoLmh2bS5ndWVzdF9jclszXSA+PiBQQUdFX1NISUZULAo+ICsgICAgICAgIHN0cnVj
dCBwYWdlX2luZm8gKnBhZ2U7Cj4gKwo+ICsgICAgICAgIHBhZ2UgPSBnZXRfcGFnZV9mcm9tX2dm
bih2LT5kb21haW4sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdhZGRyX3Rv
X2dmbih2LT5hcmNoLmh2bS5ndWVzdF9jclszXSksCj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIE5VTEwsIFAyTV9BTExPQyk7CgpJaXJjIEkndmUgc2FpZCBzbyBiZWZvcmU6IEkg
Y29uc2lkZXIgdXNlIG9mIGdhZGRyX3RvX2dmbigpIGhlcmUgbW9yZQptaXNsZWFkaW5nIHRoYW4g
YSBwbGFpbiBzaGlmdCBieSBQQUdFX1NISUZULiBOZWl0aGVyIGlzIHJlYWxseSBjb3JyZWN0LApi
dXQgaW4gbm8gZXZlbnQgZG9lcyBDUjMgYXMgYSB3aG9sZSBob2xkIGFuIGFkZHJlc3MuIChTYW1l
IGVsc2V3aGVyZQp0aGVuLCBhbmQgc2FkbHkgaW4gcXVpdGUgYSBmZXcgcGxhY2VzLikKCj4gLS0t
IGEveGVuL2NvbW1vbi9ldmVudF9maWZvLmMKPiArKysgYi94ZW4vY29tbW9uL2V2ZW50X2ZpZm8u
Ywo+IEBAIC0zNjEsNyArMzYxLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBldnRjaG5fcG9ydF9v
cHMgZXZ0Y2huX3BvcnRfb3BzX2ZpZm8gPQo+ICAgICAgLnByaW50X3N0YXRlICAgPSBldnRjaG5f
Zmlmb19wcmludF9zdGF0ZSwKPiAgfTsKPiAgCj4gLXN0YXRpYyBpbnQgbWFwX2d1ZXN0X3BhZ2Uo
c3RydWN0IGRvbWFpbiAqZCwgdWludDY0X3QgZ2ZuLCB2b2lkICoqdmlydCkKPiArc3RhdGljIGlu
dCBtYXBfZ3Vlc3RfcGFnZShzdHJ1Y3QgZG9tYWluICpkLCBnZm5fdCBnZm4sIHZvaWQgKip2aXJ0
KQo+ICB7Cj4gICAgICBzdHJ1Y3QgcGFnZV9pbmZvICpwOwo+ICAKPiBAQCAtNDIyLDcgKzQyMiw3
IEBAIHN0YXRpYyBpbnQgc2V0dXBfY29udHJvbF9ibG9jayhzdHJ1Y3QgdmNwdSAqdikKPiAgICAg
IHJldHVybiAwOwo+ICB9Cj4gIAo+IC1zdGF0aWMgaW50IG1hcF9jb250cm9sX2Jsb2NrKHN0cnVj
dCB2Y3B1ICp2LCB1aW50NjRfdCBnZm4sIHVpbnQzMl90IG9mZnNldCkKPiArc3RhdGljIGludCBt
YXBfY29udHJvbF9ibG9jayhzdHJ1Y3QgdmNwdSAqdiwgZ2ZuX3QgZ2ZuLCB1aW50MzJfdCBvZmZz
ZXQpCj4gIHsKPiAgICAgIHZvaWQgKnZpcnQ7Cj4gICAgICB1bnNpZ25lZCBpbnQgaTsKCkp1c3Qg
YXMgYSByZW1hcmsgKG5vIGFjdGlvbiBleHBlY3RlZCkgLSB0aGlzIG1ha2VzIGEgdHJ1bmNhdGlv
biBpc3N1ZQpwcmV0dHkgYXBwYXJlbnQ6IE9uIDMyLWJpdCBwbGF0Zm9ybXMgdGhlIHVwcGVyIDMy
IGJpdHMgb2YgYSBwYXNzZWQgaW4KR0ZOIGdldCBpZ25vcmVkLiBDb3JyZWN0IChpbW8pIGJlaGF2
aW9yIHdvdWxkIGJlIHRvIHJlamVjdCB0aGUgdXBwZXIKYml0cyBiZWluZyBub24temVyby4KCkph
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
