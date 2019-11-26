Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1DB10A279
	for <lists+xen-devel@lfdr.de>; Tue, 26 Nov 2019 17:53:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZe2o-0008JH-UG; Tue, 26 Nov 2019 16:50:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=EMZS=ZS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1iZe2n-0008JC-KE
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2019 16:50:29 +0000
X-Inumbo-ID: d8f1938e-106c-11ea-9db0-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d8f1938e-106c-11ea-9db0-bc764e2007e4;
 Tue, 26 Nov 2019 16:50:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 91A46AEF8;
 Tue, 26 Nov 2019 16:50:26 +0000 (UTC)
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20191126132648.6917-1-roger.pau@citrix.com>
 <20191126132648.6917-3-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a6193850-7f1c-64c9-46b9-2319701e914b@suse.com>
Date: Tue, 26 Nov 2019 17:50:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191126132648.6917-3-roger.pau@citrix.com>
Content-Language: en-US
Subject: Re: [Xen-devel] [PATCH for-4.13 v3 2/2] x86/vmx: always sync PIR to
 IRR before vmentry
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
Cc: Juergen Gross <jgross@suse.com>, Kevin Tian <kevin.tian@intel.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Joe Jin <joe.jin@oracle.com>, Jun Nakajima <jun.nakajima@intel.com>,
 xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

T24gMjYuMTEuMjAxOSAxNDoyNiwgUm9nZXIgUGF1IE1vbm5lIHdyb3RlOgo+IC0tLSBhL3hlbi9h
cmNoL3g4Ni9odm0vaXJxLmMKPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL2lycS5jCj4gQEAgLTUx
NSw3ICs1MTUsMTEgQEAgdm9pZCBodm1fc2V0X2NhbGxiYWNrX3ZpYShzdHJ1Y3QgZG9tYWluICpk
LCB1aW50NjRfdCB2aWEpCj4gIHN0cnVjdCBodm1faW50YWNrIGh2bV92Y3B1X2hhc19wZW5kaW5n
X2lycShzdHJ1Y3QgdmNwdSAqdikKPiAgewo+ICAgICAgc3RydWN0IGh2bV9kb21haW4gKnBsYXQg
PSAmdi0+ZG9tYWluLT5hcmNoLmh2bTsKPiAtICAgIGludCB2ZWN0b3I7Cj4gKyAgICAvKgo+ICsg
ICAgICogQWx3YXlzIGNhbGwgdmxhcGljX2hhc19wZW5kaW5nX2lycSBzbyB0aGF0IFBJUiBpcyBz
eW5jZWQgaW50byBJUlIgd2hlbgo+ICsgICAgICogdXNpbmcgcG9zdGVkIGludGVycnVwdHMuCj4g
KyAgICAgKi8KPiArICAgIGludCB2ZWN0b3IgPSB2bGFwaWNfaGFzX3BlbmRpbmdfaXJxKHYpOwoK
RGlkIHlvdSBjb25zaWRlciBkb2luZyB0aGlzIGNvbmRpdGlvbmFsbHkgZWl0aGVyIGhlcmUgLi4u
Cgo+IEBAIC01MzAsNyArNTM0LDYgQEAgc3RydWN0IGh2bV9pbnRhY2sgaHZtX3ZjcHVfaGFzX3Bl
bmRpbmdfaXJxKHN0cnVjdCB2Y3B1ICp2KQo+ICAgICAgaWYgKCB2bGFwaWNfYWNjZXB0X3BpY19p
bnRyKHYpICYmIHBsYXQtPnZwaWNbMF0uaW50X291dHB1dCApCj4gICAgICAgICAgcmV0dXJuIGh2
bV9pbnRhY2tfcGljKDApOwo+ICAKPiAtICAgIHZlY3RvciA9IHZsYXBpY19oYXNfcGVuZGluZ19p
cnEodik7Cj4gICAgICBpZiAoIHZlY3RvciAhPSAtMSApCj4gICAgICAgICAgcmV0dXJuIGh2bV9p
bnRhY2tfbGFwaWModmVjdG9yKTsKCi4uLiBvciBoZXJlPyBJIGFzayBub3Qgb25seSBiZWNhdXNl
IHRoZSBmdW5jdGlvbiBpc24ndCBleGFjdGx5CmNoZWFwIHRvIGNhbGwgKGFzIGlpcmMgeW91IGRp
ZCBhbHNvIG1lbnRpb24gZHVyaW5nIHRoZSB2MgpkaXNjdXNzaW9uKSwgYnV0IGFsc28gYmVjYXVz
ZSBvZiBpdHMgaW50ZXJhY3Rpb24gd2l0aCBWaXJpZGlhbgphbmQgbmVzdGVkIG1vZGUuIEluIGNh
c2Ugb2YgcHJvYmxlbXMgdGhlcmUsIGF2b2lkaW5nIHRoZSB1c2UKb2YgaW50ZXJydXB0IHBvc3Rp
bmcgd291bGQgYmUgYSB3b3JrYXJvdW5kIGluIHN1Y2ggY2FzZXMgdGhlbi4KCj4gLS0tIGEveGVu
L2FyY2gveDg2L2h2bS92bXgvdm14LmMKPiArKysgYi94ZW4vYXJjaC94ODYvaHZtL3ZteC92bXgu
Ywo+IEBAIC0xOTQ1LDU3ICsxOTQ1LDMxIEBAIHN0YXRpYyB2b2lkIHZteF9wcm9jZXNzX2lzcihp
bnQgaXNyLCBzdHJ1Y3QgdmNwdSAqdikKPiAgCj4gIHN0YXRpYyB2b2lkIF9fdm14X2RlbGl2ZXJf
cG9zdGVkX2ludGVycnVwdChzdHJ1Y3QgdmNwdSAqdikKPiAgewo+IC0gICAgYm9vbF90IHJ1bm5p
bmcgPSB2LT5pc19ydW5uaW5nOwo+IC0KPiAgICAgIHZjcHVfdW5ibG9jayh2KTsKPiAtICAgIC8q
Cj4gLSAgICAgKiBKdXN0IGxpa2UgdmNwdV9raWNrKCksIG5vdGhpbmcgaXMgbmVlZGVkIGZvciB0
aGUgZm9sbG93aW5nIHR3byBjYXNlczoKPiAtICAgICAqIDEuIFRoZSB0YXJnZXQgdkNQVSBpcyBu
b3QgcnVubmluZywgbWVhbmluZyBpdCBpcyBibG9ja2VkIG9yIHJ1bm5hYmxlLgo+IC0gICAgICog
Mi4gVGhlIHRhcmdldCB2Q1BVIGlzIHRoZSBjdXJyZW50IHZDUFUgYW5kIHdlJ3JlIGluIG5vbi1p
bnRlcnJ1cHQKPiAtICAgICAqIGNvbnRleHQuCj4gLSAgICAgKi8KPiAtICAgIGlmICggcnVubmlu
ZyAmJiAoaW5faXJxKCkgfHwgKHYgIT0gY3VycmVudCkpICkKPiAtICAgIHsKPiArICAgIGlmICgg
di0+aXNfcnVubmluZyAmJiB2ICE9IGN1cnJlbnQgKQoKSSBjb250aW51ZSB0byBiZSBjb25jZXJu
ZWQgYnkgdGhpcyBldmFsdWF0aW9uIG9mIC0+aXNfcnVubmluZwpfYWZ0ZXJfIHZjcHVfdW5ibG9j
aygpLCB3aGVuIHByZXZpb3VzbHkgKGp1c3QgbGlrZSB2Y3B1X2tpY2soKQpkb2VzKSBpdCB3YXMg
aW50ZW50aW9uYWxseSBkb25lIGJlZm9yZS4gSSB3b25kZXIgYW55d2F5CndoZXRoZXIgdGhpcyBh
bmQgdGhlIGNoYW5nZSB0byBpcnEuYyBzaG91bGQgcmVhbGx5IGJlIGluIGEKc2luZ2xlIHBhdGNo
LCB0aGUgbW9yZSB0aGF0IHlvdSBzdGFydCB0aGUgcmVzcGVjdGl2ZSBwYXJ0IG9mCnRoZSBkZXNj
cmlwdGlvbiB3aXRoICJXaGlsZSB0aGVyZSBhbHNvIHNpbXBsaWZ5IC4uLiIuIEJ1dCBpbgp0aGUg
ZW5kIGl0IGlzIHVwIHRvIEtldmluJ3Mgb3IgSnVuJ3MganVkZ2VtZW50IGFueXdheS4KCkphbgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
